# Julia wrapper for header: /usr/include/scip/cons_pseudoboolean.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrPseudoboolean(scip)
    ccall((:SCIPincludeConshdlrPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsPseudobooleanWithConss(scip, cons, name, lincons, linconstype, andconss, andcoefs, nandconss, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsPseudobooleanWithConss, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_CONS}, SCIP_LINEARCONSTYPE, Ptr{Ptr{SCIP_CONS}}, Ptr{Cdouble}, Cint, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{SCIP_VAR}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, lincons, linconstype, andconss, andcoefs, nandconss, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsPseudoboolean(scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cdouble}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{SCIP_VAR}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicPseudoboolean(scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs)
    ccall((:SCIPcreateConsBasicPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cdouble}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{SCIP_VAR}, Cdouble, UInt32, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs)
end

function SCIPaddCoefPseudoboolean(scip, cons, var, val)
    ccall((:SCIPaddCoefPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPaddTermPseudoboolean(scip, cons, vars, nvars, val)
    ccall((:SCIPaddTermPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Cint, Cdouble), scip, cons, vars, nvars, val)
end

function SCIPgetIndVarPseudoboolean(scip, cons)
    ccall((:SCIPgetIndVarPseudoboolean, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearConsPseudoboolean(scip, cons)
    ccall((:SCIPgetLinearConsPseudoboolean, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearConsTypePseudoboolean(scip, cons)
    ccall((:SCIPgetLinearConsTypePseudoboolean, libscip), SCIP_LINEARCONSTYPE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNLinVarsWithoutAndPseudoboolean(scip, cons)
    ccall((:SCIPgetNLinVarsWithoutAndPseudoboolean, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinDatasWithoutAndPseudoboolean(scip, cons, linvars, lincoefs, nlinvars)
    ccall((:SCIPgetLinDatasWithoutAndPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}), scip, cons, linvars, lincoefs, nlinvars)
end

function SCIPgetAndDatasPseudoboolean(scip, cons, andconss, andcoefs, nandconss)
    ccall((:SCIPgetAndDatasPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cdouble}, Ptr{Cint}), scip, cons, andconss, andcoefs, nandconss)
end

function SCIPgetNAndsPseudoboolean(scip, cons)
    ccall((:SCIPgetNAndsPseudoboolean, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgLhsPseudoboolean(scip, cons, lhs)
    ccall((:SCIPchgLhsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsPseudoboolean(scip, cons, rhs)
    ccall((:SCIPchgRhsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetLhsPseudoboolean(scip, cons)
    ccall((:SCIPgetLhsPseudoboolean, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsPseudoboolean(scip, cons)
    ccall((:SCIPgetRhsPseudoboolean, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
