"ManagedSCIP holds pointers to SCIP data and takes care of memory management."
mutable struct ManagedSCIP
    scip::Ref{Ptr{SCIP_}}
    vars::Vector{Ref{Ptr{SCIP_VAR}}}
    conss::Vector{Ref{Ptr{SCIP_CONS}}}

    function ManagedSCIP()
        scip = Ref{Ptr{SCIP_}}()
        @SC SCIPcreate(scip)
        @assert scip[] != C_NULL
        @SC SCIPincludeDefaultPlugins(scip[])
        @SC SCIP.SCIPcreateProbBasic(scip[], "")

        mscip = new(scip, [], [])
        finalizer(free_scip, mscip)
    end
end

"Release references and free memory."
function free_scip(mscip::ManagedSCIP)
    # Avoid double-free (SCIP will set the pointers to NULL).
    s = scip(mscip)
    if s != C_NULL
        for c in mscip.conss
            @SC SCIPreleaseCons(s, c)
        end
        for v in mscip.vars
            @SC SCIPreleaseVar(s, v)
        end
        @SC SCIPfree(mscip.scip)
    end
    @assert scip(mscip) == C_NULL
end

"Type-safe wrapper for `Int64`, references a variable."
struct VarRef
    val::Int64
end

"Type-safe wrapper for `Int64`, references a constraint."
struct ConsRef
    val::Int64
end

"Return pointer to SCIP instance."
scip(mscip::ManagedSCIP) = mscip.scip[]

"Return pointer to SCIP variable."
var(mscip::ManagedSCIP, vr::VarRef) = mscip.vars[vr.val][]

"Return pointer to SCIP constraint."
cons(mscip::ManagedSCIP, cr::ConsRef) = mscip.conss[cr.val][]

"Add variable to problem (continuous, no bounds), return var ref."
function add_variable(mscip::ManagedSCIP)
    s = scip(mscip)
    var__ = Ref{Ptr{SCIP_VAR}}()
    @SC SCIPcreateVarBasic(s, var__, "", -SCIPinfinity(s), SCIPinfinity(s),
                           0.0, SCIP_VARTYPE_CONTINUOUS)
    @SC SCIPaddVar(s, var__[])

    push!(mscip.vars, var__)
    # can't delete variable, so we use the array position as index
    return VarRef(length(mscip.vars))
end

"""
Add (ranged) linear constraint to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references for affine terms.
- `coefs::AbstractArray{Float64}`: coefficients for affine terms.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_linear_constraint(mscip::ManagedSCIP, varrefs, coefs, lhs, rhs)
    @assert length(varrefs) == length(coefs)
    vars = [var(mscip, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicLinear(
        scip(mscip), cons__, "", length(vars), vars, coefs, lhs, rhs)
    @SC SCIPaddCons(scip(mscip), cons__[])

    push!(mscip.conss, cons__)
    # can't delete constraint, so we use the array position as index
    return ConsRef(length(mscip.conss))
end

"""
Add (ranged) quadratic constraint to problem, return cons ref.

# Arguments
- `linrefs::AbstractArray{VarRef}`: variable references for affine terms.
- `lincoefs::AbstractArray{Float64}`: coefficients for affine terms.
- `quadrefs1::AbstractArray{VarRef}`: first variable references for quadratic terms.
- `quadrefs2::AbstractArray{VarRef}`: second variable references for quadratic terms.
- `quadcoefs::AbstractArray{Float64}`: coefficients for quadratic terms.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_quadratic_constraint(mscip::ManagedSCIP, linrefs, lincoefs,
                                  quadrefs1, quadrefs2, quadcoefs, lhs, rhs)
    @assert length(linrefs) == length(lincoefs)
    @assert length(quadrefs1) == length(quadrefs2)
    @assert length(quadrefs1) == length(quadcoefs)

    linvars = [var(mscip, vr) for vr in linrefs]
    quadvars1 = [var(mscip, vr) for vr in quadrefs1]
    quadvars2 = [var(mscip, vr) for vr in quadrefs2]

    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicQuadratic(
        scip(mscip), cons__, "", length(linvars), linvars, lincoefs,
        length(quadvars1), quadvars1, quadvars2, quadcoefs, lhs, rhs)
    @SC SCIPaddCons(scip(mscip), cons__[])

    push!(mscip.conss, cons__)
    # can't delete constraint, so we use the array position as index
    return ConsRef(length(mscip.conss))
end

"""
Add second-order-cone constraint to problem, return cons ref.

Does not support the full generality of SCIP's constraint (offsets and
coefficients). The first entry in `varrefs` is used for the special variable on
the right-hand side.
"""
function add_second_order_cone_constraint(mscip::ManagedSCIP, varrefs)
    vars = [var(mscip, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicSOC(scip(mscip), cons__, "", length(vars) - 1,
                               vars[2:end], C_NULL, C_NULL, 0.0, vars[1], 1.0, 0.0)
    @SC SCIPaddCons(scip(mscip), cons__[])

    push!(mscip.conss, cons__)
    # can't delete constraint, so we use the array position as index
    return ConsRef(length(mscip.conss))
end

"""
Add special-ordered-set of type 1 to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references
- `weights::AbstractArray{Float64}`: numeric weights
"""
function add_special_ordered_set_type1(mscip::ManagedSCIP, varrefs, weights)
    @assert length(varrefs) == length(weights)
    vars = [var(mscip, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicSOS1(
        scip(mscip), cons__, "", length(vars), vars, weights)
    @SC SCIPaddCons(scip(mscip), cons__[])

    push!(mscip.conss, cons__)
    # can't delete constraint, so we use the array position as index
    return ConsRef(length(mscip.conss))
end

"""
Add special-ordered-set of type 2 to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references
- `weights::AbstractArray{Float64}`: numeric weights
"""
function add_special_ordered_set_type2(mscip::ManagedSCIP, varrefs, weights)
    @assert length(varrefs) == length(weights)
    vars = [var(mscip, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicSOS2(
        scip(mscip), cons__, "", length(vars), vars, weights)
    @SC SCIPaddCons(scip(mscip), cons__[])

    push!(mscip.conss, cons__)
    # can't delete constraint, so we use the array position as index
    return ConsRef(length(mscip.conss))
end

"Set generic parameter."
function set_parameter(mscip::ManagedSCIP, name::String, value)
    @SC SCIPsetParam(scip(mscip), name, Ptr{Cvoid}(value))
    return nothing
end
