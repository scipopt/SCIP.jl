# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Nonlinear constraints (objective not supported)

MOI.supports(::Optimizer, ::MOI.NLPBlock) = true

function MOI.set(o::Optimizer, ::MOI.NLPBlock, data::MOI.NLPBlockData)
    # We don't actually store the data (to be queried later during the solve
    # process). Instead, we extract the expression graphs and add the
    # corresponding constraints to the model directly.
    if data.has_objective
        error("Nonlinear objective not supported by SCIP.jl!")
    end

    # go back to problem stage
    allow_modification(o::Optimizer)

    MOI.initialize(data.evaluator, [:ExprGraph])
    for i in 1:length(data.constraint_bounds)
        expr = MOI.constraint_expr(data.evaluator, i)
        bounds = data.constraint_bounds[i]
        cr = add_nonlinear_constraint(o.inner, expr, bounds.lower, bounds.upper)
        # Not registering or returning constraint reference!
    end

    return nothing
end
