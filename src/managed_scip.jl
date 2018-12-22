# holds pointers to SCIP data and takes care of memory mgmt
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

"Release references and free memory"
function free_scip(mscip::ManagedSCIP)
    # avoid double-free
    if mscip.scip[] != C_NULL
        for cons in mscip.conss
            @SC SCIPreleaseCons(mscip.scip[], cons)
        end
        for var in mscip.vars
            @SC SCIPreleaseVar(mscip.scip[], var)
        end
        @SC SCIPfree(mscip.scip)
    end
    @assert mscip.scip[] == C_NULL
end

"Returns pointer to SCIP instance"
get_scip(mscip::ManagedSCIP) = mscip.scip[]

"Returns pointer to SCIP variable"
get_var(mscip::ManagedSCIP, i::Int) = mscip.vars[i][]

"Returns pointer to SCIP constraint"
get_cons(mscip::ManagedSCIP, i::Int) = mscip.conss[i][]

"Add variable to problem (continuous, no bounds)"
function add_variable(mscip::ManagedSCIP)
    var = Ref{Ptr{SCIP_VAR}}()
    @SC rc = SCIPcreateVarBasic(
        mscip.scip[], var, "", -SCIPinfinity(mscip.scip[]),
        SCIPinfinity(mscip.scip[]), 0.0, SCIP_VARTYPE_CONTINUOUS)
    @SC rc = SCIPaddVar(mscip.scip[], var[])

    push!(mscip.vars, var)
    # can't delete variable, so we use the array position as index
    return length(mscip.vars)
end

"Add (ranged) linear constraint to problem"
function add_linear_constraint(mscip::ManagedSCIP, varidx, coeffs, lhs, rhs)
    @assert length(varidx) == length(coeffs)
    vars = [get_var(mscip, i) for i in varidx]
    cons = Ref{Ptr{SCIP_CONS}}()
    @SC rc = SCIPcreateConsBasicLinear(
        mscip.scip[], cons, "", length(vars), vars, coeffs, lhs, rhs)
    @SC rc = SCIPaddCons(mscip.scip[], cons[])

    push!(mscip.conss, cons)
    # can't delete constraint, so we use the array position as index
    return length(mscip.conss)
end

"Set generic parameter"
function set_parameter(mscip::ManagedSCIP, name::String, value)
    @SC SCIPsetParam(get_scip(mscip), name, Ptr{Cvoid}(value))
    return nothing
end
