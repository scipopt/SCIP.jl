using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex

const ConsMap = Dict{Tuple{DataType, DataType}, Vector{Int}}

mutable struct Optimizer <: MOI.AbstractOptimizer
    mscip::ManagedSCIP
    cons::ConsMap

    Optimizer() = new(ManagedSCIP(), ConsMap())
end


## convenience methods (not part of MOI)

"Returns pointer to SCIP instance"
get_scip(o::Optimizer) = get_scip(o.mscip)

"Returns pointer to SCIP variable"
get_var(o::Optimizer, v::VI) = get_var(o.mscip, v.value)

"Returns pointer to SCIP constraint"
get_cons(o::Optimizer, v::CI{F,S}) where {F,S} = get_cons(o.mscip, c.value)

"Extract bounds from sets"
bounds(set::MOI.EqualTo{Float64}) = (set.value, set.value)
bounds(set::MOI.GreaterThan{Float64}) = (set.lower, nothing)
bounds(set::MOI.LessThan{Float64}) = (nothing, set.upper)
bounds(set::MOI.Interval{Float64}) = (set.lower, set.upper)

"Register constraint in mapping"
function register!(o::Optimizer, c::CI{F,S}) where {F,S}
    if haskey(o.cons, (F, S))
        push!(o.cons[F,S], c.value)
    else
        o.cons[F,S] = [c.value]
    end
    return c
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

MOIU.supports_allocate_load(o::Optimizer, copy_names::Bool) = !copy_names


## model creation, query and modification

function MOI.is_empty(o::Optimizer)
    length(o.mscip.vars) == 0 && length(o.mscip.conss) == 0
end

function MOI.empty!(o::Optimizer)
    # free the underlying problem
    finalize(o.mscip)
    # create a new one
    o.mscip = ManagedSCIP()
    return nothing
end

function MOI.copy_to(dest::Optimizer, src::MOI.ModelLike; kws...)
    MOIU.automatic_copy_to(dest, src; kws...)
end

MOI.add_variable(o::Optimizer) = MOI.VariableIndex(add_variable(o.mscip))
MOI.add_variables(o::Optimizer, n) = [MOI.add_variable(o) for i=1:n]
MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.mscip.vars)

function MOI.add_constraint(o::Optimizer, func::MOI.SingleVariable,
                            set::S) where S <: SS
    var = get_var(o, func.variable)
    lb, ub = bounds(set)
    lb == nothing || @SC SCIPchgVarLb(get_scip(o), var, lb)
    ub == nothing || @SC SCIPchgVarUb(get_scip(o), var, ub)
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{MOI.SingleVariable, S}(i))
end

function MOI.add_constraint(o::Optimizer, func::MOI.ScalarAffineFunction{Float64},
                            set::S) where {S <: SS}
    scip = get_scip(o)

    varidx = [t.variable_index.value for t in func.terms]
    coefs = [t.coefficient for t in func.terms]

    lhs, rhs = bounds(set)
    lhs = lhs == nothing ? -SCIPinfinity(scip) : lhs - func.constant
    rhs = rhs == nothing ?  SCIPinfinity(scip) : rhs - func.constant

    i = add_linear_constraint(o.mscip, varidx, coefs, lhs, rhs)
    return register!(o, CI{MOI.ScalarAffineFunction{Float64}, S}(i))
end

function MOI.get(o::Optimizer, ::MOI.NumberOfConstraints{F,S}) where {F,S}
    haskey(o.cons, (F, S)) ? length(o.cons[F, S]) : 0
end

function MOI.set(o::Optimizer,
                 ::MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}},
                 obj::MOI.ScalarAffineFunction{Float64})
    scip = get_scip(o)

    # reset objective coefficient of all variables first
    for v in o.mscip.vars
        @SC SCIPchgVarObj(scip, v[], 0.0)
    end

    # set new objective coefficients
    for t in obj.terms
        @SC SCIPchgVarObj(scip, get_var(o, t.variable_index), t.coefficient)
    end

    @SC SCIPaddOrigObjoffset(scip, obj.constant - SCIPgetOrigObjoffset(scip))

    return nothing
end

function MOI.set(o::Optimizer, ::MOI.ObjectiveSense,
                 sense::MOI.OptimizationSense)
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


## optimization and results

function MOI.optimize!(o::Optimizer)
    @SC SCIPsolve(o.mscip.scip[])
    return nothing
end
