# Julia wrapper for header: /usr/include/scip/pub_misc_sort.h
# Automatically generated using Clang.jl wrap_c


function SCIPsortCompInt(elem1, elem2)
    ccall((:SCIPsortCompInt, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsort(perm, indcomp, dataptr, len)
    ccall((:SCIPsort, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), perm, indcomp, dataptr, len)
end

function SCIPsortInd(indarray, indcomp, dataptr, len)
    ccall((:SCIPsortInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), indarray, indcomp, dataptr, len)
end

function SCIPsortPtr(ptrarray, ptrcomp, len)
    ccall((:SCIPsortPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray, ptrcomp, len)
end

function SCIPsortPtrPtr(ptrarray1, ptrarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, ptrcomp, len)
end

function SCIPsortPtrReal(ptrarray, realarray, ptrcomp, len)
    ccall((:SCIPsortPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray, ptrcomp, len)
end

function SCIPsortPtrInt(ptrarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray, ptrcomp, len)
end

function SCIPsortPtrBool(ptrarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrRealInt(ptrarray, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray, ptrcomp, len)
end

function SCIPsortPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, intarray, ptrcomp, len)
end

function SCIPsortPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, realarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, len)
    ccall((:SCIPsortPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, ptrcomp, len)
end

function SCIPsortPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, len)
end

function SCIPsortPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortReal(realarray, len)
    ccall((:SCIPsortReal, libscip), Cvoid, (Ptr{Cdouble}, Cint), realarray, len)
end

function SCIPsortRealPtr(realarray, ptrarray, len)
    ccall((:SCIPsortRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray, len)
end

function SCIPsortRealInt(realarray, intarray, len)
    ccall((:SCIPsortRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint), realarray, intarray, len)
end

function SCIPsortRealIntInt(realarray, intarray1, intarray2, len)
    ccall((:SCIPsortRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, intarray1, intarray2, len)
end

function SCIPsortRealBoolPtr(realarray, boolarray, ptrarray, len)
    ccall((:SCIPsortRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray, boolarray, ptrarray, len)
end

function SCIPsortRealIntLong(realarray, intarray, longarray, len)
    ccall((:SCIPsortRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint), realarray, intarray, longarray, len)
end

function SCIPsortRealIntPtr(realarray, intarray, ptrarray, len)
    ccall((:SCIPsortRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), realarray, intarray, ptrarray, len)
end

function SCIPsortRealRealPtr(realarray1, realarray2, ptrarray, len)
    ccall((:SCIPsortRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray, len)
end

function SCIPsortRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortRealLongRealInt(realarray1, longarray, realarray3, intarray, len)
    ccall((:SCIPsortRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, longarray, realarray3, intarray, len)
end

function SCIPsortRealRealIntInt(realarray1, realarray2, intarray1, intarray2, len)
    ccall((:SCIPsortRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray1, realarray2, intarray1, intarray2, len)
end

function SCIPsortRealRealRealInt(realarray1, realarray2, realarray3, intarray, len)
    ccall((:SCIPsortRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, realarray3, intarray, len)
end

function SCIPsortRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, len)
    ccall((:SCIPsortRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, ptrarray, len)
end

function SCIPsortRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, len)
    ccall((:SCIPsortRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, len)
end

function SCIPsortRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
    ccall((:SCIPsortRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
end

function SCIPsortInt(intarray, len)
    ccall((:SCIPsortInt, libscip), Cvoid, (Ptr{Cint}, Cint), intarray, len)
end

function SCIPsortIntInt(intarray1, intarray2, len)
    ccall((:SCIPsortIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, len)
end

function SCIPsortIntPtr(intarray, ptrarray, len)
    ccall((:SCIPsortIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray, ptrarray, len)
end

function SCIPsortIntReal(intarray, realarray, len)
    ccall((:SCIPsortIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint), intarray, realarray, len)
end

function SCIPsortIntIntInt(intarray1, intarray2, intarray3, len)
    ccall((:SCIPsortIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, intarray3, len)
end

function SCIPsortIntIntLong(intarray1, intarray2, longarray, len)
    ccall((:SCIPsortIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint), intarray1, intarray2, longarray, len)
end

function SCIPsortIntRealLong(intarray, realarray, longarray, len)
    ccall((:SCIPsortIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint), intarray, realarray, longarray, len)
end

function SCIPsortIntIntPtr(intarray1, intarray2, ptrarray, len)
    ccall((:SCIPsortIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, ptrarray, len)
end

function SCIPsortIntIntReal(intarray1, intarray2, realarray, len)
    ccall((:SCIPsortIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, realarray, len)
end

function SCIPsortIntPtrReal(intarray, ptrarray, realarray, len)
    ccall((:SCIPsortIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint), intarray, ptrarray, realarray, len)
end

function SCIPsortIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, len)
    ccall((:SCIPsortIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, intarray3, ptrarray, len)
end

function SCIPsortIntIntIntReal(intarray1, intarray2, intarray3, realarray, len)
    ccall((:SCIPsortIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, intarray3, realarray, len)
end

function SCIPsortIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, len)
    ccall((:SCIPsortIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, ptrarray, intarray2, realarray, len)
end

function SCIPsortLong(longarray, len)
    ccall((:SCIPsortLong, libscip), Cvoid, (Ptr{Clonglong}, Cint), longarray, len)
end

function SCIPsortLongPtr(longarray, ptrarray, len)
    ccall((:SCIPsortLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint), longarray, ptrarray, len)
end

function SCIPsortLongPtrInt(longarray, ptrarray, intarray, len)
    ccall((:SCIPsortLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray, intarray, len)
end

function SCIPsortLongPtrRealBool(longarray, ptrarray, realarray, boolarray, len)
    ccall((:SCIPsortLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, boolarray, len)
end

function SCIPsortLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, len)
    ccall((:SCIPsortLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, realarray2, boolarray, len)
end

function SCIPsortLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
    ccall((:SCIPsortLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
end

function SCIPsortLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
    ccall((:SCIPsortLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
end

function SCIPsortPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
    ccall((:SCIPsortPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
end

function SCIPsortIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
    ccall((:SCIPsortIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
end

function SCIPsortDown(perm, indcomp, dataptr, len)
    ccall((:SCIPsortDown, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), perm, indcomp, dataptr, len)
end

function SCIPsortDownInd(indarray, indcomp, dataptr, len)
    ccall((:SCIPsortDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), indarray, indcomp, dataptr, len)
end

function SCIPsortDownPtr(ptrarray, ptrcomp, len)
    ccall((:SCIPsortDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray, ptrcomp, len)
end

function SCIPsortDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, ptrcomp, len)
end

function SCIPsortDownPtrReal(ptrarray, realarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray, ptrcomp, len)
end

function SCIPsortDownPtrInt(ptrarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrBool(ptrarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, realarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownReal(realarray, len)
    ccall((:SCIPsortDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint), realarray, len)
end

function SCIPsortDownRealPtr(realarray, ptrarray, len)
    ccall((:SCIPsortDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray, len)
end

function SCIPsortDownRealInt(realarray, intarray, len)
    ccall((:SCIPsortDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint), realarray, intarray, len)
end

function SCIPsortDownRealIntInt(realarray, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, intarray1, intarray2, len)
end

function SCIPsortDownRealBoolPtr(realarray, boolarray, ptrarray, len)
    ccall((:SCIPsortDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray, boolarray, ptrarray, len)
end

function SCIPsortDownRealIntLong(realarray, intarray, longarray, len)
    ccall((:SCIPsortDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint), realarray, intarray, longarray, len)
end

function SCIPsortDownRealIntPtr(realarray, intarray, ptrarray, len)
    ccall((:SCIPsortDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), realarray, intarray, ptrarray, len)
end

function SCIPsortDownRealRealInt(realarray1, realarray2, intarray, len)
    ccall((:SCIPsortDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, intarray, len)
end

function SCIPsortDownRealRealPtr(realarray1, realarray2, ptrarray, len)
    ccall((:SCIPsortDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray, len)
end

function SCIPsortDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, len)
    ccall((:SCIPsortDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray1, ptrarray2, len)
end

function SCIPsortDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortDownRealLongRealInt(realarray1, longarray, realarray3, intarray, len)
    ccall((:SCIPsortDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, longarray, realarray3, intarray, len)
end

function SCIPsortDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray1, realarray2, intarray1, intarray2, len)
end

function SCIPsortDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, len)
    ccall((:SCIPsortDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, realarray3, intarray, len)
end

function SCIPsortDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, ptrarray, len)
end

function SCIPsortDownRealPtrPtr(realarray, ptrarray1, ptrarray2, len)
    ccall((:SCIPsortDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray1, ptrarray2, len)
end

function SCIPsortDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, len)
end

function SCIPsortDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
end

function SCIPsortDownInt(intarray, len)
    ccall((:SCIPsortDownInt, libscip), Cvoid, (Ptr{Cint}, Cint), intarray, len)
end

function SCIPsortDownIntInt(intarray1, intarray2, len)
    ccall((:SCIPsortDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, len)
end

function SCIPsortDownIntPtr(intarray, ptrarray, len)
    ccall((:SCIPsortDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray, ptrarray, len)
end

function SCIPsortDownIntReal(intarray, realarray, len)
    ccall((:SCIPsortDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint), intarray, realarray, len)
end

function SCIPsortDownIntIntInt(intarray1, intarray2, intarray3, len)
    ccall((:SCIPsortDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, intarray3, len)
end

function SCIPsortDownIntIntLong(intarray1, intarray2, longarray, len)
    ccall((:SCIPsortDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint), intarray1, intarray2, longarray, len)
end

function SCIPsortDownIntIntPtr(intarray1, intarray2, ptrarray, len)
    ccall((:SCIPsortDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, ptrarray, len)
end

function SCIPsortDownIntIntReal(intarray1, intarray2, realarray, len)
    ccall((:SCIPsortDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, realarray, len)
end

function SCIPsortDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, len)
    ccall((:SCIPsortDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, intarray3, ptrarray, len)
end

function SCIPsortDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, len)
    ccall((:SCIPsortDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, intarray3, realarray, len)
end

function SCIPsortDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, len)
    ccall((:SCIPsortDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, ptrarray, intarray2, realarray, len)
end

function SCIPsortDownLong(longarray, len)
    ccall((:SCIPsortDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint), longarray, len)
end

function SCIPsortDownLongPtr(longarray, ptrarray, len)
    ccall((:SCIPsortDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint), longarray, ptrarray, len)
end

function SCIPsortDownLongPtrInt(longarray, ptrarray, intarray, len)
    ccall((:SCIPsortDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray, intarray, len)
end

function SCIPsortDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, boolarray, len)
end

function SCIPsortDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, realarray2, boolarray, len)
end

function SCIPsortDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
end

function SCIPsortDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
    ccall((:SCIPsortDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
end

function SCIPsortDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
end

function SCIPsortDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
    ccall((:SCIPsortDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
end

function SCIPsortedvecInsertInd(indarray, indcomp, dataptr, keyval, len, pos)
    ccall((:SCIPsortedvecInsertInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), indarray, indcomp, dataptr, keyval, len, pos)
end

function SCIPsortedvecInsertPtr(ptrarray, ptrcomp, keyval, len, pos)
    ccall((:SCIPsortedvecInsertPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray, ptrcomp, keyval, len, pos)
end

function SCIPsortedvecInsertPtrPtr(ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrReal(ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrInt(ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrBool(ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrRealInt(ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertRealIntInt(realarray, intarray1, intarray2, keyval, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray1, intarray2, keyval, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealBoolPtr(realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealPtr(realarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertReal(realarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertReal, libscip), Cvoid, (Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Cint}), realarray, keyval, len, pos)
end

function SCIPsortedvecInsertRealInt(realarray, intarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertRealIntLong(realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cdouble, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealIntPtr(realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cdouble, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealRealPtr(realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
    ccall((:SCIPsortedvecInsertRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
end

function SCIPsortedvecInsertRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
    ccall((:SCIPsortedvecInsertRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
end

function SCIPsortedvecInsertRealLongRealInt(realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Clonglong, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealIntInt(realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealInt(realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertInt(intarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), intarray, keyval, len, pos)
end

function SCIPsortedvecInsertIntInt(intarray1, intarray2, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntPtr(intarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntReal(intarray, realarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, realarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntIntInt(intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntLong(intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntRealLong(intarray, realarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Cdouble, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray, realarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntPtr(intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntReal(intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntPtrReal(intarray, ptrarray, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertIntIntIntReal(intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLong(longarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertLong, libscip), Cvoid, (Ptr{Clonglong}, Clonglong, Ptr{Cint}, Ptr{Cint}), longarray, keyval, len, pos)
end

function SCIPsortedvecInsertLongPtr(longarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Clonglong, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertLongPtrInt(longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealBool(longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cint, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, UInt32, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, UInt32, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Ptr{Cvoid}, Cint, Cint, UInt32, UInt32, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownInd(indarray, indcomp, dataptr, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), indarray, indcomp, dataptr, keyval, len, pos)
end

function SCIPsortedvecInsertDownPtr(ptrarray, ptrcomp, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray, ptrcomp, keyval, len, pos)
end

function SCIPsortedvecInsertDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrReal(ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrInt(ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrBool(ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownReal(realarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Cint}), realarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownRealBoolPtr(realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealPtr(realarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtr(realarray, ptrarray1, ptrarray2, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealInt(realarray, intarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownRealIntInt(realarray, intarray1, intarray2, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray1, intarray2, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealInt(realarray, realarray2, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, realarray2, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealIntLong(realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cdouble, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealIntPtr(realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cdouble, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealPtr(realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
end

function SCIPsortedvecInsertDownRealLongRealInt(realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Clonglong, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownInt(intarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), intarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownIntInt(intarray1, intarray2, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntReal(intarray, realarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, realarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntIntInt(intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntLong(intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntPtr(intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntReal(intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntPtr(intarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLong(longarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownLong, libscip), Cvoid, (Ptr{Clonglong}, Clonglong, Ptr{Cint}, Ptr{Cint}), longarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownLongPtr(longarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Clonglong, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrInt(longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cint, UInt32, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, UInt32, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, UInt32, UInt32, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Ptr{Cvoid}, Cint, Cint, UInt32, UInt32, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecDelPosInd(indarray, indcomp, dataptr, pos, len)
    ccall((:SCIPsortedvecDelPosInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), indarray, indcomp, dataptr, pos, len)
end

function SCIPsortedvecDelPosPtr(ptrarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtr(ptrarray1, ptrarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrReal(ptrarray, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrInt(ptrarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrBool(ptrarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealInt(ptrarray, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosRealBoolPtr(realarray, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealPtr(realarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosReal(realarray, pos, len)
    ccall((:SCIPsortedvecDelPosReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cint}), realarray, pos, len)
end

function SCIPsortedvecDelPosRealInt(realarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray, pos, len)
end

function SCIPsortedvecDelPosRealIntInt(realarray, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealIntLong(realarray, intarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), realarray, intarray, longarray, pos, len)
end

function SCIPsortedvecDelPosRealIntPtr(realarray, intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealPtr(realarray1, realarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealLongRealInt(realarray1, longarray, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosRealRealIntInt(realarray1, realarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealRealRealInt(realarray1, realarray2, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosInt(intarray, pos, len)
    ccall((:SCIPsortedvecDelPosInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}), intarray, pos, len)
end

function SCIPsortedvecDelPosIntInt(intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosIntReal(intarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, realarray, pos, len)
end

function SCIPsortedvecDelPosIntIntInt(intarray1, intarray2, intarray3, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, pos, len)
end

function SCIPsortedvecDelPosIntIntLong(intarray1, intarray2, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray1, intarray2, longarray, pos, len)
end

function SCIPsortedvecDelPosIntRealLong(intarray, realarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray, realarray, longarray, pos, len)
end

function SCIPsortedvecDelPosIntIntPtr(intarray1, intarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntIntReal(intarray1, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosIntPtr(intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntPtrReal(intarray, ptrarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, ptrarray, realarray, pos, len)
end

function SCIPsortedvecDelPosIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntIntIntReal(intarray1, intarray2, intarray3, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, pos, len)
end

function SCIPsortedvecDelPosIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosLong(longarray, pos, len)
    ccall((:SCIPsortedvecDelPosLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Ptr{Cint}), longarray, pos, len)
end

function SCIPsortedvecDelPosLongPtr(longarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), longarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrInt(longarray, ptrarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray, intarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealBool(longarray, ptrarray, realarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
end

function SCIPsortedvecDelPosPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
end

function SCIPsortedvecDelPosDownInd(indarray, indcomp, dataptr, pos, len)
    ccall((:SCIPsortedvecDelPosDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), indarray, indcomp, dataptr, pos, len)
end

function SCIPsortedvecDelPosDownPtr(ptrarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrReal(ptrarray, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrInt(ptrarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrBool(ptrarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownReal(realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cint}), realarray, pos, len)
end

function SCIPsortedvecDelPosDownRealBoolPtr(realarray, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealPtr(realarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealInt(realarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealIntInt(realarray, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealIntLong(realarray, intarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), realarray, intarray, longarray, pos, len)
end

function SCIPsortedvecDelPosDownRealIntPtr(realarray, intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealInt(realarray1, realarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealPtr(realarray1, realarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtr(realarray, ptrarray1, ptrarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealLongRealInt(realarray1, longarray, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownInt(intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}), intarray, pos, len)
end

function SCIPsortedvecDelPosDownIntInt(intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownIntReal(intarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntInt(intarray1, intarray2, intarray3, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, pos, len)
end

function SCIPsortedvecDelPosDownIntIntLong(intarray1, intarray2, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray1, intarray2, longarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntPtr(intarray1, intarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntReal(intarray1, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntPtr(intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosDownLong(longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Ptr{Cint}), longarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtr(longarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), longarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrInt(longarray, ptrarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{UInt32}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{UInt32}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{UInt32}, Ptr{UInt32}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
end

function SCIPsortedvecFindInd(indarray, indcomp, dataptr, val, len, pos)
    ccall((:SCIPsortedvecFindInd, libscip), UInt32, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}), indarray, indcomp, dataptr, val, len, pos)
end

function SCIPsortedvecFindPtr(ptrarray, ptrcomp, val, len, pos)
    ccall((:SCIPsortedvecFindPtr, libscip), UInt32, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, val, len, pos)
end

function SCIPsortedvecFindReal(realarray, val, len, pos)
    ccall((:SCIPsortedvecFindReal, libscip), UInt32, (Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, val, len, pos)
end

function SCIPsortedvecFindInt(intarray, val, len, pos)
    ccall((:SCIPsortedvecFindInt, libscip), UInt32, (Ptr{Cint}, Cint, Cint, Ptr{Cint}), intarray, val, len, pos)
end

function SCIPsortedvecFindLong(longarray, val, len, pos)
    ccall((:SCIPsortedvecFindLong, libscip), UInt32, (Ptr{Clonglong}, Clonglong, Cint, Ptr{Cint}), longarray, val, len, pos)
end

function SCIPsortedvecFindDownInd(indarray, indcomp, dataptr, val, len, pos)
    ccall((:SCIPsortedvecFindDownInd, libscip), UInt32, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}), indarray, indcomp, dataptr, val, len, pos)
end

function SCIPsortedvecFindDownPtr(ptrarray, ptrcomp, val, len, pos)
    ccall((:SCIPsortedvecFindDownPtr, libscip), UInt32, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, val, len, pos)
end

function SCIPsortedvecFindDownReal(realarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownReal, libscip), UInt32, (Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, val, len, pos)
end

function SCIPsortedvecFindDownInt(intarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownInt, libscip), UInt32, (Ptr{Cint}, Cint, Cint, Ptr{Cint}), intarray, val, len, pos)
end

function SCIPsortedvecFindDownLong(longarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownLong, libscip), UInt32, (Ptr{Clonglong}, Clonglong, Cint, Ptr{Cint}), longarray, val, len, pos)
end
