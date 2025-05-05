# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function MOI.supports_constraint(
    ::Optimizer,
    ::Type{MOI.VectorAffineFunction{Float64}},
    ::Type{MOI.Indicator{MOI.ACTIVATE_ON_ONE,MOI.LessThan{Float64}}},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    func::MOI.VectorAffineFunction{Float64},
    set::S,
) where {S<:MOI.Indicator{MOI.ACTIVATE_ON_ONE,MOI.LessThan{Float64}}}
    allow_modification(o)
    z, a, x = nothing, Float64[], VarRef[]
    for vaf_term in func.terms
        if vaf_term.output_index == 1
            @assert isone(vaf_term.scalar_term.coefficient)
            @assert z === nothing
            z = VarRef(vaf_term.scalar_term.variable.value)
        else
            @assert vaf_term.output_index == 2
            push!(a, vaf_term.scalar_term.coefficient)
            push!(x, VarRef(vaf_term.scalar_term.variable.value))
        end
    end
    @assert z isa VarRef
    # z --> {a^T x + b <= c} ===> z --> {a^T x <= c - b}
    b = MOI.constant(set.set) - func.constants[2]
    cr = add_indicator_constraint(o.inner, z, x, a, b)
    ci = MOI.ConstraintIndex{MOI.VectorAffineFunction{Float64},S}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{
        MOI.VectorAffineFunction{Float64},
        MOI.Indicator{MOI.ACTIVATE_ON_ONE,MOI.LessThan{Float64}},
    },
)
    _throw_if_invalid(o, ci)
    indicator_cons = cons(o, ci)
    bin_var = SCIPgetBinaryVarIndicator(indicator_cons)
    slack_var = SCIPgetSlackVarIndicator(indicator_cons)
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)
    nvars = SCIPgetNVarsLinear(o, linear_cons)
    vars = unsafe_wrap(
        Array{Ptr{SCIP_VAR}},
        SCIPgetVarsLinear(o, linear_cons),
        nvars,
    )
    orig_vars = get_original_variables(vars, nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(o, linear_cons), nvars)
    y = MOI.VariableIndex(ref(o, bin_var).val)
    terms = MOI.VectorAffineTerm{Float64}[]
    push!(
        terms,
        MOI.VectorAffineTerm{Float64}(1, MOI.ScalarAffineTerm{Float64}(1.0, y)),
    )
    for i in 1:nvars
        if orig_vars[i] != slack_var
            xi = MOI.VariableIndex(ref(o, orig_vars[i]).val)
            term = MOI.ScalarAffineTerm{Float64}(vals[i], xi)
            push!(terms, MOI.VectorAffineTerm{Float64}(2, term))
        end
    end
    return MOI.VectorAffineFunction{Float64}(terms, zeros(2))
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{
        MOI.VectorAffineFunction{Float64},
        MOI.Indicator{MOI.ACTIVATE_ON_ONE,MOI.LessThan{Float64}},
    },
)
    _throw_if_invalid(o, ci)
    indicator_cons = cons(o, ci)::Ptr{SCIP_CONS}
    linear_cons = SCIPgetLinearConsIndicator(indicator_cons)::Ptr{SCIP_CONS}
    rhs = SCIPgetRhsLinear(o, linear_cons)
    return MOI.Indicator{MOI.ACTIVATE_ON_ONE}(MOI.LessThan{Float64}(rhs))
end
