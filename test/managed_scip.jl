# Test memory management

@testset "create and manual free" begin
    mscip = SCIP.ManagedSCIP()
    @test mscip.scip[] != C_NULL
    SCIP.free_scip(mscip)
    @test mscip.scip[] == C_NULL
end

@testset "create and semi-manual free" begin
    mscip = SCIP.ManagedSCIP()
    @test mscip.scip[] != C_NULL
    finalize(mscip)
    @test mscip.scip[] == C_NULL
end

@testset "create with vars and cons, (no solve), and free" begin
    mscip = SCIP.ManagedSCIP()
    @test mscip.scip[] != C_NULL

    x = SCIP.add_variable(mscip)
    y = SCIP.add_variable(mscip)
    c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
    q = SCIP.add_quadratic_constraint(mscip, [x], [2.0], [x, x], [x, y], [4.0, 5.0], 1.0, 9.0)

    finalize(mscip)
    for var in mscip.vars
        @test var[] == C_NULL
    end
    for cons in mscip.conss
        @test cons[] == C_NULL
    end
    @test mscip.scip[] == C_NULL
end

@testset "create with vars and cons, (no solve), and free" begin
    mscip = SCIP.ManagedSCIP()
    @test mscip.scip[] != C_NULL

    SCIP.set_parameter(mscip, "display/verblevel", 0)

    x = SCIP.add_variable(mscip)
    y = SCIP.add_variable(mscip)
    c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
    q = SCIP.add_quadratic_constraint(mscip, [x], [2.0], [x, x], [x, y], [4.0, 5.0], 1.0, 9.0)

    # solve, but don't check results (this test is about memory mgmt)
    SCIP.@SC SCIP.SCIPsolve(mscip.scip[])

    finalize(mscip)
    for var in mscip.vars
        @test var[] == C_NULL
    end
    for cons in mscip.conss
        @test cons[] == C_NULL
    end
    @test mscip.scip[] == C_NULL
end
