# Julia wrapper for header: /usr/include/scip/scip_probing.h
# Automatically generated using Clang.jl wrap_c


function SCIPinProbing(scip)
    ccall((:SCIPinProbing, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPstartProbing(scip)
    ccall((:SCIPstartProbing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPnewProbingNode(scip)
    ccall((:SCIPnewProbingNode, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetProbingDepth(scip)
    ccall((:SCIPgetProbingDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPbacktrackProbing(scip, probingdepth)
    ccall((:SCIPbacktrackProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint), scip, probingdepth)
end

function SCIPendProbing(scip)
    ccall((:SCIPendProbing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgVarLbProbing(scip, var, newbound)
    ccall((:SCIPchgVarLbProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbProbing(scip, var, newbound)
    ccall((:SCIPchgVarUbProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPgetVarObjProbing(scip, var)
    ccall((:SCIPgetVarObjProbing, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPfixVarProbing(scip, var, fixedval)
    ccall((:SCIPfixVarProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, fixedval)
end

function SCIPchgVarObjProbing(scip, var, newobj)
    ccall((:SCIPchgVarObjProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPisObjChangedProbing(scip)
    ccall((:SCIPisObjChangedProbing, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPpropagateProbing(scip, maxproprounds, cutoff, ndomredsfound)
    ccall((:SCIPpropagateProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{UInt32}, Ptr{Clonglong}), scip, maxproprounds, cutoff, ndomredsfound)
end

function SCIPpropagateProbingImplications(scip, cutoff)
    ccall((:SCIPpropagateProbingImplications, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), scip, cutoff)
end

function SCIPsolveProbingLP(scip, itlim, lperror, cutoff)
    ccall((:SCIPsolveProbingLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{UInt32}, Ptr{UInt32}), scip, itlim, lperror, cutoff)
end

function SCIPsolveProbingLPWithPricing(scip, pretendroot, displayinfo, maxpricerounds, lperror, cutoff)
    ccall((:SCIPsolveProbingLPWithPricing, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32, UInt32, Cint, Ptr{UInt32}, Ptr{UInt32}), scip, pretendroot, displayinfo, maxpricerounds, lperror, cutoff)
end

function SCIPsetProbingLPState(scip, lpistate, lpinorms, primalfeas, dualfeas)
    ccall((:SCIPsetProbingLPState, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_LPISTATE}}, Ptr{Ptr{SCIP_LPINORMS}}, UInt32, UInt32), scip, lpistate, lpinorms, primalfeas, dualfeas)
end

function SCIPaddRowProbing(scip, row)
    ccall((:SCIPaddRowProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPapplyCutsProbing(scip, cutoff)
    ccall((:SCIPapplyCutsProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), scip, cutoff)
end

function SCIPsolveProbingRelax(scip, cutoff)
    ccall((:SCIPsolveProbingRelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), scip, cutoff)
end

function SCIPgetDivesetScore(scip, diveset, divetype, divecand, divecandsol, divecandfrac, candscore, roundup)
    ccall((:SCIPgetDivesetScore, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, SCIP_DIVETYPE, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{UInt32}), scip, diveset, divetype, divecand, divecandsol, divecandfrac, candscore, roundup)
end

function SCIPupdateDivesetLPStats(scip, diveset, niterstoadd)
    ccall((:SCIPupdateDivesetLPStats, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Clonglong), scip, diveset, niterstoadd)
end

function SCIPupdateDivesetStats(scip, diveset, nprobingnodes, nbacktracks, nsolsfound, nbestsolsfound, nconflictsfound, leavewassol)
    ccall((:SCIPupdateDivesetStats, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Cint, Cint, Clonglong, Clonglong, Clonglong, UInt32), scip, diveset, nprobingnodes, nbacktracks, nsolsfound, nbestsolsfound, nconflictsfound, leavewassol)
end

function SCIPgetDiveBoundChanges(scip, diveset, sol, success, infeasible)
    ccall((:SCIPgetDiveBoundChanges, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Ptr{SCIP_SOL}, Ptr{UInt32}, Ptr{UInt32}), scip, diveset, sol, success, infeasible)
end

function SCIPaddDiveBoundChange(scip, var, dir, value, preferred)
    ccall((:SCIPaddDiveBoundChange, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cdouble, UInt32), scip, var, dir, value, preferred)
end

function SCIPgetDiveBoundChangeData(scip, variables, directions, values, ndivebdchgs, preferred)
    ccall((:SCIPgetDiveBoundChangeData, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{SCIP_BRANCHDIR}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, UInt32), scip, variables, directions, values, ndivebdchgs, preferred)
end

function SCIPclearDiveBoundChanges(scip)
    ccall((:SCIPclearDiveBoundChanges, libscip), Cvoid, (Ptr{SCIP},), scip)
end
