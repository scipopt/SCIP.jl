using MathOptInterface
const MOI = MathOptInterface

@testset "MOI_wrapper_cached" begin
    MOI.Test.runtests(
        MOI.Bridges.full_bridge_optimizer(
            MOI.Utilities.CachingOptimizer(
                MOI.Utilities.UniversalFallback(MOI.Utilities.Model{Float64}()),
                SCIP.Optimizer(; display_verblevel=0),
            ),
            Float64,
        ),
        MOI.Test.Config(;
            atol=5e-3,
            rtol=1e-4,
            exclude=Any[
                MOI.ConstraintDual,
                MOI.DualObjectiveValue,
                MOI.VariableBasisStatus,
                MOI.ConstraintBasisStatus,
            ],
        );
        exclude=[
            # Upstream problem in MOI.Test: InexactError: trunc(Int64, 1.0e20)
            "test_cpsat_CountGreaterThan",
            # SCIP does not support nonlinear objective functions.
            "test_nonlinear_hs071_NLPBlockDual",
            "test_nonlinear_invalid",
            "test_nonlinear_objective",
            "test_nonlinear_objective_and_moi_objective_test",
            "test_linear_Indicator_ON_ZERO", # error on SCIP
        ],
    )
end
