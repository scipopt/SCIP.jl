using MathOptInterface
const MOI = MathOptInterface

@testset "NaiveAllDiff (two binary vars)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    # add two binary variables: x, y
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # maximize 2x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 1.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraint all-diff(x, y)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)

    alldiffcons = NaiveAllDiff.NADCons([x, y])
    cr = SCIP.add_constraint(optimizer, alldiffch, alldiffcons)

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
end

@testset "NaiveAllDiff (3 bin.vars, 2 pairwise conss)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.ZeroOne())

    # maximize 2x + 3y + 2z
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 3.0, 2.0],
                                                           [x, y, z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraints all-diff(x, y), all-diff(y, x)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)

    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([y, z]))

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 4.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol=atol rtol=rtol
end

@testset "NaiveAllDiff (3 bin.vars, 3 pairwise conss)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.ZeroOne())

    # maximize 2x + 3y + 2z
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 3.0, 2.0],
                                                           [x, y, z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)

    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, z]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([y, z]))

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION

    @test MOI.get(optimizer, MOI.NodeCount()) >= 8  # complete enumeration
end

@testset "NaiveAllDiff (3 bin.vars, 1 cons with all)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.ZeroOne())

    # maximize 2x + 3y + 2z
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 3.0, 2.0],
                                                           [x, y, z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)

    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y, z]))

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION

    @test MOI.get(optimizer, MOI.NodeCount()) >= 8  # complete enumeration
end

@testset "NaiveAllDiff (3 int.vars, 1 cons with all)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    # add three integer variables, in {0, 1, 2}
    x, y, z = MOI.add_variables(optimizer, 3)
    for v in [x, y, z]
        MOI.add_constraint(optimizer, MOI.SingleVariable(v), MOI.Integer())
        MOI.add_constraint(optimizer, MOI.SingleVariable(v), MOI.Interval(0.0, 2.0))
    end

    # maximize 2x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 1.0],
                                                           [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)

    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y, z]))

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 5.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 0.0 atol=atol rtol=rtol
end

@testset "NoGoodCounter (2 binary vars)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0, presolving_maxrounds=0)

    allow_dual_reductions = if SCIP.SCIPmajorVersion() < 7
        MOI.RawParameter("misc/allowdualreds")
    else
        MOI.RawParameter("misc/allowstrongdualreds")
    end
    MOI.set(optimizer, allow_dual_reductions, SCIP.FALSE)

    atol, rtol = 1e-6, 1e-6

    # add binary variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # maximize 2x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([2.0, 1.0],
                                                           [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add constraint handler with constraints
    counter = NoGoodCounter.Counter(optimizer, [x, y])
    SCIP.include_conshdlr(optimizer, counter; needs_constraints=false)

    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION

    @test length(counter.solutions) == 4
end
