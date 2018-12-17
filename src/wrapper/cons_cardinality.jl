# Julia wrapper for header: /usr/include/scip/cons_cardinality.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrCardinality(scip)
    ccall((:SCIPincludeConshdlrCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsCardinality(scip, cons, name, nvars, vars, cardval, indvars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, cardval, indvars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicCardinality(scip, cons, name, nvars, vars, cardval, indvars, weights)
    ccall((:SCIPcreateConsBasicCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, cardval, indvars, weights)
end

function SCIPchgCardvalCardinality(scip, cons, cardval)
    ccall((:SCIPchgCardvalCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cint), scip, cons, cardval)
end

function SCIPaddVarCardinality(scip, cons, var, indvar, weight)
    ccall((:SCIPaddVarCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, indvar, weight)
end

function SCIPappendVarCardinality(scip, cons, var, indvar)
    ccall((:SCIPappendVarCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), scip, cons, var, indvar)
end

function SCIPgetNVarsCardinality(scip, cons)
    ccall((:SCIPgetNVarsCardinality, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsCardinality(scip, cons)
    ccall((:SCIPgetVarsCardinality, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCardvalCardinality(scip, cons)
    ccall((:SCIPgetCardvalCardinality, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsCardinality(scip, cons)
    ccall((:SCIPgetWeightsCardinality, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
