#include "TestUtils.h"
#include "VarDefLinkedList.h"

#define DEBUG

int createList(){
  VarDefList list = createVarDefList();
  char* str = varDefListToString(list);
  
  #ifdef DEBUG
  printf("DEBUG: %s\n", str);
  #endif

  ASSERT_EQ(strlen(str), strlen("->NULL"), "Strings lengths are not equal");
  ASSERT_STR_EQ(str, "->NULL", "Strings are not equal");
  
  return 1;
}

int main(){
  RUN_TEST(createList);
}
