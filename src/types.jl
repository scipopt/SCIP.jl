export SCIPSolver

# Common inner model

mutable struct SCIPModel
    ptr_model::Ptr{Cvoid}
    options
    lazy_userdata
    heur_userdata

    function SCIPModel(options...)
        _arr = Array{Ptr{Cvoid}}(undef, 1)
        # TODO: check return code (everywhere!)
        ccall((:CSIPcreateModel, libcsip), Cint, (Ptr{Ptr{Cvoid}}, ), _arr)
        m = new(_arr[1], options)
        @assert m.ptr_model != C_NULL

        finalizer(freescip, m)
        return m
    end
end

function freescip(m::SCIPModel)
    # aCvoid double free
    if m.ptr_model != C_NULL
        _freeModel(m)
        m.ptr_model = C_NULL
    end
end

# Linear Quadratic Model

struct SCIPLinearQuadraticModel <: MathProgBase.AbstractLinearQuadraticModel
    inner::SCIPModel
end

# Nonlinear Model

struct SCIPNonlinearModel <: MathProgBase.AbstractNonlinearModel
    inner::SCIPModel
end

# Union type for common behaviour

const SCIPMathProgModel = Union{SCIPLinearQuadraticModel, SCIPNonlinearModel}

# Solver

mutable struct SCIPSolver <: MathProgBase.AbstractMathProgSolver
    options
    prefix

    function SCIPSolver(kwargs...; prefix=nothing)
        new(kwargs, prefix)
    end
end

function MathProgBase.LinearQuadraticModel(s::SCIPSolver)
    m = SCIPLinearQuadraticModel(SCIPModel(s.options))
    setparams!(m)
    setprefix!(m, s.prefix)
    m
end

function MathProgBase.NonlinearModel(s::SCIPSolver)
    m = SCIPNonlinearModel(SCIPModel(s.options))
    setparams!(m)
    setprefix!(m, s.prefix)
    m
end

MathProgBase.ConicModel(s::SCIPSolver) = MathProgBase.LPQPtoConicBridge(MathProgBase.LinearQuadraticModel(s))
MathProgBase.supportedcones(::SCIPSolver) = [:Free,:Zero,:NonNeg,:NonPos,:SOC]
