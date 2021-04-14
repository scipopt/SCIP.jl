#
# Adding separators to SCIP.Optimizer.
#

"""
    include_sepa(
        o::Optimizer,
        sepa::SEPA;
        name::String,
        description::String,
        priority::Int,
        freq::Int,
        maxbounddist::Float,
        usesubscip::Bool,
        delay::Bool
    )

Include a user defined separator `sepa` to the SCIP optimizer instance `o`.

All parameters have default values, that can be set as keyword arguments.
"""
function include_sepa(o::Optimizer, sepa::SEPA;
                      name="", description="", priority=0, freq=1,
                      maxbounddist=0.0, usessubscip=false,
                      delay=false) where {SEPA <: AbstractSeparator}
    include_sepa(o.mscip, sepa, name=name, description=description,
                 priority=priority, freq=freq, maxbounddist=maxbounddist,
                 usessubscip=usessubscip, delay=delay)
end


#
# Separator for cutcallbacks.
#

mutable struct CutCbSeparator <: AbstractSeparator
    mscip::ManagedSCIP
    cutcallback::Function
end

# If no cut callback is given, the cut callback does nothing.
CutCbSeparator(mscip::ManagedSCIP) = CutCbSeparator(mscip, cb_data -> nothing)

"""
Used for an argument to the cut callback, which in turn uses that argument to
obtain the LP-solution via `MOI.get` and to add cuts via `MOI.submit`.
"""
mutable struct CutCbData
    sepa::CutCbSeparator
    "Did the cut callback call submit?"
    submit_called::Bool
end


function exec_lp(sepa::CutCbSeparator)
    cb_data = CutCbData(sepa, false)
    sepa.cutcallback(cb_data)
    return cb_data.submit_called ? SCIP_SEPARATED : SCIP_DIDNOTFIND
end


#
# MOI Interface for cutcallbacks
#

function MOI.get(o::Optimizer, ::MOI.CallbackVariablePrimal{CutCbData}, vi)
    return SCIPgetSolVal(o, C_NULL, var(o, vi))
end

function MOI.set(o::Optimizer, ::MOI.UserCutCallback, cb::Function)
    if o.moi_separator === nothing
        o.moi_separator = CutCbSeparator(o.mscip, cb)
        include_sepa(o, o.moi_separator)
    else
        o.moi_separator.cutcallback = cb;
    end
end
MOI.supports(::Optimizer, ::MOI.UserCutCallback) = true

function MOI.submit(o::Optimizer, cb_data::MOI.UserCut{CutCbData},
                    func::SAF, set::S) where S <: BOUNDS
    varrefs = [VarRef(t.variable_index.value) for t in func.terms]
    coefs = [t.coefficient for t in func.terms]

    lhs, rhs = bounds(set)
    lhs = lhs === nothing ? -SCIPinfinity(o) : lhs
    rhs = rhs === nothing ?  SCIPinfinity(o) : rhs

    add_cut_sepa(o.mscip, cb_data.callback_data.sepa, varrefs, coefs, lhs, rhs)
    cb_data.callback_data.submit_called = true
end
MOI.supports(::Optimizer, ::MOI.UserCut{CutCbData}) = true
