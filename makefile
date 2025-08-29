TestSrcDir:=./test/src/c
TestIncDir:=./test/include/c
TestObjDir:=./test/obj/c
IncDir:=./include/c
SrcDir:=./src/c
ObjDir:=./obj/c
TestBinDir:=./test/bin

all: clean build install

test: treeprintingtest
	./test/bin/TreePrintingTest

build:
	cabal build --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/c" --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/haskell" -v3
install:
	cabal install --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/c" --extra-include-dirs="/home/jabauer/source/repos/CalcLangFinal/include/haskell" --installdir="/home/jabauer/source/repos/CalcLangFinal/bin"

treeprintingtest:
	clang -c $(TestSrcDir)/TreePrintingTest.c -o $(TestObjDir)/TreePrintingTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/CalcLangAstC.c -o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
	clang -o $(TestBinDir)/TreePrintingTest $(TestObjDir)/TreePrintingTest.o $(ObjDir)/CalcLangAstC.o -I$(IncDir)

clean:
	cabal clean
	rm -rf bin/* *# *~ ./test/bin/* ./test/obj/c/* ./obj/c/*
