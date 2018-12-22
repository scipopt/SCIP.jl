# Julia wrapper for header: /usr/include/scip/pub_sol.h
# Automatically generated using Clang.jl wrap_c


function SCIPsolGetOrigin(sol)
    ccall((:SCIPsolGetOrigin, libscip), SCIP_SOLORIGIN, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolIsOriginal(sol)
    ccall((:SCIPsolIsOriginal, libscip), UInt32, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolIsPartial(sol)
    ccall((:SCIPsolIsPartial, libscip), UInt32, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetOrigObj(sol)
    ccall((:SCIPsolGetOrigObj, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetTime(sol)
    ccall((:SCIPsolGetTime, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRunnum(sol)
    ccall((:SCIPsolGetRunnum, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetNodenum(sol)
    ccall((:SCIPsolGetNodenum, libscip), Clonglong, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetDepth(sol)
    ccall((:SCIPsolGetDepth, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetHeur(sol)
    ccall((:SCIPsolGetHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolSetHeur(sol, heur)
    ccall((:SCIPsolSetHeur, libscip), Cvoid, (Ptr{SCIP_SOL}, Ptr{SCIP_HEUR}), sol, heur)
end

function SCIPsolGetIndex(sol)
    ccall((:SCIPsolGetIndex, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsBoundViolation(sol)
    ccall((:SCIPsolGetAbsBoundViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelBoundViolation(sol)
    ccall((:SCIPsolGetRelBoundViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsIntegralityViolation(sol)
    ccall((:SCIPsolGetAbsIntegralityViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsLPRowViolation(sol)
    ccall((:SCIPsolGetAbsLPRowViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelLPRowViolation(sol)
    ccall((:SCIPsolGetRelLPRowViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsConsViolation(sol)
    ccall((:SCIPsolGetAbsConsViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelConsViolation(sol)
    ccall((:SCIPsolGetRelConsViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end
