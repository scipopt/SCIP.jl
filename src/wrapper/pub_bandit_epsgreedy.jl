# Julia wrapper for header: /usr/include/scip/pub_bandit_epsgreedy.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateBanditEpsgreedy(scip, epsgreedy, priorities, eps, preferrecent, decayfactor, avglim, nactions, initseed)
    ccall((:SCIPcreateBanditEpsgreedy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, UInt32, Cdouble, Cint, Cint, UInt32), scip, epsgreedy, priorities, eps, preferrecent, decayfactor, avglim, nactions, initseed)
end

function SCIPgetWeightsEpsgreedy(epsgreedy)
    ccall((:SCIPgetWeightsEpsgreedy, libscip), Ptr{Cdouble}, (Ptr{SCIP_BANDIT},), epsgreedy)
end

function SCIPsetEpsilonEpsgreedy(epsgreedy, eps)
    ccall((:SCIPsetEpsilonEpsgreedy, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), epsgreedy, eps)
end
