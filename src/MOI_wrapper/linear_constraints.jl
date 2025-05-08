# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function MOI.supports_constraint(
    ::Optimizer,
    ::Type{MOI.ScalarAffineFunction{Float64}},
    ::Type{<:BOUNDS},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    func::F,
    set::S,
) where {F<:MOI.ScalarAffineFunction{Float64},S<:BOUNDS}
    if func.constant != 0.0
        throw(MOI.ScalarFunctionConstantNotZero{Float64,F,S}(func.constant))
    end
    allow_modification(o)
    varrefs = [VarRef(t.variable.value) for t in func.terms]
    coefs = [t.coefficient for t in func.terms]
    lhs, rhs = bounds(o, set)
    cr = add_linear_constraint(o.inner, varrefs, coefs, lhs, rhs)
    ci = MOI.ConstraintIndex{F,S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.set(
    o::SCIP.Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{<:MOI.ScalarAffineFunction{Float64},S},
    set::S,
) where {S<:BOUNDS}
    allow_modification(o)
    lhs, rhs = bounds(o, set)
    @SCIP_CALL SCIPchgLhsLinear(o, cons(o, ci), lhs)
    @SCIP_CALL SCIPchgRhsLinear(o, cons(o, ci), rhs)
    return nothing
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{<:MOI.ScalarAffineFunction{Float64},S},
) where {S<:BOUNDS}
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars = SCIPgetNVarsLinear(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(o, c), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, c), nvars)
    orig_vars = get_original_variables(vars, nvars)
    terms = [
        MOI.ScalarAffineTerm{Float64}(
            vals[i],
            MOI.VariableIndex(ref(o, orig_vars[i]).val),
        ) for i in 1:nvars
    ]
    return MOI.ScalarAffineFunction{Float64}(terms, 0.0)
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{<:MOI.ScalarAffineFunction{Float64},S},
) where {S<:BOUNDS}
    _throw_if_invalid(o, ci)
    lhs = SCIPgetLhsLinear(o, cons(o, ci))
    rhs = SCIPgetRhsLinear(o, cons(o, ci))
    return from_bounds(S, lhs, rhs)
end

function MOI.modify(
    o::Optimizer,
    ci::MOI.ConstraintIndex{<:MOI.ScalarAffineFunction{Float64},<:BOUNDS},
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
