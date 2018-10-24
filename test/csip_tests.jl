# Translation of tests from CSIP wrapper

@testset "LP" begin
    s = SCIPSolver("display/verblevel", 0)
    m = Model(solver=s)
    @variable(m, x >= 0)
    @variable(m, y >= 0)
    @constraint(m, 2x + y <= 1.5)
    @objective(m, :Min, -x)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ -0.75
    @test getvalue(x) ≈ 0.75
    @test getvalue(y) ≈ 0.0
end
