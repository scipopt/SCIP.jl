# Julia wrapper for header: /usr/include/scip/scip_mem.h
# Automatically generated using Clang.jl wrap_c


function SCIPblkmem(scip)
    ccall((:SCIPblkmem, libscip), Ptr{BMS_BLKMEM}, (Ptr{SCIP_},), scip)
end

function SCIPbuffer(scip)
    ccall((:SCIPbuffer, libscip), Ptr{BMS_BUFMEM}, (Ptr{SCIP_},), scip)
end

function SCIPcleanbuffer(scip)
    ccall((:SCIPcleanbuffer, libscip), Ptr{BMS_BUFMEM}, (Ptr{SCIP_},), scip)
end

function SCIPgetMemUsed(scip)
    ccall((:SCIPgetMemUsed, libscip), Clonglong, (Ptr{SCIP_},), scip)
end

function SCIPgetMemTotal(scip)
    ccall((:SCIPgetMemTotal, libscip), Clonglong, (Ptr{SCIP_},), scip)
end

function SCIPgetMemExternEstim(scip)
    ccall((:SCIPgetMemExternEstim, libscip), Clonglong, (Ptr{SCIP_},), scip)
end

function SCIPcalcMemGrowSize(scip, num)
    ccall((:SCIPcalcMemGrowSize, libscip), Cint, (Ptr{SCIP_}, Cint), scip, num)
end

function SCIPensureBlockMemoryArray_call(scip, arrayptr, elemsize, arraysize, minsize)
    ccall((:SCIPensureBlockMemoryArray_call, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cint}, Cint), scip, arrayptr, elemsize, arraysize, minsize)
end

function SCIPprintMemoryDiagnostic(scip)
    ccall((:SCIPprintMemoryDiagnostic, libscip), Cvoid, (Ptr{SCIP_},), scip)
end
