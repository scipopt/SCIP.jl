# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Set of allowed Julia operators (as given by MOI)
const OPS = [
    :+,       # n-ary
    :-,     # unary, binary
    :*,   # n-ary
    :/,       # unary
    :^, # binary (or INTPOWER)
    :sqrt,   # unary
    :exp,     # unary
    :log,     # unary
    :abs,     # unary
]

const UNARY_OPS_LOOKUP = (
    exp=SCIPcreateExprExp,
    log=SCIPcreateExprLog,
    abs=SCIPcreateExprAbs,
    cos=SCIPcreateExprCos,
    sin=SCIPcreateExprSin,
)

"""
Extract operators from Julia expr recursively and convert to SCIP expressions.
Returns the SCIP expression pointer, whether the expression is a pure value (without variables).
"""
function push_expr!(
    nonlin::NonlinExpr,
    scip::Ptr{SCIP_},
    vars::Dict{VarRef,<:Ref{Ptr{SCIP_VAR}}},
    expr::Expr,
)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    num_children = length(expr.args) - 1
    pure_value = false

    if Meta.isexpr(expr, :comparison) # range constraint
        # args: [lhs, <=, mid, <=, rhs], lhs and rhs constant
        @assert length(expr.args) == 5
        @assert expr.args[2][1] == expr.args[4][1] == :<=

        # just call on middle expression, bounds are handled outside
        return push_expr!(nonlin, scip, vars, expr.args[3])

    elseif Meta.isexpr(expr, :call) # operator
        op = expr.args[1]
        if op in (:(==), :<=, :>=)
            # args: [op, lhs, rhs], rhs constant
            @assert length(expr.args) == 3

            # just call on lhs expression, bounds are handled outside
            return push_expr!(nonlin, scip, vars, expr.args[2])

        elseif op == :^
            # Special case: power with constant exponent.
            # The Julia expression considers the base and exponent to be
            # subexpressions. SCIP does in principle support constant
            # expressions, but in the case of SCIP_EXPR_REALPOWER, the exponent
            # value is stored directly, as the second child.
            @assert num_children == 2

            # Base (first child) is proper sub-expression.
            base, pure_value = push_expr!(nonlin, scip, vars, expr.args[2])

            # Exponent (second child) is stored as value.
            @assert isa(expr.args[3], Number)
            if !pure_value
                exponent = Cdouble(expr.args[3])
                @SCIP_CALL SCIPcreateExprPow(
                    scip,
                    expr__,
                    base[],
                    exponent,
                    C_NULL,
                    C_NULL,
                )
            end
        elseif op in (:-, :+)
            @assert num_children >= 1

            if op === :- && num_children == 1
                # Special case: unary version of minus.
                # Then, insert the actual subexpression:
                right, pure_value = push_expr!(nonlin, scip, vars, expr.args[2])
                if !pure_value
                    # Finally, add the (binary) minus:
                    @SCIP_CALL SCIPcreateExprSum(
                        scip,
                        expr__,
                        Cint(1),
                        [right[]],
                        [-1.0],
                        0.0,
                        C_NULL,
                        C_NULL,
                    )
                end
            else
                coef_mul = if op === :-
                    -1.0
                else
                    1.0
                end
                subexprs_pairs = [
                    push_expr!(nonlin, scip, vars, expr.args[i+1]) for
                    i in 1:num_children
                ]
                if all(pair -> pair[2], subexprs_pairs)
                    pure_value = true
                else
                    # replace pure-value expression by its evaluated value, since no expression has been evaluated yet
                    subexprs = map(eachindex(subexprs_pairs)) do idx
                        (subexpr, is_pure_value) = subexprs_pairs[idx]
                        if is_pure_value
                            expr_val = Meta.eval(expr.args[idx+1])
                            expr_ptr, _ =
                                push_expr!(nonlin, scip, vars, expr_val)
                            expr_ptr[]
                        else
                            subexpr[]
                        end
                    end
                    coefs = fill(coef_mul, num_children)
                    coefs[1] = 1.0
                    @SCIP_CALL SCIPcreateExprSum(
                        scip,
                        expr__,
                        Cint(num_children),
                        subexprs,
                        coefs,
                        0.0,
                        C_NULL,
                        C_NULL,
                    )
                    pure_value = false
                end
            end
        elseif op == :*
            @assert num_children >= 1
            subexprs_pairs = [
                push_expr!(nonlin, scip, vars, expr.args[i+1]) for
                i in 1:num_children
            ]
            if all(pair -> pair[2], subexprs_pairs)
                pure_value = true
            else
                subexprs = map(eachindex(subexprs_pairs)) do idx
                    (subexpr, is_pure_value) = subexprs_pairs[idx]
                    if is_pure_value
                        expr_val = Meta.eval(expr.args[idx+1])
                        expr_ptr, _ =
                            push_expr!(nonlin, scip, vars, expr_val)
                        expr_ptr[]
                    else
                        subexpr[]
                    end
                end
                @SCIP_CALL SCIPcreateExprProduct(
                    scip,
                    expr__,
                    num_children,
                    subexprs,
                    1.0,
                    C_NULL,
                    C_NULL,
                )
                pure_value = false
            end
        elseif op in keys(UNARY_OPS_LOOKUP)
            # Unary operators
            @assert num_children == 1
            # Insert child expression:
            child, pure_value = push_expr!(nonlin, scip, vars, expr.args[2])
            if !pure_value
                @SCIP_CALL UNARY_OPS_LOOKUP[op](
                    scip,
                    expr__,
                    child[],
                    C_NULL,
                    C_NULL,
                )
            end
        elseif op == :sqrt
            child, pure_value = push_expr!(nonlin, scip, vars, expr.args[2])
            if !pure_value
                @SCIP_CALL SCIPcreateExprPow(
                    scip,
                    expr__,
                    child[],
                    0.5,
                    C_NULL,
                    C_NULL,
                )
            end
        elseif op == :/
            @assert num_children == 2
            # Transform L / R => L * R^-1.0
            # Create left and right subexpression.
            left, pure_left = push_expr!(nonlin, scip, vars, expr.args[2])
            inverse_right_expr = :($(expr.args[3])^-1.0)
            right, pure_right =
                push_expr!(nonlin, scip, vars, inverse_right_expr)
            if pure_left && pure_right
                pure_value = true
            else
                if pure_left && expr.args[2] isa Expr
                    val = Meta.eval(expr.args[2])
                    left, _ = push_expr!(nonlin, scip, vars, val)
                end
                if pure_right
                    val = Meta.eval(inverse_right_expr)
                    right, _ = push_expr!(nonlin, scip, vars, val)
                end
                # TODO evaluate left or right
                @SCIP_CALL SCIPcreateExprProduct(
                    scip,
                    expr__,
                    num_children,
                    [left[], right[]],
                    1.0,
                    C_NULL,
                    C_NULL,
                )
            end
        else
            # attempt computation of pure value
            try
                Meta.eval(expr)
            catch e
                error("Operator $op (in $expr) not supported by SCIP.jl!")
            end
            # if reaching this point, the expression is a pure value
            pure_value = true
        end

    elseif Meta.isexpr(expr, :ref) # variable
        # It should look like this:
        # :(x[MathOptInterface.VariableIndex(1)])
        @assert expr.args[1] == :x
        @assert num_children == 1
        vi = expr.args[2] # MOI.VariableIndex
        vr = VarRef(vi.value)
        v = vars[vr][]
        @SCIP_CALL SCIPcreateExprVar(scip, expr__, v, C_NULL, C_NULL)
        pure_value = false
    else
        error("Expression $expr not supported by SCIP.jl!")
    end

    if !pure_value
        # Return this expression to be referenced by parent expressions
        push!(nonlin.exprs, expr__)
    end
    return expr__, pure_value
end

function push_expr!(
    nonlin::NonlinExpr,
    scip::Ptr{SCIP_},
    vars::Dict{VarRef,<:Ref{Ptr{SCIP_VAR}}},
    expr::Number,
)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)

    value = Cdouble(expr)
    @SCIP_CALL SCIPcreateExprValue(scip, expr__, value, C_NULL, C_NULL)

    @assert SCIPisExprValue(scip, expr__[]) == TRUE
    push!(nonlin.exprs, expr__)
    pure_value = true
    return expr__, pure_value
end

"""
Add nonlinear constraint to problem, return cons ref.

    lhs ≤ expression ≤ rhs

# Arguments
- `expr::Expr`: Julia expression of nonlinear function, as given by MOI.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

"""
function add_nonlinear_constraint(
    scipd::SCIPData,
    expr::Expr,
    lhs::Float64,
    rhs::Float64,
)
    nonlin = NonlinExpr()

    # convert expression recursively, extract root and variable pointers
    root_expr, pure_value = push_expr!(nonlin, scipd.scip[], scipd.vars, expr)
    if pure_value
        # TODO
        error("Constraint $expr with pure value")
    end
    # create and add cons_nonlinear
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicNonlinear(
        scipd,
        cons__,
        "",
        root_expr[],
        lhs,
        rhs,
    )
    @SCIP_CALL SCIPaddCons(scipd, cons__[])

    # register and return cons ref
    push!(scipd.nonlinear_storage, nonlin)
    return store_cons!(scipd, cons__)
end
