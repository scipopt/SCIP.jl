# Julia wrapper for header: /usr/include/scip/scip_disp.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeDisp(scip, name, desc, header, dispstatus::SCIP_DISPSTATUS, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width::Cint, priority::Cint, position::Cint, stripline::UInt32)
    ccall((:SCIPincludeDisp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cstring, SCIP_DISPSTATUS, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_DISPDATA}, Cint, Cint, Cint, UInt32), scip, name, desc, header, dispstatus, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width, priority, position, stripline)
end

function SCIPfindDisp(scip, name)
    ccall((:SCIPfindDisp, libscip), Ptr{SCIP_DISP}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetDisps(scip)
    ccall((:SCIPgetDisps, libscip), Ptr{Ptr{SCIP_DISP}}, (Ptr{SCIP},), scip)
end

function SCIPgetNDisps(scip)
    ccall((:SCIPgetNDisps, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPautoselectDisps(scip)
    ccall((:SCIPautoselectDisps, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgDispMode(disp, mode::SCIP_DISPMODE)
    ccall((:SCIPchgDispMode, libscip), Cvoid, (Ptr{SCIP_DISP}, SCIP_DISPMODE), disp, mode)
end
