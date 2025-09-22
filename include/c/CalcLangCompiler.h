#ifndef CALCLANGCOMPILER_H
#define CALCLANGCOMPILER_H

#include "CalcLangAstC.h"

void processAST(AstNode* node);
void processASTList(StoreArray* arr, char* output);

#endif
