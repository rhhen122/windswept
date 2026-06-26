# WindSwept Main.Nim File (Compile This)

import os, parseopt, strformat, osproc
include "modules/update"
include "project/info"
include "commands"
include "modules/help"
include "modules/setup"
include "modules/install"

proc main() =
    if paramCount() == 0:
        writeHelp()
        return

    for kind, key, val in getopt():
        case kind
        of cmdLongOption, cmdShortOption:
            case key
            of "help", "h":
                writeHelp()
                quit()
            of "version", "v":
                echo &"v{Version}"
            of "setup", "s":
                runSetup()
            of "install", "i":
                pkgForInstall = val
                runInstall()
            of "build", "b":
                if val == "i":
                    var buildInstall = execCmdEx("make install")
                    echo buildInstall.output
                    echo buildInstall.exitCode
                else:
                    var buildCommandShell = execCmdEx("make build")
                    echo buildCommandShell.output
                    echo buildCommandShell.exitCode
            of "update", "u":
                updateWindSwept()
            else:
                discard
        else:
            discard

when isMainModule:
    main()