# Julia wrapper for header: csip.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function CSIPcreateModel(model::Ptr{Ptr{CSIP_MODEL}})
    ccall((:CSIPcreateModel,csip),CSIP_RETCODE,(Ptr{Ptr{CSIP_MODEL}},),model)
end

function CSIPfreeModel(model::Ptr{CSIP_MODEL})
    ccall((:CSIPfreeModel,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},),model)
end

function CSIPaddVar(model::Ptr{CSIP_MODEL},lowerbound::Cdouble,upperbound::Cdouble,vartype::CSIP_VARTYPE,idx::Ptr{Cint})
    ccall((:CSIPaddVar,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cdouble,Cdouble,CSIP_VARTYPE,Ptr{Cint}),model,lowerbound,upperbound,vartype,idx)
end

function CSIPchgVarLB(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},lowerbounds::Ptr{Cdouble})
    ccall((:CSIPchgVarLB,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble}),model,numindices,indices,lowerbounds)
end

function CSIPchgVarUB(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},upperbounds::Ptr{Cdouble})
    ccall((:CSIPchgVarUB,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble}),model,numindices,indices,upperbounds)
end

function CSIPaddLinCons(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},coefs::Ptr{Cdouble},lhs::Cdouble,rhs::Cdouble,idx::Ptr{Cint})
    ccall((:CSIPaddLinCons,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cint}),model,numindices,indices,coefs,lhs,rhs,idx)
end

function CSIPaddQuadCons(model::Ptr{CSIP_MODEL},numlinindices::Cint,linindices::Ptr{Cint},lincoefs::Ptr{Cdouble},numquadterms::Cint,quadrowindices::Ptr{Cint},quadcolindices::Ptr{Cint},quadcoefs::Ptr{Cdouble},lhs::Cdouble,rhs::Cdouble,idx::Ptr{Cint})
    ccall((:CSIPaddQuadCons,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble},Cint,Ptr{Cint},Ptr{Cint},Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cint}),model,numlinindices,linindices,lincoefs,numquadterms,quadrowindices,quadcolindices,quadcoefs,lhs,rhs,idx)
end

function CSIPaddSOS1(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},weights::Ptr{Cdouble},idx::Ptr{Cint})
    ccall((:CSIPaddSOS1,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble},Ptr{Cint}),model,numindices,indices,weights,idx)
end

function CSIPaddSOS2(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},weights::Ptr{Cdouble},idx::Ptr{Cint})
    ccall((:CSIPaddSOS2,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble},Ptr{Cint}),model,numindices,indices,weights,idx)
end

function CSIPsetObj(model::Ptr{CSIP_MODEL},numindices::Cint,indices::Ptr{Cint},coefs::Ptr{Cdouble})
    ccall((:CSIPsetObj,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Cint,Ptr{Cint},Ptr{Cdouble}),model,numindices,indices,coefs)
end

function CSIPsetSenseMinimize(model::Ptr{CSIP_MODEL})
    ccall((:CSIPsetSenseMinimize,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},),model)
end

function CSIPsetSenseMaximize(model::Ptr{CSIP_MODEL})
    ccall((:CSIPsetSenseMaximize,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},),model)
end

function CSIPsolve(model::Ptr{CSIP_MODEL})
    ccall((:CSIPsolve,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},),model)
end

function CSIPgetVarValues(model::Ptr{CSIP_MODEL},output::Ptr{Cdouble})
    ccall((:CSIPgetVarValues,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Ptr{Cdouble}),model,output)
end

function CSIPgetObjValue(model::Ptr{CSIP_MODEL})
    ccall((:CSIPgetObjValue,csip),Cdouble,(Ptr{CSIP_MODEL},),model)
end

function CSIPgetStatus(model::Ptr{CSIP_MODEL})
    ccall((:CSIPgetStatus,csip),CSIP_STATUS,(Ptr{CSIP_MODEL},),model)
end

function CSIPsetParameterGeneric(model::Ptr{CSIP_MODEL},name::Ptr{UInt8},value::Ptr{Void})
    ccall((:CSIPsetParameterGeneric,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Ptr{UInt8},Ptr{Void}),model,name,value)
end

function CSIPgetNumVars(model::Ptr{CSIP_MODEL})
    ccall((:CSIPgetNumVars,csip),Cint,(Ptr{CSIP_MODEL},),model)
end

function CSIPsetInitialSolution(model::Ptr{CSIP_MODEL},values::Ptr{Cdouble})
    ccall((:CSIPsetInitialSolution,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},Ptr{Cdouble}),model,values)
end

function CSIPcbGetVarValues(cbdata::Ptr{CSIP_CBDATA},output::Ptr{Cdouble})
    ccall((:CSIPcbGetVarValues,csip),CSIP_RETCODE,(Ptr{CSIP_CBDATA},Ptr{Cdouble}),cbdata,output)
end

function CSIPcbAddLinCons(cbdata::Ptr{CSIP_CBDATA},numindices::Cint,indices::Ptr{Cint},coefs::Ptr{Cdouble},lhs::Cdouble,rhs::Cdouble,islocal::Cint)
    ccall((:CSIPcbAddLinCons,csip),CSIP_RETCODE,(Ptr{CSIP_CBDATA},Cint,Ptr{Cint},Ptr{Cdouble},Cdouble,Cdouble,Cint),cbdata,numindices,indices,coefs,lhs,rhs,islocal)
end

function CSIPaddLazyCallback(model::Ptr{CSIP_MODEL},cb::CSIP_LAZYCALLBACK,fractional::Cint,userdata::Ptr{Void})
    ccall((:CSIPaddLazyCallback,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},CSIP_LAZYCALLBACK,Cint,Ptr{Void}),model,cb,fractional,userdata)
end

function CSIPheurGetVarValues(heurdata::Ptr{CSIP_HEURDATA},output::Ptr{Cdouble})
    ccall((:CSIPheurGetVarValues,csip),CSIP_RETCODE,(Ptr{CSIP_HEURDATA},Ptr{Cdouble}),heurdata,output)
end

function CSIPheurSetSolution(heurdata::Ptr{CSIP_HEURDATA},values::Ptr{Cdouble})
    ccall((:CSIPheurSetSolution,csip),CSIP_RETCODE,(Ptr{CSIP_HEURDATA},Ptr{Cdouble}),heurdata,values)
end

function CSIPaddHeuristicCallback(model::Ptr{CSIP_MODEL},heur::CSIP_HEURCALLBACK,userdata::Ptr{Void})
    ccall((:CSIPaddHeuristicCallback,csip),CSIP_RETCODE,(Ptr{CSIP_MODEL},CSIP_HEURCALLBACK,Ptr{Void}),model,heur,userdata)
end

function CSIPgetInternalSCIP(model::Ptr{CSIP_MODEL})
    ccall((:CSIPgetInternalSCIP,csip),Ptr{Void},(Ptr{CSIP_MODEL},),model)
end
