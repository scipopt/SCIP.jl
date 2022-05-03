include("LibSCIP.jl")
using .LibSCIP

const SCIP_ = LibSCIP.SCIP
const TRUE = LibSCIP.TRUE
const FALSE = LibSCIP.FALSE

# SCIP_CALL: macro to check return codes
macro SCIP_CALL(ex)
    quote
        v = $(esc(ex))
        if v != SCIP_OKAY
            s = $(string(ex))
            error("$s yielded SCIP code $v")
        end
    end
end

const SCIP_STATISTICS_FUNCS = [
    :SCIPprintStatusStatistics,
    :SCIPprintTimingStatistics,
    :SCIPprintOrigProblemStatistics,
    :SCIPprintTransProblemStatistics,
    :SCIPprintPresolverStatistics,
    :SCIPprintConstraintStatistics,
    :SCIPprintConstraintTimingStatistics,
    :SCIPprintPropagatorStatistics,
    :SCIPprintConflictStatistics,
    :SCIPprintSeparatorStatistics,
    :SCIPprintPricerStatistics,
    :SCIPprintBranchruleStatistics,
    :SCIPprintHeuristicStatistics,
    :SCIPprintCompressionStatistics,
    :SCIPprintLPStatistics,
    :SCIPprintNLPStatistics,
    :SCIPprintRelaxatorStatistics,
    :SCIPprintTreeStatistics,
    :SCIPprintRootStatistics,
    :SCIPprintSolutionStatistics,
    :SCIPprintConcsolverStatistics,
    :SCIPprintBendersStatistics,
    :SCIPprintStatistics,
    :SCIPprintReoptStatistics,
    :SCIPprintBranchingStatistics
]
