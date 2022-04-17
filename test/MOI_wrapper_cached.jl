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
    atol=5e-3, rtol=1e-4,
    exclude=Any[
        MOI.ConstraintDual, MOI.ConstraintName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
    ],
)

@testset "MOI Modification tests" begin
    exclude_list = copy(MOI_BASE_EXCLUDED)
    append!(
        exclude_list,
        [
            # SCIP needs non-negative variable on right-hand side of second-order cone constraint, have lower bound: -1.0e20
            "test_conic_GeometricMeanCone_VectorAffineFunction",
            "test_conic_GeometricMeanCone_VectorOfVariables",
            "test_conic_RotatedSecondOrderCone_INFEASIBLE",
            "test_conic_RotatedSecondOrderCone_VectorAffineFunction",
            "test_conic_RotatedSecondOrderCone_VectorOfVariables",
            "test_conic_RotatedSecondOrderCone_out_of_order",
            "test_conic_RootDetConeTriangle_VectorOfVariables",
            "test_conic_SecondOrderCone_INFEASIBLE",
            "test_conic_SecondOrderCone_Nonnegatives",
            "test_conic_SecondOrderCone_Nonpositives",
            "test_conic_SecondOrderCone_VectorAffineFunction",
            "test_conic_SecondOrderCone_VectorOfVariables",
            "test_conic_SecondOrderCone_negative_initial_bound",
            "test_conic_SecondOrderCone_negative_post_bound",
            "test_conic_SecondOrderCone_no_initial_bound",
            "test_conic_SecondOrderCone_out_of_order",
            "test_conic_SecondOrderCone_nonnegative_initial_bound",
            "test_conic_SecondOrderCone_nonnegative_post_bound",
            # Can not delete variable while model contains constraints
            "test_linear_integration",
            "test_quadratic_duplicate_terms",
            "test_quadratic_nonhomogeneous",
        ]
    )
    MOIT.runtests(BRIDGED2, CONFIG_CACHED, exclude = exclude_list)
end
