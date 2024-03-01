# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

using SCIP
import MathOptInterface as MOI
using Test
using LinearAlgebra
using Random

Random.seed!(42)

"""
Selects cut by efficacy only, selects up to `nmax_cuts` cuts.
"""
mutable struct EfficacyCutSelector <: SCIP.AbstractCutSelector
    o::SCIP.Optimizer
    nmax_cuts::Int
    ncalls::Int
end

function SCIP.select_cuts(
    cutsel::EfficacyCutSelector,
    scip,
    cuts::Vector{Ptr{SCIP.SCIP_ROW}},
    forced_cuts::Vector{Ptr{SCIP.SCIP_ROW}},
    root::Bool,
    maxnslectedcuts::Integer,
)
    function efficacy_function(cut)
        return SCIP.LibSCIP.SCIPgetCutEfficacy(scip, C_NULL, cut)
    end
    sort!(cuts; by=efficacy_function, rev=true)
    nselected_cuts = min(cutsel.nmax_cuts, maxnslectedcuts)
    nselected_cuts = max(nselected_cuts, 0)
    nselected_cuts = min(nselected_cuts, length(cuts))
    cutsel.ncalls += 1
    return (SCIP.SCIP_OKAY, nselected_cuts, SCIP.SCIP_SUCCESS)
end

@testset "test cut selector" begin
    # removing presolving to solve a non-trivial problem that requires some separation
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    MOI.set(o, MOI.Silent(), true)

    cutsel = EfficacyCutSelector(o, 10, 0)
    name = "my_cut_selector"
    description = "a selector using efficacy only"
    priority = 15_000
    SCIP.include_cutsel(
        o,
        cutsel;
        name=name,
        description=description,
        priority=priority,
    )
    cutsel_pointer = o.inner.cutsel_storage[cutsel]
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetName(cutsel_pointer)) == name
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetDesc(cutsel_pointer)) ==
          description
    @test SCIP.LibSCIP.SCIPcutselGetPriority(cutsel_pointer) == priority
    @test SCIP.LibSCIP.SCIPcutselGetData(cutsel_pointer) ==
          pointer_from_objref(cutsel)

    x = MOI.add_variables(o, 10)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:5
        MOI.add_constraint(
            o,
            2.0 * dot(rand(10), x),
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -dot(rand(10), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test cutsel.ncalls > 0
end

# select by removing cuts that are too parallel to a forced cut
mutable struct SecondSelector <: SCIP.AbstractCutSelector
    o::SCIP.Optimizer
    nmax_cuts::Int
    ncalls::Int
    min_orthogonality::Float64
end

function SCIP.select_cuts(
    cutsel::SecondSelector,
    scip,
    cuts::Vector{Ptr{SCIP.SCIP_ROW}},
    forced_cuts::Vector{Ptr{SCIP.SCIP_ROW}},
    root::Bool,
    maxnslectedcuts::Integer,
)
    rem_cuts = Set{Ptr{SCIP.SCIP_ROW}}()
    for cut in cuts
        for fcut in forced_cuts
            o_score = SCIP.LibSCIP.SCIProwGetOrthogonality(cut, fcut, 'e')
            if o_score < cutsel.min_orthogonality
                push!(rem_cuts, cut)
                break
            end
        end
    end
    function sorting_function(cut)
        if cut in rem_cuts
            return -1.0
        end
        return SCIP.LibSCIP.SCIPgetCutEfficacy(scip, C_NULL, cut)
    end
    sort!(cuts; by=sorting_function, rev=true)
    nselected_cuts = min(cutsel.nmax_cuts, maxnslectedcuts)
    nselected_cuts = max(nselected_cuts, 0)
    nselected_cuts = min(nselected_cuts, length(cuts) - length(rem_cuts))
    cutsel.ncalls += 1
    return (SCIP.SCIP_OKAY, nselected_cuts, SCIP.SCIP_SUCCESS)
end

@testset "test cut selector parallelism" begin
    # removing presolving to solve a non-trivial problem that requires some separation
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    MOI.set(o, MOI.Silent(), true)

    cutsel = SecondSelector(o, 10, 0, 0.05)
    name = "my_cut_selector_parallelism"
    description = "a selector using efficacy and parallelism"
    priority = 15_000
    SCIP.include_cutsel(
        o,
        cutsel;
        name=name,
        description=description,
        priority=priority,
    )
    cutsel_pointer = o.inner.cutsel_storage[cutsel]
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetName(cutsel_pointer)) == name
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetDesc(cutsel_pointer)) ==
          description
    @test SCIP.LibSCIP.SCIPcutselGetPriority(cutsel_pointer) == priority
    @test SCIP.LibSCIP.SCIPcutselGetData(cutsel_pointer) ==
          pointer_from_objref(cutsel)

    x = MOI.add_variables(o, 10)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:5
        MOI.add_constraint(
            o,
            2.0 * dot(rand(10), x),
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -dot(rand(10), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test cutsel.ncalls > 0
end

@testset "test default hybrid cut selector" begin
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    MOI.set(o, MOI.Silent(), true)

    cutsel = SCIP.HybridCutSelector()

    name = "hybrid_cut_selector"
    description = "default cut selector"
    priority = 15_000
    SCIP.include_cutsel(
        o,
        cutsel;
        name=name,
        description=description,
        priority=priority,
    )
    cutsel_pointer = o.inner.cutsel_storage[cutsel]
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetName(cutsel_pointer)) == name
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetDesc(cutsel_pointer)) ==
          description
    @test SCIP.LibSCIP.SCIPcutselGetPriority(cutsel_pointer) == priority
    @test SCIP.LibSCIP.SCIPcutselGetData(cutsel_pointer) ==
          pointer_from_objref(cutsel)

    x = MOI.add_variables(o, 10)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:5
        MOI.add_constraint(
            o,
            2.0 * dot(rand(10), x),
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -dot(rand(10), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
end
