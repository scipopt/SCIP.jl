using Test
using SCIP
using MathProgBase

using JuMP
using OffsetArrays # for JuMP/test/model.jl

include("more_tests.jl")
include("mixintprog.jl")

joinpath(dirname(pathof(JuMP)),"test","solvers.jl")

const solver = SCIPSolver()
MathProgBase.setparameters!(solver, Silent=true, TimeLimit=300.0)
const heursolver = SCIPSolver("display/verblevel", 0,
                        "presolving/maxrounds", 0,
                        "separating/maxrounds", 0,
                        "separating/maxroundsroot", 0)
lp_solvers = []
ip_solvers = [solver]
sos_solvers = [solver]
quad_solvers = []
semi_solvers = []
quad_mip_solvers = []
lazy_solvers = [solver]
lazy_soc_solvers = [solver]
lazylocal_solvers = []
cut_solvers = []
cutlocal_solvers = []
heur_solvers = [heursolver]
info_solvers = []
rsoc_solvers = [solver]
minlp_solvers = [solver]
ip_dual_solvers = [solver]
soc_solvers = [solver]
nlp_solvers = []

# nlp_solvers fails because:
# - some dual information: fixed by deleting getconstrduals
# - some strange expressions: can be fixed by adding SCIPSolver to the excluded
#   list in "Test ifelse". This is on JuMP's side
# - numerical tolerances: I tried setting SCIP feastol to 1e-9 and still got
#   numerical issues. However, the solution is feasible for SCIP.
# nlp_solvers = [solver]

joinpath(dirname(pathof(JuMP)),"test","model.jl")
joinpath(dirname(pathof(JuMP)),"test","probmod.jl")
joinpath(dirname(pathof(JuMP)),"test","qcqpmodel.jl")
joinpath(dirname(pathof(JuMP)),"test","callback.jl")
joinpath(dirname(pathof(JuMP)),"test","nonlinear.jl")
joinpath(dirname(pathof(JuMP)),"test","solvers.jl")
