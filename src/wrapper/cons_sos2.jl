# Julia wrapper for header: /usr/include/scip/cons_sos2.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSOS2(scip)
    ccall((:SCIPincludeConshdlrSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsSOS2(scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSOS2(scip, cons, name, nvars, vars, weights)
    ccall((:SCIPcreateConsBasicSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, weights)
end

function SCIPaddVarSOS2(scip, cons, var, weight)
    ccall((:SCIPaddVarSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, weight)
end

function SCIPappendVarSOS2(scip, cons, var)
    ccall((:SCIPappendVarSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSOS2(scip, cons)
    ccall((:SCIPgetNVarsSOS2, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSOS2(scip, cons)
    ccall((:SCIPgetVarsSOS2, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsSOS2(scip, cons)
    ccall((:SCIPgetWeightsSOS2, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
