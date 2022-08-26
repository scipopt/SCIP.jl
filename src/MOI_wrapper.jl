# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

const BOUNDS = Union{
    MOI.EqualTo{Float64},
    MOI.GreaterThan{Float64},
    MOI.LessThan{Float64},
    MOI.Interval{Float64},
}

@enum(
    _SCIP_SOLVE_STATUS,
    _kSCIP_SOLVE_STATUS_NOT_CALLED,
    _kSCIP_SOLVE_STATUS_IN_SOLVE,
    _kSCIP_SOLVE_STATUS_FINISHED,
)

@enum(
    _SCIP_BOUND_TYPE,
    _kSCIP_EQUAL_TO,
    _kSCIP_INTERVAL,
    _kSCIP_LESS_THAN,
    _kSCIP_GREATER_THAN,
    _kSCIP_LESS_AND_GREATER_THAN,
)

mutable struct Optimizer <: MOI.AbstractOptimizer
    inner::SCIPData
    reference::Dict{Ptr{Cvoid},Union{VarRef,ConsRef}}
    constypes::Dict{Tuple{Type,Type},Set{ConsRef}}
    binbounds::Dict{MOI.VariableIndex,MOI.Interval{Float64}} # only for binary variables
    bound_types::Dict{MOI.VariableIndex,_SCIP_BOUND_TYPE}
    params::Dict{String,Any}
    start::Dict{MOI.VariableIndex,Float64} # can be partial
    moi_separator::Any # ::Union{CutCbSeparator, Nothing}
    moi_heuristic::Any # ::Union{HeuristicCb, Nothing}
    objective_sense::Union{Nothing,MOI.OptimizationSense}
    objective_function_set::Bool
    conflict_status::MOI.ConflictStatusCode
    scip_solve_status::_SCIP_SOLVE_STATUS
    name_to_variable::Union{
        Nothing,
        Dict{String,Union{Nothing,MOI.VariableIndex}},
    }
    name_to_constraint_index::Union{
        Nothing,
        Dict{String,Union{Nothing,MOI.ConstraintIndex}},
    }
    solution_storage::Vector{Ptr{SCIP_SOL}}

    function Optimizer(; kwargs...)
        o = new(
            SCIPData(),
            Dict{Ptr{Cvoid},Union{VarRef,ConsRef}}(),
            Dict{Tuple{Type,Type},Set{ConsRef}}(),
            Dict{MOI.VariableIndex,MOI.Interval{Float64}}(),
            Dict{MOI.VariableIndex,_SCIP_BOUND_TYPE}(),
            Dict{String,Any}(),
            Dict{MOI.VariableIndex,Float64}(),
            nothing,
            nothing,
            nothing,
            false,
            MOI.COMPUTE_CONFLICT_NOT_CALLED,
            _kSCIP_SOLVE_STATUS_NOT_CALLED,
            nothing,
            nothing,
            Ptr{SCIP_SOL}[],
        )
        # Set all parameters given as keyword arguments, replacing the
        # delimiter, since "/" is used by all SCIP parameters, but is not
        # allowed in Julia identifiers.
        for (key, value) in kwargs
            name = replace(String(key), "_" => "/")
            MOI.set(o, MOI.RawOptimizerAttribute(name), value)
        end
        return o
    end
end

# [TODO] Should Be Safe To Remove
free_scip(o::Optimizer) = free_scip(o.inner)

Base.cconvert(::Type{Ptr{SCIP_}}, o::Optimizer) = o

# Protect Optimizer from GC for ccall with Ptr{SCIP_} argument.
Base.unsafe_convert(::Type{Ptr{SCIP_}}, o::Optimizer) = o.inner.scip[]

function MOI.is_empty(o::Optimizer)
    return length(o.inner.vars) == 0 && length(o.inner.conss) == 0
end

function MOI.empty!(o::Optimizer)
    # free the underlying problem
    free_scip(o.inner)
    # clear auxiliary mapping structures
    empty!(o.reference)
    empty!(o.constypes)
    empty!(o.binbounds)
    empty!(o.bound_types)
    empty!(o.start)
    o.inner = SCIPData()
    # reapply parameters
    for pair in o.params
        set_parameter(o.inner, pair.first, pair.second)
    end
    o.objective_sense = nothing
    o.objective_function_set = false
    o.conflict_status = MOI.COMPUTE_CONFLICT_NOT_CALLED
    o.moi_separator = nothing
    o.moi_heuristic = nothing
    o.scip_solve_status = _kSCIP_SOLVE_STATUS_NOT_CALLED
    o.name_to_variable = nothing
    o.name_to_constraint_index = nothing
    empty!(o.solution_storage)
    return nothing
end

MOI.supports_incremental_interface(::Optimizer) = true

function MOI.copy_to(dest::Optimizer, src::MOI.ModelLike)
    return MOI.Utilities.default_copy_to(dest, src)
end

## convenience functions (not part of MOI)

"Return pointer to SCIP variable."
function var(o::Optimizer, v::MOI.VariableIndex)::Ptr{SCIP_VAR}
    return var(o.inner, VarRef(v.value))
end

"Return var/cons reference of SCIP variable/constraint."
ref(o::Optimizer, ptr::Ptr{Cvoid}) = o.reference[ptr]

"Return pointer to SCIP constraint."
function cons(
    o::Optimizer,
    c::MOI.ConstraintIndex{F,S},
)::Ptr{SCIP_CONS} where {F,S}
    return cons(o.inner, ConsRef(c.value))
end

"Extract bounds from sets."
bounds(o, set::MOI.EqualTo{Float64}) = (set.value, set.value)

function bounds(o, set::MOI.GreaterThan{Float64})
    return (set.lower, SCIPinfinity(o))
end

function bounds(o, set::MOI.LessThan{Float64})
    return (-SCIPinfinity(o), set.upper)
end

bounds(o, set::MOI.Interval{Float64}) = (set.lower, set.upper)

"Make set from bounds."
function from_bounds(::Type{MOI.EqualTo{Float64}}, lower, upper)
    MOI.EqualTo{Float64}(lower)
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

"Register pointer in mapping, return var/cons reference."
function register!(
    o::Optimizer,
    ptr::Ptr{Cvoid},
    ref::R,
) where {R<:Union{VarRef,ConsRef}}
    @assert !haskey(o.reference, ptr)
    o.reference[ptr] = ref
    return ref
end

"Register constraint in mapping, return constraint reference."
function register!(o::Optimizer, c::MOI.ConstraintIndex{F,S}) where {F,S}
    cr = ConsRef(c.value)
    if haskey(o.constypes, (F, S))
        push!(o.constypes[F, S], cr)
    else
        o.constypes[F, S] = Set([cr])
    end
    return c
end

"Go back from solved stage to problem modification stage, invalidating results."
function allow_modification(o::Optimizer)
    if o.scip_solve_status == _kSCIP_SOLVE_STATUS_IN_SOLVE
        # Ignore. We're inside the solver. Any number of things can be happening
        return nothing
    end
    if SCIPgetStage(o) != SCIP_STAGE_PROBLEM
        @SCIP_CALL SCIPfreeTransform(o)
    end
    o.scip_solve_status = _kSCIP_SOLVE_STATUS_NOT_CALLED
    return nothing
end

function _throw_if_invalid(
    o::Optimizer,
    ci::MOI.ConstraintIndex{F,S},
) where {F,S}
    if !haskey(o.constypes, (F, S)) || !in(ConsRef(ci.value), o.constypes[F, S])
        throw(MOI.InvalidIndex(ci))
    end
    return nothing
end

# MOI.SolverName

MOI.get(::Optimizer, ::MOI.SolverName) = "SCIP"

# MOI.RawOptimizerAttribute

function MOI.get(o::Optimizer, param::MOI.RawOptimizerAttribute)
    return get_parameter(o.inner, param.name)
end

function MOI.set(o::Optimizer, param::MOI.RawOptimizerAttribute, value)
    set_parameter(o.inner, param.name, value)
    o.params[param.name] = value
    return nothing
end

# MOI.Silent

MOI.supports(o::Optimizer, ::MOI.Silent) = true

function MOI.get(o::Optimizer, ::MOI.Silent)
    return MOI.get(o, MOI.RawOptimizerAttribute("display/verblevel")) == 0
end

function MOI.set(o::Optimizer, ::MOI.Silent, value::Bool)
    level = ifelse(value, 0, 4)
    MOI.set(o, MOI.RawOptimizerAttribute("display/verblevel"), level)
    return
end

# MOI.TimeLimitSec

MOI.supports(o::Optimizer, ::MOI.TimeLimitSec) = true

function MOI.get(o::Optimizer, ::MOI.TimeLimitSec)
    raw_value = MOI.get(o, MOI.RawOptimizerAttribute("limits/time"))
    if raw_value == SCIPinfinity(o)
        return nothing
    end
    return raw_value
end

function MOI.set(o::Optimizer, ::MOI.TimeLimitSec, value::Union{Nothing,Real})
    value = something(value, SCIPinfinity(o))
    MOI.set(o, MOI.RawOptimizerAttribute("limits/time"), value)
    return
end

# MOI.NodeLimit

MOI.supports(o::Optimizer, ::MOI.NodeLimit) = true

function MOI.get(o::Optimizer, ::MOI.NodeLimit)
    raw_value = MOI.get(o, MOI.RawOptimizerAttribute("limits/nodes"))
    if raw_value == -1
        return nothing
    else
        return raw_value::Int
    end
end

function MOI.set(o::Optimizer, ::MOI.NodeLimit, value::Union{Nothing,Real})
    value = something(value, -1)
    MOI.set(o, MOI.RawOptimizerAttribute("limits/nodes"), value)
    return
end

# MOI.AbsoluteGapTolerance

MOI.supports(::Optimizer, ::MOI.AbsoluteGapTolerance) = true

function MOI.get(o::Optimizer, ::MOI.AbsoluteGapTolerance)
    raw_value = MOI.get(o, MOI.RawOptimizerAttribute("limits/absgap"))
    if iszero(raw_value)
        return nothing
    end
    return raw_value
end

function MOI.set(
    o::Optimizer,
    ::MOI.AbsoluteGapTolerance,
    value::Union{Nothing,Real},
)
    value = something(value, 0.0)
    MOI.set(o, MOI.RawOptimizerAttribute("limits/absgap"), value)
    return nothing
end

# MOI.RelativeGapTolerance

MOI.supports(::Optimizer, ::MOI.RelativeGapTolerance) = true

function MOI.get(o::Optimizer, ::MOI.RelativeGapTolerance)
    raw_value = MOI.get(o, MOI.RawOptimizerAttribute("limits/gap"))
    if iszero(raw_value)
        return nothing
    end
    return raw_value
end

function MOI.set(
    o::Optimizer,
    ::MOI.RelativeGapTolerance,
    value::Union{Nothing,Real},
)
    value = something(value, 0.0)
    MOI.set(o, MOI.RawOptimizerAttribute("limits/gap"), value)
    return nothing
end

# MOI.SolverVersion

MOI.get(::Optimizer, ::MOI.SolverVersion) = "v" * string(SCIP_versionnumber())

# MOI.Name

MOI.supports(::Optimizer, ::MOI.Name) = true

MOI.get(o::Optimizer, ::MOI.Name) = unsafe_string(SCIPgetProbName(o))

function MOI.set(o::Optimizer, ::MOI.Name, name::String)
    @SCIP_CALL SCIPsetProbName(o, name)
    return
end

# SCIP.Presolving

"""
    Presolving

Attribute for activating presolving in SCIP.
"""
struct Presolving <: MOI.AbstractOptimizerAttribute end

MOI.supports(o::Optimizer, ::Presolving) = true

function MOI.get(o::Optimizer, ::Presolving)
    return MOI.get(o, MOI.RawOptimizerAttribute("presolving/maxrounds")) != 0
end

function MOI.set(o::Optimizer, ::Presolving, value::Bool)
    param = MOI.RawOptimizerAttribute("presolving/maxrounds")
    if value
        MOI.set(o, param, -1) # max presolving rounds
    else
        MOI.set(o, param, 0) # no presolving
    end
    return
end

# MOI.NumberOfConstraints

function MOI.get(o::Optimizer, ::MOI.NumberOfConstraints{F,S}) where {F,S}
    return haskey(o.constypes, (F, S)) ? length(o.constypes[F, S]) : 0
end

# MOI.ListOfConstraintTypesPresent

function MOI.get(o::Optimizer, ::MOI.ListOfConstraintTypesPresent)
    ret = Tuple{Type,Type}[]
    for (k, v) in o.constypes
        if !isempty(v)
            push!(ret, k)
        end
    end
    return ret
end

# MOI.ListOfConstraintIndices

function MOI.get(o::Optimizer, ::MOI.ListOfConstraintIndices{F,S}) where {F,S}
    list_indices = MOI.ConstraintIndex{F,S}[]
    if !haskey(o.constypes, (F, S))
        return list_indices
    end
    for cref in o.constypes[F, S]
        push!(list_indices, MOI.ConstraintIndex{F,S}(cref.val))
    end
    return sort!(list_indices; by=v -> v.value)
end

function _set_start_values(o::Optimizer)
    if isempty(o.start)
        return  # no primal start values are given
    end
    # create new partial solution object
    sol__ = Ref{Ptr{SCIP_SOL}}(C_NULL)
    @SCIP_CALL SCIPcreatePartialSol(o, sol__, C_NULL)
    @assert sol__[] != C_NULL
    # set all given values
    sol_ = sol__[]
    for (vi, value) in o.start
        @SCIP_CALL SCIPsetSolVal(o, sol_, var(o, vi), value)
    end
    # submit the candidate
    stored_ = Ref{SCIP_Bool}(FALSE)
    @SCIP_CALL SCIPaddSolFree(o, sol__, stored_)
    @assert sol__[] == C_NULL
    return
end

function MOI.optimize!(o::Optimizer)
    _set_start_values(o)
    if o.objective_sense == MOI.FEASIBILITY_SENSE
        F = MOI.ScalarAffineFunction{Float64}
        MOI.set(o, MOI.ObjectiveFunction{F}(), zero(F))
    end
    try
        o.scip_solve_status = _kSCIP_SOLVE_STATUS_IN_SOLVE
        @SCIP_CALL SCIPsolve(o)
    finally
        o.scip_solve_status = _kSCIP_SOLVE_STATUS_FINISHED
    end
    o.solution_storage =
        unsafe_wrap(Vector{Ptr{SCIP_SOL}}, SCIPgetSols(o), SCIPgetNSols(o))
    return nothing
end

function MOI.delete(o::Optimizer, ci::MOI.ConstraintIndex{F,S}) where {F,S}
    _throw_if_invalid(o, ci)
    allow_modification(o)
    delete!(o.constypes[F, S], ConsRef(ci.value))
    if isempty(o.constypes[F, S])
        delete!(o.constypes, (F, S))
    end
    delete!(o.reference, cons(o, ci))
    delete(o.inner, ConsRef(ci.value))
    o.name_to_constraint_index = nothing
    return nothing
end

# MOI.ListOfVariableAttributesSet

function MOI.get(o::Optimizer, ::MOI.ListOfVariableAttributesSet)
    attributes = MOI.AbstractVariableAttribute[MOI.VariableName()]
    if !isempty(o.start)
        push!(attributes, MOI.VariablePrimalStart())
    end
    return attributes
end

# MOI.ListOfModelAttributesSet

function MOI.get(o::Optimizer, ::MOI.ListOfModelAttributesSet)
    ret = MOI.AbstractModelAttribute[]
    if !isempty(MOI.get(o, MOI.Name()))
        push!(ret, MOI.Name())
    end
    if o.objective_sense !== nothing
        push!(ret, MOI.ObjectiveSense())
    end
    if o.objective_function_set
        F = MOI.get(o, MOI.ObjectiveFunctionType())
        push!(ret, MOI.ObjectiveFunction{F}())
    end
    return ret
end

# MOI.ListOfConstraintAttributesSet

function MOI.get(
    ::Optimizer,
    ::MOI.ListOfConstraintAttributesSet{F,S},
) where {F,S}
    attributes = MOI.AbstractConstraintAttribute[]
    if F != MOI.VariableIndex
        return push!(attributes, MOI.ConstraintName())
    end
    return attributes
end

include(joinpath("MOI_wrapper", "variable.jl"))
include(joinpath("MOI_wrapper", "constraints.jl"))
include(joinpath("MOI_wrapper", "linear_constraints.jl"))
include(joinpath("MOI_wrapper", "quadratic_constraints.jl"))
include(joinpath("MOI_wrapper", "sos_constraints.jl"))
include(joinpath("MOI_wrapper", "indicator_constraints.jl"))
include(joinpath("MOI_wrapper", "nonlinear_constraints.jl"))
include(joinpath("MOI_wrapper", "objective.jl"))
include(joinpath("MOI_wrapper", "results.jl"))
include(joinpath("MOI_wrapper", "conshdlr.jl"))
include(joinpath("MOI_wrapper", "UserCutCallback.jl"))
include(joinpath("MOI_wrapper", "HeuristicCallback.jl"))
include(joinpath("MOI_wrapper", "conflict.jl"))
