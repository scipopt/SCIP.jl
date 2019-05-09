using Libdl

depsfile = joinpath(dirname(@__FILE__), "deps.jl")
if isfile(depsfile)
    rm(depsfile)
end

function write_depsfile(path)
    open(depsfile, "w") do f
        print(f, "const libscip = ")
        show(f, path)
        println(f)
    end
end

libname = if Sys.islinux()
    "libscip.so"
elseif Sys.isapple()
    "libscip.dylib"
elseif Sys.iswindows()
    "scip.dll"
else
    error("SCIP is currently not supported on \"$(Sys.KERNEL)\"")
end

paths_to_try = []

# prefer environment variable
if haskey(ENV, "SCIPOPTDIR")
    push!(paths_to_try, joinpath(ENV["SCIPOPTDIR"], "bin", libname))
    push!(paths_to_try, joinpath(ENV["SCIPOPTDIR"], "lib", libname))
end

# but also try library path
push!(paths_to_try, libname)

found = false
for l in paths_to_try
    d = Libdl.dlopen_e(l)
    if d != C_NULL
        global found = true
        write_depsfile(l)
        break
    end
end

if !found && !haskey(ENV, "SCIP_JL_SKIP_LIB_CHECK")
    error("""
Unable to locate SCIP installation.
Tried:\n\t$(join(paths_to_try, "\n\t"))
Note that this must be downloaded separately from scip.zib.de.
Please set the environment variable SCIPOPTDIR to SCIP's installation path.
""")
end
