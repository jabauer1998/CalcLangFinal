#include "FuncDefLinkedList.h"
#include "CalcLangAstC.h"
#include <stdlib.h>
#include <string.h>

FuncDefList createDefList(){
  return NULL;
}

void freeDefData(FuncDefNode* node){
  free(node->name);
  freeStoreArray(node->params);
  freeTree(node->expr);
  free(node);
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

void addFuncDef(FuncDefList* l, FuncDefNode* node){
  if((*l) == NULL){
    (*l) = malloc(sizeof(FuncDefListElem));
    (*l)->data = node;
    (*l)->next = NULL;
  } else {
    FuncDefListElem* elem = NULL;
    for(elem = (*l); elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(FuncDefListElem));
    elem->next->data = node;
    elem->next->next = NULL;
  }
}

FuncDefNode* getFuncDef(FuncDefList* l, char* name){
  FuncDefListElem* elem = NULL;
  for(elem = (*l); elem != NULL; elem=elem->next){
    if(elem->data != NULL && strcmp(elem->data->name, name) == 0){
      return elem->data;
    }
  }
  return NULL;
}

void funcDefNodeToStr(FuncDefNode* node, int size, char* str){
  strncat(str, "{Name: ", size);
  strncat(str, node->name, size);
  strncat(str, ", Params: (", size);
  storeArrayToStr(node->params, size, str);
  strncat(str, "), Ret: ", size);
  astToStr(node->expr, size, str);
  strncat(str, "}", size);
}

void funcDefListToStr(FuncDefListElem* elem, int size, char* str){
  if(elem == NULL){
    strncat(str, "->NULL", size);
  } else {
    funcDefNodeToStr(elem->data, size, str);
    strncat(str, "->", size);
    funcDefListToStr(elem->next, size, str);
  }
}

char* funcDefListToString(FuncDefList l){
  int size = 10000;
  char* str = malloc(size);
  funcDefListToStr(l, size, str);
  return str;
}
