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

modelPath = joinpath(dirname(@__FILE__), "model")

@testset "test writeproblem" begin
    m = Model(solver=SCIPSolver("display/verblevel", 0))
    @variable(m, x >= 2)
    @constraint(m, 3x <= 40)
    @objective(m, :Max, 5x)
    solve(m)

    cipfname = modelPath * "test.cip"
    MathProgBase.writeproblem(internalmodel(m), cipfname)

    cipstr = String[
        "STATISTICS",
        "  Problem name     : name",
        "  Variables        : 1 (0 binary, 0 integer, 0 implicit integer, 1 continuous)",
        "  Constraints      : 1 initial, 1 maximal",
        "OBJECTIVE",
        "  Sense            : maximize",
        "VARIABLES",
        "  [continuous] <_var0_>: obj=5, original bounds=[2,+inf]",
        "CONSTRAINTS",
        "  [linear] <lincons>:  +3<_var0_>[C] <= 40;",
        "END"]

    open(cipfname) do file
        lineno = 1
        while !eof(file)
            line = readline(file)
            @test strip(line) == strip(cipstr[lineno])
            lineno += 1
        end
    end
end

@testset "test_#49_initialsol_nlp" begin
    m = Model(solver=SCIPSolver("display/verblevel", 0,
                                "heuristics/trivial/freq", -1,
                                "limits/solutions", 1))

    @variable(m, 0 <= x[1:3] <= 10, start=5.0)
    @variable(m, y, Bin, start=1.0)

    @NLconstraint(m, x[1] + x[2] <= x[3]*y)
    @constraint(m, x[1] - x[2] == 0)

    @objective(m, Min, x[1])

    # This makes the initial point feasible
    setvalue(x[3], 10.0)

    solve(m)

    @test getvalue(x)[3] == 10.0
end

@testset "test_incomplete_warmstart" begin
    m = Model(solver=SCIPSolver(#"display/verblevel", 0,
                                "heuristics/trivial/freq", -1,
                                "limits/solutions", 1))

    @variable(m, 0 <= x <= 2, Int, start=1.0)
    @variable(m, 0 <= y <= 2)

    @constraint(m, x + y == 2)

    @objective(m, Max, x + 2y)

    solve(m)

    @test getvalue(x) ≈ 1.0
    @test getvalue(y) ≈ 1.0
end
