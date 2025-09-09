#include "VarDefLinkedList.h"
#include "CalcLangAstC.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "StringUtils.h"

VarDefList createVarDefList(){
  return NULL;
}

void freeVarDefData(VarDefNode* node){
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

void addVarDef(VarDefList* l, char name, LLVMValueRef ref){
  VarDefNode* node = malloc(sizeof(VarDefNode));
  node->name = name;
  node->ref = ref;
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

LLVMValueRef getVarDef(VarDefList l, char name){
  VarDefListElem* elem = NULL;
  for(elem = l; elem != NULL; elem=elem->next){
    if(elem->data != NULL && (elem->data->name == name)){
      return elem->data->ref;
    }
  }
  return NULL;
}

void varDefDataToStr(VarDefNode* d, int size, char* str){
  strncat(str, "{Name: ", size);
  appendStrChr(d->name, size, str);
  strncat(str, "}", size);
}

void varDefListToStr(VarDefListElem* listNode, int size, char* str){
  for(VarDefListElem* node = listNode; node != NULL; node=node->next){
      varDefDataToStr(node->data, size, str);
      strncat(str, "->", size);
  }
  strncat(str, "NULL", size);
}

char* varDefListToString(VarDefList l){
  int size = 10000;
  char* str = malloc(size);
  str[0] = '\0';
  varDefListToStr(l, size, str);
  return str;
}
