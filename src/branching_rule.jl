# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# branching rule interface
# it is recommended to check https://scipopt.org/doc/html/BRANCH.php for key concepts and interface

"""
Abstract class for branching rule.
A branching rule must implement the `branch` method.
It also stores all user data that must be available to select a branching variable.
"""
abstract type AbstractBranchingRule end

"""
The type of solution we branch on.
The three subtypes are BranchingLP, BranchingPseudoSolution, BranchingExternalCandidate
"""
abstract type BranchingType end

"""
Branching for LP candidate, corresponds to the SCIP `SCIP_DECL_BRANCHEXECLP` callback.
"""
struct BranchingLP <: BranchingType end

"""
Branching for pseudo-solution candidate, corresponds to the SCIP `SCIP_DECL_BRANCHEXECPS` callback.
"""
struct BranchingPseudoSolution <: BranchingType end

"""
Branching for external candidate, corresponds to the SCIP `SCIP_DECL_BRANCHEXECEXT` callback.
"""
struct BranchingExternalCandidate <: BranchingType end


"""
    branch(branching_rule, scip, allow_additional_constraints, type)

Perform branching with the current `branching_rule`.

`allow_additional_constraints` is a Boolean indicating if the branching rule
is allowed to add constraints to the current node in order to cut off the current solution instead of creating a branching.

That method must return a tuple (return_code::LibSCIP.SCIP_RETCODE, result::SCIP.LibSCIP.SCIP_RESULT).
If no branching was performed, use `SCIP_DIDNOTRUN` as a result to pass on to the following branching rule.

`type` is the `BranchingType` to branch on, i.e. on LP solution, pseudo-solution or external candidate.
"""
function branch(branching_rule::AbstractBranchingRule, scip, allow_additional_constraints, type::BranchingType)
    return (LibSCIP.SCIP_OKAY, LibSCIP.SCIP_DIDNOTRUN)
end

"""
    get_branching_candidates(scip)

returns a tuple with branching candidate information, including:
`(candidates, candidates_values, candidates_fractionalities, npriolpcands, nfracimplvars)`
with:
- `candidates` a vector of variables with the branching candidates
- `candidates_values` the corresponding values at the LP relaxation
- `candidates_fractionalities` the corresponding fractionalities
- `npriolpcands` the number of candidates with maximal priority that MUST be branched on
- `nfracimplvars` the number of fractional implicit integer variables, that should not be branched on.
"""
function get_branching_candidates(scip)
    lpcands = Ref{Ptr{Ptr{SCIP_VAR}}}(C_NULL)
    lpcandssol = Ref{Ptr{SCIP_Real}}(C_NULL)
    lpcandsfrac = Ref{Ptr{SCIP_Real}}(C_NULL)
    nlpcands = Ref{Cint}(-1)
    npriolpcands = Ref{Cint}(-1)
    nfracimplvars = Ref{Cint}(-1)
    @SCIP_CALL SCIPgetLPBranchCands(
        scip,
        lpcands,
        lpcandssol,
        lpcandsfrac,
        nlpcands,
        npriolpcands,
        nfracimplvars,
    )
    @assert lpcands[] != C_NULL
    @assert nlpcands[] > 0
    @assert npriolpcands[] >= 0
    candidates = unsafe_wrap(Array, lpcands[], nlpcands[])
    @assert lpcandssol[] != C_NULL
    candidates_values = unsafe_wrap(Array, lpcandssol[], nlpcands[])
    @assert lpcandsfrac[] != C_NULL
    candidates_fractionalities = unsafe_wrap(Array, lpcandsfrac[], nlpcands[])
    @assert nfracimplvars[] >= 0

    return (
        candidates,
        candidates_values,
        candidates_fractionalities,
        npriolpcands[],
        nfracimplvars[],
    )
end

function branch_on_candidate!(scip, var)
    @SCIP_CALL LibSCIP.SCIPbranchVar(scip, var, C_NULL, C_NULL, C_NULL)
    return nothing
end

function _branchrulefree(::Ptr{SCIP_}, branching::Ptr{SCIP_BRANCHRULE})
    # just like sepa, free the data on the SCIP side,
    # the Julia GC will take care of the objects
    SCIPbranchruleSetData(branching, C_NULL)
    return SCIP_OKAY
end

#####
# Low-level SCIP callbacks
## These are defined here to match the C function signature expected by SCIP
#####

function _branchrule_exec_lp(scip::Ptr{SCIP_}, branchrule_::Ptr{SCIP_BRANCHRULE}, allowaddcons::SCIP_Bool, result_::Ptr{SCIP_RESULT})
    branchruledata::Ptr{SCIP_BRANCHRULEDATA} = SCIPbranchruleGetData(branchrule_)
    branchrule = unsafe_pointer_to_objref(branchruledata)
    (retcode, result) = branch(branchrule, scip, allowaddcons == 1, BranchingLP())::Tuple{SCIP_RETCODE,SCIP_RESULT}
    if retcode != SCIP_OKAY
        return retcode
    end
    unsafe_store!(result_, result)
    return retcode
end

function _branchrule_exec_ps(scip::Ptr{SCIP_}, branchrule_::Ptr{SCIP_BRANCHRULE}, allowaddcons::SCIP_Bool, result_::Ptr{SCIP_RESULT})
    branchruledata::Ptr{SCIP_BRANCHRULEDATA} = SCIPbranchruleGetData(branchrule_)
    branchrule = unsafe_pointer_to_objref(branchruledata)
    (retcode, result) = branch(branchrule, scip, allowaddcons == 1, BranchingPseudoSolution())::Tuple{SCIP_RETCODE,SCIP_RESULT}
    if retcode != SCIP_OKAY
        return retcode
    end
    unsafe_store!(result_, result)
    return retcode
end

function _branchrule_exec_external(scip::Ptr{SCIP_}, branchrule_::Ptr{SCIP_BRANCHRULE}, allowaddcons::SCIP_Bool, result_::Ptr{SCIP_RESULT})
    branchruledata::Ptr{SCIP_BRANCHRULEDATA} = SCIPbranchruleGetData(branchrule_)
    branchrule = unsafe_pointer_to_objref(branchruledata)
    (retcode, result) = branch(branchrule, scip, allowaddcons == 1, BranchingExternalCandidate())::Tuple{SCIP_RETCODE,SCIP_RESULT}
    if retcode != SCIP_OKAY
        return retcode
    end
    unsafe_store!(result_, result)
    return retcode
end

"""
Includes a branching rule in SCIP and stores it in branchrule_storage.
Keyword of interests can be:
`maxdepth` corresponding to SCIP `BRANCHRULE_MAXDEPTH`. Use -1 for no depth limit,
`max_bound_distance` corresponding to `BRANCHRULE_MAXBOUNDDIST`.
"""
function include_branchrule(
    scip::Ptr{SCIP_},
    branchrule::BR,
    branchrule_storage::Dict{Any,Ptr{SCIP_BRANCHRULE}};
    name="",
    description="",
    priority=10000,
    maxdepth=-1,
    max_bound_distance=1.0,
) where {BR<:AbstractBranchingRule}

    # ensure a unique name for the cut selector
    if name == ""
        name = "branchrule_$(string(BR))"
    end

    branchrule__ = Ref{Ptr{SCIP_BRANCHRULE}}(C_NULL)
    if !ismutable(branchrule)
        throw(
            ArgumentError("The branching rule structure must be a mutable type"),
        )
    end

    branchruledata_ = pointer_from_objref(branchrule)

    branchrule_callback_lp = @cfunction(
        _branchrule_exec_lp,
        SCIP_RETCODE,
        (
            Ptr{SCIP_},
            Ptr{SCIP_BRANCHRULE},
            SCIP_Bool,
            Ptr{SCIP_RESULT},
        ),
    )
    branchrule_callback_ps = @cfunction(
        _branchrule_exec_ps,
        SCIP_RETCODE,
        (
            Ptr{SCIP_},
            Ptr{SCIP_BRANCHRULE},
            SCIP_Bool,
            Ptr{SCIP_RESULT},
        ),
    )
    branchrule_callback_ext = @cfunction(
        _branchrule_exec_external,
        SCIP_RETCODE,
        (
            Ptr{SCIP_},
            Ptr{SCIP_BRANCHRULE},
            SCIP_Bool,
            Ptr{SCIP_RESULT},
        ),
    )
    @SCIP_CALL SCIPincludeBranchruleBasic(
        scip,
        branchrule__,
        name,
        description,
        priority,
        maxdepth,
        max_bound_distance,
        branchruledata_,
    )
    @assert branchrule__[] != C_NULL

    @SCIP_CALL SCIPsetBranchruleFree(
        scip,
        branchrule__[],
        @cfunction(_branchrulefree, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_BRANCHRULE})),
    )

    @SCIP_CALL SCIPsetBranchruleExecLp(
        scip,
        branchrule__[],
        branchrule_callback_lp,
    )

    @SCIP_CALL SCIPsetBranchruleExecPs(
        scip,
        branchrule__[],
        branchrule_callback_ps,
    )

    @SCIP_CALL SCIPsetBranchruleExecExt(
        scip,
        branchrule__[],
        branchrule_callback_ext,
    )

    # store branching rule (avoids GC-ing it)
    branchrule_storage[branchrule] = branchrule__[]
end
