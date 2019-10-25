using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false,
                               infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    # remember reason for excluded tests:
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear7",  # needs MOI.VectorAffineFunction
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
        "linear15", # needs MOI.VectorAffineFunction
        "partial_start", # TODO: supportVariablePrimalStart
    ]
    # MOIT.contlineartest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.linear2test(OPTIMIZER, CONFIG)
    MOIT.linear3test(OPTIMIZER, CONFIG)
    MOIT.linear4test(OPTIMIZER, CONFIG)
    MOIT.linear6test(OPTIMIZER, CONFIG)
    MOIT.linear8atest(OPTIMIZER, CONFIG)
    MOIT.linear8btest(OPTIMIZER, CONFIG)
    MOIT.linear8ctest(OPTIMIZER, CONFIG)
    MOIT.linear9test(OPTIMIZER, CONFIG)
    MOIT.linear10test(OPTIMIZER, CONFIG)
    MOIT.linear10btest(OPTIMIZER, CONFIG)
    MOIT.linear12test(OPTIMIZER, CONFIG)
end

@testset "MOI Quadratic Constraint" begin
    # remember reason for excluded tests:
    excluded = [
        "qcp1", # needs VectorAffineFunction
    ]
    # MOIT.qcptest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.qcp2test(OPTIMIZER, CONFIG)
    MOIT.qcp3test(OPTIMIZER, CONFIG)
    MOIT.qcp4test(OPTIMIZER, CONFIG)

    MOIT.ncqcp1test(OPTIMIZER, CONFIG)
    MOIT.ncqcp2test(OPTIMIZER, CONFIG)
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
    @test MOI.supports_constraint(model, MOI.SingleVariable, MOI.ZeroOne)
    @test MOI.supports_constraint(model, MOI.SingleVariable, MOI.Interval{Float64})
    @test MOI.supports_constraint(model, MOI.ScalarAffineFunction{Float64}, MOI.Interval{Float64})
    @test MOI.supports_constraint(model, MOI.VectorAffineFunction{Float64}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, MOI.LessThan{Float64}})
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
    iset1 = MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(7.0))
    MOI.add_constraint(model, f1, iset1)

    f2 = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, z2)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(0.2, x1)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
        ],
        [0.0, 1.0],
    )
    iset2 = MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(10.0))

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

    if config.solve
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
end

@testset "MOI Integer Linear" begin
    # MOIT.intlineartest(OPTIMIZER, CONFIG)

    # call individual tests
    MOIT.knapsacktest(OPTIMIZER, CONFIG)
    MOIT.int1test(OPTIMIZER, CONFIG)
    MOIT.int2test(OPTIMIZER, CONFIG)
    MOIT.int3test(OPTIMIZER, CONFIG)
    MOIT.indicator1_test(OPTIMIZER, CONFIG)
    MOIT.indicator2_test(OPTIMIZER, CONFIG)
    indicator4_test(OPTIMIZER, CONFIG)
    # MOIT.indicator3_test(OPTIMIZER, CONFIG) # no support for ACTIVATE_ON_ZERO
end
