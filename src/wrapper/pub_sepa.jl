# Julia wrapper for header: /usr/include/scip/pub_sepa.h
# Automatically generated using Clang.jl wrap_c


function SCIPsepaComp(elem1, elem2)
    ccall((:SCIPsepaComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsepaCompName(elem1, elem2)
    ccall((:SCIPsepaCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsepaGetData(sepa)
    ccall((:SCIPsepaGetData, libscip), Ptr{SCIP_SEPADATA}, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaSetData(sepa, sepadata)
    ccall((:SCIPsepaSetData, libscip), Cvoid, (Ptr{SCIP_SEPA}, Ptr{SCIP_SEPADATA}), sepa, sepadata)
end

function SCIPsepaGetName(sepa)
    ccall((:SCIPsepaGetName, libscip), Cstring, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetDesc(sepa)
    ccall((:SCIPsepaGetDesc, libscip), Cstring, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetPriority(sepa)
    ccall((:SCIPsepaGetPriority, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetFreq(sepa)
    ccall((:SCIPsepaGetFreq, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaSetFreq(sepa, freq)
    ccall((:SCIPsepaSetFreq, libscip), Cvoid, (Ptr{SCIP_SEPA}, Cint), sepa, freq)
end

function SCIPsepaGetMaxbounddist(sepa)
    ccall((:SCIPsepaGetMaxbounddist, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaUsesSubscip(sepa)
    ccall((:SCIPsepaUsesSubscip, libscip), UInt32, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetSetupTime(sepa)
    ccall((:SCIPsepaGetSetupTime, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetTime(sepa)
    ccall((:SCIPsepaGetTime, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCalls(sepa)
    ccall((:SCIPsepaGetNCalls, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCallsAtNode(sepa)
    ccall((:SCIPsepaGetNCallsAtNode, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutoffs(sepa)
    ccall((:SCIPsepaGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsFound(sepa)
    ccall((:SCIPsepaGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsApplied(sepa)
    ccall((:SCIPsepaGetNCutsApplied, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsFoundAtNode(sepa)
    ccall((:SCIPsepaGetNCutsFoundAtNode, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNConssFound(sepa)
    ccall((:SCIPsepaGetNConssFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNDomredsFound(sepa)
    ccall((:SCIPsepaGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaIsDelayed(sepa)
    ccall((:SCIPsepaIsDelayed, libscip), UInt32, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaWasLPDelayed(sepa)
    ccall((:SCIPsepaWasLPDelayed, libscip), UInt32, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaWasSolDelayed(sepa)
    ccall((:SCIPsepaWasSolDelayed, libscip), UInt32, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaIsInitialized(sepa)
    ccall((:SCIPsepaIsInitialized, libscip), UInt32, (Ptr{SCIP_SEPA},), sepa)
end
