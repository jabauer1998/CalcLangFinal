#ifndef CALC_LANG_IR_GEN
#define CALC_LANG_IR_GEN

#include <llvm-c/Core.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include "CalcLangAstC.h"

LLVMModuleRef codeGen(StoreArray* arr);

#endif
