# Indicator constraints

MOI.supports_constraint(::Optimizer, ::Type{<:MOI.VectorAffineFunction}, ::Type{<:MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, <:MOI.LessThan}}) = true

function MOI.add_constraint(o::Optimizer, func::MOI.VectorAffineFunction{T}, set::MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}) where {T<:Real, LT<:MOI.LessThan}
    allow_modification(o)
    first_index_terms  = [v.scalar_term for v in func.terms if v.output_index == 1]
    scalar_index_terms = [v.scalar_term for v in func.terms if v.output_index != 1]
    length(first_index_terms) == 1 || error("There should be exactly one term in output_index 1, found $(length(first_index_terms))")
    y = VarRef(first_index_terms[1].variable_index.value)
    x = [VarRef(vi.variable_index.value) for vi in scalar_index_terms]
    a = [vi.coefficient for vi in scalar_index_terms]

    cr = add_indicator_constraint(o.mscip, y, x, a, MOI.constant(set.set))
    ci = CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}) where {T<:Real, LT<:MOI.LessThan}
    allow_modification(o)
    delete!(o.constypes[MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end
