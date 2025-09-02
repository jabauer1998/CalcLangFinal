#include "LinkToCalcLang.h"
#include <stdlib.h>
#include <stdio.h>

void freeCalcLangValue(CalcLangValue* val);

CalcLangValue* newIntValue(int myInt){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_INT;
  toRet->valData.integer = myInt;
  return toRet;
}

CalcLangValue* newRealValue(double myReal){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_REAL;
  toRet->valData.real = myReal;
  return toRet;
}

CalcLangValue* newDollarValue(double myDollar){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_DOLLAR;
  toRet->valData.dollar = myDollar;
  return toRet;
}

CalcLangValue* newPercentValue(double myPercent){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_PERCENT;
  toRet->valData.dollar = myPercent;
  return toRet;
}

CalcLangValue* addCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.integer = left->valData.integer + right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real + right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) + right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real + ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar + right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent + right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      TupleValue* resultTup = malloc(sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = addCalcLangValues(leftTup->list[i], TRUE, rightTup->list[i], FALSE);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(left, FALSE,  rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = malloc(sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = malloc(sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = addCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], TRUE, right, FALSE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(left, FALSE, rightSet->list[i], TRUE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* subCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.integer = left->valData.integer - right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real - right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) - right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real - ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar - right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent - right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      TupleValue* resultTup = malloc(sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = subCalcLangValues(leftTup->list[i], TRUE, rightTup->list[i], FALSE);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(left, FALSE,  rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = malloc(sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = malloc(sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = subCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], TRUE, right, FALSE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(left, FALSE, rightSet->list[i], TRUE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* multCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.integer = left->valData.integer * right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real * right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) * right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real * ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_INT){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar * right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.integer * right->valData.dollar;
  } else if(left->valType == IS_REAL && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.real * right->valData.dollar;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_REAL){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar * right->valData.real;
  } else if(left->valType == IS_PERCENT && right->valType == IS_INT){
    result->valType = IS_PERCENT;
    result->valData.dollar = left->valData.percent * right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.dollar = left->valData.integer * right->valData.percent;
  } else if(left->valType == IS_REAL && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.dollar = left->valData.real * right->valData.percent;
  } else if(left->valType == IS_PERCENT && right->valType == IS_REAL){
    result->valType = IS_PERCENT;
    result->valData.dollar = left->valData.percent * right->valData.real;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent * right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      TupleValue* resultTup = malloc(sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = multCalcLangValues(leftTup->list[i], TRUE, rightTup->list[i], FALSE);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(left, FALSE,  rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = malloc(sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = malloc(sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = multCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], TRUE, right, FALSE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(left, FALSE, rightSet->list[i], TRUE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}
