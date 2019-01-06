# Julia wrapper for header: /usr/include/scip/pub_benderscut.h
# Automatically generated using Clang.jl wrap_c


function SCIPbenderscutComp(elem1, elem2)
    ccall((:SCIPbenderscutComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbenderscutCompName(elem1, elem2)
    ccall((:SCIPbenderscutCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbenderscutGetData(benderscut)
    ccall((:SCIPbenderscutGetData, libscip), Ptr{SCIP_BENDERSCUTDATA}, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutSetData(benderscut, benderscutdata)
    ccall((:SCIPbenderscutSetData, libscip), Cvoid, (Ptr{SCIP_BENDERSCUT}, Ptr{SCIP_BENDERSCUTDATA}), benderscut, benderscutdata)
end

function SCIPbenderscutGetName(benderscut)
    ccall((:SCIPbenderscutGetName, libscip), Cstring, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetDesc(benderscut)
    ccall((:SCIPbenderscutGetDesc, libscip), Cstring, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetPriority(benderscut)
    ccall((:SCIPbenderscutGetPriority, libscip), Cint, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetNCalls(benderscut)
    ccall((:SCIPbenderscutGetNCalls, libscip), Clonglong, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetNFound(benderscut)
    ccall((:SCIPbenderscutGetNFound, libscip), Clonglong, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutIsInitialized(benderscut)
    ccall((:SCIPbenderscutIsInitialized, libscip), UInt32, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetSetupTime(benderscut)
    ccall((:SCIPbenderscutGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetTime(benderscut)
    ccall((:SCIPbenderscutGetTime, libscip), Cdouble, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetAddedConss(benderscut, addedconss, naddedconss)
    ccall((:SCIPbenderscutGetAddedConss, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERSCUT}, Ptr{Ptr{Ptr{SCIP_CONS}}}, Ptr{Cint}), benderscut, addedconss, naddedconss)
end

function SCIPbenderscutGetAddedCuts(benderscut, addedcuts, naddedcuts)
    ccall((:SCIPbenderscutGetAddedCuts, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERSCUT}, Ptr{Ptr{Ptr{SCIP_ROW}}}, Ptr{Cint}), benderscut, addedcuts, naddedcuts)
end

function SCIPbenderscutIsLPCut(benderscut)
    ccall((:SCIPbenderscutIsLPCut, libscip), UInt32, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutSetEnabled(benderscut, enabled)
    ccall((:SCIPbenderscutSetEnabled, libscip), Cvoid, (Ptr{SCIP_BENDERSCUT}, UInt32), benderscut, enabled)
end
