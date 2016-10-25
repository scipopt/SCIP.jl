# Helper functions

# TODO: do this properly
# currently it doesn't check for types, except string and
# the code is horrible doing this zip between names (odd positions) and values (even positions)
# since options look like: "param1", value1, "param2", value2, ...
function setparams!(m::SCIPMathProgModel)
    a = m.inner.options
    for (name, value) in zip(a[1][1:2:end],a[1][2:2:end])
        setparameter!(m, name, value)
    end
end

setparameter!(m::SCIPMathProgModel, name::Compat.String, value::Bool) = (@assert isascii(name); _setBoolParam(m, pointer(name), Cint(value)))
function setparameter!(m::SCIPMathProgModel, name::Compat.String, value::Int)
    @assert isascii(name)
    if _getParamType(m, pointer(name)) == 1 # integer
        return _setIntParam(m, pointer(name), Cint(value))
    else
        return _setLongintParam(m, pointer(name), Clonglong(value))
    end
end
setparameter!(m::SCIPMathProgModel, name::Compat.String, value::Float64) = (@assert isascii(name); _setRealParam(m, pointer(name), Cdouble(value)))
setparameter!(m::SCIPMathProgModel, name::Compat.String, value::Char) = (@assert isascii(name); _setCharParam(m, pointer(name), Cchar(value)))
setparameter!(m::SCIPMathProgModel, name::Compat.String, value::Compat.String) = (@assert isascii(name) && isascii(value); _setStringParam(m, pointer(name), pointer(value)))
