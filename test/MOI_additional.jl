using MathOptInterface
const MOI = MathOptInterface

@testset "Binary variables and explicit bounds" begin
    optimizer = SCIP.Optimizer()

    # Should work: binary variable without explicit bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable with [0, 1] bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable with [0, 1] bounds (order should not matter)
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable fixed to 0.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable fixed to 0 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable fixed to 1.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    @test !MOI.is_empty(optimizer)

    # Should work: binary variable fixed to 1 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test !MOI.is_empty(optimizer)

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
