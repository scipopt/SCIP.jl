# Julia wrapper for header: /usr/include/scip/cons_xor.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrXor(scip)
    ccall((:SCIPincludeConshdlrXor, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsXor(scip, cons, name, rhs, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsXor, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, UInt32, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, rhs, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicXor(scip, cons, name, rhs, nvars, vars)
    ccall((:SCIPcreateConsBasicXor, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, UInt32, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, rhs, nvars, vars)
end

function SCIPgetNVarsXor(scip, cons)
    ccall((:SCIPgetNVarsXor, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsXor(scip, cons)
    ccall((:SCIPgetVarsXor, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetIntVarXor(scip, cons)
    ccall((:SCIPgetIntVarXor, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsXor(scip, cons)
    ccall((:SCIPgetRhsXor, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
