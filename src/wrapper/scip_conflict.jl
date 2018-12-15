# Julia wrapper for header: /usr/include/scip/scip_conflict.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConflicthdlr(scip, name, desc, priority, conflictcopy, conflictfree, conflictinit, conflictexit, conflictinitsol, conflictexitsol, conflictexec, conflicthdlrdata)
    ccall((:SCIPincludeConflicthdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONFLICTHDLRDATA}), scip, name, desc, priority, conflictcopy, conflictfree, conflictinit, conflictexit, conflictinitsol, conflictexitsol, conflictexec, conflicthdlrdata)
end

function SCIPincludeConflicthdlrBasic(scip, conflicthdlrptr, name, desc, priority, conflictexec, conflicthdlrdata)
    ccall((:SCIPincludeConflicthdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONFLICTHDLR}}, Cstring, Cstring, Cint, Ptr{Cvoid}, Ptr{SCIP_CONFLICTHDLRDATA}), scip, conflicthdlrptr, name, desc, priority, conflictexec, conflicthdlrdata)
end

function SCIPsetConflicthdlrCopy(scip, conflicthdlr, conflictcopy)
    ccall((:SCIPsetConflicthdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictcopy)
end

function SCIPsetConflicthdlrFree(scip, conflicthdlr, conflictfree)
    ccall((:SCIPsetConflicthdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictfree)
end

function SCIPsetConflicthdlrInit(scip, conflicthdlr, conflictinit)
    ccall((:SCIPsetConflicthdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictinit)
end

function SCIPsetConflicthdlrExit(scip, conflicthdlr, conflictexit)
    ccall((:SCIPsetConflicthdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictexit)
end

function SCIPsetConflicthdlrInitsol(scip, conflicthdlr, conflictinitsol)
    ccall((:SCIPsetConflicthdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictinitsol)
end

function SCIPsetConflicthdlrExitsol(scip, conflicthdlr, conflictexitsol)
    ccall((:SCIPsetConflicthdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictexitsol)
end

function SCIPfindConflicthdlr(scip, name)
    ccall((:SCIPfindConflicthdlr, libscip), Ptr{SCIP_CONFLICTHDLR}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetConflicthdlrs(scip)
    ccall((:SCIPgetConflicthdlrs, libscip), Ptr{Ptr{SCIP_CONFLICTHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNConflicthdlrs(scip)
    ccall((:SCIPgetNConflicthdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetConflicthdlrPriority(scip, conflicthdlr, priority)
    ccall((:SCIPsetConflicthdlrPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Cint), scip, conflicthdlr, priority)
end

function SCIPisConflictAnalysisApplicable(scip)
    ccall((:SCIPisConflictAnalysisApplicable, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPinitConflictAnalysis(scip, conftype, iscutoffinvolved)
    ccall((:SCIPinitConflictAnalysis, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_CONFTYPE, UInt32), scip, conftype, iscutoffinvolved)
end

function SCIPaddConflictLb(scip, var, bdchgidx)
    ccall((:SCIPaddConflictLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}), scip, var, bdchgidx)
end

function SCIPaddConflictRelaxedLb(scip, var, bdchgidx, relaxedlb)
    ccall((:SCIPaddConflictRelaxedLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, bdchgidx, relaxedlb)
end

function SCIPaddConflictUb(scip, var, bdchgidx)
    ccall((:SCIPaddConflictUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}), scip, var, bdchgidx)
end

function SCIPaddConflictRelaxedUb(scip, var, bdchgidx, relaxedub)
    ccall((:SCIPaddConflictRelaxedUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, bdchgidx, relaxedub)
end

function SCIPaddConflictBd(scip, var, boundtype, bdchgidx)
    ccall((:SCIPaddConflictBd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}), scip, var, boundtype, bdchgidx)
end

function SCIPaddConflictRelaxedBd(scip, var, boundtype, bdchgidx, relaxedbd)
    ccall((:SCIPaddConflictRelaxedBd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, boundtype, bdchgidx, relaxedbd)
end

function SCIPaddConflictBinvar(scip, var)
    ccall((:SCIPaddConflictBinvar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPisConflictVarUsed(scip, var, boundtype, bdchgidx, used)
    ccall((:SCIPisConflictVarUsed, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Ptr{UInt32}), scip, var, boundtype, bdchgidx, used)
end

function SCIPgetConflictVarLb(scip, var)
    ccall((:SCIPgetConflictVarLb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetConflictVarUb(scip, var)
    ccall((:SCIPgetConflictVarUb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPanalyzeConflict(scip, validdepth, success)
    ccall((:SCIPanalyzeConflict, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{UInt32}), scip, validdepth, success)
end

function SCIPanalyzeConflictCons(scip, cons, success)
    ccall((:SCIPanalyzeConflictCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{UInt32}), scip, cons, success)
end
