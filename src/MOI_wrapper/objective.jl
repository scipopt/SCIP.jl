# Objective function & sense.
#
# SCIP only supports affine objectives. For quadratic or nonlinear objectives,
# the solver will depend on bridges with auxiliary variables. Single variable
# objectives are also accepted, but the type is not correctly remembered.

MOI.supports(::Optimizer, ::MOI.ObjectiveSense) = true
MOI.supports(::Optimizer, ::MOI.ObjectiveFunction{SAF}) = true

function MOI.set(o::Optimizer, ::MOI.ObjectiveFunction{SAF}, obj::SAF)
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

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveFunction{SAF})
    terms = AFF_TERM[]
    for vr = keys(o.inner.vars)
        vi = VI(vr.val)
        coef = SCIPvarGetObj(var(o, vi))
        coef == 0.0 || push!(terms, AFF_TERM(coef, vi))
    end
    constant = SCIPgetOrigObjoffset(o)
    return SAF(terms, constant)
end

# Note that SCIP always uses a scalar affine function internally!
# function MOI.get(o::Optimizer, ::MOI.ObjectiveFunction{VI})
#     aff_obj = MOI.get(o, MOI.ObjectiveFunction{SAF}())
#     if (length(aff_obj.terms) != 1
#         || aff_obj.terms[1].coefficient != 1.0
#         || aff_obj.constant != 0.0)
#         throw(InexactError(:get, VI, aff_obj))
#     end
#     return aff_obj.terms[1].variable
# end

function MOI.set(o::Optimizer, ::MOI.ObjectiveSense, sense::MOI.OptimizationSense)
    allow_modification(o)
    if sense == MOI.MIN_SENSE
        @SCIP_CALL SCIPsetObjsense(o, SCIP_OBJSENSE_MINIMIZE)
    elseif sense == MOI.MAX_SENSE
        @SCIP_CALL SCIPsetObjsense(o, SCIP_OBJSENSE_MAXIMIZE)
    end
    o.objective_sense = sense
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveSense)
    return o.objective_sense
end

function MOI.modify(o::Optimizer, ::MOI.ObjectiveFunction{SAF},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SCIP_CALL SCIPchgVarObj(o, var(o, change.variable), change.new_coefficient)
    return nothing
end

MOI.get(::Optimizer, ::MOI.ObjectiveFunctionType) = SAF
