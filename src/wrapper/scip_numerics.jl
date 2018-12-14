# Julia wrapper for header: /usr/include/scip/scip_numerics.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function SCIPepsilon(scip)
    ccall((:SCIPepsilon, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPsumepsilon(scip)
    ccall((:SCIPsumepsilon, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPfeastol(scip)
    ccall((:SCIPfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPlpfeastol(scip)
    ccall((:SCIPlpfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPdualfeastol(scip)
    ccall((:SCIPdualfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPbarrierconvtol(scip)
    ccall((:SCIPbarrierconvtol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPcutoffbounddelta(scip)
    ccall((:SCIPcutoffbounddelta, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPrelaxfeastol(scip)
    ccall((:SCIPrelaxfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPchgFeastol(scip, feastol::Cdouble)
    ccall((:SCIPchgFeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, feastol)
end

function SCIPchgLpfeastol(scip, lpfeastol::Cdouble, printnewvalue::UInt32)
    ccall((:SCIPchgLpfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, UInt32), scip, lpfeastol, printnewvalue)
end

function SCIPchgDualfeastol(scip, dualfeastol::Cdouble)
    ccall((:SCIPchgDualfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, dualfeastol)
end

function SCIPchgBarrierconvtol(scip, barrierconvtol::Cdouble)
    ccall((:SCIPchgBarrierconvtol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, barrierconvtol)
end

function SCIPchgRelaxfeastol(scip, relaxfeastol::Cdouble)
    ccall((:SCIPchgRelaxfeastol, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, relaxfeastol)
end

function SCIPmarkLimitChanged(scip)
    ccall((:SCIPmarkLimitChanged, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPinfinity(scip)
    ccall((:SCIPinfinity, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetHugeValue(scip)
    ccall((:SCIPgetHugeValue, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisInfinity(scip, val::Cdouble)
    ccall((:SCIPisInfinity, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisHugeValue(scip, val::Cdouble)
    ccall((:SCIPisHugeValue, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisZero(scip, val::Cdouble)
    ccall((:SCIPisZero, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisPositive(scip, val::Cdouble)
    ccall((:SCIPisPositive, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisNegative(scip, val::Cdouble)
    ccall((:SCIPisNegative, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisIntegral(scip, val::Cdouble)
    ccall((:SCIPisIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisScalingIntegral(scip, val::Cdouble, scalar::Cdouble)
    ccall((:SCIPisScalingIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val, scalar)
end

function SCIPisFracIntegral(scip, val::Cdouble)
    ccall((:SCIPisFracIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfloor(scip, val::Cdouble)
    ccall((:SCIPfloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPceil(scip, val::Cdouble)
    ccall((:SCIPceil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPround(scip, val::Cdouble)
    ccall((:SCIPround, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfrac(scip, val::Cdouble)
    ccall((:SCIPfrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumZero(scip, val::Cdouble)
    ccall((:SCIPisSumZero, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumPositive(scip, val::Cdouble)
    ccall((:SCIPisSumPositive, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumNegative(scip, val::Cdouble)
    ccall((:SCIPisSumNegative, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisFeasEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisFeasLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisFeasLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisFeasGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisFeasGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasZero(scip, val::Cdouble)
    ccall((:SCIPisFeasZero, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasPositive(scip, val::Cdouble)
    ccall((:SCIPisFeasPositive, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasNegative(scip, val::Cdouble)
    ccall((:SCIPisFeasNegative, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasIntegral(scip, val::Cdouble)
    ccall((:SCIPisFeasIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasFracIntegral(scip, val::Cdouble)
    ccall((:SCIPisFeasFracIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasFloor(scip, val::Cdouble)
    ccall((:SCIPfeasFloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasCeil(scip, val::Cdouble)
    ccall((:SCIPfeasCeil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasRound(scip, val::Cdouble)
    ccall((:SCIPfeasRound, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasFrac(scip, val::Cdouble)
    ccall((:SCIPfeasFrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisDualfeasEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisDualfeasLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisDualfeasLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisDualfeasGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisDualfeasGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasZero(scip, val::Cdouble)
    ccall((:SCIPisDualfeasZero, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasPositive(scip, val::Cdouble)
    ccall((:SCIPisDualfeasPositive, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasNegative(scip, val::Cdouble)
    ccall((:SCIPisDualfeasNegative, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasIntegral(scip, val::Cdouble)
    ccall((:SCIPisDualfeasIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasFracIntegral(scip, val::Cdouble)
    ccall((:SCIPisDualfeasFracIntegral, libscip), UInt32, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasFloor(scip, val::Cdouble)
    ccall((:SCIPdualfeasFloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasCeil(scip, val::Cdouble)
    ccall((:SCIPdualfeasCeil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasRound(scip, val::Cdouble)
    ccall((:SCIPdualfeasRound, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasFrac(scip, val::Cdouble)
    ccall((:SCIPdualfeasFrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisLbBetter(scip, newlb::Cdouble, oldlb::Cdouble, oldub::Cdouble)
    ccall((:SCIPisLbBetter, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble), scip, newlb, oldlb, oldub)
end

function SCIPisUbBetter(scip, newub::Cdouble, oldlb::Cdouble, oldub::Cdouble)
    ccall((:SCIPisUbBetter, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble), scip, newub, oldlb, oldub)
end

function SCIPisRelEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisRelEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisRelLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisRelLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisRelGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisRelGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelEQ(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumRelEQ, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumRelLT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumRelLE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGT(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumRelGT, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGE(scip, val1::Cdouble, val2::Cdouble)
    ccall((:SCIPisSumRelGE, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPconvertRealToInt(scip, real::Cdouble)
    ccall((:SCIPconvertRealToInt, libscip), Cint, (Ptr{SCIP}, Cdouble), scip, real)
end

function SCIPconvertRealToLongint(scip, real::Cdouble)
    ccall((:SCIPconvertRealToLongint, libscip), Clonglong, (Ptr{SCIP}, Cdouble), scip, real)
end

function SCIPisUpdateUnreliable(scip, newvalue::Cdouble, oldvalue::Cdouble)
    ccall((:SCIPisUpdateUnreliable, libscip), UInt32, (Ptr{SCIP}, Cdouble, Cdouble), scip, newvalue, oldvalue)
end

function SCIPprintReal(scip, file, val::Cdouble, width::Cint, precision::Cint)
    ccall((:SCIPprintReal, libscip), Cvoid, (Ptr{SCIP}, Ptr{FILE}, Cdouble, Cint, Cint), scip, file, val, width, precision)
end

function SCIPparseReal(scip, str, value, endptr)
    ccall((:SCIPparseReal, libscip), UInt32, (Ptr{SCIP}, Cstring, Ptr{Cdouble}, Ptr{Cstring}), scip, str, value, endptr)
end
