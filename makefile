TestSrcDir:=./test/src/c
TestIncDir:=./test/include/c
TestObjDir:=./test/obj/c
IncDir:=./include/c
SrcDir:=./src/c
ObjDir:=./obj/c
TestBinDir:=./test/bin
AbsIncDirC:="/home/jabauer/source/repos/CalcLangFinal/include/c"
AbsIncDirH:="/home/jabauer/source/repos/CalcLangFinal/include/haskell"
AbsInstallDir:="/home/jabauer/source/repos/CalcLangFinal/bin"


all: clean build install

test: treeprintingtest
	./test/bin/TreePrintingTest

build:
	cabal build --extra-include-dirs=$(AbsIncDirC) --extra-include-dirs=$(AbsIncDirH) -v3
install:
	cabal install --extra-include-dirs=$(AbsIncDirC) --extra-include-dirs=$(AbsIncDirH) --installdir=$(AbsInstallDir)

treeprintingtest:
	clang -c $(TestSrcDir)/TreePrintingTest.c -o $(TestObjDir)/TreePrintingTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/CalcLangAstC.c -o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
	clang -o $(TestBinDir)/TreePrintingTest $(TestObjDir)/TreePrintingTest.o $(ObjDir)/CalcLangAstC.o -I$(IncDir)



clean:
	cabal clean
	rm -rf bin/* *# *~ ./test/bin/* ./test/obj/c/* ./obj/c/*
