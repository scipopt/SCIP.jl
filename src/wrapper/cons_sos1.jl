# Julia wrapper for header: /usr/include/scip/cons_sos1.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSOS1(scip)
    ccall((:SCIPincludeConshdlrSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsSOS1(scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSOS1(scip, cons, name, nvars, vars, weights)
    ccall((:SCIPcreateConsBasicSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, weights)
end

function SCIPaddVarSOS1(scip, cons, var, weight)
    ccall((:SCIPaddVarSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, weight)
end

function SCIPappendVarSOS1(scip, cons, var)
    ccall((:SCIPappendVarSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSOS1(scip, cons)
    ccall((:SCIPgetNVarsSOS1, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSOS1(scip, cons)
    ccall((:SCIPgetVarsSOS1, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsSOS1(scip, cons)
    ccall((:SCIPgetWeightsSOS1, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetConflictgraphSOS1(conshdlr)
    ccall((:SCIPgetConflictgraphSOS1, libscip), Ptr{SCIP_DIGRAPH}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPgetNSOS1Vars(conshdlr)
    ccall((:SCIPgetNSOS1Vars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPvarIsSOS1(conshdlr, var)
    ccall((:SCIPvarIsSOS1, libscip), UInt32, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_VAR}), conshdlr, var)
end

function SCIPvarGetNodeSOS1(conshdlr, var)
    ccall((:SCIPvarGetNodeSOS1, libscip), Cint, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_VAR}), conshdlr, var)
end

function SCIPnodeGetVarSOS1(conflictgraph, node)
    ccall((:SCIPnodeGetVarSOS1, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_DIGRAPH}, Cint), conflictgraph, node)
end

function SCIPmakeSOS1sFeasible(scip, conshdlr, sol, changed, success)
    ccall((:SCIPmakeSOS1sFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_SOL}, Ptr{UInt32}, Ptr{UInt32}), scip, conshdlr, sol, changed, success)
end
