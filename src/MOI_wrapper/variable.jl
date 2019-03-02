## variables (general)

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    vr = add_variable(o.mscip)
    var::Ptr{SCIP_VAR} = o.mscip.vars[vr][]
    register!(o, var, vr)
    return MOI.VariableIndex(vr.val)
end

MOI.add_variables(o::Optimizer, n) = [MOI.add_variable(o) for i=1:n]
MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.mscip.vars)
MOI.get(o::Optimizer, ::MOI.ListOfVariableIndices) = [VI(k.val) for k in keys(o.mscip.vars)]
MOI.is_valid(o::Optimizer, vi::VI) = haskey(o.mscip.vars, VarRef(vi.value))

function MOI.get(o::Optimizer, ::MOI.VariableName, vi::VI)
    return GC.@preserve o SCIPvarGetName(var(o, vi))
end

function MOI.set(o::Optimizer, ::MOI.VariableName, vi::VI, name::String)
    @SC SCIPchgVarName(o, var(o, vi), name)
    return nothing
end

function MOI.delete(o::Optimizer, vi::VI)
    # Note: SCIP does not currently support deletion of variables that are still
    # present in some constraint. We don't want the overhead of keeping track of
    # the variable-in-constraint relation, so, to be conservative, we only allow
    # to delete a variable when there are no constraints in the model.
    if length(o.mscip.conss) > 0
        error("Can not delete variable while model contains constraints!")
    end

    allow_modification(o)
    haskey(o.binbounds, vi) && delete!(o.binbounds, vi)
    delete!(o.reference, var(o, vi))
    delete(o.mscip, VarRef(vi.value))
    return nothing
end

## variable types (binary, integer)

MOI.supports_constraint(o::Optimizer, ::Type{SVF}, ::Type{<:VAR_TYPES}) = true

scip_vartype(::Type{MOI.ZeroOne}) = SCIP_VARTYPE_BINARY
scip_vartype(::Type{MOI.Integer}) = SCIP_VARTYPE_INTEGER

function MOI.add_constraint(o::Optimizer, func::SVF, set::S) where {S <: VAR_TYPES}
    allow_modification(o)
    vi = func.variable
    v = var(o, vi)
    infeasible = Ref{SCIP_Bool}()
    @SC SCIPchgVarType(o, v, scip_vartype(S), infeasible)
    # TODO: warn if infeasible[] == TRUE?
    if S <: MOI.ZeroOne
        # Need to adjust bounds for SCIP, which fails with an error otherwise.
        # Check for conflicts with existing bounds first:
        lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
        if lb >= 0.0 && ub <= 1.0
            # Store old bounds for later recovery.
            o.binbounds[vi] = MOI.Interval(lb, ub)
        elseif lb == -SCIPinfinity(o) && ub == SCIPinfinity(o)
            @debug "Implicitly setting bounds [0,1] for binary variable at $(vi.value)!"
            @SC SCIPchgVarLb(o, v, 0.0)
            @SC SCIPchgVarUb(o, v, 1.0)
        elseif lb <= 0.0 && ub >= 1.0
            @debug "Tightening bounds [$lb,$ub] to [0,1] for binary variable at $(vi.value)!"
            @SC SCIPchgVarLb(o, v, 0.0)
            @SC SCIPchgVarUb(o, v, 1.0)
            # Store old bounds for later recovery.
            o.binbounds[vi] = MOI.Interval(lb, ub)
        else
            error("Existing bounds [$lb,$ub] conflict for binary variable at $(vi.value)!")
        end
    end
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{SVF, S}(i))
end

function MOI.delete(o::Optimizer, ci::CI{SVF,S}) where {S <: VAR_TYPES}
    allow_modification(o)

    vi = VI(ci.value)
    v = var(o, vi)

    # Reset bounds from constraint if this was a binary, see below.
    reset_bounds = SCIPvarGetType(v) == SCIP_VARTYPE_BINARY

    # don't actually delete any SCIP constraint, just reset type
    infeasible = Ref{SCIP_Bool}()
    @SC SCIPchgVarType(o, var(o, vi), SCIP_VARTYPE_CONTINUOUS, infeasible)
    # TODO: warn if infeasible[] == TRUE?

    # Can only change bounds after chaging the var type.
    if reset_bounds
        bounds = o.binbounds[vi]
        @SC SCIPchgVarLb(o, v, bounds.lower)
        @SC SCIPchgVarUb(o, v, bounds.upper)
    end

    # but do delete the constraint reference
    delete!(o.constypes[SVF, S], ConsRef(ci.value))

    return nothing
end

## variable bounds

MOI.supports_constraint(o::Optimizer, ::Type{SVF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SVF, set::S) where S <: BOUNDS
    allow_modification(o)
    vi = func.variable
    v = var(o, vi)
    inf = SCIPinfinity(o)

    newlb, newub = bounds(set)
    newlb = newlb == nothing ? -inf : newlb
    newub = newub == nothing ?  inf : newub

    # Check for existing bounds first.
    oldlb, oldub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if (oldlb != -inf && newlb != -inf || oldub != inf && newub != inf)
        # special case: implicit bounds for binaries
        if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            # Store new bounds
            o.binbounds[vi] = MOI.Interval(newlb, newub)
            if newlb >= 0.0 && newlb <= newub && newub <= 1.0
                @debug "Overwriting existing bounds [0.0,1.0] with [$newlb,$newub] for binary variable at $(vi.value)!"
            elseif newlb <= oldlb && newub >= oldub
                @debug "Ignoring wider bounds [$newlb,$newub] for binary variable at $(vi.value)!"
                newlb, newub = oldlb, oldub
            else
                error("Invalid bounds [$newlb,$newub] for binary variable at $(vi.value)!")
            end
        else # general case (non-binary variable)
            error("Already have bounds [$oldlb,$oldub] for variable at $(vi.value)!")
        end
    end

    if newlb != -inf
        @SC SCIPchgVarLb(o, v, newlb)
    end

    if newub != inf
        @SC SCIPchgVarUb(o, v, newub)
    end

    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{SVF, S}(i))
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{SVF, S}) where S <: Union{MOI.Interval{Float64}, MOI.EqualTo{Float64}}
    @SC SCIPchgVarLb(o, v, lb)
    @SC SCIPchgVarUb(o, v, ub)
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{SVF, MOI.GreaterThan{Float64}})
    @SC SCIPchgVarLb(o, v, lb)
end

function reset_bounds(o::Optimizer, v, lb, ub, ci::CI{SVF, MOI.LessThan{Float64}})
    @SC SCIPchgVarUb(o, v, ub)
end


function MOI.delete(o::Optimizer, ci::CI{SVF,S}) where S <: BOUNDS
    allow_modification(o)

    # Don't actually delete any SCIP constraint, just reset bounds
    vi = VI(ci.value)
    v = var(o, vi)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        reset_bounds(o, v, 0.0, 1.0, ci)
    else
        inf = SCIPinfinity(s)
        reset_bounds(o, v, -inf, inf, ci)
    end

    # but do delete the constraint reference
    haskey(o.binbounds, vi) && delete!(o.binbounds, vi)
    delete!(o.constypes[SVF, S], ConsRef(ci.value))

    return nothing
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SVF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)
    v = var(o, VI(ci.value)) # cons index is actually var index
    lb, ub = bounds(set)
    lb = lb == nothing ? -SCIPinfinity(o) : lb
    ub = ub == nothing ?  SCIPinfinity(o) : ub
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        o.binbounds[vi] = MOI.Interval(lb, ub)
        lb = max(lb, 0.0)
        ub = min(lb, 1.0)
    end
    @SC SCIPchgVarLb(o, v, lb)
    @SC SCIPchgVarUb(o, v, ub)
    return nothing
end

# TODO: is actually wrong for unbounded variables?
function MOI.is_valid(o::Optimizer, ci::CI{SVF,<:BOUNDS})
    return haskey(o.mscip.vars, VarRef(vi.value))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SVF, S}) where S <: BOUNDS
    return SVF(VI(ci.value))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SVF, S}) where S <: BOUNDS
    vi = VI(ci.value)
    v = var(o, vi)
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        bounds = o.binbounds[vi]
        lb, ub = bounds.lower, bounds.upper
    end
    return from_bounds(S, lb, ub)
end
