# Julia wrapper for header: /usr/include/scip/pub_event.h
# Automatically generated using Clang.jl wrap_c


function SCIPeventhdlrGetName(eventhdlr)
    ccall((:SCIPeventhdlrGetName, libscip), Cstring, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetData(eventhdlr)
    ccall((:SCIPeventhdlrGetData, libscip), Ptr{SCIP_EVENTHDLRDATA}, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrSetData(eventhdlr, eventhdlrdata)
    ccall((:SCIPeventhdlrSetData, libscip), Cvoid, (Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTHDLRDATA}), eventhdlr, eventhdlrdata)
end

function SCIPeventhdlrIsInitialized(eventhdlr)
    ccall((:SCIPeventhdlrIsInitialized, libscip), UInt32, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetSetupTime(eventhdlr)
    ccall((:SCIPeventhdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetTime(eventhdlr)
    ccall((:SCIPeventhdlrGetTime, libscip), Cdouble, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventGetType(event)
    ccall((:SCIPeventGetType, libscip), SCIP_EVENTTYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetVar(event)
    ccall((:SCIPeventGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetOldobj(event)
    ccall((:SCIPeventGetOldobj, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNewobj(event)
    ccall((:SCIPeventGetNewobj, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetOldbound(event)
    ccall((:SCIPeventGetOldbound, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNewbound(event)
    ccall((:SCIPeventGetNewbound, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNode(event)
    ccall((:SCIPeventGetNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetSol(event)
    ccall((:SCIPeventGetSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetHoleLeft(event)
    ccall((:SCIPeventGetHoleLeft, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetHoleRight(event)
    ccall((:SCIPeventGetHoleRight, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRow(event)
    ccall((:SCIPeventGetRow, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowCol(event)
    ccall((:SCIPeventGetRowCol, libscip), Ptr{SCIP_COL}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldCoefVal(event)
    ccall((:SCIPeventGetRowOldCoefVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewCoefVal(event)
    ccall((:SCIPeventGetRowNewCoefVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldConstVal(event)
    ccall((:SCIPeventGetRowOldConstVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewConstVal(event)
    ccall((:SCIPeventGetRowNewConstVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowSide(event)
    ccall((:SCIPeventGetRowSide, libscip), SCIP_SIDETYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldSideVal(event)
    ccall((:SCIPeventGetRowOldSideVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewSideVal(event)
    ccall((:SCIPeventGetRowNewSideVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end
