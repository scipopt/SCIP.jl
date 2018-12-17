# Julia wrapper for header: /usr/include/scip/cons_nonlinear.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrNonlinear(scip)
    ccall((:SCIPincludeConshdlrNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPincludeNonlinconsUpgrade(scip, nonlinconsupgd, nodereform, priority, active, conshdlrname)
    ccall((:SCIPincludeNonlinconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, UInt32, Cstring), scip, nonlinconsupgd, nodereform, priority, active, conshdlrname)
end

function SCIPcreateConsNonlinear(scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicNonlinear(scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs)
    ccall((:SCIPcreateConsBasicNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs)
end

function SCIPcreateConsNonlinear2(scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsNonlinear2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicNonlinear2(scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs)
    ccall((:SCIPcreateConsBasicNonlinear2, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs)
end

function SCIPaddLinearVarNonlinear(scip, cons, var, coef)
    ccall((:SCIPaddLinearVarNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPsetExprtreesNonlinear(scip, cons, nexprtrees, exprtrees, coefs)
    ccall((:SCIPsetExprtreesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), scip, cons, nexprtrees, exprtrees, coefs)
end

function SCIPaddExprtreesNonlinear(scip, cons, nexprtrees, exprtrees, coefs)
    ccall((:SCIPaddExprtreesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), scip, cons, nexprtrees, exprtrees, coefs)
end

function SCIPgetNlRowNonlinear(scip, cons, nlrow)
    ccall((:SCIPgetNlRowNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLinearVarsNonlinear(scip, cons)
    ccall((:SCIPgetNLinearVarsNonlinear, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarsNonlinear(scip, cons)
    ccall((:SCIPgetLinearVarsNonlinear, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearCoefsNonlinear(scip, cons)
    ccall((:SCIPgetLinearCoefsNonlinear, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNExprtreesNonlinear(scip, cons)
    ccall((:SCIPgetNExprtreesNonlinear, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreesNonlinear(scip, cons)
    ccall((:SCIPgetExprtreesNonlinear, libscip), Ptr{Ptr{SCIP_EXPRTREE}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreeCoefsNonlinear(scip, cons)
    ccall((:SCIPgetExprtreeCoefsNonlinear, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprgraphNodeNonlinear(scip, cons)
    ccall((:SCIPgetExprgraphNodeNonlinear, libscip), Ptr{SCIP_EXPRGRAPHNODE}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsNonlinear(scip, cons)
    ccall((:SCIPgetLhsNonlinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsNonlinear(scip, cons)
    ccall((:SCIPgetRhsNonlinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCurvatureNonlinear(scip, cons)
    ccall((:SCIPcheckCurvatureNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCurvatureNonlinear(scip, cons, checkcurv, curvature)
    ccall((:SCIPgetCurvatureNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, UInt32, Ptr{SCIP_EXPRCURV}), scip, cons, checkcurv, curvature)
end

function SCIPgetExprtreeCurvaturesNonlinear(scip, cons, checkcurv, curvatures)
    ccall((:SCIPgetExprtreeCurvaturesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, UInt32, Ptr{Ptr{SCIP_EXPRCURV}}), scip, cons, checkcurv, curvatures)
end

function SCIPgetViolationNonlinear(scip, cons, sol, violation)
    ccall((:SCIPgetViolationNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, violation)
end

function SCIPgetLinvarMayDecreaseNonlinear(scip, cons)
    ccall((:SCIPgetLinvarMayDecreaseNonlinear, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayIncreaseNonlinear(scip, cons)
    ccall((:SCIPgetLinvarMayIncreaseNonlinear, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprgraphNonlinear(scip, conshdlr)
    ccall((:SCIPgetExprgraphNonlinear, libscip), Ptr{SCIP_EXPRGRAPH}, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}), scip, conshdlr)
end

function SCIPcomputeHyperplaneThreePoints(scip, a1, a2, a3, b1, b2, b3, c1, c2, c3, alpha, beta, gamma_, delta)
    ccall((:SCIPcomputeHyperplaneThreePoints, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), scip, a1, a2, a3, b1, b2, b3, c1, c2, c3, alpha, beta, gamma_, delta)
end
