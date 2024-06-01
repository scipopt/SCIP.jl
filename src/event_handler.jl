#=
User have to implement
- A struct that inherit AbstractEventHandler
- An eventexec function
=#
"""
Abstract eventhander
"""
abstract type AbstractEventHandler end

function eventexec end;

function _eventexec(
    scip::Ptr{SCIP_},
    eventhdlr::Ptr{SCIP_Eventhdlr},
    event::Ptr{SCIP_Event},
    eventdata::Ptr{SCIP_EventData}
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
    name = "",
    desc = ""
    ) where {EVENTHDLR <: AbstractEventHandler}
    _eventexec = @cfunction(
        _eventexec,
        SCIP_RETCODE,
        (
            Ptr{SCIP_},
            Ptr{SCIP_Eventhdlr},
            Ptr{SCIP_Event},
            Ptr{SCIP_EventData}
        )
    )
    c_handler = Ref{Ptr{SCIP_Eventhdlr}}(C_NULL)
    event_handler_data = pointer_from_objref(event_handler)

    if name == ""
        name = "__eventhdlr__$(length(eventhdlrs))"
    end

    @SCIP_CALL SCIPincludeEventhdlrBasic(
        scip,
        c_handler,
        name,
        desc,
        _eventexec,
        event_handler_data
    )
    println("hello"*string(c_handler[]))
    @assert c_handler[] != C_NULL

    #Persist in scip store against GC
    eventhdlrs[event_handler] = c_handler[]

end
