TestSrcDir:="$(shell pwd)/test/src/c"
TestIncDir:="$(shell pwd)/test/include/c"
TestObjDir:="$(shell pwd)/test/obj/c"
ObjDir:="$(shell pwd)/obj/c"
TestBinDir:="$(shell pwd)/test/bin"
AbsIncDirC:="$(shell pwd)/include/c"
AbsIncDirH:="$(shell pwd)/include/haskell"
AbsInstallDir:="$(shell pwd)/bin"
SrcDir:="$(shell pwd)/src"
LLVMLib:=$(shell llvm-config --libdir)
LLVMInclude:=$(shell llvm-config --includedir)
ZLibPath:=$(shell nix-build --no-out-link '<nixpkgs>' -A zlib)
ZLibDevPath:=$(shell nix-build --no-out-link '<nixpkgs>' -A zlib.dev)


all: build-lib build-haskell install-haskell

build-haskell:
	cabal update
	cabal build --extra-include-dirs=$(AbsIncDirC) --extra-include-dirs=$(AbsIncDirH) --extra-include-dirs=$(LLVMInclude) --extra-lib-dirs=$(LLVMLib) --extra-lib-dirs=$(ZLibPath)/lib --extra-include-dirs=$(ZLibDevPath)/include
install-haskell: build-haskell
	rm -f $(AbsInstallDir)/WCalcLang $(AbsInstallDir)/ICalcLang $(AbsInstallDir)/CCalcLang
	find dist-newstyle -name "WCalcLang" -type f -executable -exec cp {} $(AbsInstallDir)/WCalcLang \;
	find dist-newstyle -name "ICalcLang" -type f -executable -exec cp {} $(AbsInstallDir)/ICalcLang \;
	find dist-newstyle -name "CCalcLang" -type f -executable -exec cp {} $(AbsInstallDir)/CCalcLang \;
build-lib:
	clang -S -emit-llvm src/c/LinkToCalcLang.c -o ir/c/LinkToCalcLang.ll -I$(AbsIncDirC)

tree-printing-test:
	clang -c $(TestSrcDir)/TreePrintingTest.c -o $(TestObjDir)/TreePrintingTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/c/CalcLangAstC.c -o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
	clang -o $(TestBinDir)/TreePrintingTest $(TestObjDir)/TreePrintingTest.o $(ObjDir)/CalcLangAstC.o -I$(IncDir)
var-def-list-test:
	clang -c $(TestSrcDir)/VarDefLinkedListTest.c -o $(TestObjDir)/VarDefLinkedListTest.o -I$(TestIncDir) -I$(IncDir)
	clang -c $(SrcDir)/c/VarDefLinkedList.c -o $(ObjDir)/VarDefLinkedList.o -I$(IncDir)
	clang -o $(TestBinDir)/VarDefLinkedListTest $(TestObjDir)/VarDefLinkedListTest.o $(ObjDir)/VarDefLinkedList.o -L$(LLVMLib) -lLLVM -I$(IncDir)
scoped-var-stack-test:
	clang -c $(SrcDir)/c/VarDefLinkedList.c -o $(ObjDir)/VarDefLinkedList.o -I$(IncDir)
	clang -c $(SrcDir)/c/ScopedVarDefTable.c -o $(ObjDir)/ScopedVarDefTable.o -I$(IncDir)
	clang -c $(TestSrcDir)/ScopedVarDefTableTest.c -o $(TestObjDir)/ScopedVarDefTableTest.o -I$(TestIncDir) -I$(IncDir)
	clang -o $(TestBinDir)/ScopedVarDefTableTest $(TestObjDir)/ScopedVarDefTableTest.o $(ObjDir)/ScopedVarDefTable.o $(ObjDir)/VarDefLinkedList.o -L$(LLVMLib) -lLLVM

test: tree-printing-test var-def-list-test scoped-var-stack-test
	$(TestBinDir)/TreePrintingTest
	$(TestBinDir)/VarDefLinkedListTest
	$(TestBinDir)/ScopedVarDefTableTest

clean:
	cabal clean
	rm -rf bin/* *# *~ ./test/bin/* ./test/obj/c/* ./obj/c/*
