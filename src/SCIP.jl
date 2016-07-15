module SCIP

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("SCIP.jl not properly installed. Please run Pkg.build(\"SCIP\")")
end


importall MathProgBase.SolverInterface

include("wrapper.jl")

end
