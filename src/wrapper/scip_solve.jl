# Julia wrapper for header: /usr/include/scip/scip_solve.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPtransformProb(scip)
    ccall((:SCIPtransformProb, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPpresolve(scip)
    ccall((:SCIPpresolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolve(scip)
    ccall((:SCIPsolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolveParallel(scip)
    ccall((:SCIPsolveParallel, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolveConcurrent(scip)
    ccall((:SCIPsolveConcurrent, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPfreeSolve(scip, restart::UInt32)
    ccall((:SCIPfreeSolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32), scip, restart)
end

function SCIPfreeReoptSolve(scip)
    ccall((:SCIPfreeReoptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPfreeTransform(scip)
    ccall((:SCIPfreeTransform, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPinterruptSolve(scip)
    ccall((:SCIPinterruptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPrestartSolve(scip)
    ccall((:SCIPrestartSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPenableReoptimization(scip, enable::UInt32)
    ccall((:SCIPenableReoptimization, libscip), SCIP_RETCODE, (Ptr{SCIP}, UInt32), scip, enable)
end

function SCIPisReoptEnabled(scip)
    ccall((:SCIPisReoptEnabled, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetReoptSolsRun(scip, run::Cint, sols, allocmem::Cint, nsols)
    ccall((:SCIPgetReoptSolsRun, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_SOL}}, Cint, Ptr{Cint}), scip, run, sols, allocmem, nsols)
end

function SCIPresetReoptSolMarks(scip)
    ccall((:SCIPresetReoptSolMarks, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPcheckReoptRestart(scip, node, restart)
    ccall((:SCIPcheckReoptRestart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{UInt32}), scip, node, restart)
end

function SCIPaddReoptDualBndchg(scip, node, var, newbound::Cdouble, oldbound::Cdouble)
    ccall((:SCIPaddReoptDualBndchg, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, node, var, newbound, oldbound)
end

function SCIPgetReoptLastOptSol(scip)
    ccall((:SCIPgetReoptLastOptSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP},), scip)
end

function SCIPgetReoptOldObjCoef(scip, var, run::Cint, objcoef)
    ccall((:SCIPgetReoptOldObjCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}), scip, var, run, objcoef)
end

function SCIPisInRestart(scip)
    ccall((:SCIPisInRestart, libscip), UInt32, (Ptr{SCIP},), scip)
end
