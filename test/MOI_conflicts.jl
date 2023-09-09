using SCIP
import MathOptInterface as MOI
using Test

function base_satisfiability_problem()
    optimizer = SCIP.Optimizer()
    
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

@testset "Minimum Unsatisfiable System" begin
    optimizer, x, y, z, c = base_satisfiability_problem()
    MOI.optimize!(optimizer)

    MOI.get(optimizer, MOI.TerminationStatus()) == MOI.OPTIMAL
    SCIP.compute_minimum_unsatisfied_constraints!(optimizer)

    @test MOI.get(optimizer,  SCIP.UnsatisfiableSystemStatus()) == MOI.NO_CONFLICT_EXISTS

    optimizer, x, y, z, c = base_satisfiability_problem()
    c2 = MOI.add_constraint(optimizer, 1.0 * x + y + z, MOI.GreaterThan(2.0))

    MOI.set(optimizer, MOI.ConstraintName(), c2, "lincons2")

    MOI.optimize!(optimizer)
    MOI.get(optimizer, MOI.TerminationStatus()) == MOI.INFEASIBLE

    SCIP.compute_minimum_unsatisfied_constraints!(optimizer)
    @test MOI.get(optimizer,  SCIP.UnsatisfiableSystemStatus()) == MOI.CONFLICT_FOUND

    @test Int(MOI.get(optimizer, MOI.ConstraintSatisfiabilityStatus(), c)) + Int(MOI.get(optimizer, MOI.ConstraintSatisfiabilityStatus(), c2)) ≥ 1
end
