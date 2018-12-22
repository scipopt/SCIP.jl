using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const optimizer = SCIP.Optimizer()
MOI.set(optimizer, SCIP.Param("display/verblevel"), 0)

const config = MOIT.TestConfig(duals=false, infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",  # needs MOI.delete
        "linear5",  # needs MOI.delete
        "linear7",  # needs MOI.VectorAffineFunction
        "linear11", # needs MOI.delete
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete
        "linear15", # needs MOI.VectorAffineFunction
    ]
    MOIT.contlineartest(optimizer, config, excluded)
end
