# Helper functions

# TODO: do this properly
# currently it doesn't check for types, except string and
# the code is horrible doing this zip between names (odd positions) and values (even positions)
# since options look like: "param1", value1, "param2", value2, ...
function setparams!(m::SCIPMathProgModel)
    a = m.options
    for (name, value) in zip(a[1][1:2:end],a[1][2:2:end])
        setparameter!(m, name, value)
    end
end

setparameter!(m::SCIPMathProgModel, name::ASCIIString, value::Bool) = _setBoolParam(m, pointer(name), Cint(value))
function setparameter!(m::SCIPMathProgModel, name::ASCIIString, value::Int)
    if _getParamType(m, pointer(name)) == 1 # integer
        return _setIntParam(m, pointer(name), Cint(value))
    else
        return _setLongintParam(m, pointer(name), Clonglong(value))
    end
end
setparameter!(m::SCIPMathProgModel, name::ASCIIString, value::Float64) = _setRealParam(m, pointer(name), Cdouble(value))
setparameter!(m::SCIPMathProgModel, name::ASCIIString, value::Char) = _setCharParam(m, pointer(name), Cchar(value))
setparameter!(m::SCIPMathProgModel, name::ASCIIString, value::ASCIIString) = _setStringParam(m, pointer(name), pointer(value))
