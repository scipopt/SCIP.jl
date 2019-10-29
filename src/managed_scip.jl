"Type-safe wrapper for `Int64`, references a variable."
struct VarRef
    val::Int64
end

"Type-safe wrapper for `Int64`, references a constraint."
struct ConsRef
    val::Int64
end

"ManagedSCIP holds pointers to SCIP data and takes care of memory management."
mutable struct ManagedSCIP
    scip::Ref{Ptr{SCIP_}}
    vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}
    conss::Dict{ConsRef, Ref{Ptr{SCIP_CONS}}}
    var_count::Int64
    cons_count::Int64

    # Map from user-defined Julia types (keys are <: AbstractConstraintHandler
    # or <: AbstractConstraint, respectively) to the corresponding SCIP objects.
    # The reverse mapping is handled by SCIP itself.
    # This also serves to prevent premature GC.
    conshdlrs::Dict{Any, Ptr{SCIP_CONSHDLR}}
    conshdlrconss::Dict{Any, Ptr{SCIP_CONS}}

    function ManagedSCIP()
        scip = Ref{Ptr{SCIP_}}(C_NULL)
        @SC SCIPcreate(scip)
        @assert scip[] != C_NULL
        @SC SCIPincludeDefaultPlugins(scip[])
        @SC SCIP.SCIPcreateProbBasic(scip[], "")

        mscip = new(scip, Dict(), Dict(), 0, 0, Dict(), Dict())
        finalizer(free_scip, mscip)
    end
end

# Protect ManagedSCIP from GC for ccall with Ptr{SCIP_} argument.
Base.unsafe_convert(::Type{Ptr{SCIP_}}, mscip::ManagedSCIP) = mscip.scip[]

"Release references and free memory."
function free_scip(mscip::ManagedSCIP)
    # Avoid double-free (SCIP will set the pointers to NULL).
    if mscip.scip[] != C_NULL
        for c in values(mscip.conss)
            @SC SCIPreleaseCons(mscip, c)
        end
        for v in values(mscip.vars)
            @SC SCIPreleaseVar(mscip, v)
        end
        # only mscip.scip is GC-protected during ccall!
        GC.@preserve mscip begin
            @SC SCIPfree(mscip.scip)
        end
    end
    @assert mscip.scip[] == C_NULL
end

"Set a parameter's current value."
function get_parameter(mscip::ManagedSCIP, name::AbstractString)
    param = SCIPgetParam(mscip, name)
    if param == C_NULL
        error("Unrecognized parameter: $name")
    end
    paramtype = SCIPparamGetType(param)
    if paramtype === SCIP_PARAMTYPE_BOOL
        value = Ref{SCIP_Bool}()
        @SC SCIPgetBoolParam(mscip, name, value)
        if value[] == TRUE
            return true
        elseif value[] == FALSE
            return false
        else
            error("encountered invalid value for a boolean: $(value[])")
        end
    elseif paramtype === SCIP_PARAMTYPE_INT
        value = Ref{Cint}()
        @SC SCIPgetIntParam(mscip, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_LONGINT
        value = Ref{Clonglong}()
        @SC SCIPgetLongintParam(mscip, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_REAL
        value = Ref{Cdouble}()
        @SC SCIPgetRealParam(mscip, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_CHAR
        value = Ref{Cchar}()
        @SC SCIPgetCharParam(mscip, name, value)
        return Char(value[])
    elseif paramtype === SCIP_PARAMTYPE_STRING
        value = Ref{Cstring}()
        @SC SCIPgetStringParam(mscip, name, value)
        return unsafe_string(value[])
    else
        error("Unexpected parameter type: $paramtype")
    end
end

"Set a parameter."
function set_parameter(mscip::ManagedSCIP, name::AbstractString, value)
    param = SCIPgetParam(mscip, name)
    if param == C_NULL
        error("Unrecognized parameter: $name")
    end
    paramtype = SCIPparamGetType(param)
    if paramtype === SCIP_PARAMTYPE_BOOL
        @SC SCIPsetBoolParam(mscip, name, value)
    elseif paramtype === SCIP_PARAMTYPE_INT
        @SC SCIPsetIntParam(mscip, name, value)
    elseif paramtype === SCIP_PARAMTYPE_LONGINT
        @SC SCIPsetLongintParam(mscip, name, value)
    elseif paramtype === SCIP_PARAMTYPE_REAL
        @SC SCIPsetRealParam(mscip, name, value)
    elseif paramtype === SCIP_PARAMTYPE_CHAR
        @SC SCIPsetCharParam(mscip, name, value)
    elseif paramtype === SCIP_PARAMTYPE_STRING
        @SC SCIPsetStringParam(mscip, name, value)
    else
        error("Unexpected parameter type: $paramtype")
    end
    return nothing
end

"Return pointer to SCIP variable."
function var(mscip::ManagedSCIP, vr::VarRef)::Ptr{SCIP_VAR}
    return mscip.vars[vr][]
end

"Return pointer to SCIP constraint."
function cons(mscip::ManagedSCIP, cr::ConsRef)::Ptr{SCIP_CONS}
    return mscip.conss[cr][]
end

"Store reference to variable, return VarRef"
function store_var!(mscip::ManagedSCIP, var__::Ref{Ptr{SCIP_VAR}})
    mscip.var_count += 1
    vr = VarRef(mscip.var_count)
    mscip.vars[vr] = var__
    return vr
end

"Store reference to constraint, return ConsRef"
function store_cons!(mscip::ManagedSCIP, cons__::Ref{Ptr{SCIP_CONS}})
    mscip.cons_count += 1
    cr = ConsRef(mscip.cons_count)
    mscip.conss[cr] = cons__
    return cr
end

"Add variable to problem (continuous, no bounds), return var ref."
function add_variable(mscip::ManagedSCIP)
    var__ = Ref{Ptr{SCIP_VAR}}(C_NULL)
    @SC SCIPcreateVarBasic(mscip, var__, "", -SCIPinfinity(mscip), SCIPinfinity(mscip),
                           0.0, SCIP_VARTYPE_CONTINUOUS)
    @SC SCIPaddVar(mscip, var__[])
    return store_var!(mscip, var__)
end

"Delete variable from problem."
function delete(mscip::ManagedSCIP, vr::VarRef)
    # delete variable from SCIP problem
    deleted = Ref{SCIP_Bool}()
    @SC SCIPdelVar(mscip, var(mscip, vr), deleted)
    deleted[] == TRUE || error("Variable at $(vr.val) could not be deleted!")

    # release memory and remove reference
    @SC SCIPreleaseVar(mscip, mscip.vars[vr])
    delete!(mscip.vars, vr)
    return nothing
end

"Delete constraint from problem."
function delete(mscip::ManagedSCIP, cr::ConsRef)
    @SC SCIPdelCons(mscip, cons(mscip, cr))

    # release memory and remove reference
    @SC SCIPreleaseCons(mscip, mscip.conss[cr])
    delete!(mscip.conss, cr)
    return nothing
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
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicLinear(
        mscip, cons__, "", length(vars), vars, coefs, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
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

    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicQuadratic(
        mscip, cons__, "", length(linvars), linvars, lincoefs,
        length(quadvars1), quadvars1, quadvars2, quadcoefs, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
end

"""
Add second-order-cone constraint to problem, return cons ref.

Does not support the full generality of SCIP's constraint (offsets and
coefficients). The first entry in `varrefs` is used for the special variable on
the right-hand side.
"""
function add_second_order_cone_constraint(mscip::ManagedSCIP, varrefs)
    vars = [var(mscip, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicSOC(mscip, cons__, "", length(vars) - 1,
                               vars[2:end], C_NULL, C_NULL, 0.0, vars[1], 1.0, 0.0)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
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
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicSOS1(mscip, cons__, "", length(vars), vars, weights)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
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
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicSOS2(mscip, cons__, "", length(vars), vars, weights)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
end

"""
Add abspower constraint to problem, return cons ref.

    lhs ≤ sign(x + a) * abs(x + a)^n + c*z ≤ rhs

# Arguments
- `x::VarRef`: reference for power variable
- `a::Float64`: offset for power variable
- `n::Float64`: exponent for power variable, n >= 1
- `z::VarRef`: reference for linear variable
- `c::Float64`: coefficient for linear variable
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_abspower_constraint(mscip::ManagedSCIP, x, a, n, z, c, lhs, rhs)
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateConsBasicAbspower(
        mscip, cons__, "", var(mscip, x), var(mscip, z), n, a, c, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
end

"""
Add indicator constraint to problem, return cons ref.

    y = 1 ==> a^T x ≤ rhs

y has to be a binary variable, or SCIP will error.

# Arguments
- `y::VarRef`: reference for binary indicator variable
- `x::Vector{VarRef}`: reference vector for variables
- `a::Float64`: coefficients for x variable
- `rhs::Float64`: right-hand side for linear constraint
"""
function add_indicator_constraint(mscip::ManagedSCIP, y, x, a, rhs)
    SCIPvarIsBinary(var(mscip, y)) > 0 || error("indicator variable must be binary.")
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    xref = [var(mscip, x[i]) for i in eachindex(x)]
    @SC SCIPcreateConsBasicIndicator(
        mscip, cons__, "", var(mscip, y), length(x), xref, a, rhs
    )
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
end

# Transform SCIP C function name as follows:
# 1. Remove leading "SCIP" part (drop the first four characters).
# 2. Convert camel case to snake case.
# For example, `SCIPprintStatusStatistics` becomes `print_status_statistics`.
const STATISTICS_FUNCS = map(x -> Symbol(camel_case_to_snake_case(string(x)[5 : end])), SCIP_STATISTICS_FUNCS)

for (scip_statistics_func, statistics_func) in zip(SCIP_STATISTICS_FUNCS, STATISTICS_FUNCS)
    @eval begin
        """
            $($statistics_func)(mscip::ManagedSCIP)

        Print statistics (calls `$($scip_statistics_func)`) to standard output.
        """
        function $statistics_func end

        function $statistics_func(mscip::ManagedSCIP)
            ret = $scip_statistics_func(mscip, C_NULL)
            ret !== nothing && @assert ret == SCIP_OKAY
            return nothing
        end
    end
end
