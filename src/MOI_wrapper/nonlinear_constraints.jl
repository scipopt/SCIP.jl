# Nonlinear constraints (objective not supported)

MOI.supports(::Optimizer, ::MOI.NLPBlock) = true

function MOI.set(o::Optimizer, ::MOI.NLPBlock, data::MOI.NLPBlockData)
    # We don't actually store the data (to be queried later during the solve
    # process). Instead, we extract the expression graphs and add the
    # corresponding constraints to the model directly.
    if data.has_objective
        error("Nonlinear objective not supported by SCIP.jl!")
    end

    MOI.initialize(data.evaluator, [:ExprGraph])
    for i in 1:length(data.constraint_bounds)
        expr = MOI.constraint_expr(data.evaluator, i)
        bounds = data.constraint_bounds[i]
        cr = add_constraint_from_expr(o, expr, bounds.lower, bounds.upper)
        # not registering or returning constraint reference!
    end

    return nothing
end

# Local methods.

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

mutable struct NonlinExpr
    operators::Vector{SCIP_ExprOp}
    offsets::Vector{Int}
    children::Vector{Int}
    values::Vector{Float64}
end

NonlinExpr() = NonlinExpr([], [1], [], [])

"Recursively extract operators from Julia expr and store in NonlinExpr."
function push_expr!(nonlin::NonlinExpr, expr::Expr)
    if Meta.isexpr(expr, :call) # operator
        op = expr.args[1]
        num_children = length(expr.args) - 1
        children = []

        if op == :^
            # Special case: power with constant exponent.
            # The Julia expression considers the base and exponent to be
            # subexpressions. SCIP does in principle support constant
            # expressions, but in the case of SCIP_EXPR_REALPOWER, the exponent
            # value is stored directly, as the second child.
            @assert num_children == 2

            # Base is proper sub-expression.
            index = push_expr!(nonlin, expr.args[2])
            push!(children, index)

            # Exponent is stored as value.
            push!(nonlin.values, Float64(expr.args[3]))
            push!(children, length(nonlin.values))
        elseif op == :- && num_children == 1
            # Special case: unary version of minus. SCIP only supports binary
            # minus, so we will represent it as :(0 - child).

            # Insert constant 0 subexpression:
            index = push_expr!(nonlin, 0.0)
            push!(children, index)

            # Insert the actual subexpression:
            index = push_expr!(nonlin, expr.args[2])
            push!(children, index)

            # Adjust number of children:
            num_children = 2
        else
            # General case: handle all children recursively.
            for child in expr.args[2:end]
                index = push_expr!(nonlin, child)
                push!(children, index)
            end
        end

        # Push this operator (head of expr) on top
        push!(nonlin.operators, OPMAP[op])
        append!(nonlin.children, children)
        push!(nonlin.offsets, nonlin.offsets[end] + num_children)
    elseif Meta.isexpr(expr, :ref) # variable
        @assert expr.args[1] == :x
        push!(nonlin.operators, SCIP_EXPR_VARIDX)
        push!(nonlin.children, expr.args[2])
        push!(nonlin.offsets, nonlin.offsets[end] + 1)
    else # unhandled
        error("Can not handle expression: $expr!")
    end

    # position of this operator
    return length(nonlin.operators)
end

function push_expr!(nonlin::NonlinExpr, expr::Number)
    push!(nonlin.operators, SCIP_EXPR_CONST)
    push!(nonlin.values, Float64(expr))
    push!(nonlin.children, length(nonlin.values))
    push!(nonlin.offsets, nonlin.offsets[end] + 1)

    # position of this operator
    return length(nonlin.operators)
end

"Add nonlinear constraint from Julia expr and range bounds."
function add_constraint_from_expr(o::Optimizer, expr::Expr, lhs::Float64, rhs::Float64)
    nonlin = NonlinExpr()
    push_expr!(nonlin, expr)
    cr = add_nonlinear_constraint(o.mscip, nonlin.operators, nonlin.offsets,
                                  nonlin.children, nonlin.values, lhs, rhs)
    return cr
end
