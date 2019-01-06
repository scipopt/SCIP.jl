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
    scip = get_scip(mscip)
    if scip != C_NULL
        for cons in mscip.conss
            @SC SCIPreleaseCons(scip, cons)
        end
        for var in mscip.vars
            @SC SCIPreleaseVar(scip, var)
        end
        @SC SCIPfree(mscip.scip)
    end
    @assert get_scip(mscip) == C_NULL
end

"Return pointer to SCIP instance."
get_scip(mscip::ManagedSCIP) = mscip.scip[]

"Return pointer to SCIP variable."
get_var(mscip::ManagedSCIP, i::Int) = mscip.vars[i][]

"Return pointer to SCIP constraint."
get_cons(mscip::ManagedSCIP, i::Int) = mscip.conss[i][]

"Add variable to problem (continuous, no bounds), return variable index."
function add_variable(mscip::ManagedSCIP)
    scip = get_scip(mscip)
    var = Ref{Ptr{SCIP_VAR}}()
    @SC rc = SCIPcreateVarBasic(
        scip, var, "", -SCIPinfinity(scip),
        SCIPinfinity(scip), 0.0, SCIP_VARTYPE_CONTINUOUS)
    @SC rc = SCIPaddVar(scip, var[])

    push!(mscip.vars, var)
    # can't delete variable, so we use the array position as index
    return length(mscip.vars)
end

"""
Add (ranged) linear constraint to problem, return constraint index.

# Arguments
- `varidx::AbstractArray{Int}`: indices of variables for affine terms.
- `coeffs::AbstractArray{Float64}`: coefficients for affine terms.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_linear_constraint(mscip::ManagedSCIP, varidx, coeffs, lhs, rhs)
    @assert length(varidx) == length(coeffs)
    scip = get_scip(mscip)
    vars = [get_var(mscip, i) for i in varidx]
    cons = Ref{Ptr{SCIP_CONS}}()
    @SC rc = SCIPcreateConsBasicLinear(
        scip, cons, "", length(vars), vars, coeffs, lhs, rhs)
    @SC rc = SCIPaddCons(scip, cons[])

    push!(mscip.conss, cons)
    # can't delete constraint, so we use the array position as index
    return length(mscip.conss)
end

"Set generic parameter."
function set_parameter(mscip::ManagedSCIP, name::String, value)
    @SC SCIPsetParam(get_scip(mscip), name, Ptr{Cvoid}(value))
    return nothing
end
