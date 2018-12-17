# Test raw wrapper with direct library calls

@testset "create small problem and solve" begin
    scip__ = Ref{Ptr{SCIP.SCIP_}}() # SCIP**
    rc = SCIP.SCIPcreate(scip__)
    @test rc == SCIP.SCIP_OKAY

    scip_ = scip__[] # dereference to SCIP*
    @test scip_ != C_NULL

    rc = SCIP.SCIPincludeDefaultPlugins(scip_)
    @test rc == SCIP.SCIP_OKAY

    # disable output
    rc = SCIP.SCIPsetIntParam(scip_, "display/verblevel", 0)
    @test rc == SCIP.SCIP_OKAY

    rc = SCIP.SCIPcreateProbBasic(scip_, "")
    @test rc == SCIP.SCIP_OKAY

    # add variable: x >= 3, objcoef: 1
    var__ = Ref{Ptr{SCIP.SCIP_VAR}}()
    rc = SCIP.SCIPcreateVarBasic(scip_, var__, "x",
                                 3.0, SCIP.SCIPinfinity(scip_),
                                 1.0, SCIP.SCIP_VARTYPE_CONTINUOUS)
    @test rc == SCIP.SCIP_OKAY
    var_ = var__[]
    @test var_ != C_NULL
    rc = SCIP.SCIPaddVar(scip_, var_)
    @test rc == SCIP.SCIP_OKAY

    rc = SCIP.SCIPsolve(scip_)
    @test rc == SCIP.SCIP_OKAY

    # check solution value
    sol_ = SCIP.SCIPgetBestSol(scip_)
    @test sol_ != C_NULL
    val = SCIP.SCIPgetSolVal(scip_, sol_, var_)
    @test val ≈ 3.0

    # release variables and solver
    rc = SCIP.SCIPreleaseVar(scip_, var__)
    @test rc == SCIP.SCIP_OKAY
    rc = SCIP.SCIPfree(scip__)
    @test rc == SCIP.SCIP_OKAY
end
