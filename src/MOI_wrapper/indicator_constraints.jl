# Indicator constraints

MOI.supports_constraint(::Optimizer, ::Type{<:MOI.VectorAffineFunction}, ::Type{<:MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, <:MOI.LessThan}}) = true

function MOI.add_constraint(o::Optimizer, func::MOI.VectorAffineFunction{T}, set::MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}) where {T<:Real, LT<:MOI.LessThan}
    allow_modification(o)
    first_index_terms  = [v.scalar_term for v in func.terms if v.output_index == 1]
    scalar_index_terms = [v.scalar_term for v in func.terms if v.output_index != 1]
    length(first_index_terms) == 1 || error("There should be exactly one term in output_index 1, found $(length(first_index_terms))")
    y = VarRef(first_index_terms[1].variable_index.value)
    x = [VarRef(vi.variable_index.value) for vi in scalar_index_terms]
    a = [vi.coefficient for vi in scalar_index_terms]
    b = func.constants[2]
    # a^T x + b <= c ===> a^T <= c - b

    cr = add_indicator_constraint(o.mscip, y, x, a, MOI.constant(set.set) - b)
    ci = CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}) where {T<:Real, LT<:MOI.LessThan}
    allow_modification(o)
    delete!(o.constypes[MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}) where {T<:Real, LT<:MOI.LessThan}
    indicator_cons = cons(o, ci)::Ptr{SCIP_CONS}
    bin_var = SCIPgetBinaryVarIndicator(indicator_cons)::Ptr{SCIP_VAR}
    slack_var = SCIPgetSlackVarIndicator(indicator_cons)::Ptr{SCIP_VAR}
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)::Ptr{SCIP_CONS}

    nvars::Int = SCIPgetNVarsLinear(o, linear_cons)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(o, linear_cons), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, linear_cons), nvars)
    aff_terms = [AFF_TERM(vals[i], VI(ref(o, vars[i]).val)) for i=1:nvars
                 if vars[i] != slack_var]

    ind_terms = [VEC_TERM(1, AFF_TERM(1.0, VI(ref(o, bin_var).val)))]
    vec_terms = [VEC_TERM(2, term) for term in aff_terms]

    return VAF(vcat(ind_terms, vec_terms), [0.0, 0.0])
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{MOI.VectorAffineFunction{T}, MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE, LT}}) where {T<:Real, LT<:MOI.LessThan}
    indicator_cons = cons(o, ci)::Ptr{SCIP_CONS}
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)::Ptr{SCIP_CONS}

    lhs = SCIPgetLhsLinear(o, linear_cons)
    rhs = SCIPgetRhsLinear(o, linear_cons)
    lhs == -SCIPinfinity(o) || error("Have lower bound on indicator constraint!")

    return MOI.IndicatorSet{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(rhs))
end
