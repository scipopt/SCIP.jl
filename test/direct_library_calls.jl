# Test raw wrapper with direct library calls

@testset "create small problem and solve" begin
    scip__ = Ptr{SCIP.SCIP_}[C_NULL] # SCIP**
    rc = SCIP.SCIPcreate(scip__)
    @test rc == SCIP.SCIP_OKAY

    scip_ = scip__[1] # SCIP*
    @test rc != C_NULL

    # TODO...
end
