using SCIP
import MathOptInterface as MOI

module FirstLPEventTest

using SCIP

mutable struct FirstLPEvent <: SCIP.AbstractEventhdlr
    scip::SCIP.SCIPData
    firstlpobj::Float64
end

function SCIP.eventexec(event::FirstLPEvent)
    scip = event.scip
    event.firstlpobj = SCIP.SCIPgetLPObjval(scip)
end

end

@testset "Try To Listen To First LP Solve" begin
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

    # maximize x + y
    MOI.set(
        optimizer,
        MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}(),
        MOI.ScalarAffineFunction(
            MOI.ScalarAffineTerm.([1.0, 1.0], [x, y]),
            0.0,
        ),
    )
    MOI.set(optimizer, MOI.ObjectiveSense(), MOI.MAX_SENSE)
    print(inner.scip[])
    # add the separator
    eventhdlr = FirstLPEventTest.FirstLPEvent(inner, -1.0)
    SCIP.include_event_handler(inner.scip[], inner.eventhdlrs, eventhdlr)
    SCIP.catch_event(
        inner.scip[],
        SCIP.SCIP_EVENTTYPE_FIRSTLPSOLVED,
        inner.eventhdlrs,
        eventhdlr,
    )

    # solve the problem
    SCIP.@SCIP_CALL SCIP.SCIPsolve(inner.scip[])

    # test if the event handler worked 
    @test eventhdlr.firstlpobj == 1.5

    # free the problem
    finalize(inner)
end