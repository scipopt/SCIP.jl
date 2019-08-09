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
function SCIP.check(ch::DummyConsHdlr, constraint, sol, checkintegrality,
                    checklprows, printreason, completely)
    ch.check_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_lp_sol(ch::DummyConsHdlr, constraints, nusefulconss,
                             solinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_pseudo_sol(ch::DummyConsHdlr, constraints, nusefulconss,
                                 solinfeasible, objinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.lock(ch::DummyConsHdlr, constraint, locktype, nlockspos, nlocksneg)
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

function SCIP.check(ch::NSCH, constraints, sol, checkintegrality,
                    checklprows, printreason, completely)
    ch.check_called += 1
    return SCIP.SCIP_INFEASIBLE
end

function SCIP.enforce_lp_sol(ch::NSCH, constraints, nusefulconss, solinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_INFEASIBLE
end

function SCIP.enforce_pseudo_sol(ch::NSCH, constraints, nusefulconss,
                                 solinfeasible, objinfeasible)
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

using MathOptInterface
using SCIP

const MOI = MathOptInterface

mutable struct NADCH <: SCIP.AbstractConstraintHandler
    scip::SCIP.Optimizer # for SCIP* and var maps
end

# Constraint data, referencing variables of a single constraint.
mutable struct NADCons <: SCIP.AbstractConstraint{NADCH}
    variables::Array{MOI.VariableIndex}
end

# Helper function used in several callbacks
function anyviolated(ch, constraints, sol)
    for cons_::Ptr{SCIP.SCIP_CONS} in constraints
        # extract corresponding Julia object
        @assert cons_ != C_NULL
        consdata_::Ptr{SCIP.SCIP_CONSDATA} = SCIP.SCIPconsGetData(cons_)
        cons::NADCons = unsafe_pointer_to_objref(consdata_)

        # extract solution values
        values = [SCIP.SCIPgetSolVal(ch.scip, sol, SCIP.var(ch.scip, vi))
                  for vi in cons.variables]

        # check for constraint violation
        if !allunique(values)
            return true
        end
    end
    return false
end

function SCIP.check(ch::NADCH, constraints, sol, checkintegrality,
                    checklprows, printreason, completely)
    if anyviolated(ch, constraints, sol)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.enforce_lp_sol(ch::NADCH, constraints, nusefulconss, solinfeasible)
    if anyviolated(ch, constraints, C_NULL)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.enforce_pseudo_sol(ch::NADCH, constraints, nusefulconss,
                                 solinfeasible, objinfeasible)
    if anyviolated(ch, constraints, C_NULL)
        return SCIP.SCIP_INFEASIBLE
    else
        return SCIP.SCIP_FEASIBLE
    end
end

function SCIP.lock(ch::NADCH, constraint, locktype, nlockspos, nlocksneg)
    # extract corresponding Julia object
    consdata_::Ptr{SCIP.SCIP_CONSDATA} = SCIP.SCIPconsGetData(constraint)
    @assert consdata_ != C_NULL
    cons::NADCons = unsafe_pointer_to_objref(consdata_)

    # look all variables in both directions
    for vi in cons.variables
        # TODO: understand why lock is called during SCIPfree, after the
        # constraint should have been deleted already. Does it mean we should
        # implement CONSTRANS?
        var_::Ptr{SCIP.SCIP_VAR} = SCIP.var(ch.scip, vi)
        var_ != C_NULL || continue  # avoid segfault!

        SCIP.@SC SCIP.SCIPaddVarLocksType(
            ch.scip, var_, locktype, nlockspos + nlocksneg, nlockspos + nlocksneg)
    end
end

end # module NaiveAllDiff
