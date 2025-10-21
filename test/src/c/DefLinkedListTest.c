#include "TestUtils.h"
#include "DefLinkedList.h"
#include <llvm-c/Core.h>
#include <stdlib.h>
#include <string.h>

#define DEBUG

int createList(){
  DefList list = createDefList();
  char* str = defListToString(list);
  
  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_EQ(strlen(str), strlen("NULL"), "Strings lengths are not equal");
  ASSERT_STR_EQ(str, "NULL", "Strings are not equal");

  free(str);

  freeDefList(list);
  
  return 1;
}

int addElemToVarList(){
  DefList list = createDefList();

  char name = 'v';
  LLVMValueRef ref  = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  addDef(&list, name, ref);

  char* str = defListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_STR_EQ(str, "{Name: v}->NULL", "Error Strings do not match");

  freeDefList(list);
  free(str);

  return 1;
}

int addMultipleElemsToVarList(){
  DefList list = createDefList();

  char name = 'v';
  LLVMValueRef ref = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  
  addDef(&list, name, ref);
  addDef(&list, name, ref);

  char* str = defListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_STR_EQ(str, "{Name: v}->{Name: v}->NULL", "Error Strings do not match");

  freeDefList(list);
  free(str);

  return 1;
}

int getVarDefTest(){
  DefList list = createDefList();

  char name = 'e';
  LLVMValueRef ref = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  addDef(&list, name, ref);

  LLVMValueRef ref2 = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 40, 1);
  char name2 = 'f';
  addDef(&list, name2, ref2);

  LLVMValueRef ref3 = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 50, 1);
  char name3 = 'g';
  addDef(&list, name3, ref3);

  char* str = defListToString(list);

  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  LLVMValueRef getRef = getDef(list, name2);

  ASSERT_EQ(getRef, ref2, "Opps the refs are not equal");

  freeDefList(list);
  free(str);
  
  return 1;
}

int main(){
  RUN_TEST(createList);
  RUN_TEST(addElemToVarList);
  RUN_TEST(addMultipleElemsToVarList);
  RUN_TEST(getVarDefTest);
}
