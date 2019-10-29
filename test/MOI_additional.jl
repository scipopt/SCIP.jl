using MathOptInterface
const MOI = MathOptInterface

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex
const SVF = MOI.SingleVariable

function var_bounds(o::SCIP.Optimizer, vi::VI)
    return MOI.get(o, MOI.ConstraintSet(), CI{SVF,MOI.Interval{Float64}}(vi.value))
end

function chg_bounds(o::SCIP.Optimizer, vi::VI, set::S) where S
    ci = CI{SVF,S}(vi.value)
    MOI.set(o, MOI.ConstraintSet(), ci, set)
    return nothing
end

@testset "Binary variables and explicit bounds" begin
    optimizer = SCIP.Optimizer()

    # Binary variable without explicit bounds.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test_throws KeyError var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable with [0, 1] bounds.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable with [0, 1] bounds (order should not matter).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(0.0, 1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 1.0)

    # Binary variable fixed to 0.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Binary variable fixed to 0 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(0.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(0.0, 0.0)

    # Binary variable fixed to 1.
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Binary variable fixed to 1 (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(1.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(1.0, 1.0)

    # Tightened bounds for binary variable
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)

    # Tightened bounds for binary variable (different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(-1.0, 2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)
    MOI.delete(optimizer, t)
    @test var_bounds(optimizer, x) == MOI.Interval(-1.0, 2.0)

    # No error: binary variable with conflicting bounds (infeasible).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)

    # No error: binary variable with conflicting bounds (infeasible, different order).
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
end

@testset "Bound constraints for a general variable." begin
    optimizer = SCIP.Optimizer()
    inf = SCIP.SCIPinfinity(optimizer)

    # Should work: variable without explicit bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, inf)

    # Should work: variable with range bounds, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.Interval(3.0, 4.0))

    # Should work: variable with lower bound, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.GreaterThan(3.0))

    # Should work: variable with lower bound, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.LessThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 2.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))

    # Should work: fixed variable, but only once!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 2.0)
    @test_throws ErrorException MOI.add_constraint(optimizer, x, MOI.EqualTo(3.0))

    # Mixed constraint types now allowed (when disjoint)!
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    lb = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    ub = MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
end

@testset "Changing bounds for variable." begin
    optimizer = SCIP.Optimizer()
    inf = SCIP.SCIPinfinity(optimizer)

    # change interval bounds
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.Interval(2.0, 3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, 3.0)
    chg_bounds(optimizer, x, MOI.Interval(4.0, 5.0))
    @test var_bounds(optimizer, x) == MOI.Interval(4.0, 5.0)

    # change lower bound
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    chg_bounds(optimizer, x, MOI.GreaterThan(4.0))
    @test var_bounds(optimizer, x) == MOI.Interval(4.0, inf)

    # change upper bound
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.LessThan(3.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 3.0)
    chg_bounds(optimizer, x, MOI.LessThan(5.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 5.0)

    # change fixed value
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.EqualTo(2.5))
    @test var_bounds(optimizer, x) == MOI.Interval(2.5, 2.5)
    chg_bounds(optimizer, x, MOI.EqualTo(4.5))
    @test var_bounds(optimizer, x) == MOI.Interval(4.5, 4.5)

    # change mixed
    MOI.empty!(optimizer)
    x = MOI.add_variable(optimizer)
    b = MOI.add_constraint(optimizer, x, MOI.GreaterThan(2.0))
    @test var_bounds(optimizer, x) == MOI.Interval(2.0, inf)
    chg_bounds(optimizer, x, MOI.LessThan(4.0))
    @test var_bounds(optimizer, x) == MOI.Interval(-inf, 4.0)
end

@testset "Second Order Cone Constraint" begin
    # Derived from MOI's problem SOC1
    # max 0x + 1y + 1z
    #  st  x            == 1
    #      x >= ||(y,z)||

    optimizer = SCIP.Optimizer(display_verblevel=0)

    @test MOI.supports_constraint(optimizer, MOI.VectorOfVariables, MOI.SecondOrderCone)

    x, y, z = MOI.add_variables(optimizer, 3)

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,1.0], [y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    ceq = MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.EqualTo(1.0))
    csoc = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y, z]),
                              MOI.SecondOrderCone(3))

    @test MOI.get(optimizer, MOI.ConstraintFunction(), csoc) == MOI.VectorOfVariables([x, y, z])
    @test MOI.get(optimizer, MOI.ConstraintSet(), csoc) == MOI.SecondOrderCone(3)

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-3, 1e-3
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ √2 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1/√2 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1/√2 atol=atol rtol=rtol
end

@testset "Second Order Cone Constraint (infeasible)" begin
    # Problem SOC3 - Infeasible
    # min 0
    # s.t. y ≥ 2
    #      x ≤ 1
    #      |y| ≤ x

    optimizer = SCIP.Optimizer(display_verblevel=0)

    x, y = MOI.add_variables(optimizer, 2)

    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.Interval(0.0, 1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.GreaterThan(2.0))
    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y]), MOI.SecondOrderCone(2))

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION
end

@testset "Second Order Cone Constraint (error with unbounded variable)" begin
    optimizer = SCIP.Optimizer()
    x, y = MOI.add_variables(optimizer, 2)
    @test_throws ErrorException MOI.add_constraint(
        optimizer, MOI.VectorOfVariables([x, y]), MOI.SecondOrderCone(2))

    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, MOI.VectorOfVariables([x, y]),
                       MOI.SecondOrderCone(2))
    # no error
end

@testset "SOS1" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)

    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.LessThan(1.0))

    c = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x,y,z]), MOI.SOS1([1.0,2.0,3.0]))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,2.0,3.0], [x,y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) == MOI.VectorOfVariables([x,y,z])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) == MOI.SOS1([1.0,2.0,3.0])

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 3.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol=atol rtol=rtol
end

@testset "SOS2" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)

    x, y, z = MOI.add_variables(optimizer, 3)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.LessThan(1.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z), MOI.LessThan(1.0))

    c = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x,y,z]), MOI.SOS2([1.0,2.0,3.0]))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0,2.0,3.0], [x,y,z]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) == MOI.VectorOfVariables([x,y,z])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) == MOI.SOS2([1.0,2.0,3.0])

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 5.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z) ≈ 1.0 atol=atol rtol=rtol
end

@testset "abspower" begin
    # max.  x1 - x2
    # s.t.  z1 = sign(x1)*abs(x1)^2
    #       z2 = sign(x2)*abs(x2)^3
    #       z1 ≤ 4, z2 ≥ -8

    optimizer = SCIP.Optimizer(display_verblevel=0)

    x1, x2, z1, z2 = MOI.add_variables(optimizer, 4)
    MOI.add_constraint(optimizer, MOI.SingleVariable(z1), MOI.LessThan(4.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(z2), MOI.GreaterThan(-8.0))

    c1 = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x1, z1]),
                            SCIP.AbsolutePowerSet(2.0))
    c2 = MOI.add_constraint(optimizer, MOI.VectorOfVariables([x2, z2]),
                            SCIP.AbsolutePowerSet(3.0))

    @test MOI.get(optimizer, MOI.ConstraintFunction(), c1) == MOI.VectorOfVariables([x1, z1])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c1) == SCIP.AbsolutePowerSet(2.0)
    @test MOI.get(optimizer, MOI.ConstraintFunction(), c2) == MOI.VectorOfVariables([x2, z2])
    @test MOI.get(optimizer, MOI.ConstraintSet(), c2) == SCIP.AbsolutePowerSet(3.0)

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, -1.0], [x1, x2]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    atol, rtol = 1e-6, 1e-6
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 4.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x1) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z1) ≈ 4.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x2) ≈ -2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), z2) ≈ -8.0 atol=atol rtol=rtol
end

@testset "indicator constraints" begin
    optimizer = SCIP.Optimizer()

    x1 = MOI.add_variable(optimizer)
    x2 = MOI.add_variable(optimizer)
    x3 = MOI.add_variable(optimizer)
    y  = MOI.add_variable(optimizer)
    t = MOI.add_constraint(optimizer, y, MOI.ZeroOne())
    iset = MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(1.0))
    ind_func = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, y)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x1)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ], [0.0, 0.0],
    )

    c = MOI.add_constraint(optimizer, ind_func, iset)
    @test MOI.get(optimizer, MOI.ConstraintFunction(), c) ≈ ind_func
    @test MOI.get(optimizer, MOI.ConstraintSet(), c) == iset

    @test MOI.delete(optimizer, c) === nothing

    # adding incorrect function throws
    ind_func_wrong = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, y)),
         MOI.VectorAffineTerm(1, MOI.ScalarAffineTerm(1.0, x1)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ], [0.0, 0.0],
    )
    @test_throws ErrorException MOI.add_constraint(optimizer, ind_func_wrong, iset)
    ind_func_wrong2 = MOI.VectorAffineFunction(
        [MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x2)),
         MOI.VectorAffineTerm(2, MOI.ScalarAffineTerm(1.0, x3)),
        ], [0.0, 0.0],
    )
    @test_throws ErrorException MOI.add_constraint(optimizer, ind_func_wrong2, iset)
end

@testset "deleting variables" begin
    optimizer = SCIP.Optimizer()

    # add variable and constraint
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(optimizer, MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0), MOI.EqualTo(0.0))
    @test !MOI.is_empty(optimizer)

    # delete them (constraint first!)
    MOI.delete(optimizer, c)
    MOI.delete(optimizer, x)
    @test MOI.is_empty(optimizer)

    # add variable and constraint (again)
    x = MOI.add_variable(optimizer)
    c = MOI.add_constraint(optimizer, MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 0.0), MOI.EqualTo(0.0))
    @test !MOI.is_empty(optimizer)

    # fail to delete them in wrong order
    @test_throws ErrorException MOI.delete(optimizer, x)
end

@testset "single variable objective" begin
    optimizer = SCIP.Optimizer()

    # Happy Path: add objective and retrieve it.
    x = MOI.add_variable(optimizer)
    obj = MOI.SingleVariable(x)
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.SingleVariable}(), obj)
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test MOI.get(optimizer, MOI.ObjectiveFunction{MOI.SingleVariable}()) == obj
    @test MOI.get(optimizer, MOI.ObjectiveSense()) == MOI.MAX_SENSE
    @test MOI.get(optimizer, MOI.ObjectiveFunctionType()) == MOI.ScalarAffineFunction{Float64}

    MOI.empty!(optimizer)

    # Error with type mismatch
    x = MOI.add_variable(optimizer)
    y = MOI.add_variable(optimizer)
    aff_obj = MOI.ScalarAffineFunction([MOI.ScalarAffineTerm(1.0, x)], 3.0)
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(), aff_obj)
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    @test_throws ErrorException MOI.get(optimizer, MOI.ObjectiveFunction{MOI.SingleVariable}())
end

@testset "set_parameter" begin
    # bool
    optimizer = SCIP.Optimizer(branching_preferbinary=true)
    @test MOI.get(optimizer, MOI.RawParameter("branching/preferbinary")) == true

    # int
    optimizer = SCIP.Optimizer(conflict_minmaxvars=1)
    @test MOI.get(optimizer, MOI.RawParameter("conflict/minmaxvars")) == 1

    # long int
    optimizer = SCIP.Optimizer(heuristics_alns_maxnodes=2)
    @test MOI.get(optimizer, MOI.RawParameter("heuristics/alns/maxnodes")) == 2

    # real
    optimizer = SCIP.Optimizer(branching_scorefac=0.15)
    @test MOI.get(optimizer, MOI.RawParameter("branching/scorefac")) == 0.15

    # char
    optimizer = SCIP.Optimizer(branching_scorefunc='s')
    @test MOI.get(optimizer, MOI.RawParameter("branching/scorefunc")) == 's'

    # string
    optimizer = SCIP.Optimizer(heuristics_alns_rewardfilename="abc.txt")
    @test MOI.get(optimizer, MOI.RawParameter("heuristics/alns/rewardfilename")) == "abc.txt"

    # invalid
    @test_throws ErrorException SCIP.Optimizer(some_invalid_param_name=true)
end

@testset "use RawParameter" begin
    optimizer = SCIP.Optimizer()

    # bool
    MOI.set(optimizer, MOI.RawParameter("branching/preferbinary"), true)
    @test MOI.get(optimizer, MOI.RawParameter("branching/preferbinary")) == true

    # int
    MOI.set(optimizer, MOI.RawParameter("conflict/minmaxvars"), 1)
    @test MOI.get(optimizer, MOI.RawParameter("conflict/minmaxvars")) == 1

    # long int
    MOI.set(optimizer, MOI.RawParameter("heuristics/alns/maxnodes"), 2)
    @test MOI.get(optimizer, MOI.RawParameter("heuristics/alns/maxnodes")) == 2

    # real
    MOI.set(optimizer, MOI.RawParameter("branching/scorefac"), 0.15)
    @test MOI.get(optimizer, MOI.RawParameter("branching/scorefac")) == 0.15

    # char
    MOI.set(optimizer, MOI.RawParameter("branching/scorefunc"), 's')
    @test MOI.get(optimizer, MOI.RawParameter("branching/scorefunc")) == 's'

    # string
    MOI.set(optimizer, MOI.RawParameter("heuristics/alns/rewardfilename"), "abc.txt")
    @test MOI.get(optimizer, MOI.RawParameter("heuristics/alns/rewardfilename")) == "abc.txt"

    # invalid
    @test_throws ErrorException MOI.set(optimizer, MOI.RawParameter("some/invalid/param/name"), true)
end

@testset "Silent" begin
    optimizer = SCIP.Optimizer()

    @test MOI.supports(optimizer, MOI.Silent())

    # "loud" by default
    @test MOI.get(optimizer, MOI.Silent()) == false
    @test MOI.get(optimizer, MOI.RawParameter("display/verblevel")) == 4

    # make it silent
    MOI.set(optimizer, MOI.Silent(), true)
    @test MOI.get(optimizer, MOI.Silent()) == true
    @test MOI.get(optimizer, MOI.RawParameter("display/verblevel")) == 0

    # but a user can override it
    MOI.set(optimizer, MOI.RawParameter("display/verblevel"), 1)
    @test MOI.get(optimizer, MOI.Silent()) == false
    @test MOI.get(optimizer, MOI.RawParameter("display/verblevel")) == 1
end

@testset "Query results (before/after solve)" begin
    optimizer = SCIP.Optimizer(display_verblevel=0)
    atol, rtol = 1e-6, 1e-6

    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, MOI.SingleVariable(x), MOI.GreaterThan(0.0))
    MOI.add_constraint(optimizer, MOI.SingleVariable(y), MOI.GreaterThan(0.0))

    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
        MOI.LessThan(1.0))

    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 2.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # before optimize: can not query most results
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMIZE_NOT_CALLED
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.NO_SOLUTION

    @test_throws ErrorException MOI.get(optimizer, MOI.ObjectiveValue())
    @test_throws ErrorException MOI.get(optimizer, MOI.VariablePrimal(), x)
    @test_throws ErrorException MOI.get(optimizer, MOI.ConstraintPrimal(), c)
    @test_throws ErrorException MOI.get(optimizer, MOI.ObjectiveBound())
    @test_throws ErrorException MOI.get(optimizer, MOI.RelativeGap())
    @test MOI.get(optimizer, MOI.SolveTime()) ≈ 0.0 atol=atol rtol=rtol
    @test_throws ErrorException MOI.get(optimizer, MOI.SimplexIterations())
    @test MOI.get(optimizer, MOI.NodeCount()) == 0

    # after optimize
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.ConstraintPrimal(), c) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.ObjectiveBound()) ≈ 2.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.RelativeGap()) ≈ 0.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.SolveTime()) < 1.0
    @test MOI.get(optimizer, MOI.SimplexIterations()) <= 3  # conservative
    @test MOI.get(optimizer, MOI.NodeCount()) <= 1          # conservative
end

@testset "Primal start values" begin
    # stop after first feasible solution
    optimizer = SCIP.Optimizer(display_verblevel=0, limits_solutions=1)
    atol, rtol = 1e-6, 1e-6

    # x, y binary
    x, y = MOI.add_variables(optimizer, 2)
    b1 = MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    b2 = MOI.add_constraint(optimizer, y, MOI.ZeroOne())

    # x + y <= 1
    c = MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]), 0.0),
        MOI.LessThan(1.0))

    # max x + 2y
    MOI.set(optimizer, MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction(MOI.ScalarAffineTerm.([1.0, 2.0], [x, y]), 0.0))
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)

    # optimal solution: x = 0, y = 1, value = 2
    # we submit the suboptimal x = 1 as start value
    MOI.set(optimizer, MOI.VariablePrimalStart(), x, 1.0)
    @test MOI.get(optimizer, MOI.VariablePrimalStart(), x) == 1.0

    # "solve"
    MOI.optimize!(optimizer)
    @test MOI.get(optimizer, MOI.TerminationStatus()) == MOI.SOLUTION_LIMIT
    @test MOI.get(optimizer, MOI.PrimalStatus()) == MOI.FEASIBLE_POINT

    # we should get back our start values, completed to a solution
    @test MOI.get(optimizer, MOI.ObjectiveValue()) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), x) ≈ 1.0 atol=atol rtol=rtol
    @test MOI.get(optimizer, MOI.VariablePrimal(), y) ≈ 0.0 atol=atol rtol=rtol
end
