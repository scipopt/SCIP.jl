# Julia wrapper for header: /usr/include/scip/scip_datastructures.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateRealarray(scip, realarray)
    ccall((:SCIPcreateRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REALARRAY}}), scip, realarray)
end

function SCIPfreeRealarray(scip, realarray)
    ccall((:SCIPfreeRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REALARRAY}}), scip, realarray)
end

function SCIPextendRealarray(scip, realarray, minidx, maxidx)
    ccall((:SCIPextendRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cint), scip, realarray, minidx, maxidx)
end

function SCIPclearRealarray(scip, realarray)
    ccall((:SCIPclearRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPgetRealarrayVal(scip, realarray, idx)
    ccall((:SCIPgetRealarrayVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint), scip, realarray, idx)
end

function SCIPsetRealarrayVal(scip, realarray, idx, val)
    ccall((:SCIPsetRealarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cdouble), scip, realarray, idx, val)
end

function SCIPincRealarrayVal(scip, realarray, idx, incval)
    ccall((:SCIPincRealarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cdouble), scip, realarray, idx, incval)
end

function SCIPgetRealarrayMinIdx(scip, realarray)
    ccall((:SCIPgetRealarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPgetRealarrayMaxIdx(scip, realarray)
    ccall((:SCIPgetRealarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPcreateIntarray(scip, intarray)
    ccall((:SCIPcreateIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_INTARRAY}}), scip, intarray)
end

function SCIPfreeIntarray(scip, intarray)
    ccall((:SCIPfreeIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_INTARRAY}}), scip, intarray)
end

function SCIPextendIntarray(scip, intarray, minidx, maxidx)
    ccall((:SCIPextendIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, minidx, maxidx)
end

function SCIPclearIntarray(scip, intarray)
    ccall((:SCIPclearIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPgetIntarrayVal(scip, intarray, idx)
    ccall((:SCIPgetIntarrayVal, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint), scip, intarray, idx)
end

function SCIPsetIntarrayVal(scip, intarray, idx, val)
    ccall((:SCIPsetIntarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, idx, val)
end

function SCIPincIntarrayVal(scip, intarray, idx, incval)
    ccall((:SCIPincIntarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, idx, incval)
end

function SCIPgetIntarrayMinIdx(scip, intarray)
    ccall((:SCIPgetIntarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPgetIntarrayMaxIdx(scip, intarray)
    ccall((:SCIPgetIntarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPcreateBoolarray(scip, boolarray)
    ccall((:SCIPcreateBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BOOLARRAY}}), scip, boolarray)
end

function SCIPfreeBoolarray(scip, boolarray)
    ccall((:SCIPfreeBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BOOLARRAY}}), scip, boolarray)
end

function SCIPextendBoolarray(scip, boolarray, minidx, maxidx)
    ccall((:SCIPextendBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint, Cint), scip, boolarray, minidx, maxidx)
end

function SCIPclearBoolarray(scip, boolarray)
    ccall((:SCIPclearBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPgetBoolarrayVal(scip, boolarray, idx)
    ccall((:SCIPgetBoolarrayVal, libscip), UInt32, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint), scip, boolarray, idx)
end

function SCIPsetBoolarrayVal(scip, boolarray, idx, val)
    ccall((:SCIPsetBoolarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint, UInt32), scip, boolarray, idx, val)
end

function SCIPgetBoolarrayMinIdx(scip, boolarray)
    ccall((:SCIPgetBoolarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPgetBoolarrayMaxIdx(scip, boolarray)
    ccall((:SCIPgetBoolarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPcreatePtrarray(scip, ptrarray)
    ccall((:SCIPcreatePtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PTRARRAY}}), scip, ptrarray)
end

function SCIPfreePtrarray(scip, ptrarray)
    ccall((:SCIPfreePtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PTRARRAY}}), scip, ptrarray)
end

function SCIPextendPtrarray(scip, ptrarray, minidx, maxidx)
    ccall((:SCIPextendPtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint, Cint), scip, ptrarray, minidx, maxidx)
end

function SCIPclearPtrarray(scip, ptrarray)
    ccall((:SCIPclearPtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPgetPtrarrayVal(scip, ptrarray, idx)
    ccall((:SCIPgetPtrarrayVal, libscip), Ptr{Cvoid}, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint), scip, ptrarray, idx)
end

function SCIPsetPtrarrayVal(scip, ptrarray, idx, val)
    ccall((:SCIPsetPtrarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint, Ptr{Cvoid}), scip, ptrarray, idx, val)
end

function SCIPgetPtrarrayMinIdx(scip, ptrarray)
    ccall((:SCIPgetPtrarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPgetPtrarrayMaxIdx(scip, ptrarray)
    ccall((:SCIPgetPtrarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPcreateDisjointset(scip, djset, ncomponents)
    ccall((:SCIPcreateDisjointset, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DISJOINTSET}}, Cint), scip, djset, ncomponents)
end

function SCIPfreeDisjointset(scip, djset)
    ccall((:SCIPfreeDisjointset, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_DISJOINTSET}}), scip, djset)
end

function SCIPcreateDigraph(scip, digraph, nnodes)
    ccall((:SCIPcreateDigraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIGRAPH}}, Cint), scip, digraph, nnodes)
end

function SCIPcopyDigraph(scip, targetdigraph, sourcedigraph)
    ccall((:SCIPcopyDigraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIGRAPH}}, Ptr{SCIP_DIGRAPH}), scip, targetdigraph, sourcedigraph)
end
