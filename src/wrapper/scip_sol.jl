# Julia wrapper for header: /usr/include/scip/scip_sol.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPcreateSol(scip, sol, heur)
    ccall((:SCIPcreateSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateLPSol(scip, sol, heur)
    ccall((:SCIPcreateLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateNLPSol(scip, sol, heur)
    ccall((:SCIPcreateNLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateRelaxSol(scip, sol, heur)
    ccall((:SCIPcreateRelaxSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreatePseudoSol(scip, sol, heur)
    ccall((:SCIPcreatePseudoSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateCurrentSol(scip, sol, heur)
    ccall((:SCIPcreateCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreatePartialSol(scip, sol, heur)
    ccall((:SCIPcreatePartialSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateUnknownSol(scip, sol, heur)
    ccall((:SCIPcreateUnknownSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateOrigSol(scip, sol, heur)
    ccall((:SCIPcreateOrigSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateSolCopy(scip, sol, sourcesol)
    ccall((:SCIPcreateSolCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}), scip, sol, sourcesol)
end

function SCIPcreateSolCopyOrig(scip, sol, sourcesol)
    ccall((:SCIPcreateSolCopyOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}), scip, sol, sourcesol)
end

function SCIPcreateFiniteSolCopy(scip, sol, sourcesol, success)
    ccall((:SCIPcreateFiniteSolCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}, Ptr{UInt32}), scip, sol, sourcesol, success)
end

function SCIPfreeSol(scip, sol)
    ccall((:SCIPfreeSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}), scip, sol)
end

function SCIPlinkLPSol(scip, sol)
    ccall((:SCIPlinkLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkNLPSol(scip, sol)
    ccall((:SCIPlinkNLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkRelaxSol(scip, sol)
    ccall((:SCIPlinkRelaxSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkPseudoSol(scip, sol)
    ccall((:SCIPlinkPseudoSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkCurrentSol(scip, sol)
    ccall((:SCIPlinkCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPclearSol(scip, sol)
    ccall((:SCIPclearSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPunlinkSol(scip, sol)
    ccall((:SCIPunlinkSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPsetSolVal(scip, sol, var, val::Cdouble)
    ccall((:SCIPsetSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}, Cdouble), scip, sol, var, val)
end

function SCIPsetSolVals(scip, sol, nvars::Cint, vars, vals)
    ccall((:SCIPsetSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, sol, nvars, vars, vals)
end

function SCIPincSolVal(scip, sol, var, incval::Cdouble)
    ccall((:SCIPincSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}, Cdouble), scip, sol, var, incval)
end

function SCIPgetSolVal(scip, sol, var)
    ccall((:SCIPgetSolVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}), scip, sol, var)
end

function SCIPgetSolVals(scip, sol, nvars::Cint, vars, vals)
    ccall((:SCIPgetSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, sol, nvars, vars, vals)
end

function SCIPgetSolOrigObj(scip, sol)
    ccall((:SCIPgetSolOrigObj, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolTransObj(scip, sol)
    ccall((:SCIPgetSolTransObj, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPrecomputeSolObj(scip, sol)
    ccall((:SCIPrecomputeSolObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPtransformObj(scip, obj::Cdouble)
    ccall((:SCIPtransformObj, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, obj)
end

function SCIPretransformObj(scip, obj::Cdouble)
    ccall((:SCIPretransformObj, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, obj)
end

function SCIPgetSolTime(scip, sol)
    ccall((:SCIPgetSolTime, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolRunnum(scip, sol)
    ccall((:SCIPgetSolRunnum, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolNodenum(scip, sol)
    ccall((:SCIPgetSolNodenum, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolHeur(scip, sol)
    ccall((:SCIPgetSolHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPareSolsEqual(scip, sol1, sol2)
    ccall((:SCIPareSolsEqual, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_SOL}), scip, sol1, sol2)
end

function SCIPadjustImplicitSolVals(scip, sol, uselprows::UInt32)
    ccall((:SCIPadjustImplicitSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, UInt32), scip, sol, uselprows)
end

function SCIPprintSol(scip, sol, file, printzeros::UInt32)
    ccall((:SCIPprintSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{FILE}, UInt32), scip, sol, file, printzeros)
end

function SCIPprintTransSol(scip, sol, file, printzeros::UInt32)
    ccall((:SCIPprintTransSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{FILE}, UInt32), scip, sol, file, printzeros)
end

function SCIPprintMIPStart(scip, sol, file)
    ccall((:SCIPprintMIPStart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{FILE}), scip, sol, file)
end

function SCIPgetDualSolVal(scip, cons, dualsolval, boundconstraint)
    ccall((:SCIPgetDualSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{UInt32}), scip, cons, dualsolval, boundconstraint)
end

function SCIPisDualSolAvailable(scip, printreason::UInt32)
    ccall((:SCIPisDualSolAvailable, libscip), UInt32, (Ptr{SCIP}, UInt32), scip, printreason)
end

function SCIPprintDualSol(scip, file, printzeros::UInt32)
    ccall((:SCIPprintDualSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, UInt32), scip, file, printzeros)
end

function SCIPprintRay(scip, sol, file, printzeros::UInt32)
    ccall((:SCIPprintRay, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{FILE}, UInt32), scip, sol, file, printzeros)
end

function SCIPgetNSols(scip)
    ccall((:SCIPgetNSols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSols(scip)
    ccall((:SCIPgetSols, libscip), Ptr{Ptr{SCIP_SOL}}, (Ptr{SCIP},), scip)
end

function SCIPgetBestSol(scip)
    ccall((:SCIPgetBestSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP},), scip)
end

function SCIPprintBestSol(scip, file, printzeros::UInt32)
    ccall((:SCIPprintBestSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, UInt32), scip, file, printzeros)
end

function SCIPprintBestTransSol(scip, file, printzeros::UInt32)
    ccall((:SCIPprintBestTransSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{FILE}, UInt32), scip, file, printzeros)
end

function SCIProundSol(scip, sol, success)
    ccall((:SCIProundSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{UInt32}), scip, sol, success)
end

function SCIPretransformSol(scip, sol)
    ccall((:SCIPretransformSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPreadSol(scip, filename)
    ccall((:SCIPreadSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring), scip, filename)
end

function SCIPreadSolFile(scip, filename, sol, xml::UInt32, partial, error)
    ccall((:SCIPreadSolFile, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Ptr{SCIP_SOL}, UInt32, Ptr{UInt32}, Ptr{UInt32}), scip, filename, sol, xml, partial, error)
end

function SCIPaddSol(scip, sol, stored)
    ccall((:SCIPaddSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{UInt32}), scip, sol, stored)
end

function SCIPaddSolFree(scip, sol, stored)
    ccall((:SCIPaddSolFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{UInt32}), scip, sol, stored)
end

function SCIPaddCurrentSol(scip, heur, stored)
    ccall((:SCIPaddCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{UInt32}), scip, heur, stored)
end

function SCIPtrySol(scip, sol, printreason::UInt32, completely::UInt32, checkbounds::UInt32, checkintegrality::UInt32, checklprows::UInt32, stored)
    ccall((:SCIPtrySol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
end

function SCIPtrySolFree(scip, sol, printreason::UInt32, completely::UInt32, checkbounds::UInt32, checkintegrality::UInt32, checklprows::UInt32, stored)
    ccall((:SCIPtrySolFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
end

function SCIPtryCurrentSol(scip, heur, printreason::UInt32, completely::UInt32, checkintegrality::UInt32, checklprows::UInt32, stored)
    ccall((:SCIPtryCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, heur, printreason, completely, checkintegrality, checklprows, stored)
end

function SCIPgetPartialSols(scip)
    ccall((:SCIPgetPartialSols, libscip), Ptr{Ptr{SCIP_SOL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPartialSols(scip)
    ccall((:SCIPgetNPartialSols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcheckSol(scip, sol, printreason::UInt32, completely::UInt32, checkbounds::UInt32, checkintegrality::UInt32, checklprows::UInt32, feasible)
    ccall((:SCIPcheckSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, feasible)
end

function SCIPcheckSolOrig(scip, sol, feasible, printreason::UInt32, completely::UInt32)
    ccall((:SCIPcheckSolOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{UInt32}, UInt32, UInt32), scip, sol, feasible, printreason, completely)
end

function SCIPupdateSolIntegralityViolation(scip, sol, absviol::Cdouble)
    ccall((:SCIPupdateSolIntegralityViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble), scip, sol, absviol)
end

function SCIPupdateSolBoundViolation(scip, sol, absviol::Cdouble, relviol::Cdouble)
    ccall((:SCIPupdateSolBoundViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolLPRowViolation(scip, sol, absviol::Cdouble, relviol::Cdouble)
    ccall((:SCIPupdateSolLPRowViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolConsViolation(scip, sol, absviol::Cdouble, relviol::Cdouble)
    ccall((:SCIPupdateSolConsViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolLPConsViolation(scip, sol, absviol::Cdouble, relviol::Cdouble)
    ccall((:SCIPupdateSolLPConsViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPactivateSolViolationUpdates(scip)
    ccall((:SCIPactivateSolViolationUpdates, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdeactivateSolViolationUpdates(scip)
    ccall((:SCIPdeactivateSolViolationUpdates, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPhasPrimalRay(scip)
    ccall((:SCIPhasPrimalRay, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetPrimalRayVal(scip, var)
    ccall((:SCIPgetPrimalRayVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPupdatePrimalRay(scip, primalray)
    ccall((:SCIPupdatePrimalRay, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, primalray)
end
