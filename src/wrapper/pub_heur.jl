# Julia wrapper for header: /usr/include/scip/pub_heur.h
# Automatically generated using Clang.jl wrap_c


function SCIPheurComp(elem1, elem2)
    ccall((:SCIPheurComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPheurCompName(elem1, elem2)
    ccall((:SCIPheurCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPheurGetData(heur)
    ccall((:SCIPheurGetData, libscip), Ptr{SCIP_HEURDATA}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetData(heur, heurdata)
    ccall((:SCIPheurSetData, libscip), Cvoid, (Ptr{SCIP_HEUR}, Ptr{SCIP_HEURDATA}), heur, heurdata)
end

function SCIPheurGetName(heur)
    ccall((:SCIPheurGetName, libscip), Cstring, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDesc(heur)
    ccall((:SCIPheurGetDesc, libscip), Cstring, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDispchar(heur)
    ccall((:SCIPheurGetDispchar, libscip), UInt8, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetTimingmask(heur)
    ccall((:SCIPheurGetTimingmask, libscip), SCIP_HEURTIMING, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetTimingmask(heur, timingmask)
    ccall((:SCIPheurSetTimingmask, libscip), Cvoid, (Ptr{SCIP_HEUR}, SCIP_HEURTIMING), heur, timingmask)
end

function SCIPheurUsesSubscip(heur)
    ccall((:SCIPheurUsesSubscip, libscip), UInt32, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetPriority(heur)
    ccall((:SCIPheurGetPriority, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetFreq(heur)
    ccall((:SCIPheurGetFreq, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetFreq(heur, freq)
    ccall((:SCIPheurSetFreq, libscip), Cvoid, (Ptr{SCIP_HEUR}, Cint), heur, freq)
end

function SCIPheurGetFreqofs(heur)
    ccall((:SCIPheurGetFreqofs, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetMaxdepth(heur)
    ccall((:SCIPheurGetMaxdepth, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNCalls(heur)
    ccall((:SCIPheurGetNCalls, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNSolsFound(heur)
    ccall((:SCIPheurGetNSolsFound, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNBestSolsFound(heur)
    ccall((:SCIPheurGetNBestSolsFound, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurIsInitialized(heur)
    ccall((:SCIPheurIsInitialized, libscip), UInt32, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetSetupTime(heur)
    ccall((:SCIPheurGetSetupTime, libscip), Cdouble, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetTime(heur)
    ccall((:SCIPheurGetTime, libscip), Cdouble, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDivesets(heur)
    ccall((:SCIPheurGetDivesets, libscip), Ptr{Ptr{SCIP_DIVESET}}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNDivesets(heur)
    ccall((:SCIPheurGetNDivesets, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPdivesetGetHeur(diveset)
    ccall((:SCIPdivesetGetHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetWorkSolution(diveset)
    ccall((:SCIPdivesetGetWorkSolution, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetSetWorkSolution(diveset, sol)
    ccall((:SCIPdivesetSetWorkSolution, libscip), Cvoid, (Ptr{SCIP_DIVESET}, Ptr{SCIP_SOL}), diveset, sol)
end

function SCIPdivesetGetName(diveset)
    ccall((:SCIPdivesetGetName, libscip), Cstring, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMinRelDepth(diveset)
    ccall((:SCIPdivesetGetMinRelDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxRelDepth(diveset)
    ccall((:SCIPdivesetGetMaxRelDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetSolSuccess(diveset)
    ccall((:SCIPdivesetGetSolSuccess, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNCalls(diveset)
    ccall((:SCIPdivesetGetNCalls, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNSolutionCalls(diveset)
    ccall((:SCIPdivesetGetNSolutionCalls, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMinDepth(diveset)
    ccall((:SCIPdivesetGetMinDepth, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxDepth(diveset)
    ccall((:SCIPdivesetGetMaxDepth, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgDepth(diveset)
    ccall((:SCIPdivesetGetAvgDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMinSolutionDepth(diveset)
    ccall((:SCIPdivesetGetMinSolutionDepth, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxSolutionDepth(diveset)
    ccall((:SCIPdivesetGetMaxSolutionDepth, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgSolutionDepth(diveset)
    ccall((:SCIPdivesetGetAvgSolutionDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNLPIterations(diveset)
    ccall((:SCIPdivesetGetNLPIterations, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNProbingNodes(diveset)
    ccall((:SCIPdivesetGetNProbingNodes, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNBacktracks(diveset)
    ccall((:SCIPdivesetGetNBacktracks, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNConflicts(diveset)
    ccall((:SCIPdivesetGetNConflicts, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetNSols(diveset)
    ccall((:SCIPdivesetGetNSols, libscip), Clonglong, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxLPIterQuot(diveset)
    ccall((:SCIPdivesetGetMaxLPIterQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxLPIterOffset(diveset)
    ccall((:SCIPdivesetGetMaxLPIterOffset, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetUbQuotNoSol(diveset)
    ccall((:SCIPdivesetGetUbQuotNoSol, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgQuotNoSol(diveset)
    ccall((:SCIPdivesetGetAvgQuotNoSol, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetUbQuot(diveset)
    ccall((:SCIPdivesetGetUbQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgQuot(diveset)
    ccall((:SCIPdivesetGetAvgQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetUseBacktrack(diveset)
    ccall((:SCIPdivesetUseBacktrack, libscip), UInt32, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetLPSolveFreq(diveset)
    ccall((:SCIPdivesetGetLPSolveFreq, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetLPResolveDomChgQuot(diveset)
    ccall((:SCIPdivesetGetLPResolveDomChgQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetUseOnlyLPBranchcands(diveset)
    ccall((:SCIPdivesetUseOnlyLPBranchcands, libscip), UInt32, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetSupportsType(diveset, divetype)
    ccall((:SCIPdivesetSupportsType, libscip), UInt32, (Ptr{SCIP_DIVESET}, SCIP_DIVETYPE), diveset, divetype)
end

function SCIPdivesetGetRandnumgen(diveset)
    ccall((:SCIPdivesetGetRandnumgen, libscip), Ptr{SCIP_RANDNUMGEN}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPvariablegraphBreadthFirst(scip, vargraph, startvars, nstartvars, distances, maxdistance, maxvars, maxbinintvars)
    ccall((:SCIPvariablegraphBreadthFirst, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VGRAPH}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Cint, Cint, Cint), scip, vargraph, startvars, nstartvars, distances, maxdistance, maxvars, maxbinintvars)
end

function SCIPvariableGraphCreate(scip, vargraph, relaxdenseconss, relaxdensity, nrelaxedconstraints)
    ccall((:SCIPvariableGraphCreate, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_VGRAPH}}, UInt32, Cdouble, Ptr{Cint}), scip, vargraph, relaxdenseconss, relaxdensity, nrelaxedconstraints)
end

function SCIPvariableGraphFree(scip, vargraph)
    ccall((:SCIPvariableGraphFree, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Ptr{SCIP_VGRAPH}}), scip, vargraph)
end
