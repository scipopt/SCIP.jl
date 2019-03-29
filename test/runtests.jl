using Test
using SCIP

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("managed_scip.jl")
end

@testset "MathOptInterface tests (bridged)" begin
    include("MOI_wrapper.jl")
end

@testset "MathOptInterface tests (direct)" begin
    include("MOI_wrapper_direct.jl")
end

@testset "MathOptInterface additional tests" begin
    include("MOI_additional.jl")
end

@testset "MathOptInterface nonlinear expressions" begin
    include("MOI_nonlinear_exprs.jl")
end
