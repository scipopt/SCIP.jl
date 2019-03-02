# Julia wrapper for header: /usr/include/nlpi/pub_expr.h
# Automatically generated using Clang.jl wrap_c


function SCIPexprcurvAdd(curv1, curv2)
    ccall((:SCIPexprcurvAdd, libscip), SCIP_EXPRCURV, (SCIP_EXPRCURV, SCIP_EXPRCURV), curv1, curv2)
end

function SCIPexprcurvNegate(curvature)
    ccall((:SCIPexprcurvNegate, libscip), SCIP_EXPRCURV, (SCIP_EXPRCURV,), curvature)
end

function SCIPexprcurvMultiply(factor, curvature)
    ccall((:SCIPexprcurvMultiply, libscip), SCIP_EXPRCURV, (Cdouble, SCIP_EXPRCURV), factor, curvature)
end

function SCIPexprcurvPower(basebounds, basecurv, exponent)
    ccall((:SCIPexprcurvPower, libscip), SCIP_EXPRCURV, (SCIP_INTERVAL, SCIP_EXPRCURV, Cdouble), basebounds, basecurv, exponent)
end

function SCIPexprcurvMonomial(nfactors, exponents, factoridxs, factorcurv, factorbounds)
    ccall((:SCIPexprcurvMonomial, libscip), SCIP_EXPRCURV, (Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), nfactors, exponents, factoridxs, factorcurv, factorbounds)
end

function SCIPexprcurvGetName(curv)
    ccall((:SCIPexprcurvGetName, libscip), Cstring, (SCIP_EXPRCURV,), curv)
end

function SCIPexpropGetName(op)
    ccall((:SCIPexpropGetName, libscip), Cstring, (SCIP_EXPROP,), op)
end

function SCIPexpropGetNChildren(op)
    ccall((:SCIPexpropGetNChildren, libscip), Cint, (SCIP_EXPROP,), op)
end

function SCIPexprGetOperator(expr)
    ccall((:SCIPexprGetOperator, libscip), SCIP_EXPROP, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNChildren(expr)
    ccall((:SCIPexprGetNChildren, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetChildren(expr)
    ccall((:SCIPexprGetChildren, libscip), Ptr{Ptr{SCIP_EXPR}}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpIndex(expr)
    ccall((:SCIPexprGetOpIndex, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpReal(expr)
    ccall((:SCIPexprGetOpReal, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpData(expr)
    ccall((:SCIPexprGetOpData, libscip), Ptr{Cvoid}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetRealPowerExponent(expr)
    ccall((:SCIPexprGetRealPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetIntPowerExponent(expr)
    ccall((:SCIPexprGetIntPowerExponent, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetSignPowerExponent(expr)
    ccall((:SCIPexprGetSignPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetLinearCoefs(expr)
    ccall((:SCIPexprGetLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetLinearConstant(expr)
    ccall((:SCIPexprGetLinearConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadElements(expr)
    ccall((:SCIPexprGetQuadElements, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadConstant(expr)
    ccall((:SCIPexprGetQuadConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadLinearCoefs(expr)
    ccall((:SCIPexprGetQuadLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNQuadElements(expr)
    ccall((:SCIPexprGetNQuadElements, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMonomials(expr)
    ccall((:SCIPexprGetMonomials, libscip), Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNMonomials(expr)
    ccall((:SCIPexprGetNMonomials, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetPolynomialConstant(expr)
    ccall((:SCIPexprGetPolynomialConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMonomialCoef(monomial)
    ccall((:SCIPexprGetMonomialCoef, libscip), Cdouble, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialNFactors(monomial)
    ccall((:SCIPexprGetMonomialNFactors, libscip), Cint, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialChildIndices(monomial)
    ccall((:SCIPexprGetMonomialChildIndices, libscip), Ptr{Cint}, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialExponents(monomial)
    ccall((:SCIPexprGetMonomialExponents, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetUserData(expr)
    ccall((:SCIPexprGetUserData, libscip), Ptr{SCIP_USEREXPRDATA}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprHasUserEstimator(expr)
    ccall((:SCIPexprHasUserEstimator, libscip), UInt32, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetUserEvalCapability(expr)
    ccall((:SCIPexprGetUserEvalCapability, libscip), SCIP_EXPRINTCAPABILITY, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCopyDeep(blkmem, targetexpr, sourceexpr)
    ccall((:SCIPexprCopyDeep, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_EXPR}), blkmem, targetexpr, sourceexpr)
end

function SCIPexprFreeDeep(blkmem, expr)
    ccall((:SCIPexprFreeDeep, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr)
end

function SCIPexprFreeShallow(blkmem, expr)
    ccall((:SCIPexprFreeShallow, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr)
end

function SCIPexprAdd(blkmem, expr, coef1, term1, coef2, term2, constant)
    ccall((:SCIPexprAdd, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cdouble, Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, coef1, term1, coef2, term2, constant)
end

function SCIPexprMulConstant(blkmem, expr, term, factor)
    ccall((:SCIPexprMulConstant, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, term, factor)
end

function SCIPexprCreateLinear(blkmem, expr, nchildren, children, coefs, constant)
    ccall((:SCIPexprCreateLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Ptr{Cdouble}, Cdouble), blkmem, expr, nchildren, children, coefs, constant)
end

function SCIPexprAddToLinear(blkmem, expr, nchildren, coefs, children, constant)
    ccall((:SCIPexprAddToLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint, Ptr{Cdouble}, Ptr{Ptr{SCIP_EXPR}}, Cdouble), blkmem, expr, nchildren, coefs, children, constant)
end

function SCIPexprCreateQuadratic(blkmem, expr, nchildren, children, constant, lincoefs, nquadelems, quadelems)
    ccall((:SCIPexprCreateQuadratic, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Cdouble, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADELEM}), blkmem, expr, nchildren, children, constant, lincoefs, nquadelems, quadelems)
end

function SCIPexprSortQuadElems(expr)
    ccall((:SCIPexprSortQuadElems, libscip), Cvoid, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCreatePolynomial(blkmem, expr, nchildren, children, nmonomials, monomials, constant, copymonomials)
    ccall((:SCIPexprCreatePolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, UInt32), blkmem, expr, nchildren, children, nmonomials, monomials, constant, copymonomials)
end

function SCIPexprAddMonomials(blkmem, expr, nmonomials, monomials, copymonomials)
    ccall((:SCIPexprAddMonomials, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, UInt32), blkmem, expr, nmonomials, monomials, copymonomials)
end

function SCIPexprChgPolynomialConstant(expr, constant)
    ccall((:SCIPexprChgPolynomialConstant, libscip), Cvoid, (Ptr{SCIP_EXPR}, Cdouble), expr, constant)
end

function SCIPexprMultiplyPolynomialByConstant(blkmem, expr, factor)
    ccall((:SCIPexprMultiplyPolynomialByConstant, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, factor)
end

function SCIPexprMultiplyPolynomialByMonomial(blkmem, expr, factor, childmap)
    ccall((:SCIPexprMultiplyPolynomialByMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{Cint}), blkmem, expr, factor, childmap)
end

function SCIPexprMultiplyPolynomialByPolynomial(blkmem, expr, factor, childmap)
    ccall((:SCIPexprMultiplyPolynomialByPolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{SCIP_EXPR}, Ptr{Cint}), blkmem, expr, factor, childmap)
end

function SCIPexprPolynomialPower(blkmem, expr, exponent)
    ccall((:SCIPexprPolynomialPower, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint), blkmem, expr, exponent)
end

function SCIPexprMergeMonomials(blkmem, expr, eps, mergefactors)
    ccall((:SCIPexprMergeMonomials, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cdouble, UInt32), blkmem, expr, eps, mergefactors)
end

function SCIPexprCreateMonomial(blkmem, monomial, coef, nfactors, childidxs, exponents)
    ccall((:SCIPexprCreateMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}), blkmem, monomial, coef, nfactors, childidxs, exponents)
end

function SCIPexprFreeMonomial(blkmem, monomial)
    ccall((:SCIPexprFreeMonomial, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}), blkmem, monomial)
end

function SCIPexprSortMonomialFactors(monomial)
    ccall((:SCIPexprSortMonomialFactors, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprFindMonomialFactor(monomial, childidx, pos)
    ccall((:SCIPexprFindMonomialFactor, libscip), UInt32, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint, Ptr{Cint}), monomial, childidx, pos)
end

function SCIPexprAreMonomialsEqual(monomial1, monomial2, eps)
    ccall((:SCIPexprAreMonomialsEqual, libscip), UInt32, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial1, monomial2, eps)
end

function SCIPexprAddMonomialFactors(blkmem, monomial, nfactors, childidxs, exponents)
    ccall((:SCIPexprAddMonomialFactors, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint, Ptr{Cint}, Ptr{Cdouble}), blkmem, monomial, nfactors, childidxs, exponents)
end

function SCIPexprChgMonomialCoef(monomial, newcoef)
    ccall((:SCIPexprChgMonomialCoef, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial, newcoef)
end

function SCIPexprMultiplyMonomialByMonomial(blkmem, monomial, factor, childmap)
    ccall((:SCIPexprMultiplyMonomialByMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{Cint}), blkmem, monomial, factor, childmap)
end

function SCIPexprMonomialPower(monomial, exponent)
    ccall((:SCIPexprMonomialPower, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint), monomial, exponent)
end

function SCIPexprMergeMonomialFactors(monomial, eps)
    ccall((:SCIPexprMergeMonomialFactors, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial, eps)
end

function SCIPexprSortMonomials(expr)
    ccall((:SCIPexprSortMonomials, libscip), Cvoid, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCreateUser(blkmem, expr, nchildren, children, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
    ccall((:SCIPexprCreateUser, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_USEREXPRDATA}, SCIP_EXPRINTCAPABILITY, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, expr, nchildren, children, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
end

function SCIPexprHasParam(expr)
    ccall((:SCIPexprHasParam, libscip), UInt32, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMaxDegree(expr, maxdegree)
    ccall((:SCIPexprGetMaxDegree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, maxdegree)
end

function SCIPexprGetVarsUsage(expr, varsusage)
    ccall((:SCIPexprGetVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, varsusage)
end

function SCIPexprAreEqual(expr1, expr2, eps)
    ccall((:SCIPexprAreEqual, libscip), UInt32, (Ptr{SCIP_EXPR}, Ptr{SCIP_EXPR}, Cdouble), expr1, expr2, eps)
end

function SCIPexprSimplify(blkmem, messagehdlr, expr, eps, maxexpansionexponent, nvars, nlinvars, linidxs, lincoefs)
    ccall((:SCIPexprSimplify, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_MESSAGEHDLR}, Ptr{SCIP_EXPR}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), blkmem, messagehdlr, expr, eps, maxexpansionexponent, nvars, nlinvars, linidxs, lincoefs)
end

function SCIPexprEvalShallow(expr, argvals, varvals, param, val)
    ccall((:SCIPexprEvalShallow, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, argvals, varvals, param, val)
end

function SCIPexprEval(expr, varvals, param, val)
    ccall((:SCIPexprEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, varvals, param, val)
end

function SCIPexprEvalIntShallow(expr, infinity, argvals, varvals, param, val)
    ccall((:SCIPexprEvalIntShallow, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}), expr, infinity, argvals, varvals, param, val)
end

function SCIPexprEvalInt(expr, infinity, varvals, param, val)
    ccall((:SCIPexprEvalInt, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}), expr, infinity, varvals, param, val)
end

function SCIPexprEvalUser(expr, argvals, val, gradient, hessian)
    ccall((:SCIPexprEvalUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, argvals, val, gradient, hessian)
end

function SCIPexprEvalIntUser(expr, infinity, argvals, val, gradient, hessian)
    ccall((:SCIPexprEvalIntUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), expr, infinity, argvals, val, gradient, hessian)
end

function SCIPexprCheckCurvature(expr, infinity, varbounds, param, curv, bounds)
    ccall((:SCIPexprCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), expr, infinity, varbounds, param, curv, bounds)
end

function SCIPexprEstimateUser(expr, infinity, argvals, argbounds, overestimate, coeffs, constant, success)
    ccall((:SCIPexprEstimateUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}, UInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), expr, infinity, argvals, argbounds, overestimate, coeffs, constant, success)
end

function SCIPexprSubstituteVars(blkmem, expr, substexprs)
    ccall((:SCIPexprSubstituteVars, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr, substexprs)
end

function SCIPexprReindexVars(expr, newindices)
    ccall((:SCIPexprReindexVars, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, newindices)
end

function SCIPexprReindexParams(expr, newindices)
    ccall((:SCIPexprReindexParams, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, newindices)
end

function SCIPexprPrint(expr, messagehdlr, file, varnames, paramnames, paramvals)
    ccall((:SCIPexprPrint, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cdouble}), expr, messagehdlr, file, varnames, paramnames, paramvals)
end

function SCIPexprParse(blkmem, messagehdlr, expr, str, lastchar, nvars, varnames, varnameslength)
    ccall((:SCIPexprParse, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Ptr{SCIP_EXPR}}, Cstring, Cstring, Ptr{Cint}, Ptr{Cint}, Cint), blkmem, messagehdlr, expr, str, lastchar, nvars, varnames, varnameslength)
end

function SCIPexprtreeGetRoot(tree)
    ccall((:SCIPexprtreeGetRoot, libscip), Ptr{SCIP_EXPR}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetNVars(tree)
    ccall((:SCIPexprtreeGetNVars, libscip), Cint, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetNParams(tree)
    ccall((:SCIPexprtreeGetNParams, libscip), Cint, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetParamVals(tree)
    ccall((:SCIPexprtreeGetParamVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetParamVal(tree, paramidx, paramval)
    ccall((:SCIPexprtreeSetParamVal, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Cint, Cdouble), tree, paramidx, paramval)
end

function SCIPexprtreeGetInterpreterData(tree)
    ccall((:SCIPexprtreeGetInterpreterData, libscip), Ptr{SCIP_EXPRINTDATA}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetInterpreterData(tree, interpreterdata)
    ccall((:SCIPexprtreeSetInterpreterData, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_EXPRINTDATA}), tree, interpreterdata)
end

function SCIPexprtreeFreeInterpreterData(tree)
    ccall((:SCIPexprtreeFreeInterpreterData, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeHasParam(tree)
    ccall((:SCIPexprtreeHasParam, libscip), UInt32, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetMaxDegree(tree, maxdegree)
    ccall((:SCIPexprtreeGetMaxDegree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Cint}), tree, maxdegree)
end

function SCIPexprtreeEval(tree, varvals, val)
    ccall((:SCIPexprtreeEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Cdouble}, Ptr{Cdouble}), tree, varvals, val)
end

function SCIPexprtreeEvalInt(tree, infinity, varvals, val)
    ccall((:SCIPexprtreeEvalInt, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), tree, infinity, varvals, val)
end

function SCIPexprtreePrint(tree, messagehdlr, file, varnames, paramnames)
    ccall((:SCIPexprtreePrint, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Ptr{Cstring}, Ptr{Cstring}), tree, messagehdlr, file, varnames, paramnames)
end

function SCIPexprtreeCreate(blkmem, tree, root, nvars, nparams, params)
    ccall((:SCIPexprtreeCreate, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{SCIP_EXPR}, Cint, Cint, Ptr{Cdouble}), blkmem, tree, root, nvars, nparams, params)
end

function SCIPexprtreeCopy(blkmem, targettree, sourcetree)
    ccall((:SCIPexprtreeCopy, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{SCIP_EXPRTREE}), blkmem, targettree, sourcetree)
end

function SCIPexprtreeFree(tree)
    ccall((:SCIPexprtreeFree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_EXPRTREE}},), tree)
end

function SCIPexprtreeSetParams(tree, nparams, paramvals)
    ccall((:SCIPexprtreeSetParams, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Cdouble}), tree, nparams, paramvals)
end

function SCIPexprtreeGetVarsUsage(tree, varsusage)
    ccall((:SCIPexprtreeGetVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{Cint}), tree, varsusage)
end

function SCIPexprtreeSimplify(tree, messagehdlr, eps, maxexpansionexponent, nlinvars, linidxs, lincoefs)
    ccall((:SCIPexprtreeSimplify, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), tree, messagehdlr, eps, maxexpansionexponent, nlinvars, linidxs, lincoefs)
end

function SCIPexprtreeAddExpr(tree, expr, copyexpr)
    ccall((:SCIPexprtreeAddExpr, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_EXPR}, UInt32), tree, expr, copyexpr)
end

function SCIPexprtreeCheckCurvature(tree, infinity, varbounds, curv, bounds)
    ccall((:SCIPexprtreeCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), tree, infinity, varbounds, curv, bounds)
end

function SCIPexprtreeSubstituteVars(tree, substexprs)
    ccall((:SCIPexprtreeSubstituteVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Ptr{SCIP_EXPR}}), tree, substexprs)
end

function SCIPquadelemSort(quadelems, nquadelems)
    ccall((:SCIPquadelemSort, libscip), Cvoid, (Ptr{SCIP_QUADELEM}, Cint), quadelems, nquadelems)
end

function SCIPquadelemSortedFind(quadelems, idx1, idx2, nquadelems, pos)
    ccall((:SCIPquadelemSortedFind, libscip), UInt32, (Ptr{SCIP_QUADELEM}, Cint, Cint, Cint, Ptr{Cint}), quadelems, idx1, idx2, nquadelems, pos)
end

function SCIPquadelemSqueeze(quadelems, nquadelems, nquadelemsnew)
    ccall((:SCIPquadelemSqueeze, libscip), Cvoid, (Ptr{SCIP_QUADELEM}, Cint, Ptr{Cint}), quadelems, nquadelems, nquadelemsnew)
end

function SCIPexprgraphCaptureNode(node)
    ccall((:SCIPexprgraphCaptureNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphIsNodeEnabled(node)
    ccall((:SCIPexprgraphIsNodeEnabled, libscip), UInt32, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeNChildren(node)
    ccall((:SCIPexprgraphGetNodeNChildren, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeChildren(node)
    ccall((:SCIPexprgraphGetNodeChildren, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeNParents(node)
    ccall((:SCIPexprgraphGetNodeNParents, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeParents(node)
    ccall((:SCIPexprgraphGetNodeParents, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeDepth(node)
    ccall((:SCIPexprgraphGetNodeDepth, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePosition(node)
    ccall((:SCIPexprgraphGetNodePosition, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperator(node)
    ccall((:SCIPexprgraphGetNodeOperator, libscip), SCIP_EXPROP, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperatorIndex(node)
    ccall((:SCIPexprgraphGetNodeOperatorIndex, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperatorReal(node)
    ccall((:SCIPexprgraphGetNodeOperatorReal, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeVar(exprgraph, node)
    ccall((:SCIPexprgraphGetNodeVar, libscip), Ptr{Cvoid}, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphGetNodeRealPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeRealPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeIntPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeIntPowerExponent, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeSignPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeSignPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeLinearCoefs(node)
    ccall((:SCIPexprgraphGetNodeLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeLinearConstant(node)
    ccall((:SCIPexprgraphGetNodeLinearConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticConstant(node)
    ccall((:SCIPexprgraphGetNodeQuadraticConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticLinearCoefs(node)
    ccall((:SCIPexprgraphGetNodeQuadraticLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticQuadElements(node)
    ccall((:SCIPexprgraphGetNodeQuadraticQuadElements, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticNQuadElements(node)
    ccall((:SCIPexprgraphGetNodeQuadraticNQuadElements, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialMonomials(node)
    ccall((:SCIPexprgraphGetNodePolynomialMonomials, libscip), Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialNMonomials(node)
    ccall((:SCIPexprgraphGetNodePolynomialNMonomials, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialConstant(node)
    ccall((:SCIPexprgraphGetNodePolynomialConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialMonomialCurvature(node, monomialidx, infinity, curv)
    ccall((:SCIPexprgraphGetNodePolynomialMonomialCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPHNODE}, Cint, Cdouble, Ptr{SCIP_EXPRCURV}), node, monomialidx, infinity, curv)
end

function SCIPexprgraphGetNodeUserData(node)
    ccall((:SCIPexprgraphGetNodeUserData, libscip), Ptr{SCIP_USEREXPRDATA}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphHasNodeUserEstimator(node)
    ccall((:SCIPexprgraphHasNodeUserEstimator, libscip), UInt32, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeBounds(node)
    ccall((:SCIPexprgraphGetNodeBounds, libscip), SCIP_INTERVAL, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeVal(node)
    ccall((:SCIPexprgraphGetNodeVal, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeCurvature(node)
    ccall((:SCIPexprgraphGetNodeCurvature, libscip), SCIP_EXPRCURV, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphCreateNodeLinear(blkmem, node, ncoefs, coefs, constant)
    ccall((:SCIPexprgraphCreateNodeLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cdouble}, Cdouble), blkmem, node, ncoefs, coefs, constant)
end

function SCIPexprgraphCreateNodeQuadratic(blkmem, node, nchildren, lincoefs, nquadelems, quadelems, constant)
    ccall((:SCIPexprgraphCreateNodeQuadratic, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADELEM}, Cdouble), blkmem, node, nchildren, lincoefs, nquadelems, quadelems, constant)
end

function SCIPexprgraphCreateNodePolynomial(blkmem, node, nmonomials, monomials, constant, copymonomials)
    ccall((:SCIPexprgraphCreateNodePolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, UInt32), blkmem, node, nmonomials, monomials, constant, copymonomials)
end

function SCIPexprgraphNodePolynomialAddMonomials(blkmem, node, nmonomials, monomials, copymonomials)
    ccall((:SCIPexprgraphNodePolynomialAddMonomials, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, UInt32), blkmem, node, nmonomials, monomials, copymonomials)
end

function SCIPexprgraphCreateNodeUser(blkmem, node, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
    ccall((:SCIPexprgraphCreateNodeUser, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{SCIP_USEREXPRDATA}, SCIP_EXPRINTCAPABILITY, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, node, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
end

function SCIPexprgraphNodeSplitOffLinear(exprgraph, node, linvarssize, nlinvars, linvars, lincoefs, constant)
    ccall((:SCIPexprgraphNodeSplitOffLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}), exprgraph, node, linvarssize, nlinvars, linvars, lincoefs, constant)
end

function SCIPexprgraphMoveNodeParents(exprgraph, srcnode, targetnode)
    ccall((:SCIPexprgraphMoveNodeParents, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, srcnode, targetnode)
end

function SCIPexprgraphReleaseNode(exprgraph, node)
    ccall((:SCIPexprgraphReleaseNode, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, node)
end

function SCIPexprgraphFreeNode(blkmem, node)
    ccall((:SCIPexprgraphFreeNode, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), blkmem, node)
end

function SCIPexprgraphEnableNode(exprgraph, node)
    ccall((:SCIPexprgraphEnableNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphDisableNode(exprgraph, node)
    ccall((:SCIPexprgraphDisableNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphHasNodeSibling(node)
    ccall((:SCIPexprgraphHasNodeSibling, libscip), UInt32, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphAreAllNodeChildrenVars(node)
    ccall((:SCIPexprgraphAreAllNodeChildrenVars, libscip), UInt32, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphHasNodeNonlinearAncestor(node)
    ccall((:SCIPexprgraphHasNodeNonlinearAncestor, libscip), UInt32, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphPrintNode(node, messagehdlr, file)
    ccall((:SCIPexprgraphPrintNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}), node, messagehdlr, file)
end

function SCIPexprgraphTightenNodeBounds(exprgraph, node, nodebounds, minstrength, infinity, cutoff)
    ccall((:SCIPexprgraphTightenNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, SCIP_INTERVAL, Cdouble, Cdouble, Ptr{UInt32}), exprgraph, node, nodebounds, minstrength, infinity, cutoff)
end

function SCIPexprgraphUpdateNodeBoundsCurvature(node, infinity, minstrength, clearreverseprop)
    ccall((:SCIPexprgraphUpdateNodeBoundsCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble, UInt32), node, infinity, minstrength, clearreverseprop)
end

function SCIPexprgraphGetDepth(exprgraph)
    ccall((:SCIPexprgraphGetDepth, libscip), Cint, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNNodes(exprgraph)
    ccall((:SCIPexprgraphGetNNodes, libscip), Ptr{Cint}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNodes(exprgraph)
    ccall((:SCIPexprgraphGetNodes, libscip), Ptr{Ptr{Ptr{SCIP_EXPRGRAPHNODE}}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNVars(exprgraph)
    ccall((:SCIPexprgraphGetNVars, libscip), Cint, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetVars(exprgraph)
    ccall((:SCIPexprgraphGetVars, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetVarNodes(exprgraph)
    ccall((:SCIPexprgraphGetVarNodes, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphSetVarNodeValue(varnode, value)
    ccall((:SCIPexprgraphSetVarNodeValue, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), varnode, value)
end

function SCIPexprgraphSetVarsBounds(exprgraph, varbounds)
    ccall((:SCIPexprgraphSetVarsBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_INTERVAL}), exprgraph, varbounds)
end

function SCIPexprgraphSetVarBounds(exprgraph, var, varbounds)
    ccall((:SCIPexprgraphSetVarBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, SCIP_INTERVAL), exprgraph, var, varbounds)
end

function SCIPexprgraphSetVarNodeBounds(exprgraph, varnode, varbounds)
    ccall((:SCIPexprgraphSetVarNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, SCIP_INTERVAL), exprgraph, varnode, varbounds)
end

function SCIPexprgraphSetVarNodeLb(exprgraph, varnode, lb)
    ccall((:SCIPexprgraphSetVarNodeLb, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), exprgraph, varnode, lb)
end

function SCIPexprgraphSetVarNodeUb(exprgraph, varnode, ub)
    ccall((:SCIPexprgraphSetVarNodeUb, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), exprgraph, varnode, ub)
end

function SCIPexprgraphGetVarsBounds(exprgraph)
    ccall((:SCIPexprgraphGetVarsBounds, libscip), Ptr{SCIP_INTERVAL}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphCreate(blkmem, exprgraph, varssizeinit, depthinit, exprgraphvaradded, exprgraphvarremove, exprgraphvarchgidx, userdata)
    ccall((:SCIPexprgraphCreate, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPH}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, exprgraph, varssizeinit, depthinit, exprgraphvaradded, exprgraphvarremove, exprgraphvarchgidx, userdata)
end

function SCIPexprgraphFree(exprgraph)
    ccall((:SCIPexprgraphFree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_EXPRGRAPH}},), exprgraph)
end

function SCIPexprgraphAddNode(exprgraph, node, mindepth, nchildren, children)
    ccall((:SCIPexprgraphAddNode, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Cint, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, node, mindepth, nchildren, children)
end

function SCIPexprgraphAddVars(exprgraph, nvars, vars, varnodes)
    ccall((:SCIPexprgraphAddVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cint, Ptr{Ptr{Cvoid}}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, nvars, vars, varnodes)
end

function SCIPexprgraphAddConst(exprgraph, constant, constnode)
    ccall((:SCIPexprgraphAddConst, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, constant, constnode)
end

function SCIPexprgraphAddExprtreeSum(exprgraph, nexprtrees, exprtrees, coefs, rootnode, rootnodeisnew)
    ccall((:SCIPexprgraphAddExprtreeSum, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{UInt32}), exprgraph, nexprtrees, exprtrees, coefs, rootnode, rootnodeisnew)
end

function SCIPexprgraphReplaceVarByLinearSum(exprgraph, var, ncoefs, coefs, vars, constant)
    ccall((:SCIPexprgraphReplaceVarByLinearSum, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble), exprgraph, var, ncoefs, coefs, vars, constant)
end

function SCIPexprgraphFindVarNode(exprgraph, var, varnode)
    ccall((:SCIPexprgraphFindVarNode, libscip), UInt32, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, var, varnode)
end

function SCIPexprgraphFindConstNode(exprgraph, constant, constnode)
    ccall((:SCIPexprgraphFindConstNode, libscip), UInt32, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, constant, constnode)
end

function SCIPexprgraphPrintDot(exprgraph, messagehdlr, file, varnames)
    ccall((:SCIPexprgraphPrintDot, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}, Ptr{Cstring}), exprgraph, messagehdlr, file, varnames)
end

function SCIPexprgraphEval(exprgraph, varvals)
    ccall((:SCIPexprgraphEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cdouble}), exprgraph, varvals)
end

function SCIPexprgraphPropagateVarBounds(exprgraph, infinity, clearreverseprop, domainerror)
    ccall((:SCIPexprgraphPropagateVarBounds, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, UInt32, Ptr{UInt32}), exprgraph, infinity, clearreverseprop, domainerror)
end

function SCIPexprgraphPropagateNodeBounds(exprgraph, infinity, minstrength, cutoff)
    ccall((:SCIPexprgraphPropagateNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Cdouble, Ptr{UInt32}), exprgraph, infinity, minstrength, cutoff)
end

function SCIPexprgraphCheckCurvature(exprgraph, infinity, clearreverseprop)
    ccall((:SCIPexprgraphCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, UInt32), exprgraph, infinity, clearreverseprop)
end

function SCIPexprgraphSimplify(exprgraph, messagehdlr, eps, maxexpansionexponent, havechange, domainerror)
    ccall((:SCIPexprgraphSimplify, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Cdouble, Cint, Ptr{UInt32}, Ptr{UInt32}), exprgraph, messagehdlr, eps, maxexpansionexponent, havechange, domainerror)
end

function SCIPexprgraphGetTree(exprgraph, rootnode, exprtree)
    ccall((:SCIPexprgraphGetTree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Ptr{Ptr{SCIP_EXPRTREE}}), exprgraph, rootnode, exprtree)
end

function SCIPexprgraphGetSeparableTrees(exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
    ccall((:SCIPexprgraphGetSeparableTrees, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Cint}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
end

function SCIPexprgraphGetSubtreeVarsUsage(exprgraph, node, varsusage)
    ccall((:SCIPexprgraphGetSubtreeVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Ptr{Cint}), exprgraph, node, varsusage)
end

function SCIPexprgraphGetSumTreesNSummands(node)
    ccall((:SCIPexprgraphGetSumTreesNSummands, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetSumTrees(exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
    ccall((:SCIPexprgraphGetSumTrees, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Cint}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
end
