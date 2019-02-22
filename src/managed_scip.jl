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

    function ManagedSCIP()
        scip = Ref{Ptr{SCIP_}}()
        @SC SCIPcreate(scip)
        @assert scip[] != C_NULL
        @SC SCIPincludeDefaultPlugins(scip[])
        @SC SCIP.SCIPcreateProbBasic(scip[], "")

        mscip = new(scip, Dict(), Dict(), 0, 0)
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

"Set generic parameter."
function set_parameter(mscip::ManagedSCIP, name::String, value)
    @SC SCIPsetParam(mscip, name, Ptr{Cvoid}(value))
    return nothing
end

"Return pointer to SCIP variable."
var(mscip::ManagedSCIP, vr::VarRef) = mscip.vars[vr][]

"Return pointer to SCIP constraint."
cons(mscip::ManagedSCIP, cr::ConsRef) = mscip.conss[cr][]

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
    var__ = Ref{Ptr{SCIP_VAR}}()
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
    cons__ = Ref{Ptr{SCIP_CONS}}()
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

    cons__ = Ref{Ptr{SCIP_CONS}}()
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
    cons__ = Ref{Ptr{SCIP_CONS}}()
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
    cons__ = Ref{Ptr{SCIP_CONS}}()
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
    cons__ = Ref{Ptr{SCIP_CONS}}()
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
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicAbspower(
        mscip, cons__, "", var(mscip, x), var(mscip, z), n, a, c, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])
    return store_cons!(mscip, cons__)
end

"""
Add nonlinear constraint to problem, return cons ref.

    lhs ≤ expression ≤ rhs

The expression is given as a graph of operators, including variable references
and constant values. The last operator gives the root of the expression graph.
Indexing is 1-based for arguments, but 0-based for what is passed to SCIP.

# Arguments
- `operators::Vector{SCIP_ExprOp}`: operator types for nodes
- `offsets::Vector{Int}`: node `k` has children indexed from offsets[k] up to
  offsets[k+1] (exclusive)
- `children::Vector{Int}`: indices into operators, variables or values
  (depending on operator type)
- `values::Vector{Float64}`: Constant values (as children of operators)
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

"""
function add_nonlinear_constraint(mscip::ManagedSCIP, operators::Vector{SCIP_ExprOp},
                                  offsets::Vector{Int}, children::Vector{Int},
                                  values::Vector{Float64}, lhs::Float64, rhs::Float64)
    # create expression graph object
    tree__ = Ref{Ptr{SCIP_EXPRTREE}}()
    blkmem = SCIPblkmem(mscip)
    exprs = Ptr{SCIP_EXPR}[]
    vars = Ptr{SCIP_VAR}[]

    for i in 1:length(operators)
        op = operators[i]
        nchildren = offsets[i + 1] - offsets[i]
        expr__ = Ref{Ptr{SCIP_EXPR}}()
        if op == SCIP_EXPR_VARIDX
            nchildren == 1 || error("Need one child for op. $(op)!")
            @SC SCIPexprCreate(blkmem, expr__, op, Cint(length(vars)))
            push!(vars, var(mscip, VarRef(children[offsets[i]])))
        elseif op == SCIP_EXPR_CONST
            nchildren == 1 || error("Need one child for op. $(op)!")
            @SC SCIPexprCreate(blkmem, expr__, op, values[children[offsets[i]]])
        elseif op == SCIP_EXPR_MINUS
            if nchildren == 2      # binary op.
                @SC SCIPexprCreate(blkmem, expr__, op, exprs[children[offsets[i]]], exprs[children[offsets[i] + 1]])
            elseif nchildren == 1  # unary op. (0 - expr)
                zeroexpr__ = Ref{Ptr{SCIP_EXPR}}()
                @SC SCIPexprCreate(blkmem, zeroexpr__, op, 0.0)
                @SC SCIPexprCreate(blkmem, expr__, op, zeroexpr__[], exprs[children[offsets[i]]])
            else
                error("Only unary or binary op. $(op) supported!")
            end
        elseif op == SCIP_EXPR_REALPOWER
            nchildren == 2 || error("Need two children for op. $(op)!")
            base = exprs[children[offsets[i]]]
            exponent_expr = children[offsets[i] + 1] # is SCIP_EXPR_CONST,
            exponent = values[children[offsets[exponent_expr]]] # directly get value
            @SC SCIPexprCreate(blkmem, expr__, op, base, exponent)
        elseif op == SCIP_EXPR_DIV
            nchildren == 2 || error("Need two children for op. $(op)!")
            @SC SCIPexprCreate(blkmem, expr__, op, exprs[children[offsets[i]]], exprs[children[offsets[i] + 1]])
        elseif op in [SCIP_EXPR_SQRT, SCIP_EXPR_EXP, SCIP_EXPR_LOG]
            nchildren == 1 || error("Need one child for op. $(op)!")
            @SC SCIPexprCreate(blkmem, expr__, op, exprs[children[offsets[i]]])
        elseif op in [SCIP_EXPR_SUM, SCIP_EXPR_PRODUCT]
            childexprs = exprs[children[range(offsets[i], length=nchildren)]]
            @SC SCIPexprCreate(blkmem, expr__, op, Cint(nchildren), childexprs)
        else
            error("Operator $(op) not supported in nonlinear expressions!")
        end
        push!(exprs, expr__[])
    end

    @SC SCIPexprtreeCreate(SCIPblkmem(mscip), tree__, exprs[end], length(vars), 0, C_NULL)
    @SC SCIPexprtreeSetVars(tree__[], length(vars), vars)

    # create and add cons_nonlinear
    cons__ = Ref{Ptr{SCIP_CONS}}()
    @SC SCIPcreateConsBasicNonlinear(mscip, cons__, "", 0, C_NULL, C_NULL,
                                     1, tree__, C_NULL, lhs, rhs)
    @SC SCIPaddCons(mscip, cons__[])

    # free memory
    @SC SCIPexprtreeFree(tree__)

    # register and return cons ref
    return store_cons!(mscip, cons__)
end
