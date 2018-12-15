# Julia wrapper for header: /usr/include/scip/scip_validation.h
# Automatically generated using Clang.jl wrap_c


function SCIPvalidateSolve(scip, primalreference, dualreference, reftol, quiet, feasible, primalboundcheck, dualboundcheck)
    ccall((:SCIPvalidateSolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, UInt32, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, primalreference, dualreference, reftol, quiet, feasible, primalboundcheck, dualboundcheck)
end
