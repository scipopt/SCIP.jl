# Julia wrapper for header: /usr/include/scip/scip_prop.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeProp(scip, name, desc, priority::Cint, freq::Cint, delay::UInt32, timingmask::SCIP_PROPTIMING, presolpriority::Cint, presolmaxrounds::Cint, presoltiming::SCIP_PRESOLTIMING, propcopy, propfree, propinit, propexit, propinitpre, propexitpre, propinitsol, propexitsol, proppresol, propexec, propresprop, propdata)
    ccall((:SCIPincludeProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, Cint, UInt32, SCIP_PROPTIMING, Cint, Cint, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PROPDATA}), scip, name, desc, priority, freq, delay, timingmask, presolpriority, presolmaxrounds, presoltiming, propcopy, propfree, propinit, propexit, propinitpre, propexitpre, propinitsol, propexitsol, proppresol, propexec, propresprop, propdata)
end

function SCIPincludePropBasic(scip, propptr, name, desc, priority::Cint, freq::Cint, delay::UInt32, timingmask::SCIP_PROPTIMING, propexec, propdata)
    ccall((:SCIPincludePropBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PROP}}, Cstring, Cstring, Cint, Cint, UInt32, SCIP_PROPTIMING, Ptr{Cvoid}, Ptr{SCIP_PROPDATA}), scip, propptr, name, desc, priority, freq, delay, timingmask, propexec, propdata)
end

function SCIPsetPropCopy(scip, prop, propcopy)
    ccall((:SCIPsetPropCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propcopy)
end

function SCIPsetPropFree(scip, prop, propfree)
    ccall((:SCIPsetPropFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propfree)
end

function SCIPsetPropInit(scip, prop, propinit)
    ccall((:SCIPsetPropInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinit)
end

function SCIPsetPropExit(scip, prop, propexit)
    ccall((:SCIPsetPropExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexit)
end

function SCIPsetPropInitsol(scip, prop, propinitsol)
    ccall((:SCIPsetPropInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinitsol)
end

function SCIPsetPropExitsol(scip, prop, propexitsol)
    ccall((:SCIPsetPropExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexitsol)
end

function SCIPsetPropInitpre(scip, prop, propinitpre)
    ccall((:SCIPsetPropInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinitpre)
end

function SCIPsetPropExitpre(scip, prop, propexitpre)
    ccall((:SCIPsetPropExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexitpre)
end

function SCIPsetPropPresol(scip, prop, proppresol, presolpriority::Cint, presolmaxrounds::Cint, presoltiming::SCIP_PRESOLTIMING)
    ccall((:SCIPsetPropPresol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}, Cint, Cint, SCIP_PRESOLTIMING), scip, prop, proppresol, presolpriority, presolmaxrounds, presoltiming)
end

function SCIPsetPropResprop(scip, prop, propresprop)
    ccall((:SCIPsetPropResprop, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propresprop)
end

function SCIPfindProp(scip, name)
    ccall((:SCIPfindProp, libscip), Ptr{SCIP_PROP}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetProps(scip)
    ccall((:SCIPgetProps, libscip), Ptr{Ptr{SCIP_PROP}}, (Ptr{SCIP},), scip)
end

function SCIPgetNProps(scip)
    ccall((:SCIPgetNProps, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetPropPriority(scip, prop, priority::Cint)
    ccall((:SCIPsetPropPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Cint), scip, prop, priority)
end

function SCIPsetPropPresolPriority(scip, prop, presolpriority::Cint)
    ccall((:SCIPsetPropPresolPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Cint), scip, prop, presolpriority)
end
