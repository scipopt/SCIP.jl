# todo: find a meaningful name for this file
facts("testing more mpb interface methods") do
    m = MathProgBase.LinearQuadraticModel(SCIPSolver("display/verblevel", 0))

    # take a bit more time integer problem
    A = [314 867 860; 87 875 -695]
    l = [-10, -1000, -1000]
    u = [Inf Inf Inf]
    c = [-1,1,1]
    lb = [40600 -92375]
    ub = lb
    MathProgBase.loadproblem!(m, A, l, u, c, lb, ub, :Min)
    @fact MathProgBase.numconstr(m) --> 2
    @fact MathProgBase.numvar(m) --> 3

    MathProgBase.setvartype!(m, [:Int, :Int, :Int])
    MathProgBase.optimize!(m)
    @fact MathProgBase.status(m) --> :Optimal
    @fact MathProgBase.getsolvetime(m) --> greater_than(0.1)
    @fact MathProgBase.getsolution(m) --> roughly([750, -200, -25])
end
