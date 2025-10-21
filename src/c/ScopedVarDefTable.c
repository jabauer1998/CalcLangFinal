#include "ScopedVarDefTable.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

ScopeStack createVarTable(){
  return NULL;
}

void freeScope(VarScope* stack){
  if(stack->list != NULL)
    freeDefList(stack->list);
  free(stack);
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
  if((*stack) != NULL){
    VarScope* scopeToDelete = *stack;
    (*stack) = (*stack)->next;
    freeScope(scopeToDelete);
  }
}

void freeVarTable(ScopeStack stack){
  if(stack != NULL && stack->next != NULL){
    freeVarTable(stack->next);
  }
  if(stack != NULL){
    freeScope(stack);
  }
}

void addElemToVarTable(ScopeStack* stack, char name, LLVMValueRef ref){
  addDef(&((*stack)->list), name, ref);
}

LLVMValueRef getElemFromVarTable(ScopeStack stack, char name){
  for(VarScope* iterator = stack; iterator != NULL; iterator = iterator->next){
    LLVMValueRef ref = getDef(iterator->list, name);
    if(ref != NULL)
      return ref;
  }
  return NULL;
}

LLVMValueRef getElemFromVarScope(ScopeStack stack, char name){
  return getDef(stack->list, name);
}

void varTableToStr(VarScope* scope, int size, char* str){
  for(VarScope* myScope = scope; myScope != NULL; myScope=myScope->next){
      strncat(str, "List: ", size);
      defListToStr(myScope->list, size, str);
      strncat(str, "\n|\nV\n", size);
  }
  strncat(str, "NULL", size);
}

char* varTableToString(ScopeStack stack){
  int size = 10000;
  char* table = malloc(size);
  table[0] = '\0';
  varTableToStr(stack, size, table);
  return table;
}
