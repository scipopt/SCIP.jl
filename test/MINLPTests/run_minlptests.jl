# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

import JuMP
import MINLPTests
import SCIP

MINLPTests.test_directory(
    "nlp",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-5,
    primal_tol=1e-5,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    exclude=[
        # Nonlinear objective not supported by SCIP.jl!
        "001_010",
        "003_010",
        "003_011",
        "003_013",
        "003_015",
        "004_010",
        "004_011",
        "008_010",
        "008_011",
        "009_010",
        "009_011",
        # User-defined function
        "006_010",
    ],
)

MINLPTests.test_directory(
    "nlp-expr",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-3,
    primal_tol=1e-3,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    exclude=[
        # MOI.UnsupportedNonlinearOperator(:tan)
        "004_010",
        "004_011",
        # MOI.UnsupportedNonlinearOperator(:inv)
        "005_010",
        # User-defined function
        "006_010",
        # MOI.UnsupportedNonlinearOperator(:min)
        "009_010",
        # MOI.UnsupportedNonlinearOperator(:max)
        "009_011",
    ],
)

MINLPTests.test_directory(
    "nlp-cvx",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-4,
    primal_tol=1e-3,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    exclude=[
        # Nonlinear objective not supported by SCIP.jl!
        "109_010",
        "109_011",
        "109_012",
        "110_010",
        "110_011",
        "110_012",
    ],
)

MINLPTests.test_directory(
    "nlp-cvx-expr",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-4,
    primal_tol=1e-3,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
)

MINLPTests.test_directory(
    "nlp-mi",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-4,
    primal_tol=1e-3,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    exclude=[
        # Nonlinear objective not supported by SCIP.jl!
        "001_010",
        "003_010",
        "003_011",
        "003_013",
        "003_015",
        "004_010",
        "004_011",
        # User-defined function
        "006_010",
    ],
)

MINLPTests.test_directory(
    "nlp-mi-expr",
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0);
    objective_tol=1e-4,
    primal_tol=1e-3,
    dual_tol=NaN,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    exclude=[
        # Fails because of the periodicity in cos(y). We chould fix this in
        # MINLPTests by finitely bounding the `y` variable. Currently it is just
        # y >= 0.1
        "001_010",
        # MOI.UnsupportedNonlinearOperator(:tan)
        "004_010",
        "004_011",
        # MOI.UnsupportedNonlinearOperator(:inv)
        "005_010",
        # User-defined function
        "006_010",
    ],
)
