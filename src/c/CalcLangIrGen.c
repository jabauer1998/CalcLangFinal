#include "CalcLangIrGen.h"
#include "CalcLangAstC.h"
#include <llvm-c/Core.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <llvm-c/IRReader.h>
#include <llvm-c/Linker.h>
#include "ScopedVarDefTable.h"

#define DEBUG

void codeGenNode(AstNode* node, ScopeStack stack, DefList list, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMTypeRef calcLangPtr, LLVMValueRef arena, LLVMContextRef ctx, LLVMModuleRef mod);
LLVMValueRef codeGenExpression(AstNode* node, ScopeStack stack, DefList list, LLVMBuilderRef builder, LLVMValueRef func, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx);

void loadCalcLangLinkerFile(LLVMModuleRef module, LLVMContextRef ctx, LLVMBuilderRef builder){
    LLVMMemoryBufferRef MemBuf;
    char *Message;
    if (LLVMCreateMemoryBufferWithContentsOfFile("./lib/ir/CalcLangCInt.ll", &MemBuf, &Message)){
      perror(Message);
    }
    
    LLVMModuleRef ExternalModule;
    if (LLVMParseIRInContext(ctx, MemBuf, &ExternalModule, &Message)) {
      perror(Message);
    }
    
    // Link the external module into your current module
    if(LLVMLinkModules2(module, ExternalModule)) {
      perror("Linking module failed");
    }

    LLVMMemoryBufferRef MemBuf2;
    if(LLVMCreateMemoryBufferWithContentsOfFile("./lib/ir/CalcLangCIntArena.ll", &MemBuf2, &Message)){
      perror(Message);
    }

    LLVMModuleRef ExternalModule2;
    if(LLVMParseIRInContext(ctx, MemBuf2, &ExternalModule2, &Message)){
      perror(Message);
    }

    if(LLVMLinkModules2(module, ExternalModule2)){
      perror("Linking Module Failed");
    }

    LLVMMemoryBufferRef MemBuf3;
    if(LLVMCreateMemoryBufferWithContentsOfFile("./lib/ir/CalcLangCGraph.ll", &MemBuf3, &Message)){
      perror(Message);
    }

    LLVMModuleRef ExternalModule3;
    if(LLVMParseIRInContext(ctx, MemBuf3, &ExternalModule3, &Message)){
      perror(Message);
    }

    if(LLVMLinkModules2(module, ExternalModule3)){
      perror("Linking Module Failed");
    }
}

void printStringRef(char* string, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef func = LLVMGetNamedFunction(mod, "printString");
  int size = strlen(string);
  LLVMValueRef strGlobal = LLVMBuildGlobalStringPtr(builder, string, "");
  LLVMTypeRef paramTypes[]= {
    LLVMPointerType(LLVMInt8Type(), 0)
  };
  LLVMValueRef args[] = {
    strGlobal
  };
  LLVMTypeRef funcType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), paramTypes, 1, 0);
  LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

void getInputRef(LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef func = LLVMGetNamedFunction(mod, "getInput");
  LLVMTypeRef paramTypes[]= {};
  LLVMValueRef args[] = {};
  LLVMTypeRef funcType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), paramTypes, 0, 0);
  LLVMBuildCall2(builder, funcType, func, args, 0, "");
}

LLVMValueRef generateArena(LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(arenaType, 0);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "arenaInit");
  int size = 10000000;
  LLVMTypeRef intType = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef paramTypes[] = {intType};
  LLVMTypeRef funcType = LLVMFunctionType(arenaPtrType, paramTypes, 1, 0);
  LLVMValueRef args[] = { LLVMConstInt(intType, size, 0) };
  return LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

void freeArena(LLVMValueRef arena, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(arenaType, 0);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "arenaFree");
  LLVMTypeRef paramTypes[] = {arenaPtrType};
  LLVMTypeRef funcType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), paramTypes, 1, 0);
  LLVMValueRef args[] = { arena };
  LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

void drawGraph(LLVMValueRef arena, LLVMValueRef begin, LLVMValueRef end, LLVMValueRef incr, LLVMValueRef func, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(arenaType, 0);
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "struct.CalcLangVal");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMTypeRef paramTypes[] = {arenaPtrType, point};
  LLVMTypeRef funcParamType = LLVMFunctionType(point, paramTypes, 2, 0);
  LLVMTypeRef funcParamTypePtr = LLVMPointerType(funcParamType, 0);

  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "drawGraph");
  LLVMTypeRef intType = LLVMInt32TypeInContext(ctx);
  //Now define actualFunctionType
  LLVMTypeRef actualArgTypes[] = {arenaPtrType, intType, intType, intType, funcParamTypePtr};
  LLVMTypeRef actualType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), actualArgTypes, 5, 0);
  LLVMValueRef args[] = { arena, begin, end, incr, func};
  LLVMBuildCall2(builder, actualType, myFunc, args, 5, "");
}

void defineFunctions(StoreArray* arr, DefList funcDefs, LLVMModuleRef mod, LLVMContextRef ctx){
  for(int i = 0; i < arr->length; i++){
    AstNode* node = arr->firstElem[i];
    if(node->nodeType == FUNCTION_DEFINITION){
      FunctionDef* myNode = &(node->actualNodeData.function);
      LLVMTypeRef myType = LLVMGetTypeByName(mod, "struct.CalcLangVal");
      LLVMTypeRef point = LLVMPointerType(myType, 0);
      LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
      LLVMTypeRef arenaPtrType = LLVMPointerType(arenaType, 0);
      int size = myNode->param->length;
      LLVMTypeRef paramTypes[size + 1];
      paramTypes[0] = arenaPtrType;
      for(int i = 1; i < size + 1; i++){
	paramTypes[i] = point;
      }
      LLVMTypeRef funcType = LLVMFunctionType(point, paramTypes, size + 1, 0);

      char myName[2];
      myName[0] = myNode->name;
      myName[1] = '\0';
      LLVMValueRef func = LLVMAddFunction(mod, myName, funcType);
      LLVMSetLinkage(func, LLVMExternalLinkage);
      addDef(&funcDefs, myNode->name, func);
    }
  }
}

LLVMModuleRef codeGen(StoreArray* arr){
  ScopeStack stack = createVarTable();
  DefList funcDefs = createDefList();
  
  pushScope(&stack);
  LLVMModuleRef module = LLVMModuleCreateWithName("CalcLangLessonPlan");
  LLVMContextRef ctx = LLVMGetGlobalContext();
  LLVMBuilderRef builder = LLVMCreateBuilderInContext(ctx);
  loadCalcLangLinkerFile(module, ctx, builder);
  
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);

  defineFunctions(arr, funcDefs, module, ctx);
  
  //Define main method
  LLVMTypeRef intType = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef charPtrType = LLVMPointerType(LLVMInt8TypeInContext(ctx), 0);
  LLVMTypeRef mainParamTypes[] = {intType, LLVMPointerType(charPtrType, 0)};
  LLVMTypeRef mainFunctionType = LLVMFunctionType(intType, mainParamTypes, 2, 0); // 2 parameters, not variadic
  LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);
  LLVMSetLinkage(mainFunction, LLVMExternalLinkage);
  LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(ctx, mainFunction, "entry");
  LLVMPositionBuilderAtEnd(builder, entryBlock);

  LLVMValueRef arena = generateArena(builder, module, ctx);

  for(int i = 0; i < arr->length; i++){
    AstNode* node = arr->firstElem[i];
    char* str = astToString(node);
    printStringRef(str, builder, module, ctx);
    free(str);
    getInputRef(builder, module, ctx);
    codeGenNode(node, stack, funcDefs, builder, mainFunction, calcLangPtrType, arena, ctx, module);
    getInputRef(builder, module, ctx);
  }

  freeArena(arena, builder, module, ctx);

  LLVMValueRef zero = LLVMConstInt(intType, 0, 0); // Create an integer constant 0
  LLVMBuildRet(builder, zero); // Build the return instruction

  popScope(&stack);
  freeVarTable(stack);
  freeDefList(funcDefs);
  LLVMDisposeBuilder(builder);
  return module;
}

LLVMTypeRef createFunctionPointerType(LLVMContextRef ctx, int numArgs, int isVoid){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);

  LLVMTypeRef paramTypes[numArgs];
  paramTypes[0] = arenaPtrType;
  
  for(int i = 1; i < numArgs; i++){
    paramTypes[i] = calcLangPtrType;
  }

  if(!isVoid){
    return LLVMFunctionType(calcLangPtrType, paramTypes, numArgs, 0);
  } else {
    return LLVMFunctionType(LLVMVoidTypeInContext(ctx), paramTypes, numArgs, 0);
  }
}

void printValueRef(LLVMValueRef refToPrint, ScopeStack stack,  LLVMBuilderRef builder, LLVMTypeRef ptr, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "printValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef argTypes[] = { calcLangPtrType };
  LLVMTypeRef funcType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), argTypes, 1, 0);
  LLVMValueRef args[] = { refToPrint };
  LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
}

LLVMValueRef codeGenEqualsOperation(EqualOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "equalsCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenLessThenOrEqualsOperation(LessThenOrEqualsOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "lessThenOrEqualToCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenGreaterThenOrEqualsOperation(GreaterThenOrEqualsOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "greaterThenOrEqualToCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenLessThenOperation(LessThenOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "lessThenCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenGreaterThenOperation(GreaterThenOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "greaterThenCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenAdditionOperation(AdditionOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "addCalcLangValues");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 3, "");
}

LLVMValueRef codeGenSubtractionOperation(SubtractionOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "subCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenMultiplicationOperation(MultiplicationOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "multCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenDotProductOperation(DotProductOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "dorProductVals");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenDivisionOperation(DivisionOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "divCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenPowerOperation(PowerOperation* op, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena,  LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "powCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 3, 0);
  LLVMValueRef args[] = { arena, leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenIntegerValue(IntNumberAst* val, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  int myInt = atoi(val->lexeme);
  LLVMValueRef myIntRef = LLVMConstInt(int32Type, myInt, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "integerCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    arenaPtrType,
    int32Type
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 2, 0);
  #ifdef DEBUG
  LLVMDumpType(funcType);
  #endif
  LLVMValueRef args[] = { arena, myIntRef };
  LLVMValueRef result = LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
  return result;
}

LLVMValueRef codeGenRealValue(RealNumberAst* val, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  double dVal = atof(val->lexeme);
  LLVMValueRef myReal = LLVMConstReal(floatType, dVal);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "realCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    arenaPtrType,
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 2, 0);
  LLVMValueRef args[] = { arena, myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
}

LLVMValueRef codeGenBooleanValue(BooleanAst* val, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMValueRef myInt;
  if(strcmp(val->lexeme, "TRUE") == 0){
    myInt = LLVMConstInt(int32Type, 1, 0);
  } else {
    myInt = LLVMConstInt(int32Type, 0, 0);
  }
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "booleanCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    arenaPtrType,
    int32Type
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 2, 0);
  LLVMValueRef args[] = { arena, myInt };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
}

LLVMValueRef codeGenSetValue(SetAst* val, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrToPtrType = LLVMPointerType(calcLangPtrType, 0);
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef arrayType = LLVMArrayType(calcLangPtrType, val->arr->length);
  LLVMValueRef pointToArray = LLVMBuildAlloca(builder, arrayType, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, funcDefs,  builder, parentFunc, arena, mod, ctx);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {oneIndex};
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, calcLangPtrToPtrType, pointToArray, indices, 1, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "setCalcLangValue");
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef paramTypes[] = {
    arenaPtrType,
    calcLangPtrToPtrType,
    int32Type
  };
  LLVMTypeRef myFuncType = LLVMFunctionType(calcLangPtrType, paramTypes, 3, 0);
  LLVMValueRef args[] = { arena, pointToArray, length };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}

LLVMValueRef codeGenTupleValue(TupleAst* val, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrToPtrType = LLVMPointerType(calcLangPtrType, 0);
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef arrayType = LLVMArrayType(calcLangPtrType, val->arr->length);
  LLVMValueRef pointToArray = LLVMBuildAlloca(builder, arrayType, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {oneIndex};
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, calcLangPtrToPtrType, pointToArray, indices, 1, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "tupleCalcLangValue");
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef paramTypes[] = {
    arenaPtrType,
    calcLangPtrToPtrType,
    int32Type
  };
  LLVMTypeRef myFuncType = LLVMFunctionType(calcLangPtrType, paramTypes, 3, 0);
  LLVMValueRef args[] = { arena, pointToArray, length };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 3, "");
}


LLVMValueRef codeGenIdentifierValue(IdentAst* ident, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef value = getElemFromVarTable(stack, ident->name);
  if(value == NULL){
    perror("Error value with name not found in symbol table");
    return NULL;
  }
  LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMValueRef res = LLVMBuildLoad2(builder, point, value, "");
  
  return res;
}

LLVMValueRef codeGenDollarValue(DollarAst* dollar, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(dollar->lexeme));
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "dollarCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    arenaPtrType,
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 2, 0);
  LLVMValueRef args[] = { arena, myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
}

LLVMValueRef codeGenPercentValue(PercentAst* percent, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(percent->lexeme));
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "percentCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    arenaPtrType,
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 2, 0);
  LLVMValueRef args[] = { arena, myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
}

LLVMValueRef codeGenFunctionCall(FunctionCall* call, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef funcDef = getDef(funcDefs, call->name);
  if(funcDef == NULL){
    char funcName[2];
    funcName[0] = call->name;
    funcName[1] = '\0';
    funcDef = LLVMGetNamedFunction(mod, funcName);
  }
  
  StoreArray* array = call->params;
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, array->length + 1, 0);
  LLVMValueRef args[array->length + 1];
  
  args[0] = arena;
  for(int i = 1; i < (array->length + 1); i++){
    args[i] = codeGenExpression(array->firstElem[i - 1], stack, funcDefs,  builder, parentFunc, arena, mod, ctx);
  }
  
  return LLVMBuildCall2(builder, myFuncType, funcDef, args, array->length + 1, "");
}

LLVMValueRef codeGenNegateOperation(NegateOperation* negate, ScopeStack stack, DefList funcDefs,  LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef ref = codeGenExpression(negate->expr, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "negateCalcLangValue");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { arena, ref };
  return LLVMBuildCall2(builder, funcType, func, args, 2, "");
}

LLVMValueRef codeGenNotOperation(NotOperation* not, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef ref = codeGenExpression(not->expr, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "notCalcLangValue");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { arena , ref };
  return LLVMBuildCall2(builder, funcType, func, args, 2, "");
}

LLVMValueRef toBoolVal(LLVMValueRef ref, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef host, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "toBool");
  LLVMTypeRef params[] = {
    calcLangPtrType
  };
  LLVMTypeRef funcType = LLVMFunctionType(LLVMInt1Type(), params, 1, 0);
  LLVMValueRef args[] = { ref };
  return LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

LLVMValueRef codeGenIfExpression(IfExpr* ifStat, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef func, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMValueRef condVal = codeGenExpression(ifStat->cond, stack, funcDefs, builder, func, arena, mod, ctx);
  LLVMValueRef boolVal = toBoolVal(condVal, stack, funcDefs, builder, func, mod, ctx);
  LLVMBasicBlockRef thenBlock = LLVMAppendBasicBlock(func, "");
  LLVMBasicBlockRef elseBlock = LLVMAppendBasicBlock(func, "");
  LLVMBasicBlockRef mergeBlock = LLVMAppendBasicBlock(func, "");
  
  LLVMBuildCondBr(builder, boolVal, thenBlock, elseBlock);

  LLVMPositionBuilderAtEnd(builder, thenBlock);
  LLVMValueRef thenResult = codeGenExpression(ifStat->ifTrue, stack, funcDefs, builder, func, arena, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);
  thenBlock = LLVMGetInsertBlock(builder);

  LLVMPositionBuilderAtEnd(builder, elseBlock);
  LLVMValueRef elseResult = codeGenExpression(ifStat->ifFalse, stack, funcDefs, builder, func, arena, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);
  elseBlock = LLVMGetInsertBlock(builder);

  LLVMPositionBuilderAtEnd(builder, mergeBlock);
  LLVMValueRef phiNode = LLVMBuildPhi(builder, point, "");

  LLVMValueRef incomingValues[] = { thenResult, elseResult };
  LLVMBasicBlockRef incomingBlocks[] = { thenBlock, elseBlock };
  LLVMAddIncoming(phiNode, incomingValues, incomingBlocks, 2);
 
  return phiNode;
}

char genParamName(AstNode* node){
  if(node->nodeType == IDENT_AST){
    return node->actualNodeData.ident.name;
  } else {
    perror("Unexpected Ast Node for Paramter");
    return '\0';
  }
}


LLVMValueRef codeGenExpression(AstNode* node, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef func, LLVMValueRef arena, LLVMModuleRef mod, LLVMContextRef ctx){
  #ifdef DEBUG
  printf("\nNodeType: %d\n", node->nodeType);
  fflush(stdout);
  #endif
  switch(node->nodeType){
  case EQUAL_OPERATION: return codeGenEqualsOperation(&(node->actualNodeData.equalOperation), stack, funcDefs, builder, func, arena, mod, ctx);
  case LESS_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.lessOrEqual), stack, funcDefs, builder, func, arena, mod, ctx);
  case GREATER_THEN_OR_EQUALS_OPERATION: return codeGenGreaterThenOrEqualsOperation(&(node->actualNodeData.greaterOrEqual), stack, funcDefs, builder, func, arena, mod, ctx);
  case LESS_THEN_OPERATION: return codeGenLessThenOperation(&(node->actualNodeData.lessThen), stack, funcDefs, builder, func, arena, mod, ctx);
  case GREATER_THEN_OPERATION: return codeGenGreaterThenOperation(&(node->actualNodeData.greaterThen), stack, funcDefs, builder, func, arena, mod, ctx);
  case ADDITION_OPERATION: return codeGenAdditionOperation(&(node->actualNodeData.addition), stack, funcDefs, builder, func, arena, mod, ctx);
  case SUBTRACTION_OPERATION: return codeGenSubtractionOperation(&(node->actualNodeData.subtraction), stack, funcDefs, builder, func, arena, mod, ctx);
  case MULTIPLICATON_OPERATION: return codeGenMultiplicationOperation(&(node->actualNodeData.multiplication), stack, funcDefs, builder, func, arena, mod, ctx);
  case DOT_PRODUCT_OPERATION: return codeGenDotProductOperation(&(node->actualNodeData.dotProduct), stack, funcDefs, builder, func, arena, mod, ctx);
  case DIVISION_OPERATION: return codeGenDivisionOperation(&(node->actualNodeData.division), stack, funcDefs, builder, func, arena, mod, ctx);
  case POWER_OPERATION: return codeGenPowerOperation(&(node->actualNodeData.power), stack, funcDefs, builder, func, arena, mod, ctx);
  case INT_AST: return codeGenIntegerValue(&(node->actualNodeData.integer), stack, funcDefs, builder, func, arena, mod, ctx);
  case REAL_AST: return codeGenRealValue(&(node->actualNodeData.real), stack, funcDefs, builder, func, arena, mod, ctx);
  case BOOL_AST: return codeGenBooleanValue(&(node->actualNodeData.bool), stack, funcDefs, builder, func, arena, mod, ctx);
  case SET_AST: return codeGenSetValue(&(node->actualNodeData.set), stack, funcDefs,  builder, func, arena, mod, ctx);
  case TUPLE_AST: return codeGenTupleValue(&(node->actualNodeData.tuple), stack, funcDefs,  builder, func, arena, mod, ctx);
  case IDENT_AST: return codeGenIdentifierValue(&(node->actualNodeData.ident), stack, funcDefs,  builder, func, arena, mod, ctx);
  case DOLLAR_AST: return codeGenDollarValue(&(node->actualNodeData.dollar), stack, funcDefs,  builder, func, arena, mod, ctx);
  case PERCENT_AST: return codeGenPercentValue(&(node->actualNodeData.percent), stack, funcDefs,  builder, func, arena, mod, ctx);
  case FUNCTION_CALL: return codeGenFunctionCall(&(node->actualNodeData.call), stack, funcDefs,  builder, func, arena, mod, ctx);
  case NEGATE_OPERATION: return codeGenNegateOperation(&(node->actualNodeData.negate), stack, funcDefs,  builder, func, arena, mod, ctx);
  case NOT_OPERATION: return codeGenNotOperation(&(node->actualNodeData.not), stack, funcDefs,  builder, func, arena, mod, ctx);
  case IF_EXPR: return codeGenIfExpression(&(node->actualNodeData.ifStatement), stack, funcDefs,  builder, func, arena, mod, ctx);
  case PAREN_EXPR: return codeGenExpression(node->actualNodeData.par.expr, stack, funcDefs,  builder, func, arena, mod, ctx);
  default:
    perror("Invalid Expression type found!!!");
    return NULL;
  }
}

void resetArena(LLVMValueRef arena, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef arenaType = LLVMGetTypeByName2(ctx, "struct.LLVMIntArena");
  LLVMTypeRef arenaPtrType = LLVMPointerType(arenaType, 0);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "arenaReset");
  LLVMTypeRef argType[] = {arenaPtrType};
  LLVMTypeRef funcType = LLVMFunctionType(LLVMVoidTypeInContext(ctx), argType, 1, 0);
  LLVMValueRef args[] = {arena};
  
  LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

LLVMValueRef copyCalcLangValue(LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx, LLVMValueRef val){
  LLVMValueRef func = LLVMGetNamedFunction(mod, "copyValue");
  LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMTypeRef argType[] = {point};
  LLVMTypeRef funcType = LLVMFunctionType(point, argTy\
pe, 1, 0);
  LLVMValueRef args[] = {val};
  return LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

void codeGenNode(AstNode* node, ScopeStack stack, DefList funcDefs, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMTypeRef calcLangPtr, LLVMValueRef arena, LLVMContextRef ctx, LLVMModuleRef mod){
  switch(node->nodeType){
  case EQUAL_OPERATION: {
    LLVMValueRef resultEq = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultEq, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case LESS_THEN_OR_EQUALS_OPERATION: {
    LLVMValueRef resultLE = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultLE, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case GREATER_THEN_OR_EQUALS_OPERATION: {
    LLVMValueRef resultGE = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultGE, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
  }
  case LESS_THEN_OPERATION: {
    LLVMValueRef resultLT = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultLT, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case GREATER_THEN_OPERATION: {
    LLVMValueRef resultGT = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultGT, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case ADDITION_OPERATION: {
    LLVMValueRef resultAdd = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultAdd, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case SUBTRACTION_OPERATION: {
    LLVMValueRef resultSub = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultSub, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case MULTIPLICATON_OPERATION: {
    LLVMValueRef resultMult = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resultMult, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case DOT_PRODUCT_OPERATION: {
    LLVMValueRef dotProductOp = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(dotProductOp, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case DIVISION_OPERATION: {
    LLVMValueRef divisionOp = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(divisionOp, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case POWER_OPERATION: {
    LLVMValueRef powerOp = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(powerOp, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case INT_AST: {
    LLVMValueRef intVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(intVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case REAL_AST: {
    LLVMValueRef realVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(realVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case BOOL_AST: {
    LLVMValueRef boolVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(boolVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case SET_AST: {
    LLVMValueRef setVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(setVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case TUPLE_AST: {
    LLVMValueRef tupleVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(tupleVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case IDENT_AST: {
    LLVMValueRef identVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(identVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case DOLLAR_AST: {
    LLVMValueRef dollarVal = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(dollarVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case PERCENT_AST: {
    LLVMValueRef percVal = codeGenExpression(node, stack, funcDefs,  builder, parentFunc, arena, mod, ctx);
    printValueRef(percVal, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case FUNCTION_CALL: {
    LLVMValueRef ref = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(ref, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case NEGATE_OPERATION: {
    LLVMValueRef negateOp = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(negateOp, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case NOT_OPERATION: {
    LLVMValueRef notOp = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(notOp, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case FUNCTION_DEFINITION: {
    FunctionDef* myNode = &(node->actualNodeData.function);
    LLVMBasicBlockRef toResume = LLVMGetInsertBlock(builder);

    LLVMTypeRef myType = LLVMGetTypeByName(mod, "struct.CalcLangVal");
    LLVMTypeRef point = LLVMPointerType(myType, 0);

    pushScope(&stack);

    LLVMValueRef func = getDef(funcDefs, myNode->name);
    if(func == NULL){
      char funcName[2];
      funcName[0] = myNode->name;
      funcName[1] = '\0';
      func = LLVMGetNamedFunction(mod, funcName);
    }

    int size = myNode->param->length;
    
    LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(ctx, func, "entry");
    LLVMPositionBuilderAtEnd(builder, entryBlock);

    LLVMValueRef argArena = LLVMGetParam(func, 0);
    
    for(int i = 1; i < (size + 1); i++){
      char name = genParamName(myNode->param->firstElem[i - 1]);
      char fullName[2];
      fullName[0] = name;
      fullName[1] = '\0';
      printStringRef("Param Name ", builder, mod, ctx);
      printStringRef(fullName, builder, mod, ctx);
      LLVMValueRef arg1 = LLVMGetParam(func, i);
      printStringRef(" and value ", builder, mod, ctx);
      printValueRef(arg1, stack, builder, calcLangPtr, mod, ctx);
      LLVMValueRef ptrToy = LLVMBuildAlloca(builder, point, "");
      LLVMBuildStore(builder, arg1, ptrToy);
      addElemToVarTable(&stack, name, ptrToy);
    }
    
    pushScope(&stack);

    char funcName[2];
    funcName[0] = myNode->name;
    funcName[1] = '\0';
    printStringRef("Entering ", builder, mod, ctx);
    printStringRef(funcName, builder, mod, ctx);
    LLVMValueRef result = codeGenExpression(myNode->expr, stack, funcDefs, builder, func, argArena, mod, ctx);
    LLVMBuildRet(builder, result);
    
    popScope(&stack);
    popScope(&stack);
    
    LLVMPositionBuilderAtEnd(builder, toResume);
    break;
  }
  case ASSIGN: {
    LLVMValueRef valueToAssign = codeGenExpression(node->actualNodeData.variable.expr, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    LLVMValueRef valuedCopy = copyCalcLangValue(builder, mod, ctx, valueToAssign);
    resetArena(arena, builder, mod, ctx);
    LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
    LLVMTypeRef point = LLVMPointerType(myType, 0);
    LLVMValueRef ptrToX = LLVMBuildAlloca(builder, point, "");
    char name = node->actualNodeData.variable.name;
    LLVMBuildStore(builder, valuedCopy, ptrToX);
    addElemToVarTable(&stack, name, ptrToX);
    break;
  }
  case IF_EXPR: {
    LLVMValueRef resIf = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resIf, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case PAREN_EXPR: {
    LLVMValueRef resPar = codeGenExpression(node, stack, funcDefs, builder, parentFunc, arena, mod, ctx);
    printValueRef(resPar, stack, builder, calcLangPtr, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  case CREATE_GRAPH_COMMAND: {
    CreateGraphCommand* myNode = &(node->actualNodeData.graph);

    LLVMValueRef func = getDef(funcDefs, myNode->name);
    if(func == NULL){
      char funcName[2];
      funcName[0] = myNode->name;
      funcName[1] = '\0';
      func = LLVMGetNamedFunction(mod, funcName);
    }
    LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);

    LLVMValueRef begin = LLVMConstInt(int32Type, atoi(myNode->begin), 0);
    LLVMValueRef end = LLVMConstInt(int32Type, atoi(myNode->end), 0);
    LLVMValueRef incr = LLVMConstInt(int32Type, atoi(myNode->incr), 0);

    drawGraph(arena, begin, end, incr, func, builder, mod, ctx);
    resetArena(arena, builder, mod, ctx);
    break;
  }
  default:
    perror("Unexpected type when generating CalcLang");
    break;
  }
}
  
