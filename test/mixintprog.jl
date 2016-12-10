@testset "solving MIP with mixintprog" begin
    solver = SCIPSolver("display/verblevel", 0)

    # integer knapsack problem
    sol = mixintprog(-[5,3,2,7,4],Float64[2 8 4 2 5],'<',10,:Int,0,1,solver)
    @test sol.status == :Optimal
    @test sol.objval ≈ -16.0
    @test sol.sol ≈ [1.0, 0.0, 0.0, 1.0, 1.0]
end
