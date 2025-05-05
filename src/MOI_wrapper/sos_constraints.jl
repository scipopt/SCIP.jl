# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# MOI.VectorOfVariables -in- MOI.SOS1{Float64}

function MOI.supports_constraint(
    o::Optimizer,
    ::Type{MOI.VectorOfVariables},
    ::Type{MOI.SOS1{Float64}},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    func::MOI.VectorOfVariables,
    set::MOI.SOS1{Float64},
)
    allow_modification(o)
    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_special_ordered_set_type1(o.inner, varrefs, set.weights)
    ci = MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS1{Float64}}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS1{Float64}},
)
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars = SCIPgetNVarsSOS1(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsSOS1(o, c), nvars)
    x = [MOI.VariableIndex(ref(o, v).val) for v in vars]
    return MOI.VectorOfVariables(x)
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS1{Float64}},
)
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars = SCIPgetNVarsSOS1(o, c)
    weights = unsafe_wrap(Array{Float64}, SCIPgetWeightsSOS1(o, c), nvars)
    return MOI.SOS1{Float64}(weights)
end

# MOI.VectorOfVariables -in- MOI.SOS2{Float64}

function MOI.supports_constraint(
    o::Optimizer,
    ::Type{MOI.VectorOfVariables},
    ::Type{MOI.SOS2{Float64}},
)
    return true
end

function MOI.add_constraint(
    o::Optimizer,
    func::MOI.VectorOfVariables,
    set::MOI.SOS2{Float64},
)
    allow_modification(o)
    varrefs = [VarRef(vi.value) for vi in func.variables]
    cr = add_special_ordered_set_type2(o.inner, varrefs, set.weights)
    ci = MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS2{Float64}}(cr.val)
    register!(o, ci)
    register!(o, cons(o, ci), cr)
    return ci
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintFunction,
    ci::MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS2{Float64}},
)
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars = SCIPgetNVarsSOS2(o, c)
    vars = unsafe_wrap(Array{Ptr{SCIP_VAR}}, SCIPgetVarsSOS2(o, c), nvars)
    x = [MOI.VariableIndex(ref(o, v).val) for v in vars]
    return MOI.VectorOfVariables(x)
end

function MOI.get(
    o::Optimizer,
    ::MOI.ConstraintSet,
    ci::MOI.ConstraintIndex{MOI.VectorOfVariables,MOI.SOS2{Float64}},
)
    _throw_if_invalid(o, ci)
    c = cons(o, ci)
    nvars = SCIPgetNVarsSOS2(o, c)
    weights = unsafe_wrap(Array{Float64}, SCIPgetWeightsSOS2(o, c), nvars)
    return MOI.SOS2{Float64}(weights)
end
