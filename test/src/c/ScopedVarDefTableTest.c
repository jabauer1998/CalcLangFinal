#include "TestUtils.h"
#include <llvm-c/Core.h>
#include "ScopedVarDefTable.h"
#include <stdio.h>
#include <stdlib.h>

#define DEBUG

int createScopeStack(){
  ScopeStack stack = createVarTable();
  
  char* str = varTableToString(stack);

  #ifdef DEBUG
     printf("DEBUG: %s\n", str);
  #endif

  ASSERT_STR_EQ(str, "NULL", "Error Str is not equal");

  
  freeVarTable(stack);
  free(str);
  
  return 1;
}

int pushScopeTest(){
  ScopeStack stack = createVarTable();
  pushScope(&stack);
  
  char* str = varTableToString(stack);

  #ifdef DEBUG
     printf("DEBUG: \n%s\n", str);
     fflush(stdout);
  #endif

  ASSERT_STR_EQ(str, "List: NULL\n|\nV\nNULL", "Error Str is not equal");

  
  freeVarTable(stack);
  free(str);
  
  return 1;
}

int popScopeTest(){
  ScopeStack stack = createVarTable();
  pushScope(&stack);
  popScope(&stack);

  char* str2 = varTableToString(stack);

  #ifdef DEBUG
     printf("DEBUG: \n%s\n", str2);
     fflush(stdout);
  #endif
  

  ASSERT_STR_EQ(str2, "NULL", "Error Str is not equal");

  
  freeVarTable(stack);
  free(str2);
  
  return 1;
}

int addElemTest(){
  ScopeStack stack = createVarTable();
  LLVMValueRef ref = LLVMConstInt(LLVMInt32Type(), 20, 1);
  pushScope(&stack);
  addElemToVarTable(&stack, "elem", ref);
  pushScope(&stack);
  addElemToVarTable(&stack, "elem", ref);
  addElemToVarTable(&stack, "elem2", ref);
  pushScope(&stack);
  addElemToVarTable(&stack, "elem3", ref);
  
  char* str = varTableToString(stack);

  #ifdef DEBUG
     printf("DEBUG: \n%s\n", str);
  #endif

  free(str);
  popScope(&stack);
  popScope(&stack);
  popScope(&stack);

  char* str2 = varTableToString(stack);

  #ifdef DEBUG
     printf("DEBUG: \n%s\n", str2);
  #endif
  

  ASSERT_STR_EQ(str2, "NULL", "Error Str is not equal");

  
  freeVarTable(stack);
  free(str);
  
  return 1;
}

int getElemTest(){
  ScopeStack stack = createVarTable();
  LLVMValueRef ref = LLVMConstInt(LLVMInt32Type(), 20, 1);
  LLVMValueRef ref2 = LLVMConstInt(LLVMInt32Type(), 30, 1);
  LLVMValueRef ref3 = LLVMConstInt(LLVMInt32Type(), 80, 1);
  
  pushScope(&stack);
  addElemToVarTable(&stack, "elem", ref);
  pushScope(&stack);
  addElemToVarTable(&stack, "ele3", ref2);
  addElemToVarTable(&stack, "elem2", ref3);
  pushScope(&stack);
  addElemToVarTable(&stack, "elem3", ref);

  LLVMValueRef myRef = getElemFromVarTable(stack, "elem2");

  ASSERT_EQ(myRef, ref3, "Error ref in table is not equal");

  LLVMValueRef myOtherRef = getElemFromVarScope(stack, "elem2");
  ASSERT_EQ(myOtherRef, NULL, "Error ref in scope is not equal");
  
  popScope(&stack);
  popScope(&stack);
  popScope(&stack);
  
  freeVarTable(stack);
  
  return 1;
}

int main(){
  RUN_TEST(createScopeStack);
  RUN_TEST(pushScopeTest);
  RUN_TEST(popScopeTest);
  RUN_TEST(addElemTest);
  RUN_TEST(getElemTest);
  return 0;
}

