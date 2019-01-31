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

function MOI.get(o::Optimizer, ::MOI.ObjectiveValue)
    return SCIPgetSolOrigObj(o, SCIPgetBestSol(o))
end

function MOI.get(o::Optimizer, ::MOI.VariablePrimal, vi::VI)
    return SCIPgetSolVal(o, SCIPgetBestSol(o), var(o, vi))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SVF,<:BOUNDS})
    return SCIPgetSolVal(o, SCIPgetBestSol(o), var(o, VI(ci.value)))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{SAF,<:BOUNDS})
    return SCIPgetActivityLinear(o, cons(o, ci), SCIPgetBestSol(o))
end

MOI.get(o::Optimizer, ::MOI.ObjectiveBound) = SCIPgetDualbound(o)
MOI.get(o::Optimizer, ::MOI.RelativeGap) = SCIPgetGap(o)
MOI.get(o::Optimizer, ::MOI.SolveTime) = SCIPgetSolvingTime(o)
MOI.get(o::Optimizer, ::MOI.SimplexIterations) = SCIPgetNLPIterations(o)
MOI.get(o::Optimizer, ::MOI.NodeCount) = SCIPgetNNodes(o)
