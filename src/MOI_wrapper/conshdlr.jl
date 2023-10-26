# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

#
# Adding constraint handlers, constraints, and cut selectors to SCIP.Optimizer.
#

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
    ch::CH;
    name="",
    description="",
    enforce_priority=-15,
    check_priority=-7000000,
    eager_frequency=100,
    needs_constraints=true,
) where {CH<:AbstractConstraintHandler}
    include_conshdlr(
        o.inner.scip[],
        o.inner.conshdlrs,
        ch;
        name=name,
        description=description,
        enforce_priority=enforce_priority,
        check_priority=check_priority,
        eager_frequency=eager_frequency,
        needs_constraints=needs_constraints,
    )
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
    stickingatnode=false,
) where {CH<:AbstractConstraintHandler,C<:AbstractConstraint{CH}}
    return add_constraint(
        o.inner,
        ch,
        c;
        initial=initial,
        separate=separate,
        enforce=enforce,
        check=check,
        propagate=propagate,
        _local=_local,
        modifiable=modifiable,
        dynamic=dynamic,
        removable=removable,
        stickingatnode=stickingatnode,
    )
end

function include_cutsel(
    o::Optimizer,
    cutsel::CS;
    name="",
    description="",
    priority=10000,
) where {CS<:AbstractCutSelector}
    return include_cutsel(
        o.inner.scip[],
        cutsel,
        o.inner.cutsel_storage;
        name=name,
        description=description,
        priority=priority,
    )
end

function include_branchrule(
    o::Optimizer,
    branchrule::BR;
    name="",
    description="",
    priority=10000,
) where {BR<:AbstractBranchingRule}
    return include_branchrule(
        o.inner.scip[],
        branchrule,
        o.inner.branchrule_storage;
        name=name,
        description=description,
        priority=priority,
    )
end
