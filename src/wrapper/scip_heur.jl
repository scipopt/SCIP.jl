# Julia wrapper for header: /usr/include/scip/scip_heur.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeHeur(scip, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurcopy, heurfree, heurinit, heurexit, heurinitsol, heurexitsol, heurexec, heurdata)
    ccall((:SCIPincludeHeur, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, UInt8, Cint, Cint, Cint, Cint, SCIP_HEURTIMING, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_HEURDATA}), scip, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurcopy, heurfree, heurinit, heurexit, heurinitsol, heurexitsol, heurexec, heurdata)
end

function SCIPincludeHeurBasic(scip, heur, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurexec, heurdata)
    ccall((:SCIPincludeHeurBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_HEUR}}, Cstring, Cstring, UInt8, Cint, Cint, Cint, Cint, SCIP_HEURTIMING, UInt32, Ptr{Cvoid}, Ptr{SCIP_HEURDATA}), scip, heur, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurexec, heurdata)
end

function SCIPsetHeurCopy(scip, heur, heurcopy)
    ccall((:SCIPsetHeurCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurcopy)
end

function SCIPsetHeurFree(scip, heur, heurfree)
    ccall((:SCIPsetHeurFree, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurfree)
end

function SCIPsetHeurInit(scip, heur, heurinit)
    ccall((:SCIPsetHeurInit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurinit)
end

function SCIPsetHeurExit(scip, heur, heurexit)
    ccall((:SCIPsetHeurExit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurexit)
end

function SCIPsetHeurInitsol(scip, heur, heurinitsol)
    ccall((:SCIPsetHeurInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurinitsol)
end

function SCIPsetHeurExitsol(scip, heur, heurexitsol)
    ccall((:SCIPsetHeurExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurexitsol)
end

function SCIPfindHeur(scip, name)
    ccall((:SCIPfindHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetHeurs(scip)
    ccall((:SCIPgetHeurs, libscip), Ptr{Ptr{SCIP_HEUR}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNHeurs(scip)
    ccall((:SCIPgetNHeurs, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetHeurPriority(scip, heur, priority)
    ccall((:SCIPsetHeurPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR}, Cint), scip, heur, priority)
end

function SCIPcreateDiveset(scip, diveset, heur, name, minreldepth, maxreldepth, maxlpiterquot, maxdiveubquot, maxdiveavgquot, maxdiveubquotnosol, maxdiveavgquotnosol, lpresolvedomchgquot, lpsolvefreq, maxlpiterofs, initialseed, backtrack, onlylpbranchcands, specificsos1score, divesetgetscore)
    ccall((:SCIPcreateDiveset, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_DIVESET}}, Ptr{SCIP_HEUR}, Cstring, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cint, UInt32, UInt32, UInt32, UInt32, Ptr{Cvoid}), scip, diveset, heur, name, minreldepth, maxreldepth, maxlpiterquot, maxdiveubquot, maxdiveavgquot, maxdiveubquotnosol, maxdiveavgquotnosol, lpresolvedomchgquot, lpsolvefreq, maxlpiterofs, initialseed, backtrack, onlylpbranchcands, specificsos1score, divesetgetscore)
end
