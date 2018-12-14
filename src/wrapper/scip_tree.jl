# Julia wrapper for header: /usr/include/scip/scip_tree.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPgetFocusNode(scip)
    ccall((:SCIPgetFocusNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetCurrentNode(scip)
    ccall((:SCIPgetCurrentNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetDepth(scip)
    ccall((:SCIPgetDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetFocusDepth(scip)
    ccall((:SCIPgetFocusDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetPlungeDepth(scip)
    ccall((:SCIPgetPlungeDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetRootNode(scip)
    ccall((:SCIPgetRootNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetEffectiveRootDepth(scip)
    ccall((:SCIPgetEffectiveRootDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPinRepropagation(scip)
    ccall((:SCIPinRepropagation, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetChildren(scip, children, nchildren)
    ccall((:SCIPgetChildren, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, children, nchildren)
end

function SCIPgetNChildren(scip)
    ccall((:SCIPgetNChildren, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSiblings(scip, siblings, nsiblings)
    ccall((:SCIPgetSiblings, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, siblings, nsiblings)
end

function SCIPgetNSiblings(scip)
    ccall((:SCIPgetNSiblings, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetLeaves(scip, leaves, nleaves)
    ccall((:SCIPgetLeaves, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, leaves, nleaves)
end

function SCIPgetNLeaves(scip)
    ccall((:SCIPgetNLeaves, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNNodesLeft(scip)
    ccall((:SCIPgetNNodesLeft, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetPrioChild(scip)
    ccall((:SCIPgetPrioChild, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetPrioSibling(scip)
    ccall((:SCIPgetPrioSibling, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestChild(scip)
    ccall((:SCIPgetBestChild, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestSibling(scip)
    ccall((:SCIPgetBestSibling, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestLeaf(scip)
    ccall((:SCIPgetBestLeaf, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestNode(scip)
    ccall((:SCIPgetBestNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestboundNode(scip)
    ccall((:SCIPgetBestboundNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetOpenNodesData(scip, leaves, children, siblings, nleaves, nchildren, nsiblings)
    ccall((:SCIPgetOpenNodesData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, leaves, children, siblings, nleaves, nchildren, nsiblings)
end

function SCIPcutoffNode(scip, node)
    ccall((:SCIPcutoffNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPrepropagateNode(scip, node)
    ccall((:SCIPrepropagateNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetCutoffdepth(scip)
    ccall((:SCIPgetCutoffdepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetRepropdepth(scip)
    ccall((:SCIPgetRepropdepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPprintNodeRootPath(scip, node, file)
    ccall((:SCIPprintNodeRootPath, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{FILE}), scip, node, file)
end

function SCIPsetFocusnodeLP(scip, solvelp::UInt32)
    ccall((:SCIPsetFocusnodeLP, libscip), Cvoid, (Ptr{SCIP}, UInt32), scip, solvelp)
end
