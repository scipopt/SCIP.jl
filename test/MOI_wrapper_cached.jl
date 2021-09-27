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

const CONFIG_CACHED = MOIT.Config(
    atol=1e-5, rtol=1e-5,
    exclude=Any[
        MOI.ConstraintDual, MOI.ConstraintName, MOI.VariableName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
    ],
)

@testset "MOI Modification tests" begin
    exclude_list = copy(MOI_BASE_EXCLUDED)
    append!(
        exclude_list,
        [
            "RawStatusString",
            "SolveTimeSec",
            "test_conic_",
            "test_linear_integration",
            "test_quadratic_duplicate_terms",
            "test_quadratic_nonhomogeneous",
        ]
    )
    MOIT.runtests(BRIDGED2, CONFIG_CACHED, exclude = exclude_list)
end
