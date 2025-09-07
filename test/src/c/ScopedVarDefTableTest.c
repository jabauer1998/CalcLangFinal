#include "TestUtils.h"
#include <llvm-c/Core.h>
#include "ScopedVarDefTable.h"
#include <stdio.h>
#include <stdlib.h>

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

int main(){
  RUN_TEST(createScopeStack);
  return 0;
}

