module SCIP

# assorted utility functions
include("util.jl")

# load deps, version check
include("init.jl")

# wrapper of SCIP library
include("wrapper.jl")

# memory management
include("managed_scip.jl")

# constraints from nonlinear expressions
include("nonlinear.jl")

# constraint handlers
include("conshdlr.jl")

# implementation of MOI
include("MOI_wrapper.jl")

# warn about rewrite
include("compat.jl")

end
