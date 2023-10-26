# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

import MathOptInterface as MOI

const BRIDGED = MOI.Bridges.full_bridge_optimizer(
    SCIP.Optimizer(; display_verblevel=0),
    Float64,
)
const CONFIG_BRIDGED = MOI.Test.Config(;
    atol=5e-3,
    rtol=1e-4,
    exclude=Any[
        MOI.ConstraintDual,
        MOI.ConstraintName,
        MOI.DualObjectiveValue,
        MOI.VariableBasisStatus,
        MOI.ConstraintBasisStatus,
    ],
)

@testset "MOI unit tests" begin
    excluded = copy(MOI_BASE_EXCLUDED)
    append!(
        excluded,
        [
            "test_linear_Interval_inactive",
            # Can not delete variable while model contains constraints
            "test_linear_integration",
            "test_basic_ScalarQuadraticFunction_ZeroOne",
            "test_basic_VectorAffineFunction_NormOneCone",
            "test_basic_VectorAffineFunction_SOS1",
            "test_basic_VectorAffineFunction_SOS2",
            "test_basic_VectorQuadraticFunction_NormOneCone",
            "test_basic_VectorQuadraticFunction_SOS1",
            "test_basic_VectorQuadraticFunction_SOS2",
            "test_quadratic_duplicate_terms", # Can not delete variable while model contains constraints
            "test_quadratic_nonhomogeneous", # unsupported by bridge
            "ScalarAffineFunction_ZeroOne",
            "test_model_delete",
            "test_conic_GeometricMeanCone_Vector",
            "test_basic_VectorOfVariables_GeometricMeanCone",
            "test_basic_VectorQuadraticFunction_GeometricMeanCone",
            "test_basic_VectorAffineFunction_GeometricMeanCone",
            "test_variable_delete_SecondOrderCone",
            "test_linear_Indicator_ON_ZERO",
        ],
    )
    MOI.Test.runtests(
        BRIDGED,
        CONFIG_BRIDGED;
        warn_unsupported=false,
        exclude=excluded,
    )
end
