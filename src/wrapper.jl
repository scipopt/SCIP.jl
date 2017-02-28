function _majorVersion()
    ccall((:CSIPmajorVersion, libcsip), Cint, ())
end

function _minorVersion()
    ccall((:CSIPminorVersion, libcsip), Cint, ())
end

function _patchVersion()
    ccall((:CSIPpatchVersion, libcsip), Cint, ())
end

function _freeModel(inner::SCIPModel)
    ccall((:CSIPfreeModel, libcsip), Cint, (Ptr{Void}, ), inner.ptr_model)
end

function _addVar(model::SCIPMathProgModel, lowerbound::Cdouble,
                 upperbound::Cdouble, vartype::Cint, idx::Ptr{Cint})
    ccall((:CSIPaddVar, libcsip), Cint,
          (Ptr{Void}, Cdouble, Cdouble, Cint, Ptr{Cint}),
          model.inner.ptr_model, lowerbound, upperbound, vartype, idx)
end

function _chgVarLB(model::SCIPMathProgModel, numindices::Cint,
                   indices::Vector{Cint}, lowerbounds::Vector{Cdouble})
    ccall((:CSIPchgVarLB, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.inner.ptr_model, numindices, indices, lowerbounds)
end

function _chgVarUB(model::SCIPMathProgModel, numindices::Cint,
                   indices::Vector{Cint}, upperbounds::Vector{Cdouble})
    ccall((:CSIPchgVarUB, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.inner.ptr_model, numindices, indices, upperbounds)
end

function _getVarType(model::SCIPMathProgModel, varindex::Cint)
    ccall((:CSIPgetVarType, libcsip), Cint,
          (Ptr{Void}, Cint),
          model.inner.ptr_model, varindex)
end

function _chgVarType(model::SCIPMathProgModel, varindex::Cint, vartype::Cint)
    ccall((:CSIPchgVarType, libcsip), Cint,
          (Ptr{Void}, Cint, Cint),
          model.inner.ptr_model, varindex, vartype)
end

function _addLinCons(model::SCIPMathProgModel, numindices::Cint,
                     indices::Vector{Cint}, coefs::Vector{Cdouble},
                     lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddLinCons, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model.inner.ptr_model, numindices, indices, coefs, lhs, rhs, idx)
end

function _addQuadCons(model::SCIPMathProgModel, numlinindices::Cint,
                      linindices::Vector{Cint}, lincoefs::Vector{Cdouble},
                      numquadterms::Cint, quadrowindices::Vector{Cint},
                      quadcolindices::Vector{Cint}, quadcoefs::Vector{Cdouble},
                      lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddQuadCons, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint},
           Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model.inner.ptr_model, numlinindices, linindices, lincoefs, numquadterms,
          quadrowindices, quadcolindices, quadcoefs, lhs, rhs, idx)
end

function _addNonLinCons(model::SCIPMathProgModel, nops::Cint,
                     ops::Vector{Cint}, children::Vector{Cint},
                     beg::Vector{Cint}, values::Vector{Cdouble},
                     lhs::Cdouble, rhs::Cdouble, idx::Ptr{Cint})
    ccall((:CSIPaddNonLinCons, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cint}),
          model.inner.ptr_model, nops, ops, children, beg, values, lhs, rhs, idx)
end

function _addSOS1(model::SCIPMathProgModel, numindices::Cint,
                  indices::Vector{Cint}, weights::Vector{Cdouble},
                  idx::Ptr{Cint})
    ccall((:CSIPaddSOS1, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model.inner.ptr_model, numindices, indices, weights, idx)
end

function _addSOS2(model::SCIPMathProgModel, numindices::Cint,
                  indices::Vector{Cint}, weights::Vector{Cdouble},
                  idx::Ptr{Cint})
    ccall((:CSIPaddSOS2, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}),
          model.inner.ptr_model, numindices, indices, weights, idx)
end

function _setObj(model::SCIPMathProgModel, numindices::Cint,
                 indices::Vector{Cint}, coefs::Vector{Cdouble})
    ccall((:CSIPsetObj, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}),
          model.inner.ptr_model, numindices, indices, coefs)
end

function _setQuadObj(model::SCIPMathProgModel, numlinindices::Cint,
                     linindices::Vector{Cint}, lincoefs::Vector{Cdouble},
                     numquadterms::Cint, quadrowindices::Vector{Cint},
                     quadcolindices::Vector{Cint}, quadcoefs::Vector{Cdouble})
    ccall((:CSIPsetQuadObj, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint},
           Ptr{Cdouble}),
          model.inner.ptr_model, numlinindices, linindices, lincoefs, numquadterms,
          quadrowindices, quadcolindices, quadcoefs)
end

function _setNonlinearObj(model::SCIPMathProgModel, nops::Cint,
                          ops::Vector{Cint}, children::Vector{Cint},
                          beg::Vector{Cint}, values::Vector{Cdouble})
    ccall((:CSIPsetNonlinearObj, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}),
          model.inner.ptr_model, nops, ops, children, beg, values)
end

function _setSenseMinimize(model::SCIPMathProgModel)
    ccall((:CSIPsetSenseMinimize, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _setSenseMaximize(model::SCIPMathProgModel)
    ccall((:CSIPsetSenseMaximize, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _solve(model::SCIPMathProgModel)
    ccall((:CSIPsolve, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _interrupt(model::SCIPMathProgModel)
    ccall((:CSIPinterrupt, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _getVarValues(model::SCIPMathProgModel, output::Vector{Cdouble})
    ccall((:CSIPgetVarValues, libcsip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model.inner.ptr_model, output)
end

function _getObjValue(model::SCIPMathProgModel)
    ccall((:CSIPgetObjValue, libcsip), Cdouble, (Ptr{Void}, ), model.inner.ptr_model)
end

function _getObjBound(model::SCIPMathProgModel)
    ccall((:CSIPgetObjBound, libcsip), Cdouble, (Ptr{Void}, ), model.inner.ptr_model)
end

function _getStatus(model::SCIPMathProgModel)
    ccall((:CSIPgetStatus, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _getParamType(model::SCIPMathProgModel, name::Ptr{UInt8})
    ccall((:CSIPgetParamType, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}),
          model.inner.ptr_model, name)
end

function _setBoolParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Cint)
    ccall((:CSIPsetBoolParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Cint),
          model.inner.ptr_model, name, value)
end

function _setIntParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Cint)
    ccall((:CSIPsetIntParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Cint),
          model.inner.ptr_model, name, value)
end

function _setLongintParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Clonglong)
    ccall((:CSIPsetLongintParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Clonglong),
          model.inner.ptr_model, name, value)
end

function _setRealParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Cdouble)
    ccall((:CSIPsetRealParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Cdouble),
          model.inner.ptr_model, name, value)
end

function _setCharParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                              value::Cchar)
    ccall((:CSIPsetCharParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Cchar),
          model.inner.ptr_model, name, value)
end

function _setStringParam(model::SCIPMathProgModel, name::Ptr{UInt8},
                         value::Ptr{UInt8})
    ccall((:CSIPsetStringParam, libcsip), Cint,
          (Ptr{Void}, Ptr{UInt8}, Ptr{UInt8}),
          model.inner.ptr_model, name, value)
end

function _getNumVars(model::SCIPMathProgModel)
    ccall((:CSIPgetNumVars, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _getNumConss(model::SCIPMathProgModel)
    ccall((:CSIPgetNumConss, libcsip), Cint, (Ptr{Void}, ), model.inner.ptr_model)
end

function _setInitialSolution(model::SCIPMathProgModel, values::Vector{Cdouble})
    ccall((:CSIPsetInitialSolution, libcsip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          model.inner.ptr_model, values)
end

function _lazyGetContext(lazydata::Ptr{Void})
    ccall((:CSIPlazyGetContext, libcsip), Cint, (Ptr{Void}, ), lazydata)
end

function _lazyGetVarValues(lazydata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPlazyGetVarValues, libcsip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          lazydata, output)
end

function _lazyAddLinCons(lazydata::Ptr{Void}, numindices::Cint,
                       indices::Vector{Cint}, coefs::Vector{Cdouble},
                       lhs::Cdouble, rhs::Cdouble, islocal::Cint)
    ccall((:CSIPlazyAddLinCons, libcsip), Cint,
          (Ptr{Void}, Cint, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cdouble, Cint),
          lazydata, numindices, indices, coefs, lhs, rhs, islocal)
end

function _addLazyCallback(model::SCIPMathProgModel, lazycb::Ptr{Void}, userdata)
    ccall((:CSIPaddLazyCallback, libcsip), Cint,
          (Ptr{Void}, Ptr{Void}, Any),
          model.inner.ptr_model, lazycb, userdata)
end

function _heurGetVarValues(heurdata::Ptr{Void}, output::Vector{Cdouble})
    ccall((:CSIPheurGetVarValues, libcsip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, output)
end

function _heurAddSolution(heurdata::Ptr{Void}, values::Vector{Cdouble})
    ccall((:CSIPheurAddSolution, libcsip), Cint, (Ptr{Void}, Ptr{Cdouble}),
          heurdata, values)
end

function _addHeuristicCallback(model::SCIPMathProgModel, heur::Ptr{Void}, userdata)
    ccall((:CSIPaddHeuristicCallback, libcsip), Cint, (Ptr{Void}, Ptr{Void}, Any),
          model.inner.ptr_model, heur, userdata)
end

function _getInternalSCIP(model::SCIPMathProgModel)
    ccall((:CSIPgetInternalSCIP, libcsip), Ptr{Void}, (Ptr{Void}, ),
          model.inner.ptr_model)
end
