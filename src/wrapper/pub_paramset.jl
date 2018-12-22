# Julia wrapper for header: /usr/include/scip/pub_paramset.h
# Automatically generated using Clang.jl wrap_c


function SCIPparamGetType(param)
    ccall((:SCIPparamGetType, libscip), SCIP_PARAMTYPE, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetName(param)
    ccall((:SCIPparamGetName, libscip), Cstring, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetDesc(param)
    ccall((:SCIPparamGetDesc, libscip), Cstring, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetData(param)
    ccall((:SCIPparamGetData, libscip), Ptr{SCIP_PARAMDATA}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsAdvanced(param)
    ccall((:SCIPparamIsAdvanced, libscip), UInt32, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsFixed(param)
    ccall((:SCIPparamIsFixed, libscip), UInt32, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamSetFixed(param, fixed)
    ccall((:SCIPparamSetFixed, libscip), Cvoid, (Ptr{SCIP_PARAM}, UInt32), param, fixed)
end

function SCIPparamGetBool(param)
    ccall((:SCIPparamGetBool, libscip), UInt32, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetBoolDefault(param)
    ccall((:SCIPparamGetBoolDefault, libscip), UInt32, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetInt(param)
    ccall((:SCIPparamGetInt, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntMin(param)
    ccall((:SCIPparamGetIntMin, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntMax(param)
    ccall((:SCIPparamGetIntMax, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntDefault(param)
    ccall((:SCIPparamGetIntDefault, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongint(param)
    ccall((:SCIPparamGetLongint, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintMin(param)
    ccall((:SCIPparamGetLongintMin, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintMax(param)
    ccall((:SCIPparamGetLongintMax, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintDefault(param)
    ccall((:SCIPparamGetLongintDefault, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetReal(param)
    ccall((:SCIPparamGetReal, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealMin(param)
    ccall((:SCIPparamGetRealMin, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealMax(param)
    ccall((:SCIPparamGetRealMax, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealDefault(param)
    ccall((:SCIPparamGetRealDefault, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetChar(param)
    ccall((:SCIPparamGetChar, libscip), UInt8, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetCharAllowedValues(param)
    ccall((:SCIPparamGetCharAllowedValues, libscip), Cstring, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetCharDefault(param)
    ccall((:SCIPparamGetCharDefault, libscip), UInt8, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetString(param)
    ccall((:SCIPparamGetString, libscip), Cstring, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetStringDefault(param)
    ccall((:SCIPparamGetStringDefault, libscip), Cstring, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsDefault(param)
    ccall((:SCIPparamIsDefault, libscip), UInt32, (Ptr{SCIP_PARAM},), param)
end
