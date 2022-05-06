using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG_DIRECT = MOIT.Config(
    atol=5e-3, rtol=1e-4,
    exclude=Any[
        MOI.ConstraintDual, MOI.ConstraintName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
    ],
)

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(excluded, [
        "test_linear_integration", # Can not delete variable while model contains constraints
        "test_basic_VectorOfVariables_SecondOrderCone",
        "test_conic_SecondOrderCone_nonnegative_post_bound",
        "test_variable_delete_SecondOrderCone",
        "test_modification_func_scalaraffine_",
        "test_modification_func_vectoraffine_",
    ])
    MOIT.runtests(
        OPTIMIZER,
        CONFIG_DIRECT,
        warn_unsupported=false,
        exclude = excluded,
    )

end
