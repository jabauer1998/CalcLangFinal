#include "CalcLangIrGen.h"
#include "CalcLangAstC.h"
#include <llvm-c/Core.h>
#include <stdlib.h>
#include "ScopedVarDefTable.h"

void loadCalcLangLinkerFile(LLVMModuleRef module, LLVMContextRef ctx, LLVMBuilderRef builder){
    LLVMMemoryBufferRef MemBuf;
    char *Message;
    if (LLVMCreateMemoryBufferWithContentsOfFile("../ir/c/LinkToCalcLang,ll", &MemBuf, &Message)){
      perror(message);
    }
    LLVMModuleRef ExternalModule;
    if (LLVMParseIRInContext(ctx, MemBuf, &ExternalModule, &Message)) {
      perror(message);
    }
    // Link the external module into your current module
    if(LLVMLinkModules2(module, ExternalModule)) {
      perror("Linking module failed");
    }
}

void codeGen(StoreArray* arr){
  ScopeStack stack = createVarTable();
  pushScope(&stack);
  LLVMModuleRef module = LLVMModuleCreateWithName("CalcLangLessonPlan");
  LLVMContextRef ctx = LLVMGetGLobalContext();
  LLVMBuilderRef builder = LLVMCreateBuilderInContext(ctx);
  LLVMModuleRef helperModule = loadCalcLangLinkerFile(module, ctx, builder);
  LLVMTypeRef calcLangValueType = LLVMGetTypeByName(helperModule, "CalcLangValue");
  LLVMTypeRef calcLangPtrType = LLVMPointerType(CalcLangValueType, 0);
  
  //Define main method
  LVMTypeRef intType = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef charPtrType = LLVMPointerType(LLVMInt8TypeInContext(ctx), 0);
  LLVMTypeRef mainParamTypes[] = {int_type, LLVMPointerType(charPtrType, 0)};
  LLVMTypeRef mainFunctionType = LLVMFunctionType(intType, mainParamTypes, 2, 0); // 2 parameters, not variadic
  LVMValueRef mainFunction = LLVMAddFunction(module, "main", mainFunctionType);
  LLVMBasicBlockRef entryBlock = LLVMAppendBasicBlockInContext(ctx, mainFunction, "entry");
  LLVMPositionBuilderAtEnd(builder, entryBlock);
  
  for(int i = 0; i < arr->size; i++){
    AstNode* node = arr->data[i];
    codeGen(node, builder, mainFunction, calcLangPtrType, ctx, helper);
  }

  LVMValueRef zero = LLVMConstInt(int_type, 0, 0); // Create an integer constant 0
  LLVMBuildRet(builder, zero); // Build the return instruction

  popScope(&stack);
  freeVarTable(stack);
  LLVMDisposeBuilder(builder);
  LLVMContextDispose(ctx);
}

void printValueRef(LLVMValueRef refToPrint, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "printValue");
  LVMValueRef args[] = { refToPrint };
  LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenEqualsOperation(EqualOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "equalsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOrEqualsOperation(LessThenOrEqualsOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "lessThenOrEqualsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOrEqualsOperation(GreaterThenOrEqualsOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "greaterThenOrEqualsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOperation(LessThenOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "lessThenCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOperation(GreaterThenOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "greaterThenCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenAdditionOperation(AdditionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "addCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenSubtractionOperation(SubtractionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "subtractCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenMultiplicationOperation(MultiplicationOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "multiplyCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenDotProductOperation(DotProductOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "dorProductCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenDivisionOperation(DivisionOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "divideCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenPowerOperation(PowerOperation* op, ScopeStack stack, LLVMBuilderRef builder, LLMVValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "powerCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenIntegerValue(IntNumberAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMValueRef myInt = LLVMConstInt(int32Type, atoi(val->lexeme), 0);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "integerCalcLangValue");
  LVMValueRef args[] = { myInt };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenRealValue(RealNumberAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(val->lexeme));
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "realCalcLangValue");
  LVMValueRef args[] = { myReal };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenBooleanValue(BooleanAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMValueRef myInt;
  if(strcmp(val->lexeme, "TRUE") == 0){
    myInt = LLVMConstInt(int32Type, 1, 0);
  } else {
    myInt = LLVMConstInt(int32Type, 0, 0);
  }
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "booleanCalcLangValue");
  LVMValueRef args[] = { myInt };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenSetValue(SetAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(myType, 0);
  LLVMValueRef vals = LLVMBuildArrayAlloca(builder, pointType, val->arr->length, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, builder, mod, ctx);
    LLVMValueRef intoArray = LLVMConstInt(LLVMInt32TypeInContext(ctx), 0, 0);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {intoArray, oneIndex}
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, pointType, vals, indices, 2, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "setCalcLangValue");
  LVMValueRef args[] = { vals, length };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenTupleValue(SetAst* val, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(myType, 0);
  LLVMValueRef vals = LLVMBuildArrayAlloca(builder, pointType, val->arr->length, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, stack, builder, mod, ctx);
    LLVMValueRef intoArray = LLVMConstInt(LLVMInt32TypeInContext(ctx), 0, 0);
    LLVMValueRef oneIndex = LLVMConstInt(LLVMInt32TypeInContext(ctx), i, 0);
    LLVMValueRef indices[] = {intoArray, oneIndex}
    LLVMValueRef nextElementPtr = LLVMBuildGEP2(builder, pointType, vals, indices, 2, "");
    LLVMBuildStore(builder, refInArray, nextElementPtr);
  }
  

  LLVMValueRef length = LLVMConstInt(LLVMInt32TypeInContext(ctx), val->arr->length, 0);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "tupleCalcLangValue");
  LVMValueRef args[] = { vals, length };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}


LLVMValueRef codeGenIdentifierValue(IdentAst* ident, ScopeStack stack, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVmContextRef ctx){
  LLVMValueRef value = getElemFromVarTable(stack, ident->name);
  if(value == null){
    perror("Error value with name not found in symbol table");
    return NULL;
  }
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMValueRef res = LLVMBuildLoad2(builder, point, value, "");
  return res;
}

LLVMValueRef codeGenDollarValue(DollarAst* dollar, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVmContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(val->lexeme));
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "dollarCalcLangValue");
  LVMValueRef args[] = { myReal };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenPercentValue(PercentAst* dollar, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVmContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(val->lexeme));
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "percentCalcLangValue");
  LVMValueRef args[] = { myReal };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenFunctionCall(FunctionCall* call, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVmContextRef ctx){
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, call->name);
  StorageArray* array = call->params;
  LLVMValueRef args[array->length];
  for(int i = 0; i < array->length; i++){
    args[i] = codeGenExpression(array->firstElem[i], stack, builder, mod, ctx);
  }
  return LLVMBuildCall(builder, myFunc, args, array->length, "");
}

LLVMValueRef codeGenNegateOperation(NegateOperation* negate, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLMValueRef ref = codeGenExpression(negate->expr, stack, builder, mod, ctx);
  LLVMValueRef func = LLVMGetFunctionByName(mod, "negateCalcLangValue");
  LLVMValueRef args[] = { ref };
  return LLVMBuildCall(builder, func, args, 1, "");
}

LLVMValueRef codeGenNotOperation(NotOperation* not, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMModuleRef mod, LLVMContextRef ctx){
  LLMValueRef ref = codeGenExpression(not->expr, stack, builder, mod, ctx);
  LLVMValueRef func = LLVMGetFunctionByName(mod, "notCalcLangValue");
  LLVMValueRef args[] = { ref };
  return LLVMBuildCall(builder, func, args, 1, "");
}

LLVMValueRef codeGenIfExpression(IfExpr* if, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef func, LLVMModuleRef mod, LLVmContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef point = LLVMPointerType(myType, 0);
  LLVMValueRef condVal = codeGenExpression(if->cond, stack, builder, mod, ctx);
  LLVMBasicBlockRef thenBlock = LLVMAppendBasicBlock(func, "thenBlock");
  LLVMBasicBlockRef elseBlock = LLVMAppendBasicBlock(func, "elseBlock");
  LLVMBasicBlockRef mergeBlock = LLVMAppendBasicBlock(func, "mergeBlock");
  
  LLVMBuildCondBr(builder, condVal, thenBlock, elseBlock);

  LLVMPositionBuilderAtEnd(builder, thenBlock);
  LLVMValueRef thenResult = codeGenExpression(if->ifTrue, stack, builder, func, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);

  LLVMPositionBuilderAtEnd(builder, elseBlock);
  LLVMValueRef elseResult = codeGenExpression(if->ifFalse, stack, builder, func, mod, ctx);
  LLVMBuildBr(builder, mergeBlock);

  LLVMPositionBuilderAtEnd(builder, mergeBlock);
  LLVMValueRef phiNode = LLVMBuildPhi(builder, point, "");

  LLVMValueRef incomingValues[] = { thenResult, elseResult };
  LLVMBasicBlockRef incomingBlocks[] = { thenBlock, elseBlock };
  LLVMAddIncoming(phiNode, incomingValues, incomingBlocks, 2);
 
  return phiNode;
}

char* genParamName(AstNode* node){
  if(node->nodeType == IDENT_AST){
    return node->actualNodeData.identifier.name;
  } else {
    perror("Unexpected Ast Node for Paramter");
    return NULL;
  }
}


LLVMValueRef codeGenExpression(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef func, LLVMModuleRef mod, LLVMContextRef ctx){
  switch(node->nodeType){
  case EQUAL_OPERATION: return codeGenEqualsOperation(&(node->actualNodeData.equalOperation), stack, builder, func, mod, ctx);
  case LESS_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.lessThenOrEqual), stack, builder, func, mod, ctx);
  case GREATER_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.greaterOrEqual), stack, builder, func, mod, ctx);
  case LESS_THEN_OPERATION: return codeGenLessThenOperation(&(node->actualNodeData.lessThen), builder, stack, func, mod, ctx);
  case GREATER_THEN_OPERATION: return codeGenGreaterThenOperation(&(node->actualNodeData.greaterThen), stack, builder, func, mod, ctx);
  case ADDITION_OPERATION: return codeGenAdditionOperation(&(node->actualNodeData.addition), stack, builder, func, mod, ctx);
  case SUBTRACTION_OPERATION: return codeGenSubtractionOperation(&(node->actualNodeData.subtraction), stack, builder, func, mod, ctx);
  case MULTIPLICATION_OPERATION: return codeGenMultiplicationOperation(&(node->actualNodeData.multiplication), stack, builder, func, mod, ctx);
  case DOT_PRODUCT_OPERATION: return codeGenDotProductOperation(&(node->actualNodeData.dotProduct), stack, builder, func, mod, ctx);
  case DIVISION_OPERATION: return codeGenDivisionOperation(&(node->actualNodeData.divisionOperation), stack, builder, func, mod, ctx);
  case POWER_OPERATION: return codeGenPowerOperation(&(node->actualNodeData.powerOperation), stack, builder, func, mod, ctx);
  case INT_AST: return codeGenIntegerValue(&(node->actualNodeData.integer), stack, builder, func, mod, ctx);
  case REAL_AST: return codeGenRealValue(&(node->actualNodeData.real), stack, builder, func, mod, ctx);
  case BOOL_AST: return codeGenBooleanValue(&(node->actualNodeData.bool), stack, builder, func, mod, ctx);
  case SET_AST: return codeGenSetValue(&(node->actualNodeData.set), stack, builder, func, mod, ctx);
  case TUPLE_AST: return codeGenTupleValue(&(node->actualNodeData.tuple), stack, builder, func, mod, ctx);
  case IDENT_AST: return codeGenIdentifierValue(&(node->actualNodeData.identifier), stack, builder, func, mod, ctx);
  case DOLLAR_AST: return codeGenDollarValue(&(node->actualNodeData.dollar), stack, builder, func, mod, ctx);
  case PERCENT_AST: return codeGenPercentValue(&(node->actualNodeData.dollar), stack, builder, func, mod, ctx);
  case FUNCTION_CALL: return codeGenFunctionCall(&(node->actualNodeData.call), stack, builder, func, mod, ctx);
  case NEGATE_OPERATION: return codeGenNegateOperation(&(node->actualNodeData.negate), stack, builder, func, mod, ctx);
  case NOT_OPERATION: return codeGenNotOperation(&(node->actualNodeData.not), stack, builder, func, mod, ctx);
  case IF_EXPR: return codeGenIfExpression(&node->actualNodeData.ifStatement), stack, builder, func, mod, ctx);
  case PAREN_EXPR: return codeGenExpression(&(node->actualNodeData.par.expr), stack, builder, func, mod, ctx);
  default:
    perror("Invalid Expression type found!!!");
  }
}

void codeGen(AstNode* node, ScopeStack stack, LLVMBuilderRef builder, LLVMValueRef parentFunc, LLVMTypeRef calcLangPtr, LLVMContextRef ctx, LLVMModuleRef mod){
  switch(node->nodeType){
  case EQUAL_OPERATION:
    LLVMValueRef resultEq = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultEq, stack, builder, calcLangPtr, helper, ctx);
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultLE = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultLE, builder, calcLangPtr, helper, ctx);
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultGE = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultGE, builder, calcLangPtr, helper, ctx);
  case LESS_THEN_OPERATION:
    LLVMValueRef resultLT = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultLT, builder, calcLangPtr, helper, ctx);
    break;
  case GREATER_THEN_OPERATION:
    LLVMValueRef resultGT = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultGT, builder, calcLangPtr, helper, ctx);
    break;
  case ADDITION_OPERATION:
    LLVMValueRef resultAdd = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultAdd, builder, calcLangPtr, helper, ctx);
    break;
  case SUBTRACTION_OPERATION:
    LLVMValueRef resultSub = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultSub, builder, calcLangPtr, helper, ctx);
    break;
  case MULTIPLCIATION_OPERATION:
    LLVMValueRef resultMult = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(resultMult, builder, calcLangPtr, helper, ctx);
    break;
  case DOT_PRODUCT_OPERATION:
    LLVMValueRef dotProductOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(dotProductOp, builder, calcLangPtr, helper, ctx);
    break;
  case DIVISION_OPERATION:
    LLVMValueRef divisionOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(divisionOp, builder, calcLangPtr, helper, ctx);
    break;
  case POWER_OPERATION:
    LLVMValueRef powerOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(powerOp, builder, calcLangPtr, helper, ctx);
    break;
  case INT_AST:
    LLVMValueRef intVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(intVal, builder, calcLangPtr, helper, ctx);
    break;
  case REAL_AST:
    LLVMValueRef realVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(realVal, builder, calcLangPtr, helper, ctx);
    break;
  case BOOL_AST:
    LLVMValueRef boolVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(boolVal, builder, calcLangPtr, helper, ctx);
    break;
  case SET_AST:
    LLVMValueRef setVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(setVal, builder, calcLangPtr, helper, ctx);
    break;
  case TUPLE_AST:
    LLVMValueRef tupleVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(tupleVal, builder, calcLangPtr, helper, ctx);
    break;
  case IDENT_AST:
    LLVMValueRef identVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(identVal, builder, calcLangPtr, helper, ctx);
    break;
  case DOLLAR_AST:
    LLVMValueRef dollarVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(dollarVal, builder, calcLangPtr, helper, ctx);
    break;
  case PERCENT_AST:
    LLVMValueRef percVal = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(percVal, builder, calcLangPtr, helper, ctx);
    break;
  case FUNCTION_CALL:
    LLVMValueRef ref = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(ref, builder, calcLangPtr, helper, ctx);
    break;
  case NEGATE_OPERATION:
    LLVMValueRef negateOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(negateOp, builder, calcLangPtr, helper, ctx);
    break;
  case NOT_OPERATION:
    LLVMValueRef notOp = codeGenExpression(node, stack, builder, parentFunc, mod, ctx);
    printValueRef(notOp, builder, calcLangPtr, helper, ctx);
    break;
  case FUNCTION_DEFINITION:
    FunctionDef* myNode = &(node->actualNodeData.function);
    LLVMBasicBlockRef toResume = LLVMGetInsertBlock(builder);
    pushScope(&stack);
    char name = myNode->name;
    StoreArray* ptr = myNode->param;
    int size = ptr->length;
    LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
    LLVMTypeRef point = LLVMPointerType(myType, 0);
    LLVMTypeRef paramTypes[size];
    for(int i = 0; i < size; i++){
      paramTypes[i] = point;
    }
    LLVMTypeRef funcType = LLVMFunctionType(myType, paramTypes, size, false);
    LLVMValueRef func = LLVMAddFunction(module, name, funcType);
    for(int i = 0; i < size; i++){
      char* name = genParamName(ptr->firstElem[i]);
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
  case ASSIGN:
    LLVMValueRef valueToAssign = codeGenExpression(&(node->actualNodeData.assign.expr), stack, builder, parentFunc, mod, ctx);
    LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
    LLVMTypeRef point = LLVMPointerType(myType, 0);
    LLVMValueRef ptrToX = LLVMBuildAlloca(builder, point, "");
    LLVMBuildStore(builder, valueToAssign, ptrToX);
    addElemToVarTable(&stack, name, ptrToX);
    break;
  case IF_EXPR:
    LLVMValueRef resIf = codeGenExpression(&(node->actualNodeData.ifStatement), stack, builder, parentFunc, mod, ctx);
    printValueRef(resIf, builder, calcLangPtr, helper, ctx);
    break;
  case PAREN_EXPR:
    LLVmValueRef resPar = codeGenExpression(&(node->actualNodeData.par), stack, builder, parentFunc, mod, ctx);
    printValueRef(resPar, builder, calcLangPtr, helper, ctx);
    break;
  default:
    perror("Unexpected type when generating CalcLang");
    break;
  }
}

