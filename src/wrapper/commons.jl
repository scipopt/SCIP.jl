# Automatically generated using Clang.jl wrap_c


# Skipping MacroDefinition: SCIP_DECL_BANDITFREE ( x ) SCIP_RETCODE x ( BMS_BLKMEM * blkmem , SCIP_BANDIT * bandit \
#)
# Skipping MacroDefinition: SCIP_DECL_BANDITSELECT ( x ) SCIP_RETCODE x ( SCIP_BANDIT * bandit , int * selection \
#)
# Skipping MacroDefinition: SCIP_DECL_BANDITUPDATE ( x ) SCIP_RETCODE x ( SCIP_BANDIT * bandit , int selection , SCIP_Real score \
#)
# Skipping MacroDefinition: SCIP_DECL_BANDITRESET ( x ) SCIP_RETCODE x ( BMS_BUFMEM * bufmem , SCIP_BANDIT * bandit , SCIP_Real * priorities \
#)

const SCIP_Bandit = Cvoid
const SCIP_BANDIT = SCIP_Bandit
const SCIP_BanditVTable = Cvoid
const SCIP_BANDITVTABLE = SCIP_BanditVTable
const SCIP_BanditData = Cvoid
const SCIP_BANDITDATA = SCIP_BanditData

# Skipping MacroDefinition: SCIP_DECL_BENDERSCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCREATESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , int probnumber )
# Skipping MacroDefinition: SCIP_DECL_BENDERSPRESUBSOLVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , SCIP_BENDERSENFOTYPE type , SCIP_Bool checkint , SCIP_Bool * skipsolve , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_BENDERSSOLVESUBCONVEX ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , int probnumber , SCIP_Bool onlyconvexcheck , SCIP_Real * objective , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_BENDERSSOLVESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , int probnumber , SCIP_Real * objective , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_BENDERSPOSTSOLVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_SOL * sol , SCIP_BENDERSENFOTYPE type , int * mergecands , int npriomergecands , int nmergecands , SCIP_Bool checkint , SCIP_Bool infeasible , SCIP_Bool * merged )
# Skipping MacroDefinition: SCIP_DECL_BENDERSFREESUB ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , int probnumber )
# Skipping MacroDefinition: SCIP_DECL_BENDERSGETVAR ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_VAR * var , SCIP_VAR * * mappedvar , int probnumber )

@cenum(SCIP_BendersEnfoType,
    SCIP_BENDERSENFOTYPE_LP = 1,
    SCIP_BENDERSENFOTYPE_RELAX = 2,
    SCIP_BENDERSENFOTYPE_PSEUDO = 3,
    SCIP_BENDERSENFOTYPE_CHECK = 4,
)

const SCIP_BENDERSENFOTYPE = SCIP_BendersEnfoType

@cenum(SCIP_BendersSolveLoop,
    SCIP_BENDERSSOLVELOOP_CONVEX = 0,
    SCIP_BENDERSSOLVELOOP_CIP = 1,
    SCIP_BENDERSSOLVELOOP_USERCONVEX = 2,
    SCIP_BENDERSSOLVELOOP_USERCIP = 3,
)

const SCIP_BENDERSSOLVELOOP = SCIP_BendersSolveLoop

@cenum(SCIP_BendersSubStatus,
    SCIP_BENDERSSUBSTATUS_UNKNOWN = 0,
    SCIP_BENDERSSUBSTATUS_OPTIMAL = 1,
    SCIP_BENDERSSUBSTATUS_AUXVIOL = 2,
    SCIP_BENDERSSUBSTATUS_INFEAS = 3,
)

const SCIP_BENDERSSUBSTATUS = SCIP_BendersSubStatus
const SCIP_Benders = Cvoid
const SCIP_BENDERS = SCIP_Benders
const SCIP_BendersData = Cvoid
const SCIP_BENDERSDATA = SCIP_BendersData

# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERSCUT * benderscut )
# Skipping MacroDefinition: SCIP_DECL_BENDERSCUTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BENDERS * benders , SCIP_BENDERSCUT * benderscut , SCIP_SOL * sol , int probnumber , SCIP_BENDERSENFOTYPE type , SCIP_RESULT * result )

const SCIP_Benderscut = Cvoid
const SCIP_BENDERSCUT = SCIP_Benderscut
const SCIP_BenderscutData = Cvoid
const SCIP_BENDERSCUTDATA = SCIP_BenderscutData

# Skipping MacroDefinition: SCIP_DECL_BRANCHCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule )
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECEXT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_BRANCHEXECPS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_BRANCHRULE * branchrule , SCIP_Bool allowaddcons , SCIP_RESULT * result )

const SCIP_BranchCand = Cvoid
const SCIP_BRANCHCAND = SCIP_BranchCand
const SCIP_Branchrule = Cvoid
const SCIP_BRANCHRULE = SCIP_Branchrule
const SCIP_BranchruleData = Cvoid
const SCIP_BRANCHRULEDATA = SCIP_BranchruleData

@cenum(SCIP_ClockType,
    SCIP_CLOCKTYPE_DEFAULT = 0,
    SCIP_CLOCKTYPE_CPU = 1,
    SCIP_CLOCKTYPE_WALL = 2,
)

const SCIP_CLOCKTYPE = SCIP_ClockType
const SCIP_Clock = Cvoid
const SCIP_CLOCK = SCIP_Clock
const SCIP_CPUClock = Cvoid
const SCIP_CPUCLOCK = SCIP_CPUClock
const SCIP_WallClock = Cvoid
const SCIP_WALLCLOCK = SCIP_WallClock

# Skipping MacroDefinition: SCIP_DECL_COMPRCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPRFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPRINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPRINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr )
# Skipping MacroDefinition: SCIP_DECL_COMPREXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_COMPR * compr , SCIP_RESULT * result )

const SCIP_Compr = Cvoid
const SCIP_COMPR = SCIP_Compr
const SCIP_ComprData = Cvoid
const SCIP_COMPRDATA = SCIP_ComprData

# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERCREATEINST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONCSOLVERTYPE * concsolvertype , SCIP_CONCSOLVER * concsolver )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERDESTROYINST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONCSOLVER * concsolver )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERTYPEFREEDATA ( x ) void x ( SCIP_CONCSOLVERTYPEDATA * * data )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERINITSEEDS ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , unsigned int seed )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSYNCWRITE ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_SYNCSTORE * syncstore , SCIP_SYNCDATA * syncdata , int maxcandsols , int maxsharedsols , int * nsolsshared )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSYNCREAD ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_SYNCSTORE * syncstore , SCIP_SYNCDATA * syncdata , int * nsolsrecvd , int * ntighterbnds , int * ntighterintbnds )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVEREXEC ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP_Real * solvingtime , SCIP_Longint * nlpiterations , SCIP_Longint * nnodes )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERSTOP ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver )
# Skipping MacroDefinition: SCIP_DECL_CONCSOLVERCOPYSOLVINGDATA ( x ) SCIP_RETCODE x ( SCIP_CONCSOLVER * concsolver , SCIP * scip )

const SCIP_ConcSolverType = Cvoid
const SCIP_CONCSOLVERTYPE = SCIP_ConcSolverType
const SCIP_ConcSolverTypeData = Cvoid
const SCIP_CONCSOLVERTYPEDATA = SCIP_ConcSolverTypeData
const SCIP_ConcSolver = Cvoid
const SCIP_CONCSOLVER = SCIP_ConcSolver
const SCIP_ConcSolverData = Cvoid
const SCIP_CONCSOLVERDATA = SCIP_ConcSolverData
const SCIP_Concurrent = Cvoid
const SCIP_CONCURRENT = SCIP_Concurrent

# Skipping MacroDefinition: SCIP_DECL_CONFLICTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr )
# Skipping MacroDefinition: SCIP_DECL_CONFLICTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONFLICTHDLR * conflicthdlr , SCIP_NODE * node , SCIP_NODE * validnode , SCIP_BDCHGINFO * * bdchginfos , SCIP_Real * relaxedbds , int nbdchginfos , SCIP_CONFTYPE conftype , SCIP_Bool cutoffinvolved , SCIP_Bool separate , SCIP_Bool local , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool resolved , SCIP_RESULT * result )

const SCIP_Conflicthdlr = Cvoid
const SCIP_CONFLICTHDLR = SCIP_Conflicthdlr
const SCIP_ConflicthdlrData = Cvoid
const SCIP_CONFLICTHDLRDATA = SCIP_ConflicthdlrData
const SCIP_ConflictSet = Cvoid
const SCIP_CONFLICTSET = SCIP_ConflictSet
const SCIP_ProofSet = Cvoid
const SCIP_PROOFSET = SCIP_ProofSet
const SCIP_LPBdChgs = Cvoid
const SCIP_LPBDCHGS = SCIP_LPBdChgs
const SCIP_Conflict = Cvoid
const SCIP_CONFLICT = SCIP_Conflict

@cenum(SCIP_ConflictType,
    SCIP_CONFTYPE_UNKNOWN = 0,
    SCIP_CONFTYPE_PROPAGATION = 1,
    SCIP_CONFTYPE_INFEASLP = 2,
    SCIP_CONFTYPE_BNDEXCEEDING = 3,
    SCIP_CONFTYPE_ALTINFPROOF = 4,
    SCIP_CONFTYPE_ALTBNDPROOF = 5,
)

const SCIP_CONFTYPE = SCIP_ConflictType

@cenum(SCIP_ConflictPresolStrat,
    SCIP_CONFPRES_DISABLED = 0,
    SCIP_CONFPRES_ONLYLOCAL = 1,
    SCIP_CONFPRES_ONLYGLOBAL = 2,
    SCIP_CONFPRES_BOTH = 3,
)

const SCIP_CONFPRES = SCIP_ConflictPresolStrat
const SCIP_ConflictStore = Cvoid
const SCIP_CONFLICTSTORE = SCIP_ConflictStore

# Skipping MacroDefinition: SCIP_NLINCONSTYPES ( ( int ) SCIP_LINCONSTYPE_GENERAL + 1 )
# Skipping MacroDefinition: SCIP_DECL_CONSHDLRCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_Bool * valid )
# Skipping MacroDefinition: SCIP_DECL_CONSFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr )
# Skipping MacroDefinition: SCIP_DECL_CONSINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_Bool restart )
# Skipping MacroDefinition: SCIP_DECL_CONSDELETE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_CONSDATA * * consdata )
# Skipping MacroDefinition: SCIP_DECL_CONSTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * sourcecons , SCIP_CONS * * targetcons )
# Skipping MacroDefinition: SCIP_DECL_CONSINITLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_Bool * infeasible )
# Skipping MacroDefinition: SCIP_DECL_CONSSEPALP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSSEPASOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_SOL * sol , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSENFOLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSENFORELAX ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SOL * sol , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSENFOPS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , SCIP_Bool solinfeasible , SCIP_Bool objinfeasible , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSCHECK ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , SCIP_SOL * sol , SCIP_Bool checkintegrality , SCIP_Bool checklprows , SCIP_Bool printreason , SCIP_Bool completely , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nusefulconss , int nmarkedconss , SCIP_PROPTIMING proptiming , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSPRESOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSRESPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_VAR * infervar , int inferinfo , SCIP_BOUNDTYPE boundtype , SCIP_BDCHGIDX * bdchgidx , SCIP_Real relaxedbd , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_CONSLOCK ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_LOCKTYPE locktype , int nlockspos , int nlocksneg )
# Skipping MacroDefinition: SCIP_DECL_CONSACTIVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons )
# Skipping MacroDefinition: SCIP_DECL_CONSDEACTIVE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons )
# Skipping MacroDefinition: SCIP_DECL_CONSENABLE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons )
# Skipping MacroDefinition: SCIP_DECL_CONSDISABLE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons )
# Skipping MacroDefinition: SCIP_DECL_CONSDELVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * conss , int nconss )
# Skipping MacroDefinition: SCIP_DECL_CONSPRINT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , FILE * file )
# Skipping MacroDefinition: SCIP_DECL_CONSCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONS * * cons , const char * name , SCIP * sourcescip , SCIP_CONSHDLR * sourceconshdlr , SCIP_CONS * sourcecons , SCIP_HASHMAP * varmap , SCIP_HASHMAP * consmap , SCIP_Bool initial , SCIP_Bool separate , SCIP_Bool enforce , SCIP_Bool check , SCIP_Bool propagate , SCIP_Bool local , SCIP_Bool modifiable , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool stickingatnode , SCIP_Bool global , SCIP_Bool * valid )
# Skipping MacroDefinition: SCIP_DECL_CONSPARSE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * * cons , const char * name , const char * str , SCIP_Bool initial , SCIP_Bool separate , SCIP_Bool enforce , SCIP_Bool check , SCIP_Bool propagate , SCIP_Bool local , SCIP_Bool modifiable , SCIP_Bool dynamic , SCIP_Bool removable , SCIP_Bool stickingatnode , SCIP_Bool * success )
# Skipping MacroDefinition: SCIP_DECL_CONSGETVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , SCIP_VAR * * vars , int varssize , SCIP_Bool * success )
# Skipping MacroDefinition: SCIP_DECL_CONSGETNVARS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_CONS * cons , int * nvars , SCIP_Bool * success )
# Skipping MacroDefinition: SCIP_DECL_CONSGETDIVEBDCHGS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONSHDLR * conshdlr , SCIP_DIVESET * diveset , SCIP_SOL * sol , SCIP_Bool * success , SCIP_Bool * infeasible )

const SCIP_Conshdlr = Cvoid
const SCIP_CONSHDLR = SCIP_Conshdlr
const SCIP_Cons = Cvoid
const SCIP_CONS = SCIP_Cons
const SCIP_ConshdlrData = Cvoid
const SCIP_CONSHDLRDATA = SCIP_ConshdlrData
const SCIP_ConsData = Cvoid
const SCIP_CONSDATA = SCIP_ConsData
const SCIP_ConsSetChg = Cvoid
const SCIP_CONSSETCHG = SCIP_ConsSetChg
const SCIP_LinConsStats = Cvoid
const SCIP_LINCONSSTATS = SCIP_LinConsStats

@cenum(SCIP_LinConstype,
    SCIP_LINCONSTYPE_EMPTY = 0,
    SCIP_LINCONSTYPE_FREE = 1,
    SCIP_LINCONSTYPE_SINGLETON = 2,
    SCIP_LINCONSTYPE_AGGREGATION = 3,
    SCIP_LINCONSTYPE_PRECEDENCE = 4,
    SCIP_LINCONSTYPE_VARBOUND = 5,
    SCIP_LINCONSTYPE_SETPARTITION = 6,
    SCIP_LINCONSTYPE_SETPACKING = 7,
    SCIP_LINCONSTYPE_SETCOVERING = 8,
    SCIP_LINCONSTYPE_CARDINALITY = 9,
    SCIP_LINCONSTYPE_INVKNAPSACK = 10,
    SCIP_LINCONSTYPE_EQKNAPSACK = 11,
    SCIP_LINCONSTYPE_BINPACKING = 12,
    SCIP_LINCONSTYPE_KNAPSACK = 13,
    SCIP_LINCONSTYPE_INTKNAPSACK = 14,
    SCIP_LINCONSTYPE_MIXEDBINARY = 15,
    SCIP_LINCONSTYPE_GENERAL = 16,
)

const SCIP_LINCONSTYPE = SCIP_LinConstype
const SCIP_Cutpool = Cvoid
const SCIP_CUTPOOL = SCIP_Cutpool
const SCIP_Cut = Cvoid
const SCIP_CUT = SCIP_Cut
const SCIP_AggrRow = Cvoid
const SCIP_AGGRROW = SCIP_AggrRow

# Skipping MacroDefinition: SCIP_DECL_DIALOGCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog )
# Skipping MacroDefinition: SCIP_DECL_DIALOGFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog )
# Skipping MacroDefinition: SCIP_DECL_DIALOGDESC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog )
# Skipping MacroDefinition: SCIP_DECL_DIALOGEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIALOG * dialog , SCIP_DIALOGHDLR * dialoghdlr , SCIP_DIALOG * * nextdialog )

const SCIP_Dialog = Cvoid
const SCIP_DIALOG = SCIP_Dialog
const SCIP_DialogData = Cvoid
const SCIP_DIALOGDATA = SCIP_DialogData
const SCIP_Dialoghdlr = Cvoid
const SCIP_DIALOGHDLR = SCIP_Dialoghdlr
const SCIP_Linelist = Cvoid
const SCIP_LINELIST = SCIP_Linelist

# Skipping MacroDefinition: SCIP_DECL_DISPCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp )
# Skipping MacroDefinition: SCIP_DECL_DISPOUTPUT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DISP * disp , FILE * file )

@cenum(SCIP_DispStatus,
    SCIP_DISPSTATUS_OFF = 0,
    SCIP_DISPSTATUS_AUTO = 1,
    SCIP_DISPSTATUS_ON = 2,
)

const SCIP_DISPSTATUS = SCIP_DispStatus

@cenum(SCIP_DispMode,
    SCIP_DISPMODE_DEFAULT = 1,
    SCIP_DISPMODE_CONCURRENT = 2,
    SCIP_DISPMODE_ALL = 3,
)

const SCIP_DISPMODE = SCIP_DispMode
const SCIP_Disp = Cvoid
const SCIP_DISP = SCIP_Disp
const SCIP_DispData = Cvoid
const SCIP_DISPDATA = SCIP_DispData

# Skipping MacroDefinition: SCIP_EVENTTYPE_DISABLED UINT64_C ( 0x00000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARADDED UINT64_C ( 0x00000001 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARDELETED UINT64_C ( 0x00000002 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARFIXED UINT64_C ( 0x00000004 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_VARUNLOCKED UINT64_C ( 0x00000008 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_OBJCHANGED UINT64_C ( 0x00000010 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_GLBCHANGED UINT64_C ( 0x00000020 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_GUBCHANGED UINT64_C ( 0x00000040 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_LBTIGHTENED UINT64_C ( 0x00000080 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_LBRELAXED UINT64_C ( 0x00000100 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_UBTIGHTENED UINT64_C ( 0x00000200 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_UBRELAXED UINT64_C ( 0x00000400 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_GHOLEADDED UINT64_C ( 0x00000800 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_GHOLEREMOVED UINT64_C ( 0x00001000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_LHOLEADDED UINT64_C ( 0x00002000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_LHOLEREMOVED UINT64_C ( 0x00004000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_IMPLADDED UINT64_C ( 0x00008000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_PRESOLVEROUND UINT64_C ( 0x00010000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEFOCUSED UINT64_C ( 0x00020000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEFEASIBLE UINT64_C ( 0x00040000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEINFEASIBLE UINT64_C ( 0x00080000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_NODEBRANCHED UINT64_C ( 0x00100000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_FIRSTLPSOLVED UINT64_C ( 0x00200000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_LPSOLVED UINT64_C ( 0x00400000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_POORSOLFOUND UINT64_C ( 0x00800000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_BESTSOLFOUND UINT64_C ( 0x01000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWADDEDSEPA UINT64_C ( 0x02000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWDELETEDSEPA UINT64_C ( 0x04000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWADDEDLP UINT64_C ( 0x08000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWDELETEDLP UINT64_C ( 0x10000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWCOEFCHANGED UINT64_C ( 0x20000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWCONSTCHANGED UINT64_C ( 0x40000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_ROWSIDECHANGED UINT64_C ( 0x80000000 )
# Skipping MacroDefinition: SCIP_EVENTTYPE_SYNC UINT64_C ( 0x100000000 )

const SCIP_EVENTTYPE_GBDCHANGED = SCIP_EVENTTYPE_GLBCHANGED | SCIP_EVENTTYPE_GUBCHANGED
const SCIP_EVENTTYPE_LBCHANGED = SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_LBRELAXED
const SCIP_EVENTTYPE_UBCHANGED = SCIP_EVENTTYPE_UBTIGHTENED | SCIP_EVENTTYPE_UBRELAXED
const SCIP_EVENTTYPE_BOUNDTIGHTENED = SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_UBTIGHTENED
const SCIP_EVENTTYPE_BOUNDRELAXED = SCIP_EVENTTYPE_LBRELAXED | SCIP_EVENTTYPE_UBRELAXED
const SCIP_EVENTTYPE_BOUNDCHANGED = SCIP_EVENTTYPE_LBCHANGED | SCIP_EVENTTYPE_UBCHANGED
const SCIP_EVENTTYPE_GHOLECHANGED = SCIP_EVENTTYPE_GHOLEADDED | SCIP_EVENTTYPE_GHOLEREMOVED
const SCIP_EVENTTYPE_LHOLECHANGED = SCIP_EVENTTYPE_LHOLEADDED | SCIP_EVENTTYPE_LHOLEREMOVED
const SCIP_EVENTTYPE_HOLECHANGED = SCIP_EVENTTYPE_GHOLECHANGED | SCIP_EVENTTYPE_LHOLECHANGED
const SCIP_EVENTTYPE_DOMCHANGED = SCIP_EVENTTYPE_BOUNDCHANGED | SCIP_EVENTTYPE_HOLECHANGED
const SCIP_EVENTTYPE_VARCHANGED = (((((SCIP_EVENTTYPE_VARFIXED | SCIP_EVENTTYPE_VARUNLOCKED) | SCIP_EVENTTYPE_OBJCHANGED) | SCIP_EVENTTYPE_GBDCHANGED) | SCIP_EVENTTYPE_DOMCHANGED) | SCIP_EVENTTYPE_IMPLADDED) | SCIP_EVENTTYPE_VARDELETED
const SCIP_EVENTTYPE_VAREVENT = SCIP_EVENTTYPE_VARADDED | SCIP_EVENTTYPE_VARCHANGED
const SCIP_EVENTTYPE_NODESOLVED = (SCIP_EVENTTYPE_NODEFEASIBLE | SCIP_EVENTTYPE_NODEINFEASIBLE) | SCIP_EVENTTYPE_NODEBRANCHED
const SCIP_EVENTTYPE_NODEEVENT = SCIP_EVENTTYPE_NODEFOCUSED | SCIP_EVENTTYPE_NODESOLVED
const SCIP_EVENTTYPE_LPEVENT = SCIP_EVENTTYPE_FIRSTLPSOLVED | SCIP_EVENTTYPE_LPSOLVED
const SCIP_EVENTTYPE_SOLFOUND = SCIP_EVENTTYPE_POORSOLFOUND | SCIP_EVENTTYPE_BESTSOLFOUND
const SCIP_EVENTTYPE_SOLEVENT = SCIP_EVENTTYPE_SOLFOUND
const SCIP_EVENTTYPE_ROWCHANGED = (SCIP_EVENTTYPE_ROWCOEFCHANGED | SCIP_EVENTTYPE_ROWCONSTCHANGED) | SCIP_EVENTTYPE_ROWSIDECHANGED
const SCIP_EVENTTYPE_ROWEVENT = (((SCIP_EVENTTYPE_ROWADDEDSEPA | SCIP_EVENTTYPE_ROWDELETEDSEPA) | SCIP_EVENTTYPE_ROWADDEDLP) | SCIP_EVENTTYPE_ROWDELETEDLP) | SCIP_EVENTTYPE_ROWCHANGED
const SCIP_EVENTTYPE_FORMAT = PRIx64

# Skipping MacroDefinition: SCIP_DECL_EVENTCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr )
# Skipping MacroDefinition: SCIP_DECL_EVENTDELETE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr , SCIP_EVENTDATA * * eventdata )
# Skipping MacroDefinition: SCIP_DECL_EVENTEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EVENTHDLR * eventhdlr , SCIP_EVENT * event , SCIP_EVENTDATA * eventdata )

const SCIP_EVENTTYPE = UInt64
const SCIP_Eventhdlr = Cvoid
const SCIP_EVENTHDLR = SCIP_Eventhdlr
const SCIP_EventhdlrData = Cvoid
const SCIP_EVENTHDLRDATA = SCIP_EventhdlrData
const SCIP_Event = Cvoid
const SCIP_EVENT = SCIP_Event
const SCIP_EventVarAdded = Cvoid
const SCIP_EVENTVARADDED = SCIP_EventVarAdded
const SCIP_EventVarDeleted = Cvoid
const SCIP_EVENTVARDELETED = SCIP_EventVarDeleted
const SCIP_EventVarFixed = Cvoid
const SCIP_EVENTVARFIXED = SCIP_EventVarFixed
const SCIP_EventVarUnlocked = Cvoid
const SCIP_EVENTVARUNLOCKED = SCIP_EventVarUnlocked
const SCIP_EventObjChg = Cvoid
const SCIP_EVENTOBJCHG = SCIP_EventObjChg
const SCIP_EventBdChg = Cvoid
const SCIP_EVENTBDCHG = SCIP_EventBdChg
const SCIP_EventHole = Cvoid
const SCIP_EVENTHOLE = SCIP_EventHole
const SCIP_EventImplAdd = Cvoid
const SCIP_EVENTIMPLADD = SCIP_EventImplAdd
const SCIP_EventRowAddedSepa = Cvoid
const SCIP_EVENTROWADDEDSEPA = SCIP_EventRowAddedSepa
const SCIP_EventRowDeletedSepa = Cvoid
const SCIP_EVENTROWDELETEDSEPA = SCIP_EventRowDeletedSepa
const SCIP_EventRowAddedLP = Cvoid
const SCIP_EVENTROWADDEDLP = SCIP_EventRowAddedLP
const SCIP_EventRowDeletedLP = Cvoid
const SCIP_EVENTROWDELETEDLP = SCIP_EventRowDeletedLP
const SCIP_EventRowCoefChanged = Cvoid
const SCIP_EVENTROWCOEFCHANGED = SCIP_EventRowCoefChanged
const SCIP_EventRowConstChanged = Cvoid
const SCIP_EVENTROWCONSTCHANGED = SCIP_EventRowConstChanged
const SCIP_EventRowSideChanged = Cvoid
const SCIP_EVENTROWSIDECHANGED = SCIP_EventRowSideChanged
const SCIP_EventData = Cvoid
const SCIP_EVENTDATA = SCIP_EventData
const SCIP_EventFilter = Cvoid
const SCIP_EVENTFILTER = SCIP_EventFilter
const SCIP_EventQueue = Cvoid
const SCIP_EVENTQUEUE = SCIP_EventQueue
const SCIP_DIVETYPE_NONE = UInt32(0x0000)
const SCIP_DIVETYPE_INTEGRALITY = UInt32(0x0001)
const SCIP_DIVETYPE_SOS1VARIABLE = UInt32(0x0002)

# Skipping MacroDefinition: SCIP_DECL_HEURCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEURFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEURINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEUREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEURINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEUREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur )
# Skipping MacroDefinition: SCIP_DECL_HEUREXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_HEUR * heur , SCIP_HEURTIMING heurtiming , SCIP_Bool nodeinfeasible , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_DIVESETGETSCORE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_DIVESET * diveset , SCIP_DIVETYPE divetype , SCIP_VAR * cand , SCIP_Real candsol , SCIP_Real candsfrac , SCIP_Real * score , SCIP_Bool * roundup )

const SCIP_DIVETYPE = UInt32
const SCIP_Heur = Cvoid
const SCIP_HEUR = SCIP_Heur
const SCIP_HeurData = Cvoid
const SCIP_HEURDATA = SCIP_HeurData
const SCIP_Diveset = Cvoid
const SCIP_DIVESET = SCIP_Diveset
const SCIP_VGraph = Cvoid
const SCIP_VGRAPH = SCIP_VGraph

@cenum(SCIP_BranchDir,
    SCIP_BRANCHDIR_DOWNWARDS = 0,
    SCIP_BRANCHDIR_UPWARDS = 1,
    SCIP_BRANCHDIR_FIXED = 2,
    SCIP_BRANCHDIR_AUTO = 3,
)

const SCIP_BRANCHDIR = SCIP_BranchDir
const SCIP_History = Cvoid
const SCIP_HISTORY = SCIP_History
const SCIP_ValueHistory = Cvoid
const SCIP_VALUEHISTORY = SCIP_ValueHistory
const SCIP_VBounds = Cvoid
const SCIP_VBOUNDS = SCIP_VBounds
const SCIP_Implics = Cvoid
const SCIP_IMPLICS = SCIP_Implics
const SCIP_Clique = Cvoid
const SCIP_CLIQUE = SCIP_Clique
const SCIP_CliqueTable = Cvoid
const SCIP_CLIQUETABLE = SCIP_CliqueTable
const SCIP_CliqueList = Cvoid
const SCIP_CLIQUELIST = SCIP_CliqueList
const SCIP_Interrupt = Cvoid
const SCIP_INTERRUPT = SCIP_Interrupt

@cenum(SCIP_LPSolStat,
    SCIP_LPSOLSTAT_NOTSOLVED = 0,
    SCIP_LPSOLSTAT_OPTIMAL = 1,
    SCIP_LPSOLSTAT_INFEASIBLE = 2,
    SCIP_LPSOLSTAT_UNBOUNDEDRAY = 3,
    SCIP_LPSOLSTAT_OBJLIMIT = 4,
    SCIP_LPSOLSTAT_ITERLIMIT = 5,
    SCIP_LPSOLSTAT_TIMELIMIT = 6,
    SCIP_LPSOLSTAT_ERROR = 7,
)

const SCIP_LPSOLSTAT = SCIP_LPSolStat

@cenum(SCIP_BoundType,
    SCIP_BOUNDTYPE_LOWER = 0,
    SCIP_BOUNDTYPE_UPPER = 1,
)

const SCIP_BOUNDTYPE = SCIP_BoundType

@cenum(SCIP_SideType,
    SCIP_SIDETYPE_LEFT = 0,
    SCIP_SIDETYPE_RIGHT = 1,
)

const SCIP_SIDETYPE = SCIP_SideType

@cenum(SCIP_RowOriginType,
    SCIP_ROWORIGINTYPE_UNSPEC = 0,
    SCIP_ROWORIGINTYPE_CONS = 1,
    SCIP_ROWORIGINTYPE_SEPA = 2,
    SCIP_ROWORIGINTYPE_REOPT = 3,
)

const SCIP_ROWORIGINTYPE = SCIP_RowOriginType

@cenum(SCIP_LPAlgo,
    SCIP_LPALGO_PRIMALSIMPLEX = 0,
    SCIP_LPALGO_DUALSIMPLEX = 1,
    SCIP_LPALGO_BARRIER = 2,
    SCIP_LPALGO_BARRIERCROSSOVER = 3,
)

const SCIP_LPALGO = SCIP_LPAlgo
const SCIP_ColSolVals = Cvoid
const SCIP_COLSOLVALS = SCIP_ColSolVals
const SCIP_RowSolVals = Cvoid
const SCIP_ROWSOLVALS = SCIP_RowSolVals
const SCIP_LpSolVals = Cvoid
const SCIP_LPSOLVALS = SCIP_LpSolVals
const SCIP_Col = Cvoid
const SCIP_COL = SCIP_Col
const SCIP_Row = Cvoid
const SCIP_ROW = SCIP_Row
const SCIP_Lp = Cvoid
const SCIP_LP = SCIP_Lp
const SCIP_Matrix = Cvoid
const SCIP_MATRIX = SCIP_Matrix
const SCIP_Mem = Cvoid
const SCIP_MEM = SCIP_Mem

# Skipping MacroDefinition: SCIP_DECL_MESSAGEOUTPUTFUNC ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg )
# Skipping MacroDefinition: SCIP_DECL_ERRORPRINTING ( x ) void x ( void * data , FILE * file , const char * msg )
# Skipping MacroDefinition: SCIP_DECL_MESSAGEWARNING ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg )
# Skipping MacroDefinition: SCIP_DECL_MESSAGEDIALOG ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg )
# Skipping MacroDefinition: SCIP_DECL_MESSAGEINFO ( x ) void x ( SCIP_MESSAGEHDLR * messagehdlr , FILE * file , const char * msg )
# Skipping MacroDefinition: SCIP_DECL_MESSAGEHDLRFREE ( x ) SCIP_RETCODE x ( SCIP_MESSAGEHDLR * messagehdlr )

@cenum(SCIP_VerbLevel,
    SCIP_VERBLEVEL_NONE = 0,
    SCIP_VERBLEVEL_DIALOG = 1,
    SCIP_VERBLEVEL_MINIMAL = 2,
    SCIP_VERBLEVEL_NORMAL = 3,
    SCIP_VERBLEVEL_HIGH = 4,
    SCIP_VERBLEVEL_FULL = 5,
)

const SCIP_VERBLEVEL = SCIP_VerbLevel
const SCIP_Messagehdlr = Cvoid
const SCIP_MESSAGEHDLR = SCIP_Messagehdlr
const SCIP_MessagehdlrData = Cvoid
const SCIP_MESSAGEHDLRDATA = SCIP_MessagehdlrData

# Skipping MacroDefinition: SCIP_DECL_SORTINDCOMP ( x ) int x ( void * dataptr , int ind1 , int ind2 )
# Skipping MacroDefinition: SCIP_DECL_SORTPTRCOMP ( x ) int x ( void * elem1 , void * elem2 )
# Skipping MacroDefinition: SCIP_DECL_HASHGETKEY ( x ) void * x ( void * userptr , void * elem )
# Skipping MacroDefinition: SCIP_DECL_HASHKEYEQ ( x ) SCIP_Bool x ( void * userptr , void * key1 , void * key2 )
# Skipping MacroDefinition: SCIP_DECL_HASHKEYVAL ( x ) uint64_t x ( void * userptr , void * key )

@cenum(SCIP_Confidencelevel,
    SCIP_CONFIDENCELEVEL_MIN = 0,
    SCIP_CONFIDENCELEVEL_LOW = 1,
    SCIP_CONFIDENCELEVEL_MEDIUM = 2,
    SCIP_CONFIDENCELEVEL_HIGH = 3,
    SCIP_CONFIDENCELEVEL_MAX = 4,
)

const SCIP_CONFIDENCELEVEL = SCIP_Confidencelevel
const SCIP_SparseSol = Cvoid
const SCIP_SPARSESOL = SCIP_SparseSol
const SCIP_Queue = Cvoid
const SCIP_QUEUE = SCIP_Queue
const SCIP_PQueue = Cvoid
const SCIP_PQUEUE = SCIP_PQueue
const SCIP_HashTable = Cvoid
const SCIP_HASHTABLE = SCIP_HashTable
const SCIP_MultiHash = Cvoid
const SCIP_MULTIHASH = SCIP_MultiHash
const SCIP_MultiHashList = Cvoid
const SCIP_MULTIHASHLIST = SCIP_MultiHashList
const SCIP_HashMapEntry = Cvoid
const SCIP_HASHMAPENTRY = SCIP_HashMapEntry
const SCIP_HashMap = Cvoid
const SCIP_HASHMAP = SCIP_HashMap
const SCIP_HashSet = Cvoid
const SCIP_HASHSET = SCIP_HashSet
const SCIP_RealArray = Cvoid
const SCIP_REALARRAY = SCIP_RealArray
const SCIP_IntArray = Cvoid
const SCIP_INTARRAY = SCIP_IntArray
const SCIP_BoolArray = Cvoid
const SCIP_BOOLARRAY = SCIP_BoolArray
const SCIP_PtrArray = Cvoid
const SCIP_PTRARRAY = SCIP_PtrArray
const SCIP_RandNumGen = Cvoid
const SCIP_RANDNUMGEN = SCIP_RandNumGen
const SCIP_ResourceActivity = Cvoid
const SCIP_RESOURCEACTIVITY = SCIP_ResourceActivity
const SCIP_Profile = Cvoid
const SCIP_PROFILE = SCIP_Profile
const SCIP_Digraph = Cvoid
const SCIP_DIGRAPH = SCIP_Digraph
const SCIP_Bt = Cvoid
const SCIP_BT = SCIP_Bt
const SCIP_BtNode = Cvoid
const SCIP_BTNODE = SCIP_BtNode
const SCIP_Regression = Cvoid
const SCIP_REGRESSION = SCIP_Regression
const SCIP_DisjointSet = Cvoid
const SCIP_DISJOINTSET = SCIP_DisjointSet
const SCIP_NlRow = Cvoid
const SCIP_NLROW = SCIP_NlRow
const SCIP_Nlp = Cvoid
const SCIP_NLP = SCIP_Nlp

# Skipping MacroDefinition: SCIP_DECL_NODESELCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel )
# Skipping MacroDefinition: SCIP_DECL_NODESELSELECT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_NODESEL * nodesel , SCIP_NODE * * selnode )
# Skipping MacroDefinition: SCIP_DECL_NODESELCOMP ( x ) int x ( SCIP * scip , SCIP_NODESEL * nodesel , SCIP_NODE * node1 , SCIP_NODE * node2 )

const SCIP_NodePQ = Cvoid
const SCIP_NODEPQ = SCIP_NodePQ
const SCIP_Nodesel = Cvoid
const SCIP_NODESEL = SCIP_Nodesel
const SCIP_NodeselData = Cvoid
const SCIP_NODESELDATA = SCIP_NodeselData

# Skipping MacroDefinition: SCIP_DECL_PARAMCHGD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PARAM * param )

@cenum(SCIP_ParamType,
    SCIP_PARAMTYPE_BOOL = 0,
    SCIP_PARAMTYPE_INT = 1,
    SCIP_PARAMTYPE_LONGINT = 2,
    SCIP_PARAMTYPE_REAL = 3,
    SCIP_PARAMTYPE_CHAR = 4,
    SCIP_PARAMTYPE_STRING = 5,
)

const SCIP_PARAMTYPE = SCIP_ParamType

@cenum(SCIP_ParamSetting,
    SCIP_PARAMSETTING_DEFAULT = 0,
    SCIP_PARAMSETTING_AGGRESSIVE = 1,
    SCIP_PARAMSETTING_FAST = 2,
    SCIP_PARAMSETTING_OFF = 3,
)

const SCIP_PARAMSETTING = SCIP_ParamSetting

@cenum(SCIP_ParamEmphasis,
    SCIP_PARAMEMPHASIS_DEFAULT = 0,
    SCIP_PARAMEMPHASIS_CPSOLVER = 1,
    SCIP_PARAMEMPHASIS_EASYCIP = 2,
    SCIP_PARAMEMPHASIS_FEASIBILITY = 3,
    SCIP_PARAMEMPHASIS_HARDLP = 4,
    SCIP_PARAMEMPHASIS_OPTIMALITY = 5,
    SCIP_PARAMEMPHASIS_COUNTER = 6,
    SCIP_PARAMEMPHASIS_PHASEFEAS = 7,
    SCIP_PARAMEMPHASIS_PHASEIMPROVE = 8,
    SCIP_PARAMEMPHASIS_PHASEPROOF = 9,
)

const SCIP_PARAMEMPHASIS = SCIP_ParamEmphasis
const SCIP_Param = Cvoid
const SCIP_PARAM = SCIP_Param
const SCIP_ParamData = Cvoid
const SCIP_PARAMDATA = SCIP_ParamData
const SCIP_ParamSet = Cvoid
const SCIP_PARAMSET = SCIP_ParamSet

# Skipping MacroDefinition: SCIP_DECL_PRESOLCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol )
# Skipping MacroDefinition: SCIP_DECL_PRESOLEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRESOL * presol , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result )

const SCIP_Presol = Cvoid
const SCIP_PRESOL = SCIP_Presol
const SCIP_PresolData = Cvoid
const SCIP_PRESOLDATA = SCIP_PresolData

# Skipping MacroDefinition: SCIP_DECL_PRICERCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_Bool * valid )
# Skipping MacroDefinition: SCIP_DECL_PRICERFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer )
# Skipping MacroDefinition: SCIP_DECL_PRICERINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer )
# Skipping MacroDefinition: SCIP_DECL_PRICEREXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer )
# Skipping MacroDefinition: SCIP_DECL_PRICERINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer )
# Skipping MacroDefinition: SCIP_DECL_PRICEREXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer )
# Skipping MacroDefinition: SCIP_DECL_PRICERREDCOST ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_Real * lowerbound , SCIP_Bool * stopearly , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_PRICERFARKAS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PRICER * pricer , SCIP_RESULT * result )

const SCIP_Pricer = Cvoid
const SCIP_PRICER = SCIP_Pricer
const SCIP_PricerData = Cvoid
const SCIP_PRICERDATA = SCIP_PricerData
const SCIP_Pricestore = Cvoid
const SCIP_PRICESTORE = SCIP_Pricestore
const SCIP_Primal = Cvoid
const SCIP_PRIMAL = SCIP_Primal

# Skipping MacroDefinition: SCIP_DECL_PROBDELORIG ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * * probdata )
# Skipping MacroDefinition: SCIP_DECL_PROBTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * sourcedata , SCIP_PROBDATA * * targetdata )
# Skipping MacroDefinition: SCIP_DECL_PROBDELTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * * probdata )
# Skipping MacroDefinition: SCIP_DECL_PROBINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * probdata )
# Skipping MacroDefinition: SCIP_DECL_PROBEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROBDATA * probdata , SCIP_Bool restart )
# Skipping MacroDefinition: SCIP_DECL_PROBCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP * sourcescip , SCIP_PROBDATA * sourcedata , SCIP_HASHMAP * varmap , SCIP_HASHMAP * consmap , SCIP_PROBDATA * * targetdata , SCIP_Bool global , SCIP_RESULT * result )

@cenum(SCIP_Objsense{Int32},
    SCIP_OBJSENSE_MAXIMIZE = -1,
    SCIP_OBJSENSE_MINIMIZE = 1,
)

const SCIP_OBJSENSE = SCIP_Objsense
const SCIP_Prob = Cvoid
const SCIP_PROB = SCIP_Prob
const SCIP_ProbData = Cvoid
const SCIP_PROBDATA = SCIP_ProbData

# Skipping MacroDefinition: SCIP_DECL_PROPCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPINITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPEXITPRE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop )
# Skipping MacroDefinition: SCIP_DECL_PROPEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_Bool restart )
# Skipping MacroDefinition: SCIP_DECL_PROPPRESOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , int nrounds , SCIP_PRESOLTIMING presoltiming , int nnewfixedvars , int nnewaggrvars , int nnewchgvartypes , int nnewchgbds , int nnewholes , int nnewdelconss , int nnewaddconss , int nnewupgdconss , int nnewchgcoefs , int nnewchgsides , int * nfixedvars , int * naggrvars , int * nchgvartypes , int * nchgbds , int * naddholes , int * ndelconss , int * naddconss , int * nupgdconss , int * nchgcoefs , int * nchgsides , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_PROPEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_PROPTIMING proptiming , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_PROPRESPROP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_PROP * prop , SCIP_VAR * infervar , int inferinfo , SCIP_BOUNDTYPE boundtype , SCIP_BDCHGIDX * bdchgidx , SCIP_Real relaxedbd , SCIP_RESULT * result )

const SCIP_Prop = Cvoid
const SCIP_PROP = SCIP_Prop
const SCIP_PropData = Cvoid
const SCIP_PROPDATA = SCIP_PropData

# Skipping MacroDefinition: SCIP_DECL_READERCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader )
# Skipping MacroDefinition: SCIP_DECL_READERFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader )
# Skipping MacroDefinition: SCIP_DECL_READERREAD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader , const char * filename , SCIP_RESULT * result )
# Skipping MacroDefinition: SCIP_DECL_READERWRITE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_READER * reader , FILE * file , const char * name , SCIP_PROBDATA * probdata , SCIP_Bool transformed , SCIP_OBJSENSE objsense , SCIP_Real objscale , SCIP_Real objoffset , SCIP_VAR * * vars , int nvars , int nbinvars , int nintvars , int nimplvars , int ncontvars , SCIP_VAR * * fixedvars , int nfixedvars , int startnvars , SCIP_CONS * * conss , int nconss , int maxnconss , int startnconss , SCIP_Bool genericnames , SCIP_RESULT * result )

const SCIP_Reader = Cvoid
const SCIP_READER = SCIP_Reader
const SCIP_ReaderData = Cvoid
const SCIP_READERDATA = SCIP_ReaderData

# Skipping MacroDefinition: SCIP_DECL_RELAXCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax )
# Skipping MacroDefinition: SCIP_DECL_RELAXEXEC ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_RELAX * relax , SCIP_Real * lowerbound , SCIP_RESULT * result )

const SCIP_Relax = Cvoid
const SCIP_RELAX = SCIP_Relax
const SCIP_Relaxation = Cvoid
const SCIP_RELAXATION = SCIP_Relaxation
const SCIP_RelaxData = Cvoid
const SCIP_RELAXDATA = SCIP_RelaxData
const SCIP_Reopt = Cvoid
const SCIP_REOPT = SCIP_Reopt
const SCIP_SolTree = Cvoid
const SCIP_SOLTREE = SCIP_SolTree
const SCIP_SolNode = Cvoid
const SCIP_SOLNODE = SCIP_SolNode
const SCIP_ReoptTree = Cvoid
const SCIP_REOPTTREE = SCIP_ReoptTree
const SCIP_ReoptNode = Cvoid
const SCIP_REOPTNODE = SCIP_ReoptNode
const SCIP_REPRESENTATIVE = SCIP_ReoptNode
const SCIP_ReoptConsData = Cvoid
const SCIP_REOPTCONSDATA = SCIP_ReoptConsData

@cenum(SCIP_ReoptType,
    SCIP_REOPTTYPE_NONE = 0,
    SCIP_REOPTTYPE_TRANSIT = 1,
    SCIP_REOPTTYPE_INFSUBTREE = 2,
    SCIP_REOPTTYPE_STRBRANCHED = 3,
    SCIP_REOPTTYPE_LOGICORNODE = 4,
    SCIP_REOPTTYPE_LEAF = 5,
    SCIP_REOPTTYPE_PRUNED = 6,
    SCIP_REOPTTYPE_FEASIBLE = 7,
)

const SCIP_REOPTTYPE = SCIP_ReoptType

@cenum(Reopt_ConsType,
    REOPT_CONSTYPE_INFSUBTREE = 0,
    REOPT_CONSTYPE_DUALREDS = 1,
    REOPT_CONSTYPE_CUT = 2,
    REOPT_CONSTYPE_UNKNOWN = 3,
)

const REOPT_CONSTYPE = Reopt_ConsType

@cenum(SCIP_Result,
    SCIP_DIDNOTRUN = 1,
    SCIP_DELAYED = 2,
    SCIP_DIDNOTFIND = 3,
    SCIP_FEASIBLE = 4,
    SCIP_INFEASIBLE = 5,
    SCIP_UNBOUNDED = 6,
    SCIP_CUTOFF = 7,
    SCIP_SEPARATED = 8,
    SCIP_NEWROUND = 9,
    SCIP_REDUCEDDOM = 10,
    SCIP_CONSADDED = 11,
    SCIP_CONSCHANGED = 12,
    SCIP_BRANCHED = 13,
    SCIP_SOLVELP = 14,
    SCIP_FOUNDSOL = 15,
    SCIP_SUSPENDED = 16,
    SCIP_SUCCESS = 17,
    SCIP_DELAYNODE = 18,
)

const SCIP_RESULT = SCIP_Result

@cenum(SCIP_Retcode{Int32},
    SCIP_OKAY = 1,
    SCIP_ERROR = 0,
    SCIP_NOMEMORY = -1,
    SCIP_READERROR = -2,
    SCIP_WRITEERROR = -3,
    SCIP_NOFILE = -4,
    SCIP_FILECREATEERROR = -5,
    SCIP_LPERROR = -6,
    SCIP_NOPROBLEM = -7,
    SCIP_INVALIDCALL = -8,
    SCIP_INVALIDDATA = -9,
    SCIP_INVALIDRESULT = -10,
    SCIP_PLUGINNOTFOUND = -11,
    SCIP_PARAMETERUNKNOWN = -12,
    SCIP_PARAMETERWRONGTYPE = -13,
    SCIP_PARAMETERWRONGVAL = -14,
    SCIP_KEYALREADYEXISTING = -15,
    SCIP_MAXDEPTHLEVEL = -16,
    SCIP_BRANCHERROR = -17,
)

const SCIP_RETCODE = SCIP_Retcode
const Scip = Cvoid
const SCIP_ = Scip

# Skipping MacroDefinition: SCIP_DECL_SEPACOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa )
# Skipping MacroDefinition: SCIP_DECL_SEPAEXECLP ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa , SCIP_RESULT * result , SCIP_Bool allowlocal )
# Skipping MacroDefinition: SCIP_DECL_SEPAEXECSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_SEPA * sepa , SCIP_SOL * sol , SCIP_RESULT * result , SCIP_Bool allowlocal )

const SCIP_Sepa = Cvoid
const SCIP_SEPA = SCIP_Sepa
const SCIP_SepaData = Cvoid
const SCIP_SEPADATA = SCIP_SepaData

@cenum(SCIP_Efficiacychoice,
    SCIP_EFFICIACYCHOICE_LP = 0,
    SCIP_EFFICIACYCHOICE_RELAX = 1,
    SCIP_EFFICIACYCHOICE_NLP = 2,
)

const SCIP_EFFICIACYCHOICE = SCIP_Efficiacychoice
const SCIP_SepaStore = Cvoid
const SCIP_SEPASTORE = SCIP_SepaStore

@cenum(SCIP_Stage,
    SCIP_STAGE_INIT = 0,
    SCIP_STAGE_PROBLEM = 1,
    SCIP_STAGE_TRANSFORMING = 2,
    SCIP_STAGE_TRANSFORMED = 3,
    SCIP_STAGE_INITPRESOLVE = 4,
    SCIP_STAGE_PRESOLVING = 5,
    SCIP_STAGE_EXITPRESOLVE = 6,
    SCIP_STAGE_PRESOLVED = 7,
    SCIP_STAGE_INITSOLVE = 8,
    SCIP_STAGE_SOLVING = 9,
    SCIP_STAGE_SOLVED = 10,
    SCIP_STAGE_EXITSOLVE = 11,
    SCIP_STAGE_FREETRANS = 12,
    SCIP_STAGE_FREE = 13,
)

const SCIP_STAGE = SCIP_Stage

@cenum(SCIP_Setting,
    SCIP_UNDEFINED = 0,
    SCIP_DISABLED = 1,
    SCIP_AUTO = 2,
    SCIP_ENABLED = 3,
)

const SCIP_SETTING = SCIP_Setting
const SCIP_Set = Cvoid
const SCIP_SET = SCIP_Set

@cenum(SCIP_SolOrigin,
    SCIP_SOLORIGIN_ORIGINAL = 0,
    SCIP_SOLORIGIN_ZERO = 1,
    SCIP_SOLORIGIN_LPSOL = 2,
    SCIP_SOLORIGIN_NLPSOL = 3,
    SCIP_SOLORIGIN_RELAXSOL = 4,
    SCIP_SOLORIGIN_PSEUDOSOL = 5,
    SCIP_SOLORIGIN_PARTIAL = 6,
    SCIP_SOLORIGIN_UNKNOWN = 7,
)

const SCIP_SOLORIGIN = SCIP_SolOrigin
const SCIP_Sol = Cvoid
const SCIP_SOL = SCIP_Sol
const SCIP_Viol = Cvoid
const SCIP_VIOL = SCIP_Viol

@cenum(SCIP_Status,
    SCIP_STATUS_UNKNOWN = 0,
    SCIP_STATUS_USERINTERRUPT = 1,
    SCIP_STATUS_NODELIMIT = 2,
    SCIP_STATUS_TOTALNODELIMIT = 3,
    SCIP_STATUS_STALLNODELIMIT = 4,
    SCIP_STATUS_TIMELIMIT = 5,
    SCIP_STATUS_MEMLIMIT = 6,
    SCIP_STATUS_GAPLIMIT = 7,
    SCIP_STATUS_SOLLIMIT = 8,
    SCIP_STATUS_BESTSOLLIMIT = 9,
    SCIP_STATUS_RESTARTLIMIT = 10,
    SCIP_STATUS_OPTIMAL = 11,
    SCIP_STATUS_INFEASIBLE = 12,
    SCIP_STATUS_UNBOUNDED = 13,
    SCIP_STATUS_INFORUNBD = 14,
    SCIP_STATUS_TERMINATE = 15,
)

const SCIP_STATUS = SCIP_Status
const SCIP_Stat = Cvoid
const SCIP_STAT = SCIP_Stat

@cenum(SCIP_Parallelmode,
    SCIP_PARA_OPPORTUNISTIC = 0,
    SCIP_PARA_DETERMINISTIC = 1,
)

const SCIP_PARALLELMODE = SCIP_Parallelmode
const SCIP_SyncStore = Cvoid
const SCIP_SYNCSTORE = SCIP_SyncStore
const SCIP_SyncData = Cvoid
const SCIP_SYNCDATA = SCIP_SyncData
const SCIP_BoundStore = Cvoid
const SCIP_BOUNDSTORE = SCIP_BoundStore

# Skipping MacroDefinition: SCIP_DECL_TABLECOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEFREE ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEINIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEEXIT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEINITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEEXITSOL ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table )
# Skipping MacroDefinition: SCIP_DECL_TABLEOUTPUT ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_TABLE * table , FILE * file )

const SCIP_Table = Cvoid
const SCIP_TABLE = SCIP_Table
const SCIP_TableData = Cvoid
const SCIP_TABLEDATA = SCIP_TableData
const SCIP_PRESOLTIMING_NONE = UInt32(0x0002)
const SCIP_PRESOLTIMING_FAST = UInt32(0x0004)
const SCIP_PRESOLTIMING_MEDIUM = UInt32(0x0008)
const SCIP_PRESOLTIMING_EXHAUSTIVE = UInt32(0x0010)
const SCIP_PRESOLTIMING_FINAL = UInt32(0x0020)
const SCIP_PRESOLTIMING_ALWAYS = (SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM) | SCIP_PRESOLTIMING_EXHAUSTIVE
const SCIP_PRESOLTIMING_MAX = ((SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM) | SCIP_PRESOLTIMING_EXHAUSTIVE) | SCIP_PRESOLTIMING_FINAL
const SCIP_PROPTIMING_BEFORELP = UInt32(0x0001)
const SCIP_PROPTIMING_DURINGLPLOOP = UInt32(0x0002)
const SCIP_PROPTIMING_AFTERLPLOOP = UInt32(0x0004)
const SCIP_PROPTIMING_AFTERLPNODE = UInt32(0x0008)
const SCIP_PROPTIMING_ALWAYS = ((SCIP_PROPTIMING_BEFORELP | SCIP_PROPTIMING_DURINGLPLOOP) | SCIP_PROPTIMING_AFTERLPLOOP) | SCIP_PROPTIMING_AFTERLPNODE
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
const SCIP_HEURTIMING_AFTERNODE = SCIP_HEURTIMING_AFTERLPNODE | SCIP_HEURTIMING_AFTERPSEUDONODE
const SCIP_HEURTIMING_AFTERPLUNGE = SCIP_HEURTIMING_AFTERLPPLUNGE | SCIP_HEURTIMING_AFTERPSEUDOPLUNGE
const SCIP_PRESOLTIMING = UInt32
const SCIP_PROPTIMING = UInt32
const SCIP_HEURTIMING = UInt32

@cenum(SCIP_NodeType,
    SCIP_NODETYPE_FOCUSNODE = 0,
    SCIP_NODETYPE_PROBINGNODE = 1,
    SCIP_NODETYPE_SIBLING = 2,
    SCIP_NODETYPE_CHILD = 3,
    SCIP_NODETYPE_LEAF = 4,
    SCIP_NODETYPE_DEADEND = 5,
    SCIP_NODETYPE_JUNCTION = 6,
    SCIP_NODETYPE_PSEUDOFORK = 7,
    SCIP_NODETYPE_FORK = 8,
    SCIP_NODETYPE_SUBROOT = 9,
    SCIP_NODETYPE_REFOCUSNODE = 10,
)

const SCIP_NODETYPE = SCIP_NodeType
const SCIP_Probingnode = Cvoid
const SCIP_PROBINGNODE = SCIP_Probingnode
const SCIP_Sibling = Cvoid
const SCIP_SIBLING = SCIP_Sibling
const SCIP_Child = Cvoid
const SCIP_CHILD = SCIP_Child
const SCIP_Leaf = Cvoid
const SCIP_LEAF = SCIP_Leaf
const SCIP_Junction = Cvoid
const SCIP_JUNCTION = SCIP_Junction
const SCIP_Pseudofork = Cvoid
const SCIP_PSEUDOFORK = SCIP_Pseudofork
const SCIP_Fork = Cvoid
const SCIP_FORK = SCIP_Fork
const SCIP_Subroot = Cvoid
const SCIP_SUBROOT = SCIP_Subroot
const SCIP_Node = Cvoid
const SCIP_NODE = SCIP_Node
const SCIP_PendingBdchg = Cvoid
const SCIP_PENDINGBDCHG = SCIP_PendingBdchg
const SCIP_Tree = Cvoid
const SCIP_TREE = SCIP_Tree
const NLOCKTYPES = 2

# Skipping MacroDefinition: SCIP_DECL_VARDELORIG ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_VAR * var , SCIP_VARDATA * * vardata )
# Skipping MacroDefinition: SCIP_DECL_VARTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_VAR * sourcevar , SCIP_VARDATA * sourcedata , SCIP_VAR * targetvar , SCIP_VARDATA * * targetdata )
# Skipping MacroDefinition: SCIP_DECL_VARDELTRANS ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_VAR * var , SCIP_VARDATA * * vardata )
# Skipping MacroDefinition: SCIP_DECL_VARCOPY ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP * sourcescip , SCIP_VAR * sourcevar , SCIP_VARDATA * sourcedata , SCIP_HASHMAP * varmap , SCIP_HASHMAP * consmap , SCIP_VAR * targetvar , SCIP_VARDATA * * targetdata , SCIP_RESULT * result )

@cenum(SCIP_Varstatus,
    SCIP_VARSTATUS_ORIGINAL = 0,
    SCIP_VARSTATUS_LOOSE = 1,
    SCIP_VARSTATUS_COLUMN = 2,
    SCIP_VARSTATUS_FIXED = 3,
    SCIP_VARSTATUS_AGGREGATED = 4,
    SCIP_VARSTATUS_MULTAGGR = 5,
    SCIP_VARSTATUS_NEGATED = 6,
)

const SCIP_VARSTATUS = SCIP_Varstatus

@cenum(SCIP_Vartype,
    SCIP_VARTYPE_BINARY = 0,
    SCIP_VARTYPE_INTEGER = 1,
    SCIP_VARTYPE_IMPLINT = 2,
    SCIP_VARTYPE_CONTINUOUS = 3,
)

const SCIP_VARTYPE = SCIP_Vartype

@cenum(SCIP_DomchgType,
    SCIP_DOMCHGTYPE_DYNAMIC = 0,
    SCIP_DOMCHGTYPE_BOTH = 1,
    SCIP_DOMCHGTYPE_BOUND = 2,
)

const SCIP_DOMCHGTYPE = SCIP_DomchgType

@cenum(SCIP_BoundchgType,
    SCIP_BOUNDCHGTYPE_BRANCHING = 0,
    SCIP_BOUNDCHGTYPE_CONSINFER = 1,
    SCIP_BOUNDCHGTYPE_PROPINFER = 2,
)

const SCIP_BOUNDCHGTYPE = SCIP_BoundchgType

@cenum(SCIP_LockType,
    SCIP_LOCKTYPE_MODEL = 0,
    SCIP_LOCKTYPE_CONFLICT = 1,
)

const SCIP_LOCKTYPE = SCIP_LockType
const SCIP_DomChgBound = Cvoid
const SCIP_DOMCHGBOUND = SCIP_DomChgBound
const SCIP_DomChgBoth = Cvoid
const SCIP_DOMCHGBOTH = SCIP_DomChgBoth
const SCIP_DomChgDyn = Cvoid
const SCIP_DOMCHGDYN = SCIP_DomChgDyn
const SCIP_DomChg = Cvoid
const SCIP_DOMCHG = SCIP_DomChg
const SCIP_BoundChg = Cvoid
const SCIP_BOUNDCHG = SCIP_BoundChg
const SCIP_BdChgIdx = Cvoid
const SCIP_BDCHGIDX = SCIP_BdChgIdx
const SCIP_BdChgInfo = Cvoid
const SCIP_BDCHGINFO = SCIP_BdChgInfo
const SCIP_BranchingData = Cvoid
const SCIP_BRANCHINGDATA = SCIP_BranchingData
const SCIP_InferenceData = Cvoid
const SCIP_INFERENCEDATA = SCIP_InferenceData
const SCIP_HoleChg = Cvoid
const SCIP_HOLECHG = SCIP_HoleChg
const SCIP_Hole = Cvoid
const SCIP_HOLE = SCIP_Hole
const SCIP_Holelist = Cvoid
const SCIP_HOLELIST = SCIP_Holelist
const SCIP_Dom = Cvoid
const SCIP_DOM = SCIP_Dom
const SCIP_Original = Cvoid
const SCIP_ORIGINAL = SCIP_Original
const SCIP_Aggregate = Cvoid
const SCIP_AGGREGATE = SCIP_Aggregate
const SCIP_Multaggr = Cvoid
const SCIP_MULTAGGR = SCIP_Multaggr
const SCIP_Negate = Cvoid
const SCIP_NEGATE = SCIP_Negate
const SCIP_Var = Cvoid
const SCIP_VAR = SCIP_Var
const SCIP_VarData = Cvoid
const SCIP_VARDATA = SCIP_VarData

@cenum(SCIP_VBCColor{Int32},
    SCIP_VBCCOLOR_UNSOLVED = 3,
    SCIP_VBCCOLOR_SOLVED = 2,
    SCIP_VBCCOLOR_CUTOFF = 4,
    SCIP_VBCCOLOR_CONFLICT = 15,
    SCIP_VBCCOLOR_MARKREPROP = 11,
    SCIP_VBCCOLOR_REPROP = 12,
    SCIP_VBCCOLOR_SOLUTION = 14,
    SCIP_VBCCOLOR_NONE = -1,
)

const SCIP_VBCCOLOR = SCIP_VBCColor
const SCIP_Visual = Cvoid
const SCIP_VISUAL = SCIP_Visual
const SCIP_File = Cvoid
const SCIP_FILE = SCIP_File

# Skipping MacroDefinition: SCIPallocMemory ( scip , ptr ) ( ( BMSallocMemory ( ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocMemoryArray ( scip , ptr , num ) ( ( BMSallocMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocClearMemoryArray ( scip , ptr , num ) ( ( BMSallocClearMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocMemorySize ( scip , ptr , size ) ( ( BMSallocMemorySize ( ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPreallocMemoryArray ( scip , ptr , newnum ) ( ( BMSreallocMemoryArray ( ( ptr ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPreallocMemorySize ( scip , ptr , newsize ) ( ( BMSreallocMemorySize ( ( ptr ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateMemory ( scip , ptr , source ) ( ( BMSduplicateMemory ( ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateMemoryArray ( ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPfreeMemory ( scip , ptr ) BMSfreeMemory ( ptr )
# Skipping MacroDefinition: SCIPfreeMemoryNull ( scip , ptr ) BMSfreeMemoryNull ( ptr )
# Skipping MacroDefinition: SCIPfreeMemoryArray ( scip , ptr ) BMSfreeMemoryArray ( ptr )
# Skipping MacroDefinition: SCIPfreeMemoryArrayNull ( scip , ptr ) BMSfreeMemoryArrayNull ( ptr )
# Skipping MacroDefinition: SCIPfreeMemorySize ( scip , ptr ) BMSfreeMemorySize ( ptr )
# Skipping MacroDefinition: SCIPfreeMemorySizeNull ( scip , ptr ) BMSfreeMemorySizeNull ( ptr )
# Skipping MacroDefinition: SCIPallocBlockMemory ( scip , ptr ) ( ( BMSallocBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocBlockMemorySize ( scip , ptr , size ) ( ( BMSallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocClearBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocClearBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPreallocBlockMemoryArray ( scip , ptr , oldnum , newnum ) ( ( BMSreallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( oldnum ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPreallocBlockMemorySize ( scip , ptr , oldsize , newsize ) ( ( BMSreallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( oldsize ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateBlockMemory ( scip , ptr , source ) ( ( BMSduplicateBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateBlockMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPensureBlockMemoryArray ( scip , ptr , arraysizeptr , minsize ) ( ( SCIPensureBlockMemoryArray_call ( ( scip ) , ( void * * ) ( ptr ) , sizeof ( * * ( ptr ) ) , ( arraysizeptr ) , ( minsize ) ) ) )
# Skipping MacroDefinition: SCIPfreeBlockMemory ( scip , ptr ) BMSfreeBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeBlockMemoryNull ( scip , ptr ) BMSfreeBlockMemoryNull ( SCIPblkmem ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeBlockMemoryArray ( scip , ptr , num ) BMSfreeBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) )
# Skipping MacroDefinition: SCIPfreeBlockMemoryArrayNull ( scip , ptr , num ) BMSfreeBlockMemoryArrayNull ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) )
# Skipping MacroDefinition: SCIPfreeBlockMemorySize ( scip , ptr , size ) BMSfreeBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) )
# Skipping MacroDefinition: SCIPfreeBlockMemorySizeNull ( scip , ptr , size ) BMSfreeBlockMemorySizeNull ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) )
# Skipping MacroDefinition: SCIPallocBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocClearBufferArray ( scip , ptr , num ) ( ( BMSallocClearBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPreallocBufferArray ( scip , ptr , num ) ( ( BMSreallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateBuffer ( scip , ptr , source ) ( ( BMSduplicateBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( size_t ) sizeof ( * * ( ptr ) ) ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPduplicateBufferArray ( scip , ptr , source , num ) ( ( BMSduplicateBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPfreeBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPallocCleanBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPcleanbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPallocCleanBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY )
# Skipping MacroDefinition: SCIPfreeCleanBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPcleanbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeCleanBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPcleanbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeCleanBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPfreeCleanBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPcleanbuffer ( scip ) , ( ptr ) )
# Skipping MacroDefinition: SCIPdebugMsg ( scip , ... ) while ( FALSE ) SCIPprintDebugMessage ( scip , __FILE__ , __LINE__ , __VA_ARGS__ )
# Skipping MacroDefinition: SCIPdebugMsgPrint ( scip , ... ) while ( FALSE ) SCIPdebugMessagePrint ( scip , __VA_ARGS__ )

@cenum(SCIP_BIVAR_CONVEXITY,
    SCIP_BIVAR_ALLCONVEX = 0,
    SCIP_BIVAR_1CONVEX_INDEFINITE = 1,
    SCIP_BIVAR_CONVEX_CONCAVE = 2,
    SCIP_BIVAR_UNKNOWN = 3,
)

# Skipping MacroDefinition: SCIP_DECL_SOLVECUMULATIVE ( x ) SCIP_RETCODE x ( int njobs , SCIP_Real * ests , SCIP_Real * lsts , SCIP_Real * objvals , int * durations , int * demands , int capacity , int hmin , int hmax , SCIP_Real timelimit , SCIP_Real memorylimit , SCIP_Longint maxnodes , SCIP_Bool * solved , SCIP_Bool * infeasible , SCIP_Bool * unbounded , SCIP_Bool * error )
# Skipping MacroDefinition: SCIP_DECL_LINCONSUPGD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONS * cons , int nvars , SCIP_VAR * * vars , SCIP_Real * vals , SCIP_Real lhs , SCIP_Real rhs , int nposbin , int nnegbin , int nposint , int nnegint , int nposimpl , int nnegimpl , int nposimplbin , int nnegimplbin , int nposcont , int nnegcont , int ncoeffspone , int ncoeffsnone , int ncoeffspint , int ncoeffsnint , int ncoeffspfrac , int ncoeffsnfrac , SCIP_Real poscoeffsum , SCIP_Real negcoeffsum , SCIP_Bool integral , SCIP_CONS * * upgdcons )

const SCIP_LinConsUpgrade = Cvoid
const SCIP_LINCONSUPGRADE = SCIP_LinConsUpgrade

# Skipping MacroDefinition: SCIP_DECL_NONLINCONSUPGD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONS * cons , int * nupgdconss , SCIP_CONS * * upgdconss , int upgdconsssize )
# Skipping MacroDefinition: SCIP_DECL_EXPRGRAPHNODEREFORM ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_EXPRGRAPH * exprgraph , SCIP_EXPRGRAPHNODE * node , int * naddcons , SCIP_EXPRGRAPHNODE * * reformnode )

@cenum(SCIP_OrbitopeType,
    SCIP_ORBITOPETYPE_FULL = 0,
    SCIP_ORBITOPETYPE_PARTITIONING = 1,
    SCIP_ORBITOPETYPE_PACKING = 2,
)

const SCIP_ORBITOPETYPE = SCIP_OrbitopeType
const ARTIFICIALVARNAMEPREFIX = "andresultant_"

@cenum(SCIP_LinearConsType{Int32},
    SCIP_LINEARCONSTYPE_INVALIDCONS = -1,
    SCIP_LINEARCONSTYPE_LINEAR = 0,
    SCIP_LINEARCONSTYPE_LOGICOR = 1,
    SCIP_LINEARCONSTYPE_KNAPSACK = 2,
    SCIP_LINEARCONSTYPE_SETPPC = 3,
)

const SCIP_LINEARCONSTYPE = SCIP_LinearConsType

# Skipping MacroDefinition: SCIP_DECL_QUADCONSUPGD ( x ) SCIP_RETCODE x ( SCIP * scip , SCIP_CONS * cons , int nbinlin , int nbinquad , int nintlin , int nintquad , int nimpllin , int nimplquad , int ncontlin , int ncontquad , SCIP_Bool integral , int * nupgdconss , SCIP_CONS * * upgdconss , int upgdconsssize , SCIP_PRESOLTIMING presoltiming )

const SCIP_QuadVarEventData = Cvoid
const SCIP_QUADVAREVENTDATA = SCIP_QuadVarEventData

struct SCIP_QuadVarTerm
    var::Ptr{SCIP_VAR}
    lincoef::Cdouble
    sqrcoef::Cdouble
    nadjbilin::Cint
    adjbilinsize::Cint
    adjbilin::Ptr{Cint}
    eventdata::Ptr{SCIP_QUADVAREVENTDATA}
end

const SCIP_QUADVARTERM = SCIP_QuadVarTerm

struct SCIP_BilinTerm
    var1::Ptr{SCIP_VAR}
    var2::Ptr{SCIP_VAR}
    coef::Cdouble
end

const SCIP_BILINTERM = SCIP_BilinTerm

struct SCIP_RowPrep
    vars::Ptr{Ptr{SCIP_VAR}}
    coefs::Ptr{Cdouble}
    nvars::Cint
    varssize::Cint
    side::Cdouble
    sidetype::SCIP_SIDETYPE
    _local::UInt32
    name::NTuple{1024, UInt8}
end

const SCIP_ROWPREP = SCIP_RowPrep

@cenum(SCIP_SetppcType,
    SCIP_SETPPCTYPE_PARTITIONING = 0,
    SCIP_SETPPCTYPE_PACKING = 1,
    SCIP_SETPPCTYPE_COVERING = 2,
)

const SCIP_SETPPCTYPE = SCIP_SetppcType

struct SCIP_Interval
    inf::Cdouble
    sup::Cdouble
end

const SCIP_INTERVAL = SCIP_Interval
const SCIP_ROUNDMODE = Cint

@cenum(SCIP_ObjSen{Int32},
    SCIP_OBJSEN_MAXIMIZE = -1,
    SCIP_OBJSEN_MINIMIZE = 1,
)

const SCIP_OBJSEN = SCIP_ObjSen

@cenum(SCIP_LPParam,
    SCIP_LPPAR_FROMSCRATCH = 0,
    SCIP_LPPAR_FASTMIP = 1,
    SCIP_LPPAR_SCALING = 2,
    SCIP_LPPAR_PRESOLVING = 3,
    SCIP_LPPAR_PRICING = 4,
    SCIP_LPPAR_LPINFO = 5,
    SCIP_LPPAR_FEASTOL = 6,
    SCIP_LPPAR_DUALFEASTOL = 7,
    SCIP_LPPAR_BARRIERCONVTOL = 8,
    SCIP_LPPAR_OBJLIM = 9,
    SCIP_LPPAR_LPITLIM = 10,
    SCIP_LPPAR_LPTILIM = 11,
    SCIP_LPPAR_MARKOWITZ = 12,
    SCIP_LPPAR_ROWREPSWITCH = 13,
    SCIP_LPPAR_THREADS = 14,
    SCIP_LPPAR_CONDITIONLIMIT = 15,
    SCIP_LPPAR_TIMING = 16,
    SCIP_LPPAR_RANDOMSEED = 17,
    SCIP_LPPAR_POLISHING = 18,
    SCIP_LPPAR_REFACTOR = 19,
)

const SCIP_LPPARAM = SCIP_LPParam

@cenum(SCIP_Pricing,
    SCIP_PRICING_LPIDEFAULT = 0,
    SCIP_PRICING_AUTO = 1,
    SCIP_PRICING_FULL = 2,
    SCIP_PRICING_PARTIAL = 3,
    SCIP_PRICING_STEEP = 4,
    SCIP_PRICING_STEEPQSTART = 5,
    SCIP_PRICING_DEVEX = 6,
)

const SCIP_PRICING = SCIP_Pricing

@cenum(SCIP_BaseStat,
    SCIP_BASESTAT_LOWER = 0,
    SCIP_BASESTAT_BASIC = 1,
    SCIP_BASESTAT_UPPER = 2,
    SCIP_BASESTAT_ZERO = 3,
)

const SCIP_BASESTAT = SCIP_BaseStat

@cenum(SCIP_LPSolQuality,
    SCIP_LPSOLQUALITY_ESTIMCONDITION = 0,
    SCIP_LPSOLQUALITY_EXACTCONDITION = 1,
)

const SCIP_LPSOLQUALITY = SCIP_LPSolQuality
const SCIP_LPi = Cvoid
const SCIP_LPI = SCIP_LPi
const SCIP_LPiState = Cvoid
const SCIP_LPISTATE = SCIP_LPiState
const SCIP_LPiNorms = Cvoid
const SCIP_LPINORMS = SCIP_LPiNorms
const SCIP_EXPR_DEGREEINFINITY = 65535

# Skipping MacroDefinition: SCIP_DECL_EXPREVAL ( x ) SCIP_RETCODE x ( SCIP_EXPROPDATA opdata , int nargs , SCIP_Real * argvals , SCIP_Real * varvals , SCIP_Real * paramvals , SCIP_Real * result )
# Skipping MacroDefinition: SCIP_DECL_EXPRINTEVAL ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_EXPROPDATA opdata , int nargs , SCIP_INTERVAL * argvals , SCIP_INTERVAL * varvals , SCIP_Real * paramvals , SCIP_INTERVAL * result )
# Skipping MacroDefinition: SCIP_DECL_EXPRCURV ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_EXPROPDATA opdata , int nargs , SCIP_INTERVAL * argbounds , SCIP_EXPRCURV * argcurv , SCIP_EXPRCURV * result )
# Skipping MacroDefinition: SCIP_DECL_EXPRCOPYDATA ( x ) SCIP_RETCODE x ( BMS_BLKMEM * blkmem , int nchildren , SCIP_EXPROPDATA opdatasource , SCIP_EXPROPDATA * opdatatarget )
# Skipping MacroDefinition: SCIP_DECL_EXPRFREEDATA ( x ) void x ( BMS_BLKMEM * blkmem , int nchildren , SCIP_EXPROPDATA opdata )
# Skipping MacroDefinition: SCIP_DECL_EXPRGRAPHVARADDED ( x ) SCIP_RETCODE x ( SCIP_EXPRGRAPH * exprgraph , void * userdata , void * var , SCIP_EXPRGRAPHNODE * varnode )
# Skipping MacroDefinition: SCIP_DECL_EXPRGRAPHVARREMOVE ( x ) SCIP_RETCODE x ( SCIP_EXPRGRAPH * exprgraph , void * userdata , void * var , SCIP_EXPRGRAPHNODE * varnode )
# Skipping MacroDefinition: SCIP_DECL_EXPRGRAPHVARCHGIDX ( x ) SCIP_RETCODE x ( SCIP_EXPRGRAPH * exprgraph , void * userdata , void * var , SCIP_EXPRGRAPHNODE * varnode , int oldidx , int newidx )

const SCIP_EXPRBOUNDSTATUS_VALID = 0x00
const SCIP_EXPRBOUNDSTATUS_CHILDTIGHTENED = 0x01
const SCIP_EXPRBOUNDSTATUS_CHILDRELAXED = 0x02
const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENT = 0x04
const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTRECENT = 0x08 | SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENT
const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTFORCE = 0x10 | SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTRECENT

# Skipping MacroDefinition: SCIP_DECL_USEREXPRESTIMATE ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_USEREXPRDATA * data , int nargs , SCIP_Real * argvals , SCIP_INTERVAL * argbounds , SCIP_Bool overestimate , SCIP_Real * coeffs , SCIP_Real * constant , SCIP_Bool * success )
# Skipping MacroDefinition: SCIP_DECL_USEREXPREVAL ( x ) SCIP_RETCODE x ( SCIP_USEREXPRDATA * data , int nargs , SCIP_Real * argvals , SCIP_Real * funcvalue , SCIP_Real * gradient , SCIP_Real * hessian )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRINTEVAL ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_USEREXPRDATA * data , int nargs , SCIP_INTERVAL * argvals , SCIP_INTERVAL * funcvalue , SCIP_INTERVAL * gradient , SCIP_INTERVAL * hessian )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRCURV ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_USEREXPRDATA * data , int nargs , SCIP_INTERVAL * argbounds , SCIP_EXPRCURV * argcurv , SCIP_EXPRCURV * result )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRPROP ( x ) SCIP_RETCODE x ( SCIP_Real infinity , SCIP_USEREXPRDATA * data , int nargs , SCIP_INTERVAL * argbounds , SCIP_INTERVAL funcbounds , SCIP_Bool * cutoff )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRCOPYDATA ( x ) SCIP_RETCODE x ( BMS_BLKMEM * blkmem , int nchildren , SCIP_USEREXPRDATA * datasource , SCIP_USEREXPRDATA * * datatarget )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRFREEDATA ( x ) void x ( BMS_BLKMEM * blkmem , int nchildren , SCIP_USEREXPRDATA * data )
# Skipping MacroDefinition: SCIP_DECL_USEREXPRPRINT ( x ) void x ( SCIP_USEREXPRDATA * data , SCIP_MESSAGEHDLR * messagehdlr , FILE * file )

@cenum(SCIP_ExprOp,
    SCIP_EXPR_VARIDX = 1,
    SCIP_EXPR_CONST = 2,
    SCIP_EXPR_PARAM = 3,
    SCIP_EXPR_PLUS = 8,
    SCIP_EXPR_MINUS = 9,
    SCIP_EXPR_MUL = 10,
    SCIP_EXPR_DIV = 11,
    SCIP_EXPR_SQUARE = 12,
    SCIP_EXPR_SQRT = 13,
    SCIP_EXPR_REALPOWER = 14,
    SCIP_EXPR_INTPOWER = 15,
    SCIP_EXPR_SIGNPOWER = 16,
    SCIP_EXPR_EXP = 17,
    SCIP_EXPR_LOG = 18,
    SCIP_EXPR_SIN = 19,
    SCIP_EXPR_COS = 20,
    SCIP_EXPR_TAN = 21,
    SCIP_EXPR_MIN = 24,
    SCIP_EXPR_MAX = 25,
    SCIP_EXPR_ABS = 26,
    SCIP_EXPR_SIGN = 27,
    SCIP_EXPR_SUM = 64,
    SCIP_EXPR_PRODUCT = 65,
    SCIP_EXPR_LINEAR = 66,
    SCIP_EXPR_QUADRATIC = 67,
    SCIP_EXPR_POLYNOMIAL = 68,
    SCIP_EXPR_USER = 69,
    SCIP_EXPR_LAST = 70,
)
@cenum(SCIP_ExprCurv,
    SCIP_EXPRCURV_UNKNOWN = 0,
    SCIP_EXPRCURV_CONVEX = 1,
    SCIP_EXPRCURV_CONCAVE = 2,
    SCIP_EXPRCURV_LINEAR = 3,
)

const SCIP_EXPROP = SCIP_ExprOp
const SCIP_ExprOpData = Cvoid
const SCIP_EXPROPDATA = SCIP_ExprOpData
const SCIP_Expr = Cvoid
const SCIP_EXPR = SCIP_Expr
const SCIP_ExprTree = Cvoid
const SCIP_EXPRTREE = SCIP_ExprTree
const SCIP_EXPRCURV = SCIP_ExprCurv

struct SCIP_QuadElement
    idx1::Cint
    idx2::Cint
    coef::Cdouble
end

const SCIP_QUADELEM = SCIP_QuadElement
const SCIP_ExprData_Quadratic = Cvoid
const SCIP_EXPRDATA_QUADRATIC = SCIP_ExprData_Quadratic
const SCIP_ExprData_Monomial = Cvoid
const SCIP_EXPRDATA_MONOMIAL = SCIP_ExprData_Monomial
const SCIP_ExprData_Polynomial = Cvoid
const SCIP_EXPRDATA_POLYNOMIAL = SCIP_ExprData_Polynomial
const SCIP_ExprData_User = Cvoid
const SCIP_EXPRDATA_USER = SCIP_ExprData_User
const SCIP_ExprGraphNode = Cvoid
const SCIP_EXPRGRAPHNODE = SCIP_ExprGraphNode
const SCIP_ExprGraph = Cvoid
const SCIP_EXPRGRAPH = SCIP_ExprGraph
const SCIP_EXPRBOUNDSTATUS = UInt8
const SCIP_UserExprData = Cvoid
const SCIP_USEREXPRDATA = SCIP_UserExprData

# Skipping MacroDefinition: SCIP_DECL_NLPICOPY ( x ) SCIP_RETCODE x ( BMS_BLKMEM * blkmem , SCIP_NLPI * sourcenlpi , SCIP_NLPI * * targetnlpi )
# Skipping MacroDefinition: SCIP_DECL_NLPIFREE ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETSOLVERPOINTER ( x ) void * x ( SCIP_NLPI * nlpi )
# Skipping MacroDefinition: SCIP_DECL_NLPICREATEPROBLEM ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * * problem , const char * name )
# Skipping MacroDefinition: SCIP_DECL_NLPIFREEPROBLEM ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * * problem )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETPROBLEMPOINTER ( x ) void * x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem )
# Skipping MacroDefinition: SCIP_DECL_NLPIADDVARS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int nvars , const SCIP_Real * lbs , const SCIP_Real * ubs , const char * * varnames )
# Skipping MacroDefinition: SCIP_DECL_NLPIADDCONSTRAINTS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int ncons , const SCIP_Real * lhss , const SCIP_Real * rhss , const int * nlininds , int * const * lininds , SCIP_Real * const * linvals , const int * nquadelems , SCIP_QUADELEM * const * quadelems , int * const * exprvaridxs , SCIP_EXPRTREE * const * exprtrees , const char * * names )
# Skipping MacroDefinition: SCIP_DECL_NLPISETOBJECTIVE ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int nlins , const int * lininds , const SCIP_Real * linvals , int nquadelems , const SCIP_QUADELEM * quadelems , const int * exprvaridxs , const SCIP_EXPRTREE * exprtree , const SCIP_Real constant )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGVARBOUNDS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , const int nvars , const int * indices , const SCIP_Real * lbs , const SCIP_Real * ubs )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGCONSSIDES ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int nconss , const int * indices , const SCIP_Real * lhss , const SCIP_Real * rhss )
# Skipping MacroDefinition: SCIP_DECL_NLPIDELVARSET ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int * dstats , int dstatssize )
# Skipping MacroDefinition: SCIP_DECL_NLPIDELCONSSET ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int * dstats , int dstatssize )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGLINEARCOEFS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int idx , int nvals , const int * varidxs , const SCIP_Real * vals )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGQUADCOEFS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int idx , int nquadelems , const SCIP_QUADELEM * quadelems )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGEXPRTREE ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int idxcons , const int * exprvaridxs , const SCIP_EXPRTREE * exprtree )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGNONLINCOEF ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , int idxcons , int idxparam , SCIP_Real value )
# Skipping MacroDefinition: SCIP_DECL_NLPICHGOBJCONSTANT ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_Real objconstant )
# Skipping MacroDefinition: SCIP_DECL_NLPISETINITIALGUESS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_Real * primalvalues , SCIP_Real * consdualvalues , SCIP_Real * varlbdualvalues , SCIP_Real * varubdualvalues )
# Skipping MacroDefinition: SCIP_DECL_NLPISOLVE ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETSOLSTAT ( x ) SCIP_NLPSOLSTAT x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETTERMSTAT ( x ) SCIP_NLPTERMSTAT x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETSOLUTION ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_Real * * primalvalues , SCIP_Real * * consdualvalues , SCIP_Real * * varlbdualvalues , SCIP_Real * * varubdualvalues , SCIP_Real * objval )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETSTATISTICS ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPSTATISTICS * statistics )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETWARMSTARTSIZE ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , size_t * size )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETWARMSTARTMEMO ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , void * buffer )
# Skipping MacroDefinition: SCIP_DECL_NLPISETWARMSTARTMEMO ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , void * buffer )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETINTPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , int * ival )
# Skipping MacroDefinition: SCIP_DECL_NLPISETINTPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , int ival )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETREALPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , SCIP_Real * dval )
# Skipping MacroDefinition: SCIP_DECL_NLPISETREALPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , SCIP_Real dval )
# Skipping MacroDefinition: SCIP_DECL_NLPIGETSTRINGPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , const char * * sval )
# Skipping MacroDefinition: SCIP_DECL_NLPISETSTRINGPAR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_NLPIPROBLEM * problem , SCIP_NLPPARAM type , const char * sval )
# Skipping MacroDefinition: SCIP_DECL_NLPISETMESSAGEHDLR ( x ) SCIP_RETCODE x ( SCIP_NLPI * nlpi , SCIP_MESSAGEHDLR * messagehdlr )

const SCIP_Nlpi = Cvoid
const SCIP_NLPI = SCIP_Nlpi
const SCIP_NlpiData = Cvoid
const SCIP_NLPIDATA = SCIP_NlpiData
const SCIP_NlpiProblem = Cvoid
const SCIP_NLPIPROBLEM = SCIP_NlpiProblem
const SCIP_NlpStatistics = Cvoid
const SCIP_NLPSTATISTICS = SCIP_NlpStatistics

@cenum(SCIP_NlpParam,
    SCIP_NLPPAR_FROMSCRATCH = 0,
    SCIP_NLPPAR_VERBLEVEL = 1,
    SCIP_NLPPAR_FEASTOL = 2,
    SCIP_NLPPAR_RELOBJTOL = 3,
    SCIP_NLPPAR_LOBJLIM = 4,
    SCIP_NLPPAR_INFINITY = 5,
    SCIP_NLPPAR_ITLIM = 6,
    SCIP_NLPPAR_TILIM = 7,
    SCIP_NLPPAR_OPTFILE = 8,
    SCIP_NLPPAR_FASTFAIL = 9,
)

const SCIP_NLPPARAM = SCIP_NlpParam

@cenum(SCIP_NlpSolStat,
    SCIP_NLPSOLSTAT_GLOBOPT = 0,
    SCIP_NLPSOLSTAT_LOCOPT = 1,
    SCIP_NLPSOLSTAT_FEASIBLE = 2,
    SCIP_NLPSOLSTAT_LOCINFEASIBLE = 3,
    SCIP_NLPSOLSTAT_GLOBINFEASIBLE = 4,
    SCIP_NLPSOLSTAT_UNBOUNDED = 5,
    SCIP_NLPSOLSTAT_UNKNOWN = 6,
)

const SCIP_NLPSOLSTAT = SCIP_NlpSolStat

@cenum(SCIP_NlpTermStat,
    SCIP_NLPTERMSTAT_OKAY = 0,
    SCIP_NLPTERMSTAT_TILIM = 1,
    SCIP_NLPTERMSTAT_ITLIM = 2,
    SCIP_NLPTERMSTAT_LOBJLIM = 3,
    SCIP_NLPTERMSTAT_NUMERR = 5,
    SCIP_NLPTERMSTAT_EVALERR = 6,
    SCIP_NLPTERMSTAT_MEMERR = 7,
    SCIP_NLPTERMSTAT_LICERR = 8,
    SCIP_NLPTERMSTAT_OTHER = 9,
)

const SCIP_NLPTERMSTAT = SCIP_NlpTermStat
const SCIP_EXPRINTCAPABILITY_NONE = 0x00000000
const SCIP_EXPRINTCAPABILITY_FUNCVALUE = 0x00000001
const SCIP_EXPRINTCAPABILITY_INTFUNCVALUE = 0x00000002
const SCIP_EXPRINTCAPABILITY_GRADIENT = 0x00000010
const SCIP_EXPRINTCAPABILITY_INTGRADIENT = 0x00000020
const SCIP_EXPRINTCAPABILITY_HESSIAN = 0x00000100
const SCIP_EXPRINTCAPABILITY_INTHESSIAN = 0x00000200
const SCIP_EXPRINTCAPABILITY_ALL = ((((SCIP_EXPRINTCAPABILITY_FUNCVALUE | SCIP_EXPRINTCAPABILITY_INTFUNCVALUE) | SCIP_EXPRINTCAPABILITY_GRADIENT) | SCIP_EXPRINTCAPABILITY_INTGRADIENT) | SCIP_EXPRINTCAPABILITY_HESSIAN) | SCIP_EXPRINTCAPABILITY_INTHESSIAN
const SCIP_ExprInt = Cvoid
const SCIP_EXPRINT = SCIP_ExprInt
const SCIP_ExprIntData = Cvoid
const SCIP_EXPRINTDATA = SCIP_ExprIntData
const SCIP_EXPRINTCAPABILITY = UInt32
