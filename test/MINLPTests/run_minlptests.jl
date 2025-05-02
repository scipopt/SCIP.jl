# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

using MINLPTests, JuMP, SCIP, Test

const OPTIMIZER =
    JuMP.optimizer_with_attributes(SCIP.Optimizer, "display/verblevel" => 0)
const OBJTOL = 1e-4
const PRIMALTOL = 1e-3
const DUALTOL = NaN  # to disable the query

MINLPTests.test_directory(
    "nlp",
    OPTIMIZER;
    objective_tol=OBJTOL,
    primal_tol=PRIMALTOL,
    dual_tol=DUALTOL,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    include=["005_010", "007_010"],
)

MINLPTests.test_directory(
    "nlp-cvx",
    OPTIMIZER;
    objective_tol=OBJTOL,
    primal_tol=PRIMALTOL,
    dual_tol=DUALTOL,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    include=[
        "001_010",
        "002_010",
        "101_010",
        "101_012",
        "102_010",
        "102_011",
        "102_012",
        "103_010",
        "103_011",
        "103_012",
        "103_013",
        "103_014",
        "104_010",
        "105_010",
        "105_011",
        "105_012",
        "105_013",
        "201_010",
        "201_011",
        "202_010",
        "202_011",
        "202_012",
        "202_013",
        "202_014",
        "203_010",
        "204_010",
        "205_010",
    ],
)

MINLPTests.test_directory(
    "nlp-mi",
    OPTIMIZER;
    objective_tol=OBJTOL,
    primal_tol=PRIMALTOL,
    dual_tol=DUALTOL,
    termination_target=MINLPTests.TERMINATION_TARGET_GLOBAL,
    primal_target=MINLPTests.PRIMAL_TARGET_GLOBAL,
    include=["005_010", "007_010", "007_020"],
)
