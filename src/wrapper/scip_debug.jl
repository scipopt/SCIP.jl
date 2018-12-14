# Julia wrapper for header: /usr/include/scip/scip_debug.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPenableDebugSol(scip)
    ccall((:SCIPenableDebugSol, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdisableDebugSol(scip)
    ccall((:SCIPdisableDebugSol, libscip), Cvoid, (Ptr{SCIP},), scip)
end
