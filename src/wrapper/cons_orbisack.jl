# Julia wrapper for header: /usr/include/scip/cons_orbisack.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrOrbisack(scip)
    ccall((:SCIPincludeConshdlrOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPseparateCoversOrbisack(scip, cons, sol, vars1, vars2, nrows, infeasible, ngen)
    ccall((:SCIPseparateCoversOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{UInt32}, Ptr{Cint}), scip, cons, sol, vars1, vars2, nrows, infeasible, ngen)
end

function SCIPcheckSolutionOrbisack(scip, sol, vars1, vars2, nrows, printreason, feasible)
    ccall((:SCIPcheckSolutionOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SOL}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, Ptr{UInt32}), scip, sol, vars1, vars2, nrows, printreason, feasible)
end

function SCIPcreateConsOrbisack(scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOrbisack(scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype)
    ccall((:SCIPcreateConsBasicOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, UInt32, UInt32), scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype)
end
