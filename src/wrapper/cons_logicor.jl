# Julia wrapper for header: /usr/include/scip/cons_logicor.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrLogicor(scip)
    ccall((:SCIPincludeConshdlrLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsLogicor(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLogicor(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPaddCoefLogicor(scip, cons, var)
    ccall((:SCIPaddCoefLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsLogicor(scip, cons)
    ccall((:SCIPgetNVarsLogicor, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsLogicor(scip, cons)
    ccall((:SCIPgetVarsLogicor, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolLogicor(scip, cons)
    ccall((:SCIPgetDualsolLogicor, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasLogicor(scip, cons)
    ccall((:SCIPgetDualfarkasLogicor, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowLogicor(scip, cons)
    ccall((:SCIPgetRowLogicor, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
