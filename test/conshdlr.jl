# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

@testset "dummy conshdlr (always satisfied, no constraint)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)
    SCIP.set_parameter(o.inner, "display/verblevel", 0)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=false,
    )

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 0
    @test ch.lock_called == 1

    # free the problem
    finalize(o)
end

@testset "dummy conshdlr (always satisfied, with constraint)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=true,
    )

    # add dummy constraint
    cr = SCIP.add_constraint(o.inner, ch, Dummy.DummyCons())

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 0
    @test ch.lock_called == 1

    # free the problem
    finalize(o)
end

@testset "dummy conshdlr (always satisfied, no constraint, but needs it)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)

    # add the constraint handler
    ch = Dummy.DummyConsHdlr()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=true,
    )

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called == 0
    @test ch.enfo_called == 0
    @test ch.lock_called == 0

    # free the problem
    finalize(o)
end

@testset "never satisfied conshdlr (does not need constraint)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=false,
    )

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called in 0:1 # depends on SCIP presolver behavior
    @test ch.lock_called == 1

    # free the problem
    finalize(o)
end

@testset "never satisfied conshdlr (needs constraint but does not have it)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=true,
    )

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called == 0
    @test ch.enfo_called == 0
    @test ch.lock_called == 0

    # free the problem
    finalize(o)
end

@testset "never satisfied conshdlr (needs constraint and has one)" begin
    # create an empty problem
    o = SCIP.Optimizer()
    MOI.set(o, MOI.Silent(), true)

    # add the constraint handler
    ch = NeverSatisfied.NSCH()
    SCIP.include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        needs_constraints=true,
    )

    # add one constraint
    cr = SCIP.add_constraint(o.inner, ch, NeverSatisfied.Cons())

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])

    @test ch.check_called >= 1
    @test ch.enfo_called == 1
    @test ch.lock_called == 1

    # free the problem
    finalize(o)
end
