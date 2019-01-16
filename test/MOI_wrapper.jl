using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const optimizer = SCIP.Optimizer()
MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)

const config = MOIT.TestConfig(duals=false, infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear7",  # needs MOI.VectorAffineFunction
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
        "linear15", # needs MOI.VectorAffineFunction
    ]
    MOIT.contlineartest(optimizer, config, excluded)
end

@testset "MOI Integer Linear" begin
    excluded = [
        "int2", # TODO: fix bounds handling for binary variables
    ]
    MOIT.intlineartest(optimizer, config, excluded)
end

@testset "MOI Quadratic Constraint" begin
    excluded = [
        "qcp1", # needs VectorAffineFunction
    ]
    MOIT.qcptest(optimizer, config, excluded)
end
