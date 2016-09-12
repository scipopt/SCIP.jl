using SCIP
using MathProgBase
using FactCheck

include("mixintprog.jl")

include(joinpath(Pkg.dir("JuMP"),"test","solvers.jl"))

using JuMP
solver = SCIPSolver("display/verblevel", 0)
heursolver = SCIPSolver("display/verblevel", 0,
                        "presolving/maxrounds", 0,
                        "separating/maxrounds", 0,
                        "separating/maxroundsroot", 0)
nlsolver = SCIPSolver("display/verblevel", 0)
# "numerics/feastol", 1e-7) # doesn't work, no convert from Ptr{Void} to Float64
if length(lp_solvers) < 1
    error("Need at least one LP solver, eg, Clp")
end
lp_solvers = lp_solvers[1:1] # just need one
ip_solvers = [solver]
quad_solvers = []
quad_mip_solvers = []
quad_mip_solvers = [solver]
lazy_solvers = [solver]
lazylocal_solvers = []
cut_solvers = []
cutlocal_solvers = []
heur_solvers = [heursolver]
info_solvers = []
minlp_solvers = [nlsolver]

# nlp_solvers fails becuase:
# - some dual information: fixed by deleting getconstrduals
# - some strange exprresions: can be fixed by adding SCIPSolver to the excluded
#   list in "Test ifelse". This is on JuMP's side
# - numerical tolerances: I tried setting SCIP feastol to 1e-9 and still got
#   numerical issues. However, the solution is feasible for SCIP.
#nlp_solvers = [nlsolver]

include(joinpath(Pkg.dir("JuMP"),"test","model.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","probmod.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","qcqpmodel.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","callback.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","nonlinear.jl"))
#include(joinpath(Pkg.dir("JuMP"),"test","sdp.jl"))

# return proper code (e.g. for TravisCI)
FactCheck.exitstatus()
