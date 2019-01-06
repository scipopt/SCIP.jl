# Julia wrapper for header: /usr/include/scip/pub_implics.h
# Automatically generated using Clang.jl wrap_c


function SCIPcliqueSearchVar(clique, var, value)
    ccall((:SCIPcliqueSearchVar, libscip), Cint, (Ptr{SCIP_CLIQUE}, Ptr{SCIP_VAR}, UInt32), clique, var, value)
end

function SCIPcliqueHasVar(clique, var, value)
    ccall((:SCIPcliqueHasVar, libscip), UInt32, (Ptr{SCIP_CLIQUE}, Ptr{SCIP_VAR}, UInt32), clique, var, value)
end

function SCIPcliqueGetNVars(clique)
    ccall((:SCIPcliqueGetNVars, libscip), Cint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetVars(clique)
    ccall((:SCIPcliqueGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetValues(clique)
    ccall((:SCIPcliqueGetValues, libscip), Ptr{UInt32}, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetId(clique)
    ccall((:SCIPcliqueGetId, libscip), UInt32, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetIndex(clique)
    ccall((:SCIPcliqueGetIndex, libscip), Cint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueIsCleanedUp(clique)
    ccall((:SCIPcliqueIsCleanedUp, libscip), UInt32, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueIsEquation(clique)
    ccall((:SCIPcliqueIsEquation, libscip), UInt32, (Ptr{SCIP_CLIQUE},), clique)
end
