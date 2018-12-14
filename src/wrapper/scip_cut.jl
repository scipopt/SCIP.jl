# Julia wrapper for header: /usr/include/scip/scip_cut.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPgetCutEfficacy(scip, sol, cut)
    ccall((:SCIPgetCutEfficacy, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}), scip, sol, cut)
end

function SCIPisCutEfficacious(scip, sol, cut)
    ccall((:SCIPisCutEfficacious, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}), scip, sol, cut)
end

function SCIPisEfficacious(scip, efficacy::Cdouble)
    ccall((:SCIPisEfficacious, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, efficacy)
end

function SCIPgetVectorEfficacyNorm(scip, vals, nvals::Cint)
    ccall((:SCIPgetVectorEfficacyNorm, libscip), Cdouble, (Ptr{SCIP}, Ptr{Cdouble}, Cint), scip, vals, nvals)
end

function SCIPisCutApplicable(scip, cut)
    ccall((:SCIPisCutApplicable, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, cut)
end

function SCIPaddCut(scip, sol, cut, forcecut::UInt32, infeasible)
    ccall((:SCIPaddCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}, UInt32, Ptr{UInt32}), scip, sol, cut, forcecut, infeasible)
end

function SCIPaddRow(scip, row, forcecut::UInt32, infeasible)
    ccall((:SCIPaddRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, UInt32, Ptr{UInt32}), scip, row, forcecut, infeasible)
end

function SCIPisCutNew(scip, row)
    ccall((:SCIPisCutNew, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPaddPoolCut(scip, row)
    ccall((:SCIPaddPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPdelPoolCut(scip, row)
    ccall((:SCIPdelPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetPoolCuts(scip)
    ccall((:SCIPgetPoolCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPoolCuts(scip)
    ccall((:SCIPgetNPoolCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetGlobalCutpool(scip)
    ccall((:SCIPgetGlobalCutpool, libscip), Ptr{SCIP_CUTPOOL}, (Ptr{SCIP},), scip)
end

function SCIPcreateCutpool(scip, cutpool, agelimit::Cint)
    ccall((:SCIPcreateCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CUTPOOL}}, Cint), scip, cutpool, agelimit)
end

function SCIPfreeCutpool(scip, cutpool)
    ccall((:SCIPfreeCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CUTPOOL}}), scip, cutpool)
end

function SCIPaddRowCutpool(scip, cutpool, row)
    ccall((:SCIPaddRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPaddNewRowCutpool(scip, cutpool, row)
    ccall((:SCIPaddNewRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPdelRowCutpool(scip, cutpool, row)
    ccall((:SCIPdelRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPseparateCutpool(scip, cutpool, result)
    ccall((:SCIPseparateCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_RESULT}), scip, cutpool, result)
end

function SCIPseparateSolCutpool(scip, cutpool, sol, result)
    ccall((:SCIPseparateSolCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}), scip, cutpool, sol, result)
end

function SCIPaddDelayedPoolCut(scip, row)
    ccall((:SCIPaddDelayedPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPdelDelayedPoolCut(scip, row)
    ccall((:SCIPdelDelayedPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetDelayedPoolCuts(scip)
    ccall((:SCIPgetDelayedPoolCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP},), scip)
end

function SCIPgetNDelayedPoolCuts(scip)
    ccall((:SCIPgetNDelayedPoolCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetDelayedGlobalCutpool(scip)
    ccall((:SCIPgetDelayedGlobalCutpool, libscip), Ptr{SCIP_CUTPOOL}, (Ptr{SCIP},), scip)
end

function SCIPseparateSol(scip, sol, pretendroot::UInt32, allowlocal::UInt32, onlydelayed::UInt32, delayed, cutoff)
    ccall((:SCIPseparateSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, UInt32, UInt32, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, sol, pretendroot, allowlocal, onlydelayed, delayed, cutoff)
end

function SCIPgetCuts(scip)
    ccall((:SCIPgetCuts, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNCuts(scip)
    ccall((:SCIPgetNCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPclearCuts(scip)
    ccall((:SCIPclearCuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPremoveInefficaciousCuts(scip)
    ccall((:SCIPremoveInefficaciousCuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end
