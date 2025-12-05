#ifndef CALC_LANG_C_GRAPH
#define CALC_LANG_C_GRAPH

#include <stdbool.h>
#include "LinkToCalcLang.h"
#include "CalcLangCIntArena.h"

#define WINDOW_WIDTH (long double) 200
#define WINDOW_HEIGHT (long double) 100

typedef struct {
  long double x, y;
  char display;
} CalcLangPixel;

long double base = 10;

bool closeTo(long double x, long double y, long double deviation);
CalcLangPixel** initializeDisplay(int windowWidth, int windowHeight);
CalcLangPixel** quantifyPlane(long double xSteps, long double ySteps, long double xMin, long double yMax, int windowWidth, int windowHeight);
char yCompress(long double num, long double pixel, long double range);
void printPlane(CalcLangPixel** display, int windowHeight, int windowWidth);
void shadeGraph(CalcLangPixel** display, CalcLangValue*(*eval)(CalcLangValue*), LLVMIntArena* arena, long double xSteps, long double ySteps, long double leftBound, long double rightBound, int windowHeight, int windowWidth);
void drawLine(CalcLangPixel** display, CalcLangValue*(*eval)(CalcLangValue*), LLVMIntArena* arena, long double xSteps, long double ySteps, int windowWidth, int windowHeight);
void drawPlane(CalcLangPixel** display, long double xSteps, long double ySteps, int windowWidth, int windowHeight);




#endif
