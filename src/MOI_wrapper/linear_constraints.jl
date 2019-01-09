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
    lhs = lhs == nothing ? -SCIPinfinity(scip(o)) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip(o)) : rhs

    cr = add_linear_constraint(o.mscip, varrefs, coefs, lhs, rhs)
    ci = CI{SAF, S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SAF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip(o)) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip(o)) : rhs

    @SC SCIPchgLhsLinear(scip(o), cons(o, ci), lhs)
    @SC SCIPchgRhsLinear(scip(o), cons(o, ci), rhs)

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SAF, S}) where S <: BOUNDS
    s, c = scip(o), cons(o, ci)
    nvars::Int = SCIPgetNVarsLinear(s, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(s, c), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(s, c), nvars)

    terms = [AFF_TERM(vals[i], VI(ref(o, vars[i]).val)) for i=1:nvars]
    # can not identify constant anymore (is merged with lhs,rhs)
    return SAF(terms, 0.0)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SAF, S}) where S <: BOUNDS
    lhs = SCIPgetLhsLinear(scip(o), cons(o, ci))
    rhs = SCIPgetRhsLinear(scip(o), cons(o, ci))
    return from_bounds(S, lhs, rhs)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintName, ci::CI{SAF,<:BOUNDS})
    return SCIPconsGetName(cons(o, ci))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI{SAF,<:BOUNDS}, name::String)
    @SC SCIPchgConsName(scip(o), cons(o, ci), name)
    return nothing
end

function MOI.modify(o::Optimizer, ci::CI{SAF, <:BOUNDS},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgCoefLinear(scip(o), cons(o, ci),
                          var(o, change.variable), change.new_coefficient)
    return nothing
end
