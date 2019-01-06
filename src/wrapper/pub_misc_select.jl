# Julia wrapper for header: /usr/include/scip/pub_misc_select.h
# Automatically generated using Clang.jl wrap_c


function SCIPselectInd(indarray, indcomp, dataptr, k, len)
    ccall((:SCIPselectInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), indarray, indcomp, dataptr, k, len)
end

function SCIPselectWeightedInd(indarray, indcomp, dataptr, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), indarray, indcomp, dataptr, weights, capacity, len, medianpos)
end

function SCIPselectPtr(ptrarray, ptrcomp, k, len)
    ccall((:SCIPselectPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtr(ptrarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtr(ptrarray1, ptrarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtr(ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrReal(ptrarray, realarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrReal(ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrInt(ptrarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrInt(ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrBool(ptrarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrBool(ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealInt(ptrarray, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealInt(ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectReal(realarray, k, len)
    ccall((:SCIPselectReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Cint), realarray, k, len)
end

function SCIPselectWeightedReal(realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedReal, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtr(realarray, ptrarray, k, len)
    ccall((:SCIPselectRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray, k, len)
end

function SCIPselectWeightedRealPtr(realarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealInt(realarray, intarray, k, len)
    ccall((:SCIPselectRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray, intarray, k, len)
end

function SCIPselectWeightedRealInt(realarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntInt(realarray, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealIntInt(realarray, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealBoolPtr(realarray, boolarray, ptrarray, k, len)
    ccall((:SCIPselectRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedRealBoolPtr(realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntLong(realarray, intarray, longarray, k, len)
    ccall((:SCIPselectRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), realarray, intarray, longarray, k, len)
end

function SCIPselectWeightedRealIntLong(realarray, intarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntPtr(realarray, intarray, ptrarray, k, len)
    ccall((:SCIPselectRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, intarray, ptrarray, k, len)
end

function SCIPselectWeightedRealIntPtr(realarray, intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealPtr(realarray1, realarray2, ptrarray, k, len)
    ccall((:SCIPselectRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray, k, len)
end

function SCIPselectWeightedRealRealPtr(realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealLongRealInt(realarray1, longarray, realarray3, intarray, k, len)
    ccall((:SCIPselectRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, longarray, realarray3, intarray, k, len)
end

function SCIPselectWeightedRealLongRealInt(realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealIntInt(realarray1, realarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealRealIntInt(realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealInt(realarray1, realarray2, realarray3, intarray, k, len)
    ccall((:SCIPselectRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, realarray3, intarray, k, len)
end

function SCIPselectWeightedRealRealRealInt(realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectInt(intarray, k, len)
    ccall((:SCIPselectInt, libscip), Cvoid, (Ptr{Cint}, Cint, Cint), intarray, k, len)
end

function SCIPselectWeightedInt(intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, weights, capacity, len, medianpos)
end

function SCIPselectIntInt(intarray1, intarray2, k, len)
    ccall((:SCIPselectIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, k, len)
end

function SCIPselectWeightedIntInt(intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectIntPtr(intarray, ptrarray, k, len)
    ccall((:SCIPselectIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray, ptrarray, k, len)
end

function SCIPselectWeightedIntPtr(intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntReal(intarray, realarray, k, len)
    ccall((:SCIPselectIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray, realarray, k, len)
end

function SCIPselectWeightedIntReal(intarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntInt(intarray1, intarray2, intarray3, k, len)
    ccall((:SCIPselectIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, intarray3, k, len)
end

function SCIPselectWeightedIntIntInt(intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
end

function SCIPselectIntIntLong(intarray1, intarray2, longarray, k, len)
    ccall((:SCIPselectIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), intarray1, intarray2, longarray, k, len)
end

function SCIPselectWeightedIntIntLong(intarray1, intarray2, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, longarray, weights, capacity, len, medianpos)
end

function SCIPselectIntRealLong(intarray, realarray, longarray, k, len)
    ccall((:SCIPselectIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Cint), intarray, realarray, longarray, k, len)
end

function SCIPselectWeightedIntRealLong(intarray, realarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntPtr(intarray1, intarray2, ptrarray, k, len)
    ccall((:SCIPselectIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, ptrarray, k, len)
end

function SCIPselectWeightedIntIntPtr(intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntReal(intarray1, intarray2, realarray, k, len)
    ccall((:SCIPselectIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, realarray, k, len)
end

function SCIPselectWeightedIntIntReal(intarray1, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrReal(intarray, ptrarray, realarray, k, len)
    ccall((:SCIPselectIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Cint), intarray, ptrarray, realarray, k, len)
end

function SCIPselectWeightedIntPtrReal(intarray, ptrarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, k, len)
    ccall((:SCIPselectIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, intarray3, ptrarray, k, len)
end

function SCIPselectWeightedIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntIntReal(intarray1, intarray2, intarray3, realarray, k, len)
    ccall((:SCIPselectIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, intarray3, realarray, k, len)
end

function SCIPselectWeightedIntIntIntReal(intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, k, len)
    ccall((:SCIPselectIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, ptrarray, intarray2, realarray, k, len)
end

function SCIPselectWeightedIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectLong(longarray, k, len)
    ccall((:SCIPselectLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Cint), longarray, k, len)
end

function SCIPselectWeightedLong(longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLong, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtr(longarray, ptrarray, k, len)
    ccall((:SCIPselectLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Cint), longarray, ptrarray, k, len)
end

function SCIPselectWeightedLongPtr(longarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrInt(longarray, ptrarray, intarray, k, len)
    ccall((:SCIPselectLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray, intarray, k, len)
end

function SCIPselectWeightedLongPtrInt(longarray, ptrarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealBool(longarray, ptrarray, realarray, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealBool(longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, realarray2, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
    ccall((:SCIPselectLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
end

function SCIPselectWeightedLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
    ccall((:SCIPselectIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
end

function SCIPselectWeightedIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownInd(indarray, indcomp, dataptr, k, len)
    ccall((:SCIPselectDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), indarray, indcomp, dataptr, k, len)
end

function SCIPselectWeightedDownInd(indarray, indcomp, dataptr, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), indarray, indcomp, dataptr, weights, capacity, len, medianpos)
end

function SCIPselectDownPtr(ptrarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtr(ptrarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrReal(ptrarray, realarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrReal(ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrInt(ptrarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrInt(ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrBool(ptrarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrBool(ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownReal(realarray, k, len)
    ccall((:SCIPselectDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Cint), realarray, k, len)
end

function SCIPselectWeightedDownReal(realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownReal, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtr(realarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealPtr(realarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealInt(realarray, intarray, k, len)
    ccall((:SCIPselectDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray, intarray, k, len)
end

function SCIPselectDownRealIntInt(realarray, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealInt(realarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectWeightedDownRealIntInt(realarray, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealBoolPtr(realarray, boolarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealBoolPtr(realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealIntLong(realarray, intarray, longarray, k, len)
    ccall((:SCIPselectDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), realarray, intarray, longarray, k, len)
end

function SCIPselectWeightedDownRealIntLong(realarray, intarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealIntPtr(realarray, intarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, intarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealIntPtr(realarray, intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealInt(realarray1, realarray2, intarray, k, len)
    ccall((:SCIPselectDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray, k, len)
end

function SCIPselectWeightedDownRealRealInt(realarray1, realarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealPtr(realarray1, realarray2, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealPtr(realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, k, len)
    ccall((:SCIPselectDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray1, ptrarray2, k, len)
end

function SCIPselectWeightedDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealLongRealInt(realarray1, longarray, realarray3, intarray, k, len)
    ccall((:SCIPselectDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, longarray, realarray3, intarray, k, len)
end

function SCIPselectWeightedDownRealLongRealInt(realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, k, len)
    ccall((:SCIPselectDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, realarray3, intarray, k, len)
end

function SCIPselectWeightedDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtr(realarray, ptrarray1, ptrarray2, k, len)
    ccall((:SCIPselectDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray1, ptrarray2, k, len)
end

function SCIPselectWeightedDownRealPtrPtr(realarray, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownInt(intarray, k, len)
    ccall((:SCIPselectDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Cint), intarray, k, len)
end

function SCIPselectWeightedDownInt(intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntInt(intarray1, intarray2, k, len)
    ccall((:SCIPselectDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownIntInt(intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtr(intarray, ptrarray, k, len)
    ccall((:SCIPselectDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray, ptrarray, k, len)
end

function SCIPselectWeightedDownIntPtr(intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntReal(intarray, realarray, k, len)
    ccall((:SCIPselectDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray, realarray, k, len)
end

function SCIPselectWeightedDownIntReal(intarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntInt(intarray1, intarray2, intarray3, k, len)
    ccall((:SCIPselectDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, intarray3, k, len)
end

function SCIPselectWeightedDownIntIntInt(intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntLong(intarray1, intarray2, longarray, k, len)
    ccall((:SCIPselectDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), intarray1, intarray2, longarray, k, len)
end

function SCIPselectWeightedDownIntIntLong(intarray1, intarray2, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntPtr(intarray1, intarray2, ptrarray, k, len)
    ccall((:SCIPselectDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownIntIntPtr(intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntReal(intarray1, intarray2, realarray, k, len)
    ccall((:SCIPselectDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, realarray, k, len)
end

function SCIPselectWeightedDownIntIntReal(intarray1, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, k, len)
    ccall((:SCIPselectDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, intarray3, ptrarray, k, len)
end

function SCIPselectWeightedDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, k, len)
    ccall((:SCIPselectDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, intarray3, realarray, k, len)
end

function SCIPselectWeightedDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, k, len)
    ccall((:SCIPselectDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, ptrarray, intarray2, realarray, k, len)
end

function SCIPselectWeightedDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLong(longarray, k, len)
    ccall((:SCIPselectDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Cint), longarray, k, len)
end

function SCIPselectWeightedDownLong(longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLong, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtr(longarray, ptrarray, k, len)
    ccall((:SCIPselectDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Cint), longarray, ptrarray, k, len)
end

function SCIPselectWeightedDownLongPtr(longarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrInt(longarray, ptrarray, intarray, k, len)
    ccall((:SCIPselectDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrInt(longarray, ptrarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, realarray2, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
    ccall((:SCIPselectDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
    ccall((:SCIPselectDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
end

function SCIPselectWeightedDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
end
