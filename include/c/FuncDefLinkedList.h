#ifndef FUNC_DEF_LINKED_LIST
#define FUNC_DEF_LINKED_LIST

#include "CalcLangAstC.h"

typedef struct{
  char* name;
  StoreArray* params;
  AstNode* expr;
}FuncDefNode;

typedef struct{
  FuncDefNode* data;
  FuncDefListElem* next;
}FuncDefListElem;

typedef FuncDefListElem* FuncDefList; 

FuncDefList createFuncDefList();
void freeFuncDefList(FuncDefList l);
void addFuncDef(FuncDefList* l, FuncDefNode* node);
void getFuncDef(FuncDefList* l, char* name);

#endif
