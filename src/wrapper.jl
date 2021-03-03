
include("CEnum.jl")
using .CEnum

# SCIP_CALL: macro to check return codes, inspired by @assert
macro SC(ex)
    return :(@assert $(esc(ex)) == SCIP_OKAY)
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
