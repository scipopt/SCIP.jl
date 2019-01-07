using MathOptInterface
const MOI = MathOptInterface

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex
const SVF = MOI.SingleVariable

function var_bounds(o::SCIP.Optimizer, vi::VI)
    return MOI.get(o, MOI.ConstraintSet(), CI{SVF,MOI.Interval{Float64}}(vi.value))
end

@testset "Binary variables and explicit bounds" begin
    optimizer = SCIP.Optimizer()

    # Should work: binary variable without explicit bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Should work: binary variable with [0, 1] bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Should work: binary variable with [0, 1] bounds (order should not matter)
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Should work: binary variable fixed to 0.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Should work: binary variable fixed to 0 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Should work: binary variable fixed to 1.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Should work: binary variable fixed to 1 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Is an error: binary variable with too wide bounds.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))
    @test_throws ErrorException t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())

    # Is an error: binary variable with too wide bounds (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test_throws ErrorException b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))

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
