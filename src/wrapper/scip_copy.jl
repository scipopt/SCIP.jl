# Julia wrapper for header: /usr/include/scip/scip_copy.h
# Automatically generated using Clang.jl wrap_c


function SCIPcopyPlugins(sourcescip, targetscip, copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copytables, copynlpis, passmessagehdlr, valid)
    ccall((:SCIPcopyPlugins, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copytables, copynlpis, passmessagehdlr, valid)
end

function SCIPcopyBenders(sourcescip, targetscip, varmap, valid)
    ccall((:SCIPcopyBenders, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{UInt32}), sourcescip, targetscip, varmap, valid)
end

function SCIPcopyProb(sourcescip, targetscip, varmap, consmap, _global, name)
    ccall((:SCIPcopyProb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Cstring), sourcescip, targetscip, varmap, consmap, _global, name)
end

function SCIPcopyOrigProb(sourcescip, targetscip, varmap, consmap, name)
    ccall((:SCIPcopyOrigProb, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring), sourcescip, targetscip, varmap, consmap, name)
end

function SCIPenableConsCompression(scip)
    ccall((:SCIPenableConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPisConsCompressionEnabled(scip)
    ccall((:SCIPisConsCompressionEnabled, libscip), UInt32, (Ptr{SCIP_},), scip)
end

function SCIPgetVarCopy(sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global, success)
    ccall((:SCIPgetVarCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}), sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global, success)
end

function SCIPcopyVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars, _global)
    ccall((:SCIPcopyVars, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars, _global)
end

function SCIPcopyOrigVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars)
    ccall((:SCIPcopyOrigVars, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars)
end

function SCIPmergeVariableStatistics(sourcescip, targetscip, sourcevars, targetvars, nvars)
    ccall((:SCIPmergeVariableStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint), sourcescip, targetscip, sourcevars, targetvars, nvars)
end

function SCIPgetConsCopy(sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
    ccall((:SCIPgetConsCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
end

function SCIPcopyConss(sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
    ccall((:SCIPcopyConss, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyOrigConss(sourcescip, targetscip, varmap, consmap, enablepricing, valid)
    ccall((:SCIPcopyOrigConss, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, enablepricing, valid)
end

function SCIPconvertCutsToConss(scip, varmap, consmap, _global, ncutsadded)
    ccall((:SCIPconvertCutsToConss, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{Cint}), scip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyCuts(sourcescip, targetscip, varmap, consmap, _global, ncutsadded)
    ccall((:SCIPcopyCuts, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyConflicts(sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
    ccall((:SCIPcopyConflicts, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyImplicationsCliques(sourcescip, targetscip, varmap, consmap, _global, infeasible, nbdchgs, ncopied)
    ccall((:SCIPcopyImplicationsCliques, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, UInt32, Ptr{UInt32}, Ptr{Cint}, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, infeasible, nbdchgs, ncopied)
end

function SCIPcopyParamSettings(sourcescip, targetscip)
    ccall((:SCIPcopyParamSettings, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}), sourcescip, targetscip)
end

function SCIPgetSubscipDepth(scip)
    ccall((:SCIPgetSubscipDepth, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetSubscipDepth(scip, newdepth)
    ccall((:SCIPsetSubscipDepth, libscip), Cvoid, (Ptr{SCIP_}, Cint), scip, newdepth)
end

function SCIPcopy(sourcescip, targetscip, varmap, consmap, suffix, _global, enablepricing, passmessagehdlr, valid)
    ccall((:SCIPcopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, _global, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, _global, enablepricing, passmessagehdlr, valid)
    ccall((:SCIPcopyConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, _global, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyOrig(sourcescip, targetscip, varmap, consmap, suffix, enablepricing, passmessagehdlr, valid)
    ccall((:SCIPcopyOrig, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, enablepricing, passmessagehdlr, valid)
end

function SCIPcopyOrigConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, enablepricing, passmessagehdlr, valid)
    ccall((:SCIPcopyOrigConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, UInt32, UInt32, Ptr{UInt32}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, enablepricing, passmessagehdlr, valid)
end

function SCIPcheckCopyLimits(sourcescip, success)
    ccall((:SCIPcheckCopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{UInt32}), sourcescip, success)
end

function SCIPcopyLimits(sourcescip, targetscip)
    ccall((:SCIPcopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_}), sourcescip, targetscip)
end
