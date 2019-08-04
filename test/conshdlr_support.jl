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
function SCIP.check(ch::DummyConsHdlr, constraints)
    ch.check_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_lp_sol(ch::DummyConsHdlr, constraints, solinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.enforce_pseudo_sol(ch::DummyConsHdlr, constraints, solinfeasible, objinfeasible)
    ch.enfo_called += 1
    return SCIP.SCIP_FEASIBLE
end

function SCIP.lock(ch::DummyConsHdlr, constraint, locktype, nlockspos, nlocksneg)
    ch.lock_called += 1
end

# Corresponding, empty constraint (data) object
mutable struct DummyCons <: SCIP.AbstractConstraint{DummyConsHdlr} end

end # module Dummy
