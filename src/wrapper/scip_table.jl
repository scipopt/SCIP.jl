# Julia wrapper for header: /usr/include/scip/scip_table.h
# Automatically generated using Clang.jl wrap_c


function SCIPincludeTable(scip, name, desc, active, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position, earlieststage)
    ccall((:SCIPincludeTable, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_TABLEDATA}, Cint, SCIP_STAGE), scip, name, desc, active, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position, earlieststage)
end

function SCIPfindTable(scip, name)
    ccall((:SCIPfindTable, libscip), Ptr{SCIP_TABLE}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetTables(scip)
    ccall((:SCIPgetTables, libscip), Ptr{Ptr{SCIP_TABLE}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNTables(scip)
    ccall((:SCIPgetNTables, libscip), Cint, (Ptr{SCIP_},), scip)
end
