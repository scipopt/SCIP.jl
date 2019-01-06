# Julia wrapper for header: /usr/include/scip/pub_bandit.h
# Automatically generated using Clang.jl wrap_c


function SCIPbanditSelect(bandit, action)
    ccall((:SCIPbanditSelect, libscip), SCIP_RETCODE, (Ptr{SCIP_BANDIT}, Ptr{Cint}), bandit, action)
end

function SCIPbanditUpdate(bandit, action, score)
    ccall((:SCIPbanditUpdate, libscip), SCIP_RETCODE, (Ptr{SCIP_BANDIT}, Cint, Cdouble), bandit, action, score)
end

function SCIPbanditvtableGetName(banditvtable)
    ccall((:SCIPbanditvtableGetName, libscip), Cstring, (Ptr{SCIP_BANDITVTABLE},), banditvtable)
end

function SCIPbanditGetRandnumgen()
    ccall((:SCIPbanditGetRandnumgen, libscip), Ptr{Cint}, ())
end

function SCIPbanditGetNActions(bandit)
    ccall((:SCIPbanditGetNActions, libscip), Cint, (Ptr{SCIP_BANDIT},), bandit)
end
