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

end
