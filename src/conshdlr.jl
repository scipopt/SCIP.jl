#
# Wrappers for implementing SCIP constraint handlers in Julia.
#
# Please study the corresponding SCIP documentation first, to become familiar
# with basic concepts and terms: https://scip.zib.de/doc-6.0.2/html/CONS.php
#
# The basic idea is that you create a new subtype of `AbstractConstraintHandler`
# to store the constraint handler data and implement the fundamental callbacks
# by adding methods to the functions `check`, `enforce_lp_sol`,
# `enforce_pseudo_sol` and `lock`.
#
# If your constraint handler uses constraint objects (`needs_constraints`), you
# create a subtype of the parametrized `AbstractConstraint`.
#
#
# Current limitations:
# - We now use fixed values for some properties:
#   - SEPAPRIORITY = 0
#   - SEPAFREQ = -1
#   - DELAYSEPA = FALSE
#   - PROPFREQ = -1
#   - DELAYPROP = -1
#   - PROP_TIMING = SCIP_PROPTIMING_BEFORELP
#   - PRESOLTIMING = SCIP_PRESOLTIMING_MEDIUM
#   - MAXPREROUNDS = -1
# - We don't support these optional methods: CONSHDLRCOPY, CONSFREE, CONSINIT,
#   CONSEXIT, CONSINITPRE, CONSEXITPRE, CONSINITSOL, CONSEXITSOL, CONSDELETE,
#   CONSTRANS, CONSINITLP, CONSSEPALP, CONSSEPASOL, CONSENFORELAX, CONSPROP,
#   CONSPRESOL, CONSRESPROP, CONSACTIVE, CONSDEACTIVE, CONSENABLE, CONSDISABLE,
#   CONSDELVARS, CONSPRINT, CONSCOPY, CONSPARSE, CONSGETVARS, CONSGETNVARS,
#   CONSGETDIVEBDCHGS
# - We don't support linear or nonlinear constraint upgrading.
#

#
# Abstract Supertypes:
#

"""
    AbstractConstraintHandler

Abstract supertype for objects that store all user data belonging to the
constraint handler. This object is also used for method dispatch with the
callback functions.

From SCIP's point-of-view, this objects corresponds to the SCIP_CONSHDLRDATA,
but its memory is managed by Julia's GC.

It's recommended to store a reference to your instance of `ManagedSCIP` or
`SCIP.Optimizer` here, so that you can use it within your callback methods.
"""
abstract type AbstractConstraintHandler end

"""
    AbstractConstraint{Handler}

Abstract supertype for objects that store all user data belonging to an
individual constraint. It's parameterized by the type of constraint handler.

From SCIP's point-of-view, this objects corresponds to the SCIP_CONSDATA,
but its memory is managed by Julia's GC.
"""
abstract type AbstractConstraint{Handler} end

#
# Fundamental Callbacks:
#

"""
    check(
        constraint_handler::CH,
        constraints::Array{Ptr{SCIP_CONS}},
        sol::Ptr{SCIP_SOL},
        checkintegrality::SCIP_Bool,
        checklprows::SCIP_Bool,
        printreason::SCIP_Bool,
        completely::SCIP_Bool
    )::SCIP_RESULT

Check whether the solution candidate given by `sol` satisfies all constraints in
`constraints`.

Use the functions `user_constraint` and `sol_values` to access your
constraint-specific user data and solution values, respectively.

Acceptable result values are:
* `SCIP_FEASIBLE`: The solution candidate satisfies all constraints.
* `SCIP_INFEASIBLE`: The solution candidate violates at least one constraint.

There is nothing else to do for the user in terms of dealing with the violation.
"""
function check end

"""
    enforce_lp_sol(
        constraint_handler::CH,
        constraints::Array{Ptr{SCIP_CONS}},
        nusefulconss::Cint,
        solinfeasible::SCIP_Bool
    )::SCIP_RESULT

Enforce the current solution for the LP relaxation. That is, check all given
constraints for violation and deal with it in some way (see below).

Use the functions `user_constraint` and `sol_values` to access your
constraint-specific user data and solution values, respectively.

Acceptable result values are:
* `SCIP_FEASIBLE`: The solution candidate satisfies all constraints.
* `SCIP_CUTOFF`: The current subproblem is infeasible.
* `SCIP_CONSADDED`: Added a constraint that resolves the infeasibility.
* `SCIP_REDUCEDDOM`: Reduced the domain of a variable.
* `SCIP_SEPARATED`: Added a cutting plane.
* `SCIP_BRANCHED`: Performed a branching.
* `SCIP_INFEASIBLE`: The solution candidate violates at least one constraint.
"""
function enforce_lp_sol end

"""
    enforce_pseudo_sol(
        constraint_handler::CH,
        constraints::Array{Ptr{SCIP_CONS}},
        nusefulconss::Cint,
        solinfeasible::SCIP_Bool
    )::SCIP_RESULT

Enforce the current pseudo solution (the LP relaxation was not solved). That is,
check all given constraints for violation and deal with it in some way (see
below).

Use the functions `user_constraint` and `sol_values` to access your
constraint-specific user data and solution values, respectively.

Acceptable result values are:
* `SCIP_FEASIBLE`: The solution candidate satisfies all constraints.
* `SCIP_CUTOFF`: The current subproblem is infeasible.
* `SCIP_CONSADDED`: Added a constraint that resolves the infeasibility.
* `SCIP_REDUCEDDOM`: Reduced the domain of a variable.
* `SCIP_SEPARATED`: Added a cutting plane.
* `SCIP_BRANCHED`: Performed a branching.
* `SCIP_SOLVELP`: Force the solving of the LP relaxation.
* `SCIP_INFEASIBLE`: The solution candidate violates at least one constraint.
"""
function enforce_pseudo_sol end

function lock end

# Methods

# CONSCHECK
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS** conss, int nconss,
#  SCIP_SOL* sol, SCIP_Bool checkintegrality, SCIP_Bool checklprows,
#  SCIP_Bool printreason, SCIP_Bool completely, SCIP_RESULT* result
function _conscheck(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                    conss::Ptr{Ptr{SCIP_CONS}}, nconss::Cint,
                    sol::Ptr{SCIP_SOL}, checkintegrality::SCIP_Bool,
                    checklprows::SCIP_Bool, printreason::SCIP_Bool,
                    completely::SCIP_Bool, result::Ptr{SCIP_RESULT})
    # get Julia object out of constraint handler data
    conshdlrdata::Ptr{SCIP_CONSHDLRDATA} = SCIPconshdlrGetData(conshdlr)
    constraint_handler = unsafe_pointer_to_objref(conshdlrdata)

    # get Julia array from C pointer
    constraints = unsafe_wrap(Array{Ptr{SCIP_CONS}}, conss, nconss)

    # TODO: fetch solution values
    # TODO: document meaning of all parameters

    # call user method via dispatch
    res = check(constraint_handler, constraints, sol, checkintegrality,
                checklprows, printreason, completely)
    unsafe_store!(result, res)

    return SCIP_OKAY
end

# CONSENFOLP
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS** conss, int nconss,
#  int nusefulconss, SCIP_Bool solinfeasible, SCIP_RESULT* result)

function _consenfolp(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                     conss::Ptr{Ptr{SCIP_CONS}}, nconss::Cint,
                     nusefulconss::Cint, solinfeasible::SCIP_Bool,
                     result::Ptr{SCIP_RESULT})
    # get Julia object out of constraint handler data
    conshdlrdata::Ptr{SCIP_CONSHDLRDATA} = SCIPconshdlrGetData(conshdlr)
    constraint_handler = unsafe_pointer_to_objref(conshdlrdata)

    # get Julia array from C pointer
    constraints = unsafe_wrap(Array{Ptr{SCIP_CONS}}, conss, nconss)

    # TODO: fetch solution values?
    # TODO: document meaning of all parameters

    # call user method via dispatch
    res = enforce_lp_sol(constraint_handler, constraints, nusefulconss,
                         solinfeasible)
    unsafe_store!(result, res)

    return SCIP_OKAY
end

# CONSENFOPS
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS** conss, int nconss,
#  int nusefulconss, SCIP_Bool solinfeasible, SCIP_Bool objinfeasible,
#  SCIP_RESULT* result)
function _consenfops(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                     conss::Ptr{Ptr{SCIP_CONS}}, nconss::Cint,
                     nusefulconss::Cint, solinfeasible::SCIP_Bool,
                     objinfeasible::SCIP_Bool, result::Ptr{SCIP_RESULT})
    # get Julia object out of constraint handler data
    conshdlrdata::Ptr{SCIP_CONSHDLRDATA} = SCIPconshdlrGetData(conshdlr)
    constraint_handler = unsafe_pointer_to_objref(conshdlrdata)

    # get Julia array from C pointer
    constraints = unsafe_wrap(Array{Ptr{SCIP_CONS}}, conss, nconss)

    # TODO: fetch solution values?
    # TODO: document meaning of all parameters

    # call user method via dispatch
    res = enforce_pseudo_sol(constraint_handler, constraints, nusefulconss,
                             solinfeasible, objinfeasible)
    unsafe_store!(result, res)

    return SCIP_OKAY
end

# CONSLOCK
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS* cons,
#  SCIP_LOCKTYPE locktype, int nlockspos, int nlocksneg)
function _conslock(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                   cons::Ptr{SCIP_CONS}, locktype::SCIP_LOCKTYPE,
                   nlockspos::Cint, nlocksneg::Cint)
    # get Julia object out of constraint handler data
    conshdlrdata::Ptr{SCIP_CONSHDLRDATA} = SCIPconshdlrGetData(conshdlr)
    constraint_handler = unsafe_pointer_to_objref(conshdlrdata)

    # TODO: document meaning of all parameters

    # call user method via dispatch
    lock(constraint_handler, cons, locktype, nlockspos, nlocksneg)

    return SCIP_OKAY
end

# additional methods for memory management

# CONSFREE
# (SCIP* scip, SCIP_CONSHDLR* conshdlr)
function _consfree(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR})
    # Here, we should free the constraint handler data. But because this is an
    # object created and owned by Julia, we will let GC do it.
    # Instead, we will just set the pointer to NULL, so that SCIP will think
    # that it is taken care of.
    SCIPconshdlrSetData(conshdlr, C_NULL)

    return SCIP_OKAY
end

# CONSDELETE
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS* cons, SCIP_CONSDATA** consdata)
function _consdelete(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                     cons::Ptr{SCIP_CONS}, consdata::Ptr{Ptr{SCIP_CONSDATA}})
    # Here, we should free the constraint data. But because this is an object
    # created and owned by Julia, we will let GC do it.
    # Instead, we will just set the pointer to NULL, so that SCIP will think
    # that it is taken care of.
    unsafe_store!(consdata, C_NULL)

    return SCIP_OKAY
end

# SCIPincludeConsXyz(SCIP* scip)
#
# - is called by users, not SCIP: no need to make it signature conformant.
# - set properties (NAME, DESC, ENFOPRIORITY, CHECKPRIORITY).
# - initialize conshdlrdata (== Julia object)
# - could be called from the constructor to constraint handler?
function include_conshdlr(mscip::ManagedSCIP, ch::CH;
                          name="", description="", enforce_priority=-15,
                          check_priority=-7000000, eager_frequency=100,
                          needs_constraints=false) where CH <: AbstractConstraintHandler
    # get C function pointers from Julia functions
    _enfolp = @cfunction(_consenfolp, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, Ptr{SCIP_RESULT}))
    _enfops = @cfunction(_consenfops, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _check = @cfunction(_conscheck, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_SOL}, SCIP_Bool, SCIP_Bool, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _lock = @cfunction(_conslock, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}, SCIP_LOCKTYPE, Cint, Cint))

    # Store pointer to SCIP structure (for future C API calls)
    conshdlr__ = Ref{Ptr{SCIP_CONSHDLR}}(C_NULL)

    # Hand over Julia object as constraint handler data:
    conshdlrdata_ = pointer_from_objref(ch)

    # Register constraint handler with SCIP instance.
    @SC SCIPincludeConshdlrBasic(mscip, conshdlr__, name, description,
                                 enforce_priority, check_priority,
                                 eager_frequency, needs_constraints,
                                 _enfolp, _enfops, _check, _lock,
                                 conshdlrdata_)

    # Sanity checks
    @assert conshdlr__[] != C_NULL

    # Set additional callbacks
    @SC SCIPsetConshdlrFree(
        mscip, conshdlr__[],
        @cfunction(_consfree, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR})))

    @SC SCIPsetConshdlrDelete(
        mscip, conshdlr__[],
        @cfunction(_consdelete, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONSDATA}})))

    # Register constraint handler (for GC-protection and mapping)
    mscip.conshdlrs[ch] = conshdlr__[]
end

# SCIPcreateConsBasicXyz(SCIP* scip, SCIP_CONS** cons, char* name, ...)
#
# - is called by users, not SCIP: no need to make it signature conformant.
# - add custom arguments as needed
# - store in consdata (== Julia object)
# - could be the same as the constructor to AbstractConstraint?

"""
Add constraint of user-defined type, returns cons ref.

# Arguments
- `ch`: Julia-side constraint handler (== SCIP-side conshdlrdata)
- `c`: Julia-side constraint (== SCIP-side consdata)
"""
function add_constraint(mscip::ManagedSCIP, ch::CH, c::C;
                        initial=true, separate=true, enforce=true, check=true,
                        propagate=true, _local=false, modifiable=false,
                        dynamic=false, removable=false, stickingatnode=false) where {CH <:AbstractConstraintHandler, C <: AbstractConstraint{CH}}
    # Find matching SCIP constraint handler plugin.
    conshdlr_::Ptr{SCIP_CONSHDLR} = get(mscip.conshdlrs, ch, C_NULL)
    conshdlr_ != C_NULL || error("No matching constraint handler registered!")

    # Hand over Julia object as constraint data:
    consdata_ = pointer_from_objref(c)

    # Create SCIP constraint (and attach constraint data).
    # TODO: allow to set last 10 arguments as optional?
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateCons(mscip, cons__, "", conshdlr_, consdata_,
                       initial, separate, enforce, check, propagate,
                       _local, modifiable, dynamic, removable, stickingatnode)

    # Sanity check.
    @assert cons__[] != C_NULL

    # Register constraint data (for GC-protection).
    mscip.conshdlrconss[c] = cons__[]

    # Add constraint to problem.
    @SC SCIPaddCons(mscip, cons__[])

    # Register constraint and return reference.
    return SCIP.store_cons!(mscip, cons__)
end
