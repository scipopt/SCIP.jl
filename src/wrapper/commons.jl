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

# Skipping MacroDefinition: SCIP_DECL_BANDITFREE ( x ) SCIP_RETCODE x ( BMS_BLKMEM * blkmem , SCIP_BANDIT * bandit \
#) /** selection callback for bandit selector */
# Skipping MacroDefinition: SCIP_DECL_BANDITSELECT ( x ) SCIP_RETCODE x ( SCIP_BANDIT * bandit , int * selection \
#) /** update callback for bandit algorithms */
# Skipping MacroDefinition: SCIP_DECL_BANDITUPDATE ( x ) SCIP_RETCODE x ( SCIP_BANDIT * bandit , int selection , SCIP_Real score \
#) /** reset callback for bandit algorithms */
# Skipping MacroDefinition: SCIP_DECL_BANDITRESET ( x ) SCIP_RETCODE x ( BMS_BUFMEM * bufmem , SCIP_BANDIT * bandit , SCIP_Real * priorities \
#) #

struct SCIP_Bandit
end

const SCIP_BANDIT = Cvoid

struct SCIP_BanditVTable
end

const SCIP_BANDITVTABLE = Cvoid

struct SCIP_BanditData
end

const SCIP_BANDITDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_BENDERSCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** destructor of Benders' decomposition to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** initialization method of Benders' decomposition (called after problem was transformed and the Benders' decomposition
# * is active)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** deinitialization method of Benders' decomposition (called before transformed problem is freed and the Benders'
# * decomposition is active)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** presolving initialization method of the Benders' decomposition (called when presolving is about to begin)
# *
# *  This function is called immediately after the auxiliary variables are created in the master problem. The callback
# *  provides the user an opportunity to add variable data to the auxiliary variables.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** presolving deinitialization method of the Benders' decomposition (called after presolving has been finished)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** solving process initialization method of Benders' decomposition (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The Benders' decomposition may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** solving process deinitialization method of Benders' decomposition (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The Benders' decomposition should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition itself
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders ) /** the method for creating the Benders' decomposition subproblem. This method is called during the initialisation stage
# *  (after the master problem was transformed).
# *
# *  @note When the create subproblem callback is invoked, the mapping between the  master problem and subproblem
# *  variables must be available. The create subproblem callback is invoked immediately after BENDERSINIT. So, it is
# *  possible to construct the variable mapping within the BENDERSINIT callback.
# *
# *  This method must register the SCIP instance for the subproblem with the Benders' decomposition core by calling
# *  SCIPaddBendersSubproblem. Typically, the user must create the SCIP instances for the subproblems. These can be
# *  created within a reader or probdata and then registered with the Benders' decomposition core during the call of this
# *  callback. If there are any settings required for solving the subproblems, then they should be set here. However,
# *  some settings will be overridden by the standard solving method included in the Benders' decomposition framework.
# *  If a special solving method is desired, the user can implement the bendersSolvesubXyz callback.
# *
# *  If the user defines a subproblem solving method, then in BENDERSCREATESUB, the user must specify whether the
# *  subproblem is convex. This is necessary because the dual solutions from convex problems can be used to generate cuts.
# *  The classical Benders' optimality and feasibility cuts require that the subproblems are convex. If the subproblem is
# *  convex, then the user must call SCIPbendersSetSubproblemIsConvex()
# *
# *  If the user does NOT implement a subproblem solving method, then the convexity of the problem is determined
# *  internally.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - probnumber      : the subproblem problem number
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCREATESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , int probnumber ) /** called before the subproblem solving loop for Benders' decomposition. The pre subproblem solve function gives the
# *  user an oppportunity to perform any global set up for the Benders' decomposition.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - sol             : the solution that will be checked in the subproblem. Can be NULL.
# *  - type            : the enforcement type that called the Benders' decomposition solve.
# *  - checkint        : should the integer subproblems be checked.
# *  - skipsolve       : flag to return whether the current subproblem solving loop should be skipped
# *  - result          : a result to be returned to the Benders' constraint handler if the solve is skipped. If the
# *                      solve is not skipped, then the returned result is ignored.
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_DIDNOTRUN  : the subproblem was not solved in this iteration. Other decompositions will be checked.
# *  - SCIP_CONSADDED  : a constraint has been added to the master problem. No other decompositions will be checked.
# *  - SCIP_SEPARATED  : a cut has been added to the master problem. No other decompositions will be checked.
# *  - SCIP_FEASIBLE   : feasibility of the solution is reported to SCIP. Other decompositions will be checked.
# *  - SCIP_INFEASIBLE : infeasibility of the solution is reported to SCIP. No other decompositions will be checked.
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSPRESUBSOLVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , SCIP_BENDERSENFOTYPE type , SCIP_Bool checkint , SCIP_Bool * skipsolve , SCIP_RESULT * result ) /** the solving method for a convex Benders' decomposition subproblem. This call back is provided to solve problems
# *  for which the dual soluitons are used to generate Benders' decomposition cuts. In the classical Benders'
# *  decomposition implementation, this would be an LP. However, it can be any convex problem where the dual solutions
# *  are given by a single vector of reals.
# *
# *  In the Benders' decomposition subproblem solving process, there are two solving loops. The first is where the convex
# *  subproblems, and the convex relaxations of subproblems, are solved. If no cuts are generated after this solving
# *  loop, then the second loop solves subproblems defined as CIPs. This callback is executed during the FIRST solving
# *  loop only.
# *
# *  In the classical Benders' decomposition implementation, if the subproblems are all LPs the only the
# *  BENDERSSOLVESUBCONVEX need to be implemented. If the subproblems are MIPs, then it is useful to only implement a
# *  single SCIP instance for the subproblem and then change the variable types of the appropriate variables to
# *  CONTINUOUS for the CONVEX subproblem solve and to INTEGER for the CIP subproblem solve.
# *
# *  The solving methods are separated so that they can be called in parallel.
# *
# *  NOTE: The solving methods must be thread safe.
# *
# *  This method is called from within the execution method.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - sol             : the solution that will be checked in the subproblem. Can be NULL.
# *  - probnumber      : the subproblem problem number
# *  - onlyconvexcheck : flag to indicate that only the convex relaxations will be checked in this solving loop. This is
# *                      a feature of the Large Neighbourhood Benders' Search
# *  - objective       : variable to return the objective function value of the subproblem
# *  - result          : the result from solving the subproblem
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_DIDNOTRUN  : the subproblem was not solved in this iteration
# *  - SCIP_FEASIBLE   : the subproblem is solved and is feasible
# *  - SCIP_INFEASIBLE : the subproblem is solved and is infeasible
# *  - SCIP_UNBOUNDED  : the subproblem is solved and is unbounded
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSSOLVESUBCONVEX ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , int probnumber , SCIP_Bool onlyconvexcheck , SCIP_Real * objective , SCIP_RESULT * result ) /** the solving method for a Benders' decomposition subproblem as a CIP. This call back is provided to solve problems
# *  for which the dual solutions are not well defined. In this case, the cuts are typically generated from the primal
# *  solution to the CIP. In the classical Benders' decomposition implementation, this would be a MIP. However, it can
# *  be any CIP.
# *
# *  In the Benders' decomposition subproblem solving process, there are two solving loops. The first is where the convex
# *  subproblems, and the convex relaxations of subproblems, are solved. If no cuts are generated after this solving
# *  loop, then the second loop solves subproblems defined as CIPs. This callback is executed during the SECOND solving
# *  loop only.
# *
# *  The solving methods are separated so that they can be called in parallel.
# *
# *  NOTE: The solving methods must be thread safe.
# *
# *  This method is called from within the execution method.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - sol             : the solution that will be checked in the subproblem. Can be NULL.
# *  - probnumber      : the subproblem problem number
# *  - objective       : variable to return the objective function value of the subproblem
# *  - result          : the result from solving the subproblem
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_DIDNOTRUN  : the subproblem was not solved in this iteration
# *  - SCIP_FEASIBLE   : the subproblem is solved and is feasible
# *  - SCIP_INFEASIBLE : the subproblem is solved and is infeasible
# *  - SCIP_UNBOUNDED  : the subproblem is solved and is unbounded
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSSOLVESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , int probnumber , SCIP_Real * objective , SCIP_RESULT * result ) /** the post-solve method for Benders' decomposition. The post-solve method is called after the subproblems have
# * been solved but before they have been freed. After the solving of the Benders' decomposition subproblems, the
# * subproblem solving data is freed in the SCIP_DECL_BENDERSFREESUB callback. However, it is not necessary to implement
# * SCIP_DECL_BENDERSFREESUB.
# *
# * If SCIP_DECL_BENDERSFREESUB is not implemented, then the Benders' decomposition framework will perform a default
# * freeing of the subproblems. If a subproblem is an LP, then they will be in probing mode for the subproblem
# * solve. So the freeing process involves ending the probing mode. If the subproblem is a MIP, then the subproblem is
# * solved by calling SCIPsolve. As such, the transformed problem must be freed after each subproblem solve.
# *
# * This callback provides the opportunity for the user to clean up any data structures that should not exist beyond the current
# * iteration.
# * The user has full access to the master and subproblems in this callback. So it is possible to construct solution for
# * the master problem in the method.
# * Additionally, if there are any subproblems that are infeasibility and this can not be resolved, then the it is
# * possible to merge these subproblems into the master problem. The subproblem indices are given in the mergecands
# * array. The merging can be perform by a user defined function or by calling SCIPmergeBendersSubproblemIntoMaster. If a
# * subproblem was merged into the master problem, then the merged flag must be set to TRUE.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - sol             : the solution that was checked by solving the subproblems. Can be NULL.
# *  - type            : the enforcement type that called the Benders' decomposition solve.
# *  - mergecands      : the subproblems that are candidates for merging into the master problem, the first
# *                      npriomergecands are the priority candidates (they should be merged). The remaining
# *                      (nmergecands - npriomergecands) are subproblems that could be merged if desired.
# *  - npriomergecands : the number of priority merge candidates.
# *  - nmergecands     : the total number of subproblems that are candidates for merging into the master problem
# *  - checkint        : should the integer subproblems be checked.
# *  - infeasible      : indicates whether at least one subproblem is infeasible
# *  - merged          : flag to indicate whether a subproblem was merged into the master problem.
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSPOSTSOLVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , SCIP_BENDERSENFOTYPE type , int * mergecands , int npriomergecands , int nmergecands , SCIP_Bool checkint , SCIP_Bool infeasible , SCIP_Bool * merged ) /** frees the subproblem so that it can be resolved in the next iteration. As stated above, it is not necessary to
# *  implement this callback. If the callback is implemented, the subproblems should be freed by calling
# *  SCIPfreeTransform(). However, if the subproblems are LPs, then it could be more efficient to put the subproblem
# *  into probing mode prior to solving and then exiting the probing mode during the callback. To put the subproblem into
# *  probing mode, the subproblem must be in SCIP_STAGE_SOLVING. This can be achieved by using eventhandlers.
# *
# *  If SCIP_DECL_BENDERSFREESUB is not implemented, then the Benders' decomposition framework will perform a default
# *  freeing of the subproblems. If a subproblem is an LP, then they will be in probing mode for the subproblem
# *  solve. So the freeing process involves ending the probing mode. If the subproblem is a MIP, then the subproblem is
# *  solved by calling SCIPsolve. As such, the transformed problem must be freed after each subproblem solve.
# *
# *  NOTE: The freeing methods must be thread safe.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition data structure
# *  - probnumber      : the subproblem problem number
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSFREESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , int probnumber ) /** the variable mapping from the subproblem to the master problem. It is neccessary to have a mapping between every
# *  master problem variable and its counterpart in the subproblem. This mapping must go both ways: from master to sub
# *  and sub to master.
# *
# *  This method is called when generating the cuts. The cuts are generated by using the solution to the subproblem to
# *  eliminate a solution to the master problem.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition structure
# *  - var             : the variable for which the corresponding variable in the master or subproblem is required
# *  - mappedvar       : pointer to store the variable that is mapped to var
# *  - probnumber      : the number of the subproblem that the desired variable belongs to, -1 for the master problem
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSGETVAR ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_VAR * var , SCIP_VAR * * mappedvar , int probnumber ) #

# begin enum SCIP_BendersEnfoType
const SCIP_BendersEnfoType = UInt32
const SCIP_BENDERSENFOTYPE_LP = 1 |> UInt32
const SCIP_BENDERSENFOTYPE_RELAX = 2 |> UInt32
const SCIP_BENDERSENFOTYPE_PSEUDO = 3 |> UInt32
const SCIP_BENDERSENFOTYPE_CHECK = 4 |> UInt32
# end enum SCIP_BendersEnfoType

const SCIP_BENDERSENFOTYPE = SCIP_BendersEnfoType

# begin enum SCIP_BendersSolveLoop
const SCIP_BendersSolveLoop = UInt32
const SCIP_BENDERSSOLVELOOP_CONVEX = 0 |> UInt32
const SCIP_BENDERSSOLVELOOP_CIP = 1 |> UInt32
const SCIP_BENDERSSOLVELOOP_USERCONVEX = 2 |> UInt32
const SCIP_BENDERSSOLVELOOP_USERCIP = 3 |> UInt32
# end enum SCIP_BendersSolveLoop

const SCIP_BENDERSSOLVELOOP = SCIP_BendersSolveLoop

# begin enum SCIP_BendersSubStatus
const SCIP_BendersSubStatus = UInt32
const SCIP_BENDERSSUBSTATUS_UNKNOWN = 0 |> UInt32
const SCIP_BENDERSSUBSTATUS_OPTIMAL = 1 |> UInt32
const SCIP_BENDERSSUBSTATUS_AUXVIOL = 2 |> UInt32
const SCIP_BENDERSSUBSTATUS_INFEAS = 3 |> UInt32
# end enum SCIP_BendersSubStatus

const SCIP_BENDERSSUBSTATUS = SCIP_BendersSubStatus

struct SCIP_Benders
end

const SCIP_BENDERS = Cvoid

struct SCIP_BendersData
end

const SCIP_BENDERSDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_BENDERSCUT * benderscut ) /** destructor of the Benders' decomposition cut to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benderscut      : the Benders' decomposition cut structure
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut ) /** initialization method of the Benders' decomposition cut (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benderscut      : the Benders' decomposition cut structure
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut ) /** deinitialization method of the Benders' decomposition cut (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benderscut      : the Benders' decomposition cut structure
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut ) /** solving process initialization method of the Benders' decomposition cut (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benderscut      : the Benders' decomposition cut structure
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut ) /** solving process deinitialization method of the Benders' decomposition cut (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The Benders' decomposition cut should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benderscut      : the Benders' decomposition cut structure
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut ) /** execution method of the Benders' decomposition cut technique
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - benders         : the Benders' decomposition structure
# *  - benderscut      : the Benders' cut structure
# *  - sol             : the solution that was used for setting up the subproblems
# *  - probnumber      : the number of the subproblem from which the cut is generated
# *  - type            : the enforcement type that called the subproblem solve
# *  - result          : pointer to store the result of the cut algorithm
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_DIDNOTRUN  : if the Benders' cut was not run.
# *  - SCIP_DIDNOTFIND : if the Benders' cut was run, but there was an error in generating the cut.
# *  - SCIP_FEASIBLE   : if the Benders' decomposition cut algorithm has not generated a constraint or cut.
# *  - SCIP_CONSADDED  : an additional constraint for the Benders' decomposition cut was generated
# *  - SCIP_SEPARATED  : a cutting plane representing the Benders' decomposition cut was generated
# */
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_BENDERSCUT * benderscut , SCIP_SOL * sol , int probnumber , SCIP_BENDERSENFOTYPE type , SCIP_RESULT * result ) #

struct SCIP_Benderscut
end

const SCIP_BENDERSCUT = Cvoid

struct SCIP_BenderscutData
end

const SCIP_BENDERSCUTDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_BRANCHCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** destructor of branching method to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** initialization method of branching rule (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** deinitialization method of branching rule (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** solving process initialization method of branching rule (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The branching rule may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** solving process deinitialization method of branching rule (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The branching rule should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule ) /** branching execution method for fractional LP solutions
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# *  - allowaddcons    : is the branching rule allowed to add constraints to the current node in order to cut off the
# *                      current solution instead of creating a branching?
# *  - result          : pointer to store the result of the branching call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the current node was detected to be infeasible
# *  - SCIP_CONSADDED  : an additional constraint (e.g. a conflict constraint) was generated; this result code must not be
# *                      returned, if allowaddcons is FALSE
# *  - SCIP_REDUCEDDOM : a domain was reduced that rendered the current LP solution infeasible
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_BRANCHED   : branching was applied
# *  - SCIP_DIDNOTFIND : the branching rule searched, but did not find a branching
# *  - SCIP_DIDNOTRUN  : the branching rule was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result ) /** branching execution method for external candidates
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# *  - allowaddcons    : is the branching rule allowed to add constraints to the current node in order to cut off the
# *                      current solution instead of creating a branching?
# *  - result          : pointer to store the result of the branching call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the current node was detected to be infeasible
# *  - SCIP_CONSADDED  : an additional constraint (e.g. a conflict constraint) was generated; this result code must not be
# *                      returned, if allowaddcons is FALSE
# *  - SCIP_REDUCEDDOM : a domain was reduced that rendered the current pseudo solution infeasible
# *  - SCIP_BRANCHED   : branching was applied
# *  - SCIP_DIDNOTFIND : the branching rule searched, but did not find a branching
# *  - SCIP_DIDNOTRUN  : the branching rule was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECEXT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result ) /** branching execution method for not completely fixed pseudo solutions
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - branchrule      : the branching rule itself
# *  - allowaddcons    : is the branching rule allowed to add constraints to the current node in order to cut off the
# *                      current solution instead of creating a branching?
# *  - result          : pointer to store the result of the branching call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the current node was detected to be infeasible
# *  - SCIP_CONSADDED  : an additional constraint (e.g. a conflict constraint) was generated; this result code must not be
# *                      returned, if allowaddcons is FALSE
# *  - SCIP_REDUCEDDOM : a domain was reduced that rendered the current pseudo solution infeasible
# *  - SCIP_BRANCHED   : branching was applied
# *  - SCIP_DIDNOTFIND : the branching rule searched, but did not find a branching
# *  - SCIP_DIDNOTRUN  : the branching rule was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECPS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result ) #

struct SCIP_BranchCand
end

const SCIP_BRANCHCAND = Cvoid

struct SCIP_Branchrule
end

const SCIP_BRANCHRULE = Cvoid

struct SCIP_BranchruleData
end

const SCIP_BRANCHRULEDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_COMPRCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** destructor of tree compression to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# */
# Skipping MacroDefinition: SCIP_DECL_COMPRFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** initialization method of tree compression (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# */
# Skipping MacroDefinition: SCIP_DECL_COMPRINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** deinitialization method of tree compression (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# */
# Skipping MacroDefinition: SCIP_DECL_COMPREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** solving process initialization method of tree compressionc (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The tree compression may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# */
# Skipping MacroDefinition: SCIP_DECL_COMPRINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** solving process deinitialization method of tree compression (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The tree compression should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# */
# Skipping MacroDefinition: SCIP_DECL_COMPREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr ) /** execution method of tree compression technique
# *
# *  Try to compress the current search tree. The method is called in the node processing loop.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - compr           : the compression technique itself
# *  - result          : pointer to store the result of the heuristic call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : the tree could be compressed
# *  - SCIP_DIDNITFIND : the method could not compress the tree
# *  - SCIP_DIDNOTRUN  : the compression was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_COMPREXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr , SCIP_RESULT * result ) #

struct SCIP_Compr
end

const SCIP_COMPR = Cvoid

struct SCIP_ComprData
end

const SCIP_COMPRDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERCREATEINST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONCSOLVERTYPE * concsolvertype , SCIP_CONCSOLVER * concsolver ) /** destroys a concurrent solver instance
# *
# *  input:
# *  - scip               : SCIP main data structure
# *  - concsolverinstance : concurrent solver instance to destroy
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERDESTROYINST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONCSOLVER * concsolver ) /** frees data of a concurrent solver type
# *
# *  input:
# *  - scip               : SCIP main data structure
# *  - data               : concurrent solver type data to free
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERTYPEFREEDATA ( x ) void x ( SCIP_CONCSOLVERTYPEDATA * * data ) /** initialize random seeds of a concurrent solver
# *
# *  input:
# *  - concsolver      : concurrent solver data structure
# *  - seed            : seed for initializing the solver's internal random seeds
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERINITSEEDS ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , unsigned int seed ) /** synchronization method of concurrent solver for writing data
# *
# *  Syncronizes with other solvers. The concurrent solver should pass new solutions
# *  and bounds to the syncstore. For the solutions, no more than maxcandsols of the best solution
# *  should be considered for sharing. Additionally a maximum if maxsharedsols should be
# *  passed to the syncstore.
# *
# *  input:
# *  - concsolver      : concurrent solver data structure
# *  - spi             : pointer to the SCIP parallel interface
# *  - syncdata        : concurrent solver data structure
# *  - maxcandsols     : how many of the best solutions should be considered for sharing
# *  - maxsharedsols   : the maximum number of solutions that should be shared
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSYNCWRITE ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_SYNCSTORE * syncstore , SCIP_SYNCDATA * syncdata , int maxcandsols , int maxsharedsols , int * nsolsshared ) /** synchronization method of concurrent solver for reading data
# *
# *  the concurrent solver should read the solutions and bounds stored in the
# *  given synchronization data
# *
# *  input:
# *  - concsolver      : concurrent solver data structure
# *  - spi             : pointer to the SCIP parallel interface
# *  - syncdata        : concurrent solver data structure
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSYNCREAD ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_SYNCSTORE * syncstore , SCIP_SYNCDATA * syncdata , int * nsolsrecvd , int * ntighterbnds , int * ntighterintbnds ) /** execution method of concurrent solver
# *
# *  start solving of the problem given during initialization
# *
# *  input:
# *  - concsolver       : concurrent solver data structure
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVEREXEC ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_Real * solvingtime , SCIP_Longint * nlpiterations , SCIP_Longint * nnodes ) /** stop the solving as soon as possible
# *
# *  input:
# *  - concsolver      : concurrent solver data structure
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSTOP ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver ) /** extract the solving data from the concurrent solver and store it into the SCIP datastructure,
# *  so that this SCIP instance has the optimal solution and reports the correct status and statistics.
# *
# *  input:
# *  - concsolver      : concurrent solver data structure
# *  - scip            : SCIP datastructure
# *
# *  returns SCIP_OKAY if everything worked, otherwise, a suitable error code
# */
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERCOPYSOLVINGDATA ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP * scip ) #

struct SCIP_ConcSolverType
end

const SCIP_CONCSOLVERTYPE = Cvoid

struct SCIP_ConcSolverTypeData
end

const SCIP_CONCSOLVERTYPEDATA = Cvoid

struct SCIP_ConcSolver
end

const SCIP_CONCSOLVER = Cvoid

struct SCIP_ConcSolverData
end

const SCIP_CONCSOLVERDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_CONFLICTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** destructor of conflict handler to free conflict handler data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** initialization method of conflict handler (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** deinitialization method of conflict handler (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** solving process initialization method of conflict handler (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The conflict handler may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** solving process deinitialization method of conflict handler (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The conflict handler should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr ) /** conflict processing method of conflict handler (called when conflict was found)
# *
# *  This method is called, when the conflict analysis found a conflict on variable bounds.
# *  The conflict handler may update its data accordingly and create a constraint out of the conflict set.
# *  If the parameter "resolved" is set, the conflict handler should not create a constraint, because
# *  a different conflict handler with higher priority already created a constraint.
# *  The bounds in the conflict set lead to a conflict (i.e. an infeasibility) when all enforced at the same time.
# *  Thus, a feasible conflict constraint must demand that at least one of the variables in the conflict
# *  set violates its corresponding bound, i.e., fulfills the negation of the bound change in the conflict set.
# *  For continuous variables, the negation has to be defined in a relaxed way: if, e.g., the bound in the conflict
# *  set is "x <= u", the negation to be used has to be "x >= u", and not "x > u".
# *  The given "bdchginfos" array representing the conflict set is only a reference to an internal
# *  buffer, that may be modified at any time by SCIP. The user must copy the needed information from the
# *  "bdchginfos" array to own data structures, if (s)he wants to use the information later.
# *  (S)he should not keep a pointer to the array or pointers to the single bdchginfos in the array, because these
# *  may get invalid afterwards.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conflicthdlr    : the conflict handler itself
# *  - node            : node to add resulting conflict constraint to (with SCIPaddConsNode())
# *  - validnode       : node at which the conflict constraint is valid (should be passed to SCIPaddConsNode())
# *  - bdchginfos      : array with bound changes that lead to a conflict
# *  - relaxedbds      : array with relaxed bounds which are efficient to create a valid conflict
# *  - nbdchginfos     : number of bound changes in the conflict set
# *  -.primalbound     : the current primal bound, or -infininity if the conflict arises from an infeasible LP
# *  - separate        : should the conflict constraint be separated?
# *  - local           : is the conflict set only valid locally, i.e., should the constraint be created as local constraint?
# *  - dynamic         : should the conflict constraint be made subject to aging?
# *  - removable       : should the conflict's relaxation be made subject to LP aging and cleanup?
# *  - resolved        : is the conflict set already used to create a constraint?
# *  - result          : pointer to store the result of the conflict processing call
# *
# *  possible return values for *result:
# *  - SCIP_CONSADDED  : the conflict handler created a constraint out of the conflict set
# *  - SCIP_DIDNOTFIND : the conflict handler could not create a constraint out of the conflict set
# *  - SCIP_DIDNOTRUN  : the conflict handler was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr , SCIP_NODE * node , SCIP_NODE * validnode , SCIP_BDCHGINFO * * bdchginfos , SCIP_Real * relaxedbds , int nbdchginfos , SCIP_CONFTYPE conftype , SCIP_Bool cutoffinvolved , SCIP_Bool separate , SCIP_Bool local , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool resolved , SCIP_RESULT * result ) #

struct SCIP_Conflicthdlr
end

const SCIP_CONFLICTHDLR = Cvoid

struct SCIP_ConflicthdlrData
end

const SCIP_CONFLICTHDLRDATA = Cvoid

struct SCIP_ConflictSet
end

const SCIP_CONFLICTSET = Cvoid

struct SCIP_ProofSet
end

const SCIP_PROOFSET = Cvoid

struct SCIP_LPBdChgs
end

const SCIP_LPBDCHGS = Cvoid

struct SCIP_Conflict
end

const SCIP_CONFLICT = Cvoid

# begin enum SCIP_ConflictType
const SCIP_ConflictType = UInt32
const SCIP_CONFTYPE_UNKNOWN = 0 |> UInt32
const SCIP_CONFTYPE_PROPAGATION = 1 |> UInt32
const SCIP_CONFTYPE_INFEASLP = 2 |> UInt32
const SCIP_CONFTYPE_BNDEXCEEDING = 3 |> UInt32
const SCIP_CONFTYPE_ALTINFPROOF = 4 |> UInt32
const SCIP_CONFTYPE_ALTBNDPROOF = 5 |> UInt32
# end enum SCIP_ConflictType

const SCIP_CONFTYPE = SCIP_ConflictType

# begin enum SCIP_ConflictPresolStrat
const SCIP_ConflictPresolStrat = UInt32
const SCIP_CONFPRES_DISABLED = 0 |> UInt32
const SCIP_CONFPRES_ONLYLOCAL = 1 |> UInt32
const SCIP_CONFPRES_ONLYGLOBAL = 2 |> UInt32
const SCIP_CONFPRES_BOTH = 3 |> UInt32
# end enum SCIP_ConflictPresolStrat

const SCIP_CONFPRES = SCIP_ConflictPresolStrat

# Skipping MacroDefinition: SCIP_NLINCONSTYPES ( ( int ) SCIP_LINCONSTYPE_GENERAL + 1 ) /** copy method for constraint handler plugins (called when SCIP copies plugins)
# *
# *  If the copy process was one to one, the valid pointer can be set to TRUE. Otherwise, this pointer has to be set to
# *  FALSE. If all problem defining objects (constraint handlers and variable pricers) return valid = TRUE for all
# *  their copying calls, SCIP assumes that it is an overall one to one copy of the original instance. In this case any
# *  reductions made in the copied SCIP instance can be transfered to the original SCIP instance. If the valid pointer is
# *  set to TRUE and it was not a one to one copy, it might happen that optimal solutions are cut off.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - valid           : was the copying process valid?
# */
# Skipping MacroDefinition: SCIP_DECL_CONSHDLRCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_Bool * valid ) /** destructor of constraint handler to free constraint handler data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_CONSFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr ) /** initialization method of constraint handler (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints in transformed problem
# *  - nconss          : number of constraints in transformed problem
# */
# Skipping MacroDefinition: SCIP_DECL_CONSINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** deinitialization method of constraint handler (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints in transformed problem
# *  - nconss          : number of constraints in transformed problem
# */
# Skipping MacroDefinition: SCIP_DECL_CONSEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** presolving initialization method of constraint handler (called when presolving is about to begin)
# *
# *  This method is called when the presolving process is about to begin, even if presolving is turned off.
# *  The constraint handler may use this call to initialize its data structures.
# *
# *  Necessary modifications that have to be performed even if presolving is turned off should be done here or in the
# *  presolving deinitialization call (SCIP_DECL_CONSEXITPRE()).
# *
# *  @note Note that the constraint array might contain constraints that were created but not added to the problem.
# *        Constraints that are not added, i.e., for which SCIPconsIsAdded() returns FALSE, cannot be used for problem
# *        reductions.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints in transformed problem
# *  - nconss          : number of constraints in transformed problem
# */
# Skipping MacroDefinition: SCIP_DECL_CONSINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** presolving deinitialization method of constraint handler (called after presolving has been finished)
# *
# *  This method is called after the presolving has been finished, even if presolving is turned off.
# *  The constraint handler may use this call e.g. to clean up or modify its data structures.
# *
# *  Necessary modifications that have to be performed even if presolving is turned off should be done here or in the
# *  presolving initialization call (SCIP_DECL_CONSINITPRE()).
# *
# *  Besides necessary modifications and clean up, no time consuming operations should be performed, especially if the
# *  problem has already been solved.  Use the method SCIPgetStatus(), which in this case returns SCIP_STATUS_OPTIMAL,
# *  SCIP_STATUS_INFEASIBLE, SCIP_STATUS_UNBOUNDED, or SCIP_STATUS_INFORUNBD.
# *
# *  @note Note that the constraint array might contain constraints that were created but not added to the problem.
# *        Constraints that are not added, i.e., for which SCIPconsIsAdded() returns FALSE, cannot be used for problem
# *        reductions.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : final array of constraints in transformed problem
# *  - nconss          : final number of constraints in transformed problem
# */
# Skipping MacroDefinition: SCIP_DECL_CONSEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** solving process initialization method of constraint handler (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The constraint handler may use this call to initialize its branch and bound specific data.
# *
# *  Besides necessary modifications and clean up, no time consuming operations should be performed, especially if the
# *  problem has already been solved.  Use the method SCIPgetStatus(), which in this case returns SCIP_STATUS_OPTIMAL,
# *  SCIP_STATUS_INFEASIBLE, SCIP_STATUS_UNBOUNDED, or SCIP_STATUS_INFORUNBD.
# *
# *  @note Note that the constraint array might contain constraints that were created but not added to the problem.
# *        Constraints that are not added, i.e., for which SCIPconsIsAdded() returns FALSE, cannot be used for problem
# *        reductions.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints of the constraint handler
# *  - nconss          : number of constraints of the constraint handler
# */
# Skipping MacroDefinition: SCIP_DECL_CONSINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** solving process deinitialization method of constraint handler (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The constraint handler should use this call to clean up its branch and bound data, in particular to release
# *  all LP rows that he has created or captured.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints of the constraint handler
# *  - nconss          : number of constraints of the constraint handler
# *  - restart         : was this exit solve call triggered by a restart?
# */
# Skipping MacroDefinition: SCIP_DECL_CONSEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_Bool restart ) /** frees specific constraint data
# *
# *  @warning There may exist unprocessed events. For example, a variable's bound may have been already changed, but the
# *           corresponding bound change event was not yet processed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint belonging to the constraint data
# *  - consdata        : pointer to the constraint data to free
# */
# Skipping MacroDefinition: SCIP_DECL_CONSDELETE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_CONSDATA * * consdata ) /** transforms constraint data into data belonging to the transformed problem
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - sourcecons      : source constraint to transform
# *  - targetcons      : pointer to store created target constraint
# */
# Skipping MacroDefinition: SCIP_DECL_CONSTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * sourcecons , SCIP_CONS * * targetcons ) /** LP initialization method of constraint handler (called before the initial LP relaxation at a node is solved)
# *
# *  Puts the LP relaxations of all "initial" constraints into the LP. The method should put a canonic LP relaxation
# *  of all given constraints to the LP with calls to SCIPaddRow().
# *
# *  @warning It is not guaranteed that the problem is going to be declared infeasible if the infeasible pointer is set
# *           to TRUE. Therefore, it is recommended that users do not end this method prematurely when an infeasiblity
# *           is detected.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *
# *  output:
# *  - infeasible      : pointer to store whether an infeasibility was detected while building the LP
# */
# Skipping MacroDefinition: SCIP_DECL_CONSINITLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_Bool * infeasible ) /** separation method of constraint handler for LP solution
# *
# *  Separates all constraints of the constraint handler. The method is called in the LP solution loop,
# *  which means that a valid LP solution exists.
# *
# *  The first nusefulconss constraints are the ones, that are identified to likely be violated. The separation
# *  method should process only the useful constraints in most runs, and only occasionally the remaining
# *  nconss - nusefulconss constraints.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - result          : pointer to store the result of the separation call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_NEWROUND   : a cutting plane was generated and a new separation round should immediately start
# *  - SCIP_DIDNOTFIND : the separator searched, but did not find domain reductions, cutting planes, or cut constraints
# *  - SCIP_DIDNOTRUN  : the separator was skipped
# *  - SCIP_DELAYED    : the separator was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_CONSSEPALP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_RESULT * result ) /** separation method of constraint handler for arbitrary primal solution
# *
# *  Separates all constraints of the constraint handler. The method is called outside the LP solution loop (e.g., by
# *  a relaxator or a primal heuristic), which means that there is no valid LP solution.
# *  Instead, the method should produce cuts that separate the given solution.
# *
# *  The first nusefulconss constraints are the ones, that are identified to likely be violated. The separation
# *  method should process only the useful constraints in most runs, and only occasionally the remaining
# *  nconss - nusefulconss constraints.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - sol             : primal solution that should be separated
# *  - result          : pointer to store the result of the separation call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_NEWROUND   : a cutting plane was generated and a new separation round should immediately start
# *  - SCIP_DIDNOTFIND : the separator searched, but did not find domain reductions, cutting planes, or cut constraints
# *  - SCIP_DIDNOTRUN  : the separator was skipped
# *  - SCIP_DELAYED    : the separator was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_CONSSEPASOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_SOL * sol , SCIP_RESULT * result ) /** constraint enforcing method of constraint handler for LP solutions
# *
# *  The method is called at the end of the node processing loop for a node where the LP was solved.
# *  The LP solution has to be checked for feasibility. If possible, an infeasibility should be resolved by
# *  branching, reducing a variable's domain to exclude the solution or separating the solution with a valid
# *  cutting plane.
# *
# *  The enforcing methods of the active constraint handlers are called in decreasing order of their enforcing
# *  priorities until the first constraint handler returned with the value SCIP_CUTOFF, SCIP_SEPARATED,
# *  SCIP_REDUCEDDOM, SCIP_CONSADDED, or SCIP_BRANCHED.
# *  The integrality constraint handler has an enforcing priority of zero. A constraint handler which can
# *  (or wants) to enforce its constraints only for integral solutions should have a negative enforcing priority
# *  (e.g. the alldiff-constraint can only operate on integral solutions).
# *  A constraint handler which wants to incorporate its own branching strategy even on non-integral
# *  solutions must have an enforcing priority greater than zero (e.g. the SOS-constraint incorporates
# *  SOS-branching on non-integral solutions).
# *
# *  The first nusefulconss constraints are the ones, that are identified to likely be violated. The enforcing
# *  method should process the useful constraints first. The other nconss - nusefulconss constraints should only
# *  be enforced, if no violation was found in the useful constraints.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - solinfeasible   : was the solution already declared infeasible by a constraint handler?
# *  - result          : pointer to store the result of the enforcing call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_BRANCHED   : no changes were made to the problem, but a branching was applied to resolve an infeasibility
# *  - SCIP_INFEASIBLE : at least one constraint is infeasible, but it was not resolved
# *  - SCIP_FEASIBLE   : all constraints of the handler are feasible
# */
# Skipping MacroDefinition: SCIP_DECL_CONSENFOLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_RESULT * result ) /** constraint enforcing method of constraint handler for relaxation solutions
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sol             : relaxation solution
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - solinfeasible   : was the solution already declared infeasible by a constraint handler?
# *  - result          : pointer to store the result of the enforcing call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_BRANCHED   : no changes were made to the problem, but a branching was applied to resolve an infeasibility
# *  - SCIP_SOLVELP    : at least one constraint is infeasible, and this can only be resolved by solving the LP
# *  - SCIP_INFEASIBLE : at least one constraint is infeasible, but it was not resolved
# *  - SCIP_FEASIBLE   : all constraints of the handler are feasible
# *  - SCIP_DIDNOTRUN  : the enforcement was skipped (only possible, if objinfeasible is true)
# */
# Skipping MacroDefinition: SCIP_DECL_CONSENFORELAX ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SOL * sol , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_RESULT * result ) /** constraint enforcing method of constraint handler for pseudo solutions
# *
# *  The method is called at the end of the node processing loop for a node where the LP was not solved.
# *  The pseudo solution has to be checked for feasibility. If possible, an infeasibility should be resolved by
# *  branching, reducing a variable's domain to exclude the solution or adding an additional constraint.
# *  Separation is not possible, since the LP is not processed at the current node. All LP informations like
# *  LP solution, slack values, or reduced costs are invalid and must not be accessed.
# *
# *  Like in the enforcing method for LP solutions, the enforcing methods of the active constraint handlers are
# *  called in decreasing order of their enforcing priorities until the first constraint handler returned with
# *  the value SCIP_CUTOFF, SCIP_REDUCEDDOM, SCIP_CONSADDED, SCIP_BRANCHED, or SCIP_SOLVELP.
# *
# *  The first nusefulconss constraints are the ones, that are identified to likely be violated. The enforcing
# *  method should process the useful constraints first. The other nconss - nusefulconss constraints should only
# *  be enforced, if no violation was found in the useful constraints.
# *
# *  If the pseudo solution's objective value is lower than the lower bound of the node, it cannot be feasible
# *  and the enforcing method may skip it's check and set *result to SCIP_DIDNOTRUN. However, it can also process
# *  its constraints and return any other possible result code.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - solinfeasible   : was the solution already declared infeasible by a constraint handler?
# *  - objinfeasible   : is the solution infeasible anyway due to violating lower objective bound?
# *  - result          : pointer to store the result of the enforcing call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_BRANCHED   : no changes were made to the problem, but a branching was applied to resolve an infeasibility
# *  - SCIP_SOLVELP    : at least one constraint is infeasible, and this can only be resolved by solving the LP
# *  - SCIP_INFEASIBLE : at least one constraint is infeasible, but it was not resolved
# *  - SCIP_FEASIBLE   : all constraints of the handler are feasible
# *  - SCIP_DIDNOTRUN  : the enforcement was skipped (only possible, if objinfeasible is true)
# */
# Skipping MacroDefinition: SCIP_DECL_CONSENFOPS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_Bool objinfeasible , SCIP_RESULT * result ) /** feasibility check method of constraint handler for integral solutions
# *
# *  The given solution has to be checked for feasibility.
# *  
# *  The check methods of the active constraint handlers are called in decreasing order of their check
# *  priorities until the first constraint handler returned with the result SCIP_INFEASIBLE.
# *  The integrality constraint handler has a check priority of zero. A constraint handler which can
# *  (or wants) to check its constraints only for integral solutions should have a negative check priority
# *  (e.g. the alldiff-constraint can only operate on integral solutions).
# *  A constraint handler which wants to check feasibility even on non-integral solutions must have a
# *  check priority greater than zero (e.g. if the check is much faster than testing all variables for
# *  integrality).
# *
# *  In some cases, integrality conditions or rows of the current LP don't have to be checked, because their
# *  feasibility is already checked or implicitly given. In these cases, 'checkintegrality' or
# *  'checklprows' is FALSE.
# *
# *  If the solution is not NULL, SCIP should also be informed about the constraint violation with a call to
# *  SCIPupdateSolConsViolation() and additionally SCIPupdateSolLPRowViolation() for every row of the constraint's current
# *  representation in the LP relaxation, if any such rows exist.
# *  As a convenience method, SCIPupdateSolLPConsViolation() can be used if the constraint
# *  is represented completely by a set of LP rows, meaning that the current constraint violation is equal to the maximum
# *  of the contraint violations of the corresponding LP rows.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - sol             : the solution to check feasibility for
# *  - checkintegrality: Has integrality to be checked?
# *  - checklprows     : Do constraints represented by rows in the current LP have to be checked?
# *  - printreason     : Should the reason for the violation be printed?
# *  - completely      : Should all violations be checked?
# *  - result          : pointer to store the result of the feasibility checking call
# *
# *  possible return values for *result:
# *  - SCIP_INFEASIBLE : at least one constraint of the handler is infeasible
# *  - SCIP_FEASIBLE   : all constraints of the handler are feasible
# */
# Skipping MacroDefinition: SCIP_DECL_CONSCHECK ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_SOL * sol , SCIP_Bool checkintegrality , SCIP_Bool checklprows , SCIP_Bool printreason , SCIP_Bool completely , SCIP_RESULT * result ) /** domain propagation method of constraint handler
# *
# *  The first nusefulconss constraints are the ones, that are identified to likely be violated. The propagation
# *  method should process only the useful constraints in most runs, and only occasionally the remaining
# *  nconss - nusefulconss constraints.
# *
# *  @note if the constraint handler uses dual information in propagation it is nesassary to check via calling
# *        SCIPallowDualReds and SCIPallowObjProp if dual reductions and propgation with the current cutoff bound, resp.,
# *        are allowed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nusefulconss    : number of useful (non-obsolete) constraints to process
# *  - nmarkedconss    : number of constraints which are marked to be definitely propagated
# *  - proptiming      : current point in the node solving loop
# *  - result          : pointer to store the result of the propagation call
# *
# *  possible return values for *result:
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_REDUCEDDOM : at least one domain reduction was found
# *  - SCIP_DIDNOTFIND : the propagator searched but did not find any domain reductions
# *  - SCIP_DIDNOTRUN  : the propagator was skipped
# *  - SCIP_DELAYED    : the propagator was skipped, but should be called again
# *  - SCIP_DELAYNODE  : the current node should be postponed (return value only valid for BEFORELP propagation)
# */
# Skipping MacroDefinition: SCIP_DECL_CONSPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , int nmarkedconss , SCIP_PROPTIMING proptiming , SCIP_RESULT * result ) /** presolving method of constraint handler
# *
# *  The presolver should go through the variables and constraints and tighten the domains or
# *  constraints. Each tightening should increase the given total number of changes.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints to process
# *  - nconss          : number of constraints to process
# *  - nrounds         : number of presolving rounds already done
# *  - presoltiming    : current presolving timing
# *  - nnewfixedvars   : number of variables fixed since the last call to the presolving method
# *  - nnewaggrvars    : number of variables aggregated since the last call to the presolving method
# *  - nnewchgvartypes : number of variable type changes since the last call to the presolving method
# *  - nnewchgbds      : number of variable bounds tightened since the last call to the presolving method
# *  - nnewholes       : number of domain holes added since the last call to the presolving method
# *  - nnewdelconss    : number of deleted constraints since the last call to the presolving method
# *  - nnewaddconss    : number of added constraints since the last call to the presolving method
# *  - nnewupgdconss   : number of upgraded constraints since the last call to the presolving method
# *  - nnewchgcoefs    : number of changed coefficients since the last call to the presolving method
# *  - nnewchgsides    : number of changed left or right hand sides since the last call to the presolving method
# *
# *  @note the counters state the changes since the last call including the changes of this presolving method during its
# *        call
# *
# *  @note if the constraint handler performs dual presolving it is nesassary to check via calling SCIPallowDualReds
# *        if dual reductions are allowed.
# *
# *  input/output:
# *  - nfixedvars      : pointer to count total number of variables fixed of all presolvers
# *  - naggrvars       : pointer to count total number of variables aggregated of all presolvers
# *  - nchgvartypes    : pointer to count total number of variable type changes of all presolvers
# *  - nchgbds         : pointer to count total number of variable bounds tightened of all presolvers
# *  - naddholes       : pointer to count total number of domain holes added of all presolvers
# *  - ndelconss       : pointer to count total number of deleted constraints of all presolvers
# *  - naddconss       : pointer to count total number of added constraints of all presolvers
# *  - nupgdconss      : pointer to count total number of upgraded constraints of all presolvers
# *  - nchgcoefs       : pointer to count total number of changed coefficients of all presolvers
# *  - nchgsides       : pointer to count total number of changed left/right hand sides of all presolvers
# *
# *  output:
# *  - result          : pointer to store the result of the presolving call
# *
# *  possible return values for *result:
# *  - SCIP_UNBOUNDED  : at least one variable is not bounded by any constraint in obj. direction -> problem is unbounded
# *  - SCIP_CUTOFF     : at least one constraint is infeasible in the variable's bounds -> problem is infeasible
# *  - SCIP_SUCCESS    : the presolving method found a reduction
# *  - SCIP_DIDNOTFIND : the presolving method searched, but did not find a presolving change
# *  - SCIP_DIDNOTRUN  : the presolving method was skipped
# *  - SCIP_DELAYED    : the presolving method was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_CONSPRESOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result ) /** propagation conflict resolving method of constraint handler
# *
# *  This method is called during conflict analysis. If the constraint handler wants to support conflict analysis,
# *  it should call SCIPinferVarLbCons() or SCIPinferVarUbCons() in domain propagation instead of SCIPchgVarLb() or
# *  SCIPchgVarUb() in order to deduce bound changes on variables.
# *  In the SCIPinferVarLbCons() and SCIPinferVarUbCons() calls, the handler provides the constraint, that deduced the
# *  variable's bound change, and an integer value "inferinfo" that can be arbitrarily chosen.
# *  The propagation conflict resolving method can then be implemented, to provide a "reason" for the bound
# *  changes, i.e., the bounds of variables at the time of the propagation, that forced the constraint to set the
# *  conflict variable's bound to its current value. It can use the "inferinfo" tag to identify its own propagation
# *  rule and thus identify the "reason" bounds. The bounds that form the reason of the assignment must then be provided
# *  by calls to SCIPaddConflictLb(), SCIPaddConflictUb(), SCIPaddConflictBd(), SCIPaddConflictRelaxedLb(),
# *  SCIPaddConflictRelaxedUb(), SCIPaddConflictRelaxedBd(), and/or SCIPaddConflictBinvar() in the propagation conflict
# *  resolving method.
# *
# *  For example, the logicor constraint c = "x or y or z" fixes variable z to TRUE (i.e. changes the lower bound of z
# *  to 1.0), if both, x and y, are assigned to FALSE (i.e. if the upper bounds of these variables are 0.0). It uses
# *  SCIPinferVarLbCons(scip, z, 1.0, c, 0) to apply this assignment (an inference information tag is not needed by the
# *  constraint handler and is set to 0).
# *  In the conflict analysis, the constraint handler may be asked to resolve the lower bound change on z with
# *  constraint c, that was applied at a time given by a bound change index "bdchgidx".
# *  With a call to SCIPgetVarLbAtIndex(scip, z, bdchgidx, TRUE), the handler can find out, that the lower bound of
# *  variable z was set to 1.0 at the given point of time, and should call SCIPaddConflictUb(scip, x, bdchgidx) and
# *  SCIPaddConflictUb(scip, y, bdchgidx) to tell SCIP, that the upper bounds of x and y at this point of time were
# *  the reason for the deduction of the lower bound of z.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that deduced the bound change of the conflict variable
# *  - infervar        : the conflict variable whose bound change has to be resolved
# *  - inferinfo       : the user information passed to the corresponding SCIPinferVarLbCons() or SCIPinferVarUbCons() call
# *  - boundtype       : the type of the changed bound (lower or upper bound)
# *  - bdchgidx        : the index of the bound change, representing the point of time where the change took place
# *  - relaxedbd       : the relaxed bound which is sufficient to be explained
# *
# *  output:
# *  - result          : pointer to store the result of the propagation conflict resolving call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : the conflicting bound change has been successfully resolved by adding all reason bounds
# *  - SCIP_DIDNOTFIND : the conflicting bound change could not be resolved and has to be put into the conflict set
# *
# *  @note it is sufficient to explain/resolve the relaxed bound
# */
# Skipping MacroDefinition: SCIP_DECL_CONSRESPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_VAR * infervar , int inferinfo , SCIP_BOUNDTYPE boundtype , SCIP_BDCHGIDX * bdchgidx , SCIP_Real relaxedbd , SCIP_RESULT * result ) /** variable rounding lock method of constraint handler
# *
# *  This method is called, after a constraint is added or removed from the transformed problem.
# *  It should update the rounding locks of the given type of all associated variables with calls to
# *  SCIPaddVarLocksType(), depending on the way, the variable is involved in the constraint:
# *  - If the constraint may get violated by decreasing the value of a variable, it should call
# *    SCIPaddVarLocksType(scip, var, locktype, nlockspos, nlocksneg), saying that rounding down is
# *    potentially rendering the (positive) constraint infeasible and rounding up is potentially rendering the
# *    negation of the constraint infeasible.
# *  - If the constraint may get violated by increasing the value of a variable, it should call
# *    SCIPaddVarLocksType(scip, var, locktype, nlocksneg, nlockspos), saying that rounding up is
# *    potentially rendering the constraint's negation infeasible and rounding up is potentially rendering the
# *    constraint itself infeasible.
# *  - If the constraint may get violated by changing the variable in any direction, it should call
# *    SCIPaddVarLocksType(scip, var, locktype, nlockspos + nlocksneg, nlockspos + nlocksneg).
# *
# *  Consider the linear constraint "3x -5y +2z <= 7" as an example. The variable rounding lock method of the
# *  linear constraint handler should call SCIPaddVarLocksType(scip, x, locktype, nlocksneg, nlockspos),
# *  SCIPaddVarLocksType(scip, y, locktype, nlockspos, nlocksneg) and
# *  SCIPaddVarLocksType(scip, z, type, nlocksneg, nlockspos) to tell SCIP, that rounding up of x and z and rounding
# *  down of y can destroy the feasibility of the constraint, while rounding down of x and z and rounding up of y can
# *  destroy the feasibility of the constraint's negation "3x -5y +2z > 7".
# *  A linear constraint "2 <= 3x -5y +2z <= 7" should call
# *  SCIPaddVarLocksType(scip, ..., nlockspos + nlocksneg, nlockspos + nlocksneg) on all variables, since rounding in both
# *  directions of each variable can destroy both the feasibility of the constraint and it's negation
# *  "3x -5y +2z < 2  or  3x -5y +2z > 7".
# *
# *  If the constraint itself contains other constraints as sub constraints (e.g. the "or" constraint concatenation
# *  "c(x) or d(x)"), the rounding lock methods of these constraints should be called in a proper way.
# *  - If the constraint may get violated by the violation of the sub constraint c, it should call
# *    SCIPaddConsLocksType(scip, c, locktype, nlockspos, nlocksneg), saying that infeasibility of c may lead to
# *    infeasibility of the (positive) constraint, and infeasibility of c's negation (i.e. feasibility of c) may lead
# *    to infeasibility of the constraint's negation (i.e. feasibility of the constraint).
# *  - If the constraint may get violated by the feasibility of the sub constraint c, it should call
# *    SCIPaddConsLocksType(scip, c, locktype, nlocksneg, nlockspos), saying that infeasibility of c may lead to
# *    infeasibility of the constraint's negation (i.e. feasibility of the constraint), and infeasibility of c's negation
# *    (i.e. feasibility of c) may lead to infeasibility of the (positive) constraint.
# *  - If the constraint may get violated by any change in the feasibility of the sub constraint c, it should call
# *    SCIPaddConsLocksType(scip, c, locktype, nlockspos + nlocksneg, nlockspos + nlocksneg).
# *
# *  Consider the or concatenation "c(x) or d(x)". The variable rounding lock method of the or constraint handler
# *  should call SCIPaddConsLocksType(scip, c, locktype, nlockspos, nlocksneg) and
# *  SCIPaddConsLocksType(scip, d, locktype, nlockspos, nlocksneg) to tell SCIP, that infeasibility of c and d can lead
# *  to infeasibility of "c(x) or d(x)".
# *
# *  As a second example, consider the equivalence constraint "y <-> c(x)" with variable y and constraint c. The
# *  constraint demands, that y == 1 if and only if c(x) is satisfied. The variable lock method of the corresponding
# *  constraint handler should call SCIPaddVarLocksType(scip, y, locktype, nlockspos + nlocksneg, nlockspos + nlocksneg) and
# *  SCIPaddConsLocksType(scip, c, locktype, nlockspos + nlocksneg, nlockspos + nlocksneg), because any modification to the
# *  value of y or to the feasibility of c can alter the feasibility of the equivalence constraint.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that should lock rounding of its variables, or NULL if the constraint handler
# *                      does not need constraints
# *  - locktype        : type of rounding locks, i.e., SCIP_LOCKTYPE_MODEL or SCIP_LOCKTYPE_CONFLICT
# *  - nlockspos       : number of times, the roundings should be locked for the constraint (may be negative)
# *  - nlocksneg       : number of times, the roundings should be locked for the constraint's negation (may be negative)
# */
# Skipping MacroDefinition: SCIP_DECL_CONSLOCK ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_LOCKTYPE locktype , int nlockspos , int nlocksneg ) /** constraint activation notification method of constraint handler
# *
# *  WARNING! There may exist unprocessed events. For example, a variable's bound may have been already changed, but
# *  the corresponding bound change event was not yet processed.
# *
# *  This method is always called after a constraint of the constraint handler was activated. The constraint
# *  handler may use this call to update his own (statistical) data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that has been activated
# */
# Skipping MacroDefinition: SCIP_DECL_CONSACTIVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons ) /** constraint deactivation notification method of constraint handler
# *
# *  WARNING! There may exist unprocessed events. For example, a variable's bound may have been already changed, but
# *  the corresponding bound change event was not yet processed.
# *
# *  This method is always called before a constraint of the constraint handler is deactivated. The constraint
# *  handler may use this call to update his own (statistical) data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that will be deactivated
# */
# Skipping MacroDefinition: SCIP_DECL_CONSDEACTIVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons ) /** constraint enabling notification method of constraint handler
# *
# *  WARNING! There may exist unprocessed events. For example, a variable's bound may have been already changed, but
# *  the corresponding bound change event was not yet processed.
# *
# *  This method is always called after a constraint of the constraint handler was enabled. The constraint
# *  handler may use this call to update his own (statistical) data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that has been enabled
# */
# Skipping MacroDefinition: SCIP_DECL_CONSENABLE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons ) /** constraint disabling notification method of constraint handler
# *
# *  WARNING! There may exist unprocessed events. For example, a variable's bound may have been already changed, but
# *  the corresponding bound change event was not yet processed.
# *
# *  This method is always called before a constraint of the constraint handler is disabled. The constraint
# *  handler may use this call to update his own (statistical) data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that will be disabled
# */
# Skipping MacroDefinition: SCIP_DECL_CONSDISABLE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons ) /** variable deletion method of constraint handler
# *
# *  This method is optinal and only of interest if you are using SCIP as a branch-and-price framework. That means, you
# *  are generating new variables during the search. If you are not doing that just define the function pointer to be
# *  NULL.
# *
# *  If this method gets implemented you should iterate over all constraints of the constraint handler and delete all
# *  variables that were marked for deletion by SCIPdelVar().
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - conss           : array of constraints in transformed problem
# *  - nconss          : number of constraints in transformed problem
# */
# Skipping MacroDefinition: SCIP_DECL_CONSDELVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss ) /** constraint display method of constraint handler
# *
# *  The constraint handler can store a representation of the constraint into the given text file. Use the method
# *  SCIPinfoMessage() to push a string into the file stream.
# *
# *  @note There are several methods which help to display variables. These are SCIPwriteVarName(), SCIPwriteVarsList(),
# *        SCIPwriteVarsLinearsum(), and SCIPwriteVarsPolynomial().
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that should be displayed
# *  - file            : the text file to store the information into
# */
# Skipping MacroDefinition: SCIP_DECL_CONSPRINT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , FILE * file ) /** constraint copying method of constraint handler
# *
# *  The constraint handler can provide a copy method which copies a constraint from one SCIP data structure into an other
# *  SCIP data structure. If a copy of a constraint is created, the constraint has to be captured. (The capture is usually
# *  already done due to the creation of the constraint).
# *
# *  If the copy process was one to one, the valid pointer can be set to TRUE. Otherwise, you have to set this pointer to
# *  FALSE. In case all problem defining objects (constraint handlers and variable pricers) return a TRUE valid for all
# *  their copying calls, SCIP assumes that it is a overall one to one copy of the original instance. In this case any
# *  reductions made in the copied SCIP instance can be transfered to the original SCIP instance. If the valid pointer is
# *  set to TRUE and it was not a one to one copy, it might happen that optimal solutions are cut off.
# *
# *  To get a copy of a variable in the target SCIP you should use the function SCIPgetVarCopy().
# *
# *  input:
# *  - scip            : target SCIP data structure
# *  - cons            : pointer to store the created target constraint
# *  - name            : name of constraint, or NULL if the name of the source constraint should be used
# *  - sourcescip      : source SCIP data structure
# *  - sourceconshdlr  : source constraint handler of the source SCIP
# *  - sourcecons      : source constraint of the source SCIP
# *  - varmap          : a SCIP_HASHMAP mapping variables of the source SCIP to corresponding variables of the target SCIP
# *  - consmap         : a SCIP_HASHMAP mapping constraints of the source SCIP to corresponding constraints of the target SCIP
# *  - initial         : should the LP relaxation of constraint be in the initial LP?
# *  - separate        : should the constraint be separated during LP processing?
# *  - enforce         : should the constraint be enforced during node processing?
# *  - check           : should the constraint be checked for feasibility?
# *  - propagate       : should the constraint be propagated during node processing?
# *  - local           : is constraint only valid locally?
# *  - modifiable      : is constraint modifiable (subject to column generation)?
# *  - dynamic         : is constraint subject to aging?
# *  - removable       : should the relaxation be removed from the LP due to aging or cleanup?
# *  - stickingatnode  : should the constraint always be kept at the node where it was added, even
# *                      if it may be moved to a more global node?
# *  - global          : should a global or a local copy be created?
# *
# *  output:
# *  - valid           : pointer to store whether the copying was valid or not 
# */
# Skipping MacroDefinition: SCIP_DECL_CONSCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONS * * cons , const char * name , SCIP * sourcescip , SCIP_CONSHDLR * sourceconshdlr , SCIP_CONS * sourcecons , SCIP_HASHMAP * varmap , SCIP_HASHMAP * consmap , SCIP_Bool initial , SCIP_Bool separate , SCIP_Bool enforce , SCIP_Bool check , SCIP_Bool propagate , SCIP_Bool local , SCIP_Bool modifiable , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool stickingatnode , SCIP_Bool global , SCIP_Bool * valid ) /** constraint parsing method of constraint handler
# *
# *  The constraint handler can provide a callback to parse the output created by the display method
# *  (\ref SCIP_DECL_CONSPRINT) and to create a constraint out of it.
# *
# *  @note For parsing there are several methods which are handy. Have a look at: SCIPparseVarName(),
# *        SCIPparseVarsList(), SCIPparseVarsLinearsum(), SCIPparseVarsPolynomial(), SCIPstrToRealValue(), and
# *        SCIPstrCopySection().
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : pointer to store the created constraint
# *  - name            : name of the constraint
# *  - str             : string to parse
# *  - initial         : should the LP relaxation of constraint be in the initial LP?
# *  - separate        : should the constraint be separated during LP processing?
# *  - enforce         : should the constraint be enforced during node processing?
# *  - check           : should the constraint be checked for feasibility?
# *  - propagate       : should the constraint be propagated during node processing?
# *  - local           : is constraint only valid locally?
# *  - modifiable      : is constraint modifiable (subject to column generation)?
# *  - dynamic         : is constraint subject to aging?
# *  - removable       : should the relaxation be removed from the LP due to aging or cleanup?
# *  - stickingatnode  : should the constraint always be kept at the node where it was added, even
# *                      if it may be moved to a more global node?
# *  output:
# *  - success         : pointer to store whether the parsing was successful or not
# */
# Skipping MacroDefinition: SCIP_DECL_CONSPARSE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * cons , const char * name , const char * str , SCIP_Bool initial , SCIP_Bool separate , SCIP_Bool enforce , SCIP_Bool check , SCIP_Bool propagate , SCIP_Bool local , SCIP_Bool modifiable , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool stickingatnode , SCIP_Bool * success ) /** constraint method of constraint handler which returns the variables (if possible)
# *
# *  The constraint handler can (this callback is optional) provide this callback to return the variables which are
# *  involved in that particular constraint. If this is possible, the variables should be copyied into the variables
# *  array and the success pointers has to be set to TRUE. Otherwise the success has to be set FALSE or the callback
# *  should not be implemented.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : the constraint that should return its variable data
# *  - varssize        : available slots in vars array which is needed to check if the array is large enough
# *
# *  output:
# *  - vars            : array to store/copy the involved variables of the constraint
# *  - success         : pointer to store whether the variables are successfully copied
# */
# Skipping MacroDefinition: SCIP_DECL_CONSGETVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_VAR * * vars , int varssize , SCIP_Bool * success ) /** constraint method of constraint handler which returns the number of variables (if possible)
# *
# *  The constraint handler can (this callback is optional) provide this callback to return the number variable which are
# *  involved in that particular constraint. If this is not possible, the success pointers has to be set to FALSE or the
# *  callback should not be implemented.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - cons            : constraint for which the number of variables is wanted
# *
# *  output:
# *  - nvars           : pointer to store the number of variables
# *  - success         : pointer to store whether the constraint successfully returned the number of variables
# */
# Skipping MacroDefinition: SCIP_DECL_CONSGETNVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , int * nvars , SCIP_Bool * success ) /** constraint handler method to suggest dive bound changes during the generic diving algorithm
# *
# *  This callback is used inside the various diving heuristics of SCIP and does not affect the normal branching of the
# *  actual search. The constraint handler can provide this callback to render the current solution (even more)
# *  infeasible by suggesting one or several variable bound changes. In fact, since diving heuristics do not necessarily
# *  solve LP relaxations at every probing depth, some of the variable local bounds might already be conflicting with the
# *  solution values.  The solution is rendered infeasible by determining bound changes that should be applied to the
# *  next explored search node via SCIPaddDiveBoundChange().  An alternative in case that the preferred bound change(s)
# *  were detected infeasible must be provided.
# *
# *  The constraint handler must take care to only add bound changes that further shrink the variable domain.
# *
# *  The success pointer must be used to indicate whether the constraint handler succeeded in selecting diving bound
# *  changes. The infeasible pointer should be set to TRUE if the constraint handler found a local infeasibility.  If the
# *  constraint handler needs to select between several candidates, it may use the scoring mechanism of the diveset
# *  argument to control its choice.
# *
# *  This callback is optional.
# *
# *  @note: @p sol is usually the LP relaxation solution unless the caller of the method, usually a diving heuristic,
# *         does not solve LP relaxations at every depth
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - conshdlr        : the constraint handler itself
# *  - diveset         : diving settings for scoring
# *  - sol             : current diving solution, usually the LP relaxation solution
# *
# *  output:
# *  - success         : pointer to store whether the constraint handler succeeded to determine dive bound changes
# *  - infeasible      : pointer to store whether the constraint handler detected an infeasibility in the local node
# */
# Skipping MacroDefinition: SCIP_DECL_CONSGETDIVEBDCHGS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_DIVESET * diveset , SCIP_SOL * sol , SCIP_Bool * success , SCIP_Bool * infeasible ) #

struct SCIP_Conshdlr
end

const SCIP_CONSHDLR = Cvoid

struct SCIP_Cons
end

const SCIP_CONS = Cvoid

struct SCIP_ConshdlrData
end

const SCIP_CONSHDLRDATA = Cvoid

struct SCIP_ConsData
end

const SCIP_CONSDATA = Cvoid

struct SCIP_ConsSetChg
end

const SCIP_CONSSETCHG = Cvoid

struct SCIP_LinConsStats
end

const SCIP_LINCONSSTATS = Cvoid

# begin enum SCIP_LinConstype
const SCIP_LinConstype = UInt32
const SCIP_LINCONSTYPE_EMPTY = 0 |> UInt32
const SCIP_LINCONSTYPE_FREE = 1 |> UInt32
const SCIP_LINCONSTYPE_SINGLETON = 2 |> UInt32
const SCIP_LINCONSTYPE_AGGREGATION = 3 |> UInt32
const SCIP_LINCONSTYPE_PRECEDENCE = 4 |> UInt32
const SCIP_LINCONSTYPE_VARBOUND = 5 |> UInt32
const SCIP_LINCONSTYPE_SETPARTITION = 6 |> UInt32
const SCIP_LINCONSTYPE_SETPACKING = 7 |> UInt32
const SCIP_LINCONSTYPE_SETCOVERING = 8 |> UInt32
const SCIP_LINCONSTYPE_CARDINALITY = 9 |> UInt32
const SCIP_LINCONSTYPE_INVKNAPSACK = 10 |> UInt32
const SCIP_LINCONSTYPE_EQKNAPSACK = 11 |> UInt32
const SCIP_LINCONSTYPE_BINPACKING = 12 |> UInt32
const SCIP_LINCONSTYPE_KNAPSACK = 13 |> UInt32
const SCIP_LINCONSTYPE_INTKNAPSACK = 14 |> UInt32
const SCIP_LINCONSTYPE_MIXEDBINARY = 15 |> UInt32
const SCIP_LINCONSTYPE_GENERAL = 16 |> UInt32
# end enum SCIP_LinConstype

const SCIP_LINCONSTYPE = SCIP_LinConstype

struct SCIP_Cutpool
end

const SCIP_CUTPOOL = Cvoid

struct SCIP_Cut
end

const SCIP_CUT = Cvoid

# Skipping MacroDefinition: SCIP_DECL_DIALOGCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog ) /** destructor of dialog to free user data (called when the dialog is not captured anymore)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - dialog          : the dialog itself
# */
# Skipping MacroDefinition: SCIP_DECL_DIALOGFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog ) /** description output method of dialog
# *
# *  This method should output (usually a single line of) information describing the meaning of the dialog.
# *  The method is called, when the help menu of the parent's dialog is displayed.
# *  If no description output method is given, the description string of the dialog is displayed instead.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - *dialog         : the dialog itself
# */
# Skipping MacroDefinition: SCIP_DECL_DIALOGDESC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog ) /** execution method of dialog
# *
# *  This method is invoked, if the user selected the dialog's command name in the parent's dialog menu.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - dialoghdlr      : dialog handler to call for user interaction
# *  - dialog          : the dialog itself
# *
# *  output:
# *  - *nextdialog     : next dialog to process (or NULL to quit dialog processing)
# */
# Skipping MacroDefinition: SCIP_DECL_DIALOGEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog , SCIP_DIALOGHDLR * dialoghdlr , SCIP_DIALOG * * nextdialog ) #

struct SCIP_Dialog
end

const SCIP_DIALOG = Cvoid

struct SCIP_DialogData
end

const SCIP_DIALOGDATA = Cvoid

struct SCIP_Dialoghdlr
end

const SCIP_DIALOGHDLR = Cvoid

struct SCIP_Linelist
end

const SCIP_LINELIST = Cvoid

# Skipping MacroDefinition: SCIP_DECL_DISPCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** destructor of display column to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_DISPFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** initialization method of display column (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_DISPINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** deinitialization method of display column (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_DISPEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** solving process initialization method of display column (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The display column may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_DISPINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** solving process deinitialization method of display column (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The display column should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_DISPEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp ) /** output method of display column to output file stream 'file'
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - disp            : the display column itself
# *  - file            : file stream for output
# */
# Skipping MacroDefinition: SCIP_DECL_DISPOUTPUT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp , FILE * file ) #

# begin enum SCIP_DispStatus
const SCIP_DispStatus = UInt32
const SCIP_DISPSTATUS_OFF = 0 |> UInt32
const SCIP_DISPSTATUS_AUTO = 1 |> UInt32
const SCIP_DISPSTATUS_ON = 2 |> UInt32
# end enum SCIP_DispStatus

const SCIP_DISPSTATUS = SCIP_DispStatus

# begin enum SCIP_DispMode
const SCIP_DispMode = UInt32
const SCIP_DISPMODE_DEFAULT = 1 |> UInt32
const SCIP_DISPMODE_CONCURRENT = 2 |> UInt32
const SCIP_DISPMODE_ALL = 3 |> UInt32
# end enum SCIP_DispMode

const SCIP_DISPMODE = SCIP_DispMode

struct SCIP_Disp
end

const SCIP_DISP = Cvoid

struct SCIP_DispData
end

const SCIP_DISPDATA = Cvoid
const SCIP_DIVETYPE_NONE = UInt32(0x0000)
const SCIP_DIVETYPE_INTEGRALITY = UInt32(0x0001)
const SCIP_DIVETYPE_SOS1VARIABLE = UInt32(0x0002)

# Skipping MacroDefinition: SCIP_DECL_HEURCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** destructor of primal heuristic to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# */
# Skipping MacroDefinition: SCIP_DECL_HEURFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** initialization method of primal heuristic (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# */
# Skipping MacroDefinition: SCIP_DECL_HEURINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** deinitialization method of primal heuristic (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# */
# Skipping MacroDefinition: SCIP_DECL_HEUREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** solving process initialization method of primal heuristic (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The primal heuristic may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# */
# Skipping MacroDefinition: SCIP_DECL_HEURINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** solving process deinitialization method of primal heuristic (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The primal heuristic should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# */
# Skipping MacroDefinition: SCIP_DECL_HEUREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur ) /** execution method of primal heuristic
# *
# *  Searches for feasible primal solutions. The method is called in the node processing loop.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - heur            : the primal heuristic itself
# *  - heurtiming      : current point in the node solving loop
# *  - nodeinfeasible  : was the current node already detected to be infeasible?
# *  - result          : pointer to store the result of the heuristic call
# *
# *  possible return values for *result:
# *  - SCIP_FOUNDSOL   : at least one feasible primal solution was found
# *  - SCIP_DIDNOTFIND : the heuristic searched, but did not find a feasible solution
# *  - SCIP_DIDNOTRUN  : the heuristic was skipped
# *  - SCIP_DELAYED    : the heuristic was skipped, but should be called again as soon as possible, disregarding
# *                      its frequency
# */
# Skipping MacroDefinition: SCIP_DECL_HEUREXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur , SCIP_HEURTIMING heurtiming , SCIP_Bool nodeinfeasible , SCIP_RESULT * result ) /* callbacks for diving heuristic specific settings */
# Skipping MacroDefinition: SCIP_DECL_DIVESETGETSCORE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIVESET * diveset , SCIP_DIVETYPE divetype , SCIP_VAR * cand , SCIP_Real candsol , SCIP_Real candsfrac , SCIP_Real * score , SCIP_Bool * roundup ) #

const SCIP_DIVETYPE = UInt32

struct SCIP_Heur
end

const SCIP_HEUR = Cvoid

struct SCIP_HeurData
end

const SCIP_HEURDATA = Cvoid

struct SCIP_Diveset
end

const SCIP_DIVESET = Cvoid

struct SCIP_VGraph
end

const SCIP_VGRAPH = Cvoid

# begin enum SCIP_BranchDir
const SCIP_BranchDir = UInt32
const SCIP_BRANCHDIR_DOWNWARDS = 0 |> UInt32
const SCIP_BRANCHDIR_UPWARDS = 1 |> UInt32
const SCIP_BRANCHDIR_FIXED = 2 |> UInt32
const SCIP_BRANCHDIR_AUTO = 3 |> UInt32
# end enum SCIP_BranchDir

const SCIP_BRANCHDIR = SCIP_BranchDir

struct SCIP_History
end

const SCIP_HISTORY = Cvoid

struct SCIP_ValueHistory
end

const SCIP_VALUEHISTORY = Cvoid

struct SCIP_VBounds
end

const SCIP_VBOUNDS = Cvoid

struct SCIP_Implics
end

const SCIP_IMPLICS = Cvoid

struct SCIP_Clique
end

const SCIP_CLIQUE = Cvoid

struct SCIP_CliqueTable
end

const SCIP_CLIQUETABLE = Cvoid

struct SCIP_CliqueList
end

const SCIP_CLIQUELIST = Cvoid

# Skipping MacroDefinition: SCIP_DECL_MESSAGEOUTPUTFUNC ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg ) /** error message print method
# *
# *  This method is invoked, if SCIP wants to display an error message to the screen or a file.
# *
# *  @note This function is independent of any message handler.
# *
# *  input:
# *  - data            : data pointer
# *  - file            : file stream to print into
# *  - msg             : string to output into the file (or NULL to flush)
# */
# Skipping MacroDefinition: SCIP_DECL_ERRORPRINTING ( x ) void x ( void * data , FILE * file , const char * msg ) /** warning message print method of message handler
# *
# *  This method is invoked, if SCIP wants to display a warning message to the screen or a file.
# *
# *  input:
# *  - messagehdlr     : the message handler itself
# *  - file            : file stream to print into
# *  - msg             : string to output into the file (or NULL to flush)
# */
# Skipping MacroDefinition: SCIP_DECL_MESSAGEWARNING ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg ) /** dialog message print method of message handler
# *
# *  This method is invoked, if SCIP wants to display a dialog message to the screen or a file.
# *
# *  input:
# *  - messagehdlr     : the message handler itself
# *  - file            : file stream to print into
# *  - msg             : string to output into the file (or NULL to flush)
# */
# Skipping MacroDefinition: SCIP_DECL_MESSAGEDIALOG ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg ) /** info message print method of message handler
# *
# *  This method is invoked, if SCIP wants to display an information message to the screen or a file.
# *
# *  input:
# *  - messagehdlr     : the message handler itself
# *  - file            : file stream to print into
# *  - msg             : string to output into the file (or NULL to flush)
# */
# Skipping MacroDefinition: SCIP_DECL_MESSAGEINFO ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg ) /** destructor of message handler to free message handler data
# *
# *  This method is invoked, if SCIP wants to free a message handler.
# *
# *  input:
# *  - messagehdlr     : the message handler itself
# */
# Skipping MacroDefinition: SCIP_DECL_MESSAGEHDLRFREE ( x ) SCIP_RETCODE x ( SCIP_MESSAGEHDLR * messagehdlr ) #

# begin enum SCIP_VerbLevel
const SCIP_VerbLevel = UInt32
const SCIP_VERBLEVEL_NONE = 0 |> UInt32
const SCIP_VERBLEVEL_DIALOG = 1 |> UInt32
const SCIP_VERBLEVEL_MINIMAL = 2 |> UInt32
const SCIP_VERBLEVEL_NORMAL = 3 |> UInt32
const SCIP_VERBLEVEL_HIGH = 4 |> UInt32
const SCIP_VERBLEVEL_FULL = 5 |> UInt32
# end enum SCIP_VerbLevel

const SCIP_VERBLEVEL = SCIP_VerbLevel

struct SCIP_Messagehdlr
end

const SCIP_MESSAGEHDLR = Cvoid

struct SCIP_MessagehdlrData
end

const SCIP_MESSAGEHDLRDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_NODESELCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** destructor of node selector to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** initialization method of node selector (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** deinitialization method of node selector (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** solving process initialization method of node selector (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The node selector may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** solving process deinitialization method of node selector (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The node selector should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel ) /** node selection method of node selector
# *
# *  This method is called to select the next leaf of the branch and bound tree to be processed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# *  - selnode         : pointer to store the selected node
# *
# *  possible return values for *selnode:
# *  - NULL    : problem is solved, because tree is empty
# *  - non-NULL: node to be solved next
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELSELECT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel , SCIP_NODE * * selnode ) /** node comparison method of node selector
# *
# *  This method is called to compare two nodes regarding their order in the node priority queue.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - nodesel         : the node selector itself
# *  - node1           : first node to compare
# *  - node2           : second node to compare
# *
# *  possible return values:
# *  - value < 0: node1 comes before (is better than) node2
# *  - value = 0: both nodes are equally good
# *  - value > 0: node2 comes after (is worse than) node2
# */
# Skipping MacroDefinition: SCIP_DECL_NODESELCOMP ( x ) int x ( SCIP * scip , SCIP_NODESEL * nodesel , SCIP_NODE * node1 , SCIP_NODE * node2 ) #

struct SCIP_NodePQ
end

const SCIP_NODEPQ = Cvoid

struct SCIP_Nodesel
end

const SCIP_NODESEL = Cvoid

struct SCIP_NodeselData
end

const SCIP_NODESELDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_PRESOLCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** destructor of presolver to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** initialization method of presolver (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** deinitialization method of presolver (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** presolving initialization method of presolver (called when presolving is about to begin)
# *
# *  This method is called when the presolving process is about to begin, even if presolving is turned off.
# *  The presolver may use this call to initialize its data structures.
# *
# *  Necessary modifications that have to be performed even if presolving is turned off should be done here or in the
# *  presolving deinitialization call (SCIP_DECL_PRESOLSEXITPRE()).
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** presolving deinitialization method of presolver (called after presolving has been finished)
# *
# *  This method is called after the presolving has been finished, even if presolving is turned off.
# *  The presolver may use this call e.g. to clean up or modify its data structures.
# *
# *  Necessary modifications that have to be performed even if presolving is turned off should be done here or in the
# *  presolving initialization call (SCIP_DECL_PRESOLINITPRE()).
# *
# *  Besides necessary modifications and clean up, no time consuming operations should be performed, especially if the
# *  problem has already been solved.  Use the method SCIPgetStatus(), which in this case returns SCIP_STATUS_OPTIMAL,
# *  SCIP_STATUS_INFEASIBLE, SCIP_STATUS_UNBOUNDED, or SCIP_STATUS_INFORUNBD.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol ) /** execution method of presolver
# *
# *  The presolver should go through the variables and constraints and tighten the domains or
# *  constraints. Each tightening should increase the given total numbers of changes.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - presol          : the presolver itself
# *  - nrounds         : number of presolving rounds already done
# *  - presoltiming    : current presolving timing
# *  - nnewfixedvars   : number of variables fixed since the last call to the presolver
# *  - nnewaggrvars    : number of variables aggregated since the last call to the presolver
# *  - nnewchgvartypes : number of variable type changes since the last call to the presolver
# *  - nnewchgbds      : number of variable bounds tightened since the last call to the presolver
# *  - nnewholes       : number of domain holes added since the last call to the presolver
# *  - nnewdelconss    : number of deleted constraints since the last call to the presolver
# *  - nnewaddconss    : number of added constraints since the last call to the presolver
# *  - nnewupgdconss   : number of upgraded constraints since the last call to the presolver
# *  - nnewchgcoefs    : number of changed coefficients since the last call to the presolver
# *  - nnewchgsides    : number of changed left or right hand sides since the last call to the presolver
# *
# *  @note the counters state the changes since the last call including the changes of this presolver during its last
# *        last call
# *
# *  @note if the presolver uses dual information it is nesassary to check via calling SCIPallowDualReds if dual
# *        reductions are allowed.
# *
# *  input/output:
# *  - nfixedvars      : pointer to total number of variables fixed of all presolvers
# *  - naggrvars       : pointer to total number of variables aggregated of all presolvers
# *  - nchgvartypes    : pointer to total number of variable type changes of all presolvers
# *  - nchgbds         : pointer to total number of variable bounds tightened of all presolvers
# *  - naddholes       : pointer to total number of domain holes added of all presolvers
# *  - ndelconss       : pointer to total number of deleted constraints of all presolvers
# *  - naddconss       : pointer to total number of added constraints of all presolvers
# *  - nupgdconss      : pointer to total number of upgraded constraints of all presolvers
# *  - nchgcoefs       : pointer to total number of changed coefficients of all presolvers
# *  - nchgsides       : pointer to total number of changed left/right hand sides of all presolvers
# *
# *  output:
# *  - result          : pointer to store the result of the presolving call
# *
# *  possible return values for *result:
# *  - SCIP_UNBOUNDED  : at least one variable is not bounded by any constraint in obj. direction -> problem is unbounded
# *  - SCIP_CUTOFF     : at least one constraint is infeasible in the variable's bounds -> problem is infeasible
# *  - SCIP_SUCCESS    : the presolver found a reduction
# *  - SCIP_DIDNOTFIND : the presolver searched, but did not find a presolving change
# *  - SCIP_DIDNOTRUN  : the presolver was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result ) #

struct SCIP_Presol
end

const SCIP_PRESOL = Cvoid

struct SCIP_PresolData
end

const SCIP_PRESOLDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_PRICERCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_Bool * valid ) /** destructor of variable pricer to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRICERFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer ) /** initialization method of variable pricer (called after problem was transformed and pricer is active)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRICERINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer ) /** deinitialization method of variable pricer (called before transformed problem is freed and pricer is active)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRICEREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer ) /** solving process initialization method of variable pricer (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The variable pricer may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRICERINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer ) /** solving process deinitialization method of variable pricer (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The variable pricer should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# */
# Skipping MacroDefinition: SCIP_DECL_PRICEREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer ) /** reduced cost pricing method of variable pricer for feasible LPs
# *
# *  Searches for variables that can contribute to improve the current LP's solution value.
# *  In standard branch-and-price, these are variables with negative dual feasibility, that is negative
# *  reduced costs for non-negative variables, positive reduced costs for non-positive variables,
# *  and non-zero reduced costs for variables that can be negative and positive.
# *
# *  The method is called in the LP solving loop after an LP was proven to be feasible.
# *
# *  Whenever the pricer finds a variable with negative dual feasibility, it should call SCIPcreateVar()
# *  and SCIPaddPricedVar() to add the variable to the problem. Furthermore, it should call the appropriate
# *  methods of the constraint handlers to add the necessary variable entries to the constraints.
# *
# *  In the usual case that the pricer either adds a new variable or ensures that there are no further variables with
# *  negative dual feasibility, the result pointer should be set to SCIP_SUCCESS. Only if the pricer aborts pricing
# *  without creating a new variable, but there might exist additional variables with negative dual feasibility, the
# *  result pointer should be set to SCIP_DIDNOTRUN.  In this case, which sometimes is referred to as "early branching",
# *  the lp solution will not be used as a lower bound. The pricer can, however, store a valid lower bound in the
# *  lowerbound pointer.  If you use your own branching rule (e.g., to branch on constraints), make sure that it is able
# *  to branch on pseudo solutions. Otherwise, SCIP will use its default branching rules (which all branch on
# *  variables). This could disturb the pricing problem or branching might not even be possible, e.g., if all yet created
# *  variables have already been fixed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# *  - lowerbound      : pointer to store a lower bound found by the pricer
# *  - stopearly       : should pricing be stopped, although new variables were added? (doing early branching)
# *  - result          : pointer to store the result of the pricer call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : at least one improving variable was found, or it is ensured that no such variable exists
# *  - SCIP_DIDNOTRUN  : the pricing process was aborted by the pricer, there is no guarantee that the current LP solution is
# *                      optimal
# *
# */
# Skipping MacroDefinition: SCIP_DECL_PRICERREDCOST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_Real * lowerbound , SCIP_Bool * stopearly , SCIP_RESULT * result ) /** Farkas pricing method of variable pricer for infeasible LPs
# *
# *  Searches for variables that can contribute to the feasibility of the current LP.
# *  In standard branch-and-price, these are variables with positive Farkas values:
# *
# *  The LP was proven infeasible, so we have an infeasibility proof by the dual Farkas multipliers y.
# *  With the values of y, an implicit inequality  y^T A x >= y^T b  is associated, with b given
# *  by the sides of the LP rows and the sign of y:
# *   - if y_i is positive, b_i is the left hand side of the row,
# *   - if y_i is negative, b_i is the right hand side of the row.
# *
# *  y is chosen in a way, such that the valid inequality  y^T A x >= y^T b  is violated by all x,
# *  especially by the (for this inequality least infeasible solution) x' defined by 
# *     x'_i := ub_i, if y^T A_i >= 0
# *     x'_i := lb_i, if y^T A_i < 0.
# *  Pricing in this case means to add variables i with positive Farkas value, i.e. y^T A_i x'_i > 0.
# *
# *  The method is called in the LP solving loop after an LP was proven to be infeasible.
# *
# *  Whenever the pricer finds a variable with positive Farkas value, it should call SCIPcreateVar()
# *  and SCIPaddPricedVar() to add the variable to the problem. Furthermore, it should call the appropriate
# *  methods of the constraint handlers to add the necessary variable entries to the constraints.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - pricer          : the variable pricer itself
# *  - result          : pointer to store the result of the pricer call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : at least one variable was found, which can contribute to the feasibility of the current LP,
# *                      or it is ensured that no such variable exists
# *  - SCIP_DIDNOTRUN  : the pricing process was aborted by the pricer, there is no guarantee that the current LP is indeed infeasible
# */
# Skipping MacroDefinition: SCIP_DECL_PRICERFARKAS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_RESULT * result ) #

struct SCIP_Pricer
end

const SCIP_PRICER = Cvoid

struct SCIP_PricerData
end

const SCIP_PRICERDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_PROPCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** destructor of propagator to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** initialization method of propagator (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** deinitialization method of propagator (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** presolving initialization method of propagator (called when presolving is about to begin)
# *
# *  This method is called when the presolving process is about to begin, even if presolving is turned off.  The
# *  propagator may use this call to initialize its presolving data, before the presolving process begins.
# *
# *  Necessary modifications that have to be performed even if presolving is turned off should be done here or in the
# *  presolving deinitialization call (SCIP_DECL_PROPEXITPRE()).
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** presolving deinitialization method of propagator (called after presolving has been finished)
# *
# *  This method is called after the presolving has been finished, even if presolving is turned off.
# *  The propagator may use this call e.g. to clean up its presolving data.
# *
# *  Besides necessary modifications and clean up, no time consuming operations should be performed, especially if the
# *  problem has already been solved.  Use the method SCIPgetStatus(), which in this case returns SCIP_STATUS_OPTIMAL,
# *  SCIP_STATUS_INFEASIBLE, SCIP_STATUS_UNBOUNDED, or SCIP_STATUS_INFORUNBD.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** solving process initialization method of propagator (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The propagator may use this call to initialize its branch and bound specific data.
# *
# *  Besides necessary modifications and clean up, no time consuming operations should be performed, especially if the
# *  problem has already been solved.  Use the method SCIPgetStatus(), which in this case returns SCIP_STATUS_OPTIMAL,
# *  SCIP_STATUS_INFEASIBLE, SCIP_STATUS_UNBOUNDED, or SCIP_STATUS_INFORUNBD.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# */
# Skipping MacroDefinition: SCIP_DECL_PROPINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop ) /** solving process deinitialization method of propagator (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The propagator should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# *  - restart         : was this exit solve call triggered by a restart?
# */
# Skipping MacroDefinition: SCIP_DECL_PROPEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_Bool restart ) /** presolving method of propagator
# *
# *  The presolver should go through the variables and constraints and tighten the domains or
# *  constraints. Each tightening should increase the given total numbers of changes.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# *  - nrounds         : number of presolving rounds already done
# *  - presoltiming    : current presolving timing
# *  - nnewfixedvars   : number of variables fixed since the last call to the presolving method
# *  - nnewaggrvars    : number of variables aggregated since the last call to the presolving method
# *  - nnewchgvartypes : number of variable type changes since the last call to the presolving method
# *  - nnewchgbds      : number of variable bounds tightened since the last call to the presolving method
# *  - nnewholes       : number of domain holes added since the last call to the presolving method
# *  - nnewdelconss    : number of deleted constraints since the last call to the presolving method
# *  - nnewaddconss    : number of added constraints since the last call to the presolving method
# *  - nnewupgdconss   : number of upgraded constraints since the last call to the presolving method
# *  - nnewchgcoefs    : number of changed coefficients since the last call to the presolving method
# *  - nnewchgsides    : number of changed left or right hand sides since the last call to the presolving method
# *
# *  @note the counters state the changes since the last call including the changes of this presolving method during its
# *        last call
# *
# *  @note if the propagator uses dual information for presolving it is nesassary to check via calling SCIPallowDualReds
# *        if dual reductions are allowed.
# *
# *  input/output:
# *  - nfixedvars      : pointer to total number of variables fixed of all presolvers
# *  - naggrvars       : pointer to total number of variables aggregated of all presolvers
# *  - nchgvartypes    : pointer to total number of variable type changes of all presolvers
# *  - nchgbds         : pointer to total number of variable bounds tightened of all presolvers
# *  - naddholes       : pointer to total number of domain holes added of all presolvers
# *  - ndelconss       : pointer to total number of deleted constraints of all presolvers
# *  - naddconss       : pointer to total number of added constraints of all presolvers
# *  - nupgdconss      : pointer to total number of upgraded constraints of all presolvers
# *  - nchgcoefs       : pointer to total number of changed coefficients of all presolvers
# *  - nchgsides       : pointer to total number of changed left/right hand sides of all presolvers
# *
# *  output:
# *  - result          : pointer to store the result of the presolving call
# *
# *  possible return values for *result:
# *  - SCIP_UNBOUNDED  : at least one variable is not bounded by any constraint in obj. direction -> problem is unbounded
# *  - SCIP_CUTOFF     : at least one constraint is infeasible in the variable's bounds -> problem is infeasible
# *  - SCIP_SUCCESS    : the presolving method found a reduction
# *  - SCIP_DIDNOTFIND : the presolving method searched, but did not find a presolving change
# *  - SCIP_DIDNOTRUN  : the presolving method was skipped
# *  - SCIP_DELAYED    : the presolving method was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_PROPPRESOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result ) /** execution method of propagator
# *
# *  Searches for domain propagations. The method is called in the node processing loop.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# *  - proptiming      : current point in the node solving loop
# *  - result          : pointer to store the result of the propagation call
# *
# *  possible return values for *result:
# *  - SCIP_CUTOFF     : the current node is infeasible for the current domains
# *  - SCIP_REDUCEDDOM : at least one domain reduction was found
# *  - SCIP_DIDNOTFIND : the propagator searched, but did not find a domain reduction
# *  - SCIP_DIDNOTRUN  : the propagator was skipped
# *  - SCIP_DELAYED    : the propagator was skipped, but should be called again
# *  - SCIP_DELAYNODE  : the current node should be postponed (return value only valid for BEFORELP propagation)
# */
# Skipping MacroDefinition: SCIP_DECL_PROPEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_PROPTIMING proptiming , SCIP_RESULT * result ) /** propagation conflict resolving method of propagator
# *
# *  This method is called during conflict analysis. If the propagator wants to support conflict analysis,
# *  it should call SCIPinferVarLbProp() or SCIPinferVarUbProp() in domain propagation instead of SCIPchgVarLb() or
# *  SCIPchgVarUb() in order to deduce bound changes on variables.
# *  In the SCIPinferVarLbProp() and SCIPinferVarUbProp() calls, the propagator provides a pointer to itself
# *  and an integer value "inferinfo" that can be arbitrarily chosen.
# *  The propagation conflict resolving method can then be implemented, to provide a "reasons" for the bound
# *  changes, i.e. the bounds of variables at the time of the propagation, that forced the propagator to set the
# *  conflict variable's bound to its current value. It can use the "inferinfo" tag to identify its own propagation
# *  rule and thus identify the "reason" bounds. The bounds that form the reason of the assignment must then be provided
# *  by calls to SCIPaddConflictLb(), SCIPaddConflictUb(), SCIPaddConflictBd(), SCIPaddConflictRelaxedLb(),
# *  SCIPaddConflictRelaxedUb(), SCIPaddConflictRelaxedBd(), and/or SCIPaddConflictBinvar() in the propagation conflict
# *  resolving method.
# *
# *  See the description of the propagation conflict resolving method of constraint handlers for further details.
# *
# *  @note if the propagtor uses dual information it is nesassary to check via calling SCIPallowDualReds and
# *        SCIPallowObjProp if dual reductions and propgation with the current cutoff bound, resp., are allowed.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - prop            : the propagator itself
# *  - infervar        : the conflict variable whose bound change has to be resolved
# *  - inferinfo       : the user information passed to the corresponding SCIPinferVarLbProp() or SCIPinferVarUbProp() call
# *  - boundtype       : the type of the changed bound (lower or upper bound)
# *  - bdchgidx        : the index of the bound change, representing the point of time where the change took place
# *  - relaxedbd       : the relaxed bound which is sufficient to be explained
# *
# *  output:
# *  - result          : pointer to store the result of the propagation conflict resolving call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : the conflicting bound change has been successfully resolved by adding all reason bounds
# *  - SCIP_DIDNOTFIND : the conflicting bound change could not be resolved and has to be put into the conflict set
# *
# *  @note it is sufficient to explain/resolve the relaxed bound
# */
# Skipping MacroDefinition: SCIP_DECL_PROPRESPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_VAR * infervar , int inferinfo , SCIP_BOUNDTYPE boundtype , SCIP_BDCHGIDX * bdchgidx , SCIP_Real relaxedbd , SCIP_RESULT * result ) #

struct SCIP_Prop
end

const SCIP_PROP = Cvoid

struct SCIP_PropData
end

const SCIP_PROPDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_READERCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader ) /** destructor of reader to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - reader          : the reader itself
# */
# Skipping MacroDefinition: SCIP_DECL_READERFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader ) /** problem reading method of reader
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - reader          : the reader itself
# *  - filename        : full path and name of file to read, or NULL if stdin should be used
# *  - result          : pointer to store the result of the file reading call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : the reader read the file correctly and created an appropriate problem
# *  - SCIP_DIDNOTRUN  : the reader is not responsible for given input file
# *
# *  If the reader detected an error in the input file, it should return with RETCODE SCIP_READERROR or SCIP_NOFILE.
# */
# Skipping MacroDefinition: SCIP_DECL_READERREAD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader , const char * filename , SCIP_RESULT * result ) /** problem writing method of reader; NOTE: if the parameter "genericnames" is TRUE, then
# *  SCIP already set all variable and constraint names to generic names; therefore, this
# *  method should always use SCIPvarGetName() and SCIPconsGetName(); 
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - reader          : the reader itself
# *  - file            : output file, or NULL if standard output should be used
# *  - name            : problem name
# *  - probdata        : user problem data set by the reader
# *  - transformed     : TRUE iff problem is the transformed problem
# *  - objsense        : objective sense
# *  - objscale        : scalar applied to objective function; external objective value is
#                        extobj = objsense * objscale * (intobj + objoffset)
# *  - objoffset       : objective offset from bound shifting and fixing 
# *  - vars            : array with active variables ordered binary, integer, implicit, continuous 
# *  - nvars           : number of active variables in the problem
# *  - nbinvars        : number of binary variables
# *  - nintvars        : number of general integer variables
# *  - nimplvars       : number of implicit integer variables 
# *  - ncontvars;      : number of continuous variables
# *  - fixedvars       : array with fixed and aggregated variables
# *  - nfixedvars      : number of fixed and aggregated variables in the problem
# *  - startnvars      : number of variables existing when problem solving started
# *  - conss           : array with constraints of the problem
# *  - nconss          : number of constraints in the problem
# *  - maxnconss       : maximum number of constraints existing at the same time 
# *  - startnconss     : number of constraints existing when problem solving started
# *  - genericnames    : using generic variable and constraint names?
# *  - result          : pointer to store the result of the file reading call
# *
# *  possible return values for *result:
# *  - SCIP_SUCCESS    : the reader wrote the file correctly
# *  - SCIP_DIDNOTRUN  : the reader is not responsible for given input file
# *
# *  If the reader detected an error while writing the output file, it should return with RETCODE SCIP_WRITEERROR 
# */
# Skipping MacroDefinition: SCIP_DECL_READERWRITE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader , FILE * file , const char * name , SCIP_PROBDATA * probdata , SCIP_Bool transformed , SCIP_OBJSENSE objsense , SCIP_Real objscale , SCIP_Real objoffset , SCIP_VAR * * vars , int nvars , int nbinvars , int nintvars , int nimplvars , int ncontvars , SCIP_VAR * * fixedvars , int nfixedvars , int startnvars , SCIP_CONS * * conss , int nconss , int maxnconss , int startnconss , SCIP_Bool genericnames , SCIP_RESULT * result ) #

struct SCIP_Reader
end

const SCIP_READER = Cvoid

struct SCIP_ReaderData
end

const SCIP_READERDATA = Cvoid

# Skipping MacroDefinition: SCIP_DECL_RELAXCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** destructor of relaxator to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** initialization method of relaxator (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** deinitialization method of relaxator (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** solving process initialization method of relaxator (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The relaxator may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** solving process deinitialization method of relaxator (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The relaxator should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax ) /** execution method of relaxator
# *
# *  The method is called in the node processing loop. It solves the current subproblem's relaxation.
# *  Like the LP relaxation, the relaxator should only operate on COLUMN variables.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - relax           : the relaxator itself
# *  - lowerbound      : pointer to store a lowerbound for the current node
# *  - result          : pointer to store the result of the relaxation call
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated, and the relaxator should not be called again on the
# *                      same relaxation
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced, and the relaxator should not be called again on the same
# *                      relaxation
# *  - SCIP_SEPARATED  : a cutting plane was generated, and the relaxator should not be called again on the same relaxation
# *  - SCIP_SUCCESS    : the relaxator solved the relaxation and should not be called again on the same relaxation
# *  - SCIP_SUSPENDED  : the relaxator interrupted its solving process to wait for additional input (e.g. cutting
# *                      planes); however, it is able to continue the solving in order to improve the dual bound
# *  - SCIP_DIDNOTRUN  : the relaxator was skipped
# */
# Skipping MacroDefinition: SCIP_DECL_RELAXEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax , SCIP_Real * lowerbound , SCIP_RESULT * result ) #

struct SCIP_Relax
end

const SCIP_RELAX = Cvoid

struct SCIP_Relaxation
end

const SCIP_RELAXATION = Cvoid

struct SCIP_RelaxData
end

const SCIP_RELAXDATA = Cvoid

struct SCIP_Reopt
end

const SCIP_REOPT = Cvoid

struct SCIP_SolTree
end

const SCIP_SOLTREE = Cvoid

struct SCIP_SolNode
end

const SCIP_SOLNODE = Cvoid

struct SCIP_ReoptTree
end

const SCIP_REOPTTREE = Cvoid

struct SCIP_ReoptNode
end

const SCIP_REOPTNODE = Cvoid
const SCIP_REPRESENTATIVE = Cvoid

struct SCIP_ReoptConsData
end

const SCIP_REOPTCONSDATA = Cvoid

# begin enum SCIP_ReoptType
const SCIP_ReoptType = UInt32
const SCIP_REOPTTYPE_NONE = 0 |> UInt32
const SCIP_REOPTTYPE_TRANSIT = 1 |> UInt32
const SCIP_REOPTTYPE_INFSUBTREE = 2 |> UInt32
const SCIP_REOPTTYPE_STRBRANCHED = 3 |> UInt32
const SCIP_REOPTTYPE_LOGICORNODE = 4 |> UInt32
const SCIP_REOPTTYPE_LEAF = 5 |> UInt32
const SCIP_REOPTTYPE_PRUNED = 6 |> UInt32
const SCIP_REOPTTYPE_FEASIBLE = 7 |> UInt32
# end enum SCIP_ReoptType

const SCIP_REOPTTYPE = SCIP_ReoptType

# begin enum Reopt_ConsType
const Reopt_ConsType = UInt32
const REOPT_CONSTYPE_INFSUBTREE = 0 |> UInt32
const REOPT_CONSTYPE_DUALREDS = 1 |> UInt32
const REOPT_CONSTYPE_CUT = 2 |> UInt32
const REOPT_CONSTYPE_UNKNOWN = 3 |> UInt32
# end enum Reopt_ConsType

const REOPT_CONSTYPE = Reopt_ConsType

# Skipping MacroDefinition: SCIP_DECL_SEPACOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** destructor of separator to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** initialization method of separator (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** deinitialization method of separator (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** solving process initialization method of separator (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The separator may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** solving process deinitialization method of separator (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The separator should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa ) /** LP solution separation method of separator
# *
# *  Searches for cutting planes that separate the current LP solution. The method is called in the LP solving loop,
# *  which means that a valid LP solution exists.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# *  - result          : pointer to store the result of the separation call
# *  - allowlocal      : should the separator allow local cuts?
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_NEWROUND   : a cutting plane was generated and a new separation round should immediately start
# *  - SCIP_DIDNOTFIND : the separator searched, but did not find domain reductions, cutting planes, or cut constraints
# *  - SCIP_DIDNOTRUN  : the separator was skipped
# *  - SCIP_DELAYED    : the separator was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAEXECLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa , SCIP_RESULT * result , SCIP_Bool allowlocal ) /** arbitrary primal solution separation method of separator
# *
# *  Searches for cutting planes that separate the given primal solution. The method is called outside the LP solution
# *  loop (e.g., by a relaxator or a primal heuristic), which means that there is no valid LP solution.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - sepa            : the separator itself
# *  - sol             : primal solution that should be separated
# *  - result          : pointer to store the result of the separation call
# *  - allowlocal      : should the separator allow local cuts?
# *
# *  possible return values for *result (if more than one applies, the first in the list should be used):
# *  - SCIP_CUTOFF     : the node is infeasible in the variable's bounds and can be cut off
# *  - SCIP_CONSADDED  : an additional constraint was generated
# *  - SCIP_REDUCEDDOM : a variable's domain was reduced
# *  - SCIP_SEPARATED  : a cutting plane was generated
# *  - SCIP_NEWROUND   : a cutting plane was generated and a new separation round should immediately start
# *  - SCIP_DIDNOTFIND : the separator searched, but did not find domain reductions, cutting planes, or cut constraints
# *  - SCIP_DIDNOTRUN  : the separator was skipped
# *  - SCIP_DELAYED    : the separator was skipped, but should be called again
# */
# Skipping MacroDefinition: SCIP_DECL_SEPAEXECSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa , SCIP_SOL * sol , SCIP_RESULT * result , SCIP_Bool allowlocal ) #

struct SCIP_Sepa
end

const SCIP_SEPA = Cvoid

struct SCIP_SepaData
end

const SCIP_SEPADATA = Cvoid

# begin enum SCIP_Stage
const SCIP_Stage = UInt32
const SCIP_STAGE_INIT = 0 |> UInt32
const SCIP_STAGE_PROBLEM = 1 |> UInt32
const SCIP_STAGE_TRANSFORMING = 2 |> UInt32
const SCIP_STAGE_TRANSFORMED = 3 |> UInt32
const SCIP_STAGE_INITPRESOLVE = 4 |> UInt32
const SCIP_STAGE_PRESOLVING = 5 |> UInt32
const SCIP_STAGE_EXITPRESOLVE = 6 |> UInt32
const SCIP_STAGE_PRESOLVED = 7 |> UInt32
const SCIP_STAGE_INITSOLVE = 8 |> UInt32
const SCIP_STAGE_SOLVING = 9 |> UInt32
const SCIP_STAGE_SOLVED = 10 |> UInt32
const SCIP_STAGE_EXITSOLVE = 11 |> UInt32
const SCIP_STAGE_FREETRANS = 12 |> UInt32
const SCIP_STAGE_FREE = 13 |> UInt32
# end enum SCIP_Stage

const SCIP_STAGE = SCIP_Stage

# begin enum SCIP_Setting
const SCIP_Setting = UInt32
const SCIP_UNDEFINED = 0 |> UInt32
const SCIP_DISABLED = 1 |> UInt32
const SCIP_AUTO = 2 |> UInt32
const SCIP_ENABLED = 3 |> UInt32
# end enum SCIP_Setting

const SCIP_SETTING = SCIP_Setting

struct SCIP_Set
end

const SCIP_SET = Cvoid

# begin enum SCIP_SolOrigin
const SCIP_SolOrigin = UInt32
const SCIP_SOLORIGIN_ORIGINAL = 0 |> UInt32
const SCIP_SOLORIGIN_ZERO = 1 |> UInt32
const SCIP_SOLORIGIN_LPSOL = 2 |> UInt32
const SCIP_SOLORIGIN_NLPSOL = 3 |> UInt32
const SCIP_SOLORIGIN_RELAXSOL = 4 |> UInt32
const SCIP_SOLORIGIN_PSEUDOSOL = 5 |> UInt32
const SCIP_SOLORIGIN_PARTIAL = 6 |> UInt32
const SCIP_SOLORIGIN_UNKNOWN = 7 |> UInt32
# end enum SCIP_SolOrigin

const SCIP_SOLORIGIN = SCIP_SolOrigin

struct SCIP_Sol
end

const SCIP_SOL = Cvoid

struct SCIP_Viol
end

const SCIP_VIOL = Cvoid

# begin enum SCIP_Status
const SCIP_Status = UInt32
const SCIP_STATUS_UNKNOWN = 0 |> UInt32
const SCIP_STATUS_USERINTERRUPT = 1 |> UInt32
const SCIP_STATUS_NODELIMIT = 2 |> UInt32
const SCIP_STATUS_TOTALNODELIMIT = 3 |> UInt32
const SCIP_STATUS_STALLNODELIMIT = 4 |> UInt32
const SCIP_STATUS_TIMELIMIT = 5 |> UInt32
const SCIP_STATUS_MEMLIMIT = 6 |> UInt32
const SCIP_STATUS_GAPLIMIT = 7 |> UInt32
const SCIP_STATUS_SOLLIMIT = 8 |> UInt32
const SCIP_STATUS_BESTSOLLIMIT = 9 |> UInt32
const SCIP_STATUS_RESTARTLIMIT = 10 |> UInt32
const SCIP_STATUS_OPTIMAL = 11 |> UInt32
const SCIP_STATUS_INFEASIBLE = 12 |> UInt32
const SCIP_STATUS_UNBOUNDED = 13 |> UInt32
const SCIP_STATUS_INFORUNBD = 14 |> UInt32
const SCIP_STATUS_TERMINATE = 15 |> UInt32
# end enum SCIP_Status

const SCIP_STATUS = SCIP_Status

struct SCIP_Stat
end

const SCIP_STAT = Cvoid

# begin enum SCIP_Parallelmode
const SCIP_Parallelmode = UInt32
const SCIP_PARA_OPPORTUNISTIC = 0 |> UInt32
const SCIP_PARA_DETERMINISTIC = 1 |> UInt32
# end enum SCIP_Parallelmode

const SCIP_PARALLELMODE = SCIP_Parallelmode

struct SCIP_SyncStore
end

const SCIP_SYNCSTORE = Cvoid

struct SCIP_SyncData
end

const SCIP_SYNCDATA = Cvoid

struct SCIP_BoundStore
end

const SCIP_BOUNDSTORE = Cvoid

# Skipping MacroDefinition: SCIP_DECL_TABLECOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** destructor of statistics table to free user data (called when SCIP is exiting)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the statistics table itself
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** initialization method of statistics table (called after problem was transformed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the statistics table itself
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** deinitialization method of statistics table (called before transformed problem is freed)
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the statistics table itself
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** solving process initialization method of statistics table (called when branch and bound process is about to begin)
# *
# *  This method is called when the presolving was finished and the branch and bound process is about to begin.
# *  The statistics table may use this call to initialize its branch and bound specific data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the statistics table itself
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** solving process deinitialization method of statistics table (called before branch and bound process data is freed)
# *
# *  This method is called before the branch and bound process is freed.
# *  The statistics table should use this call to clean up its branch and bound data.
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the display column itself
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table ) /** output method of statistics table to output file stream 'file'
# *
# *  input:
# *  - scip            : SCIP main data structure
# *  - table           : the statistics table itself
# *  - file            : file stream for output
# */
# Skipping MacroDefinition: SCIP_DECL_TABLEOUTPUT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table , FILE * file ) #

struct SCIP_Table
end

const SCIP_TABLE = Cvoid

struct SCIP_TableData
end

const SCIP_TABLEDATA = Cvoid

struct SCIP_Concurrent
end

const SCIP_CONCURRENT = Cvoid

struct SCIP_ConflictStore
end

const SCIP_CONFLICTSTORE = Cvoid

struct SCIP_AggrRow
end

const SCIP_AGGRROW = Cvoid

struct SCIP_Interrupt
end

const SCIP_INTERRUPT = Cvoid

struct SCIP_Matrix
end

const SCIP_MATRIX = Cvoid

struct SCIP_Mem
end

const SCIP_MEM = Cvoid

struct SCIP_Pricestore
end

const SCIP_PRICESTORE = Cvoid

struct SCIP_Primal
end

const SCIP_PRIMAL = Cvoid

# begin enum SCIP_Efficiacychoice
const SCIP_Efficiacychoice = UInt32
const SCIP_EFFICIACYCHOICE_LP = 0 |> UInt32
const SCIP_EFFICIACYCHOICE_RELAX = 1 |> UInt32
const SCIP_EFFICIACYCHOICE_NLP = 2 |> UInt32
# end enum SCIP_Efficiacychoice

const SCIP_EFFICIACYCHOICE = SCIP_Efficiacychoice

struct SCIP_SepaStore
end

const SCIP_SEPASTORE = Cvoid

# begin enum SCIP_VBCColor
const SCIP_VBCColor = Cint
const SCIP_VBCCOLOR_UNSOLVED = 3 |> Int32
const SCIP_VBCCOLOR_SOLVED = 2 |> Int32
const SCIP_VBCCOLOR_CUTOFF = 4 |> Int32
const SCIP_VBCCOLOR_CONFLICT = 15 |> Int32
const SCIP_VBCCOLOR_MARKREPROP = 11 |> Int32
const SCIP_VBCCOLOR_REPROP = 12 |> Int32
const SCIP_VBCCOLOR_SOLUTION = 14 |> Int32
const SCIP_VBCCOLOR_NONE = -1 |> Int32
# end enum SCIP_VBCColor

const SCIP_VBCCOLOR = SCIP_VBCColor

struct SCIP_Visual
end

const SCIP_VISUAL = Cvoid

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
