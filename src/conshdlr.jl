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
# - don't support optional methods: CONSHLDRCOPY, CONSFREE, CONSINIT, CONSEXIT,
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

# Example implementation
mutable struct ExampleConstraintHandler <: AbstractConstraintHandler
end

### ^ above: what it will look like to Julia users
### = here: sketches for the translation

### v below: what it will look like to SCIP

# Methods

# CONSENFOLP
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS** conss, int nconss,
#  int nusefulconss, SCIP_Bool solinfeasible, SCIP_RESULT* result)

function _consenfolp(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                     conss::Ptr{Ptr{SCIP_CONS}}, nconss::Cint,
                     nusefulconss::Cint, solinfeasible::SCIP_Bool,
                     result::Ptr{SCIP_RESULT})
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
    return SCIP_OKAY
end

# CONSCHECK
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS** conss, int nconss,
#  SCIP_SOL* sol, SCIP_Bool checkintegrality, SCIP_Bool checklprows,
#  SCIP_Bool printreason, SCIP_Bool completely, SCIP_RESULT* result
function _conscheck(scip::Ptr{SCIP_}, conshdlr::{SCIP_CONSHDLR},
                    conss::Ptr{Ptr{SCIP_CONS}}, nconss::Cint,
                    sol::Ptr{SCIP_SOL}, checkintegrality::SCIP_Bool,
                    checklprows::SCIP_Bool, printreason::SCIP_Bool,
                    completely::SCIP_Bool, result::Ptr{SCIP_RESULT})
    return SCIP_OKAY
end

# CONSLOCK
# (SCIP* scip, SCIP_CONSHDLR* conshdlr, SCIP_CONS* cons,
#  SCIP_LOCKTYPE locktype, int nlockspos, int nlocksneg)
function _conslock(scip::Ptr{SCIP_}, conshdlr::Ptr{SCIP_CONSHDLR},
                   cons::Ptr{SCIP_CONS}, locktype::Ptr{SCIP_LOCKTYPE},
                   nlockspos::Cint, nlocksneg::Cint)
    return SCIP_OKAY
end

# SCIPincludeConsXyz(SCIP* scip)
#
# - is called by users, not SCIP: no need to make it signature conformant.
# - set properties (NAME, DESC, ENFOPRIORITY, CHECKPRIORITY).
# - initialize conshdlrdata (== Julia object)
# - could be called from the constructor to constraint handler?
function include_conshdlr(mscip::ManagedSCIP, constraint_handler::CH) where CH <: AbstractConstraintHandler
    # get C function pointers from Julia functions
    # TODO: need specific methods? ask users to specify as function arguments?
    _enfolp = @cfunction(_consenfolp, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _enfops = @cfunction(_consenfops, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Cint, SCIP_Bool, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _check = @cfunction(_conscheck, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_SOL}, SCIP_Bool, SCIP_Bool, SCIP_Bool, SCIP_Bool, Ptr{SCIP_RESULT}))
    _lock = @cfunction(_conslock, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}, Ptr{SCIP_LOCKTYPE}, Cint, Cint))

    # We don't need to store this, I guess.
    conshdlr__ = Ref{Ptr{SCIP_CONSHDLR}}
    conshdlr__[] = C_NULL

    # Fixed values for some properties:
    EAGERFREQ = 100
    NEEDSCONS = TRUE

    # Get other values from methods:
    name = get(constraint_handler, Name())
    desc = get(constraint_handler, Description())
    enfoprio = get(constraint_handler, EnforcePriority())
    checkprio = get(constraint_handler, CheckPriority())

    # Register constraint handler with SCIP instance.
    @SC SCIPincludeConshdlrBasic(mscip, conshdlr__, name, desc, enfopriority,
                                 chckpriority, EAGERFREQ, NEEDSCONS,
                                 _enfolp, _enfops, _check, _lock,
                                 constraint_handler)

    # Sanity checks
    @assert conshdlr__[] != C_NULL
end

# SCIPcreateConsBasicXyz(SCIP* scip, SCIP_CONS** cons, char* name, ...)
#
# - is called by users, not SCIP: no need to make it signature conformant.
# - add custom arguments as needed
# - store in consdata (== Julia object)
# - could be the same as the constructor to AbstractConstraint?
