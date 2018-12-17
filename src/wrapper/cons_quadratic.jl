# Julia wrapper for header: /usr/include/scip/cons_quadratic.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrQuadratic(scip)
    ccall((:SCIPincludeConshdlrQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPincludeQuadconsUpgrade(scip, quadconsupgd, priority, active, conshdlrname)
    ccall((:SCIPincludeQuadconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}, Cint, UInt32, Cstring), scip, quadconsupgd, priority, active, conshdlrname)
end

function SCIPcreateConsQuadratic(scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoeffs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoeffs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicQuadratic(scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoefs, lhs, rhs)
    ccall((:SCIPcreateConsBasicQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoefs, lhs, rhs)
end

function SCIPcreateConsQuadratic2(scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsQuadratic2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADVARTERM}, Cint, Ptr{SCIP_BILINTERM}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicQuadratic2(scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs)
    ccall((:SCIPcreateConsBasicQuadratic2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADVARTERM}, Cint, Ptr{SCIP_BILINTERM}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs)
end

function SCIPaddConstantQuadratic(scip, cons, constant)
    ccall((:SCIPaddConstantQuadratic, libscip), Cvoid, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, constant)
end

function SCIPaddLinearVarQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddLinearVarQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddQuadVarQuadratic(scip, cons, var, lincoef, sqrcoef)
    ccall((:SCIPaddQuadVarQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, var, lincoef, sqrcoef)
end

function SCIPaddQuadVarLinearCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddQuadVarLinearCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddSquareCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddSquareCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddBilinTermQuadratic(scip, cons, var1, var2, coef)
    ccall((:SCIPaddBilinTermQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var1, var2, coef)
end

function SCIPgetNlRowQuadratic(scip, cons, nlrow)
    ccall((:SCIPgetNlRowQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetNLinearVarsQuadratic, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetLinearVarsQuadratic, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCoefsLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetCoefsLinearVarsQuadratic, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPgetNQuadVarTermsQuadratic, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPgetQuadVarTermsQuadratic, libscip), Ptr{SCIP_QUADVARTERM}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsortQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPsortQuadVarTermsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPfindQuadVarTermQuadratic(scip, cons, var, pos)
    ccall((:SCIPfindQuadVarTermQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{Cint}), scip, cons, var, pos)
end

function SCIPgetNBilinTermsQuadratic(scip, cons)
    ccall((:SCIPgetNBilinTermsQuadratic, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBilinTermsQuadratic(scip, cons)
    ccall((:SCIPgetBilinTermsQuadratic, libscip), Ptr{SCIP_BILINTERM}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsQuadratic(scip, cons)
    ccall((:SCIPgetLhsQuadratic, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsQuadratic(scip, cons)
    ccall((:SCIPgetRhsQuadratic, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayDecreaseQuadratic(scip, cons)
    ccall((:SCIPgetLinvarMayDecreaseQuadratic, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayIncreaseQuadratic(scip, cons)
    ccall((:SCIPgetLinvarMayIncreaseQuadratic, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCurvatureQuadratic(scip, cons)
    ccall((:SCIPcheckCurvatureQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisConvexQuadratic(scip, cons)
    ccall((:SCIPisConvexQuadratic, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisConcaveQuadratic(scip, cons)
    ccall((:SCIPisConcaveQuadratic, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetViolationQuadratic(scip, cons, sol, violation)
    ccall((:SCIPgetViolationQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, violation)
end

function SCIPisLinearLocalQuadratic(scip, cons)
    ccall((:SCIPisLinearLocalQuadratic, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddToNlpiProblemQuadratic(scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
    ccall((:SCIPaddToNlpiProblemQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, UInt32), scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
end

function SCIPchgLhsQuadratic(scip, cons, lhs)
    ccall((:SCIPchgLhsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsQuadratic(scip, cons, rhs)
    ccall((:SCIPchgRhsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetFeasibilityQuadratic(scip, cons, sol, feasibility)
    ccall((:SCIPgetFeasibilityQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, feasibility)
end

function SCIPgetActivityQuadratic(scip, cons, sol, activity)
    ccall((:SCIPgetActivityQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, activity)
end

function SCIPchgLinearCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPchgLinearCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPchgSquareCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPchgSquareCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPchgBilinCoefQuadratic(scip, cons, var1, var2, coef)
    ccall((:SCIPchgBilinCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var1, var2, coef)
end

function SCIPgetNAllBilinearTermsQuadratic(scip)
    ccall((:SCIPgetNAllBilinearTermsQuadratic, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPgetAllBilinearTermsQuadratic(scip, x, y, nbilinterms, nunderests, noverests, maxnonconvexity)
    ccall((:SCIPgetAllBilinearTermsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), scip, x, y, nbilinterms, nunderests, noverests, maxnonconvexity)
end

function SCIPaddBilinearIneqQuadratic(scip, x, y, idx, xcoef, ycoef, constant, success)
    ccall((:SCIPaddBilinearIneqQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cint, Cdouble, Cdouble, Cdouble, Ptr{UInt32}), scip, x, y, idx, xcoef, ycoef, constant, success)
end
