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

function MOI.delete(o::Optimizer, ci::CI{VECTOR, SOS1})
    allow_modification(o)
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VECTOR, SOS1})
    s, c = scip(o), cons(o, ci)
    nvars::Int = SCIPgetNVarsSOS1(s, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsSOS1(s, c), nvars)
    return VECTOR([VI(ref(o, v).val) for v in vars])
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VECTOR, SOS1})
    s, c = scip(o), cons(o, ci)
    nvars::Int = SCIPgetNVarsSOS1(s, c)
    weights = unsafe_wrap(Array{Float64}, SCIPgetWeightsSOS1(s, c), nvars)
    return SOS1(weights)
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

function MOI.delete(o::Optimizer, ci::CI{VECTOR, SOS2})
    allow_modification(o)
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VECTOR, SOS2})
    s, c = scip(o), cons(o, ci)
    nvars::Int = SCIPgetNVarsSOS2(s, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsSOS2(s, c), nvars)
    return VECTOR([VI(ref(o, v).val) for v in vars])
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VECTOR, SOS2})
    s, c = scip(o), cons(o, ci)
    nvars::Int = SCIPgetNVarsSOS2(s, c)
    weights = unsafe_wrap(Array{Float64}, SCIPgetWeightsSOS2(s, c), nvars)
    return SOS2(weights)
end
