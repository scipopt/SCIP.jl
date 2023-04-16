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

    # create problem
    rc = SCIP.SCIPcreateProbBasic(scip_, "")
    @test rc == SCIP.SCIP_OKAY

    # add variable: x >= 0, objcoef: 1
    var__ = Ref{Ptr{SCIP.SCIP_VAR}}()
    rc = SCIP.SCIPcreateVarBasic(
        scip_,
        var__,
        "x",
        0.0,
        SCIP.SCIPinfinity(scip_),
        1.0,
        SCIP.SCIP_VARTYPE_CONTINUOUS,
    )
    @test rc == SCIP.SCIP_OKAY
    var_ = var__[]
    @test var_ != C_NULL
    rc = SCIP.SCIPaddVar(scip_, var_)
    @test rc == SCIP.SCIP_OKAY

    # add constraint: 2x >= 3   ( really: 3 <= 2 * x <= inf )
    cons__ = Ref{Ptr{SCIP.SCIP_CONS}}()
    rc = SCIP.SCIPcreateConsBasicLinear(
        scip_,
        cons__,
        "c",
        0,
        C_NULL,
        C_NULL,
        3.0,
        SCIP.SCIPinfinity(scip_),
    )
    @test rc == SCIP.SCIP_OKAY
    cons_ = cons__[]
    @test cons_ != C_NULL
    rc = SCIP.SCIPaddCoefLinear(scip_, cons_, var_, 2.0)
    @test rc == SCIP.SCIP_OKAY
    rc = SCIP.SCIPaddCons(scip_, cons_)
    @test rc == SCIP.SCIP_OKAY

    # solve problem
    rc = SCIP.SCIPsolve(scip_)
    @test rc == SCIP.SCIP_OKAY

    # check solution value
    sol_ = SCIP.SCIPgetBestSol(scip_)
    @test sol_ != C_NULL
    val = SCIP.SCIPgetSolVal(scip_, sol_, var_)
    @test val ≈ 3.0 / 2.0

    # release variables and solver
    rc = SCIP.SCIPreleaseCons(scip_, cons__)
    @test rc == SCIP.SCIP_OKAY
    rc = SCIP.SCIPreleaseVar(scip_, var__)
    @test rc == SCIP.SCIP_OKAY
    rc = SCIP.SCIPfree(scip__)
    @test rc == SCIP.SCIP_OKAY
end

@testset "SCIP_CALL macro (@SCIP_CALL)" begin
    # should do nothing
    SCIP.@SCIP_CALL SCIP.SCIP_OKAY

    @test_throws ErrorException SCIP.@SCIP_CALL SCIP.SCIP_ERROR

    f() = SCIP.SCIP_OKAY
    g(args...) = SCIP.SCIP_ERROR
    SCIP.@SCIP_CALL f()
    h() = SCIP.@SCIP_CALL(g(1, 2))
    @test_throws ErrorException("g() yielded SCIP code SCIP_ERROR") SCIP.@SCIP_CALL g()
    @test_throws ErrorException("g(1, 2) yielded SCIP code SCIP_ERROR") h()
end
