#include "DefLinkedList.h"
#include "CalcLangAstC.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "StringUtils.h"

DefList createDefList(){
  return NULL;
}

void freeDefData(DefNode* node){
  free(node);
}

void freeDefList(DefList l){
  if(l != NULL && l->next != NULL){
    freeDefList(l->next);
  }
  if(l != NULL){
    freeDefData(l->data);
    free(l);
  }
}

void addDef(DefList* l, char name, LLVMValueRef ref){
  DefNode* node = malloc(sizeof(DefNode));
  node->name = name;
  node->ref = ref;
  if((*l) == NULL){
    (*l) = malloc(sizeof(DefListElem));
    (*l)->data = node;
    (*l)->next = NULL;
  } else {
    DefListElem* elem = NULL;
    for(elem = (*l); elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(DefListElem));
    elem->next->data = node;
    elem->next->next = NULL;
  }
}

LLVMValueRef getDef(DefList l, char name){
  DefListElem* elem = NULL;
  for(elem = l; elem != NULL; elem=elem->next){
    if(elem->data != NULL && (elem->data->name == name)){
      return elem->data->ref;
    }
  }
  return NULL;
}

void varDefDataToStr(DefNode* d, int size, char* str){
  strncat(str, "{Name: ", size);
  appendStrChr(d->name, size, str);
  strncat(str, "}", size);
}

void defListToStr(DefListElem* listNode, int size, char* str){
  for(DefListElem* node = listNode; node != NULL; node=node->next){
      varDefDataToStr(node->data, size, str);
      strncat(str, "->", size);
  }
  strncat(str, "NULL", size);
}

char* defListToString(DefList l){
  int size = 10000;
  char* str = malloc(size);
  str[0] = '\0';
  defListToStr(l, size, str);
  return str;
}
