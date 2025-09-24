#include <stdio.h>
#include "CalcLangAstC.h"
#include "CalcLangCompiler.h"
#include "CalcLangParser_stub.h"
#include "CalcLangIrGen.h"
#include <HsFFI.h>
#include <stdlib.h>
#include "llvm-c/Core.h"
#include <llvm-c/Target.h>
#include <llvm-c/ExecutionEngine.h>
#include <string.h>


void processAST (AstNode* node){
  #ifdef DEBUG
  char* str = astToString((AstNode*)node);
  printf("C String is: %s\n", str);
  free(str);
  #endif
  freeTree(node);
}

void processASTList(StoreArray* storeArray, char* output){
  LLVMModuleRef mod = codeGen(storeArray);
  char *error = NULL;  
    // Verify the module and get the error message
  LLVMBool broken = LLVMVerifyModule(mod, LLVMReturnStatusAction, &error);

  if(broken){
    perror("Linked Module has Error: \n");
    perror(error);
    LLVMDisposeMessage(error);
  } else {
    // Initialize LLVM targets
    LLVMInitializeAllTargetInfos();
    LLVMInitializeAllTargets();
    LLVMInitializeAllTargetMCs();
    LLVMInitializeAllAsmPrinters();
    LLVMInitializeAllAsmParsers();

    // Get the default target triple
    char* triple = LLVMGetDefaultTargetTriple();
    // Get the target from the triple
    LLVMTargetRef target;
    if (LLVMGetTargetFromTriple(triple, &target, &error)) {
      perror(error);
      return;
    }

    // Create a target machine
    LLVMTargetMachineRef targetMachine = LLVMCreateTargetMachine(target, triple, "generic", "", LLVMCodeGenLevelAggressive, LLVMRelocDefault, LLVMCodeModelDefault);
    if (LLVMTargetMachineEmitToFile(targetMachine, mod, "output.o", LLVMObjectFile, &error)) {
      perror(error);
      return;
    }

    char myData[1000];
    myData[0] = '\0';
    char* beg = "clang -static -o ";
    strncat(myData, beg, strlen(beg));
    strncat(myData, output, strlen(output));
    char* end = " output.o  -lm";
    strncat(myData, end, strlen(end));
    printf("Compiling with %s", myData);
    system(myData); //Generate the exe

    //Remove output.o
    remove("output.o");
    // Clean up
    LLVMDisposeMessage(triple);
    LLVMDisposeMessage(error);
    LLVMDisposeTargetMachine(targetMachine);
  }
}
