
# Mapping from Julia (as given by MOI) to SCIP operators
const OPMAP = Dict{Symbol, SCIP_ExprOp}(
    :+ => SCIP_EXPR_SUM,
    :* => SCIP_EXPR_PRODUCT,
    :- => SCIP_EXPR_MINUS,
    :/ => SCIP_EXPR_DIV,
    :^ => SCIP_EXPR_REALPOWER,
    :sqrt => SCIP_EXPR_SQRT,
    :exp => SCIP_EXPR_EXP,
    :log => SCIP_EXPR_LOG,
)

"""Subexpressions and variables referenced in an expression tree.

Used to convert Julia expression to SCIP expression using recursive calls to the
mutating push_expr!.
"""
mutable struct NonlinExpr
    vars::Vector{Ptr{SCIP_VAR}}
end

"Extract operators from Julia expr recursively and convert to SCIP expressions."
function push_expr!(nonlin::NonlinExpr, mscip::ManagedSCIP, expr::Expr)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)
    num_children = length(expr.args) - 1

    if Meta.isexpr(expr, :comparison) # range constraint
        # args: [lhs, <=, mid, <=, rhs], lhs and rhs constant
        @assert length(expr.args) == 5
        @assert expr.args[2][1] == expr.args[4][1] == :<=

        # just call on middle expression, bounds are handled outside
        return push_expr!(nonlin, mscip, expr.args[3])

    elseif Meta.isexpr(expr, :call) # operator
        op = expr.args[1]
        if op in [:(==), :<=, :>=]
            # args: [op, lhs, rhs], rhs constant
            @assert length(expr.args) == 3

            # just call on lhs expression, bounds are handled outside
            return push_expr!(nonlin, mscip, expr.args[2])

        elseif op == :^
            # Special case: power with constant exponent.
            # The Julia expression considers the base and exponent to be
            # subexpressions. SCIP does in principle support constant
            # expressions, but in the case of SCIP_EXPR_REALPOWER, the exponent
            # value is stored directly, as the second child.
            @assert num_children == 2

            # Base (first child) is proper sub-expression.
            base = push_expr!(nonlin, mscip, expr.args[2])

            # Exponent (second child) is stored as value.
            @assert isa(expr.args[3], Number)
            exponent = Cdouble(expr.args[3])

            # Create SCIP expression
            @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, OPMAP[op], base, exponent)

        elseif op == :- && num_children == 1
            # Special case: unary version of minus. SCIP only supports binary
            # minus, so we will represent it as :(0 - child).

            # First, insert constant 0 subexpression:
            left = push_expr!(nonlin, mscip, 0.0)

            # Then, insert the actual subexpression:
            right = push_expr!(nonlin, mscip, expr.args[2])

            # Finally, add the (binary) minus:
            @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, OPMAP[op], left, right)

        elseif op in [:sqrt, :exp, :log]
            # Unary operators
            @assert num_children == 1

            # Insert child expression:
            child = push_expr!(nonlin, mscip, expr.args[2])

            # Add this operator on top
            @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, OPMAP[op], child)

        elseif op in [:-, :/]
            # Binary operators
            @assert num_children == 2

            # Create left and right subexpression.
            left = push_expr!(nonlin, mscip, expr.args[2])
            right = push_expr!(nonlin, mscip, expr.args[3])

            @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, OPMAP[op], left, right)

        elseif op in [:+, :*]
            # N-ary operators
            @assert num_children >= 1

            # Create all children
            children = Ptr{SCIP_EXPR}[]
            for subexpr in expr.args[2:end]
                child = push_expr!(nonlin, mscip, subexpr)
                push!(children, child)
            end
            @assert length(children) == num_children

            @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, OPMAP[op], Cint(num_children), children)

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
        v = var(mscip, vr)

        # 0-based indexing for SCIP
        op = SCIP_EXPR_VARIDX
        @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, op, Cint(length(nonlin.vars)))
        push!(nonlin.vars, v)

    else
        error("Expression $expr not supported by SCIP.jl!")
    end

    # Return this expression to be referenced by parent expressions
    return expr__[]
end

function push_expr!(nonlin::NonlinExpr, mscip::ManagedSCIP, expr::Number)
    # Storage for SCIP_EXPR*
    expr__ = Ref{Ptr{SCIP_EXPR}}(C_NULL)

    op = SCIP_EXPR_CONST
    value = Cdouble(expr)

    @SC SCIPexprCreate(SCIPblkmem(mscip), expr__, op, value)

    # double check whether value was saved correctly
    value_stored = SCIPexprGetOpReal(expr__[])
    if value != value_stored
        error("Failed to create SCIP_EXPR / $(op):\n" *
              "passed in constant value $(value),\n" *
              "retrieved $(value_stored) instead,\n" *
              "in expression stored at $(expr__[]).")
    end

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
function add_nonlinear_constraint(mscip::ManagedSCIP, expr::Expr, lhs::Float64, rhs::Float64)
    nonlin = NonlinExpr([])

    # convert expression recursively, extract root and variable pointers
    root = push_expr!(nonlin, mscip, expr)
    vars = nonlin.vars

    # create expression graph object
    tree__ = Ref{Ptr{SCIP_EXPRTREE}}(C_NULL)
    @SC SCIPexprtreeCreate(SCIPblkmem(mscip), tree__, root, length(vars), 0, C_NULL)
    @SC SCIPexprtreeSetVars(tree__[], length(vars), vars)

    # create and add cons_nonlinear
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicNonlinear(mscip, cons__, "", 0, C_NULL, C_NULL,
                                     1, tree__, C_NULL, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])

    # free memory
    @SC SCIPexprtreeFree(tree__)

    # register and return cons ref
    return store_cons!(mscip, cons__)
end
