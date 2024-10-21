# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

module SCIP

import LinearAlgebra
import OpenBLAS32_jll

# assorted utility functions
include("util.jl")

# load deps, version check
include("init.jl")

# wrapper of SCIP library
include("wrapper.jl")

# memory management
include("scip_data.jl")

include("sepa.jl")

include("cut_selector.jl")

include("heuristic.jl")

include("branching_rule.jl")

# constraint handlers
include("conshdlr.jl")

# constraints from nonlinear expressions
include("nonlinear.jl")

# implementation of MOI
include("MOI_wrapper.jl")

# convenience functions
include("convenience.jl")

# warn about rewrite
include("compat.jl")

# Event handler
include("event_handler.jl")
end
