# Julia wrapper for header: /usr/include/scip/pub_conflict.h
# Automatically generated using Clang.jl wrap_c


function SCIPconflicthdlrComp(elem1, elem2)
    ccall((:SCIPconflicthdlrComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconflicthdlrCompName(elem1, elem2)
    ccall((:SCIPconflicthdlrCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconflicthdlrGetData(conflicthdlr)
    ccall((:SCIPconflicthdlrGetData, libscip), Ptr{SCIP_CONFLICTHDLRDATA}, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrSetData(conflicthdlr, conflicthdlrdata)
    ccall((:SCIPconflicthdlrSetData, libscip), Cvoid, (Ptr{SCIP_CONFLICTHDLR}, Ptr{SCIP_CONFLICTHDLRDATA}), conflicthdlr, conflicthdlrdata)
end

function SCIPconflicthdlrGetName(conflicthdlr)
    ccall((:SCIPconflicthdlrGetName, libscip), Cstring, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetDesc(conflicthdlr)
    ccall((:SCIPconflicthdlrGetDesc, libscip), Cstring, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetPriority(conflicthdlr)
    ccall((:SCIPconflicthdlrGetPriority, libscip), Cint, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrIsInitialized(conflicthdlr)
    ccall((:SCIPconflicthdlrIsInitialized, libscip), UInt32, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetSetupTime(conflicthdlr)
    ccall((:SCIPconflicthdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetTime(conflicthdlr)
    ccall((:SCIPconflicthdlrGetTime, libscip), Cdouble, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end
