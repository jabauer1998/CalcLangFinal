#include "CalcLangAstC.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "StringUtils.h"

//Function to Convert a StoreArray instance into a String
void storeArrayToStr(StoreArray* arrayWithLength, int size, char* str){
  int arrSize = arrayWithLength->length;
  AstNode** array = arrayWithLength->firstElem;
  for(int i = 0; i < arrSize; i++){
    if(i == 0){
      AstNode* data = array[i];
      astToStr(data, size, str);
    } else {
      strncat(str, ", ", size);
      AstNode* data = array[i];
      astToStr(data, size, str);
    }
  }
}

//Functions for turning an abstract syntax tree back into a string
//This is for debugging purpouses to make sure everything is marshalled over correctly

char* astToString(AstNode* node){
  int size = 500;
  char* str = calloc(size, 1);
  str[0] = '\0';
  astToStr(node, size, str);
  return str;
}

void equalOperationToStr(EqualOperation* op, int size, char* str){
  #ifdef DEBUG
  printf("Equals");
  #endif
  astToStr(op->left, size, str);
  strncat(str, " = ", size);
  astToStr(op->right, size, str);
}

void lessThenOrEqualsOperationToStr(LessThenOrEqualsOperation* op, int size, char* str){
  #ifdef DEBUG
  printf("LessThen");
  #endif
  astToStr(op->left, size, str);
  strncat(str," <= ", size);
  astToStr(op->right, size, str);
}

void greaterThenOrEqualsOperationToStr(GreaterThenOrEqualsOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, " >= ", size);
  astToStr(op->right, size, str);
}

void lessThenOperationToStr(LessThenOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, " < ", size);
  astToStr(op->right, size, str);
}

void greaterThenOperationToStr(GreaterThenOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, " > ", size);
  astToStr(op->right, size, str);
}

void additionOperationToStr(AdditionOperation* op, int size, char* str){
  #ifdef DEBUG
  printf("Addition");
  #endif
  astToStr(op->left, size, str);
  strncat(str, " + ", size);
  astToStr(op->right, size, str);
}

void subtractionOperationToStr(SubtractionOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, " - ", size);
  astToStr(op->right, size, str);
}

void multiplicationOperationToStr(MultiplicationOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, "*", size);
  astToStr(op->right, size, str);
}

void dotProductOperationToStr(DotProductOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, " . ", size);
  astToStr(op->right, size, str);
}

void divisionOperationToStr(DivisionOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, "/", size);
  astToStr(op->right, size, str);
}

void powerOperationToStr(PowerOperation* op, int size, char* str){
  astToStr(op->left, size, str);
  strncat(str, "^", size);
  astToStr(op->right, size, str);
}

void integerAstToStr(IntNumberAst* i, int size, char* str){
  strncat(str, i->lexeme, size);
}

void realAstToStr(RealNumberAst* i, int size, char* str){
  strncat(str, i->lexeme, size);
}

void booleanAstToStr(BooleanAst* i, int size, char* str){
  strncat(str, i->lexeme, size);
}

void setAstToStr(SetAst* s, int size, char* str){
  strncat(str, "{", size);
  storeArrayToStr(s->arr, size, str);
  strncat(str, "}", size);
}

void tupleAstToStr(TupleAst* s, int size, char* str){
  strncat(str, "(", size);
  storeArrayToStr(s->arr, size, str);
  strncat(str, ")", size);
}

void identAstToStr(IdentAst* s, int size, char* str){
  appendStrChr(s->name, size, str);
}

void dollarAstToStr(DollarAst* d, int size, char* str){
  appendStrChr('$', size, str);
  strncat(str, d->lexeme, size);
}

void percentAstToStr(PercentAst* p, int size, char* str){
  strncat(str, p->lexeme, size);
  appendStrChr('%', size, str);
}

void functionCallToStr(FunctionCall* f, int size, char* str){
  appendStrChr(f->name, size, str);
  appendStrChr('(', size, str);
  storeArrayToStr(f->params, size, str);
  appendStrChr(')', size, str);
}

void negateOperationToStr(NegateOperation* n, int size, char* str){
  appendStrChr('-', size, str);
  astToStr(n->expr, size, str);
}

void notOperationToStr(NotOperation* n, int size, char* str){
  appendStrChr('\'', size, str);
  astToStr(n->expr, size, str);
}

void functionDefinitionToStr(FunctionDef* d, int size, char* str){
  strncat(str, "func ", size);
  appendStrChr(d->name, size, str);
  appendStrChr('(', size, str);
  storeArrayToStr(d->param, size, str);
  strncat(str, ") = ", size);
  astToStr(d->expr, size, str);
}

void assignmentToStr(Assign* a, int size, char* str){
  strncat(str, "let ", size);
  appendStrChr(a->name, size, str);
  strncat(str, " = ", size);
  astToStr(a->expr, size, str);
}

void ifExpressionToStr (IfExpr* ify, int size, char* str){
  strncat(str, "if ", size);
  astToStr(ify->cond, size, str);
  strncat(str, " then ", size);
  astToStr(ify->ifTrue, size, str);
  strncat(str, " else ", size);
  astToStr(ify->ifFalse, size, str);
}

void parenExpressionToStr(ParenExpr* par, int size, char* str){
  appendStrChr('(', size, str);
  astToStr(par->expr, size, str);
  appendStrChr(')', size, str);
}

void createGraphCommandToStr(CreateGraphCommand* graph, int size, char* str){
  strncat(str, "create graph of ", size);
  appendStrChr(graph->name, size, str);
  strncat(str, " from ", size);
  astToStr(graph->begin, size, str);
  strncat(str, " to ", size);
  astToStr(graph->end, size, str);
  strncat(str, " by ", size);
  astToStr(graph->incr, size, str);
}

void getElementOperationToStr(GetElementOperation* op, int size, char* str){
  strncat(str, "get elem ", size);
  char myStr[100];
  sprintf(myStr, "%d", op->index);
  strncat(str, myStr, size);
  strncat(str, " from ", size);
  astToStr(op->node, size, str);
}

void getLengthOperationToStr(GetLengthOperation* len, int size, char* str){
  strncat(str, "get len from ", size);
  astToStr(len->node, size, str);
}

void sinOperationToStr(SinOperation* sin, int size, char* str){
  strncat(str, "sin(", size);
  astToStr(sin->node, size, str);
  appendStrChr(')', size, str);
}

void tanOperationToStr(TanOperation* tan, int size, char* str){
  strncat(str, "tan(", size);
  astToStr(tan->node, size, str);
  appendStrChr(')', size, str);
}

void cosOperationToStr(CosOperation* cos, int size, char* str){
  strncat(str, "cos(", size);
  astToStr(cos->node, size, str);
  appendStrChr(')', size, str);
}

//Bellow are all the Free tree methods

void freePosition(SourcePos* pos){
  free(pos->name);
  free(pos);
}

void freeStoreArray(StoreArray* arr){
  for(int i = 0; i < arr->length; i++){
    AstNode* node = arr->firstElem[i];
    freeTree(node);
  }
  free(arr->firstElem);
}

void freeEqualOperation(EqualOperation* op){
  #ifdef DEBUG
  printf("Equals");
  #endif
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeLessThenOrEqualsOperation(LessThenOrEqualsOperation* op){
  #ifdef DEBUG
  printf("LessThen");
  #endif
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeGreaterThenOrEqualsOperation(GreaterThenOrEqualsOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeLessThenOperation(LessThenOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeGreaterThenOperation(GreaterThenOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeAdditionOperation(AdditionOperation* op){
  #ifdef DEBUG
  printf("Addition");
  #endif
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeSubtractionOperation(SubtractionOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeMultiplicationOperation(MultiplicationOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeDotProductOperation(DotProductOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeDivisionOperation(DivisionOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freePowerOperation(PowerOperation* op){
  freePosition(op->pos);
  freeTree(op->left);
  freeTree(op->right);
}

void freeIntegerAst(IntNumberAst* i){
  freePosition(i->pos);
  free(i->lexeme);
}

void freeRealAst(RealNumberAst* i){
  freePosition(i->pos);
  free(i->lexeme);
}

void freeBooleanAst(BooleanAst* i){
  freePosition(i->pos);
  free(i->lexeme);
}

void freeSetAst(SetAst* s){
  freePosition(s->pos);
  freeStoreArray(s->arr);
}

void freeTupleAst(TupleAst* s){
  freePosition(s->pos);
  freeStoreArray(s->arr);
}

void freeIdentAst(IdentAst* s){
  freePosition(s->pos);
}

void freeDollarAst(DollarAst* d){
  freePosition(d->pos);
  free(d->lexeme);
}

void freePercentAst(PercentAst* p){
  freePosition(p->pos);
  free(p->lexeme);
}

void freeFunctionCall(FunctionCall* f){
  freePosition(f->pos);
  freeStoreArray(f->params);
}

void freeNegateOperation(NegateOperation* n){
  freePosition(n->pos);
  freeTree(n->expr);
}

void freeNotOperation(NotOperation* n){
  freePosition(n->pos);
  freeTree(n->expr);
}

void freeFunctionDefinition(FunctionDef* d){
  freePosition(d->pos);
  freeStoreArray(d->param);
  freeTree(d->expr);
}

void freeAssignment(Assign* a){
  freePosition(a->pos);
  freeTree(a->expr);
}

void freeIfExpression(IfExpr* ify){
  freePosition(ify->pos);
  freeTree(ify->cond);
  freeTree(ify->ifTrue);
  freeTree(ify->ifFalse);
}

void freeParenExpression(ParenExpr* par){
  freePosition(par->pos);
  freeTree(par->expr);
}

void freeCreateGraphCommand(CreateGraphCommand* graph){
  freePosition(graph->pos);
  freeTree(graph->begin);
  freeTree(graph->end);
  freeTree(graph->incr);
}

void freeGetElementOperation(GetElementOperation* op){
  freePosition(op->pos);
  freeTree(op->node);
}

void freeGetLengthOperation(GetLengthOperation* len){
  freePosition(len->pos);
  freeTree(len->node);
}

void freeSinOperation(SinOperation* op){
  freePosition(op->pos);
  freeTree(op->node);
}

void freeCosOperation(CosOperation* op){
  freePosition(op->pos);
  freeTree(op->node);
}

void freeTanOperation(TanOperation* op){
  freePosition(op->pos);
  freeTree(op->node);
}

void freeTree(AstNode* node){
  switch(node->nodeType){
  case EQUAL_OPERATION:
    freeEqualOperation(&(node->actualNodeData.equalOperation));
    break;
  case LESS_THEN_OR_EQUALS_OPERATION:
    freeLessThenOrEqualsOperation(&(node->actualNodeData.lessOrEqual));
    break;
  case GREATER_THEN_OR_EQUALS_OPERATION:
    freeGreaterThenOrEqualsOperation(&(node->actualNodeData.greaterOrEqual));
    break;
  case LESS_THEN_OPERATION:
    freeLessThenOperation(&(node->actualNodeData.lessThen));
    break;
  case GREATER_THEN_OPERATION:
    freeGreaterThenOperation(&(node->actualNodeData.greaterThen));
    break;
  case ADDITION_OPERATION:
    freeAdditionOperation(&(node->actualNodeData.addition));
    break;
  case SUBTRACTION_OPERATION:
    freeSubtractionOperation(&(node->actualNodeData.subtraction));
    break;
  case MULTIPLICATON_OPERATION:
    freeMultiplicationOperation(&(node->actualNodeData.multiplication));
    break;
  case DOT_PRODUCT_OPERATION:
    freeDotProductOperation(&(node->actualNodeData.dotProduct));
    break;
  case DIVISION_OPERATION:
    freeDivisionOperation(&(node->actualNodeData.division));
    break;
  case POWER_OPERATION:
    freePowerOperation(&(node->actualNodeData.power));
    break;
  case INT_AST:
    freeIntegerAst(&(node->actualNodeData.integer));
    break;
  case REAL_AST:
    freeRealAst(&(node->actualNodeData.real));
    break;
  case BOOL_AST:
    freeBooleanAst(&(node->actualNodeData.bool));
    break;
  case SET_AST:
    freeSetAst(&(node->actualNodeData.set));
    break;
  case TUPLE_AST:
    freeTupleAst(&(node->actualNodeData.tuple));
    break;
  case IDENT_AST:
    freeIdentAst(&(node->actualNodeData.ident));
    break;
  case DOLLAR_AST:
    freeDollarAst(&(node->actualNodeData.dollar));
    break;
  case PERCENT_AST:
    freePercentAst(&(node->actualNodeData.percent));
    break;
  case FUNCTION_CALL:
    freeFunctionCall(&(node->actualNodeData.call));
    break;
  case NEGATE_OPERATION:
    freeNegateOperation(&(node->actualNodeData.negate));
    break;
  case NOT_OPERATION:
    freeNotOperation(&(node->actualNodeData.not));
    break;
  case FUNCTION_DEFINITION:
    freeFunctionDefinition(&(node->actualNodeData.function));
    break;
  case ASSIGN:
    freeAssignment(&(node->actualNodeData.variable));
    break;
  case IF_EXPR:
    freeIfExpression(&(node->actualNodeData.ifStatement));
    break;
  case PAREN_EXPR:
    freeParenExpression(&(node->actualNodeData.par));
    break;
  case CREATE_GRAPH_COMMAND:
    freeCreateGraphCommand(&(node->actualNodeData.graph));
    break;
  case GET_ELEMENT:
    freeGetElementOperation(&(node->actualNodeData.elem));
    break;
  case GET_LENGTH:
    freeGetLengthOperation(&(node->actualNodeData.len));
    break;
  case SIN:
    freeSinOperation(&(node->actualNodeData.sin));
    break;
  case TAN:
    freeTanOperation(&(node->actualNodeData.tan));
    break;
  case COS:
    freeCosOperation(&(node->actualNodeData.cos));
    break;
  default:
    fprintf(stderr, "Invalid number %d", node->nodeType);
    break;
  }
  free(node);
}

void astToStr(AstNode* node, int size, char* str){
  #ifdef DEBUG
  printf("NodeType %d", node->nodeType);
  fflush(stdout);
  #endif
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
    lessThenOperationToStr(&(node->actualNodeData.lessThen), size, str);
    break;
  case GREATER_THEN_OPERATION:
    greaterThenOperationToStr(&(node->actualNodeData.greaterThen), size, str);
    break;
  case ADDITION_OPERATION:
    additionOperationToStr(&(node->actualNodeData.addition), size, str);
    break;
  case SUBTRACTION_OPERATION:
    subtractionOperationToStr(&(node->actualNodeData.subtraction), size, str);
    break;
  case MULTIPLICATON_OPERATION:
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
    realAstToStr(&(node->actualNodeData.real), size, str);
    break;
  case BOOL_AST:
    booleanAstToStr(&(node->actualNodeData.bool), size, str);
    break;
  case SET_AST:
    setAstToStr(&(node->actualNodeData.set), size, str);
    break;
  case TUPLE_AST:
    tupleAstToStr(&(node->actualNodeData.tuple), size, str);
    break;
  case IDENT_AST:
    identAstToStr(&(node->actualNodeData.ident), size, str);
    break;
  case DOLLAR_AST:
    dollarAstToStr(&(node->actualNodeData.dollar), size, str);
    break;
  case PERCENT_AST:
    percentAstToStr(&(node->actualNodeData.percent), size, str);
    break;
  case FUNCTION_CALL:
    functionCallToStr(&(node->actualNodeData.call), size, str);
    break;
  case NEGATE_OPERATION:
    negateOperationToStr(&(node->actualNodeData.negate), size, str);
    break;
  case NOT_OPERATION:
    notOperationToStr(&(node->actualNodeData.not), size, str);
    break;
  case FUNCTION_DEFINITION:
    functionDefinitionToStr(&(node->actualNodeData.function), size, str);
    break;
  case ASSIGN:
    assignmentToStr(&(node->actualNodeData.variable), size, str);
    break;
  case IF_EXPR:
    ifExpressionToStr(&(node->actualNodeData.ifStatement), size, str);
    break;
  case PAREN_EXPR:
    parenExpressionToStr(&(node->actualNodeData.par), size, str);
    break;
  case CREATE_GRAPH_COMMAND:
    createGraphCommandToStr(&(node->actualNodeData.graph), size, str);
    break;
  case GET_ELEMENT:
    getElementOperationToStr(&(node->actualNodeData.elem), size, str);
    break;
  case GET_LENGTH:
    getLengthOperationToStr(&(node->actualNodeData.len), size, str);
    break;
  case SIN:
    sinOperationToStr(&(node->actualNodeData.sin), size, str);
    break;
  case TAN:
    tanOperationToStr(&(node->actualNodeData.tan), size, str);
    break;
  case COS:
    cosOperationToStr(&(node->actualNodeData.cos), size, str);
    break;
  default:
    fprintf(stderr, "Invalid number %d", node->nodeType);
    break;
  }
}



