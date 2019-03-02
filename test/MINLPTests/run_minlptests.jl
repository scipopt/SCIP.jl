using MINLPTests, JuMP, SCIP, Test

const OPTIMIZER = JuMP.with_optimizer(SCIP.Optimizer, display_verblevel=0)
const OBJTOL = 1e-4
const PRIMALTOL = 1e-3
const DUALTOL = NaN  # to disable the query

@testset "MINLPTests - nlp" begin
    @testset "nlp_005_010" begin
        MINLPTests.nlp_005_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                               termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_007_010" begin
        MINLPTests.nlp_007_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                               termination_target = MOI.INFEASIBLE,
                               primal_target = MOI.NO_SOLUTION)
    end
end

@testset "MINLPTests - nlp cvx" begin
    @testset "nlp_cvx_002_010" begin
        MINLPTests.nlp_cvx_002_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_101_010" begin
        MINLPTests.nlp_cvx_101_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_102_011" begin
        MINLPTests.nlp_cvx_102_011(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_102_012" begin
        MINLPTests.nlp_cvx_102_012(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_103_012" begin
        MINLPTests.nlp_cvx_103_012(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_103_013" begin
        MINLPTests.nlp_cvx_103_013(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_105_010" begin
        MINLPTests.nlp_cvx_105_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_105_011" begin
        MINLPTests.nlp_cvx_105_011(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_105_012" begin
        MINLPTests.nlp_cvx_105_012(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_105_013" begin
        MINLPTests.nlp_cvx_105_013(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_201_010" begin
        MINLPTests.nlp_cvx_201_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_201_011" begin
        MINLPTests.nlp_cvx_201_011(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_202_012" begin
        MINLPTests.nlp_cvx_202_012(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_202_013" begin
        MINLPTests.nlp_cvx_202_013(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_202_014" begin
        MINLPTests.nlp_cvx_202_014(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_203_010" begin
        MINLPTests.nlp_cvx_203_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_204_010" begin
        MINLPTests.nlp_cvx_204_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    # Wrong solution?!
    # @testset "nlp_cvx_206_010" begin
    #     MINLPTests.nlp_cvx_206_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
    #                                termination_target = MOI.OPTIMAL)
    # end

    @testset "nlp_cvx_501_010" begin
        MINLPTests.nlp_cvx_501_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_cvx_502_011" begin
        MINLPTests.nlp_cvx_501_011(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                                   termination_target = MOI.OPTIMAL)
    end
end
