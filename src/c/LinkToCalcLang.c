#include "LinkToCalcLang.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

void freeCalcLangValue(CalcLangValue* val);

CalcLangValue* integerCalcLangValue(int myInt){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_INT;
  toRet->valData.integer = myInt;
  return toRet;
}

CalcLangValue* booleanCalcLangValue(int val){
  CalcLangValue* toBool = malloc(sizeof(CalcLangValue));
  toBool->valType = IS_BOOL;
  toBool->valData.bool = val;
  return toBool;
}

CalcLangValue* realCalcLangValue(double myReal){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_REAL;
  toRet->valData.real = myReal;
  return toRet;
}

CalcLangValue* dollarCalcLangValue(double myDollar){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_DOLLAR;
  toRet->valData.dollar = myDollar;
  return toRet;
}

CalcLangValue* percentCalcLangValue(double myPercent){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_PERCENT;
  toRet->valData.dollar = myPercent;
  return toRet;
}

CalcLangValue* setCalcLangValue(CalcLangValue** value, int size){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue)); 
  toRet->valType = IS_SET;
  toRet->valData.set = malloc(sizeof(SetValue));
  toRet->valData.set->size = size;
  toRet->valData.set->list = value;
  return toRet;
}

CalcLangValue* tupleCalcLangValue(CalcLangValue** value, int size){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_TUPLE;
  toRet->valData.set = malloc(sizeof(TupleValue));
  toRet->valData.set->size = size;
  toRet->valData.set->list = value;
  return toRet;
}

CalcLangValue* addCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
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
  if(left == NULL || right == NULL)
    return NULL;
  
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
  if(left == NULL || right == NULL)
    return NULL;
  
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
    result->valData.percent = left->valData.percent * right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.integer * right->valData.percent;
  } else if(left->valType == IS_REAL && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.real * right->valData.percent;
  } else if(left->valType == IS_PERCENT && right->valType == IS_REAL){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent * right->valData.real;
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



CalcLangValue* divCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) / ((double)(right->valData.integer));
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real / right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) / right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real / ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_INT){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar / right->valData.integer;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_REAL;
    result->valData.dollar = left->valData.dollar / right->valData.dollar;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_REAL){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar / right->valData.real;
  } else if(left->valType == IS_PERCENT && right->valType == IS_INT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent / right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.integer / right->valData.percent;
  } else if(left->valType == IS_REAL && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.real / right->valData.percent;
  } else if(left->valType == IS_PERCENT && right->valType == IS_REAL){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent / right->valData.real;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent / right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      TupleValue* resultTup = malloc(sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = divCalcLangValues(leftTup->list[i], TRUE, rightTup->list[i], FALSE);  
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
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(left, FALSE,  rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
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
	resultSet->list[i] = divCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);  
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
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], TRUE, right, FALSE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(left, FALSE, rightSet->list[i], TRUE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
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

CalcLangValue* powCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.integer = (int)pow((double)(left->valData.integer),(double)(right->valData.integer));
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = pow(left->valData.real, right->valData.real);
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = pow(((double)(left->valData.integer)), right->valData.real);
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.real = pow(left->valData.real, ((double)(right->valData.integer)));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_INT){
    result->valType = IS_DOLLAR;
    result->valData.dollar = pow(left->valData.dollar, ((double)right->valData.integer));
  } else if(left->valType == IS_INT && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = pow((double)(left->valData.integer), right->valData.dollar);
  } else if(left->valType == IS_REAL && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = pow(left->valData.real, right->valData.dollar);
  } else if(left->valType == IS_DOLLAR && right->valType == IS_REAL){
    result->valType = IS_DOLLAR;
    result->valData.dollar = pow(left->valData.dollar, right->valData.real);
  } else if(left->valType == IS_PERCENT && right->valType == IS_INT){
    result->valType = IS_PERCENT;
    result->valData.percent = pow(left->valData.percent, (double)(right->valData.integer));
  } else if(left->valType == IS_INT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = pow((double)(left->valData.integer), right->valData.percent);
  } else if(left->valType == IS_REAL && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = pow(left->valData.real,  right->valData.percent);
  } else if(left->valType == IS_PERCENT && right->valType == IS_REAL){
    result->valType = IS_PERCENT;
    result->valData.percent = pow(left->valData.percent, right->valData.real);
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = pow(left->valData.percent,  right->valData.percent); 
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
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(left, FALSE,  rightTup->list[i], TRUE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(left, FALSE, rightTup->list[i], TRUE);  
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
	resultSet->list[i] = powCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);  
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
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], TRUE, right, FALSE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(left, FALSE, rightSet->list[i], TRUE);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], TRUE, right, FALSE);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(left, FALSE, rightSet->list[i], TRUE);  
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

CalcLangValue* dotProductVals(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(leftTup->size == rightTup->size){
      CalcLangValue* total = integerCalcLangValue(0);
      for(int i = 0; i < leftTup->size; i++){
	CalcLangValue* leftTupVal = leftTup->list[i];
	CalcLangValue* rightTupVal = rightTup->list[i];
	CalcLangValue* multResult = multCalcLangValues(leftTupVal, FALSE, rightTupVal, FALSE);
	total = addCalcLangValues(total, TRUE, multResult, TRUE);
      }

      return total;
    } else {
      perror("Mismatched tup for size");
    }
  } else {
    perror("Invalid type for dot product expected Tuple and Tuple");
  }
  return NULL;
}

CalcLangValue* equalsCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_BOOL && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.bool == right->valData.bool;
  } else if(left->valType == IS_BOOL && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.bool == right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.integer == right->valData.bool;
  } else if(left->valType == IS_BOOL && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.bool == right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.real == right->valData.bool;
  } else if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.integer == right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.real == right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.bool = ((double)(left->valData.integer)) == right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.real == ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.dollar == right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_BOOL;
    result->valData.bool = left->valData.percent == right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      int boolResult = TRUE;
      for(int i = 0; i < leftTup->size; i++){
	CalcLangValue* val  = equalsCalcLangValues(leftTup->list[i], TRUE, rightTup->list[i], FALSE);
	if(val->valType == IS_BOOL){
	  if(val->valData.bool == FALSE){
	    boolResult = FALSE;
	    break;
	  }
	}
      }
      result->valType = IS_BOOL;
      result->valData.bool = boolResult;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      int boolResult = TRUE;
      for(int i = 0; i < leftSet->size; i++){
	CalcLangValue* val = equalsCalcLangValues(leftSet->list[i], TRUE, rightSet->list[i], TRUE);
	if(val->valType == IS_BOOL){
	  if(val->valData.bool == FALSE){
	    boolResult = FALSE;
	    break;
	  }
	}
      }
      result->valType = IS_BOOL;
      result->valData.bool = boolResult;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
    return NULL;
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* lessThenCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.bool = left->valData.integer < right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real < right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.bool = ((double)(left->valData.integer)) < right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.bool = left->valData.real < ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.bool = left->valData.dollar < right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.bool = left->valData.percent < right->valData.percent; 
  } else {
      perror("Invalid types found for CalcLangAddition Operation");
      return NULL;
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* greaterThenCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.bool = left->valData.integer > right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real > right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) > right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.bool = left->valData.real > ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar > right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent > right->valData.percent; 
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* lessThenOrEqualToCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.bool = left->valData.integer <= right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real <= right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) <= right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.bool = left->valData.real <= ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar <= right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent <= right->valData.percent; 
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* greaterThenOrEqualToCalcLangValues(CalcLangValue* left, int freeLeft, CalcLangValue* right, int freeRight){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.bool = left->valData.integer >= right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real >= right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) >= right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.bool = left->valData.real >= ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar >= right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent >= right->valData.percent; 
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
    return NULL;
  }

  if(freeLeft)
    freeCalcLangValue(left);
  else if(freeRight)
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* notCalcLangValue(CalcLangValue* toNot, int freeToNeg){
  if(toNot == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(toNot->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.bool = toNot->valData.integer != 0;
  } else if(toNot->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.bool = toNot->valData.real != 0;
  } else if(toNot->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.bool = !(toNot->valData.bool);
  } else if(toNot->valType == IS_TUPLE){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.tuple = malloc(sizeof(TupleValue));
    result->valData.tuple->size = toNot->valData.tuple->size;
    result->valData.tuple->list = malloc(sizeof(CalcLangValue*) * result->valData.tuple->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.tuple->list[i] = notCalcLangValue(toNot->valData.tuple->list[i], TRUE);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.set = malloc(sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = malloc(sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = notCalcLangValue(toNot->valData.set->list[i], TRUE);
    }
    result->valType = IS_SET;
    return result;
  } else {
    perror("Invalid type for not operation");
  }

  return result;
}

CalcLangValue* negateCalcLangValue(CalcLangValue* toNot, int free){
  if(toNot == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(toNot->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.integer = -(toNot->valData.integer);
  } else if(toNot->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = -(toNot->valData.real);
  } else if(toNot->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = -(toNot->valData.dollar);
  } else if(toNot->valType == IS_PERCENT){
    result ->valType = IS_PERCENT;
    result->valData.percent = -(toNot->valData.percent);
  } else if(toNot->valType == IS_TUPLE){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.tuple = malloc(sizeof(TupleValue));
    result->valData.tuple->size = toNot->valData.tuple->size;
    result->valData.tuple->list = malloc(sizeof(CalcLangValue*) * result->valData.tuple->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.tuple->list[i] = negateCalcLangValue(toNot->valData.tuple->list[i], TRUE);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.set = malloc(sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = malloc(sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = negateCalcLangValue(toNot->valData.set->list[i], TRUE);
    }
    result->valType = IS_SET;
    return result;
  } else {
    perror("Invalid type for negate operation");
  }

  return result;
}

void printValue(CalcLangValue* val){
  if(val == NULL){
    printf("NULL");
  } else if(val->valType == IS_BOOL){
    if(val->valData.bool){
      printf("TRUE");
    } else {
      printf("FALSE");
    }
  } else if(val->valType == IS_INT){
    printf("%d", val->valData.integer);
  } else if(val->valType == IS_REAL){
    printf("%f", val->valData.real);
  } else if(val->valType == IS_DOLLAR){
    printf("$%f", val->valData.dollar);
  } else if(val->valType == IS_PERCENT){
    printf("%f%%", val->valData.percent);
  } else if(val->valType == IS_TUPLE){
    printf("(");
    for(int i = 0; i < val->valData.tuple->size; i++){
      if(i == 0){
	printValue(val->valData.tuple->list[i]);
      } else {
	printf(", ");
	printValue(val->valData.tuple->list[i]);
      }
    }
    printf(")");
  } else if(val->valType == IS_SET){
    printf("{");
    for(int i = 0; i < val->valData.set->size; i++){
      if(i == 0){
	printValue(val->valData.set->list[i]);
      } else {
	printf(", ");
	printValue(val->valData.set->list[i]);
      }
    }
    printf("}");
  } else {
    perror("Cant print type for specified CalcLangValue!!!");
  }
}

