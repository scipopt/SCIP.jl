# Julia wrapper for header: /usr/include/scip/pub_dialog.h
# Automatically generated using Clang.jl wrap_c


function SCIPdialoghdlrGetRoot(dialoghdlr)
    ccall((:SCIPdialoghdlrGetRoot, libscip), Ptr{SCIP_DIALOG}, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrClearBuffer(dialoghdlr)
    ccall((:SCIPdialoghdlrClearBuffer, libscip), Cvoid, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrIsBufferEmpty(dialoghdlr)
    ccall((:SCIPdialoghdlrIsBufferEmpty, libscip), UInt32, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrGetLine(dialoghdlr, dialog, prompt, inputline, endoffile)
    ccall((:SCIPdialoghdlrGetLine, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Cstring, Ptr{Cstring}, Ptr{UInt32}), dialoghdlr, dialog, prompt, inputline, endoffile)
end

function SCIPdialoghdlrGetWord(dialoghdlr, dialog, prompt, inputword, endoffile)
    ccall((:SCIPdialoghdlrGetWord, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Cstring, Ptr{Cstring}, Ptr{UInt32}), dialoghdlr, dialog, prompt, inputword, endoffile)
end

function SCIPdialoghdlrAddInputLine(dialoghdlr, inputline)
    ccall((:SCIPdialoghdlrAddInputLine, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Cstring), dialoghdlr, inputline)
end

function SCIPdialoghdlrAddHistory(dialoghdlr, dialog, command, escapecommand)
    ccall((:SCIPdialoghdlrAddHistory, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Cstring, UInt32), dialoghdlr, dialog, command, escapecommand)
end

function SCIPdialogHasEntry(dialog, entryname)
    ccall((:SCIPdialogHasEntry, libscip), UInt32, (Ptr{SCIP_DIALOG}, Cstring), dialog, entryname)
end

function SCIPdialogFindEntry(dialog, entryname, subdialog)
    ccall((:SCIPdialogFindEntry, libscip), Cint, (Ptr{SCIP_DIALOG}, Cstring, Ptr{Ptr{SCIP_DIALOG}}), dialog, entryname, subdialog)
end

function SCIPdialogDisplayMenu(dialog, scip)
    ccall((:SCIPdialogDisplayMenu, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP_}), dialog, scip)
end

function SCIPdialogDisplayMenuEntry(dialog, scip)
    ccall((:SCIPdialogDisplayMenuEntry, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP_}), dialog, scip)
end

function SCIPdialogDisplayCompletions(dialog, scip, entryname)
    ccall((:SCIPdialogDisplayCompletions, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP_}, Cstring), dialog, scip, entryname)
end

function SCIPdialogGetPath(dialog, sepchar, path)
    ccall((:SCIPdialogGetPath, libscip), Cvoid, (Ptr{SCIP_DIALOG}, UInt8, Cstring), dialog, sepchar, path)
end

function SCIPdialogGetName(dialog)
    ccall((:SCIPdialogGetName, libscip), Cstring, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetDesc(dialog)
    ccall((:SCIPdialogGetDesc, libscip), Cstring, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogIsSubmenu(dialog)
    ccall((:SCIPdialogIsSubmenu, libscip), UInt32, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetParent(dialog)
    ccall((:SCIPdialogGetParent, libscip), Ptr{SCIP_DIALOG}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetSubdialogs(dialog)
    ccall((:SCIPdialogGetSubdialogs, libscip), Ptr{Ptr{SCIP_DIALOG}}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetNSubdialogs(dialog)
    ccall((:SCIPdialogGetNSubdialogs, libscip), Cint, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetData(dialog)
    ccall((:SCIPdialogGetData, libscip), Ptr{SCIP_DIALOGDATA}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogSetData(dialog, dialogdata)
    ccall((:SCIPdialogSetData, libscip), Cvoid, (Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGDATA}), dialog, dialogdata)
end

function SCIPdialogWriteHistory(filename)
    ccall((:SCIPdialogWriteHistory, libscip), SCIP_RETCODE, (Cstring,), filename)
end
