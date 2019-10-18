# linear constraints

MOI.supports_constraint(o::Optimizer, ::Type{SAF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SAF, set::S) where {S <: BOUNDS}
    if func.constant != 0.0
        error("SCIP does not support linear constraints with a constant offset.")
    end

    allow_modification(o)

    varrefs = [VarRef(t.variable_index.value) for t in func.terms]
    coefs = [t.coefficient for t in func.terms]

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(o) : rhs

    cr = add_linear_constraint(o.mscip, varrefs, coefs, lhs, rhs)
    ci = CI{SAF, S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.delete(o::Optimizer, ci::CI{SAF, S}) where {S <: BOUNDS}
    allow_modification(o)
    delete!(o.constypes[SAF, S], ConsRef(ci.value))
    delete!(o.reference, cons(o, ci))
    delete(o.mscip, ConsRef(ci.value))
    return nothing
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SAF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(o) : rhs

    @SC SCIPchgLhsLinear(o, cons(o, ci), lhs)
    @SC SCIPchgRhsLinear(o, cons(o, ci), rhs)

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SAF, S}) where S <: BOUNDS
    c = cons(o, ci)
    nvars::Int = SCIPgetNVarsLinear(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(o, c), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, c), nvars)

    terms = [AFF_TERM(vals[i], VI(ref(o, vars[i]).val)) for i=1:nvars]
    # can not identify constant anymore (is merged with lhs,rhs)
    return SAF(terms, 0.0)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SAF, S}) where S <: BOUNDS
    lhs = SCIPgetLhsLinear(o, cons(o, ci))
    rhs = SCIPgetRhsLinear(o, cons(o, ci))
    return from_bounds(S, lhs, rhs)
end

function MOI.modify(o::Optimizer, ci::CI{SAF, <:BOUNDS},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgCoefLinear(o, cons(o, ci), var(o, change.variable), change.new_coefficient)
    return nothing
end

function MOI.get(o::Optimizer, attr::MOI.ConstraintPrimal, ci::CI{SAF,<:BOUNDS})
    assert_solved(o)
    MOI.check_result_index_bounds(o, attr)
    sols = unsafe_wrap(Array{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return SCIPgetActivityLinear(o, cons(o, ci), sols[attr.N])
end
