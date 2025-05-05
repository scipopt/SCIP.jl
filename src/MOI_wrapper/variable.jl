# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    vr = add_variable(o.inner)
    var::Ptr{SCIP_VAR} = o.inner.vars[vr][]
    register!(o, var, vr)
    return MOI.VariableIndex(vr.val)
end

MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.inner.vars)

function MOI.get(o::Optimizer, ::MOI.ListOfVariableIndices)
    return sort!(
        [MOI.VariableIndex(k.val) for k in keys(o.inner.vars)];
        by=v -> v.value,
    )
end

function MOI.is_valid(o::Optimizer, vi::MOI.VariableIndex)
    return haskey(o.inner.vars, VarRef(vi.value))
end

function MOI.is_valid(
    o::Optimizer,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,S},
) where {S<:Union{<:BOUNDS,MOI.ZeroOne,MOI.Integer}}
    if !haskey(o.inner.vars, VarRef(ci.value))
        return false
    end
    cons_set = get(o.constypes, (MOI.VariableIndex, S), nothing)
    if cons_set === nothing
        return false
    end
    return ConsRef(ci.value) in cons_set
end

function MOI.get(
    model::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{MOI.VariableIndex},
)
    MOI.throw_if_not_valid(model, ci)
    return MOI.VariableIndex(ci.value)
end

# MOI.VariableName

MOI.supports(::Optimizer, ::MOI.VariableName, ::Type{MOI.VariableIndex}) = true

function MOI.get(
    o::Optimizer,
    ::MOI.VariableName,
    vi::MOI.VariableIndex,
)::String
    return GC.@preserve o unsafe_string(SCIPvarGetName(var(o, vi)))
end

function MOI.set(
    o::Optimizer,
    ::MOI.VariableName,
    vi::MOI.VariableIndex,
    name::String,
)
    @SCIP_CALL SCIPchgVarName(o, var(o, vi), name)
    return nothing
end

# FIXME(odow): This function is broken for dealing with duplicate variable names
function MOI.get(o::Optimizer, ::Type{MOI.VariableIndex}, name::String)
    ptr = SCIPfindVar(o, name)
    if ptr == C_NULL
        return nothing
    end
    var_ref = get(o.reference, ptr, nothing)
    if var_ref === nothing
        return var_ref
    end
    return MOI.VariableIndex(var_ref.val)
end

# MOI.delete

function MOI.delete(o::Optimizer, vi::MOI.VariableIndex)
    # Note: SCIP does not currently support deletion of variables that are still
    # present in some constraint. We don't want the overhead of keeping track of
    # the variable-in-constraint relation, so, to be conservative, we only allow
    # to delete a variable when there are no constraints in the model.
    if length(o.inner.conss) > 0
        msg = "Can not delete variable while model contains constraints!"
        throw(MOI.DeleteNotAllowed(vi, msg))
    end
    allow_modification(o)
    if !haskey(o.inner.vars, VarRef(vi.value))
        throw(MOI.InvalidIndex(vi))
    end
    delete!(o.binbounds, vi)
    delete!(o.reference, var(o, vi))
    delete(o.inner, VarRef(vi.value))
    return nothing
end

## MOI.VariableIndex -in- MOI.Integer

function MOI.supports_constraint(
    ::Optimizer,
    ::Type{MOI.VariableIndex},
    ::Type{MOI.Integer},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    vi::MOI.VariableIndex,
    ::MOI.Integer,
)
    allow_modification(o)
    p_infeas = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, var(o, vi), SCIP_VARTYPE_INTEGER, p_infeas)
    ci = MOI.ConstraintIndex{MOI.VariableIndex,MOI.Integer}(vi.value)
    return register!(o, ci)
end

function MOI.delete(
    o::Optimizer,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,MOI.Integer},
)
    _throw_if_invalid(o, ci)
    allow_modification(o)
    v = var(o, MOI.VariableIndex(ci.value))
    p_infeas = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, v, SCIP_VARTYPE_CONTINUOUS, p_infeas)
    delete!(o.constypes[MOI.VariableIndex, MOI.Integer], ConsRef(ci.value))
    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,MOI.Integer},
)
    MOI.throw_if_not_valid(o, ci)
    return MOI.Integer()
end

## MOI.VariableIndex -in- MOI.ZeroOne

function MOI.supports_constraint(
    o::Optimizer,
    ::Type{MOI.VariableIndex},
    ::Type{MOI.ZeroOne},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    vi::MOI.VariableIndex,
    ::MOI.ZeroOne,
)
    allow_modification(o)
    v = var(o, vi)
    p_infeas = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, v, SCIP_VARTYPE_BINARY, p_infeas)
    # Need to adjust bounds for SCIP, which fails with an error otherwise.
    # Check for conflicts with existing bounds first:
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if lb == -SCIPinfinity(o) && ub == SCIPinfinity(o)
        @SCIP_CALL SCIPchgVarLb(o, v, 0.0)
        @SCIP_CALL SCIPchgVarUb(o, v, 1.0)
    else
        # Store old bounds for later recovery.
        o.binbounds[vi] = MOI.Interval(lb, ub)
        if ub > 1.0
            @SCIP_CALL SCIPchgVarUb(o, v, 1.0)
        end
        if lb < 0.0
            @SCIP_CALL SCIPchgVarLb(o, v, 0.0)
        end
    end
    ci = MOI.ConstraintIndex{MOI.VariableIndex,MOI.ZeroOne}(vi.value)
    return register!(o, ci)
end

function MOI.delete(
    o::Optimizer,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,MOI.ZeroOne},
)
    _throw_if_invalid(o, ci)
    allow_modification(o)
    vi = MOI.VariableIndex(ci.value)
    v = var(o, vi)
    p_infeas = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, v, SCIP_VARTYPE_CONTINUOUS, p_infeas)
    bounds = get(o.binbounds, vi, nothing)
    if bounds !== nothing
        @SCIP_CALL SCIPchgVarLb(o, v, bounds.lower)
        @SCIP_CALL SCIPchgVarUb(o, v, bounds.upper)
    end
    delete!(o.constypes[MOI.VariableIndex, MOI.ZeroOne], ConsRef(ci.value))
    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,MOI.ZeroOne},
)
    MOI.throw_if_not_valid(o, ci)
    return MOI.ZeroOne()
end

## MOI.VariableIndex -in- BOUNDS

function MOI.supports_constraint(
    o::Optimizer,
    ::Type{MOI.VariableIndex},
    ::Type{<:BOUNDS},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    vi::MOI.VariableIndex,
    set::S,
) where {S<:BOUNDS}
    allow_modification(o)
    v = var(o, vi)
    newlb, newub = bounds(set)
    inf = SCIPinfinity(o)
    newlb, newub = something(newlb, -inf), something(newub, inf)
    oldlb, oldub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    # FIXME(odow): This section is broken for detecting existing bounds
    if (oldlb != -inf && newlb != -inf || oldub != inf && newub != inf)
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            # Store new bounds
            o.binbounds[vi] = MOI.Interval(newlb, newub)
            if newlb < 0.0
                newlb = oldlb
            end
            if newub > 1.0
                newub = oldub
            end
        else
            throw(MOI.LowerBoundAlreadySet{S,S}(vi))
        end
    end
    if newlb != -inf
        @SCIP_CALL SCIPchgVarLb(o, v, newlb)
    end
    if newub != inf
        @SCIP_CALL SCIPchgVarUb(o, v, newub)
    end
    ci = MOI.ConstraintIndex{MOI.VariableIndex,S}(vi.value)
    return register!(o, ci)
end

function reset_bounds(o::Optimizer, v, lb, ub, ::Type{S}) where {S}
    @SCIP_CALL SCIPchgVarLb(o, v, lb)
    @SCIP_CALL SCIPchgVarUb(o, v, ub)
    return
end

function reset_bounds(o::Optimizer, v, lb, ub, ::Type{MOI.GreaterThan{Float64}})
    @SCIP_CALL SCIPchgVarLb(o, v, lb)
    return
end

function reset_bounds(o::Optimizer, v, lb, ub, ::Type{MOI.LessThan{Float64}})
    @SCIP_CALL SCIPchgVarUb(o, v, ub)
    return
end

function MOI.delete(
    o::Optimizer,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,S},
) where {S<:BOUNDS}
    _throw_if_invalid(o, ci)
    allow_modification(o)
    # Don't actually delete any SCIP constraint, just reset bounds
    vi = MOI.VariableIndex(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        reset_bounds(o, v, 0.0, 1.0, S)
    else
        inf = SCIPinfinity(o)
        reset_bounds(o, v, -inf, inf, S)
    end
    # but do delete the constraint reference
    delete!(o.binbounds, vi)
    delete!(o.constypes[MOI.VariableIndex, S], ConsRef(ci.value))
    return nothing
end

function MOI.set(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,S},
    set::S,
) where {S<:BOUNDS}
    allow_modification(o)
    v = var(o, MOI.VariableIndex(ci.value))
    lb, ub = bounds(set)
    old_interval =
        get(o.binbounds, MOI.VariableIndex(ci.value), MOI.Interval(0.0, 1.0))
    if lb !== nothing
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            lb = max(lb, 0.0)
        end
        @SCIP_CALL SCIPchgVarLb(o, v, lb)
        o.binbounds[MOI.VariableIndex(ci.value)] =
            MOI.Interval(lb, old_interval.upper)
    end
    if ub !== nothing
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            ub = min(ub, 1.0)
        end
        @SCIP_CALL SCIPchgVarUb(o, v, ub)
        o.binbounds[MOI.VariableIndex(ci.value)] =
            MOI.Interval(old_interval.lower, ub)
    end
    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,S},
) where {S<:BOUNDS}
    if !MOI.is_valid(o, ci)
        throw(MOI.InvalidIndex(ci))
    end
    vi = MOI.VariableIndex(ci.value)
    v = var(o, vi)
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        bounds = o.binbounds[vi]
        lb, ub = bounds.lower, bounds.upper
    end
    return from_bounds(S, lb, ub)
end

# MOI.VariablePrimalStart

function MOI.supports(
    ::Optimizer,
    ::MOI.VariablePrimalStart,
    ::Type{MOI.VariableIndex},
)
    return true
end

function MOI.get(o::Optimizer, ::MOI.VariablePrimalStart, vi::MOI.VariableIndex)
    return get(o.start, vi, nothing)
end

function MOI.set(
    o::Optimizer,
    ::MOI.VariablePrimalStart,
    vi::MOI.VariableIndex,
    value::Float64,
)
    o.start[vi] = value
    return
end

function MOI.set(
    o::Optimizer,
    ::MOI.VariablePrimalStart,
    vi::MOI.VariableIndex,
    ::Nothing,
)
    delete!(o.start, vi)
    return
end

function MOI.set(
    ::Optimizer,
    ::MOI.ConstraintFunction,
    ::MOI.ConstraintIndex{MOI.VariableIndex},
    ::MOI.VariableIndex,
)
    return throw(MOI.SettingVariableIndexNotAllowed())
end

function get_original_variables(vars::Array{Ptr{SCIP_VAR}}, nvars::Int)
    scalar = Ref(1.0)
    constant = Ref(0.0)
    orig_vars = map(1:nvars) do i
        var = Ref(vars[i])
        @SCIP_CALL SCIPvarGetOrigvarSum(var, scalar, constant)
        @assert scalar[] == 1.0
        @assert constant[] == 0.0
        var[]
    end
    return orig_vars
end
