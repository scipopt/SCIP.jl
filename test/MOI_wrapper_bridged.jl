using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(display_verblevel=0), Float64)
const CONFIG = MOIT.Config(atol=1e-5, rtol=1e-5, exclude=Any[MOI.ConstraintDual, MOI.ConstraintName])
const CONFIG3 = MOIT.Config(atol=1e-3, rtol=1e-2, exclude=Any[MOI.ConstraintDual])

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
    ]
    MOIT.contlineartest(BRIDGED, CONFIG, excluded)
end

@testset "MOI Continuous Conic" begin
    MOIT.lintest(BRIDGED, CONFIG)

    # SOC tests fail because of lower bound requirement of RHS var.
    # MOIT.soctest(BRIDGED, CONFIG)
    # MOIT.rsoctest(BRIDGED, CONFIG)

    # other cones not supported
    # MOIT.geomeantest(BRIDGED, CONFIG)
    # MOIT.exptest(BRIDGED, CONFIG)
    # MOIT.sdptest(BRIDGED, CONFIG)
    # MOIT.logdettest(BRIDGED, CONFIG)
    # MOIT.rootdettest(BRIDGED, CONFIG)
end

@testset "MOI Quadratic Constraint" begin
    # needs objective bridge (MOI/#529)
    # MOIT.qptest(BRIDGED, CONFIG)

    MOIT.qcptest(BRIDGED, CONFIG)
    MOIT.socptest(BRIDGED, CONFIG3)
end

@testset "MOI Integer Linear" begin
    excluded = String["semiconttest", "semiinttest"]
    MOIT.intlineartest(BRIDGED, CONFIG, excluded)
    MOIT.indicator3_test(BRIDGED, CONFIG)
end

@testset "MOI Integer Conic" begin
    # SOC tests fail because of lower bound requirement of RHS var.
    # MOIT.intconictest(BRIDGED, CONFIG)
end

@testset "MOI NLP" begin
    # None of tests provide expression graphs in the evaluator.
    # MOIT.nlptest(BRIDGED, CONFIG)
end

@testset "MOI Unit tests" begin
    # TODO: most tests need get-variable-by-name etc.
    # MOIT.unittest(BRIDGED, CONFIG)
end
