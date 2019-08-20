using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test
const MOIU = MOI.Utilities

MOIU.@model(ModelData,
            (),
            (MOI.EqualTo, MOI.GreaterThan, MOI.LessThan, MOI.Interval),
            (MOI.SecondOrderCone,),
            (MOI.SOS1, MOI.SOS2),
            (),
            (MOI.ScalarAffineFunction, MOI.ScalarQuadraticFunction),
            (MOI.VectorOfVariables,),
            (MOI.VectorAffineFunction,))
const CACHE = MOIU.UniversalFallback(ModelData{Float64}())
const CACHED = MOIU.CachingOptimizer(CACHE, SCIP.Optimizer(display_verblevel=0))
const BRIDGED2 = MOIB.full_bridge_optimizer(CACHED, Float64)

const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false, infeas_certificates=false)
const CONFIG3 = MOIT.TestConfig(atol=1e-3, rtol=1e-2, duals=false, infeas_certificates=false)

@testset "MOI Unit tests" begin
    excluded = [
        "feasibility_sense", # TODO: support feasibility sense
        "solve_qp_edge_cases", # needs objective bridge
    ]
    MOIT.unittest(BRIDGED2, CONFIG, excluded)
end

@testset "MOI Modification tests" begin
    MOIT.modificationtest(BRIDGED2, CONFIG)
end
