# second-order-cone constraints

MOI.supports_constraint(o::Optimizer, ::Type{VECTOR}, ::Type{SOC}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::SOC)
    allow_modification(o)

    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_second_order_cone_constraint(o.mscip, varrefs)
    ci = CI{VECTOR, SOC}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end
