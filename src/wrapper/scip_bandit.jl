# Julia wrapper for header: /usr/include/scip/scip_bandit.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeBanditvtable(scip, banditvtable, name, banditfree, banditselect, banditupdate, banditreset)
    ccall((:SCIPincludeBanditvtable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDITVTABLE}}, Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), scip, banditvtable, name, banditfree, banditselect, banditupdate, banditreset)
end

function SCIPfindBanditvtable(scip, name)
    ccall((:SCIPfindBanditvtable, libscip), Ptr{SCIP_BANDITVTABLE}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPfreeBandit(scip, bandit)
    ccall((:SCIPfreeBandit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDIT}}), scip, bandit)
end

function SCIPresetBandit(scip, bandit, priorities, seed::UInt32)
    ccall((:SCIPresetBandit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BANDIT}, Ptr{Cdouble}, UInt32), scip, bandit, priorities, seed)
end
