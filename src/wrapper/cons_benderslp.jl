# Julia wrapper for header: /usr/include/scip/cons_benderslp.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrBenderslp(scip)
    ccall((:SCIPincludeConshdlrBenderslp, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end
