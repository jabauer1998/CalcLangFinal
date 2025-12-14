#include "CalcLangCGraph.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/ioctl.h> // Required for ioctl and TIOCGWINSZ
#include <unistd.h>    // Required for STDOUT_FILENO
#include <limits.h>
#include "CalcLangCInt.h"

#define DEBUG

bool closeTo(LLVMIntArena* arena, CalcLangValue* x, CalcLangValue* y, CalcLangValue* deviation) {
  if(toBool(greaterThenCalcLangValues(arena, x, y))){
    return toBool(lessThenCalcLangValues(arena, subCalcLangValues(arena, x, y), deviation));
  } else {
    return toBool(lessThenCalcLangValues(arena, subCalcLangValues(arena, y, x), deviation));
  }
}

CalcLangPixel** initializeDisplay(CalcLangValue* windowHeight, CalcLangValue* windowWidth){
  CalcLangPixel** display = malloc(sizeof(CalcLangPixel*) * windowHeight->valData.integer);
  memset(display, 0, windowHeight->valData.integer);
  for(int i = 0; i < windowHeight->valData.integer; i++){
    display[i] = (CalcLangPixel*)malloc(sizeof(CalcLangPixel) * windowWidth->valData.integer);
    memset(display[i], 0, windowWidth->valData.integer);
  }
  return display;
}

CalcLangPixel** quantifyPlane(LLVMIntArena* arena, CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* xMin, CalcLangValue* yMax, CalcLangValue* windowHeight, CalcLangValue* windowWidth){
  CalcLangPixel** display = initializeDisplay(windowHeight, windowWidth);

  for(int y = 0; y < windowHeight->valData.integer; y++){
    CalcLangValue* yVal = integerCalcLangValue(arena, y);
    for(int x = 0; x < windowWidth->valData.integer; x++){
      CalcLangValue* xVal = integerCalcLangValue(arena, x);
      display[y][x].x = copyValue(addCalcLangValues(arena, xMin, multCalcLangValues(arena, xSteps, xVal)));
      display[y][x].y = copyValue(subCalcLangValues(arena, yMax, multCalcLangValues(arena, ySteps, yVal)));
    }
    arenaReset(arena);
  }

  return display;
}

char yCompress(LLVMIntArena* arena, CalcLangValue* num, CalcLangValue* pixel, CalcLangValue* range){
  char *table = "_,.-~*'`";

  CalcLangValue* eight = integerCalcLangValue(arena, 8);
  // splits the pixel's height by 1/8
  CalcLangValue* steps = divCalcLangValues(arena, range, eight);

  CalcLangValue* two = integerCalcLangValue(arena, 2);
  CalcLangValue* rangeDiv2 = divCalcLangValues(arena, range, two);
  CalcLangValue* goal = subCalcLangValues(arena, num, subCalcLangValues(arena, pixel, rangeDiv2));
  int counter = 0;
  CalcLangValue* step = integerCalcLangValue(arena, 0);
  while(toBool(lessThenCalcLangValues(arena, step, goal))){
    step = addCalcLangValues(arena, step, steps);
    counter++;
  }
  return table[counter - 1];
}

void printPlane(CalcLangPixel** display, CalcLangValue* windowHeight, CalcLangValue* windowWidth){
  char** output = malloc(sizeof(char*) * windowHeight->valData.integer);
  for(int i = 0; i < windowHeight->valData.integer; i++){
    output[i] = malloc(sizeof(char) * windowWidth->valData.integer + 1);
  }

  for(int y = 0; y < windowHeight->valData.integer; y++) {
    for(int x = 0; x < windowWidth->valData.integer; x++)
      output[y][x] = display[y][x].display;
    output[y][windowWidth->valData.integer] = '\0';
  }

  for(int y = 0; y < windowHeight->valData.integer; y++)
    puts(output[y]);

  for(int y = 0; y < windowHeight->valData.integer; y++)
    free(output[y]);
  free(output);
}

void drawLine(CalcLangPixel** display, CalcLangValue* (*dataFunc)(LLVMIntArena*,CalcLangValue*), LLVMIntArena* arena, CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* windowHeight, CalcLangValue* windowWidth){
    CalcLangValue* relX;
    CalcLangValue* relY;

    CalcLangValue* twoPoint1 = copyValue(realCalcLangValue(arena, 2.1));
    CalcLangValue* stepDivTwoPoint1 = copyValue(divCalcLangValues(arena, ySteps, twoPoint1));
    arenaReset(arena);
    
    for(int y = 0; y < windowHeight->valData.integer; y++) {
        for(int x = 0; x < windowWidth->valData.integer; x++) {
	    CalcLangPixel* pixel = &(display[y][x]);
            relX = pixel->x;
            relY = pixel->y;

            CalcLangValue* output = copyValue(dataFunc(arena, relX));
	    arenaReset(arena);
            if(closeTo(arena, output, relY, stepDivTwoPoint1))
	      pixel->display = yCompress(arena, output, relY, ySteps);
	    freeCalcLangValue(output);
        }
    }
}

void printDisplayCordinates(CalcLangPixel** display, CalcLangValue* windowHeight, CalcLangValue* windowWidth){
  for(int y = 0; y < windowHeight->valData.integer; y++){
    printf("{");
    for(int x = 0; x < windowWidth->valData.integer; x++){
      printf("(");
      printValue(display[y][x].x);
      printf(", ");
      printValue(display[y][x].y);
      printf(")");
    }
    printf("}\n");
  }
}

void drawPlane(CalcLangPixel** display, LLVMIntArena* arena, CalcLangValue* xSteps, CalcLangValue* ySteps, CalcLangValue* windowHeight, CalcLangValue* windowWidth){
  CalcLangValue* relX;
  CalcLangValue* relY;

  CalcLangValue* twoPoint1 = copyValue(realCalcLangValue(arena, 2.1));
  CalcLangValue* yStepDivTwoPoint1 = copyValue(divCalcLangValues(arena, ySteps, twoPoint1));
  CalcLangValue* xStepDivTwoPoint1 = copyValue(divCalcLangValues(arena, xSteps, twoPoint1));
  CalcLangValue* zero = copyValue(integerCalcLangValue(arena, 0));

  arenaReset(arena);
    
    for(int y = 0; y < windowHeight->valData.integer; y++) {
        for(int x = 0; x < windowWidth->valData.integer; x++) {
	    CalcLangPixel* pixel = &(display[y][x]);
            relX = pixel->x;
            relY = pixel->y;

            bool xZero = closeTo(arena, relX, zero, xStepDivTwoPoint1);
            bool yZero = closeTo(arena, relY, zero, yStepDivTwoPoint1);
            bool origin = xZero && yZero;

            if(origin)
                pixel -> display = '+';
            else if(xZero)
                pixel -> display = '|';
            else if(yZero)
                pixel -> display = '-';
            else
                pixel -> display = ' ';

	    arenaReset(arena);
        }
    }

    freeCalcLangValue(twoPoint1);
    freeCalcLangValue(yStepDivTwoPoint1);
    freeCalcLangValue(xStepDivTwoPoint1);
    freeCalcLangValue(zero);
}

void clearDisplay(CalcLangPixel** display, CalcLangValue* windowHeight){
  for(int i = 0; i < windowHeight->valData.integer; i++){
    freeCalcLangValue(display[i]->x);
    freeCalcLangValue(display[i]->y);
    free(display[i]);
  }
  free(display);
}

CalcLangValue* findYMax(LLVMIntArena* arena, CalcLangValue* begin, CalcLangValue* end, CalcLangValue* byAmount, CalcLangValue* (*valFunc)(LLVMIntArena* arena, CalcLangValue*)){
  CalcLangValue* yMax = copyValue(valFunc(arena, begin));
  #ifdef DEBUG
  printf("Starting yMax=");
  printValue(yMax);
  printf(" at %p\n", yMax);
  #endif
  CalcLangValue* z = NULL;
  for(CalcLangValue* i = copyValue(addCalcLangValues(arena, begin, byAmount)); toBool(lessThenOrEqualToCalcLangValues(arena, i, end)); z = i, i = copyValue(addCalcLangValues(arena, i, byAmount)), freeCalcLangValue(z)){
    #ifdef DEBUG
    printf("Index is: ");
    printValue(i);
    printf(" at %p\n", i);
    #endif
    CalcLangValue* toRet = copyValue(valFunc(arena, i));
    #ifdef DEBUG
    printf("yMax=");
    printValue(toRet);
    printf(" at %p\n", toRet);
    #endif
    if(toBool(greaterThenCalcLangValues(arena, toRet, yMax))){
      freeCalcLangValue(yMax);
      #ifdef DEBUG
      printf("Highest YMax is ");
      printValue(toRet);
      printf(" at %p\n", toRet);
      #endif
      yMax = toRet;
    }
    arenaReset(arena);
  }
  return yMax;
}

CalcLangValue* findYMin(LLVMIntArena* arena, CalcLangValue* begin, CalcLangValue* end, CalcLangValue* byAmount, CalcLangValue* (*valFunc)(LLVMIntArena* arena, CalcLangValue*)){
  CalcLangValue* yMin = copyValue(valFunc(arena, begin));
  CalcLangValue* z = NULL;
  for(CalcLangValue* i = copyValue(addCalcLangValues(arena, begin, byAmount)); toBool(lessThenOrEqualToCalcLangValues(arena, i, end)); z = i, i = copyValue(addCalcLangValues(arena, i, byAmount)), freeCalcLangValue(z)){
    CalcLangValue* toRet = copyValue(valFunc(arena, i));
    if(toBool(lessThenCalcLangValues(arena, toRet, yMin))){
      freeCalcLangValue(yMin);
      yMin = toRet;
    }
    arenaReset(arena);
  }
  return yMin;
}

bool drawGraph(LLVMIntArena* arena, CalcLangValue* begin, CalcLangValue* end, CalcLangValue* byAmount, CalcLangValue* (*valFunc)(LLVMIntArena* arena, CalcLangValue*)){
  struct winsize w;
  // Use ioctl to get the window size information
  // STDOUT_FILENO represents the standard output file descriptor
  if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == -1) {
      perror("ioctl failed");
      return false;
  }

  CalcLangValue* myBegin = copyValue(begin);
  CalcLangValue* myEnd = copyValue(end);
  CalcLangValue* myAmount = copyValue(byAmount);
  arenaReset(arena);
  
  #ifdef DEBUG
  printf("MyBegin=");
  printValue(myBegin);
  printf("\nMyEnd=");
  printValue(myEnd);
  printf("\nMyAmount=");
  printValue(myAmount);
  printf("\n");
  #endif

  CalcLangValue* screenWidth = copyValue(integerCalcLangValue(arena, w.ws_col));
  CalcLangValue* screenHeight = copyValue(integerCalcLangValue(arena, w.ws_row));
  CalcLangValue* two = copyValue(integerCalcLangValue(arena, 2));
  CalcLangValue* xStep = copyValue(multCalcLangValues(arena, divCalcLangValues(arena, subCalcLangValues(arena, myEnd, myBegin), screenWidth), two));
  CalcLangValue* div2Width = copyValue(divCalcLangValues(arena, screenWidth, two));
  CalcLangValue* xBegin = copyValue(negateCalcLangValue(arena, multCalcLangValues(arena, xStep, div2Width)));
  CalcLangValue* xEnd = copyValue(multCalcLangValues(arena, xStep, div2Width));
  #ifdef DEBUG
  printf("screenWidth=");
  printValue(screenWidth);
  printf("\nscreenHeight=");
  printValue(screenHeight);
  printf("\ntwo=");
  printValue(two);
  printf("\nxStep=");
  printValue(xStep);
  printf("\ndiv2Width=");
  printValue(div2Width);
  printf("\nxBegin=");
  printValue(xBegin);
  printf("\nxEnd=");
  printValue(xEnd);
  printf("\n");
  #endif
  arenaReset(arena);
  
  CalcLangValue* yMax = copyValue(findYMax(arena, xBegin, xEnd, xStep, valFunc));
  CalcLangValue* yMin = copyValue(findYMin(arena, xBegin, xEnd, xStep, valFunc));
  
  CalcLangValue* yStep = copyValue(divCalcLangValues(arena, subCalcLangValues(arena, yMax, yMin), screenHeight));
  CalcLangValue* div2Height = copyValue(divCalcLangValues(arena, screenHeight, two));
  CalcLangValue* yBegin = copyValue(negateCalcLangValue(arena, multCalcLangValues(arena, yStep, div2Height)));
  CalcLangValue* yEnd = copyValue(multCalcLangValues(arena, yStep, div2Height));
  arenaReset(arena);
  
  CalcLangPixel** display = quantifyPlane(arena, xStep, yStep, xBegin, yEnd, screenHeight, screenWidth);
  drawPlane(display, arena, xStep, yStep, screenHeight, screenWidth);
  drawLine(display, valFunc, arena, xStep, yStep, screenHeight, screenWidth);
  printPlane(display, screenHeight, screenWidth);
  clearDisplay(display, screenHeight);

  freeCalcLangValue(myBegin);
  freeCalcLangValue(myEnd);
  freeCalcLangValue(myAmount);
  freeCalcLangValue(screenWidth);
  freeCalcLangValue(screenHeight);
  freeCalcLangValue(two);
  freeCalcLangValue(xStep);
  return true;
}
