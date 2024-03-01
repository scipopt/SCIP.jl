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
Select the most fractional variable to branch on.
"""
mutable struct MostFractional <: SCIP.AbstractBranchingRule
    ncalls::Int
end

MostFractional() = MostFractional(0)

# we only specialize the branching on LP rule
function SCIP.branch(
    branchrule::MostFractional,
    scip,
    allow_additional_constraints,
    type::SCIP.BranchingLP,
)
    branchrule.ncalls += 1
    (candidates, _, candidates_fractionalities, nprio, nimplied) =
        SCIP.get_branching_candidates(scip)
    candidate_idx =
        argmax(idx -> abs(candidates_fractionalities[idx] - 0.5), 1:nprio)
    var = candidates[candidate_idx]
    SCIP.branch_on_candidate!(scip, var)
    return (SCIP.SCIP_OKAY, SCIP.SCIP_BRANCHED)
end

@testset "branchrule" begin
    # removing presolving and cuts to solve a non-trivial problem that requires some branching
    o = SCIP.Optimizer(; presolving_maxrounds=0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxrounds"), 0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxcutsroot"), 0)
    MOI.set(o, MOI.RawOptimizerAttribute("separating/maxaddrounds"), 0)
    MOI.set(o, MOI.Silent(), true)

    branchrule = MostFractional()
    name = "my_branchrule"
    description = "a most infeasible branching rule"
    priority = 15_000
    SCIP.include_branchrule(
        o,
        branchrule;
        name=name,
        description=description,
        priority=priority,
    )
    branchrule_pointer = o.inner.branchrule_storage[branchrule]
    @test unsafe_string(
        SCIP.LibSCIP.SCIPbranchruleGetName(branchrule_pointer),
    ) == name
    @test unsafe_string(
        SCIP.LibSCIP.SCIPbranchruleGetDesc(branchrule_pointer),
    ) == description
    @test SCIP.LibSCIP.SCIPbranchruleGetPriority(branchrule_pointer) == priority
    @test SCIP.LibSCIP.SCIPbranchruleGetData(branchrule_pointer) ==
          pointer_from_objref(branchrule)
    n = 20
    x = MOI.add_variables(o, n)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x; init=0.0), MOI.LessThan(12.5))
    for _ in 1:10
        MOI.add_constraint(
            o,
            2.0 * dot(rand(n), x),
            MOI.LessThan(10.0 + 2 * rand()),
        )
    end
    func = -dot(rand(n), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    MOI.optimize!(o)
    @test MOI.get(o, MOI.TerminationStatus()) == MOI.OPTIMAL
    @test branchrule.ncalls > 0
end
