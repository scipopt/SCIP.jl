using Test
using SCIP
using SCIP_jll
using SCIP_PaPILO_jll

@show(@eval(SCIP, libscip) == SCIP_jll.libscip)
@show(SCIP_PaPILO_jll.is_available() && @eval(SCIP, libscip) == SCIP_PaPILO_jll.libscip)

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

const MOI_BASE_EXCLUDED = [
    "Semicontinuous",
    "ScalarAffineFunction_Semiinteger",
    "ScalarQuadraticFunction_Semiinteger",
    "VectorAffineFunction_GeometricMeanCone",
    "Indicator_GreaterThan",
    "Indicator_LessThan",
    "Indicator_ACTIVATE_ON_ZERO", # odd MOI bug?
    "test_constraint_get_ConstraintIndex", # accessing constraint from string name
    "test_model_ListOfConstraintAttributesSet",
    "BoundAlreadySet", # see TODO,
    "ListOfConstraintIndices", # MathOptInterface.ListOfModelAttributesSet
    "ListOfConstraintTypesPresent",
    "ScalarAffineFunction_ConstraintName", # get(::SCIP.Optimizer, ::Type{MathOptInterface.ConstraintIndex}, ::String)
    "UnsupportedAttribute",    # test_model_copy_to_UnsupportedAttribute: MOI.copy_to(model, BadVariableAttributeModel())
    "UnsupportedConstraint",
    "test_model_delete", # MOI.ListOfConstraintTypesPresent
    "duplicate_VariableName", # two identical variable names should error
    "test_conic_empty_matrix",
    "test_modification_delete_variables_in_a_batch",
    "test_modification_set_function_single_variable",
    "test_modification_set_scalaraffine_",
    "test_modification_set_singlevariable_",
    "test_modification_transform_",
    "test_nonlinear_", # None of tests provide expression graphs in the evaluator.
    "FEASIBILITY_SENSE", # TODO
    "ObjectiveFunction_ScalarAffineFunction",
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

using Test
using SCIP

@testset "SCIP_CALL printing" begin
    f() = SCIP.SCIP_OKAY
    g(args...) = SCIP.SCIP_ERROR
    SCIP.@SCIP_CALL f()
    h() = SCIP.@SCIP_CALL(g(1, 2))
    @test_throws ErrorException("g() yielded SCIP code SCIP_ERROR") SCIP.@SCIP_CALL g()
    @test_throws ErrorException("g(1, 2) yielded SCIP code SCIP_ERROR") h()
end
