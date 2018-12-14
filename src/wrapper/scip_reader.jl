# Julia wrapper for header: /usr/include/scip/scip_reader.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPincludeReader(scip, name, desc, extension, readercopy, readerfree, readerread, readerwrite, readerdata)
    ccall((:SCIPincludeReader, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cstring, Cstring, Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_READERDATA}), scip, name, desc, extension, readercopy, readerfree, readerread, readerwrite, readerdata)
end

function SCIPincludeReaderBasic(scip, readerptr, name, desc, extension, readerdata)
    ccall((:SCIPincludeReaderBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_READER}}, Cstring, Cstring, Cstring, Ptr{SCIP_READERDATA}), scip, readerptr, name, desc, extension, readerdata)
end

function SCIPsetReaderCopy(scip, reader, readercopy)
    ccall((:SCIPsetReaderCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readercopy)
end

function SCIPsetReaderFree(scip, reader, readerfree)
    ccall((:SCIPsetReaderFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerfree)
end

function SCIPsetReaderRead(scip, reader, readerread)
    ccall((:SCIPsetReaderRead, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerread)
end

function SCIPsetReaderWrite(scip, reader, readerwrite)
    ccall((:SCIPsetReaderWrite, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerwrite)
end

function SCIPfindReader(scip, name)
    ccall((:SCIPfindReader, libscip), Ptr{SCIP_READER}, (Ptr{SCIP}, Cstring), scip, name)
end

function SCIPgetReaders(scip)
    ccall((:SCIPgetReaders, libscip), Ptr{Ptr{SCIP_READER}}, (Ptr{SCIP},), scip)
end

function SCIPgetNReaders(scip)
    ccall((:SCIPgetNReaders, libscip), Cint, (Ptr{SCIP},), scip)
end
