# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function MOI.supports(
    ::Optimizer,
    ::MOI.ConstraintName,
    ::Type{MOI.ConstraintIndex{F,S}},
) where {
    F<:Union{
        MOI.ScalarAffineFunction{Float64},
        MOI.ScalarQuadraticFunction{Float64},
        MOI.VectorAffineFunction{Float64},
        MOI.VectorOfVariables,
    },
    S,
}
    return true
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintName,
    ci::MOI.ConstraintIndex{F},
)::String where {
    F<:Union{
        MOI.ScalarAffineFunction{Float64},
        MOI.ScalarQuadraticFunction{Float64},
        MOI.VectorAffineFunction{Float64},
        MOI.VectorOfVariables,
    },
}
    return unsafe_string(SCIPconsGetName(cons(o, ci)))
end

function MOI.set(
    o::Optimizer,
    ::MOI.ConstraintName,
    ci::MOI.ConstraintIndex{F},
    name::String,
) where {
    F<:Union{
        MOI.ScalarAffineFunction{Float64},
        MOI.ScalarQuadraticFunction{Float64},
        MOI.VectorAffineFunction{Float64},
        MOI.VectorOfVariables,
    },
}
    @SCIP_CALL SCIPchgConsName(o, cons(o, ci), name)
    o.name_to_constraint_index = nothing
    return nothing
end

function MOI.set(
    o::Optimizer,
    ::MOI.ConstraintName,
    ci::MOI.ConstraintIndex{MOI.VariableIndex},
    name::String,
)
    return throw(MOI.VariableIndexConstraintNameError())
end

function _rebuild_name_to_constraint_index(o::Optimizer)
    o.name_to_constraint_index =
        Dict{String,Union{Nothing,MOI.ConstraintIndex}}()
    for ((F, S), set) in o.constypes
        if F <: MOI.VariableIndex
            continue
        end
        for cref in set
            ci = MOI.ConstraintIndex{F,S}(cref.val)
            name = MOI.get(o, MOI.ConstraintName(), ci)
            if isempty(name)
                continue
            elseif haskey(o.name_to_constraint_index, name)
                o.name_to_constraint_index[name] = nothing  # Duplicate name
            else
                o.name_to_constraint_index[name] = ci
            end
        end
    end
    return
end

function MOI.get(o::Optimizer, ::Type{MOI.ConstraintIndex}, name::String)
    if o.name_to_constraint_index === nothing
        _rebuild_name_to_constraint_index(o)
    end
    ci = get(o.name_to_constraint_index, name, missing)
    if ismissing(ci)
        return nothing
    elseif isnothing(ci)
        error("Duplicate name")
    else
        return ci
    end
end

function MOI.get(
    o::Optimizer,
    ::Type{MOI.ConstraintIndex{F,S}},
    name::String,
) where {F,S}
    ci = MOI.get(o, MOI.ConstraintIndex, name)
    if !(ci isa MOI.ConstraintIndex{F,S})
        return nothing
    end
    return ci
end

function MOI.is_valid(o::Optimizer, c::MOI.ConstraintIndex{F,S}) where {F,S}
    cons_set = get(o.constypes, (F, S), nothing)
    if cons_set === nothing
        return false
    end
    if !in(ConsRef(c.value), cons_set)
        return false
    end
    return haskey(o.inner.conss, SCIP.ConsRef(c.value))
end
