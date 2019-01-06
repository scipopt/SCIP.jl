# Julia wrapper for header: /usr/include/scip/scip_solve.h
# Automatically generated using Clang.jl wrap_c


function SCIPtransformProb(scip)
    ccall((:SCIPtransformProb, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPpresolve(scip)
    ccall((:SCIPpresolve, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPsolve(scip)
    ccall((:SCIPsolve, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPsolveParallel(scip)
    ccall((:SCIPsolveParallel, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPsolveConcurrent(scip)
    ccall((:SCIPsolveConcurrent, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPfreeSolve(scip, restart)
    ccall((:SCIPfreeSolve, libscip), SCIP_RETCODE, (Ptr{SCIP_}, UInt32), scip, restart)
end

function SCIPfreeReoptSolve(scip)
    ccall((:SCIPfreeReoptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPfreeTransform(scip)
    ccall((:SCIPfreeTransform, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPinterruptSolve(scip)
    ccall((:SCIPinterruptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPrestartSolve(scip)
    ccall((:SCIPrestartSolve, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPenableReoptimization(scip, enable)
    ccall((:SCIPenableReoptimization, libscip), SCIP_RETCODE, (Ptr{SCIP_}, UInt32), scip, enable)
end

function SCIPisReoptEnabled(scip)
    ccall((:SCIPisReoptEnabled, libscip), UInt32, (Ptr{SCIP_},), scip)
end

function SCIPgetReoptSolsRun(scip, run, sols, allocmem, nsols)
    ccall((:SCIPgetReoptSolsRun, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cint, Ptr{Ptr{SCIP_SOL}}, Cint, Ptr{Cint}), scip, run, sols, allocmem, nsols)
end

function SCIPresetReoptSolMarks(scip)
    ccall((:SCIPresetReoptSolMarks, libscip), Cvoid, (Ptr{SCIP_},), scip)
end

function SCIPcheckReoptRestart(scip, node, restart)
    ccall((:SCIPcheckReoptRestart, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Ptr{UInt32}), scip, node, restart)
end

function SCIPaddReoptDualBndchg(scip, node, var, newbound, oldbound)
    ccall((:SCIPaddReoptDualBndchg, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, node, var, newbound, oldbound)
end

function SCIPgetReoptLastOptSol(scip)
    ccall((:SCIPgetReoptLastOptSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP_},), scip)
end

function SCIPgetReoptOldObjCoef(scip, var, run, objcoef)
    ccall((:SCIPgetReoptOldObjCoef, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}), scip, var, run, objcoef)
end

function SCIPisInRestart(scip)
    ccall((:SCIPisInRestart, libscip), UInt32, (Ptr{SCIP_},), scip)
end
