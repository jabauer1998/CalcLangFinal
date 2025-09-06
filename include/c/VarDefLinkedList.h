#ifndef VAR_DEF_LINKED_LIST
#define VAR_DEF_LINKED_LIST

#include <llvm-c/Core.h>

typedef struct{
  char* name;
  LLVMValueRef ref;
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
char* varDefListToString(VarDefList l);
void varDefListToStr(VarDefListElem* elem, int size, char* str);

#endif
