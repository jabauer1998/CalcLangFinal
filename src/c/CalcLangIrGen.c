#include "CalcLangIrGen.h"
#include "CalcLangAstC.h"
#include "FuncAppLinkedList.h"
#include <llvm-c/Core.h>
#include <stdlib.h>

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
    codeGen(node, builder, calcLangPtrType, ctx, helper);
  }

  LVMValueRef zero = LLVMConstInt(int_type, 0, 0); // Create an integer constant 0
  LLVMBuildRet(builder, zero); // Build the return instruction
  
  LLVMDisposeBuilder(builder);
  LLVMContextDispose(ctx);
}

void printValueRef(LLVMValueRef refToPrint, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "printValue");
  LVMValueRef args[] = { refToPrint };
  LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenEqualsOperation(EqualOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "equalsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOrEqualsOperation(LessThenOrEqualsOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "lessThenOrEqualsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOrEqualsOperation(GreaterThenOrEqualsOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "greaterThenOrEqualsCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenLessThenOperation(LessThenOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "lessThenCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenGreaterThenOperation(GreaterThenOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "greaterThenCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenAdditionOperation(AdditionOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "addCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenSubtractionOperation(SubtractionOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "subtractCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenMultiplicationOperation(MultiplicationOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "multiplyCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenDotProductOperation(DotProductOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "dorProductCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenDivisionOperation(DivisionOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "divideCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenPowerOperation(PowerOperation* op, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMValueRef leftRef = codeGenExpression(op->left, builder, mod, ctx);
  LLVMValueRef rightRef = codeGenExpression(op->right, builder, mod, ctx);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "powerCalcLangValues");
  LVMValueRef args[] = { leftRef, rightRef };
  return LLVMBuildCall(builder, myFunc, args, 2, "");
}

LLVMValueRef codeGenIntegerValue(IntNumberAst* val, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef int32Type = LLVMInt32TypeInContext(ctx);
  LLVMValueRef myInt = LLVMConstInt(int32Type, atoi(val->lexeme), 0);
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "integerCalcLangValue");
  LVMValueRef args[] = { myInt };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenRealValue(RealNumberAst* val, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef floatType = LLVMFloatTypeInContext(ctx);
  LLVMValueRef myReal = LLVMConstReal(floatType, atof(val->lexeme));
  LLVMValueRef myFunc = LLVMGetFunctionByName(mod, "realCalcLangValue");
  LVMValueRef args[] = { myReal };
  return LLVMBuildCall(builder, myFunc, args, 1, "");
}

LLVMValueRef codeGenBooleanValue(BooleanAst* val, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
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

LLVMValueRef codeGenSetValue(SetAst* val, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(myType, 0);
  LLVMValueRef vals = LLVMBuildArrayAlloca(builder, pointType, val->arr->length, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, builder, mod, ctx);
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

LLVMValueRef codeGenTupleValue(SetAst* val, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  LLVMTypeRef myType = LLVMGetTypeByName(mod, "CalcLangValue");
  LLVMTypeRef pointType = LLVMPointerType(myType, 0);
  LLVMValueRef vals = LLVMBuildArrayAlloca(builder, pointType, val->arr->length, "");
  
  for(int i = 0; i < val->arr->length; i++){
    AstNode* node = val->arr->firstElem[i];
    LLVMValueRef refInArray = codeGenExpression(node, builder, mod, ctx);
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


LLVMValueRef findLocalValueByName(LLVMValueRef Fn, const char* name) {
    // Get the first basic block of the function
    LLVMBasicBlockRef BB = LLVMGetFirstBasicBlock(Fn);

    // Iterate through all basic blocks
    while (BB) {
        // Get the first instruction of the basic block
        LLVMValueRef Inst = LLVMGetFirstInstruction(BB);

        // Iterate through all instructions in the basic block
        while (Inst) {
            // Get the name of the current instruction
            const char* instName = LLVMGetValueName(Inst);
            if (instName && strcmp(instName, name) == 0) {
                return Inst; // Found the value, return it
            }
            // Move to the next instruction
            Inst = LLVMGetNextInstruction(Inst);
        }
        // Move to the next basic block
        BB = LLVMGetNextBasicBlock(BB);
    }
    return NULL; // Value not found
}


LLVMValueRef codeGenIdentifierValue(IdentAst* ident, LLVMBuilderRef builder, LLVMModuleRef mod, LLVmContextRef ctx){
  
}


LLVMValueRef codeGenExpression(AstNode* node, LLVMBuilderRef builder, LLVMModuleRef mod, LLVMContextRef ctx){
  switch(node->nodeType){
  case EQUAL_OPERATION: return codeGenEqualsOperation(&(node->actualNodeData.equalOperation), builder, mod, ctx);
  case LESS_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.lessThenOrEqual), builder, mod, ctx);
  case GREATER_THEN_OR_EQUALS_OPERATION: return codeGenLessThenOrEqualsOperation(&(node->actualNodeData.greaterOrEqual), builder, mod, ctx);
  case LESS_THEN_OPERATION: return codeGenLessThenOperation(&(node->actualNodeData.lessThen), builder, mod, ctx);
  case GREATER_THEN_OPERATION: return codeGenGreaterThenOperation(&(node->actualNodeData.greaterThen), builder, mod, ctx);
  case ADDITION_OPERATION: return codeGenAdditionOperation(&(node->actualNodeData.addition), builder, mod, ctx);
  case SUBTRACTION_OPERATION: return codeGenSubtractionOperation(&(node->actualNodeData.subtraction), builder, mod, ctx);
  case MULTIPLICATION_OPERATION: return codeGenMultiplicationOperation(&(node->actualNodeData.multiplication), builder, mod, ctx);
  case DOT_PRODUCT_OPERATION: return codeGenDotProductOperation(&(node->actualNodeData.dotProduct), builder, mod, ctx);
  case DIVISION_OPERATION: return codeGenDivisionOperation(&(node->actualNodeData.divisionOperation), builder, mod, ctx);
  case POWER_OPERATION: return codeGenPowerOperation(&(node->actualNodeData.powerOperation), builder, mod, ctx);
  case INT_AST: return codeGenIntegerValue(&(node->actualNodeData.integer), builder, mod, ctx);
  case REAL_AST: return codeGenRealValue(&(node->actualNodeData.real), builder, mod, ctx);
  case BOOL_AST: return codeGenBooleanValue(&(node->actualNodeData.bool), builder, mod, ctx);
  case SET_AST: return codeGenSetValue(&(node->actualNodeData.set), builder, mod, ctx);
  case TUPLE_AST: return codeGenTupleValue(&(node->actualNodeData.tuple), builder, mod, ctx);
  case IDENT_AST: return codeGenIdentifierValue(&(node->actualNodeData.identifier), builder, mod, ctx);
  }
}

void codeGen(AstNode* node, LLVMBuilderRef builder, LLVMTypeRef calcLangPtr, LLVMContextRef ctx, LLVMModuleRef mod){
  switch(node->nodeType){
  case EQUAL_OPERATION:
    LLVMValueRef resultEq = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultEq, builder, calcLangPtr, helper, ctx);
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultLE = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultLE, builder, calcLangPtr, helper, ctx);
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultGE = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultGE, builder, calcLangPtr, helper, ctx);
  case LESS_THEN_OPERATION:
    LLVMValueRef resultLT = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultLT, builder, calcLangPtr, helper, ctx);
    break;
  case GREATER_THEN_OPERATION:
    LLVMValueRef resultGT = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultGT, builder, calcLangPtr, helper, ctx);
    break;
  case ADDITION_OPERATION:
    LLVMValueRef resultAdd = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultAdd, builder, calcLangPtr, helper, ctx);
    break;
  case SUBTRACTION_OPERATION:
    LLVMValueRef resultSub = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultSub, builder, calcLangPtr, helper, ctx);
    break;
  case MULTIPLCIATION_OPERATION:
    LLVMValueRef resultMult = codeGenExpression(node, builder, mod, ctx);
    printValueRef(resultMult, builder, calcLangPtr, helper, ctx);
    break;
  case DOT_PRODUCT_OPERATION:
    LLVMValueRef dotProductOp = codeGenExpression(node, builder, mod, ctx);
    printValueRef(dotProductOp, builder, calcLangPtr, helper, ctx);
    break;
  case DIVISION_OPERATION:
    LLVMValueRef divisionOp = codeGenExpression(node, builder, mod, ctx);
    printValueRef(divisionOp, builder, calcLangPtr, helper, ctx);
    break;
  case POWER_OPERATION:
    LLVMValueRef powerOp = codeGenExpression(node, builder, mod, ctx);
    printValueRef(powerOp, builder, calcLangPtr, helper, ctx);
    break;
  case INT_AST:
    LLVMValueRef intVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(intVal, builder, calcLangPtr, helper, ctx);
    break;
  case REAL_AST:
    LLVMValueRef realVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(realVal, builder, calcLangPtr, helper, ctx);
    break;
  case BOOL_AST:
    LLVMValueRef boolVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(boolVal, builder, calcLangPtr, helper, ctx);
    break;
  case SET_AST:
    LLVMValueRef setVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(setVal, builder, calcLangPtr, helper, ctx);
    break;
  case TUPLE_AST:
    LLVMValueRef tupleVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(tupleVal, builder, calcLangPtr, helper, ctx);
    break;
  case IDENT_AST:
    LLVMValueRef identVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(identVal, builder, calcLangPtr, helper, ctx);
    break;
  case DOLLAR_AST:
    LLVMValueRef dollarVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(dollarVal, builder, calcLangPtr, helper, ctx);
    break;
  case PERCENT_AST:
    LLVMValueRef percVal = codeGenExpression(node, builder, mod, ctx);
    printValueRef(percVal, builder, calcLangPtr, helper, ctx);
    break;
  case FUNCTION_CALL:
    LLVMValueRef ref = codeGenExpression(node, builder, mod, ctx);
    printValueRef(ref, builder, calcLangPtr, helper, ctx);
    break;
  case NEGATE_OPERATION:
    LLVMValueRef negateOp = codeGenExpression(node, builder, mod, ctx);
    printValueRef(negateOp, builder, calcLangPtr, helper, ctx);
    break;
  case NOT_OPERATION:
    LLVMValueRef notOp = codeGenExpression(node, builder, mod, ctx);
    printValueRef(notOp, builder, calcLangPtr, helper, ctx);
    break;
  case FUNCTION_DEFINITION:
    
    break;
  }
}

