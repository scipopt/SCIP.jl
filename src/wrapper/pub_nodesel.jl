# Julia wrapper for header: /usr/include/scip/pub_nodesel.h
# Automatically generated using Clang.jl wrap_c


function SCIPnodeselGetName(nodesel)
    ccall((:SCIPnodeselGetName, libscip), Cstring, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetDesc(nodesel)
    ccall((:SCIPnodeselGetDesc, libscip), Cstring, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetStdPriority(nodesel)
    ccall((:SCIPnodeselGetStdPriority, libscip), Cint, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetMemsavePriority(nodesel)
    ccall((:SCIPnodeselGetMemsavePriority, libscip), Cint, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetData(nodesel)
    ccall((:SCIPnodeselGetData, libscip), Ptr{SCIP_NODESELDATA}, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselSetData(nodesel, nodeseldata)
    ccall((:SCIPnodeselSetData, libscip), Cvoid, (Ptr{SCIP_NODESEL}, Ptr{SCIP_NODESELDATA}), nodesel, nodeseldata)
end

function SCIPnodeselIsInitialized(nodesel)
    ccall((:SCIPnodeselIsInitialized, libscip), UInt32, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetSetupTime(nodesel)
    ccall((:SCIPnodeselGetSetupTime, libscip), Cdouble, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetTime(nodesel)
    ccall((:SCIPnodeselGetTime, libscip), Cdouble, (Ptr{SCIP_NODESEL},), nodesel)
end
