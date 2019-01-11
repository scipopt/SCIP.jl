module SCIP

# load deps, version check
include("init.jl")

# wrapper of SCIP library
include("wrapper.jl")

# memory management
include("managed_scip.jl")

# implementation of MOI
include("MOI_wrapper.jl")

# warn about rewrite
include("compat.jl")

end
