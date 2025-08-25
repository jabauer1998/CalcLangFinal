#include "CalcLangAstC.h"
#include <stdio.h>
#include <stdlib.h>

int main(){
  printf("Malloc Pos");
  fflush(stdout);
  SourcePos* pos = (SourcePos*)malloc(sizeof(SourcePos));
  printf("setting name");
  fflush(stdout);
  pos->name = "Test";
  printf("Setting position");
  fflush(stdout);
  pos->lineNumber = 0;
  pos->linePosition = 0;

  printf("Made pos");
  fflush(stdout);

  AstNode* left = (AstNode*)malloc(sizeof(AstNode));
  left->nodeType = 11;
  left->actualNodeData.integer.pos = pos;
  left->actualNodeData.integer.lexeme = "8908";

  printf("Made number");
  fflush(stdout);

  AstNode* right = (AstNode*)malloc(sizeof(AstNode));
  right->nodeType = 11;
  right->actualNodeData.integer.pos = pos;
  right->actualNodeData.integer.lexeme = "193874";

  AstNode* add = (AstNode*)malloc(sizeof(AstNode));
  add->nodeType = 5;
  add->actualNodeData.addition.pos = pos;
  add->actualNodeData.addition.left = left;
  add->actualNodeData.addition.right = right;

  AstNode* assign = (AstNode*)malloc(sizeof(AstNode));
  assign->nodeType = 23;
  assign->actualNodeData.variable.pos = pos;
  assign->actualNodeData.variable.name = 'x';
  assign->actualNodeData.variable.expr = add;

  printf("Made sources");
  fflush(stdout);
  
  char* res = astToString(assign);

  printf("Test result is %s", res);
}
