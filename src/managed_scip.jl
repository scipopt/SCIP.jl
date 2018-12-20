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
        # TODO: release all constraints
        # TODO: release all variables
        rc = SCIP.SCIPfree(mscip.scip)
        @assert rc == SCIP_OKAY
    end
    @assert mscip.scip[] == C_NULL
end
