# Julia wrapper for header: /usr/include/scip/scip_numerics.h
# Automatically generated using Clang.jl wrap_c


function SCIPepsilon(scip)
    ccall((:SCIPepsilon, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPsumepsilon(scip)
    ccall((:SCIPsumepsilon, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPfeastol(scip)
    ccall((:SCIPfeastol, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPlpfeastol(scip)
    ccall((:SCIPlpfeastol, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPdualfeastol(scip)
    ccall((:SCIPdualfeastol, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPbarrierconvtol(scip)
    ccall((:SCIPbarrierconvtol, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPcutoffbounddelta(scip)
    ccall((:SCIPcutoffbounddelta, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPrelaxfeastol(scip)
    ccall((:SCIPrelaxfeastol, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPchgFeastol(scip, feastol)
    ccall((:SCIPchgFeastol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, feastol)
end

function SCIPchgLpfeastol(scip, lpfeastol, printnewvalue)
    ccall((:SCIPchgLpfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble, UInt32), scip, lpfeastol, printnewvalue)
end

function SCIPchgDualfeastol(scip, dualfeastol)
    ccall((:SCIPchgDualfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, dualfeastol)
end

function SCIPchgBarrierconvtol(scip, barrierconvtol)
    ccall((:SCIPchgBarrierconvtol, libscip), SCIP_RETCODE, (Ptr{SCIP_}, Cdouble), scip, barrierconvtol)
end

function SCIPchgRelaxfeastol(scip, relaxfeastol)
    ccall((:SCIPchgRelaxfeastol, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, relaxfeastol)
end

function SCIPmarkLimitChanged(scip)
    ccall((:SCIPmarkLimitChanged, libscip), Cvoid, (Ptr{SCIP_},), scip)
end

function SCIPinfinity(scip)
    ccall((:SCIPinfinity, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPgetHugeValue(scip)
    ccall((:SCIPgetHugeValue, libscip), Cdouble, (Ptr{SCIP_},), scip)
end

function SCIPisEQ(scip, val1, val2)
    ccall((:SCIPisEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLT(scip, val1, val2)
    ccall((:SCIPisLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLE(scip, val1, val2)
    ccall((:SCIPisLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGT(scip, val1, val2)
    ccall((:SCIPisGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGE(scip, val1, val2)
    ccall((:SCIPisGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisInfinity(scip, val)
    ccall((:SCIPisInfinity, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisHugeValue(scip, val)
    ccall((:SCIPisHugeValue, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisZero(scip, val)
    ccall((:SCIPisZero, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisPositive(scip, val)
    ccall((:SCIPisPositive, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisNegative(scip, val)
    ccall((:SCIPisNegative, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisIntegral(scip, val)
    ccall((:SCIPisIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisScalingIntegral(scip, val, scalar)
    ccall((:SCIPisScalingIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val, scalar)
end

function SCIPisFracIntegral(scip, val)
    ccall((:SCIPisFracIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfloor(scip, val)
    ccall((:SCIPfloor, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPceil(scip, val)
    ccall((:SCIPceil, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPround(scip, val)
    ccall((:SCIPround, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfrac(scip, val)
    ccall((:SCIPfrac, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisSumEQ(scip, val1, val2)
    ccall((:SCIPisSumEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLT(scip, val1, val2)
    ccall((:SCIPisSumLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLE(scip, val1, val2)
    ccall((:SCIPisSumLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGT(scip, val1, val2)
    ccall((:SCIPisSumGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGE(scip, val1, val2)
    ccall((:SCIPisSumGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumZero(scip, val)
    ccall((:SCIPisSumZero, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisSumPositive(scip, val)
    ccall((:SCIPisSumPositive, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisSumNegative(scip, val)
    ccall((:SCIPisSumNegative, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisFeasEQ(scip, val1, val2)
    ccall((:SCIPisFeasEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLT(scip, val1, val2)
    ccall((:SCIPisFeasLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLE(scip, val1, val2)
    ccall((:SCIPisFeasLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGT(scip, val1, val2)
    ccall((:SCIPisFeasGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGE(scip, val1, val2)
    ccall((:SCIPisFeasGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasZero(scip, val)
    ccall((:SCIPisFeasZero, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisFeasPositive(scip, val)
    ccall((:SCIPisFeasPositive, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisFeasNegative(scip, val)
    ccall((:SCIPisFeasNegative, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisFeasIntegral(scip, val)
    ccall((:SCIPisFeasIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisFeasFracIntegral(scip, val)
    ccall((:SCIPisFeasFracIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfeasFloor(scip, val)
    ccall((:SCIPfeasFloor, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfeasCeil(scip, val)
    ccall((:SCIPfeasCeil, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfeasRound(scip, val)
    ccall((:SCIPfeasRound, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPfeasFrac(scip, val)
    ccall((:SCIPfeasFrac, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisDualfeasEQ(scip, val1, val2)
    ccall((:SCIPisDualfeasEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLT(scip, val1, val2)
    ccall((:SCIPisDualfeasLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLE(scip, val1, val2)
    ccall((:SCIPisDualfeasLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGT(scip, val1, val2)
    ccall((:SCIPisDualfeasGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGE(scip, val1, val2)
    ccall((:SCIPisDualfeasGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasZero(scip, val)
    ccall((:SCIPisDualfeasZero, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisDualfeasPositive(scip, val)
    ccall((:SCIPisDualfeasPositive, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisDualfeasNegative(scip, val)
    ccall((:SCIPisDualfeasNegative, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisDualfeasIntegral(scip, val)
    ccall((:SCIPisDualfeasIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisDualfeasFracIntegral(scip, val)
    ccall((:SCIPisDualfeasFracIntegral, libscip), UInt32, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPdualfeasFloor(scip, val)
    ccall((:SCIPdualfeasFloor, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPdualfeasCeil(scip, val)
    ccall((:SCIPdualfeasCeil, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPdualfeasRound(scip, val)
    ccall((:SCIPdualfeasRound, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPdualfeasFrac(scip, val)
    ccall((:SCIPdualfeasFrac, libscip), Cdouble, (Ptr{SCIP_}, Cdouble), scip, val)
end

function SCIPisLbBetter(scip, newlb, oldlb, oldub)
    ccall((:SCIPisLbBetter, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble, Cdouble), scip, newlb, oldlb, oldub)
end

function SCIPisUbBetter(scip, newub, oldlb, oldub)
    ccall((:SCIPisUbBetter, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble, Cdouble), scip, newub, oldlb, oldub)
end

function SCIPisRelEQ(scip, val1, val2)
    ccall((:SCIPisRelEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLT(scip, val1, val2)
    ccall((:SCIPisRelLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLE(scip, val1, val2)
    ccall((:SCIPisRelLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGT(scip, val1, val2)
    ccall((:SCIPisRelGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGE(scip, val1, val2)
    ccall((:SCIPisRelGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelEQ(scip, val1, val2)
    ccall((:SCIPisSumRelEQ, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLT(scip, val1, val2)
    ccall((:SCIPisSumRelLT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLE(scip, val1, val2)
    ccall((:SCIPisSumRelLE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGT(scip, val1, val2)
    ccall((:SCIPisSumRelGT, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGE(scip, val1, val2)
    ccall((:SCIPisSumRelGE, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPconvertRealToInt(scip, real)
    ccall((:SCIPconvertRealToInt, libscip), Cint, (Ptr{SCIP_}, Cdouble), scip, real)
end

function SCIPconvertRealToLongint(scip, real)
    ccall((:SCIPconvertRealToLongint, libscip), Clonglong, (Ptr{SCIP_}, Cdouble), scip, real)
end

function SCIPisUpdateUnreliable(scip, newvalue, oldvalue)
    ccall((:SCIPisUpdateUnreliable, libscip), UInt32, (Ptr{SCIP_}, Cdouble, Cdouble), scip, newvalue, oldvalue)
end

function SCIPprintReal(scip, file, val, width, precision)
    ccall((:SCIPprintReal, libscip), Cvoid, (Ptr{SCIP_}, Ptr{FILE}, Cdouble, Cint, Cint), scip, file, val, width, precision)
end

function SCIPparseReal(scip, str, value, endptr)
    ccall((:SCIPparseReal, libscip), UInt32, (Ptr{SCIP_}, Cstring, Ptr{Cdouble}, Ptr{Cstring}), scip, str, value, endptr)
end
