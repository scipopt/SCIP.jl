export SCIPSolver

# Linear Quadratic Model

type SCIPMathProgModel <: AbstractLinearQuadraticModel
    ptr_model::Ptr{Void}
    options
    lazy_userdata
    heur_userdata

    function SCIPMathProgModel(options...)
        _arr = Array(Ptr{Void}, 1)
        # TODO: check return code (everywhere!)
        ccall((:CSIPcreateModel, libcsip), Cint, (Ptr{Ptr{Void}}, ), _arr)
        m = new(_arr[1], options)
        # QUESTION: Why is _arr not garbage-collected?
        setparams!(m)
        return m
    end
end

# Nonlinear Model

type SCIPNonlinearModel <: AbstractNonlinearModel
    m::SCIPMathProgModel
end

# Solver

type SCIPSolver <: AbstractMathProgSolver
    options
end
SCIPSolver(kwargs...) = SCIPSolver(kwargs)
LinearQuadraticModel(s::SCIPSolver) = SCIPMathProgModel(s.options)
NonlinearModel(s::SCIPSolver) = SCIPMathProgModel(s.options)
