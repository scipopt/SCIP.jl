using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex

function var_bounds(o::SCIP.Optimizer, vi::VI)
    return MOI.get(
        o,
        MOI.ConstraintSet(),
        CI{VI,MOI.Interval{Float64}}(vi.value),
    )
end

function chg_bounds(o::SCIP.Optimizer, vi::VI, set::S) where {S}
    ci = CI{VI,S}(vi.value)
    MOI.set(o, MOI.ConstraintSet(), ci, set)
    return nothing
end

@testset "SOS1" begin
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
end

@testset "SOS2" begin
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
end

@testset "indicator constraints" begin
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
    @test_throws ErrorException MOI.add_constraint(
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
    @test_throws ErrorException MOI.add_constraint(
        optimizer,
        ind_func_wrong2,
        iset,
    )
end

@testset "deleting variables" begin
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
end

@testset "set_parameter" begin
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
end

@testset "use RawParameter" begin
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
end

@testset "Silent" begin
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
end

@testset "Query results (before/after solve)" begin
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
end

@testset "Primal start values" begin
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
end

@testset "No dual solution" begin
    optimizer = SCIP.Optimizer(; display_verblevel=0)
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.DualStatus()) == MOI.NO_SOLUTION
end

@testset "broken indicator test" for presolving in (1, 0)
    model = MOIB.full_bridge_optimizer(
        SCIP.Optimizer(; display_verblevel=0, presolving_maxrounds=presolving),
        Float64,
    )
    config = MOIT.Config(;
        atol=5e-3,
        rtol=1e-4,
        exclude=Any[
            MOI.ConstraintDual,
            MOI.ConstraintName,
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
end
