import Libdl

if haskey(ENV, "SCIPOPTDIR")
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
    required = VersionNumber("6")
    upperbound = VersionNumber("8")
    if current < required || current >= upperbound
        error("SCIP is installed at version $current, " *
              "supported are $required up to (excluding) $upperbound.")
    end
end
