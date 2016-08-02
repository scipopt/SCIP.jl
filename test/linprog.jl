facts("solve LP with linprog") do
    solver = SCIPSolver("display/verblevel", 0)

    context("feasible LP") do
        # min -x
        # s.t. 2x + y <= 1.5
        # x,y >= 0
        # solution is (0.75,0) with objval -0.75

        sol = linprog([-1,0], [2 1], '<', 1.5, solver)
        @fact sol.status --> :Optimal
        @fact sol.objval -->  roughly(-0.75)
        @fact sol.sol --> roughly([0.75, 0.0])

        sol = linprog([-1,0], sparse([2 1]), '<', 1.5, solver)
        @fact sol.status --> :Optimal
        @fact sol.objval --> roughly(-0.75)
        @fact sol.sol --> roughly([0.75, 0.0])
    end

    context("infeasible LP") do
        # min x
        # s.t. 2x+y <= -1
        # x,y >= 0
        sol = linprog([1,0], [2 1], '<', -1, solver)
        @fact sol.status --> :Infeasible
    end

    context("unbounded LP") do
        # min -x-y
        # s.t. -x+2y <= 0
        # x,y >= 0
        sol = linprog([-1,-1], [-1 2], '<', [0], solver)
        @fact sol.status --> :Unbounded
    end
end
