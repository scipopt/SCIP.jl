using Test
using SCIP

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("managed_scip.jl")
end

@testset "MathOptInterface tests" begin
    include("MOI_wrapper.jl")
end

@testset "MathOptInterface additional tests" begin
    include("MOI_additional.jl")
end
