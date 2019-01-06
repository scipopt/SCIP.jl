# Julia wrapper for header: /usr/include/scip/pub_lp.h
# Automatically generated using Clang.jl wrap_c


function SCIPcolSort(col)
    ccall((:SCIPcolSort, libscip), Cvoid, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetObj(col)
    ccall((:SCIPcolGetObj, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLb(col)
    ccall((:SCIPcolGetLb, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetUb(col)
    ccall((:SCIPcolGetUb, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetBestBound(col)
    ccall((:SCIPcolGetBestBound, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetPrimsol(col)
    ccall((:SCIPcolGetPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetMinPrimsol(col)
    ccall((:SCIPcolGetMinPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetMaxPrimsol(col)
    ccall((:SCIPcolGetMaxPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetBasisStatus(col)
    ccall((:SCIPcolGetBasisStatus, libscip), SCIP_BASESTAT, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetVar(col)
    ccall((:SCIPcolGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetIndex(col)
    ccall((:SCIPcolGetIndex, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsIntegral(col)
    ccall((:SCIPcolIsIntegral, libscip), UInt32, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsRemovable(col)
    ccall((:SCIPcolIsRemovable, libscip), UInt32, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLPPos(col)
    ccall((:SCIPcolGetLPPos, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLPDepth(col)
    ccall((:SCIPcolGetLPDepth, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsInLP(col)
    ccall((:SCIPcolIsInLP, libscip), UInt32, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNNonz(col)
    ccall((:SCIPcolGetNNonz, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNLPNonz(col)
    ccall((:SCIPcolGetNLPNonz, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetRows(col)
    ccall((:SCIPcolGetRows, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetVals(col)
    ccall((:SCIPcolGetVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetStrongbranchNode(col)
    ccall((:SCIPcolGetStrongbranchNode, libscip), Clonglong, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNStrongbranchs(col)
    ccall((:SCIPcolGetNStrongbranchs, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPboundtypeOpposite(boundtype)
    ccall((:SCIPboundtypeOpposite, libscip), SCIP_BOUNDTYPE, (SCIP_BOUNDTYPE,), boundtype)
end

function SCIProwComp(elem1, elem2)
    ccall((:SCIProwComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIProwLock(row)
    ccall((:SCIProwLock, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwUnlock(row)
    ccall((:SCIProwUnlock, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetScalarProduct(row1, row2)
    ccall((:SCIProwGetScalarProduct, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}), row1, row2)
end

function SCIProwGetParallelism(row1, row2, orthofunc)
    ccall((:SCIProwGetParallelism, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}, UInt8), row1, row2, orthofunc)
end

function SCIProwGetOrthogonality(row1, row2, orthofunc)
    ccall((:SCIProwGetOrthogonality, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}, UInt8), row1, row2, orthofunc)
end

function SCIProwSort(row)
    ccall((:SCIProwSort, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNNonz(row)
    ccall((:SCIProwGetNNonz, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNLPNonz(row)
    ccall((:SCIProwGetNLPNonz, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetCols(row)
    ccall((:SCIProwGetCols, libscip), Ptr{Ptr{SCIP_COL}}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetVals(row)
    ccall((:SCIProwGetVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetConstant(row)
    ccall((:SCIProwGetConstant, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNorm(row)
    ccall((:SCIProwGetNorm, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetSumNorm(row)
    ccall((:SCIProwGetSumNorm, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLhs(row)
    ccall((:SCIProwGetLhs, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetRhs(row)
    ccall((:SCIProwGetRhs, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetDualsol(row)
    ccall((:SCIProwGetDualsol, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetDualfarkas(row)
    ccall((:SCIProwGetDualfarkas, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetBasisStatus(row)
    ccall((:SCIProwGetBasisStatus, libscip), SCIP_BASESTAT, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetName(row)
    ccall((:SCIProwGetName, libscip), Cstring, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetIndex(row)
    ccall((:SCIProwGetIndex, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetAge(row)
    ccall((:SCIProwGetAge, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetRank(row)
    ccall((:SCIProwGetRank, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsIntegral(row)
    ccall((:SCIProwIsIntegral, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsLocal(row)
    ccall((:SCIProwIsLocal, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsModifiable(row)
    ccall((:SCIProwIsModifiable, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsRemovable(row)
    ccall((:SCIProwIsRemovable, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOrigintype(row)
    ccall((:SCIProwGetOrigintype, libscip), SCIP_ROWORIGINTYPE, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOriginCons(row)
    ccall((:SCIProwGetOriginCons, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOriginSepa(row)
    ccall((:SCIProwGetOriginSepa, libscip), Ptr{SCIP_SEPA}, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsInGlobalCutpool(row)
    ccall((:SCIProwIsInGlobalCutpool, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLPPos(row)
    ccall((:SCIProwGetLPPos, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLPDepth(row)
    ccall((:SCIProwGetLPDepth, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsInLP(row)
    ccall((:SCIProwIsInLP, libscip), UInt32, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetActiveLPCount(row)
    ccall((:SCIProwGetActiveLPCount, libscip), Clonglong, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNLPsAfterCreation(row)
    ccall((:SCIProwGetNLPsAfterCreation, libscip), Clonglong, (Ptr{SCIP_ROW},), row)
end

function SCIProwChgRank(row, rank)
    ccall((:SCIProwChgRank, libscip), Cvoid, (Ptr{SCIP_ROW}, Cint), row, rank)
end
