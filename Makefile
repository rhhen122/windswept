install:
	nim c --outdir:bin -o:windswept -d:ssl main.nim
build:
	nim c -o:windswept -d:ssl main.nim