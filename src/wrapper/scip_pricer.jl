# Julia wrapper for header: /usr/include/scip/scip_pricer.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludePricer(scip, name, desc, priority::Cint, delay::UInt32, pricercopy, pricerfree, pricerinit, pricerexit, pricerinitsol, pricerexitsol, pricerredcost, pricerfarkas, pricerdata)
    ccall((:SCIPincludePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cint, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PRICERDATA}), scip, name, desc, priority, delay, pricercopy, pricerfree, pricerinit, pricerexit, pricerinitsol, pricerexitsol, pricerredcost, pricerfarkas, pricerdata)
end

function SCIPincludePricerBasic(scip, pricerptr, name, desc, priority::Cint, delay::UInt32, pricerredcost, pricerfarkas, pricerdata)
    ccall((:SCIPincludePricerBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PRICER}}, Cstring, Cstring, Cint, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PRICERDATA}), scip, pricerptr, name, desc, priority, delay, pricerredcost, pricerfarkas, pricerdata)
end

function SCIPsetPricerCopy(scip, pricer, pricercopy)
    ccall((:SCIPsetPricerCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricercopy)
end

function SCIPsetPricerFree(scip, pricer, pricerfree)
    ccall((:SCIPsetPricerFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerfree)
end

function SCIPsetPricerInit(scip, pricer, pricerinit)
    ccall((:SCIPsetPricerInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerinit)
end

function SCIPsetPricerExit(scip, pricer, pricerexit)
    ccall((:SCIPsetPricerExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerexit)
end

function SCIPsetPricerInitsol(scip, pricer, pricerinitsol)
    ccall((:SCIPsetPricerInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerinitsol)
end

function SCIPsetPricerExitsol(scip, pricer, pricerexitsol)
    ccall((:SCIPsetPricerExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerexitsol)
end

function SCIPfindPricer(scip, name)
    ccall((:SCIPfindPricer, libscip), Ptr{SCIP_PRICER}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetPricers(scip)
    ccall((:SCIPgetPricers, libscip), Ptr{Ptr{SCIP_PRICER}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPricers(scip)
    ccall((:SCIPgetNPricers, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNActivePricers(scip)
    ccall((:SCIPgetNActivePricers, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetPricerPriority(scip, pricer, priority::Cint)
    ccall((:SCIPsetPricerPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Cint), scip, pricer, priority)
end

function SCIPactivatePricer(scip, pricer)
    ccall((:SCIPactivatePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}), scip, pricer)
end

function SCIPdeactivatePricer(scip, pricer)
    ccall((:SCIPdeactivatePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}), scip, pricer)
end
