# Interface

###########################################################################################################
##### Methods common to all: AbstractLinearQuadraticModel, AbstractConicModel, AbstractNonlinearModel #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/solverinterface.html                        #####
###########################################################################################################

getobjgap(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

getrawsolver(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

getsolvetime(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

getsense(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

numvar(m::SCIPMathProgModel) = _getNumVars(m)

"The number of proper constraints, excluding those from lazy callbacks."
numconstr(m::SCIPMathProgModel) = _getNumConss(m)

freemodel!(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl!")

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

function getvartype(m::SCIPMathProgModel)
    nvars = _getNumVars(m)
    types = zeros(nvars)
    for idx = one(Cint):nvars
        types[idx] = _getVarType(m, idx - one(Cint))
    end
    return map(x -> revvartypemap[x], types)
end

function setvartype!(m::SCIPMathProgModel, vartype::Vector{Symbol})
    nvars = Cint(length(vartype))
    scipvartypes = map(vt -> vartypemap[vt], vartype)
    for idx = one(Cint):nvars
        _chgVarType(m, idx - one(Cint), scipvartypes[idx])
    end
end

optimize!(m::SCIPMathProgModel) = _solve(m)

function status(m::SCIPMathProgModel)
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

getobjbound(m::SCIPMathProgModel) = _getObjBound(m)

getobjval(m::SCIPMathProgModel) = _getObjValue(m)

function getsolution(m::SCIPMathProgModel)
    nvars = _getNumVars(m)
    values = zeros(nvars)
    _getVarValues(m, values)
    values
end

function setsense!(m::SCIPMathProgModel, sense)
    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end

###########################################################################
##### Methods specific to AbstractLinearQuadraticModel                #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/lpqcqp.html #####
###########################################################################

loadproblem!(m::SCIPMathProgModel, filename::AbstractString) =
    error("Not implemented for SCIP.jl")

function loadproblem!(m::SCIPMathProgModel, A, varlb, varub, obj, rowlb, rowub, sense)
    # TODO: clean old model?

    nrows, ncols = size(A)
    nvars = Cint(ncols)
    varindices = collect(zero(Cint):nvars - one(Cint))

    for v in 1:ncols
        # TODO: define enum for vartype?
        _addVar(m, float(varlb[v]), float(varub[v]),
                Cint(3), Ptr{Cint}(C_NULL))
    end
    for c in 1:nrows
        # TODO: care about sparse matrices
        denserow = float(collect(A[c, :]))
        _addLinCons(m, nvars, varindices, denserow,
                    float(rowlb[c]), float(rowub[c]), Ptr{Cint}(C_NULL))
    end

    _setObj(m, nvars, varindices, float(obj))

    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end

writeproblem(m::SCIPMathProgModel, filename::AbstractString) =
    error("Not implemented for SCIP.jl")

getvarLB(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

function setvarLB!(m::SCIPMathProgModel, lb)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _chgVarLB(m, Cint(numvar(m)), indices, float(lb))
end

getvarUB(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

function setvarUB!(m::SCIPMathProgModel, ub)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _chgVarUB(m, Cint(numvar(m)), indices, float(ub))
end

getconstrLB(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

# setconstrLB!(m::SCIPMathProgModel, lb) = error("Not implemented for SCIP.jl")

getconstrUB(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

# setconstrUB!(m::SCIPMathProgModel, ub) = error("Not implemented for SCIP.jl")

getobj(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

function setobj!(m::SCIPMathProgModel, obj)
    indices = collect(zero(Cint):Cint(numvar(m) - 1))
    _setObj(m, Cint(numvar(m)), indices, float(obj))
end

getconstrmatrix(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

addvar!(m::SCIPMathProgModel, constridx, constrcoef, l, u, objcoef) =
    error("Not implemented for SCIP.jl")

addvar!(m::SCIPMathProgModel, l, u, objcoef) = error("Not implemented for SCIP.jl")

function addconstr!(m::SCIPMathProgModel, varidx, coef, lb, ub)
    _addLinCons(m, Cint(length(varidx)), Vector{Cint}(varidx - 1), float(coef),
                float(lb), float(ub), Ptr{Cint}(C_NULL))
end

numlinconstr(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getconstrsolution(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getreducedcosts(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getconstrduals(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getinfeasibilityray(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getbasis(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getunboundedray(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getsimplexiter(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getbarrieriter(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

function setwarmstart!(m::SCIPMathProgModel, v)
    # does not support incomplete solutions (with NaN)
    _setInitialSolution(m, float(v))
end

##########################################################################
##### Methods specific to Integer Programming                        #####
##########################################################################

getnodecount(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

function addsos1!(m::SCIPMathProgModel, idx, weight)
    nidx = Cint(length(idx))
    cidx = convert(Vector{Cint}, idx - 1)
    _addSOS1(m, nidx, cidx, weight, Ptr{Cint}(C_NULL))
end

function addsos2!(m::SCIPMathProgModel, idx, weight)
    nidx = Cint(length(idx))
    cidx = convert(Vector{Cint}, idx - 1)
    _addSOS2(m, nidx, cidx, weight, Ptr{Cint}(C_NULL))
end

##########################################################################
##### Methods specific to Quadratic Programming                      #####
##########################################################################

numquadconstr(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

setquadobj!{T<:Real}(m::SCIPMathProgModel, Q::Array{T, 2}) =
    error("Not implemented for SCIP.jl")

setquadobj!(m::SCIPMathProgModel, rowidx, colidx, quadval) =
    error("Not implemented for SCIP.jl")

setquadobjterms!(m::SCIPMathProgModel, rowidx, colidx, quadval) =
    _setQuadObj(m, Cint(0), Array{Cint}(0), Array{Cdouble}(0),
                 Cint(length(rowidx)), convert(Vector{Cint}, rowidx - 1),
                 convert(Vector{Cint}, colidx - 1), quadval)

function addquadconstr!(m::SCIPMathProgModel, linearidx, linearval, quadrowidx, quadcolidx, quadval, sense, rhs)
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

getquadconstrsolution(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getquadconstrduals(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getquadinfeasibilityray(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

getquadconstrRHS(m::SCIPMathProgModel) = error("Not implemented for SCIP.jl")

setquadconstrRHS!(m::SCIPMathProgModel, lb) = error("Not implemented for SCIP.jl")

##########################################################################
##### Methods specific to MIP Callbacks                              #####
##########################################################################

# use a different type for heuristic callback and multiple dispatch to implements
# the methods that they share
abstract SCIPCallbackData <: MathProgCallbackData

type SCIPLazyCallbackData <: SCIPCallbackData
    model::SCIPMathProgModel
    csip_lazydata::Ptr{Void}
end

# this is the function that should fit the CSIP_LAZYCALLBACK signature
function lazycb_wrapper(csip_model::Ptr{Void}, csip_lazydata::Ptr{Void},
                        userdata::Ptr{Void})
    # m, f = unsafe_pointer_to_objref(userdata)::(SCIPMathProgModel, Function)
    # WTF: TypeError: typeassert: expected Type{T}, got Tuple{DataType,DataType}
    m, f = unsafe_pointer_to_objref(userdata)
    d = SCIPLazyCallbackData(m, csip_lazydata)
    ret = f(d)
    ret == :Exit && _interrupt(m)

    return convert(Cint, 0) # CSIP_RETCODE_OK
end

function setlazycallback!(m::SCIPMathProgModel, f)
    # f is function(d::SCIPLazyCallbackData)

    cbfunction = cfunction(lazycb_wrapper, Cint, (Ptr{Void}, Ptr{Void}, Ptr{Void}))
    userdata = (m, f)

    _addLazyCallback(m, cbfunction, userdata)
end

# if we are called from a lazy callback, we check whether the LP relaxation is integral
function cbgetstate(d::SCIPLazyCallbackData)
    context = _lazyGetContext(d.csip_lazydata)
    mapping = [:MIPNode, :MIPSol, :Other]
    mapping[context + 1]
end

function cbgetlpsolution(d::SCIPLazyCallbackData, output)
    _lazyGetVarValues(d.csip_lazydata, output)
end

#TODO: what should we do if there is no best solution?
cbgetmipsolution(d::SCIPLazyCallbackData, output) = cbgetlpsolution(d, output)

function cbgetlpsolution(d::SCIPCallbackData)
    output = Array(Float64, _getNumVars(m))
    cbgetlpsolution(d, output)
end

#TODO: what should we do if there is no best solution?
cbgetmipsolution(d::SCIPLazyCallbackData) = cbgetlpsolution(d)

function cbaddlazy!(d::SCIPLazyCallbackData, varidx, varcoef, sense, rhs)
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

type SCIPHeurCallbackData <: SCIPCallbackData
    model::SCIPMathProgModel
    csip_heurdata::Ptr{Void}
    sol::Vector{Float64}
end

# this is the function that should fit the CSIP_HEURCALLBACK signature
function heurcb_wrapper(csip_model::Ptr{Void}, csip_heurdata::Ptr{Void},
                        userdata::Ptr{Void})
    # m, f = unsafe_pointer_to_objref(userdata)::(SCIPMathProgModel, Function)
    # WTF: TypeError: typeassert: expected Type{T}, got Tuple{DataType,DataType}
    m, f = unsafe_pointer_to_objref(userdata)
    d = SCIPHeurCallbackData(m, csip_heurdata, fill(NaN, numvar(m)))

    ret = f(d)
    ret == :Exit && _interrupt(m)

    return convert(Cint, 0) # CSIP_RETCODE_OK
end

function setheuristiccallback!(m::SCIPMathProgModel, f)
    # f is function(d::SCIPHeurCallbackData)

    cbfunction = cfunction(heurcb_wrapper, Cint, (Ptr{Void}, Ptr{Void}, Ptr{Void}))
    userdata = (m, f)

    _addHeuristicCallback(m, cbfunction, userdata)
end

# TODO: detect :MIPSol like with lazy constraints?
cbgetstate(d::SCIPHeurCallbackData) = :MIPNode

function cbgetlpsolution(d::SCIPHeurCallbackData, output)
    _heurGetVarValues(d.csip_heurdata, output)
end

function cbaddsolution!(d::SCIPHeurCallbackData)
    # check for unspecified values (NaN)
    complete = (findfirst(v -> v === NaN, d.sol) == 0)

    if complete
        # add solution that was filled from cbsetsolutionvalue
        _heurAddSolution(d.csip_heurdata, d.sol)
    else
        warn("Incomplete solutions not supported, skipping candidate.")
    end

    # reset solution vector for the next solution
    d.sol = fill(NaN, numvar(d.model))
end

function cbsetsolutionvalue!(d::SCIPHeurCallbackData, varidx, value)
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
const csip_op_to_id = Dict{Symbol, Cint}(
   :VARIDX    =>  1,
   :CONST     =>  2,
   :PARAM     =>  3,
   :MINUS     =>  9,
   :DIV       => 11,
   :SQRT      => 13,
   :REALPOWER => 14,
   :INTPOWER  => 15,
   :EXP       => 17,
   :LOG       => 18,
   #:SIN       => 19,
   #:COS       => 20,
   #:TAN       => 21,
   #:MIN       => 24,
   #:MAX       => 25,
   #:ABS       => 26,
   #:SIGN      => 27,
   :SUM       => 64,
   :PRODUCT   => 65,
)

# TODO: we do not need this!
const julia_op_to_csip_op = Dict{Symbol, Symbol}(
   :- => :MINUS,
   :/ => :DIV,
   :sqrt => :SQRT,
   :^ => :REALPOWER,
   :exp => :EXP,
   :log => :LOG,
   :+ => :SUM,
   :* => :PRODUCT
)

#inspired in ReverseDiffSparse's conversion.jl
immutable CSIPNodeData
    nodetype::Symbol
    childids::Array{Int}
end

# parse constraint expression into something easier for CSIP
function constr_expr_to_nodedata(ex::Expr)
    values = Float64[]
    csipex = CSIPNodeData[]

    # a ex.args is [side, comp, expr, comp, side] or [expr, comp, side]
    if length(ex.args) == 5 # two sided constraint
        expr_to_csip(ex.args[3], values, csipex)
    else
        @assert length(ex.args) == 3
        expr_to_csip(ex.args[1], values, csipex)
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
        push!(csipex, CSIPNodeData(:VARIDX, [ex.args[2]]))

    else # not supported I guess
        error("Unrecognized expression $ex: $(ex.head), probably not supported")
    end
    return length(csipex)
end

function expr_to_csip(ex::Number, values, csipex)
    valueidx = length(values)+1
    push!(values,ex)
    push!(csipex, CSIPNodeData(:CONST, [valueidx]))
    return length(csipex)
end


# the AbstractNLPEvaluator contains the constraints and objective.
# One can get different data from it (with initialize)
# SCIP doesn't need most of the data, just the epression
# TODO: code needs refactoring and cleaning
function loadproblem!(m::SCIPMathProgModel, numVars, numConstr,
                      l, u, lb, ub, sense, d::AbstractNLPEvaluator)
    # add variables
    for v in 1:numVars
        _addVar(m, float(l[v]), float(u[v]), Cint(3), Ptr{Cint}(C_NULL))
    end

    # we want to get the expressions
    initialize(d, [:ExprGraph])

    # add constraints
    for c in 1:numConstr
        csipex, values = constr_expr_to_nodedata(constr_expr(d, c))
        children = Cint[]
        beg = Cint[1]
        ops = Cint[]
        for node in csipex
            ops = [ops; csip_op_to_id[node.nodetype]]
            children = [children; node.childids]
            push!(beg, beg[end]+length(node.childids))
        end
        _addNonLinCons(m, Cint(length(ops)), ops,
                       convert(Vector{Cint},children - 1),
                       convert(Vector{Cint},beg - 1),
                       values, float(lb[c]), float(ub[c]),
                       Ptr{Cint}(C_NULL))
    end

    # add objective
    csipex, values = obj_expr_to_nodedata(obj_expr(d))
    children = Cint[]
    beg = Cint[1]
    ops = Cint[]
    for node in csipex
        ops = [ops; csip_op_to_id[node.nodetype]]
        children = [children; node.childids]
        push!(beg, beg[end]+length(node.childids))
        end
        _setNonlinearObj(m, Cint(length(ops)), ops,
                       convert(Vector{Cint},children - 1),
                       convert(Vector{Cint},beg - 1),
                       values)

    if sense == :Max
        _setSenseMaximize(m)
    else
        _setSenseMinimize(m)
    end
end
