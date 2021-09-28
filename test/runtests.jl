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

# second order cone
# SCIP needs non-negative variable on right-hand side of second-order cone constraint
append!(MOI_BASE_EXCLUDED,[
    "test_conic_RotatedSecondOrderCone_INFEASIBLE",
    "test_conic_RotatedSecondOrderCone_VectorAffineFunction",
    "test_conic_RotatedSecondOrderCone_VectorOfVariables",
    "test_conic_RotatedSecondOrderCone_out_of_order",
    "test_conic_SecondOrderCone_INFEASIBLE",
    "test_conic_SecondOrderCone_Non",
    "test_conic_SecondOrderCone_VectorAffineFunction",
    "test_conic_SecondOrderCone_VectorOfVariables",
    "test_conic_SecondOrderCone_negative_initial_bound",
    "test_conic_SecondOrderCone_negative_post_bound",
    "test_conic_SecondOrderCone_no_initial_bound",
    "test_conic_SecondOrderCone_out_of_order",
    "test_constraint_PrimalStart_DualStart_SecondOrderCone",
    "test_quadratic_Integer_SecondOrderCone",
])

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
