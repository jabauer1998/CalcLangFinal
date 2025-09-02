#include "CalcLangIrGen.h"
#include "CalcLangAstC.h"
#include "FuncAppLinkedList.h"
#include <llvm-c/Core.h>
#include <stdlib.h>

CalcLangValueRef* createNewIntRef(LLVMValueRef ref){
  TypeInfo* type = malloc(sizeof(TypeInfo));
  type->infoType = IS_SINGLE;
  type->info.single = INTEGER;
  CalcLangValueRef* toRet = malloc(sizeof(CalcLangValueRef));
  toRet->info = type;
  toRet->ref = ref;
  return toRet;
}

CalcLangValueRef* createNewBoolRef(LLVMValueRef ref){
  TypeInfo* type = malloc(sizeof(TypeInfo));
  type->infoType = IS_SINGLE;
  type->info.single = BOOLEAN;
  CalcLangValueRef* toRet = malloc(sizeof(CalcLangValueRef));
  toRet->info = type;
  toRet->ref = ref;
  return toRet;
}

CalcLangValueRef* createNewRealRef(LLVMValueRef ref){
  TypeInfo* type = malloc(sizeof(TypeInfo));
  type->infoType = IS_SINGLE;
  type->info.single = REAL;
  CalcLangValueRef* toRet = malloc(sizeof(CalcLangValueRef));
  toRet->info = type;
  toRet->ref = ref;
  return toRet;
}

CalcLangValue* createNewDollarRef(LLVMValueRef ref){
  TypeInfo* type = malloc(sizeof(TypeInfo));
  type->infoType = IS_SINGLE;
  type->info.single = DOLLAR;
  CalcLangValueRef* toRet = malloc(sizeof(CalcLangValueRef));
  toRet->info = type;
  toRet->ref = ref;
  return toRet;
}

CalcLangValue* createNewPercentRef(LLVMValueRef ref){
  TypeInfo* type = malloc(sizeof(TypeInfo));
  type->infoType = IS_SINGLE;
  type->info.single = PERCENT;
  CalcLangValueRef* toRet = malloc(sizeof(CalcLangValueRef));
  toRet->info = type;
  toRet->ref = ref;
  return toRet;
}

CalcLangValueRef* codeGenEqualOperation(LLVMContextRef ctx, LLVMBuilderRef build, EqualOperation* node){
  CalcLangValRef* left = codeGenExpression(node->left);
  CalcLangValRef* right = codeGenExpression(node->right);
  if(left->info.infoType == IS_SINGLE && right->info.infoType == IS_SINGLE){
    SingleType typeLeft = left->info.single;
    SingleType typeRight = right->info.single;
    if(typeLeft == INTEGER && typeRight == INTEGER){
       LLVMValueRef ret = LLVMBuildICmp(build, LLVMIntEQ, left->ref, right->ref, "");
       freeValRef(left);
       freeValRef(right);
       return createNewIntRef(ret);
    } else if(typeLeft == REAL && typeRight == REAL){
      LLVMValueRef ret = LLVMBuildFCmp(build, LLVMRealPredicateOEQ, left->ref, right->ref, "");
      freeValRef(left);
      freeValRef(right);
      return createNewRealRef(ret);
    } else if(typeleft == INTEGER && typeRight == REAL){
      LLVMValueRef actualL = LLVMBuildSIToFP(builder, left->ref, LLVMFloatTypeInContext(context), "");
      LLVMValueRef ret = LLVMBuildFCmp(build, LLVMRealPredicateOEQ, actualL, right->ref, "");
      freeValRef(left);
      freeValRef(right);
      return createNewRealRef(ret);
    } else if(typeLeft == REAL && typeRight == INTEGER){
      LLVMValueRef actualR = LLVMBuildSIToFP(builder, right->ref, LLVMFloatTypeInContext(ctx), "");
      LLVMValueRef ret = LLVMBuildFCmp(build, LLVMRealPredicateOEQ, left->ref, actualR, "");
      freeValRef(left);
      freeValRef(right);
      return createNewRealRef(ret);
    } else if(typeLeft == DOLLAR && typeRight == DOLLAR){
      LLVMValueRef ret = LLVMBuildFCmp(build, LLVMRealPredicateOEQ, left->ref, right->ref, "");
      freeValRef(left);
      freeValRef(right);
      return createNewDollarRef(ret);
    } else if(typeLeft == PERCENT && typeRight == PERCENT){
      LLVMValueRef ret = LLVMBuildFCmp(build, LLVMRealPredicateOEQ, left->ref, right->ref, "");
      freeValRef(left);
      freeValRef(right);
      return createNewPercentRef(ret);
    } else if(typeLeft == BOOLEAN && typeRight == BOOLEAN){
      LLVMValueRef ret = LLVMBuildICmp(build, LLVMIntEQ, left->ref, right->ref, "");
      freeValRef(left);
      freeValRef(right);
      return createNewBoolRef(ret);
    } else {
      return NULL;
      perror("Unknown type for SINGLE llvm specification!!!");
    }
  } else if(left->info.infoType == IS_TUPLE && right->info.infoType == IS_TUPLE){
    
  } else if(left->info.infoType == IS_SET && right->info.infoType == IS_SET){
    
  } else {
    perror("Error invalid infoType found!!!");
  }
}


CalcLangValueRef* codeGenExpression(LLVMContextRef ctx, LLVMBuilderRef build, AstNode* node){
  switch(node->nodeType){
  case EQUAL_OPERATION: return codeGenEqualOperation(ctx, build, &(node->actualNodeData.equalOperation));
  case LESS_THEN_OR_EQUALS_OPERATION: return codeGenLessOrEqualsOperation(ctx, build, &(node->actualNodeData.lessOrEqual));
  case GREATER_THEN_OR_EQUALS_OPERATION: return codeGenGreaterThenOrEqualsOpertion(&(node->actualNodeData.greaterOrEqual));
  case LESS_THEN_OPERATION: return codeGenLessOperation(ctx, build, &(node->actualNodeData.lessThen));
  case GREATER_THEN_OPERATION: return codeGenGreaterOperation(ctx, build, &(node->actualNodeData.greaterThen));
  case ADDITION_OPERATION: return codeGenAdditionOperation(ctx, build, &(node->actualNodeData.addition));
  case SUBTRACTION_OPERATION: return codeGenSubtractionOperation(ctx, build, &(node->actualNodeData.subtraction));
  case MULTIPLICATION_OPERATION: return codeGenMultiplicationOperation(ctx, build, &(node->actualNodeData.multiplication));
  case DOT_PRODUCT_OPERATION: return codeGenDotProductOperation(ctx, build, &(node->actualNodeData.dotProduct));
  case DIVISION_OPERATION: return codeGenDivisionOperation(ctx, build, &(node->actualNodeData.division));
  case POWER_OPERATION: return codeGenPowerOperation(ctx, build, &(node->actualNodeData.power));
  case INT_AST: return codeGenIntExpression(ctx, build, &(node->actualNodeData.integer));
  case REAL_AST: return codeGenRealExpression(ctx, build, &(node->actualNodeData.real));
  case BOOL_AST: return codeGenBoolExpression(ctx, build, &(node->actualNodeData.bool));
  case SET_AST: return codeGenSetExpression(ctx, build, &(node->actualNodeData.set));
  case TUPLE_AST: return codeGenTupleExpression(ctx, build, &(node->actualNodeData.tuple));
  case IDENT_AST: return codeGenIdentExpression(ctx, build, &(node->actualNodeData.ident));
  case DOLLAR_AST: return codeGenDollarExpression(ctx, build, &(node->actualNodeData.dollar));
  case PERCENT_AST: return codeGenPercentExpression(ctx, build, &(node->actualNodeData.percent));
  case FUNCTION_CALL: return codeGenFunctionCall(ctx, build, &(node->actualNodeData.call));
  case NEGATE_OPERATION: return codeGenNegateOperaation(ctx, build, &(node->actualNodeData.negate));
  case NOT_OPERATION: return codeGenNotOperation(ctx, build, &(node->actualNodeData.not));
  case PAREN_EXPR: return codeGenParenExpression(ctx, build, &(node->actualNodeData.par));
  default: perror("Error invalid expression type found when traversing ast node!!!");
  }
}

void printValueRef(LLVMValueRef val, LLVMValueRef func, LLVMBuilderRef build, LLVMContextRef ctx){
  LLVMTypeRef type = LLVMTypeOf(val);
  LLVMTypeKind typeKind = LLVMGetTypeKind(type);

  LLVMValueRef printf_args[] = NULL;

  switch (typeKind){
  case LLVMIntegerTypeKind:
    printf_args = {"%d\n", val}
    break;
  case LLVMDoubleTypeKind:
    printf_args = {"%f\n", val}
  default:
    LLVMDumpValue(val);
  }
  LLVMBuildCall(build, func, printf_args, 2, "call_printf");
}

void genPrintFFunction(LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef i32_type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef byteType = LLVMInt8TypeInContext(ctx);
  LLVMTypeRef i8_ptr_type = LLVMPointerType(byteType, 0);
  LLVMTypeRef printf_arg_types[] = {i8_ptr_type};
  LLVMTypeRef printf_func_type = LLVMFunctionType(i32_type, printf_arg_types, 1, true); // 1 arg, variadic
  LLVMAddFunction(module, "printf", printf_func_type);
}

void printValueFunction(LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef i32_type = LLVMInt32TypeInContext(ctx);
  LLVMTypeRef i8_type = LLVMInt8Type();
  LLVMTypeRef f64_type = LLVMDoubleType(); 
  LLVMTypeRef dataType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef dataPtrType = LLVMPointerType(dataType, 0);
  LLVMTypeRef printValueArgType[] = {dataPtrType};
  LLVMTypeRef printValueFuncType = LLVMFunctionType(i32_type, printValueArgType, 1, false); // 1 arg, variadic
  LLVMValueRef func = LLVMAddFunction(module, "printValue", printValueFuncType);
  LLVMBasicBlockRef entry_block = LLVMAppendBasicBlockInContext(ctx, func, "entry");
  LLVMValueRef printFunc = LLVMGetNamedFunction(module, "printf");
  
  LLVMBasicBlockRef intBlock = LLVMAppendBasicBlockInContext(ctx, func, "printIntBranch");
  LLVMBasicBlockRef afterIntBlock = LLVMAppendBasicBlockInContext(ctx, func, "realEntry"); 
  LLVMBasicBlockRef realBlock = LLVMAppendBasicBlockInContext(ctx, func, "printRealBranch");
  LLVMBasicBlockRef afterRealBlock = LLVMAppendBasicBlockInContext(ctx, func, "dollarEntry");
  LLVMBasicBlockRef dollarBlock = LLVMAppendBasicBlockInContext(ctx, func, "printDollarBranch");
  LLVMBasicBlockRef afterDollarBlock = LLVMAppendBasicBlockInContext(ctx, func, "percentEntry");
  LLVMBasicBlockRef percentBlock = LLVMAppendBasicBlockInContext(ctx, func, "printPercentBranch");
  LLVMBasicBlockRef afterPercentBlock = LLVMAppendBasicBlockInContext(ctx, func, "tupleEntry");
  LLVMBasicBlockRef tupleBlock = LLVMAppendBasicBlockInContext(ctx, func, "printTupleBranch");
  LLVMBasicBlockRef afterTuple = LLVMAppendBasicBlockInContext(ctx, func, "setEntry");
  LLVMBasicBlockRef setBlock = LLVMAppendBasicBlockInContext(ctx, func, "printSetBranch");
  LLVMBasicBlockRef endBlock = LLVMAppendBasicBlockInContext(ctx, func, "endBlock");

  LLVMPositionBuilderAtEnd(builder, entry_block);
  LLVMValueRef param = LLVMGetFirstParam(func);
  LLVMValueRef indices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(LLVMInt32Type(), 0, 0)}
  LLVMValueRef type = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, indices, 2, "typePtr");

  //If it is an integer
  LLVMValueRef isInt = LLVMBuildICmp(type, LLVMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_INT, false));
  LLVMBuildCondBr(builder, isInt, intBlock, afterIntBlock);

  LLVMPositionBuilderAtEnd(builder, intBlock);
  LLVMValueRef printIntIndices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)};
  LLVMValueRef printIntDataPtr = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, printIntIndices, 2, "");
  LLVMTypeRef printIntPointee = LLVMGetElementType(LLVMTypeOf(printIntDataPtr));
  LLVMValueRef printIntLoadedValue = LLVMBuildLoad2(builder, printIntPointee, printIntDataPtr, "");
  const char* str = "%d\n";
  LLVMValueRef printIntFormatString = LLVMConstString(str, strlen(str), 0);
  LVMValueRef printIntArgs[] = {printIntFormatString, printIntLoaded};
  LLVMBuildCall(builder, printFunc, printIntArgs, 2, "");
  LLVMBuildBr(builder, endBlock);
  
  LLVMPositionBuilderAtEnd(builder, afterIntBlock);
  LLVMValueRef isReal = LLVMBuildFCmp(type, LLMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_REAL, false));
  LLVMBuildCondBr(builder, isReal, realBlock, afterRealBlock);

  LLVMPositionBuilderAtEnd(builder, realBlock);
  LLVMValueRef printRealIndices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)};
  LLVMValueRef printRealDataPtr = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, printRealIndices, 2, "");
  LLVMValueRef castRealDataPtr = LLVMBuildBitCast(builder, printRealDataPtr, f64_type, "");
  LLVMTypeRef printRealPointee = LLVMGetElementType(LLVMTypeOf(castRealDataPtr));
  LLVMValueRef printRealLoadedValue = LLVMBuildLoad2(builder, printRealPointee, castRealDataPtr, "");
  const char* str = "%f\n";
  LLVMValueRef printRealFormatString = LLVMConstString(str, strlen(str), 0);
  LVMValueRef printRealArgs[] = {printRealFormatString, printRealLoadedValue};
  LLVMBuildCall(builder, printFunc, printRealArgs, 2, "");
  LLVMBuildBr(builder, endBlock);
  
  LLVMPositionBuilderAtEnd(builder, afterRealBlock);
  LLVMValueRef isDollar = LLVMBuildFCmp(type, LLMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_DOLLAR, false));
  LLVMBuildCondBr(builder, isDollar, dollarBlock, afterDollarBlock);

  LLVMPositionBuilderAtEnd(builder, dollarBlock);
  LLVMValueRef printDollarIndices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)};
  LLVMValueRef printDollarDataPtr = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, printDollarIndices, 2, "");
  LLVMValueRef castDollarDataPtr = LLVMBuildBitCast(builder, printDollarDataPtr, f64_type, "");
  LLVMTypeRef printDollarPointee = LLVMGetElementType(LLVMTypeOf(castDollarDataPtr));
  LLVMValueRef printDollarLoadedValue = LLVMBuildLoad2(builder, printDollarPointee, casDollarDataPtr, "");
  const char* str = "$%f\n";
  LLVMValueRef printDollarFormatString = LLVMConstString(str, strlen(str), 0);
  LVMValueRef printDollarArgs[] = {printDollarFormatString, printDollarLoadedValue};
  LLVMBuildCall(builder, printFunc, printDollarArgs, 2, "");
  LLVMBuildBr(builder, endBlock);

  LLVMPositionBuilderAtEnd(builder, afterDollarBlock);
  LLVMValueRef isPercent = LLVMBuildFCmp(type, LLMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_PERCENT, false));
  LLVMBuildCondBr(builder, isDollar, percentBlock, afterPercentBlock);

  LLVMPositionBuilderAtEnd(builder, percentBlock);
  LLVMValueRef printPercIndices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)};
  LLVMValueRef printPercentDataPtr = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, printPercIndices, 2, "");
  LLVMValueRef castPercentDataPtr = LLVMBuildBitCast(builder, printPercentDataPtr, f64_type, "");
  LLVMTypeRef printPercentPointee = LLVMGetElementType(LLVMTypeOf(castPercentDataPtr));
  LLVMValueRef printPercentLoadedValue = LLVMBuildLoad2(builder, printPercentPointee, castPercentDataPtr, "");
  const char* str = "%f\%\n";
  LLVMValueRef printPercentFormatString = LLVMConstString(str, strlen(str), 0);
  LVMValueRef printPercentArgs[] = {printPercentFormatString, printPercentLoadedValue};
  LLVMBuildCall(builder, printFunc, printPercentArgs, 2, "");
  LLVMBuildBr(builder, endBlock);

  LLVMPositionBuilderAtEnd(builder, afterPercentBlock);
  LLVMValueRef isTuple = LLVMBuildFCmp(type, LLMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_TUPLE, false));
  LLVMBuildCondBr(builder, isTuple, tupleBlock, afterTupleBlock);

  LLVMPositionBuilderAtEnd(builder, tupleBlock);
  //Print LPAR
  const char* lParStr = "(";
  LLVMValueRef printLParString = LLVMConstString(lParStr, strlen(lParStr), 0);
  LVMValueRef printLParArg[] = {printLParString};
  LLVMBuildCall(builder, printFunc, printLParArg, 1, "");
  LLVMValueRef outTupleIndices[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)};
  LLVMValueRef outTupleDataPtr = LLVMBuildGEP2(builder, LLVMTypeOf(param), param, outTupleIndices, 2, "");
  LLVMTypeRef dataType = LLVMGetTypeByName(mod, "TupleValue");
  LLVMTypeRef tupleDataPtrType = LLVMPointerType(dataType, 0);
  LLVMValueRef castTupleDataPtr = LLVMBuildBitCast(builder, outTupleDataPtr, tupleDataPtrType, "");
  LLVMValueRef innerTupleIndicesFirstElem[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 0, 0)}
  LLVMValueRef sizeOfTuple = LLVMBuildGEP2(builder, LLVMTypeOf(castTupleDataPtr), castTupleDataPtr, innerTupleIndicesFirstElem, 2, "");
  LLVMValueRef index = LLVMConstantInt(i32_type, 0, 0);

  LLVMBasicBlockRef tupleForLoopCond = LLVMAppendBasicBlockInContext(ctx, func, "forLoopCondition");
  LLVMBasicBlockRef tupleForLoopBody = LLVMAppendBasicBlockInContext(ctx, func, "forLoopBody");
  LLVMBasicBlockRef tupleForLoopEnd = LLVMAppendBasicBlockInContext(ctx, func, "endForLoop");
  LVMBuildBr(builder, tupleForLoopEnd);
  
  LLVMPositionBuilderAtEnd(builder, tupleForLoopCond);
  LLVMValueRef forLoopCmp = LLVMBuildICmp(index, LLVMIntLT, sizeOfTuple);
  LLVMBuildCondBr(builder, forLoopCmp, tupleForLoopBody, tupleForLoopEnd);
  
  LLVMPositionBuilderAtEnd(builder, tupleForLoopBody);
  LLVMValueRef innerTupleIndicesSecondElem[] = {LLVMConstInt(i32_type, 0, 0), LLVMConstInt(i32_type, 1, 0)}
  LLVMValueRef valPtr = LLVMBuildGEP2(builder, LLVMTypeOf(castTupleDataPtr), castTupleDataPtr, innerTupleIndicesSecondElem, 2, "");
  LLVMTypeRef pointType = LLVMPointerType(builder, valPtr, dataType, "");
  LLVMValueRef castValPtr = LLVMBuildBitCast(builder, valPtr, dataType, "");
  
  
  
  
  
  
  
  LLVMTypeRef printPercentPointee = LLVMGetElementType(LLVMTypeOf(castDollarDataPtr));
  LLVMValueRef printPercentLoadedValue = LLVMBuildLoad2(builder, printPercentPointee, castPercentDataPtr, "");
  const char* str = "%f\%\n";
  LLVMValueRef printPercentFormatString = LLVMConstString(str, strlen(str), 0);
  LVMValueRef printPercentArgs[] = {printPercentFormatString, printPercentLoadedValue};
  LLVMBuildCall(builder, printFunc, printPercentArgs, 2, "");

  const char* rParStr = ")";
  //Print RPAR
  LLVMValueRef printRParString = LLVMConstString(fParStr, strlen(lParStr), 0);
  LVMValueRef printRParArg[] = {printRParString};
  LLVMBuildCall(builder, printFunc, printRParArg, 1, "");
  LLVMBuildBr(builder, endBlock);

  LLVMPositionBuilderAtEnd(builder, afterTupleBlock);
  LLVMValueRef isSet = LLVMBuildFCmp(type, LLMIntEQ, LLVMConstInt(LLVMInt32Type(), IS_SET, false));
  LLVMBuildCondBr(builder, isSet, setBlock, endBlock);
}

void codeGenHelperFunctions(LLVMModuleRef mod, LLVMContextRef ctx, LLVMBuilderRef builder){
  //Define Print Functions for language
  genPrintFFunction(mod, ctx, builder);
  genPrintValueFunction(mod, ctx, builder);
}

void codeGenValueStruct(LLVMModuleRef mod, LLVMContextRef ctx, LLVMBuilderRef builder){
  LLVMTypeRef intType = LLVMInt32Type();
  LLVMTypeRef byteType = LLVMInt8TypeInContext(ctx);
  LLVMTypeRef pointType = LLVMArrayType(byteType, 8);
  LLVMTypeRef memberTypes[] = { intType, pointType };
  LLVMTypeRef structType = LLVMStructTypeInContext(ctx, memberTypes, 2, 0); // 1 element, not packed
  LLVMStructSetName(structType, "CalcLangValue");
  LLVMStructSetBody(structType, memberTypes, 2, 0);
}

void codeGenTupleValueStruct(LLVMModuleRef mod, LLVMContextRef ctx, LLVMBuilderRef builder){
  LLVMTypeRef sizeType = LLVMInt32Type();
  LLVMTypeRef valType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(valType, 0);
  LLVMTypeRef memberTypes[] = { intType, pointType };
  LLVMTypeRef structType = LLVMStructTypeInContext(ctx, memberTypes, 2, 0); // 1 element, not packed
  LLVMStructSetName(structType, "TupleValue");
  LLVMStructSetBody(structType, memberTypes, 2, 0);
}

void codeGenSetValueStruct(LLVMModuleRef mod, LLVMContextRef ctx, LLVMBuilderRef builder){
  LVMTypeRef sizeType = LLVMInt32Type();
  LLVMTypeRef valType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(valType, 0);
  LLVMTypeRef memberTypes[] = { intType, pointType };
  LLVMTypeRef structType = LLVMStructTypeInContext(ctx, memberTypes, 2, 0); // 1 element, not packed
  LLVMStructSetName(structType, "SetValue");
  LLVMStructSetBody(structType, memberTypes, 2, 0);
}

void codeGenHelperStructs(LLVMModuleRef mod, LLVMContextRef ctx, LLVMBuilderRef builder){
  //Structs for managing type info
  codeGenValueStruct(mod, ctx, builder);
  codeGenTupleValueStruct(mod, ctx, builder);
  codeGenSetValueStruct(mod, ctx, builder);
}

void codeGen(StoreArray* arr){
  LLVMModuleRef module = LLVMModuleCreateWithName("CalcLangLessonPlan");
  LLVMContextRef ctx = LLVMGetGLobalContext();
  LLVMBuilderRef builder = LLVMCreateBuilderInContext(ctx);
  codeGenHelperStructs(module, ctx, builder);
  codeGenHelperFunctions(module, ctx, builder);
}

void codeGen(AstNode* node){
  
  //Define main method
  LVMTypeRef int_type = LLVMInt32TypeInContext(LLVMGetGlobalContext());
  LLVMTypeRef char_ptr_type = LLVMPointerType(LLVMInt8TypeInContext(LLVMGetGlobalContext()), 0);
  LLVMTypeRef main_param_types[] = {int_type, LLVMPointerType(char_ptr_type, 0)};
  LLVMTypeRef main_function_type = LLVMFunctionType(int_type, main_param_types, 2, 0); // 2 parameters, not variadic
  LVMValueRef main_function = LLVMAddFunction(module, "main", main_function_type);
  LLVMBasicBlockRef entry_block = LLVMAppendBasicBlockInContext(LLVMGetGlobalContext(), main_function, "entry");
  
  LLVMPositionBuilderAtEnd(builder, entry_block);

  switch(node->nodeType){
  case EQUAL_OPERATION:
    CalcLangValueRef* resultEq = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultEq, printf_func, builder, LLVMGetGlobalContext());
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    CalcLangValueRef* resultLE = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultEq, printf_func, builder, LLVMGetGlobalContext());
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    CalcLangValueRef* resultGE = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultGE, printf_func, builder, LLVMGetGlobalContext());
  case LESS_THEN_OPERATION:
    CalcLangValueRef* resultLT = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultLT, printf_func, builder, LLVMGetGlobalContext());
    break;
  case GREATER_THEN_OPERATION:
    CalcLangValueRef* resultGT = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultGT, printf_func, builder, LLVMGetGlobalContext());
    break;
  case ADDITION_OPERATION:
    CalcLangValueRef* resultAdd = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultAdd, printf_func, builder, LLVMGetGlobalContext());
    break;
  case SUBTRACTION_OPERATION:
    CalcLangValueRef* resultSub = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultSub, printf_func, builder, LLVMGetGlobalContext());
    break;
  case MULTIPLCIATION_OPERATION:
    CalcLangValueRef* resultMult = codeGenExpression(LLVMGetGLobalContext(), builder, node);
    printValueRef(resultSub, printf_func, builder, LLVMGetGlobalContext());
    break;
  case DOT_PRODUCT_OPERATION:
    CalcLangValueRef* dotProductOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(dotProductOp, printf_func, builder, LLVMGetGLobalContext());
    break;
  case DIVISION_OPERATION:
    CalcLangValueRef* divisionOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(divisionOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case POWER_OPERATION:
    CalcLangValueRef* powerOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(powerOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case INT_AST:
    CalcLangValueRef* intVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(intVal, printf_func, builder, LLVMGetGLobalContext());
    break;
  case REAL_AST:
    CalcLangValueRef* realVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(realVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case BOOL_AST:
    CalcLangValueRef* boolVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(boolVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case SET_AST:
    CalcLangValueRef* setVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(setVal, printf_func, builder, LLVMGetGLobalContext());
    break;
  case TUPLE_AST:
    CalcLangValueRef* tupleVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(tupleVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case IDENT_AST:
    CalcLangValurRef* identVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case DOLLAR_AST:
    CalcLangValueRef* dollarVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case PERCENT_AST:
    CalcLangValueRef* dollarVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case FUNCTION_CALL:
    LLVMValueRef generatedFunction = codeGenFunction(LLVMGetGlobalContext(), builder, node);
    LLVMValueRef myFuncCall = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(myFuncCall, printf_func, builder, LLVMGetGlobalContext());
    break;
  case NEGATE_OPERATION:
    LLVMValueRef negateOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(negateOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case NOT_OPERATION:
    LLVMValueRef notOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(notOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case FUNCTION_DEFINITION:
    
    break;
  }

  LVMValueRef zero = LLVMConstInt(int_type, 0, 0); // Create an integer constant 0
  LLVMBuildRet(builder, zero); // Build the return instruction
  
  LLVMDisposeBuilder(builder);
  LLVMContextDispose(ctx);
}

