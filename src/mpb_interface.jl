# Interface

###########################################################################################################
##### Methods common to all: AbstractLinearQuadraticModel, AbstractConicModel, AbstractNonlinearModel #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/solverinterface.html                        #####
###########################################################################################################

SolverInterface.getobjgap(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

SolverInterface.getrawsolver(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

SolverInterface.getsolvetime(m::SCIPMathProgModel) = ccall((:SCIPgetSolvingTime, libcsip), Cdouble, (Ptr{Cvoid},), _getInternalSCIP(m))

SolverInterface.getsense(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

SolverInterface.numvar(m::SCIPMathProgModel) = _getNumVars(m)

"The number of proper constraints, excluding those from lazy callbacks."
SolverInterface.numconstr(m::SCIPMathProgModel) = _getNumConss(m)

function SolverInterface.freemodel!(m::SCIPMathProgModel)
    if m.inner.ptr_model != C_NULL
        # call finalizer directly
        freescip(m.inner)
    else
        Base.warn_once("Tried to free already freed model, ignoring.")
    end
end

# TODO: mapping for :SemiCont, :SemiInt
const vartypemap = Dict{Symbol, Cint}(
  :Cont => 3,
  :Bin => 0,
  :Int => 1
)
const revvartypemap = Dict{Cint, Symbol}(
  3 => :Cont,
  0 => :Bin,
  1 => :Int
)

function SolverInterface.getvartype(m::SCIPMathProgModel)
    nvars = _getNumVars(m)
    types = zeros(nvars)
    for idx = one(Cint):nvars
        types[idx] = _getVarType(m, idx - one(Cint))
    end
    return map(x -> revvartypemap[x], types)
end

function SolverInterface.setvartype!(m::SCIPMathProgModel, vartype::Vector{Symbol})
    nvars = Cint(length(vartype))
    scipvartypes = map(vt -> vartypemap[vt], vartype)
    for idx = one(Cint):nvars
        _chgVarType(m, idx - one(Cint), scipvartypes[idx])
    end
end

SolverInterface.optimize!(m::SCIPMathProgModel) = _solve(m)

function SolverInterface.status(m::SCIPMathProgModel)
    statusmap = [:Optimal,
                 :Infeasible,
                 :Unbounded,
                 :InfeasibleOrUnbounded,
                 :UserLimit, # node limit
                 :UserLimit, # time limit
                 :UserLimit, # memory limit
                 :UserLimit, # user limit
                 :Unknown    # TODO: find good value
                 ]
    stat = _getStatus(m)
    return statusmap[stat + 1]
end

SolverInterface.getobjbound(m::SCIPMathProgModel) = _getObjBound(m)

SolverInterface.getobjval(m::SCIPMathProgModel) = _getObjValue(m)

function SolverInterface.getsolution(m::SCIPMathProgModel)
    nvars = _getNumVars(m)
    values = zeros(nvars)
    _getVarValues(m, values)
    values
end

function SolverInterface.setsense!(m::SCIPMathProgModel, sense)
    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end

function SolverInterface.setparameters!(s::SCIPSolver; mpboptions...)
    opts = collect(Any,s.options)
    for (optname, optval) in mpboptions
        if optname == :TimeLimit
            push!(opts, "limits/time")
            push!(opts, optval)
        elseif optname == :Silent
            if optval == true
                push!(opts, "display/verblevel")
                push!(opts, 0)
            end
        else
            error("Unrecognized parameter $optname")
        end
    end
    s.options = opts
    return
end

function SolverInterface.setparameters!(m::SCIPMathProgModel; mpboptions...)
    for (optname, optval) in mpboptions
        if optname == :TimeLimit
            setparameter!(m, "limits/time", float(optval))
        elseif optname == :Silent
            if optval == true
                setparameter!(m, "display/verblevel", 0)
            end
        else
            error("Unrecognized parameter $optname")
        end
    end
end

"Set warm-start solution candidate. Missing values are indicated by NaN."
function SolverInterface.setwarmstart!(m::SCIPMathProgModel, v)
    _setInitialSolution(m, float(v))
end

###########################################################################
##### Methods specific to AbstractLinearQuadraticModel                #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/lpqcqp.html #####
###########################################################################

SolverInterface.loadproblem!(m::SCIPLinearQuadraticModel, filename::AbstractString) =
    error("Not implemented for SCIP.jl")

function SolverInterface.loadproblem!(m::SCIPLinearQuadraticModel, A, varlb, varub, obj, rowlb, rowub, sense)
    # TODO: clean old model?

    nrows, ncols = size(A)
    nvars = Cint(ncols)
    varindices = collect(zero(Cint):nvars - one(Cint))

    for v in 1:ncols
        # TODO: define enum for vartype?
        _addVar(m, float(varlb[v]), float(varub[v]),
                Cint(3), Ptr{Cint}(C_NULL))
    end
    if issparse(A)
        At = A' # faster column-wise access in loop
        for c in 1:nrows
            idx, val = findnz(At[:,c])
            _idx = Vector{Cint}(idx - 1) # 0 based indexing
            _nvars = Cint(length(_idx))
            _addLinCons(m, _nvars, _idx, float(val),
                        float(rowlb[c]), float(rowub[c]), Ptr{Cint}(C_NULL))
        end
    else
        for c in 1:nrows
            _addLinCons(m, nvars, varindices, float(A[c, :]),
                        float(rowlb[c]), float(rowub[c]), Ptr{Cint}(C_NULL))
        end
    end

    _setObj(m, nvars, varindices, float(obj))

    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end

function SolverInterface.writeproblem(m::SCIPMathProgModel, filename::AbstractString)
    _writeOrigProblem(m, Cstring(pointer(filename)), Cstring(C_NULL), Cint(0))
end

SolverInterface.getvarLB(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

function SolverInterface.setvarLB!(m::SCIPLinearQuadraticModel, lb)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _chgVarLB(m, Cint(numvar(m)), indices, float(lb))
end

SolverInterface.getvarUB(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

function SolverInterface.setvarUB!(m::SCIPLinearQuadraticModel, ub)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _chgVarUB(m, Cint(numvar(m)), indices, float(ub))
end

SolverInterface.getconstrLB(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

# setconstrLB!(m::SCIPLinearQuadraticModel, lb) = error("Not implemented for SCIP.jl")

SolverInterface.getconstrUB(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

# setconstrUB!(m::SCIPLinearQuadraticModel, ub) = error("Not implemented for SCIP.jl")

SolverInterface.getobj(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

function SolverInterface.setobj!(m::SCIPLinearQuadraticModel, obj)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _setObj(m, Cint(numvar(m)), indices, float(obj))
end

SolverInterface.getconstrmatrix(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.addvar!(m::SCIPLinearQuadraticModel, constridx, constrcoef, l, u, objcoef) =
    error("Not implemented for SCIP.jl")

SolverInterface.addvar!(m::SCIPLinearQuadraticModel, l, u, objcoef) = error("Not implemented for SCIP.jl")

function SolverInterface.addconstr!(m::SCIPLinearQuadraticModel, varidx, coef, lb, ub)
    _addLinCons(m, Cint(length(varidx)), Vector{Cint}(varidx - 1), float(coef),
                float(lb), float(ub), Ptr{Cint}(C_NULL))
end

SolverInterface.numlinconstr(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getconstrsolution(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getreducedcosts(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getconstrduals(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getinfeasibilityray(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getbasis(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getunboundedray(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getsimplexiter(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getbarrieriter(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

##########################################################################
##### Methods specific to Integer Programming                        #####
##########################################################################

SolverInterface.getnodecount(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

function SolverInterface.addsos1!(m::SCIPLinearQuadraticModel, idx, weight)
    nidx = Cint(length(idx))
    cidx = convert(Vector{Cint}, idx - 1)
    _addSOS1(m, nidx, cidx, weight, Ptr{Cint}(C_NULL))
end

function SolverInterface.addsos2!(m::SCIPLinearQuadraticModel, idx, weight)
    nidx = Cint(length(idx))
    cidx = convert(Vector{Cint}, idx - 1)
    _addSOS2(m, nidx, cidx, weight, Ptr{Cint}(C_NULL))
end

##########################################################################
##### Methods specific to Quadratic Programming                      #####
##########################################################################

SolverInterface.numquadconstr(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.setquadobj!(m::SCIPLinearQuadraticModel, Q::Array{T, 2}) where {T<:Real} =
    error("Not implemented for SCIP.jl")

SolverInterface.setquadobj!(m::SCIPLinearQuadraticModel, rowidx, colidx, quadval) =
    error("Not implemented for SCIP.jl")

SolverInterface.setquadobjterms!(m::SCIPLinearQuadraticModel, rowidx, colidx, quadval) =
    _setQuadObj(m, Cint(0), Array{Cint}(0), Array{Cdouble}(0),
                 Cint(length(rowidx)), convert(Vector{Cint}, rowidx - 1),
                 convert(Vector{Cint}, colidx - 1), quadval)

function SolverInterface.addquadconstr!(m::SCIPLinearQuadraticModel, linearidx, linearval, quadrowidx, quadcolidx, quadval, sense, rhs)
    clhs = -Inf
    crhs =  Inf
    if sense == '<'
        crhs = rhs
    elseif sense == '>'
        clhs = rhs
    else
        @assert sense == '='
        clhs = rhs
        crhs = rhs
    end
    _addQuadCons(m, Cint(length(linearidx)), convert(Vector{Cint}, linearidx - 1),
                 linearval, Cint(length(quadrowidx)), convert(Vector{Cint}, quadrowidx - 1),
                 convert(Vector{Cint}, quadcolidx - 1), quadval, clhs, crhs, Ptr{Cint}(C_NULL))
end

SolverInterface.getquadconstrsolution(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getquadconstrduals(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getquadinfeasibilityray(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.getquadconstrRHS(m::SCIPLinearQuadraticModel) = error("Not implemented for SCIP.jl")

SolverInterface.setquadconstrRHS!(m::SCIPLinearQuadraticModel, lb) = error("Not implemented for SCIP.jl")

##########################################################################
##### Methods specific to MIP Callbacks                              #####
##########################################################################

# use a different type for heuristic callback and multiple dispatch to implements
# the methods that they share
abstract type SCIPCallbackData <: SolverInterface.MathProgCallbackData end

mutable struct SCIPLazyCallbackData <: SCIPCallbackData
    model::SCIPMathProgModel
    csip_lazydata::Ptr{Cvoid}
end

# this is the function that should fit the CSIP_LAZYCALLBACK signature
function lazycb_wrapper(csip_model::Ptr{Cvoid}, csip_lazydata::Ptr{Cvoid},
                        userdata::Ptr{Cvoid})
    # m, f = unsafe_pointer_to_objref(userdata)::(SCIPMathProgModel, Function)
    # WTF: TypeError: typeassert: expected Type{T}, got Tuple{DataType,DataType}
    m, f = unsafe_pointer_to_objref(userdata)
    d = SCIPLazyCallbackData(m, csip_lazydata)
    ret = f(d)
    ret == :Exit && _interrupt(m)

    return convert(Cint, 0) # CSIP_RETCODE_OK
end

function SolverInterface.setlazycallback!(m::SCIPMathProgModel, f)
    # f is function(d::SCIPLazyCallbackData)

    cbfunction = cfunction(lazycb_wrapper, Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
    m.inner.lazy_userdata = (m, f)

    _addLazyCallback(m, cbfunction, m.inner.lazy_userdata)
end

# if we are called from a lazy callback, we check whether the LP relaxation is integral
function SolverInterface.cbgetstate(d::SCIPLazyCallbackData)
    context = _lazyGetContext(d.csip_lazydata)
    mapping = [:MIPNode, :MIPSol, :Intermediate]
    mapping[context + 1]
end

function SolverInterface.cbgetlpsolution(d::SCIPLazyCallbackData, output)
    _lazyGetVarValues(d.csip_lazydata, output)
end

#TODO: what should we do if there is no best solution?
SolverInterface.cbgetmipsolution(d::SCIPLazyCallbackData, output) = 
    SolverInterface.cbgetlpsolution(d, output)

function SolverInterface.cbgetlpsolution(d::SCIPCallbackData)
    output = Array(Float64, _getNumVars(m))
    SolverInterface.cbgetlpsolution(d, output)
end

#TODO: what should we do if there is no best solution?
SolverInterface.cbgetmipsolution(d::SCIPLazyCallbackData) =
    SolverInterface.cbgetlpsolution(d)

function SolverInterface.cbaddlazy!(d::SCIPLazyCallbackData, varidx, varcoef, sense, rhs)
    clhs = -Inf
    crhs =  Inf
    if sense == '<'
        crhs = rhs
    elseif sense == '>'
        clhs = rhs
    else
        @assert sense == '='
        clhs = rhs
        crhs = rhs
    end
    _lazyAddLinCons(d.csip_lazydata, convert(Cint, length(varidx)),
                  convert(Vector{Cint}, varidx - 1), varcoef, clhs, crhs,
                  convert(Cint, 0))
end

# function cbaddlazylocal!(d::SCIPLazyCallbackData, varidx, varcoef, sense, rhs)
# end

mutable struct SCIPHeurCallbackData <: SCIPCallbackData
    model::SCIPMathProgModel
    csip_heurdata::Ptr{Cvoid}
    sol::Vector{Float64}
end

# this is the function that should fit the CSIP_HEURCALLBACK signature
function heurcb_wrapper(csip_model::Ptr{Cvoid}, csip_heurdata::Ptr{Cvoid},
                        userdata::Ptr{Cvoid})
    # m, f = unsafe_pointer_to_objref(userdata)::(SCIPMathProgModel, Function)
    # WTF: TypeError: typeassert: expected Type{T}, got Tuple{DataType,DataType}
    m, f = unsafe_pointer_to_objref(userdata)
    d = SCIPHeurCallbackData(m, csip_heurdata, fill(NaN, SolverInterface.numvar(m)))

    ret = f(d)
    ret == :Exit && _interrupt(m)

    return convert(Cint, 0) # CSIP_RETCODE_OK
end

function SolverInterface.setheuristiccallback!(m::SCIPMathProgModel, f)
    # f is function(d::SCIPHeurCallbackData)

    cbfunction = cfunction(heurcb_wrapper, Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
    m.inner.heur_userdata = (m, f)

    _addHeuristicCallback(m, cbfunction, m.inner.heur_userdata)
end

# TODO: detect :MIPSol like with lazy constraints?
SolverInterface.cbgetstate(d::SCIPHeurCallbackData) = :MIPNode

function SolverInterface.cbgetlpsolution(d::SCIPHeurCallbackData, output)
    _heurGetVarValues(d.csip_heurdata, output)
end

function SolverInterface.cbaddsolution!(d::SCIPHeurCallbackData)
    # check for unspecified values (NaN)
    if findfirst(isnan, d.sol) == 0
        # add solution that was filled from cbsetsolutionvalue
        _heurAddSolution(d.csip_heurdata, d.sol)
    else
        warn("Incomplete solutions not supported, skipping candidate.")
    end

    # reset solution vector for the next solution
    d.sol = fill(NaN, SolverInterface.numvar(d.model))
end

function SolverInterface.cbsetsolutionvalue!(d::SCIPHeurCallbackData, varidx, value)
    d.sol[varidx] = value
end

##########################################################################
##### Methods specific to AbstractConicModel                         #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/conic.html #####
##########################################################################

########################################################################
##### Methods specific to AbstractNonlinear                        #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/nlp.html #####
########################################################################
const julia_op_to_csip_op = Dict{Symbol, Int}(
   :- => 9,
   :/ => 11,
   :sqrt => 13,
   :^ => 14,
   :exp => 17,
   :log => 18,
   :+ => 64,
   :* => 65
)

#inspired in ReverseDiffSparse's conversion.jl
struct CSIPNodeData
    nodetype::Int
    childids::Array{Int}
end

# parse constraint expression into something easier for CSIP
function constr_expr_to_nodedata(ex::Expr)
    values = Float64[]
    csipex = CSIPNodeData[]

    # a ex.args is [side, comp, expr, comp, side] or [comp, expr, side]
    if length(ex.args) == 5 # two sided constraint
        expr_to_csip(ex.args[3], values, csipex)
    else
        @assert length(ex.args) == 3
        expr_to_csip(ex.args[2], values, csipex)
    end
    return csipex, values
end

# parse objective expression into something easier for CSIP
function obj_expr_to_nodedata(ex::Expr)
    values = Float64[]
    csipex = CSIPNodeData[]
    expr_to_csip(ex, values, csipex)
    return csipex, values
end

# store expression tree as an array of CSIPNodeData
# Each element of a CSIPNodeData consists of the operator identifier
# and an array with the position of the operator's children.
# For each node in the expression tree, first process its children
# (creating an array with their position) and afterwards add create a new
# node with the node's operator and the position of its children.
function expr_to_csip(ex::Expr, values, csipex)
    if Meta.isexpr(ex,:call) # functional operator
        # create node
        childids = []
        op = ex.args[1]
        nchildren = length(ex.args)
        for c in 2:nchildren  # the first actual children is in positin 2
            pos = expr_to_csip(ex.args[c], values, csipex)
            push!(childids, pos)
        end
        push!(csipex, CSIPNodeData(julia_op_to_csip_op[op], childids))

    elseif Meta.isexpr(ex, :ref) # variable
        @assert ex.args[1] == :x
        push!(csipex, CSIPNodeData(1, [ex.args[2]]))

    else # not supported I guess
        error("Unrecognized expression $ex: $(ex.head), probably not supported")
    end
    return length(csipex)
end

# parsing values
function expr_to_csip(ex::Number, values, csipex)
    valueidx = length(values)+1
    push!(values,ex)
    push!(csipex, CSIPNodeData(2, [valueidx]))
    return length(csipex)
end


# the AbstractNLPEvaluator contains the constraints and objective.
# One can get different data from it (with initialize)
# SCIP doesn't need most of the data, just the epression
function SolverInterface.loadproblem!(m::SCIPNonlinearModel, numVars, numConstr,
                      l, u, lb, ub, sense, d::AbstractNLPEvaluator)
    # add variables
    for v in Base.OneTo(numVars)
        _addVar(m, float(l[v]), float(u[v]), Cint(3), Ptr{Cint}(C_NULL))
    end

    # we want to get the expressions
    SolverInterface.initialize(d, [:ExprGraph])

    # add constraints
    for c in Base.OneTo(numConstr)
        csipex, values = constr_expr_to_nodedata(SolverInterface.constr_expr(d, c))
        children = Cint[]
        beg = Cint[1]
        ops = Cint[]
        for node in csipex
            ops = [ops; node.nodetype]
            children = [children; node.childids]
            push!(beg, beg[end]+length(node.childids))
        end
        _addNonLinCons(m, Cint(length(ops)),
                       convert(Vector{Cint},ops),
                       convert(Vector{Cint},children - 1),
                       convert(Vector{Cint},beg - 1),
                       values, float(lb[c]), float(ub[c]),
                       Ptr{Cint}(C_NULL))
    end

    # add objective
    csipex, values = obj_expr_to_nodedata(SolverInterface.obj_expr(d))
    children = Cint[]
    beg = Cint[1]
    ops = Cint[]
    for node in csipex
        ops = [ops; node.nodetype]
        children = [children; node.childids]
        push!(beg, beg[end]+length(node.childids))
    end
    _setNonlinearObj(m, Cint(length(ops)),
                     convert(Vector{Cint},ops),
                     convert(Vector{Cint},children - 1),
                     convert(Vector{Cint},beg - 1),
                     values)

    # set sense
    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end
