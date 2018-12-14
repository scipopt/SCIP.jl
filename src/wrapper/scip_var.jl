# Julia wrapper for header: /usr/include/scip/scip_var.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPcreateVar(scip, var, name, lb::Cdouble, ub::Cdouble, obj::Cdouble, vartype::SCIP_VARTYPE, initial::UInt32, removable::UInt32, vardelorig, vartrans, vardeltrans, varcopy, vardata)
    ccall((:SCIPcreateVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cstring, Cdouble, Cdouble, Cdouble, SCIP_VARTYPE, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_VARDATA}), scip, var, name, lb, ub, obj, vartype, initial, removable, vardelorig, vartrans, vardeltrans, varcopy, vardata)
end

function SCIPcreateVarBasic(scip, var, name, lb::Cdouble, ub::Cdouble, obj::Cdouble, vartype::SCIP_VARTYPE)
    ccall((:SCIPcreateVarBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cstring, Cdouble, Cdouble, Cdouble, SCIP_VARTYPE), scip, var, name, lb, ub, obj, vartype)
end

function SCIPwriteVarName(scip, file, var, type::UInt32)
    ccall((:SCIPwriteVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, Ptr{SCIP_VAR}, UInt32), scip, file, var, type)
end

function SCIPwriteVarsList(scip, file, vars, nvars::Cint, type::UInt32, delimiter::UInt8)
    ccall((:SCIPwriteVarsList, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, UInt8), scip, file, vars, nvars, type, delimiter)
end

function SCIPwriteVarsLinearsum(scip, file, vars, vals, nvars::Cint, type::UInt32)
    ccall((:SCIPwriteVarsLinearsum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32), scip, file, vars, vals, nvars, type)
end

function SCIPwriteVarsPolynomial(scip, file, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials::Cint, type::UInt32)
    ccall((:SCIPwriteVarsPolynomial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cint}, Cint, UInt32), scip, file, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, type)
end

function SCIPparseVar(scip, var, str, initial::UInt32, removable::UInt32, varcopy, vardelorig, vartrans, vardeltrans, vardata, endptr, success)
    ccall((:SCIPparseVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cstring, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_VARDATA}, Ptr{Cstring}, Ptr{UInt32}), scip, var, str, initial, removable, varcopy, vardelorig, vartrans, vardeltrans, vardata, endptr, success)
end

function SCIPparseVarName(scip, str, var, endptr)
    ccall((:SCIPparseVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cstring}), scip, str, var, endptr)
end

function SCIPparseVarsList(scip, str, vars, nvars, varssize::Cint, requiredsize, endptr, delimiter::UInt8, success)
    ccall((:SCIPparseVarsList, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cstring}, UInt8, Ptr{UInt32}), scip, str, vars, nvars, varssize, requiredsize, endptr, delimiter, success)
end

function SCIPparseVarsLinearsum(scip, str, vars, vals, nvars, varssize::Cint, requiredsize, endptr, success)
    ccall((:SCIPparseVarsLinearsum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cstring}, Ptr{UInt32}), scip, str, vars, vals, nvars, varssize, requiredsize, endptr, success)
end

function SCIPparseVarsPolynomial(scip, str, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, endptr, success)
    ccall((:SCIPparseVarsPolynomial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Ptr{Ptr{Ptr{Ptr{SCIP_VAR}}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Ptr{Cint}, Ptr{Cstring}, Ptr{UInt32}), scip, str, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, endptr, success)
end

function SCIPfreeParseVarsPolynomialData(scip, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials::Cint)
    ccall((:SCIPfreeParseVarsPolynomialData, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{Ptr{SCIP_VAR}}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Cint), scip, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials)
end

function SCIPcaptureVar(scip, var)
    ccall((:SCIPcaptureVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPreleaseVar(scip, var)
    ccall((:SCIPreleaseVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}), scip, var)
end

function SCIPchgVarName(scip, var, name)
    ccall((:SCIPchgVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cstring), scip, var, name)
end

function SCIPtransformVar(scip, var, transvar)
    ccall((:SCIPtransformVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, transvar)
end

function SCIPtransformVars(scip, nvars::Cint, vars, transvars)
    ccall((:SCIPtransformVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, transvars)
end

function SCIPgetTransformedVar(scip, var, transvar)
    ccall((:SCIPgetTransformedVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, transvar)
end

function SCIPgetTransformedVars(scip, nvars::Cint, vars, transvars)
    ccall((:SCIPgetTransformedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, transvars)
end

function SCIPgetNegatedVar(scip, var, negvar)
    ccall((:SCIPgetNegatedVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, negvar)
end

function SCIPgetNegatedVars(scip, nvars::Cint, vars, negvars)
    ccall((:SCIPgetNegatedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, negvars)
end

function SCIPgetBinvarRepresentative(scip, var, repvar, negated)
    ccall((:SCIPgetBinvarRepresentative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{UInt32}), scip, var, repvar, negated)
end

function SCIPgetBinvarRepresentatives(scip, nvars::Cint, vars, repvars, negated)
    ccall((:SCIPgetBinvarRepresentatives, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{UInt32}), scip, nvars, vars, repvars, negated)
end

function SCIPflattenVarAggregationGraph(scip, var)
    ccall((:SCIPflattenVarAggregationGraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetProbvarLinearSum(scip, vars, scalars, nvars, varssize::Cint, constant, requiredsize, mergemultiples::UInt32)
    ccall((:SCIPgetProbvarLinearSum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cdouble}, Ptr{Cint}, UInt32), scip, vars, scalars, nvars, varssize, constant, requiredsize, mergemultiples)
end

function SCIPgetProbvarSum(scip, var, scalar, constant)
    ccall((:SCIPgetProbvarSum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, scalar, constant)
end

function SCIPgetActiveVars(scip, vars, nvars, varssize::Cint, requiredsize)
    ccall((:SCIPgetActiveVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Ptr{Cint}), scip, vars, nvars, varssize, requiredsize)
end

function SCIPgetVarRedcost(scip, var)
    ccall((:SCIPgetVarRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarImplRedcost(scip, var, varfixing::UInt32)
    ccall((:SCIPgetVarImplRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, UInt32), scip, var, varfixing)
end

function SCIPgetVarFarkasCoef(scip, var)
    ccall((:SCIPgetVarFarkasCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarLbAtIndex(scip, var, bdchgidx, after::UInt32)
    ccall((:SCIPgetVarLbAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), scip, var, bdchgidx, after)
end

function SCIPgetVarUbAtIndex(scip, var, bdchgidx, after::UInt32)
    ccall((:SCIPgetVarUbAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), scip, var, bdchgidx, after)
end

function SCIPgetVarBdAtIndex(scip, var, boundtype::SCIP_BOUNDTYPE, bdchgidx, after::UInt32)
    ccall((:SCIPgetVarBdAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, UInt32), scip, var, boundtype, bdchgidx, after)
end

function SCIPgetVarWasFixedAtIndex(scip, var, bdchgidx, after::UInt32)
    ccall((:SCIPgetVarWasFixedAtIndex, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, UInt32), scip, var, bdchgidx, after)
end

function SCIPgetVarSol(scip, var)
    ccall((:SCIPgetVarSol, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarSols(scip, nvars::Cint, vars, vals)
    ccall((:SCIPgetVarSols, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, nvars, vars, vals)
end

function SCIPclearRelaxSolVals(scip)
    ccall((:SCIPclearRelaxSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsetRelaxSolVal(scip, var, val::Cdouble)
    ccall((:SCIPsetRelaxSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, val)
end

function SCIPsetRelaxSolVals(scip, nvars::Cint, vars, vals, includeslp::UInt32)
    ccall((:SCIPsetRelaxSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, UInt32), scip, nvars, vars, vals, includeslp)
end

function SCIPsetRelaxSolValsSol(scip, sol, includeslp::UInt32)
    ccall((:SCIPsetRelaxSolValsSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, UInt32), scip, sol, includeslp)
end

function SCIPisRelaxSolValid(scip)
    ccall((:SCIPisRelaxSolValid, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPmarkRelaxSolValid(scip, includeslp::UInt32)
    ccall((:SCIPmarkRelaxSolValid, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32), scip, includeslp)
end

function SCIPmarkRelaxSolInvalid(scip)
    ccall((:SCIPmarkRelaxSolInvalid, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetRelaxSolVal(scip, var)
    ccall((:SCIPgetRelaxSolVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetRelaxSolObj(scip)
    ccall((:SCIPgetRelaxSolObj, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisStrongbranchDownFirst(scip, var)
    ccall((:SCIPisStrongbranchDownFirst, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPstartStrongbranch(scip, enablepropagation::UInt32)
    ccall((:SCIPstartStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32), scip, enablepropagation)
end

function SCIPendStrongbranch(scip)
    ccall((:SCIPendStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetVarStrongbranchFrac(scip, var, itlim::Cint, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarStrongbranchFrac, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, var, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarStrongbranchWithPropagation(scip, var, solval::Cdouble, lpobjval::Cdouble, itlim::Cint, maxproprounds::Cint, down, up, downvalid, upvalid, ndomredsdown, ndomredsup, downinf, upinf, downconflict, upconflict, lperror, newlbs, newubs)
    ccall((:SCIPgetVarStrongbranchWithPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Clonglong}, Ptr{Clonglong}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, solval, lpobjval, itlim, maxproprounds, down, up, downvalid, upvalid, ndomredsdown, ndomredsup, downinf, upinf, downconflict, upconflict, lperror, newlbs, newubs)
end

function SCIPgetVarStrongbranchInt(scip, var, itlim::Cint, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarStrongbranchInt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, var, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarsStrongbranchesFrac(scip, vars, nvars::Cint, itlim::Cint, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarsStrongbranchesFrac, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarsStrongbranchesInt(scip, vars, nvars::Cint, itlim::Cint, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarsStrongbranchesInt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetLastStrongbranchLPSolStat(scip, branchdir::SCIP_BRANCHDIR)
    ccall((:SCIPgetLastStrongbranchLPSolStat, libscip), SCIP_LPSOLSTAT, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, branchdir)
end

function SCIPgetVarStrongbranchLast(scip, var, down, up, downvalid, upvalid, solval, lpobjval)
    ccall((:SCIPgetVarStrongbranchLast, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, down, up, downvalid, upvalid, solval, lpobjval)
end

function SCIPsetVarStrongbranchData(scip, var, lpobjval::Cdouble, primsol::Cdouble, down::Cdouble, up::Cdouble, downvalid::UInt32, upvalid::UInt32, iter::Clonglong, itlim::Cint)
    ccall((:SCIPsetVarStrongbranchData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, UInt32, UInt32, Clonglong, Cint), scip, var, lpobjval, primsol, down, up, downvalid, upvalid, iter, itlim)
end

function SCIPtryStrongbranchLPSol(scip, foundsol, cutoff)
    ccall((:SCIPtryStrongbranchLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}, Ptr{UInt32}), scip, foundsol, cutoff)
end

function SCIPgetVarStrongbranchNode(scip, var)
    ccall((:SCIPgetVarStrongbranchNode, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarStrongbranchLPAge(scip, var)
    ccall((:SCIPgetVarStrongbranchLPAge, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarNStrongbranchs(scip, var)
    ccall((:SCIPgetVarNStrongbranchs, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPaddVarLocksType(scip, var, locktype::SCIP_LOCKTYPE, nlocksdown::Cint, nlocksup::Cint)
    ccall((:SCIPaddVarLocksType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_LOCKTYPE, Cint, Cint), scip, var, locktype, nlocksdown, nlocksup)
end

function SCIPaddVarLocks(scip, var, nlocksdown::Cint, nlocksup::Cint)
    ccall((:SCIPaddVarLocks, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Cint), scip, var, nlocksdown, nlocksup)
end

function SCIPlockVarCons(scip, var, cons, lockdown::UInt32, lockup::UInt32)
    ccall((:SCIPlockVarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, UInt32, UInt32), scip, var, cons, lockdown, lockup)
end

function SCIPunlockVarCons(scip, var, cons, lockdown::UInt32, lockup::UInt32)
    ccall((:SCIPunlockVarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, UInt32, UInt32), scip, var, cons, lockdown, lockup)
end

function SCIPchgVarObj(scip, var, newobj::Cdouble)
    ccall((:SCIPchgVarObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPaddVarObj(scip, var, addobj::Cdouble)
    ccall((:SCIPaddVarObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, addobj)
end

function SCIPadjustedVarLb(scip, var, lb::Cdouble)
    ccall((:SCIPadjustedVarLb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lb)
end

function SCIPadjustedVarUb(scip, var, ub::Cdouble)
    ccall((:SCIPadjustedVarUb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, ub)
end

function SCIPchgVarLb(scip, var, newbound::Cdouble)
    ccall((:SCIPchgVarLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUb(scip, var, newbound::Cdouble)
    ccall((:SCIPchgVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarLbNode(scip, node, var, newbound::Cdouble)
    ccall((:SCIPchgVarLbNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble), scip, node, var, newbound)
end

function SCIPchgVarUbNode(scip, node, var, newbound::Cdouble)
    ccall((:SCIPchgVarUbNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble), scip, node, var, newbound)
end

function SCIPchgVarLbGlobal(scip, var, newbound::Cdouble)
    ccall((:SCIPchgVarLbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbGlobal(scip, var, newbound::Cdouble)
    ccall((:SCIPchgVarUbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarLbLazy(scip, var, lazylb::Cdouble)
    ccall((:SCIPchgVarLbLazy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lazylb)
end

function SCIPchgVarUbLazy(scip, var, lazyub::Cdouble)
    ccall((:SCIPchgVarUbLazy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lazyub)
end

function SCIPtightenVarLb(scip, var, newbound::Cdouble, force::UInt32, infeasible, tightened)
    ccall((:SCIPtightenVarLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPtightenVarUb(scip, var, newbound::Cdouble, force::UInt32, infeasible, tightened)
    ccall((:SCIPtightenVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPinferVarFixCons(scip, var, fixedval::Cdouble, infercons, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarFixCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, fixedval, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarLbCons(scip, var, newbound::Cdouble, infercons, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarLbCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarUbCons(scip, var, newbound::Cdouble, infercons, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarUbCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferBinvarCons(scip, var, fixedval::UInt32, infercons, inferinfo::Cint, infeasible, tightened)
    ccall((:SCIPinferBinvarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_CONS}, Cint, Ptr{UInt32}, Ptr{UInt32}), scip, var, fixedval, infercons, inferinfo, infeasible, tightened)
end

function SCIPinferVarFixProp(scip, var, fixedval::Cdouble, inferprop, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarFixProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, fixedval, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarLbProp(scip, var, newbound::Cdouble, inferprop, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarLbProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarUbProp(scip, var, newbound::Cdouble, inferprop, inferinfo::Cint, force::UInt32, infeasible, tightened)
    ccall((:SCIPinferVarUbProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferBinvarProp(scip, var, fixedval::UInt32, inferprop, inferinfo::Cint, infeasible, tightened)
    ccall((:SCIPinferBinvarProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_PROP}, Cint, Ptr{UInt32}, Ptr{UInt32}), scip, var, fixedval, inferprop, inferinfo, infeasible, tightened)
end

function SCIPtightenVarLbGlobal(scip, var, newbound::Cdouble, force::UInt32, infeasible, tightened)
    ccall((:SCIPtightenVarLbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPtightenVarUbGlobal(scip, var, newbound::Cdouble, force::UInt32, infeasible, tightened)
    ccall((:SCIPtightenVarUbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPcomputeVarLbGlobal(scip, var)
    ccall((:SCIPcomputeVarLbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarUbGlobal(scip, var)
    ccall((:SCIPcomputeVarUbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarLbLocal(scip, var)
    ccall((:SCIPcomputeVarLbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarUbLocal(scip, var)
    ccall((:SCIPcomputeVarUbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrLbGlobal(scip, var)
    ccall((:SCIPgetVarMultaggrLbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrUbGlobal(scip, var)
    ccall((:SCIPgetVarMultaggrUbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrLbLocal(scip, var)
    ccall((:SCIPgetVarMultaggrLbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrUbLocal(scip, var)
    ccall((:SCIPgetVarMultaggrUbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarClosestVlb(scip, var, sol, closestvlb, closestvlbidx)
    ccall((:SCIPgetVarClosestVlb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_SOL}, Ptr{Cdouble}, Ptr{Cint}), scip, var, sol, closestvlb, closestvlbidx)
end

function SCIPgetVarClosestVub(scip, var, sol, closestvub, closestvubidx)
    ccall((:SCIPgetVarClosestVub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_SOL}, Ptr{Cdouble}, Ptr{Cint}), scip, var, sol, closestvub, closestvubidx)
end

function SCIPaddVarVlb(scip, var, vlbvar, vlbcoef::Cdouble, vlbconstant::Cdouble, infeasible, nbdchgs)
    ccall((:SCIPaddVarVlb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{UInt32}, Ptr{Cint}), scip, var, vlbvar, vlbcoef, vlbconstant, infeasible, nbdchgs)
end

function SCIPaddVarVub(scip, var, vubvar, vubcoef::Cdouble, vubconstant::Cdouble, infeasible, nbdchgs)
    ccall((:SCIPaddVarVub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{UInt32}, Ptr{Cint}), scip, var, vubvar, vubcoef, vubconstant, infeasible, nbdchgs)
end

function SCIPaddVarImplication(scip, var, varfixing::UInt32, implvar, impltype::SCIP_BOUNDTYPE, implbound::Cdouble, infeasible, nbdchgs)
    ccall((:SCIPaddVarImplication, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Cdouble, Ptr{UInt32}, Ptr{Cint}), scip, var, varfixing, implvar, impltype, implbound, infeasible, nbdchgs)
end

function SCIPaddClique(scip, vars, values, nvars::Cint, isequation::UInt32, infeasible, nbdchgs)
    ccall((:SCIPaddClique, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{UInt32}, Cint, UInt32, Ptr{UInt32}, Ptr{Cint}), scip, vars, values, nvars, isequation, infeasible, nbdchgs)
end

function SCIPcalcCliquePartition(scip, vars, nvars::Cint, cliquepartition, ncliques)
    ccall((:SCIPcalcCliquePartition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, cliquepartition, ncliques)
end

function SCIPcalcNegatedCliquePartition(scip, vars, nvars::Cint, cliquepartition, ncliques)
    ccall((:SCIPcalcNegatedCliquePartition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, cliquepartition, ncliques)
end

function SCIPcleanupCliques(scip, infeasible)
    ccall((:SCIPcleanupCliques, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), scip, infeasible)
end

function SCIPgetNCliques(scip)
    ccall((:SCIPgetNCliques, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNCliquesCreated(scip)
    ccall((:SCIPgetNCliquesCreated, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetCliques(scip)
    ccall((:SCIPgetCliques, libscip), Ptr{Ptr{SCIP_CLIQUE}}, (Ptr{SCIP},), scip)
end

function SCIPhaveVarsCommonClique(scip, var1, value1::UInt32, var2, value2::UInt32, regardimplics::UInt32)
    ccall((:SCIPhaveVarsCommonClique, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}, UInt32, Ptr{SCIP_VAR}, UInt32, UInt32), scip, var1, value1, var2, value2, regardimplics)
end

function SCIPwriteCliqueGraph(scip, fname, writenodeweights::UInt32)
    ccall((:SCIPwriteCliqueGraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, UInt32), scip, fname, writenodeweights)
end

function SCIPremoveVarFromGlobalStructures(scip, var)
    ccall((:SCIPremoveVarFromGlobalStructures, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPchgVarBranchFactor(scip, var, branchfactor::Cdouble)
    ccall((:SCIPchgVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, branchfactor)
end

function SCIPscaleVarBranchFactor(scip, var, scale::Cdouble)
    ccall((:SCIPscaleVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, scale)
end

function SCIPaddVarBranchFactor(scip, var, addfactor::Cdouble)
    ccall((:SCIPaddVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, addfactor)
end

function SCIPchgVarBranchPriority(scip, var, branchpriority::Cint)
    ccall((:SCIPchgVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, branchpriority)
end

function SCIPupdateVarBranchPriority(scip, var, branchpriority::Cint)
    ccall((:SCIPupdateVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, branchpriority)
end

function SCIPaddVarBranchPriority(scip, var, addpriority::Cint)
    ccall((:SCIPaddVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, addpriority)
end

function SCIPchgVarBranchDirection(scip, var, branchdirection::SCIP_BRANCHDIR)
    ccall((:SCIPchgVarBranchDirection, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, branchdirection)
end

function SCIPchgVarType(scip, var, vartype::SCIP_VARTYPE, infeasible)
    ccall((:SCIPchgVarType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_VARTYPE, Ptr{UInt32}), scip, var, vartype, infeasible)
end

function SCIPfixVar(scip, var, fixedval::Cdouble, infeasible, fixed)
    ccall((:SCIPfixVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{UInt32}, Ptr{UInt32}), scip, var, fixedval, infeasible, fixed)
end

function SCIPaggregateVars(scip, varx, vary, scalarx::Cdouble, scalary::Cdouble, rhs::Cdouble, infeasible, redundant, aggregated)
    ccall((:SCIPaggregateVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, varx, vary, scalarx, scalary, rhs, infeasible, redundant, aggregated)
end

function SCIPmultiaggregateVar(scip, var, naggvars::Cint, aggvars, scalars, constant::Cdouble, infeasible, aggregated)
    ccall((:SCIPmultiaggregateVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Ptr{UInt32}, Ptr{UInt32}), scip, var, naggvars, aggvars, scalars, constant, infeasible, aggregated)
end

function SCIPdoNotAggr(scip)
    ccall((:SCIPdoNotAggr, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPdoNotMultaggr(scip)
    ccall((:SCIPdoNotMultaggr, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPdoNotMultaggrVar(scip, var)
    ccall((:SCIPdoNotMultaggrVar, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPallowDualReds(scip)
    ccall((:SCIPallowDualReds, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPallowObjProp(scip)
    ccall((:SCIPallowObjProp, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPmarkDoNotMultaggrVar(scip, var)
    ccall((:SCIPmarkDoNotMultaggrVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPenableVarHistory(scip)
    ccall((:SCIPenableVarHistory, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdisableVarHistory(scip)
    ccall((:SCIPdisableVarHistory, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPupdateVarPseudocost(scip, var, solvaldelta::Cdouble, objdelta::Cdouble, weight::Cdouble)
    ccall((:SCIPupdateVarPseudocost, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, var, solvaldelta, objdelta, weight)
end

function SCIPgetVarPseudocostVal(scip, var, solvaldelta::Cdouble)
    ccall((:SCIPgetVarPseudocostVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solvaldelta)
end

function SCIPgetVarPseudocostValCurrentRun(scip, var, solvaldelta::Cdouble)
    ccall((:SCIPgetVarPseudocostValCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solvaldelta)
end

function SCIPgetVarPseudocost(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarPseudocost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarPseudocostCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCount(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarPseudocostCount, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCountCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarPseudocostCountCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostVariance(scip, var, dir::SCIP_BRANCHDIR, onlycurrentrun::UInt32)
    ccall((:SCIPgetVarPseudocostVariance, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, UInt32), scip, var, dir, onlycurrentrun)
end

function SCIPcalculatePscostConfidenceBound(scip, var, dir::SCIP_BRANCHDIR, onlycurrentrun::UInt32, clevel::SCIP_CONFIDENCELEVEL)
    ccall((:SCIPcalculatePscostConfidenceBound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, UInt32, SCIP_CONFIDENCELEVEL), scip, var, dir, onlycurrentrun, clevel)
end

function SCIPsignificantVarPscostDifference(scip, varx, fracx::Cdouble, vary, fracy::Cdouble, dir::SCIP_BRANCHDIR, clevel::SCIP_CONFIDENCELEVEL, onesided::UInt32)
    ccall((:SCIPsignificantVarPscostDifference, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_VAR}, Cdouble, SCIP_BRANCHDIR, SCIP_CONFIDENCELEVEL, UInt32), scip, varx, fracx, vary, fracy, dir, clevel, onesided)
end

function SCIPpscostThresholdProbabilityTest(scip, var, frac::Cdouble, threshold::Cdouble, dir::SCIP_BRANCHDIR, clevel::SCIP_CONFIDENCELEVEL)
    ccall((:SCIPpscostThresholdProbabilityTest, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, SCIP_BRANCHDIR, SCIP_CONFIDENCELEVEL), scip, var, frac, threshold, dir, clevel)
end

function SCIPisVarPscostRelerrorReliable(scip, var, threshold::Cdouble, clevel::SCIP_CONFIDENCELEVEL)
    ccall((:SCIPisVarPscostRelerrorReliable, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, SCIP_CONFIDENCELEVEL), scip, var, threshold, clevel)
end

function SCIPgetVarPseudocostScore(scip, var, solval::Cdouble)
    ccall((:SCIPgetVarPseudocostScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solval)
end

function SCIPgetVarPseudocostScoreCurrentRun(scip, var, solval::Cdouble)
    ccall((:SCIPgetVarPseudocostScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solval)
end

function SCIPgetVarVSIDS(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarVSIDS, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarVSIDSCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarVSIDSCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarConflictScore(scip, var)
    ccall((:SCIPgetVarConflictScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarConflictScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictlengthScore(scip, var)
    ccall((:SCIPgetVarConflictlengthScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictlengthScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarConflictlengthScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgConflictlength(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgConflictlength, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgConflictlengthCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgConflictlengthCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferences(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgInferences, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferencesCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgInferencesCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferenceScore(scip, var)
    ccall((:SCIPgetVarAvgInferenceScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgInferenceScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarAvgInferenceScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPinitVarBranchStats(scip, var, downpscost::Cdouble, uppscost::Cdouble, downvsids::Cdouble, upvsids::Cdouble, downconflen::Cdouble, upconflen::Cdouble, downinfer::Cdouble, upinfer::Cdouble, downcutoff::Cdouble, upcutoff::Cdouble)
    ccall((:SCIPinitVarBranchStats, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, var, downpscost, uppscost, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
end

function SCIPinitVarValueBranchStats(scip, var, value::Cdouble, downvsids::Cdouble, upvsids::Cdouble, downconflen::Cdouble, upconflen::Cdouble, downinfer::Cdouble, upinfer::Cdouble, downcutoff::Cdouble, upcutoff::Cdouble)
    ccall((:SCIPinitVarValueBranchStats, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, var, value, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
end

function SCIPgetVarAvgCutoffs(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgCutoffs, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgCutoffsCurrentRun(scip, var, dir::SCIP_BRANCHDIR)
    ccall((:SCIPgetVarAvgCutoffsCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgCutoffScore(scip, var)
    ccall((:SCIPgetVarAvgCutoffScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgCutoffScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarAvgCutoffScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgInferenceCutoffScore(scip, var, cutoffweight::Cdouble)
    ccall((:SCIPgetVarAvgInferenceCutoffScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, cutoffweight)
end

function SCIPgetVarAvgInferenceCutoffScoreCurrentRun(scip, var, cutoffweight::Cdouble)
    ccall((:SCIPgetVarAvgInferenceCutoffScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, cutoffweight)
end

function SCIPprintVar(scip, var, file)
    ccall((:SCIPprintVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{FILE}), scip, var, file)
end
