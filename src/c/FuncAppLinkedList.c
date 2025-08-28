#include "FuncAppLinkedList.h"

FuncAppList createApplicationList(){
  return NULL;
}

void addApplicationElem(FuncAppList* list, FuncApp* app){
  if(*list == NULL){
    *list = malloc(sizeof(FuncAppElem));
    *list->application = app;
    *list->next = NULL;
  } else {
    FuncAppElem* elem = NULL;
    for(elem = *list; elem->next != NULL; elem=elem->next);
    elem->next = malloc(sizeof(FuncAppElem));
    elem->next->application = app;
    elem->next->next = NULL;
  }
}

void freeTypeInfo(TypeInfo* point){
  free(point);
}

void freeFuncApplication(FuncApp* application){
  freeTypeInfo(application->ret);
  free(origName);
  free(newAlias);
  for(int i = 0; i < paramSize; i++){
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
    *list=*list->next;
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

int matchSets(SetType* setType1, SetType* setType2){
  if(setType1->size != setType2->size)
    return 1;

  for(int i = 0; i < setType1->size; i++){
    InfoType* infoType1 = setType1->arr[i];
    InfoType* infoType2 = setType2->arr[i];
    if(!matchTypes(infoType1, infoType2))
      return 1;
  }

  return 0;
}

int matchTuples(TupleType* tupType1, TupleType* tupType2){
  if(tupType1->size != tupType2->size)
    return 1;

  for(int i = 0; i < setType1->size; i++){
    InfoType* tupType1 = setType1->arr[i];
    InfoType* tupType2 = setType2->arr[i];
    if(!matchTypes(tupType1, tupType2))
      return 1;
  }

  return 0;
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


