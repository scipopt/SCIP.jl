# Julia wrapper for header: /usr/include/scip/scip_benders.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeBenders(scip, name, desc, priority::Cint, cutlp::UInt32, cutpseudo::UInt32, cutrelax::UInt32, shareauxvars::UInt32, benderscopy, bendersfree, bendersinit, bendersexit, bendersinitpre, bendersexitpre, bendersinitsol, bendersexitsol, bendersgetvar, benderscreatesub, benderspresubsolve, benderssolvesubconvex, benderssolvesub, benderspostsolve, bendersfreesub, bendersdata)
    ccall((:SCIPincludeBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, UInt32, UInt32, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSDATA}), scip, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, benderscopy, bendersfree, bendersinit, bendersexit, bendersinitpre, bendersexitpre, bendersinitsol, bendersexitsol, bendersgetvar, benderscreatesub, benderspresubsolve, benderssolvesubconvex, benderssolvesub, benderspostsolve, bendersfreesub, bendersdata)
end

function SCIPincludeBendersBasic(scip, bendersptr, name, desc, priority::Cint, cutlp::UInt32, cutpseudo::UInt32, cutrelax::UInt32, shareauxvars::UInt32, bendersgetvar, benderscreatesub, bendersdata)
    ccall((:SCIPincludeBendersBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BENDERS}}, Cstring, Cstring, Cint, UInt32, UInt32, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSDATA}), scip, bendersptr, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, bendersgetvar, benderscreatesub, bendersdata)
end

function SCIPsetBendersCopy(scip, benders, benderscopy)
    ccall((:SCIPsetBendersCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderscopy)
end

function SCIPsetBendersFree(scip, benders, bendersfree)
    ccall((:SCIPsetBendersFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersfree)
end

function SCIPsetBendersInit(scip, benders, bendersinit)
    ccall((:SCIPsetBendersInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinit)
end

function SCIPsetBendersExit(scip, benders, bendersexit)
    ccall((:SCIPsetBendersExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexit)
end

function SCIPsetBendersInitpre(scip, benders, bendersinitpre)
    ccall((:SCIPsetBendersInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinitpre)
end

function SCIPsetBendersExitpre(scip, benders, bendersexitpre)
    ccall((:SCIPsetBendersExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexitpre)
end

function SCIPsetBendersInitsol(scip, benders, bendersinitsol)
    ccall((:SCIPsetBendersInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinitsol)
end

function SCIPsetBendersExitsol(scip, benders, bendersexitsol)
    ccall((:SCIPsetBendersExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexitsol)
end

function SCIPsetBendersPresubsolve(scip, benders, benderspresubsolve)
    ccall((:SCIPsetBendersPresubsolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderspresubsolve)
end

function SCIPsetBendersSolveAndFreesub(scip, benders, benderssolvesubconvex, benderssolvesub, bendersfreesub)
    ccall((:SCIPsetBendersSolveAndFreesub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), scip, benders, benderssolvesubconvex, benderssolvesub, bendersfreesub)
end

function SCIPsetBendersPostsolve(scip, benders, benderspostsolve)
    ccall((:SCIPsetBendersPostsolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderspostsolve)
end

function SCIPfindBenders(scip, name)
    ccall((:SCIPfindBenders, libscip), Ptr{SCIP_BENDERS}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetBenders(scip)
    ccall((:SCIPgetBenders, libscip), Ptr{Ptr{SCIP_BENDERS}}, (Ptr{SCIP},), scip)
end

function SCIPgetNBenders(scip)
    ccall((:SCIPgetNBenders, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNActiveBenders(scip)
    ccall((:SCIPgetNActiveBenders, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPactivateBenders(scip, benders, nsubproblems::Cint)
    ccall((:SCIPactivateBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, nsubproblems)
end

function SCIPdeactivateBenders(scip, benders)
    ccall((:SCIPdeactivateBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}), scip, benders)
end

function SCIPsetBendersPriority(scip, benders, priority::Cint)
    ccall((:SCIPsetBendersPriority, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, priority)
end

function SCIPsolveBendersSubproblems(scip, benders, sol, result, infeasible, auxviol, _type::SCIP_BENDERSENFOTYPE, checkint::UInt32)
    ccall((:SCIPsolveBendersSubproblems, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}, Ptr{UInt32}, Ptr{UInt32}, SCIP_BENDERSENFOTYPE, UInt32), scip, benders, sol, result, infeasible, auxviol, _type, checkint)
end

function SCIPgetBendersMasterVar(scip, benders, var, mappedvar)
    ccall((:SCIPgetBendersMasterVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, benders, var, mappedvar)
end

function SCIPgetBendersSubproblemVar(scip, benders, var, mappedvar, probnumber::Cint)
    ccall((:SCIPgetBendersSubproblemVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Cint), scip, benders, var, mappedvar, probnumber)
end

function SCIPgetBendersNSubproblems(scip, benders)
    ccall((:SCIPgetBendersNSubproblems, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BENDERS}), scip, benders)
end

function SCIPaddBendersSubproblem(scip, benders, subproblem)
    ccall((:SCIPaddBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP}), scip, benders, subproblem)
end

function SCIPsetupBendersSubproblem(scip, benders, sol, probnumber::Cint)
    ccall((:SCIPsetupBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint), scip, benders, sol, probnumber)
end

function SCIPsolveBendersSubproblem(scip, benders, sol, probnumber::Cint, infeasible, _type::SCIP_BENDERSENFOTYPE, solvecip::UInt32, objective)
    ccall((:SCIPsolveBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint, Ptr{UInt32}, SCIP_BENDERSENFOTYPE, UInt32, Ptr{Cdouble}), scip, benders, sol, probnumber, infeasible, _type, solvecip, objective)
end

function SCIPfreeBendersSubproblem(scip, benders, probnumber::Cint)
    ccall((:SCIPfreeBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, probnumber)
end

function SCIPcheckBendersSubproblemOptimality(scip, benders, sol, probnumber::Cint, optimal)
    ccall((:SCIPcheckBendersSubproblemOptimality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint, Ptr{UInt32}), scip, benders, sol, probnumber, optimal)
end

function SCIPgetBendersAuxiliaryVarVal(scip, benders, sol, probnumber::Cint)
    ccall((:SCIPgetBendersAuxiliaryVarVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint), scip, benders, sol, probnumber)
end

function SCIPcomputeBendersSubproblemLowerbound(scip, benders, probnumber::Cint, lowerbound, infeasible)
    ccall((:SCIPcomputeBendersSubproblemLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint, Ptr{Cdouble}, Ptr{UInt32}), scip, benders, probnumber, lowerbound, infeasible)
end

function SCIPmergeBendersSubproblemIntoMaster(scip, benders, varmap, consmap, probnumber::Cint)
    ccall((:SCIPmergeBendersSubproblemIntoMaster, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cint), scip, benders, varmap, consmap, probnumber)
end

function SCIPincludeBenderscut(scip, benders, name, desc, priority::Cint, islpcut::UInt32, benderscutcopy, benderscutfree, benderscutinit, benderscutexit, benderscutinitsol, benderscutexitsol, benderscutexec, benderscutdata)
    ccall((:SCIPincludeBenderscut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cstring, Cstring, Cint, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSCUTDATA}), scip, benders, name, desc, priority, islpcut, benderscutcopy, benderscutfree, benderscutinit, benderscutexit, benderscutinitsol, benderscutexitsol, benderscutexec, benderscutdata)
end

function SCIPincludeBenderscutBasic(scip, benders, benderscutptr, name, desc, priority::Cint, islpcut::UInt32, benderscutexec, benderscutdata)
    ccall((:SCIPincludeBenderscutBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Ptr{SCIP_BENDERSCUT}}, Cstring, Cstring, Cint, UInt32, Ptr{Cvoid}, Ptr{SCIP_BENDERSCUTDATA}), scip, benders, benderscutptr, name, desc, priority, islpcut, benderscutexec, benderscutdata)
end

function SCIPsetBenderscutCopy(scip, benderscut, benderscutcopy)
    ccall((:SCIPsetBenderscutCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutcopy)
end

function SCIPsetBenderscutFree(scip, benderscut, benderscutfree)
    ccall((:SCIPsetBenderscutFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutfree)
end

function SCIPsetBenderscutInit(scip, benderscut, benderscutinit)
    ccall((:SCIPsetBenderscutInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutinit)
end

function SCIPsetBenderscutExit(scip, benderscut, benderscutexit)
    ccall((:SCIPsetBenderscutExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutexit)
end

function SCIPsetBenderscutInitsol(scip, benderscut, benderscutinitsol)
    ccall((:SCIPsetBenderscutInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutinitsol)
end

function SCIPsetBenderscutExitsol(scip, benderscut, benderscutexitsol)
    ccall((:SCIPsetBenderscutExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutexitsol)
end

function SCIPsetBenderscutPriority(scip, benderscut, priority::Cint)
    ccall((:SCIPsetBenderscutPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Cint), scip, benderscut, priority)
end

function SCIPstoreBenderscutCons(scip, benderscut, cons)
    ccall((:SCIPstoreBenderscutCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{SCIP_CONS}), scip, benderscut, cons)
end

function SCIPstoreBenderscutCut(scip, benderscut, cut)
    ccall((:SCIPstoreBenderscutCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{SCIP_ROW}), scip, benderscut, cut)
end
