# Julia wrapper for header: /usr/include/scip/cons_integral.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrIntegral(scip)
    ccall((:SCIPincludeConshdlrIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end
