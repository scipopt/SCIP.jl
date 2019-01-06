# Julia wrapper for header: /usr/include/scip/pub_misc.h
# Automatically generated using Clang.jl wrap_c


function SCIPstudentTGetCriticalValue(clevel, df)
    ccall((:SCIPstudentTGetCriticalValue, libscip), Cdouble, (SCIP_CONFIDENCELEVEL, Cint), clevel, df)
end

function SCIPcomputeTwoSampleTTestValue(meanx, meany, variancex, variancey, countx, county)
    ccall((:SCIPcomputeTwoSampleTTestValue, libscip), Cdouble, (Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), meanx, meany, variancex, variancey, countx, county)
end

function SCIPerf(x)
    ccall((:SCIPerf, libscip), Cdouble, (Cdouble,), x)
end

function SCIPnormalGetCriticalValue(clevel)
    ccall((:SCIPnormalGetCriticalValue, libscip), Cdouble, (SCIP_CONFIDENCELEVEL,), clevel)
end

function SCIPnormalCDF(mean, variance, value)
    ccall((:SCIPnormalCDF, libscip), Cdouble, (Cdouble, Cdouble, Cdouble), mean, variance, value)
end

function SCIPregressionGetNObservations(regression)
    ccall((:SCIPregressionGetNObservations, libscip), Cint, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionGetSlope(regression)
    ccall((:SCIPregressionGetSlope, libscip), Cdouble, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionGetIntercept(regression)
    ccall((:SCIPregressionGetIntercept, libscip), Cdouble, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionRemoveObservation(regression, x, y)
    ccall((:SCIPregressionRemoveObservation, libscip), Cvoid, (Ptr{SCIP_REGRESSION}, Cdouble, Cdouble), regression, x, y)
end

function SCIPregressionAddObservation(regression, x, y)
    ccall((:SCIPregressionAddObservation, libscip), Cvoid, (Ptr{SCIP_REGRESSION}, Cdouble, Cdouble), regression, x, y)
end

function SCIPregressionReset(regression)
    ccall((:SCIPregressionReset, libscip), Cvoid, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionCreate(regression)
    ccall((:SCIPregressionCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_REGRESSION}},), regression)
end

function SCIPregressionFree(regression)
    ccall((:SCIPregressionFree, libscip), Cvoid, (Ptr{Ptr{SCIP_REGRESSION}},), regression)
end

function SCIPgmlWriteNode(file, id, label, nodetype, fillcolor, bordercolor)
    ccall((:SCIPgmlWriteNode, libscip), Cvoid, (Ptr{FILE}, UInt32, Cstring, Cstring, Cstring, Cstring), file, id, label, nodetype, fillcolor, bordercolor)
end

function SCIPgmlWriteNodeWeight(file, id, label, nodetype, fillcolor, bordercolor, weight)
    ccall((:SCIPgmlWriteNodeWeight, libscip), Cvoid, (Ptr{FILE}, UInt32, Cstring, Cstring, Cstring, Cstring, Cdouble), file, id, label, nodetype, fillcolor, bordercolor, weight)
end

function SCIPgmlWriteEdge(file, source, target, label, color)
    ccall((:SCIPgmlWriteEdge, libscip), Cvoid, (Ptr{FILE}, UInt32, UInt32, Cstring, Cstring), file, source, target, label, color)
end

function SCIPgmlWriteArc(file, source, target, label, color)
    ccall((:SCIPgmlWriteArc, libscip), Cvoid, (Ptr{FILE}, UInt32, UInt32, Cstring, Cstring), file, source, target, label, color)
end

function SCIPgmlWriteOpening(file, directed)
    ccall((:SCIPgmlWriteOpening, libscip), Cvoid, (Ptr{FILE}, UInt32), file, directed)
end

function SCIPgmlWriteClosing(file)
    ccall((:SCIPgmlWriteClosing, libscip), Cvoid, (Ptr{FILE},), file)
end

function SCIPsparseSolCreate(sparsesol, vars, nvars, cleared)
    ccall((:SCIPsparseSolCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_SPARSESOL}}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32), sparsesol, vars, nvars, cleared)
end

function SCIPsparseSolFree(sparsesol)
    ccall((:SCIPsparseSolFree, libscip), Cvoid, (Ptr{Ptr{SCIP_SPARSESOL}},), sparsesol)
end

function SCIPsparseSolGetVars(sparsesol)
    ccall((:SCIPsparseSolGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetNVars(sparsesol)
    ccall((:SCIPsparseSolGetNVars, libscip), Cint, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetLbs(sparsesol)
    ccall((:SCIPsparseSolGetLbs, libscip), Ptr{Clonglong}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetUbs(sparsesol)
    ccall((:SCIPsparseSolGetUbs, libscip), Ptr{Clonglong}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetFirstSol(sparsesol, sol, nvars)
    ccall((:SCIPsparseSolGetFirstSol, libscip), Cvoid, (Ptr{SCIP_SPARSESOL}, Ptr{Clonglong}, Cint), sparsesol, sol, nvars)
end

function SCIPsparseSolGetNextSol(sparsesol, sol, nvars)
    ccall((:SCIPsparseSolGetNextSol, libscip), UInt32, (Ptr{SCIP_SPARSESOL}, Ptr{Clonglong}, Cint), sparsesol, sol, nvars)
end

function SCIPqueueCreate(queue, initsize, sizefac)
    ccall((:SCIPqueueCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_QUEUE}}, Cint, Cdouble), queue, initsize, sizefac)
end

function SCIPqueueFree(queue)
    ccall((:SCIPqueueFree, libscip), Cvoid, (Ptr{Ptr{SCIP_QUEUE}},), queue)
end

function SCIPqueueClear(queue)
    ccall((:SCIPqueueClear, libscip), Cvoid, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueInsert(queue, elem)
    ccall((:SCIPqueueInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_QUEUE}, Ptr{Cvoid}), queue, elem)
end

function SCIPqueueRemove(queue)
    ccall((:SCIPqueueRemove, libscip), Ptr{Cvoid}, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueFirst(queue)
    ccall((:SCIPqueueFirst, libscip), Ptr{Cvoid}, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueIsEmpty(queue)
    ccall((:SCIPqueueIsEmpty, libscip), UInt32, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueNElems(queue)
    ccall((:SCIPqueueNElems, libscip), Cint, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPpqueueCreate(pqueue, initsize, sizefac, ptrcomp)
    ccall((:SCIPpqueueCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_PQUEUE}}, Cint, Cdouble, Ptr{Cvoid}), pqueue, initsize, sizefac, ptrcomp)
end

function SCIPpqueueFree(pqueue)
    ccall((:SCIPpqueueFree, libscip), Cvoid, (Ptr{Ptr{SCIP_PQUEUE}},), pqueue)
end

function SCIPpqueueClear(pqueue)
    ccall((:SCIPpqueueClear, libscip), Cvoid, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueInsert(pqueue, elem)
    ccall((:SCIPpqueueInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_PQUEUE}, Ptr{Cvoid}), pqueue, elem)
end

function SCIPpqueueRemove(pqueue)
    ccall((:SCIPpqueueRemove, libscip), Ptr{Cvoid}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueFirst(pqueue)
    ccall((:SCIPpqueueFirst, libscip), Ptr{Cvoid}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueNElems(pqueue)
    ccall((:SCIPpqueueNElems, libscip), Cint, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueElems(pqueue)
    ccall((:SCIPpqueueElems, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPrealHashCode(x)
    ccall((:SCIPrealHashCode, libscip), UInt32, (Cdouble,), x)
end

function SCIPhashtableCreate(hashtable, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
    ccall((:SCIPhashtableCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHTABLE}}, Ptr{BMS_BLKMEM}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), hashtable, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
end

function SCIPhashtableFree(hashtable)
    ccall((:SCIPhashtableFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHTABLE}},), hashtable)
end

function SCIPhashtableClear(hashtable)
    ccall((:SCIPhashtableClear, libscip), Cvoid, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableInsert(hashtable, element)
    ccall((:SCIPhashtableInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableSafeInsert(hashtable, element)
    ccall((:SCIPhashtableSafeInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRetrieve(hashtable, key)
    ccall((:SCIPhashtableRetrieve, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, key)
end

function SCIPhashtableExists(hashtable, element)
    ccall((:SCIPhashtableExists, libscip), UInt32, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRemove(hashtable, element)
    ccall((:SCIPhashtableRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRemoveAll(hashtable)
    ccall((:SCIPhashtableRemoveAll, libscip), Cvoid, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetNElements(hashtable)
    ccall((:SCIPhashtableGetNElements, libscip), Clonglong, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetNEntries(hashtable)
    ccall((:SCIPhashtableGetNEntries, libscip), Cint, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetEntry(hashtable, entryidx)
    ccall((:SCIPhashtableGetEntry, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHTABLE}, Cint), hashtable, entryidx)
end

function SCIPhashtableGetLoad(hashtable)
    ccall((:SCIPhashtableGetLoad, libscip), Cdouble, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtablePrintStatistics(hashtable, messagehdlr)
    ccall((:SCIPhashtablePrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHTABLE}, Ptr{SCIP_MESSAGEHDLR}), hashtable, messagehdlr)
end

function SCIPcalcMultihashSize(minsize)
    ccall((:SCIPcalcMultihashSize, libscip), Cint, (Cint,), minsize)
end

function SCIPmultihashCreate(multihash, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
    ccall((:SCIPmultihashCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MULTIHASH}}, Ptr{BMS_BLKMEM}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), multihash, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
end

function SCIPmultihashFree(multihash)
    ccall((:SCIPmultihashFree, libscip), Cvoid, (Ptr{Ptr{SCIP_MULTIHASH}},), multihash)
end

function SCIPmultihashInsert(multihash, element)
    ccall((:SCIPmultihashInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashSafeInsert(multihash, element)
    ccall((:SCIPmultihashSafeInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRetrieve(multihash, key)
    ccall((:SCIPmultihashRetrieve, libscip), Ptr{Cvoid}, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, key)
end

function SCIPmultihashRetrieveNext(multihash, multihashlist, key)
    ccall((:SCIPmultihashRetrieveNext, libscip), Ptr{Cvoid}, (Ptr{SCIP_MULTIHASH}, Ptr{Ptr{SCIP_MULTIHASHLIST}}, Ptr{Cvoid}), multihash, multihashlist, key)
end

function SCIPmultihashExists(multihash, element)
    ccall((:SCIPmultihashExists, libscip), UInt32, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRemove(multihash, element)
    ccall((:SCIPmultihashRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRemoveAll(multihash)
    ccall((:SCIPmultihashRemoveAll, libscip), Cvoid, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashGetNElements(multihash)
    ccall((:SCIPmultihashGetNElements, libscip), Clonglong, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashGetLoad(multihash)
    ccall((:SCIPmultihashGetLoad, libscip), Cdouble, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashPrintStatistics(multihash, messagehdlr)
    ccall((:SCIPmultihashPrintStatistics, libscip), Cvoid, (Ptr{SCIP_MULTIHASH}, Ptr{SCIP_MESSAGEHDLR}), multihash, messagehdlr)
end

function SCIPhashKeyEqString(userptr, key1, key2)
    ccall((:SCIPhashKeyEqString, libscip), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPhashKeyValString(userptr, key)
    ccall((:SCIPhashKeyValString, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPhashGetKeyStandard(userptr, elem)
    ccall((:SCIPhashGetKeyStandard, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, elem)
end

function SCIPhashKeyEqPtr(userptr, key1, key2)
    ccall((:SCIPhashKeyEqPtr, libscip), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPhashKeyValPtr(userptr, key)
    ccall((:SCIPhashKeyValPtr, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPhashmapCreate(hashmap, blkmem, mapsize)
    ccall((:SCIPhashmapCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHMAP}}, Ptr{BMS_BLKMEM}, Cint), hashmap, blkmem, mapsize)
end

function SCIPhashmapFree(hashmap)
    ccall((:SCIPhashmapFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHMAP}},), hashmap)
end

function SCIPhashmapInsert(hashmap, origin, image)
    ccall((:SCIPhashmapInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Ptr{Cvoid}), hashmap, origin, image)
end

function SCIPhashmapInsertReal(hashmap, origin, image)
    ccall((:SCIPhashmapInsertReal, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cdouble), hashmap, origin, image)
end

function SCIPhashmapGetImage(hashmap, origin)
    ccall((:SCIPhashmapGetImage, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapGetImageReal(hashmap, origin)
    ccall((:SCIPhashmapGetImageReal, libscip), Cdouble, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapSetImage(hashmap, origin, image)
    ccall((:SCIPhashmapSetImage, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Ptr{Cvoid}), hashmap, origin, image)
end

function SCIPhashmapSetImageReal(hashmap, origin, image)
    ccall((:SCIPhashmapSetImageReal, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cdouble), hashmap, origin, image)
end

function SCIPhashmapExists(hashmap, origin)
    ccall((:SCIPhashmapExists, libscip), UInt32, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapRemove(hashmap, origin)
    ccall((:SCIPhashmapRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapPrintStatistics(hashmap, messagehdlr)
    ccall((:SCIPhashmapPrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHMAP}, Ptr{SCIP_MESSAGEHDLR}), hashmap, messagehdlr)
end

function SCIPhashmapIsEmpty(hashmap)
    ccall((:SCIPhashmapIsEmpty, libscip), UInt32, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetNElements(hashmap)
    ccall((:SCIPhashmapGetNElements, libscip), Cint, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetNEntries(hashmap)
    ccall((:SCIPhashmapGetNEntries, libscip), Cint, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetEntry(hashmap, entryidx)
    ccall((:SCIPhashmapGetEntry, libscip), Ptr{SCIP_HASHMAPENTRY}, (Ptr{SCIP_HASHMAP}, Cint), hashmap, entryidx)
end

function SCIPhashmapEntryGetOrigin(entry)
    ccall((:SCIPhashmapEntryGetOrigin, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntryGetImage(entry)
    ccall((:SCIPhashmapEntryGetImage, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntryGetImageReal(entry)
    ccall((:SCIPhashmapEntryGetImageReal, libscip), Cdouble, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntrySetImage(entry, image)
    ccall((:SCIPhashmapEntrySetImage, libscip), Cvoid, (Ptr{SCIP_HASHMAPENTRY}, Ptr{Cvoid}), entry, image)
end

function SCIPhashmapEntrySetImageReal(entry, image)
    ccall((:SCIPhashmapEntrySetImageReal, libscip), Cvoid, (Ptr{SCIP_HASHMAPENTRY}, Cdouble), entry, image)
end

function SCIPhashmapRemoveAll(hashmap)
    ccall((:SCIPhashmapRemoveAll, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashsetCreate(hashset, blkmem, size)
    ccall((:SCIPhashsetCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHSET}}, Ptr{BMS_BLKMEM}, Cint), hashset, blkmem, size)
end

function SCIPhashsetFree(hashset, blkmem)
    ccall((:SCIPhashsetFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHSET}}, Ptr{BMS_BLKMEM}), hashset, blkmem)
end

function SCIPhashsetInsert(hashset, blkmem, element)
    ccall((:SCIPhashsetInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHSET}, Ptr{BMS_BLKMEM}, Ptr{Cvoid}), hashset, blkmem, element)
end

function SCIPhashsetExists(hashset, element)
    ccall((:SCIPhashsetExists, libscip), UInt32, (Ptr{SCIP_HASHSET}, Ptr{Cvoid}), hashset, element)
end

function SCIPhashsetRemove(hashset, element)
    ccall((:SCIPhashsetRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHSET}, Ptr{Cvoid}), hashset, element)
end

function SCIPhashsetPrintStatistics(hashset, messagehdlr)
    ccall((:SCIPhashsetPrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHSET}, Ptr{SCIP_MESSAGEHDLR}), hashset, messagehdlr)
end

function SCIPhashsetIsEmpty(hashset)
    ccall((:SCIPhashsetIsEmpty, libscip), UInt32, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetNElements(hashset)
    ccall((:SCIPhashsetGetNElements, libscip), Cint, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetNSlots(hashset)
    ccall((:SCIPhashsetGetNSlots, libscip), Cint, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetSlots(hashset)
    ccall((:SCIPhashsetGetSlots, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetRemoveAll(hashset)
    ccall((:SCIPhashsetRemoveAll, libscip), Cvoid, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPactivityCreate(activity, var, duration, demand)
    ccall((:SCIPactivityCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_RESOURCEACTIVITY}}, Ptr{SCIP_VAR}, Cint, Cint), activity, var, duration, demand)
end

function SCIPactivityFree(activity)
    ccall((:SCIPactivityFree, libscip), Cvoid, (Ptr{Ptr{SCIP_RESOURCEACTIVITY}},), activity)
end

function SCIPactivityGetVar(activity)
    ccall((:SCIPactivityGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetDuration(activity)
    ccall((:SCIPactivityGetDuration, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetDemand(activity)
    ccall((:SCIPactivityGetDemand, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetEnergy(activity)
    ccall((:SCIPactivityGetEnergy, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPprofileCreate(profile, capacity)
    ccall((:SCIPprofileCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_PROFILE}}, Cint), profile, capacity)
end

function SCIPprofileFree(profile)
    ccall((:SCIPprofileFree, libscip), Cvoid, (Ptr{Ptr{SCIP_PROFILE}},), profile)
end

function SCIPprofilePrint(profile, messagehdlr, file)
    ccall((:SCIPprofilePrint, libscip), Cvoid, (Ptr{SCIP_PROFILE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}), profile, messagehdlr, file)
end

function SCIPprofileGetCapacity(profile)
    ccall((:SCIPprofileGetCapacity, libscip), Cint, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetNTimepoints(profile)
    ccall((:SCIPprofileGetNTimepoints, libscip), Cint, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetTimepoints(profile)
    ccall((:SCIPprofileGetTimepoints, libscip), Ptr{Cint}, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetLoads(profile)
    ccall((:SCIPprofileGetLoads, libscip), Ptr{Cint}, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetTime(profile, pos)
    ccall((:SCIPprofileGetTime, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint), profile, pos)
end

function SCIPprofileGetLoad(profile, pos)
    ccall((:SCIPprofileGetLoad, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint), profile, pos)
end

function SCIPprofileFindLeft(profile, timepoint, pos)
    ccall((:SCIPprofileFindLeft, libscip), UInt32, (Ptr{SCIP_PROFILE}, Cint, Ptr{Cint}), profile, timepoint, pos)
end

function SCIPprofileInsertCore(profile, left, right, height, pos, infeasible)
    ccall((:SCIPprofileInsertCore, libscip), SCIP_RETCODE, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Ptr{Cint}, Ptr{UInt32}), profile, left, right, height, pos, infeasible)
end

function SCIPprofileDeleteCore(profile, left, right, height)
    ccall((:SCIPprofileDeleteCore, libscip), SCIP_RETCODE, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint), profile, left, right, height)
end

function SCIPprofileGetEarliestFeasibleStart(profile, est, lst, duration, height, infeasible)
    ccall((:SCIPprofileGetEarliestFeasibleStart, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Cint, Ptr{UInt32}), profile, est, lst, duration, height, infeasible)
end

function SCIPprofileGetLatestFeasibleStart(profile, lb, ub, duration, height, infeasible)
    ccall((:SCIPprofileGetLatestFeasibleStart, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Cint, Ptr{UInt32}), profile, lb, ub, duration, height, infeasible)
end

function SCIPdigraphResize(digraph, nnodes)
    ccall((:SCIPdigraphResize, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint), digraph, nnodes)
end

function SCIPdigraphSetSizes(digraph, sizes)
    ccall((:SCIPdigraphSetSizes, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Ptr{Cint}), digraph, sizes)
end

function SCIPdigraphFree(digraph)
    ccall((:SCIPdigraphFree, libscip), Cvoid, (Ptr{Ptr{SCIP_DIGRAPH}},), digraph)
end

function SCIPdigraphAddArc(digraph, startnode, endnode, data)
    ccall((:SCIPdigraphAddArc, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint, Ptr{Cvoid}), digraph, startnode, endnode, data)
end

function SCIPdigraphAddArcSafe(digraph, startnode, endnode, data)
    ccall((:SCIPdigraphAddArcSafe, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint, Ptr{Cvoid}), digraph, startnode, endnode, data)
end

function SCIPdigraphSetNSuccessors(digraph, node, nsuccessors)
    ccall((:SCIPdigraphSetNSuccessors, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint), digraph, node, nsuccessors)
end

function SCIPdigraphGetNNodes(digraph)
    ccall((:SCIPdigraphGetNNodes, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNodeData(digraph, node)
    ccall((:SCIPdigraphGetNodeData, libscip), Ptr{Cvoid}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphSetNodeData(digraph, dataptr, node)
    ccall((:SCIPdigraphSetNodeData, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{Cvoid}, Cint), digraph, dataptr, node)
end

function SCIPdigraphGetNArcs(digraph)
    ccall((:SCIPdigraphGetNArcs, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNSuccessors(digraph, node)
    ccall((:SCIPdigraphGetNSuccessors, libscip), Cint, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphGetSuccessors(digraph, node)
    ccall((:SCIPdigraphGetSuccessors, libscip), Ptr{Cint}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphGetSuccessorsData(digraph, node)
    ccall((:SCIPdigraphGetSuccessorsData, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphComputeUndirectedComponents(digraph, minsize, components, ncomponents)
    ccall((:SCIPdigraphComputeUndirectedComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Cint}, Ptr{Cint}), digraph, minsize, components, ncomponents)
end

function SCIPdigraphComputeDirectedComponents(digraph, compidx, strongcomponents, strongcompstartidx, nstrongcomponents)
    ccall((:SCIPdigraphComputeDirectedComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), digraph, compidx, strongcomponents, strongcompstartidx, nstrongcomponents)
end

function SCIPdigraphTopoSortComponents(digraph)
    ccall((:SCIPdigraphTopoSortComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNComponents(digraph)
    ccall((:SCIPdigraphGetNComponents, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetComponent(digraph, compidx, nodes, nnodes)
    ccall((:SCIPdigraphGetComponent, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Ptr{Cint}}, Ptr{Cint}), digraph, compidx, nodes, nnodes)
end

function SCIPdigraphFreeComponents(digraph)
    ccall((:SCIPdigraphFreeComponents, libscip), Cvoid, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphPrint(digraph, messagehdlr, file)
    ccall((:SCIPdigraphPrint, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}), digraph, messagehdlr, file)
end

function SCIPdigraphPrintGml(digraph, file)
    ccall((:SCIPdigraphPrintGml, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{FILE}), digraph, file)
end

function SCIPdigraphPrintComponents(digraph, messagehdlr, file)
    ccall((:SCIPdigraphPrintComponents, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}), digraph, messagehdlr, file)
end

function SCIPbtnodeCreate(tree, node, dataptr)
    ccall((:SCIPbtnodeCreate, libscip), SCIP_RETCODE, (Ptr{SCIP_BT}, Ptr{Ptr{SCIP_BTNODE}}, Ptr{Cvoid}), tree, node, dataptr)
end

function SCIPbtnodeFree(tree, node)
    ccall((:SCIPbtnodeFree, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{Ptr{SCIP_BTNODE}}), tree, node)
end

function SCIPbtnodeGetData(node)
    ccall((:SCIPbtnodeGetData, libscip), Ptr{Cvoid}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetParent(node)
    ccall((:SCIPbtnodeGetParent, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetLeftchild(node)
    ccall((:SCIPbtnodeGetLeftchild, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetRightchild(node)
    ccall((:SCIPbtnodeGetRightchild, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetSibling(node)
    ccall((:SCIPbtnodeGetSibling, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsRoot(node)
    ccall((:SCIPbtnodeIsRoot, libscip), UInt32, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsLeaf(node)
    ccall((:SCIPbtnodeIsLeaf, libscip), UInt32, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsLeftchild(node)
    ccall((:SCIPbtnodeIsLeftchild, libscip), UInt32, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsRightchild(node)
    ccall((:SCIPbtnodeIsRightchild, libscip), UInt32, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeSetData(node, dataptr)
    ccall((:SCIPbtnodeSetData, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{Cvoid}), node, dataptr)
end

function SCIPbtnodeSetParent(node, parent)
    ccall((:SCIPbtnodeSetParent, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, parent)
end

function SCIPbtnodeSetLeftchild(node, left)
    ccall((:SCIPbtnodeSetLeftchild, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, left)
end

function SCIPbtnodeSetRightchild(node, right)
    ccall((:SCIPbtnodeSetRightchild, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, right)
end

function SCIPbtCreate(tree, blkmem)
    ccall((:SCIPbtCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_BT}}, Ptr{BMS_BLKMEM}), tree, blkmem)
end

function SCIPbtFree(tree)
    ccall((:SCIPbtFree, libscip), Cvoid, (Ptr{Ptr{SCIP_BT}},), tree)
end

function SCIPbtPrintGml(tree, file)
    ccall((:SCIPbtPrintGml, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{FILE}), tree, file)
end

function SCIPbtIsEmpty(tree)
    ccall((:SCIPbtIsEmpty, libscip), UInt32, (Ptr{SCIP_BT},), tree)
end

function SCIPbtGetRoot(tree)
    ccall((:SCIPbtGetRoot, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BT},), tree)
end

function SCIPbtSetRoot(tree, root)
    ccall((:SCIPbtSetRoot, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{SCIP_BTNODE}), tree, root)
end

function SCIPdisjointsetClear(djset)
    ccall((:SCIPdisjointsetClear, libscip), Cvoid, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPdisjointsetFind(djset, element)
    ccall((:SCIPdisjointsetFind, libscip), Cint, (Ptr{SCIP_DISJOINTSET}, Cint), djset, element)
end

function SCIPdisjointsetUnion(djset, p, q, forcerepofp)
    ccall((:SCIPdisjointsetUnion, libscip), Cvoid, (Ptr{SCIP_DISJOINTSET}, Cint, Cint, UInt32), djset, p, q, forcerepofp)
end

function SCIPdisjointsetGetComponentCount(djset)
    ccall((:SCIPdisjointsetGetComponentCount, libscip), Cint, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPdisjointsetGetSize(djset)
    ccall((:SCIPdisjointsetGetSize, libscip), Cint, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPcalcMachineEpsilon()
    ccall((:SCIPcalcMachineEpsilon, libscip), Cdouble, ())
end

function SCIPnextafter(from, to)
    ccall((:SCIPnextafter, libscip), Cdouble, (Cdouble, Cdouble), from, to)
end

function SCIPcalcGreComDiv(val1, val2)
    ccall((:SCIPcalcGreComDiv, libscip), Clonglong, (Clonglong, Clonglong), val1, val2)
end

function SCIPcalcSmaComMul(val1, val2)
    ccall((:SCIPcalcSmaComMul, libscip), Clonglong, (Clonglong, Clonglong), val1, val2)
end

function SCIPcalcBinomCoef(n, m)
    ccall((:SCIPcalcBinomCoef, libscip), Clonglong, (Cint, Cint), n, m)
end

function SCIPrealToRational(val, mindelta, maxdelta, maxdnom, nominator, denominator)
    ccall((:SCIPrealToRational, libscip), UInt32, (Cdouble, Cdouble, Cdouble, Clonglong, Ptr{Clonglong}, Ptr{Clonglong}), val, mindelta, maxdelta, maxdnom, nominator, denominator)
end

function SCIPcalcIntegralScalar(vals, nvals, mindelta, maxdelta, maxdnom, maxscale, intscalar, success)
    ccall((:SCIPcalcIntegralScalar, libscip), SCIP_RETCODE, (Ptr{Cdouble}, Cint, Cdouble, Cdouble, Clonglong, Cdouble, Ptr{Cdouble}, Ptr{UInt32}), vals, nvals, mindelta, maxdelta, maxdnom, maxscale, intscalar, success)
end

function SCIPfindSimpleRational(lb, ub, maxdnom, nominator, denominator)
    ccall((:SCIPfindSimpleRational, libscip), UInt32, (Cdouble, Cdouble, Clonglong, Ptr{Clonglong}, Ptr{Clonglong}), lb, ub, maxdnom, nominator, denominator)
end

function SCIPselectSimpleValue(lb, ub, maxdnom)
    ccall((:SCIPselectSimpleValue, libscip), Cdouble, (Cdouble, Cdouble, Clonglong), lb, ub, maxdnom)
end

function SCIPrelDiff(val1, val2)
    ccall((:SCIPrelDiff, libscip), Cdouble, (Cdouble, Cdouble), val1, val2)
end

function SCIPcomputeGap(eps, inf, primalbound, dualbound)
    ccall((:SCIPcomputeGap, libscip), Cdouble, (Cdouble, Cdouble, Cdouble, Cdouble), eps, inf, primalbound, dualbound)
end

function SCIPgetRandomInt(minrandval, maxrandval, seedp)
    ccall((:SCIPgetRandomInt, libscip), Cint, (Cint, Cint, Ptr{UInt32}), minrandval, maxrandval, seedp)
end

function SCIPrandomGetInt(randgen, minrandval, maxrandval)
    ccall((:SCIPrandomGetInt, libscip), Cint, (Ptr{SCIP_RANDNUMGEN}, Cint, Cint), randgen, minrandval, maxrandval)
end

function SCIPrandomGetSubset(randgen, set, nelems, subset, nsubelems)
    ccall((:SCIPrandomGetSubset, libscip), SCIP_RETCODE, (Ptr{SCIP_RANDNUMGEN}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Ptr{Cvoid}}, Cint), randgen, set, nelems, subset, nsubelems)
end

function SCIPrandomGetReal(randgen, minrandval, maxrandval)
    ccall((:SCIPrandomGetReal, libscip), Cdouble, (Ptr{SCIP_RANDNUMGEN}, Cdouble, Cdouble), randgen, minrandval, maxrandval)
end

function SCIPgetRandomReal(minrandval, maxrandval, seedp)
    ccall((:SCIPgetRandomReal, libscip), Cdouble, (Cdouble, Cdouble, Ptr{UInt32}), minrandval, maxrandval, seedp)
end

function SCIPgetRandomSubset(set, nelems, subset, nsubelems, randseed)
    ccall((:SCIPgetRandomSubset, libscip), SCIP_RETCODE, (Ptr{Ptr{Cvoid}}, Cint, Ptr{Ptr{Cvoid}}, Cint, UInt32), set, nelems, subset, nsubelems, randseed)
end

function SCIPswapInts(value1, value2)
    ccall((:SCIPswapInts, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}), value1, value2)
end

function SCIPswapReals(value1, value2)
    ccall((:SCIPswapReals, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}), value1, value2)
end

function SCIPswapPointers(pointer1, pointer2)
    ccall((:SCIPswapPointers, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}), pointer1, pointer2)
end

function SCIPpermuteIntArray(array, _begin, _end, randseed)
    ccall((:SCIPpermuteIntArray, libscip), Cvoid, (Ptr{Cint}, Cint, Cint, Ptr{UInt32}), array, _begin, _end, randseed)
end

function SCIPrandomPermuteIntArray(randgen, array, _begin, _end)
    ccall((:SCIPrandomPermuteIntArray, libscip), Cvoid, (Ptr{SCIP_RANDNUMGEN}, Ptr{Cint}, Cint, Cint), randgen, array, _begin, _end)
end

function SCIPrandomPermuteArray(randgen, array, _begin, _end)
    ccall((:SCIPrandomPermuteArray, libscip), Cvoid, (Ptr{SCIP_RANDNUMGEN}, Ptr{Ptr{Cvoid}}, Cint, Cint), randgen, array, _begin, _end)
end

function SCIPpermuteArray(array, _begin, _end, randseed)
    ccall((:SCIPpermuteArray, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{UInt32}), array, _begin, _end, randseed)
end

function SCIPcomputeArraysIntersection(array1, narray1, array2, narray2, intersectarray, nintersectarray)
    ccall((:SCIPcomputeArraysIntersection, libscip), SCIP_RETCODE, (Ptr{Cint}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), array1, narray1, array2, narray2, intersectarray, nintersectarray)
end

function SCIPcomputeArraysSetminus(array1, narray1, array2, narray2, setminusarray, nsetminusarray)
    ccall((:SCIPcomputeArraysSetminus, libscip), SCIP_RETCODE, (Ptr{Cint}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), array1, narray1, array2, narray2, setminusarray, nsetminusarray)
end

function SCIPmemccpy(dest, src, stop, cnt)
    ccall((:SCIPmemccpy, libscip), Cint, (Cstring, Cstring, UInt8, UInt32), dest, src, stop, cnt)
end

function SCIPprintSysError(message)
    ccall((:SCIPprintSysError, libscip), Cvoid, (Cstring,), message)
end

function SCIPstrtok(s, delim, ptrptr)
    ccall((:SCIPstrtok, libscip), Cstring, (Cstring, Cstring, Ptr{Cstring}), s, delim, ptrptr)
end

function SCIPescapeString(t, bufsize, s)
    ccall((:SCIPescapeString, libscip), Cvoid, (Cstring, Cint, Cstring), t, bufsize, s)
end

function SCIPstrncpy(t, s, size)
    ccall((:SCIPstrncpy, libscip), Cint, (Cstring, Cstring, Cint), t, s, size)
end

function SCIPstrToIntValue(str, value, endptr)
    ccall((:SCIPstrToIntValue, libscip), UInt32, (Cstring, Ptr{Cint}, Ptr{Cstring}), str, value, endptr)
end

function SCIPstrToRealValue(str, value, endptr)
    ccall((:SCIPstrToRealValue, libscip), UInt32, (Cstring, Ptr{Cdouble}, Ptr{Cstring}), str, value, endptr)
end

function SCIPstrCopySection(str, startchar, endchar, token, size, endptr)
    ccall((:SCIPstrCopySection, libscip), Cvoid, (Cstring, UInt8, UInt8, Cstring, Cint, Ptr{Cstring}), str, startchar, endchar, token, size, endptr)
end

function SCIPfileExists(filename)
    ccall((:SCIPfileExists, libscip), UInt32, (Cstring,), filename)
end

function SCIPsplitFilename(filename, path, name, extension, compression)
    ccall((:SCIPsplitFilename, libscip), Cvoid, (Cstring, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}), filename, path, name, extension, compression)
end
