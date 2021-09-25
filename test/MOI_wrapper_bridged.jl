using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(display_verblevel=0), Float64)
const CONFIG_BRIDGED = MOIT.Config(atol=1e-5, rtol=1e-5, exclude=Any[
    MOI.ConstraintDual, MOI.ConstraintName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
])

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(excluded, [
        "test_linear_Interval_inactive",
        "test_linear_integration",
        "test_model_ordered_indices", # TODO should fix? ListOf in order of creation
        "test_quadratic_duplicate_terms",
        "test_quadratic_nonhomogeneous",
        "ScalarAffineFunction_ZeroOne",
        "ScalarQuadraticFunction_ZeroOne",
        "VectorAffineFunction_NormOneCone",
        "VectorQuadraticFunction_NormOneCone",
        "test_basic_VectorOfVariables_SecondOrderCone",
        "test_basic_VectorAffineFunction_SecondOrderCone", # SOC tests fail because of lower bound requirement of RHS var.
        "test_basic_VectorQuadraticFunction_SecondOrderCone",
        "test_basic_VectorAffineFunction_RotatedSecondOrderCone",
        "test_basic_VectorQuadraticFunction_RotatedSecondOrderCone",
        "test_basic_VectorOfVariables_RotatedSecondOrderCone",
        "VectorAffineFunction_SOS",
        "VectorQuadraticFunction_SOS",
        "test_conic_GeometricMeanCone_Vector",
        "test_basic_VectorOfVariables_GeometricMeanCone",
        "test_basic_VectorQuadraticFunction_GeometricMeanCone",
        "test_basic_VectorAffineFunction_GeometricMeanCone",
        "test_conic_SecondOrderCone_nonnegative_post_bound",
        "test_variable_delete_SecondOrderCone",
    ])
    MOIT.runtests(
        BRIDGED,
        CONFIG_BRIDGED,
        warn_unsupported=false,
        exclude = excluded,
    )
end
