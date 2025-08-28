#ifndef VAR_DEF_LINKED_LIST
#define VAR_DEF_LINKED_LIST

#include "CalcLangAstC.h"

typedef struct{
  char* name;
  LLVMValueRef ref;
}VarDefNode;

typedef struct{
  VarDefNode* data;
  VarDefListElem* next;
}VarDefListElem;

typedef VarDefListElem* VarDefList; 

VarDefList createVarDefList();
void freeVarDefList(VarDefList l);
void addVarDef(VarDefList* l, VarDefNode* node);
LLVMValueRef getVarDef(VarDefList* l, char* name);

#endif
