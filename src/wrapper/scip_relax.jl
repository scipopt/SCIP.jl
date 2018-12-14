# Julia wrapper for header: /usr/include/scip/scip_relax.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeRelax(scip, name, desc, priority::Cint, freq::Cint, relaxcopy, relaxfree, relaxinit, relaxexit, relaxinitsol, relaxexitsol, relaxexec, relaxdata)
    ccall((:SCIPincludeRelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_RELAXDATA}), scip, name, desc, priority, freq, relaxcopy, relaxfree, relaxinit, relaxexit, relaxinitsol, relaxexitsol, relaxexec, relaxdata)
end

function SCIPincludeRelaxBasic(scip, relaxptr, name, desc, priority::Cint, freq::Cint, relaxexec, relaxdata)
    ccall((:SCIPincludeRelaxBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_RELAX}}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_RELAXDATA}), scip, relaxptr, name, desc, priority, freq, relaxexec, relaxdata)
end

function SCIPsetRelaxCopy(scip, relax, relaxcopy)
    ccall((:SCIPsetRelaxCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxcopy)
end

function SCIPsetRelaxFree(scip, relax, relaxfree)
    ccall((:SCIPsetRelaxFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxfree)
end

function SCIPsetRelaxInit(scip, relax, relaxinit)
    ccall((:SCIPsetRelaxInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxinit)
end

function SCIPsetRelaxExit(scip, relax, relaxexit)
    ccall((:SCIPsetRelaxExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxexit)
end

function SCIPsetRelaxInitsol(scip, relax, relaxinitsol)
    ccall((:SCIPsetRelaxInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxinitsol)
end

function SCIPsetRelaxExitsol(scip, relax, relaxexitsol)
    ccall((:SCIPsetRelaxExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxexitsol)
end

function SCIPfindRelax(scip, name)
    ccall((:SCIPfindRelax, libscip), Ptr{SCIP_RELAX}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetRelaxs(scip)
    ccall((:SCIPgetRelaxs, libscip), Ptr{Ptr{SCIP_RELAX}}, (Ptr{SCIP},), scip)
end

function SCIPgetNRelaxs(scip)
    ccall((:SCIPgetNRelaxs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetRelaxPriority(scip, relax, priority::Cint)
    ccall((:SCIPsetRelaxPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Cint), scip, relax, priority)
end
