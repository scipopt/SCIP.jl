module SCIP

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
    if current < required
        error("SCIP is installed at version $current, need $required or newer.")
    end
end

# wrapper of SCIP library
include("wrapper.jl")

# implementation of MOI
include("MOI_wrapper.jl")

end
