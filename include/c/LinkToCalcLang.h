#ifndef LINK_TO_CALC_LANG
#define LINK_TO_CALC_LANG

#define TRUE 1
#define FALSE 0

#define IS_INT 0
#define IS_REAL 1
#define IS_DOLLAR 3
#define IS_PERCENT 4
#define IS_BOOL 5
#define IS_SET 6
#define IS_TUPLE 7

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
  double real;
  double dollar;
  double percent;
  int bool;
} CalcLangValueData;

typedef struct CalcLangVal{
  int valType;
  CalcLangValueData valData;
} CalcLangValue;

CalcLangValue* addCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* subCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* multCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* divCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* powCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* dotProductCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* equalsCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* lessThenCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* greaterThenCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* lessThenOrEqualToCalcLangValue(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* greaterThenOrEqualToCalcLangValue(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight);
CalcLangValue* notCalcLangValue(CalcLangValue* value, int freeRight);
CalcLangValue* negateCalcLangValue(CalcLangValue* value, int freeRight);
CalcLangValue* integerCalcLangValue(int input);
CalcLangValue* realCalcLangValue(double input);
CalcLangValue* dollarCalcLangValue(double input);
CalcLangValue* percentCalcLangValue(double percent);
CalcLangValue* tupleCalcLangValue(CalcLangValue**values, int size);
CalcLangValue* setCalcLangValue(CalcLangValue**values, int size);
void printValue(CalcLangValue* calcLang);

#endif
