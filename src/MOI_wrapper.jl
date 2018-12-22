using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex

const PtrMap = Dict{Ptr{Cvoid}, Int}
const ConsTypeMap = Dict{Tuple{DataType, DataType}, Vector{Int}}

mutable struct Optimizer <: MOI.AbstractOptimizer
    mscip::ManagedSCIP
    index::PtrMap
    constypes::ConsTypeMap
    params::Dict{String,Any}

    Optimizer() = new(ManagedSCIP(), PtrMap(), ConsTypeMap(), Dict())
end


## convenience functions (not part of MOI)

"Returns pointer to SCIP instance"
get_scip(o::Optimizer) = get_scip(o.mscip)

"Returns pointer to SCIP variable"
get_var(o::Optimizer, v::VI) = get_var(o.mscip, v.value)

"Returns index of SCIP variable/constraint"
get_index(o::Optimizer, var::Ptr{Cvoid}) = o.index[var]

"Returns pointer to SCIP constraint"
get_cons(o::Optimizer, c::CI{F,S}) where {F,S} = get_cons(o.mscip, c.value)

"Extract bounds from sets"
bounds(set::MOI.EqualTo{Float64}) = (set.value, set.value)
bounds(set::MOI.GreaterThan{Float64}) = (set.lower, nothing)
bounds(set::MOI.LessThan{Float64}) = (nothing, set.upper)
bounds(set::MOI.Interval{Float64}) = (set.lower, set.upper)

"Make set from bounds"
function from_bounds(::Type{MOI.EqualTo{Float64}}, lower, upper)
    @assert lower == upper
    return MOI.EqualTo{Float64}(lower)
end
function from_bounds(::Type{MOI.GreaterThan{Float64}}, lower, upper)
    MOI.GreaterThan{Float64}(lower)
end
function from_bounds(::Type{MOI.LessThan{Float64}}, lower, upper)
    MOI.LessThan{Float64}(upper)
end
function from_bounds(::Type{MOI.Interval{Float64}}, lower, upper)
    MOI.Interval{Float64}(lower, upper)
end

"Register variable in mapping"
function register!(o::Optimizer, var::Ptr{SCIP_VAR}, index::Int)
    @assert !haskey(o.index, var)
    o.index[var] = index
    return index
end

"Register constraint in mapping"
function register!(o::Optimizer, c::CI{F,S}) where {F,S}
    if haskey(o.constypes, (F, S))
        push!(o.constypes[F,S], c.value)
    else
        o.constypes[F,S] = [c.value]
    end
    return c
end

"Go back from solved stage to problem modification stage, invalidating results."
function allow_modification(o::Optimizer)
    scip = get_scip(o)
    if SCIPgetStage(scip) != SCIP_STAGE_PROBLEM
        @SC SCIPfreeTransform(scip)
    end
    return nothing
end

## general queries and support

MOI.get(::Optimizer, ::MOI.SolverName) = "SCIP"

# support variable bounds and linear constraints
const SF = Union{MOI.SingleVariable,
                 MOI.ScalarAffineFunction{Float64}}
const SS = Union{MOI.EqualTo{Float64},
                 MOI.GreaterThan{Float64},
                 MOI.LessThan{Float64},
                 MOI.Interval{Float64}}
MOI.supports_constraint(o::Optimizer, ::Type{<:SF}, ::Type{<:SS}) = true

MOI.supports(::Optimizer, ::MOI.ObjectiveSense) = true
MOI.supports(::Optimizer, ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}) = true

MOIU.supports_default_copy_to(model::Optimizer, copy_names::Bool) = true

struct Param <: MOI.AbstractOptimizerAttribute
    name::String
end
function MOI.set(o::Optimizer, param::Param, value)
    o.params[param.name] = value
    set_parameter(o.mscip, param.name, value)
    return nothing
end

## model creation, query and modification

function MOI.is_empty(o::Optimizer)
    length(o.mscip.vars) == 0 && length(o.mscip.conss) == 0
end

function MOI.empty!(o::Optimizer)
    # free the underlying problem
    finalize(o.mscip)
    # create a new one
    o.mscip = ManagedSCIP()
    # clear auxiliary mapping structures
    o.index = PtrMap()
    o.constypes = ConsTypeMap()
    # reapply parameters
    for pair in o.params
        set_parameter(o.mscip, pair.first, pair.second)
    end
    return nothing
end

function MOI.copy_to(dest::Optimizer, src::MOI.ModelLike; kws...)
    MOIU.automatic_copy_to(dest, src; kws...)
end

MOI.get(o::Optimizer, ::MOI.Name) = SCIPgetProbName(get_scip(o))
MOI.set(o::Optimizer, ::MOI.Name, name::String) = @SC SCIPsetProbName(get_scip(o), name)

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    i::Int = add_variable(o.mscip)
    var::Ptr{SCIP_VAR} = o.mscip.vars[i][] # i == end
    register!(o, var, i)
    return MOI.VariableIndex(i)
end

MOI.add_variables(o::Optimizer, n) = [MOI.add_variable(o) for i=1:n]
MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.mscip.vars)
MOI.get(o::Optimizer, ::MOI.ListOfVariableIndices) = VI.(1:length(o.mscip.vars))

MOI.get(o::Optimizer, ::MOI.VariableName, vi::VI) = SCIPvarGetName(get_var(o, vi))
function MOI.set(o::Optimizer, ::MOI.VariableName, vi::VI, name::String)
    @SC SCIPchgVarName(get_scip(o), get_var(o, vi), name)
end

function MOI.get(o::Optimizer, ::Type{VI}, name::String)
    var = SCIPfindVar(get_scip(o), name)
    return VI(o.index[var])
end

function MOI.add_constraint(o::Optimizer, func::MOI.SingleVariable,
                            set::S) where S <: SS
    allow_modification(o)
    var = get_var(o, func.variable)
    lb, ub = bounds(set)
    lb == nothing || @SC SCIPchgVarLb(get_scip(o), var, lb)
    ub == nothing || @SC SCIPchgVarUb(get_scip(o), var, ub)
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{MOI.SingleVariable, S}(i))
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet,
                 ci::CI{MOI.SingleVariable,S}, set::S) where {S <: SS}
    allow_modification(o)
    var = get_var(o, VI(ci.value)) # cons index is actually var index
    lb, ub = bounds(set)
    lb == nothing || @SC SCIPchgVarLb(get_scip(o), var, lb)
    ub == nothing || @SC SCIPchgVarUb(get_scip(o), var, ub)
    return nothing
end

function MOI.add_constraint(o::Optimizer, func::MOI.ScalarAffineFunction{Float64},
                            set::S) where {S <: SS}
    if func.constant != 0.0
        msg = "SCIP does not support linear constraints with a constant offset."
        throw(MOI.AddConstraintNotAllowed{MOI.ScalarAffineFunction{Float64}, S}(msg))
    end

    allow_modification(o)
    scip = get_scip(o)

    varidx = [t.variable_index.value for t in func.terms]
    coefs = [t.coefficient for t in func.terms]

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip) : rhs

    i = add_linear_constraint(o.mscip, varidx, coefs, lhs, rhs)
    return register!(o, CI{MOI.ScalarAffineFunction{Float64}, S}(i))
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet,
                 ci::CI{MOI.ScalarAffineFunction{Float64},S}, set::S) where {S <: SS}
    allow_modification(o)
    scip = get_scip(o)
    cons = get_cons(o, ci)

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip) : lhs
    rhs = rhs == nothing ?  SCIPinfinity(scip) : rhs

    @SC SCIPchgLhsLinear(scip, cons, lhs)
    @SC SCIPchgRhsLinear(scip, cons, rhs)

    return nothing
end

function MOI.get(o::Optimizer, ::MOI.NumberOfConstraints{F,S}) where {F,S}
    haskey(o.constypes, (F, S)) ? length(o.constypes[F, S]) : 0
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction,
                 ci::CI{MOI.SingleVariable, S}) where S <: SS
    MOI.SingleVariable(ci)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet,
                 ci::CI{MOI.SingleVariable, S}) where S <: SS
    var = get_var(o.mscip, ci.value)
    lb, ub = SCIPvarGetLbOriginal(var), SCIPvarGetUbOriginal(var)
    from_bounds(S, lb, ub)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction,
                 ci::CI{MOI.ScalarAffineFunction{Float64}, S}) where S <: SS
    scip, cons = get_scip(o), get_cons(o, ci)
    nvars::Int = SCIPgetNVarsLinear(scip, cons)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsLinear(scip, cons), nvars)
    vals = unsafe_wrap(Array{Float64}, SCIPgetValsLinear(scip, cons), nvars)

    terms = [MOI.ScalarAffineTerm{Float64}(vals[i], VI(get_index(o, vars[i])))
             for i=1:nvars]
    # can not identify constant anymore (is merged with lhs,rhs)
    return MOI.ScalarAffineFunction{Float64}(terms, 0.0)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet,
                 ci::CI{MOI.ScalarAffineFunction{Float64}, S}) where S <: SS
    scip, cons = get_scip(o), get_cons(o, ci)
    lhs, rhs = SCIPgetLhsLinear(scip, cons), SCIPgetRhsLinear(scip, cons)
    from_bounds(S, lhs, rhs)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintName,
                 ci::CI{MOI.ScalarAffineFunction{Float64},<:SS})
    SCIPconsGetName(get_cons(o, ci))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName,
                 ci::CI{MOI.ScalarAffineFunction{Float64},<:SS}, name::String)
    @SC SCIPchgConsName(get_scip(o), get_cons(o, ci), name)
end

function MOI.get(o::Optimizer, ::Type{CI{F,S}}, name::String) where {F<:MOI.ScalarAffineFunction{Float64},S<:SS}
    cons = SCIPfindCons(get_scip(o), name)
    return CI{F,S}(o.index[cons])
end

function MOI.set(o::Optimizer,
                 ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
                 obj::MOI.ScalarAffineFunction{Float64})
    allow_modification(o)
    scip = get_scip(o)

    # reset objective coefficient of all variables first
    for v in o.mscip.vars
        @SC SCIPchgVarObj(scip, v[], 0.0)
    end

    # set new objective coefficients, summing coefficients
    for t in obj.terms
        var = get_var(o, t.variable_index)
        oldcoef = SCIPvarGetObj(var)
        newcoef = oldcoef + t.coefficient
        @SC SCIPchgVarObj(scip, var, newcoef)
    end

    @SC SCIPaddOrigObjoffset(scip, obj.constant - SCIPgetOrigObjoffset(scip))

    return nothing
end

function MOI.get(o::Optimizer,
                 ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}})
    terms = MOI.ScalarAffineTerm{Float64}[]
    for i = 1:length(o.mscip.vars)
        vi = VI(i)
        coef = SCIPvarGetObj(get_var(o, vi))
        coef == 0.0 || push!(terms, MOI.ScalarAffineTerm{Float64}(coef, vi))
    end
    constant = SCIPgetOrigObjoffset(get_scip(o))
    return MOI.ScalarAffineFunction{Float64}(terms, constant)
end

function MOI.set(o::Optimizer, ::MOI.ObjectiveSense,
                 sense::MOI.OptimizationSense)
    allow_modification(o)
    if sense == MOI.MIN_SENSE
        @SC SCIPsetObjsense(get_scip(o), SCIP_OBJSENSE_MINIMIZE)
    elseif sense == MOI.MAX_SENSE
        @SC SCIPsetObjsense(get_scip(o), SCIP_OBJSENSE_MAXIMIZE)
    end
    return nothing
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveSense)
    SCIPgetObjsense(get_scip(o)) == SCIP_OBJSENSE_MAXIMIZE ?
        MOI.MAX_SENSE :
        MOI.MIN_SENSE
end

function MOI.modify(o::Optimizer, ci::CI{MOI.ScalarAffineFunction{Float64}, <:SS},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgCoefLinear(get_scip(o), get_cons(o, ci),
                          get_var(o, change.variable), change.new_coefficient)
    return nothing
end

function MOI.modify(o::Optimizer,
                    ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
                    change::MOI.ScalarCoefficientChange{Float64})
    allow_modification(o)
    @SC SCIPchgVarObj(get_scip(o), get_var(o, change.variable),
                      change.new_coefficient)
    return nothing
end

## optimization and results

function MOI.optimize!(o::Optimizer)
    @SC SCIPsolve(o.mscip.scip[])
    return nothing
end

term_status_map = Dict(
    SCIP_STATUS_UNKNOWN => MOI.OPTIMIZE_NOT_CALLED,
    SCIP_STATUS_USERINTERRUPT => MOI.INTERRUPTED,
    SCIP_STATUS_NODELIMIT => MOI.NODE_LIMIT,
    SCIP_STATUS_TOTALNODELIMIT => MOI.NODE_LIMIT,
    SCIP_STATUS_STALLNODELIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_TIMELIMIT => MOI.TIME_LIMIT,
    SCIP_STATUS_MEMLIMIT => MOI.MEMORY_LIMIT,
    SCIP_STATUS_GAPLIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_SOLLIMIT => MOI.SOLUTION_LIMIT,
    SCIP_STATUS_BESTSOLLIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_RESTARTLIMIT => MOI.OTHER_LIMIT,
    SCIP_STATUS_OPTIMAL => MOI.OPTIMAL,
    SCIP_STATUS_INFEASIBLE => MOI.INFEASIBLE,
    SCIP_STATUS_UNBOUNDED => MOI.DUAL_INFEASIBLE,
    SCIP_STATUS_INFORUNBD => MOI.INFEASIBLE_OR_UNBOUNDED,
    SCIP_STATUS_TERMINATE => MOI.INTERRUPTED,
)

function MOI.get(o::Optimizer, ::MOI.TerminationStatus)
    term_status_map[SCIPgetStatus(get_scip(o))]
end

function MOI.get(o::Optimizer, ::MOI.PrimalStatus)
    SCIPgetNSols(get_scip(o)) > 0 ? MOI.FEASIBLE_POINT : MOI.NO_SOLUTION
end

function MOI.get(o::Optimizer, ::MOI.ResultCount)
    status = SCIPgetStatus(get_scip(o))
    if status in [SCIP_STATUS_UNBOUNDED, SCIP_STATUS_INFORUNBD]
        return 0
    end
    return SCIPgetNSols(get_scip(o))
end

function MOI.get(o::Optimizer, ::MOI.ObjectiveValue)
    scip = get_scip(o)
    return SCIPgetSolOrigObj(scip, SCIPgetBestSol(scip))
end

function MOI.get(o::Optimizer, ::MOI.VariablePrimal, vi::VI)
    scip = get_scip(o)
    return SCIPgetSolVal(scip, SCIPgetBestSol(scip), get_var(o, vi))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{MOI.SingleVariable,<:SS})
    scip = get_scip(o)
    return SCIPgetSolVal(scip, SCIPgetBestSol(scip), get_var(o, VI(ci.value)))
end

function MOI.get(o::Optimizer, ::MOI.ConstraintPrimal, ci::CI{MOI.ScalarAffineFunction{Float64},<:SS})
    scip = get_scip(o)
    return SCIPgetActivityLinear(scip, get_cons(o, ci), SCIPgetBestSol(scip))
end
