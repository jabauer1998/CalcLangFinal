#ifndef CALCLANG_AST_H
#define CALCLANG_AST_H

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
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} EqualOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} LessThenOrEqualsOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} GreaterThenOrEqualsOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} LessThenOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} GreaterThenOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} AdditionOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} SubtractionOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} MultiplicationOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} DotProductOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} DivisionOperation;

typedef struct {
  SourcePos pos;
  AstNode* left;
  AstNode* right;
} PowerOperation;

typedef struct {
  SourcePos pos;
  const char* lexeme;
} IntNumberAst;

typedef struct {
  SourcePos pos;
  const char* lexeme;
} RealNumberAst;

typedef struct {
  SourcePos pos;
  const char* lexeme;
} BoolaenAst;

typedef struct {
  SourcePos pos;
  StoreArray* arr; 
} SetAst;

typedef struct {
  SourcePos pos;
  StoreArray* arr;
} TupleAst;

typedef struct {
  SourcePos pos;
  const char name;
} IdentAst;

typedef struct {
  SourcePos pos;
  const char* lexeme;
} DollarAst;

typedef struct {
  SourcePos pos;
  const char* lexeme;
} PercentAst;

typedef struct {
  SourcePos pos;
  char name;
  StoreArray* params;
} FunctionCall;

typedef struct {
  SourcePos pos;
  AstNode* expr;
} NegateOperation;

typedef struct {
  SourcePos pos;
  AstNode* expr;
} NotOperation;

typedef struct {
  SourcePos pos;
  char name;
  StoreArray* param;
  AstNode* expr;
} FunctionDef;

typedef struct {
  SourcePos pos;
  char name;
  AstNode* expr;
}Assign;

typedef struct {
  SourcePos pos;
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



#endif
