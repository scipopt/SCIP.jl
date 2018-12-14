# Automatically generated using Clang.jl wrap_c, version 0.0.0


# begin enum SCIP_Retcode
const SCIP_Retcode = Cint
const SCIP_OKAY = 1 |> Int32
const SCIP_ERROR = 0 |> Int32
const SCIP_NOMEMORY = -1 |> Int32
const SCIP_READERROR = -2 |> Int32
const SCIP_WRITEERROR = -3 |> Int32
const SCIP_NOFILE = -4 |> Int32
const SCIP_FILECREATEERROR = -5 |> Int32
const SCIP_LPERROR = -6 |> Int32
const SCIP_NOPROBLEM = -7 |> Int32
const SCIP_INVALIDCALL = -8 |> Int32
const SCIP_INVALIDDATA = -9 |> Int32
const SCIP_INVALIDRESULT = -10 |> Int32
const SCIP_PLUGINNOTFOUND = -11 |> Int32
const SCIP_PARAMETERUNKNOWN = -12 |> Int32
const SCIP_PARAMETERWRONGTYPE = -13 |> Int32
const SCIP_PARAMETERWRONGVAL = -14 |> Int32
const SCIP_KEYALREADYEXISTING = -15 |> Int32
const SCIP_MAXDEPTHLEVEL = -16 |> Int32
const SCIP_BRANCHERROR = -17 |> Int32
# end enum SCIP_Retcode

const SCIP_RETCODE = SCIP_Retcode

# begin enum SCIP_Result
const SCIP_Result = UInt32
const SCIP_DIDNOTRUN = 1 |> UInt32
const SCIP_DELAYED = 2 |> UInt32
const SCIP_DIDNOTFIND = 3 |> UInt32
const SCIP_FEASIBLE = 4 |> UInt32
const SCIP_INFEASIBLE = 5 |> UInt32
const SCIP_UNBOUNDED = 6 |> UInt32
const SCIP_CUTOFF = 7 |> UInt32
const SCIP_SEPARATED = 8 |> UInt32
const SCIP_NEWROUND = 9 |> UInt32
const SCIP_REDUCEDDOM = 10 |> UInt32
const SCIP_CONSADDED = 11 |> UInt32
const SCIP_CONSCHANGED = 12 |> UInt32
const SCIP_BRANCHED = 13 |> UInt32
const SCIP_SOLVELP = 14 |> UInt32
const SCIP_FOUNDSOL = 15 |> UInt32
const SCIP_SUSPENDED = 16 |> UInt32
const SCIP_SUCCESS = 17 |> UInt32
const SCIP_DELAYNODE = 18 |> UInt32
# end enum SCIP_Result

const SCIP_RESULT = SCIP_Result

# begin enum SCIP_ClockType
const SCIP_ClockType = UInt32
const SCIP_CLOCKTYPE_DEFAULT = 0 |> UInt32
const SCIP_CLOCKTYPE_CPU = 1 |> UInt32
const SCIP_CLOCKTYPE_WALL = 2 |> UInt32
# end enum SCIP_ClockType

const SCIP_CLOCKTYPE = SCIP_ClockType

struct SCIP_Clock
end

const SCIP_CLOCK = Cvoid

struct SCIP_CPUClock
end

const SCIP_CPUCLOCK = Cvoid

struct SCIP_WallClock
end

const SCIP_WALLCLOCK = Cvoid

# Skipping MacroDefinition: SCIP_DECL_SORTINDCOMP ( x ) int x ( void * dataptr , int ind1 , int ind2 ) /** compares two data element pointers
# *  result:
# *    < 0: elem1 comes before (is better than) elem2
# *    = 0: both elements have the same value
# *    > 0: elem2 comes after (is worse than) elem2
# */
# Skipping MacroDefinition: SCIP_DECL_SORTPTRCOMP ( x ) int x ( void * elem1 , void * elem2 ) /** gets the key of the given element */
# Skipping MacroDefinition: SCIP_DECL_HASHGETKEY ( x ) void * x ( void * userptr , void * elem ) /** returns TRUE iff both keys are equal */
# Skipping MacroDefinition: SCIP_DECL_HASHKEYEQ ( x ) SCIP_Bool x ( void * userptr , void * key1 , void * key2 ) /** returns the hash value of the key */
# Skipping MacroDefinition: SCIP_DECL_HASHKEYVAL ( x ) uint64_t x ( void * userptr , void * key ) #

# begin enum SCIP_Confidencelevel
const SCIP_Confidencelevel = UInt32
const SCIP_CONFIDENCELEVEL_MIN = 0 |> UInt32
const SCIP_CONFIDENCELEVEL_LOW = 1 |> UInt32
const SCIP_CONFIDENCELEVEL_MEDIUM = 2 |> UInt32
const SCIP_CONFIDENCELEVEL_HIGH = 3 |> UInt32
const SCIP_CONFIDENCELEVEL_MAX = 4 |> UInt32
# end enum SCIP_Confidencelevel

const SCIP_CONFIDENCELEVEL = SCIP_Confidencelevel

struct SCIP_SparseSol
end

const SCIP_SPARSESOL = Cvoid

struct SCIP_Queue
end

const SCIP_QUEUE = Cvoid

struct SCIP_PQueue
end

const SCIP_PQUEUE = Cvoid

struct SCIP_HashTable
end

const SCIP_HASHTABLE = Cvoid

struct SCIP_MultiHash
end

const SCIP_MULTIHASH = Cvoid

struct SCIP_MultiHashList
end

const SCIP_MULTIHASHLIST = Cvoid

struct SCIP_HashMapEntry
end

const SCIP_HASHMAPENTRY = Cvoid

struct SCIP_HashMap
end

const SCIP_HASHMAP = Cvoid

struct SCIP_HashSet
end

const SCIP_HASHSET = Cvoid

struct SCIP_RealArray
end

const SCIP_REALARRAY = Cvoid

struct SCIP_IntArray
end

const SCIP_INTARRAY = Cvoid

struct SCIP_BoolArray
end

const SCIP_BOOLARRAY = Cvoid

struct SCIP_PtrArray
end

const SCIP_PTRARRAY = Cvoid

struct SCIP_RandNumGen
end

const SCIP_RANDNUMGEN = Cvoid

struct SCIP_ResourceActivity
end

const SCIP_RESOURCEACTIVITY = Cvoid

struct SCIP_Profile
end

const SCIP_PROFILE = Cvoid

struct SCIP_Digraph
end

const SCIP_DIGRAPH = Cvoid

struct SCIP_Bt
end

const SCIP_BT = Cvoid

struct SCIP_BtNode
end

const SCIP_BTNODE = Cvoid

struct SCIP_Regression
end

const SCIP_REGRESSION = Cvoid

struct SCIP_DisjointSet
end

const SCIP_DISJOINTSET = Cvoid
const SCIP_PRESOLTIMING_NONE = UInt32(0x0002)
const SCIP_PRESOLTIMING_FAST = UInt32(0x0004)
const SCIP_PRESOLTIMING_MEDIUM = UInt32(0x0008)
const SCIP_PRESOLTIMING_EXHAUSTIVE = UInt32(0x0010)
const SCIP_PRESOLTIMING_FINAL = UInt32(0x0020)

# Skipping MacroDefinition: SCIP_PRESOLTIMING_ALWAYS ( SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM | SCIP_PRESOLTIMING_EXHAUSTIVE ) #
# Skipping MacroDefinition: SCIP_PRESOLTIMING_MAX ( SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM | SCIP_PRESOLTIMING_EXHAUSTIVE | SCIP_PRESOLTIMING_FINAL ) typedef

const SCIP_PROPTIMING_BEFORELP = UInt32(0x0001)
const SCIP_PROPTIMING_DURINGLPLOOP = UInt32(0x0002)
const SCIP_PROPTIMING_AFTERLPLOOP = UInt32(0x0004)
const SCIP_PROPTIMING_AFTERLPNODE = UInt32(0x0008)

# Skipping MacroDefinition: SCIP_PROPTIMING_ALWAYS ( SCIP_PROPTIMING_BEFORELP | SCIP_PROPTIMING_DURINGLPLOOP | SCIP_PROPTIMING_AFTERLPLOOP | SCIP_PROPTIMING_AFTERLPNODE ) typedef

const SCIP_HEURTIMING_BEFORENODE = UInt32(0x0001)
const SCIP_HEURTIMING_DURINGLPLOOP = UInt32(0x0002)
const SCIP_HEURTIMING_AFTERLPLOOP = UInt32(0x0004)
const SCIP_HEURTIMING_AFTERLPNODE = UInt32(0x0008)
const SCIP_HEURTIMING_AFTERPSEUDONODE = UInt32(0x0010)
const SCIP_HEURTIMING_AFTERLPPLUNGE = UInt32(0x0020)
const SCIP_HEURTIMING_AFTERPSEUDOPLUNGE = UInt32(0x0040)
const SCIP_HEURTIMING_DURINGPRICINGLOOP = UInt32(0x0080)
const SCIP_HEURTIMING_BEFOREPRESOL = UInt32(0x0100)
const SCIP_HEURTIMING_DURINGPRESOLLOOP = UInt32(0x0200)
const SCIP_HEURTIMING_AFTERPROPLOOP = UInt32(0x0400)

# Skipping MacroDefinition: SCIP_HEURTIMING_AFTERNODE ( SCIP_HEURTIMING_AFTERLPNODE | SCIP_HEURTIMING_AFTERPSEUDONODE ) /** call heuristic after the processing of the last node in the current plunge was finished */
# Skipping MacroDefinition: SCIP_HEURTIMING_AFTERPLUNGE ( SCIP_HEURTIMING_AFTERLPPLUNGE | SCIP_HEURTIMING_AFTERPSEUDOPLUNGE ) typedef

const SCIP_PRESOLTIMING = UInt32
const SCIP_PROPTIMING = UInt32
const SCIP_HEURTIMING = UInt32

# Skipping MacroDefinition: SCIP_DECL_PARAMCHGD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PARAM * param ) #

# begin enum SCIP_ParamType
const SCIP_ParamType = UInt32
const SCIP_PARAMTYPE_BOOL = 0 |> UInt32
const SCIP_PARAMTYPE_INT = 1 |> UInt32
const SCIP_PARAMTYPE_LONGINT = 2 |> UInt32
const SCIP_PARAMTYPE_REAL = 3 |> UInt32
const SCIP_PARAMTYPE_CHAR = 4 |> UInt32
const SCIP_PARAMTYPE_STRING = 5 |> UInt32
# end enum SCIP_ParamType

const SCIP_PARAMTYPE = SCIP_ParamType

# begin enum SCIP_ParamSetting
const SCIP_ParamSetting = UInt32
const SCIP_PARAMSETTING_DEFAULT = 0 |> UInt32
const SCIP_PARAMSETTING_AGGRESSIVE = 1 |> UInt32
const SCIP_PARAMSETTING_FAST = 2 |> UInt32
const SCIP_PARAMSETTING_OFF = 3 |> UInt32
# end enum SCIP_ParamSetting

const SCIP_PARAMSETTING = SCIP_ParamSetting

# begin enum SCIP_ParamEmphasis
const SCIP_ParamEmphasis = UInt32
const SCIP_PARAMEMPHASIS_DEFAULT = 0 |> UInt32
const SCIP_PARAMEMPHASIS_CPSOLVER = 1 |> UInt32
const SCIP_PARAMEMPHASIS_EASYCIP = 2 |> UInt32
const SCIP_PARAMEMPHASIS_FEASIBILITY = 3 |> UInt32
const SCIP_PARAMEMPHASIS_HARDLP = 4 |> UInt32
const SCIP_PARAMEMPHASIS_OPTIMALITY = 5 |> UInt32
const SCIP_PARAMEMPHASIS_COUNTER = 6 |> UInt32
const SCIP_PARAMEMPHASIS_PHASEFEAS = 7 |> UInt32
const SCIP_PARAMEMPHASIS_PHASEIMPROVE = 8 |> UInt32
const SCIP_PARAMEMPHASIS_PHASEPROOF = 9 |> UInt32
# end enum SCIP_ParamEmphasis

const SCIP_PARAMEMPHASIS = SCIP_ParamEmphasis

struct SCIP_Param
end

const SCIP_PARAM = Cvoid

struct SCIP_ParamData
end

const SCIP_PARAMDATA = Cvoid

struct SCIP_ParamSet
end

const SCIP_PARAMSET = Cvoid

# Skipping MacroDefinition: SCIP_EVENTTYPE_DISABLED UINT64_C ( 0x00000000 ) /**< the event was disabled and has no effect any longer */
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARADDED UINT64_C ( 0x00000001 ) /**< a variable has been added to the transformed problem */
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARDELETED UINT64_C ( 0x00000002 ) /**< a variable will be deleted from the transformed problem */
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARFIXED UINT64_C ( 0x00000004 ) /**< a variable has been fixed, aggregated, or multi-aggregated */
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARUNLOCKED UINT64_C ( 0x00000008 ) /**< the number of rounding locks of a variable was reduced to zero or one */
# Skipping MacroDefinition: SCIP_EVENTTYPE_OBJCHANGED UINT64_C ( 0x00000010 ) /**< the objective value of a variable has been changed */
# Skipping MacroDefinition: SCIP_EVENTTYPE_GLBCHANGED UINT64_C ( 0x00000020 ) /**< the global lower bound of a variable has been changed */
# Skipping MacroDefinition: SCIP_EVENTTYPE_GUBCHANGED UINT64_C ( 0x00000040 ) /**< the global upper bound of a variable has been changed */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LBTIGHTENED UINT64_C ( 0x00000080 ) /**< the local lower bound of a variable has been increased */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LBRELAXED UINT64_C ( 0x00000100 ) /**< the local lower bound of a variable has been decreased */
# Skipping MacroDefinition: SCIP_EVENTTYPE_UBTIGHTENED UINT64_C ( 0x00000200 ) /**< the local upper bound of a variable has been decreased */
# Skipping MacroDefinition: SCIP_EVENTTYPE_UBRELAXED UINT64_C ( 0x00000400 ) /**< the local upper bound of a variable has been increased */
# Skipping MacroDefinition: SCIP_EVENTTYPE_GHOLEADDED UINT64_C ( 0x00000800 ) /**< a global hole has been added to the hole list of a variable's domain */
# Skipping MacroDefinition: SCIP_EVENTTYPE_GHOLEREMOVED UINT64_C ( 0x00001000 ) /**< a global hole has been removed from the hole list of a variable's domain */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LHOLEADDED UINT64_C ( 0x00002000 ) /**< a local hole has been added to the hole list of a variable's domain */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LHOLEREMOVED UINT64_C ( 0x00004000 ) /**< a local hole has been removed from the hole list of a variable's domain */
# Skipping MacroDefinition: SCIP_EVENTTYPE_IMPLADDED UINT64_C ( 0x00008000 ) /**< the variable's implication list, variable bound or clique information was extended */
# Skipping MacroDefinition: SCIP_EVENTTYPE_PRESOLVEROUND UINT64_C ( 0x00010000 ) /**< a presolving round has been finished */
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEFOCUSED UINT64_C ( 0x00020000 ) /**< a node has been focused and is now the focus node */
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEFEASIBLE UINT64_C ( 0x00040000 ) /**< the LP/pseudo solution of the node was feasible */
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEINFEASIBLE UINT64_C ( 0x00080000 ) /**< the focus node has been proven to be infeasible or was bounded */
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEBRANCHED UINT64_C ( 0x00100000 ) /**< the focus node has been solved by branching */
# Skipping MacroDefinition: SCIP_EVENTTYPE_FIRSTLPSOLVED UINT64_C ( 0x00200000 ) /**< the node's initial LP was solved */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LPSOLVED UINT64_C ( 0x00400000 ) /**< the node's LP was completely solved with cut & price */
# Skipping MacroDefinition: SCIP_EVENTTYPE_POORSOLFOUND UINT64_C ( 0x00800000 ) /**< a good enough primal feasible (but not new best) solution was found */
# Skipping MacroDefinition: SCIP_EVENTTYPE_BESTSOLFOUND UINT64_C ( 0x01000000 ) /**< a new best primal feasible solution was found */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWADDEDSEPA UINT64_C ( 0x02000000 ) /**< a row has been added to SCIP's separation storage */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWDELETEDSEPA UINT64_C ( 0x04000000 ) /**< a row has been removed from SCIP's separation storage */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWADDEDLP UINT64_C ( 0x08000000 ) /**< a row has been added to the LP */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWDELETEDLP UINT64_C ( 0x10000000 ) /**< a row has been removed from the LP */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWCOEFCHANGED UINT64_C ( 0x20000000 ) /**< a coefficient of a row has been changed (row specific event) */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWCONSTCHANGED UINT64_C ( 0x40000000 ) /**< the constant of a row has been changed (row specific event) */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWSIDECHANGED UINT64_C ( 0x80000000 ) /**< a side of a row has been changed (row specific event) */
# Skipping MacroDefinition: SCIP_EVENTTYPE_SYNC UINT64_C ( 0x100000000 ) /**< synchronization event */
# Skipping MacroDefinition: SCIP_EVENTTYPE_GBDCHANGED ( SCIP_EVENTTYPE_GLBCHANGED | SCIP_EVENTTYPE_GUBCHANGED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_LBCHANGED ( SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_LBRELAXED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_UBCHANGED ( SCIP_EVENTTYPE_UBTIGHTENED | SCIP_EVENTTYPE_UBRELAXED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_BOUNDTIGHTENED ( SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_UBTIGHTENED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_BOUNDRELAXED ( SCIP_EVENTTYPE_LBRELAXED | SCIP_EVENTTYPE_UBRELAXED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_BOUNDCHANGED ( SCIP_EVENTTYPE_LBCHANGED | SCIP_EVENTTYPE_UBCHANGED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_GHOLECHANGED ( SCIP_EVENTTYPE_GHOLEADDED | SCIP_EVENTTYPE_GHOLEREMOVED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_LHOLECHANGED ( SCIP_EVENTTYPE_LHOLEADDED | SCIP_EVENTTYPE_LHOLEREMOVED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_HOLECHANGED ( SCIP_EVENTTYPE_GHOLECHANGED | SCIP_EVENTTYPE_LHOLECHANGED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_DOMCHANGED ( SCIP_EVENTTYPE_BOUNDCHANGED | SCIP_EVENTTYPE_HOLECHANGED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARCHANGED ( SCIP_EVENTTYPE_VARFIXED | SCIP_EVENTTYPE_VARUNLOCKED | SCIP_EVENTTYPE_OBJCHANGED | SCIP_EVENTTYPE_GBDCHANGED | SCIP_EVENTTYPE_DOMCHANGED | SCIP_EVENTTYPE_IMPLADDED | SCIP_EVENTTYPE_VARDELETED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_VAREVENT ( SCIP_EVENTTYPE_VARADDED | SCIP_EVENTTYPE_VARCHANGED ) /* event masks for node events */
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODESOLVED ( SCIP_EVENTTYPE_NODEFEASIBLE | SCIP_EVENTTYPE_NODEINFEASIBLE | SCIP_EVENTTYPE_NODEBRANCHED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEEVENT ( SCIP_EVENTTYPE_NODEFOCUSED | SCIP_EVENTTYPE_NODESOLVED ) /* event masks for LP events */
# Skipping MacroDefinition: SCIP_EVENTTYPE_LPEVENT ( SCIP_EVENTTYPE_FIRSTLPSOLVED | SCIP_EVENTTYPE_LPSOLVED ) /* event masks for primal solution events */
# Skipping MacroDefinition: SCIP_EVENTTYPE_SOLFOUND ( SCIP_EVENTTYPE_POORSOLFOUND | SCIP_EVENTTYPE_BESTSOLFOUND ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_SOLEVENT ( SCIP_EVENTTYPE_SOLFOUND ) /* event masks for row events */
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWCHANGED ( SCIP_EVENTTYPE_ROWCOEFCHANGED | SCIP_EVENTTYPE_ROWCONSTCHANGED | SCIP_EVENTTYPE_ROWSIDECHANGED ) #
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWEVENT ( SCIP_EVENTTYPE_ROWADDEDSEPA | SCIP_EVENTTYPE_ROWDELETEDSEPA | SCIP_EVENTTYPE_ROWADDEDLP | SCIP_EVENTTYPE_ROWDELETEDLP | SCIP_EVENTTYPE_ROWCHANGED ) typedef

const SCIP_EVENTTYPE_FORMAT = PRIx64

# Skipping MacroDefinition: SCIP_DECL_EVENTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** destructor of event handler to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** initialization method of event handler (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** deinitialization method of event handler (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** solving process initialization method of event handler (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The event handler may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** solving process deinitialization method of event handler (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The event handler should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr ) /** frees specific event data
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# *  - eventdata       : pointer to the event data to free
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTDELETE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr , SCIP_EVENTDATA * * eventdata ) /** execution method of event handler
# *
# *  Processes the event. The method is called every time an event occurs, for which the event handler
# *  is responsible. Event handlers may declare themselves responsible for events by calling the
# *  corresponding SCIPcatch...() method. This method creates an event filter object to point to the
# *  given event handler and event data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - eventhdlr       : the event handler itself
# *  - event           : event to process
# *  - eventdata       : user data for the event
# */
# Skipping MacroDefinition: SCIP_DECL_EVENTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr , SCIP_EVENT * event , SCIP_EVENTDATA * eventdata ) #

const SCIP_EVENTTYPE = UInt64

struct SCIP_Eventhdlr
end

const SCIP_EVENTHDLR = Cvoid

struct SCIP_EventhdlrData
end

const SCIP_EVENTHDLRDATA = Cvoid

struct SCIP_Event
end

const SCIP_EVENT = Cvoid

struct SCIP_EventVarAdded
end

const SCIP_EVENTVARADDED = Cvoid

struct SCIP_EventVarDeleted
end

const SCIP_EVENTVARDELETED = Cvoid

struct SCIP_EventVarFixed
end

const SCIP_EVENTVARFIXED = Cvoid

struct SCIP_EventVarUnlocked
end

const SCIP_EVENTVARUNLOCKED = Cvoid

struct SCIP_EventObjChg
end

const SCIP_EVENTOBJCHG = Cvoid

struct SCIP_EventBdChg
end

const SCIP_EVENTBDCHG = Cvoid

struct SCIP_EventHole
end

const SCIP_EVENTHOLE = Cvoid

struct SCIP_EventImplAdd
end

const SCIP_EVENTIMPLADD = Cvoid

struct SCIP_EventRowAddedSepa
end

const SCIP_EVENTROWADDEDSEPA = Cvoid

struct SCIP_EventRowDeletedSepa
end

const SCIP_EVENTROWDELETEDSEPA = Cvoid

struct SCIP_EventRowAddedLP
end

const SCIP_EVENTROWADDEDLP = Cvoid

struct SCIP_EventRowDeletedLP
end

const SCIP_EVENTROWDELETEDLP = Cvoid

struct SCIP_EventRowCoefChanged
end

const SCIP_EVENTROWCOEFCHANGED = Cvoid

struct SCIP_EventRowConstChanged
end

const SCIP_EVENTROWCONSTCHANGED = Cvoid

struct SCIP_EventRowSideChanged
end

const SCIP_EVENTROWSIDECHANGED = Cvoid

struct SCIP_EventData
end

const SCIP_EVENTDATA = Cvoid

struct SCIP_EventFilter
end

const SCIP_EVENTFILTER = Cvoid

struct SCIP_EventQueue
end

const SCIP_EVENTQUEUE = Cvoid

# begin enum SCIP_LPSolStat
const SCIP_LPSolStat = UInt32
const SCIP_LPSOLSTAT_NOTSOLVED = 0 |> UInt32
const SCIP_LPSOLSTAT_OPTIMAL = 1 |> UInt32
const SCIP_LPSOLSTAT_INFEASIBLE = 2 |> UInt32
const SCIP_LPSOLSTAT_UNBOUNDEDRAY = 3 |> UInt32
const SCIP_LPSOLSTAT_OBJLIMIT = 4 |> UInt32
const SCIP_LPSOLSTAT_ITERLIMIT = 5 |> UInt32
const SCIP_LPSOLSTAT_TIMELIMIT = 6 |> UInt32
const SCIP_LPSOLSTAT_ERROR = 7 |> UInt32
# end enum SCIP_LPSolStat

const SCIP_LPSOLSTAT = SCIP_LPSolStat

# begin enum SCIP_BoundType
const SCIP_BoundType = UInt32
const SCIP_BOUNDTYPE_LOWER = 0 |> UInt32
const SCIP_BOUNDTYPE_UPPER = 1 |> UInt32
# end enum SCIP_BoundType

const SCIP_BOUNDTYPE = SCIP_BoundType

# begin enum SCIP_SideType
const SCIP_SideType = UInt32
const SCIP_SIDETYPE_LEFT = 0 |> UInt32
const SCIP_SIDETYPE_RIGHT = 1 |> UInt32
# end enum SCIP_SideType

const SCIP_SIDETYPE = SCIP_SideType

# begin enum SCIP_RowOriginType
const SCIP_RowOriginType = UInt32
const SCIP_ROWORIGINTYPE_UNSPEC = 0 |> UInt32
const SCIP_ROWORIGINTYPE_CONS = 1 |> UInt32
const SCIP_ROWORIGINTYPE_SEPA = 2 |> UInt32
const SCIP_ROWORIGINTYPE_REOPT = 3 |> UInt32
# end enum SCIP_RowOriginType

const SCIP_ROWORIGINTYPE = SCIP_RowOriginType

# begin enum SCIP_LPAlgo
const SCIP_LPAlgo = UInt32
const SCIP_LPALGO_PRIMALSIMPLEX = 0 |> UInt32
const SCIP_LPALGO_DUALSIMPLEX = 1 |> UInt32
const SCIP_LPALGO_BARRIER = 2 |> UInt32
const SCIP_LPALGO_BARRIERCROSSOVER = 3 |> UInt32
# end enum SCIP_LPAlgo

const SCIP_LPALGO = SCIP_LPAlgo

struct SCIP_ColSolVals
end

const SCIP_COLSOLVALS = Cvoid

struct SCIP_RowSolVals
end

const SCIP_ROWSOLVALS = Cvoid

struct SCIP_LpSolVals
end

const SCIP_LPSOLVALS = Cvoid

struct SCIP_Col
end

const SCIP_COL = Cvoid

struct SCIP_Row
end

const SCIP_ROW = Cvoid

struct SCIP_Lp
end

const SCIP_LP = Cvoid

struct SCIP_NlRow
end

const SCIP_NLROW = Cvoid

struct SCIP_Nlp
end

const SCIP_NLP = Cvoid

# Skipping MacroDefinition: SCIP_DECL_PROBDELORIG ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * * probdata ) /** creates user data of transformed problem by transforming the original user problem data
# *  (called after problem was transformed)
# *
# *  Because the original problem and the user data of the original problem should not be
# *  modified during the solving process, a transformed problem is created as a copy of
# *  the original problem. If the user problem data is never modified during the solving
# *  process anyways, it is enough to simple copy the user data's pointer. This is the
# *  default implementation, which is used when a NULL is given as PROBTRANS method.
# *  If the user data may be modified during the solving process (e.g. during preprocessing),
# *  the PROBTRANS method must be given and has to copy the user problem data to a different
# *  memory location.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sourcedata      : source problem data to transform
# *  - targetdata      : pointer to store created transformed problem data
# */
# Skipping MacroDefinition: SCIP_DECL_PROBTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * sourcedata , SCIP_PROBDATA * * targetdata ) /** frees user data of transformed problem (called when the transformed problem is freed)
# *
# *  This method has to be implemented, if the PROBTRANS method is not a simple pointer
# *  copy operation like in the default PROBTRANS implementation. It should free the
# *  user data of the transformed problem, that was created in the PROBTRANS method.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - probdata        : pointer to the user problem data to free
# */
# Skipping MacroDefinition: SCIP_DECL_PROBDELTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * * probdata ) /** solving process initialization method of transformed data (called before the branch and bound process begins)
# *
# *  This method is called before the branch and bound process begins and can be used to initialize user problem
# *  data that depends for example on the number of active problem variables, because these are now fixed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - probdata        : user problem data
# */
# Skipping MacroDefinition: SCIP_DECL_PROBINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * probdata ) /** solving process deinitialization method of transformed data (called before the branch and bound data is freed)
# *
# *  This method is called before the branch and bound data is freed and should be used to free all data that
# *  was allocated in the solving process initialization method. The user has to make sure, that all LP rows associated
# *  to the transformed user problem data are released.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - probdata        : user problem data
# *  - restart         : was this exit solve call triggered by a restart?
# */
# Skipping MacroDefinition: SCIP_DECL_PROBEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * probdata , SCIP_Bool restart ) /** copies user data of source SCIP for the target SCIP
# *
# *  This method should copy the problem data of the source SCIP and create a target problem data for (target)
# *  SCIP. Implementing this callback is optional. If the copying process was successful the target SCIP gets this
# *  problem data assigned. In case the result pointer is set to SCIP_DIDNOTRUN the target SCIP will have no problem data
# *  at all.
# *
# *  The variable map and the constraint map can be used via the function SCIPgetVarCopy() and SCIPgetConsCopy(),
# *  respectively, to get for certain variables and constraints of the source SCIP the counter parts in the target
# *  SCIP. You should be very carefully in using these two methods since they could lead to an infinite loop due to
# *  recursion.
# *
# *  input:
# *  - scip            : target SCIP data structure
# *  - sourcescip      : source SCIP main data structure
# *  - sourcedata      : source user problem data
# *  - varmap,         : a hashmap which stores the mapping of source variables to corresponding target variables
# *  - consmap,        : a hashmap which stores the mapping of source constraints to corresponding target constraints
# *  - targetdata      : pointer to the target user problem data to create
# *  - global          : create a global or a local copy? 
# *
# *  output:
# *  - result          : pointer to store the result of the call
# *
# *  possible return values for *result:
# *  - SCIP_DIDNOTRUN  : the copying process was not performed 
# *  - SCIP_SUCCESS    : the copying process was successfully performed
# */
# Skipping MacroDefinition: SCIP_DECL_PROBCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP * sourcescip , SCIP_PROBDATA * sourcedata , SCIP_HASHMAP * varmap , SCIP_HASHMAP * consmap , SCIP_PROBDATA * * targetdata , SCIP_Bool global , SCIP_RESULT * result ) #

# begin enum SCIP_Objsense
const SCIP_Objsense = Cint
const SCIP_OBJSENSE_MAXIMIZE = -1 |> Int32
const SCIP_OBJSENSE_MINIMIZE = 1 |> Int32
# end enum SCIP_Objsense

const SCIP_OBJSENSE = SCIP_Objsense

struct SCIP_Prob
end

const SCIP_PROB = Cvoid

struct SCIP_ProbData
end

const SCIP_PROBDATA = Cvoid

# begin enum SCIP_NodeType
const SCIP_NodeType = UInt32
const SCIP_NODETYPE_FOCUSNODE = 0 |> UInt32
const SCIP_NODETYPE_PROBINGNODE = 1 |> UInt32
const SCIP_NODETYPE_SIBLING = 2 |> UInt32
const SCIP_NODETYPE_CHILD = 3 |> UInt32
const SCIP_NODETYPE_LEAF = 4 |> UInt32
const SCIP_NODETYPE_DEADEND = 5 |> UInt32
const SCIP_NODETYPE_JUNCTION = 6 |> UInt32
const SCIP_NODETYPE_PSEUDOFORK = 7 |> UInt32
const SCIP_NODETYPE_FORK = 8 |> UInt32
const SCIP_NODETYPE_SUBROOT = 9 |> UInt32
const SCIP_NODETYPE_REFOCUSNODE = 10 |> UInt32
# end enum SCIP_NodeType

const SCIP_NODETYPE = SCIP_NodeType

struct SCIP_Probingnode
end

const SCIP_PROBINGNODE = Cvoid

struct SCIP_Sibling
end

const SCIP_SIBLING = Cvoid

struct SCIP_Child
end

const SCIP_CHILD = Cvoid

struct SCIP_Leaf
end

const SCIP_LEAF = Cvoid

struct SCIP_Junction
end

const SCIP_JUNCTION = Cvoid

struct SCIP_Pseudofork
end

const SCIP_PSEUDOFORK = Cvoid

struct SCIP_Fork
end

const SCIP_FORK = Cvoid

struct SCIP_Subroot
end

const SCIP_SUBROOT = Cvoid

struct SCIP_Node
end

const SCIP_NODE = Cvoid

struct SCIP_PendingBdchg
end

const SCIP_PENDINGBDCHG = Cvoid

struct SCIP_Tree
end

const SCIP_TREE = Cvoid

struct Scip
end

const SCIP = Cvoid

# Skipping MacroDefinition: SCIPallocMemory ( scip , ptr ) ( ( BMSallocMemory ( ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocMemoryArray ( scip , ptr , num ) ( ( BMSallocMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearMemoryArray ( scip , ptr , num ) ( ( BMSallocClearMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocMemorySize ( scip , ptr , size ) ( ( BMSallocMemorySize ( ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocMemoryArray ( scip , ptr , newnum ) ( ( BMSreallocMemoryArray ( ( ptr ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocMemorySize ( scip , ptr , newsize ) ( ( BMSreallocMemorySize ( ( ptr ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateMemory ( scip , ptr , source ) ( ( BMSduplicateMemory ( ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateMemoryArray ( ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeMemory ( scip , ptr ) BMSfreeMemory ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryNull ( scip , ptr ) BMSfreeMemoryNull ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryArray ( scip , ptr ) BMSfreeMemoryArray ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryArrayNull ( scip , ptr ) BMSfreeMemoryArrayNull ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemorySize ( scip , ptr ) BMSfreeMemorySize ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemorySizeNull ( scip , ptr ) BMSfreeMemorySizeNull ( ptr ) /* Block Memory Management Macros
# *
# */
# Skipping MacroDefinition: SCIPallocBlockMemory ( scip , ptr ) ( ( BMSallocBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBlockMemorySize ( scip , ptr , size ) ( ( BMSallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocClearBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBlockMemoryArray ( scip , ptr , oldnum , newnum ) ( ( BMSreallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( oldnum ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBlockMemorySize ( scip , ptr , oldsize , newsize ) ( ( BMSreallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( oldsize ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBlockMemory ( scip , ptr , source ) ( ( BMSduplicateBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBlockMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPensureBlockMemoryArray ( scip , ptr , arraysizeptr , minsize ) ( ( SCIPensureBlockMemoryArray_call ( ( scip ) , ( void * * ) ( ptr ) , sizeof ( * * ( ptr ) ) , ( arraysizeptr ) , ( minsize ) ) ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemory ( scip , ptr ) BMSfreeBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryNull ( scip , ptr ) BMSfreeBlockMemoryNull ( SCIPblkmem ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryArray ( scip , ptr , num ) BMSfreeBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryArrayNull ( scip , ptr , num ) BMSfreeBlockMemoryArrayNull ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemorySize ( scip , ptr , size ) BMSfreeBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemorySizeNull ( scip , ptr , size ) BMSfreeBlockMemorySizeNull ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) /* Buffer Memory Management Macros
# *
# *
# */
# Skipping MacroDefinition: SCIPallocBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearBufferArray ( scip , ptr , num ) ( ( BMSallocClearBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBufferArray ( scip , ptr , num ) ( ( BMSreallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBuffer ( scip , ptr , source ) ( ( BMSduplicateBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( size_t ) sizeof ( * * ( ptr ) ) ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBufferArray ( scip , ptr , source , num ) ( ( BMSduplicateBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPallocCleanBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPcleanbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocCleanBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeCleanBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPcleanbuffer ( scip ) , ( ptr ) ) /* Memory Management Functions
# *
# *
# */
# Skipping MacroDefinition: SCIPdebugMsg ( scip , ... ) while ( FALSE ) SCIPprintDebugMessage ( scip , __FILE__ , __LINE__ , __VA_ARGS__ ) #
# Skipping MacroDefinition: SCIPdebugMsgPrint ( scip , ... ) while ( FALSE ) SCIPdebugMessagePrint ( scip , __VA_ARGS__ ) #
