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
    # divide coefficients by 2!
    quadcoefs = [t.coefficient / 2.0 for t in func.quadratic_terms]

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

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SQF, S}) where S <: BOUNDS
    s, c = scip(o), cons(o, ci)

    affterms = AFF_TERM[]
    quadterms = QUAD_TERM[]

    # variables that appear only linearly
    nlin = SCIPgetNLinearVarsQuadratic(s, c)
    linvars = unsafe_wrap(Vector{Ptr{SCIP_VAR}}, SCIPgetLinearVarsQuadratic(s, c), nlin)
    lincoefs = unsafe_wrap(Vector{Float64}, SCIPgetCoefsLinearVarsQuadratic(s, c), nlin)
    for i=1:nlin
        push!(affterms, AFF_TERM(lincoefs[i], VI(ref(o, linvars[i]).val)))
    end

    # variables that appear squared, and linearly
    nquadvarterms = SCIPgetNQuadVarTermsQuadratic(s, c)
    quadvarterms = unsafe_wrap(Vector{SCIP_QUADVARTERM}, SCIPgetQuadVarTermsQuadratic(s, c), nquadvarterms)
    for term in quadvarterms
        vi = VI(ref(o, term.var).val)
        push!(affterms, AFF_TERM(term.lincoef, vi))
        # multiply quadratic coefficients by 2!
        push!(quadterms, QUAD_TERM(2.0 * term.sqrcoef, vi, vi))
    end

    # bilinear terms (pair of different variables)
    nbilinterms = SCIPgetNBilinTermsQuadratic(s, c)
    bilinterms = unsafe_wrap(Vector{SCIP_BILINTERM}, SCIPgetBilinTermsQuadratic(s, c), nbilinterms)
    for term in bilinterms
        # multiply quadratic coefficients by 2!
        push!(quadterms, QUAD_TERM(2.0 * term.coef, VI(ref(o, term.var1).val), VI(ref(o, term.var2).val)))
    end

    return SQF(affterms, quadterms, 0.0)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SQF, S}) where S <: BOUNDS
    s = scip(o)
    activity = Ref{Cdouble}()
    @SC SCIPgetActivityQuadratic(s, cons(o, ci), SCIPgetBestSol(s), activity)
    return activity[]
end
