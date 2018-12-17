# Julia wrapper for header: /usr/include/scip/cons_knapsack.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrKnapsack(scip)
    ccall((:SCIPincludeConshdlrKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsKnapsack(scip, cons, name, nvars, vars, weights, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Clonglong}, Clonglong, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, weights, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicKnapsack(scip, cons, name, nvars, vars, weights, capacity)
    ccall((:SCIPcreateConsBasicKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Clonglong}, Clonglong), scip, cons, name, nvars, vars, weights, capacity)
end

function SCIPaddCoefKnapsack(scip, cons, var, weight)
    ccall((:SCIPaddCoefKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Clonglong), scip, cons, var, weight)
end

function SCIPgetCapacityKnapsack(scip, cons)
    ccall((:SCIPgetCapacityKnapsack, libscip), Clonglong, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgCapacityKnapsack(scip, cons, capacity)
    ccall((:SCIPchgCapacityKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Clonglong), scip, cons, capacity)
end

function SCIPgetNVarsKnapsack(scip, cons)
    ccall((:SCIPgetNVarsKnapsack, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsKnapsack(scip, cons)
    ccall((:SCIPgetVarsKnapsack, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsKnapsack(scip, cons)
    ccall((:SCIPgetWeightsKnapsack, libscip), Ptr{Clonglong}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolKnapsack(scip, cons)
    ccall((:SCIPgetDualsolKnapsack, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasKnapsack(scip, cons)
    ccall((:SCIPgetDualfarkasKnapsack, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowKnapsack(scip, cons)
    ccall((:SCIPgetRowKnapsack, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsolveKnapsackExactly(scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval, success)
    ccall((:SCIPsolveKnapsackExactly, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Clonglong}, Ptr{Cdouble}, Clonglong, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{UInt32}), scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval, success)
end

function SCIPsolveKnapsackApproximately(scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval)
    ccall((:SCIPsolveKnapsackApproximately, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Clonglong}, Ptr{Cdouble}, Clonglong, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval)
end

function SCIPseparateKnapsackCuts(scip, cons, sepa, vars, nvars, weights, capacity, sol, usegubs, cutoff, ncuts)
    ccall((:SCIPseparateKnapsackCuts, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SEPA}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Clonglong}, Clonglong, Ptr{SCIP_SOL}, UInt32, Ptr{UInt32}, Ptr{Cint}), scip, cons, sepa, vars, nvars, weights, capacity, sol, usegubs, cutoff, ncuts)
end

function SCIPseparateRelaxedKnapsack(scip, cons, sepa, nknapvars, knapvars, knapvals, valscale, rhs, sol, cutoff, ncuts)
    ccall((:SCIPseparateRelaxedKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SEPA}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{SCIP_SOL}, Ptr{UInt32}, Ptr{Cint}), scip, cons, sepa, nknapvars, knapvars, knapvals, valscale, rhs, sol, cutoff, ncuts)
end
