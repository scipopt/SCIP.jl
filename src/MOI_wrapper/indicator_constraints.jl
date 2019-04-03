# Indicator constraints

"""
Set of (x,y) that satisfy the indicator constraint:

    y ∈ 𝔹, y = 1 ==> a^T x ≤ rhs

"""
struct IndicatorSet{T <: Real} <: MOI.AbstractVectorSet
    a::T
    rhs::T
end

MOI.supports_constraint(::Optimizer, ::Type{IndicatorFunction}, ::IndicatorSet{<:AbstractFloat}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::IndicatorSet{Float64})
    allow_modification(o)
    y = VarRef(func.variables[1])
    s = VarRef(func.variables[2])
    x = VarRef.(func.variables[3:end])

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
