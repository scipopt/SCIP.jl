# Julia wrapper for header: /usr/include/scip/pub_disp.h
# Automatically generated using Clang.jl wrap_c


function SCIPdispGetData(disp)
    ccall((:SCIPdispGetData, libscip), Ptr{SCIP_DISPDATA}, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispSetData(disp, dispdata)
    ccall((:SCIPdispSetData, libscip), Cvoid, (Ptr{SCIP_DISP}, Ptr{SCIP_DISPDATA}), disp, dispdata)
end

function SCIPdispGetName(disp)
    ccall((:SCIPdispGetName, libscip), Cstring, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetDesc(disp)
    ccall((:SCIPdispGetDesc, libscip), Cstring, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetHeader(disp)
    ccall((:SCIPdispGetHeader, libscip), Cstring, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetWidth(disp)
    ccall((:SCIPdispGetWidth, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetPriority(disp)
    ccall((:SCIPdispGetPriority, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetPosition(disp)
    ccall((:SCIPdispGetPosition, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetStatus(disp)
    ccall((:SCIPdispGetStatus, libscip), SCIP_DISPSTATUS, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispIsInitialized(disp)
    ccall((:SCIPdispIsInitialized, libscip), UInt32, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispLongint(messagehdlr, file, val, width)
    ccall((:SCIPdispLongint, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Clonglong, Cint), messagehdlr, file, val, width)
end

function SCIPdispInt(messagehdlr, file, val, width)
    ccall((:SCIPdispInt, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Cint, Cint), messagehdlr, file, val, width)
end

function SCIPdispTime(messagehdlr, file, val, width)
    ccall((:SCIPdispTime, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Cdouble, Cint), messagehdlr, file, val, width)
end
