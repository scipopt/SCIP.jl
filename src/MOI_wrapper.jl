using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

# indices
const VI = MOI.VariableIndex
const CI = MOI.ConstraintIndex
# supported functions
const SVF = MOI.SingleVariable
const SAF = MOI.ScalarAffineFunction{Float64}
const SQF = MOI.ScalarQuadraticFunction{Float64}
const VAF = MOI.VectorAffineFunction{Float64}
const VECTOR = MOI.VectorOfVariables
# supported sets
const BOUNDS = Union{MOI.EqualTo{Float64}, MOI.GreaterThan{Float64},
                     MOI.LessThan{Float64}, MOI.Interval{Float64}}
const VAR_TYPES = Union{MOI.ZeroOne, MOI.Integer}
const SOC = MOI.SecondOrderCone
const SOS1 = MOI.SOS1{Float64}
const SOS2 = MOI.SOS2{Float64}
# other MOI types
const AFF_TERM = MOI.ScalarAffineTerm{Float64}
const QUAD_TERM = MOI.ScalarQuadraticTerm{Float64}
const VEC_TERM = MOI.VectorAffineTerm{Float64}

const PtrMap = Dict{Ptr{Cvoid}, Union{VarRef, ConsRef}}
const ConsTypeMap = Dict{Tuple{DataType, DataType}, Set{ConsRef}}

mutable struct Optimizer <: MOI.AbstractOptimizer
    mscip::ManagedSCIP
    reference::PtrMap
    constypes::ConsTypeMap
    binbounds::Dict{VI,BOUNDS} # only for binary variables
    params::Dict{String,Any}
    start::Dict{VI,Float64} # can be partial

    function Optimizer(; kwargs...)
        o = new(ManagedSCIP(), PtrMap(), ConsTypeMap(), Dict(), Dict(), Dict())

        # Set all parameters given as keyword arguments, replacing the
        # delimiter, since "/" is used by all SCIP parameters, but is not
        # allowed in Julia identifiers.
        for (key, value) in kwargs
            name = replace(String(key),"_" => "/")
            MOI.set(o, Param(name), value)
        end
        return o
    end
end

# Protect Optimizer from GC for ccall with Ptr{SCIP_} argument.
Base.unsafe_convert(::Type{Ptr{SCIP_}}, o::Optimizer) = o.mscip.scip[]

## convenience functions (not part of MOI)

"Return pointer to SCIP variable."
function var(o::Optimizer, v::VI)::Ptr{SCIP_VAR}
    return var(o.mscip, VarRef(v.value))
end

"Return var/cons reference of SCIP variable/constraint."
ref(o::Optimizer, ptr::Ptr{Cvoid}) = o.reference[ptr]

"Return pointer to SCIP constraint."
function cons(o::Optimizer, c::CI{F,S})::Ptr{SCIP_CONS} where {F,S}
    return cons(o.mscip, ConsRef(c.value))
end

"Extract bounds from sets."
bounds(set::MOI.EqualTo{Float64}) = (set.value, set.value)
bounds(set::MOI.GreaterThan{Float64}) = (set.lower, nothing)
bounds(set::MOI.LessThan{Float64}) = (nothing, set.upper)
bounds(set::MOI.Interval{Float64}) = (set.lower, set.upper)

"Make set from bounds."
from_bounds(::Type{MOI.EqualTo{Float64}}, lower, upper) = MOI.EqualTo{Float64}(lower)
from_bounds(::Type{MOI.GreaterThan{Float64}}, lower, upper) = MOI.GreaterThan{Float64}(lower)
from_bounds(::Type{MOI.LessThan{Float64}}, lower, upper) = MOI.LessThan{Float64}(upper)
from_bounds(::Type{MOI.Interval{Float64}}, lower, upper) = MOI.Interval{Float64}(lower, upper)

"Register pointer in mapping, return var/cons reference."
function register!(o::Optimizer, ptr::Ptr{Cvoid}, ref::R) where R <: Union{VarRef, ConsRef}
    @assert !haskey(o.reference, ptr)
    o.reference[ptr] = ref
    return ref
end

"Register constraint in mapping, return constraint reference."
function register!(o::Optimizer, c::CI{F,S}) where {F,S}
    cr = ConsRef(c.value)
    if haskey(o.constypes, (F, S))
        push!(o.constypes[F,S], cr)
    else
        o.constypes[F,S] = Set([cr])
    end
    return c
end

"Go back from solved stage to problem modification stage, invalidating results."
function allow_modification(o::Optimizer)
    if !(SCIPgetStage(o) in (SCIP_STAGE_PROBLEM, SCIP_STAGE_SOLVING))
        @SC SCIPfreeTransform(o)
    end
    return nothing
end

## general queries and support

MOI.get(::Optimizer, ::MOI.SolverName) = "SCIP"

MOIU.supports_default_copy_to(model::Optimizer, copy_names::Bool) = !copy_names

# Keep SCIP-specific alias for backwards-compatibility.
const Param = MOI.RawParameter

function MOI.get(o::Optimizer, param::MOI.RawParameter)
    return get_parameter(o.mscip, param.name)
end

function MOI.set(o::Optimizer, param::MOI.RawParameter, value)
    o.params[param.name] = value
    set_parameter(o.mscip, param.name, value)
    return nothing
end

MOI.supports(o::Optimizer, ::MOI.Silent) = true

function MOI.get(o::Optimizer, ::MOI.Silent)
    return MOI.get(o, MOI.RawParameter("display/verblevel")) == 0
end

function MOI.set(o::Optimizer, ::MOI.Silent, value)
    param = MOI.RawParameter("display/verblevel")
    if value
        MOI.set(o, param, 0) # no output at all
    else
        MOI.set(o, param, 4) # default level
    end
end

MOI.supports(o::Optimizer, ::MOI.TimeLimitSec) = true

function MOI.get(o::Optimizer, ::MOI.TimeLimitSec)
    raw_value = MOI.get(o, MOI.RawParameter("limits/time"))
    if raw_value == SCIPinfinity(o)
        return nothing
    else
        return raw_value
    end
end

function MOI.set(o::Optimizer, ::MOI.TimeLimitSec, value)
    if value == nothing
        MOI.set(o, MOI.RawParameter("limits/time"), SCIPinfinity(o))
    else
        MOI.set(o, MOI.RawParameter("limits/time"), value)
    end
end

## model creation, query and modification

function MOI.is_empty(o::Optimizer)
    return length(o.mscip.vars) == 0 && length(o.mscip.conss) == 0
end

function MOI.empty!(o::Optimizer)
    # free the underlying problem
    finalize(o.mscip)
    # create a new one
    o.mscip = ManagedSCIP()
    # clear auxiliary mapping structures
    o.reference = PtrMap()
    o.constypes = ConsTypeMap()
    o.binbounds = Dict()
    o.start = Dict()
    # reapply parameters
    for pair in o.params
        set_parameter(o.mscip, pair.first, pair.second)
    end
    return nothing
end

function MOI.copy_to(dest::Optimizer, src::MOI.ModelLike; kws...)
    return MOIU.automatic_copy_to(dest, src; kws...)
end

MOI.get(o::Optimizer, ::MOI.Name) = SCIPgetProbName(o)
MOI.set(o::Optimizer, ::MOI.Name, name::String) = @SC SCIPsetProbName(o, name)

function MOI.get(o::Optimizer, ::MOI.NumberOfConstraints{F,S}) where {F,S}
    return haskey(o.constypes, (F, S)) ? length(o.constypes[F, S]) : 0
end

function MOI.get(o::Optimizer, ::MOI.ListOfConstraints)
    return collect(keys(o.constypes))
end

function set_start_values(o::Optimizer)
    if isempty(o.start)
        # no primal start values are given
        return
    end

    # create new partial solution object
    sol__ = Ref{Ptr{SCIP_SOL}}(C_NULL)
    @SC SCIPcreatePartialSol(o, sol__, C_NULL)
    @assert sol__[] != C_NULL

    # set all given values
    sol_ = sol__[]
    for (vi, value) in o.start
        @SC SCIPsetSolVal(o, sol_, var(o, vi), value)
    end

    # submit the candidate
    stored_ = Ref{SCIP_Bool}(FALSE)
    @SC SCIPaddSolFree(o, sol__, stored_)
    @assert sol__[] == C_NULL
end

function MOI.optimize!(o::Optimizer)
    set_start_values(o)
    @SC SCIPsolve(o)
    return nothing
end

include(joinpath("MOI_wrapper", "variable.jl"))
include(joinpath("MOI_wrapper", "constraints.jl"))
include(joinpath("MOI_wrapper", "linear_constraints.jl"))
include(joinpath("MOI_wrapper", "quadratic_constraints.jl"))
include(joinpath("MOI_wrapper", "soc_constraints.jl"))
include(joinpath("MOI_wrapper", "sos_constraints.jl"))
include(joinpath("MOI_wrapper", "abspower_constraints.jl"))
include(joinpath("MOI_wrapper", "indicator_constraints.jl"))
include(joinpath("MOI_wrapper", "nonlinear_constraints.jl"))
include(joinpath("MOI_wrapper", "objective.jl"))
include(joinpath("MOI_wrapper", "results.jl"))
include(joinpath("MOI_wrapper", "conshdlr.jl"))
