import Libdl

if VERSION < v"1.3" || haskey(ENV, "SCIPOPTDIR")
    # User-provided SCIP library
    const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
    if !isfile(depsjl_path)
        error("SCIP was not built properly, please run Pkg.build(\"SCIP\")")
    end
    include(depsjl_path)
else
    # Artifact from BinaryBuilder package
    using SCIP_jll: libscip
end

function __init__()
    major = SCIPmajorVersion()
    minor = SCIPminorVersion()
    patch = SCIPtechVersion()
    current = VersionNumber("$major.$minor.$patch")
    required = VersionNumber("6.0.0")
    upperbound = VersionNumber("7.0.1")
    if current < required || current > upperbound
        error("SCIP is installed at version $current, " *
              "supported are $required up to (including) $upperbound.")
    end
end
