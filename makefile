#Directory Definitions
SRCDIR:=./src
HDIR:=$(SRCDIR)/haskell
CDIR:=$(SRCDIR)/c
LDIR:=./lib
HLDIR:=$(LDIR)/haskell
CLDIR:=$(LDIR)/c
ODIR:=./obj
CODIR:=$(ODIR)/c
HODIR:=$(ODIR)/haskell
INTDIR:=./interface/haskell
INCDIR:=./include
BDIR:=./bin
ITARGET:=CalcLang.exe
# Toolchain definitions
CLANG:=clang
GHC:=ghc
# C compilation directives
CFLAGS += -fPIC
CFLAGS += -std=c99
CFLAGS += -g
CFLAGS += -I$(INCDIR)
# Haskell compilation directives
HFLAGS += -XForeignFunctionInterface
HFLAGS += -fPIC
HFLAGS += -i$(HDIR)
HFLAGS += -flink-rts
HFLAGS += -hidir $(INTDIR)
#Here is a specification of the Src for generating the interpreter
HISRC:= $(HDIR)/CalcLangParser.hs $(HDIR)/CalcLangInterpreter.hs $(HDIR)/CalcLangMain.hs
HIINT:=$(HISRC:$(HDIR)/%.hs=$(INTDIR)/%.hi)
HIOBJS:=$(HODIR)/CalcLangMain.o  $(HODIR)/CalcLangInterpreter.o $(HODIR)/CalcLangParser.o

CalcLangInterpreter: 
	$(GHC) -c $(HDIR)/CalcLangParser.hs -o $(HODIR)/CalcLangParser.o $(HFLAGS)
	$(GHC) -c $(HDIR)/CalcLangInterpreter.hs -o $(HODIR)/CalcLangInterpreter.o $(HFLAGS)
	$(GHC) -c $(HDIR)/CalcLangMain.hs -o $(HODIR)/CalcLangMain.o $(HFLAGS)

InterpreterExe: CalcLangInterpreter $(HIOBJS)
	$(GHC) $(HIOBJS) -o $(BDIR)/$(ITARGET) $(HFLAGS)

all: InterpreterExe

.PHONY: clean
clean:
	rm -f $(HIOBJS) $(HIINT) $(BDIR)/$(ITARGET)
