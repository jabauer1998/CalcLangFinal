#ifndef CALCLANG_AST_H
#define CALCLANG_AST_H

//Define All the Node Type Ints
#define EQUAL_OPERATION 0
#define LESS_THEN_OR_EQUALS_OPERATION 1
#define GREATER_THEN_OR_EQUALS_OPERATION 2
#define LESS_THEN_OPERATION 3
#define GREATER_THEN_OPERATION 4
#define ADDITION_OPERATION 5
#define SUBTRACTION_OPERATION 6
#define MULTIPLICATON_OPERATION 7
#define DOT_PRODUCT_OPERATION 8
#define DIVISION_OPERATION 9
#define POWER_OPERATION 10
#define INT_AST 11
#define REAL_AST 12
#define BOOL_AST 13
#define SET_AST 14
#define TUPLE_AST 15
#define IDENT_AST 16
#define DOLLAR_AST 17
#define PERCENT_AST 18
#define FUNCTION_CALL 19
#define NEGATE_OPERATION 20
#define NOT_OPERATION 21
#define FUNCTION_DEFINITION 22
#define ASSIGN 23
#define IF_EXPR 24 

//Define the struct to keep track of the Source Position and Filename
typedef struct {
  const char* name;
  int lineNumber;
  int linePosition;
} SourcePos;

//Define the struct to keep track of Arrays of AstNodes
typedef struct {
  int length;
  AstNode* firstElem;
} StoreArray;
//Now we need to define all the Ops
typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} EqualOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} LessThenOrEqualsOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} GreaterThenOrEqualsOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} LessThenOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} GreaterThenOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} AdditionOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} SubtractionOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} MultiplicationOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} DotProductOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} DivisionOperation;

typedef struct {
  SourcePos* pos;
  AstNode* left;
  AstNode* right;
} PowerOperation;

typedef struct {
  SourcePos* pos;
  const char* lexeme;
} IntNumberAst;

typedef struct {
  SourcePos* pos;
  const char* lexeme;
} RealNumberAst;

typedef struct {
  SourcePos* pos;
  const char* lexeme;
} BoolaenAst;

typedef struct {
  SourcePos* pos;
  StoreArray* arr; 
} SetAst;

typedef struct {
  SourcePos* pos;
  StoreArray* arr;
} TupleAst;

typedef struct {
  SourcePos* pos;
  const char name;
} IdentAst;

typedef struct {
  SourcePos* pos;
  const char* lexeme;
} DollarAst;

typedef struct {
  SourcePos* pos;
  const char* lexeme;
} PercentAst;

typedef struct {
  SourcePos* pos;
  char name;
  StoreArray* params;
} FunctionCall;

typedef struct {
  SourcePos* pos;
  AstNode* expr;
} NegateOperation;

typedef struct {
  SourcePos* pos;
  AstNode* expr;
} NotOperation;

typedef struct {
  SourcePos* pos;
  char name;
  StoreArray* param;
  AstNode* expr;
} FunctionDef;

typedef struct {
  SourcePos* pos;
  char name;
  AstNode* expr;
}Assign;

typedef struct {
  SourcePos* pos;
  AstNode* cond;
  AstNode* ifTrue;
  AstNode* ifFalse;
}IfExpr;

typedef union {
  EqualOperation equalOperation;
  LessThenOrEqualsOperation lessOrEqual;
  GreaterThenOrEqualsOperation greaterOrEqual;
  LessThenOperation lessThen;
  GreaterThenOperation greaterThen;
  AdditionOperation addition;
  SubtractionOperation subtraction;
  MultiplicationOperation multiplication;
  DotProductOperation dotProduct;
  DivisionOperation division;
  PowerOperation power;
  IntNumberAst integer;
  RealNumberAst real;
  BooleanAst bool;
  SetAst set;
  TupleAst tuple;
  IdentAst ident;
  DollarAst dollar;
  PercentAst percent;
  FunctionCall call;
  NegateOperation negate;
  NotOperation not;
  FunctionDef function;
  Assign variable;
  IfExpr ifStatement;
} AstNodeType;

typedef struct {
  int nodeType;
  AstNodeType nodeType;
} AstNode;

const char* astToString(AstNode* node);

#endif
