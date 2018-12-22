# Julia wrapper for header: /usr/include/scip/pub_prop.h
# Automatically generated using Clang.jl wrap_c


function SCIPpropComp(elem1, elem2)
    ccall((:SCIPpropComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropCompPresol(elem1, elem2)
    ccall((:SCIPpropCompPresol, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropCompName(elem1, elem2)
    ccall((:SCIPpropCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropGetData(prop)
    ccall((:SCIPpropGetData, libscip), Ptr{SCIP_PROPDATA}, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetData(prop, propdata)
    ccall((:SCIPpropSetData, libscip), Cvoid, (Ptr{SCIP_PROP}, Ptr{SCIP_PROPDATA}), prop, propdata)
end

function SCIPpropGetName(prop)
    ccall((:SCIPpropGetName, libscip), Cstring, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetDesc(prop)
    ccall((:SCIPpropGetDesc, libscip), Cstring, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPriority(prop)
    ccall((:SCIPpropGetPriority, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolPriority(prop)
    ccall((:SCIPpropGetPresolPriority, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetFreq(prop)
    ccall((:SCIPpropGetFreq, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetSetupTime(prop)
    ccall((:SCIPpropGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetFreq(prop, freq)
    ccall((:SCIPpropSetFreq, libscip), Cvoid, (Ptr{SCIP_PROP}, Cint), prop, freq)
end

function SCIPpropGetTime(prop)
    ccall((:SCIPpropGetTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetStrongBranchPropTime(prop)
    ccall((:SCIPpropGetStrongBranchPropTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetRespropTime(prop)
    ccall((:SCIPpropGetRespropTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolTime(prop)
    ccall((:SCIPpropGetPresolTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNCalls(prop)
    ccall((:SCIPpropGetNCalls, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNRespropCalls(prop)
    ccall((:SCIPpropGetNRespropCalls, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNCutoffs(prop)
    ccall((:SCIPpropGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNDomredsFound(prop)
    ccall((:SCIPpropGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropIsDelayed(prop)
    ccall((:SCIPpropIsDelayed, libscip), UInt32, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropWasDelayed(prop)
    ccall((:SCIPpropWasDelayed, libscip), UInt32, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropIsInitialized(prop)
    ccall((:SCIPpropIsInitialized, libscip), UInt32, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNFixedVars(prop)
    ccall((:SCIPpropGetNFixedVars, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAggrVars(prop)
    ccall((:SCIPpropGetNAggrVars, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgVarTypes(prop)
    ccall((:SCIPpropGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgBds(prop)
    ccall((:SCIPpropGetNChgBds, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAddHoles(prop)
    ccall((:SCIPpropGetNAddHoles, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNDelConss(prop)
    ccall((:SCIPpropGetNDelConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAddConss(prop)
    ccall((:SCIPpropGetNAddConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNUpgdConss(prop)
    ccall((:SCIPpropGetNUpgdConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgCoefs(prop)
    ccall((:SCIPpropGetNChgCoefs, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgSides(prop)
    ccall((:SCIPpropGetNChgSides, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNPresolCalls(prop)
    ccall((:SCIPpropGetNPresolCalls, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetTimingmask(prop)
    ccall((:SCIPpropGetTimingmask, libscip), SCIP_PROPTIMING, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropDoesPresolve(prop)
    ccall((:SCIPpropDoesPresolve, libscip), UInt32, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolTiming(prop)
    ccall((:SCIPpropGetPresolTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetPresolTiming(prop, presoltiming)
    ccall((:SCIPpropSetPresolTiming, libscip), Cvoid, (Ptr{SCIP_PROP}, SCIP_PRESOLTIMING), prop, presoltiming)
end
