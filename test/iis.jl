using SCIP
using Test
import MathOptInterface as MOI

@testset "Basic conflict with raw SCIP API" begin
    o = SCIP.Optimizer()

    x, _ = MOI.add_constrained_variable(o, MOI.ZeroOne())
    y, _ = MOI.add_constrained_variable(o, MOI.ZeroOne())
    z, _ = MOI.add_constrained_variable(o, MOI.ZeroOne())
    w, _ = MOI.add_constrained_variable(o, MOI.ZeroOne())

    MOI.set(o, MOI.VariableName(), x, "x")
    MOI.set(o, MOI.VariableName(), y, "y")
    MOI.set(o, MOI.VariableName(), z, "z")
    MOI.set(o, MOI.VariableName(), w, "w")

    MOI.add_constraint(o, 1.0x + y, MOI.LessThan(1.5))
    MOI.add_constraint(o, 1.0z + 1.2y, MOI.LessThan(1.3))
    MOI.add_constraint(o, 1.0z + 1.2y, MOI.LessThan(1.3))
    MOI.add_constraint(o, 1.0w + 1.2x, MOI.LessThan(1.1))



    MOI.add_constraint(o, 1.0z + 0.9x + 1.2y, MOI.GreaterThan(2.0))

    for S in (MOI.LessThan{Float64}, MOI.GreaterThan{Float64})
        for cidx in MOI.get(o, MOI.ListOfConstraintIndices{MOI.ScalarAffineFunction{Float64}, S}())
            MOI.set(o, MOI.ConstraintName(), cidx, "c$(cidx.value)_$(length(string(S)))")
        end
    end


    f_obj = 1.0 * x
    MOI.set(o, MOI.ObjectiveFunction{typeof(f_obj)}(), f_obj)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.INFEASIBLE

    iis = SCIP.LibSCIP.SCIPgetIIS(o)
    @test SCIP.LibSCIP.SCIPiisIsSubscipInfeasible(iis) == 0
    SCIP.LibSCIP.SCIPgenerateIIS(o)
    @test SCIP.LibSCIP.SCIPiisIsSubscipInfeasible(iis) == 1
    @test SCIP.LibSCIP.SCIPiisIsSubscipIrreducible(iis) == 1
end

# subscip_ptr = SCIP.LibSCIP.SCIPiisGetSubscip(iis)

# SCIP.LibSCIP.SCIPwriteOrigProblem(subscip_ptr, "test.mps", C_NULL, false)


# moi_temp = MOI.Utilities.UniversalFallback(MOI.Utilities.Model{Float64}())
# moi_temp = MOI.Utilities.Model{Float64}()
# MOI.read_from_file(moi_temp, "test.mps")


