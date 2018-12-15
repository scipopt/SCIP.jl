# Julia wrapper for header: /usr/include/scip/scip_lp.h
# Automatically generated using Clang.jl wrap_c


function SCIPhasCurrentNodeLP(scip)
    ccall((:SCIPhasCurrentNodeLP, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPisLPConstructed(scip)
    ccall((:SCIPisLPConstructed, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPconstructLP(scip, cutoff)
    ccall((:SCIPconstructLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), scip, cutoff)
end

function SCIPflushLP(scip)
    ccall((:SCIPflushLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetLPSolstat(scip)
    ccall((:SCIPgetLPSolstat, libscip), SCIP_LPSOLSTAT, (Ptr{SCIP},), scip)
end

function SCIPisLPPrimalReliable(scip)
    ccall((:SCIPisLPPrimalReliable, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPisLPDualReliable(scip)
    ccall((:SCIPisLPDualReliable, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPisLPRelax(scip)
    ccall((:SCIPisLPRelax, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetLPObjval(scip)
    ccall((:SCIPgetLPObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPColumnObjval(scip)
    ccall((:SCIPgetLPColumnObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPLooseObjval(scip)
    ccall((:SCIPgetLPLooseObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetGlobalPseudoObjval(scip)
    ccall((:SCIPgetGlobalPseudoObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetPseudoObjval(scip)
    ccall((:SCIPgetPseudoObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisRootLPRelax(scip)
    ccall((:SCIPisRootLPRelax, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootObjval(scip)
    ccall((:SCIPgetLPRootObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootColumnObjval(scip)
    ccall((:SCIPgetLPRootColumnObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootLooseObjval(scip)
    ccall((:SCIPgetLPRootLooseObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPColsData(scip, cols, ncols)
    ccall((:SCIPgetLPColsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_COL}}}, Ptr{Cint}), scip, cols, ncols)
end

function SCIPgetLPCols(scip)
    ccall((:SCIPgetLPCols, libscip), Ptr{Ptr{SCIP_COL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPCols(scip)
    ccall((:SCIPgetNLPCols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetLPRowsData(scip, rows, nrows)
    ccall((:SCIPgetLPRowsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_ROW}}}, Ptr{Cint}), scip, rows, nrows)
end

function SCIPgetLPRows(scip)
    ccall((:SCIPgetLPRows, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPRows(scip)
    ccall((:SCIPgetNLPRows, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPallColsInLP(scip)
    ccall((:SCIPallColsInLP, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPisLPSolBasic(scip)
    ccall((:SCIPisLPSolBasic, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetLPBasisInd(scip, basisind)
    ccall((:SCIPgetLPBasisInd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}), scip, basisind)
end

function SCIPgetLPBInvRow(scip, r, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, r, coefs, inds, ninds)
end

function SCIPgetLPBInvCol(scip, c, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvCol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, c, coefs, inds, ninds)
end

function SCIPgetLPBInvARow(scip, r, binvrow, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvARow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, r, binvrow, coefs, inds, ninds)
end

function SCIPgetLPBInvACol(scip, c, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvACol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, c, coefs, inds, ninds)
end

function SCIPsumLPRows(scip, weights, sumcoef, sumlhs, sumrhs)
    ccall((:SCIPsumLPRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cdouble}, Ptr{SCIP_REALARRAY}, Ptr{Cdouble}, Ptr{Cdouble}), scip, weights, sumcoef, sumlhs, sumrhs)
end

function SCIPwriteLP(scip, filename)
    ccall((:SCIPwriteLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring), scip, filename)
end

function SCIPwriteMIP(scip, filename, genericnames, origobj, lazyconss)
    ccall((:SCIPwriteMIP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, UInt32, UInt32, UInt32), scip, filename, genericnames, origobj, lazyconss)
end

function SCIPgetLPI(scip, lpi)
    ccall((:SCIPgetLPI, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_LPI}}), scip, lpi)
end

function SCIPprintLPSolutionQuality(scip, file)
    ccall((:SCIPprintLPSolutionQuality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}), scip, file)
end

function SCIPcomputeLPRelIntPoint(scip, relaxrows, inclobjcutoff, timelimit, iterlimit, point)
    ccall((:SCIPcomputeLPRelIntPoint, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32, UInt32, Cdouble, Cint, Ptr{Ptr{SCIP_SOL}}), scip, relaxrows, inclobjcutoff, timelimit, iterlimit, point)
end

function SCIPgetColRedcost(scip, col)
    ccall((:SCIPgetColRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPgetColFarkasCoef(scip, col)
    ccall((:SCIPgetColFarkasCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPmarkColNotRemovableLocal(scip, col)
    ccall((:SCIPmarkColNotRemovableLocal, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPcreateRowCons(scip, row, conshdlr, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONSHDLR}, Cstring, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, conshdlr, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRowSepa(scip, row, sepa, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_SEPA}, Cstring, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, sepa, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRowUnspec(scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowUnspec, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Cstring, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRow(scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Cstring, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowCons(scip, row, conshdlr, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONSHDLR}, Cstring, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, conshdlr, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowSepa(scip, row, sepa, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_SEPA}, Cstring, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, sepa, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowUnspec(scip, row, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowUnspec, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Cstring, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRow(scip, row, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Cstring, Cdouble, Cdouble, UInt32, UInt32, UInt32), scip, row, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcaptureRow(scip, row)
    ccall((:SCIPcaptureRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPreleaseRow(scip, row)
    ccall((:SCIPreleaseRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}), scip, row)
end

function SCIPchgRowLhs(scip, row, lhs)
    ccall((:SCIPchgRowLhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, lhs)
end

function SCIPchgRowRhs(scip, row, rhs)
    ccall((:SCIPchgRowRhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, rhs)
end

function SCIPcacheRowExtensions(scip, row)
    ccall((:SCIPcacheRowExtensions, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPflushRowExtensions(scip, row)
    ccall((:SCIPflushRowExtensions, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPaddVarToRow(scip, row, var, val)
    ccall((:SCIPaddVarToRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_VAR}, Cdouble), scip, row, var, val)
end

function SCIPaddVarsToRow(scip, row, nvars, vars, vals)
    ccall((:SCIPaddVarsToRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, row, nvars, vars, vals)
end

function SCIPaddVarsToRowSameCoef(scip, row, nvars, vars, val)
    ccall((:SCIPaddVarsToRowSameCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Cdouble), scip, row, nvars, vars, val)
end

function SCIPcalcRowIntegralScalar(scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, intscalar, success)
    ccall((:SCIPcalcRowIntegralScalar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble, Cdouble, Clonglong, Cdouble, UInt32, Ptr{Cdouble}, Ptr{UInt32}), scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, intscalar, success)
end

function SCIPmakeRowIntegral(scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, success)
    ccall((:SCIPmakeRowIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble, Cdouble, Clonglong, Cdouble, UInt32, Ptr{UInt32}), scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, success)
end

function SCIPmarkRowNotRemovableLocal(scip, row)
    ccall((:SCIPmarkRowNotRemovableLocal, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowNumIntCols(scip, row)
    ccall((:SCIPgetRowNumIntCols, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMinCoef(scip, row)
    ccall((:SCIPgetRowMinCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMaxCoef(scip, row)
    ccall((:SCIPgetRowMaxCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMinActivity(scip, row)
    ccall((:SCIPgetRowMinActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMaxActivity(scip, row)
    ccall((:SCIPgetRowMaxActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowLPActivity(scip, row)
    ccall((:SCIPrecalcRowLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowLPActivity(scip, row)
    ccall((:SCIPgetRowLPActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowLPFeasibility(scip, row)
    ccall((:SCIPgetRowLPFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowPseudoActivity(scip, row)
    ccall((:SCIPrecalcRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowPseudoActivity(scip, row)
    ccall((:SCIPgetRowPseudoActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowPseudoFeasibility(scip, row)
    ccall((:SCIPgetRowPseudoFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowActivity(scip, row)
    ccall((:SCIPrecalcRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowActivity(scip, row)
    ccall((:SCIPgetRowActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowFeasibility(scip, row)
    ccall((:SCIPgetRowFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowSolActivity(scip, row, sol)
    ccall((:SCIPgetRowSolActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_SOL}), scip, row, sol)
end

function SCIPgetRowSolFeasibility(scip, row, sol)
    ccall((:SCIPgetRowSolFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_SOL}), scip, row, sol)
end

function SCIPprintRow(scip, row, file)
    ccall((:SCIPprintRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{FILE}), scip, row, file)
end

function SCIPstartDive(scip)
    ccall((:SCIPstartDive, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPendDive(scip)
    ccall((:SCIPendDive, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgCutoffboundDive(scip, newcutoffbound)
    ccall((:SCIPchgCutoffboundDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, newcutoffbound)
end

function SCIPchgVarObjDive(scip, var, newobj)
    ccall((:SCIPchgVarObjDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPchgVarLbDive(scip, var, newbound)
    ccall((:SCIPchgVarLbDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbDive(scip, var, newbound)
    ccall((:SCIPchgVarUbDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPaddRowDive(scip, row)
    ccall((:SCIPaddRowDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPchgRowLhsDive(scip, row, newlhs)
    ccall((:SCIPchgRowLhsDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, newlhs)
end

function SCIPchgRowRhsDive(scip, row, newrhs)
    ccall((:SCIPchgRowRhsDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, newrhs)
end

function SCIPgetVarObjDive(scip, var)
    ccall((:SCIPgetVarObjDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarLbDive(scip, var)
    ccall((:SCIPgetVarLbDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarUbDive(scip, var)
    ccall((:SCIPgetVarUbDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPsolveDiveLP(scip, itlim, lperror, cutoff)
    ccall((:SCIPsolveDiveLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{UInt32}, Ptr{UInt32}), scip, itlim, lperror, cutoff)
end

function SCIPgetLastDivenode(scip)
    ccall((:SCIPgetLastDivenode, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPinDive(scip)
    ccall((:SCIPinDive, libscip), UInt32, (Ptr{SCIP},), scip)
end
