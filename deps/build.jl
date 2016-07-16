# inspired from Gurobi's build.jl

depsfile = joinpath(dirname(@__FILE__),"deps.jl")
if isfile(depsfile)
    rm(depsfile)
end

function write_depsfile(path)
    f = open(depsfile,"w")
    println(f,"const csip = \"$path\"")
    close(f)
end

paths_to_try = ["csip"]
if haskey(ENV, "CSIP_HOME")
    @unix_only push!(paths_to_try,
                     joinpath(ENV["CSIP_HOME"], "lib", string("libcsip.so")))
end

found = false
for l in paths_to_try
    d = Libdl.dlopen_e(l)
    if d != C_NULL
        found = true
        write_depsfile(l)
        break
    end
end

if !found
    error("Unable to locate CSIP. Please set environment variable CSIP_HOME.")
end
