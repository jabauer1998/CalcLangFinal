#include "LinkToCalcLang.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>

void freeCalcLangValue(CalcLangValue* val);
CalcLangValue* copyValue(CalcLangValue* val);
const char* header = "Click Enter to view next line of text\n";

CalcLangValue* integerCalcLangValue(int myInt){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_INT;
  toRet->valData.integer = myInt;
  return toRet;
}

CalcLangValue* booleanCalcLangValue(int val){
  CalcLangValue* toBool = malloc(sizeof(CalcLangValue));
  toBool->valType = IS_BOOL;
  toBool->valData.boolean = val;
  return toBool;
}

CalcLangValue* realCalcLangValue(float myReal){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_REAL;
  toRet->valData.real = (double)myReal;
  return toRet;
}

CalcLangValue* dollarCalcLangValue(float myDollar){
  CalcLangValue* toRet = malloc(sizeof(CalcLangValue));
  toRet->valType = IS_DOLLAR;
  toRet->valData.dollar = myDollar;
  return toRet;
}

CalcLangValue* percentCalcLangValue(float myPercent){
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

bool toBool(CalcLangValue* val){
  if(val->valType == IS_INT){
    return val->valData.integer != 0;
  } else if(val->valType == IS_REAL){
    return val->valData.real != 0.0;
  } else if(val->valType == IS_DOLLAR){
    return val->valData.dollar != 0.0;
  } else if(val->valType == IS_BOOL){
    return val->valData.boolean;
  } else if(val->valType == IS_PERCENT){
    return val->valData.percent != 0.0;
  } else {
    perror("Invalid type to transofrm into Bool found");
    return -1;
  }
}

CalcLangValue* addCalcLangValues(CalcLangValue* left, CalcLangValue* right){
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
	resultTup->list[i] = addCalcLangValues(leftTup->list[i], rightTup->list[i]);  
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
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
    freeCalcLangValue(left);
    freeCalcLangValue(right);
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(copyValue(left),  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(copyValue(left), rightTup->list[i]);  
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
	resultSet->list[i] = addCalcLangValues(leftSet->list[i], rightSet->list[i]);  
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
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], copyValue(right));
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(copyValue(left), rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    printf("Invalid types found for CalcLangAddition Operation");
    printf("LeftType: %d\nRightType: %d\n", left->valType, right->valType);
    fflush(stdout);
  }

  return result;
}

CalcLangValue* subCalcLangValues(CalcLangValue* left, CalcLangValue* right){
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
	resultTup->list[i] = subCalcLangValues(leftTup->list[i], rightTup->list[i]);  
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
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(copyValue(left),  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(copyValue(left), rightTup->list[i]);  
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
	resultSet->list[i] = subCalcLangValues(leftSet->list[i], rightSet->list[i]);  
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
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], copyValue(right));
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(copyValue(left), rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    printf("Invalid types found for CalcLangSubtraction Operation\n");
    printf("LeftType: %d\nRightType: %d\n", left->valType, right->valType);
    fflush(stdout);
  }

  freeCalcLangValue(left);
  freeCalcLangValue(right);

  return result;
}

CalcLangValue* multCalcLangValues(CalcLangValue* left, CalcLangValue* right){
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
	resultTup->list[i] = multCalcLangValues(leftTup->list[i], rightTup->list[i]);  
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
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(copyValue(left),  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(copyValue(left), rightTup->list[i]);  
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
	resultSet->list[i] = multCalcLangValues(leftSet->list[i], rightSet->list[i]);  
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
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], copyValue(right));
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(copyValue(left), rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }
  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}



CalcLangValue* divCalcLangValues(CalcLangValue* left, CalcLangValue* right){
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
	resultTup->list[i] = divCalcLangValues(leftTup->list[i], rightTup->list[i]);  
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
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(copyValue(left),  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(copyValue(left), rightTup->list[i]);  
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
	resultSet->list[i] = divCalcLangValues(leftSet->list[i], rightSet->list[i]);  
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
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], copyValue(right));
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(copyValue(left), rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* powCalcLangValues(CalcLangValue* left, CalcLangValue* right){
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
	resultTup->list[i] = multCalcLangValues(leftTup->list[i], rightTup->list[i]);  
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
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(copyValue(left), rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(copyValue(left),  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(leftTup->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = malloc(sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = malloc(sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(copyValue(left), rightTup->list[i]);  
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
	resultSet->list[i] = powCalcLangValues(leftSet->list[i], rightSet->list[i]);  
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
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], copyValue(right));
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(copyValue(left), rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(leftSet->list[i], copyValue(right));  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = malloc(sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = malloc(sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(copyValue(left), rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* dotProductVals(CalcLangValue* left, CalcLangValue* right){
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
	CalcLangValue* multResult = multCalcLangValues(leftTupVal, rightTupVal);
	total = addCalcLangValues(total, multResult);
      }

      return total;
    } else {
      perror("Mismatched tup for size");
    }
  } else {
    perror("Invalid type for dot product expected Tuple and Tuple");
  }

  freeCalcLangValue(left);
  freeCalcLangValue(right);
  
  return NULL;
}

CalcLangValue* equalsCalcLangValues(CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_BOOL && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.boolean == right->valData.boolean;
  } else if(left->valType == IS_BOOL && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.boolean == right->valData.integer;
  } else if(left->valType == IS_INT && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.integer == right->valData.boolean;
  } else if(left->valType == IS_BOOL && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.boolean == right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.real == right->valData.boolean;
  } else if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.integer == right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.real == right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.boolean = ((double)(left->valData.integer)) == right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.real == ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.dollar == right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_BOOL;
    result->valData.boolean = left->valData.percent == right->valData.percent; 
  } else if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(rightTup->size == leftTup->size){
      int boolResult = 1;
      for(int i = 0; i < leftTup->size; i++){
	CalcLangValue* val  = equalsCalcLangValues(leftTup->list[i], rightTup->list[i]);
	if(val->valType == IS_BOOL){
	  if(val->valData.boolean == 0){
	    boolResult = 0;
	    break;
	  }
	}
      }
      result->valType = IS_BOOL;
      result->valData.boolean = boolResult;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      int boolResult = 1;
      for(int i = 0; i < leftSet->size; i++){
	CalcLangValue* val = equalsCalcLangValues(leftSet->list[i], rightSet->list[i]);
	if(val->valType == IS_BOOL){
	  if(val->valData.boolean == 0){
	    boolResult = 0;
	    break;
	  }
	}
      }
      result->valType = IS_BOOL;
      result->valData.boolean = boolResult;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
    return NULL;
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* lessThenCalcLangValues(CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.boolean = left->valData.integer < right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real < right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.boolean = ((double)(left->valData.integer)) < right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.boolean = left->valData.real < ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.boolean = left->valData.dollar < right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.boolean = left->valData.percent < right->valData.percent; 
  } else {
      perror("Invalid types found for CalcLangAddition Operation");
      return NULL;
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* greaterThenCalcLangValues(CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.boolean = left->valData.integer > right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real > right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) > right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.boolean = left->valData.real > ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar > right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent > right->valData.percent; 
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* lessThenOrEqualToCalcLangValues(CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.boolean = left->valData.integer <= right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real <= right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) <= right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.boolean = left->valData.real <= ((double)(right->valData.integer));
  } else if(left->valType == IS_DOLLAR && right->valType == IS_DOLLAR){
    result->valType = IS_DOLLAR;
    result->valData.dollar = left->valData.dollar <= right->valData.dollar;
  } else if(left->valType == IS_PERCENT && right->valType == IS_PERCENT){
    result->valType = IS_PERCENT;
    result->valData.percent = left->valData.percent <= right->valData.percent; 
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  
    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* greaterThenOrEqualToCalcLangValues(CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(left->valType == IS_INT && right->valType == IS_INT){
    result->valType = IS_INT;
    result->valData.boolean = left->valData.integer >= right->valData.integer;
  } else if(left->valType == IS_REAL && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = left->valData.real >= right->valData.real;
  } else if(left->valType == IS_INT && right->valType == IS_REAL){
    result->valType = IS_REAL;
    result->valData.real = ((double)(left->valData.integer)) >= right->valData.real;
  } else if(left->valType == IS_REAL && right->valType == IS_INT){
    result->valType = IS_REAL;
    result->valData.boolean = left->valData.real >= ((double)(right->valData.integer));
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

    freeCalcLangValue(left);
  
    freeCalcLangValue(right);

  return result;
}

CalcLangValue* notCalcLangValue(CalcLangValue* toNot){
  if(toNot == NULL)
    return NULL;
  CalcLangValue* result = malloc(sizeof(CalcLangValue));
  if(toNot->valType == IS_INT){
    result->valType = IS_BOOL;
    result->valData.boolean = toNot->valData.integer != 0;
  } else if(toNot->valType == IS_REAL){
    result->valType = IS_BOOL;
    result->valData.boolean = toNot->valData.real != 0;
  } else if(toNot->valType == IS_BOOL){
    result->valType = IS_BOOL;
    result->valData.boolean = !(toNot->valData.boolean);
  } else if(toNot->valType == IS_TUPLE){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.tuple = malloc(sizeof(TupleValue));
    result->valData.tuple->size = toNot->valData.tuple->size;
    result->valData.tuple->list = malloc(sizeof(CalcLangValue*) * result->valData.tuple->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.tuple->list[i] = notCalcLangValue(toNot->valData.tuple->list[i]);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.set = malloc(sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = malloc(sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = notCalcLangValue(toNot->valData.set->list[i]);
    }
    result->valType = IS_SET;
    return result;
  } else {
    perror("Invalid type for not operation");
  }

  freeCalcLangValue(toNot);

  return result;
}

CalcLangValue* negateCalcLangValue(CalcLangValue* toNot){
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
      result->valData.tuple->list[i] = negateCalcLangValue(toNot->valData.tuple->list[i]);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = malloc(sizeof(CalcLangValue));
    result->valData.set = malloc(sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = malloc(sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = negateCalcLangValue(toNot->valData.set->list[i]);
    }
    result->valType = IS_SET;
    return result;
  } else {
    perror("Invalid type for negate operation");
  }

  freeCalcLangValue(toNot);

  return result;
}

void printValue(CalcLangValue* val){
  if(val == NULL){
    printf("NULL");
  } else if(val->valType == IS_BOOL){
    if(val->valData.boolean){
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

CalcLangValue* copyValue(CalcLangValue* val){
  if(val == NULL)
    return NULL;

  if(val->valType == IS_TUPLE){
    CalcLangValue* newVal = malloc(sizeof(CalcLangValue));
    newVal->valType = IS_TUPLE;
    newVal->valData.tuple = malloc(sizeof(TupleValue));
    newVal->valData.tuple->size = val->valData.tuple->size;
    newVal->valData.tuple->list = malloc(sizeof(CalcLangValue*) * val->valData.tuple->size);
    for(int i = 0; i < newVal->valData.set->size; i++){
      newVal->valData.tuple->list[i] = copyValue(val->valData.tuple->list[i]);
    }
    return newVal;
  } else if(val->valType == IS_SET){
    CalcLangValue* newVal = malloc(sizeof(CalcLangValue));
    newVal->valType = IS_SET;
    newVal->valData.set = malloc(sizeof(SetValue));
    newVal->valData.set->size = val->valData.set->size;
    newVal->valData.set->list = malloc(sizeof(CalcLangValue*) * val->valData.set->size);
    for(int i = 0; i < newVal->valData.set->size; i++){
      newVal->valData.set->list[i] = copyValue(val->valData.set->list[i]);
    }
    return newVal;
  } else {
    int size = sizeof(CalcLangValue);
    CalcLangValue* newVal = malloc(size);
    memcpy(newVal, val, size);

    return newVal;
  }
}

void freeCalcLangValue(CalcLangValue* val){
  if(val != NULL){
    if(val->valType == IS_TUPLE){
      TupleValue* tup = val->valData.tuple;
      for(int i = 0; i < tup->size; i++){
	freeCalcLangValue(tup->list[i]);
      }
      free(tup);
    } else if(val->valType == IS_SET){
      SetValue* set = val->valData.set;
      for(int i = 0; i < set->size; i++){
	freeCalcLangValue(set->list[i]);
      }
      free(set);
    }
    free(val);
  }
}

void printString(char* str){
  printf("%s\n", str);
  fflush(stdout);
}

void getInput(){
  while(1){
    char c = getchar();
    if(c == '\n'){
      break;
    }
  }
}

