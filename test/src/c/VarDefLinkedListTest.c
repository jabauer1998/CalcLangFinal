#include "TestUtils.h"
#include "VarDefLinkedList.h"
#include <llvm-c/Core.h>
#include <stdlib.h>

#define DEBUG

int createList(){
  VarDefList list = createVarDefList();
  char* str = varDefListToString(list);
  
  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_EQ(strlen(str), strlen("->NULL"), "Strings lengths are not equal");
  ASSERT_STR_EQ(str, "->NULL", "Strings are not equal");

  free(str);

  freeVarDefList(list);
  
  return 1;
}

int addElemToVarList(){
  VarDefList list = createVarDefList();
  VarDefNode* node = malloc(sizeof(VarDefNode));
  node->name = "VarName";
  node->ref = LLVMConstInt(LLVMInt32TypeInContext(LLVMGetGlobalContext()), 10, 1);
  addVarDef(&list, node);

  char* str = varDefListToString(list);

  ASSERT_STR_EQ(str, "->VarName->NULL", "Error Strings do not match");

  freeVarDefList(list);
  free(str);

  return 1;
}

int main(){
  RUN_TEST(createList);
  RUN_TEST(addElemToVarList);
}
