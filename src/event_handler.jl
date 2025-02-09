# Wrapper for implementing event handlers in SCIP.
# Before using please familiaze yourself with https://scipopt.org/doc/html/EVENT.php
# 
# The basic idea here is the same as with the separator wrappers. First, you need
# to define a structure that implements the abstract type `AbstractEventhdlr`.
# Second you should implement the function `eventexec` where the argument is an
# instance of your event handler structure. Third, you should at runtime instantiate
# the structure and call `include_event_handler` to register the event handler with SCIP.
# 
# See eventhdlr.jl in the test folder for an example.
# 
abstract type AbstractEventhdlr end

""" 
This is a virtual function that must be implemented by the user. Its Only
argument is the event handler object.
"""
function eventexec(event::T) where {T<:AbstractEventhdlr}
    error("eventexec not implemented for type $(T)")
end

"""
Virtual function for eventinit. By default it does nothing
"""
function eventinit(event::T) where {T<:AbstractEventhdlr}
    return
end

"""
Virtual function for eventexit. By default it does nothing
"""
function eventexit(event::T) where {T<:AbstractEventhdlr}
    return
end
"""
This is the function that will be converted to a C function. It signature
matches the one given in the SCIP documentation for SCIP_DECL_EVENTEXEC.

Only the eventhdlr object is passed to the function which is user defined.
"""
function _eventexec(
    scip::Ptr{SCIP_},
    eventhdlr::Ptr{SCIP_Eventhdlr},
    event::Ptr{SCIP_Event},
    eventdata::Ptr{SCIP_EventData},
)::SCIP_RETCODE
    # Get Julia object out of eventhandler data
    data::Ptr{SCIP_EventData} = SCIPeventhdlrGetData(eventhdlr)
    event = unsafe_pointer_to_objref(data)

    #call user method
    eventexec(event)
    return SCIP_OKAY
end

"""
This is the function that will be converted to a C function. It signature
matches the one given in the SCIP documentation for SCIP_DECL_EVENTINIT.
"""
function _eventinit(
    scip::Ptr{SCIP_},
    eventhdlr::Ptr{SCIP_Eventhdlr},
)::SCIP_RETCODE
    # Get Julia object out of eventhandler data
    data::Ptr{SCIP_EventData} = SCIPeventhdlrGetData(eventhdlr)
    event = unsafe_pointer_to_objref(data)

    #call user method
    eventinit(event)
    return SCIP_OKAY
end
"""
This is the function that will be converted to a C function. It signature
matches the one given in the SCIP documentation for SCIP_DECL_EVENTEXIT.
"""

function _eventexit(
    scip::Ptr{SCIP_},
    eventhdlr::Ptr{SCIP_Eventhdlr},
)::SCIP_RETCODE
    data::Ptr{SCIP_EventData} = SCIPeventhdlrGetData(eventhdlr)
    event = unsafe_pointer_to_objref(data)
    eventexit(event)
    return SCIP_OKAY
end
"""
    include_event_handler(scipd::SCIP.SCIPData, event_handler::EVENTHDLR; name="", desc="")

Include the event handler in SCIP. WARNING! In contrast to the separator wrapper you only need to 
pass the SCIPData rather than the SCIP pointer and dictionary. 

# Arguments
- scipd::SCIP.SCIPData: The SCIPData object
- event_handler::EVENTHDLR: The event handler object
- name::String: The name of the event handler
- desc::String: The description of the event handler
"""
function include_event_handler(
    scipd::SCIP.SCIPData,
    event_handler::EVENTHDLR;
    name="",
    desc="",
) where {EVENTHDLR<:AbstractEventhdlr}
    _eventinit =
        @cfunction(_eventinit, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_Eventhdlr}))
    _eventexit =
        @cfunction(_eventexit, SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_Eventhdlr}))
    _eventexec = @cfunction(
        _eventexec,
        SCIP_RETCODE,
        (Ptr{SCIP_}, Ptr{SCIP_Eventhdlr}, Ptr{SCIP_Event}, Ptr{SCIP_EventData})
    )

    eventhdlrptr = Ref{Ptr{SCIP_Eventhdlr}}(C_NULL)
    eventhdlr = pointer_from_objref(event_handler)

    if name == ""
        name = "__eventhdlr__$(length(scipd.eventhdlrs))"
    end

    @SCIP_CALL SCIPincludeEventhdlrBasic(
        scipd.scip[],
        eventhdlrptr,
        name,
        desc,
        _eventexec,
        eventhdlr,
    )
    @SCIP_CALL SCIPsetEventhdlrInit(scipd.scip[], eventhdlrptr[], _eventinit)
    @SCIP_CALL SCIPsetEventhdlrExit(scipd.scip[], eventhdlrptr[], _eventexit)
    @assert eventhdlrptr[] != C_NULL
    #Persist in scip store against GC
    scipd.eventhdlrs[event_handler] = eventhdlrptr[]
end

"""
    catch_event(scipd::SCIP.SCIPData, eventtype::SCIP_EVENTTYPE, eventhdlr::EVENTHDLR)

Catch an event in SCIP. This function is a wrapper around the SCIPcatchEvent function.
Warning! This function should only be called after the SCIP has been transformed.
Use this instead of calling SCIPcatchEvent directly.
"""
function catch_event(
    scipd::SCIP.SCIPData,
    eventtype::SCIP_EVENTTYPE,
    eventhdlr::EVENTHDLR,
) where {EVENTHDLR<:AbstractEventhdlr}
    @assert SCIPgetStage(scipd) != SCIP_STAGE_INIT
    @assert SCIPgetStage(scipd) != SCIP_STAGE_PROBLEM
    eventhdlrptr = scipd.eventhdlrs[eventhdlr]
    @SCIP_CALL SCIPcatchEvent(scipd, eventtype, eventhdlrptr, C_NULL, C_NULL)
end

""" 
    drop_event(scipd::SCIP.SCIPData, eventtype::SCIP_EVENTTYPE, eventhdlr::EVENTHDLR)

Drop an event in SCIP. This function is a wrapper around the SCIPdropEvent function.
Warning! This function should only be called after the SCIP has been transformed.
Use this instead of calling SCIPdropEvent directly.
"""
function drop_event(
    scipd::SCIP.SCIPData,
    eventtype::SCIP_EVENTTYPE,
    eventhdlr::EVENTHDLR,
) where {EVENTHDLR<:AbstractEventhdlr}
    @assert SCIPgetStage(scipd) != SCIP_STAGE_INIT
    @assert SCIPgetStage(scipd) != SCIP_STAGE_PROBLEM
    eventhdlrptr = scipd.eventhdlrs[eventhdlr]
    @SCIP_CALL SCIPdropEvent(scipd, eventtype, eventhdlrptr, C_NULL, -1)
end