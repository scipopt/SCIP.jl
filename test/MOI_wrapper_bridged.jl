using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

# const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(display_verblevel=0), Float64)
const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(), Float64)
const CONFIG_BRIDGED = MOIT.Config(atol=5e-3, rtol=1e-4, exclude=Any[
    MOI.ConstraintDual, MOI.ConstraintName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
])

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(excluded, [
        "test_linear_Interval_inactive",
        "test_linear_integration", # Can not delete variable while model contains constraints
        "test_model_ordered_indices", # TODO should fix? ListOf in order of creation
        "test_quadratic_duplicate_terms", # Can not delete variable while model contains constraints
        "test_quadratic_nonhomogeneous", # unsupported by bridge
        "ScalarAffineFunction_ZeroOne",
        "ScalarQuadraticFunction_ZeroOne",
        "VectorAffineFunction_NormOneCone",
        "VectorQuadraticFunction_NormOneCone",
        "VectorAffineFunction_SOS",
        "VectorQuadraticFunction_SOS",
        "test_conic_GeometricMeanCone_Vector",
        "test_basic_VectorOfVariables_GeometricMeanCone",
        "test_basic_VectorQuadraticFunction_GeometricMeanCone",
        "test_basic_VectorAffineFunction_GeometricMeanCone",
        "test_conic_SecondOrderCone_nonnegative_post_bound",
        "test_variable_delete_SecondOrderCone",
        "test_modification_func_scalaraffine_",
        "test_modification_func_vectoraffine_",
    ])
    MOIT.runtests(
        BRIDGED,
        CONFIG_BRIDGED,
        warn_unsupported=false,
        exclude = excluded,
    )
end
