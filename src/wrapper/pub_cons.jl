# Julia wrapper for header: /usr/include/scip/pub_cons.h
# Automatically generated using Clang.jl wrap_c


function SCIPconshdlrCompSepa(elem1, elem2)
    ccall((:SCIPconshdlrCompSepa, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrCompEnfo(elem1, elem2)
    ccall((:SCIPconshdlrCompEnfo, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrCompCheck(elem1, elem2)
    ccall((:SCIPconshdlrCompCheck, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrGetName(conshdlr)
    ccall((:SCIPconshdlrGetName, libscip), Cstring, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetDesc(conshdlr)
    ccall((:SCIPconshdlrGetDesc, libscip), Cstring, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetData(conshdlr)
    ccall((:SCIPconshdlrGetData, libscip), Ptr{SCIP_CONSHDLRDATA}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrSetData(conshdlr, conshdlrdata)
    ccall((:SCIPconshdlrSetData, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONSHDLRDATA}), conshdlr, conshdlrdata)
end

function SCIPconshdlrSetSepa(conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
    ccall((:SCIPconshdlrSetSepa, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, UInt32), conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
end

function SCIPconshdlrSetProp(conshdlr, consprop, propfreq, delayprop, timingmask)
    ccall((:SCIPconshdlrSetProp, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, UInt32, SCIP_PROPTIMING), conshdlr, consprop, propfreq, delayprop, timingmask)
end

function SCIPconshdlrSetEnforelax(conshdlr, consenforelax)
    ccall((:SCIPconshdlrSetEnforelax, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), conshdlr, consenforelax)
end

function SCIPconshdlrGetConss(conshdlr)
    ccall((:SCIPconshdlrGetConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoConss(conshdlr)
    ccall((:SCIPconshdlrGetEnfoConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckConss(conshdlr)
    ccall((:SCIPconshdlrGetCheckConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNConss(conshdlr)
    ccall((:SCIPconshdlrGetNConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoConss(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCheckConss(conshdlr)
    ccall((:SCIPconshdlrGetNCheckConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnabledConss(conshdlr)
    ccall((:SCIPconshdlrGetNEnabledConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSetupTime(conshdlr)
    ccall((:SCIPconshdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPresolTime(conshdlr)
    ccall((:SCIPconshdlrGetPresolTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaTime(conshdlr)
    ccall((:SCIPconshdlrGetSepaTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoLPTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoLPTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoPSTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoPSTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoRelaxTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoRelaxTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropTime(conshdlr)
    ccall((:SCIPconshdlrGetPropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetStrongBranchPropTime(conshdlr)
    ccall((:SCIPconshdlrGetStrongBranchPropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckTime(conshdlr)
    ccall((:SCIPconshdlrGetCheckTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetRespropTime(conshdlr)
    ccall((:SCIPconshdlrGetRespropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNSepaCalls(conshdlr)
    ccall((:SCIPconshdlrGetNSepaCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoLPCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoLPCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoPSCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoPSCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoRelaxCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoRelaxCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNPropCalls(conshdlr)
    ccall((:SCIPconshdlrGetNPropCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCheckCalls(conshdlr)
    ccall((:SCIPconshdlrGetNCheckCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNRespropCalls(conshdlr)
    ccall((:SCIPconshdlrGetNRespropCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutoffs(conshdlr)
    ccall((:SCIPconshdlrGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutsFound(conshdlr)
    ccall((:SCIPconshdlrGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutsApplied(conshdlr)
    ccall((:SCIPconshdlrGetNCutsApplied, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNConssFound(conshdlr)
    ccall((:SCIPconshdlrGetNConssFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNDomredsFound(conshdlr)
    ccall((:SCIPconshdlrGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChildren(conshdlr)
    ccall((:SCIPconshdlrGetNChildren, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetMaxNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetMaxNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetStartNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetStartNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNFixedVars(conshdlr)
    ccall((:SCIPconshdlrGetNFixedVars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAggrVars(conshdlr)
    ccall((:SCIPconshdlrGetNAggrVars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgVarTypes(conshdlr)
    ccall((:SCIPconshdlrGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgBds(conshdlr)
    ccall((:SCIPconshdlrGetNChgBds, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAddHoles(conshdlr)
    ccall((:SCIPconshdlrGetNAddHoles, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNDelConss(conshdlr)
    ccall((:SCIPconshdlrGetNDelConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAddConss(conshdlr)
    ccall((:SCIPconshdlrGetNAddConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNUpgdConss(conshdlr)
    ccall((:SCIPconshdlrGetNUpgdConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgCoefs(conshdlr)
    ccall((:SCIPconshdlrGetNChgCoefs, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgSides(conshdlr)
    ccall((:SCIPconshdlrGetNChgSides, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNPresolCalls(conshdlr)
    ccall((:SCIPconshdlrGetNPresolCalls, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaPriority(conshdlr)
    ccall((:SCIPconshdlrGetSepaPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoPriority(conshdlr)
    ccall((:SCIPconshdlrGetEnfoPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckPriority(conshdlr)
    ccall((:SCIPconshdlrGetCheckPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaFreq(conshdlr)
    ccall((:SCIPconshdlrGetSepaFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropFreq(conshdlr)
    ccall((:SCIPconshdlrGetPropFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEagerFreq(conshdlr)
    ccall((:SCIPconshdlrGetEagerFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrNeedsCons(conshdlr)
    ccall((:SCIPconshdlrNeedsCons, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrDoesPresolve(conshdlr)
    ccall((:SCIPconshdlrDoesPresolve, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrIsSeparationDelayed, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsPropagationDelayed(conshdlr)
    ccall((:SCIPconshdlrIsPropagationDelayed, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasLPSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasLPSeparationDelayed, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasSolSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasSolSeparationDelayed, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasPropagationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasPropagationDelayed, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsInitialized(conshdlr)
    ccall((:SCIPconshdlrIsInitialized, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsClonable(conshdlr)
    ccall((:SCIPconshdlrIsClonable, libscip), UInt32, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropTiming(conshdlr)
    ccall((:SCIPconshdlrGetPropTiming, libscip), SCIP_PROPTIMING, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconssetchgGetAddedConsData(conssetchg, conss, nconss)
    ccall((:SCIPconssetchgGetAddedConsData, libscip), Cvoid, (Ptr{SCIP_CONSSETCHG}, Ptr{Ptr{Ptr{SCIP_CONS}}}, Ptr{Cint}), conssetchg, conss, nconss)
end

function SCIPconshdlrSetPropTiming(conshdlr, proptiming)
    ccall((:SCIPconshdlrSetPropTiming, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, SCIP_PROPTIMING), conshdlr, proptiming)
end

function SCIPconshdlrGetPresolTiming(conshdlr)
    ccall((:SCIPconshdlrGetPresolTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrSetPresolTiming(conshdlr, presoltiming)
    ccall((:SCIPconshdlrSetPresolTiming, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, SCIP_PRESOLTIMING), conshdlr, presoltiming)
end

function SCIPconsGetName(cons)
    ccall((:SCIPconsGetName, libscip), Cstring, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetPos(cons)
    ccall((:SCIPconsGetPos, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetHdlr(cons)
    ccall((:SCIPconsGetHdlr, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetData(cons)
    ccall((:SCIPconsGetData, libscip), Ptr{SCIP_CONSDATA}, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNUses(cons)
    ccall((:SCIPconsGetNUses, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetActiveDepth(cons)
    ccall((:SCIPconsGetActiveDepth, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetValidDepth(cons)
    ccall((:SCIPconsGetValidDepth, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsActive(cons)
    ccall((:SCIPconsIsActive, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsUpdatedeactivate(cons)
    ccall((:SCIPconsIsUpdatedeactivate, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsEnabled(cons)
    ccall((:SCIPconsIsEnabled, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsSeparationEnabled(cons)
    ccall((:SCIPconsIsSeparationEnabled, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsPropagationEnabled(cons)
    ccall((:SCIPconsIsPropagationEnabled, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsDeleted(cons)
    ccall((:SCIPconsIsDeleted, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsObsolete(cons)
    ccall((:SCIPconsIsObsolete, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsConflict(cons)
    ccall((:SCIPconsIsConflict, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetAge(cons)
    ccall((:SCIPconsGetAge, libscip), Cdouble, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsInitial(cons)
    ccall((:SCIPconsIsInitial, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsSeparated(cons)
    ccall((:SCIPconsIsSeparated, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsEnforced(cons)
    ccall((:SCIPconsIsEnforced, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsChecked(cons)
    ccall((:SCIPconsIsChecked, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsMarkedPropagate(cons)
    ccall((:SCIPconsIsMarkedPropagate, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsPropagated(cons)
    ccall((:SCIPconsIsPropagated, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsGlobal(cons)
    ccall((:SCIPconsIsGlobal, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLocal(cons)
    ccall((:SCIPconsIsLocal, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsModifiable(cons)
    ccall((:SCIPconsIsModifiable, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsDynamic(cons)
    ccall((:SCIPconsIsDynamic, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsRemovable(cons)
    ccall((:SCIPconsIsRemovable, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsStickingAtNode(cons)
    ccall((:SCIPconsIsStickingAtNode, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsInProb(cons)
    ccall((:SCIPconsIsInProb, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsOriginal(cons)
    ccall((:SCIPconsIsOriginal, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsTransformed(cons)
    ccall((:SCIPconsIsTransformed, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedPos(cons)
    ccall((:SCIPconsIsLockedPos, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedNeg(cons)
    ccall((:SCIPconsIsLockedNeg, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLocked(cons)
    ccall((:SCIPconsIsLocked, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNLocksPos(cons)
    ccall((:SCIPconsGetNLocksPos, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNLocksNeg(cons)
    ccall((:SCIPconsGetNLocksNeg, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedTypePos(cons, locktype)
    ccall((:SCIPconsIsLockedTypePos, libscip), UInt32, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsLockedTypeNeg(cons, locktype)
    ccall((:SCIPconsIsLockedTypeNeg, libscip), UInt32, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsLockedType(cons, locktype)
    ccall((:SCIPconsIsLockedType, libscip), UInt32, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsGetNLocksTypePos(cons, locktype)
    ccall((:SCIPconsGetNLocksTypePos, libscip), Cint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsGetNLocksTypeNeg(cons, locktype)
    ccall((:SCIPconsGetNLocksTypeNeg, libscip), Cint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsAdded(cons)
    ccall((:SCIPconsIsAdded, libscip), UInt32, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsAddUpgradeLocks(cons, nlocks)
    ccall((:SCIPconsAddUpgradeLocks, libscip), Cvoid, (Ptr{SCIP_CONS}, Cint), cons, nlocks)
end

function SCIPconsGetNUpgradeLocks(cons)
    ccall((:SCIPconsGetNUpgradeLocks, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPlinConsStatsCreate(scip, linconsstats)
    ccall((:SCIPlinConsStatsCreate, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_LINCONSSTATS}}), scip, linconsstats)
end

function SCIPlinConsStatsFree(scip, linconsstats)
    ccall((:SCIPlinConsStatsFree, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Ptr{SCIP_LINCONSSTATS}}), scip, linconsstats)
end

function SCIPlinConsStatsReset(linconsstats)
    ccall((:SCIPlinConsStatsReset, libscip), Cvoid, (Ptr{SCIP_LINCONSSTATS},), linconsstats)
end

function SCIPlinConsStatsGetTypeCount(linconsstats, linconstype)
    ccall((:SCIPlinConsStatsGetTypeCount, libscip), Cint, (Ptr{SCIP_LINCONSSTATS}, SCIP_LINCONSTYPE), linconsstats, linconstype)
end

function SCIPlinConsStatsGetSum(linconsstats)
    ccall((:SCIPlinConsStatsGetSum, libscip), Cint, (Ptr{SCIP_LINCONSSTATS},), linconsstats)
end

function SCIPlinConsStatsIncTypeCount(linconsstats, linconstype, increment)
    ccall((:SCIPlinConsStatsIncTypeCount, libscip), Cvoid, (Ptr{SCIP_LINCONSSTATS}, SCIP_LINCONSTYPE, Cint), linconsstats, linconstype, increment)
end

function SCIPprintLinConsStats(scip, file, linconsstats)
    ccall((:SCIPprintLinConsStats, libscip), Cvoid, (Ptr{SCIP_}, Ptr{FILE}, Ptr{SCIP_LINCONSSTATS}), scip, file, linconsstats)
end
