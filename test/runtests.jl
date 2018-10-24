using Test
using SCIP
using MathProgBase
using JuMP

@testset "MathProgBase tests" begin
    include("mpb_tests.jl")
end

@testset "CSIP tests" begin
    include("csip_tests.jl")
end

@testset "Other tests" begin
    include("more_tests.jl")
end
