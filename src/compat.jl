export SCIPSolver

# dummy implementation to tell users about transition to MathOptInterface
function SCIPSolver(args...; kwargs...)
    error(
        "Support for MathProgBase was dropped. " *
        "Please downgrade to v0.6.1, see README for details.",
    )
end
