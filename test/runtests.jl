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
if length(lp_solvers) < 1
    error("Need at least one LP solver, eg, Clp")
end
lp_solvers = lp_solvers[1:1] # just need one
ip_solvers = [solver]
quad_solvers = []
quad_mip_solvers = []
#quad_mip_solvers = [solver]
lazy_solvers = [solver]
lazylocal_solvers = []
cut_solvers = []
cutlocal_solvers = []
heur_solvers = [heursolver]
info_solvers = []
include(joinpath(Pkg.dir("JuMP"),"test","model.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","probmod.jl"))
#include(joinpath(Pkg.dir("JuMP"),"test","qcqpmodel.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","callback.jl"))
#include(joinpath(Pkg.dir("JuMP"),"test","nonlinear.jl"))
#include(joinpath(Pkg.dir("JuMP"),"test","sdp.jl"))

# return proper code (e.g. for TravisCI)
FactCheck.exitstatus()
