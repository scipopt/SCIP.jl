using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const SCALARIZED = MOIB.Scalarize{Float64}(SCIP.Optimizer(display_verblevel=0))
const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false,
                               infeas_certificates=false)

@testset "MOI Continuous Linear - ScalarizeBridge" begin
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
        "partial_start", # TODO: supportVariablePrimalStart
    ]
    MOIT.contlineartest(SCALARIZED, CONFIG, excluded)
end

@testset "MOI Continuous Conic - ScalarizeBridge" begin
    MOIT.lintest(SCALARIZED, CONFIG)

    # needs VectorAffineFunction
    # MOIT.soctest(SCALARIZED, CONFIG)

    # other cones not supported
end

@testset "MOI Quadratic Constraint - ScalarizeBridge" begin
    MOIT.qcptest(SCALARIZED, CONFIG)
end

@testset "MOI Integer Linear" begin
    MOIT.intlineartest(SCALARIZED, CONFIG)
end

@testset "MOI Integer Conic - ScalarizeBridge" begin
    # needs VectorAffineFunction
    # MOIT.intconictest(SCALARIZED, CONFIG)
end
