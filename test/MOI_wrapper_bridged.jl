using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(display_verblevel=0), Float64)
const CONFIG_BRIDGED = MOIT.Config(atol=1e-5, rtol=1e-5, exclude=Any[
    MOI.ConstraintDual, MOI.ConstraintName, MOI.VariableName, MOI.DualObjectiveValue, MOI.VariableBasisStatus, MOI.ConstraintBasisStatus,
])

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(excluded, [
        "test_linear_Interval_inactive",
        "test_linear_integration",
        "test_quadratic_duplicate_terms",
        "test_quadratic_nonhomogeneous",
    ])
    MOIT.runtests(
        BRIDGED,
        CONFIG_BRIDGED,
        warn_unsupported=false,
        exclude = excluded,
    )
end
