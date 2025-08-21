#include <CalcLangAst.h>

char* astToString(AstNode* node){
  int size = 500;
  char* str = (char*)malloc(size);
  astToStr(node, size, str);
  return str;
}

void astToStr(AstNode* node, int size, char* str){
  switch(node->nodeType){
  case EQUAL_OPERATION:
    equalOperationToStr(&(node->actualNodeData.equalOperation), size, str);
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    lessThenOrEqualsOperationToStr(&(node->actualNodeData.lessOrEqual), size, str);
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    greaterThenOrEqualsOperationToStr(&(node->actualNodeData.greaterOrEqual), size, str);
    break;
  case LESS_THEN_OPERATION:
    lessThenOperationToStr(&(node->actualNodeData.lessThen), size, str)
    break;
  case GREATER_THEN_OPERATION:
    greaterThenOperationToStr(&(node->actualNodeData.greaterThen), size, str);
    break;
  case ADDITION_OPERATION:
    additionOperationToStr(&(node->actualNodeData.addition), size, str);
    break;
  case SUBTRACTION_OPERATION:
    subtractionOperationToStr(&node->actualNodeData.subtraction, size, str);
    break;
  case MULTIPLICATION_OPERATION:
    multiplicationOperationToStr(&(node->actualNodeData.multiplication), size, str);
    break;
  case DOT_PRODUCT_OPERATION:
    dotProductOperationToStr(&(node->actualNodeData.dotProduct), size, str);
    break;
  case DIVISION_OPERATION:
    divisionOperationToStr(&(node->actualNodeData.division), size, str);
    break;
  case POWER_OPERATION:
    powerOperationToStr(&(node->actualNodeData.power), size, str);
    break;
  case INT_AST:
    integerAstToStr(&(node->actualNodeData.integer), size, str);
    break;
  case REAL_AST:
    integerAstToStr(&(node->actualNodeData.real), size, str);
    break;
  case BOOL_AST:
    booleanAstToStr(&(node->actualNodeData.boolean), size, str);
    break;
  }
}

void equalOperationToStr(EqualOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" = ", str, size);
  astToStr(op->right, size, str);
}

void lessThenOrEqualsOperationToStr(LessThenOrEqualOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" <= ", str, size);
  astToStr(op->right, size, str);
}

void greaterThenOrEqualsOperationToStr(LessThenOrEqualOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" >= ", str, size);
  astToStr(op->right, size, str);
}

void lessThenOperationToStr(LessThenOrEqualOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" < ", str, size);
  astToStr(op->right, size, str);
}

void greaterThenOperationToStr(LessThenOrEqualOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" > ", str, size);
  astToStr(op->right, size, str);
}

void additionOperationToStr(AdditionOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" + ", str, size);
  astToStr(op->right, size, str);
}

void subtractionOperationToStr(SubtractionOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" - ", str, size);
  astToStr(op->right, size, str);
}

void multiplicationOperationToStr(MultiplicationOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat("*", str, size);
  astToStr(op->right, size, str);
}

void dotProductOperationToStr(DotProductOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(" . ", str, size);
  astToStr(op->right, size, str);
}

void divisionOperationToStr(DivisionOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat("/", str, size);
  astToStr(op->right, size, str);
}

void powerOperationToStr(PowerOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat("^", str, size);
  astToStr(op->right, size, str);
}

void integerAstToString(IntAst* i, int size, char* str){
  strncat(i->lexeme, str, size);
}

void realAstToString(RealAst* i, int size, char* str){
  strncat(i->lexeme, str, size);
}

void boolAstToString(BooleanAst* i, int size, char* str){
  strncat(i->lexeme, str, size);
}



