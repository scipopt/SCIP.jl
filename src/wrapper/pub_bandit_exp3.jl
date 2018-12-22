# Julia wrapper for header: /usr/include/scip/pub_bandit_exp3.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateBanditExp3(scip, exp3, priorities, gammaparam, beta, nactions, initseed)
    ccall((:SCIPcreateBanditExp3, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, Cdouble, Cint, UInt32), scip, exp3, priorities, gammaparam, beta, nactions, initseed)
end

function SCIPsetGammaExp3(exp3, gammaparam)
    ccall((:SCIPsetGammaExp3, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), exp3, gammaparam)
end

function SCIPsetBetaExp3(exp3, beta)
    ccall((:SCIPsetBetaExp3, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), exp3, beta)
end

function SCIPgetProbabilityExp3(exp3, action)
    ccall((:SCIPgetProbabilityExp3, libscip), Cdouble, (Ptr{SCIP_BANDIT}, Cint), exp3, action)
end
