using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const optimizer = SCIP.Optimizer()
const config = MOIT.TestConfig(duals=false, infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",
        "linear2",
        "linear3",
        "linear4",
        "linear5",
        "linear6",
        "linear7",
        "linear8a",
        "linear8b",
        "linear8c",
        "linear9",
        "linear10",
        "linear11",
        "linear12",
        "linear13",
        "linear14",
        "linear15",
    ]
    MOIT.contlineartest(optimizer, config, excluded)
end
