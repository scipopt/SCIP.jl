module SCIP

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("SCIP.jl not properly installed. Please run Pkg.build(\"SCIP\")")
end


importall MathProgBase.SolverInterface

include("types.jl")
include("wrapper.jl")
include("mpb_interface.jl")
include("params.jl")

function CSIPversion()
    "$(_majorVersion()).$(_minorVersion()).$(_patchVersion())"
end

function __init__()
    version = VersionNumber(CSIPversion())
    if !(version.major == 0 && version.minor == 3 && version.patch == 2)
        depsdir = realpath(joinpath(dirname(@__FILE__),"..","deps"))
        error("Current CSIP version installed is $(version), but we require version 0.3.2. On Linux, delete the contents of the `$depsdir` directory except for `build.jl`, then rerun Pkg.build(\"SCIP\").")
    end
end

end
