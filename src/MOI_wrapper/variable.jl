## variables (general)

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    vr = add_variable(o.inner)
    var::Ptr{SCIP_VAR} = o.inner.vars[vr][]
    register!(o, var, vr)
    return MOI.VariableIndex(vr.val)
end

MOI.add_variables(o::Optimizer, n) = [MOI.add_variable(o) for i=1:n]
MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.inner.vars)
MOI.get(o::Optimizer, ::MOI.ListOfVariableIndices) = sort!([VI(k.val) for k in keys(o.inner.vars)], by=v->v.value)
MOI.is_valid(o::Optimizer, vi::VI) = haskey(o.inner.vars, VarRef(vi.value))

function MOI.get(o::Optimizer, ::MOI.VariableName, vi::VI)::String
    return GC.@preserve o unsafe_string(SCIPvarGetName(var(o, vi)))
end

function MOI.set(o::Optimizer, ::MOI.VariableName, vi::VI, name::String)
    @SCIP_CALL SCIPchgVarName(o, var(o, vi), name)
    return nothing
end

MOI.supports(::Optimizer, ::MOI.VariableName, ::Type{MOI.VariableIndex}) = true

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

function MOI.delete(o::Optimizer, vi::VI)
    # Note: SCIP does not currently support deletion of variables that are still
    # present in some constraint. We don't want the overhead of keeping track of
    # the variable-in-constraint relation, so, to be conservative, we only allow
    # to delete a variable when there are no constraints in the model.
    if length(o.inner.conss) > 0
        throw(
            MOI.DeleteNotAllowed(
                vi,
                "Can not delete variable while model contains constraints!",
            ),
        )
    end
    allow_modification(o)
    if !haskey(o.inner.vars, VarRef(vi.value))
        throw(MOI.InvalidIndex(vi))
    end
    # TODO still necessary?
    if !haskey(o.reference, var(o, vi))
        throw(MOI.InvalidIndex(vi))
    end
    haskey(o.binbounds, vi) && delete!(o.binbounds, vi)
    delete!(o.reference, var(o, vi))
    delete(o.inner, VarRef(vi.value))
    return nothing
end

## variable types (binary, integer)

MOI.supports_constraint(o::Optimizer, ::Type{VI}, ::Type{<:VAR_TYPES}) = true

scip_vartype(::Type{MOI.ZeroOne}) = SCIP_VARTYPE_BINARY
scip_vartype(::Type{MOI.Integer}) = SCIP_VARTYPE_INTEGER

function MOI.add_constraint(o::Optimizer, vi::VI, set::S) where {S <: VAR_TYPES}
    allow_modification(o)
    v = var(o, vi)
    infeasible = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, v, scip_vartype(S), infeasible)
    # TODO: warn if infeasible[] == TRUE?
    if S <: MOI.ZeroOne
        # Need to adjust bounds for SCIP, which fails with an error otherwise.
        # Check for conflicts with existing bounds first:
        lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
        if lb == -SCIPinfinity(o) && ub == SCIPinfinity(o)
            @debug "Implicitly setting bounds [0,1] for binary variable at $(vi.value)!"
            @SCIP_CALL SCIPchgVarLb(o, v, 0.0)
            @SCIP_CALL SCIPchgVarUb(o, v, 1.0)
        else
            # Store old bounds for later recovery.
            o.binbounds[vi] = MOI.Interval(lb, ub)
            if ub > 1.0
                @debug "Tightening upper bound $ub to 1 for binary variable at $(vi.value)!"
                @SCIP_CALL SCIPchgVarUb(o, v, 1.0)
            end
            if lb < 0.0
                @debug "Tightening lower bound $lb to 0 for binary variable at $(vi.value)!"
                @SCIP_CALL SCIPchgVarLb(o, v, 0.0)
            end
        end
    end
    # use var index for cons index of this type
    i = vi.value
    return register!(o, CI{VI, S}(i))
end

function MOI.delete(o::Optimizer, ci::CI{VI,S}) where {S <: VAR_TYPES}
    _throw_if_invalid(o, ci)
    allow_modification(o)

    vi = VI(ci.value)
    v = var(o, vi)

    # Reset bounds from constraint if this was a binary, see below.
    reset_bounds = SCIPvarGetType(v) == SCIP_VARTYPE_BINARY

    # don't actually delete any SCIP constraint, just reset type
    infeasible = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPchgVarType(o, var(o, vi), SCIP_VARTYPE_CONTINUOUS, infeasible)
    # TODO: warn if infeasible[] == TRUE?

    # Can only change bounds after changing the var type.
    if reset_bounds
        bounds = get(o.binbounds, vi, nothing)
        if bounds !== nothing
            @SCIP_CALL SCIPchgVarLb(o, v, bounds.lower)
            @SCIP_CALL SCIPchgVarUb(o, v, bounds.upper)
        end
    end

    # but do delete the constraint reference
    delete!(o.constypes[VI, S], ConsRef(ci.value))

    return nothing
end

## variable bounds

MOI.supports_constraint(o::Optimizer, ::Type{VI}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, vi::VI, set::S) where {S <: BOUNDS}
    allow_modification(o)
    v = var(o, vi)
    inf = SCIPinfinity(o)

    newlb, newub = bounds(set)
    newlb = newlb === nothing ? -inf : newlb
    newub = newub === nothing ?  inf : newub

    # Check for existing bounds first.
    oldlb, oldub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if (oldlb != -inf && newlb != -inf || oldub != inf && newub != inf)
        # special case: implicit bounds for binaries
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            # Store new bounds
            o.binbounds[vi] = MOI.Interval(newlb, newub)

            if newlb < 0.0
                @debug "Ignoring relaxed lower bound $newlb for binary variable at $(vi.value)!"
                newlb = oldlb
            end

            if newub > 1.0
                @debug "Ignoring relaxed upper bounds $newub for binary variable at $(vi.value)!"
                newub = oldub
            end

            if newlb != oldlb || newub != oldub
                @debug "Overwriting existing bounds [0.0,1.0] with [$newlb,$newub] for binary variable at $(vi.value)!"
            end
        else # general case (non-binary variable)
            # TODO find initially-set bound constraint
            throw(MOI.LowerBoundAlreadySet{S,S}(vi))
        end
    end

    if newlb != -inf
        @SCIP_CALL SCIPchgVarLb(o, v, newlb)
    end

    if newub != inf
        @SCIP_CALL SCIPchgVarUb(o, v, newub)
    end

    # use var index for cons index of this type
    i = vi.value
    return register!(o, CI{VI, S}(i))
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{VI, S}) where S <: Union{MOI.Interval{Float64}, MOI.EqualTo{Float64}}
    @SCIP_CALL SCIPchgVarLb(o, v, lb)
    @SCIP_CALL SCIPchgVarUb(o, v, ub)
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{VI, MOI.GreaterThan{Float64}})
    @SCIP_CALL SCIPchgVarLb(o, v, lb)
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{VI, MOI.LessThan{Float64}})
    @SCIP_CALL SCIPchgVarUb(o, v, ub)
end

function MOI.delete(o::Optimizer, ci::CI{VI,S}) where {S <: BOUNDS}
    _throw_if_invalid(o, ci)
    allow_modification(o)

    # Don't actually delete any SCIP constraint, just reset bounds
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        reset_bounds(o, v, 0.0, 1.0, ci)
    else
        inf = SCIPinfinity(o)
        reset_bounds(o, v, -inf, inf, ci)
    end

    # but do delete the constraint reference
    haskey(o.binbounds, vi) && delete!(o.binbounds, vi)
    delete!(o.constypes[VI, S], ConsRef(ci.value))

    return nothing
end

function MOI.set(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VI,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)
    v = var(o, VI(ci.value)) # cons index is actually var index
    lb, ub = bounds(set)
    if lb !== nothing
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            lb = max(lb, 0.0)
        end
        @SCIP_CALL SCIPchgVarLb(o, v, lb)
    end
    if ub !== nothing
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            ub = min(ub, 1.0)
        end
        @SCIP_CALL SCIPchgVarUb(o, v, ub)
    end
    return nothing
end

# TODO: is actually wrong for unbounded variables?
function MOI.is_valid(o::Optimizer, ci::CI{VI,S}) where {S <: BOUNDS}
    if !haskey(o.inner.vars, VarRef(ci.value))
        return false
    end
    cons_set = get(o.constypes, (VI, S), nothing)
    if cons_set === nothing
        return false
    end
    return ConsRef(ci.value) in o.constypes[VI, S]
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VI, S}) where {S <: BOUNDS}
    if !MOI.is_valid(o, ci)
        throw(MOI.InvalidIndex(ci))
    end
    return VI(ci.value)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VI, S}) where {S <: BOUNDS}
    if !MOI.is_valid(o, ci)
        throw(MOI.InvalidIndex(ci))
    end
    vi = VI(ci.value)
    v = var(o, vi)
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        bounds = o.binbounds[vi]
        lb, ub = bounds.lower, bounds.upper
    end
    return from_bounds(S, lb, ub)
end

function MOI.is_valid(o::Optimizer, ci::CI{VI,S}) where {S <: Union{MOI.ZeroOne, MOI.Integer}}
    if !haskey(o.inner.vars, VarRef(ci.value))
        return false
    end
    return ConsRef(ci.value) in o.constypes[VI, S]
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VI, MOI.ZeroOne})
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        return MOI.ZeroOne()
    end
    throw(MOI.InvalidIndex(ci))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VI, MOI.Integer})
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_INTEGER
        return MOI.Integer()
    end
    throw(MOI.InvalidIndex(ci))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VI, MOI.ZeroOne})
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        return vi
    end
    throw(MOI.InvalidIndex(ci))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VI, MOI.Integer})
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_INTEGER
        return vi
    end
    throw(MOI.InvalidIndex(ci))
end

# (partial) warm starts

MOI.supports(::Optimizer, ::MOI.VariablePrimalStart, ::Type{VI}) = true

function MOI.get(o::Optimizer, ::MOI.VariablePrimalStart, vi::VI)
    return if haskey(o.start, vi)
        o.start[vi]
    else
        nothing
    end
end

function MOI.set(o::Optimizer, ::MOI.VariablePrimalStart, vi::VI, value::Float64)
    o.start[vi] = value
    return
end

function MOI.set(o::Optimizer, ::MOI.VariablePrimalStart, vi::VI, value::Nothing)
    if haskey(o.start, vi)
        delete!(o.start, vi)
    end
    return
end

function MOI.set(::Optimizer, ::MOI.ConstraintFunction, ::CI{VI}, ::VI)
    throw(MOI.SettingVariableIndexNotAllowed())
end
