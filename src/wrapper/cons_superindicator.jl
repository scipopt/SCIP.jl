# Julia wrapper for header: /usr/include/scip/cons_superindicator.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSuperindicator(scip)
    ccall((:SCIPincludeConshdlrSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsSuperindicator(scip, cons, name, binvar, slackcons, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, binvar, slackcons, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSuperindicator(scip, cons, name, binvar, slackcons)
    ccall((:SCIPcreateConsBasicSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}), scip, cons, name, binvar, slackcons)
end

function SCIPgetBinaryVarSuperindicator(cons)
    ccall((:SCIPgetBinaryVarSuperindicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPgetSlackConsSuperindicator(cons)
    ccall((:SCIPgetSlackConsSuperindicator, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_CONS},), cons)
end

function SCIPtransformMinUC(scip, success)
    ccall((:SCIPtransformMinUC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{UInt32}), scip, success)
end

function SCIPdialogExecChangeMinUC(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecChangeMinUC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end
