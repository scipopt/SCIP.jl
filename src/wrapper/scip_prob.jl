# Julia wrapper for header: /usr/include/scip/scip_prob.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateProb(scip, name, probdelorig, probtrans, probdeltrans, probinitsol, probexitsol, probcopy, probdata)
    ccall((:SCIPcreateProb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PROBDATA}), scip, name, probdelorig, probtrans, probdeltrans, probinitsol, probexitsol, probcopy, probdata)
end

function SCIPcreateProbBasic(scip, name)
    ccall((:SCIPcreateProbBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPsetProbDelorig(scip, probdelorig)
    ccall((:SCIPsetProbDelorig, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probdelorig)
end

function SCIPsetProbTrans(scip, probtrans)
    ccall((:SCIPsetProbTrans, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probtrans)
end

function SCIPsetProbDeltrans(scip, probdeltrans)
    ccall((:SCIPsetProbDeltrans, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probdeltrans)
end

function SCIPsetProbInitsol(scip, probinitsol)
    ccall((:SCIPsetProbInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probinitsol)
end

function SCIPsetProbExitsol(scip, probexitsol)
    ccall((:SCIPsetProbExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probexitsol)
end

function SCIPsetProbCopy(scip, probcopy)
    ccall((:SCIPsetProbCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, probcopy)
end

function SCIPreadProb(scip, filename, extension)
    ccall((:SCIPreadProb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring), scip, filename, extension)
end

function SCIPwriteOrigProblem(scip, filename, extension, genericnames)
    ccall((:SCIPwriteOrigProblem, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, UInt32), scip, filename, extension, genericnames)
end

function SCIPwriteTransProblem(scip, filename, extension, genericnames)
    ccall((:SCIPwriteTransProblem, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, UInt32), scip, filename, extension, genericnames)
end

function SCIPfreeProb(scip)
    ccall((:SCIPfreeProb, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPpermuteProb(scip, randseed, permuteconss, permutebinvars, permuteintvars, permuteimplvars, permutecontvars)
    ccall((:SCIPpermuteProb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, randseed, permuteconss, permutebinvars, permuteintvars, permuteimplvars, permutecontvars)
end

function SCIPgetProbData(scip)
    ccall((:SCIPgetProbData, libscip), Ptr{SCIP_PROBDATA}, (Ptr{SCIP_},), scip)
end

function SCIPsetProbData(scip, probdata)
    ccall((:SCIPsetProbData, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PROBDATA}), scip, probdata)
end

function SCIPgetProbName(scip)
    ccall((:SCIPgetProbName, libscip), Cstring, (Ptr{SCIP_},), scip)
end

function SCIPsetProbName(scip, name)
    ccall((:SCIPsetProbName, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPchgReoptObjective(scip, objsense, vars, coefs, nvars)
    ccall((:SCIPchgReoptObjective, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_OBJSENSE, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), scip, objsense, vars, coefs, nvars)
end

function SCIPgetObjsense(scip)
    ccall((:SCIPgetObjsense, libscip), SCIP_OBJSENSE, (Ptr{SCIP_},), scip)
end

function SCIPsetObjsense(scip, objsense)
    ccall((:SCIPsetObjsense, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_OBJSENSE), scip, objsense)
end

function SCIPaddObjoffset(scip, addval)
    ccall((:SCIPaddObjoffset, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, addval)
end

function SCIPaddOrigObjoffset(scip, addval)
    ccall((:SCIPaddOrigObjoffset, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, addval)
end

function SCIPgetOrigObjoffset(scip)
    ccall((:SCIPgetOrigObjoffset, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetOrigObjscale(scip)
    ccall((:SCIPgetOrigObjscale, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetTransObjoffset(scip)
    ccall((:SCIPgetTransObjoffset, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetTransObjscale(scip)
    ccall((:SCIPgetTransObjscale, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPsetObjlimit(scip, objlimit)
    ccall((:SCIPsetObjlimit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, objlimit)
end

function SCIPgetObjlimit(scip)
    ccall((:SCIPgetObjlimit, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPsetObjIntegral(scip)
    ccall((:SCIPsetObjIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPisObjIntegral(scip)
    ccall((:SCIPisObjIntegral, libscip), UInt32, (Ptr{SCIP_},), scip)
end

function SCIPgetObjNorm(scip)
    ccall((:SCIPgetObjNorm, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPaddVar(scip, var)
    ccall((:SCIPaddVar, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPaddPricedVar(scip, var, score)
    ccall((:SCIPaddPricedVar, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble), scip, var, score)
end

function SCIPdelVar(scip, var, deleted)
    ccall((:SCIPdelVar, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Ptr{UInt32}), scip, var, deleted)
end

function SCIPgetVarsData(scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPgetVars(scip)
    ccall((:SCIPgetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNVars(scip)
    ccall((:SCIPgetNVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNBinVars(scip)
    ccall((:SCIPgetNBinVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNIntVars(scip)
    ccall((:SCIPgetNIntVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNImplVars(scip)
    ccall((:SCIPgetNImplVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNContVars(scip)
    ccall((:SCIPgetNContVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNObjVars(scip)
    ccall((:SCIPgetNObjVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetFixedVars(scip)
    ccall((:SCIPgetFixedVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNFixedVars(scip)
    ccall((:SCIPgetNFixedVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetOrigVarsData(scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetOrigVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPgetOrigVars(scip)
    ccall((:SCIPgetOrigVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigVars(scip)
    ccall((:SCIPgetNOrigVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigBinVars(scip)
    ccall((:SCIPgetNOrigBinVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigIntVars(scip)
    ccall((:SCIPgetNOrigIntVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigImplVars(scip)
    ccall((:SCIPgetNOrigImplVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigContVars(scip)
    ccall((:SCIPgetNOrigContVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNTotalVars(scip)
    ccall((:SCIPgetNTotalVars, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetSolVarsData(scip, sol, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetSolVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SOL}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, sol, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPfindVar(scip, name)
    ccall((:SCIPfindVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPallVarsInProb(scip)
    ccall((:SCIPallVarsInProb, libscip), UInt32, (Ptr{SCIP_},), scip)
end

function SCIPaddCons(scip, cons)
    ccall((:SCIPaddCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdelCons(scip, cons)
    ccall((:SCIPdelCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPfindOrigCons(scip, name)
    ccall((:SCIPfindOrigCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPfindCons(scip, name)
    ccall((:SCIPfindCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetNUpgrConss(scip)
    ccall((:SCIPgetNUpgrConss, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNConss(scip)
    ccall((:SCIPgetNConss, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetConss(scip)
    ccall((:SCIPgetConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNOrigConss(scip)
    ccall((:SCIPgetNOrigConss, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetOrigConss(scip)
    ccall((:SCIPgetOrigConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNCheckConss(scip)
    ccall((:SCIPgetNCheckConss, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPaddConflict(scip, node, cons, validnode, conftype, iscutoffinvolved)
    ccall((:SCIPaddConflict, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}, SCIP_CONFTYPE, UInt32), scip, node, cons, validnode, conftype, iscutoffinvolved)
end

function SCIPclearConflictStore(scip, event)
    ccall((:SCIPclearConflictStore, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_EVENT}), scip, event)
end

function SCIPaddConsNode(scip, node, cons, validnode)
    ccall((:SCIPaddConsNode, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}), scip, node, cons, validnode)
end

function SCIPaddConsLocal(scip, cons, validnode)
    ccall((:SCIPaddConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}), scip, cons, validnode)
end

function SCIPdelConsNode(scip, node, cons)
    ccall((:SCIPdelConsNode, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}), scip, node, cons)
end

function SCIPdelConsLocal(scip, cons)
    ccall((:SCIPdelConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLocalOrigEstimate(scip)
    ccall((:SCIPgetLocalOrigEstimate, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetLocalTransEstimate(scip)
    ccall((:SCIPgetLocalTransEstimate, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetLocalDualbound(scip)
    ccall((:SCIPgetLocalDualbound, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetLocalLowerbound(scip)
    ccall((:SCIPgetLocalLowerbound, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetNodeDualbound(scip, node)
    ccall((:SCIPgetNodeDualbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetNodeLowerbound(scip, node)
    ccall((:SCIPgetNodeLowerbound, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPupdateLocalDualbound(scip, newbound)
    ccall((:SCIPupdateLocalDualbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, newbound)
end

function SCIPupdateLocalLowerbound(scip, newbound)
    ccall((:SCIPupdateLocalLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, newbound)
end

function SCIPupdateNodeDualbound(scip, node, newbound)
    ccall((:SCIPupdateNodeDualbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Cdouble), scip, node, newbound)
end

function SCIPupdateNodeLowerbound(scip, node, newbound)
    ccall((:SCIPupdateNodeLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Cdouble), scip, node, newbound)
end

function SCIPchgChildPrio(scip, child, priority)
    ccall((:SCIPchgChildPrio, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Cdouble), scip, child, priority)
end
