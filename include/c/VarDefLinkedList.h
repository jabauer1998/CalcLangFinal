#ifndef VAR_DEF_LINKED_LIST
#define VAR_DEF_LINKED_LIST

#include "CalcLangAstC.h"
#include "FuncAppLinkedList.h"
#include <llvm-c/Core.h>

typedef struct{
  char* name;
  LLVMValueRef ref;
  TypeInfo* type;
}VarDefNode;

typedef struct VarDLListElem{
  VarDefNode* data;
  struct VarDLListElem* next;
}VarDefListElem;

typedef VarDefListElem* VarDefList; 

VarDefList createVarDefList();
void freeVarDefList(VarDefList l);
void addVarDef(VarDefList* l, VarDefNode* node);
LLVMValueRef getVarDef(VarDefList* l, char* name);

#endif
