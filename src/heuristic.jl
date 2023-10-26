# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# heuristic interface
# it is recommended to check https://scipopt.org/doc/html/HEUR.php for key concepts and interface

"""
Abstract class for Heuristic.
A heuristic must implement `find_primal_solution`.
It also stores all user data that must be available to run the heuristic.
"""
abstract type Heuristic end

"""
    find_primal_solution(
        scip::Ptr{SCIP_},
        heur::Heuristic,
        heurtiming::Heurtiming,
        nodeinfeasible::Bool,
        heur_ptr::Ptr{SCIP_HEUR},
    ) -> (retcode, result)

It must attempt to find primal solution(s).
`retcode` indicates whether the selection went well.
A typical result would be `SCIP_SUCCESS`, and retcode `SCIP_OKAY`.
Use the methods `create_empty_scipsol` and `SCIPsetSolVal` to build solutions.
Submit it to SCIP with `SCIPtrySolFree`
"""
function find_primal_solution(scip, heur, heurtiming, nodeinfeasible, heur_ptr) end

function _find_primal_solution_callback(
    scip::Ptr{SCIP_},
    heur_::Ptr{SCIP_HEUR},
    heurtiming::SCIP_HEURTIMING,
    nodeinfeasible_::SCIP_Bool,
    result_::Ptr{SCIP_RESULT},
)
    heurdata::Ptr{SCIP_HEURDATA} = SCIPheurGetData(heur_)
    heur = unsafe_pointer_to_objref(heurdata)
    nodeinfeasible = nodeinfeasible_ == SCIP.TRUE
    (retcode, result) = find_primal_solution(
        scip,
        heur,
        heurtiming,
        nodeinfeasible,
        heur_,
    )::Tuple{SCIP_RETCODE,SCIP_RESULT}
    if retcode != SCIP_OKAY
        return retcode
    end
    unsafe_store!(result_, result)
    return retcode
end

function _heurfree(::Ptr{SCIP_}, heur::Ptr{SCIP_HEUR})
    # just like sepa, free the data on the SCIP side,
    # the Julia GC will take care of the objects
    SCIPheurSetData(heur, C_NULL)
    return SCIP_OKAY
end

"""
Includes a heuristic plugin in SCIP and stores it in heuristic_storage.
"""
function include_heuristic(
    scip::Ptr{SCIP_},
    heuristic::HT,
    heuristic_storage::Dict{Any,Ptr{SCIP_HEUR}};
    name="",
    description="",
    dispchar='_',
    priority=10000,
    frequency=1,
    frequency_offset=0,
    maximum_depth=-1,
    timing_mask=SCIP_HEURTIMING_BEFORENODE,
    usessubscip=false,
) where {HT<:Heuristic}

    # ensure a unique name for the cut selector
    if name == ""
        name = "heuristic_$(string(HT))"
    end
    if dispchar == '_'
        dispchar = name[end]
    end

    heur__ = Ref{Ptr{SCIP_HEUR}}(C_NULL)
    if !ismutable(heuristic)
        throw(
            ArgumentError("The heuristic structure must be a mutable type"),
        )
    end

    heurdata_ = pointer_from_objref(heuristic)
    heur_callback = @cfunction(
        _find_primal_solution_callback,
        SCIP_RETCODE,
        (
            Ptr{SCIP_},
            Ptr{SCIP_HEUR},
            SCIP_HEURTIMING,
            SCIP_Bool,
            Ptr{SCIP_RESULT},
        ),
    )
    @SCIP_CALL SCIPincludeHeurBasic(
        scip,
        heur__,
        name,
        description,
        dispchar,
        priority,
        frequency,
        frequency_offset,
        maximum_depth,
        timing_mask,
        usessubscip,
        heur_callback,
        heurdata_,
    )

    @assert heur__[] != C_NULL

    @SCIP_CALL SCIPsetHeurFree(
        scip,
        heur__[],
        @cfunction(_heurfree, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_HEUR})),
    )

    # store heuristic in storage (avoids GC-ing it)
    heuristic_storage[heuristic] = heur__[]
end

"""
create_empty_scipsol(scip::Ptr{SCIP_}, heur_::Ptr{SCIP_HEUR}) -> Ptr{SCIP_SOL}
Convenience wrapper to create an empty solution
"""
function create_empty_scipsol(scip::Ptr{SCIP_}, heur_::Ptr{SCIP_HEUR})
    sol__ = Ref{Ptr{SCIP_SOL}}(C_NULL)
    @SCIP_CALL SCIPcreateSol(scip, sol__, heur_)
    return sol__[]
end
