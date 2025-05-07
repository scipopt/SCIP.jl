# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# FIXME(odow): ConstraintName is missing MOI.supports, doesn't account for
# duplicate names, and doesn't error properly for MOI.VariableIndex constraints.
function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintName,
    ci::MOI.ConstraintIndex,
)::String
    return GC.@preserve o unsafe_string(SCIPconsGetName(cons(o, ci)))
end

function MOI.set(
    o::Optimizer,
    ::MOI.ConstraintName,
    ci::MOI.ConstraintIndex,
    name::String,
)
    @SCIP_CALL SCIPchgConsName(o, cons(o, ci), name)
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

function MOI.get(o::Optimizer, ::Type{MOI.ConstraintIndex}, name::String)
    ptr = SCIPfindCons(o, name)
    if ptr == C_NULL
        return nothing
    end
    cref = get(o.reference, ptr, nothing)
    if cref === nothing
        return cref
    end
    for ((F, S), setref) in o.constypes
        if cref in setref
            return MOI.ConstraintIndex{F,S}(cref.val)
        end
    end
    return error("Constraint type not found for constraint $cref")
end
