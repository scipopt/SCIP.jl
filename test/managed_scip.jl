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

@testset "create with vars and cons, and free" begin
    for i=1:2 # run twice, with(out) solving
        mscip = SCIP.ManagedSCIP()
        @test mscip.scip[] != C_NULL
        SCIP.set_parameter(mscip, "display/verblevel", 0)

        t = SCIP.add_variable(mscip)
        # set lower bound for assertion in cons_soc.c
        SCIP.@SC SCIP.SCIPchgVarLb(SCIP.scip(mscip), SCIP.var(mscip, t), 0.0)
        x = SCIP.add_variable(mscip)
        y = SCIP.add_variable(mscip)
        c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
        q = SCIP.add_quadratic_constraint(mscip, [x], [2.0], [x, x], [x, y], [4.0, 5.0], 1.0, 9.0)
        s = SCIP.add_second_order_cone_constraint(mscip, [t, x, y])
        s1 = SCIP.add_special_ordered_set_type1(mscip, [t, x], [1.0, 2.0])
        s2 = SCIP.add_special_ordered_set_type2(mscip, [x, y], [1.0, 2.0])
        # abspower:  y == sign(x) * |x|^2 ( == x * |x| )
        a = SCIP.add_abspower_constraint(mscip, x, 0.0, 2.0, y, -1.0, 0.0, 0.0)

        if i==2
            # solve, but don't check results (this test is about memory mgmt)
            SCIP.@SC SCIP.SCIPsolve(mscip.scip[])
        end

        finalize(mscip)
        for var in values(mscip.vars)
            @test var[] == C_NULL
        end
        for cons in values(mscip.conss)
            @test cons[] == C_NULL
        end
        @test mscip.scip[] == C_NULL
    end
end

@testset "create vars and cons, delete some, and free" begin
    for i=1:2 # run twice, with(out) solving
        mscip = SCIP.ManagedSCIP()
        @test mscip.scip[] != C_NULL
        SCIP.set_parameter(mscip, "display/verblevel", 0)

        x = SCIP.add_variable(mscip)
        y = SCIP.add_variable(mscip)
        z = SCIP.add_variable(mscip)
        c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
        d = SCIP.add_linear_constraint(mscip, [x, z], [2.0, 1.0], 2.0, 8.0)

        SCIP.delete(mscip, d)
        SCIP.delete(mscip, z) # only occured in constraint 'd'

        if i==2
            # solve, but don't check results (this test is about memory mgmt)
            SCIP.@SC SCIP.SCIPsolve(mscip.scip[])
        end

        finalize(mscip)
        for var in values(mscip.vars)
            @test var[] == C_NULL
        end
        for cons in values(mscip.conss)
            @test cons[] == C_NULL
        end
        @test mscip.scip[] == C_NULL
    end
end
