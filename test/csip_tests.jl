# Translation of tests from CSIP wrapper

solver = SCIPSolver("display/verblevel", 0)

@testset "LP" begin
    m = Model(solver=solver)
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

@testset "MIP" begin
    m = Model(solver=solver)
    @variable(m, x[1:5], Bin)
    @constraint(m, 2x[1] + 8x[2] + 4x[3] + 2x[4] + 5x[5] <= 10)
    @objective(m, :Min, -5x[1] - 3x[2] - 2x[3] - 7x[4] - 4x[5])

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ -16.0
    @test getvalue(x) ≈ [1.0, 0.0, 0.0, 1.0, 1.0]
end

@testset "MIP2 (unbounded)" begin
    m = Model(solver=solver)
    @variable(m, x, Int)
    @objective(m, :Min, x)

    status = solve(m, suppress_warnings=true)
    @test status == :Unbounded
end

@testset "MIP3 (infeasible)" begin
    m = Model(solver=solver)
    @variable(m, x, Int)
    @constraint(m, x >= 2)
    @constraint(m, x <= 1)

    status = solve(m, suppress_warnings=true)
    @test status == :Infeasible
end

@testset "SOCP" begin
    m = Model(solver=solver)
    @variable(m, x)
    @variable(m, y)
    @variable(m, t >= 0)
    @constraint(m, x + y >= 1)
    @constraint(m, x^2 + y^2 <= t^2)
    @objective(m, :Min, t)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ sqrt(0.5)  atol=1e-5
    @test getvalue(t) ≈ sqrt(0.5)  atol=1e-5
    @test getvalue(x) ≈ 0.5  atol=1e-5
    @test getvalue(y) ≈ 0.5  atol=1e-5
end

@testset "NLP" begin
    m = Model(solver=solver)
    @variable(m, x <= 0)
    @variable(m, y <= 0)
    @variable(m, z)
    @NLconstraint(m, z^2 <= 1)
    @NLobjective(m, :Max, x + y - z^3)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ 1.0  atol=1e-5
    @test getvalue(x) ≈ 0.0  atol=1e-5
    @test getvalue(y) ≈ 0.0  atol=1e-5
    @test getvalue(z) ≈ -1.0  atol=1e-5
end

@testset "NLP (no objective)" begin
    m = Model(solver=solver)
    @variable(m, z)
    @NLconstraint(m, z^2 <= 1)

    status = solve(m)
    @test status == :Optimal
    @test getvalue(z)^2 <= 1.0 + 1e-5
end

@testset "quad obj" begin
    m = Model(solver=solver)
    @variable(m, x)
    @variable(m, y)
    @constraint(m, x + y >= 1)
    @objective(m, :Min, x^2 + y^2)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ 0.5  atol=1e-5
    @test getvalue(x) ≈ 0.5  atol=1e-5
    @test getvalue(y) ≈ 0.5  atol=1e-5
end

@testset "lazy" begin
    m = Model(solver=solver)
    @variable(m, x <= 2)
    @variable(m, y <= 2)
    @objective(m, :Max, 0.5x + y)

    function lazycb(cb)
        if getvalue(x) + getvalue(y) > 3.0
            @lazyconstraint(cb, x + y <= 3)
        end
    end
    addlazycallback(m, lazycb)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ 2.5  atol=1e-5
    @test getvalue(x) ≈ 1.0  atol=1e-5
    @test getvalue(y) ≈ 2.0  atol=1e-5
end

@testset "lazy2 (integer)" begin
    m = Model(solver=solver)
    @variable(m, x <= 100.5, Int)
    @objective(m, :Min, -x)

    function lazycb(cb)
        if getvalue(x) > 10.5
            @lazyconstraint(cb, x <= 10.5)
        end
    end
    addlazycallback(m, lazycb)

    status = solve(m)
    @test status == :Optimal
    @test getobjectivevalue(m) ≈ -10.0  atol=1e-5
    @test getvalue(x) ≈ 10.0  atol=1e-5
end

@testset "lazy interrupt" begin
    m = Model(solver=solver)
    @variable(m, x >= 1.5, Int)

    function lazycb(cb)
        return JuMP.StopTheSolver
    end
    addlazycallback(m, lazycb)

    status = solve(m)
    @test status == :UserLimit
end

@testset "obj sense" begin
    m = Model(solver=solver)
    @variable(m, -2.3 <= x <= 4.2)
    @objective(m, :Min, x)

    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ -2.3

    # change sense and resolve
    setobjectivesense(m, :Max)
    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ 4.2

    # change sense and resolve
    setobjectivesense(m, :Min)
    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ -2.3
end

@testset "sos1" begin
    m = Model(solver=solver)
    @variable(m, 0 <= x <= 1)
    @variable(m, 0 <= y <= 1)
    @variable(m, 0 <= z <= 1)
    addSOS1(m, [x, y, z])
    @objective(m, :Max, 2x + 3y + 4z)

    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ 0.0
    @test getvalue(y) ≈ 0.0
    @test getvalue(z) ≈ 1.0
end

@testset "sos2" begin
    m = Model(solver=solver)
    @variable(m, 0 <= x <= 1)
    @variable(m, 0 <= y <= 1)
    @variable(m, 0 <= z <= 1)
    addSOS2(m, [x, y, z])
    @objective(m, :Max, 2x + 3y + 4z)

    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ 0.0
    @test getvalue(y) ≈ 1.0
    @test getvalue(z) ≈ 1.0
end

@testset "sos1 & sos2" begin
    m = Model(solver=solver)
    @variable(m, 0 <= x <= 1)
    @variable(m, 0 <= y <= 1)
    @variable(m, 0 <= z <= 1)
    addSOS1(m, [   y, z])
    addSOS2(m, [x, y, z])
    @objective(m, :Max, 2x + 3y + 4z)

    status = solve(m)
    @test status == :Optimal
    @test getvalue(x) ≈ 1.0
    @test getvalue(y) ≈ 1.0
    @test getvalue(z) ≈ 0.0
end
