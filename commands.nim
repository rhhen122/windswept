proc writeCommands() =
    echo """
    -h/--help       | Displays Help Menu
    -v/--version    | Displays Version Info
    -s/--setup      | Run Setup Process for WindSwept
    -i/--install    | Example (-i="package-name")
    -b/--build      | Rebuilds windswept. Using -b=i You can add it to the /bin directory (Run in WindSwept project root)
    -u/--update     | Updates WindSwept (Run in root of WindSwept repo)
    """