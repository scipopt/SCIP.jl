# Julia wrapper for header: /usr/include/scip/pub_compr.h
# Automatically generated using Clang.jl wrap_c


function SCIPcomprComp(elem1, elem2)
    ccall((:SCIPcomprComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPcomprCompName(elem1, elem2)
    ccall((:SCIPcomprCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPcomprGetData(compr)
    ccall((:SCIPcomprGetData, libscip), Ptr{SCIP_COMPRDATA}, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprSetData(compr, comprdata)
    ccall((:SCIPcomprSetData, libscip), Cvoid, (Ptr{SCIP_COMPR}, Ptr{SCIP_COMPRDATA}), compr, comprdata)
end

function SCIPcomprGetName(heur)
    ccall((:SCIPcomprGetName, libscip), Cstring, (Ptr{SCIP_COMPR},), heur)
end

function SCIPcomprGetDesc(compr)
    ccall((:SCIPcomprGetDesc, libscip), Cstring, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetPriority(compr)
    ccall((:SCIPcomprGetPriority, libscip), Cint, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetMinNodes(compr)
    ccall((:SCIPcomprGetMinNodes, libscip), Cint, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetNCalls(compr)
    ccall((:SCIPcomprGetNCalls, libscip), Clonglong, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetNFound(compr)
    ccall((:SCIPcomprGetNFound, libscip), Clonglong, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprIsInitialized(compr)
    ccall((:SCIPcomprIsInitialized, libscip), UInt32, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetSetupTime(compr)
    ccall((:SCIPcomprGetSetupTime, libscip), Cdouble, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetTime(compr)
    ccall((:SCIPcomprGetTime, libscip), Cdouble, (Ptr{SCIP_COMPR},), compr)
end
