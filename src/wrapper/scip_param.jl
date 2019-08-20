# Julia wrapper for header: /usr/include/scip/scip_param.h
# Automatically generated using Clang.jl wrap_c


function SCIPaddBoolParam(scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
    ccall((:SCIPaddBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Ptr{UInt32}, UInt32, UInt32, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
end

function SCIPaddIntParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Ptr{Cint}, UInt32, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddLongintParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Ptr{Clonglong}, UInt32, Clonglong, Clonglong, Clonglong, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddRealParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Ptr{Cdouble}, UInt32, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddCharParam(scip, name, desc, valueptr, isadvanced, defaultvalue, allowedvalues, paramchgd, paramdata)
    ccall((:SCIPaddCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Cstring, UInt32, UInt8, Cstring, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, allowedvalues, paramchgd, paramdata)
end

function SCIPaddStringParam(scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
    ccall((:SCIPaddStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring, Ptr{Cstring}, UInt32, Cstring, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
end

function SCIPisParamFixed(scip, name)
    ccall((:SCIPisParamFixed, libscip), UInt32, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetParam(scip, name)
    ccall((:SCIPgetParam, libscip), Ptr{SCIP_PARAM}, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPgetBoolParam(scip, name, value)
    ccall((:SCIPgetBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{UInt32}), scip, name, value)
end

function SCIPgetIntParam(scip, name, value)
    ccall((:SCIPgetIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cint}), scip, name, value)
end

function SCIPgetLongintParam(scip, name, value)
    ccall((:SCIPgetLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Clonglong}), scip, name, value)
end

function SCIPgetRealParam(scip, name, value)
    ccall((:SCIPgetRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cdouble}), scip, name, value)
end

function SCIPgetCharParam(scip, name, value)
    ccall((:SCIPgetCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cchar}), scip, name, value)
end

function SCIPgetStringParam(scip, name, value)
    ccall((:SCIPgetStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cstring}), scip, name, value)
end

function SCIPfixParam(scip, name)
    ccall((:SCIPfixParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPunfixParam(scip, name)
    ccall((:SCIPunfixParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPsetParam(scip, name, value)
    ccall((:SCIPsetParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Ptr{Cvoid}), scip, name, value)
end

function SCIPchgBoolParam(scip, param, value)
    ccall((:SCIPchgBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, UInt32), scip, param, value)
end

function SCIPsetBoolParam(scip, name, value)
    ccall((:SCIPsetBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, UInt32), scip, name, value)
end

function SCIPisBoolParamValid(scip, param, value)
    ccall((:SCIPisBoolParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, UInt32), scip, param, value)
end

function SCIPchgIntParam(scip, param, value)
    ccall((:SCIPchgIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cint), scip, param, value)
end

function SCIPsetIntParam(scip, name, value)
    ccall((:SCIPsetIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cint), scip, name, value)
end

function SCIPisIntParamValid(scip, param, value)
    ccall((:SCIPisIntParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cint), scip, param, value)
end

function SCIPchgLongintParam(scip, param, value)
    ccall((:SCIPchgLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Clonglong), scip, param, value)
end

function SCIPsetLongintParam(scip, name, value)
    ccall((:SCIPsetLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Clonglong), scip, name, value)
end

function SCIPisLongintParamValid(scip, param, value)
    ccall((:SCIPisLongintParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Clonglong), scip, param, value)
end

function SCIPchgRealParam(scip, param, value)
    ccall((:SCIPchgRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cdouble), scip, param, value)
end

function SCIPsetRealParam(scip, name, value)
    ccall((:SCIPsetRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cdouble), scip, name, value)
end

function SCIPisRealParamValid(scip, param, value)
    ccall((:SCIPisRealParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cdouble), scip, param, value)
end

function SCIPchgCharParam(scip, param, value)
    ccall((:SCIPchgCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, UInt8), scip, param, value)
end

function SCIPsetCharParam(scip, name, value)
    ccall((:SCIPsetCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{Cchar}, UInt8), scip, name, value)
end

function SCIPisCharParamValid(scip, param, value)
    ccall((:SCIPisCharParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, UInt8), scip, param, value)
end

function SCIPchgStringParam(scip, param, value)
    ccall((:SCIPchgStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cstring), scip, param, value)
end

function SCIPsetStringParam(scip, name, value)
    ccall((:SCIPsetStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, Cstring), scip, name, value)
end

function SCIPisStringParamValid(scip, param, value)
    ccall((:SCIPisStringParamValid, libscip), UInt32, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cstring), scip, param, value)
end

function SCIPreadParams(scip, filename)
    ccall((:SCIPreadParams, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, filename)
end

function SCIPwriteParam(scip, param, filename, comments, onlychanged)
    ccall((:SCIPwriteParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Ptr{SCIP_PARAM}, Cstring, UInt32, UInt32), scip, param, filename, comments, onlychanged)
end

function SCIPwriteParams(scip, filename, comments, onlychanged)
    ccall((:SCIPwriteParams, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring, UInt32, UInt32), scip, filename, comments, onlychanged)
end

function SCIPresetParam(scip, name)
    ccall((:SCIPresetParam, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cstring), scip, name)
end

function SCIPresetParams(scip)
    ccall((:SCIPresetParams, libscip), SCIP_RETCODE, (Ptr{SCIP_},), scip)
end

function SCIPsetEmphasis(scip, paramemphasis, quiet)
    ccall((:SCIPsetEmphasis, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_PARAMEMPHASIS, UInt32), scip, paramemphasis, quiet)
end

function SCIPsetSubscipsOff(scip, quiet)
    ccall((:SCIPsetSubscipsOff, libscip), SCIP_RETCODE, (Ptr{SCIP_}, UInt32), scip, quiet)
end

function SCIPsetHeuristics(scip, paramsetting, quiet)
    ccall((:SCIPsetHeuristics, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_PARAMSETTING, UInt32), scip, paramsetting, quiet)
end

function SCIPsetPresolving(scip, paramsetting, quiet)
    ccall((:SCIPsetPresolving, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_PARAMSETTING, UInt32), scip, paramsetting, quiet)
end

function SCIPsetSeparating(scip, paramsetting, quiet)
    ccall((:SCIPsetSeparating, libscip), SCIP_RETCODE, (Ptr{SCIP_}, SCIP_PARAMSETTING, UInt32), scip, paramsetting, quiet)
end

function SCIPgetParams(scip)
    ccall((:SCIPgetParams, libscip), Ptr{Ptr{SCIP_PARAM}}, (Ptr{SCIP_},), scip)
end

function SCIPgetNParams(scip)
    ccall((:SCIPgetNParams, libscip), Cint, (Ptr{SCIP_},), scip)
end
