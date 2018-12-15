# Julia wrapper for header: /usr/include/scip/scip_event.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeEventhdlr(scip, name, desc, eventcopy, eventfree, eventinit, eventexit, eventinitsol, eventexitsol, eventdelete, eventexec, eventhdlrdata)
    ccall((:SCIPincludeEventhdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_EVENTHDLRDATA}), scip, name, desc, eventcopy, eventfree, eventinit, eventexit, eventinitsol, eventexitsol, eventdelete, eventexec, eventhdlrdata)
end

function SCIPincludeEventhdlrBasic(scip, eventhdlrptr, name, desc, eventexec, eventhdlrdata)
    ccall((:SCIPincludeEventhdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_EVENTHDLR}}, Cstring, Cstring, Ptr{Cvoid}, Ptr{SCIP_EVENTHDLRDATA}), scip, eventhdlrptr, name, desc, eventexec, eventhdlrdata)
end

function SCIPsetEventhdlrCopy(scip, eventhdlr, eventcopy)
    ccall((:SCIPsetEventhdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventcopy)
end

function SCIPsetEventhdlrFree(scip, eventhdlr, eventfree)
    ccall((:SCIPsetEventhdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventfree)
end

function SCIPsetEventhdlrInit(scip, eventhdlr, eventinit)
    ccall((:SCIPsetEventhdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventinit)
end

function SCIPsetEventhdlrExit(scip, eventhdlr, eventexit)
    ccall((:SCIPsetEventhdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventexit)
end

function SCIPsetEventhdlrInitsol(scip, eventhdlr, eventinitsol)
    ccall((:SCIPsetEventhdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventinitsol)
end

function SCIPsetEventhdlrExitsol(scip, eventhdlr, eventexitsol)
    ccall((:SCIPsetEventhdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventexitsol)
end

function SCIPsetEventhdlrDelete(scip, eventhdlr, eventdelete)
    ccall((:SCIPsetEventhdlrDelete, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventdelete)
end

function SCIPfindEventhdlr(scip, name)
    ccall((:SCIPfindEventhdlr, libscip), Ptr{SCIP_EVENTHDLR}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetEventhdlrs(scip)
    ccall((:SCIPgetEventhdlrs, libscip), Ptr{Ptr{SCIP_EVENTHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNEventhdlrs(scip)
    ccall((:SCIPgetNEventhdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcatchEvent(scip, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropEvent(scip, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPcatchVarEvent(scip, var, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchVarEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, var, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropVarEvent(scip, var, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropVarEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, var, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPcatchRowEvent(scip, row, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchRowEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, row, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropRowEvent(scip, row, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropRowEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, row, eventtype, eventhdlr, eventdata, filterpos)
end
