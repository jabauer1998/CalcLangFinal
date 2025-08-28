#include "FuncDefLinkedList.h"
#include "CalcLangAstC.h"

FuncDefList createDefList(){
  return NULL;
}

void freeDefList(FuncDefList l){
  if(l != NULL && l->next != NULL){
    freeDefList(l->next);
  }
  if(l != NULL){
    freeDefData(l->data);
    free(l);
  }
}

void freeDefData(FuncDefNode* node){
  free(node->name);
  freeStoreArray(node->params);
  freeAstNode(node->expr);
  free(node);
}

void addFuncDef(FuncDefList* l, FuncDefNode* node){
  if(*l == NULL){
    *l = malloc(sizeof(FuncDefListElem));
    *l->data = node;
    *l->next = NULL;
  } else {
    FuncDefListElem* elem = NULL;
    for(elem = *l; elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(FuncDefListElem));
    elem->next->data = node;
    elem->next->next = NULL;
  }
}

FuncDefNode* getFuncDef(FuncDefList* l, char* name){
  FuncDefListElem* elem = NULL;
  for(elem = *l; elem != NULL; elem=elem->next){
    if(elem->data != NULL && strcmp(elem->data->name, name) == 0){
      return elem->data;
    }
  }
  return NULL;
}
