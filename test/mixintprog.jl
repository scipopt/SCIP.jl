facts("solving MIP with mixintprog") do
    solver = SCIPSolver("display/verblevel", 0)

    # integer knapsack problem
    sol = mixintprog(-[5,3,2,7,4],Float64[2 8 4 2 5],'<',10,:Int,0,1,solver)
    @fact sol.status --> :Optimal
    @fact sol.objval --> roughly(-16.0)
    @fact sol.sol --> roughly([1.0, 0.0, 0.0, 1.0, 1.0])
end
