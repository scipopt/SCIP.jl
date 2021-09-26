using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG_DIRECT = MOIT.Config(
    atol=1e-5, rtol=1e-5,
    exclude=Any[
        MOI.ConstraintDual, MOI.ConstraintName, MOI.VariableName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
    ],
)

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(excluded, [
            "test_linear_integer_solve_twice",
            "test_linear_integration",
    ])
    MOIT.runtests(
        OPTIMIZER,
        CONFIG_DIRECT,
        warn_unsupported=false,
        exclude = excluded,
    )

end

function indicator4_test(model::MOI.ModelLike, config)
    atol = config.atol
    rtol = config.rtol
    # equivalent to indicator1_test with left-hand-side partially in LHS constant
    # linear problem with indicator constraint and
    # max  2x1 + 3x2
    # s.t. x1 + x2 <= 10
    #      z1 ==> x2 - 1 <= 7
    #      z2 ==> x2 + x1/5 + 1 <= 10
    #      z1 + z2 >= 1


    MOI.empty!(model)
    @test MOI.is_empty(model)

    @test MOI.supports(model, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}())
    @test MOI.supports(model, MOI.ObjectiveSense())
    @test MOI.supports_constraint(model, MOI.VariableIndex, MOI.ZeroOne)
    @test MOI.supports_constraint(model, MOI.VariableIndex, MOI.Interval{Float64})
    @test MOI.supports_constraint(model, MOI.ScalarAffineFunction{Float64}, MOI.Interval{Float64})
    @test MOI.supports_constraint(model, MOI.VectorAffineFunction{Float64}, MOI.Indicator{MOI.ACTIVATE_ON_ONE, MOI.LessThan{Float64}})
    x1 = MOI.add_variable(model)
    x2 = MOI.add_variable(model)
    z1 = MOI.add_variable(model)
    z2 = MOI.add_variable(model)
    MOI.add_constraint(model, z1, MOI.ZeroOne())
    MOI.add_constraint(model, z2, MOI.ZeroOne())
    f1 = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, z1)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
        ],
        [0.0, -1.0]
    )
    iset1 = MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(7.0))
    MOI.add_constraint(model, f1, iset1)

    f2 = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, z2)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(0.2, x1)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
        ],
        [0.0, 1.0],
    )
    iset2 = MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(10.0))

    MOI.add_constraint(model, f2, iset2)

    # Additional regular constraint.
    MOI.add_constraint(model,
        MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x1), MOI.ScalarAffineTerm(1.0, x2)], 0.0),
        MOI.LessThan(10.0),
    )

    # Disjunction z1 ⋁ z2
    MOI.add_constraint(model,
        MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, z1), MOI.ScalarAffineTerm(1.0, z2)], 0.0),
        MOI.GreaterThan(1.0),
    )

    MOI.set(model, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 3.0], [x1, x2]), 0.0)
    )
    MOI.set(model, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    @test MOI.get(model, MOI.TerminationStatus()) == MOI.OPTIMIZE_NOT_CALLED

    MOI.optimize!(model)

    @test MOI.get(model, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(model, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(model, MOI.ObjectiveValue()) ≈ 28.75 atol=atol rtol=rtol
    @test MOI.get(model, MOI.VariablePrimal(), x1) ≈ 1.25 atol=atol rtol=rtol
    @test MOI.get(model, MOI.VariablePrimal(), x2) ≈ 8.75 atol=atol rtol=rtol
    @test MOI.get(model, MOI.VariablePrimal(), z1) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(model, MOI.VariablePrimal(), z2) ≈ 1.0 atol=atol rtol=rtol
end

@testset "MOI Integer Linear" begin
    # replace with MOIT when MathOptInterface.jl#929 merged
    indicator4_test(OPTIMIZER, CONFIG_DIRECT)
end
