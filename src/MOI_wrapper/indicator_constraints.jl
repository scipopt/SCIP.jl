# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Indicator constraints

function MOI.supports_constraint(
    ::Optimizer,
    ::Type{<:MOI.VectorAffineFunction},
    ::Type{<:MOI.Indicator{MOI.ACTIVATE_ON_ONE,<:MOI.LessThan}},
)
    true
end

function MOI.add_constraint(
    o::Optimizer,
    func::MOI.VectorAffineFunction{T},
    set::MOI.Indicator{MOI.ACTIVATE_ON_ONE,LT},
) where {T<:Real,LT<:MOI.LessThan}
    allow_modification(o)
    first_index_terms =
        [v.scalar_term for v in func.terms if v.output_index == 1]
    scalar_index_terms =
        [v.scalar_term for v in func.terms if v.output_index != 1]
    length(first_index_terms) == 1 || error(
        "There should be exactly one term in output_index 1, found $(length(first_index_terms))",
    )
    y = VarRef(first_index_terms[1].variable.value)
    x = [VarRef(vi.variable.value) for vi in scalar_index_terms]
    a = [vi.coefficient for vi in scalar_index_terms]
    b = func.constants[2]
    # a^T x + b <= c ===> a^T <= c - b

    cr = add_indicator_constraint(o.inner, y, x, a, MOI.constant(set.set) - b)
    ci = MOI.ConstraintIndex{
        MOI.VectorAffineFunction{T},
        MOI.Indicator{MOI.ACTIVATE_ON_ONE,LT},
    }(
        cr.val,
    )
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{
        MOI.VectorAffineFunction{T},
        MOI.Indicator{MOI.ACTIVATE_ON_ONE,LT},
    },
) where {T<:Real,LT<:MOI.LessThan}
    _throw_if_invalid(o, ci)
    indicator_cons = cons(o, ci)::Ptr{SCIP_CONS}
    bin_var = SCIPgetBinaryVarIndicator(indicator_cons)::Ptr{SCIP_VAR}
    slack_var = SCIPgetSlackVarIndicator(indicator_cons)::Ptr{SCIP_VAR}
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)::Ptr{SCIP_CONS}

    nvars::Int = SCIPgetNVarsLinear(o, linear_cons)
    vars = unsafe_wrap(
        Array{Ptr{SCIP_VAR}},
        SCIPgetVarsLinear(o, linear_cons),
        nvars,
    )

    orig_vars = get_original_variables(vars, nvars)

    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, linear_cons), nvars)
    aff_terms = [
        MOI.ScalarAffineTerm{Float64}(
            vals[i],
            MOI.VariableIndex(ref(o, orig_vars[i]).val),
        ) for i in 1:nvars if orig_vars[i] != slack_var
    ]

    ind_terms = [
        MOI.VectorAffineTerm{Float64}(
            1,
            MOI.ScalarAffineTerm{Float64}(
                1.0,
                MOI.VariableIndex(ref(o, bin_var).val),
            ),
        ),
    ]
    vec_terms = [MOI.VectorAffineTerm{Float64}(2, term) for term in aff_terms]

    return MOI.VectorAffineFunction{Float64}(
        vcat(ind_terms, vec_terms),
        [0.0, 0.0],
    )
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{
        MOI.VectorAffineFunction{T},
        MOI.Indicator{MOI.ACTIVATE_ON_ONE,LT},
    },
) where {T<:Real,LT<:MOI.LessThan}
    _throw_if_invalid(o, ci)
    indicator_cons = cons(o, ci)::Ptr{SCIP_CONS}
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)::Ptr{SCIP_CONS}

    lhs = SCIPgetLhsLinear(o, linear_cons)
    rhs = SCIPgetRhsLinear(o, linear_cons)
    lhs == -SCIPinfinity(o) ||
        error("Have lower bound on indicator constraint!")

    return MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan(rhs))
end

function MOI.get(
    o::Optimizer,
    ::MOI.ListOfConstraintIndices{F,S},
) where {
    F<:MOI.VectorAffineFunction{Float64},
    S<:MOI.Indicator{MOI.ACTIVATE_ON_ONE,MOI.LessThan{Float64}},
}
    return [
        MOI.ConstraintIndex{F,S}(consref.val) for consref in o.constypes[F, S]
    ]
end
