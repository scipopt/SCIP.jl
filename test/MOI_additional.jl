using MathOptInterface
const MOI = MathOptInterface

@testset "Binary variables and bounds" begin
    optimizer = SCIP.Optimizer()

    # Should work: binary variable no explicit bounds
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

end
