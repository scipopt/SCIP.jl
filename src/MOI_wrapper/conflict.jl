# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

"""
    compute_minimum_unsatisfied_constraints!(o::Optimizer)

Computes a set of constraints which could not be satisfied when trying to
minimize the total violations.

Given the problem:
```
(P) min_x c^⊤ x
     s.t. F(x) ∈ S_i ∀ i in 1…m
```
the analysis uses a feasibility relaxation based on slack variables and
indicator constraints:
```
(M) min_{x, z} ∑_i z_i
          s.t. z_i = 0 → F(x) ∈ S_i ∀ i in 1…m
               z ∈ {0,1}ᵐ
```

If (P) is infeasible, (M) has an optimal value above 1. All constraints with
`z = 1` had to be violated.
"""
function compute_minimum_unsatisfied_constraints!(o::Optimizer)
    if o.conflict_status != MOI.COMPUTE_CONFLICT_NOT_CALLED
        error(
            "Conflict computation is destructive for the model and cannot be called twice.",
        )
    end
    # free the transformed problem first
    if SCIPgetStage(o) != SCIP_STAGE_PROBLEM
        @SCIP_CALL SCIPfreeTransform(o)
    end
    # first transform all variable bound constraints to constraint bounds
    for (F, S) in MOI.get(o, MOI.ListOfConstraintTypesPresent())
        if !(F == MOI.VariableIndex && S <: BOUNDS)
            continue
        end
        sname = replace(string(S), "MathOptInterface." => "", "{Float64}" => "")
        for ci in MOI.get(o, MOI.ListOfConstraintIndices{F,S}())
            set = MOI.get(o, MOI.ConstraintSet(), ci)
            MOI.delete(o, ci)
            x = MOI.VariableIndex(ci.value)
            ci_new = MOI.add_constraint(o, 1.0 * x, set)
            name = "varcons_$(x.value)_$sname"
            MOI.set(o, MOI.ConstraintName(), ci_new, name)
        end
    end
    # we need names for all constraints
    for (F, S) in MOI.get(o, MOI.ListOfConstraintTypesPresent())
        if F === MOI.VariableIndex
            continue
        end
        for (idx, c_index) in
            enumerate(MOI.get(o, MOI.ListOfConstraintIndices{F,S}()))
            if MOI.get(o, MOI.ConstraintName(), c_index) == ""
                cons_ptr = cons(o, c_index)
                handler_name = unsafe_string(
                    SCIPconshdlrGetName(SCIPconsGetHdlr(cons_ptr)),
                )
                cons_name = "$(handler_name)_moi_$(idx)"
                MOI.set(o, MOI.ConstraintName(), c_index, cons_name)
            end
        end
    end
    success = Ref{SCIP_Bool}(FALSE)
    @SCIP_CALL SCIPtransformMinUC(o, success)
    if success[] != TRUE
        error(
            "Failed to compute the minimum unsatisfied constraints system.\nSome constraint types may not support the required transformations",
        )
    end
    MOI.optimize!(o)
    st = MOI.get(o, MOI.TerminationStatus())
    if st != MOI.OPTIMAL
        error("Unexpected status $st when computing conflicts")
    end
    if MOI.get(o, MOI.ObjectiveValue()) > 0
        o.conflict_status = MOI.CONFLICT_FOUND
    else
        o.conflict_status = MOI.NO_CONFLICT_EXISTS
    end
    return
end

"""
    UnsatisfiableSystemStatus() <: MOI.AbstractModelAttribute

Model attribute representing whether why the Minimum Unsatisfiable Constraint
analysis terminated.
"""
struct UnsatisfiableSystemStatus <: MOI.AbstractModelAttribute end

MOI.attribute_value_type(::UnsatisfiableSystemStatus) = MOI.ConflictStatusCode

MOI.get(o::Optimizer, ::UnsatisfiableSystemStatus) = o.conflict_status

"""
    ConstraintSatisfiabilityStatus() <: MOI.AbstractModelAttribute

Attribute representing whether the constraint could be satisfied in the Minimum
Unsatisfiable Constraint analysis.

Note that this is different from a constraint belonging to an Irreducible
Infeasible Subsystem.
"""
struct ConstraintSatisfiabilityStatus <: MOI.AbstractConstraintAttribute end

function MOI.attribute_value_type(::ConstraintSatisfiabilityStatus)
    return MOI.ConflictParticipationStatusCode
end

function MOI.get(
    o::Optimizer,
    ::ConstraintSatisfiabilityStatus,
    index::MOI.ConstraintIndex{MOI.VariableIndex},
)
    if o.conflict_status != MOI.CONFLICT_FOUND
        return MOI.NOT_IN_CONFLICT
    end
    # We cannot determine whether variable constraint (integer, binary, variable
    # bounds) participate.
    return MOI.MAYBE_IN_CONFLICT
end

function MOI.get(
    o::Optimizer,
    ::ConstraintSatisfiabilityStatus,
    index::MOI.ConstraintIndex,
)
    MOI.throw_if_not_valid(o, index)
    if o.conflict_status != MOI.CONFLICT_FOUND
        return MOI.NOT_IN_CONFLICT
    end
    c_name = MOI.get(o, MOI.ConstraintName(), index)
    ptr = SCIPfindVar(o, "$(c_name)_master")
    @assert ptr != C_NULL
    sol = SCIPgetBestSol(o)
    slack_value = SCIPgetSolVal(o, sol, ptr)
    return slack_value > 0.5 ? MOI.IN_CONFLICT : MOI.NOT_IN_CONFLICT
end

## IIS & MOI conflicts


function MOI.compute_conflict!(o::Optimizer)
    for (F, S) in MOI.get(o, MOI.ListOfConstraintTypesPresent())
        if F === MOI.VariableIndex
            continue
        end
        for cidx in MOI.get(o, MOI.ListOfConstraintIndices{F,S}())
            if MOI.get(o, MOI.ConstraintName(), cidx) === nothing
                error("All constraints in the model should be named. Constraint $(cidx) is currently unnamed")
            end
        end
    end
    @SCIP_CALL SCIP.LibSCIP.SCIPgenerateIIS(o)
    return
end

function MOI.get(o::Optimizer, ::MOI.ConflictStatus)
    iis = SCIP.LibSCIP.SCIPgetIIS(o)
    is_infeasible = SCIPiisIsSubscipInfeasible(iis)
    st = MOI.get(o, MOI.TerminationStatus())
    # we ignore MOI.NO_CONFLICT_FOUND for now
    # this is not supposed to happen with a greedy method
    if st != MOI.INFEASIBLE
        return MOI.NO_CONFLICT_EXISTS
    elseif is_infeasible == 0
        return MOI.COMPUTE_CONFLICT_NOT_CALLED
    else 
        return MOI.CONFLICT_FOUND
    end
end

# TODO variable bounds
function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintConflictStatus,
    index::MOI.ConstraintIndex{MOI.VariableIndex,S},
) where {S <: Union{MOI.LessThan, MOI.EqualTo, MOI.GreaterThan}}
    if MOI.get(o, MOI.ConflictStatus()) != MOI.CONFLICT_FOUND
        return MOI.NOT_IN_CONFLICT
    end
    set = MOI.get(o, MOI.ConstraintSet(), index)
    bound_values = bounds(o, set)
    index_var_name = MOI.get(o, MOI.VariableName(), MOI.VariableIndex(index.value))
    nvars = SCIP.LibSCIP.SCIPgetNOrigVars(iis_subscip)
    vars_ptr = SCIP.LibSCIP.SCIPgetOrigVars(iis_subscip)
    raw_vars_vec = unsafe_wrap(Array, vars_ptr, nvars)
    for var in raw_vars_vec
        var_name = unsafe_string(SCIP.LibSCIP.SCIPvarGetName(var))
        if var_name == index_var_name
            lb = SCIP.LibSCIP.SCIPvarGetUbOriginal(var)
            ub = SCIP.LibSCIP.SCIPvarGetUbOriginal(var)
            if bound_values[1] ≈ lb && bound_values[2] ≈ ub
                return MOI.IN_CONFLICT
            end
            return MOI.NOT_IN_CONFLICT
        end
    end
    # variable not present in the IIS subproblem
    return MOI.NOT_IN_CONFLICT
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintConflictStatus,
    index::MOI.ConstraintIndex{F,S},
) where {F <: Union{MOI.ScalarAffineFunction, MOI.VectorOfVariables, MOI.ScalarQuadraticFunction}, S}
    if MOI.get(o, MOI.ConflictStatus()) != MOI.CONFLICT_FOUND
        return MOI.NOT_IN_CONFLICT
    end
    c_name = MOI.get(o, MOI.ConstraintName(), index)
    iis_subscip = SCIP.LibSCIP.SCIPiisGetSubscip(SCIP.LibSCIP.SCIPgetIIS(o))
    n_cons = SCIP.LibSCIP.SCIPgetNOrigConss(iis_subscip)
    cons_ptr = SCIP.LibSCIP.SCIPgetOrigConss(iis_subscip)
    raw_cons_vec = unsafe_wrap(Array, cons_ptr, n_cons)
    for cons in raw_cons_vec
        cons_name = unsafe_string(SCIP.LibSCIP.SCIPconsGetName(cons))
        if cons_name == c_name
            return MOI.IN_CONFLICT
        end
    end
    return MOI.NOT_IN_CONFLICT
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintConflictStatus,
    index::MOI.ConstraintIndex{
        MOI.VariableIndex,
        <:Union{MOI.Integer,MOI.ZeroOne},
    },
)
    if MOI.get(o, MOI.ConflictStatus()) != MOI.CONFLICT_FOUND
        return MOI.NOT_IN_CONFLICT
    end

    # SCIP doesn't have the information of whether integrality was necessary to produce the IIS.
    if !MOI.is_valid(model, index)
        throw(MOI.InvalidIndex(index))
    end
    return MOI.MAYBE_IN_CONFLICT
end
