# Test memory management

@testset "create and manual free" begin
    mscip = SCIP.ManagedSCIP()
    @test mscip.scip[] != C_NULL
    SCIP.free_scip(mscip)
end

@testset "create and implicit free" begin
    ptr = Ref{Ptr{SCIP.SCIP_}}(C_NULL)
    for i = 1:1
        mscip = SCIP.ManagedSCIP()
        ptr = mscip.scip
        @test ptr[] != C_NULL
    end
    GC.gc()
    GC.gc() # TODO: why need a second call?
    @test ptr[] == C_NULL
end
