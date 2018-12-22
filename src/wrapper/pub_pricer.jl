# Julia wrapper for header: /usr/include/scip/pub_pricer.h
# Automatically generated using Clang.jl wrap_c


function SCIPpricerComp(elem1, elem2)
    ccall((:SCIPpricerComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpricerCompName(elem1, elem2)
    ccall((:SCIPpricerCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpricerGetData(pricer)
    ccall((:SCIPpricerGetData, libscip), Ptr{SCIP_PRICERDATA}, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerSetData(pricer, pricerdata)
    ccall((:SCIPpricerSetData, libscip), Cvoid, (Ptr{SCIP_PRICER}, Ptr{SCIP_PRICERDATA}), pricer, pricerdata)
end

function SCIPpricerGetName(pricer)
    ccall((:SCIPpricerGetName, libscip), Cstring, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetDesc(pricer)
    ccall((:SCIPpricerGetDesc, libscip), Cstring, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetPriority(pricer)
    ccall((:SCIPpricerGetPriority, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetNCalls(pricer)
    ccall((:SCIPpricerGetNCalls, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetNVarsFound(pricer)
    ccall((:SCIPpricerGetNVarsFound, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetSetupTime(pricer)
    ccall((:SCIPpricerGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetTime(pricer)
    ccall((:SCIPpricerGetTime, libscip), Cdouble, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsActive(pricer)
    ccall((:SCIPpricerIsActive, libscip), UInt32, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsDelayed(pricer)
    ccall((:SCIPpricerIsDelayed, libscip), UInt32, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsInitialized(pricer)
    ccall((:SCIPpricerIsInitialized, libscip), UInt32, (Ptr{SCIP_PRICER},), pricer)
end
