module SCIP

import Compat

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("SCIP.jl not properly installed. Please run Pkg.build(\"SCIP\")")
end

include("../deps/csip_version.jl")

using SparseArrays: issparse, findnz

import MathProgBase.SolverInterface
import MathProgBase.SolverInterface: AbstractLinearQuadraticModel,
                                     AbstractNonlinearModel,
                                     AbstractMathProgSolver,
                                     MathProgCallbackData,
                                     AbstractNLPEvaluator,
                                     LinearQuadraticModel

include("types.jl")
include("csip_wrapper.jl")
include("scip_wrapper.jl")
include("mpb_interface.jl")
include("params.jl")

function CSIPversion()
    VersionNumber("$(_majorVersion()).$(_minorVersion()).$(_patchVersion())")
end

function __init__()
    csip_installed = CSIPversion()
    if csip_installed != csip_required
        depsdir = realpath(joinpath(dirname(@__FILE__),"..","deps"))
        error("Installed CSIP version is $(csip_installed), but we require $(csip_required). Run Pkg.build(\"SCIP\") to update.")
    end
end

end
