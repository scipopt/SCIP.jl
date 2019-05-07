# Indicator constraints

"""
Set of (x,y) that satisfy the indicator constraint:

    y ∈ 𝔹, y = 1 ==> a^T x ≤ rhs

"""
struct IndicatorSet{T <: Real} <: MOI.AbstractVectorSet
    a::Vector{T}
    rhs::T
end

MOI.dimension(idset::IndicatorSet) = length(idset.a) + 1

MOI.supports_constraint(::Optimizer, ::Type{VECTOR}, ::Type{IS}) where {IS <: IndicatorSet{<:AbstractFloat}} = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::IndicatorSet{Float64})
    length(func.variables) == length(set.a) + 1 || throw(DimensionMismatch("Indicator set and VectorOfVariables length mismatch"))
    allow_modification(o)
    y = VarRef(func.variables[1].value)
    x = [VarRef(vi.value) for vi in func.variables[2:end]]

    cr = add_indicator_constraint(o.mscip, y, x, set.a, set.rhs)
    ci = CI{VECTOR, IndicatorSet{Float64}}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{VECTOR, IndicatorSet{Float64}})
    allow_modification(o)
    delete!(o.constypes[VECTOR, IndicatorSet{Float64}], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end

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
