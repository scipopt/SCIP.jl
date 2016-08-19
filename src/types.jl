export SCIPSolver

# Model

type SCIPMathProgModel <: AbstractLinearQuadraticModel
    ptr_model::Ptr{Void}
    options

    function SCIPMathProgModel(options...)
        _arr = Array(Ptr{Void}, 1)
        # TODO: check return code (everywhere!)
        ccall((:CSIPcreateModel, csip), Cint, (Ptr{Ptr{Void}}, ), _arr)
        m = new(_arr[1], options)
        # QUESTION: Why is _arr not garbage-collected?
        setparams!(m)
        return m
    end
end

# Solver

immutable SCIPSolver <: AbstractMathProgSolver
    options
end
SCIPSolver(kwargs...) = SCIPSolver(kwargs)
LinearQuadraticModel(s::SCIPSolver) = SCIPMathProgModel(s.options)
