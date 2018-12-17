# Julia wrapper for header: /usr/include/scip/cons_varbound.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrVarbound(scip)
    ccall((:SCIPincludeConshdlrVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsVarbound(scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicVarbound(scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs)
end

function SCIPgetLhsVarbound(scip, cons)
    ccall((:SCIPgetLhsVarbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsVarbound(scip, cons)
    ccall((:SCIPgetRhsVarbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarVarbound(scip, cons)
    ccall((:SCIPgetVarVarbound, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVbdvarVarbound(scip, cons)
    ccall((:SCIPgetVbdvarVarbound, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVbdcoefVarbound(scip, cons)
    ccall((:SCIPgetVbdcoefVarbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolVarbound(scip, cons)
    ccall((:SCIPgetDualsolVarbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasVarbound(scip, cons)
    ccall((:SCIPgetDualfarkasVarbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowVarbound(scip, cons)
    ccall((:SCIPgetRowVarbound, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
