# Julia wrapper for header: /usr/include/scip/pub_relax.h
# Automatically generated using Clang.jl wrap_c


function SCIPrelaxComp(elem1, elem2)
    ccall((:SCIPrelaxComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPrelaxCompName(elem1, elem2)
    ccall((:SCIPrelaxCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPrelaxGetData(relax)
    ccall((:SCIPrelaxGetData, libscip), Ptr{SCIP_RELAXDATA}, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxSetData(relax, relaxdata)
    ccall((:SCIPrelaxSetData, libscip), Cvoid, (Ptr{SCIP_RELAX}, Ptr{SCIP_RELAXDATA}), relax, relaxdata)
end

function SCIPrelaxGetName(relax)
    ccall((:SCIPrelaxGetName, libscip), Cstring, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetDesc(relax)
    ccall((:SCIPrelaxGetDesc, libscip), Cstring, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetPriority(relax)
    ccall((:SCIPrelaxGetPriority, libscip), Cint, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetFreq(relax)
    ccall((:SCIPrelaxGetFreq, libscip), Cint, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetSetupTime(relax)
    ccall((:SCIPrelaxGetSetupTime, libscip), Cdouble, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetTime(relax)
    ccall((:SCIPrelaxGetTime, libscip), Cdouble, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNCalls(relax)
    ccall((:SCIPrelaxGetNCalls, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxIsInitialized(relax)
    ccall((:SCIPrelaxIsInitialized, libscip), UInt32, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxMarkUnsolved(relax)
    ccall((:SCIPrelaxMarkUnsolved, libscip), Cvoid, (Ptr{SCIP_RELAX},), relax)
end
