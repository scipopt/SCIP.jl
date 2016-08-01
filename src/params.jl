# Helper functions

# TODO: do this properly
# currently it doesn't check for types, except string and
# the code is horrible doing this zip between names (odd positions) and values (even positions)
# since options look like: "param1", value1, "param2", value2, ...
function setparams!(m::SCIPMathProgModel)
    a = m.options
    for (name, value) in zip(a[1][1:2:end],a[1][2:2:end])
        if typeof(value) == :ASCIIString
            value = pointer(value)
        end
        _setParameterGeneric(m, pointer(name), convert(Ptr{Void},value))
    end
end

