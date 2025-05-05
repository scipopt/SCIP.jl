# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

"""
    include_sepa(
        o::Optimizer,
        sepa::SEPA;
        name::String,
        description::String,
        priority::Int,
        freq::Int,
        maxbounddist::Float,
        usesubscip::Bool,
        delay::Bool
    )

Include a user defined separator `sepa` to the SCIP optimizer instance `o`.

All parameters have default values, that can be set as keyword arguments.
"""
function include_sepa(o::Optimizer, sepa::AbstractSeparator; kwargs...)
    return include_sepa(o.inner.scip[], o.inner.sepas, sepa; kwargs...)
end

# Separator for cutcallbacks.

mutable struct CutCbSeparator <: AbstractSeparator
    scipd::SCIPData
    cutcallback::Function
end

# If no cut callback is given, the cut callback does nothing.
CutCbSeparator(scipd::SCIPData) = CutCbSeparator(scipd, cb_data -> nothing)

"""
Used for an argument to the cut callback, which in turn uses that argument to
obtain the LP-solution via `MOI.get` and to add cuts via `MOI.submit`.
"""
mutable struct CutCbData
    sepa::CutCbSeparator
    "Did the cut callback call submit?"
    submit_called::Bool
end

function exec_lp(sepa::CutCbSeparator)
    cb_data = CutCbData(sepa, false)
    sepa.cutcallback(cb_data)
    return cb_data.submit_called ? SCIP_SEPARATED : SCIP_DIDNOTFIND
end

# MOI Interface for cutcallbacks

function MOI.get(o::Optimizer, ::MOI.CallbackVariablePrimal{CutCbData}, vi)
    return SCIPgetSolVal(o, C_NULL, var(o, vi))
end

MOI.supports(::Optimizer, ::MOI.UserCutCallback) = true

function MOI.set(o::Optimizer, ::MOI.UserCutCallback, cb::Function)
    if o.moi_separator === nothing
        o.moi_separator = CutCbSeparator(o.inner, cb)
        include_sepa(o, o.moi_separator)
    else
        o.moi_separator.cutcallback = cb
    end
    return
end

MOI.supports(::Optimizer, ::MOI.UserCut{CutCbData}) = true

function MOI.submit(
    o::Optimizer,
    cb_data::MOI.UserCut{CutCbData},
    func::MOI.ScalarAffineFunction{Float64},
    set::BOUNDS,
)
    lhs, rhs = bounds(set)
    inf = SCIPinfinity(o)
    add_cut_sepa(
        o.inner.scip[],
        o.inner.vars,
        o.inner.sepas,
        cb_data.callback_data.sepa,
        [VarRef(t.variable.value) for t in func.terms],
        [t.coefficient for t in func.terms],
        something(lhs, -inf),
        something(rhs, inf),
    )
    cb_data.callback_data.submit_called = true
    return
end
