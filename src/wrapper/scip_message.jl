# Julia wrapper for header: /usr/include/scip/scip_message.h
# Automatically generated using Clang.jl wrap_c


function SCIPsetMessagehdlr(scip, messagehdlr)
    ccall((:SCIPsetMessagehdlr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_MESSAGEHDLR}), scip, messagehdlr)
end

function SCIPgetMessagehdlr(scip)
    ccall((:SCIPgetMessagehdlr, libscip), Ptr{SCIP_MESSAGEHDLR}, (Ptr{SCIP_},), scip)
end

function SCIPsetMessagehdlrLogfile(scip, filename)
    ccall((:SCIPsetMessagehdlrLogfile, libscip), Cvoid, (Ptr{SCIP_}, Cstring), scip, filename)
end

function SCIPsetMessagehdlrQuiet(scip, quiet)
    ccall((:SCIPsetMessagehdlrQuiet, libscip), Cvoid, (Ptr{SCIP_}, UInt32), scip, quiet)
end

function SCIPgetVerbLevel(scip)
    ccall((:SCIPgetVerbLevel, libscip), SCIP_VERBLEVEL, (Ptr{SCIP_},), scip)
end
