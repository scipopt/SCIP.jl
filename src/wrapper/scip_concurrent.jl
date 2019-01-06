# Julia wrapper for header: /usr/include/scip/scip_concurrent.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConcsolverType(scip, name, prefpriodefault, concsolvercreateinst, concsolverdestroyinst, concsolverinitseeds, concsolverexec, concsolvercopysolvdata, concsolverstop, concsolversyncwrite, concsolversyncread, concsolvertypefreedata, data)
    ccall((:SCIPincludeConcsolverType, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONCSOLVERTYPEDATA}), scip, name, prefpriodefault, concsolvercreateinst, concsolverdestroyinst, concsolverinitseeds, concsolverexec, concsolvercopysolvdata, concsolverstop, concsolversyncwrite, concsolversyncread, concsolvertypefreedata, data)
end

function SCIPfindConcsolverType(scip, name)
    ccall((:SCIPfindConcsolverType, libscip), Ptr{SCIP_CONCSOLVERTYPE}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetConcsolverTypes(scip)
    ccall((:SCIPgetConcsolverTypes, libscip), Ptr{Ptr{SCIP_CONCSOLVERTYPE}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNConcsolverTypes(scip)
    ccall((:SCIPgetNConcsolverTypes, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPconstructSyncstore(scip)
    ccall((:SCIPconstructSyncstore, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPfreeSyncstore(scip)
    ccall((:SCIPfreeSyncstore, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPgetSyncstore(scip)
    ccall((:SCIPgetSyncstore, libscip), Ptr{SCIP_SYNCSTORE}, (Ptr{SCIP_},), scip)
end
