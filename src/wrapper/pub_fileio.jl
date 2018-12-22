# Julia wrapper for header: /usr/include/scip/pub_fileio.h
# Automatically generated using Clang.jl wrap_c


function SCIPfopen(path, mode)
    ccall((:SCIPfopen, libscip), Ptr{SCIP_FILE}, (Cstring, Cstring), path, mode)
end

function SCIPfdopen(fildes, mode)
    ccall((:SCIPfdopen, libscip), Ptr{SCIP_FILE}, (Cint, Cstring), fildes, mode)
end

function SCIPfread(ptr, size, nmemb, stream)
    ccall((:SCIPfread, libscip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{SCIP_FILE}), ptr, size, nmemb, stream)
end

function SCIPfwrite(ptr, size, nmemb, stream)
    ccall((:SCIPfwrite, libscip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{SCIP_FILE}), ptr, size, nmemb, stream)
end

function SCIPfputc(c, stream)
    ccall((:SCIPfputc, libscip), Cint, (Cint, Ptr{SCIP_FILE}), c, stream)
end

function SCIPfputs(s, stream)
    ccall((:SCIPfputs, libscip), Cint, (Cstring, Ptr{SCIP_FILE}), s, stream)
end

function SCIPfgetc(stream)
    ccall((:SCIPfgetc, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfgets(s, size, stream)
    ccall((:SCIPfgets, libscip), Cstring, (Cstring, Cint, Ptr{SCIP_FILE}), s, size, stream)
end

function SCIPfflush(stream)
    ccall((:SCIPfflush, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfseek(stream, offset, whence)
    ccall((:SCIPfseek, libscip), Cint, (Ptr{SCIP_FILE}, Clong, Cint), stream, offset, whence)
end

function SCIPrewind(stream)
    ccall((:SCIPrewind, libscip), Cvoid, (Ptr{SCIP_FILE},), stream)
end

function SCIPftell(stream)
    ccall((:SCIPftell, libscip), Clong, (Ptr{SCIP_FILE},), stream)
end

function SCIPfeof(stream)
    ccall((:SCIPfeof, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfclose(fp)
    ccall((:SCIPfclose, libscip), Cint, (Ptr{SCIP_FILE},), fp)
end
