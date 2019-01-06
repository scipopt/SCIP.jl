# Julia wrapper for header: /usr/include/scip/cons_and.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrAnd(scip)
    ccall((:SCIPincludeConshdlrAnd, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsAnd(scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsAnd, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicAnd(scip, cons, name, resvar, nvars, vars)
    ccall((:SCIPcreateConsBasicAnd, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, resvar, nvars, vars)
end

function SCIPgetNVarsAnd(scip, cons)
    ccall((:SCIPgetNVarsAnd, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsAnd(scip, cons)
    ccall((:SCIPgetVarsAnd, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetResultantAnd(scip, cons)
    ccall((:SCIPgetResultantAnd, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisAndConsSorted(scip, cons)
    ccall((:SCIPisAndConsSorted, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsortAndCons(scip, cons)
    ccall((:SCIPsortAndCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgAndConsCheckFlagWhenUpgr(scip, cons, flag)
    ccall((:SCIPchgAndConsCheckFlagWhenUpgr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, UInt32), scip, cons, flag)
end

function SCIPchgAndConsRemovableFlagWhenUpgr(scip, cons, flag)
    ccall((:SCIPchgAndConsRemovableFlagWhenUpgr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, UInt32), scip, cons, flag)
end
