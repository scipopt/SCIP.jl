# second-order-cone constraints

MOI.supports_constraint(o::Optimizer, ::Type{VECTOR}, ::Type{SOC}) = true

function MOI.add_constraint(o::Optimizer, func::VECTOR, set::SOC)
    allow_modification(o)

    # check bounds on variable for right-hand side
    rhsvar = func.variables[1]
    rhslb = SCIPvarGetLbOriginal(var(o, rhsvar))
    if rhslb < 0.0
        error("SCIP needs non-negative variable on right-hand side of second-order cone constraint, have lower bound: $(rhslb)!")
    end

    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_second_order_cone_constraint(o.mscip, varrefs)
    ci = CI{VECTOR, SOC}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{VECTOR, SOC})
    allow_modification(o)
    delete!(o.constypes[VECTOR, SOC], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end
