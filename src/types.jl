export SCIPSolver

# Common inner model

type SCIPModel
    ptr_model::Ptr{Void}
    options
    lazy_userdata
    heur_userdata

    function SCIPModel(options...)
        _arr = Array(Ptr{Void}, 1)
        # TODO: check return code (everywhere!)
        ccall((:CSIPcreateModel, libcsip), Cint, (Ptr{Ptr{Void}}, ), _arr)
        m = new(_arr[1], options)
        @assert m.ptr_model != C_NULL

        finalizer(m, freescip)
        return m
    end
end

function freescip(m::SCIPModel)
    @assert m.ptr_model != C_NULL
    _freeModel(m)
end

# Linear Quadratic Model

type SCIPLinearQuadraticModel <: AbstractLinearQuadraticModel
    inner::SCIPModel
end

# Nonlinear Model

type SCIPNonlinearModel <: AbstractNonlinearModel
    inner::SCIPModel
end

# Union type for common behaviour

SCIPMathProgModel = Union{SCIPLinearQuadraticModel, SCIPNonlinearModel}

# Solver

type SCIPSolver <: AbstractMathProgSolver
    options
end

SCIPSolver(kwargs...) = SCIPSolver(kwargs)

function LinearQuadraticModel(s::SCIPSolver)
    m = SCIPLinearQuadraticModel(SCIPModel(s.options))
    setparams!(m)
    m
end

function NonlinearModel(s::SCIPSolver)
    m = SCIPNonlinearModel(SCIPModel(s.options))
    setparams!(m)
    m
end
