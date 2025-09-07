#ifndef SCOPED_VAR_DEF_TABLE
#define SCOPED_VAR_DEF_TABLE

#include "CalcLangAstC.h"
#include "VarDefLinkedList.h"

typedef struct VScope{
  VarDefList list;
  struct VScope* next;
} VarScope;

typedef VarScope* ScopeStack;

ScopeStack createVarTable();
void pushScope(ScopeStack* stack);
void popScope(ScopeStack* stack);
void freeScope(VarScope* stack);
void addElemToVarTable(ScopeStack* stack, char* name, LLVMValueRef ref);
LLVMValueRef getElemFromVarTable(ScopeStack* stack, char* name);
LLVMValueRef getElemFromVarScope(ScopeStack* stack, char* name);
char* varTableToString(ScopeStack stack);

#endif
