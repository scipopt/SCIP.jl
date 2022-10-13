using Libdl

if VERSION >= v"1.3" && !haskey(ENV, "SCIPOPTDIR") && !Sys.iswindows()
    # Skip build in favor of SCIP_jll
    exit()
end
if Sys.iswindows()
    @warn("SCIP_jll still doesn't work with windows, segfaults are likely!")
end

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
    "libscip.dll"
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
tried = String[]
for l in paths_to_try
    try
        d = Libdl.dlopen(l)
        global found = true
        write_depsfile(l)
        break
    catch e
        push!(tried, "$(l): $(e.msg)")
    end
end

if !found && !haskey(ENV, "SCIP_JL_SKIP_LIB_CHECK")
    error("""
Unable to locate SCIP installation. Tried:

$(join(tried, "\n\n"))

Note that this must be downloaded separately from https://scipopt.org.
Please set the environment variable SCIPOPTDIR to SCIP's installation path.
""")
end
