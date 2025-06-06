# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

const _TERMINATION_STATUS_MAP = Dict(
    SCIP_STATUS_UNKNOWN => MOI.OTHER_ERROR,
    SCIP_STATUS_USERINTERRUPT => MOI.INTERRUPTED,
    SCIP_STATUS_NODELIMIT => MOI.NODE_LIMIT,
    SCIP_STATUS_TOTALNODELIMIT => MOI.NODE_LIMIT,
    SCIP_STATUS_STALLNODELIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_TIMELIMIT => MOI.TIME_LIMIT,
    SCIP_STATUS_MEMLIMIT => MOI.MEMORY_LIMIT,
    SCIP_STATUS_GAPLIMIT => MOI.OPTIMAL,
    SCIP_STATUS_SOLLIMIT => MOI.SOLUTION_LIMIT,
    SCIP_STATUS_BESTSOLLIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_RESTARTLIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_OPTIMAL => MOI.OPTIMAL,
    SCIP_STATUS_INFEASIBLE => MOI.INFEASIBLE,
    SCIP_STATUS_UNBOUNDED => MOI.DUAL_INFEASIBLE,
    SCIP_STATUS_INFORUNBD => MOI.INFEASIBLE_OR_UNBOUNDED,
    SCIP_STATUS_TERMINATE => MOI.INTERRUPTED,
)

function MOI.get(o::Optimizer, ::MOI.TerminationStatus)
    if o.scip_solve_status == _kSCIP_SOLVE_STATUS_NOT_CALLED
        return MOI.OPTIMIZE_NOT_CALLED
    end
    return _TERMINATION_STATUS_MAP[SCIPgetStatus(o)]
end

function MOI.get(o::Optimizer, attr::MOI.PrimalStatus)
    if 1 <= attr.result_index <= MOI.get(o, MOI.ResultCount())
        return MOI.FEASIBLE_POINT
    end
    return MOI.NO_SOLUTION
end

MOI.get(::Optimizer, ::MOI.DualStatus) = MOI.NO_SOLUTION

function MOI.get(o::Optimizer, ::MOI.ResultCount)::Int
    status = SCIPgetStatus(o)
    if status in (SCIP_STATUS_UNBOUNDED, SCIP_STATUS_INFORUNBD)
        return 0
    end
    return SCIPgetNSols(o)
end

MOI.get(o::Optimizer, ::MOI.RawStatusString) = string(SCIPgetStatus(o))

"Make sure that SCIP is currently in one of the allowed stages."
function assert_stage(o::Optimizer, stages)
    stage = SCIPgetStage(o)
    if !(stage in stages)
        error("SCIP is wrong stage ($stage, need $stages)!")
    end
    return
end

"Make sure that the problem was solved (SCIP is in SOLVED stage)."
function assert_solved(o::Optimizer)
    # SCIP's stage is SCIP_STAGE_SOLVING when stopped by user limit!
    assert_stage(
        o,
        (
            SCIP_STAGE_PRESOLVING,
            SCIP_STAGE_SOLVING,
            SCIP_STAGE_PRESOLVED,
            SCIP_STAGE_SOLVED,
        ),
    )
    # Check for invalid status (when stage is SCIP_STAGE_SOLVING).
    status = SCIPgetStatus(o)
    if status in
       (SCIP_STATUS_UNKNOWN, SCIP_STATUS_USERINTERRUPT, SCIP_STATUS_TERMINATE)
        error("SCIP's solving was interrupted, but not by a user-given limit!")
    end
    return
end

function MOI.get(o::Optimizer, attr::MOI.ObjectiveValue)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetSolOrigObj(o, sols[attr.result_index])
end

function MOI.get(o::Optimizer, attr::MOI.VariablePrimal, vi::MOI.VariableIndex)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetSolVal(o, sols[attr.result_index], var(o, vi))
end

function MOI.get(
    o::Optimizer,
    attr::MOI.ConstraintPrimal,
    ci::MOI.ConstraintIndex{MOI.VariableIndex,<:BOUNDS},
)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetSolVal(
        o,
        sols[attr.result_index],
        var(o, MOI.VariableIndex(ci.value)),
    )
end

function MOI.get(
    o::Optimizer,
    attr::MOI.ConstraintPrimal,
    ci::MOI.ConstraintIndex{<:MOI.ScalarAffineFunction{Float64},<:BOUNDS},
)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetActivityLinear(o, cons(o, ci), sols[attr.result_index])
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveBound)
    # Make sure that: TRANSFORMED ≤ stage ≤ SOLVED
    assert_stage(o, SCIP_Stage.(3:10))
    return SCIPgetDualbound(o)
end

function MOI.get(o::Optimizer, ::MOI.RelativeGap)
    assert_stage(
        o,
        (SCIP_STAGE_PRESOLVING, SCIP_STAGE_SOLVING, SCIP_STAGE_SOLVED),
    )
    return SCIPgetGap(o)
end

function MOI.get(o::Optimizer, ::MOI.SolveTimeSec)
    return SCIPgetSolvingTime(o)
end

function MOI.get(o::Optimizer, ::MOI.SimplexIterations)::Int64
    assert_stage(
        o,
        (SCIP_STAGE_PRESOLVING, SCIP_STAGE_SOLVING, SCIP_STAGE_SOLVED),
    )
    return SCIPgetNLPIterations(o)
end

MOI.get(o::Optimizer, ::MOI.NodeCount)::Int64 = SCIPgetNNodes(o)
