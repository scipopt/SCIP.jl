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

MOI.get(o::Optimizer, ::MOI.VariableName, vi::VI) = SCIPvarGetName(var(o, vi))
function MOI.set(o::Optimizer, ::MOI.VariableName, vi::VI, name::String)
    @SC SCIPchgVarName(scip(o), var(o, vi), name)
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
    @SC SCIPchgVarType(scip(o), v, scip_vartype(S), infeasible)
    # TODO: warn if infeasible[] == TRUE?
    if S <: MOI.ZeroOne
        # Need to adjust bounds for SCIP, which fails with an error otherwise.
        # Check for conflicts with existing bounds first:
        lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
        if lb >= 0.0 && ub <= 1.0
            # nothing to be done
        elseif lb == -SCIPinfinity(scip(o)) && ub == SCIPinfinity(scip(o))
            @debug "Implicitly setting bounds [0,1] for binary variable at $(vi.value)!"
            @SC SCIPchgVarLb(scip(o), v, 0.0)
            @SC SCIPchgVarUb(scip(o), v, 1.0)
        elseif lb <= 0.0 && ub >= 1.0
            @warn "Tightening bounds [$lb,$ub] to [0,1] for binary variable at $(vi.value)!"
            @SC SCIPchgVarLb(scip(o), v, 0.0)
            @SC SCIPchgVarUb(scip(o), v, 1.0)
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

    if SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
        # TODO: also reset implicit bounds [0, 1] for binaries?
        @warn "Keeping (possibly implicit) bounds [0, 1] for ex-binary variable at $(vi.value)!"
    end

    # don't actually delete any SCIP constraint, just reset type
    infeasible = Ref{SCIP_Bool}()
    @SC SCIPchgVarType(scip(o), var(o, vi), SCIP_VARTYPE_CONTINUOUS, infeasible)
    # TODO: warn if infeasible[] == TRUE?

    # but do delete the constraint reference
    delete!(o.constypes[SVF, S], ConsRef(ci.value))

    return nothing
end

## variable bounds

MOI.supports_constraint(o::Optimizer, ::Type{SVF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SVF, set::S) where S <: BOUNDS
    allow_modification(o)
    s = scip(o)
    vi = func.variable
    v = var(o, vi)
    inf = SCIPinfinity(s)

    newlb, newub = bounds(set)
    newlb = newlb == nothing ? -inf : newlb
    newub = newub == nothing ?  inf : newub

    # Check for existing bounds first.
    oldlb, oldub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if (oldlb != -inf || oldub != inf)
        if oldlb == newlb && oldub == newub
            @debug "Variable at $(vi.value) already has these bounds, skipping new constraint!"
        elseif oldlb == 0.0 && oldub == 1.0 && SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            if newlb >= 0.0 && newlb <= newub && newub <= 1.0
                @debug "Overwriting existing bounds [0.0,1.0] with [$newlb,$newub] for binary variable at $(vi.value)!"
            else
                error("Invalid bounds [$newlb,$newub] for binary variable at $(vi.value)!")
            end
        else
            error("Already have bounds [$oldlb,$oldub] for variable at $(vi.value)!")
        end
    end

    @SC SCIPchgVarLb(scip(o), v, newlb)
    @SC SCIPchgVarUb(scip(o), v, newub)
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{SVF, S}(i))
end

function MOI.delete(o::Optimizer, ci::CI{SVF,S}) where S <: BOUNDS
    allow_modification(o)

    # don't actually delete any SCIP constraint, just reset type
    s = scip(o)
    v = var(o, VI(ci.value))
    inf = SCIPinfinity(s)
    @SC SCIPchgVarLb(s, v, -inf)
    @SC SCIPchgVarUb(s, v,  inf)

    # but do delete the constraint reference
    delete!(o.constypes[SVF, S], ConsRef(ci.value))

    return nothing
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SVF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)
    v = var(o, VI(ci.value)) # cons index is actually var index
    lb, ub = bounds(set)
    @SC SCIPchgVarLb(scip(o), v, lb == nothing ? -SCIPinfinity(scip(o)) : lb)
    @SC SCIPchgVarUb(scip(o), v, ub == nothing ?  SCIPinfinity(scip(o)) : ub)
    return nothing
end

# TODO: is actually wrong for unbounded variables?
function MOI.is_valid(o::Optimizer, ci::CI{SVF,<:BOUNDS})
    return haskey(o.mscip.vars, VarRef(vi.value))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SVF, S}) where S <: BOUNDS
    return SVF(ci)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SVF, S}) where S <: BOUNDS
    v = var(o, VI(ci.value))
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    return from_bounds(S, lb, ub)
end
