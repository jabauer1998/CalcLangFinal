#include <stdio.h>
#include "CalcLangAstC.h"
#include "CalcLangCompiler.h"
#include "CalcLangParser_stub.h"
#include <HsFFI.h>
#include <stdlib.h>


void processAST (AstNode* node){
  #ifdef DEBUG
  char* str = astToString((AstNode*)node);
  printf("C String is: %s\n", str);
  free(str);
  #endif
  freeTree(node);
}

void processASTList (StoreArray* storeArray){
  for(int i = 0; i < storeArray->length; i++){
    char* str = astToString(storeArray->firstElem[i]);
    printf("%s\n", str);
    free(str);
  }
  freeStoreArray(storeArray);
}
