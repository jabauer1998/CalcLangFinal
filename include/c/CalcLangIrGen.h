#ifndef CALC_LANG_IR_GEN
#define CALC_LANG_IR_GEN

#include <llvm-c/Core.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include "FuncAppLinkedList.h"

typedef struct{
  TypeInfo* info;
  LLVMValueRef ref;
} CalcLangValueRef;

CalcLangValueRef* codeGenExpression(LLVMContextRef ctx, AstNode* node);
void codeGenFunctionDefinition(LLVMContextRef ctx, AstNode* node);
void codeGenVariableDeclaration(LLVMContextRef ctx, AstNode* node);

#endif
