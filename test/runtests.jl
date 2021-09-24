using Test
using SCIP

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

if SCIP.SCIP_versionnumber() >= v"7"
    include("sepa_support.jl")
    @testset "separators" begin
        include("sepa.jl")
    end
    @testset "cut callbacks" begin
        include("cutcallback.jl")
    end
else
    @info "Separation and callbacks not tested for SCIP versions below 7"
end

const MOI_BASE_EXCLUDED = [
    "Semicontinuous",
    "ScalarAffineFunction_Semiinteger",
    "ScalarAffineFunction_ZeroOne",
    "ScalarQuadraticFunction_Semiinteger",
    "ScalarQuadraticFunction_ZeroOne",
    "VectorAffineFunction_GeometricMeanCone",
    "Indicator_GreaterThan",
    "Indicator_LessThan",
    "VectorAffineFunction_NormOneCone",
    "VectorQuadraticFunction_NormOneCone",
    "VectorAffineFunction_RotatedSecondOrderCone", # SOC tests fail because of lower bound requirement of RHS var.
    "VectorAffineFunction_SOS",
    "VectorQuadraticFunction_SOS",
    "VectorAffineFunction_SecondOrderCone",
    "GeometricMeanCone",
    "RotatedSecondOrderCone",
    "SecondOrderCone",
    "Indicator_ACTIVATE_ON_ZERO",
    "test_constraint_ZeroOne_bounds", # accessing variable from string name
    "test_constraint_get_ConstraintIndex",
    "test_model_ListOfConstraintAttributesSet",
    "BoundAlreadySet", # see TODO,
    "ListOfConstraintIndices", # MathOptInterface.ListOfModelAttributesSet
    "ListOfConstraintTypesPresent",
    "ScalarAffineFunction_ConstraintName", # get(::SCIP.Optimizer, ::Type{MathOptInterface.ConstraintIndex}, ::String)
    "ScalarFunctionConstantNotZero",
    "UnsupportedAttribute",    # test_model_copy_to_UnsupportedAttribute: MOI.copy_to(model, BadVariableAttributeModel())
    "UnsupportedConstraint",
    "test_model_delete", # MOI.ListOfConstraintTypesPresent
    "duplicate_VariableName", # get variable by name
    "test_modification_coef_scalaraffine_",
    "test_modification_coef_vectoraffine_",
    "test_modification_const_vectoraffine_nonpos",
    "test_modification_delete_variables_in_a_batch",
    "test_modification_func_scalaraffine_",
    "test_modification_func_vectoraffine_",
    "test_modification_set_function_single_variable",
    "test_modification_set_scalaraffine_",
    "test_modification_set_singlevariable_",
    "test_modification_transform_",
    "test_nonlinear_", # None of tests provide expression graphs in the evaluator.
    "FEASIBILITY_SENSE", # TODO
    "ObjectiveFunction_ScalarAffineFunction",
    "test_objective_set_via_modify",
    "test_solve_ObjectiveBound_MAX_SENSE",
    "test_solve_ObjectiveBound_MIN_SENSE",
]

@testset "MathOptInterface tests (bridged)" begin
    include("MOI_wrapper_bridged.jl")
end

@testset "MathOptInterface tests (bridged & cached)" begin
    include("MOI_wrapper_cached.jl")
end

@testset "MathOptInterface tests (direct)" begin
    include("MOI_wrapper_direct.jl")
end

@testset "MathOptInterface additional tests" begin
    include("MOI_additional.jl")
end

@testset "MathOptInterface nonlinear expressions" begin
    include("MOI_nonlinear_exprs.jl")
end

include("MOI_conshdlr.jl")
