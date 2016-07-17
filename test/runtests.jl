using SCIP
using MathProgBase
using FactCheck

facts("solve LP with linprog") do
    # min -x
    # s.t. 2x + y <= 1.5
    # x,y >= 0
    # solution is (0.75,0) with objval -0.75

    solver = SCIPSolver()

    sol = linprog([-1,0], [2 1], '<', 1.5, solver)
    @fact sol.status --> :Optimal
    @fact sol.objval -->  roughly(-0.75)
    @fact sol.sol --> roughly([0.75, 0.0])

    sol = linprog([-1,0], sparse([2 1]), '<', 1.5, solver)
    @fact sol.status --> :Optimal
    @fact sol.objval --> roughly(-0.75)
    @fact sol.sol --> roughly([0.75, 0.0])
end
