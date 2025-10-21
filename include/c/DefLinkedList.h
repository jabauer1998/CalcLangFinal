#ifndef VAR_DEF_LINKED_LIST
#define VAR_DEF_LINKED_LIST

#include <llvm-c/Core.h>

typedef struct{
  char name;
  LLVMValueRef ref;
}DefNode;

typedef struct MyDefListElem{
  DefNode* data;
  struct MyDefListElem* next;
}DefListElem;

typedef DefListElem* DefList; 

DefList createDefList();
void freeDefList(DefList l);
void addDef(DefList* l, char name, LLVMValueRef ref);
LLVMValueRef getDef(DefList l, char name);
char* defListToString(DefList l);
void defListToStr(DefListElem* elem, int size, char* str);

#endif
