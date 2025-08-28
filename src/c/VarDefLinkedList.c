#include "VarDefLinkedList.h"
#include "CalcLangAstC.h"

FuncDefList createVarDefList(){
  return NULL;
}

void freeVarDefList(VarDefList l){
  if(l != NULL && l->next != NULL){
    freeDefList(l->next);
  }
  if(l != NULL){
    freeVarDefData(l->data);
    free(l);
  }
}

void freeVarDefData(VarDefNode* node){
  free(node->name);
  freeStoreArray(node->params);
  freeAstNode(node->expr);
  free(node);
}

void addVarDef(FuncDefList* l, VarDefNode* node){
  if(*l == NULL){
    *l = malloc(sizeof(VarDefListElem));
    *l->data = node;
    *l->next = NULL;
  } else {
    VarDefListElem* elem = NULL;
    for(elem = *l; elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(VarDefListElem));
    elem->next->data = node;
    elem->next->next = NULL;
  }
}

LLVMValueRef getVarDef(VarDefList* l, char* name){
  VarDefListElem* elem = NULL;
  for(elem = *l; elem != NULL; elem=elem->next){
    if(elem->data != NULL && strcmp(elem->data->name, name) == 0){
      return elem->data->ref;
    }
  }
  return NULL;
}
