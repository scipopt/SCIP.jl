# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function include_heuristic(o::Optimizer, heuristic; kwargs...)
    return include_heuristic(
        o.inner.scip[],
        heuristic,
        o.inner.heuristic_storage;
        kwargs...,
    )
end

mutable struct HeuristicCb <: Heuristic
    scipd::SCIPData
    heurcallback::Function

    HeuristicCb(scipd::SCIPData, cb=cb_data -> nothing) = new(scipd, cb)
end

"""
Used for an argument to the heuristic callback, which in turn uses that argument to
obtain the LP-solution via `MOI.get` and to add solutions via `MOI.submit`.
"""
mutable struct HeuristicCbData
    heur::HeuristicCb
    submit_called::Bool
    heurtiming::SCIP_HEURTIMING
    nodeinfeasible::Bool
    heur_ptr::Ptr{SCIP_HEUR}
end

function find_primal_solution(
    scip,
    heur::HeuristicCb,
    heurtiming,
    nodeinfeasible,
    heur_ptr,
)
    cb_data = HeuristicCbData(heur, false, heurtiming, nodeinfeasible, heur_ptr)
    heur.heurcallback(cb_data)
    result = cb_data.submit_called ? SCIP_FOUNDSOL : SCIP_DIDNOTFIND
    return SCIP_OKAY, result
end

# MOI Interface for heuristic callbacks

function MOI.get(
    o::Optimizer,
    ::MOI.CallbackVariablePrimal{HeuristicCbData},
    vs::Vector{MOI.VariableIndex},
)
    return [SCIPgetSolVal(o, C_NULL, var(o, vi)) for vi in vs]
end

MOI.supports(::Optimizer, ::MOI.HeuristicCallback) = true

function MOI.set(o::Optimizer, ::MOI.HeuristicCallback, cb::Function)
    if o.moi_heuristic === nothing
        o.moi_heuristic = HeuristicCb(o.inner, cb)
        include_heuristic(
            o,
            o.moi_heuristic;
            name="MOI_heuristic",
            description="Heuristic set in the MOI optimizer",
        )
    else
        o.moi_heuristic.heurcallback = cb
    end
    return nothing
end

MOI.supports(::Optimizer, ::MOI.HeuristicSolution{HeuristicCbData}) = true

function MOI.submit(
    o::Optimizer,
    cb::MOI.HeuristicSolution{HeuristicCbData},
    x::Vector{MOI.VariableIndex},
    values::Vector{<:Real},
)
    callback_data = cb.callback_data
    heuristic = callback_data.heur
    heur_ = o.inner.heuristic_storage[heuristic]
    sol = create_empty_scipsol(o.inner.scip[], heur_)
    for idx in eachindex(x)
        SCIP.@SCIP_CALL SCIP.SCIPsetSolVal(
            o.inner.scip[],
            sol,
            var(o, x[idx]),
            values[idx],
        )
    end
    stored = Ref{SCIP_Bool}(SCIP.FALSE)
    @SCIP_CALL SCIPtrySolFree(
        o.inner.scip[],
        Ref(sol),
        SCIP.FALSE,
        SCIP.FALSE,
        SCIP.TRUE,
        SCIP.TRUE,
        SCIP.TRUE,
        stored,
    )
    if stored[] == SCIP.TRUE
        callback_data.submit_called = true
    end
    return
end
