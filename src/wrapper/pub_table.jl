# Julia wrapper for header: /usr/include/scip/pub_table.h
# Automatically generated using Clang.jl wrap_c


function SCIPtableGetData(table)
    ccall((:SCIPtableGetData, libscip), Ptr{SCIP_TABLEDATA}, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableSetData(table, tabledata)
    ccall((:SCIPtableSetData, libscip), Cvoid, (Ptr{SCIP_TABLE}, Ptr{SCIP_TABLEDATA}), table, tabledata)
end

function SCIPtableGetName(table)
    ccall((:SCIPtableGetName, libscip), Cstring, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetDesc(table)
    ccall((:SCIPtableGetDesc, libscip), Cstring, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetPosition(table)
    ccall((:SCIPtableGetPosition, libscip), Cint, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetEarliestStage(table)
    ccall((:SCIPtableGetEarliestStage, libscip), SCIP_STAGE, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableIsActive(table)
    ccall((:SCIPtableIsActive, libscip), UInt32, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableIsInitialized(table)
    ccall((:SCIPtableIsInitialized, libscip), UInt32, (Ptr{SCIP_TABLE},), table)
end
