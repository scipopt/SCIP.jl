# Objective function & sense.
#
# SCIP only supports affine objectives. For quadratic or nonlinear objectives,
# the solver will depend on bridges with auxiliary variables. Single variable
# objectives are also accepted, but the type is not correctly remembered.

MOI.supports(::Optimizer, ::MOI.ObjectiveSense) = true
MOI.supports(::Optimizer, ::MOI.ObjectiveFunction{SAF}) = true
MOI.supports(::Optimizer, ::MOI.ObjectiveFunction{SVF}) = true

function MOI.set(o::Optimizer, ::MOI.ObjectiveFunction{SAF}, obj::SAF)
    allow_modification(o)

    # reset objective coefficient of all variables first
    for v in values(o.mscip.vars)
        @SC SCIPchgVarObj(o, v[], 0.0)
    end

    # set new objective coefficients, summing coefficients
    for t in obj.terms
        v = var(o, t.variable_index)
        oldcoef = SCIPvarGetObj(v)
        newcoef = oldcoef + t.coefficient
        @SC SCIPchgVarObj(o, v, newcoef)
    end

    @SC SCIPaddOrigObjoffset(o, obj.constant - SCIPgetOrigObjoffset(o))

    return nothing
end

# Note that SCIP always uses a scalar affine function internally!
function MOI.set(o::Optimizer, ::MOI.ObjectiveFunction{SVF}, obj::SVF)
    aff_obj = SAF([AFF_TERM(1.0, obj.variable)], 0.0)
    return MOI.set(o, MOI.ObjectiveFunction{SAF}(), aff_obj)
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveFunction{SAF})
    terms = AFF_TERM[]
    for vr = keys(o.mscip.vars)
        vi = VI(vr.val)
        coef = SCIPvarGetObj(var(o, vi))
        coef == 0.0 || push!(terms, AFF_TERM(coef, vi))
    end
    constant = SCIPgetOrigObjoffset(o)
    return SAF(terms, constant)
end

# Note that SCIP always uses a scalar affine function internally!
function MOI.get(o::Optimizer, ::MOI.ObjectiveFunction{SVF})
    aff_obj = MOI.get(o, MOI.ObjectiveFunction{SAF}())
    if (length(aff_obj.terms) != 1
        || aff_obj.terms[1].coefficient != 1.0
        || aff_obj.constant != 0.0)
        error("Objective is not single variable: $aff_obj !")
    end
    return SVF(aff_obj.terms[1].variable_index)
end

function MOI.set(o::Optimizer, ::MOI.ObjectiveSense, sense::MOI.OptimizationSense)
    allow_modification(o)
    if sense == MOI.MIN_SENSE
        @SC SCIPsetObjsense(o, SCIP_OBJSENSE_MINIMIZE)
    elseif sense == MOI.MAX_SENSE
        @SC SCIPsetObjsense(o, SCIP_OBJSENSE_MAXIMIZE)
    elseif sense == MOI.FEASIBLITY_SENSE
        @warn "FEASIBLITY_SENSE not supported by SCIP.jl" maxlog=1
    end
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveSense)
    return SCIPgetObjsense(o) == SCIP_OBJSENSE_MAXIMIZE ? MOI.MAX_SENSE : MOI.MIN_SENSE
end

function MOI.modify(o::Optimizer, ::MOI.ObjectiveFunction{SAF},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgVarObj(o, var(o, change.variable), change.new_coefficient)
    return nothing
end

MOI.get(o::Optimizer, ::MOI.ObjectiveFunctionType) = SAF
