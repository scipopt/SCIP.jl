# Current limitations:
# - use fixed values for some properties
#   - EAGERFREQ = 100
#   - NEEDSCONS = TRUE
#   - SEPAPRIORITY = 0
#   - SEPAFREQ = -1
#   - DELAYSEPA = FALSE
#   - PROPFREQ = -1
#   - DELAYPROP = -1
#   - PROP_TIMING = SCIP_PROPTIMING_BEFORELP
#   - PRESOLTIMING = SCIP_PRESOLTIMING_MEDIUM
#   - MAXPREROUNDS = -1
# - don't support optional methods: CONSHDLRCOPY, CONSFREE, CONSINIT, CONSEXIT,
#   CONSINITPRE, CONSEXITPRE, CONSINITSOL, CONSEXITSOL, CONSDELETE, CONSTRANS,
#   CONSINITLP, CONSSEPALP, CONSSEPASOL, CONSENFORELAX, CONSPROP, CONSPRESOL,
#   CONSRESPROP, CONSACTIVE, CONSDEACTIVE, CONSENABLE, CONSDISABLE, CONSDELVARS,
#   CONSPRINT, CONSCOPY, CONSPARSE, CONSGETVARS, CONSGETNVARS, CONSGETDIVEBDCHGS
# - don't support linear or nonlinear constraint upgrading

# Abstract Types:

# (also: CONSHDLRDATA)
abstract type AbstractConstraintHandler end

# (also: CONSDATA)
abstract type AbstractConstraint{Handler} end

# Parameters:

abstract type AbstractConstraintHandlerParameter end
struct Name <: AbstractConstraintHandlerParameter end
struct Description <: AbstractConstraintHandlerParameter end
struct EnforcePriority <: AbstractConstraintHandlerParameter end
struct CheckPriority <: AbstractConstraintHandlerParameter end

# Interface methods

# Parameters have default values
get(::AbstractConstraintHandler, ::Name) = ""
get(::AbstractConstraintHandler, ::Description) = ""
# enfoprio: integral has 0, nonlinear: -30 or less
get(::AbstractConstraintHandler, ::EnforcePriority) = -15
# checkprio: integral has 0, SCIP's plugins have -6000000 or more
get(::AbstractConstraintHandler, ::CheckPriority) = -7000000

# For semantics of callback methods, see SCIP documentation at:
# https://scip.zib.de/doc-6.0.1/html/CONS.php#CONS_FUNDAMENTALCALLBACKS

# possible return values:
# SCIP_FEASIBLE: given solution is satisfies the constraint
# SCIP_INFEASIBLE: given solution is violates the constraint
function check end

# possible return values:
# SCIP_FEASIBLE: given solution is satisfies the constraint
# SCIP_CUTOFF: stating that the current subproblem is infeasible
# SCIP_CONSADDED: adding constraint that resolves the infeasibility
# SCIP_REDUCEDDOM: reducing the domain of a variable
# SCIP_SEPARATED: adding a cutting plane
# SCIP_BRANCHED: performing a branching
function enforce_lp_sol end

# possible return values:
# SCIP_FEASIBLE: given solution is satisfies the constraint
# SCIP_CUTOFF: stating that the current subproblem is infeasible
# SCIP_CONSADDED: adding constraint that resolves the infeasibility
# SCIP_REDUCEDDOM: reducing the domain of a variable
# SCIP_BRANCHED: performing a branching
# SCIP_SOLVELP: force solving of LP
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
    res = check(constraint_handler, constraints)
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
    res = enforce_lp_sol(constraint_handler, constraints, solinfeasible)
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
    res = enforce_pseudo_sol(constraint_handler, constraints, solinfeasible, objinfeasible)
    unsafe_store!(result, res)

    return SCIP_OKAY
end

# CONSLOCK
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS* cons,
#  SCIP_LOCKTYPE locktype, int nlockspos, int nlocksneg)
function _conslock(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                   cons::Ptr{SCIP_CONS}, locktype::Ptr{SCIP_LOCKTYPE},
                   nlockspos::Cint, nlocksneg::Cint)
    # get Julia object out of constraint handler data
    conshdlrdata::Ptr{SCIP_CONSHDLRDATA} = SCIPconshdlrGetData(conshdlr)
    constraint_handler = unsafe_pointer_to_objref(conshdlrdata)

    # TODO: document meaning of all parameters

    # call user method via dispatch
    lock(constraint_handler, cons, locktype, nlockspos, nlocksneg)

    return SCIP_OKAY
end

# SCIPincludeConsXyz(SCIP* scip)
#
# - is called by users, not SCIP: no need to make it signature conformant.
# - set properties (NAME, DESC, ENFOPRIORITY, CHECKPRIORITY).
# - initialize conshdlrdata (== Julia object)
# - could be called from the constructor to constraint handler?
function include_conshdlr(mscip::ManagedSCIP, ch::CH) where CH <: AbstractConstraintHandler
    # get C function pointers from Julia functions
    _enfolp = @cfunction(_consenfolp, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _enfops = @cfunction(_consenfops, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _check = @cfunction(_conscheck, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_SOL}, SCIP_Bool, SCIP_Bool, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _lock = @cfunction(_conslock, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}, Ptr{SCIP_LOCKTYPE}, Cint, Cint))

    # We don't need to store this, I guess.
    conshdlr__ = Ref{Ptr{SCIP_CONSHDLR}}(C_NULL)

    # Fixed values for some properties:
    # TODO: allow to set them as optional parameters?
    EAGERFREQ = 100
    NEEDSCONS = TRUE

    # Get other values from methods:
    name = get(ch, Name())
    name != "" || error("Constraint handler may not have empty name!")
    desc = get(ch, Description())
    enfopriority = get(ch, EnforcePriority())
    chckpriority = get(ch, CheckPriority())

    # Hand over Julia object as constraint handler data:
    # TODO: make sure that `ch` is not garbage collected?
    conshdlrdata_ = pointer_from_objref(ch)

    # Register constraint handler with SCIP instance.
    @SC SCIPincludeConshdlrBasic(mscip, conshdlr__,
                                 name, desc, enfopriority, chckpriority,
                                 EAGERFREQ, NEEDSCONS,
                                 _enfolp, _enfops, _check, _lock,
                                 conshdlrdata_)

    # Sanity checks
    @assert conshdlr__[] != C_NULL
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
function add_constraint(mscip::ManagedSCIP, ch::CH, c::C) where {CH <:AbstractConstraintHandler, C <: AbstractConstraint{CH}}
    # Find matching SCIP constraint handler plugin.
    # TODO: store mapping in Julia data, not depending on unique name?
    name = get(ch, Name())
    conshdlr_::Ptr{SCIP_CONSHDLR} = SCIPfindConshdlr(mscip, name)
    conshdlr_ != C_NULL || error("Constraint handler $name not found!")

    # Hand over Julia object as constraint data:
    # TODO: make sure that `c` is not garbage collected?
    consdata_ = pointer_from_objref(c)

    # Create SCIP constraint (and attach constraint data).
    # TODO: allow to set last 10 arguments as optional?
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SC SCIPcreateCons(mscip, cons__, "", conshdlr_, consdata_,
                       TRUE, TRUE, TRUE, TRUE, TRUE,
                       FALSE, FALSE, FALSE, FALSE, FALSE)

    # Add constraint to problem.
    @SC SCIPaddCons(mscip, cons__[])

    # Register constraint and return reference.
    return SCIP.store_cons!(mscip, cons__)
end
