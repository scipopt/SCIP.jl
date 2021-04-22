# Test memory management

using MathOptInterface

@testset "create and manual free" begin
    mscip = SCIP.Optimizer()
    @test mscip.inner.scip[] != C_NULL
    SCIP.free_scip(mscip.inner)
    @test mscip.inner.scip[] == C_NULL
end

@testset "create and semi-manual free" begin
    mscip = SCIP.Optimizer()
    @test mscip.inner.scip[] != C_NULL
    finalize(mscip)
    @test mscip.inner.scip[] == C_NULL
end

@testset "create with vars and cons, and free" begin
    for i=1:2 # run twice, with(out) solving
        mscip = SCIP.Optimizer()
        @test mscip.inner.scip[] != C_NULL
        SCIP.set_parameter(mscip.inner, "display/verblevel", 0)

        t = SCIP.add_variable(mscip)
        # set lower bound for assertion in cons_soc.c
        SCIP.@SCIP_CALL SCIP.SCIPchgVarLb(mscip, SCIP.var(mscip, t), 0.0)
        x = SCIP.add_variable(mscip)
        y = SCIP.add_variable(mscip)
        c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
        q = SCIP.add_quadratic_constraint(mscip, [x], [2.0], [x, x], [x, y], [4.0, 5.0], 1.0, 9.0)
        s = SCIP.add_second_order_cone_constraint(mscip, [t, x, y])
        s1 = SCIP.add_special_ordered_set_type1(mscip, [t, x], [1.0, 2.0])
        s2 = SCIP.add_special_ordered_set_type2(mscip, [x, y], [1.0, 2.0])
        # abspower:  y == sign(x) * |x|^2 ( == x * |x| )
        a = SCIP.add_abspower_constraint(mscip, x, 0.0, 2.0, y, -1.0, 0.0, 0.0)
        # nonlinear: x^0.2 == 1
        vi = MathOptInterface.VariableIndex(x.val)
        n = SCIP.add_nonlinear_constraint(mscip, :(x[$vi]^0.2 == 1.0), 1.0, 1.0)

        # indicator constraint: z = 1 ==> 𝟙^T [x, y] <= 1.
        z = SCIP.add_variable(mscip)
        SCIP.@SCIP_CALL SCIP.SCIPchgVarType(mscip, SCIP.var(mscip, z), SCIP.SCIP_VARTYPE_BINARY, Ref{SCIP.SCIP_Bool}())
        SCIP.@SCIP_CALL SCIP.SCIPchgVarLb(mscip, SCIP.var(mscip, z), 0.0)
        SCIP.@SCIP_CALL SCIP.SCIPchgVarUb(mscip, SCIP.var(mscip, z), 1.0)

        ic = SCIP.add_indicator_constraint(mscip, z, [x, y], ones(2), 1.)

        if i==2
            # solve, but don't check results (this test is about memory mgmt)
            SCIP.@SCIP_CALL SCIP.SCIPsolve(mscip.scip[])
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
        mscip = SCIP.Optimizer()
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
            SCIP.@SCIP_CALL SCIP.SCIPsolve(mscip)
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

@testset "print statistics" begin
    mscip = SCIP.Optimizer()
    SCIP.set_parameter(mscip, "display/verblevel", 0)

    x = SCIP.add_variable(mscip)
    y = SCIP.add_variable(mscip)
    z = SCIP.add_variable(mscip)
    c = SCIP.add_linear_constraint(mscip, [x, y], [2.0, 3.0], 1.0, 9.0)
    SCIP.@SCIP_CALL SCIP.SCIPsolve(mscip)

    @testset "$statistics_func" for statistics_func in map(x -> eval(:(SCIP.$x)), SCIP.STATISTICS_FUNCS)
        mktempdir() do dir
            filename = joinpath(dir, "statistics.txt")
            @test !isfile(filename)
            open(filename, write=true) do io
                redirect_stdout(io) do
                    statistics_func(mscip)
                end
            end
            @test isfile(filename)
            if statistics_func == SCIP.print_statistics
                # Ensure that at least `print_statistics` produces output
                # (Not all statistics functions do for this simple model.)
                @test filesize(filename) > 0
            end
        end
    end
end
