# Julia wrapper for header: /usr/include/scip/pub_matrix.h
# Automatically generated using Clang.jl wrap_c


function SCIPmatrixGetColValPtr(matrix, col)
    ccall((:SCIPmatrixGetColValPtr, libscip), Ptr{Cdouble}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColIdxPtr(matrix, col)
    ccall((:SCIPmatrixGetColIdxPtr, libscip), Ptr{Cint}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNNonzs(matrix, col)
    ccall((:SCIPmatrixGetColNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetNColumns(matrix)
    ccall((:SCIPmatrixGetNColumns, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetColUb(matrix, col)
    ccall((:SCIPmatrixGetColUb, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColLb(matrix, col)
    ccall((:SCIPmatrixGetColLb, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNUplocks(matrix, col)
    ccall((:SCIPmatrixGetColNUplocks, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNDownlocks(matrix, col)
    ccall((:SCIPmatrixGetColNDownlocks, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetVar(matrix, col)
    ccall((:SCIPmatrixGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColName(matrix, col)
    ccall((:SCIPmatrixGetColName, libscip), Cstring, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetRowValPtr(matrix, row)
    ccall((:SCIPmatrixGetRowValPtr, libscip), Ptr{Cdouble}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowIdxPtr(matrix, row)
    ccall((:SCIPmatrixGetRowIdxPtr, libscip), Ptr{Cint}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNNonzs(matrix, row)
    ccall((:SCIPmatrixGetRowNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowName(matrix, row)
    ccall((:SCIPmatrixGetRowName, libscip), Cstring, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetNRows(matrix)
    ccall((:SCIPmatrixGetNRows, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetRowLhs(matrix, row)
    ccall((:SCIPmatrixGetRowLhs, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowRhs(matrix, row)
    ccall((:SCIPmatrixGetRowRhs, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixIsRowRhsInfinity(matrix, row)
    ccall((:SCIPmatrixIsRowRhsInfinity, libscip), UInt32, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetNNonzs(matrix)
    ccall((:SCIPmatrixGetNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetRowMinActivity(matrix, row)
    ccall((:SCIPmatrixGetRowMinActivity, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowMaxActivity(matrix, row)
    ccall((:SCIPmatrixGetRowMaxActivity, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMinActNegInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMinActNegInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMinActPosInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMinActPosInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMaxActNegInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMaxActNegInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMaxActPosInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMaxActPosInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetCons(matrix, row)
    ccall((:SCIPmatrixGetCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixUplockConflict(matrix, col)
    ccall((:SCIPmatrixUplockConflict, libscip), UInt32, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixDownlockConflict(matrix, col)
    ccall((:SCIPmatrixDownlockConflict, libscip), UInt32, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixCreate(scip, matrixptr, initialized, complete)
    ccall((:SCIPmatrixCreate, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_MATRIX}}, Ptr{UInt32}, Ptr{UInt32}), scip, matrixptr, initialized, complete)
end

function SCIPmatrixFree(scip, matrix)
    ccall((:SCIPmatrixFree, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Ptr{SCIP_MATRIX}}), scip, matrix)
end

function SCIPmatrixPrintRow(scip, matrix, row)
    ccall((:SCIPmatrixPrintRow, libscip), Cvoid, (Ptr{SCIP_}, Ptr{SCIP_MATRIX}, Cint), scip, matrix, row)
end

function SCIPmatrixGetParallelRows(scip, matrix, scale, pclass)
    ccall((:SCIPmatrixGetParallelRows, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_MATRIX}, Ptr{Cdouble}, Ptr{Cint}), scip, matrix, scale, pclass)
end

function SCIPmatrixGetParallelCols(scip, matrix, scale, pclass, varineq)
    ccall((:SCIPmatrixGetParallelCols, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_MATRIX}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}), scip, matrix, scale, pclass, varineq)
end
