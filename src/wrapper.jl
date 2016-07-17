function _createModel(model::Vector{Ptr{Void}})
    ccall((:CSIPcreateModel, csip), Cint, (Ptr{Ptr{Void}}, ), model)
end

function _freeModel(model::Ptr{Void})
    ccall((:CSIPfreeModel, csip), Cint, (Ptr{Void}, ), model)
end

function _addVar(model::Ptr{Void}, lowerbound::Cdouble, upperbound::Cdouble,
                 vartype::Cint, idx::Ptr{Cint})
    ccall((:CSIPaddVar, csip), Cint,
          (Ptr{Void}, Cdouble, Cdouble, Cint, Ptr{Cint}),
          model, lowerbound, upperbound, vartype, idx)
end

function _chgVarLB(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                   lowerbounds::Vector{Cdouble})
    ccall((:CSIPchgVarLB, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model, numindices, indices, lowerbounds)
end

function _chgVarUB(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                   upperbounds::Vector{Cdouble})
    ccall((:CSIPchgVarUB, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model, numindices, indices, upperbounds)
end

function _chgVarType(model::Ptr{Void}, varindex::Cint, vartype::Cint)
    ccall((:CSIPchgVarType, csip), Cint,
          (Ptr{Void}, Cint, Cint),
          model, varindex, vartype)
end

function _addLinCons(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                     coefs::Vector{Cdouble}, lhs::Cdouble, rhs::Cdouble,
                     idx::Ptr{Cint})
    ccall((:CSIPaddLinCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model, numindices, indices, coefs, lhs, rhs, idx)
end

function _addQuadCons(model::Ptr{Void}, numlinindices::Cint,
                      linindices::Vector{Cint}, lincoefs::Vector{Cdouble},
                      numquadterms::Cint, quadrowindices::Vector{Cint},
                      quadcolindices::Vector{Cint}, quadcoefs::Vector{Cdouble},
                      lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddQuadCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint},
           Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model, numlinindices, linindices, lincoefs, numquadterms,
          quadrowindices, quadcolindices, quadcoefs, lhs, rhs, idx)
end

function _addSOS1(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                  weights::Vector{Cdouble}, idx::Ptr{Cint})
    ccall((:CSIPaddSOS1, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model, numindices, indices, weights, idx)
end

function _addSOS2(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                  weights::Vector{Cdouble}, idx::Ptr{Cint})
    ccall((:CSIPaddSOS2, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model, numindices, indices, weights, idx)
end

function _setObj(model::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                 coefs::Vector{Cdouble})
    ccall((:CSIPsetObj, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model, numindices, indices, coefs)
end

function _setSenseMinimize(model::Ptr{Void})
    ccall((:CSIPsetSenseMinimize, csip), Cint, (Ptr{Void}, ), model)
end

function _setSenseMaximize(model::Ptr{Void})
    ccall((:CSIPsetSenseMaximize, csip), Cint, (Ptr{Void}, ), model)
end

function _solve(model::Ptr{Void})
    ccall((:CSIPsolve, csip), Cint, (Ptr{Void}, ), model)
end

function _getVarValues(model::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPgetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model, output)
end

function _getObjValue(model::Ptr{Void})
    ccall((:CSIPgetObjValue, csip), Cdouble, (Ptr{Void}, ), model)
end

function _getStatus(model::Ptr{Void})
    ccall((:CSIPgetStatus, csip), Cint, (Ptr{Void}, ), model)
end

function _setParameterGeneric(model::Ptr{Void}, name::Ptr{UInt8},
                              value::Ptr{Void})
    ccall((:CSIPsetParameterGeneric, csip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Ptr{Void}),
          model, name, value)
end

function _getNumVars(model::Ptr{Void})
    ccall((:CSIPgetNumVars, csip), Cint, (Ptr{Void}, ), model)
end

function _setInitialSolution(model::Ptr{Void}, values::Vector{Cdouble})
    ccall((:CSIPsetInitialSolution, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model, values)
end

function _cbGetVarValues(cbdata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPcbGetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          cbdata, output)
end

function _cbAddLinCons(cbdata::Ptr{Void}, numindices::Cint, indices::Vector{Cint},
                       coefs::Vector{Cdouble}, lhs::Cdouble, rhs::Cdouble, islocal::Cint)
    ccall((:CSIPcbAddLinCons, csip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Cint),
          cbdata, numindices, indices, coefs, lhs, rhs, islocal)
end

function _addLazyCallback(model::Ptr{Void}, cb::Void, fractional::Cint,
                          userdata::Ptr{Void})
    ccall((:CSIPaddLazyCallback, csip), Cint,
          (Ptr{Void}, Void, Cint, Ptr{Void}),
          model, cb, fractional, userdata)
end

function _heurGetVarValues(heurdata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPheurGetVarValues, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, output)
end

function _heurSetSolution(heurdata::Ptr{Void}, values::Vector{Cdouble})
    ccall((:CSIPheurSetSolution, csip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, values)
end

function _addHeuristicCallback(model::Ptr{Void}, heur::Void,
                               userdata::Ptr{Void})
    ccall((:CSIPaddHeuristicCallback, csip), Cint, (Ptr{Void}, Void, Ptr{Void}),
          model, heur, userdata)
end

function _getInternalSCIP(model::Ptr{Void})
    ccall((:CSIPgetInternalSCIP, csip), Ptr{Void}, (Ptr{Void}, ), model)
end
