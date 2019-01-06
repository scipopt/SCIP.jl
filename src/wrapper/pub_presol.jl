# Julia wrapper for header: /usr/include/scip/pub_presol.h
# Automatically generated using Clang.jl wrap_c


function SCIPpresolComp(elem1, elem2)
    ccall((:SCIPpresolComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpresolCompName(elem1, elem2)
    ccall((:SCIPpresolCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpresolGetData(presol)
    ccall((:SCIPpresolGetData, libscip), Ptr{SCIP_PRESOLDATA}, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolSetData(presol, presoldata)
    ccall((:SCIPpresolSetData, libscip), Cvoid, (Ptr{SCIP_PRESOL}, Ptr{SCIP_PRESOLDATA}), presol, presoldata)
end

function SCIPpresolGetName(presol)
    ccall((:SCIPpresolGetName, libscip), Cstring, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetDesc(presol)
    ccall((:SCIPpresolGetDesc, libscip), Cstring, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetPriority(presol)
    ccall((:SCIPpresolGetPriority, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetMaxrounds(presol)
    ccall((:SCIPpresolGetMaxrounds, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetTiming(presol)
    ccall((:SCIPpresolGetTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolSetTiming(presol, timing)
    ccall((:SCIPpresolSetTiming, libscip), Cvoid, (Ptr{SCIP_PRESOL}, SCIP_PRESOLTIMING), presol, timing)
end

function SCIPpresolIsInitialized(presol)
    ccall((:SCIPpresolIsInitialized, libscip), UInt32, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetSetupTime(presol)
    ccall((:SCIPpresolGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetTime(presol)
    ccall((:SCIPpresolGetTime, libscip), Cdouble, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNFixedVars(presol)
    ccall((:SCIPpresolGetNFixedVars, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAggrVars(presol)
    ccall((:SCIPpresolGetNAggrVars, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgVarTypes(presol)
    ccall((:SCIPpresolGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgBds(presol)
    ccall((:SCIPpresolGetNChgBds, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAddHoles(presol)
    ccall((:SCIPpresolGetNAddHoles, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNDelConss(presol)
    ccall((:SCIPpresolGetNDelConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAddConss(presol)
    ccall((:SCIPpresolGetNAddConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNUpgdConss(presol)
    ccall((:SCIPpresolGetNUpgdConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgCoefs(presol)
    ccall((:SCIPpresolGetNChgCoefs, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgSides(presol)
    ccall((:SCIPpresolGetNChgSides, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNCalls(presol)
    ccall((:SCIPpresolGetNCalls, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end
