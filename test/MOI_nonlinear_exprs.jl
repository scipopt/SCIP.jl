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
