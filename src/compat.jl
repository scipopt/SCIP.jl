# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

export SCIPSolver

# dummy implementation to tell users about transition to MathOptInterface
function SCIPSolver(args...; kwargs...)
    error(
        "Support for MathProgBase was dropped. " *
        "Please downgrade to v0.6.1, see README for details.",
    )
end
