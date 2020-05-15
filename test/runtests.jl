using Test
using SCIP
using Aqua

Aqua.test_all(SCIP)

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("managed_scip.jl")
end

# new type definitions in module (needs top level)
include("conshdlr_support.jl")

@testset "constraint handlers" begin
    include("conshdlr.jl")
end

@testset "MathOptInterface tests (bridged)" begin
    include("MOI_wrapper_bridged.jl")
end

@testset "MathOptInterface tests (bridged & cached)" begin
    include("MOI_wrapper_cached.jl")
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

@testset "constraint handlers (with MOI)" begin
    include("MOI_conshdlr.jl")
end
