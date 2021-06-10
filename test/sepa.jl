using MathOptInterface
const MOI = MathOptInterface

# Test, whether the callback of the separator is called.
@testset "DummySepa (no separation)" begin
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par,val) -> SCIP.set_parameter(inner, par, val))

    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(optimizer,
                       MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
                       MOI.LessThan(1.5))

    # maximize x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add the separator
    sepa = DummySepa.Sepa()
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # the separator is called
    @test sepa.called >= 1

    # free the problem
    finalize(inner)
end


# Test, whether adding cuts in `exec_lp` via `add_cut_sepa` works [1/2].
@testset "AddSingleCut (cut off one optimal solution)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par,val) -> SCIP.set_parameter(inner, par, val))


    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(optimizer,
                       MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
                       MOI.LessThan(1.5))

    # maximize x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add the separator
    varrefs = [SCIP.VarRef(x.value)]
    coefs = [1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end


# Test, whether adding cuts in `exec_lp` via `add_cut_sepa` works [2/2].
@testset "AddSingleCut (cut off another optimal solution)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par,val) -> SCIP.set_parameter(inner, par, val))


    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(optimizer,
                       MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
                       MOI.LessThan(1.5))

    # maximize x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add the separator
    varrefs = [SCIP.VarRef(y.value)]
    coefs = [1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end


# Test, whether we can cut the optimal solution.
@testset "AddSingleCut (too strong cut)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par,val) -> SCIP.set_parameter(inner, par, val))


    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.ZeroOne())
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(optimizer,
                       MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
                       MOI.LessThan(1.5))

    # maximize x + y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # add the separator
    varrefs = [SCIP.VarRef(x.value), SCIP.VarRef(y.value)]
    coefs = [1.0, 1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # SCIP found the non-optimal solution, that remains after the cut.
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end
