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
        ExprEvaluator([:(2 * x[$x] + x[$y] <= 1.5)]),
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
    x = MOI.add_variables(optimizer, num_vars)
    for i in 1:num_vars
        MOI.add_constraint(optimizer, x[i], MOI.Interval(0.1, 10.0))
    end

    # Nonlinear equations.
    rhs = 2.0
    expressions = Expr[
        :(x[$(x[1])] + 0.5                      == rhs), # VARIDX / CONSTANT
        :(x[$(x[2])] - x[$(x[3])]               == rhs), # MINUS (binary)
        :(-x[$(x[4])] + 4.0                     == rhs), # MINUS (unary)
        :(x[$(x[5])] + x[$(x[6])] + x[$(x[7])]  == rhs), # SUM
        :(x[$(x[8])] * x[$(x[9])] * x[$(x[10])] == rhs), # PRODUCT
        :((x[$(x[11])] + x[$(x[12])])^0.8       == rhs), # REALPOWER
        :(x[$(x[13])] / x[$(x[14])]             == rhs), # DIV
        :(sqrt(x[$(x[15])])                     == rhs), # SQRT
        :(exp(x[$(x[16])])                      == rhs), # EXP
        :(log(x[$(x[17])])                      == rhs), # LOG
    ]

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
    sol = MOI.get(optimizer, MOI.VariablePrimal(), x)

    # Evaluate lhs of all the expressions with solution values.
    atol, rtol = 1e-6, 1e-6
    @test sol[1] + 0.5              ≈ rhs  atol=atol rtol=rtol
    @test sol[2] - sol[3]           ≈ rhs  atol=atol rtol=rtol
    @test -sol[4] + 4.0             ≈ rhs  atol=atol rtol=rtol
    @test sol[5] + sol[6] + sol[7]  ≈ rhs  atol=atol rtol=rtol
    @test sol[8] * sol[9] * sol[10] ≈ rhs  atol=atol rtol=rtol
    @test (sol[11] + sol[12])^0.8   ≈ rhs  atol=atol rtol=rtol
    @test sol[13] / sol[14]         ≈ rhs  atol=atol rtol=rtol
    @test sqrt(sol[15])             ≈ rhs  atol=atol rtol=rtol
    @test exp(sol[16])              ≈ rhs  atol=atol rtol=rtol
    @test log(sol[17])              ≈ rhs  atol=atol rtol=rtol
end
