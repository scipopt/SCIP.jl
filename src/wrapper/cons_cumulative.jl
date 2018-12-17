# Julia wrapper for header: /usr/include/scip/cons_cumulative.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrCumulative(scip)
    ccall((:SCIPincludeConshdlrCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsCumulative(scip, cons, name, nvars, vars, durations, demands, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, durations, demands, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicCumulative(scip, cons, name, nvars, vars, durations, demands, capacity)
    ccall((:SCIPcreateConsBasicCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint), scip, cons, name, nvars, vars, durations, demands, capacity)
end

function SCIPsetHminCumulative(scip, cons, hmin)
    ccall((:SCIPsetHminCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cint), scip, cons, hmin)
end

function SCIPgetHminCumulative(scip, cons)
    ccall((:SCIPgetHminCumulative, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsetHmaxCumulative(scip, cons, hmax)
    ccall((:SCIPsetHmaxCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Cint), scip, cons, hmax)
end

function SCIPgetHmaxCumulative(scip, cons)
    ccall((:SCIPgetHmaxCumulative, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsCumulative(scip, cons)
    ccall((:SCIPgetVarsCumulative, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNVarsCumulative(scip, cons)
    ccall((:SCIPgetNVarsCumulative, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCapacityCumulative(scip, cons)
    ccall((:SCIPgetCapacityCumulative, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDurationsCumulative(scip, cons)
    ccall((:SCIPgetDurationsCumulative, libscip), Ptr{Cint}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDemandsCumulative(scip, cons)
    ccall((:SCIPgetDemandsCumulative, libscip), Ptr{Cint}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCumulativeCondition(scip, sol, nvars, vars, durations, demands, capacity, hmin, hmax, violated, cons, printreason)
    ccall((:SCIPcheckCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{UInt32}, Ptr{SCIP_CONS}, UInt32), scip, sol, nvars, vars, durations, demands, capacity, hmin, hmax, violated, cons, printreason)
end

function SCIPnormalizeCumulativeCondition(scip, nvars, vars, durations, demands, capacity, nchgcoefs, nchgsides)
    ccall((:SCIPnormalizeCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, nvars, vars, durations, demands, capacity, nchgcoefs, nchgsides)
end

function SCIPsplitCumulativeCondition(scip, nvars, vars, durations, demands, capacity, hmin, hmax, split)
    ccall((:SCIPsplitCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, nvars, vars, durations, demands, capacity, hmin, hmax, split)
end

function SCIPpresolveCumulativeCondition(scip, nvars, vars, durations, hmin, hmax, downlocks, uplocks, cons, delvars, nfixedvars, nchgsides, cutoff)
    ccall((:SCIPpresolveCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Cint, Ptr{UInt32}, Ptr{UInt32}, Ptr{SCIP_CONS}, Ptr{UInt32}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}), scip, nvars, vars, durations, hmin, hmax, downlocks, uplocks, cons, delvars, nfixedvars, nchgsides, cutoff)
end

function SCIPpropCumulativeCondition(scip, presoltiming, nvars, vars, durations, demands, capacity, hmin, hmax, cons, nchgbds, initialized, explanation, cutoff)
    ccall((:SCIPpropCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_PRESOLTIMING, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{SCIP_CONS}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, presoltiming, nvars, vars, durations, demands, capacity, hmin, hmax, cons, nchgbds, initialized, explanation, cutoff)
end

function SCIPrespropCumulativeCondition(scip, nvars, vars, durations, demands, capacity, hmin, hmax, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, explanation, result)
    ccall((:SCIPrespropCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{SCIP_VAR}, Cint, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble, Ptr{UInt32}, Ptr{SCIP_RESULT}), scip, nvars, vars, durations, demands, capacity, hmin, hmax, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, explanation, result)
end

function SCIPvisualizeConsCumulative(scip, cons)
    ccall((:SCIPvisualizeConsCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsetSolveCumulative(scip, solveCumulative)
    ccall((:SCIPsetSolveCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cvoid}), scip, solveCumulative)
end

function SCIPsolveCumulative(scip, njobs, ests, lsts, objvals, durations, demands, capacity, hmin, hmax, timelimit, memorylimit, maxnodes, solved, infeasible, unbounded, error)
    ccall((:SCIPsolveCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Cdouble, Cdouble, Clonglong, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), scip, njobs, ests, lsts, objvals, durations, demands, capacity, hmin, hmax, timelimit, memorylimit, maxnodes, solved, infeasible, unbounded, error)
end

function SCIPcreateWorstCaseProfile(scip, profile, nvars, vars, durations, demands)
    ccall((:SCIPcreateWorstCaseProfile, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PROFILE}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}), scip, profile, nvars, vars, durations, demands)
end

function SCIPcomputeHmin(scip, profile, capacity)
    ccall((:SCIPcomputeHmin, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_PROFILE}, Cint), scip, profile, capacity)
end

function SCIPcomputeHmax(scip, profile, capacity)
    ccall((:SCIPcomputeHmax, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_PROFILE}, Cint), scip, profile, capacity)
end
