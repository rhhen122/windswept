import parsetoml, strformat, httpclient, os

var pkgForInstall: string
let repo = parseFile("example.toml")

proc runInstall() =
    echo &"Searching For {pkgForInstall}"
    if repo.hasKey(pkgForInstall):
        var pkgForInstallLocation: string = repo[pkgForInstall].getStr()
        echo &"Found Package with NIM location at {pkgForInstallLocation}"
        echo &"Are you sure you want to begin with installing {pkgForInstall} [y/n] "
        var pkgResult: string = readLine(stdin)
        if pkgResult == "y" or pkgResult == "Y":
            var userHome: string = getHomeDir()
            var windsweptConfig: string = userHome / ".config" / "windswept"
            createDir(windsweptConfig)
            let httpClient = newHttpClient()
            defer: httpClient.close()
            let getFile = httpClient.getContent(pkgForInstallLocation)
            let outputFile = windsweptConfig / pkgForInstall & ".nim"
            writeFile(outputFile, getFile)
        else:
            echo "User Cancelled Operation"
    else:
        echo "Failed to find Package"