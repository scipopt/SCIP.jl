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

# Not supported by SCIP or CSIP, but expected from MPB for `linprog`.
getreducedcosts(m::SCIPMathProgModel) = error("Reduced costs not available through SCIP")
getconstrduals(m::SCIPMathProgModel) = error("Duals not available through SCIP")
getinfeasibilityray(m::SCIPMathProgModel) = error("Infeasibility ray not available through SCIP")
getunboundedray(m::SCIPMathProgModel) = error("Unbounded ray not available through SCIP")

###########################################################################
##### Methods specific to AbstractLinearQuadraticModel                #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/lpqcqp.html #####
###########################################################################

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

##########################################################################
##### Methods specific to MIP Callbacks                              #####
##########################################################################

# use a different type for heuristic callback and multiple dispatch to implements
# the methods that they share
type SCIPLazyCallbackData <: MathProgCallbackData
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

function cbgetlpsolution(d::SCIPLazyCallbackData)
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

##########################################################################
##### Methods specific to AbstractConicModel                         #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/conic.html #####
##########################################################################

########################################################################
##### Methods specific to AbstractNonlinear                        #####
##### see: http://mathprogbasejl.readthedocs.io/en/latest/nlp.html #####
########################################################################
