# Julia wrapper for header: /usr/include/scip/cons_linking.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeConshdlrLinking(scip)
    ccall((:SCIPincludeConshdlrLinking, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPcreateConsLinking(scip, cons, name, intvar, binvars, vals, nbinvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLinking, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32), scip, cons, name, intvar, binvars, vals, nbinvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLinking(scip, cons, name, intvar, binvars, vals, nbinvars)
    ccall((:SCIPcreateConsBasicLinking, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CONS}}, Cstring, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint), scip, cons, name, intvar, binvars, vals, nbinvars)
end

function SCIPexistsConsLinking(scip, intvar)
    ccall((:SCIPexistsConsLinking, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_VAR}), scip, intvar)
end

function SCIPgetConsLinking(scip, intvar)
    ccall((:SCIPgetConsLinking, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_}, Ptr{SCIP_VAR}), scip, intvar)
end

function SCIPgetIntvarLinking(scip, cons)
    ccall((:SCIPgetIntvarLinking, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBinvarsLinking(scip, cons, binvars, nbinvars)
    ccall((:SCIPgetBinvarsLinking, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONS}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}), scip, cons, binvars, nbinvars)
end

function SCIPgetNBinvarsLinking(scip, cons)
    ccall((:SCIPgetNBinvarsLinking, libscip), Cint, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetValsLinking(scip, cons)
    ccall((:SCIPgetValsLinking, libscip), Ptr{Cint}, (Ptr{SCIP_}, Ptr{SCIP_CONS}), scip, cons)
end
