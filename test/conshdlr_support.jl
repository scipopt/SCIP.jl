# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

module Dummy

using SCIP

# Define a minimal no-op constraint handler.
# Needs to be mutable for `pointer_from_objref` to work.
mutable struct DummyConsHdlr <: SCIP.AbstractConstraintHandler
    check_called::Int64
    enfo_called::Int64
    lock_called::Int64

    DummyConsHdlr() = new(0, 0, 0)
end

# Implement only the fundamental callbacks:
function SCIP.check(
    ch::DummyConsHdlr,
    constraints::Array{Ptr{SCIP.SCIP_CONS}},
    sol::Ptr{SCIP.SCIP_SOL},
    checkintegrality::Bool,
    checklprows::Bool,
    printreason::Bool,
    completely::Bool,
)
    ch.check_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_lp_sol(
    ch::DummyConsHdlr,
    constraints::Array{Ptr{SCIP.SCIP_CONS}},
    nusefulconss::Cint,
    solinfeasible::Bool,
)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_pseudo_sol(
    ch::DummyConsHdlr,
    constraints::Array{Ptr{SCIP.SCIP_CONS}},
    nusefulconss::Cint,
    solinfeasible::Bool,
    objinfeasible::Bool,
)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.lock(
    ch::DummyConsHdlr,
    constraint::Ptr{SCIP.SCIP_CONS},
    locktype::SCIP.SCIP_LOCKTYPE,
    nlockspos::Cint,
    nlocksneg::Cint,
)
    ch.lock_called += 1
end

# Corresponding, empty constraint (data) object
mutable struct DummyCons <: SCIP.AbstractConstraint{DummyConsHdlr} end

end # module Dummy

module NeverSatisfied

using SCIP

mutable struct NSCH <: SCIP.AbstractConstraintHandler
    check_called::Int64
    enfo_called::Int64
    lock_called::Int64

    NSCH() = new(0, 0, 0)
end

function SCIP.check(
    ch::NSCH,
    constraints,
    sol,
    checkintegrality,
    checklprows,
    printreason,
    completely,
)
    ch.check_called += 1
    return SCIP.SCIP_INFEASIBLE
end

function SCIP.enforce_lp_sol(ch::NSCH, constraints, nusefulconss, solinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_INFEASIBLE
end

function SCIP.enforce_pseudo_sol(
    ch::NSCH,
    constraints,
    nusefulconss,
    solinfeasible,
    objinfeasible,
)
    ch.enfo_called += 1
    return SCIP.SCIP_INFEASIBLE
end

function SCIP.lock(ch::NSCH, constraint, locktype, nlockspos, nlocksneg)
    ch.lock_called += 1
end

# Corresponding, empty constraint (data) object
mutable struct Cons <: SCIP.AbstractConstraint{NSCH} end

end # module AlwaysSatisfied

module NaiveAllDiff

import MathOptInterface as MOI
using SCIP

mutable struct NADCH <: SCIP.AbstractConstraintHandler
    scip::SCIP.Optimizer # for SCIP* and var maps
end

# Constraint data, referencing variables of a single constraint.
mutable struct NADCons <: SCIP.AbstractConstraint{NADCH}
    variables::Vector{MOI.VariableIndex}
end

# Helper function used in several callbacks
function anyviolated(ch, constraints, sol=C_NULL)
    for cons_::Ptr{SCIP.SCIP_CONS} in constraints
        cons::NADCons = SCIP.user_constraint(cons_)

        # extract solution values
        values = SCIP.sol_values(ch.scip, cons.variables, sol)

        # check for constraint violation
        if !allunique(values)
            return true
        end
    end
    return false
end

function SCIP.check(
    ch::NADCH,
    constraints,
    sol,
    checkintegrality,
    checklprows,
    printreason,
    completely,
)
    if anyviolated(ch, constraints, sol)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.enforce_lp_sol(
    ch::NADCH,
    constraints,
    nusefulconss,
    solinfeasible,
)
    if anyviolated(ch, constraints, C_NULL)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.enforce_pseudo_sol(
    ch::NADCH,
    constraints,
    nusefulconss,
    solinfeasible,
    objinfeasible,
)
    if anyviolated(ch, constraints, C_NULL)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.lock(ch::NADCH, constraint, locktype, nlockspos, nlocksneg)
    cons::NADCons = SCIP.user_constraint(constraint)

    # look all variables in both directions
    for vi in cons.variables
        # TODO: understand why lock is called during SCIPfree, after the
        # constraint should have been deleted already. Does it mean we should
        # implement CONSTRANS?
        var_::Ptr{SCIP.SCIP_VAR} = SCIP.var(ch.scip, vi)
        var_ != C_NULL || continue  # avoid segfault!

        SCIP.@SCIP_CALL SCIP.SCIPaddVarLocksType(
            ch.scip,
            var_,
            locktype,
            nlockspos + nlocksneg,
            nlockspos + nlocksneg,
        )
    end
end

end # module NaiveAllDiff

module NoGoodCounter

import MathOptInterface as MOI
using SCIP

mutable struct Counter <: SCIP.AbstractConstraintHandler
    scip::SCIP.Optimizer # for SCIP* and var maps
    variables::Vector{MOI.VariableIndex}
    solutions::Set{Array{Float64}}

    Counter(scip, variables) = new(scip, variables, Set())
end

function SCIP.check(
    ch::Counter,
    constraints,
    sol,
    checkintegrality,
    checklprows,
    printreason,
    completely,
)
    return SCIP.SCIP_INFEASIBLE
end

function enforce(ch::Counter)
    values = SCIP.sol_values(ch.scip, ch.variables)

    # Store solution
    if values in ch.solutions
        # Getting the same solution twice?
        return SCIP.SCIP_INFEASIBLE
    end
    push!(ch.solutions, values)

    # Add no-good constraint: sum_zeros(x) + sum_ones(1-x) >= 1
    zeros = values .≈ 0.0
    ones = values .≈ 1.0
    others = .!zeros .& .!ones
    if any(others)
        error("Found non-binary solution value for $(vars[others])")
    end

    terms = vcat(
        [MOI.ScalarAffineTerm(1.0, vi) for vi in ch.variables[zeros]],
        [MOI.ScalarAffineTerm(-1.0, vi) for vi in ch.variables[ones]],
    )
    ci = MOI.add_constraint(
        ch.scip,
        MOI.ScalarAffineFunction(terms, 0.0),
        MOI.GreaterThan(1.0 - sum(ones)),
    )

    return SCIP.SCIP_CONSADDED
end

function SCIP.enforce_lp_sol(
    ch::Counter,
    constraints,
    nusefulconss,
    solinfeasible,
)
    @assert length(constraints) == 0
    return enforce(ch)
end

function SCIP.enforce_pseudo_sol(
    ch::Counter,
    constraints,
    nusefulconss,
    solinfeasible,
    objinfeasible,
)
    @assert length(constraints) == 0
    return enforce(ch)
end

function SCIP.lock(ch::Counter, constraint, locktype, nlockspos, nlocksneg) end

end # module NoGoodCounter
