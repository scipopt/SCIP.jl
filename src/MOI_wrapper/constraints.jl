# generic constraints

function MOI.get(o::Optimizer, ::MOI.ConstraintName, ci::CI)::String
    return GC.@preserve o unsafe_string(SCIPconsGetName(cons(o, ci)))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI, name::String)
    @SCIP_CALL SCIPchgConsName(o, cons(o, ci), name)
    return nothing
end

function MOI.is_valid(o::Optimizer, c::MOI.ConstraintIndex)
    return haskey(o.inner.conss, SCIP.ConsRef(c.value))
end

# function MOI.get(::Optimizer, ::MOI.ListOfConstraintAttributesSet{F, S}) where {F, S}
#     return [MOI.ConstraintName()]
# end

# function MOI.get(::Optimizer, ::MOI.ListOfConstraintAttributesSet{<:Union{SAF, SQF}, S}) where {S}
#     return Any[MOI.ConstraintName(), MOI.ConstraintPrimal()]
# end
