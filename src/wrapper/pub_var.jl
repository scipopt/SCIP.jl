# Julia wrapper for header: /usr/include/scip/pub_var.h
# Automatically generated using Clang.jl wrap_c


function SCIPvarGetNLocksDown(var)
    ccall((:SCIPvarGetNLocksDown, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLocksUp(var)
    ccall((:SCIPvarGetNLocksUp, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLocksUpType(var, locktype)
    ccall((:SCIPvarGetNLocksUpType, libscip), Cint, (Ptr{SCIP_VAR}, SCIP_LOCKTYPE), var, locktype)
end

function SCIPvarGetNLocksDownType(var, locktype)
    ccall((:SCIPvarGetNLocksDownType, libscip), Cint, (Ptr{SCIP_VAR}, SCIP_LOCKTYPE), var, locktype)
end

function SCIPvarMayRoundDown(var)
    ccall((:SCIPvarMayRoundDown, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMayRoundUp(var)
    ccall((:SCIPvarMayRoundUp, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarCompareActiveAndNegated(var1, var2)
    ccall((:SCIPvarCompareActiveAndNegated, libscip), Cint, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPvarCompActiveAndNegated(elem1, elem2)
    ccall((:SCIPvarCompActiveAndNegated, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarCompare(var1, var2)
    ccall((:SCIPvarCompare, libscip), Cint, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPvarComp(elem1, elem2)
    ccall((:SCIPvarComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarCompObj(elem1, elem2)
    ccall((:SCIPvarCompObj, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarGetHashkey(userptr, elem)
    ccall((:SCIPvarGetHashkey, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, elem)
end

function SCIPvarIsHashkeyEq(userptr, key1, key2)
    ccall((:SCIPvarIsHashkeyEq, libscip), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPvarGetHashkeyVal(userptr, key)
    ccall((:SCIPvarGetHashkeyVal, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPvarsGetProbvar(vars, nvars)
    ccall((:SCIPvarsGetProbvar, libscip), Cvoid, (Ptr{Ptr{SCIP_VAR}}, Cint), vars, nvars)
end

function SCIPvarGetProbvar(var)
    ccall((:SCIPvarGetProbvar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarsGetProbvarBinary(vars, negatedarr, nvars)
    ccall((:SCIPvarsGetProbvarBinary, libscip), SCIP_RETCODE, (Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{UInt32}}, Cint), vars, negatedarr, nvars)
end

function SCIPvarGetProbvarBinary(var, negated)
    ccall((:SCIPvarGetProbvarBinary, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{UInt32}), var, negated)
end

function SCIPvarGetProbvarBound(var, bound, boundtype)
    ccall((:SCIPvarGetProbvarBound, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}), var, bound, boundtype)
end

function SCIPvarGetProbvarHole(var, left, right)
    ccall((:SCIPvarGetProbvarHole, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), var, left, right)
end

function SCIPvarGetOrigvarSum(var, scalar, constant)
    ccall((:SCIPvarGetOrigvarSum, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), var, scalar, constant)
end

function SCIPvarIsTransformedOrigvar(var)
    ccall((:SCIPvarIsTransformedOrigvar, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNBranchings(var, dir)
    ccall((:SCIPvarGetNBranchings, libscip), Clonglong, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetNBranchingsCurrentRun(var, dir)
    ccall((:SCIPvarGetNBranchingsCurrentRun, libscip), Clonglong, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetInferenceSum(var, dir)
    ccall((:SCIPvarGetInferenceSum, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetInferenceSumCurrentRun(var, dir)
    ccall((:SCIPvarGetInferenceSumCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetCutoffSum(var, dir)
    ccall((:SCIPvarGetCutoffSum, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetCutoffSumCurrentRun(var, dir)
    ccall((:SCIPvarGetCutoffSumCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetAvgBranchdepth(var, dir)
    ccall((:SCIPvarGetAvgBranchdepth, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetAvgBranchdepthCurrentRun(var, dir)
    ccall((:SCIPvarGetAvgBranchdepthCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarHasImplic(var, varfixing, implvar, impltype)
    ccall((:SCIPvarHasImplic, libscip), UInt32, (Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE), var, varfixing, implvar, impltype)
end

function SCIPvarHasBinaryImplic(var, varfixing, implvar, implvarfixing)
    ccall((:SCIPvarHasBinaryImplic, libscip), UInt32, (Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_VAR}, UInt32), var, varfixing, implvar, implvarfixing)
end

function SCIPvarsHaveCommonClique(var1, value1, var2, value2, regardimplics)
    ccall((:SCIPvarsHaveCommonClique, libscip), UInt32, (Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_VAR}, UInt32, UInt32), var1, value1, var2, value2, regardimplics)
end

function SCIPvarGetAggregatedObj(var, aggrobj)
    ccall((:SCIPvarGetAggregatedObj, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, Ptr{Cdouble}), var, aggrobj)
end

function SCIPvarSetInitial(var, initial)
    ccall((:SCIPvarSetInitial, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, UInt32), var, initial)
end

function SCIPvarSetRemovable(var, removable)
    ccall((:SCIPvarSetRemovable, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, UInt32), var, removable)
end

function SCIPvarGetName(var)
    ccall((:SCIPvarGetName, libscip), Cstring, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNUses(var)
    ccall((:SCIPvarGetNUses, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetData(var)
    ccall((:SCIPvarGetData, libscip), Ptr{SCIP_VARDATA}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarSetData(var, vardata)
    ccall((:SCIPvarSetData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{SCIP_VARDATA}), var, vardata)
end

function SCIPvarSetDelorigData(var, vardelorig)
    ccall((:SCIPvarSetDelorigData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vardelorig)
end

function SCIPvarSetTransData(var, vartrans)
    ccall((:SCIPvarSetTransData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vartrans)
end

function SCIPvarSetDeltransData(var, vardeltrans)
    ccall((:SCIPvarSetDeltransData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vardeltrans)
end

function SCIPvarSetCopyData(var, varcopy)
    ccall((:SCIPvarSetCopyData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, varcopy)
end

function SCIPvarGetStatus(var)
    ccall((:SCIPvarGetStatus, libscip), SCIP_VARSTATUS, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsOriginal(var)
    ccall((:SCIPvarIsOriginal, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsTransformed(var)
    ccall((:SCIPvarIsTransformed, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsNegated(var)
    ccall((:SCIPvarIsNegated, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetType(var)
    ccall((:SCIPvarGetType, libscip), SCIP_VARTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsBinary(var)
    ccall((:SCIPvarIsBinary, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsIntegral(var)
    ccall((:SCIPvarIsIntegral, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsInitial(var)
    ccall((:SCIPvarIsInitial, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsRemovable(var)
    ccall((:SCIPvarIsRemovable, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsDeleted(var)
    ccall((:SCIPvarIsDeleted, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkDeletable(var)
    ccall((:SCIPvarMarkDeletable, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkNotDeletable(var)
    ccall((:SCIPvarMarkNotDeletable, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsDeletable(var)
    ccall((:SCIPvarIsDeletable, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkDeleteGlobalStructures(var)
    ccall((:SCIPvarMarkDeleteGlobalStructures, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsActive(var)
    ccall((:SCIPvarIsActive, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetIndex(var)
    ccall((:SCIPvarGetIndex, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetProbindex(var)
    ccall((:SCIPvarGetProbindex, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetTransVar(var)
    ccall((:SCIPvarGetTransVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetCol(var)
    ccall((:SCIPvarGetCol, libscip), Ptr{SCIP_COL}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsInLP(var)
    ccall((:SCIPvarIsInLP, libscip), UInt32, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrVar(var)
    ccall((:SCIPvarGetAggrVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrScalar(var)
    ccall((:SCIPvarGetAggrScalar, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrConstant(var)
    ccall((:SCIPvarGetAggrConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrNVars(var)
    ccall((:SCIPvarGetMultaggrNVars, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrVars(var)
    ccall((:SCIPvarGetMultaggrVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrScalars(var)
    ccall((:SCIPvarGetMultaggrScalars, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrConstant(var)
    ccall((:SCIPvarGetMultaggrConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegatedVar(var)
    ccall((:SCIPvarGetNegatedVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegationVar(var)
    ccall((:SCIPvarGetNegationVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegationConstant(var)
    ccall((:SCIPvarGetNegationConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetObj(var)
    ccall((:SCIPvarGetObj, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUnchangedObj(var)
    ccall((:SCIPvarGetUnchangedObj, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbOriginal(var)
    ccall((:SCIPvarGetLbOriginal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbOriginal(var)
    ccall((:SCIPvarGetUbOriginal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistOriginal(var)
    ccall((:SCIPvarGetHolelistOriginal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbGlobal(var)
    ccall((:SCIPvarGetLbGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbGlobal(var)
    ccall((:SCIPvarGetUbGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistGlobal(var)
    ccall((:SCIPvarGetHolelistGlobal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundGlobal(var)
    ccall((:SCIPvarGetBestBoundGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundGlobal(var)
    ccall((:SCIPvarGetWorstBoundGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbLocal(var)
    ccall((:SCIPvarGetLbLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbLocal(var)
    ccall((:SCIPvarGetUbLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistLocal(var)
    ccall((:SCIPvarGetHolelistLocal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundLocal(var)
    ccall((:SCIPvarGetBestBoundLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundLocal(var)
    ccall((:SCIPvarGetWorstBoundLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundType(var)
    ccall((:SCIPvarGetBestBoundType, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundType(var)
    ccall((:SCIPvarGetWorstBoundType, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbLazy(var)
    ccall((:SCIPvarGetLbLazy, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbLazy(var)
    ccall((:SCIPvarGetUbLazy, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchFactor(var)
    ccall((:SCIPvarGetBranchFactor, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchPriority(var)
    ccall((:SCIPvarGetBranchPriority, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchDirection(var)
    ccall((:SCIPvarGetBranchDirection, libscip), SCIP_BRANCHDIR, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNVlbs(var)
    ccall((:SCIPvarGetNVlbs, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbVars(var)
    ccall((:SCIPvarGetVlbVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbCoefs(var)
    ccall((:SCIPvarGetVlbCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbConstants(var)
    ccall((:SCIPvarGetVlbConstants, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNVubs(var)
    ccall((:SCIPvarGetNVubs, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubVars(var)
    ccall((:SCIPvarGetVubVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubCoefs(var)
    ccall((:SCIPvarGetVubCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubConstants(var)
    ccall((:SCIPvarGetVubConstants, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNImpls(var, varfixing)
    ccall((:SCIPvarGetNImpls, libscip), Cint, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetImplVars(var, varfixing)
    ccall((:SCIPvarGetImplVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetImplTypes(var, varfixing)
    ccall((:SCIPvarGetImplTypes, libscip), Ptr{SCIP_BOUNDTYPE}, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetImplBounds(var, varfixing)
    ccall((:SCIPvarGetImplBounds, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetImplIds(var, varfixing)
    ccall((:SCIPvarGetImplIds, libscip), Ptr{Cint}, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetNCliques(var, varfixing)
    ccall((:SCIPvarGetNCliques, libscip), Cint, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetCliques(var, varfixing)
    ccall((:SCIPvarGetCliques, libscip), Ptr{Ptr{SCIP_CLIQUE}}, (Ptr{SCIP_VAR}, UInt32), var, varfixing)
end

function SCIPvarGetLPSol(var)
    ccall((:SCIPvarGetLPSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLPSol(var)
    ccall((:SCIPvarGetNLPSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBdchgInfoLb(var, pos)
    ccall((:SCIPvarGetBdchgInfoLb, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Cint), var, pos)
end

function SCIPvarGetNBdchgInfosLb(var)
    ccall((:SCIPvarGetNBdchgInfosLb, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBdchgInfoUb(var, pos)
    ccall((:SCIPvarGetBdchgInfoUb, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Cint), var, pos)
end

function SCIPvarGetNBdchgInfosUb(var)
    ccall((:SCIPvarGetNBdchgInfosUb, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetValuehistory(var)
    ccall((:SCIPvarGetValuehistory, libscip), Ptr{SCIP_VALUEHISTORY}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLPSol_rec(var)
    ccall((:SCIPvarGetLPSol_rec, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLPSol_rec(var)
    ccall((:SCIPvarGetNLPSol_rec, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetPseudoSol(var)
    ccall((:SCIPvarGetPseudoSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetSol(var, getlpval)
    ccall((:SCIPvarGetSol, libscip), Cdouble, (Ptr{SCIP_VAR}, UInt32), var, getlpval)
end

function SCIPvarGetRootSol(var)
    ccall((:SCIPvarGetRootSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootSol(var)
    ccall((:SCIPvarGetBestRootSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootRedcost(var)
    ccall((:SCIPvarGetBestRootRedcost, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootLPObjval(var)
    ccall((:SCIPvarGetBestRootLPObjval, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarSetBestRootSol(var, rootsol, rootredcost, rootlpobjval)
    ccall((:SCIPvarSetBestRootSol, libscip), Cvoid, (Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), var, rootsol, rootredcost, rootlpobjval)
end

function SCIPvarGetAvgSol(var)
    ccall((:SCIPvarGetAvgSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbchgInfo(var, bdchgidx, after)
    ccall((:SCIPvarGetLbchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), var, bdchgidx, after)
end

function SCIPvarGetUbchgInfo(var, bdchgidx, after)
    ccall((:SCIPvarGetUbchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), var, bdchgidx, after)
end

function SCIPvarGetBdchgInfo(var, boundtype, bdchgidx, after)
    ccall((:SCIPvarGetBdchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, UInt32), var, boundtype, bdchgidx, after)
end

function SCIPvarGetLbAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarGetLbAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), var, bdchgidx, after)
end

function SCIPvarGetUbAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarGetUbAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), var, bdchgidx, after)
end

function SCIPvarGetBdAtIndex(var, boundtype, bdchgidx, after)
    ccall((:SCIPvarGetBdAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, UInt32), var, boundtype, bdchgidx, after)
end

function SCIPvarWasFixedAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarWasFixedAtIndex, libscip), UInt32, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), var, bdchgidx, after)
end

function SCIPvarGetLastBdchgIndex(var)
    ccall((:SCIPvarGetLastBdchgIndex, libscip), Ptr{SCIP_BDCHGIDX}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLastBdchgDepth(var)
    ccall((:SCIPvarGetLastBdchgDepth, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarWasFixedEarlier(var1, var2)
    ccall((:SCIPvarWasFixedEarlier, libscip), UInt32, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPbdchgidxIsEarlier(bdchgidx1, bdchgidx2)
    ccall((:SCIPbdchgidxIsEarlier, libscip), UInt32, (Ptr{SCIP_BDCHGIDX}, Ptr{SCIP_BDCHGIDX}), bdchgidx1, bdchgidx2)
end

function SCIPbdchgidxIsEarlierNonNull(bdchgidx1, bdchgidx2)
    ccall((:SCIPbdchgidxIsEarlierNonNull, libscip), UInt32, (Ptr{SCIP_BDCHGIDX}, Ptr{SCIP_BDCHGIDX}), bdchgidx1, bdchgidx2)
end

function SCIPbdchginfoGetOldbound(bdchginfo)
    ccall((:SCIPbdchginfoGetOldbound, libscip), Cdouble, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetNewbound(bdchginfo)
    ccall((:SCIPbdchginfoGetNewbound, libscip), Cdouble, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetVar(bdchginfo)
    ccall((:SCIPbdchginfoGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetChgtype(bdchginfo)
    ccall((:SCIPbdchginfoGetChgtype, libscip), SCIP_BOUNDCHGTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetBoundtype(bdchginfo)
    ccall((:SCIPbdchginfoGetBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetDepth(bdchginfo)
    ccall((:SCIPbdchginfoGetDepth, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetPos(bdchginfo)
    ccall((:SCIPbdchginfoGetPos, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetIdx(bdchginfo)
    ccall((:SCIPbdchginfoGetIdx, libscip), Ptr{SCIP_BDCHGIDX}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferVar(bdchginfo)
    ccall((:SCIPbdchginfoGetInferVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferCons(bdchginfo)
    ccall((:SCIPbdchginfoGetInferCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferProp(bdchginfo)
    ccall((:SCIPbdchginfoGetInferProp, libscip), Ptr{SCIP_PROP}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferInfo(bdchginfo)
    ccall((:SCIPbdchginfoGetInferInfo, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferBoundtype(bdchginfo)
    ccall((:SCIPbdchginfoGetInferBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoIsRedundant(bdchginfo)
    ccall((:SCIPbdchginfoIsRedundant, libscip), UInt32, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoHasInferenceReason(bdchginfo)
    ccall((:SCIPbdchginfoHasInferenceReason, libscip), UInt32, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoIsTighter(bdchginfo1, bdchginfo2)
    ccall((:SCIPbdchginfoIsTighter, libscip), UInt32, (Ptr{SCIP_BDCHGINFO}, Ptr{SCIP_BDCHGINFO}), bdchginfo1, bdchginfo2)
end

function SCIPboundchgGetNewbound(boundchg)
    ccall((:SCIPboundchgGetNewbound, libscip), Cdouble, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetVar(boundchg)
    ccall((:SCIPboundchgGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetBoundchgtype(boundchg)
    ccall((:SCIPboundchgGetBoundchgtype, libscip), SCIP_BOUNDCHGTYPE, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetBoundtype(boundchg)
    ccall((:SCIPboundchgGetBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgIsRedundant(boundchg)
    ccall((:SCIPboundchgIsRedundant, libscip), UInt32, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPdomchgGetNBoundchgs(domchg)
    ccall((:SCIPdomchgGetNBoundchgs, libscip), Cint, (Ptr{SCIP_DOMCHG},), domchg)
end

function SCIPdomchgGetBoundchg(domchg, pos)
    ccall((:SCIPdomchgGetBoundchg, libscip), Ptr{SCIP_BOUNDCHG}, (Ptr{SCIP_DOMCHG}, Cint), domchg, pos)
end

function SCIPholelistGetLeft(holelist)
    ccall((:SCIPholelistGetLeft, libscip), Cdouble, (Ptr{SCIP_HOLELIST},), holelist)
end

function SCIPholelistGetRight(holelist)
    ccall((:SCIPholelistGetRight, libscip), Cdouble, (Ptr{SCIP_HOLELIST},), holelist)
end

function SCIPholelistGetNext(holelist)
    ccall((:SCIPholelistGetNext, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_HOLELIST},), holelist)
end
