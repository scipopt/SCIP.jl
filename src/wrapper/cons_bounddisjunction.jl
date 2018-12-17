# Julia wrapper for header: /usr/include/scip/cons_bounddisjunction.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrBounddisjunction(scip)
    ccall((:SCIPincludeConshdlrBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsBounddisjunction(scip, cons, name, nvars, vars, boundtypes, bounds, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cdouble}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, boundtypes, bounds, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicBounddisjunction(scip, cons, name, nvars, vars, boundtypes, bounds)
    ccall((:SCIPcreateConsBasicBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cdouble}), scip, cons, name, nvars, vars, boundtypes, bounds)
end

function SCIPgetNVarsBounddisjunction(scip, cons)
    ccall((:SCIPgetNVarsBounddisjunction, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsBounddisjunction(scip, cons)
    ccall((:SCIPgetVarsBounddisjunction, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBoundtypesBounddisjunction(scip, cons)
    ccall((:SCIPgetBoundtypesBounddisjunction, libscip), Ptr{SCIP_BOUNDTYPE}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBoundsBounddisjunction(scip, cons)
    ccall((:SCIPgetBoundsBounddisjunction, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
