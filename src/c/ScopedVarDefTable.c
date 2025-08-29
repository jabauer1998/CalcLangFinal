#include "ScopedVarDefTable.h"
#include <stdlib.h>
#include <string.h>

ScopeStack createVarTable(){
  return NULL;
}

void pushScope(ScopeStack* stack){
  if(*stack == NULL){
    *stack = malloc(sizeof(VarScope));
    (*stack)->list = NULL;
    (*stack)->next = NULL;
  } else {
    VarScope* currentHead = *stack;
    (*stack) = malloc(sizeof(VarScope));
    (*stack)->list = NULL;
    (*stack)->next = currentHead;
  }
}

void popScope(ScopeStack* stack){
  if(*stack != NULL){
    if((*stack)->next != NULL){
      VarScope* scopeToDelete = (*stack)->next;
      (*stack) = (*stack)->next;
      freeScope(scopeToDelete);
    } else {
      freeVarDefList((*stack)->list);
      (*stack)->list = NULL;
      (*stack)->next = NULL;
    }
  }
}

void freeScope(VarScope* stack){
  freeVarDefList(stack->list);
  free(stack);
}

void addElemToVarTable(ScopeStack* stack, VarDefNode* node){
  addVarDef(&((*stack)->list), node);
}

LLVMValueRef getElemFromVarTable(ScopeStack* stack, char* name){
  for(VarScope* iterator = *stack; iterator != NULL; iterator = iterator->next){
    LLVMValueRef ref = getVarDef(&(iterator->list), name);
    if(ref != NULL)
      return ref;
  }
  return NULL;
}

LLVMValueRef getElemFromVarScope(ScopeStack* stack, char* name){
  return getVarDef(&((*stack)->list), name);
}

void varTableToStr(VarScope* scope, int size, char* str){
  if(scope == NULL){
    strncat(str, "NULL", size);
  } else {
    strncat(str, "List: ", size);
    varDefListToStr(scope->list, size, str);
    strncat(str, "\n|\nV\n", size);
    varTableToStr(scope->next, size, str);
  }
}

char* varTableToString(ScopeStack stack){
  int size = 10000;
  char* table = malloc(size);
  varTableToStr(stack, size, table);
  return table;
}
