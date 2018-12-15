# Julia wrapper for header: /usr/include/scip/scip_nlp.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeNlpi(scip, nlpi)
    ccall((:SCIPincludeNlpi, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}), scip, nlpi)
end

function SCIPfindNlpi(scip, name)
    ccall((:SCIPfindNlpi, libscip), Ptr{SCIP_NLPI}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetNlpis(scip)
    ccall((:SCIPgetNlpis, libscip), Ptr{Ptr{SCIP_NLPI}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNlpis(scip)
    ccall((:SCIPgetNNlpis, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetNlpiPriority(scip, nlpi, priority)
    ccall((:SCIPsetNlpiPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Cint), scip, nlpi, priority)
end

function SCIPisNLPEnabled(scip)
    ccall((:SCIPisNLPEnabled, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPenableNLP(scip)
    ccall((:SCIPenableNLP, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPisNLPConstructed(scip)
    ccall((:SCIPisNLPConstructed, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPhasNLPContinuousNonlinearity(scip)
    ccall((:SCIPhasNLPContinuousNonlinearity, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsData(scip, vars, nvars)
    ccall((:SCIPgetNLPVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}), scip, vars, nvars)
end

function SCIPgetNLPVars(scip)
    ccall((:SCIPgetNLPVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNLPVars(scip)
    ccall((:SCIPgetNNLPVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsNonlinearity(scip, nlcount)
    ccall((:SCIPgetNLPVarsNonlinearity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}), scip, nlcount)
end

function SCIPgetNLPVarsLbDualsol(scip)
    ccall((:SCIPgetNLPVarsLbDualsol, libscip), Ptr{Cdouble}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsUbDualsol(scip)
    ccall((:SCIPgetNLPVarsUbDualsol, libscip), Ptr{Cdouble}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPNlRowsData(scip, nlrows, nnlrows)
    ccall((:SCIPgetNLPNlRowsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NLROW}}}, Ptr{Cint}), scip, nlrows, nnlrows)
end

function SCIPgetNLPNlRows(scip)
    ccall((:SCIPgetNLPNlRows, libscip), Ptr{Ptr{SCIP_NLROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNLPNlRows(scip)
    ccall((:SCIPgetNNLPNlRows, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPaddNlRow(scip, nlrow)
    ccall((:SCIPaddNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPflushNLP(scip)
    ccall((:SCIPflushNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsetNLPInitialGuess(scip, initialguess)
    ccall((:SCIPsetNLPInitialGuess, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cdouble}), scip, initialguess)
end

function SCIPsetNLPInitialGuessSol(scip, sol)
    ccall((:SCIPsetNLPInitialGuessSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPsolveNLP(scip)
    ccall((:SCIPsolveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetNLPSolstat(scip)
    ccall((:SCIPgetNLPSolstat, libscip), SCIP_NLPSOLSTAT, (Ptr{SCIP},), scip)
end

function SCIPgetNLPTermstat(scip)
    ccall((:SCIPgetNLPTermstat, libscip), SCIP_NLPTERMSTAT, (Ptr{SCIP},), scip)
end

function SCIPgetNLPStatistics(scip, statistics)
    ccall((:SCIPgetNLPStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPSTATISTICS}), scip, statistics)
end

function SCIPgetNLPObjval(scip)
    ccall((:SCIPgetNLPObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPhasNLPSolution(scip)
    ccall((:SCIPhasNLPSolution, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetNLPFracVars(scip, fracvars, fracvarssol, fracvarsfrac, nfracvars, npriofracvars)
    ccall((:SCIPgetNLPFracVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}), scip, fracvars, fracvarssol, fracvarsfrac, nfracvars, npriofracvars)
end

function SCIPgetNLPIntPar(scip, type, ival)
    ccall((:SCIPgetNLPIntPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cint}), scip, type, ival)
end

function SCIPsetNLPIntPar(scip, type, ival)
    ccall((:SCIPsetNLPIntPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Cint), scip, type, ival)
end

function SCIPgetNLPRealPar(scip, type, dval)
    ccall((:SCIPgetNLPRealPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cdouble}), scip, type, dval)
end

function SCIPsetNLPRealPar(scip, type, dval)
    ccall((:SCIPsetNLPRealPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Cdouble), scip, type, dval)
end

function SCIPgetNLPStringPar(scip, type, sval)
    ccall((:SCIPgetNLPStringPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cstring}), scip, type, sval)
end

function SCIPsetNLPStringPar(scip, type, sval)
    ccall((:SCIPsetNLPStringPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Cstring), scip, type, sval)
end

function SCIPwriteNLP(scip, filename)
    ccall((:SCIPwriteNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring), scip, filename)
end

function SCIPgetNLPI(scip, nlpi, nlpiproblem)
    ccall((:SCIPgetNLPI, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLPI}}, Ptr{Ptr{SCIP_NLPIPROBLEM}}), scip, nlpi, nlpiproblem)
end

function SCIPstartDiveNLP(scip)
    ccall((:SCIPstartDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPendDiveNLP(scip)
    ccall((:SCIPendDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgVarObjDiveNLP(scip, var, coef)
    ccall((:SCIPchgVarObjDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, coef)
end

function SCIPchgVarBoundsDiveNLP(scip, var, lb, ub)
    ccall((:SCIPchgVarBoundsDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, lb, ub)
end

function SCIPchgVarsBoundsDiveNLP(scip, nvars, vars, lbs, ubs)
    ccall((:SCIPchgVarsBoundsDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), scip, nvars, vars, lbs, ubs)
end

function SCIPsolveDiveNLP(scip)
    ccall((:SCIPsolveDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateNlRow(scip, nlrow, name, constant, nlinvars, linvars, lincoefs, nquadvars, quadvars, nquadelems, quadelems, expression, lhs, rhs, curvature)
    ccall((:SCIPcreateNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Cstring, Cdouble, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{SCIP_QUADELEM}, Ptr{SCIP_EXPRTREE}, Cdouble, Cdouble, SCIP_EXPRCURV), scip, nlrow, name, constant, nlinvars, linvars, lincoefs, nquadvars, quadvars, nquadelems, quadelems, expression, lhs, rhs, curvature)
end

function SCIPcreateEmptyNlRow(scip, nlrow, name, lhs, rhs)
    ccall((:SCIPcreateEmptyNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Cstring, Cdouble, Cdouble), scip, nlrow, name, lhs, rhs)
end

function SCIPcreateNlRowFromRow(scip, nlrow, row)
    ccall((:SCIPcreateNlRowFromRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Ptr{SCIP_ROW}), scip, nlrow, row)
end

function SCIPcaptureNlRow(scip, nlrow)
    ccall((:SCIPcaptureNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPreleaseNlRow(scip, nlrow)
    ccall((:SCIPreleaseNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}), scip, nlrow)
end

function SCIPchgNlRowLhs(scip, nlrow, lhs)
    ccall((:SCIPchgNlRowLhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, lhs)
end

function SCIPchgNlRowRhs(scip, nlrow, rhs)
    ccall((:SCIPchgNlRowRhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, rhs)
end

function SCIPchgNlRowConstant(scip, nlrow, constant)
    ccall((:SCIPchgNlRowConstant, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, constant)
end

function SCIPaddLinearCoefToNlRow(scip, nlrow, var, val)
    ccall((:SCIPaddLinearCoefToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}, Cdouble), scip, nlrow, var, val)
end

function SCIPaddLinearCoefsToNlRow(scip, nlrow, nvars, vars, vals)
    ccall((:SCIPaddLinearCoefsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, nlrow, nvars, vars, vals)
end

function SCIPchgNlRowLinearCoef(scip, nlrow, var, coef)
    ccall((:SCIPchgNlRowLinearCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}, Cdouble), scip, nlrow, var, coef)
end

function SCIPaddQuadVarToNlRow(scip, nlrow, var)
    ccall((:SCIPaddQuadVarToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}), scip, nlrow, var)
end

function SCIPaddQuadVarsToNlRow(scip, nlrow, nvars, vars)
    ccall((:SCIPaddQuadVarsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, nlrow, nvars, vars)
end

function SCIPaddQuadElementToNlRow(scip, nlrow, quadelem)
    ccall((:SCIPaddQuadElementToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, SCIP_QUADELEM), scip, nlrow, quadelem)
end

function SCIPaddQuadElementsToNlRow(scip, nlrow, nquadelems, quadelems)
    ccall((:SCIPaddQuadElementsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{SCIP_QUADELEM}), scip, nlrow, nquadelems, quadelems)
end

function SCIPchgNlRowQuadElement(scip, nlrow, quadelement)
    ccall((:SCIPchgNlRowQuadElement, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, SCIP_QUADELEM), scip, nlrow, quadelement)
end

function SCIPsetNlRowExprtree(scip, nlrow, exprtree)
    ccall((:SCIPsetNlRowExprtree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_EXPRTREE}), scip, nlrow, exprtree)
end

function SCIPsetNlRowExprtreeParam(scip, nlrow, paramidx, paramval)
    ccall((:SCIPsetNlRowExprtreeParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Cdouble), scip, nlrow, paramidx, paramval)
end

function SCIPsetNlRowExprtreeParams(scip, nlrow, paramvals)
    ccall((:SCIPsetNlRowExprtreeParams, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, paramvals)
end

function SCIPrecalcNlRowNLPActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowNLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowNLPActivity(scip, nlrow, activity)
    ccall((:SCIPgetNlRowNLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, activity)
end

function SCIPgetNlRowNLPFeasibility(scip, nlrow, feasibility)
    ccall((:SCIPgetNlRowNLPFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, feasibility)
end

function SCIPrecalcNlRowPseudoActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowPseudoActivity(scip, nlrow, pseudoactivity)
    ccall((:SCIPgetNlRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, pseudoactivity)
end

function SCIPgetNlRowPseudoFeasibility(scip, nlrow, pseudofeasibility)
    ccall((:SCIPgetNlRowPseudoFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, pseudofeasibility)
end

function SCIPrecalcNlRowActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowActivity(scip, nlrow, activity)
    ccall((:SCIPgetNlRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, activity)
end

function SCIPgetNlRowFeasibility(scip, nlrow, feasibility)
    ccall((:SCIPgetNlRowFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, feasibility)
end

function SCIPgetNlRowSolActivity(scip, nlrow, sol, activity)
    ccall((:SCIPgetNlRowSolActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, nlrow, sol, activity)
end

function SCIPgetNlRowSolFeasibility(scip, nlrow, sol, feasibility)
    ccall((:SCIPgetNlRowSolFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, nlrow, sol, feasibility)
end

function SCIPgetNlRowActivityBounds(scip, nlrow, minactivity, maxactivity)
    ccall((:SCIPgetNlRowActivityBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}, Ptr{Cdouble}), scip, nlrow, minactivity, maxactivity)
end

function SCIPprintNlRow(scip, nlrow, file)
    ccall((:SCIPprintNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{FILE}), scip, nlrow, file)
end
