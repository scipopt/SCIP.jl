# Special-Ordered-Set type 1

MOI.supports_constraint(o::Optimizer, ::Type{VECTOR}, ::Type{SOS1}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::SOS1)
    allow_modification(o)

    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_special_ordered_set_type1(o.mscip, varrefs, set.weights)
    ci = CI{VECTOR, SOS1}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end


# Special-Ordered-Set type 2

MOI.supports_constraint(o::Optimizer, ::Type{VECTOR}, ::Type{SOS2}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::SOS2)
    allow_modification(o)

    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_special_ordered_set_type2(o.mscip, varrefs, set.weights)
    ci = CI{VECTOR, SOS2}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end
