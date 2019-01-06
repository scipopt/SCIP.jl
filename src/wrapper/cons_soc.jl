# Julia wrapper for header: /usr/include/scip/cons_soc.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrSOC(scip)
    ccall((:SCIPincludeConshdlrSOC, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsSOC(scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsSOC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{SCIP_VAR}, Cdouble, Cdouble, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicSOC(scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset)
    ccall((:SCIPcreateConsBasicSOC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset)
end

function SCIPgetNlRowSOC(scip, cons, nlrow)
    ccall((:SCIPgetNlRowSOC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLhsVarsSOC(scip, cons)
    ccall((:SCIPgetNLhsVarsSOC, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsVarsSOC(scip, cons)
    ccall((:SCIPgetLhsVarsSOC, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsCoefsSOC(scip, cons)
    ccall((:SCIPgetLhsCoefsSOC, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsOffsetsSOC(scip, cons)
    ccall((:SCIPgetLhsOffsetsSOC, libscip), Ptr{Cdouble}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsConstantSOC(scip, cons)
    ccall((:SCIPgetLhsConstantSOC, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsVarSOC(scip, cons)
    ccall((:SCIPgetRhsVarSOC, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsCoefSOC(scip, cons)
    ccall((:SCIPgetRhsCoefSOC, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsOffsetSOC(scip, cons)
    ccall((:SCIPgetRhsOffsetSOC, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddToNlpiProblemSOC(scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
    ccall((:SCIPaddToNlpiProblemSOC, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, UInt32), scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
end
