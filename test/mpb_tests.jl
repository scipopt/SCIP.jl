testdir = joinpath(dirname(pathof(MathProgBase)), "..", "test")
solver = SCIPSolver("display/verblevel", 0)

## can't test these because SCIP does not give access to dual solution
# include(joinpath(testdir, "linprog.jl"))
# linprogtest(solver)

include(joinpath(testdir, "mixintprog.jl"))
mixintprogtest(solver)

include(joinpath(testdir, "quadprog.jl"))
quadprogtest(solver)
qpdualtest(solver)
socptest(solver)

include(joinpath(testdir, "nlp.jl"))
nlptest(solver)
nlptest_nohessian(solver)
convexnlptest(solver)
rosenbrocktest(solver)

include(joinpath(testdir, "linproginterface.jl"))
linprogsolvertest(solver)
linprogsolvertestextra(solver)
