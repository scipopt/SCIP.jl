# Julia wrapper for header: /usr/include/scip/scip_cons.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeConshdlr(scip, name, desc, sepapriority::Cint, enfopriority::Cint, chckpriority::Cint, sepafreq::Cint, propfreq::Cint, eagerfreq::Cint, maxprerounds::Cint, delaysepa::UInt32, delayprop::UInt32, needscons::UInt32, proptiming::SCIP_PROPTIMING, presoltiming::SCIP_PRESOLTIMING, conshdlrcopy, consfree, consinit, consexit, consinitpre, consexitpre, consinitsol, consexitsol, consdelete, constrans, consinitlp, conssepalp, conssepasol, consenfolp, consenforelax, consenfops, conscheck, consprop, conspresol, consresprop, conslock, consactive, consdeactive, consenable, consdisable, consdelvars, consprint, conscopy, consparse, consgetvars, consgetnvars, consgetdivebdchgs, conshdlrdata)
    ccall((:SCIPincludeConshdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, Cint, Cint, Cint, Cint, Cint, Cint, UInt32, UInt32, UInt32, SCIP_PROPTIMING, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONSHDLRDATA}), scip, name, desc, sepapriority, enfopriority, chckpriority, sepafreq, propfreq, eagerfreq, maxprerounds, delaysepa, delayprop, needscons, proptiming, presoltiming, conshdlrcopy, consfree, consinit, consexit, consinitpre, consexitpre, consinitsol, consexitsol, consdelete, constrans, consinitlp, conssepalp, conssepasol, consenfolp, consenforelax, consenfops, conscheck, consprop, conspresol, consresprop, conslock, consactive, consdeactive, consenable, consdisable, consdelvars, consprint, conscopy, consparse, consgetvars, consgetnvars, consgetdivebdchgs, conshdlrdata)
end

function SCIPincludeConshdlrBasic(scip, conshdlrptr, name, desc, enfopriority::Cint, chckpriority::Cint, eagerfreq::Cint, needscons::UInt32, consenfolp, consenfops, conscheck, conslock, conshdlrdata)
    ccall((:SCIPincludeConshdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONSHDLR}}, Cstring, Cstring, Cint, Cint, Cint, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONSHDLRDATA}), scip, conshdlrptr, name, desc, enfopriority, chckpriority, eagerfreq, needscons, consenfolp, consenfops, conscheck, conslock, conshdlrdata)
end

function SCIPsetConshdlrSepa(scip, conshdlr, conssepalp, conssepasol, sepafreq::Cint, sepapriority::Cint, delaysepa::UInt32)
    ccall((:SCIPsetConshdlrSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, UInt32), scip, conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
end

function SCIPsetConshdlrProp(scip, conshdlr, consprop, propfreq::Cint, delayprop::UInt32, proptiming::SCIP_PROPTIMING)
    ccall((:SCIPsetConshdlrProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, UInt32, SCIP_PROPTIMING), scip, conshdlr, consprop, propfreq, delayprop, proptiming)
end

function SCIPsetConshdlrEnforelax(scip, conshdlr, consenforelax)
    ccall((:SCIPsetConshdlrEnforelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consenforelax)
end

function SCIPsetConshdlrCopy(scip, conshdlr, conshdlrcopy, conscopy)
    ccall((:SCIPsetConshdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}), scip, conshdlr, conshdlrcopy, conscopy)
end

function SCIPsetConshdlrFree(scip, conshdlr, consfree)
    ccall((:SCIPsetConshdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consfree)
end

function SCIPsetConshdlrInit(scip, conshdlr, consinit)
    ccall((:SCIPsetConshdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinit)
end

function SCIPsetConshdlrExit(scip, conshdlr, consexit)
    ccall((:SCIPsetConshdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexit)
end

function SCIPsetConshdlrInitsol(scip, conshdlr, consinitsol)
    ccall((:SCIPsetConshdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitsol)
end

function SCIPsetConshdlrExitsol(scip, conshdlr, consexitsol)
    ccall((:SCIPsetConshdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexitsol)
end

function SCIPsetConshdlrInitpre(scip, conshdlr, consinitpre)
    ccall((:SCIPsetConshdlrInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitpre)
end

function SCIPsetConshdlrExitpre(scip, conshdlr, consexitpre)
    ccall((:SCIPsetConshdlrExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexitpre)
end

function SCIPsetConshdlrPresol(scip, conshdlr, conspresol, maxprerounds::Cint, presoltiming::SCIP_PRESOLTIMING)
    ccall((:SCIPsetConshdlrPresol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, SCIP_PRESOLTIMING), scip, conshdlr, conspresol, maxprerounds, presoltiming)
end

function SCIPsetConshdlrDelete(scip, conshdlr, consdelete)
    ccall((:SCIPsetConshdlrDelete, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdelete)
end

function SCIPsetConshdlrTrans(scip, conshdlr, constrans)
    ccall((:SCIPsetConshdlrTrans, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, constrans)
end

function SCIPsetConshdlrInitlp(scip, conshdlr, consinitlp)
    ccall((:SCIPsetConshdlrInitlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitlp)
end

function SCIPsetConshdlrResprop(scip, conshdlr, consresprop)
    ccall((:SCIPsetConshdlrResprop, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consresprop)
end

function SCIPsetConshdlrActive(scip, conshdlr, consactive)
    ccall((:SCIPsetConshdlrActive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consactive)
end

function SCIPsetConshdlrDeactive(scip, conshdlr, consdeactive)
    ccall((:SCIPsetConshdlrDeactive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdeactive)
end

function SCIPsetConshdlrEnable(scip, conshdlr, consenable)
    ccall((:SCIPsetConshdlrEnable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consenable)
end

function SCIPsetConshdlrDisable(scip, conshdlr, consdisable)
    ccall((:SCIPsetConshdlrDisable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdisable)
end

function SCIPsetConshdlrDelvars(scip, conshdlr, consdelvars)
    ccall((:SCIPsetConshdlrDelvars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdelvars)
end

function SCIPsetConshdlrPrint(scip, conshdlr, consprint)
    ccall((:SCIPsetConshdlrPrint, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consprint)
end

function SCIPsetConshdlrParse(scip, conshdlr, consparse)
    ccall((:SCIPsetConshdlrParse, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consparse)
end

function SCIPsetConshdlrGetVars(scip, conshdlr, consgetvars)
    ccall((:SCIPsetConshdlrGetVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetvars)
end

function SCIPsetConshdlrGetNVars(scip, conshdlr, consgetnvars)
    ccall((:SCIPsetConshdlrGetNVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetnvars)
end

function SCIPsetConshdlrGetDiveBdChgs(scip, conshdlr, consgetdivebdchgs)
    ccall((:SCIPsetConshdlrGetDiveBdChgs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetdivebdchgs)
end

function SCIPfindConshdlr(scip, name)
    ccall((:SCIPfindConshdlr, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetConshdlrs(scip)
    ccall((:SCIPgetConshdlrs, libscip), Ptr{Ptr{SCIP_CONSHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNConshdlrs(scip)
    ccall((:SCIPgetNConshdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcreateCons(scip, cons, name, conshdlr, consdata, initial::UInt32, separate::UInt32, enforce::UInt32, check::UInt32, propagate::UInt32, _local::UInt32, modifiable::UInt32, dynamic::UInt32, removable::UInt32, stickingatnode::UInt32)
    ccall((:SCIPcreateCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONSDATA}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, conshdlr, consdata, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPparseCons(scip, cons, str, initial::UInt32, separate::UInt32, enforce::UInt32, check::UInt32, propagate::UInt32, _local::UInt32, modifiable::UInt32, dynamic::UInt32, removable::UInt32, stickingatnode::UInt32, success)
    ccall((:SCIPparseCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Cstring, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), scip, cons, str, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, success)
end

function SCIPcaptureCons(scip, cons)
    ccall((:SCIPcaptureCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPreleaseCons(scip, cons)
    ccall((:SCIPreleaseCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}), scip, cons)
end

function SCIPchgConsName(scip, cons, name)
    ccall((:SCIPchgConsName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cstring), scip, cons, name)
end

function SCIPsetConsInitial(scip, cons, initial::UInt32)
    ccall((:SCIPsetConsInitial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, initial)
end

function SCIPsetConsSeparated(scip, cons, separate::UInt32)
    ccall((:SCIPsetConsSeparated, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, separate)
end

function SCIPsetConsEnforced(scip, cons, enforce::UInt32)
    ccall((:SCIPsetConsEnforced, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, enforce)
end

function SCIPsetConsChecked(scip, cons, check::UInt32)
    ccall((:SCIPsetConsChecked, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, check)
end

function SCIPsetConsPropagated(scip, cons, propagate::UInt32)
    ccall((:SCIPsetConsPropagated, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, propagate)
end

function SCIPsetConsLocal(scip, cons, _local::UInt32)
    ccall((:SCIPsetConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, _local)
end

function SCIPsetConsModifiable(scip, cons, modifiable::UInt32)
    ccall((:SCIPsetConsModifiable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, modifiable)
end

function SCIPsetConsDynamic(scip, cons, dynamic::UInt32)
    ccall((:SCIPsetConsDynamic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, dynamic)
end

function SCIPsetConsRemovable(scip, cons, removable::UInt32)
    ccall((:SCIPsetConsRemovable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, removable)
end

function SCIPsetConsStickingAtNode(scip, cons, stickingatnode::UInt32)
    ccall((:SCIPsetConsStickingAtNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32), scip, cons, stickingatnode)
end

function SCIPupdateConsFlags(scip, cons0, cons1)
    ccall((:SCIPupdateConsFlags, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons0, cons1)
end

function SCIPtransformCons(scip, cons, transcons)
    ccall((:SCIPtransformCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, transcons)
end

function SCIPtransformConss(scip, nconss::Cint, conss, transconss)
    ccall((:SCIPtransformConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{Ptr{SCIP_CONS}}), scip, nconss, conss, transconss)
end

function SCIPgetTransformedCons(scip, cons, transcons)
    ccall((:SCIPgetTransformedCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, transcons)
end

function SCIPgetTransformedConss(scip, nconss::Cint, conss, transconss)
    ccall((:SCIPgetTransformedConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{Ptr{SCIP_CONS}}), scip, nconss, conss, transconss)
end

function SCIPaddConsAge(scip, cons, deltaage::Cdouble)
    ccall((:SCIPaddConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, deltaage)
end

function SCIPincConsAge(scip, cons)
    ccall((:SCIPincConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPresetConsAge(scip, cons)
    ccall((:SCIPresetConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableCons(scip, cons)
    ccall((:SCIPenableCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableCons(scip, cons)
    ccall((:SCIPdisableCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableConsSeparation(scip, cons)
    ccall((:SCIPenableConsSeparation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableConsSeparation(scip, cons)
    ccall((:SCIPdisableConsSeparation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableConsPropagation(scip, cons)
    ccall((:SCIPenableConsPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableConsPropagation(scip, cons)
    ccall((:SCIPdisableConsPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPmarkConsPropagate(scip, cons)
    ccall((:SCIPmarkConsPropagate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPunmarkConsPropagate(scip, cons)
    ccall((:SCIPunmarkConsPropagate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddConsLocksType(scip, cons, locktype::SCIP_LOCKTYPE, nlockspos::Cint, nlocksneg::Cint)
    ccall((:SCIPaddConsLocksType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, SCIP_LOCKTYPE, Cint, Cint), scip, cons, locktype, nlockspos, nlocksneg)
end

function SCIPaddConsLocks(scip, cons, nlockspos::Cint, nlocksneg::Cint)
    ccall((:SCIPaddConsLocks, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, Cint), scip, cons, nlockspos, nlocksneg)
end

function SCIPcheckCons(scip, cons, sol, checkintegrality::UInt32, checklprows::UInt32, printreason::UInt32, result)
    ccall((:SCIPcheckCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, UInt32, UInt32, UInt32, Ptr{SCIP_RESULT}), scip, cons, sol, checkintegrality, checklprows, printreason, result)
end

function SCIPenfopsCons(scip, cons, solinfeasible::UInt32, objinfeasible::UInt32, result)
    ccall((:SCIPenfopsCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32, UInt32, Ptr{SCIP_RESULT}), scip, cons, solinfeasible, objinfeasible, result)
end

function SCIPenfolpCons(scip, cons, solinfeasible::UInt32, result)
    ccall((:SCIPenfolpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, UInt32, Ptr{SCIP_RESULT}), scip, cons, solinfeasible, result)
end

function SCIPenforelaxCons(scip, cons, sol, solinfeasible::UInt32, result)
    ccall((:SCIPenforelaxCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, UInt32, Ptr{SCIP_RESULT}), scip, cons, sol, solinfeasible, result)
end

function SCIPinitlpCons(scip, cons, infeasible)
    ccall((:SCIPinitlpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{UInt32}), scip, cons, infeasible)
end

function SCIPsepalpCons(scip, cons, result)
    ccall((:SCIPsepalpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_RESULT}), scip, cons, result)
end

function SCIPsepasolCons(scip, cons, sol, result)
    ccall((:SCIPsepasolCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}), scip, cons, sol, result)
end

function SCIPpropCons(scip, cons, proptiming::SCIP_PROPTIMING, result)
    ccall((:SCIPpropCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, SCIP_PROPTIMING, Ptr{SCIP_RESULT}), scip, cons, proptiming, result)
end

function SCIPrespropCons(scip, cons, infervar, inferinfo::Cint, boundtype::SCIP_BOUNDTYPE, bdchgidx, relaxedbd::Cdouble, result)
    ccall((:SCIPrespropCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cint, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble, Ptr{SCIP_RESULT}), scip, cons, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, result)
end

function SCIPpresolCons(scip, cons, nrounds::Cint, presoltiming::SCIP_PRESOLTIMING, nnewfixedvars::Cint, nnewaggrvars::Cint, nnewchgvartypes::Cint, nnewchgbds::Cint, nnewholes::Cint, nnewdelconss::Cint, nnewaddconss::Cint, nnewupgdconss::Cint, nnewchgcoefs::Cint, nnewchgsides::Cint, nfixedvars, naggrvars, nchgvartypes, nchgbds, naddholes, ndelconss, naddconss, nupgdconss, nchgcoefs, nchgsides, result)
    ccall((:SCIPpresolCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, SCIP_PRESOLTIMING, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{SCIP_RESULT}), scip, cons, nrounds, presoltiming, nnewfixedvars, nnewaggrvars, nnewchgvartypes, nnewchgbds, nnewholes, nnewdelconss, nnewaddconss, nnewupgdconss, nnewchgcoefs, nnewchgsides, nfixedvars, naggrvars, nchgvartypes, nchgbds, naddholes, ndelconss, naddconss, nupgdconss, nchgcoefs, nchgsides, result)
end

function SCIPactiveCons(scip, cons)
    ccall((:SCIPactiveCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdeactiveCons(scip, cons)
    ccall((:SCIPdeactiveCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPprintCons(scip, cons, file)
    ccall((:SCIPprintCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{FILE}), scip, cons, file)
end

function SCIPgetConsVars(scip, cons, vars, varssize::Cint, success)
    ccall((:SCIPgetConsVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{UInt32}), scip, cons, vars, varssize, success)
end

function SCIPgetConsNVars(scip, cons, nvars, success)
    ccall((:SCIPgetConsNVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cint}, Ptr{UInt32}), scip, cons, nvars, success)
end
