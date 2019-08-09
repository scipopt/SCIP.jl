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
