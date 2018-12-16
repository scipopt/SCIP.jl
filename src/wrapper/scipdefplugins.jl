# Julia wrapper for header: /usr/include/scip/scipdefplugins.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeDefaultPlugins(scip)
    ccall((:SCIPincludeDefaultPlugins, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end
