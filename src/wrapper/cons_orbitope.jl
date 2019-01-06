# Julia wrapper for header: /usr/include/scip/cons_orbitope.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrOrbitope(scip)
    ccall((:SCIPincludeConshdlrOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsOrbitope(scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{Ptr{SCIP_VAR}}}, SCIP_ORBITOPETYPE, Cint, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOrbitope(scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop)
    ccall((:SCIPcreateConsBasicOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{Ptr{Ptr{SCIP_VAR}}}, SCIP_ORBITOPETYPE, Cint, Cint, UInt32), scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop)
end
