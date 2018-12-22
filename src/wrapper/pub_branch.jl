# Julia wrapper for header: /usr/include/scip/pub_branch.h
# Automatically generated using Clang.jl wrap_c


function SCIPbranchruleComp(elem1, elem2)
    ccall((:SCIPbranchruleComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbranchruleCompName(elem1, elem2)
    ccall((:SCIPbranchruleCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbranchruleGetData(branchrule)
    ccall((:SCIPbranchruleGetData, libscip), Ptr{SCIP_BRANCHRULEDATA}, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleSetData(branchrule, branchruledata)
    ccall((:SCIPbranchruleSetData, libscip), Cvoid, (Ptr{SCIP_BRANCHRULE}, Ptr{SCIP_BRANCHRULEDATA}), branchrule, branchruledata)
end

function SCIPbranchruleGetName(branchrule)
    ccall((:SCIPbranchruleGetName, libscip), Cstring, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetDesc(branchrule)
    ccall((:SCIPbranchruleGetDesc, libscip), Cstring, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetPriority(branchrule)
    ccall((:SCIPbranchruleGetPriority, libscip), Cint, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetMaxdepth(branchrule)
    ccall((:SCIPbranchruleGetMaxdepth, libscip), Cint, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetMaxbounddist(branchrule)
    ccall((:SCIPbranchruleGetMaxbounddist, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetSetupTime(branchrule)
    ccall((:SCIPbranchruleGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetTime(branchrule)
    ccall((:SCIPbranchruleGetTime, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNLPCalls(branchrule)
    ccall((:SCIPbranchruleGetNLPCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNExternCalls(branchrule)
    ccall((:SCIPbranchruleGetNExternCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNPseudoCalls(branchrule)
    ccall((:SCIPbranchruleGetNPseudoCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNCutoffs(branchrule)
    ccall((:SCIPbranchruleGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNCutsFound(branchrule)
    ccall((:SCIPbranchruleGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNConssFound(branchrule)
    ccall((:SCIPbranchruleGetNConssFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNDomredsFound(branchrule)
    ccall((:SCIPbranchruleGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNChildren(branchrule)
    ccall((:SCIPbranchruleGetNChildren, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleIsInitialized(branchrule)
    ccall((:SCIPbranchruleIsInitialized, libscip), UInt32, (Ptr{SCIP_BRANCHRULE},), branchrule)
end
