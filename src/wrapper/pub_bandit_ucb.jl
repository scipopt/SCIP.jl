# Julia wrapper for header: /usr/include/scip/pub_bandit_ucb.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateBanditUcb(scip, ucb, priorities, alpha, nactions, initseed)
    ccall((:SCIPcreateBanditUcb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, Cint, UInt32), scip, ucb, priorities, alpha, nactions, initseed)
end

function SCIPgetConfidenceBoundUcb(ucb, action)
    ccall((:SCIPgetConfidenceBoundUcb, libscip), Cdouble, (Ptr{SCIP_BANDIT}, Cint), ucb, action)
end

function SCIPgetStartPermutationUcb(ucb)
    ccall((:SCIPgetStartPermutationUcb, libscip), Ptr{Cint}, (Ptr{SCIP_BANDIT},), ucb)
end
