using MINLPTests, JuMP, SCIP, Test

const OPTIMIZER = JuMP.with_optimizer(SCIP.Optimizer, display_verblevel=0)
const OBJTOL = 1e-5
const PRIMALTOL = 1e-5
const DUALTOL = NaN  # to disable the query

@testset "MINLPTests" begin
    @testset "nlp_005_010" begin
        MINLPTests.nlp_005_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                               termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_005_011" begin
        MINLPTests.nlp_005_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                               termination_target = MOI.OPTIMAL)
    end

    @testset "nlp_007_010" begin
        MINLPTests.nlp_007_010(OPTIMIZER, OBJTOL, PRIMALTOL, DUALTOL;
                               termination_target = MOI.INFEASIBLE,
                               primal_target = MOI.NO_SOLUTION)
    end
end
