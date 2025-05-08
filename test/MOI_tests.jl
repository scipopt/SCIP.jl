# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

module TestMOIWrapper

using Test

import MathOptInterface as MOI
import SCIP

include(joinpath(@__DIR__, "conshdlr_support.jl"))
include(joinpath(@__DIR__, "sepa_support.jl"))

function runtests()
    for name in names(@__MODULE__; all=true)
        if startswith("$name", "test_")
            @testset "$name" begin
                getfield(@__MODULE__, name)()
            end
        end
    end
    return
end

const CONFIG = MOI.Test.Config(;
    atol=5e-3,
    rtol=1e-4,
    exclude=Any[
        MOI.ConstraintDual,
        MOI.DualObjectiveValue,
        MOI.VariableBasisStatus,
        MOI.ConstraintBasisStatus,
    ],
)

function test_runtests_cached()
    model = MOI.Bridges.full_bridge_optimizer(
        MOI.Utilities.CachingOptimizer(
            MOI.Utilities.UniversalFallback(MOI.Utilities.Model{Float64}()),
            SCIP.Optimizer(),
        ),
        Float64,
    )
    MOI.set(model, MOI.Silent(), true)
    MOI.Test.runtests(model, CONFIG)
    return
end

function test_runtests_bridged()
    model = MOI.Bridges.full_bridge_optimizer(SCIP.Optimizer(), Float64)
    MOI.set(model, MOI.Silent(), true)
    # TODO(odow): bugs to fix
    MOI.Test.runtests(model, CONFIG; exclude=[r"^test_model_delete$"])
    return
end

function test_runtests_direct()
    model = SCIP.Optimizer()
    MOI.set(model, MOI.Silent(), true)
    MOI.Test.runtests(model, CONFIG)
    return
end

struct ExprEvaluator <: MOI.AbstractNLPEvaluator
    constraints::Vector{Expr}
end

function MOI.initialize(d::ExprEvaluator, requested_features::Vector{Symbol})
    if requested_features != [:ExprGraph]
        error("Only supports expression graph!")
    end
end

MOI.constraint_expr(evaluator::ExprEvaluator, i) = evaluator.constraints[i]

function test_linear_expressions()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    @test MOI.supports(optimizer, MOI.NLPBlock()) == true
    # min. -x
    # s.t. 2x + y <= 1.5
    #      x,y >= 0
    x, y = MOI.add_variables(optimizer, 2)
    # bounds
    MOI.add_constraint(optimizer, x, MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, y, MOI.GreaterThan(0.0))
    # "nonlinear" constraints (x => x[1], y => x[2])
    data = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(-Inf, 1.5)],
        ExprEvaluator([:(2 * x[$x] + x[$y] <= 1.5)]),
        false, # no objective
    )
    MOI.set(optimizer, MOI.NLPBlock(), data)
    # objective
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([-1.0], [x]), 0.0),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MIN_SENSE)
    # solve
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    atol, rtol = 1e-6, 1e-6
    @test ≈(MOI.get(optimizer, MOI.ObjectiveValue()), -0.75; atol, rtol)
    @test ≈(MOI.get(optimizer, MOI.VariablePrimal(), x), 0.75; atol, rtol)
    @test ≈(MOI.get(optimizer, MOI.VariablePrimal(), y), 0.0; atol, rtol)
    return
end

function test_nonlinear_pot_pourri()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    @test MOI.supports(optimizer, MOI.NLPBlock()) == true
    num_vars = 21
    x = MOI.add_variables(optimizer, num_vars)
    for i in 1:num_vars
        MOI.add_constraint(optimizer, x[i], MOI.Interval(0.1, 10.0))
    end
    # Nonlinear equations.
    rhs = 2.0
    expressions = Expr[
        :(x[$(x[1])] + 0.5 == rhs), # VARIDX / CONSTANT
        :(x[$(x[2])] - x[$(x[3])] == rhs), # MINUS (binary)
        :(-x[$(x[4])] + 4.0 == rhs), # MINUS (unary)
        :(x[$(x[5])] + x[$(x[6])] + x[$(x[7])] == rhs), # SUM
        :(x[$(x[8])] * x[$(x[9])] * x[$(x[10])] == rhs), # PRODUCT
        :((x[$(x[11])])^3 == rhs), # INTPOWER
        :((x[$(x[12])])^0.8 == rhs), # REALPOWER
        :(x[$(x[13])] / x[$(x[14])] == rhs), # DIV
        :(sqrt(x[$(x[15])]) == rhs), # SQRT
        :(exp(x[$(x[16])]) == rhs), # EXP
        :(log(x[$(x[17])]) == rhs), # LOG
        :(abs(x[$(x[18])] - 11) == rhs), # ABS
        :(cos(x[$(x[19])]) + 1 == rhs), # COS
        :(sin(x[$(x[20])]) + 2 == rhs), # SIN
        :(x[$(x[21])] + tan(rand()) / (1 + 1.2^4.2) - 2 * 1 / 4 == rhs), # additional terms
    ]
    data = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(rhs, rhs) for i in 1:length(expressions)],
        ExprEvaluator(expressions),
        false, # no objective
    )
    MOI.set(optimizer, MOI.NLPBlock(), data)
    # Solve and get results.
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    sol = MOI.get(optimizer, MOI.VariablePrimal(), x)
    # Evaluate lhs of all the expressions with solution values.
    atol, rtol = 1e-6, 1e-6
    @test sol[1] + 0.5 ≈ rhs atol = atol rtol = rtol
    @test sol[2] - sol[3] ≈ rhs atol = atol rtol = rtol
    @test -sol[4] + 4.0 ≈ rhs atol = atol rtol = rtol
    @test sol[5] + sol[6] + sol[7] ≈ rhs atol = atol rtol = rtol
    @test sol[8] * sol[9] * sol[10] ≈ rhs atol = atol rtol = rtol
    @test (sol[11])^3 ≈ rhs atol = atol rtol = rtol
    @test (sol[12])^0.8 ≈ rhs atol = atol rtol = rtol
    @test sol[13] / sol[14] ≈ rhs atol = atol rtol = rtol
    @test sqrt(sol[15]) ≈ rhs atol = atol rtol = rtol
    @test exp(sol[16]) ≈ rhs atol = atol rtol = rtol
    @test log(sol[17]) ≈ rhs atol = atol rtol = rtol
    @test abs(sol[18] - 11) ≈ rhs atol = atol rtol = rtol
    @test cos(sol[19]) ≈ 1.0 atol = atol rtol = rtol
    @test sin(sol[20]) ≈ 0.0 atol = atol rtol = rtol
    @test isfinite(sin(sol[21]))
    return
end

function test_add_nonlinear_constraint_after_solve()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    MOI.set(optimizer, MOI.RawOptimizerAttribute("display/verblevel"), 0)
    x, y = MOI.add_variables(optimizer, 2)
    data1 = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(rhs, rhs) for rhs in [1.0, 2.0]],
        ExprEvaluator([:(x[$x] == 1.0), :(x[$y] == 2.0)]),
        false,
    )
    MOI.set(optimizer, MOI.NLPBlock(), data1)
    MOI.optimize!(optimizer)
    data2 = MOI.NLPBlockData(
        [MOI.NLPBoundsPair(rhs, rhs) for rhs in [1.0, 2.0, 3.0]],
        ExprEvaluator([
            :(x[$x] == 1.0),
            :(x[$y] == 2.0),
            :(x[$x] + x[$y] == 3.0),
        ]),
        false,
    )
    MOI.set(optimizer, MOI.NLPBlock(), data2)
    return
end

function _base_satisfiability_problem()
    optimizer = SCIP.Optimizer()
    MOI.set(optimizer, MOI.Silent(), true)
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, y, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, z, MOI.LessThan(1.0))
    c = MOI.add_constraint(
        optimizer,
        MOI.VectorOfVariables([x, y, z]),
        MOI.SOS1([1.0, 2.0, 3.0]),
    )
    return optimizer, x, y, z, c
end

function test_minimum_unsatisfiable_system()
    optimizer, x, y, z, c = _base_satisfiability_problem()
    MOI.optimize!(optimizer)
    MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    SCIP.compute_minimum_unsatisfied_constraints!(optimizer)
    @test MOI.get(optimizer, SCIP.UnsatisfiableSystemStatus()) ==
          MOI.NO_CONFLICT_EXISTS
    optimizer, x, y, z, c = _base_satisfiability_problem()
    c2 = MOI.add_constraint(optimizer, 1.0 * x + y + z, MOI.GreaterThan(2.0))
    MOI.set(optimizer, MOI.ConstraintName(), c2, "lincons2")
    MOI.optimize!(optimizer)
    MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    SCIP.compute_minimum_unsatisfied_constraints!(optimizer)
    @test MOI.get(optimizer, SCIP.UnsatisfiableSystemStatus()) ==
          MOI.CONFLICT_FOUND
    @test Int(MOI.get(optimizer, SCIP.ConstraintSatisfiabilityStatus(), c)) +
          Int(MOI.get(optimizer, SCIP.ConstraintSatisfiabilityStatus(), c2)) ≥ 1
    return
end

function test_SOS1()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, y, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, z, MOI.LessThan(1.0))
    c = MOI.add_constraint(
        optimizer,
        MOI.VectorOfVariables([x, y, z]),
        MOI.SOS1([1.0, 2.0, 3.0]),
    )
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 2.0, 3.0], [x, y, z]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) ==
          MOI.VectorOfVariables([x, y, z])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) ==
          MOI.SOS1([1.0, 2.0, 3.0])
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 3.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol = atol rtol =
        rtol
    return
end

function test_SOS2()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, y, MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, z, MOI.LessThan(1.0))
    c = MOI.add_constraint(
        optimizer,
        MOI.VectorOfVariables([x, y, z]),
        MOI.SOS2([1.0, 2.0, 3.0]),
    )
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 2.0, 3.0], [x, y, z]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) ==
          MOI.VectorOfVariables([x, y, z])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) ==
          MOI.SOS2([1.0, 2.0, 3.0])
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 5.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol = atol rtol =
        rtol
    return
end

function test_indicator_constraints()
    optimizer = SCIP.Optimizer()
    x1 = MOI.add_variable(optimizer)
    x2 = MOI.add_variable(optimizer)
    x3 = MOI.add_variable(optimizer)
    y = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    iset = MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(1.0))
    ind_func = MOI.VectorAffineFunction(
        [
            MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, y)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x1)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ],
        [0.0, 0.0],
    )
    c = MOI.add_constraint(optimizer, ind_func, iset)
    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) ≈ ind_func
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) == iset
    @test MOI.delete(optimizer, c) === nothing
    # adding incorrect function throws
    ind_func_wrong = MOI.VectorAffineFunction(
        [
            MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, y)),
            MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, x1)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ],
        [0.0, 0.0],
    )
    @test_throws AssertionError MOI.add_constraint(
        optimizer,
        ind_func_wrong,
        iset,
    )
    ind_func_wrong2 = MOI.VectorAffineFunction(
        [
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ],
        [0.0, 0.0],
    )
    @test_throws AssertionError MOI.add_constraint(
        optimizer,
        ind_func_wrong2,
        iset,
    )
    return
end

function test_deleting_variables()
    optimizer = SCIP.Optimizer()
    # add variable and constraint
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0),
        MOI.EqualTo(0.0),
    )
    @test !MOI.is_empty(optimizer)
    # delete them (constraint first!)
    MOI.delete(optimizer, c)
    MOI.delete(optimizer, x)
    @test MOI.is_empty(optimizer)
    # add variable and constraint (again)
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0),
        MOI.EqualTo(0.0),
    )
    @test !MOI.is_empty(optimizer)
    # fail to delete them in wrong order
    @test_throws MOI.DeleteNotAllowed MOI.delete(optimizer, x)
    return
end

function test_set_parameter()
    # bool
    optimizer = SCIP.Optimizer(; branching_preferbinary=true)
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("branching/preferbinary"),
    ) == true
    # int
    optimizer = SCIP.Optimizer(; conflict_minmaxvars=1)
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("conflict/minmaxvars"),
    ) == 1
    # long int
    optimizer = SCIP.Optimizer(; heuristics_alns_maxnodes=2)
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("heuristics/alns/maxnodes"),
    ) == 2
    # real
    optimizer = SCIP.Optimizer(; branching_scorefac=0.15)
    @test MOI.get(optimizer, MOI.RawOptimizerAttribute("branching/scorefac")) ==
          0.15
    # char
    optimizer = SCIP.Optimizer(; branching_scorefunc='s')
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("branching/scorefunc"),
    ) == 's'
    # string
    optimizer = SCIP.Optimizer(; heuristics_alns_rewardfilename="abc.txt")
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("heuristics/alns/rewardfilename"),
    ) == "abc.txt"
    # invalid
    @test_throws ErrorException SCIP.Optimizer(some_invalid_param_name=true)
    return
end

function test_raw_optimizer_attribute()
    optimizer = SCIP.Optimizer()
    # bool
    MOI.set(
        optimizer,
        MOI.RawOptimizerAttribute("branching/preferbinary"),
        true,
    )
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("branching/preferbinary"),
    ) == true
    # int
    MOI.set(optimizer, MOI.RawOptimizerAttribute("conflict/minmaxvars"), 1)
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("conflict/minmaxvars"),
    ) == 1
    # long int
    MOI.set(optimizer, MOI.RawOptimizerAttribute("heuristics/alns/maxnodes"), 2)
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("heuristics/alns/maxnodes"),
    ) == 2
    # real
    MOI.set(optimizer, MOI.RawOptimizerAttribute("branching/scorefac"), 0.15)
    @test MOI.get(optimizer, MOI.RawOptimizerAttribute("branching/scorefac")) ==
          0.15
    # char
    MOI.set(optimizer, MOI.RawOptimizerAttribute("branching/scorefunc"), 's')
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("branching/scorefunc"),
    ) == 's'
    # string
    MOI.set(
        optimizer,
        MOI.RawOptimizerAttribute("heuristics/alns/rewardfilename"),
        "abc.txt",
    )
    @test MOI.get(
        optimizer,
        MOI.RawOptimizerAttribute("heuristics/alns/rewardfilename"),
    ) == "abc.txt"
    # invalid
    @test_throws ErrorException MOI.set(
        optimizer,
        MOI.RawOptimizerAttribute("some/invalid/param/name"),
        true,
    )
    return
end

function test_moi_silent()
    optimizer = SCIP.Optimizer()
    @test MOI.supports(optimizer, MOI.Silent())
    # "loud" by default
    @test MOI.get(optimizer, MOI.Silent()) == false
    @test MOI.get(optimizer, MOI.RawOptimizerAttribute("display/verblevel")) ==
          4
    # make it silent
    MOI.set(optimizer, MOI.Silent(), true)
    @test MOI.get(optimizer, MOI.Silent()) == true
    @test MOI.get(optimizer, MOI.RawOptimizerAttribute("display/verblevel")) ==
          0
    # but a user can override it
    MOI.set(optimizer, MOI.RawOptimizerAttribute("display/verblevel"), 1)
    @test MOI.get(optimizer, MOI.Silent()) == false
    @test MOI.get(optimizer, MOI.RawOptimizerAttribute("display/verblevel")) ==
          1
    return
end

function test_query_results_before_and_after_solve()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, y, MOI.GreaterThan(0.0))
    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.0),
    )
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 2.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # before optimize: can not query most results
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMIZE_NOT_CALLED
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
    @test_throws ErrorException MOI.get(optimizer, MOI.ObjectiveValue())
    @test_throws ErrorException MOI.get(optimizer, MOI.VariablePrimal(), x)
    @test_throws ErrorException MOI.get(optimizer, MOI.ConstraintPrimal(), c)
    @test_throws ErrorException MOI.get(optimizer, MOI.ObjectiveBound())
    @test_throws ErrorException MOI.get(optimizer, MOI.RelativeGap())
    @test MOI.get(optimizer, MOI.SolveTimeSec()) ≈ 0.0 atol = atol rtol = rtol
    @test_throws ErrorException MOI.get(optimizer, MOI.SimplexIterations())
    @test MOI.get(optimizer, MOI.NodeCount()) == 0
    # after optimize
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 2.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.ConstraintPrimal(), c) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.ObjectiveBound()) ≈ 2.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.RelativeGap()) ≈ 0.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.SolveTimeSec()) < 1.0
    @test MOI.get(optimizer, MOI.SimplexIterations()) <= 3  # conservative
    @test MOI.get(optimizer, MOI.NodeCount()) <= 1          # conservative
    return
end

function test_primal_start_values()
    # stop after first feasible solution
    optimizer = SCIP.Optimizer(;
        display_verblevel=0,
        limits_solutions=1,
        presolving_maxrounds=0,
    )
    atol, rtol = 1e-6, 1e-6
    # x, y binary
    x, y = MOI.add_variables(optimizer, 2)
    b1 = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b2 = MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # x + y <= 1
    c = MOI.add_constraint(optimizer, 1.0x + y, MOI.LessThan(1.0))
    # max x + 2y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        1.0x + 2.0y,
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # optimal solution: x = 0, y = 1, value = 2
    # we submit the suboptimal x = 1 as start value
    @test MOI.supports(optimizer, MOI.VariablePrimalStart(), MOI.VariableIndex)
    # first set only the value for one variable
    MOI.set(optimizer, MOI.VariablePrimalStart(), x, 1.0)
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), x) == 1.0
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), y) === nothing
    # unset the value
    MOI.set(optimizer, MOI.VariablePrimalStart(), x, nothing)
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), x) === nothing
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), y) === nothing
    # set all values (again)
    MOI.set(optimizer, MOI.VariablePrimalStart(), [x, y], [1.0, nothing])
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), x) == 1.0
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), y) === nothing
    # "solve"
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.SOLUTION_LIMIT
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    return
end

function test_no_dual_solution()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.DualStatus()) == MOI.NO_SOLUTION
    return
end

test_broken_indicator_test_0() = _test_broken_indicator_test(0)

test_broken_indicator_test_1() = _test_broken_indicator_test(1)

function _test_broken_indicator_test(presolving)
    model = MOI.Bridges.full_bridge_optimizer(
        SCIP.Optimizer(; display_verblevel=0, presolving_maxrounds=presolving),
        Float64,
    )
    config = MOI.Test.Config(;
        atol=5e-3,
        rtol=1e-4,
        exclude=Any[
            MOI.ConstraintDual,
            MOI.DualObjectiveValue,
            MOI.VariableBasisStatus,
            MOI.ConstraintBasisStatus,
        ],
    )
    T = Float64
    x1 = MOI.add_variable(model)
    x2 = MOI.add_variable(model)
    z1 = MOI.add_variable(model)
    z2 = MOI.add_variable(model)
    vc1 = MOI.add_constraint(model, z1, MOI.ZeroOne())
    @test vc1.value == z1.value
    vc2 = MOI.add_constraint(model, z2, MOI.ZeroOne())
    @test vc2.value == z2.value
    f1 = MOI.VectorAffineFunction(
        [
            MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(T(1), z1)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(T(1), x2)),
        ],
        T[0, 0],
    )
    iset1 = MOI.Indicator{MOI.ACTIVATE_ON_ZERO}(MOI.LessThan(T(8)))
    MOI.add_constraint(model, f1, iset1)
    f2 = MOI.VectorAffineFunction(
        [
            MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(T(1), z2)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(T(1 // 5), x1)),
            MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(T(1), x2)),
        ],
        T[0, 0],
    )
    iset2 = MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(T(9)))
    MOI.add_constraint(model, f2, iset2)
    # Additional regular constraint.
    MOI.add_constraint(
        model,
        MOI.ScalarAffineFunction(
            [MOI.ScalarAffineTerm(T(1), x1), MOI.ScalarAffineTerm(T(1), x2)],
            T(0),
        ),
        MOI.LessThan(T(10)),
    )
    # Disjunction (1-z1) ⋁ z2
    MOI.add_constraint(
        model,
        MOI.ScalarAffineFunction(
            [MOI.ScalarAffineTerm(T(-1), z1), MOI.ScalarAffineTerm(T(1), z2)],
            T(0),
        ),
        MOI.GreaterThan(T(0)),
    )
    MOI.set(
        model,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{T}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.(T[2, 3], [x1, x2]),
            T(0),
        ),
    )
    MOI.set(model, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test MOI.get(model, MOI.TerminationStatus()) == MOI.OPTIMIZE_NOT_CALLED
    MOI.optimize!(model)
    if presolving == 1 && v"8.0.1" <= SCIP.SCIP_versionnumber() <= v"8.0.2"
        @test_broken MOI.get(model, MOI.TerminationStatus()) ==
                     config.optimal_status
        @test_broken MOI.get(model, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    else
        @test MOI.get(model, MOI.TerminationStatus()) == config.optimal_status
        @test MOI.get(model, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
        @test ≈(MOI.get(model, MOI.ObjectiveValue()), T(115 // 4), config)
        @test ≈(MOI.get(model, MOI.VariablePrimal(), x1), T(5 // 4), config)
        @test ≈(MOI.get(model, MOI.VariablePrimal(), x2), T(35 // 4), config)
        @test ≈(MOI.get(model, MOI.VariablePrimal(), z1), T(1), config)
        @test ≈(MOI.get(model, MOI.VariablePrimal(), z2), T(1), config)
    end
    return
end

test_presolving_true() = _test_presolving(true)

test_presolving_false() = _test_presolving(false)

function _test_presolving(presolving)
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, y, MOI.GreaterThan(0.0))
    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.0),
    )
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 2.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test MOI.get(optimizer, SCIP.Presolving()) == true
    MOI.set(optimizer, SCIP.Presolving(), presolving)
    @test MOI.get(optimizer, SCIP.Presolving()) == presolving
    # after optimize
    MOI.optimize!(optimizer)
    MOI.set(optimizer, SCIP.Presolving(), presolving)
    @test MOI.get(optimizer, SCIP.Presolving()) == presolving
    return
end

function test_is_valid_zeroone()
    model = SCIP.Optimizer()
    x = MOI.add_variable(model)
    c = MOI.ConstraintIndex{MOI.VariableIndex,MOI.ZeroOne}(x.value)
    @test !MOI.is_valid(model, c)
    MOI.add_constraint(model, x, MOI.ZeroOne())
    @test MOI.is_valid(model, c)
    MOI.delete(model, c)
    @test !MOI.is_valid(model, c)
    return
end

function test_is_valid_integer()
    model = SCIP.Optimizer()
    x = MOI.add_variable(model)
    c = MOI.ConstraintIndex{MOI.VariableIndex,MOI.Integer}(x.value)
    @test !MOI.is_valid(model, c)
    MOI.add_constraint(model, x, MOI.Integer())
    @test MOI.is_valid(model, c)
    MOI.delete(model, c)
    @test !MOI.is_valid(model, c)
    return
end

mutable struct ZeroHeuristic <: SCIP.Heuristic end

function SCIP.find_primal_solution(
    scip,
    ::ZeroHeuristic,
    heurtiming,
    nodeinfeasible::Bool,
    heur_ptr,
)
    @assert SCIP.SCIPhasCurrentNodeLP(scip) == SCIP.TRUE
    result = SCIP.SCIP_DIDNOTRUN
    sol = SCIP.create_empty_scipsol(scip, heur_ptr)
    vars = SCIP.SCIPgetVars(scip)
    nvars = SCIP.SCIPgetNVars(scip)
    var_vec = unsafe_wrap(Array, vars, nvars)
    for var in var_vec
        SCIP.@SCIP_CALL SCIP.SCIPsetSolVal(scip, sol, var, 0.0)
    end
    stored = Ref{SCIP.SCIP_Bool}(SCIP.FALSE)
    SCIP.@SCIP_CALL SCIP.SCIPtrySolFree(
        scip,
        Ref(sol),
        SCIP.FALSE,
        SCIP.FALSE,
        SCIP.TRUE,
        SCIP.TRUE,
        SCIP.TRUE,
        stored,
    )
    result = if stored[] != SCIP.TRUE
        SCIP.SCIP_DIDNOTFIND
    else
        SCIP.SCIP_FOUNDSOL
    end
    return (SCIP.SCIP_OKAY, result)
end

function test_basic_heuristic_properties()
    o = SCIP.Optimizer(; presolving_maxrounds=0, display_verblevel=0)
    name = "zero_heuristic"
    description = "description"
    priority = 1
    heur = ZeroHeuristic()
    SCIP.include_heuristic(
        o,
        heur;
        name=name,
        description=description,
        priority=priority,
    )

    heur_pointer = o.inner.heuristic_storage[heur]
    @test unsafe_string(SCIP.LibSCIP.SCIPheurGetName(heur_pointer)) == name
    @test unsafe_string(SCIP.LibSCIP.SCIPheurGetDesc(heur_pointer)) ==
          description
    @test SCIP.LibSCIP.SCIPheurGetPriority(heur_pointer) == priority
    @test SCIP.LibSCIP.SCIPheurGetData(heur_pointer) ==
          pointer_from_objref(heur)

    x = MOI.add_variables(o, 10)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:5
        MOI.add_constraint(
            o,
            2.0 * rand(10)' * x,
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -rand(10)' * x
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
    return
end

function test_heuristic_callback()
    o = SCIP.Optimizer(; presolving_maxrounds=0, display_verblevel=0)
    n = 10
    x = MOI.add_variables(o, n)
    MOI.add_constraint.(o, x, MOI.ZeroOne())
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(3.0))
    MOI.set(
        o,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        rand(n)' * x,
    )
    MOI.set(o, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    ncalls = Ref(0)
    function heuristic_callback(callback_data::SCIP.HeuristicCbData)
        # LP solution
        x_frac = MOI.get(o, MOI.CallbackVariablePrimal(callback_data), x)
        # setting heuristic solution with three values at 1
        values = 0 * x_frac
        values[findmax(x_frac)[2]] = 1.0
        values[1] = 1.0
        values[2] = 1.0
        MOI.submit(o, MOI.HeuristicSolution(callback_data), x, values)
        global ncalls[] += 1
    end
    MOI.set(o, MOI.HeuristicCallback(), heuristic_callback)
    MOI.optimize!(o)
    @test ncalls[] > 0
    return
end

mutable struct MostFractional <: SCIP.AbstractBranchingRule
    ncalls::Int
    MostFractional(ncalls=0) = new(ncalls)
end

# we only specialize the branching on LP rule
function SCIP.branch(
    branchrule::MostFractional,
    scip,
    allow_additional_constraints,
    type::SCIP.BranchingLP,
)
    branchrule.ncalls += 1
    (candidates, _, candidates_fractionalities, nprio, nimplied) =
        SCIP.get_branching_candidates(scip)
    candidate_idx =
        argmax(idx -> abs(candidates_fractionalities[idx] - 0.5), 1:nprio)
    var = candidates[candidate_idx]
    SCIP.branch_on_candidate!(scip, var)
    return (SCIP.SCIP_OKAY, SCIP.SCIP_BRANCHED)
end

function test_branchrule()
    # removing presolving and cuts to solve a non-trivial problem that requires some branching
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxrounds"), 0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxcutsroot"), 0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxaddrounds"), 0)
    MOI.set(o, MOI.Silent(), true)
    branchrule = MostFractional()
    name = "my_branchrule"
    description = "a most infeasible branching rule"
    priority = 15_000
    SCIP.include_branchrule(
        o,
        branchrule;
        name=name,
        description=description,
        priority=priority,
    )
    branchrule_pointer = o.inner.branchrule_storage[branchrule]
    @test unsafe_string(
        SCIP.LibSCIP.SCIPbranchruleGetName(branchrule_pointer),
    ) == name
    @test unsafe_string(
        SCIP.LibSCIP.SCIPbranchruleGetDesc(branchrule_pointer),
    ) == description
    @test SCIP.LibSCIP.SCIPbranchruleGetPriority(branchrule_pointer) == priority
    @test SCIP.LibSCIP.SCIPbranchruleGetData(branchrule_pointer) ==
          pointer_from_objref(branchrule)
    n = 20
    x = MOI.add_variables(o, n)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:10
        MOI.add_constraint(
            o,
            2.0 * rand(n)' * x,
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -rand(n)' * x
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)
    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test branchrule.ncalls > 0
    return
end

function test_NaiveAllDiff_two_binary_vars()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    # add two binary variables: x, y
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # maximize 2x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraint all-diff(x, y)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)
    alldiffcons = NaiveAllDiff.NADCons([x, y])
    cr = SCIP.add_constraint(optimizer, alldiffch, alldiffcons)
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 2.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    return
end

function test_NaiveAllDiff_3_bin_vars_2_pairwise_cons()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    MOI.add_constraint(optimizer, z, MOI.ZeroOne())
    # maximize 2x + 3y + 2z
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 3.0, 2.0], [x, y, z]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraints all-diff(x, y), all-diff(y, x)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([y, z]))
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 4.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol = atol rtol =
        rtol
    return
end

function test_NaiveAllDiff_3_bin_vars_3_pairwise_cons()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    MOI.add_constraint(optimizer, z, MOI.ZeroOne())
    # maximize 2x + 3y + 2z
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 3.0, 2.0], [x, y, z]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, z]))
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([y, z]))
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
    @test MOI.get(optimizer, MOI.NodeCount()) >= 8  # complete enumeration
    return
end

function test_NaiveAllDiff_3_bin_vars_1_cons_with_all()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    # add three binary variables
    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    MOI.add_constraint(optimizer, z, MOI.ZeroOne())
    # maximize 2x + 3y + 2z
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 3.0, 2.0], [x, y, z]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y, z]))
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
    @test MOI.get(optimizer, MOI.NodeCount()) >= 8  # complete enumeration
    return
end

function test_NaiveAllDiff_3_int_vars_1_cons_with_all()
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    atol, rtol = 1e-6, 1e-6
    # add three integer variables, in {0, 1, 2}
    x, y, z = MOI.add_variables(optimizer, 3)
    for v in [x, y, z]
        MOI.add_constraint(optimizer, v, MOI.Integer())
        MOI.add_constraint(optimizer, v, MOI.Interval(0.0, 2.0))
    end
    # maximize 2x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraints all-diff(x, y, z)
    alldiffch = NaiveAllDiff.NADCH(optimizer)
    SCIP.include_conshdlr(optimizer, alldiffch; needs_constraints=true)
    SCIP.add_constraint(optimizer, alldiffch, NaiveAllDiff.NADCons([x, y, z]))
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 5.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 2.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 0.0 atol = atol rtol =
        rtol
    return
end

function test_NoGoodCounter_2_binary_vars()
    optimizer = SCIP.Optimizer(; display_verblevel=0, presolving_maxrounds=0)
    allow_dual_reductions =
        MOI.RawOptimizerAttribute("misc/allowstrongdualreds")
    MOI.set(optimizer, allow_dual_reductions, SCIP.FALSE)
    atol, rtol = 1e-6, 1e-6
    # add binary variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # maximize 2x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([2.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add constraint handler with constraints
    counter = NoGoodCounter.Counter(optimizer, [x, y])
    SCIP.include_conshdlr(optimizer, counter; needs_constraints=false)
    # solve problem and query result
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
    @test length(counter.solutions) == 4
    return
end

# Test, whether the cut callback is actually called and whether
# `callback_value` works as intended.
function test_obtaining_the_LP_solution()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    calls = 0
    x_val::Float64 = -1
    y_val::Float64 = -1
    function cutcallback(cb_data)
        x_val = MOI.get(
            optimizer,
            MOI.CallbackVariablePrimal{SCIP.CutCbData}(cb_data),
            x,
        )
        y_val = MOI.get(
            optimizer,
            MOI.CallbackVariablePrimal{SCIP.CutCbData}(cb_data),
            y,
        )
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)
    # solve the problem
    MOI.optimize!(optimizer)
    # The cut callback was called and obtaining the LP-solution worked.
    @test calls >= 1
    @test x_val + y_val >= 1.0 - min(atol, 1.0 * rtol)
    # SCIP found an optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol = atol rtol = rtol
    return
end

# Test, whether adding cuts within cut callbacks via `submit` works [1/2].
function test_cutting_one_optimal_solution()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        1.0 * x + 1.0 * y,
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    calls = 0
    function cutcallback(cb_data)
        MOI.submit(
            optimizer,
            MOI.UserCut{SCIP.CutCbData}(cb_data),
            1.0 * x,
            MOI.LessThan(0.0),
        )
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)
    # solve the problem
    MOI.optimize!(optimizer)
    # The cut callback was called.
    @test calls >= 1
    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol = atol rtol =
        rtol
    return
end

# Test, whether adding cuts within cut callbacks via `submit` works [2/2].
function test_cutting_another_optimal_solution()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    calls = 0
    function cutcallback(cb_data)
        MOI.submit(
            optimizer,
            MOI.UserCut{SCIP.CutCbData}(cb_data),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0], [y]), 0.0),
            MOI.LessThan(0.0),
        )
        calls += 1
    end
    MOI.set(optimizer, MOI.UserCutCallback(), cutcallback)
    # solve the problem
    MOI.optimize!(optimizer)
    # The cut callback was called.
    @test calls >= 1
    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    return
end

# Test, whether the callback of the separator is called.
function test_DummySepa_no_separation()
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add the separator
    sepa = DummySepa.Sepa()
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)
    # solve the problem
    MOI.optimize!(optimizer)
    # the separator is called
    @test sepa.called >= 1
    return
end

# Test, whether adding cuts in `exec_lp` via `add_cut_sepa` works [1/2].
function test_AddSingleCut_cut_off_one_optimal_solution()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add the separator
    varrefs = [SCIP.VarRef(x.value)]
    coefs = [1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)
    # solve the problem
    MOI.optimize!(optimizer)
    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol = atol rtol =
        rtol
    return
end

# Test, whether adding cuts in `exec_lp` via `add_cut_sepa` works [2/2].
function test_AddSingleCut_cut_off_another_optimal_solution()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add the separator
    varrefs = [SCIP.VarRef(y.value)]
    coefs = [1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)
    # solve the problem
    MOI.optimize!(optimizer)
    # SCIP found the single remaining optimal solution
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    return
end

# Test, whether we can cut the optimal solution.
function test_AddSingleCut_too_strong_cut()
    atol, rtol = 1e-6, 1e-6
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))
    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )
    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    # add the separator
    varrefs = [SCIP.VarRef(x.value), SCIP.VarRef(y.value)]
    coefs = [1.0, 1.0]
    sepa = AddSingleCut.Sepa(inner, varrefs, coefs, 0.0, 0.0)
    SCIP.include_sepa(inner.scip[], inner.sepas, sepa)
    # solve the problem
    MOI.optimize!(optimizer)
    # SCIP found the non-optimal solution, that remains after the cut.
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 0.0 atol = atol rtol = rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol = atol rtol =
        rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol = atol rtol =
        rtol
    return
end

end  # module TestMOIWrapper

TestMOIWrapper.runtests()
