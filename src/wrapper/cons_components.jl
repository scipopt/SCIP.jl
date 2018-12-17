# Julia wrapper for header: /usr/include/scip/cons_components.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrComponents(scip)
    ccall((:SCIPincludeConshdlrComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end
