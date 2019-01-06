# Julia wrapper for header: /usr/include/scip/pub_reopt.h
# Automatically generated using Clang.jl wrap_c


function SCIPreoptnodeGetNVars(reoptnode)
    ccall((:SCIPreoptnodeGetNVars, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNConss(reoptnode)
    ccall((:SCIPreoptnodeGetNConss, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNDualBoundChgs(reoptnode)
    ccall((:SCIPreoptnodeGetNDualBoundChgs, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNChildren(reoptnode)
    ccall((:SCIPreoptnodeGetNChildren, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetLowerbound(reoptnode)
    ccall((:SCIPreoptnodeGetLowerbound, libscip), Cdouble, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetType(reoptnode)
    ccall((:SCIPreoptnodeGetType, libscip), SCIP_REOPTTYPE, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetSplitCons(reoptnode, vars, vals, constype, conssize, nvars)
    ccall((:SCIPreoptnodeGetSplitCons, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{REOPT_CONSTYPE}, Cint, Ptr{Cint}), reoptnode, vars, vals, constype, conssize, nvars)
end

function SCIPreoptnodeGetConss(reoptnode, vars, bounds, boundtypes, mem, nconss, nvars)
    ccall((:SCIPreoptnodeGetConss, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{SCIP_BOUNDTYPE}}, Cint, Ptr{Cint}, Ptr{Cint}), reoptnode, vars, bounds, boundtypes, mem, nconss, nvars)
end

function SCIPreoptnodeSetParentID(reoptnode, parentid)
    ccall((:SCIPreoptnodeSetParentID, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, UInt32), reoptnode, parentid)
end

function SCIPreoptGetNRestartsGlobal(reopt)
    ccall((:SCIPreoptGetNRestartsGlobal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNRestartsLocal(reopt)
    ccall((:SCIPreoptGetNRestartsLocal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalRestartsLocal(reopt)
    ccall((:SCIPreoptGetNTotalRestartsLocal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetFirstRestarts(reopt)
    ccall((:SCIPreoptGetFirstRestarts, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetLastRestarts(reopt)
    ccall((:SCIPreoptGetLastRestarts, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNFeasNodes(reopt)
    ccall((:SCIPreoptGetNFeasNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalFeasNodes(reopt)
    ccall((:SCIPreoptGetNTotalFeasNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNPrunedNodes(reopt)
    ccall((:SCIPreoptGetNPrunedNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalPrunedNodes(reopt)
    ccall((:SCIPreoptGetNTotalPrunedNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNCutoffReoptnodes(reopt)
    ccall((:SCIPreoptGetNCutoffReoptnodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalCutoffReoptnodes(reopt)
    ccall((:SCIPreoptGetNTotalCutoffReoptnodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNInfNodes(reopt)
    ccall((:SCIPreoptGetNInfNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalInfNodes(reopt)
    ccall((:SCIPreoptGetNTotalInfNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end
