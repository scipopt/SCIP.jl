# Julia wrapper for header: /usr/include/scip/scip_disp.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeDisp(scip, name, desc, header, dispstatus, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width, priority, position, stripline)
    ccall((:SCIPincludeDisp, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cstring, SCIP_DISPSTATUS, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_DISPDATA}, Cint, Cint, Cint, UInt32), scip, name, desc, header, dispstatus, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width, priority, position, stripline)
end

function SCIPfindDisp(scip, name)
    ccall((:SCIPfindDisp, libscip), Ptr{SCIP_DISP}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetDisps(scip)
    ccall((:SCIPgetDisps, libscip), Ptr{Ptr{SCIP_DISP}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNDisps(scip)
    ccall((:SCIPgetNDisps, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPautoselectDisps(scip)
    ccall((:SCIPautoselectDisps, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPchgDispMode(disp, mode)
    ccall((:SCIPchgDispMode, libscip), Cvoid, (Ptr{SCIP_DISP}, SCIP_DISPMODE), disp, mode)
end
