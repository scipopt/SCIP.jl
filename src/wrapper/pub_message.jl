# Julia wrapper for header: /usr/include/scip/pub_message.h
# Automatically generated using Clang.jl wrap_c


function SCIPmessagehdlrCreate(messagehdlr, bufferedoutput, filename, quiet, messagewarning, messagedialog, messageinfo, messagehdlrfree, messagehdlrdata)
    ccall((:SCIPmessagehdlrCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MESSAGEHDLR}}, UInt32, Cstring, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_MESSAGEHDLRDATA}), messagehdlr, bufferedoutput, filename, quiet, messagewarning, messagedialog, messageinfo, messagehdlrfree, messagehdlrdata)
end

function SCIPmessagehdlrCapture(messagehdlr)
    ccall((:SCIPmessagehdlrCapture, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrRelease(messagehdlr)
    ccall((:SCIPmessagehdlrRelease, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MESSAGEHDLR}},), messagehdlr)
end

function SCIPmessagehdlrSetData(messagehdlr, messagehdlrdata)
    ccall((:SCIPmessagehdlrSetData, libscip), SCIP_RETCODE, (Ptr{SCIP_MESSAGEHDLR}, Ptr{SCIP_MESSAGEHDLRDATA}), messagehdlr, messagehdlrdata)
end

function SCIPmessagehdlrSetLogfile(messagehdlr, filename)
    ccall((:SCIPmessagehdlrSetLogfile, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Cstring), messagehdlr, filename)
end

function SCIPmessagehdlrSetQuiet(messagehdlr, quiet)
    ccall((:SCIPmessagehdlrSetQuiet, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, UInt32), messagehdlr, quiet)
end

function SCIPmessagePrintErrorHeader(sourcefile, sourceline)
    ccall((:SCIPmessagePrintErrorHeader, libscip), Cvoid, (Cstring, Cint), sourcefile, sourceline)
end

function SCIPmessageSetErrorPrinting(errorPrinting, data)
    ccall((:SCIPmessageSetErrorPrinting, libscip), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), errorPrinting, data)
end

function SCIPmessageSetErrorPrintingDefault()
    ccall((:SCIPmessageSetErrorPrintingDefault, libscip), Cvoid, ())
end

function SCIPmessagehdlrGetData(messagehdlr)
    ccall((:SCIPmessagehdlrGetData, libscip), Ptr{SCIP_MESSAGEHDLRDATA}, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrGetLogfile(messagehdlr)
    ccall((:SCIPmessagehdlrGetLogfile, libscip), Ptr{FILE}, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrIsQuiet(messagehdlr)
    ccall((:SCIPmessagehdlrIsQuiet, libscip), UInt32, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end
