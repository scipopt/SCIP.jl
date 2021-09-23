using MathOptInterface
const MOI = MathOptInterface
const MOIB = MOI.Bridges
const MOIT = MOI.Test

const BRIDGED = MOIB.full_bridge_optimizer(SCIP.Optimizer(display_verblevel=0), Float64)
const CONFIG = MOIT.Config(atol=1e-5, rtol=1e-5, exclude=Any[MOI.ConstraintDual, MOI.ConstraintName])
const CONFIG3 = MOIT.Config(atol=1e-3, rtol=1e-2, exclude=Any[MOI.ConstraintDual])

@testset "MOI Continuous Linear" begin
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
    ]

    excluded = [
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
        "VectorAffineFunction_RotatedSecondOrderCone",
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
    ]
    MOIT.runtests(
        BRIDGED,
        CONFIG,
        warn_unsupported=true,
        exclude = excluded,
    )

#     test_constraint_Indicator_ACTIVATE_ON_ZERO: Error During Test at /home/mbesancon/.julia/packages/MathOptInterface/Evu1m/src/Test/test_constraint.jl:868
#   Test threw exception
#   Expression: MOI.get(model, MOI.ConstraintSet(), c) == s
#   ArgumentError: Bridge of type `MathOptInterface.Bridges.Constraint.IndicatorActiveOnFalseBridge{Float64, MathOptInterface.VectorAffineFunction{Float64}, MathOptInterface.GreaterThan{Float64}}` does not support accessing the attribute `MathOptInterface.ConstraintSet()`. If you encountered this error unexpectedly, it probably means your model has been reformulated using the bridge, and you are attempting to query an attribute that we haven't implemented yet for this bridge. Please open an issue at https://github.com/jump-dev/MathOptInterface.jl/issues/new and provide a reproducible example explaining what you were trying to do.

end

@testset "MOI Continuous Conic" begin
    MOIT.lintest(BRIDGED, CONFIG)

    # SOC tests fail because of lower bound requirement of RHS var.
    # MOIT.soctest(BRIDGED, CONFIG)
    # MOIT.rsoctest(BRIDGED, CONFIG)

    # other cones not supported
    # MOIT.geomeantest(BRIDGED, CONFIG)
    # MOIT.exptest(BRIDGED, CONFIG)
    # MOIT.sdptest(BRIDGED, CONFIG)
    # MOIT.logdettest(BRIDGED, CONFIG)
    # MOIT.rootdettest(BRIDGED, CONFIG)
end

@testset "MOI Quadratic Constraint" begin
    # needs objective bridge (MOI/#529)
    # MOIT.qptest(BRIDGED, CONFIG)

    MOIT.qcptest(BRIDGED, CONFIG)
    MOIT.socptest(BRIDGED, CONFIG3)
end

@testset "MOI Integer Linear" begin
    excluded = String["semiconttest", "semiinttest"]
    MOIT.intlineartest(BRIDGED, CONFIG, excluded)
    MOIT.indicator3_test(BRIDGED, CONFIG)
end

@testset "MOI Integer Conic" begin
    # SOC tests fail because of lower bound requirement of RHS var.
    # MOIT.intconictest(BRIDGED, CONFIG)
end

@testset "MOI NLP" begin
    # None of tests provide expression graphs in the evaluator.
    # MOIT.nlptest(BRIDGED, CONFIG)
end

@testset "MOI Unit tests" begin
    # TODO: most tests need get-variable-by-name etc.
    # MOIT.unittest(BRIDGED, CONFIG)
end
