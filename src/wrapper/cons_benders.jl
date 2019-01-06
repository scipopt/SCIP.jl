# Julia wrapper for header: /usr/include/scip/cons_benders.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrBenders(scip)
    ccall((:SCIPincludeConshdlrBenders, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPconsBendersEnforceSolution(scip, sol, conshdlr, result, type, checkint)
    ccall((:SCIPconsBendersEnforceSolution, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SOL}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_RESULT}, SCIP_BENDERSENFOTYPE, UInt32), scip, sol, conshdlr, result, type, checkint)
end
