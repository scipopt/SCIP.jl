# Absolute power set

# Note: It might be more natural to define a Function for abspower and add
# constraints with the Interval set. But this would involve more effort to
# support it through JuMP, so we define a set instead.

"""
Set of (x,z) that satisfy the absolute power constraint:

    lhs ≤ sign(x + a) * abs(x + a)^n + c*z ≤ rhs

The exponent `n` should be greater than 1.
"""
struct AbsolutePowerSet{T <: Real} <: MOI.AbstractVectorSet
    n::T
    a::T
    c::T
    lhs::T
    rhs::T
end

"""
Shortcut constructor for the special case:

    z == sign(x) * abs(x)^n
"""
AbsolutePowerSet(n::Float64) = AbsolutePowerSet(n, 0.0, -1.0, 0.0, 0.0)

MOI.dimension(set::AbsolutePowerSet{<:Real}) = 2


# Absolute power constraint

const ABSPOWER = AbsolutePowerSet{Float64}

MOI.supports_constraint(::Optimizer, ::Type{VECTOR}, ::Type{ABSPOWER}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::ABSPOWER)
    allow_modification(o)

    x, z = [VarRef(vi.value) for vi in func.variables]
    cr = add_abspower_constraint(o.mscip, x, set.a, set.n, z, set.c, set.lhs, set.rhs)
    ci = CI{VECTOR, ABSPOWER}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{VECTOR, ABSPOWER})
    allow_modification(o)
    delete!(o.constypes[VECTOR, ABSPOWER], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end
