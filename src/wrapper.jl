function _freeModel(model::SCIPMathProgModel)
    ccall((:CSIPfreeModel, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _addVar(model::SCIPMathProgModel, lowerbound::Cdouble,
                 upperbound::Cdouble, vartype::Cint, idx::Ptr{Cint})
    ccall((:CSIPaddVar, csip), Cint,
          (Ptr{Void}, Cdouble, Cdouble, Cint, Ptr{Cint}),
          model.ptr_model, lowerbound, upperbound, vartype, idx)
end

function _chgVarLB(model::SCIPMathProgModel, numindices::Cint,
                   indices::Vector{Cint}, lowerbounds::Vector{Cdouble})
    ccall((:CSIPchgVarLB, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.ptr_model, numindices, indices, lowerbounds)
end

function _chgVarUB(model::SCIPMathProgModel, numindices::Cint,
                   indices::Vector{Cint}, upperbounds::Vector{Cdouble})
    ccall((:CSIPchgVarUB, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.ptr_model, numindices, indices, upperbounds)
end

function _getVarType(model::SCIPMathProgModel, varindex::Cint)
    ccall((:CSIPgetVarType, csip), Cint,
          (Ptr{Void}, Cint),
          model.ptr_model, varindex)
end

function _chgVarType(model::SCIPMathProgModel, varindex::Cint, vartype::Cint)
    ccall((:CSIPchgVarType, csip), Cint,
          (Ptr{Void}, Cint, Cint),
          model.ptr_model, varindex, vartype)
end

function _addLinCons(model::SCIPMathProgModel, numindices::Cint,
                     indices::Vector{Cint}, coefs::Vector{Cdouble},
                     lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddLinCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model.ptr_model, numindices, indices, coefs, lhs, rhs, idx)
end

function _addQuadCons(model::SCIPMathProgModel, numlinindices::Cint,
                      linindices::Vector{Cint}, lincoefs::Vector{Cdouble},
                      numquadterms::Cint, quadrowindices::Vector{Cint},
                      quadcolindices::Vector{Cint}, quadcoefs::Vector{Cdouble},
                      lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddQuadCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint},
           Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model.ptr_model, numlinindices, linindices, lincoefs, numquadterms,
          quadrowindices, quadcolindices, quadcoefs, lhs, rhs, idx)
end

function _addSOS1(model::SCIPMathProgModel, numindices::Cint,
                  indices::Vector{Cint}, weights::Vector{Cdouble},
                  idx::Ptr{Cint})
    ccall((:CSIPaddSOS1, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model.ptr_model, numindices, indices, weights, idx)
end

function _addSOS2(model::SCIPMathProgModel, numindices::Cint,
                  indices::Vector{Cint}, weights::Vector{Cdouble},
                  idx::Ptr{Cint})
    ccall((:CSIPaddSOS2, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model.ptr_model, numindices, indices, weights, idx)
end

function _setObj(model::SCIPMathProgModel, numindices::Cint,
                 indices::Vector{Cint}, coefs::Vector{Cdouble})
    ccall((:CSIPsetObj, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.ptr_model, numindices, indices, coefs)
end

function _setSenseMinimize(model::SCIPMathProgModel)
    ccall((:CSIPsetSenseMinimize, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _setSenseMaximize(model::SCIPMathProgModel)
    ccall((:CSIPsetSenseMaximize, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _solve(model::SCIPMathProgModel)
    ccall((:CSIPsolve, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _interrupt(model::SCIPMathProgModel)
    ccall((:CSIPinterrupt, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _getVarValues(model::SCIPMathProgModel, output::Vector{Cdouble})
    ccall((:CSIPgetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model.ptr_model, output)
end

function _getObjValue(model::SCIPMathProgModel)
    ccall((:CSIPgetObjValue, csip), Cdouble, (Ptr{Void}, ), model.ptr_model)
end

function _getObjBound(model::SCIPMathProgModel)
    ccall((:CSIPgetObjBound, csip), Cdouble, (Ptr{Void}, ), model.ptr_model)
end

function _getStatus(model::SCIPMathProgModel)
    ccall((:CSIPgetStatus, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _setParameterGeneric(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Ptr{Void})
    ccall((:CSIPsetParameterGeneric, csip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Ptr{Void}),
          model.ptr_model, name, value)
end

function _getNumVars(model::SCIPMathProgModel)
    ccall((:CSIPgetNumVars, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _getNumConss(model::SCIPMathProgModel)
    ccall((:CSIPgetNumConss, csip), Cint, (Ptr{Void}, ), model.ptr_model)
end

function _setInitialSolution(model::SCIPMathProgModel, values::Vector{Cdouble})
    ccall((:CSIPsetInitialSolution, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model.ptr_model, values)
end

function _lazyGetContext(lazydata::Ptr{Void})
    ccall((:CSIPlazyGetContext, csip), Cint, (Ptr{Void}, ), lazydata)
end

function _lazyGetVarValues(lazydata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPlazyGetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          lazydata, output)
end

function _lazyAddLinCons(lazydata::Ptr{Void}, numindices::Cint,
                       indices::Vector{Cint}, coefs::Vector{Cdouble},
                       lhs::Cdouble, rhs::Cdouble, islocal::Cint)
    ccall((:CSIPlazyAddLinCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Cint),
          lazydata, numindices, indices, coefs, lhs, rhs, islocal)
end

function _addLazyCallback(model::SCIPMathProgModel, lazycb::Ptr{Void}, userdata)
    ccall((:CSIPaddLazyCallback, csip), Cint,
          (Ptr{Void}, Ptr{Void}, Any),
          model.ptr_model, lazycb, userdata)
end

function _heurGetVarValues(heurdata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPheurGetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, output)
end

function _heurAddSolution(heurdata::Ptr{Void}, values::Vector{Cdouble})
    ccall((:CSIPheurAddSolution, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, values)
end

function _addHeuristicCallback(model::SCIPMathProgModel, heur::Ptr{Void}, userdata)
    ccall((:CSIPaddHeuristicCallback, csip), Cint, (Ptr{Void}, Ptr{Void}, Any),
          model.ptr_model, heur, userdata)
end

function _getInternalSCIP(model::SCIPMathProgModel)
    ccall((:CSIPgetInternalSCIP, csip), Ptr{Void}, (Ptr{Void}, ),
          model.ptr_model)
end
