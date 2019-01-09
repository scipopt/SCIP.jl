# quadratic constraints

MOI.supports_constraint(o::Optimizer, ::Type{SQF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SQF, set::S) where {S <: BOUNDS}
    if func.constant != 0.0
        error("SCIP does not support quadratic constraints with a constant offset.")
    end

    allow_modification(o)

    # affine terms
    linrefs = [VarRef(t.variable_index.value) for t in func.affine_terms]
    lincoefs = [t.coefficient for t in func.affine_terms]

    # quadratic terms
    quadrefs1 = [VarRef(t.variable_index_1.value) for t in func.quadratic_terms]
    quadrefs2 = [VarRef(t.variable_index_2.value) for t in func.quadratic_terms]
    quadcoefs = [t.coefficient for t in func.quadratic_terms]

    # range
    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip(o)) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip(o)) : rhs

    cr = add_quadratic_constraint(o.mscip, linrefs, lincoefs,
                                  quadrefs1, quadrefs2, quadcoefs, lhs, rhs)
    ci = CI{SQF, S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SQF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip(o)) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip(o)) : rhs

    @SC SCIPchgLhsQuadratic(scip(o), cons(o, ci), lhs)
    @SC SCIPchgRhsQuadratic(scip(o), cons(o, ci), rhs)

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SQF, S}) where S <: BOUNDS
    lhs = SCIPgetLhsQuadratic(scip(o), cons(o, ci))
    rhs = SCIPgetRhsQuadratic(scip(o), cons(o, ci))
    return from_bounds(S, lhs, rhs)
end
