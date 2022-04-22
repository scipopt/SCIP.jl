
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
    exp = SCIPcreateExprExp,
    log = SCIPcreateExprLog,
    abs = SCIPcreateExprAbs,
    cos = SCIPcreateExprCos,
    sin = SCIPcreateExprSin,
)

"""
Subexpressions and variables referenced in an expression tree.

Used to convert Julia expression to SCIP expression using recursive calls to the
mutating push_expr!.
"""
mutable struct NonlinExpr
    vars::Vector{Ptr{SCIP_VAR}}
    exprs::Vector{Ptr{SCIP_EXPR}}
end

NonlinExpr() = NonlinExpr([], [])

"Extract operators from Julia expr recursively and convert to SCIP expressions."
function push_expr!(nonlin::NonlinExpr, scip::Ptr{SCIP_}, vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}, expr::Expr)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    num_children = length(expr.args) - 1

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
            base = push_expr!(nonlin, scip, vars, expr.args[2])

            # Exponent (second child) is stored as value.
            @assert isa(expr.args[3], Number)
            exponent = Cdouble(expr.args[3])
            @SCIP_CALL SCIPcreateExprPow(scip, expr__, base, exponent, C_NULL, C_NULL)
        elseif op in (:-, :+)
            @assert num_children >= 1

            if op === :- && num_children == 1
                # Special case: unary version of minus.
                # Then, insert the actual subexpression:
                right = push_expr!(nonlin, scip, vars, expr.args[2])

                # Finally, add the (binary) minus:
                @SCIP_CALL SCIPcreateExprSum(
                    scip, expr__, Cint(1), [right],
                    [-1.0], 0.0, C_NULL, C_NULL,
                )
            else
                coef_mul = if op === :-
                    -1.0
                else
                    1.0
                end
                subexprs = [push_expr!(nonlin, scip, vars, expr.args[i + 1]) for i in 1:num_children]
                @SCIP_CALL SCIPcreateExprSum(scip, expr__, Cint(num_children), subexprs, fill(coef_mul, num_children), 0.0, C_NULL, C_NULL)
            end
        elseif op == :*
            @assert num_children >= 1
            subexprs = [push_expr!(nonlin, scip, vars, expr.args[i + 1]) for i in 1:num_children]
            @SCIP_CALL SCIPcreateExprProduct(scip, expr__, num_children, subexprs, 1.0, C_NULL, C_NULL)

        elseif op in (:exp, :log, :abs)
            # Unary operators
            @assert num_children == 1

            # Insert child expression:
            child = push_expr!(nonlin, scip, vars, expr.args[2])
            @SCIP_CALL UNARY_OPS_LOOKUP[op](scip, expr__, child, C_NULL, C_NULL)
        elseif op == :sqrt
            child = push_expr!(nonlin, scip, vars, expr.args[2])
            @SCIP_CALL SCIPcreateExprPow(scip, expr__, child, 0.5, C_NULL, C_NULL)

        elseif op == :/
            @assert num_children == 2
            # Transform L / R => L * R^-1.0
            # Create left and right subexpression.
            left = push_expr!(nonlin, scip, vars, expr.args[2])
            inverse_right_expr = :($(expr.args[3])^-1.0)
            right = push_expr!(nonlin, scip, vars, inverse_right_expr)
            @SCIP_CALL SCIPcreateExprProduct(scip, expr__, num_children, [left, right], 1.0, C_NULL, C_NULL)
        else
            error("Operator $op (in $expr) not supported by SCIP.jl!")
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
        push!(nonlin.vars, v)
    else
        error("Expression $expr not supported by SCIP.jl!")
    end

    # Return this expression to be referenced by parent expressions
    push!(nonlin.exprs, expr__[])
    return expr__[]
end

function push_expr!(nonlin::NonlinExpr, scip::Ptr{SCIP_}, vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}, expr::Number)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)

    value = Cdouble(expr)
    @SCIP_CALL SCIPcreateExprValue(scip, expr__, value, C_NULL, C_NULL)

    # double check whether value was saved correctly
    @assert SCIPisExprValue(scip, expr__[]) == 1
    push!(nonlin.exprs, expr__[])
    return expr__[]
end


"""
Add nonlinear constraint to problem, return cons ref.

    lhs ≤ expression ≤ rhs

# Arguments
- `expr::Expr`: Julia expression of nonlinear function, as given by MOI.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

"""
function add_nonlinear_constraint(scipd::SCIPData, expr::Expr, lhs::Float64, rhs::Float64)
    nonlin = NonlinExpr()

    # convert expression recursively, extract root and variable pointers
    root_expr = push_expr!(nonlin, scipd.scip[], scipd.vars, expr)
    vars = nonlin.vars

    # create expression graph object
    # create and add cons_nonlinear
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicNonlinear(scipd, cons__, "", root_expr, lhs, rhs)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])

    # register and return cons ref
    return store_cons!(scipd, cons__)
end
