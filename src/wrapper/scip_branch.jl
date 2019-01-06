# Julia wrapper for header: /usr/include/scip/scip_branch.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeBranchrule(scip, name, desc, priority, maxdepth, maxbounddist, branchcopy, branchfree, branchinit, branchexit, branchinitsol, branchexitsol, branchexeclp, branchexecext, branchexecps, branchruledata)
    ccall((:SCIPincludeBranchrule, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cint, Cint, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BRANCHRULEDATA}), scip, name, desc, priority, maxdepth, maxbounddist, branchcopy, branchfree, branchinit, branchexit, branchinitsol, branchexitsol, branchexeclp, branchexecext, branchexecps, branchruledata)
end

function SCIPincludeBranchruleBasic(scip, branchruleptr, name, desc, priority, maxdepth, maxbounddist, branchruledata)
    ccall((:SCIPincludeBranchruleBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_BRANCHRULE}}, Cstring, Cstring, Cint, Cint, Cdouble, Ptr{SCIP_BRANCHRULEDATA}), scip, branchruleptr, name, desc, priority, maxdepth, maxbounddist, branchruledata)
end

function SCIPsetBranchruleCopy(scip, branchrule, branchcopy)
    ccall((:SCIPsetBranchruleCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchcopy)
end

function SCIPsetBranchruleFree(scip, branchrule, branchfree)
    ccall((:SCIPsetBranchruleFree, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchfree)
end

function SCIPsetBranchruleInit(scip, branchrule, branchinit)
    ccall((:SCIPsetBranchruleInit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchinit)
end

function SCIPsetBranchruleExit(scip, branchrule, branchexit)
    ccall((:SCIPsetBranchruleExit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexit)
end

function SCIPsetBranchruleInitsol(scip, branchrule, branchinitsol)
    ccall((:SCIPsetBranchruleInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchinitsol)
end

function SCIPsetBranchruleExitsol(scip, branchrule, branchexitsol)
    ccall((:SCIPsetBranchruleExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexitsol)
end

function SCIPsetBranchruleExecLp(scip, branchrule, branchexeclp)
    ccall((:SCIPsetBranchruleExecLp, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexeclp)
end

function SCIPsetBranchruleExecExt(scip, branchrule, branchexecext)
    ccall((:SCIPsetBranchruleExecExt, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexecext)
end

function SCIPsetBranchruleExecPs(scip, branchrule, branchexecps)
    ccall((:SCIPsetBranchruleExecPs, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexecps)
end

function SCIPfindBranchrule(scip, name)
    ccall((:SCIPfindBranchrule, libscip), Ptr{SCIP_BRANCHRULE}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetBranchrules(scip)
    ccall((:SCIPgetBranchrules, libscip), Ptr{Ptr{SCIP_BRANCHRULE}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNBranchrules(scip)
    ccall((:SCIPgetNBranchrules, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetBranchrulePriority(scip, branchrule, priority)
    ccall((:SCIPsetBranchrulePriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Cint), scip, branchrule, priority)
end

function SCIPsetBranchruleMaxdepth(scip, branchrule, maxdepth)
    ccall((:SCIPsetBranchruleMaxdepth, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Cint), scip, branchrule, maxdepth)
end

function SCIPsetBranchruleMaxbounddist(scip, branchrule, maxbounddist)
    ccall((:SCIPsetBranchruleMaxbounddist, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE}, Cdouble), scip, branchrule, maxbounddist)
end

function SCIPgetLPBranchCands(scip, lpcands, lpcandssol, lpcandsfrac, nlpcands, npriolpcands, nfracimplvars)
    ccall((:SCIPgetLPBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, lpcands, lpcandssol, lpcandsfrac, nlpcands, npriolpcands, nfracimplvars)
end

function SCIPgetNLPBranchCands(scip)
    ccall((:SCIPgetNLPBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioLPBranchCands(scip)
    ccall((:SCIPgetNPrioLPBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetExternBranchCands(scip, externcands, externcandssol, externcandsscore, nexterncands, nprioexterncands, nprioexternbins, nprioexternints, nprioexternimpls)
    ccall((:SCIPgetExternBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, externcands, externcandssol, externcandsscore, nexterncands, nprioexterncands, nprioexternbins, nprioexternints, nprioexternimpls)
end

function SCIPgetNExternBranchCands(scip)
    ccall((:SCIPgetNExternBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioExternBranchCands(scip)
    ccall((:SCIPgetNPrioExternBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioExternBranchBins(scip)
    ccall((:SCIPgetNPrioExternBranchBins, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioExternBranchInts(scip)
    ccall((:SCIPgetNPrioExternBranchInts, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioExternBranchImpls(scip)
    ccall((:SCIPgetNPrioExternBranchImpls, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioExternBranchConts(scip)
    ccall((:SCIPgetNPrioExternBranchConts, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPaddExternBranchCand(scip, var, score, solval)
    ccall((:SCIPaddExternBranchCand, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, score, solval)
end

function SCIPclearExternBranchCands(scip)
    ccall((:SCIPclearExternBranchCands, libscip), Cvoid, (Ptr{SCIP_},), scip)
end

function SCIPcontainsExternBranchCand(scip, var)
    ccall((:SCIPcontainsExternBranchCand, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetPseudoBranchCands(scip, pseudocands, npseudocands, npriopseudocands)
    ccall((:SCIPgetPseudoBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}), scip, pseudocands, npseudocands, npriopseudocands)
end

function SCIPgetNPseudoBranchCands(scip)
    ccall((:SCIPgetNPseudoBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioPseudoBranchCands(scip)
    ccall((:SCIPgetNPrioPseudoBranchCands, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioPseudoBranchBins(scip)
    ccall((:SCIPgetNPrioPseudoBranchBins, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioPseudoBranchInts(scip)
    ccall((:SCIPgetNPrioPseudoBranchInts, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetNPrioPseudoBranchImpls(scip)
    ccall((:SCIPgetNPrioPseudoBranchImpls, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetBranchScore(scip, var, downgain, upgain)
    ccall((:SCIPgetBranchScore, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, downgain, upgain)
end

function SCIPgetBranchScoreMultiple(scip, var, nchildren, gains)
    ccall((:SCIPgetBranchScoreMultiple, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}), scip, var, nchildren, gains)
end

function SCIPgetBranchingPoint(scip, var, suggestion)
    ccall((:SCIPgetBranchingPoint, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble), scip, var, suggestion)
end

function SCIPcalcNodeselPriority(scip, var, branchdir, targetvalue)
    ccall((:SCIPcalcNodeselPriority, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cdouble), scip, var, branchdir, targetvalue)
end

function SCIPcalcChildEstimate(scip, var, targetvalue)
    ccall((:SCIPcalcChildEstimate, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble), scip, var, targetvalue)
end

function SCIPcreateChild(scip, node, nodeselprio, estimate)
    ccall((:SCIPcreateChild, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_NODE}}, Cdouble, Cdouble), scip, node, nodeselprio, estimate)
end

function SCIPbranchVar(scip, var, downchild, eqchild, upchild)
    ccall((:SCIPbranchVar, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, downchild, eqchild, upchild)
end

function SCIPbranchVarHole(scip, var, left, right, downchild, upchild)
    ccall((:SCIPbranchVarHole, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, left, right, downchild, upchild)
end

function SCIPbranchVarVal(scip, var, val, downchild, eqchild, upchild)
    ccall((:SCIPbranchVarVal, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, val, downchild, eqchild, upchild)
end

function SCIPbranchVarValNary(scip, var, val, n, minwidth, widthfactor, nchildren)
    ccall((:SCIPbranchVarValNary, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cdouble, Cint, Cdouble, Cdouble, Ptr{Cint}), scip, var, val, n, minwidth, widthfactor, nchildren)
end

function SCIPbranchLP(scip, result)
    ccall((:SCIPbranchLP, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_RESULT}), scip, result)
end

function SCIPbranchExtern(scip, result)
    ccall((:SCIPbranchExtern, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_RESULT}), scip, result)
end

function SCIPbranchPseudo(scip, result)
    ccall((:SCIPbranchPseudo, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_RESULT}), scip, result)
end
