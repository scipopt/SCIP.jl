export SCIPSolver

# Model

type SCIPMathProgModel <: AbstractLinearQuadraticModel
    ptr_model::Ptr{Void}

    function SCIPMathProgModel()
        _arr = Array(Ptr{Void}, 1)
        # TODO: check return code (everywhere!)
        ccall((:CSIPcreateModel, csip), Cint, (Ptr{Ptr{Void}}, ), _arr)
        new(_arr[1])

        # QUESTION: Why is _arr not garbage-collected?
    end
end

# Solver

immutable SCIPSolver <: AbstractMathProgSolver
end
LinearQuadraticModel(s::SCIPSolver) = SCIPMathProgModel()
