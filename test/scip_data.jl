# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Test memory management

@testset "create and manual free" begin
    o = SCIP.Optimizer()
    @test o.inner.scip[] != C_NULL
    SCIP.free_scip(o)
    @test o.inner.scip[] == C_NULL
end

@testset "create, add var and cons, and manual free" begin
    o = SCIP.Optimizer()
    @test o.inner.scip[] != C_NULL
    x = SCIP.add_variable(o.inner)
    y = SCIP.add_variable(o.inner)
    c = SCIP.add_linear_constraint(o.inner, [x, y], [2.0, 3.0], 1.0, 9.0)
    SCIP.free_scip(o)
    @test o.inner.scip[] == C_NULL
end

@testset "create and semi-manual free" begin
    o = SCIP.Optimizer()
    @test o.inner.scip[] != C_NULL
    finalize(o)
    @test o.inner.scip[] == C_NULL
end

@testset "create with vars and cons, and free" begin
    for i in 1:2 # run twice, with(out) solving
        o = SCIP.Optimizer()
        @test o.inner.scip[] != C_NULL
        SCIP.set_parameter(o.inner, "display/verblevel", 0)

        t = SCIP.add_variable(o.inner)
        # set lower bound for assertion in cons_soc.c
        SCIP.@SCIP_CALL SCIP.SCIPchgVarLb(o, SCIP.var(o.inner, t), 0.0)
        x = SCIP.add_variable(o.inner)
        y = SCIP.add_variable(o.inner)
        c = SCIP.add_linear_constraint(o.inner, [x, y], [2.0, 3.0], 1.0, 9.0)
        q = SCIP.add_quadratic_constraint(
            o.inner,
            [x],
            [2.0],
            [x, x],
            [x, y],
            [4.0, 5.0],
            1.0,
            9.0,
        )
        s1 = SCIP.add_special_ordered_set_type1(o.inner, [t, x], [1.0, 2.0])
        s2 = SCIP.add_special_ordered_set_type2(o.inner, [x, y], [1.0, 2.0])
        # nonlinear: x^0.2 == 1
        vi = MathOptInterface.VariableIndex(x.val)
        # n = SCIP.add_nonlinear_constraint(o.inner, :(x[$vi]^0.2 == 1.0), 1.0, 1.0)

        # indicator constraint: z = 1 ==> 𝟙^T [x, y] <= 1.
        z = SCIP.add_variable(o.inner)
        SCIP.@SCIP_CALL SCIP.SCIPchgVarType(
            o,
            SCIP.var(o.inner, z),
            SCIP.SCIP_VARTYPE_BINARY,
            Ref{SCIP.SCIP_Bool}(),
        )
        SCIP.@SCIP_CALL SCIP.SCIPchgVarLb(o, SCIP.var(o.inner, z), 0.0)
        SCIP.@SCIP_CALL SCIP.SCIPchgVarUb(o, SCIP.var(o.inner, z), 1.0)

        ic = SCIP.add_indicator_constraint(o.inner, z, [x, y], ones(2), 1.0)

        if i == 2
            # solve, but don't check results (this test is about memory mgmt)
            SCIP.@SCIP_CALL SCIP.SCIPsolve(o.inner.scip[])
        end

        finalize(o)
        for var in values(o.inner.vars)
            @test var[] == C_NULL
        end
        for cons in values(o.inner.conss)
            @test cons[] == C_NULL
        end
        @test o.inner.scip[] == C_NULL
    end
end

@testset "create vars and cons, delete some, and free" begin
    for i in 1:2 # run twice, with(out) solving
        o = SCIP.Optimizer()
        @test o.inner.scip[] != C_NULL
        SCIP.set_parameter(o.inner, "display/verblevel", 0)

        x = SCIP.add_variable(o.inner)
        y = SCIP.add_variable(o.inner)
        z = SCIP.add_variable(o.inner)
        c = SCIP.add_linear_constraint(o.inner, [x, y], [2.0, 3.0], 1.0, 9.0)
        d = SCIP.add_linear_constraint(o.inner, [x, z], [2.0, 1.0], 2.0, 8.0)

        SCIP.delete(o.inner, d)
        SCIP.delete(o.inner, z) # only occured in constraint 'd'

        if i == 2
            # solve, but don't check results (this test is about memory mgmt)
            SCIP.@SCIP_CALL SCIP.SCIPsolve(o)
        end

        finalize(o)
        for var in values(o.inner.vars)
            @test var[] == C_NULL
        end
        for cons in values(o.inner.conss)
            @test cons[] == C_NULL
        end
        @test o.inner.scip[] == C_NULL
    end
end

@testset "print statistics" begin
    o = SCIP.Optimizer()
    SCIP.set_parameter(o.inner, "display/verblevel", 0)

    x = SCIP.add_variable(o.inner)
    y = SCIP.add_variable(o.inner)
    z = SCIP.add_variable(o.inner)
    c = SCIP.add_linear_constraint(o.inner, [x, y], [2.0, 3.0], 1.0, 9.0)
    SCIP.@SCIP_CALL SCIP.SCIPsolve(o)

    @testset "$statistics_func" for statistics_func in map(
        x -> eval(:(SCIP.$x)),
        SCIP.STATISTICS_FUNCS,
    )
        mktempdir() do dir
            filename = joinpath(dir, "statistics.txt")
            @test !isfile(filename)
            open(filename; write=true) do io
                redirect_stdout(io) do
                    statistics_func(o.inner)
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
