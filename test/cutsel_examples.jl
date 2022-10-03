using SCIP
import MathOptInterface
const MOI = MathOptInterface
using Test
using LinearAlgebra

"""
Selects cut by efficacy only, selects up to `nmax_cuts` cuts.
"""
mutable struct EfficacyCutSelector <: SCIP.AbstractCutSelector
    o::SCIP.Optimizer
    nmax_cuts::Int
    ncalls::Int
end

function SCIP.select_cuts(cutsel::EfficacyCutSelector, scip, cuts::Vector{Ptr{SCIP.SCIP_ROW}}, forced_cuts::Vector{Ptr{SCIP.SCIP_ROW}}, root::Bool, maxnslectedcuts::Integer)
    efficacies = SCIP.LibSCIP.SCIPgetCutEfficacy.(cutsel.o.inner.scip[], C_NULL, cuts)
    function efficacy_function(cut)
        if cut == C_NULL
            return -Inf
        end
        return SCIP.LibSCIP.SCIPgetCutEfficacy(cutsel.o.inner.scip[], C_NULL, cut)
    end
    @show count(==(C_NULL), cuts)
    sort!(cuts, by=efficacy_function, rev=true)
    for cut in cuts
        @assert cut != C_NULL
    end
    nselected = min(cutsel.nmax_cuts, maxnslectedcuts - length(forced_cuts))
    nselected = max(nselected, 0)
    cutsel.ncalls += 1
    @info "done"
    return (SCIP.SCIP_OKAY, nselected, SCIP.SCIP_SUCCESS)
end

@testset "test cut selector" begin
    # removing presolving to solve a non-trivial problem that requires some separation
    o = SCIP.Optimizer(presolving_maxrounds=0)
    # MOI.set(o, MOI.Silent(), true)

    cutsel = EfficacyCutSelector(o, 10, 0)
    name = "my_cut_selector"
    description = "a selector using efficacy only"
    priority = 15_000
    SCIP.include_cutsel(o, cutsel, name=name, description=description, priority=priority)
    cutsel_pointer = o.inner.cutsel_storage[cutsel]
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetName(cutsel_pointer)) == name
    @test unsafe_string(SCIP.LibSCIP.SCIPcutselGetDesc(cutsel_pointer)) == description
    @test SCIP.LibSCIP.SCIPcutselGetPriority(cutsel_pointer) == priority
    @test SCIP.LibSCIP.SCIPcutselGetData(cutsel_pointer) == pointer_from_objref(cutsel)

    x = MOI.add_variables(o, 10)
    MOI.add_constraint.(o, x, MOI.Integer())
    MOI.add_constraint.(o, x, MOI.GreaterThan(-0.1))
    MOI.add_constraint.(o, x, MOI.LessThan(2.3))
    MOI.add_constraint(o, sum(x, init=0.0), MOI.LessThan(12.5))
    for _ in 1:5
        MOI.add_constraint(o, 2.0 * dot(rand(10), x), MOI.LessThan(10.0 + 2 * rand()))
    end
    func = -dot(rand(10), x)
    MOI.set(o, MOI.ObjectiveFunction{typeof(func)}(), func)
    MOI.set(o, MOI.ObjectiveSense(), MOI.MIN_SENSE)
    
    MOI.optimize!(o)

end
