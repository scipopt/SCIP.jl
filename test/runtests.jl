using Base.Test
using SCIP
using MathProgBase

using JuMP
using OffsetArrays # for JuMP/test/model.jl

include("more_tests.jl")
include("mixintprog.jl")

include(joinpath(Pkg.dir("JuMP"),"test","solvers.jl"))

solver = SCIPSolver()
MathProgBase.setparameters!(solver, Silent=true, TimeLimit=300.0)
heursolver = SCIPSolver("display/verblevel", 0,
                        "presolving/maxrounds", 0,
                        "separating/maxrounds", 0,
                        "separating/maxroundsroot", 0)
lp_solvers = []
ip_solvers = [solver]
sos_solvers = [solver]
quad_solvers = []
quad_mip_solvers = [solver]
lazy_solvers = [solver]
lazy_soc_solvers = [solver]
lazylocal_solvers = []
cut_solvers = []
cutlocal_solvers = []
heur_solvers = [heursolver]
info_solvers = []
rsoc_solvers = [solver]
minlp_solvers = [solver]

# nlp_solvers fails because:
# - some dual information: fixed by deleting getconstrduals
# - some strange expressions: can be fixed by adding SCIPSolver to the excluded
#   list in "Test ifelse". This is on JuMP's side
# - numerical tolerances: I tried setting SCIP feastol to 1e-9 and still got
#   numerical issues. However, the solution is feasible for SCIP.
# nlp_solvers = [solver]

include(joinpath(Pkg.dir("JuMP"),"test","model.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","probmod.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","qcqpmodel.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","callback.jl"))
include(joinpath(Pkg.dir("JuMP"),"test","nonlinear.jl"))
# include(joinpath(Pkg.dir("JuMP"),"test","sdp.jl"))
# include(joinpath(Pkg.dir("JuMP"),"test","socduals.jl"))
