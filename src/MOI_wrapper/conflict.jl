
"""
Computes a set of constraints which could not be satisfied when trying to minimize the total violations.
"""
function compute_minimum_unsatisfied_constraints!(o::Optimizer)
    if o.conflict_status != MOI.COMPUTE_CONFLICT_NOT_CALLED
        error("Conflict computation is destructive for the model and cannot be called twice.")
    end
    # free the transformed problem first
    if LibSCIP.SCIPgetStage(o) != LibSCIP.SCIP_STAGE_PROBLEM
        @SCIP_CALL LibSCIP.SCIPfreeTransform(o)
    end
    # first transform all variable bound constraints to constraint bounds
    for (F, S) in MOI.get(o, MOI.ListOfConstraintTypesPresent())
        sname = replace(string(S), "MathOptInterface." => "", "{Float64}" => "")
        if Tuple{F, S} <: Tuple{VI, BOUNDS}
            for (idx, c_index) in enumerate(MOI.get(o, MOI.ListOfConstraintIndices{F,S}()))
                s = MOI.get(o, MOI.ConstraintSet(), c_index)
                MOI.delete(o, c_index)
                vi = MOI.VariableIndex(c_index.value)
                ci_new = MOI.add_constraint(o, 1.0 * vi, s)
                MOI.set(o, MOI.ConstraintName(), ci_new, "varcons_$(c_index.value)_$sname")
            end
        end
    end
    # we need names for all constraints
    for (F, S) in MOI.get(o, MOI.ListOfConstraintTypesPresent())
        if F === VI
            continue
        end
        for (idx, c_index) in enumerate(MOI.get(o, MOI.ListOfConstraintIndices{F,S}()))
            if MOI.get(o, MOI.ConstraintName(), c_index) == ""
                cons_ptr = cons(o, c_index)
                handler_name = unsafe_string(SCIPconshdlrGetName(SCIPconsGetHdlr(cons_ptr)))
                cons_name = "$(handler_name)_moi_$(idx)"
                MOI.set(o, MOI.ConstraintName(), c_index, cons_name)
            end
        end
    end
    success = Ref{LibSCIP.SCIP_Bool}(SCIP.FALSE)
    @SCIP_CALL LibSCIP.SCIPtransformMinUC(o, success)
    if success[] != SCIP.TRUE
        error("Failed to compute the minimum unsatisfied constraints system.\nSome constraint types may not support the required transformations")
    end
    MOI.optimize!(o)
    st = MOI.get(o, MOI.TerminationStatus())
    if st != MOI.OPTIMAL
        error("Unexpected status $st when computing conflicts")
    end
    o.conflict_status = if MOI.get(o, MOI.ObjectiveValue()) > 0
        MOI.CONFLICT_FOUND
    else
        MOI.NO_CONFLICT_EXISTS
    end
    return
end

"""
Model attribute representing whether why the Minimum Unsatisfiable Constraint analysis terminated.
"""
struct UnsatisfiableSystemStatus <: MOI.AbstractModelAttribute end

attribute_value_type(::UnsatisfiableSystemStatus) = MOI.ConflictStatusCode

MOI.get(o::Optimizer, ::UnsatisfiableSystemStatus) = o.conflict_status

"""
Attribute representing whether the constraint could be satisfied in the Minimum Unsatisfiable Constraint analysis.

Note that this is different from a constraint belonging to an Irreducible Infeasible Subsystem.
"""
struct ConstraintSatisfiabilityStatus <: MOI.AbstractConstraintAttribute end

function attribute_value_type(::ConstraintSatisfiabilityStatus)
    return MOI.ConflictParticipationStatusCode
end

function MOI.get(o::Optimizer, ::ConstraintSatisfiabilityStatus, index::MOI.ConstraintIndex{MOI.VariableIndex})
    o.conflict_status == MOI.CONFLICT_FOUND || error("no conflict")
    # we cannot determine whether variable constraint (integer, binary, variable bounds) participate
    return MOI.MAYBE_IN_CONFLICT
end

function MOI.get(o::Optimizer, ::ConstraintSatisfiabilityStatus, index::MOI.ConstraintIndex)
    o.conflict_status == MOI.CONFLICT_FOUND || error("no conflict")
    c_name = MOI.get(o, MOI.ConstraintName(), index)
    slack_name = "$(c_name)_master"
    ptr = SCIPfindVar(o, slack_name)
    if ptr == C_NULL
        error("No constraint name corresponds to the index $index - name $c_name")
    end
    sol = SCIPgetBestSol(o)
    slack_value = SCIPgetSolVal(o, sol, ptr)
    return slack_value > 0.5 ? MOI.IN_CONFLICT : MOI.NOT_IN_CONFLICT
end
