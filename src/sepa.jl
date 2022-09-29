#
# Wrapper for implementing SCIP separators in Julia.
#
# Please study the corresponding SCIP documentation first, to become familiar
# with basic concepts and terms: https://www.scipopt.org/doc/html/SEPA.php
#
# The basic idea is that you create a new subtype of `AbstractSeparator`
# to store the separator data and implement the fundamental callback by
# adding a method to the function `exec_lp`. In `test/sepa.jl` and
# `test/sepa_support.jl` you can find examples on how to use separators
#
#
# Current limitations:
# - We only support SEPAEXECLP, not SEPAEXECSOL.
# - We don't support these optional methods: SEPAFREE, SEPACOPY, SEPAINIT,
#   SEPAINITSOL, SEPAEXITSOL 
#


#
# Abstract Supertypes:
#

"""
    AbstractSeparator

Abstract supertype for objects that store all user data belonging to the
separator. This object is also used for method dispatch with the callback
functions.

From SCIP's point-of-view, this objects corresponds to the SCIP_SEPADATA,
but its memory is managed by Julia's GC.

It's recommended to store a reference to your instance of `SCIPData` or
`SCIP.Optimizer` here, so that you can use it within `exec_lp`.
"""
abstract type AbstractSeparator end


#
# Fundamental Callback for Julia.
#

"""
    exec_lp(separator::SEPA)::SCIP_RESULT

Adds cutting planes to the model. Feasible solutions may be cutted off, as long
as at least one optimal solution stays feasible.


Use the functions `sol_values` to access the solution values.

Acceptable result values are:
* `SCIP_CUTOFF`: The current subproblem is infeasible.
* `SCIP_CONSADDED`: Added a constraint.
* `SCIP_REDUCEDDOM`: Reduced the domain of a variable.
* `SCIP_SEPARATED`: Added a cutting plane.
* `SCIP_DIDNOTFIND`: Searched for domain reductions or cutting planes, but did
  not find any.
* `SCIP_DIDNOTRUN`: Separator was skipped.
* `SCIP_DELAYED`: Separator was skipped, but should be called again.
* `SCIP_NEWROUND`: A new separator round should be started without calling the
  remaining separator methods.
"""
function exec_lp end


#
# Fundamental callback functions with SCIP's C API.
#
# There is only a single, generic implementation for each of these, which are
# passed to all user-defined SCIP separators, but they will call the user's
# method in the function body.
#

"""
Generic `exec_lp` function, matching the signature from SCIP's C API.
"""
function _sepaexeclp(scip::Ptr{SCIP_}, sepa::Ptr{SCIP_SEPA},
                     result::Ptr{SCIP_RESULT},
                     allowlocal::SCIP_Bool)
    # get Julia object out of separator data
    sepadata::Ptr{SCIP_SEPADATA} = SCIPsepaGetData(sepa)
    separator = unsafe_pointer_to_objref(sepadata)

    # call user method via dispatch
    res = exec_lp(separator)
    unsafe_store!(result, res)

    return SCIP_OKAY
end



"""
Generic `free` function, matching the signature from SCIP's C API.
"""
function _sepafree(scip::Ptr{SCIP_}, sepa::Ptr{SCIP_SEPA})
    # Here, we should free the separator data. But because this is an object
    # created and owned by Julia, we will let GC do it.
    # Instead, we will just set the pointer to NULL, so that SCIP will think
    # that it is taken care of.
    SCIPsepaSetData(sepa, C_NULL)

    return SCIP_OKAY
end


#
# Adding a separator to SCIP.
#

"""
    include_sepa(
        scip::Ptr{SCIP_},
        sepas::Dict{Any, Ptr{SCIP_SEPA}},
        sepa::SEPA;
        name::String,
        description::String,
        priority::Int,
        freq::Int,
        maxbounddist::Float,
        usesubscip::Bool,
        delay::Bool
    )

Include a user defined separator `sepa` to the SCIP instance `scip`.

"""
function include_sepa(scip::Ptr{SCIP_}, sepas::Dict{Any, Ptr{SCIP_SEPA}}, sepa::SEPA;
                      name="", description="", priority=0, freq=1,
                      maxbounddist=0.0, usessubscip=false,
                      delay=false) where SEPA <: AbstractSeparator
    # Get C function pointers from Julia functions
    _execlp = @cfunction(_sepaexeclp, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA}, Ptr{SCIP_RESULT}, SCIP_Bool))
    _execsol = C_NULL

    # Store pointer to SCIP structure (for future C API calls)
    sepa__ = Ref{Ptr{SCIP_SEPA}}(C_NULL)

    # Hand over Julia object as separator data:
    sepadata_ = pointer_from_objref(sepa)

    # Try to create unique name, or else SCIP will complain!
    if name == ""
        name = "__sepa__$(length(sepas))"
    end

    # Register separator with SCIP instance.
    @SCIP_CALL SCIPincludeSepaBasic(scip, sepa__, name, description,
                             priority, freq, maxbounddist,
                             usessubscip, delay, 
                             _execlp, _execsol,
                             sepadata_)

    # Sanity checks
    @assert sepa__[] != C_NULL

    # Set additional callbacks.
    @SCIP_CALL SCIPsetSepaFree(
        scip, sepa__[],
        @cfunction(_sepafree, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_SEPA})))

    # Register separator (for GC-protection and mapping).
    sepas[sepa] = sepa__[]
end


"""
    add_cut_sepa(
        scip::Ptr{SCIP_},
        vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}
        sepas::Dict{Any, Ptr{SCIP_SEPA}}
        sepa::SEPA,
        varrefs::AbstractArray{VarRef},
        coefs::AbstractArray{Float64},
        lhs::Float64,
        rhs::Float64,
        islocal::Bool,
        modifiable::Bool,
        removable::Bool
    )

Add the cut given by `varrefs`, `coefs`, `lhs` and `rhs` to `scip`.
`add_cut_sepa` is intended to be called from the method `exec_lp`, that is
associated to the separator `sepa`.

# Arguments
- islocal: is cut only valid locally?
- modifiable: is row modifiable during node processing (subject to column generation)?
- removable: should the row be removed from the LP due to aging or cleanup?
"""
function add_cut_sepa(scip::Ptr{SCIP_}, vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}, sepas::Dict{Any, Ptr{SCIP_SEPA}}, sepa::SEPA, varrefs, coefs, lhs, rhs;
                      islocal=false, modifiable=false, removable=true
                     ) where {SEPA <: AbstractSeparator}
    @assert length(varrefs) == length(coefs)
    vars = [vars[vr][] for vr in varrefs]
    row__ = Ref{Ptr{SCIP_ROW}}(C_NULL)
    sepa__ = sepas[sepa]
    @SCIP_CALL SCIPcreateEmptyRowSepa(
        scip, row__, sepa__, "", lhs, rhs, islocal, modifiable, removable)
    @SCIP_CALL SCIPaddVarsToRow(scip, row__[], length(vars), vars, coefs)
    if islocal
      infeasible = Ref{SCIP_Bool}()
      @SCIP_CALL SCIPaddRow(scip, row__[], true, infeasible)
    else
      @SCIP_CALL SCIPaddPoolCut(scip, row__[])
    end
    @SCIP_CALL SCIPreleaseRow(scip, row__)
end
