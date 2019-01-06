# Julia wrapper for header: /usr/include/scip/cons_bivariate.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrBivariate(scip)
    ccall((:SCIPincludeConshdlrBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsBivariate(scip, cons, name, f, convextype, z, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_EXPRTREE}, SCIP_BIVAR_CONVEXITY, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, f, convextype, z, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicBivariate(scip, cons, name, f, convextype, z, zcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_EXPRTREE}, SCIP_BIVAR_CONVEXITY, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, cons, name, f, convextype, z, zcoef, lhs, rhs)
end

function SCIPgetLinearVarBivariate(scip, cons)
    ccall((:SCIPgetLinearVarBivariate, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearCoefBivariate(scip, cons)
    ccall((:SCIPgetLinearCoefBivariate, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreeBivariate(scip, cons)
    ccall((:SCIPgetExprtreeBivariate, libscip), Ptr{SCIP_EXPRTREE}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsBivariate(scip, cons)
    ccall((:SCIPgetLhsBivariate, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsBivariate(scip, cons)
    ccall((:SCIPgetRhsBivariate, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
