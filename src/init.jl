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
    import SCIP_PaPILO_jll
    if SCIP_PaPILO_jll.is_available()
        using SCIP_PaPILO_jll: libscip
    else
        using SCIP_jll: libscip
    end
end

function __init__()
    major = SCIPmajorVersion()
    minor = SCIPminorVersion()
    patch = SCIPtechVersion()
    current = VersionNumber("$major.$minor.$patch")
    required = VersionNumber("8")
    upperbound = VersionNumber("9")
    if current < required || current >= upperbound
        error("SCIP is installed at version $current, " *
              "supported are $required up to (excluding) $upperbound.")
    end
end
