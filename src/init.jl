import Libdl
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("SCIP was not built properly, please run Pkg.build(\"SCIP\")")
end
include(depsjl_path)

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
