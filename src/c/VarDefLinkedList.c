#include "VarDefLinkedList.h"
#include "CalcLangAstC.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

VarDefList createVarDefList(){
  return NULL;
}

void freeVarDefData(VarDefNode* node){
  free(node->name);
  free(node->type);
  free(node->ref);
  free(node);
}

void freeVarDefList(VarDefList l){
  if(l != NULL && l->next != NULL){
    freeVarDefList(l->next);
  }
  if(l != NULL){
    freeVarDefData(l->data);
    free(l);
  }
}

void addVarDef(VarDefList* l, VarDefNode* node){
  if((*l) == NULL){
    (*l) = malloc(sizeof(VarDefListElem));
    (*l)->data = node;
    (*l)->next = NULL;
  } else {
    VarDefListElem* elem = NULL;
    for(elem = (*l); elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(VarDefListElem));
    elem->next->data = node;
    elem->next->next = NULL;
  }
}

LLVMValueRef getVarDef(VarDefList* l, char* name){
  VarDefListElem* elem = NULL;
  for(elem = (*l); elem != NULL; elem=elem->next){
    if(elem->data != NULL && strcmp(elem->data->name, name) == 0){
      return elem->data->ref;
    }
  }
  return NULL;
}

void varDefDataToStr(VarDefNode* d, int size, char* str){
  strncat(str, "{Name: ", size);
  strncat(str, d->name, size);
  strncat(str, ", Type: ", size);
  typeInfoToStr(d->type, size, str);
  strncat(str, "}", size);
}

void varDefListToStr(VarDefListElem* listNode, int size, char* str){
  if(listNode != NULL){
    varDefDataToStr(listNode->data, size, str);
    strncat(str, "->", size);
    varDefListToStr(listNode->next, size, str);
  } else {
    strncat(str, "->NULL", size);
  }
}

char* varDefListToString(VarDefList l){
  int size = 10000;
  char* str = malloc(size);
  varDefListToStr(l, size, str);
  return str;
}
