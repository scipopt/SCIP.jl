__precompile__()

module SCIP

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("SCIP.jl not properly installed. Please run Pkg.build(\"SCIP\")")
end

include("../deps/csip_version.jl")

importall MathProgBase.SolverInterface

include("types.jl")
include("wrapper.jl")
include("mpb_interface.jl")
include("params.jl")

function CSIPversion()
    VersionNumber("$(_majorVersion()).$(_minorVersion()).$(_patchVersion())")
end

function __init__()
    csip_installed = CSIPversion()
    if csip_installed != csip_required
        depsdir = realpath(joinpath(dirname(@__FILE__),"..","deps"))
        error("Current CSIP version installed is $(csip_installed), but we require $(csip_required). On Linux, delete the contents of the `$depsdir` directory except for `build.jl`, then rerun Pkg.build(\"SCIP\").")
    end
end

end
