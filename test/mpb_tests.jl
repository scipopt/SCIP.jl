testdir = joinpath(dirname(pathof(MathProgBase)), "..", "test")
solver = SCIPSolver("display/verblevel", 0)

## can't test these because SCIP does not give access to dual solution
# include(joinpath(testdir, "linprog.jl"))
# linprogtest(solver)

include(joinpath(testdir, "mixintprog.jl"))
mixintprogtest(solver)

## can't use setquadobj! or get duals
include(joinpath(testdir, "quadprog.jl"))
# quadprogtest(solver)
# qpdualtest(solver)
socptest(solver)

## can't use tests based on NLP evalutors (only expr graphs)
# include(joinpath(testdir, "nlp.jl"))
# nlptest(solver)
# nlptest_nohessian(solver)
# convexnlptest(solver)
# rosenbrocktest(solver)

## can't test methods that are not implemented with SCIP.jl
# include(joinpath(testdir, "linproginterface.jl"))
# linprogsolvertest(solver)
# linprogsolvertestextra(solver)
