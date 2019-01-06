# Julia wrapper for header: /usr/include/scip/scip_debug.h
# Automatically generated using Clang.jl wrap_c


function SCIPenableDebugSol(scip)
    ccall((:SCIPenableDebugSol, libscip), Cvoid, (Ptr{SCIP_},), scip)
end

function SCIPdisableDebugSol(scip)
    ccall((:SCIPdisableDebugSol, libscip), Cvoid, (Ptr{SCIP_},), scip)
end
