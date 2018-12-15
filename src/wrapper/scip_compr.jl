# Julia wrapper for header: /usr/include/scip/scip_compr.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeCompr(scip, name, desc, priority, minnnodes, comprcopy, comprfree, comprinit, comprexit, comprinitsol, comprexitsol, comprexec, comprdata)
    ccall((:SCIPincludeCompr, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_COMPRDATA}), scip, name, desc, priority, minnnodes, comprcopy, comprfree, comprinit, comprexit, comprinitsol, comprexitsol, comprexec, comprdata)
end

function SCIPincludeComprBasic(scip, compr, name, desc, priority, minnnodes, comprexec, comprdata)
    ccall((:SCIPincludeComprBasic, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_COMPR}}, Cstring, Cstring, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_COMPRDATA}), scip, compr, name, desc, priority, minnnodes, comprexec, comprdata)
end

function SCIPsetComprCopy(scip, compr, comprcopy)
    ccall((:SCIPsetComprCopy, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprcopy)
end

function SCIPsetComprFree(scip, compr, comprfree)
    ccall((:SCIPsetComprFree, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprfree)
end

function SCIPsetComprInit(scip, compr, comprinit)
    ccall((:SCIPsetComprInit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprinit)
end

function SCIPsetComprExit(scip, compr, comprexit)
    ccall((:SCIPsetComprExit, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprexit)
end

function SCIPsetComprInitsol(scip, compr, comprinitsol)
    ccall((:SCIPsetComprInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprinitsol)
end

function SCIPsetComprExitsol(scip, compr, comprexitsol)
    ccall((:SCIPsetComprExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprexitsol)
end

function SCIPfindCompr(scip, name)
    ccall((:SCIPfindCompr, libscip), Ptr{SCIP_COMPR}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetComprs(scip)
    ccall((:SCIPgetComprs, libscip), Ptr{Ptr{SCIP_COMPR}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNCompr(scip)
    ccall((:SCIPgetNCompr, libscip), Cint, (Ptr{SCIP_},), scip)
end

function SCIPsetComprPriority(scip, compr, priority)
    ccall((:SCIPsetComprPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_COMPR}, Cint), scip, compr, priority)
end
