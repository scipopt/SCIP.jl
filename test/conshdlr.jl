@testset "dummy conshdlr" begin
    # create an empty problem
    mscip = SCIP.ManagedSCIP()
    SCIP.set_parameter(mscip, "display/verblevel", 0)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(mscip, ch)

    # add dummy constraint
    cr = SCIP.add_constraint(mscip, ch, Dummy.DummyCons())

    # solve the problem
    SCIP.@SC SCIP.SCIPsolve(mscip.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called >= 0
    @test ch.lock_called >= 1

    # free the problem
    finalize(mscip)
end
