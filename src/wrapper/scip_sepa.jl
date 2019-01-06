# Julia wrapper for header: /usr/include/scip/scip_sepa.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeSepa(scip, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepacopy, sepafree, sepainit, sepaexit, sepainitsol, sepaexitsol, sepaexeclp, sepaexecsol, sepadata)
    ccall((:SCIPincludeSepa, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cint, Cint, Cdouble, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_SEPADATA}), scip, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepacopy, sepafree, sepainit, sepaexit, sepainitsol, sepaexitsol, sepaexeclp, sepaexecsol, sepadata)
end

function SCIPincludeSepaBasic(scip, sepa, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepaexeclp, sepaexecsol, sepadata)
    ccall((:SCIPincludeSepaBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_SEPA}}, Cstring, Cstring, Cint, Cint, Cdouble, UInt32, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_SEPADATA}), scip, sepa, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepaexeclp, sepaexecsol, sepadata)
end

function SCIPsetSepaCopy(scip, sepa, sepacopy)
    ccall((:SCIPsetSepaCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepacopy)
end

function SCIPsetSepaFree(scip, sepa, sepafree)
    ccall((:SCIPsetSepaFree, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepafree)
end

function SCIPsetSepaInit(scip, sepa, sepainit)
    ccall((:SCIPsetSepaInit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepainit)
end

function SCIPsetSepaExit(scip, sepa, sepaexit)
    ccall((:SCIPsetSepaExit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepaexit)
end

function SCIPsetSepaInitsol(scip, sepa, sepainitsol)
    ccall((:SCIPsetSepaInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepainitsol)
end

function SCIPsetSepaExitsol(scip, sepa, sepaexitsol)
    ccall((:SCIPsetSepaExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepaexitsol)
end

function SCIPfindSepa(scip, name)
    ccall((:SCIPfindSepa, libscip), Ptr{SCIP_SEPA}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetSepas(scip)
    ccall((:SCIPgetSepas, libscip), Ptr{Ptr{SCIP_SEPA}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNSepas(scip)
    ccall((:SCIPgetNSepas, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetSepaPriority(scip, sepa, priority)
    ccall((:SCIPsetSepaPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Cint), scip, sepa, priority)
end

function SCIPgetSepaMinEfficacy(scip)
    ccall((:SCIPgetSepaMinEfficacy, libscip), Cdouble, (Ptr{SCIP_},), scip)
end
