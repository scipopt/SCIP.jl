# Julia wrapper for header: /usr/include/scip/pub_misc_linear.h
# Automatically generated using Clang.jl wrap_c


function SCIPconsGetRhs(scip, cons, success)
    ccall((:SCIPconsGetRhs, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{UInt32}), scip, cons, success)
end

function SCIPconsGetLhs(scip, cons, success)
    ccall((:SCIPconsGetLhs, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{UInt32}), scip, cons, success)
end

function SCIPgetConsVals(scip, cons, vals, varssize, success)
    ccall((:SCIPgetConsVals, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Cint, Ptr{UInt32}), scip, cons, vals, varssize, success)
end

function SCIPconsGetDualfarkas(scip, cons, dualfarkas, success)
    ccall((:SCIPconsGetDualfarkas, libscip), Cvoid, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{UInt32}), scip, cons, dualfarkas, success)
end

function SCIPconsGetDualsol(scip, cons, dualsol, success)
    ccall((:SCIPconsGetDualsol, libscip), Cvoid, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{UInt32}), scip, cons, dualsol, success)
end

function SCIPconsGetRow(scip, cons)
    ccall((:SCIPconsGetRow, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
