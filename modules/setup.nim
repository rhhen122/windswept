import std/os

proc runSetup() =
    echo "!!Please ensure that you are running this from the root directory of cloned WindSwept project!!"
    echo "Are you sure you want to begin with setting up WindSwept [y/n] "
    let setupResult = readLine(stdin)
    if setupResult == "y" or setupResult == "Y":
        echo "Result Confirmed"
        sleep(1000)
        let configDir = getHomeDir() / ".config" / "windswept"
        createDir(configDir)
        let src = "buddy.nim"
        let dest = configDir / "buddy.nim"
        if fileExists(src):
            moveFile(src, dest)
            echo "Moved buddy.nim successfully"
        else:
            echo "buddy.nim not found"
    else:
        echo "Result Denied"
        quit(0)