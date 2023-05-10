module SCIP

# assorted utility functions
include("util.jl")

# load deps, version check
include("init.jl")

# wrapper of SCIP library
include("wrapper.jl")

# memory management
include("scip_data.jl")

# separators
include("sepa.jl")

# cut selectors
include("cut_selector.jl")

# branching rule
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
