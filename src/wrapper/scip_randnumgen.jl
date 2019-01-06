# Julia wrapper for header: /usr/include/scip/scip_randnumgen.h
# Automatically generated using Clang.jl wrap_c


function SCIPcreateRandom(scip, randnumgen, initialseed, useglobalseed)
    ccall((:SCIPcreateRandom, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_RANDNUMGEN}}, UInt32, UInt32), scip, randnumgen, initialseed, useglobalseed)
end

function SCIPfreeRandom(scip, randnumgen)
    ccall((:SCIPfreeRandom, libscip), Cvoid, (Ptr{SCIP_}, Ptr{Ptr{SCIP_RANDNUMGEN}}), scip, randnumgen)
end

function SCIPsetRandomSeed(scip, randnumgen, seed)
    ccall((:SCIPsetRandomSeed, libscip), Cvoid, (Ptr{SCIP_}, Ptr{SCIP_RANDNUMGEN}, UInt32), scip, randnumgen, seed)
end

function SCIPinitializeRandomSeed(scip, initialseedvalue)
    ccall((:SCIPinitializeRandomSeed, libscip), UInt32, (Ptr{SCIP_}, UInt32), scip, initialseedvalue)
end
