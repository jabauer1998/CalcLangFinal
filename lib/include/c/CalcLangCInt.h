#ifndef LINK_TO_CALC_LANG
#define LINK_TO_CALC_LANG

#include "CalcLangCIntArena.h"
#include <stdbool.h>

#define IS_INT 0
#define IS_REAL 1
#define IS_DOLLAR 2
#define IS_PERCENT 3
#define IS_BOOL 4
#define IS_SET 5
#define IS_TUPLE 6

struct CalcLangVal;

typedef struct{
  int size;
  struct CalcLangVal** list;
} TupleValue;

typedef struct{
  int size;
  struct CalcLangVal** list;
} SetValue;

typedef union CalcLangValData{
  TupleValue* tuple;
  SetValue* set;
  int integer;
  long double real;
  long double dollar;
  long double percent;
  bool boolean;
} CalcLangValueData;

typedef struct CalcLangVal{
  int valType;
  CalcLangValueData valData;
} CalcLangValue;

CalcLangValue* addCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* subCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* multCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* divCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* powCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* dotProductCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* equalsCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* lessThenCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* greaterThenCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* lessThenOrEqualToCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* greaterThenOrEqualToCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right);
CalcLangValue* notCalcLangValues(LLVMIntArena* arena, CalcLangValue* value);
CalcLangValue* negateCalcLangValue(LLVMIntArena* arena, CalcLangValue* value);
CalcLangValue* integerCalcLangValue(LLVMIntArena* arena, int input);
CalcLangValue* realCalcLangValue(LLVMIntArena* arena, long double input);
CalcLangValue* dollarCalcLangValue(LLVMIntArena* arena, long double input);
CalcLangValue* percentCalcLangValue(LLVMIntArena* arena, long double percent);
CalcLangValue* tupleCalcLangValue(LLVMIntArena* arena, CalcLangValue**values, int size);
CalcLangValue* setCalcLangValue(LLVMIntArena* arena, CalcLangValue**values, int size);
CalcLangValue* sinCalcLangValue(LLVMIntArena* arena, CalcLangValue* input);
CalcLangValue* cosCalcLangValue(LLVMIntArena* arena, CalcLangValue* input);
CalcLangValue* tanCalcLangValue(LLVMIntArena* arena, CalcLangValue* input);
CalcLangValue* getElementFromCalcLangValue(LLVMIntArena* arena, int index, CalcLangValue* input);
CalcLangValue* getLengthFromCalcLangValue(LLVMIntArena* arena, CalcLangValue* input);
bool toBool(CalcLangValue* val);
void printValue(CalcLangValue* val);
CalcLangValue* copyValue(CalcLangValue* val);
void freeCalcLangValue(CalcLangValue* val);
void printString(char* str);
void getInput();

#endif
