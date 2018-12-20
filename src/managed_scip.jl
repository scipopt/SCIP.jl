# holds pointers to SCIP data and takes care of memory mgmt
mutable struct ManagedSCIP
    scip::Ref{Ptr{SCIP_}}
    vars::Vector{Ref{Ptr{SCIP_VAR}}}
    conss::Vector{Ref{Ptr{SCIP_CONS}}}

    function ManagedSCIP()
        scip = Ref{Ptr{SCIP_}}()
        rc = SCIPcreate(scip)
        @assert rc == SCIP_OKAY
        @assert scip[] != C_NULL
        rc = SCIPincludeDefaultPlugins(scip[])
        @assert rc == SCIP_OKAY
        rc = SCIP.SCIPcreateProbBasic(scip[], "")
        @assert rc == SCIP_OKAY

        mscip = new(scip, [], [])
        finalizer(free_scip, mscip)
    end
end

"Release references and free memory"
function free_scip(mscip::ManagedSCIP)
    # avoid double-free
    if mscip.scip[] != C_NULL
        for cons in mscip.conss
            rc = SCIPreleaseCons(mscip.scip[], cons)
            @assert rc == SCIP_OKAY
        end
        for var in mscip.vars
            rc = SCIPreleaseVar(mscip.scip[], var)
            @assert rc == SCIP_OKAY
        end
        rc = SCIPfree(mscip.scip)
        @assert rc == SCIP_OKAY
    end
    @assert mscip.scip[] == C_NULL
end

"Add variable to problem (continuous, no bounds)"
function add_variable(mscip::ManagedSCIP)
    var = Ref{Ptr{SCIP_VAR}}()
    rc = SCIPcreateVarBasic(
        mscip.scip[], var, "", -SCIPinfinity(mscip.scip[]),
        SCIPinfinity(mscip.scip[]), 0.0, SCIP_VARTYPE_CONTINUOUS)
    @assert rc == SCIP_OKAY
    rc = SCIPaddVar(mscip.scip[], var[])
    @assert rc == SCIP_OKAY

    push!(mscip.vars, var)
    # can't delete variable, so we use the array position as index
    return length(mscip.vars)
end

"Add (ranged) linear constraint to problem"
function add_linear_constraint(mscip::ManagedSCIP, varidx, coeffs, lhs, rhs)
    @assert length(varidx) == length(coeffs)
    vars = [mscip.vars[i][] for i in varidx]
    cons = Ref{Ptr{SCIP_CONS}}()
    rc = SCIPcreateConsBasicLinear(
        mscip.scip[], cons, "", length(vars), vars, coeffs, lhs, rhs)
    @assert rc == SCIP_OKAY
    rc = SCIPaddCons(mscip.scip[], cons[])
    @assert rc == SCIP_OKAY

    push!(mscip.conss, cons)
    # can't delete constraint, so we use the array position as index
    return length(mscip.conss)
end
