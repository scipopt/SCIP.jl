# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

MOI.supports(::Optimizer, ::MOI.NLPBlock) = true

function MOI.set(o::Optimizer, attr::MOI.NLPBlock, data::MOI.NLPBlockData)
    # We don't actually store the data (to be queried later during the solve
    # process). Instead, we extract the expression graphs and add the
    # corresponding constraints to the model directly.
    if data.has_objective
        msg = "Nonlinear objective not supported by SCIP.jl!"
        throw(MOI.SetAttributeNotAllowed(attr, msg))
    end
    # go back to problem stage
    allow_modification(o)
    MOI.initialize(data.evaluator, [:ExprGraph])
    for i in 1:length(data.constraint_bounds)
        expr = MOI.constraint_expr(data.evaluator, i)
        bounds = data.constraint_bounds[i]
        _ = add_nonlinear_constraint(o.inner, expr, bounds.lower, bounds.upper)
    end
    return nothing
end

# MOI.ScalarNonlinearFunction

function MOI.get(::Optimizer, ::MOI.ListOfSupportedNonlinearOperators)
    return Symbol[:+, :-, :*, :/, :^, :abs, :exp, :log, :sin, :cos, :sqrt]
end

function MOI.supports_constraint(
    ::Optimizer,
    ::Type{MOI.ScalarNonlinearFunction},
    ::Type{S},
) where {S<:BOUNDS}
    return true
end

function MOI.add_constraint(
    model::Optimizer,
    f::MOI.ScalarNonlinearFunction,
    s::BOUNDS,
)
    allow_modification(model)
    expr = NonlinExpr()
    root = _SCIPcreateExpr(model, f, expr)
    l, u = bounds(model, s)
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicNonlinear(model, cons__, "", root[], l, u)
    @SCIP_CALL SCIPaddCons(model, cons__[])
    push!(model.inner.nonlinear_storage, expr)
    cr = store_cons!(model.inner, cons__)
    ci = MOI.ConstraintIndex{MOI.ScalarNonlinearFunction,typeof(s)}(cr.val)
    register!(model, ci)
    register!(model, cons(model, ci), cr)
    return ci
end

function _SCIPcreateExpr(model::Optimizer, f::Real, expr::NonlinExpr)
    ret = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    @SCIP_CALL SCIPcreateExprValue(model, ret, f, C_NULL, C_NULL)
    push!(expr.exprs, ret)
    return ret
end

function _SCIPcreateExpr(
    model::Optimizer,
    f::MOI.VariableIndex,
    expr::NonlinExpr,
)
    ret = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    v = var(model, f)
    @SCIP_CALL SCIPcreateExprVar(model, ret, v, C_NULL, C_NULL)
    push!(expr.exprs, ret)
    return ret
end

function _SCIPcreateExpr(
    model::Optimizer,
    f::MOI.ScalarNonlinearFunction,
    expr::NonlinExpr,
)
    ret = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    if f.head == :+
        children = map(arg -> _SCIPcreateExpr(model, arg, expr)[], f.args)
        @SCIP_CALL SCIPcreateExprSum(
            model,
            ret,
            length(f.args),                 # int nchildren
            children,                       # SCIP_EXPR **children,
            ones(Float64, length(f.args)),  # SCIP_REAL *coefficients
            0.0,                            # SCIP_Real constant
            C_NULL,
            C_NULL,
        )
    elseif f.head == :*
        x = map(arg -> _SCIPcreateExpr(model, arg, expr)[], f.args)
        n = length(f.args)
        @SCIP_CALL SCIPcreateExprProduct(model, ret, n, x, 1.0, C_NULL, C_NULL)
    elseif f.head == :/
        # Convert x / y --> x * y^-1
        @assert length(f.args) == 2
        x = _SCIPcreateExpr(model, f.args[1], expr)[]
        y = _SCIPcreateExpr(model, f.args[2], expr)[]
        ret_y = Ref{Ptr{SCIP_EXPR}}(C_NULL)
        @SCIP_CALL SCIPcreateExprPow(model, ret_y, y, -1.0, C_NULL, C_NULL)
        push!(expr.exprs, ret_y)
        xy = [x, ret_y[]]
        @SCIP_CALL SCIPcreateExprProduct(model, ret, 2, xy, 1.0, C_NULL, C_NULL)
    elseif f.head == :-
        @assert 1 <= length(f.args) <= 2
        children = map(arg -> _SCIPcreateExpr(model, arg, expr)[], f.args)
        n = length(f.args)
        coefficients = ones(Float64, n)
        coefficients[end] = -1.0
        @SCIP_CALL SCIPcreateExprSum(
            model,
            ret,
            n,
            children,
            coefficients,
            0.0,
            C_NULL,
            C_NULL,
        )
    elseif f.head == :^
        @assert length(f.args) == 2
        if !(f.args[2] isa Real)
            throw(MOI.UnsupportedNonlinearOperator(f.head))
        end
        child = _SCIPcreateExpr(model, first(f.args), expr)
        expon = convert(Float64, f.args[2])
        @SCIP_CALL SCIPcreateExprPow(model, ret, child[], expon, C_NULL, C_NULL)
    elseif f.head == :abs
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprAbs(model, ret, child[], C_NULL, C_NULL)
    elseif f.head == :exp
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprExp(model, ret, child[], C_NULL, C_NULL)
    elseif f.head == :log
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprLog(model, ret, child[], C_NULL, C_NULL)
    elseif f.head == :sin
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprSin(model, ret, child[], C_NULL, C_NULL)
    elseif f.head == :cos
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprCos(model, ret, child[], C_NULL, C_NULL)
    elseif f.head == :sqrt
        child = _SCIPcreateExpr(model, only(f.args), expr)
        @SCIP_CALL SCIPcreateExprPow(model, ret, child[], 0.5, C_NULL, C_NULL)
    else
        throw(MOI.UnsupportedNonlinearOperator(f.head))
    end
    push!(expr.exprs, ret)
    return ret
end

function _SCIPcreateExpr(
    model::Optimizer,
    f::MOI.ScalarAffineFunction,
    expr::NonlinExpr,
)
    ret = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    n = length(f.terms)
    children = map(f.terms) do term
        return _SCIPcreateExpr(model, term.variable, expr)[]
    end
    coefficients = map(f.terms) do term
        return convert(Float64, term.coefficient)
    end
    @SCIP_CALL SCIPcreateExprSum(
        model,
        ret,
        n,
        children,
        coefficients,
        f.constant,
        C_NULL,
        C_NULL,
    )
    push!(expr.exprs, ret)
    return ret
end

function _SCIPcreateExpr(
    model::Optimizer,
    f::MOI.ScalarQuadraticFunction,
    expr::NonlinExpr,
)
    ret = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    children = map(f.affine_terms) do term
        return _SCIPcreateExpr(model, term.variable, expr)[]
    end
    coefficients = map(f.affine_terms) do term
        return convert(Float64, term.coefficient)
    end
    for term in f.quadratic_terms
        ret_xy = Ref{Ptr{SCIP_EXPR}}(C_NULL)
        x = _SCIPcreateExpr(model, term.variable_1, expr)
        y = _SCIPcreateExpr(model, term.variable_2, expr)
        scale = ifelse(term.variable_1 == term.variable_2, 0.5, 1.0)
        @SCIP_CALL SCIPcreateExprProduct(
            model,
            ret_xy,
            2,
            [x[], y[]],
            1.0,
            C_NULL,
            C_NULL,
        )
        push!(children, ret_xy[])
        push!(coefficients, scale * term.coefficient)
        push!(expr.exprs, ret_xy)
    end
    @SCIP_CALL SCIPcreateExprSum(
        model,
        ret,
        length(children),
        children,
        coefficients,
        f.constant,
        C_NULL,
        C_NULL,
    )
    push!(expr.exprs, ret)
    return ret
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintPrimal,
    ci::MOI.ConstraintIndex{MOI.ScalarNonlinearFunction},
)
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    expr_ref = SCIPgetExprNonlinear(c)
    sol = SCIPgetBestSol(o)
    @SCIP_CALL SCIPevalExpr(o, expr_ref, sol, Clonglong(0))
    return SCIPexprGetEvalValue(expr_ref)
end
