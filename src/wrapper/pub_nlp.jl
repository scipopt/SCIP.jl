# Julia wrapper for header: /usr/include/scip/pub_nlp.h
# Automatically generated using Clang.jl wrap_c


function SCIPexprtreeGetVars(tree)
    ccall((:SCIPexprtreeGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetVars(tree, nvars, vars)
    ccall((:SCIPexprtreeSetVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Ptr{SCIP_VAR}}), tree, nvars, vars)
end

function SCIPexprtreeAddVars(tree, nvars, vars)
    ccall((:SCIPexprtreeAddVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Ptr{SCIP_VAR}}), tree, nvars, vars)
end

function SCIPexprtreePrintWithNames(tree, messagehdlr, file)
    ccall((:SCIPexprtreePrintWithNames, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{FILE}), tree, messagehdlr, file)
end

function SCIPexprtreeFindVar(tree, var)
    ccall((:SCIPexprtreeFindVar, libscip), Cint, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_VAR}), tree, var)
end

function SCIPnlrowGetConstant(nlrow)
    ccall((:SCIPnlrowGetConstant, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNLinearVars(nlrow)
    ccall((:SCIPnlrowGetNLinearVars, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLinearVars(nlrow)
    ccall((:SCIPnlrowGetLinearVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLinearCoefs(nlrow)
    ccall((:SCIPnlrowGetLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNQuadVars(nlrow)
    ccall((:SCIPnlrowGetNQuadVars, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetQuadVars(nlrow)
    ccall((:SCIPnlrowGetQuadVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowSearchQuadVar(nlrow, var)
    ccall((:SCIPnlrowSearchQuadVar, libscip), Cint, (Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}), nlrow, var)
end

function SCIPnlrowGetNQuadElems(nlrow)
    ccall((:SCIPnlrowGetNQuadElems, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetQuadElems(nlrow)
    ccall((:SCIPnlrowGetQuadElems, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetQuadData(nlrow, nquadvars, quadvars, nquadelems, quadelems)
    ccall((:SCIPnlrowGetQuadData, libscip), Cvoid, (Ptr{SCIP_NLROW}, Ptr{Cint}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Ptr{SCIP_QUADELEM}}), nlrow, nquadvars, quadvars, nquadelems, quadelems)
end

function SCIPnlrowGetExprtree(nlrow)
    ccall((:SCIPnlrowGetExprtree, libscip), Ptr{SCIP_EXPRTREE}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLhs(nlrow)
    ccall((:SCIPnlrowGetLhs, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetRhs(nlrow)
    ccall((:SCIPnlrowGetRhs, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetCurvature(nlrow)
    ccall((:SCIPnlrowGetCurvature, libscip), SCIP_EXPRCURV, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowSetCurvature(nlrow, curvature)
    ccall((:SCIPnlrowSetCurvature, libscip), Cvoid, (Ptr{SCIP_NLROW}, SCIP_EXPRCURV), nlrow, curvature)
end

function SCIPnlrowGetName(nlrow)
    ccall((:SCIPnlrowGetName, libscip), Cstring, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNLPPos(nlrow)
    ccall((:SCIPnlrowGetNLPPos, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowIsInNLP(nlrow)
    ccall((:SCIPnlrowIsInNLP, libscip), UInt32, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetDualsol(nlrow)
    ccall((:SCIPnlrowGetDualsol, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end
