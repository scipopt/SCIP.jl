# Julia wrapper for header: /usr/include/scip/cons_indicator.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrIndicator(scip)
    ccall((:SCIPincludeConshdlrIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsIndicator(scip, cons, name, binvar, nvars, vars, vals, rhs, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, binvar, nvars, vars, vals, rhs, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicIndicator(scip, cons, name, binvar, nvars, vars, vals, rhs)
    ccall((:SCIPcreateConsBasicIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble), scip, cons, name, binvar, nvars, vars, vals, rhs)
end

function SCIPcreateConsIndicatorLinCons(scip, cons, name, binvar, lincons, slackvar, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsIndicatorLinCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, binvar, lincons, slackvar, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicIndicatorLinCons(scip, cons, name, binvar, lincons, slackvar)
    ccall((:SCIPcreateConsBasicIndicatorLinCons, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, name, binvar, lincons, slackvar)
end

function SCIPaddVarIndicator(scip, cons, var, val)
    ccall((:SCIPaddVarIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPgetLinearConsIndicator(cons)
    ccall((:SCIPgetLinearConsIndicator, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_CONS},), cons)
end

function SCIPsetLinearConsIndicator(scip, cons, lincons)
    ccall((:SCIPsetLinearConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, lincons)
end

function SCIPsetBinaryVarIndicator(scip, cons, binvar)
    ccall((:SCIPsetBinaryVarIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, binvar)
end

function SCIPgetBinaryVarIndicator(cons)
    ccall((:SCIPgetBinaryVarIndicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPgetSlackVarIndicator(cons)
    ccall((:SCIPgetSlackVarIndicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPsetSlackVarUb(scip, cons, ub)
    ccall((:SCIPsetSlackVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, ub)
end

function SCIPisViolatedIndicator(scip, cons, sol)
    ccall((:SCIPisViolatedIndicator, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPmakeIndicatorFeasible(scip, cons, sol, changed)
    ccall((:SCIPmakeIndicatorFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{UInt32}), scip, cons, sol, changed)
end

function SCIPmakeIndicatorsFeasible(scip, conshdlr, sol, changed)
    ccall((:SCIPmakeIndicatorsFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_SOL}, Ptr{UInt32}), scip, conshdlr, sol, changed)
end

function SCIPaddLinearConsIndicator(scip, conshdlr, lincons)
    ccall((:SCIPaddLinearConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}), scip, conshdlr, lincons)
end

function SCIPaddRowIndicator(scip, conshdlr, row)
    ccall((:SCIPaddRowIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_ROW}), scip, conshdlr, row)
end
