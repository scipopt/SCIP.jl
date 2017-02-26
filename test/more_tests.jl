# todo: find a meaningful name for this file
@testset "testing more mpb interface methods" begin
    m = MathProgBase.LinearQuadraticModel(SCIPSolver("display/verblevel", 0))

    # take a bit more time integer problem
    A = [314 867 860; 87 875 -695]
    l = [-10, -1000, -1000]
    u = [Inf Inf Inf]
    c = [-1,1,1]
    lb = [40600 -92375]
    ub = lb
    MathProgBase.loadproblem!(m, A, l, u, c, lb, ub, :Min)
    @test MathProgBase.numconstr(m) == 2
    @test MathProgBase.numvar(m) == 3

    MathProgBase.setvartype!(m, [:Int, :Int, :Int])
    MathProgBase.optimize!(m)
    @test MathProgBase.status(m) == :Optimal
    @test MathProgBase.getsolvetime(m) >= 0.001
    @test MathProgBase.getsolution(m) ≈ [750, -200, -25]
end
