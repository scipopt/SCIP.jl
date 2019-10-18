using MathOptInterface
const MOI = MathOptInterface
const MOIT = MOI.Test

# SCIP solver with default settings
const OPTIMIZER = SCIP.Optimizer(display_verblevel=0)
const CONFIG = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=false,
                               infeas_certificates=false)

# SCIP as LP solver with access to dual solution
const OPTIMIZER_DUAL = SCIP.Optimizer(
    #display_verblevel=0,
    # set presolve emphasis off
    presolving_domcol_maxrounds=0,
    presolving_dualcomp_maxrounds=0,
    presolving_gateextraction_maxrounds=0,
    presolving_implics_maxrounds=0,
    presolving_inttobinary_maxrounds=0,
    presolving_qpkktref_maxrounds=0,
    presolving_trivial_maxrounds=0,
    presolving_sparsify_maxrounds=0,
    presolving_symmetry_maxrounds=0,
    presolving_symbreak_maxrounds=0,
    propagating_dualfix_maxprerounds=0,
    propagating_genvbounds_maxprerounds=0,
    propagating_obbt_maxprerounds=0,
    propagating_orbitalfixing_maxprerounds=0,
    propagating_nlobbt_maxprerounds=0,
    propagating_probing_maxprerounds=0,
    propagating_pseudoobj_maxprerounds=0,
    propagating_redcost_maxprerounds=0,
    propagating_rootredcost_maxprerounds=0,
    propagating_vbounds_maxprerounds=0,
    constraints_cardinality_maxprerounds=0,
    constraints_soc_maxprerounds=0,
    constraints_SOS1_maxprerounds=0,
    constraints_SOS2_maxprerounds=0,
    constraints_varbound_maxprerounds=0,
    constraints_knapsack_maxprerounds=0,
    constraints_setppc_maxprerounds=0,
    constraints_linking_maxprerounds=0,
    constraints_or_maxprerounds=0,
    constraints_and_maxprerounds=0,
    constraints_xor_maxprerounds=0,
    constraints_conjunction_maxprerounds=0,
    constraints_disjunction_maxprerounds=0,
    constraints_linear_maxprerounds=0,
    constraints_orbisack_maxprerounds=0,
    constraints_orbitope_maxprerounds=0,
    constraints_symresack_maxprerounds=0,
    constraints_logicor_maxprerounds=0,
    constraints_bounddisjunction_maxprerounds=0,
    constraints_cumulative_maxprerounds=0,
    constraints_abspower_maxprerounds=0,
    constraints_bivariate_maxprerounds=0,
    constraints_quadratic_maxprerounds=0,
    constraints_nonlinear_maxprerounds=0,
    constraints_pseudoboolean_maxprerounds=0,
    constraints_superindicator_maxprerounds=0,
    constraints_indicator_maxprerounds=0,
    constraints_components_maxprerounds=0,
    presolving_maxrestarts=0,
    presolving_maxrounds=0,
    # set heuristics emphasis off
    heuristics_clique_freq=-1,
    heuristics_coefdiving_freq=-1,
    heuristics_completesol_freq=-1,
    heuristics_crossover_freq=-1,
    heuristics_distributiondiving_freq=-1,
    heuristics_farkasdiving_freq=-1,
    heuristics_feaspump_freq=-1,
    heuristics_fracdiving_freq=-1,
    heuristics_gins_freq=-1,
    heuristics_guideddiving_freq=-1,
    heuristics_indicator_freq=-1,
    heuristics_intshifting_freq=-1,
    heuristics_linesearchdiving_freq=-1,
    heuristics_locks_freq=-1,
    heuristics_lpface_freq=-1,
    heuristics_alns_freq=-1,
    heuristics_nlpdiving_freq=-1,
    heuristics_multistart_freq=-1,
    heuristics_mpec_freq=-1,
    heuristics_objpscostdiving_freq=-1,
    heuristics_ofins_freq=-1,
    heuristics_oneopt_freq=-1,
    heuristics_pscostdiving_freq=-1,
    heuristics_randrounding_freq=-1,
    heuristics_rens_freq=-1,
    heuristics_reoptsols_freq=-1,
    heuristics_rins_freq=-1,
    heuristics_rootsoldiving_freq=-1,
    heuristics_rounding_freq=-1,
    heuristics_shiftandpropagate_freq=-1,
    heuristics_shifting_freq=-1,
    heuristics_simplerounding_freq=-1,
    heuristics_subnlp_freq=-1,
    heuristics_trivial_freq=-1,
    heuristics_trivialnegation_freq=-1,
    heuristics_trysol_freq=-1,
    heuristics_undercover_freq=-1,
    heuristics_vbounds_freq=-1,
    heuristics_veclendiving_freq=-1,
    heuristics_zirounding_freq=-1,
    # disable other propagation:
    propagating_maxroundsroot=0,
    propagating_maxrounds=0,
)

const CONFIG_DUAL = MOIT.TestConfig(atol=1e-5, rtol=1e-5, duals=true,
                                    infeas_certificates=false)

@testset "MOI Continuous Linear" begin
    # remember reason for excluded tests:
    excluded = [
        "linear1",  # needs MOI.delete (of variables in constraints)
        "linear5",  # needs MOI.delete (of variables in constraints)
        "linear7",  # needs MOI.VectorAffineFunction
        "linear11", # broken in SCIP (#2556)
        "linear13", # TODO: support MOI.FEASIBILITY_SENSE
        "linear14", # needs MOI.delete (of variables in constraints)
        "linear15", # needs MOI.VectorAffineFunction
        "partial_start", # TODO: supportVariablePrimalStart
    ]
    # MOIT.contlineartest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.linear2test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear3test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear4test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear6test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear8atest(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear8btest(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear8ctest(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear9test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear10test(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear10btest(OPTIMIZER_DUAL, CONFIG_DUAL)
    MOIT.linear12test(OPTIMIZER_DUAL, CONFIG_DUAL)
end

@testset "MOI Quadratic Constraint" begin
    # remember reason for excluded tests:
    excluded = [
        "qcp1", # needs VectorAffineFunction
    ]
    # MOIT.qcptest(OPTIMIZER, CONFIG, excluded)

    # call individual tests
    MOIT.qcp2test(OPTIMIZER, CONFIG)
    MOIT.qcp3test(OPTIMIZER, CONFIG)
    MOIT.qcp4test(OPTIMIZER, CONFIG)

    MOIT.ncqcp1test(OPTIMIZER, CONFIG)
    MOIT.ncqcp2test(OPTIMIZER, CONFIG)
end

@testset "MOI Integer Linear" begin
    # MOIT.intlineartest(OPTIMIZER, CONFIG)

    # call individual tests
    MOIT.knapsacktest(OPTIMIZER, CONFIG)
    MOIT.int1test(OPTIMIZER, CONFIG)
    MOIT.int2test(OPTIMIZER, CONFIG)
    MOIT.int3test(OPTIMIZER, CONFIG)
    MOIT.indicator1_test(OPTIMIZER, CONFIG)
    MOIT.indicator2_test(OPTIMIZER, CONFIG)
    # MOIT.indicator3_test(OPTIMIZER, CONFIG) # no support for ACTIVATE_ON_ZERO
end
