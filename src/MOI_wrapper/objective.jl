# objective function & sense

MOI.supports(::Optimizer, ::MOI.ObjectiveSense) = true
MOI.supports(::Optimizer, ::MOI.ObjectiveFunction{SAF}) = true

function MOI.set(o::Optimizer, ::MOI.ObjectiveFunction{SAF}, obj::SAF)
    allow_modification(o)
    s = scip(o)

    # reset objective coefficient of all variables first
    for v in o.mscip.vars
        @SC SCIPchgVarObj(s, v[], 0.0)
    end

    # set new objective coefficients, summing coefficients
    for t in obj.terms
        v = var(o, t.variable_index)
        oldcoef = SCIPvarGetObj(v)
        newcoef = oldcoef + t.coefficient
        @SC SCIPchgVarObj(s, v, newcoef)
    end

    @SC SCIPaddOrigObjoffset(s, obj.constant - SCIPgetOrigObjoffset(s))

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveFunction{SAF})
    terms = AFF_TERM[]
    for i = 1:length(o.mscip.vars)
        vi = VI(i)
        coef = SCIPvarGetObj(var(o, vi))
        coef == 0.0 || push!(terms, AFF_TERM(coef, vi))
    end
    constant = SCIPgetOrigObjoffset(scip(o))
    return SAF(terms, constant)
end

function MOI.set(o::Optimizer, ::MOI.ObjectiveSense, sense::MOI.OptimizationSense)
    allow_modification(o)
    if sense == MOI.MIN_SENSE
        @SC SCIPsetObjsense(scip(o), SCIP_OBJSENSE_MINIMIZE)
    elseif sense == MOI.MAX_SENSE
        @SC SCIPsetObjsense(scip(o), SCIP_OBJSENSE_MAXIMIZE)
    elseif sense == MOI.FEASIBLITY_SENSE
        @warn "FEASIBLITY_SENSE not supported by SCIP.jl" maxlog=1
    end
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveSense)
    return SCIPgetObjsense(scip(o)) == SCIP_OBJSENSE_MAXIMIZE ? MOI.MAX_SENSE : MOI.MIN_SENSE
end

function MOI.modify(o::Optimizer, ::MOI.ObjectiveFunction{SAF},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgVarObj(scip(o), var(o, change.variable), change.new_coefficient)
    return nothing
end
