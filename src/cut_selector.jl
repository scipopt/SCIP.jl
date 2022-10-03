# cut selection interface
# it is recommended to check https://scipopt.org/doc/html/CUTSEL.php for key concepts and interface

"""
Abstract class for cut selector.
A cut selector must implement `select_cuts`.
It also stores all user data that must be available to select cuts.
"""
abstract type AbstractCutSelector end

"""
    select_cuts(cutsel, scip, cuts, forced_cuts, root, maxnslectedcuts) -> (retcode, nselectedcuts, result)

It must operate the selection of cuts by placing the selected cuts first in the selected cut vector.
`nselectedcuts` must be the number of selected cuts, retcode indicates whether the selection went well.
A typical result would be `SCIP_SUCCESS`, and retcode `SCIP_OKAY`.
`forced_cuts` is a vector of cuts that will be added to the problem, they should not be tampered with by the function.
"""
function select_cuts(cutsel::AbstractCutSelector, scip, cuts::Vector{Ptr{SCIP_ROW}}, forced_cuts::Vector{Ptr{SCIP_ROW}}, root, maxnslectedcuts)
end

function _select_cut_callback(scip::Ptr{SCIP_}, cutsel_::Ptr{SCIP_CUTSEL}, cuts_::Ptr{Ptr{SCIP_ROW}}, ncuts::Cint, forced_cuts_::Ptr{Ptr{SCIP_ROW}}, nforced_cuts::Cint, root_::SCIP_Bool, maxnslectedcuts::Cint, nselectedcuts_::Ptr{Cint}, result_::Ptr{SCIP_RESULT})
    cutseldata::Ptr{SCIP_CUTSELDATA} = SCIPcutselGetData(cutsel_)
    cutsel = unsafe_pointer_to_objref(cutseldata)
    cuts = unsafe_wrap(Vector{Ptr{SCIP_ROW}}, cuts_, ncuts)
    @assert length(cuts) == ncuts
    forced_cuts = unsafe_wrap(Vector{Ptr{SCIP_ROW}}, forced_cuts_, nforced_cuts)
    @assert length(forced_cuts) == nforced_cuts
    root = root_ == SCIP.TRUE
    (retcode, nselectedcuts, result) = select_cuts(cutsel, scip, cuts, forced_cuts, root, maxnslectedcuts)::Tuple{SCIP_RETCODE, Integer, SCIP_RESULT}
    if retcode != SCIP_OKAY
        return retcode
    end
    if nselectedcuts > maxnslectedcuts
        error("$nselectedcuts cuts selected by cut selected, maximum $maxnslectedcuts allowed")
    end
    unsafe_store!(nselectedcuts_, Cint(nselectedcuts))
    unsafe_store!(result_, result)
    return retcode
end

function _cutselfree(::Ptr{SCIP_}, cutsel::Ptr{SCIP_CUTSEL})
    # just like sepa, free the data on the SCIP side,
    # the Julia GC will take care of the objects
    SCIPcutselSetData(cutsel, C_NULL)
    return SCIP_OKAY
end

"""
Includes a cut selector in SCIP and stores it in cutsel_storage.
"""
function include_cutsel(scip::Ptr{SCIP_}, cutsel::CS, cutsel_storage::Dict{Any, Ptr{SCIP_CUTSEL}}; name = "", description = "", priority=10000) where {CS <: AbstractCutSelector}

    # ensure a unique name for the cut selector
    if name == ""
        name = "cutselector_$(string(CS))"
    end
    
    cutsel__ = Ref{Ptr{SCIP_CUTSEL}}(C_NULL)
    if !ismutable(cutsel)
        throw(ArgumentError("The cut selector structure must be a mutable type"))
    end

    cutseldata_ = pointer_from_objref(cutsel)
    cutselselect_callback = @cfunction(
        _select_cut_callback, SCIP_RETCODE,
        (Ptr{SCIP_}, Ptr{SCIP_CUTSEL}, Ptr{Ptr{SCIP_ROW}}, Cint, Ptr{Ptr{SCIP_ROW}}, Cint, SCIP_Bool, Cint, Ptr{Cint}, Ptr{SCIP_RESULT}),
    )
    @SCIP_CALL SCIPincludeCutselBasic(scip, cutsel__, name, description, priority, cutselselect_callback, cutseldata_)
    @assert cutsel__[] != C_NULL

    @SCIP_CALL SCIPsetCutselFree(
        scip, cutsel__[],
        @cfunction(_cutselfree, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CUTSEL})),
    )

    # store cut selector (avoids GC-ing it)
    cutsel_storage[cutsel] = cutsel__[]    
end

"""
Extracts information from a SCIP_ROW into a form:
`lhs ≤ aᵀ x + b ≤ rhs`
The row is returned as a named tuple
"""
function get_row_information(scip::SCIPData, row::Ptr{SCIP_ROW})
    rhs = SCIProwGetRhs(row)
    lhs = SCIProwGetLhs(row)
    b = SCIProwGetConstant(row)
    n = SCIProwGetNNonz(row)
    a_ptr = SCIProwGetVals(row)
    a = unsafe_wrap(Vector{Cdouble}, a_ptr, n)
    col_ptr = SCIProwGetCols(row)
    cols = unsafe_wrap(Vector{Ptr{SCIP_COL}}, col_ptr, n)
    x = map(cols) do col
        var_ptr = SCIPcolGetVar(col)
        var_ref = findfirst(==(var_ptr), scip.vars)
        @assert var_ref !== nothing
        var_ref
    end
    return (;rhs, lhs, b, a, x)
end

"""
Utility function to get scores from cut that can be used to evaluate it.
Returns a named tuple with three commonly used scores `(; integer_support, efficacy, objective_parallelism)`.
"""
function get_row_scores(scip::Ptr{SCIP_}, row::Ptr{SCIP_ROW})
    integer_support = SCIPgetRowNumIntCols(scip, row) / SCIProwGetNNonz(row)
    efficacy = SCIPgetCutEfficacy(scip, C_NULL, row)
    objective_parallelism = SCIPgetRowObjParallelism(scip, cuts[i])
    return (; integer_support, efficacy, objective_parallelism)
end