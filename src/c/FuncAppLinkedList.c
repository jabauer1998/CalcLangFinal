#include "FuncAppLinkedList.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

FuncAppList createApplicationList(){
  return NULL;
}

void addApplicationElem(FuncAppList* list, FuncApp* app){
  if((*list) == NULL){
    (*list) = malloc(sizeof(FuncAppElem));
    (*list)->application = app;
    (*list)->next = NULL;
  } else {
    FuncAppElem* elem = NULL;
    for(elem = *list; elem->next != 0; elem=elem->next);
    elem->next = malloc(sizeof(FuncAppElem));
    elem->next->application = app;
    elem->next->next = 0;
  }
}

void freeTypeInfo(TypeInfo* point){
  free(point);
}

void freeFuncApplication(FuncApp* application){
  freeTypeInfo(application->ret);
  free(application->origName);
  free(application->newAlias);
  for(int i = 0; i < application->paramSize; i++){
    TypeInfo* point = application->params[i];
    freeTypeInfo(point);
  }
  free(application);
}

void freeFuncAppElem(FuncAppElem* elem){
  freeFuncApplication(elem->application);
  free(elem);
}

void freeFuncAppList(FuncAppList* list){
  while(*list != NULL){
    FuncAppElem* current = *list;
    (*list)=(*list)->next;
    freeFuncAppElem(current);
  }
}

char* getFunctionAlias(FuncAppList* list, FuncQueryApp* info){
  for(FuncAppElem* elem = *list; elem != NULL; elem = elem->next){
    if(matchQueryToActual(info, elem->application)){
      return elem->application->newAlias;
    }
  }
  return NULL;
}

int matchTypes(TypeInfo* info1, TypeInfo* info2);

int matchSets(SetType* setType1, SetType* setType2){
  if(setType1->size != setType2->size)
    return 1;

  for(int i = 0; i < setType1->size; i++){
    TypeInfo* infoType1 = setType1->arr[i];
    TypeInfo* infoType2 = setType2->arr[i];
    if(!matchTypes(infoType1, infoType2))
      return 1;
  }

  return 0;
}

int matchTuples(TupleType* tupType1, TupleType* tupType2){
  if(tupType1->size != tupType2->size)
    return 1;

  for(int i = 0; i < tupType1->size; i++){
    TypeInfo* infoType1 = tupType1->arr[i];
    TypeInfo* infoType2 = tupType2->arr[i];
    if(!matchTypes(infoType1, infoType2))
      return 1;
  }

  return 0;
}

int matchTypes(TypeInfo* type1, TypeInfo* type2){
  if(type1->infoType != type2->infoType)
    return 1;

  switch(type1->infoType){
  case IS_SET: return matchSets(&(type1->data.set), &(type2->data.set));
  case IS_TUPLE: return matchTuples(&(type1->data.tuple), &(type2->data.tuple));
  case IS_SINGLE: return type1->data.single == type2->data.single;
  default: return 1;
  }
}

void setTypeToStr(SetType* set, int size, char* str){
  strncat(str, "{", size);
  for(int i = 0; i < set->size; i++){
    if(i == 0){
      TypeInfo* info = set->arr[i];
      typeInfoToStr(info, size, str);
    } else {
      strncat(str, ", ", size);
      TypeInfo* info = set->arr[i];
      typeInfoToStr(info, size, str);
    }
  }
  strncat(str, "}", size);
}

void tupTypeToStr(TupleType* tup, int size, char* str){
  strncat(str, "(", size);
  for(int i = 0; i < tup->size; i++){
    if(i == 0){
      TypeInfo* info = tup->arr[i];
      typeInfoToStr(info, size, str);
    } else {
      strncat(str, ", ", size);
      TypeInfo* info = tup->arr[i];
      typeInfoToStr(info, size, str);
    }
  }
  strncat(str, ")", size);
}

void singleTypeToStr(SingleType type, int size, char* str){
  if(type == INTEGER) strncat(str, "INT", size);
  else if(type == DOLLAR) strncat(str, "DOLLAR", size);
  else if(type == PERCENT) strncat(str, "PERCENT", size);
  else if(type == REAL) strncat(str, "REAL", size);
  else if(type == BOOL) strncat(str, "BOOL", size);
  else perror("Invalid enum single type found");
}

void typeInfoToStr(TypeInfo* type, int size, char* str){
  if(type->infoType == IS_SET) setTypeToStr(&(type->data.set), size, str);
  else if(type->infoType == IS_TUPLE) tupTypeToStr(&(type->data.tuple), size, str);
  else if(type->infoType == IS_SINGLE) singleTypeToStr(type->data.single, size, str);
  else perror("Error invalid type specifier found");
}

void funcAppToStr(FuncApp* app, int size, char* str){
  strncat(str, "{", size);
  strncat(str, "Orig: ", size);
  strncat(str, app->origName, size);
  strncat(str, ", Alias: ", size);
  strncat(str, app->newAlias, size);
  strncat(str, ", Params: (", size);
  for(int i = 0; i < app->paramSize; i++){
    if(i == 0){
      TypeInfo* type = app->params[i];
      typeInfoToStr(type, size, str);
    } else {
      strncat(str, ", ", size);
      TypeInfo* type = app->params[i];
      typeInfoToStr(type, size, str);
    }
  }
  strncat(str, "), Return: ", size);
  typeInfoToStr(app->ret, size, str);
  strncat(str, "}", size);
}

void funcAppListElemToStr(FuncAppElem* elem, int size, char* str){
  if(elem == NULL){
    strncat(str, "->NULL", size);
  } else {
    funcAppToStr(elem->application, size, str);
    strncat(str, "->", size);
    funcAppListElemToStr(elem->next, size, str);
  }
}

char* funcAppListToString(FuncAppList list){
  int size = 10000;
  char* str = malloc(size);
  funcAppListElemToStr(list, size, str);
  return str;
}

int matchQueryToActual(FuncQueryApp* query, FuncApp* actual){
  if(strcmp(query->origName, actual->origName) == 0)
    if(matchTypes(query->ret, actual->ret) == 0)
      if(query->paramSize == actual->paramSize){
	for(int i = 0; i < query->paramSize; i++){
	  TypeInfo* queryInfo = query->params[i];
	  TypeInfo* actualInfo = actual->params[i];
	  if(matchTypes(queryInfo, actualInfo) == 1)
	    return 1;
	}
	return 0;
      }
}


