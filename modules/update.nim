import osproc

proc updateWindSwept() =
    var firstUpdate = execCmdEx("git pull origin main")
    var secondUpdate = execCmdEx("make install")
    echo firstUpdate.output
    echo secondUpdate.output