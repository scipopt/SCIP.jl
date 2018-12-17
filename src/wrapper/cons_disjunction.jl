# Julia wrapper for header: /usr/include/scip/cons_disjunction.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrDisjunction(scip)
    ccall((:SCIPincludeConshdlrDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsDisjunction(scip, cons, name, nconss, conss, relaxcons, initial, enforce, check, _local, modifiable, dynamic)
    ccall((:SCIPcreateConsDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONS}, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nconss, conss, relaxcons, initial, enforce, check, _local, modifiable, dynamic)
end

function SCIPcreateConsBasicDisjunction(scip, cons, name, nconss, conss, relaxcons)
    ccall((:SCIPcreateConsBasicDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONS}), scip, cons, name, nconss, conss, relaxcons)
end

function SCIPaddConsElemDisjunction(scip, cons, addcons)
    ccall((:SCIPaddConsElemDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, addcons)
end
