#include "LinkToCalcLang.h"
#include "CalcLangCIntArena.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>

CalcLangValue* integerCalcLangValue(LLVMIntArena* arena, int myInt){
  CalcLangValue* toRet = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
  toRet->valType = IS_INT;
  toRet->valData.integer = myInt;
  return toRet;
}

CalcLangValue* booleanCalcLangValue(LLVMIntArena* arena, int val){
  CalcLangValue* toBool = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
  toBool->valType = IS_BOOL;
  toBool->valData.boolean = val;
  return toBool;
}

CalcLangValue* realCalcLangValue(LLVMIntArena* arena, float myReal){
  CalcLangValue* toRet = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
  toRet->valType = IS_REAL;
  toRet->valData.real = (double)myReal;
  return toRet;
}

CalcLangValue* dollarCalcLangValue(LLVMIntArena* arena, float myDollar){
  CalcLangValue* toRet = arenaAlloc(arena, sizeof(CalcLangValue));
  toRet->valType = IS_DOLLAR;
  toRet->valData.dollar = myDollar;
  return toRet;
}

CalcLangValue* percentCalcLangValue(LLVMIntArena* arena, float myPercent){
  CalcLangValue* toRet = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
  toRet->valType = IS_PERCENT;
  toRet->valData.dollar = myPercent;
  return toRet;
}

CalcLangValue* setCalcLangValue(LLVMIntArena* arena, CalcLangValue** value, int size){
  CalcLangValue* toRet = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue)); 
  toRet->valType = IS_SET;
  toRet->valData.set = arenaAlloc(arena, sizeof(SetValue));
  toRet->valData.set->size = size;
  toRet->valData.set->list = arenaAlloc(arena, sizeof(CalcLangValue*) * size);
  for(int i = 0; i < size; i++){
    toRet->valData.set->list[i] = value[i];
  }
  return toRet;
}

CalcLangValue* tupleCalcLangValue(LLVMIntArena* arena, CalcLangValue** value, int size){
  CalcLangValue* toRet = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
  toRet->valType = IS_TUPLE;
  toRet->valData.tuple = (TupleValue*)arenaAlloc(arena, sizeof(TupleValue));
  toRet->valData.tuple->size = size;
  toRet->valData.tuple->list = arenaAlloc(arena, sizeof(CalcLangValue*) * size);
  for(int i = 0; i < size; i++){
    toRet->valData.tuple->list[i] = value[i];
  }
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
CalcLangValue* addCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
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
      TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = addCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, left,  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = (TupleValue*)arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = (TupleValue*)arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = addCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = addCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = (SetValue*)arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, leftSet->list[i], right);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = (SetValue*)arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = (SetValue*)arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, left, rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = (SetValue*)arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = addCalcLangValues(arena, left, rightSet->list[i]);  
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

CalcLangValue* subCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
      TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = subCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = (CalcLangValue**)arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, left,  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = subCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = arenaAlloc(arena, sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = subCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, leftSet->list[i], right);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, left, rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = subCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    printf("Invalid types found for CalcLangSubtraction Operation\n");
    printf("LeftType: %d\nRightType: %d\n", left->valType, right->valType);
    fflush(stdout);
  }

  return result;
}

CalcLangValue* multCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
      TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, left,  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = multCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = arenaAlloc(arena, sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = multCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, leftSet->list[i], right);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, left, rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = multCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  return result;
}



CalcLangValue* divCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
      TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = divCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, left,  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = divCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = arenaAlloc(arena, sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = divCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, leftSet->list[i], right);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, left, rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = divCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  return result;
}

CalcLangValue* powCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = (CalcLangValue*)arenaAlloc(arena, sizeof(CalcLangValue));
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
      TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
      resultTup->size = leftTup->size;
      resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
      for(int i = 0; i < leftTup->size; i++){
	resultTup->list[i] = multCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);  
      }
      result->valType = IS_TUPLE;
      result->valData.tuple = resultTup;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_TUPLE && right->valType == IS_INT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_INT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_REAL){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_REAL && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_DOLLAR){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, left,  rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_TUPLE && right->valType == IS_PERCENT){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = leftTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < leftTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, leftTup->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_PERCENT && right->valType == IS_TUPLE){
    TupleValue* rightTup = right->valData.tuple;
    TupleValue* resultTup = arenaAlloc(arena, sizeof(TupleValue));
    resultTup->size = rightTup->size;
    resultTup->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultTup->size);
    for(int i = 0; i < rightTup->size; i++){
      resultTup->list[i] = powCalcLangValues(arena, left, rightTup->list[i]);  
    }
    result->valType = IS_TUPLE;
    result->valData.tuple = resultTup;
  } else if(left->valType == IS_SET && right->valType == IS_SET){
    SetValue* leftSet = left->valData.set;
    SetValue* rightSet = right->valData.set;
    if(rightSet->size == leftSet->size){
      SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
      resultSet->size = leftSet->size;
      resultSet->list = arenaAlloc(arena, sizeof(SetValue*) * resultSet->size);
      for(int i = 0; i < leftSet->size; i++){
	resultSet->list[i] = powCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);  
      }
      result->valType = IS_SET;
      result->valData.set = resultSet;
    } else {
      perror("Error Tuple sizes in expression do not match!!!");
      return NULL;
    }
  } else if(left->valType == IS_SET && right->valType == IS_INT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, leftSet->list[i], right);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_INT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_REAL){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_TUPLE;
    result->valData.set = resultSet;
  } else if(left->valType == IS_REAL && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_DOLLAR){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_DOLLAR && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, left, rightSet->list[i]);
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_SET && right->valType == IS_PERCENT){
    SetValue* leftSet = left->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = leftSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < leftSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, leftSet->list[i], right);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else if(left->valType == IS_PERCENT && right->valType == IS_SET){
    SetValue* rightSet = right->valData.set;
    SetValue* resultSet = arenaAlloc(arena, sizeof(SetValue));
    resultSet->size = rightSet->size;
    resultSet->list = arenaAlloc(arena, sizeof(CalcLangValue*) * resultSet->size);
    for(int i = 0; i < rightSet->size; i++){
      resultSet->list[i] = powCalcLangValues(arena, left, rightSet->list[i]);  
    }
    result->valType = IS_SET;
    result->valData.set = resultSet;
  } else {
    perror("Invalid types found for CalcLangAddition Operation");
  }

  return result;
}

CalcLangValue* dotProductVals(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  if(left->valType == IS_TUPLE && right->valType == IS_TUPLE){
    TupleValue* leftTup = left->valData.tuple;
    TupleValue* rightTup = right->valData.tuple;
    if(leftTup->size == rightTup->size){
      CalcLangValue* total = integerCalcLangValue(arena, 0);
      for(int i = 0; i < leftTup->size; i++){
	CalcLangValue* leftTupVal = leftTup->list[i];
	CalcLangValue* rightTupVal = rightTup->list[i];
	CalcLangValue* multResult = multCalcLangValues(arena, leftTupVal, rightTupVal);
	total = addCalcLangValues(arena, total, multResult);
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

CalcLangValue* equalsCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
	CalcLangValue* val  = equalsCalcLangValues(arena, leftTup->list[i], rightTup->list[i]);
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
	CalcLangValue* val = equalsCalcLangValues(arena, leftSet->list[i], rightSet->list[i]);
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

  return result;
}

CalcLangValue* lessThenCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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

  return result;
}

CalcLangValue* greaterThenCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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

  return result;
}

CalcLangValue* lessThenOrEqualToCalcLangValues(LLVMIntArena* arena, CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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

  return result;
}

CalcLangValue* greaterThenOrEqualToCalcLangValues(LLVMIntArena* arena,  CalcLangValue* left, CalcLangValue* right){
  if(left == NULL || right == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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

  return result;
}

CalcLangValue* notCalcLangValue(LLVMIntArena* arena, CalcLangValue* toNot){
  if(toNot == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
    CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
    result->valData.tuple = arenaAlloc(arena, sizeof(TupleValue));
    result->valData.tuple->size = toNot->valData.tuple->size;
    result->valData.tuple->list = arenaAlloc(arena, sizeof(CalcLangValue*) * result->valData.tuple->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.tuple->list[i] = notCalcLangValue(arena, toNot->valData.tuple->list[i]);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
    result->valData.set = arenaAlloc(arena, sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = arenaAlloc(arena, sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = notCalcLangValue(arena, toNot->valData.set->list[i]);
    }
    result->valType = IS_SET;
    return result;
  } else {
    perror("Invalid type for not operation");
  }

  //freeCalcLangValue(toNot);

  return result;
}

CalcLangValue* negateCalcLangValue(LLVMIntArena* arena, CalcLangValue* toNot){
  if(toNot == NULL)
    return NULL;
  CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
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
    CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
    result->valData.tuple = arenaAlloc(arena, sizeof(TupleValue));
    result->valData.tuple->size = toNot->valData.tuple->size;
    result->valData.tuple->list = arenaAlloc(arena, sizeof(CalcLangValue*) * result->valData.tuple->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.tuple->list[i] = negateCalcLangValue(arena, toNot->valData.tuple->list[i]);
    }
    result->valType = IS_TUPLE;
    return result;
  } else if(toNot->valType == IS_SET){
    CalcLangValue* result = arenaAlloc(arena, sizeof(CalcLangValue));
    result->valData.set = arenaAlloc(arena, sizeof(SetValue));
    result->valData.set->size = toNot->valData.set->size;
    result->valData.set->list = arenaAlloc(arena, sizeof(CalcLangValue*) * result->valData.set->size);
    for(int i = 0; i < result->valData.tuple->size; i++){
      result->valData.set->list[i] = negateCalcLangValue(arena, toNot->valData.set->list[i]);
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
    printf("Cant print type for specified CalcLangValue!!!");
    printf("ValType is %d", val->valType);
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

