#include "CalcLangCGraph.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/ioctl.h> // Required for ioctl and TIOCGWINSZ
#include <unistd.h>    // Required for STDOUT_FILENO
#include <limits.h>
#include "CalcLangCInt.h"

bool closeTo(long double x, long double y, long double deviation) {
  return fabsl(x-y) < deviation;
}

CalcLangPixel** initializeDisplay(int windowHeight, int windowWidth){
  CalcLangPixel** display = malloc(sizeof(CalcLangPixel*) * windowHeight);
  memset(display, 0, windowHeight);
  for(int i = 0; i < windowHeight; i++){
    display[i] = (CalcLangPixel*)malloc(sizeof(CalcLangPixel) * windowWidth);
    memset(display[i], 0, windowWidth);
  }
  return display;
}

CalcLangPixel** quantifyPlane(long double xSteps, long double ySteps, long double xMin, long double yMax, int windowHeight, int windowWidth){
  CalcLangPixel** display = initializeDisplay(windowHeight, windowWidth);

  for(int y = 0; y < windowHeight; y++){
    for(int x = 0; x < windowWidth; x++){
      display[y][x].x = xMin + (xSteps * x);
      display[y][x].y = yMax - (ySteps * y);
    }
  }

  return display;
}

char yCompress(long double num, long double pixel, long double range){
  char *table = "_,.-~*'`";

  // splits the pixel's height by 1/8
  long double steps = range/8;

  long double goal = num - (pixel - (range/2));
  int counter = 0;
  long double step = 0;
  while(step < goal) {
      step += steps;
      counter++;
  }
  return table[counter - 1];
}

void printPlane(CalcLangPixel** display, int windowHeight, int windowWidth){
  char** output = malloc(sizeof(char*) * windowHeight + 1);
  for(int i = 0; i < windowHeight; i++){
    output[i] = malloc(sizeof(char) * windowWidth + 1);
  }

  for(int y = 0; y < windowHeight; y++) {
    for(int x = 0; x < windowWidth; x++)
      output[y][x] = display[y][x].display;
    output[y][windowWidth] = '\0';
  }

  for(int y = 0; y < windowHeight; y++)
    puts(output[y]);
}

long double calcLangValueFuncWrapper(LLVMIntArena* arena, CalcLangValue* (*valFunc)(LLVMIntArena*, CalcLangValue*), long double val){
  CalcLangValue* cVal = arenaAlloc(arena, sizeof(CalcLangValue));
  cVal->valType = IS_INT;
  cVal->valData.integer = (int)val;
  CalcLangValue* res = valFunc(arena, cVal);
  if(res->valType == IS_INT)
    return (long double)(res->valData.integer);
  else {
    perror("Error expected integer type from graphed function");
    return -1.0;
  }
}

void shadeGraph(CalcLangPixel** display, CalcLangValue* (*dataFunc)(LLVMIntArena*,CalcLangValue*), LLVMIntArena* arena, long double xSteps, long double ySteps, long double leftBound, long double rightBound, int windowHeight, int windowWidth){
  long double relX, relY;

  for(int y = 0; y < windowHeight; y++){
    for(int x = 0; x < windowWidth; x++){
      CalcLangPixel* pixel = &(display[y][x]);

      relX = pixel->x;
      relY = pixel->y;

      long double output = calcLangValueFuncWrapper(arena, dataFunc, relX);
      if(closeTo(output, relY, ySteps/2.1))
	pixel->display = yCompress(output, relY, ySteps);
      else if(((output < 0) ? (relY < ySteps/2 && relY > output) : (relY > -ySteps/2 && relY < output)) && (relX > leftBound && relX < rightBound))
	pixel->display = '#';
    }
  }
}

void drawLine(CalcLangPixel** display, CalcLangValue* (*dataFunc)(LLVMIntArena*,CalcLangValue*), LLVMIntArena* arena, long double xSteps, long double ySteps, int windowHeight, int windowWidth){
  long double relX, relY;

    for(int y = 0; y < windowHeight; y++) {
        for(int x = 0; x < windowWidth ; x++) {
	    CalcLangPixel* pixel = &(display[y][x]);
            relX = pixel->x;
            relY = pixel->y;

            long double output = calcLangValueFuncWrapper(arena, dataFunc, relX);
	    arenaReset(arena);
            if(closeTo(output, relY, ySteps/2.1))
	      pixel->display = yCompress(output, relY, ySteps);
        }
    }
}

void printDisplayCordinates(CalcLangPixel** display, int windowHeight, int windowWidth){
  for(int y = 0; y < windowHeight; y++){
    printf("{");
    for(int x = 0; x < windowWidth; x++){
      printf("(%Lf,%Lf)", display[y][x].x, display[y][x].y);
    }
    printf("}\n");
  }
}

void drawPlane(CalcLangPixel** display, long double xSteps, long double ySteps, int windowHeight, int windowWidth){
  long double relX, relY;
    for(int y = 0; y < windowHeight; y++) {
        for(int x = 0; x < windowWidth; x++) {
	    CalcLangPixel* pixel = &(display[y][x]);
            relX = pixel->x;
            relY = pixel->y;

            bool xZero = closeTo(relX, 0, xSteps/2.1);
            bool yZero = closeTo(relY, 0, ySteps/2.1);
            bool origin = xZero && yZero;

            if(origin)
                pixel -> display = '+';
            else if(xZero)
                pixel -> display = '|';
            else if(yZero)
                pixel -> display = '-';
            else
                pixel -> display = ' ';
        }
    }
}

void clearDisplay(CalcLangPixel** display, int windowHeight){
  for(int i = 0; i < windowHeight; i++){
    free(display[i]);
  }
  free(display);
}

long double findYMax(LLVMIntArena* arena, int begin, int end, int byAmount, CalcLangValue* (*valFunc)(LLVMIntArena* arena, CalcLangValue*)){
  if(begin >= end)
    return 0;

  long double yMax = calcLangValueFuncWrapper(arena, valFunc, begin);
  for(int i = begin + 1; i <= end; i+=byAmount){
    long double toRet = calcLangValueFuncWrapper(arena, valFunc, i);
    arenaReset(arena);
    if(toRet > yMax){
      yMax = toRet;
    }
  }
  return yMax;
}

bool drawGraph(LLVMIntArena* arena, int begin, int end, int byAmount, CalcLangValue* (*valFunc)(LLVMIntArena* arena, CalcLangValue*)){
  struct winsize w;
  // Use ioctl to get the window size information
  // STDOUT_FILENO represents the standard output file descriptor
  if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == -1) {
      perror("ioctl failed");
      return false;
  }

  long double yMax = findYMax(arena, begin, end, byAmount, valFunc);
  CalcLangPixel** display = quantifyPlane(((end - begin) / w.ws_col), (yMax / w.ws_row), begin, yMax, w.ws_row, w.ws_col);
  //printDisplayCordinates(display, w.ws_row, w.ws_col);
  drawPlane(display, ((end - begin) / w.ws_col), (yMax / w.ws_row), w.ws_row, w.ws_col);
  drawLine(display, valFunc, arena, ((end - begin) / w.ws_col), (yMax / w.ws_row), w.ws_row, w.ws_col);
  shadeGraph(display, valFunc, arena, ((end - begin) / w.ws_col), (yMax / w.ws_row), begin, end, w.ws_row, w.ws_col);
  printPlane(display, w.ws_row, w.ws_col);
  clearDisplay(display, w.ws_row);
  return true;
}
