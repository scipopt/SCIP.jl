# Julia wrapper for header: /usr/include/scip/pub_benders.h
# Automatically generated using Clang.jl wrap_c


function SCIPbendersComp(elem1, elem2)
    ccall((:SCIPbendersComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbendersCompName(elem1, elem2)
    ccall((:SCIPbendersCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbendersGetData(benders)
    ccall((:SCIPbendersGetData, libscip), Ptr{SCIP_BENDERSDATA}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetData(benders, bendersdata)
    ccall((:SCIPbendersSetData, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Ptr{SCIP_BENDERSDATA}), benders, bendersdata)
end

function SCIPbendersGetName(benders)
    ccall((:SCIPbendersGetName, libscip), Cstring, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetDesc(benders)
    ccall((:SCIPbendersGetDesc, libscip), Cstring, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetPriority(benders)
    ccall((:SCIPbendersGetPriority, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNSubproblems(benders)
    ccall((:SCIPbendersGetNSubproblems, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSubproblem(benders, probnumber)
    ccall((:SCIPbendersSubproblem, libscip), Ptr{SCIP_}, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNCalls(benders)
    ccall((:SCIPbendersGetNCalls, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNCutsFound(benders)
    ccall((:SCIPbendersGetNCutsFound, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetSetupTime(benders)
    ccall((:SCIPbendersGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetTime(benders)
    ccall((:SCIPbendersGetTime, libscip), Cdouble, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersIsInitialized(benders)
    ccall((:SCIPbendersIsInitialized, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersIsActive(benders)
    ccall((:SCIPbendersIsActive, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersOnlyCheckConvexRelax(benders)
    ccall((:SCIPbendersOnlyCheckConvexRelax, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersCutLP(benders)
    ccall((:SCIPbendersCutLP, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersCutPseudo(benders)
    ccall((:SCIPbendersCutPseudo, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersCutRelaxation(benders)
    ccall((:SCIPbendersCutRelaxation, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersShareAuxVars(benders)
    ccall((:SCIPbendersShareAuxVars, libscip), UInt32, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetAuxiliaryVar(benders, probnumber)
    ccall((:SCIPbendersGetAuxiliaryVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetAuxiliaryVars(benders)
    ccall((:SCIPbendersGetAuxiliaryVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetSubproblemObjval(benders, probnumber, objval)
    ccall((:SCIPbendersSetSubproblemObjval, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cdouble), benders, probnumber, objval)
end

function SCIPbendersGetSubproblemObjval(benders, probnumber)
    ccall((:SCIPbendersGetSubproblemObjval, libscip), Cdouble, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPfindBenderscut(benders, name)
    ccall((:SCIPfindBenderscut, libscip), Ptr{SCIP_BENDERSCUT}, (Ptr{SCIP_BENDERS}, Cstring), benders, name)
end

function SCIPbendersGetBenderscuts(benders)
    ccall((:SCIPbendersGetBenderscuts, libscip), Ptr{Ptr{SCIP_BENDERSCUT}}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNBenderscuts(benders)
    ccall((:SCIPbendersGetNBenderscuts, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetBenderscutPriority(benders, benderscut, priority)
    ccall((:SCIPbendersSetBenderscutPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERS}, Ptr{SCIP_BENDERSCUT}, Cint), benders, benderscut, priority)
end

function SCIPbendersSetSubproblemIsConvex(benders, probnumber, isconvex)
    ccall((:SCIPbendersSetSubproblemIsConvex, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, UInt32), benders, probnumber, isconvex)
end

function SCIPbendersSubproblemIsConvex(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsConvex, libscip), UInt32, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNConvexSubproblems(benders)
    ccall((:SCIPbendersGetNConvexSubproblems, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSolveSubproblemLP(scip, benders, probnumber, infeasible)
    ccall((:SCIPbendersSolveSubproblemLP, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BENDERS}, Cint, Ptr{UInt32}), scip, benders, probnumber, infeasible)
end

function SCIPbendersSolveSubproblemCIP(scip, benders, probnumber, infeasible, type, solvecip)
    ccall((:SCIPbendersSolveSubproblemCIP, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BENDERS}, Cint, Ptr{UInt32}, SCIP_BENDERSENFOTYPE, UInt32), scip, benders, probnumber, infeasible, type, solvecip)
end

function SCIPbendersGetNTransferredCuts(benders)
    ccall((:SCIPbendersGetNTransferredCuts, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersUpdateSubproblemLowerbound(benders, probnumber, lowerbound)
    ccall((:SCIPbendersUpdateSubproblemLowerbound, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cdouble), benders, probnumber, lowerbound)
end

function SCIPbendersGetSubproblemLowerbound(benders, probnumber)
    ccall((:SCIPbendersGetSubproblemLowerbound, libscip), Cdouble, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersSetSubproblemIsIndependent(benders, probnumber, isindep)
    ccall((:SCIPbendersSetSubproblemIsIndependent, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, UInt32), benders, probnumber, isindep)
end

function SCIPbendersSubproblemIsIndependent(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsIndependent, libscip), UInt32, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersSubproblemIsEnabled(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsEnabled, libscip), UInt32, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end
