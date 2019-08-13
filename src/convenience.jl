## Related to constraint handlers

"""
Recover Julia object which is attached to user constraint (via constraint data).
"""
function user_constraint(cons_::Ptr{SCIP_CONS})
    @assert cons_ != C_NULL
    consdata_::Ptr{SCIP.SCIP_CONSDATA} = SCIPconsGetData(cons_)
    return unsafe_pointer_to_objref(consdata_)
end

"""
Extract solution values for given variables.
"""
function sol_values(o::Optimizer, vars::AbstractArray{VI}, sol::Ptr{SCIP_SOL}=C_NULL)
    return [SCIPgetSolVal(o, sol, var(o, vi)) for vi in vars]
end
