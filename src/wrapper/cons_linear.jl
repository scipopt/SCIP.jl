# Julia wrapper for header: /usr/include/scip/cons_linear.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrLinear(scip)
    ccall((:SCIPincludeConshdlrLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPincludeLinconsUpgrade(scip, linconsupgd, priority, conshdlrname)
    ccall((:SCIPincludeLinconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}, Cint, Cstring), scip, linconsupgd, priority, conshdlrname)
end

function SCIPcreateConsLinear(scip, cons, name, nvars, vars, vals, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, vals, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLinear(scip, cons, name, nvars, vars, vals, lhs, rhs)
    ccall((:SCIPcreateConsBasicLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nvars, vars, vals, lhs, rhs)
end

function SCIPcopyConsLinear(scip, cons, sourcescip, name, nvars, sourcevars, sourcecoefs, lhs, rhs, varmap, consmap, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
    ccall((:SCIPcopyConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, cons, sourcescip, name, nvars, sourcevars, sourcecoefs, lhs, rhs, varmap, consmap, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
end

function SCIPaddCoefLinear(scip, cons, var, val)
    ccall((:SCIPaddCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPchgCoefLinear(scip, cons, var, val)
    ccall((:SCIPchgCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPdelCoefLinear(scip, cons, var)
    ccall((:SCIPdelCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetLhsLinear(scip, cons)
    ccall((:SCIPgetLhsLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsLinear(scip, cons)
    ccall((:SCIPgetRhsLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgLhsLinear(scip, cons, lhs)
    ccall((:SCIPchgLhsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsLinear(scip, cons, rhs)
    ccall((:SCIPchgRhsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetNVarsLinear(scip, cons)
    ccall((:SCIPgetNVarsLinear, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsLinear(scip, cons)
    ccall((:SCIPgetVarsLinear, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetValsLinear(scip, cons)
    ccall((:SCIPgetValsLinear, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetActivityLinear(scip, cons, sol)
    ccall((:SCIPgetActivityLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPgetFeasibilityLinear(scip, cons, sol)
    ccall((:SCIPgetFeasibilityLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPgetDualsolLinear(scip, cons)
    ccall((:SCIPgetDualsolLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasLinear(scip, cons)
    ccall((:SCIPgetDualfarkasLinear, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowLinear(scip, cons)
    ccall((:SCIPgetRowLinear, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPupgradeConsLinear(scip, cons, upgdcons)
    ccall((:SCIPupgradeConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, upgdcons)
end

function SCIPclassifyConstraintTypesLinear(scip, linconsstats)
    ccall((:SCIPclassifyConstraintTypesLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_LINCONSSTATS}), scip, linconsstats)
end
