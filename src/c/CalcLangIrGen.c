#include "CalcLangIrGen.h"
#include "CalcLangAstC.h"
#include <llvm-c/Core.h>



LLVMValueRef codeGenExpression(LLVMContextRef ctx, LLVMBuilderRef build, AstNode* node){
  
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

void codeGen(AstNode* node){
  LLVMModuleRef module = LLVMModuleCreateWithName("CalcLangLessonPlan");

  //Define printf which is to use for the Expression Results
  LLVMTypeRef i32_type = LLVMInt32TypeInContext(LLVMGetGlobalContext());
  LLVMTypeRef i8_ptr_type = LLVMPointerType(LLVMInt8TypeInContext(LLVMGetGlobalContext()), 0);
  LLVMTypeRef printf_arg_types[] = {i8_ptr_type};
  LLVMTypeRef printf_func_type = LLVMFunctionType(i32_type, printf_arg_types, 1, true); // 1 arg, variadic
  LLVMValueRef printf_func = LLVMAddFunction(module, "printf", printf_func_type);

  //Define main method
  LVMTypeRef int_type = LLVMInt32TypeInContext(LLVMGetGlobalContext());
  LLVMTypeRef char_ptr_type = LLVMPointerType(LLVMInt8TypeInContext(LLVMGetGlobalContext()), 0);
  LLVMTypeRef main_param_types[] = {int_type, LLVMPointerType(char_ptr_type, 0)};
  LLVMTypeRef main_function_type = LLVMFunctionType(int_type, main_param_types, 2, 0); // 2 parameters, not variadic
  LVMValueRef main_function = LLVMAddFunction(module, "main", main_function_type);
  LLVMBasicBlockRef entry_block = LLVMAppendBasicBlockInContext(LLVMGetGlobalContext(), main_function, "entry");
  LLVMBuilderRef builder = LLVMCreateBuilderInContext(LLVMGetGlobalContext());
  LLVMPositionBuilderAtEnd(builder, entry_block);

  switch(node->nodeType){
  case EQUAL_OPERATION:
    LLVMValueRef resultEq = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultEq, printf_func, builder, LLVMGetGlobalContext());
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultLE = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultEq, printf_func, builder, LLVMGetGlobalContext());
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    LLVMValueRef resultGE = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultGE, printf_func, builder, LLVMGetGlobalContext());
  case LESS_THEN_OPERATION:
    LLVMValueRef resultLT = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultLT, printf_func, builder, LLVMGetGlobalContext());
    break;
  case GREATER_THEN_OPERATION:
    LLVMValueRef resultGT = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultGT, printf_func, builder, LLVMGetGlobalContext());
    break;
  case ADDITION_OPERATION:
    LLVMValueRef resultAdd = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultAdd, printf_func, builder, LLVMGetGlobalContext());
    break;
  case SUBTRACTION_OPERATION:
    LLVMVValueRef resultSub = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(resultSub, printf_func, builder, LLVMGetGlobalContext());
    break;
  case MULTIPLCIATION_OPERATION:
    LLVMValueRef resultMult = codeGenExpression(LLVMGetGLobalContext(), builder, node);
    printValueRef(resultSub, printf_func, builder, LLVMGetGlobalContext());
    break;
  case DOT_PRODUCT_OPERATION:
    LLVMValueRef dotProductOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(dotProductOp, printf_func, builder, LLVMGetGLobalContext());
    break;
  case DIVISION_OPERATION:
    LLVMValueRef divisionOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(divisionOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case POWER_OPERATION:
    LLVMValueRef powerOp = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(powerOp, printf_func, builder, LLVMGetGlobalContext());
    break;
  case INT_AST:
    LLVMValueRef intVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(intVal, printf_func, builder, LLVMGetGLobalContext());
    break;
  case REAL_AST:
    LLVMValueRef realVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(realVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case BOOL_AST:
    LLVMValueRef boolVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(boolVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case SET_AST:
    const char* setBegStr = "{";
    LLVMValueRef constSetStringBeg = LLVMConstString(setBegStr, strlen(setBegStr), 1);
    printValueRef(constSetStringBeg, printf_func, builder, LLVMGetGlobalContext());
    LLVMValueRef setVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(setVal, printf_func, builder, LLVMGetGLobalContext());
    const char* setEndStr = "}";
    LLVMValueRef constSetStringEnd = LLVMConstString(setEndStr, strlen(setEndStr), 1);
    printValueRef(constSetStringEnd, printf_func, builder, LLVMGetGlobalContext());
    break;
  case TUPLE_AST:
    const char* tupleBegStr = "(";
    LLVMValueRef constTupleStringBeg = LLVMConstString(tupleBegStr, strlen(tupleBegStr), 1);
    printValueRef(constTupleStringBeg, printf_func, builder, LLVMGetGlobalContext());
    LLVMValueRef tupleVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(tupleVal, printf_func, builder, LLVMGetGlobalContext());
    const char* tupleEndStr = ")";
    LLVMValueRef constTupleStringEnd = LLVMConstString(tupleEndStr, strlen(tupleEndStr), 1);
    printValueRef(constTupleStringEnd, printf_func, builder, LLVMGetGlobalContext());
    break;
  case IDENT_AST:
    LLVMValueRef identVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case DOLLAR_AST:
    const char* dollarBegStr = "$";
    LLVMValueRef constDollarBeg = LLVMConstString(dollarBegStr, strlen(dollarBegStr), 1);
    printValueRef(constDollarBeg, printf_func, builder, LLVMGetGlobalContext());
    LLVMValueRef dollarVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    break;
  case PERCENT_AST:
    LLVMValueRef dollarVal = codeGenExpression(LLVMGetGlobalContext(), builder, node);
    printValueRef(identVal, printf_func, builder, LLVMGetGlobalContext());
    const char* percentEndStr = "%";
    LLVMValueRef constPercentStringEnd = LLVMConstString(percentEndStr, strlen(percentEndStr), 1);
    printValueRef(constPercentStringEnd, printf_func, builder, LLVMGetGlobalContext());
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

