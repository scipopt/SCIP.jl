#=
User have to implement
- A struct that inherit AbstractEventHandler
- An eventexec function
=#

abstract type AbstractEventhdlr end

function eventexec end;

function _eventexec(
    scip::Ptr{SCIP_},
    eventhdlr::Ptr{SCIP_Eventhdlr},
    event::Ptr{SCIP_Event},
    eventdata::Ptr{SCIP_EventData},
)
    # Get Julia object out of eventhandler data
    data::Ptr{SCIP_EventData} = SCIPeventhdlrGetData(eventhdlr)
    event = unsafe_pointer_to_objref(data)

    #call user method
    eventexec(event)
    return SCIP_OKAY
end

function include_event_handler(
    scip::Ptr{SCIP_},
    eventhdlrs::Dict{Any,Ptr{SCIP_Eventhdlr}},
    event_handler::EVENTHDLR;
    name="",
    desc="",
) where {EVENTHDLR<:AbstractEventhdlr}
    _eventexec = @cfunction(
        _eventexec,
        SCIP_RETCODE,
        (Ptr{SCIP_}, Ptr{SCIP_Eventhdlr}, Ptr{SCIP_Event}, Ptr{SCIP_EventData})
    )

    eventhdlrptr = Ref{Ptr{SCIP_Eventhdlr}}(C_NULL)
    eventhdlr = pointer_from_objref(event_handler)

    if name == ""
        name = "__eventhdlr__$(length(eventhdlrs))"
    end

    @SCIP_CALL SCIPincludeEventhdlrBasic(
        scip,
        eventhdlrptr,
        name,
        desc,
        _eventexec,
        eventhdlr,
    )

    @assert eventhdlrptr[] != C_NULL
    #Persist in scip store against GC
    eventhdlrs[event_handler] = eventhdlrptr[]
end

function catch_event(
    scip::Ptr{SCIP_},
    eventtype::SCIP_EVENTTYPE,
    eventhdlrs::Dict{Any,Ptr{SCIP_Eventhdlr}},
    eventhdlr::EVENTHDLR,
) where {EVENTHDLR<:AbstractEventhdlr}
    @assert SCIPgetStage(scip) != SCIP_STAGE_INIT
    @assert SCIPgetStage(scip) != SCIP_STAGE_PROBLEM
    eventhdlrptr = eventhdlrs[eventhdlr]
    @SCIP_CALL SCIPcatchEvent(scip, eventtype, eventhdlrptr, C_NULL, C_NULL)
end
