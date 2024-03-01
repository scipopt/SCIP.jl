# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Objective function & sense.
#
# SCIP only supports affine objectives. For quadratic or nonlinear objectives,
# the solver will depend on bridges with auxiliary variables. Single variable
# objectives are also accepted, but the type is not correctly remembered.

MOI.supports(::Optimizer, ::MOI.ObjectiveSense) = true
function MOI.supports(
    ::Optimizer,
    ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
)
    true
end

function MOI.set(
    o::Optimizer,
    ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
    obj::MOI.ScalarAffineFunction{Float64},
)
    allow_modification(o)

    # reset objective coefficient of all variables first
    for v in values(o.inner.vars)
        @SCIP_CALL SCIPchgVarObj(o, v[], 0.0)
    end

    # set new objective coefficients, summing coefficients
    for t in obj.terms
        v = var(o, t.variable)
        oldcoef = SCIPvarGetObj(v)
        newcoef = oldcoef + t.coefficient
        @SCIP_CALL SCIPchgVarObj(o, v, newcoef)
    end

    @SCIP_CALL SCIPaddOrigObjoffset(o, obj.constant - SCIPgetOrigObjoffset(o))
    o.objective_function_set = true
    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
)
    terms = MOI.ScalarAffineTerm{Float64}[]
    for vr in keys(o.inner.vars)
        vi = MOI.VariableIndex(vr.val)
        coef = SCIPvarGetObj(var(o, vi))
        coef == 0.0 || push!(terms, MOI.ScalarAffineTerm{Float64}(coef, vi))
    end
    constant = SCIPgetOrigObjoffset(o)
    return MOI.ScalarAffineFunction{Float64}(terms, constant)
end

function MOI.set(
    o::Optimizer,
    ::MOI.ObjectiveSense,
    sense::MOI.OptimizationSense,
)
    allow_modification(o)
    if sense == MOI.MIN_SENSE
        @SCIP_CALL SCIPsetObjsense(o, SCIP_OBJSENSE_MINIMIZE)
    elseif sense == MOI.MAX_SENSE
        @SCIP_CALL SCIPsetObjsense(o, SCIP_OBJSENSE_MAXIMIZE)
    else
        # erasing objective
        MOI.set(
            o,
            MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
            MOI.ScalarAffineFunction{Float64}([], 0.0),
        )
    end
    o.objective_sense = sense
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveSense)
    return something(o.objective_sense, MOI.FEASIBILITY_SENSE)
end

function MOI.modify(
    o::Optimizer,
    ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
    change::MOI.ScalarCoefficientChange{Float64},
)
    allow_modification(o)
    @SCIP_CALL SCIPchgVarObj(o, var(o, change.variable), change.new_coefficient)
    o.objective_function_set = true
    return nothing
end

function MOI.get(::Optimizer, ::MOI.ObjectiveFunctionType)
    MOI.ScalarAffineFunction{Float64}
end
