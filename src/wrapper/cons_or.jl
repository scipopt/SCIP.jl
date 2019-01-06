# Julia wrapper for header: /usr/include/scip/cons_or.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrOr(scip)
    ccall((:SCIPincludeConshdlrOr, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsOr(scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOr(scip, cons, name, resvar, nvars, vars)
    ccall((:SCIPcreateConsBasicOr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, resvar, nvars, vars)
end

function SCIPgetNVarsOr(scip, cons)
    ccall((:SCIPgetNVarsOr, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsOr(scip, cons)
    ccall((:SCIPgetVarsOr, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetResultantOr(scip, cons)
    ccall((:SCIPgetResultantOr, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
