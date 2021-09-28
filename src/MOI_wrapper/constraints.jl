# generic constraints

function MOI.get(o::Optimizer, ::MOI.ConstraintName, ci::CI)::String
    return GC.@preserve o unsafe_string(SCIPconsGetName(cons(o, ci)))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI, name::String)
    @SCIP_CALL SCIPchgConsName(o, cons(o, ci), name)
    return nothing
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI{VI}, name::String)
    throw(MOI.VariableIndexConstraintNameError())
    return nothing
end

function MOI.is_valid(o::Optimizer, c::CI{F, S}) where {F, S}
    cons_set = get(o.constypes, (F, S), nothing)
    if cons_set === nothing
        return false
    end
    if !in(ConsRef(c.value), cons_set)
        return false
    end
    return haskey(o.inner.conss, SCIP.ConsRef(c.value))
end

function MOI.get(o::Optimizer, ::Type{MOI.ConstraintIndex}, name::String)
    ptr = SCIPfindCons(o, name)
    if ptr == C_NULL
        return nothing
    end
    cref = get(o.reference, ptr, nothing)
    if cref === nothing
        return cref
    end
    for ((F, S), setref) in o.constypes
        if cref in setref
            return CI{F,S}(cref.val)
        end
    end
    error("Constraint type not found for constraint $cref")
end
