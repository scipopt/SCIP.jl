using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false,
                               infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    # remember reason for excluded tests:
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
    # MOIT.contlineartest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.linear2test(OPTIMIZER, CONFIG)
    MOIT.linear3test(OPTIMIZER, CONFIG)
    MOIT.linear4test(OPTIMIZER, CONFIG)
    MOIT.linear6test(OPTIMIZER, CONFIG)
    MOIT.linear8atest(OPTIMIZER, CONFIG)
    MOIT.linear8btest(OPTIMIZER, CONFIG)
    MOIT.linear8ctest(OPTIMIZER, CONFIG)
    MOIT.linear9test(OPTIMIZER, CONFIG)
    MOIT.linear10test(OPTIMIZER, CONFIG)
    MOIT.linear10btest(OPTIMIZER, CONFIG)
    MOIT.linear12test(OPTIMIZER, CONFIG)
end

@testset "MOI Quadratic Constraint" begin
    # remember reason for excluded tests:
    excluded = [
        "qcp1", # needs VectorAffineFunction
    ]
    # MOIT.qcptest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.qcp2test(OPTIMIZER, CONFIG)
    MOIT.qcp3test(OPTIMIZER, CONFIG)
    MOIT.qcp4test(OPTIMIZER, CONFIG)

    MOIT.ncqcp1test(OPTIMIZER, CONFIG)
    MOIT.ncqcp2test(OPTIMIZER, CONFIG)
end

@testset "MOI Integer Linear" begin
    # MOIT.intlineartest(OPTIMIZER, CONFIG)

    # call individual tests
    MOIT.knapsacktest(OPTIMIZER, CONFIG)
    MOIT.int1test(OPTIMIZER, CONFIG)
    MOIT.int2test(OPTIMIZER, CONFIG)
    MOIT.int3test(OPTIMIZER, CONFIG)
end
