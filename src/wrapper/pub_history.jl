# Julia wrapper for header: /usr/include/scip/pub_history.h
# Automatically generated using Clang.jl wrap_c


function SCIPhistoryGetVSIDS(history, dir)
    ccall((:SCIPhistoryGetVSIDS, libscip), Cdouble, (Ptr{SCIP_HISTORY}, SCIP_BRANCHDIR), history, dir)
end

function SCIPhistoryGetCutoffSum(history, dir)
    ccall((:SCIPhistoryGetCutoffSum, libscip), Cdouble, (Ptr{SCIP_HISTORY}, SCIP_BRANCHDIR), history, dir)
end

function SCIPvaluehistoryGetNValues(valuehistory)
    ccall((:SCIPvaluehistoryGetNValues, libscip), Cint, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end

function SCIPvaluehistoryGetHistories(valuehistory)
    ccall((:SCIPvaluehistoryGetHistories, libscip), Ptr{Ptr{SCIP_HISTORY}}, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end

function SCIPvaluehistoryGetValues(valuehistory)
    ccall((:SCIPvaluehistoryGetValues, libscip), Ptr{Cdouble}, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end
