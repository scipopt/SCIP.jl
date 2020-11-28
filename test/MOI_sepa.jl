using MathOptInterface
const MOI = MathOptInterface
using JuMP


@testset "MOI Cutcallback (obtaining the LP-solution)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    model = Model(SCIP.Optimizer)
    set_optimizer_attribute(model, "display/verblevel", 0)
    set_optimizer_attribute(model, "presolving/maxrounds", 0)
    set_optimizer_attribute(model, "heuristics/locks/freq", -1)
    set_optimizer_attribute(model, "heuristics/oneopt/freq", -1)
    set_optimizer_attribute(model, "heuristics/simplerounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/rounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/shifting/freq", -1)

    # add variables
    @variable(model, x, Bin)
    @variable(model, y, Bin)
    @constraint(model, x + y <= 1.5)
    @objective(model, Max, x + y)

    calls = 0
    x_val::Float64 = -1
    y_val::Float64 = -1
    function cutcallback(cb_data)
        x_val = callback_value(cb_data, x)
        y_val = callback_value(cb_data, y)
        calls += 1
    end
    MOI.set(model, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    optimize!(model)

    @test calls >= 1
    @test x_val + y_val ≈ 1.5 atol=atol rtol=rtol

    # SCIP found an optimal solution
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT

    @test objective_value(model) ≈ 1.0 atol=atol rtol=rtol
end


@testset "MOI Cutcallback (cutting one optimal solution)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    model = Model(SCIP.Optimizer)
    set_optimizer_attribute(model, "display/verblevel", 0)
    set_optimizer_attribute(model, "presolving/maxrounds", 0)
    set_optimizer_attribute(model, "heuristics/locks/freq", -1)
    set_optimizer_attribute(model, "heuristics/oneopt/freq", -1)
    set_optimizer_attribute(model, "heuristics/simplerounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/rounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/shifting/freq", -1)

    # add variables
    @variable(model, x, Bin)
    @variable(model, y, Bin)
    @constraint(model, x + y <= 1.5)
    @objective(model, Max, x + y)

    calls = 0
    function cutcallback(cb_data)
        con = @build_constraint(x <= 0.0)
        MOI.submit(model, MOI.UserCut(cb_data), con)
        calls += 1
    end
    MOI.set(model, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    optimize!(model)

    @test calls >= 1

    # SCIP found the single remaining optimal solution
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT

    @test objective_value(model) ≈ 1.0 atol=atol rtol=rtol
    @test value(x) ≈ 0.0 atol=atol rtol=rtol
    @test value(y) ≈ 1.0 atol=atol rtol=rtol
end


@testset "MOI Cutcallback (cutting another optimal solution)" begin
    atol, rtol = 1e-6, 1e-6

    # create an empty problem
    model = Model(SCIP.Optimizer)
    set_optimizer_attribute(model, "display/verblevel", 0)
    set_optimizer_attribute(model, "presolving/maxrounds", 0)
    set_optimizer_attribute(model, "heuristics/locks/freq", -1)
    set_optimizer_attribute(model, "heuristics/oneopt/freq", -1)
    set_optimizer_attribute(model, "heuristics/simplerounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/rounding/freq", -1)
    set_optimizer_attribute(model, "heuristics/shifting/freq", -1)

    # add variables
    @variable(model, x, Bin)
    @variable(model, y, Bin)
    @constraint(model, x + y <= 1.5)
    @objective(model, Max, x + y)

    calls = 0
    function cutcallback(cb_data)
        con = @build_constraint(y <= 0.0)
        MOI.submit(model, MOI.UserCut(cb_data), con)
        calls += 1
    end
    MOI.set(model, MOI.UserCutCallback(), cutcallback)

    # solve the problem
    optimize!(model)

    @test calls >= 1

    # SCIP found the single remaining optimal solution
    @test termination_status(model) == MOI.OPTIMAL
    @test primal_status(model) == MOI.FEASIBLE_POINT

    @test objective_value(model) ≈ 1.0 atol=atol rtol=rtol
    @test value(x) ≈ 1.0 atol=atol rtol=rtol
    @test value(y) ≈ 0.0 atol=atol rtol=rtol
end
