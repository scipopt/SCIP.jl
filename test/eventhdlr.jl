# A simple testcase to test the event handler functionality.
# It is assumed that test/sepa_support.jl is already included
using SCIP
import MathOptInterface as MOI
using Test
module FirstLPEventTest
# A simple event handler that stores the objective value of the first LP solve at the root node
using SCIP

mutable struct FirstLPEvent <: SCIP.AbstractEventhdlr
    scip::SCIP.SCIPData
    firstlpobj::Float64
end

function SCIP.eventexec(event::FirstLPEvent)
    # Only consider the root node
    current_node = SCIP.SCIPgetFocusNode(event.scip)
    depth = SCIP.SCIPnodeGetDepth(current_node)
    if depth == 0
        scip = event.scip
        event.firstlpobj = SCIP.SCIPgetLPObjval(scip)
    end
end

function SCIP.eventinit(event::FirstLPEvent)
    SCIP.catch_event(event.scip, SCIP.SCIP_EVENTTYPE_FIRSTLPSOLVED, event)
    return
end

function SCIP.eventexit(event::FirstLPEvent)
    SCIP.drop_event(event.scip, SCIP.SCIP_EVENTTYPE_FIRSTLPSOLVED, event)
    return
end

end
@testset "Listen to first LP solve" begin
    using .FirstLPEventTest
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))

    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )

    # minimize -x - y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([-1.0, -1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    # add eventhandler 
    eventhdlr = FirstLPEventTest.FirstLPEvent(inner, 10)
    SCIP.include_event_handler(
        inner,
        eventhdlr;
        desc="Store the objective value of the first LP solve at the root node",
    )

    # transform the problem into SCIP
    SCIP.@SCIP_CALL SCIP.SCIPtransformProb(inner)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # test if the event handler worked 
    @test eventhdlr.firstlpobj != 10.0

    # free the problem
    finalize(inner)
end

@testset "Nameless Event handler" begin
    using .FirstLPEventTest
    # create an empty problem
    optimizer = SCIP.Optimizer()
    inner = optimizer.inner
    sepa_set_scip_parameters((par, val) -> SCIP.set_parameter(inner, par, val))

    # add variables
    x, y = MOI.add_variables(optimizer, 2)
    MOI.add_constraint(optimizer, x, MOI.ZeroOne())
    MOI.add_constraint(optimizer, y, MOI.ZeroOne())

    # add constraint: x + y ≤ 1.5
    MOI.add_constraint(
        optimizer,
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
        MOI.LessThan(1.5),
    )

    # minimize -x - y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([-1.0, -1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MIN_SENSE)

    # add eventhandler 
    eventhdlr = FirstLPEventTest.FirstLPEvent(inner, 10)
    SCIP.include_event_handler(
        inner,
        eventhdlr;
        desc="Store the objective value of the first LP solve at the root node",
    )

    # transform the problem into SCIP
    SCIP.@SCIP_CALL SCIP.SCIPtransformProb(inner)

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # test if the event handler worked 
    @test eventhdlr.firstlpobj != 10.0

    # free the problem
    finalize(inner)
end
