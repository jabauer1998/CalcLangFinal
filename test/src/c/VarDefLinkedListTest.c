#include "TestUtils.h"
#include "VarDefLinkedList.h"
#include <llvm-c/Core.h>
#include <stdlib.h>
#include <string.h>

#define DEBUG

int createList(){
  VarDefList list = createVarDefList();
  char* str = varDefListToString(list);
  
  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_EQ(strlen(str), strlen("NULL"), "Strings lengths are not equal");
  ASSERT_STR_EQ(str, "NULL", "Strings are not equal");

  free(str);

  freeVarDefList(list);
  
  return 1;
}

int addElemToVarList(){
  VarDefList list = createVarDefList();

  char* name = "varname";
  LLVMValueRef ref  = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  addVarDef(&list, name, ref);

  char* str = varDefListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_STR_EQ(str, "{Name: varname}->NULL", "Error Strings do not match");

  freeVarDefList(list);
  free(str);

  return 1;
}

int addMultipleElemsToVarList(){
  VarDefList list = createVarDefList();

  char* name = "varname";
  LLVMValueRef ref = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  
  addVarDef(&list, name, ref);
  addVarDef(&list, name, ref);

  char* str = varDefListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_STR_EQ(str, "{Name: varname}->{Name: varname}->NULL", "Error Strings do not match");

  freeVarDefList(list);
  free(str);

  return 1;
}

int getVarDefTest(){
  VarDefList list = createVarDefList();

  char* name = "elem1";
  LLVMValueRef ref = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  addVarDef(&list, name, ref);

  LLVMValueRef ref2 = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 40, 1);
  char* name2 = "elem2";
  addVarDef(&list, name2, ref2);

  LLVMValueRef ref3 = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 50, 1);
  char* name3 = "elem3";
  addVarDef(&list, name3, ref3);

  char* str = varDefListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  LLVMValueRef getRef = getVarDef(list, name2);

  ASSERT_EQ(getRef, ref2, "Opps the refs are not equal");

  freeVarDefList(list);
  free(str);
  
  return 1;
}

int main(){
  RUN_TEST(createList);
  RUN_TEST(addElemToVarList);
  RUN_TEST(addMultipleElemsToVarList);
  RUN_TEST(getVarDefTest);
}
