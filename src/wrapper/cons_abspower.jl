# Julia wrapper for header: /usr/include/scip/cons_abspower.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrAbspower(scip)
    ccall((:SCIPincludeConshdlrAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsAbspower(scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicAbspower(scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs)
end

function SCIPgetNlRowAbspower(scip, cons, nlrow)
    ccall((:SCIPgetNlRowAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNonlinearVarAbspower(scip, cons)
    ccall((:SCIPgetNonlinearVarAbspower, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarAbspower(scip, cons)
    ccall((:SCIPgetLinearVarAbspower, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExponentAbspower(scip, cons)
    ccall((:SCIPgetExponentAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetOffsetAbspower(scip, cons)
    ccall((:SCIPgetOffsetAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCoefLinearAbspower(scip, cons)
    ccall((:SCIPgetCoefLinearAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsAbspower(scip, cons)
    ccall((:SCIPgetLhsAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsAbspower(scip, cons)
    ccall((:SCIPgetRhsAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetViolationAbspower(scip, cons, sol)
    ccall((:SCIPgetViolationAbspower, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end
