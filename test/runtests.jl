using Test
using SCIP
using SCIP_jll
using SCIP_PaPILO_jll

@show(@eval(SCIP, libscip) == SCIP_jll.libscip)
@show(
    SCIP_PaPILO_jll.is_available() &&
    @eval(SCIP, libscip) == SCIP_PaPILO_jll.libscip
)
@show SCIP_PaPILO_jll.best_wrapper
@show SCIP.SCIP_versionnumber()
@show SCIP_jll.best_wrapper

@testset "MathOptInterface nonlinear expressions" begin
    include("MOI_nonlinear_exprs.jl")
end

@testset "direct library calls" begin
    include("direct_library_calls.jl")
end

@testset "managed memory" begin
    include("scip_data.jl")
end

# new type definitions in module (needs top level)
include("conshdlr_support.jl")

@testset "constraint handlers" begin
    include("conshdlr.jl")
end

include("sepa_support.jl")
@testset "separators" begin
    include("sepa.jl")
end
@testset "cut callbacks" begin
    include("cutcallback.jl")
end
@testset "branching rule" begin
    include("branchrule.jl")
end
@testset "heuristic" begin
    include("heuristic.jl")
end

const MOI_BASE_EXCLUDED = [
    "Indicator_LessThan", # indicator must be binary error in SCIP
    "Indicator_ACTIVATE_ON_ZERO", # odd MOI bug?
    "test_constraint_get_ConstraintIndex", # accessing constraint from string name
    "BoundAlreadySet", # see TODO,
    "ScalarAffineFunction_ConstraintName", # get(::SCIP.Optimizer, ::Type{MathOptInterface.ConstraintIndex}, ::String)
    "duplicate_VariableName", # two identical variable names should error at get time
    "test_model_VariableName", # same issue
    "test_model_Name_VariableName_ConstraintName",
    "test_modification_delete_variables_in_a_batch",
    "test_modification_set_function_single_variable",
    "test_modification_set_scalaraffine_",
    "test_modification_set_singlevariable_",
    "test_modification_transform_",
    "test_nonlinear_", # None of tests provide expression graphs in the evaluator.
    "ObjectiveFunction_ScalarAffineFunction", # requires conversion of objective function
    "test_objective_set_via_modify", # ListOfModelAttributesSet
]

@testset "MathOptInterface tests (direct)" begin
    include("MOI_wrapper_direct.jl")
end

@testset "MathOptInterface additional tests" begin
    include("MOI_additional.jl")
end

@testset "MathOptInterface tests (bridged)" begin
    include("MOI_wrapper_bridged.jl")
end

@testset "MathOptInterface tests (bridged & cached)" begin
    include("MOI_wrapper_cached.jl")
end

include("MOI_conshdlr.jl")
include("cutsel.jl")
