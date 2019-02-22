using MathOptInterface
const MOI = MathOptInterface

# Simple evaluator for testing

struct ExprEvaluator <: MOI.AbstractNLPEvaluator
    constraints::Vector{Expr}
end

function MOI.initialize(d::ExprEvaluator, requested_features::Vector{Symbol})
    if requested_features != [:ExprGraph]
        error("Only supports expression graph!")
    end
end

MOI.constraint_expr(evaluator::ExprEvaluator, i) = evaluator.constraints[i]


@testset "linear expressions" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)

    @test MOI.supports(optimizer, MOI.NLPBlock()) == true

    # min. -x
    # s.t. 2x + y <= 1.5
    #      x,y >= 0

    x, y = MOI.add_variables(optimizer, 2)

    # bounds
    MOI.add_constraint(optimizer, x, MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, y, MOI.GreaterThan(0.0))

    # "nonlinear" constraints (x => x[1], y => x[2])
    data = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(-Inf, 1.5)],
        ExprEvaluator([:(2 * x[1] + x[2])]),
        false # no objective
    )
    MOI.set(optimizer, MOI.NLPBlock(), data)

    # objective
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([-1.0], [x]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    # solve
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ -0.75 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.75 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
end

@testset "pot pourri" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)

    @test MOI.supports(optimizer, MOI.NLPBlock()) == true

    num_vars = 17
    vars = MOI.add_variables(optimizer, num_vars)
    for i in 1:num_vars
        MOI.add_constraint(optimizer, vars[i], MOI.Interval(0.1, 10.0))
    end

    # Nonlinear equations.
    expressions = Expr[
        :(x[1] + 0.5),          # VARIDX / CONSTANT
        :(x[2] - x[3]),         # MINUS (binary)
        :(-x[4] + 4.0),         # MINUS (unary)
        :(x[5] + x[6] + x[7]),  # SUM
        :(x[8] * x[9] * x[10]), # PRODUCT
        :((x[11] + x[12])^0.8), # REALPOWER
        :(x[13] / x[14]),       # DIV
        :(sqrt(x[15])),         # SQRT
        :(exp(x[16])),          # EXP
        :(log(x[17])),          # LOG
    ]
    rhs = 2.0

    data = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(rhs, rhs) for i in 1:length(expressions)],
        ExprEvaluator(expressions),
        false # no objective
    )
    MOI.set(optimizer, MOI.NLPBlock(), data)

    # Solve and get results.
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    sol = MOI.get(optimizer, MOI.VariablePrimal(), vars)

    # Evaluate lhs of all the expressions with solution values.
    values = Float64[]
    for expr in expressions
        @eval lhs(x) = $expr
        push!(values, lhs(sol))
    end
    references = [rhs  for i in 1:length(expressions)]

    atol, rtol = 1e-6, 1e-6
    @test values ≈ references atol=atol rtol=rtol
end
