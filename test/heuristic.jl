import MathOptInterface as MOI
using SCIP
using LinearAlgebra
using Test

mutable struct ZeroHeuristic <: SCIP.Heuristic
end

function SCIP.find_primal_solution(scip, ::ZeroHeuristic, heurtiming, nodeinfeasible::Bool, heur_ptr)
    @assert SCIP.SCIPhasCurrentNodeLP(scip) == SCIP.TRUE
    result = SCIP.SCIP_DIDNOTRUN
    sol = SCIP.create_scipsol(scip, heur_ptr)
    vars = SCIP.SCIPgetVars(scip)
    nvars = SCIP.SCIPgetNVars(scip)
    var_vec = unsafe_wrap(Array, vars, nvars)
    for var in var_vec
        SCIP.@SCIP_CALL SCIP.SCIPsetSolVal(
            scip,
            sol,
            var,
            0.0, 
        )
    end
    result = SCIP.SCIP_SUCCESS
    return (SCIP.SCIP_OKAY, result, [sol])
end

@testset "Basic heuristic properties" begin
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    name = "zero_heuristic"
    description = "description"
    priority = 1
    heur = ZeroHeuristic()
    SCIP.include_heuristic(o, heur, name=name, description=description, priority=priority)

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
            2.0 * dot(rand(10), x),
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -dot(rand(10), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL

end
