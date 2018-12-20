using MathOptInterface
const MOI = MathOptInterface

mutable struct Optimizer <: MOI.AbstractOptimizer
    mscip::ManagedSCIP
end
