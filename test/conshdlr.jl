@testset "dummy conshdlr" begin
    # Add counters for each callback:
    name_called = 0
    check_called = 0
    enfo_called = 0
    lock_called = 0

    # Define a minimal no-op constraint handler.
    # Needs to be mutable for `pointer_from_objref` to work.
    mutable struct DummyConsHdlr <: SCIP.AbstractConstraintHandler end

    # Implement only the fundamental callbacks:
    function SCIP.get(::DummyConsHdlr, ::SCIP.Name)
        name_called += 1
        return "Dummy"
    end

    function SCIP.check(ch::DummyConsHdlr, constraints)
        check_called += 1
        return SCIP.SCIP_FEASIBLE
    end

    function SCIP.enforce_lp_sol(ch::DummyConsHdlr, constraints, solinfeasible)
        enfo_called += 1
        return SCIP.SCIP_FEASIBLE
    end

    function SCIP.enforce_pseudo_sol(ch::DummyConsHdlr, constraints,
                                     solinfeasible, objinfeasible)
        enfo_called += 1
        return SCIP.SCIP_FEASIBLE
    end

    function SCIP.lock(ch::DummyConsHdlr, constraint,
                       locktype, nlockspos, nlocksneg)
        lock_called += 1
    end

    # Helpers to create constraints
    mutable struct DummyCons <: SCIP.AbstractConstraint{DummyConsHdlr} end

    # create an empty problem
    mscip = SCIP.ManagedSCIP()
    SCIP.set_parameter(mscip, "display/verblevel", 0)

    # add the constraint handler
    ch = DummyConsHdlr()
    SCIP.include_conshdlr(mscip, ch)

    # add dummy constraint
    cr = SCIP.add_constraint(mscip, ch, DummyCons())

    # solve the problem
    SCIP.@SC SCIP.SCIPsolve(mscip.scip[])

    @test name_called >= 1
    @test check_called >= 1
    @test enfo_called >= 0
    @test lock_called >= 1

    # free the problem
    finalize(mscip)

    for var in values(mscip.vars)
        @test var[] == C_NULL
    end
    for cons in values(mscip.conss)
        @test cons[] == C_NULL
    end
    @test mscip.scip[] == C_NULL
end
