using MathOptInterface
const MOI = MathOptInterface


# Test, whether the cut callback is actually called and whether
# `callback_value` works as intended.
@testset "obtaining the LP-solution" begin
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

    calls = 0
    x_val::Float64 = -1
    y_val::Float64 = -1
    function cutcallback(cb_data)
        x_val = MOI.get(optimizer,
                        MOI.CallbackVariablePrimal{SCIP.CutCbData}(cb_data),
                        x)
        y_val = MOI.get(optimizer,
                        MOI.CallbackVariablePrimal{SCIP.CutCbData}(cb_data),
                        y)
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # The cut callback was called and obtaining the LP-solution worked.
    @test calls >= 1
    @test x_val + y_val >= 1.0 - min(atol, 1.0 * rtol)

    # SCIP found an optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end

# Test, whether adding cuts within cut callbacks via `submit` works [1/2].
@testset "cutting one optimal solution" begin
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

    calls = 0
    function cutcallback(cb_data)
        MOI.submit(optimizer, MOI.UserCut{SCIP.CutCbData}(cb_data),
                   MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0], [x]), 0.0),
                   MOI.LessThan(0.0))
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # The cut callback was called.
    @test calls >= 1

    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end

# Test, whether adding cuts within cut callbacks via `submit` works [2/2].
@testset "cutting another optimal solution" begin
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

    calls = 0
    function cutcallback(cb_data)
        MOI.submit(optimizer, MOI.UserCut{SCIP.CutCbData}(cb_data),
                   MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0], [y]), 0.0),
                   MOI.LessThan(0.0))
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # The cut callback was called.
    @test calls >= 1

    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol

    # free the problem
    finalize(inner)
end
