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
    varindices = Vector{Cint}(0:nvars-1)

    for v in 1:ncols
        # TODO: define enum for vartype?
        _addVar(m.ptr_model, varlb[v], varub[v], Cint(3), Ptr{Cint}(C_NULL))
    end
    for c in 1:nrows
        # TODO: care about sparse matrices
        denserow = collect(A[c, :])
        _addLinCons(m.ptr_model, nvars, varindices, denserow, rowlb[c], rowub[c], Ptr{Cint}(C_NULL))
    end

    _setObj(m.ptr_model, nvars, varindices, obj)

    # TODO: set sense
end

optimize!(m::SCIPMathProgModel) = _solve(m.ptr_model)

function status(m::SCIPMathProgModel)
    statusmap = [:Optimal,
                 :Infeasible,
                 :Unbounded,
                 :InfeasibleOrUnbounded,
                 :UserLimit, # node limit
                 :UserLimit, # time limit
                 :UserLimit, # memory limit
                 :UserLimit, # user limit
                 :Unknown
                 ]
    stat = _getStatus(m.ptr_model)
    return statusmap[stat + 1]
end
