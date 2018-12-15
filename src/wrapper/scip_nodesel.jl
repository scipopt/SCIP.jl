# Julia wrapper for header: /usr/include/scip/scip_nodesel.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeNodesel(scip, name, desc, stdpriority, memsavepriority, nodeselcopy, nodeselfree, nodeselinit, nodeselexit, nodeselinitsol, nodeselexitsol, nodeselselect, nodeselcomp, nodeseldata)
    ccall((:SCIPincludeNodesel, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_NODESELDATA}), scip, name, desc, stdpriority, memsavepriority, nodeselcopy, nodeselfree, nodeselinit, nodeselexit, nodeselinitsol, nodeselexitsol, nodeselselect, nodeselcomp, nodeseldata)
end

function SCIPincludeNodeselBasic(scip, nodesel, name, desc, stdpriority, memsavepriority, nodeselselect, nodeselcomp, nodeseldata)
    ccall((:SCIPincludeNodeselBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_NODESEL}}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_NODESELDATA}), scip, nodesel, name, desc, stdpriority, memsavepriority, nodeselselect, nodeselcomp, nodeseldata)
end

function SCIPsetNodeselCopy(scip, nodesel, nodeselcopy)
    ccall((:SCIPsetNodeselCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselcopy)
end

function SCIPsetNodeselFree(scip, nodesel, nodeselfree)
    ccall((:SCIPsetNodeselFree, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselfree)
end

function SCIPsetNodeselInit(scip, nodesel, nodeselinit)
    ccall((:SCIPsetNodeselInit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselinit)
end

function SCIPsetNodeselExit(scip, nodesel, nodeselexit)
    ccall((:SCIPsetNodeselExit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselexit)
end

function SCIPsetNodeselInitsol(scip, nodesel, nodeselinitsol)
    ccall((:SCIPsetNodeselInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselinitsol)
end

function SCIPsetNodeselExitsol(scip, nodesel, nodeselexitsol)
    ccall((:SCIPsetNodeselExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselexitsol)
end

function SCIPfindNodesel(scip, name)
    ccall((:SCIPfindNodesel, libscip), Ptr{SCIP_NODESEL}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetNodesels(scip)
    ccall((:SCIPgetNodesels, libscip), Ptr{Ptr{SCIP_NODESEL}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNNodesels(scip)
    ccall((:SCIPgetNNodesels, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetNodeselStdPriority(scip, nodesel, priority)
    ccall((:SCIPsetNodeselStdPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Cint), scip, nodesel, priority)
end

function SCIPsetNodeselMemsavePriority(scip, nodesel, priority)
    ccall((:SCIPsetNodeselMemsavePriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODESEL}, Cint), scip, nodesel, priority)
end

function SCIPgetNodesel(scip)
    ccall((:SCIPgetNodesel, libscip), Ptr{SCIP_NODESEL}, (Ptr{SCIP_},), scip)
end
