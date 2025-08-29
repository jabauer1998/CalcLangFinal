all: clean build install

build:
	cabal build --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/c" --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/haskell" -v3
install:
	cabal install --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/c" --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/haskell" --installdir="/home/jabauer/source/repos/CalcLangFinal/bin"
clean:
	cabal clean
	rm -rf bin/* *# *~
