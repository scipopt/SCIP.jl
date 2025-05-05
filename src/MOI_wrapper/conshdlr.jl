# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

"""
    include_conshdlr(
        o::Optimizer,
        ch::CH;
        name::String,
        description::String,
        enforce_priority::Int,
        check_priority::Int,
        eager_frequency::Int,
        needs_constraints::Bool
    )

Include a user defined constraint handler `ch` to SCIP optimizer instance `o`.

All parameters have default values that can be set as keyword arguments.
In particular, note the boolean `needs_constraints`:
* If set to `true`, then the callbacks are only called for the constraints that
  were added explicitly using `add_constraint`.
* If set to `false`, the callback functions will always be called, even if no
  corresponding constraint was added. It probably makes sense to set
  `misc/allowdualreds` to `FALSE` in this case.
"""
function include_conshdlr(
    o::Optimizer,
    ch::AbstractConstraintHandler;
    kwargs...,
)
    return include_conshdlr(o.inner.scip[], o.inner.conshdlrs, ch; kwargs...)
end

"""
    add_constraint(
        o::Optimizer,
        ch::CH,
        c::C;
        initial=true,
        separate=true,
        enforce=true,
        check=true,
        propagate=true,
        _local=false,
        modifiable=false,
        dynamic=false,
        removable=false,
        stickingatnode=false
    )::ConsRef


Add constraint `c` belonging to user-defined constraint handler `ch` to model.
Returns constraint reference.

All keyword arguments are passed to the `SCIPcreateCons` call.
"""
function add_constraint(
    o::Optimizer,
    ch::CH,
    c::AbstractConstraint{CH};
    kwargs...,
) where {CH<:AbstractConstraintHandler}
    return add_constraint(o.inner, ch, c; kwargs...)
end

function include_cutsel(o::Optimizer, cutsel::AbstractCutSelector; kwargs...)
    return include_cutsel(
        o.inner.scip[],
        cutsel,
        o.inner.cutsel_storage;
        kwargs...,
    )
end

function include_branchrule(
    o::Optimizer,
    branchrule::AbstractBranchingRule;
    kwargs...,
)
    return include_branchrule(
        o.inner.scip[],
        branchrule,
        o.inner.branchrule_storage;
        kwargs...,
    )
end
