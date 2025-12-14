#ifndef CALC_LANG_C_GRAPH
#define CALC_LANG_C_GRAPH

#include <stdbool.h>
#include "CalcLangCInt.h"
#include "CalcLangCIntArena.h"

typedef struct {
  CalcLangValue* x;
  CalcLangValue* y;
  char display;
} CalcLangPixel;

bool closeTo(LLVMIntArena* arena, CalcLangValue* x, CalcLangValue* y, CalcLangValue* deviation);
CalcLangPixel** initializeDisplay(CalcLangValue* windowWidth, CalcLangValue* windowHeight);
CalcLangPixel** quantifyPlane(LLVMIntArena* arena, CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* xMin, CalcLangValue* yMax, CalcLangValue* windowWidth, CalcLangValue* windowHeight);
char yCompress(LLVMIntArena* arena, CalcLangValue* num, CalcLangValue* pixel, CalcLangValue* range);
void printPlane(CalcLangPixel** display, CalcLangValue* windowHeight, CalcLangValue* windowWidth);
void drawLine(CalcLangPixel** display, CalcLangValue*(*eval)(LLVMIntArena*,CalcLangValue*), LLVMIntArena* arena, CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* windowWidth, CalcLangValue* windowHeight);
void drawPlane(CalcLangPixel** display, LLVMIntArena* arena,CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* windowWidth, CalcLangValue* windowHeight);
bool drawGraph(LLVMIntArena* arena, CalcLangValue* begin, CalcLangValue* end, CalcLangValue* byAmount, CalcLangValue* (*valFunc)(LLVMIntArena*, CalcLangValue*));




#endif
