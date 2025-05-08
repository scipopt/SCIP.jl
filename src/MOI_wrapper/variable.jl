# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    o.name_to_variable = nothing
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
    o.name_to_variable = nothing
    return nothing
end

function _rebuild_name_to_variable(o::Optimizer)
    o.name_to_variable = Dict{String,Union{Nothing,MOI.VariableIndex}}()
    for x in MOI.get(o, MOI.ListOfVariableIndices())
        name = MOI.get(o, MOI.VariableName(), x)
        if isempty(name)
            continue
        elseif haskey(o.name_to_variable, name)
            o.name_to_variable[name] = nothing
        else
            o.name_to_variable[name] = x
        end
    end
    return
end

function MOI.get(o::Optimizer, ::Type{MOI.VariableIndex}, name::String)
    if o.name_to_variable === nothing
        _rebuild_name_to_variable(o)
    end
    x = get(o.name_to_variable, name, missing)
    if ismissing(x)
        return nothing  # No name exists
    elseif isnothing(x)
        error("Duplicate name")
    end
    return x
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
    if !haskey(o.inner.vars, VarRef(vi.value))
        throw(MOI.InvalidIndex(vi))
    end
    allow_modification(o)
    cref = ConsRef(vi.value)
    # Delete integrality constraints
    v = var(o, vi)
    var_type = SCIPvarGetType(v)
    if var_type == SCIP_VARTYPE_BINARY
        delete!(o.constypes[MOI.VariableIndex, MOI.ZeroOne], cref)
        delete!(o.binbounds, vi)
    elseif var_type == SCIP_VARTYPE_INTEGER
        delete!(o.constypes[MOI.VariableIndex, MOI.Integer], cref)
    end
    # Delete bound constraints
    type = get(o.bound_types, vi, nothing)
    if type == _kSCIP_EQUAL_TO
        delete!(o.constypes[MOI.VariableIndex, MOI.EqualTo{Float64}], cref)
    elseif type == _kSCIP_INTERVAL
        delete!(o.constypes[MOI.VariableIndex, MOI.Interval{Float64}], cref)
    elseif type == _kSCIP_LESS_THAN
        delete!(o.constypes[MOI.VariableIndex, MOI.LessThan{Float64}], cref)
    elseif type == _kSCIP_GREATER_THAN
        delete!(o.constypes[MOI.VariableIndex, MOI.GreaterThan{Float64}], cref)
    elseif type == _kSCIP_LESS_AND_GREATER_THAN
        delete!(o.constypes[MOI.VariableIndex, MOI.LessThan{Float64}], cref)
        delete!(o.constypes[MOI.VariableIndex, MOI.GreaterThan{Float64}], cref)
    end
    delete!(o.bound_types, vi)
    delete!(o.reference, v)
    delete(o.inner, VarRef(vi.value))
    o.name_to_variable = nothing
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

function MOI.add_constraint(o::Optimizer, vi::MOI.VariableIndex, ::MOI.Integer)
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
    ::Optimizer,
    ::Type{MOI.VariableIndex},
    ::Type{MOI.ZeroOne},
)
    return true
end

function MOI.add_constraint(o::Optimizer, vi::MOI.VariableIndex, ::MOI.ZeroOne)
    allow_modification(o)
    v = var(o, vi)
    p_infeas = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, v, SCIP_VARTYPE_BINARY, p_infeas)
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    # Store old bounds for later recovery.
    o.binbounds[vi] = MOI.Interval(lb, ub)
    @SCIP_CALL SCIPchgVarLb(o, v, max(lb, 0.0))
    @SCIP_CALL SCIPchgVarUb(o, v, min(ub, 1.0))
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
    @SCIP_CALL SCIPchgVarLb(o, v, bounds.lower)
    @SCIP_CALL SCIPchgVarUb(o, v, bounds.upper)
    delete!(o.binbounds, vi)
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
    ::Optimizer,
    ::Type{MOI.VariableIndex},
    ::Type{<:BOUNDS},
)
    return true
end

function _throw_if_existing_lower(x, type, new_set::S) where {S}
    if type == _kSCIP_EQUAL_TO
        throw(MOI.LowerBoundAlreadySet{MOI.EqualTo{Float64},S}(x))
    elseif type == _kSCIP_GREATER_THAN
        throw(MOI.LowerBoundAlreadySet{MOI.GreaterThan{Float64},S}(x))
    elseif type == _kSCIP_LESS_AND_GREATER_THAN
        throw(MOI.LowerBoundAlreadySet{MOI.GreaterThan{Float64},S}(x))
    elseif type == _kSCIP_INTERVAL
        throw(MOI.LowerBoundAlreadySet{MOI.Interval{Float64},S}(x))
    end
    return
end

function _throw_if_existing_upper(x, type, new_set::S) where {S}
    if type == _kSCIP_EQUAL_TO
        throw(MOI.UpperBoundAlreadySet{MOI.EqualTo{Float64},S}(x))
    elseif type == _kSCIP_LESS_THAN
        throw(MOI.UpperBoundAlreadySet{MOI.LessThan{Float64},S}(x))
    elseif type == _kSCIP_LESS_AND_GREATER_THAN
        throw(MOI.UpperBoundAlreadySet{MOI.LessThan{Float64},S}(x))
    elseif type == _kSCIP_INTERVAL
        throw(MOI.UpperBoundAlreadySet{MOI.Interval{Float64},S}(x))
    end
    return
end

function _update_bound(o::Optimizer, x, s::MOI.EqualTo, l, u)
    type = get(o.bound_types, x, nothing)
    _throw_if_existing_lower(x, type, s)
    _throw_if_existing_upper(x, type, s)
    o.bound_types[x] = _kSCIP_EQUAL_TO
    return s.value, s.value
end

function _update_bound(o::Optimizer, x, s::MOI.Interval, l, u)
    type = get(o.bound_types, x, nothing)
    _throw_if_existing_lower(x, type, s)
    _throw_if_existing_upper(x, type, s)
    o.bound_types[x] = _kSCIP_INTERVAL
    return s.lower, s.upper
end

function _update_bound(o::Optimizer, x, s::MOI.LessThan, l, u)
    type = get(o.bound_types, x, nothing)
    _throw_if_existing_upper(x, type, s)
    if type == _kSCIP_GREATER_THAN
        o.bound_types[x] = _kSCIP_LESS_AND_GREATER_THAN
    else
        o.bound_types[x] = _kSCIP_LESS_THAN
    end
    return l, s.upper
end

function _update_bound(o::Optimizer, x, s::MOI.GreaterThan, l, u)
    type = get(o.bound_types, x, nothing)
    _throw_if_existing_lower(x, type, s)
    if type == _kSCIP_LESS_THAN
        o.bound_types[x] = _kSCIP_LESS_AND_GREATER_THAN
    else
        o.bound_types[x] = _kSCIP_GREATER_THAN
    end
    return s.lower, u
end

function MOI.add_constraint(
    o::Optimizer,
    vi::MOI.VariableIndex,
    set::S,
) where {S<:BOUNDS}
    allow_modification(o)
    v = var(o, vi)
    l, u = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        s = o.binbounds[vi]
        l, u = s.lower, s.upper
    end
    l, u = _update_bound(o, vi, set, l, u)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        o.binbounds[vi] = MOI.Interval(l, u)
        l, u = max(0.0, l), min(1.0, u)
    end
    @SCIP_CALL SCIPchgVarLb(o, v, l)
    @SCIP_CALL SCIPchgVarUb(o, v, u)
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
    type = o.bound_types[vi]
    if type == _kSCIP_LESS_AND_GREATER_THAN && S <: MOI.LessThan
        o.bound_types[vi] = _kSCIP_GREATER_THAN
    elseif type == _kSCIP_LESS_AND_GREATER_THAN && S <: MOI.GreaterThan
        o.bound_types[vi] = _kSCIP_LESS_AND_GREATER_THAN
    else
        delete!(o.bound_types, vi)
    end
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
    vi = MOI.VariableIndex(ci.value)
    v = var(o, vi)
    lb, ub = bounds(o, set)
    inf = SCIPinfinity(o)
    if lb > -inf
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            old_interval = o.binbounds[vi]
            o.binbounds[vi] = MOI.Interval(lb, old_interval.upper)
            lb = max(lb, 0.0)
        end
        @SCIP_CALL SCIPchgVarLb(o, v, lb)
    end
    if ub < inf
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            old_interval = o.binbounds[vi]
            o.binbounds[vi] = MOI.Interval(old_interval.lower, ub)
            ub = min(ub, 1.0)
        end
        @SCIP_CALL SCIPchgVarUb(o, v, ub)
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

function get_original_variables(vars::Array{Ptr{SCIP_VAR}}, nvars)
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
