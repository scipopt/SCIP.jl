module DummySepa

using SCIP

# Define a minimal no-op separator.
# Needs to be mutable for `pointer_from_objref` to work.
mutable struct Sepa <: SCIP.AbstractSeparator
    called::Int64

    Sepa() = new(0)
end

# Implement only the fundamental callbacks:
function SCIP.exec_lp(sepa::Sepa)
    sepa.called += 1
    return SCIP.SCIP_DIDNOTRUN
end

end # module Dummy


module AddSingleCut

using SCIP

# Define a separator, that 
# Needs to be mutable for `pointer_from_objref` to work.
mutable struct Sepa <: SCIP.AbstractSeparator
    mscip::SCIP.ManagedSCIP
    varrefs::AbstractArray{SCIP.VarRef}
    coefs::AbstractArray{Float64}
    lhs::Float64
    rhs::Float64
end

# Implement only the fundamental callbacks:
function SCIP.exec_lp(sepa::Sepa)
    SCIP.add_cut_sepa(sepa.mscip, sepa, sepa.varrefs, sepa.coefs,
                      sepa.lhs, sepa.rhs, removable=false)
    return SCIP.SCIP_SEPARATED
end

end # module SelectSol
