# Julia wrapper for header: /usr/include/scip/scip_nonlinear.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPaddSquareLinearization(scip, sqrcoef::Cdouble, refpoint::Cdouble, isint::UInt32, lincoef, linconstant, success)
    ccall((:SCIPaddSquareLinearization, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, UInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, sqrcoef, refpoint, isint, lincoef, linconstant, success)
end

function SCIPaddSquareSecant(scip, sqrcoef::Cdouble, lb::Cdouble, ub::Cdouble, refpoint::Cdouble, lincoef, linconstant, success)
    ccall((:SCIPaddSquareSecant, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, sqrcoef, lb, ub, refpoint, lincoef, linconstant, success)
end

function SCIPaddBilinLinearization(scip, bilincoef::Cdouble, refpointx::Cdouble, refpointy::Cdouble, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPaddBilinLinearization, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, bilincoef, refpointx, refpointy, lincoefx, lincoefy, linconstant, success)
end

function SCIPaddBilinMcCormick(scip, bilincoef::Cdouble, lbx::Cdouble, ubx::Cdouble, refpointx::Cdouble, lby::Cdouble, uby::Cdouble, refpointy::Cdouble, overestimate::UInt32, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPaddBilinMcCormick, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, UInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, lincoefx, lincoefy, linconstant, success)
end

function SCIPcomputeBilinEnvelope1(scip, bilincoef::Cdouble, lbx::Cdouble, ubx::Cdouble, refpointx::Cdouble, lby::Cdouble, uby::Cdouble, refpointy::Cdouble, overestimate::UInt32, xcoef::Cdouble, ycoef::Cdouble, constant::Cdouble, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPcomputeBilinEnvelope1, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, UInt32, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, xcoef, ycoef, constant, lincoefx, lincoefy, linconstant, success)
end

function SCIPcomputeBilinEnvelope2(scip, bilincoef::Cdouble, lbx::Cdouble, ubx::Cdouble, refpointx::Cdouble, lby::Cdouble, uby::Cdouble, refpointy::Cdouble, overestimate::UInt32, alpha1::Cdouble, beta1::Cdouble, gamma1::Cdouble, alpha2::Cdouble, beta2::Cdouble, gamma2::Cdouble, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPcomputeBilinEnvelope2, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, UInt32, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{UInt32}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, alpha1, beta1, gamma1, alpha2, beta2, gamma2, lincoefx, lincoefy, linconstant, success)
end

function SCIPcreateNlpiProb(scip, nlpi, nlrows, nnlrows::Cint, nlpiprob, var2idx, nlscore, cutoffbound::Cdouble, setobj::UInt32, onlyconvex::UInt32)
    ccall((:SCIPcreateNlpiProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{Ptr{SCIP_NLROW}}, Cint, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{Cdouble}, Cdouble, UInt32, UInt32), scip, nlpi, nlrows, nnlrows, nlpiprob, var2idx, nlscore, cutoffbound, setobj, onlyconvex)
end

function SCIPupdateNlpiProb(scip, nlpi, nlpiprob, var2nlpiidx, nlpivars, nlpinvars::Cint, cutoffbound::Cdouble)
    ccall((:SCIPupdateNlpiProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cdouble), scip, nlpi, nlpiprob, var2nlpiidx, nlpivars, nlpinvars, cutoffbound)
end

function SCIPaddNlpiProbRows(scip, nlpi, nlpiprob, var2idx, rows, nrows::Cint)
    ccall((:SCIPaddNlpiProbRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_ROW}}, Cint), scip, nlpi, nlpiprob, var2idx, rows, nrows)
end
