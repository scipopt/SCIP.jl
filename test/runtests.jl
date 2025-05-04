# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

using Test
using SCIP
using SCIP_jll
using SCIP_PaPILO_jll

@show(@eval(SCIP, libscip) == SCIP_jll.libscip)
@show(
    SCIP_PaPILO_jll.is_available() &&
    @eval(SCIP, libscip) == SCIP_PaPILO_jll.libscip
)
@show SCIP.SCIP_versionnumber()

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("scip_data.jl")
end

# new type definitions in module (needs top level)
include("conshdlr_support.jl")
@testset "constraint handlers" begin
    include("conshdlr.jl")
end

include("sepa_support.jl")
@testset "separators" begin
    include("sepa.jl")
end

@testset "event handlers" begin
    include("eventhdlr.jl")
end

@testset "MathOptInterface" begin
    include("MOI_tests.jl")
end

include("cutsel.jl")
