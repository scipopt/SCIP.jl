# generic constraints

function MOI.get(o::Optimizer, ::MOI.ConstraintName, ci::CI)
    return GC.@preserve o SCIPconsGetName(cons(o, ci))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI, name::String)
    @SC SCIPchgConsName(o, cons(o, ci), name)
    return nothing
end
