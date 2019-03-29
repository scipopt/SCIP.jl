using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false,
                               infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear7",  # needs MOI.VectorAffineFunction
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
        "linear15", # needs MOI.VectorAffineFunction
        "partial_start", # TODO: supportVariablePrimalStart
    ]
    MOIT.contlineartest(OPTIMIZER, CONFIG, excluded)
end

@testset "MOI Quadratic Constraint" begin
    excluded = [
        "qcp1", # needs VectorAffineFunction
    ]
    MOIT.qcptest(OPTIMIZER, CONFIG, excluded)
end

@testset "MOI Integer Linear" begin
    MOIT.intlineartest(OPTIMIZER, CONFIG)
end
