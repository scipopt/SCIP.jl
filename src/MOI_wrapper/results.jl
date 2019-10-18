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

function MOI.get(o::Optimizer, attr::MOI.PrimalStatus)
    return if 1 <= attr.N <= MOI.get(o, MOI.ResultCount())
        MOI.FEASIBLE_POINT
    else
        MOI.NO_SOLUTION
    end
end

function MOI.get(o::Optimizer, ::MOI.ResultCount)::Int
    status = SCIPgetStatus(o)
    if status in [SCIP_STATUS_UNBOUNDED, SCIP_STATUS_INFORUNBD]
        return 0
    end
    return SCIPgetNSols(o)
end

function MOI.get(o::Optimizer, ::MOI.RawStatusString)
    return String(CEnum.enum_name(SCIPgetStatus(o)))
end

function MOI.get(o::Optimizer, attr::MOI.ObjectiveValue)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetSolOrigObj(o, sols[attr.result_index])
end

function MOI.get(o::Optimizer, attr::MOI.VariablePrimal, vi::VI)
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetSolVal(o, sols[attr.N], var(o, vi))
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveBound)
    assert_after_prob(o)
    return SCIPgetDualbound(o)
end

function MOI.get(o::Optimizer, ::MOI.RelativeGap)
    assert_stage(o, [SCIP_STAGE_PRESOLVING, SCIP_STAGE_SOLVING, SCIP_STAGE_SOLVED])
    return SCIPgetGap(o)
end

function MOI.get(o::Optimizer, ::MOI.SolveTime)
    return SCIPgetSolvingTime(o)
end

function MOI.get(o::Optimizer, ::MOI.SimplexIterations)
    assert_stage(o, [SCIP_STAGE_PRESOLVING, SCIP_STAGE_SOLVING, SCIP_STAGE_SOLVED])
    return SCIPgetNLPIterations(o)
end

function MOI.get(o::Optimizer, ::MOI.NodeCount)
    return SCIPgetNNodes(o)
end
