# quadratic constraints

MOI.supports_constraint(o::Optimizer, ::Type{SQF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SQF, set::S) where {S <: BOUNDS}
    if func.constant != 0.0
        error("SCIP does not support quadratic constraints with a constant offset.")
    end

    allow_modification(o)

    # affine terms
    linrefs = [VarRef(t.variable.value) for t in func.affine_terms]
    lincoefs = [t.coefficient for t in func.affine_terms]

    # quadratic terms
    quadrefs1 = [VarRef(t.variable_1.value) for t in func.quadratic_terms]
    quadrefs2 = [VarRef(t.variable_2.value) for t in func.quadratic_terms]
    # Divide coefficients by 2 iff they come from the diagonal:
    # Take coef * x * y as-is, but turn coef * x^2 into coef/2 * x^2.
    factor = 1.0 .- 0.5 * (quadrefs1 .== quadrefs2)
    quadcoefs = factor .* [t.coefficient for t in func.quadratic_terms]

    # range
    lhs, rhs = bounds(set)
    lhs = lhs === nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs === nothing ?  SCIPinfinity(o) : rhs

    cr = add_quadratic_constraint(o.inner, linrefs, lincoefs,
                                  quadrefs1, quadrefs2, quadcoefs, lhs, rhs)
    ci = CI{SQF, S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SQF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)

    lhs, rhs = bounds(set)
    lhs = lhs === nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs === nothing ?  SCIPinfinity(o) : rhs

    @SCIP_CALL SCIPchgLhsQuadratic(o, cons(o, ci), lhs)
    @SCIP_CALL SCIPchgRhsQuadratic(o, cons(o, ci), rhs)

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SQF, S}) where {S <: BOUNDS}
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    expr_ref = SCIPgetExprNonlinear(c)
    isq = Ref{UInt32}(100)
    # This call is required to get quaddata computed in the expression
    @SCIP_CALL LibSCIP.SCIPcheckExprQuadratic(o, expr_ref, isq)
    if isq[] != 1
        error("Constraint index $ci pointing to a non-quadratic expression $expr_ref")
    end

    constant_ref = Ref{Cdouble}(-1.0)
    n_linear_terms_ref = Ref{Cint}(-1)
    linear_exprs = Ref{Ptr{Ptr{LibSCIP.SCIP_EXPR}}}()
    lincoefs = Ref{Ptr{Cdouble}}()
    n_quad_terms_ref = Ref{Cint}(-1)
    n_bilinear_terms_ref = Ref{Cint}(-1)
    
    LibSCIP.SCIPexprGetQuadraticData(
        expr_ref,
        constant_ref,
        n_linear_terms_ref,
        linear_exprs,
        lincoefs,
        n_quad_terms_ref,
        n_bilinear_terms_ref,
        C_NULL,
        C_NULL,
    )

    lin_expr_vec = unsafe_wrap(Vector{Ptr{Cvoid}}, linear_exprs[], n_linear_terms_ref[])
    lin_coeff_vec = unsafe_wrap(Vector{Cdouble}, lincoefs[], n_linear_terms_ref[])

    func = SCIP.SQF([], [], constant_ref[])
    for idx in 1:n_linear_terms_ref[]
        var_ptr = LibSCIP.SCIPgetVarExprVar(lin_expr_vec[idx])
        func += lin_coeff_vec[idx] * MOI.VariableIndex(o.reference[var_ptr].val)
    end
    for term_idx in 1:n_quad_terms_ref[]
        var_expr = Ref{Ptr{Cvoid}}()
        lin_coef_ref =  Ref{Cdouble}()
        sqr_coef_ref =  Ref{Cdouble}()
        LibSCIP.SCIPexprGetQuadraticQuadTerm(
            expr_ref,
            term_idx - 1, # 0-indexed terms
            var_expr,
            lin_coef_ref,
            sqr_coef_ref,
            C_NULL,
            C_NULL,
            C_NULL,
        )
        @assert lin_coef_ref[] == 0.0
        if sqr_coef_ref[] != 0.0
            var_ptr = LibSCIP.SCIPgetVarExprVar(var_expr[])
            var_idx = MOI.VariableIndex(o.reference[var_ptr].val)
            MOI.Utilities.operate!(+, Float64, func, sqr_coef_ref[] * var_idx * var_idx)
        end
    end

    for term_idx in 1:n_bilinear_terms_ref[]
        var_expr1 = Ref{Ptr{Cvoid}}()
        var_expr2 = Ref{Ptr{Cvoid}}()
        coef_ref =  Ref{Cdouble}()
        LibSCIP.SCIPexprGetQuadraticBilinTerm(
            expr_ref,
            term_idx - 1,
            var_expr1,
            var_expr2,
            coef_ref,
            C_NULL,
            C_NULL,
        )
        if coef_ref[] != 0.0
            var_ptr1 = LibSCIP.SCIPgetVarExprVar(var_expr1[])
            var_idx1 = MOI.VariableIndex(o.reference[var_ptr1].val)
            var_ptr2 = LibSCIP.SCIPgetVarExprVar(var_expr2[])
            var_idx2 = MOI.VariableIndex(o.reference[var_ptr2].val)
            MOI.Utilities.operate!(+, Float64, func, coef_ref[] * var_idx1 * var_idx2)
        end
    end
    return func
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SQF, S}) where {S <: BOUNDS}
    _throw_if_invalid(o, ci)
    lhs = SCIPgetLhsNonlinear(cons(o, ci))
    rhs = SCIPgetRhsNonlinear(cons(o, ci))
    return from_bounds(S, lhs, rhs)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SQF, S}) where {S <: BOUNDS}
    expr_ref = SCIPgetExprNonlinear(cons(o, ci))
    @SCIP_CALL SCIPevalExprActivity(o, expr_ref)
    return SCIPexprGetEvalValue(expr_ref)
end
