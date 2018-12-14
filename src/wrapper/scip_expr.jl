# Julia wrapper for header: /usr/include/scip/scip_expr.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPgetExprtreeTransformedVars(scip, tree)
    ccall((:SCIPgetExprtreeTransformedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}), scip, tree)
end

function SCIPevalExprtreeSol(scip, tree, sol, val)
    ccall((:SCIPevalExprtreeSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, tree, sol, val)
end

function SCIPevalExprtreeGlobalBounds(scip, tree, infinity::Cdouble, val)
    ccall((:SCIPevalExprtreeGlobalBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{Cint}), scip, tree, infinity, val)
end

function SCIPevalExprtreeLocalBounds(scip, tree, infinity::Cdouble, val)
    ccall((:SCIPevalExprtreeLocalBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{Cint}), scip, tree, infinity, val)
end
