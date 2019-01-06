# Julia wrapper for header: /usr/include/scip/pub_reader.h
# Automatically generated using Clang.jl wrap_c


function SCIPreaderGetData(reader)
    ccall((:SCIPreaderGetData, libscip), Ptr{SCIP_READERDATA}, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderSetData(reader, readerdata)
    ccall((:SCIPreaderSetData, libscip), Cvoid, (Ptr{SCIP_READER}, Ptr{SCIP_READERDATA}), reader, readerdata)
end

function SCIPreaderGetName(reader)
    ccall((:SCIPreaderGetName, libscip), Cstring, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderGetDesc(reader)
    ccall((:SCIPreaderGetDesc, libscip), Cstring, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderGetExtension(reader)
    ccall((:SCIPreaderGetExtension, libscip), Cstring, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderCanRead(reader)
    ccall((:SCIPreaderCanRead, libscip), UInt32, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderCanWrite(reader)
    ccall((:SCIPreaderCanWrite, libscip), UInt32, (Ptr{SCIP_READER},), reader)
end
