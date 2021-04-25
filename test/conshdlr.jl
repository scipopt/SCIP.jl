@testset "dummy conshdlr (always satisfied, no constraint)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=false)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 0
    @test ch.lock_called == 1

    # free the problem
    finalize(scipd)
end

@testset "dummy conshdlr (always satisfied, with constraint)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=true)

    # add dummy constraint
    cr = SCIP.add_constraint(scipd, ch, Dummy.DummyCons())

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 0
    @test ch.lock_called == 1

    # free the problem
    finalize(scipd)
end

@testset "dummy conshdlr (always satisfied, no constraint, but needs it)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=true)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called == 0
    @test ch.enfo_called == 0
    @test ch.lock_called == 0

    # free the problem
    finalize(scipd)
end

@testset "never satisfied conshdlr (does not need constraint)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=false)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 1
    @test ch.lock_called == 1

    # free the problem
    finalize(scipd)
end

@testset "never satisfied conshdlr (needs constraint but does not have it)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=true)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called == 0
    @test ch.enfo_called == 0
    @test ch.lock_called == 0

    # free the problem
    finalize(scipd)
end

@testset "never satisfied conshdlr (needs constraint and has one)" begin
    # create an empty problem
    scipd = SCIP.SCIPData()
    SCIP.set_parameter(scipd, "display/verblevel", 0)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(scipd, ch; needs_constraints=true)

    # add one constraint
    cr = SCIP.add_constraint(scipd, ch, NeverSatisfied.Cons())

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(scipd.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 1
    @test ch.lock_called == 1

    # free the problem
    finalize(scipd)
end
