# Julia wrapper for header: /usr/include/scip/scip_timing.h
# Automatically generated using Clang.jl wrap_c


function SCIPgetTimeOfDay(scip)
    ccall((:SCIPgetTimeOfDay, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPcreateClock(scip, clck)
    ccall((:SCIPcreateClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPcreateCPUClock(scip, clck)
    ccall((:SCIPcreateCPUClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPcreateWallClock(scip, clck)
    ccall((:SCIPcreateWallClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPfreeClock(scip, clck)
    ccall((:SCIPfreeClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPresetClock(scip, clck)
    ccall((:SCIPresetClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPstartClock(scip, clck)
    ccall((:SCIPstartClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPstopClock(scip, clck)
    ccall((:SCIPstopClock, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPenableOrDisableStatisticTiming(scip)
    ccall((:SCIPenableOrDisableStatisticTiming, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPstartSolvingTime(scip)
    ccall((:SCIPstartSolvingTime, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPstopSolvingTime(scip)
    ccall((:SCIPstopSolvingTime, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPgetClockTime(scip, clck)
    ccall((:SCIPgetClockTime, libscip), Cdouble, (Ptr{SCIP_}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPsetClockTime(scip, clck, sec)
    ccall((:SCIPsetClockTime, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_CLOCK}, Cdouble), scip, clck, sec)
end

function SCIPgetTotalTime(scip)
    ccall((:SCIPgetTotalTime, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetSolvingTime(scip)
    ccall((:SCIPgetSolvingTime, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetReadingTime(scip)
    ccall((:SCIPgetReadingTime, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetPresolvingTime(scip)
    ccall((:SCIPgetPresolvingTime, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetFirstLPTime(scip)
    ccall((:SCIPgetFirstLPTime, libscip), Cdouble, (Ptr{SCIP_},), scip)
end
