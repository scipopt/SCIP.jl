using MathOptInterface
const MOI = MathOptInterface

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex
const SVF = MOI.SingleVariable

function var_bounds(o::SCIP.Optimizer, vi::VI)
    return MOI.get(o, MOI.ConstraintSet(), CI{SVF,MOI.Interval{Float64}}(vi.value))
end

function chg_bounds(o::SCIP.Optimizer, vi::VI, set::S) where S
    ci = CI{SVF,S}(vi.value)
    MOI.set(o, MOI.ConstraintSet(), ci, set)
    return nothing
end

@testset "Binary variables and explicit bounds" begin
    optimizer = SCIP.Optimizer()

    # Binary variable without explicit bounds.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test_throws KeyError var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable with [0, 1] bounds.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable with [0, 1] bounds (order should not matter).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable fixed to 0.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Binary variable fixed to 0 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Binary variable fixed to 1.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Binary variable fixed to 1 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Tightened bounds for binary variable
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)

    # Tightened bounds for binary variable (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)

    # Is an error: binary variable with conflicting bounds (infeasible).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test_throws ErrorException t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())

    # Is an error: binary variable with conflicting bounds (infeasible, different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test_throws ErrorException b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
end

@testset "Bound constraints for a general variable." begin
    optimizer = SCIP.Optimizer()
    inf = SCIP.SCIPinfinity(SCIP.scip(optimizer))

    # Should work: variable without explicit bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, inf)

    # Should work: variable with range bounds, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.Interval(3.0, 4.0))

    # Should work: variable with lower bound, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.GreaterThan(3.0))

    # Should work: variable with lower bound, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.LessThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 2.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))

    # Should work: fixed variable, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 2.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.EqualTo(3.0))

    # Mixed constraint types will fail!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    lb = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test_throws ErrorException ub = MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))
end

@testset "Changing bounds for variable." begin
    optimizer = SCIP.Optimizer()
    inf = SCIP.SCIPinfinity(SCIP.scip(optimizer))

    # change interval bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
    chg_bounds(optimizer, x, MOI.Interval(4.0, 5.0))
    @test var_bounds(optimizer, x) == MOI.Interval(4.0, 5.0)

    # change lower bound
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    chg_bounds(optimizer, x, MOI.GreaterThan(4.0))
    @test var_bounds(optimizer, x) == MOI.Interval(4.0, inf)

    # change upper bound
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 3.0)
    chg_bounds(optimizer, x, MOI.LessThan(5.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 5.0)

    # change fixed value
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(2.5))
    @test var_bounds(optimizer, x) == MOI.Interval(2.5, 2.5)
    chg_bounds(optimizer, x, MOI.EqualTo(4.5))
    @test var_bounds(optimizer, x) == MOI.Interval(4.5, 4.5)

    # change mixed
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    chg_bounds(optimizer, x, MOI.LessThan(4.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 4.0)
end

@testset "Second Order Cone Constraint" begin
    # Derived from MOI's problem SOC1
    # max 0x + 1y + 1z
    #  st  x            == 1
    #      x >= ||(y,z)||

    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)

    @test MOI.supports_constraint(optimizer, MOI.VectorOfVariables, MOI.SecondOrderCone)

    x, y, z = MOI.add_variables(optimizer, 3)

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,1.0], [y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    ceq = MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.EqualTo(1.0))
    csoc = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y, z]),
                              MOI.SecondOrderCone(3))

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-3, 1e-3
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ √2 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1/√2 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1/√2 atol=atol rtol=rtol
end

@testset "Second Order Cone Constraint (infeasible)" begin
    # Problem SOC3 - Infeasible
    # min 0
    # s.t. y ≥ 2
    #      x ≤ 1
    #      |y| ≤ x

    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)

    x, y = MOI.add_variables(optimizer, 2)

    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.Interval(0.0, 1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.GreaterThan(2.0))
    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y]), MOI.SecondOrderCone(2))

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
end

@testset "Second Order Cone Constraint (error with unbounded variable)" begin
    optimizer = SCIP.Optimizer()
    x, y = MOI.add_variables(optimizer, 2)
    @test_throws ErrorException MOI.add_constraint(
        optimizer, MOI.VectorOfVariables([x, y]), MOI.SecondOrderCone(2))

    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y]),
                       MOI.SecondOrderCone(2))
    # no error
end

@testset "SOS1" begin
    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.LessThan(1.0))

    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x,y,z]), MOI.SOS1([1.0,2.0,3.0]))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,2.0,3.0], [x,y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 3.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol=atol rtol=rtol
end

@testset "SOS2" begin
    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.LessThan(1.0))

    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x,y,z]), MOI.SOS2([1.0,2.0,3.0]))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,2.0,3.0], [x,y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 5.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol=atol rtol=rtol
end

@testset "abspower" begin
    # max.  x1 - x2
    # s.t.  z1 = sign(x1)*abs(x1)^2
    #       z2 = sign(x2)*abs(x2)^3
    #       z1 ≤ 4, z2 ≥ -8

    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)

    x1, x2, z1, z2 = MOI.add_variables(optimizer, 4)
    MOI.add_constraint(optimizer, MOI.SingleVariable(z1), MOI.LessThan(4.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z2), MOI.GreaterThan(-8.0))

    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x1, z1]),
                       SCIP.AbsolutePowerSet(2.0))
    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x2, z2]),
                       SCIP.AbsolutePowerSet(3.0))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, -1.0], [x1, x2]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 4.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x1) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z1) ≈ 4.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x2) ≈ -2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z2) ≈ -8.0 atol=atol rtol=rtol
end

@testset "deleting variables" begin
    optimizer = SCIP.Optimizer()

    # add variable and constraint
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(optimizer, MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0), MOI.EqualTo(0.0))
    @test !MOI.is_empty(optimizer)

    # delete them (constraint first!)
    MOI.delete(optimizer, c)
    MOI.delete(optimizer, x)
    @test MOI.is_empty(optimizer)

    # add variable and constraint (again)
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(optimizer, MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0), MOI.EqualTo(0.0))
    @test !MOI.is_empty(optimizer)

    # fail to delete them in wrong order
    @test_throws ErrorException MOI.delete(optimizer, x)
end
