# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# linear constraints

MOI.supports_constraint(o::Optimizer, ::Type{SAF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(
    o::Optimizer,
    func::F,
    set::S,
) where {F<:SAF,S<:BOUNDS}
    if func.constant != 0.0
        throw(MOI.ScalarFunctionConstantNotZero{Float64,F,S}(func.constant))
    end

    allow_modification(o)

    varrefs = [VarRef(t.variable.value) for t in func.terms]
    coefs = [t.coefficient for t in func.terms]

    lhs, rhs = bounds(set)
    lhs = lhs === nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs === nothing ? SCIPinfinity(o) : rhs

    cr = add_linear_constraint(o.inner, varrefs, coefs, lhs, rhs)
    ci = CI{F,S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.set(
    o::SCIP.Optimizer,
    ::MOI.ConstraintSet,
    ci::CI{<:SAF,S},
    set::S,
) where {S<:BOUNDS}
    allow_modification(o)

    lhs, rhs = bounds(set)
    lhs = lhs === nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs === nothing ? SCIPinfinity(o) : rhs

    @SCIP_CALL SCIPchgLhsLinear(o, cons(o, ci), lhs)
    @SCIP_CALL SCIPchgRhsLinear(o, cons(o, ci), rhs)

    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::CI{<:SAF,S},
) where {S<:BOUNDS}
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars::Int = SCIPgetNVarsLinear(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(o, c), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, c), nvars)

    orig_vars = get_original_variables(vars, nvars)

    terms = [AFF_TERM(vals[i], VI(ref(o, orig_vars[i]).val)) for i in 1:nvars]
    # can not identify constant anymore (is merged with lhs,rhs)
    return SAF(terms, 0.0)
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::CI{<:SAF,S},
) where {S<:BOUNDS}
    _throw_if_invalid(o, ci)
    lhs = SCIPgetLhsLinear(o, cons(o, ci))
    rhs = SCIPgetRhsLinear(o, cons(o, ci))
    return from_bounds(S, lhs, rhs)
end

function MOI.modify(
    o::Optimizer,
    ci::CI{<:SAF,<:BOUNDS},
    change::MOI.ScalarCoefficientChange{Float64},
)
    allow_modification(o)
    @SCIP_CALL SCIPchgCoefLinear(
        o,
        cons(o, ci),
        var(o, change.variable),
        change.new_coefficient,
    )
    return nothing
end
