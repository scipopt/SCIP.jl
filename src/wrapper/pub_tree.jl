# Julia wrapper for header: /usr/include/scip/pub_tree.h
# Automatically generated using Clang.jl wrap_c


function SCIPnodeCompLowerbound(elem1, elem2)
    ccall((:SCIPnodeCompLowerbound, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPnodeGetParentBranchings(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetParentBranchings, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodeGetAncestorBranchings(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetAncestorBranchings, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodeGetAncestorBranchingsPart(node, parent, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetAncestorBranchingsPart, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, parent, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodePrintAncestorBranchings(node, file)
    ccall((:SCIPnodePrintAncestorBranchings, libscip), SCIP_RETCODE, (Ptr{SCIP_NODE}, Ptr{FILE}), node, file)
end

function SCIPnodeGetAncestorBranchingPath(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize, nodeswitches, nnodes, nodeswitchsize)
    ccall((:SCIPnodeGetAncestorBranchingPath, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize, nodeswitches, nnodes, nodeswitchsize)
end

function SCIPnodesSharePath(node1, node2)
    ccall((:SCIPnodesSharePath, libscip), UInt32, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}), node1, node2)
end

function SCIPnodesGetCommonAncestor(node1, node2)
    ccall((:SCIPnodesGetCommonAncestor, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}), node1, node2)
end

function SCIPnodeGetType(node)
    ccall((:SCIPnodeGetType, libscip), SCIP_NODETYPE, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetNumber(node)
    ccall((:SCIPnodeGetNumber, libscip), Clonglong, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetDepth(node)
    ccall((:SCIPnodeGetDepth, libscip), Cint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetLowerbound(node)
    ccall((:SCIPnodeGetLowerbound, libscip), Cdouble, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetEstimate(node)
    ccall((:SCIPnodeGetEstimate, libscip), Cdouble, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetReopttype(node)
    ccall((:SCIPnodeGetReopttype, libscip), SCIP_REOPTTYPE, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetReoptID(node)
    ccall((:SCIPnodeGetReoptID, libscip), UInt32, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeSetReopttype(node, reopttype)
    ccall((:SCIPnodeSetReopttype, libscip), Cvoid, (Ptr{SCIP_NODE}, SCIP_REOPTTYPE), node, reopttype)
end

function SCIPnodeSetReoptID(node, id)
    ccall((:SCIPnodeSetReoptID, libscip), Cvoid, (Ptr{SCIP_NODE}, UInt32), node, id)
end

function SCIPnodeGetNDomchg(node, nbranchings, nconsprop, nprop)
    ccall((:SCIPnodeGetNDomchg, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), node, nbranchings, nconsprop, nprop)
end

function SCIPnodeGetDomchg(node)
    ccall((:SCIPnodeGetDomchg, libscip), Ptr{SCIP_DOMCHG}, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetParent(node)
    ccall((:SCIPnodeGetParent, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetAddedConss(node, addedconss, naddedconss, addedconsssize)
    ccall((:SCIPnodeGetAddedConss, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cint}, Cint), node, addedconss, naddedconss, addedconsssize)
end

function SCIPnodeGetNAddedConss(node)
    ccall((:SCIPnodeGetNAddedConss, libscip), Cint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeIsActive(node)
    ccall((:SCIPnodeIsActive, libscip), UInt32, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeIsPropagatedAgain(node)
    ccall((:SCIPnodeIsPropagatedAgain, libscip), UInt32, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetConssetchg(node)
    ccall((:SCIPnodeGetConssetchg, libscip), Ptr{SCIP_CONSSETCHG}, (Ptr{SCIP_NODE},), node)
end
