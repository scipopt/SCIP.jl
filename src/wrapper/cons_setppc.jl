# Julia wrapper for header: /usr/include/scip/cons_setppc.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSetppc(scip)
    ccall((:SCIPincludeConshdlrSetppc, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsSetpart(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetpart, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetpart(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetpart, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPcreateConsSetpack(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetpack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetpack(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetpack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPcreateConsSetcover(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetcover, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetcover(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetcover, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPaddCoefSetppc(scip, cons, var)
    ccall((:SCIPaddCoefSetppc, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSetppc(scip, cons)
    ccall((:SCIPgetNVarsSetppc, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSetppc(scip, cons)
    ccall((:SCIPgetVarsSetppc, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetTypeSetppc(scip, cons)
    ccall((:SCIPgetTypeSetppc, libscip), SCIP_SETPPCTYPE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolSetppc(scip, cons)
    ccall((:SCIPgetDualsolSetppc, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasSetppc(scip, cons)
    ccall((:SCIPgetDualfarkasSetppc, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowSetppc(scip, cons)
    ccall((:SCIPgetRowSetppc, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNFixedonesSetppc(scip, cons)
    ccall((:SCIPgetNFixedonesSetppc, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNFixedzerosSetppc(scip, cons)
    ccall((:SCIPgetNFixedzerosSetppc, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
