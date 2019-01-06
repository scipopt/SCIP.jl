# Julia wrapper for header: /usr/include/scip/pub_cutpool.h
# Automatically generated using Clang.jl wrap_c


function SCIPcutGetRow()
    ccall((:SCIPcutGetRow, libscip), Ptr{Cint}, ())
end

function SCIPcutGetAge(cut)
    ccall((:SCIPcutGetAge, libscip), Cint, (Ptr{SCIP_CUT},), cut)
end

function SCIPcutGetLPActivityQuot(cut)
    ccall((:SCIPcutGetLPActivityQuot, libscip), Cdouble, (Ptr{SCIP_CUT},), cut)
end

function SCIPcutpoolGetCuts(cutpool)
    ccall((:SCIPcutpoolGetCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCuts(cutpool)
    ccall((:SCIPcutpoolGetNCuts, libscip), Cint, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetMaxNCuts(cutpool)
    ccall((:SCIPcutpoolGetMaxNCuts, libscip), Cint, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetTime(cutpool)
    ccall((:SCIPcutpoolGetTime, libscip), Cdouble, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCalls(cutpool)
    ccall((:SCIPcutpoolGetNCalls, libscip), Clonglong, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCutsFound(cutpool)
    ccall((:SCIPcutpoolGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_CUTPOOL},), cutpool)
end
