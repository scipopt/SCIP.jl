# Julia wrapper for header: /usr/include/scip/scip_reopt.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPgetReoptChildIDs(scip, node, ids, mem::Cint, nids)
    ccall((:SCIPgetReoptChildIDs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{UInt32}, Cint, Ptr{Cint}), scip, node, ids, mem, nids)
end

function SCIPgetReoptLeaveIDs(scip, node, ids, mem::Cint, nids)
    ccall((:SCIPgetReoptLeaveIDs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{UInt32}, Cint, Ptr{Cint}), scip, node, ids, mem, nids)
end

function SCIPgetNReoptnodes(scip, node)
    ccall((:SCIPgetNReoptnodes, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetNReoptLeaves(scip, node)
    ccall((:SCIPgetNReoptLeaves, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetReoptnode(scip, id::UInt32)
    ccall((:SCIPgetReoptnode, libscip), Ptr{SCIP_REOPTNODE}, (Ptr{SCIP}, UInt32), scip, id)
end

function SCIPaddReoptnodeBndchg(scip, reoptnode, var, bound::Cdouble, boundtype::SCIP_BOUNDTYPE)
    ccall((:SCIPaddReoptnodeBndchg, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{SCIP_VAR}, Cdouble, SCIP_BOUNDTYPE), scip, reoptnode, var, bound, boundtype)
end

function SCIPsetReoptCompression(scip, representation, nrepresentatives::Cint, success)
    ccall((:SCIPsetReoptCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint, Ptr{UInt32}), scip, representation, nrepresentatives, success)
end

function SCIPaddReoptnodeCons(scip, reoptnode, vars, vals, boundtypes, lhs::Cdouble, rhs::Cdouble, nvars::Cint, constype::REOPT_CONSTYPE, linear::UInt32)
    ccall((:SCIPaddReoptnodeCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Cdouble, Cdouble, Cint, REOPT_CONSTYPE, UInt32), scip, reoptnode, vars, vals, boundtypes, lhs, rhs, nvars, constype, linear)
end

function SCIPgetReoptnodePath(scip, reoptnode, vars, vals, boundtypes, mem::Cint, nvars, nafterdualvars)
    ccall((:SCIPgetReoptnodePath, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Cint, Ptr{Cint}, Ptr{Cint}), scip, reoptnode, vars, vals, boundtypes, mem, nvars, nafterdualvars)
end

function SCIPinitRepresentation(scip, representatives, nrepresentatives::Cint)
    ccall((:SCIPinitRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPresetRepresentation(scip, representatives, nrepresentatives::Cint)
    ccall((:SCIPresetRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPfreeRepresentation(scip, representatives, nrepresentatives::Cint)
    ccall((:SCIPfreeRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPapplyReopt(scip, reoptnode, id::UInt32, estimate::Cdouble, childnodes, ncreatedchilds, naddedconss, childnodessize::Cint, success)
    ccall((:SCIPapplyReopt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, UInt32, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{UInt32}), scip, reoptnode, id, estimate, childnodes, ncreatedchilds, naddedconss, childnodessize, success)
end

function SCIPresetReoptnodeDualcons(scip, node)
    ccall((:SCIPresetReoptnodeDualcons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPsplitReoptRoot(scip, ncreatedchilds, naddedconss)
    ccall((:SCIPsplitReoptRoot, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}, Ptr{Cint}), scip, ncreatedchilds, naddedconss)
end

function SCIPreoptimizeNode(scip, node)
    ccall((:SCIPreoptimizeNode, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPdeleteReoptnode(scip, reoptnode)
    ccall((:SCIPdeleteReoptnode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}), scip, reoptnode)
end

function SCIPgetReoptSimilarity(scip, run1::Cint, run2::Cint)
    ccall((:SCIPgetReoptSimilarity, libscip), Cdouble, (Ptr{SCIP}, Cint, Cint), scip, run1, run2)
end

function SCIPgetVarCoefChg(scip, varidx::Cint, negated, entering, leaving)
    ccall((:SCIPgetVarCoefChg, libscip), Cvoid, (Ptr{SCIP}, Cint, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, varidx, negated, entering, leaving)
end
