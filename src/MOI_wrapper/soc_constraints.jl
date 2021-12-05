# second-order-cone constraints

MOI.supports_constraint(o::Optimizer, ::Type{VAF}, ::Type{SOC}) = true

# Accepts general VectorAffineFunction with two elements:
#   (a * t + γ, ∑_i α_i x_i + β_i) ∈ SOC
# ⇔ ∑_i (α_i^2 x_i^2 + 2 α_i β_i x_i + β_i^2) - a^2 t^2 - 2 a γ t - γ^2 ≤ 0
# ⇔ ∑_i (α_i^2 x_i^2 + 2 α_i β_i x_i) - a^2 t^2 - 2 a γ t ≤ γ^2 - ∑_i β_i^2
function MOI.add_constraint(o::Optimizer, func::VAF, ::SOC)
    dim = MOI.output_dimension(func)
    if dim < 2
        throw(ArgumentError("Second order cones should have at least two terms"))
    end

    γ = func.constants[1]
    x = fill(MOI.VariableIndex(-1), dim - 1)
    α = zeros(dim - 1)
    β = func.constants[2:end]
    a = 0.0
    # dummy flag to check correctness
    t = MOI.VariableIndex(-1)
    for term in f.terms
        if term.output_index == 1
            # if t already set, variable should be the same
            if t ∉ (MOI.VariableIndex(-1), term.scalar_term.variable)
                error("Setting multiple variables $(t) and $(term.scalar_term.variable) as RHS of SOC")
            end
            t = term.scalar_term.variable
            a += term.scalar_term.coefficient
        else
            if x[term.output_dimension - 1] ∉ (MOI.VariableIndex(-1), term.scalar_term.variable)
                error("Setting multiple variables at dimension $(term.output_dimension - 1)")
            end
            x[term.output_dimension - 1] = term.scalar_term.variable
            α[term.output_dimension - 1] += term.scalar_term.coefficient
        end
    end

    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)

    varrefs = [VarRef(vi.value) for vi in x]
    push!(varrefs, VarRef(t.value))
    lincoefs = 2 * [α .* β; -2a*γ]
    quadcoefs = [α.^2; -a^2]
    rhs = γ^2 - sum(abs2, β)

    allow_modification(o)
    @SCIP_CALL SCIPcreateConsBasicQuadraticNonlinear(
        o,inner, cons__, "",
        length(varrefs), varrefs, lincoefs,
        length(varrefs), varrefs, varrefs, quadcoefs,
        -SCIPinfinity(o,inner), rhs,
    )
    @SCIP_CALL SCIPaddCons(o.inner, cons__[])
    cr = store_cons!(o.inner, cons__)

    ci = CI{VAF, SOC}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{VECTOR, SOC})
    _throw_if_invalid(o, ci)
    c = cons(o, ci)::Ptr{SCIP_CONS}
    nvars::Int = SCIPgetNLhsVarsSOC(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetLhsVarsSOC(o, c), nvars)
    rhsvar = SCIPgetRhsVarSOC(o, c)

    ptr2index(p) = VI(ref(o, p).val)
    return VECTOR(vcat([ptr2index(rhsvar)], ptr2index.(vars)))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{VECTOR, SOC})
    _throw_if_invalid(o, ci)
    c = cons(o, ci)::Ptr{SCIP_CONS}
    nvars::Int = SCIPgetNLhsVarsSOC(o, c)
    return MOI.SecondOrderCone(nvars + 1)
end
