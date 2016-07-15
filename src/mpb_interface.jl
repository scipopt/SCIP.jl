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

# Interface

function loadproblem!(m::SCIPMathProgModel, A, varlb, varub, obj, rowlb, rowub, sense)
    # TODO: clean old model?

    nrows, ncols = size(A)
    nvars = Cint(ncols)
    varindices = Vector{Cint}(1:nvars)

    for v in 1:ncols
        # TODO: define enum for vartype?
        _addVar(m.ptr_model, varlb[v], varub[v], 3, C_NULL)
    end
    for c in 1:nrows
        # TODO: care about sparse matrices
        denserow = collect(A[c, :])
        _addLinCons(m.ptr_model, nvars, varindices, denserow, rowlb[c], rowub[c], C_NULL)
    end

    _setObj(m.ptr_model, nvars, varindices, obj)

    # TODO: set sense
end
