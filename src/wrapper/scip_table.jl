# Julia wrapper for header: /usr/include/scip/scip_table.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeTable(scip, name, desc, active::UInt32, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position::Cint, earlieststage::SCIP_STAGE)
    ccall((:SCIPincludeTable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_TABLEDATA}, Cint, SCIP_STAGE), scip, name, desc, active, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position, earlieststage)
end

function SCIPfindTable(scip, name)
    ccall((:SCIPfindTable, libscip), Ptr{SCIP_TABLE}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetTables(scip)
    ccall((:SCIPgetTables, libscip), Ptr{Ptr{SCIP_TABLE}}, (Ptr{SCIP},), scip)
end

function SCIPgetNTables(scip)
    ccall((:SCIPgetNTables, libscip), Cint, (Ptr{SCIP},), scip)
end
