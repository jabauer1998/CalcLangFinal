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

void codeGenNode(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMTypeRef calcLangPtr, LLVMContextRef ctx, LLVMModuleRef mod);
LLVMValueRef codeGenExpression(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef func, LLVMModuleRef mod, LLVMContextRef ctx);

void loadCalcLangLinkerFile(LLVMModuleRef module, LLVMContextRef ctx, LLVMBuilderRef builder){
    LLVMMemoryBufferRef MemBuf;
    char *Message;
    if (LLVMCreateMemoryBufferWithContentsOfFile("./ir/c/LinkToCalcLang.ll", &MemBuf, &Message)){
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

LLVMModuleRef codeGen(StoreArray* arr){
  ScopeStack stack = createVarTable();
  pushScope(&stack);
  LLVMModuleRef module = LLVMModuleCreateWithName("CalcLangLessonPlan");
  LLVMContextRef ctx = LLVMGetGlobalContext();
  LLVMBuilderRef builder = LLVMCreateBuilderInContext(ctx);
  loadCalcLangLinkerFile(module, ctx, builder);
  
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  
  //Define main method
  LLVMTypeRef intType = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef charPtrType = LLVMPointerType(LLVMInt8TypeInContext(ctx), 0);
  LLVMTypeRef mainParamTypes[] = {intType, LLVMPointerType(charPtrType, 0)};
  LLVMTypeRef mainFunctionType = LLVMFunctionType(intType, mainParamTypes, 2, 0); // 2 parameters, not variadic
  LLVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);
  LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(ctx, mainFunction, "entry");
  LLVMPositionBuilderAtEnd(builder, entryBlock);
  
  for(int i = 0; i < arr->length; i++){
    AstNode* node = arr->firstElem[i];
    char* str = astToString(node);
    printStringRef(str, builder, module, ctx);
    free(str);
    getInputRef(builder, module, ctx);
    codeGenNode(node, stack, builder, mainFunction, calcLangPtrType, ctx, module);
    getInputRef(builder, module, ctx);
  }

  LLVMValueRef zero = LLVMConstInt(intType, 0, 0); // Create an integer constant 0
  LLVMBuildRet(builder, zero); // Build the return instruction

  popScope(&stack);
  freeVarTable(stack);
  LLVMDisposeBuilder(builder);
  return module;
}

LLVMTypeRef createFunctionPointerType(LLVMContextRef ctx, int numArgs, int isVoid){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);

  LLVMTypeRef paramTypes[numArgs];
  for(int i = 0; i < numArgs; i++){
    paramTypes[i] = calcLangPtrType;
  }

  if(!isVoid){
    return LLVMFunctionType(calcLangPtrType, paramTypes, numArgs, 0);
  } else {
    return LLVMFunctionType(LLVMVoidTypeInContext(ctx), paramTypes, numArgs, 0);
  }
}

void printValueRef(LLVMValueRef refToPrint, ScopeStack stack, LLVMBuilderRef builder, LLVMTypeRef ptr, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "printValue");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 1, 1);
  LLVMValueRef args[] = { refToPrint };
  LLVMBuildCall2(builder, myFuncType, myFunc, args, 1, "");
}

LLVMValueRef codeGenEqualsOperation(EqualOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "equalsCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOrEqualsOperation(LessThenOrEqualsOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "lessThenOrEqualsCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOrEqualsOperation(GreaterThenOrEqualsOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "greaterThenOrEqualsCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOperation(LessThenOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "lessThenCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOperation(GreaterThenOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "greaterThenCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenAdditionOperation(AdditionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "addCalcLangValues");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 2, "");
}

LLVMValueRef codeGenSubtractionOperation(SubtractionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "subCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenMultiplicationOperation(MultiplicationOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "multCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenDotProductOperation(DotProductOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "dorProductVals");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenDivisionOperation(DivisionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "divCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenPowerOperation(PowerOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "powCalcLangValues");
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, 2, 0);
  LLVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenIntegerValue(IntNumberAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  int myInt = atoi(val->lexeme);
  LLVMValueRef myIntRef = LLVMConstInt(int32Type, myInt, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "integerCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    int32Type
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 1, 0);
  #ifdef DEBUG
  LLVMDumpType(funcType);
  #endif
  LLVMValueRef args[] = { myIntRef };
  LLVMValueRef result = LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
  return result;
}

LLVMValueRef codeGenRealValue(RealNumberAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  double dVal = atof(val->lexeme);
  LLVMValueRef myReal = LLVMConstReal(floatType, dVal);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "realCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 1, 0);
  LLVMValueRef args[] = { myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
}

LLVMValueRef codeGenBooleanValue(BooleanAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMValueRef myInt;
  if(strcmp(val->lexeme, "TRUE") == 0){
    myInt = LLVMConstInt(int32Type, 1, 0);
  } else {
    myInt = LLVMConstInt(int32Type, 0, 0);
  }
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "booleanCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    int32Type
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 1, 0);
  LLVMValueRef args[] = { myInt };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
}

LLVMValueRef codeGenSetValue(SetAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrToPtrType = LLVMPointerType(calcLangPtrType, 0);
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef arrayType = LLVMArrayType(calcLangPtrType, val->arr->length);
  LLVMValueRef pointToArray = LLVMBuildAlloca(builder, arrayType, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {oneIndex};
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, calcLangPtrToPtrType, pointToArray, indices, 1, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "setCalcLangValue");
  LLVMTypeRef paramTypes[] = {
    calcLangPtrToPtrType,
    int32Type
  };
  LLVMTypeRef myFuncType = LLVMFunctionType(calcLangPtrType, paramTypes, 2, 0);
  LLVMValueRef args[] = { pointToArray, length };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}

LLVMValueRef codeGenTupleValue(TupleAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef calcLangPtrToPtrType = LLVMPointerType(calcLangPtrType, 0);
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef arrayType = LLVMArrayType(calcLangPtrType, val->arr->length);
  LLVMValueRef pointToArray = LLVMBuildAlloca(builder, arrayType, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {oneIndex};
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, calcLangPtrToPtrType, pointToArray, indices, 1, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "tupleCalcLangValue");
  LLVMTypeRef paramTypes[] = {
    calcLangPtrToPtrType,
    int32Type
  };
  LLVMTypeRef myFuncType = LLVMFunctionType(calcLangPtrType, paramTypes, 2, 0);
  LLVMValueRef args[] = { pointToArray, length };
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, 2, "");
}


LLVMValueRef codeGenIdentifierValue(IdentAst* ident, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
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

LLVMValueRef codeGenDollarValue(DollarAst* dollar, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(dollar->lexeme));
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "dollarCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 1, 0);
  LLVMValueRef args[] = { myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
}

LLVMValueRef codeGenPercentValue(PercentAst* percent, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(percent->lexeme));
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, "percentCalcLangValue");
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(calcLangValueType, 0);
  LLVMTypeRef params[] = {
    floatType
  };
  LLVMTypeRef funcType = LLVMFunctionType(calcLangPtrType, params, 1, 0);
  LLVMValueRef args[] = { myReal };
  return LLVMBuildCall2(builder, funcType, myFunc, args, 1, "");
}

LLVMValueRef codeGenFunctionCall(FunctionCall* call, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  char funcName[2];
  funcName[0] = call->name;
  funcName[1] = '\0';
  LLVMValueRef myFunc = LLVMGetNamedFunction(mod, funcName);
  StoreArray* array = call->params;
  LLVMTypeRef myFuncType = createFunctionPointerType(ctx, array->length, 0);
  LLVMValueRef args[array->length];
  for(int i = 0; i < array->length; i++){
    args[i] = codeGenExpression(array->firstElem[i], stack, builder, parentFunc, mod, ctx);
  }
  return LLVMBuildCall2(builder, myFuncType, myFunc, args, array->length, "");
}

LLVMValueRef codeGenNegateOperation(NegateOperation* negate, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef ref = codeGenExpression(negate->expr, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "negateCalcLangValue");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 1, 0);
  LLVMValueRef args[] = { ref };
  return LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

LLVMValueRef codeGenNotOperation(NotOperation* not, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef ref = codeGenExpression(not->expr, stack, builder, parentFunc, mod, ctx);
  LLVMValueRef func = LLVMGetNamedFunction(mod, "notCalcLangValue");
  LLVMTypeRef funcType = createFunctionPointerType(ctx, 1, 0);
  LLVMValueRef args[] = { ref };
  return LLVMBuildCall2(builder, funcType, func, args, 1, "");
}

LLVMValueRef toBoolVal(LLVMValueRef ref, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef host, LLVMModuleRef mod, LLVMContextRef ctx){
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

LLVMValueRef codeGenIfExpression(IfExpr* ifStat, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef func, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMValueRef condVal = codeGenExpression(ifStat->cond, stack, builder, func, mod, ctx);
  LLVMValueRef boolVal = toBoolVal(condVal, stack, builder, func, mod, ctx);
  LLVMBasicBlockRef thenBlock = LLVMAppendBasicBlock(func, "");
  LLVMBasicBlockRef elseBlock = LLVMAppendBasicBlock(func, "");
  LLVMBasicBlockRef mergeBlock = LLVMAppendBasicBlock(func, "");
  
  LLVMBuildCondBr(builder, boolVal, thenBlock, elseBlock);

  LLVMPositionBuilderAtEnd(builder, thenBlock);
  LLVMValueRef thenResult = codeGenExpression(ifStat->ifTrue, stack, builder, func, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);

  LLVMPositionBuilderAtEnd(builder, elseBlock);
  LLVMValueRef elseResult = codeGenExpression(ifStat->ifFalse, stack, builder, func, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);

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


LLVMValueRef codeGenExpression(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef func, LLVMModuleRef mod, LLVMContextRef ctx){
  #ifdef DEBUG
  printf("\nNodeType: %d\n", node->nodeType);
  fflush(stdout);
  #endif
  switch(node->nodeType){
  case EQUAL_OPERATION: return codeGenEqualsOperation(&(node->actualNodeData.equalOperation), stack, builder, func, mod, ctx);
  case LESS_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.lessOrEqual), stack, builder, func, mod, ctx);
  case GREATER_THEN_OR_EQUALS_OPERATION: return codeGenGreaterThenOrEqualsOperation(&(node->actualNodeData.greaterOrEqual), stack, builder, func, mod, ctx);
  case LESS_THEN_OPERATION: return codeGenLessThenOperation(&(node->actualNodeData.lessThen), stack, builder, func, mod, ctx);
  case GREATER_THEN_OPERATION: return codeGenGreaterThenOperation(&(node->actualNodeData.greaterThen), stack, builder, func, mod, ctx);
  case ADDITION_OPERATION: return codeGenAdditionOperation(&(node->actualNodeData.addition), stack, builder, func, mod, ctx);
  case SUBTRACTION_OPERATION: return codeGenSubtractionOperation(&(node->actualNodeData.subtraction), stack, builder, func, mod, ctx);
  case MULTIPLICATON_OPERATION: return codeGenMultiplicationOperation(&(node->actualNodeData.multiplication), stack, builder, func, mod, ctx);
  case DOT_PRODUCT_OPERATION: return codeGenDotProductOperation(&(node->actualNodeData.dotProduct), stack, builder, func, mod, ctx);
  case DIVISION_OPERATION: return codeGenDivisionOperation(&(node->actualNodeData.division), stack, builder, func, mod, ctx);
  case POWER_OPERATION: return codeGenPowerOperation(&(node->actualNodeData.power), stack, builder, func, mod, ctx);
  case INT_AST: return codeGenIntegerValue(&(node->actualNodeData.integer), stack, builder, func, mod, ctx);
  case REAL_AST: return codeGenRealValue(&(node->actualNodeData.real), stack, builder, func, mod, ctx);
  case BOOL_AST: return codeGenBooleanValue(&(node->actualNodeData.bool), stack, builder, func, mod, ctx);
  case SET_AST: return codeGenSetValue(&(node->actualNodeData.set), stack, builder, func, mod, ctx);
  case TUPLE_AST: return codeGenTupleValue(&(node->actualNodeData.tuple), stack, builder, func, mod, ctx);
  case IDENT_AST: return codeGenIdentifierValue(&(node->actualNodeData.ident), stack, builder, func, mod, ctx);
  case DOLLAR_AST: return codeGenDollarValue(&(node->actualNodeData.dollar), stack, builder, func, mod, ctx);
  case PERCENT_AST: return codeGenPercentValue(&(node->actualNodeData.percent), stack, builder, func, mod, ctx);
  case FUNCTION_CALL: return codeGenFunctionCall(&(node->actualNodeData.call), stack, builder, func, mod, ctx);
  case NEGATE_OPERATION: return codeGenNegateOperation(&(node->actualNodeData.negate), stack, builder, func, mod, ctx);
  case NOT_OPERATION: return codeGenNotOperation(&(node->actualNodeData.not), stack, builder, func, mod, ctx);
  case IF_EXPR: return codeGenIfExpression(&(node->actualNodeData.ifStatement), stack, builder, func, mod, ctx);
  case PAREN_EXPR: return codeGenExpression(node->actualNodeData.par.expr, stack, builder, func, mod, ctx);
  default:
    perror("Invalid Expression type found!!!");
    return NULL;
  }
}

void codeGenNode(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMTypeRef calcLangPtr, LLVMContextRef ctx, LLVMModuleRef mod){
  switch(node->nodeType){
  case EQUAL_OPERATION: {
    LLVMValueRef resultEq = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultEq, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case LESS_THEN_OR_EQUALS_OPERATION: {
    LLVMValueRef resultLE = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultLE, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case GREATER_THEN_OR_EQUALS_OPERATION: {
    LLVMValueRef resultGE = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultGE, stack, builder, calcLangPtr, mod, ctx);
  }
  case LESS_THEN_OPERATION: {
    LLVMValueRef resultLT = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultLT, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case GREATER_THEN_OPERATION: {
    LLVMValueRef resultGT = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultGT, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case ADDITION_OPERATION: {
    LLVMValueRef resultAdd = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultAdd, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case SUBTRACTION_OPERATION: {
    LLVMValueRef resultSub = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultSub, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case MULTIPLICATON_OPERATION: {
    LLVMValueRef resultMult = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultMult, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case DOT_PRODUCT_OPERATION: {
    LLVMValueRef dotProductOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(dotProductOp, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case DIVISION_OPERATION: {
    LLVMValueRef divisionOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(divisionOp, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case POWER_OPERATION: {
    LLVMValueRef powerOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(powerOp, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case INT_AST: {
    LLVMValueRef intVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(intVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case REAL_AST: {
    LLVMValueRef realVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(realVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case BOOL_AST: {
    LLVMValueRef boolVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(boolVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case SET_AST: {
    LLVMValueRef setVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(setVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case TUPLE_AST: {
    LLVMValueRef tupleVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(tupleVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case IDENT_AST: {
    LLVMValueRef identVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(identVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case DOLLAR_AST: {
    LLVMValueRef dollarVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(dollarVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case PERCENT_AST: {
    LLVMValueRef percVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(percVal, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case FUNCTION_CALL: {
    LLVMValueRef ref = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(ref, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case NEGATE_OPERATION: {
    LLVMValueRef negateOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(negateOp, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case NOT_OPERATION: {
    LLVMValueRef notOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(notOp, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case FUNCTION_DEFINITION: {
    FunctionDef* myNode = &(node->actualNodeData.function);
    LLVMBasicBlockRef toResume = LLVMGetInsertBlock(builder);
    pushScope(&stack);
    char name = myNode->name;
    StoreArray* ptr = myNode->param;
    int size = ptr->length;
    LLVMTypeRef myType = LLVMGetTypeByName(mod, "struct.CalcLangVal");
    LLVMTypeRef point = LLVMPointerType(myType, 0);
    LLVMTypeRef paramTypes[size];
    for(int i = 0; i < size; i++){
      paramTypes[i] = point;
    }
    LLVMTypeRef funcType = LLVMFunctionType(point, paramTypes, size, 0);
    char myName[2];
    myName[0] = name;
    myName[1] = '\0';
    LLVMValueRef func = LLVMAddFunction(mod, myName, funcType);
    for(int i = 0; i < size; i++){
      char name = genParamName(ptr->firstElem[i]);
      LLVMValueRef arg1 = LLVMGetParam(func, i);
      addElemToVarTable(&stack, name, arg1);
    }
    pushScope(&stack);
    LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(ctx, func, "entry");
    LLVMPositionBuilderAtEnd(builder, entryBlock);
    LLVMValueRef result = codeGenExpression(myNode->expr, stack, builder, func, mod, ctx);
    LLVMBuildRet(builder, result);
    
    popScope(&stack);
    popScope(&stack);
    
    LLVMPositionBuilderAtEnd(builder, toResume);
    break;
  }
  case ASSIGN: {
    LLVMValueRef valueToAssign = codeGenExpression(node->actualNodeData.variable.expr, stack, builder, parentFunc, mod, ctx);
    LLVMTypeRef myType = LLVMGetTypeByName2(ctx, "struct.CalcLangVal");
    LLVMTypeRef point = LLVMPointerType(myType, 0);
    LLVMValueRef ptrToX = LLVMBuildAlloca(builder, point, "");
    char name = node->actualNodeData.variable.name;
    LLVMBuildStore(builder, valueToAssign, ptrToX);
    addElemToVarTable(&stack, name, ptrToX);
    break;
  }
  case IF_EXPR: {
    LLVMValueRef resIf = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resIf, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  case PAREN_EXPR: {
    LLVMValueRef resPar = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resPar, stack, builder, calcLangPtr, mod, ctx);
    break;
  }
  default:
    perror("Unexpected type when generating CalcLang");
    break;
  }
}
  
