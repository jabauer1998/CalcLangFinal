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


all: clean build-haskell install-haskell

build-haskell:
	cabal build --extra-include-dirs=$(AbsIncDirC) --extra-include-dirs=$(AbsIncDirH) -v3
install-haskell:
	cabal install --extra-include-dirs=$(AbsIncDirC) --extra-include-dirs=$(AbsIncDirH) --installdir=$(AbsInstallDir)

build-lib:
	clang -S -emit-llvm src/c/LinkToCalcLang.c -o ir/c/LinkToCalcLang.ll -I$(IncDir)

tree-printing-test:
	clang -c $(TestSrcDir)/TreePrintingTest.c -o $(TestObjDir)/TreePrintingTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/CalcLangAstC.c -o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
	clang -o $(TestBinDir)/TreePrintingTest $(TestObjDir)/TreePrintingTest.o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
var-def-list-test:
	clang -c $(TestSrcDir)/VarDefLinkedListTest.c -o $(TestObjDir)/VarDefLinkedListTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/VarDefLinkedList.c -o $(ObjDir)/VarDefLinkedList.o -I$(IncDir)
	clang -o $(TestBinDir)/VarDefLinkedListTest $(TestObjDir)/VarDefLinkedListTest.o $(ObjDir)/VarDefLinkedList.o -I$(IncDir)

test: tree-printing-test var-def-list-test
	$(TestBinDir)/TreePrintingTest
	$(TestBinDir)/VarDefLinkedListTest

clean:
	cabal clean
	rm -rf bin/* *# *~ ./test/bin/* ./test/obj/c/* ./obj/c/*
