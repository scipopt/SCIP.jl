# generic constraints

function MOI.get(o::Optimizer, ::MOI.ConstraintName, ci::CI)::String
    return GC.@preserve o unsafe_string(SCIPconsGetName(cons(o, ci)))
end

function MOI.set(o::Optimizer, ::MOI.ConstraintName, ci::CI, name::String)
    @SCIP_CALL SCIPchgConsName(o, cons(o, ci), name)
    return nothing
end
