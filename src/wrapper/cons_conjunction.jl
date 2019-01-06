# Julia wrapper for header: /usr/include/scip/cons_conjunction.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrConjunction(scip)
    ccall((:SCIPincludeConshdlrConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsConjunction(scip, cons, name, nconss, conss, enforce, check, _local, modifiable, dynamic)
    ccall((:SCIPcreateConsConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_CONS}}, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, nconss, conss, enforce, check, _local, modifiable, dynamic)
end

function SCIPcreateConsBasicConjunction(scip, cons, name, nconss, conss)
    ccall((:SCIPcreateConsBasicConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Cint, Ptr{Ptr{SCIP_CONS}}), scip, cons, name, nconss, conss)
end

function SCIPaddConsElemConjunction(scip, cons, addcons)
    ccall((:SCIPaddConsElemConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, addcons)
end
