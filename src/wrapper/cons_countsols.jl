# Julia wrapper for header: /usr/include/scip/cons_countsols.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrCountsols(scip)
    ccall((:SCIPincludeConshdlrCountsols, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPdialogExecCountPresolve(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecCountPresolve, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPdialogExecCount(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecCount, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPdialogExecWriteAllsolutions(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecWriteAllsolutions, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPcount(scip)
    ccall((:SCIPcount, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPgetNCountedSols(scip, valid)
    ccall((:SCIPgetNCountedSols, libscip), Clonglong, (Ptr{SCIP_}, Ptr{UInt32}), scip, valid)
end

function SCIPgetNCountedSolsstr(scip, buffer, buffersize, requiredsize)
    ccall((:SCIPgetNCountedSolsstr, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Cstring}, Cint, Ptr{Cint}), scip, buffer, buffersize, requiredsize)
end

function SCIPgetNCountedFeasSubtrees(scip)
    ccall((:SCIPgetNCountedFeasSubtrees, libscip), Clonglong, (Ptr{SCIP_},), scip)
end

function SCIPgetCountedSparseSols(scip, vars, nvars, sols, nsols)
    ccall((:SCIPgetCountedSparseSols, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Ptr{Ptr{SCIP_SPARSESOL}}}, Ptr{Cint}), scip, vars, nvars, sols, nsols)
end

function SCIPsetParamsCountsols(scip)
    ccall((:SCIPsetParamsCountsols, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end
