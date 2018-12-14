# Julia wrapper for header: /usr/include/scip/scip_copy.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPcopyPlugins(sourcescip, targetscip, copyreaders::UInt32, copypricers::UInt32, copyconshdlrs::UInt32, copyconflicthdlrs::UInt32, copypresolvers::UInt32, copyrelaxators::UInt32, copyseparators::UInt32, copypropagators::UInt32, copyheuristics::UInt32, copyeventhdlrs::UInt32, copynodeselectors::UInt32, copybranchrules::UInt32, copydisplays::UInt32, copydialogs::UInt32, copytables::UInt32, copynlpis::UInt32, passmessagehdlr::UInt32, valid)
    ccall((:SCIPcopyPlugins, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copytables, copynlpis, passmessagehdlr, valid)
end

function SCIPcopyBenders(sourcescip, targetscip, varmap, valid)
    ccall((:SCIPcopyBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{UInt32}), sourcescip, targetscip, varmap, valid)
end

function SCIPcopyProb(sourcescip, targetscip, varmap, consmap, _global::UInt32, name)
    ccall((:SCIPcopyProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Cstring), sourcescip, targetscip, varmap, consmap, _global, name)
end

function SCIPcopyOrigProb(sourcescip, targetscip, varmap, consmap, name)
    ccall((:SCIPcopyOrigProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring), sourcescip, targetscip, varmap, consmap, name)
end

function SCIPenableConsCompression(scip)
    ccall((:SCIPenableConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPisConsCompressionEnabled(scip)
    ccall((:SCIPisConsCompressionEnabled, libscip), UInt32, (Ptr{SCIP},), scip)
end

function SCIPgetVarCopy(sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global::UInt32, success)
    ccall((:SCIPgetVarCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}), sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global, success)
end

function SCIPcopyVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars::Cint, _global::UInt32)
    ccall((:SCIPcopyVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars, _global)
end

function SCIPcopyOrigVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars::Cint)
    ccall((:SCIPcopyOrigVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars)
end

function SCIPmergeVariableStatistics(sourcescip, targetscip, sourcevars, targetvars, nvars::Cint)
    ccall((:SCIPmergeVariableStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint), sourcescip, targetscip, sourcevars, targetvars, nvars)
end

function SCIPgetConsCopy(sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial::UInt32, separate::UInt32, enforce::UInt32, check::UInt32, propagate::UInt32, _local::UInt32, modifiable::UInt32, dynamic::UInt32, removable::UInt32, stickingatnode::UInt32, _global::UInt32, valid)
    ccall((:SCIPgetConsCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
end

function SCIPcopyConss(sourcescip, targetscip, varmap, consmap, _global::UInt32, enablepricing::UInt32, valid)
    ccall((:SCIPcopyConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyOrigConss(sourcescip, targetscip, varmap, consmap, enablepricing::UInt32, valid)
    ccall((:SCIPcopyOrigConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, enablepricing, valid)
end

function SCIPconvertCutsToConss(scip, varmap, consmap, _global::UInt32, ncutsadded)
    ccall((:SCIPconvertCutsToConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{Cint}), scip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyCuts(sourcescip, targetscip, varmap, consmap, _global::UInt32, ncutsadded)
    ccall((:SCIPcopyCuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyConflicts(sourcescip, targetscip, varmap, consmap, _global::UInt32, enablepricing::UInt32, valid)
    ccall((:SCIPcopyConflicts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyImplicationsCliques(sourcescip, targetscip, varmap, consmap, _global::UInt32, infeasible, nbdchgs, ncopied)
    ccall((:SCIPcopyImplicationsCliques, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}, Ptr{Cint}, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, infeasible, nbdchgs, ncopied)
end

function SCIPcopyParamSettings(sourcescip, targetscip)
    ccall((:SCIPcopyParamSettings, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}), sourcescip, targetscip)
end

function SCIPgetSubscipDepth(scip)
    ccall((:SCIPgetSubscipDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetSubscipDepth(scip, newdepth::Cint)
    ccall((:SCIPsetSubscipDepth, libscip), Cvoid, (Ptr{SCIP}, Cint), scip, newdepth)
end

function SCIPcopy(sourcescip, targetscip, varmap, consmap, suffix, _global::UInt32, enablepricing::UInt32, passmessagehdlr::UInt32, valid)
    ccall((:SCIPcopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, _global, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars::Cint, _global::UInt32, enablepricing::UInt32, passmessagehdlr::UInt32, valid)
    ccall((:SCIPcopyConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, _global, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyOrig(sourcescip, targetscip, varmap, consmap, suffix, enablepricing::UInt32, passmessagehdlr::UInt32, valid)
    ccall((:SCIPcopyOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyOrigConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars::Cint, enablepricing::UInt32, passmessagehdlr::UInt32, valid)
    ccall((:SCIPcopyOrigConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, enablepricing, passmessagehdlr, valid)
end

function SCIPcheckCopyLimits(sourcescip, success)
    ccall((:SCIPcheckCopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{UInt32}), sourcescip, success)
end

function SCIPcopyLimits(sourcescip, targetscip)
    ccall((:SCIPcopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}), sourcescip, targetscip)
end
