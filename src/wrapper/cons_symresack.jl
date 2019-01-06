# Julia wrapper for header: /usr/include/scip/cons_symresack.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSymresack(scip)
    ccall((:SCIPincludeConshdlrSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateSymbreakCons(scip, cons, name, perm, vars, nvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateSymbreakCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, perm, vars, nvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsSymresack(scip, cons, name, perm, vars, nvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, perm, vars, nvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSymresack(scip, cons, name, perm, vars, nvars)
    ccall((:SCIPcreateConsBasicSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint), scip, cons, name, perm, vars, nvars)
end
