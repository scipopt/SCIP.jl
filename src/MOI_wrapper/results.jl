# results

term_status_map = Dict(
    SCIP_STATUS_UNKNOWN => MOI.OPTIMIZE_NOT_CALLED,
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
    return term_status_map[SCIPgetStatus(o)]
end

function MOI.get(o::Optimizer, ::MOI.PrimalStatus)
    return SCIPgetNSols(o) > 0 ? MOI.FEASIBLE_POINT : MOI.NO_SOLUTION
end

function MOI.get(o::Optimizer, ::MOI.ResultCount)
    status = SCIPgetStatus(o)
    if status in [SCIP_STATUS_UNBOUNDED, SCIP_STATUS_INFORUNBD]
        return 0
    end
    return SCIPgetNSols(o)
end

"Make sure that the problem was solved (SCIP is in SOLVED stage)."
function assert_optimized(o::Optimizer)
    if SCIPgetStage(o) != SCIP_STAGE_SOLVED
        error("SCIP is not in `SOLVED` stage: can not query results!")
    end
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveValue)
    assert_optimized(o)
    return SCIPgetSolOrigObj(o, SCIPgetBestSol(o))
end

function MOI.get(o::Optimizer, ::MOI.VariablePrimal, vi::VI)
    assert_optimized(o)
    return SCIPgetSolVal(o, SCIPgetBestSol(o), var(o, vi))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SVF,<:BOUNDS})
    assert_optimized(o)
    return SCIPgetSolVal(o, SCIPgetBestSol(o), var(o, VI(ci.value)))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SAF,<:BOUNDS})
    assert_optimized(o)
    return SCIPgetActivityLinear(o, cons(o, ci), SCIPgetBestSol(o))
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveBound)
    assert_optimized(o)
    return SCIPgetDualbound(o)
end

function MOI.get(o::Optimizer, ::MOI.RelativeGap)
    assert_optimized(o)
    return SCIPgetGap(o)
end

function MOI.get(o::Optimizer, ::MOI.SolveTime)
    assert_optimized(o)
    return SCIPgetSolvingTime(o)
end

function MOI.get(o::Optimizer, ::MOI.SimplexIterations)
    assert_optimized(o)
    return SCIPgetNLPIterations(o)
end

function MOI.get(o::Optimizer, ::MOI.NodeCount)
    assert_optimized(o)
    return SCIPgetNNodes(o)
end
