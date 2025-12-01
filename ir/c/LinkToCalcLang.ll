; ModuleID = 'src/c/LinkToCalcLang.c'
source_filename = "src/c/LinkToCalcLang.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { ptr }
%struct.SetValue = type { i32, ptr }
%struct.TupleValue = type { i32, ptr }

@.str = private unnamed_addr constant [42 x i8] c"Invalid type to transofrm into Bool found\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Error Tuple sizes in expression do not match!!!\00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Invalid types found for CalcLangAddition Operation\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"LeftType: %d\0ARightType: %d\0A\00", align 1
@stdout = external global ptr, align 8
@.str.4 = private unnamed_addr constant [55 x i8] c"Invalid types found for CalcLangSubtraction Operation\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Mismatched tup for size\00", align 1
@.str.6 = private unnamed_addr constant [54 x i8] c"Invalid type for dot product expected Tuple and Tuple\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"Invalid type for not operation\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"Invalid type for negate operation\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"TRUE\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"FALSE\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"$%f\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"%f%%\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"Cant print type for specified CalcLangValue!!!\00", align 1
@.str.22 = private unnamed_addr constant [14 x i8] c"ValType is %d\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @integerCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call ptr @arenaAlloc(ptr noundef %6, i32 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 0
  store i32 0, ptr %9, align 8
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.CalcLangVal, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  ret ptr %13
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @booleanCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call ptr @arenaAlloc(ptr noundef %6, i32 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 0
  store i32 4, ptr %9, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ne i32 %10, 0
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 1
  %14 = zext i1 %11 to i8
  store i8 %14, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  ret ptr %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @realCalcLangValue(ptr noundef %0, float noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call ptr @arenaAlloc(ptr noundef %6, i32 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 0
  store i32 1, ptr %9, align 8
  %10 = load float, ptr %4, align 4
  %11 = fpext float %10 to double
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 1
  store double %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  ret ptr %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dollarCalcLangValue(ptr noundef %0, float noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call ptr @arenaAlloc(ptr noundef %6, i32 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 0
  store i32 2, ptr %9, align 8
  %10 = load float, ptr %4, align 4
  %11 = fpext float %10 to double
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 1
  store double %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  ret ptr %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @percentCalcLangValue(ptr noundef %0, float noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call ptr @arenaAlloc(ptr noundef %6, i32 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 0
  store i32 3, ptr %9, align 8
  %10 = load float, ptr %4, align 4
  %11 = fpext float %10 to double
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 1
  store double %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  ret ptr %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @setCalcLangValue(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = call ptr @arenaAlloc(ptr noundef %9, i32 noundef 16)
  store ptr %10, ptr %7, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = getelementptr inbounds %struct.CalcLangVal, ptr %11, i32 0, i32 0
  store i32 5, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call ptr @arenaAlloc(ptr noundef %13, i32 noundef 16)
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 1
  store ptr %14, ptr %16, align 8
  %17 = load i32, ptr %6, align 4
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SetValue, ptr %20, i32 0, i32 0
  store i32 %17, ptr %21, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i64 8, %24
  %26 = trunc i64 %25 to i32
  %27 = call ptr @arenaAlloc(ptr noundef %22, i32 noundef %26)
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.SetValue, ptr %30, i32 0, i32 1
  store ptr %27, ptr %31, align 8
  store i32 0, ptr %8, align 4
  br label %32

32:                                               ; preds = %50, %3
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %53

36:                                               ; preds = %32
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds ptr, ptr %37, i64 %39
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.SetValue, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = load i32, ptr %8, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48
  store ptr %41, ptr %49, align 8
  br label %50

50:                                               ; preds = %36
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  br label %32, !llvm.loop !6

53:                                               ; preds = %32
  %54 = load ptr, ptr %7, align 8
  ret ptr %54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @tupleCalcLangValue(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = call ptr @arenaAlloc(ptr noundef %8, i32 noundef 16)
  store ptr %9, ptr %7, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 0
  store i32 6, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call ptr @arenaAlloc(ptr noundef %12, i32 noundef 16)
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 1
  store ptr %13, ptr %15, align 8
  %16 = load i32, ptr %6, align 4
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.CalcLangVal, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.SetValue, ptr %19, i32 0, i32 0
  store i32 %16, ptr %20, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SetValue, ptr %24, i32 0, i32 1
  store ptr %21, ptr %25, align 8
  %26 = load ptr, ptr %7, align 8
  ret ptr %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @toBool(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.CalcLangVal, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.CalcLangVal, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 0
  store i1 %12, ptr %2, align 1
  br label %54

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %23

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 1
  %21 = load double, ptr %20, align 8
  %22 = fcmp une double %21, 0.000000e+00
  store i1 %22, ptr %2, align 1
  br label %54

23:                                               ; preds = %13
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 2
  br i1 %27, label %28, label %33

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 1
  %31 = load double, ptr %30, align 8
  %32 = fcmp une double %31, 0.000000e+00
  store i1 %32, ptr %2, align 1
  br label %54

33:                                               ; preds = %23
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = icmp eq i32 %36, 4
  br i1 %37, label %38, label %43

38:                                               ; preds = %33
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  %41 = load i8, ptr %40, align 8
  %42 = trunc i8 %41 to i1
  store i1 %42, ptr %2, align 1
  br label %54

43:                                               ; preds = %33
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.CalcLangVal, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = icmp eq i32 %46, 3
  br i1 %47, label %48, label %53

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 1
  %51 = load double, ptr %50, align 8
  %52 = fcmp une double %51, 0.000000e+00
  store i1 %52, ptr %2, align 1
  br label %54

53:                                               ; preds = %43
  call void @perror(ptr noundef @.str) #6
  store i1 true, ptr %2, align 1
  br label %54

54:                                               ; preds = %53, %48, %38, %28, %18, %8
  %55 = load i1, ptr %2, align 1
  ret i1 %55
}

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @addCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i32, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i32, align 4
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i32, align 4
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %70, label %67

67:                                               ; preds = %3
  %68 = load ptr, ptr %7, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %67, %3
  store ptr null, ptr %4, align 8
  br label %1415

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = call ptr @arenaAlloc(ptr noundef %72, i32 noundef 16)
  store ptr %73, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %95

78:                                               ; preds = %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %95

83:                                               ; preds = %78
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 0
  store i32 0, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 8
  %92 = add nsw i32 %88, %91
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1
  store i32 %92, ptr %94, align 8
  br label %1413

95:                                               ; preds = %78, %71
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 1
  br i1 %99, label %100, label %117

100:                                              ; preds = %95
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %117

105:                                              ; preds = %100
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 0
  store i32 1, ptr %107, align 8
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = load ptr, ptr %7, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = fadd double %110, %113
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 1
  store double %114, ptr %116, align 8
  br label %1412

117:                                              ; preds = %100, %95
  %118 = load ptr, ptr %6, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %140

122:                                              ; preds = %117
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %127, label %140

127:                                              ; preds = %122
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 0
  store i32 1, ptr %129, align 8
  %130 = load ptr, ptr %6, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load i32, ptr %131, align 8
  %133 = sitofp i32 %132 to double
  %134 = load ptr, ptr %7, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load double, ptr %135, align 8
  %137 = fadd double %133, %136
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 1
  store double %137, ptr %139, align 8
  br label %1411

140:                                              ; preds = %122, %117
  %141 = load ptr, ptr %6, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  %143 = load i32, ptr %142, align 8
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %163

145:                                              ; preds = %140
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %163

150:                                              ; preds = %145
  %151 = load ptr, ptr %8, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 0
  store i32 1, ptr %152, align 8
  %153 = load ptr, ptr %6, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load i32, ptr %157, align 8
  %159 = sitofp i32 %158 to double
  %160 = fadd double %155, %159
  %161 = load ptr, ptr %8, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  store double %160, ptr %162, align 8
  br label %1410

163:                                              ; preds = %145, %140
  %164 = load ptr, ptr %6, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 0
  %166 = load i32, ptr %165, align 8
  %167 = icmp eq i32 %166, 2
  br i1 %167, label %168, label %185

168:                                              ; preds = %163
  %169 = load ptr, ptr %7, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %171, 2
  br i1 %172, label %173, label %185

173:                                              ; preds = %168
  %174 = load ptr, ptr %8, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 0
  store i32 2, ptr %175, align 8
  %176 = load ptr, ptr %6, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = load ptr, ptr %7, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load double, ptr %180, align 8
  %182 = fadd double %178, %181
  %183 = load ptr, ptr %8, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 1
  store double %182, ptr %184, align 8
  br label %1409

185:                                              ; preds = %168, %163
  %186 = load ptr, ptr %6, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = icmp eq i32 %188, 3
  br i1 %189, label %190, label %207

190:                                              ; preds = %185
  %191 = load ptr, ptr %7, align 8
  %192 = getelementptr inbounds %struct.CalcLangVal, ptr %191, i32 0, i32 0
  %193 = load i32, ptr %192, align 8
  %194 = icmp eq i32 %193, 3
  br i1 %194, label %195, label %207

195:                                              ; preds = %190
  %196 = load ptr, ptr %8, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 0
  store i32 3, ptr %197, align 8
  %198 = load ptr, ptr %6, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 1
  %200 = load double, ptr %199, align 8
  %201 = load ptr, ptr %7, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 1
  %203 = load double, ptr %202, align 8
  %204 = fadd double %200, %203
  %205 = load ptr, ptr %8, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 1
  store double %204, ptr %206, align 8
  br label %1408

207:                                              ; preds = %190, %185
  %208 = load ptr, ptr %6, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 0
  %210 = load i32, ptr %209, align 8
  %211 = icmp eq i32 %210, 6
  br i1 %211, label %212, label %289

212:                                              ; preds = %207
  %213 = load ptr, ptr %7, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 0
  %215 = load i32, ptr %214, align 8
  %216 = icmp eq i32 %215, 6
  br i1 %216, label %217, label %289

217:                                              ; preds = %212
  %218 = load ptr, ptr %6, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 1
  %220 = load ptr, ptr %219, align 8
  store ptr %220, ptr %9, align 8
  %221 = load ptr, ptr %7, align 8
  %222 = getelementptr inbounds %struct.CalcLangVal, ptr %221, i32 0, i32 1
  %223 = load ptr, ptr %222, align 8
  store ptr %223, ptr %10, align 8
  %224 = load ptr, ptr %10, align 8
  %225 = getelementptr inbounds %struct.TupleValue, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 8
  %227 = load ptr, ptr %9, align 8
  %228 = getelementptr inbounds %struct.TupleValue, ptr %227, i32 0, i32 0
  %229 = load i32, ptr %228, align 8
  %230 = icmp eq i32 %226, %229
  br i1 %230, label %231, label %287

231:                                              ; preds = %217
  %232 = load ptr, ptr %5, align 8
  %233 = call ptr @arenaAlloc(ptr noundef %232, i32 noundef 16)
  store ptr %233, ptr %11, align 8
  %234 = load ptr, ptr %9, align 8
  %235 = getelementptr inbounds %struct.TupleValue, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = load ptr, ptr %11, align 8
  %238 = getelementptr inbounds %struct.TupleValue, ptr %237, i32 0, i32 0
  store i32 %236, ptr %238, align 8
  %239 = load ptr, ptr %5, align 8
  %240 = load ptr, ptr %11, align 8
  %241 = getelementptr inbounds %struct.TupleValue, ptr %240, i32 0, i32 0
  %242 = load i32, ptr %241, align 8
  %243 = sext i32 %242 to i64
  %244 = mul i64 8, %243
  %245 = trunc i64 %244 to i32
  %246 = call ptr @arenaAlloc(ptr noundef %239, i32 noundef %245)
  %247 = load ptr, ptr %11, align 8
  %248 = getelementptr inbounds %struct.TupleValue, ptr %247, i32 0, i32 1
  store ptr %246, ptr %248, align 8
  store i32 0, ptr %12, align 4
  br label %249

249:                                              ; preds = %278, %231
  %250 = load i32, ptr %12, align 4
  %251 = load ptr, ptr %9, align 8
  %252 = getelementptr inbounds %struct.TupleValue, ptr %251, i32 0, i32 0
  %253 = load i32, ptr %252, align 8
  %254 = icmp slt i32 %250, %253
  br i1 %254, label %255, label %281

255:                                              ; preds = %249
  %256 = load ptr, ptr %5, align 8
  %257 = load ptr, ptr %9, align 8
  %258 = getelementptr inbounds %struct.TupleValue, ptr %257, i32 0, i32 1
  %259 = load ptr, ptr %258, align 8
  %260 = load i32, ptr %12, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds ptr, ptr %259, i64 %261
  %263 = load ptr, ptr %262, align 8
  %264 = load ptr, ptr %10, align 8
  %265 = getelementptr inbounds %struct.TupleValue, ptr %264, i32 0, i32 1
  %266 = load ptr, ptr %265, align 8
  %267 = load i32, ptr %12, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds ptr, ptr %266, i64 %268
  %270 = load ptr, ptr %269, align 8
  %271 = call ptr @addCalcLangValues(ptr noundef %256, ptr noundef %263, ptr noundef %270)
  %272 = load ptr, ptr %11, align 8
  %273 = getelementptr inbounds %struct.TupleValue, ptr %272, i32 0, i32 1
  %274 = load ptr, ptr %273, align 8
  %275 = load i32, ptr %12, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds ptr, ptr %274, i64 %276
  store ptr %271, ptr %277, align 8
  br label %278

278:                                              ; preds = %255
  %279 = load i32, ptr %12, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, ptr %12, align 4
  br label %249, !llvm.loop !8

281:                                              ; preds = %249
  %282 = load ptr, ptr %8, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 0
  store i32 6, ptr %283, align 8
  %284 = load ptr, ptr %11, align 8
  %285 = load ptr, ptr %8, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 1
  store ptr %284, ptr %286, align 8
  br label %288

287:                                              ; preds = %217
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1415

288:                                              ; preds = %281
  br label %1407

289:                                              ; preds = %212, %207
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 0
  %292 = load i32, ptr %291, align 8
  %293 = icmp eq i32 %292, 6
  br i1 %293, label %294, label %352

294:                                              ; preds = %289
  %295 = load ptr, ptr %7, align 8
  %296 = getelementptr inbounds %struct.CalcLangVal, ptr %295, i32 0, i32 0
  %297 = load i32, ptr %296, align 8
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %299, label %352

299:                                              ; preds = %294
  %300 = load ptr, ptr %6, align 8
  %301 = getelementptr inbounds %struct.CalcLangVal, ptr %300, i32 0, i32 1
  %302 = load ptr, ptr %301, align 8
  store ptr %302, ptr %13, align 8
  %303 = load ptr, ptr %5, align 8
  %304 = call ptr @arenaAlloc(ptr noundef %303, i32 noundef 16)
  store ptr %304, ptr %14, align 8
  %305 = load ptr, ptr %13, align 8
  %306 = getelementptr inbounds %struct.TupleValue, ptr %305, i32 0, i32 0
  %307 = load i32, ptr %306, align 8
  %308 = load ptr, ptr %14, align 8
  %309 = getelementptr inbounds %struct.TupleValue, ptr %308, i32 0, i32 0
  store i32 %307, ptr %309, align 8
  %310 = load ptr, ptr %5, align 8
  %311 = load ptr, ptr %14, align 8
  %312 = getelementptr inbounds %struct.TupleValue, ptr %311, i32 0, i32 0
  %313 = load i32, ptr %312, align 8
  %314 = sext i32 %313 to i64
  %315 = mul i64 8, %314
  %316 = trunc i64 %315 to i32
  %317 = call ptr @arenaAlloc(ptr noundef %310, i32 noundef %316)
  %318 = load ptr, ptr %14, align 8
  %319 = getelementptr inbounds %struct.TupleValue, ptr %318, i32 0, i32 1
  store ptr %317, ptr %319, align 8
  store i32 0, ptr %15, align 4
  br label %320

320:                                              ; preds = %343, %299
  %321 = load i32, ptr %15, align 4
  %322 = load ptr, ptr %13, align 8
  %323 = getelementptr inbounds %struct.TupleValue, ptr %322, i32 0, i32 0
  %324 = load i32, ptr %323, align 8
  %325 = icmp slt i32 %321, %324
  br i1 %325, label %326, label %346

326:                                              ; preds = %320
  %327 = load ptr, ptr %5, align 8
  %328 = load ptr, ptr %13, align 8
  %329 = getelementptr inbounds %struct.TupleValue, ptr %328, i32 0, i32 1
  %330 = load ptr, ptr %329, align 8
  %331 = load i32, ptr %15, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds ptr, ptr %330, i64 %332
  %334 = load ptr, ptr %333, align 8
  %335 = load ptr, ptr %7, align 8
  %336 = call ptr @addCalcLangValues(ptr noundef %327, ptr noundef %334, ptr noundef %335)
  %337 = load ptr, ptr %14, align 8
  %338 = getelementptr inbounds %struct.TupleValue, ptr %337, i32 0, i32 1
  %339 = load ptr, ptr %338, align 8
  %340 = load i32, ptr %15, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds ptr, ptr %339, i64 %341
  store ptr %336, ptr %342, align 8
  br label %343

343:                                              ; preds = %326
  %344 = load i32, ptr %15, align 4
  %345 = add nsw i32 %344, 1
  store i32 %345, ptr %15, align 4
  br label %320, !llvm.loop !9

346:                                              ; preds = %320
  %347 = load ptr, ptr %8, align 8
  %348 = getelementptr inbounds %struct.CalcLangVal, ptr %347, i32 0, i32 0
  store i32 6, ptr %348, align 8
  %349 = load ptr, ptr %14, align 8
  %350 = load ptr, ptr %8, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 1
  store ptr %349, ptr %351, align 8
  br label %1406

352:                                              ; preds = %294, %289
  %353 = load ptr, ptr %6, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 0
  %355 = load i32, ptr %354, align 8
  %356 = icmp eq i32 %355, 0
  br i1 %356, label %357, label %415

357:                                              ; preds = %352
  %358 = load ptr, ptr %7, align 8
  %359 = getelementptr inbounds %struct.CalcLangVal, ptr %358, i32 0, i32 0
  %360 = load i32, ptr %359, align 8
  %361 = icmp eq i32 %360, 6
  br i1 %361, label %362, label %415

362:                                              ; preds = %357
  %363 = load ptr, ptr %7, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 1
  %365 = load ptr, ptr %364, align 8
  store ptr %365, ptr %16, align 8
  %366 = load ptr, ptr %5, align 8
  %367 = call ptr @arenaAlloc(ptr noundef %366, i32 noundef 16)
  store ptr %367, ptr %17, align 8
  %368 = load ptr, ptr %16, align 8
  %369 = getelementptr inbounds %struct.TupleValue, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = load ptr, ptr %17, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 0
  store i32 %370, ptr %372, align 8
  %373 = load ptr, ptr %5, align 8
  %374 = load ptr, ptr %17, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 0
  %376 = load i32, ptr %375, align 8
  %377 = sext i32 %376 to i64
  %378 = mul i64 8, %377
  %379 = trunc i64 %378 to i32
  %380 = call ptr @arenaAlloc(ptr noundef %373, i32 noundef %379)
  %381 = load ptr, ptr %17, align 8
  %382 = getelementptr inbounds %struct.TupleValue, ptr %381, i32 0, i32 1
  store ptr %380, ptr %382, align 8
  store i32 0, ptr %18, align 4
  br label %383

383:                                              ; preds = %406, %362
  %384 = load i32, ptr %18, align 4
  %385 = load ptr, ptr %16, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = icmp slt i32 %384, %387
  br i1 %388, label %389, label %409

389:                                              ; preds = %383
  %390 = load ptr, ptr %5, align 8
  %391 = load ptr, ptr %6, align 8
  %392 = load ptr, ptr %16, align 8
  %393 = getelementptr inbounds %struct.TupleValue, ptr %392, i32 0, i32 1
  %394 = load ptr, ptr %393, align 8
  %395 = load i32, ptr %18, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds ptr, ptr %394, i64 %396
  %398 = load ptr, ptr %397, align 8
  %399 = call ptr @addCalcLangValues(ptr noundef %390, ptr noundef %391, ptr noundef %398)
  %400 = load ptr, ptr %17, align 8
  %401 = getelementptr inbounds %struct.TupleValue, ptr %400, i32 0, i32 1
  %402 = load ptr, ptr %401, align 8
  %403 = load i32, ptr %18, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds ptr, ptr %402, i64 %404
  store ptr %399, ptr %405, align 8
  br label %406

406:                                              ; preds = %389
  %407 = load i32, ptr %18, align 4
  %408 = add nsw i32 %407, 1
  store i32 %408, ptr %18, align 4
  br label %383, !llvm.loop !10

409:                                              ; preds = %383
  %410 = load ptr, ptr %8, align 8
  %411 = getelementptr inbounds %struct.CalcLangVal, ptr %410, i32 0, i32 0
  store i32 6, ptr %411, align 8
  %412 = load ptr, ptr %17, align 8
  %413 = load ptr, ptr %8, align 8
  %414 = getelementptr inbounds %struct.CalcLangVal, ptr %413, i32 0, i32 1
  store ptr %412, ptr %414, align 8
  br label %1405

415:                                              ; preds = %357, %352
  %416 = load ptr, ptr %6, align 8
  %417 = getelementptr inbounds %struct.CalcLangVal, ptr %416, i32 0, i32 0
  %418 = load i32, ptr %417, align 8
  %419 = icmp eq i32 %418, 6
  br i1 %419, label %420, label %478

420:                                              ; preds = %415
  %421 = load ptr, ptr %7, align 8
  %422 = getelementptr inbounds %struct.CalcLangVal, ptr %421, i32 0, i32 0
  %423 = load i32, ptr %422, align 8
  %424 = icmp eq i32 %423, 1
  br i1 %424, label %425, label %478

425:                                              ; preds = %420
  %426 = load ptr, ptr %6, align 8
  %427 = getelementptr inbounds %struct.CalcLangVal, ptr %426, i32 0, i32 1
  %428 = load ptr, ptr %427, align 8
  store ptr %428, ptr %19, align 8
  %429 = load ptr, ptr %5, align 8
  %430 = call ptr @arenaAlloc(ptr noundef %429, i32 noundef 16)
  store ptr %430, ptr %20, align 8
  %431 = load ptr, ptr %19, align 8
  %432 = getelementptr inbounds %struct.TupleValue, ptr %431, i32 0, i32 0
  %433 = load i32, ptr %432, align 8
  %434 = load ptr, ptr %20, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  store i32 %433, ptr %435, align 8
  %436 = load ptr, ptr %5, align 8
  %437 = load ptr, ptr %20, align 8
  %438 = getelementptr inbounds %struct.TupleValue, ptr %437, i32 0, i32 0
  %439 = load i32, ptr %438, align 8
  %440 = sext i32 %439 to i64
  %441 = mul i64 8, %440
  %442 = trunc i64 %441 to i32
  %443 = call ptr @arenaAlloc(ptr noundef %436, i32 noundef %442)
  %444 = load ptr, ptr %20, align 8
  %445 = getelementptr inbounds %struct.TupleValue, ptr %444, i32 0, i32 1
  store ptr %443, ptr %445, align 8
  store i32 0, ptr %21, align 4
  br label %446

446:                                              ; preds = %469, %425
  %447 = load i32, ptr %21, align 4
  %448 = load ptr, ptr %19, align 8
  %449 = getelementptr inbounds %struct.TupleValue, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = icmp slt i32 %447, %450
  br i1 %451, label %452, label %472

452:                                              ; preds = %446
  %453 = load ptr, ptr %5, align 8
  %454 = load ptr, ptr %19, align 8
  %455 = getelementptr inbounds %struct.TupleValue, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = load i32, ptr %21, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds ptr, ptr %456, i64 %458
  %460 = load ptr, ptr %459, align 8
  %461 = load ptr, ptr %7, align 8
  %462 = call ptr @addCalcLangValues(ptr noundef %453, ptr noundef %460, ptr noundef %461)
  %463 = load ptr, ptr %20, align 8
  %464 = getelementptr inbounds %struct.TupleValue, ptr %463, i32 0, i32 1
  %465 = load ptr, ptr %464, align 8
  %466 = load i32, ptr %21, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds ptr, ptr %465, i64 %467
  store ptr %462, ptr %468, align 8
  br label %469

469:                                              ; preds = %452
  %470 = load i32, ptr %21, align 4
  %471 = add nsw i32 %470, 1
  store i32 %471, ptr %21, align 4
  br label %446, !llvm.loop !11

472:                                              ; preds = %446
  %473 = load ptr, ptr %8, align 8
  %474 = getelementptr inbounds %struct.CalcLangVal, ptr %473, i32 0, i32 0
  store i32 6, ptr %474, align 8
  %475 = load ptr, ptr %20, align 8
  %476 = load ptr, ptr %8, align 8
  %477 = getelementptr inbounds %struct.CalcLangVal, ptr %476, i32 0, i32 1
  store ptr %475, ptr %477, align 8
  br label %1404

478:                                              ; preds = %420, %415
  %479 = load ptr, ptr %6, align 8
  %480 = getelementptr inbounds %struct.CalcLangVal, ptr %479, i32 0, i32 0
  %481 = load i32, ptr %480, align 8
  %482 = icmp eq i32 %481, 1
  br i1 %482, label %483, label %541

483:                                              ; preds = %478
  %484 = load ptr, ptr %7, align 8
  %485 = getelementptr inbounds %struct.CalcLangVal, ptr %484, i32 0, i32 0
  %486 = load i32, ptr %485, align 8
  %487 = icmp eq i32 %486, 6
  br i1 %487, label %488, label %541

488:                                              ; preds = %483
  %489 = load ptr, ptr %7, align 8
  %490 = getelementptr inbounds %struct.CalcLangVal, ptr %489, i32 0, i32 1
  %491 = load ptr, ptr %490, align 8
  store ptr %491, ptr %22, align 8
  %492 = load ptr, ptr %5, align 8
  %493 = call ptr @arenaAlloc(ptr noundef %492, i32 noundef 16)
  store ptr %493, ptr %23, align 8
  %494 = load ptr, ptr %22, align 8
  %495 = getelementptr inbounds %struct.TupleValue, ptr %494, i32 0, i32 0
  %496 = load i32, ptr %495, align 8
  %497 = load ptr, ptr %23, align 8
  %498 = getelementptr inbounds %struct.TupleValue, ptr %497, i32 0, i32 0
  store i32 %496, ptr %498, align 8
  %499 = load ptr, ptr %5, align 8
  %500 = load ptr, ptr %23, align 8
  %501 = getelementptr inbounds %struct.TupleValue, ptr %500, i32 0, i32 0
  %502 = load i32, ptr %501, align 8
  %503 = sext i32 %502 to i64
  %504 = mul i64 8, %503
  %505 = trunc i64 %504 to i32
  %506 = call ptr @arenaAlloc(ptr noundef %499, i32 noundef %505)
  %507 = load ptr, ptr %23, align 8
  %508 = getelementptr inbounds %struct.TupleValue, ptr %507, i32 0, i32 1
  store ptr %506, ptr %508, align 8
  store i32 0, ptr %24, align 4
  br label %509

509:                                              ; preds = %532, %488
  %510 = load i32, ptr %24, align 4
  %511 = load ptr, ptr %22, align 8
  %512 = getelementptr inbounds %struct.TupleValue, ptr %511, i32 0, i32 0
  %513 = load i32, ptr %512, align 8
  %514 = icmp slt i32 %510, %513
  br i1 %514, label %515, label %535

515:                                              ; preds = %509
  %516 = load ptr, ptr %5, align 8
  %517 = load ptr, ptr %6, align 8
  %518 = load ptr, ptr %22, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 1
  %520 = load ptr, ptr %519, align 8
  %521 = load i32, ptr %24, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds ptr, ptr %520, i64 %522
  %524 = load ptr, ptr %523, align 8
  %525 = call ptr @addCalcLangValues(ptr noundef %516, ptr noundef %517, ptr noundef %524)
  %526 = load ptr, ptr %23, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 1
  %528 = load ptr, ptr %527, align 8
  %529 = load i32, ptr %24, align 4
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds ptr, ptr %528, i64 %530
  store ptr %525, ptr %531, align 8
  br label %532

532:                                              ; preds = %515
  %533 = load i32, ptr %24, align 4
  %534 = add nsw i32 %533, 1
  store i32 %534, ptr %24, align 4
  br label %509, !llvm.loop !12

535:                                              ; preds = %509
  %536 = load ptr, ptr %8, align 8
  %537 = getelementptr inbounds %struct.CalcLangVal, ptr %536, i32 0, i32 0
  store i32 6, ptr %537, align 8
  %538 = load ptr, ptr %23, align 8
  %539 = load ptr, ptr %8, align 8
  %540 = getelementptr inbounds %struct.CalcLangVal, ptr %539, i32 0, i32 1
  store ptr %538, ptr %540, align 8
  br label %1403

541:                                              ; preds = %483, %478
  %542 = load ptr, ptr %6, align 8
  %543 = getelementptr inbounds %struct.CalcLangVal, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = icmp eq i32 %544, 6
  br i1 %545, label %546, label %604

546:                                              ; preds = %541
  %547 = load ptr, ptr %7, align 8
  %548 = getelementptr inbounds %struct.CalcLangVal, ptr %547, i32 0, i32 0
  %549 = load i32, ptr %548, align 8
  %550 = icmp eq i32 %549, 2
  br i1 %550, label %551, label %604

551:                                              ; preds = %546
  %552 = load ptr, ptr %6, align 8
  %553 = getelementptr inbounds %struct.CalcLangVal, ptr %552, i32 0, i32 1
  %554 = load ptr, ptr %553, align 8
  store ptr %554, ptr %25, align 8
  %555 = load ptr, ptr %5, align 8
  %556 = call ptr @arenaAlloc(ptr noundef %555, i32 noundef 16)
  store ptr %556, ptr %26, align 8
  %557 = load ptr, ptr %25, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 0
  %559 = load i32, ptr %558, align 8
  %560 = load ptr, ptr %26, align 8
  %561 = getelementptr inbounds %struct.TupleValue, ptr %560, i32 0, i32 0
  store i32 %559, ptr %561, align 8
  %562 = load ptr, ptr %5, align 8
  %563 = load ptr, ptr %26, align 8
  %564 = getelementptr inbounds %struct.TupleValue, ptr %563, i32 0, i32 0
  %565 = load i32, ptr %564, align 8
  %566 = sext i32 %565 to i64
  %567 = mul i64 8, %566
  %568 = trunc i64 %567 to i32
  %569 = call ptr @arenaAlloc(ptr noundef %562, i32 noundef %568)
  %570 = load ptr, ptr %26, align 8
  %571 = getelementptr inbounds %struct.TupleValue, ptr %570, i32 0, i32 1
  store ptr %569, ptr %571, align 8
  store i32 0, ptr %27, align 4
  br label %572

572:                                              ; preds = %595, %551
  %573 = load i32, ptr %27, align 4
  %574 = load ptr, ptr %25, align 8
  %575 = getelementptr inbounds %struct.TupleValue, ptr %574, i32 0, i32 0
  %576 = load i32, ptr %575, align 8
  %577 = icmp slt i32 %573, %576
  br i1 %577, label %578, label %598

578:                                              ; preds = %572
  %579 = load ptr, ptr %5, align 8
  %580 = load ptr, ptr %25, align 8
  %581 = getelementptr inbounds %struct.TupleValue, ptr %580, i32 0, i32 1
  %582 = load ptr, ptr %581, align 8
  %583 = load i32, ptr %27, align 4
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds ptr, ptr %582, i64 %584
  %586 = load ptr, ptr %585, align 8
  %587 = load ptr, ptr %7, align 8
  %588 = call ptr @addCalcLangValues(ptr noundef %579, ptr noundef %586, ptr noundef %587)
  %589 = load ptr, ptr %26, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 1
  %591 = load ptr, ptr %590, align 8
  %592 = load i32, ptr %27, align 4
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds ptr, ptr %591, i64 %593
  store ptr %588, ptr %594, align 8
  br label %595

595:                                              ; preds = %578
  %596 = load i32, ptr %27, align 4
  %597 = add nsw i32 %596, 1
  store i32 %597, ptr %27, align 4
  br label %572, !llvm.loop !13

598:                                              ; preds = %572
  %599 = load ptr, ptr %8, align 8
  %600 = getelementptr inbounds %struct.CalcLangVal, ptr %599, i32 0, i32 0
  store i32 6, ptr %600, align 8
  %601 = load ptr, ptr %26, align 8
  %602 = load ptr, ptr %8, align 8
  %603 = getelementptr inbounds %struct.CalcLangVal, ptr %602, i32 0, i32 1
  store ptr %601, ptr %603, align 8
  br label %1402

604:                                              ; preds = %546, %541
  %605 = load ptr, ptr %6, align 8
  %606 = getelementptr inbounds %struct.CalcLangVal, ptr %605, i32 0, i32 0
  %607 = load i32, ptr %606, align 8
  %608 = icmp eq i32 %607, 2
  br i1 %608, label %609, label %667

609:                                              ; preds = %604
  %610 = load ptr, ptr %7, align 8
  %611 = getelementptr inbounds %struct.CalcLangVal, ptr %610, i32 0, i32 0
  %612 = load i32, ptr %611, align 8
  %613 = icmp eq i32 %612, 6
  br i1 %613, label %614, label %667

614:                                              ; preds = %609
  %615 = load ptr, ptr %7, align 8
  %616 = getelementptr inbounds %struct.CalcLangVal, ptr %615, i32 0, i32 1
  %617 = load ptr, ptr %616, align 8
  store ptr %617, ptr %28, align 8
  %618 = load ptr, ptr %5, align 8
  %619 = call ptr @arenaAlloc(ptr noundef %618, i32 noundef 16)
  store ptr %619, ptr %29, align 8
  %620 = load ptr, ptr %28, align 8
  %621 = getelementptr inbounds %struct.TupleValue, ptr %620, i32 0, i32 0
  %622 = load i32, ptr %621, align 8
  %623 = load ptr, ptr %29, align 8
  %624 = getelementptr inbounds %struct.TupleValue, ptr %623, i32 0, i32 0
  store i32 %622, ptr %624, align 8
  %625 = load ptr, ptr %5, align 8
  %626 = load ptr, ptr %29, align 8
  %627 = getelementptr inbounds %struct.TupleValue, ptr %626, i32 0, i32 0
  %628 = load i32, ptr %627, align 8
  %629 = sext i32 %628 to i64
  %630 = mul i64 8, %629
  %631 = trunc i64 %630 to i32
  %632 = call ptr @arenaAlloc(ptr noundef %625, i32 noundef %631)
  %633 = load ptr, ptr %29, align 8
  %634 = getelementptr inbounds %struct.TupleValue, ptr %633, i32 0, i32 1
  store ptr %632, ptr %634, align 8
  store i32 0, ptr %30, align 4
  br label %635

635:                                              ; preds = %658, %614
  %636 = load i32, ptr %30, align 4
  %637 = load ptr, ptr %28, align 8
  %638 = getelementptr inbounds %struct.TupleValue, ptr %637, i32 0, i32 0
  %639 = load i32, ptr %638, align 8
  %640 = icmp slt i32 %636, %639
  br i1 %640, label %641, label %661

641:                                              ; preds = %635
  %642 = load ptr, ptr %5, align 8
  %643 = load ptr, ptr %6, align 8
  %644 = load ptr, ptr %28, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  %647 = load i32, ptr %30, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds ptr, ptr %646, i64 %648
  %650 = load ptr, ptr %649, align 8
  %651 = call ptr @addCalcLangValues(ptr noundef %642, ptr noundef %643, ptr noundef %650)
  %652 = load ptr, ptr %29, align 8
  %653 = getelementptr inbounds %struct.TupleValue, ptr %652, i32 0, i32 1
  %654 = load ptr, ptr %653, align 8
  %655 = load i32, ptr %30, align 4
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds ptr, ptr %654, i64 %656
  store ptr %651, ptr %657, align 8
  br label %658

658:                                              ; preds = %641
  %659 = load i32, ptr %30, align 4
  %660 = add nsw i32 %659, 1
  store i32 %660, ptr %30, align 4
  br label %635, !llvm.loop !14

661:                                              ; preds = %635
  %662 = load ptr, ptr %8, align 8
  %663 = getelementptr inbounds %struct.CalcLangVal, ptr %662, i32 0, i32 0
  store i32 6, ptr %663, align 8
  %664 = load ptr, ptr %29, align 8
  %665 = load ptr, ptr %8, align 8
  %666 = getelementptr inbounds %struct.CalcLangVal, ptr %665, i32 0, i32 1
  store ptr %664, ptr %666, align 8
  br label %1401

667:                                              ; preds = %609, %604
  %668 = load ptr, ptr %6, align 8
  %669 = getelementptr inbounds %struct.CalcLangVal, ptr %668, i32 0, i32 0
  %670 = load i32, ptr %669, align 8
  %671 = icmp eq i32 %670, 6
  br i1 %671, label %672, label %730

672:                                              ; preds = %667
  %673 = load ptr, ptr %7, align 8
  %674 = getelementptr inbounds %struct.CalcLangVal, ptr %673, i32 0, i32 0
  %675 = load i32, ptr %674, align 8
  %676 = icmp eq i32 %675, 3
  br i1 %676, label %677, label %730

677:                                              ; preds = %672
  %678 = load ptr, ptr %6, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 1
  %680 = load ptr, ptr %679, align 8
  store ptr %680, ptr %31, align 8
  %681 = load ptr, ptr %5, align 8
  %682 = call ptr @arenaAlloc(ptr noundef %681, i32 noundef 16)
  store ptr %682, ptr %32, align 8
  %683 = load ptr, ptr %31, align 8
  %684 = getelementptr inbounds %struct.TupleValue, ptr %683, i32 0, i32 0
  %685 = load i32, ptr %684, align 8
  %686 = load ptr, ptr %32, align 8
  %687 = getelementptr inbounds %struct.TupleValue, ptr %686, i32 0, i32 0
  store i32 %685, ptr %687, align 8
  %688 = load ptr, ptr %5, align 8
  %689 = load ptr, ptr %32, align 8
  %690 = getelementptr inbounds %struct.TupleValue, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = sext i32 %691 to i64
  %693 = mul i64 8, %692
  %694 = trunc i64 %693 to i32
  %695 = call ptr @arenaAlloc(ptr noundef %688, i32 noundef %694)
  %696 = load ptr, ptr %32, align 8
  %697 = getelementptr inbounds %struct.TupleValue, ptr %696, i32 0, i32 1
  store ptr %695, ptr %697, align 8
  store i32 0, ptr %33, align 4
  br label %698

698:                                              ; preds = %721, %677
  %699 = load i32, ptr %33, align 4
  %700 = load ptr, ptr %31, align 8
  %701 = getelementptr inbounds %struct.TupleValue, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = icmp slt i32 %699, %702
  br i1 %703, label %704, label %724

704:                                              ; preds = %698
  %705 = load ptr, ptr %5, align 8
  %706 = load ptr, ptr %31, align 8
  %707 = getelementptr inbounds %struct.TupleValue, ptr %706, i32 0, i32 1
  %708 = load ptr, ptr %707, align 8
  %709 = load i32, ptr %33, align 4
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds ptr, ptr %708, i64 %710
  %712 = load ptr, ptr %711, align 8
  %713 = load ptr, ptr %7, align 8
  %714 = call ptr @addCalcLangValues(ptr noundef %705, ptr noundef %712, ptr noundef %713)
  %715 = load ptr, ptr %32, align 8
  %716 = getelementptr inbounds %struct.TupleValue, ptr %715, i32 0, i32 1
  %717 = load ptr, ptr %716, align 8
  %718 = load i32, ptr %33, align 4
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds ptr, ptr %717, i64 %719
  store ptr %714, ptr %720, align 8
  br label %721

721:                                              ; preds = %704
  %722 = load i32, ptr %33, align 4
  %723 = add nsw i32 %722, 1
  store i32 %723, ptr %33, align 4
  br label %698, !llvm.loop !15

724:                                              ; preds = %698
  %725 = load ptr, ptr %8, align 8
  %726 = getelementptr inbounds %struct.CalcLangVal, ptr %725, i32 0, i32 0
  store i32 6, ptr %726, align 8
  %727 = load ptr, ptr %32, align 8
  %728 = load ptr, ptr %8, align 8
  %729 = getelementptr inbounds %struct.CalcLangVal, ptr %728, i32 0, i32 1
  store ptr %727, ptr %729, align 8
  br label %1400

730:                                              ; preds = %672, %667
  %731 = load ptr, ptr %6, align 8
  %732 = getelementptr inbounds %struct.CalcLangVal, ptr %731, i32 0, i32 0
  %733 = load i32, ptr %732, align 8
  %734 = icmp eq i32 %733, 3
  br i1 %734, label %735, label %793

735:                                              ; preds = %730
  %736 = load ptr, ptr %7, align 8
  %737 = getelementptr inbounds %struct.CalcLangVal, ptr %736, i32 0, i32 0
  %738 = load i32, ptr %737, align 8
  %739 = icmp eq i32 %738, 6
  br i1 %739, label %740, label %793

740:                                              ; preds = %735
  %741 = load ptr, ptr %7, align 8
  %742 = getelementptr inbounds %struct.CalcLangVal, ptr %741, i32 0, i32 1
  %743 = load ptr, ptr %742, align 8
  store ptr %743, ptr %34, align 8
  %744 = load ptr, ptr %5, align 8
  %745 = call ptr @arenaAlloc(ptr noundef %744, i32 noundef 16)
  store ptr %745, ptr %35, align 8
  %746 = load ptr, ptr %34, align 8
  %747 = getelementptr inbounds %struct.TupleValue, ptr %746, i32 0, i32 0
  %748 = load i32, ptr %747, align 8
  %749 = load ptr, ptr %35, align 8
  %750 = getelementptr inbounds %struct.TupleValue, ptr %749, i32 0, i32 0
  store i32 %748, ptr %750, align 8
  %751 = load ptr, ptr %5, align 8
  %752 = load ptr, ptr %35, align 8
  %753 = getelementptr inbounds %struct.TupleValue, ptr %752, i32 0, i32 0
  %754 = load i32, ptr %753, align 8
  %755 = sext i32 %754 to i64
  %756 = mul i64 8, %755
  %757 = trunc i64 %756 to i32
  %758 = call ptr @arenaAlloc(ptr noundef %751, i32 noundef %757)
  %759 = load ptr, ptr %35, align 8
  %760 = getelementptr inbounds %struct.TupleValue, ptr %759, i32 0, i32 1
  store ptr %758, ptr %760, align 8
  store i32 0, ptr %36, align 4
  br label %761

761:                                              ; preds = %784, %740
  %762 = load i32, ptr %36, align 4
  %763 = load ptr, ptr %34, align 8
  %764 = getelementptr inbounds %struct.TupleValue, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = icmp slt i32 %762, %765
  br i1 %766, label %767, label %787

767:                                              ; preds = %761
  %768 = load ptr, ptr %5, align 8
  %769 = load ptr, ptr %6, align 8
  %770 = load ptr, ptr %34, align 8
  %771 = getelementptr inbounds %struct.TupleValue, ptr %770, i32 0, i32 1
  %772 = load ptr, ptr %771, align 8
  %773 = load i32, ptr %36, align 4
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds ptr, ptr %772, i64 %774
  %776 = load ptr, ptr %775, align 8
  %777 = call ptr @addCalcLangValues(ptr noundef %768, ptr noundef %769, ptr noundef %776)
  %778 = load ptr, ptr %35, align 8
  %779 = getelementptr inbounds %struct.TupleValue, ptr %778, i32 0, i32 1
  %780 = load ptr, ptr %779, align 8
  %781 = load i32, ptr %36, align 4
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds ptr, ptr %780, i64 %782
  store ptr %777, ptr %783, align 8
  br label %784

784:                                              ; preds = %767
  %785 = load i32, ptr %36, align 4
  %786 = add nsw i32 %785, 1
  store i32 %786, ptr %36, align 4
  br label %761, !llvm.loop !16

787:                                              ; preds = %761
  %788 = load ptr, ptr %8, align 8
  %789 = getelementptr inbounds %struct.CalcLangVal, ptr %788, i32 0, i32 0
  store i32 6, ptr %789, align 8
  %790 = load ptr, ptr %35, align 8
  %791 = load ptr, ptr %8, align 8
  %792 = getelementptr inbounds %struct.CalcLangVal, ptr %791, i32 0, i32 1
  store ptr %790, ptr %792, align 8
  br label %1399

793:                                              ; preds = %735, %730
  %794 = load ptr, ptr %6, align 8
  %795 = getelementptr inbounds %struct.CalcLangVal, ptr %794, i32 0, i32 0
  %796 = load i32, ptr %795, align 8
  %797 = icmp eq i32 %796, 5
  br i1 %797, label %798, label %875

798:                                              ; preds = %793
  %799 = load ptr, ptr %7, align 8
  %800 = getelementptr inbounds %struct.CalcLangVal, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = icmp eq i32 %801, 5
  br i1 %802, label %803, label %875

803:                                              ; preds = %798
  %804 = load ptr, ptr %6, align 8
  %805 = getelementptr inbounds %struct.CalcLangVal, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  store ptr %806, ptr %37, align 8
  %807 = load ptr, ptr %7, align 8
  %808 = getelementptr inbounds %struct.CalcLangVal, ptr %807, i32 0, i32 1
  %809 = load ptr, ptr %808, align 8
  store ptr %809, ptr %38, align 8
  %810 = load ptr, ptr %38, align 8
  %811 = getelementptr inbounds %struct.SetValue, ptr %810, i32 0, i32 0
  %812 = load i32, ptr %811, align 8
  %813 = load ptr, ptr %37, align 8
  %814 = getelementptr inbounds %struct.SetValue, ptr %813, i32 0, i32 0
  %815 = load i32, ptr %814, align 8
  %816 = icmp eq i32 %812, %815
  br i1 %816, label %817, label %873

817:                                              ; preds = %803
  %818 = load ptr, ptr %5, align 8
  %819 = call ptr @arenaAlloc(ptr noundef %818, i32 noundef 16)
  store ptr %819, ptr %39, align 8
  %820 = load ptr, ptr %37, align 8
  %821 = getelementptr inbounds %struct.SetValue, ptr %820, i32 0, i32 0
  %822 = load i32, ptr %821, align 8
  %823 = load ptr, ptr %39, align 8
  %824 = getelementptr inbounds %struct.SetValue, ptr %823, i32 0, i32 0
  store i32 %822, ptr %824, align 8
  %825 = load ptr, ptr %5, align 8
  %826 = load ptr, ptr %39, align 8
  %827 = getelementptr inbounds %struct.SetValue, ptr %826, i32 0, i32 0
  %828 = load i32, ptr %827, align 8
  %829 = sext i32 %828 to i64
  %830 = mul i64 8, %829
  %831 = trunc i64 %830 to i32
  %832 = call ptr @arenaAlloc(ptr noundef %825, i32 noundef %831)
  %833 = load ptr, ptr %39, align 8
  %834 = getelementptr inbounds %struct.SetValue, ptr %833, i32 0, i32 1
  store ptr %832, ptr %834, align 8
  store i32 0, ptr %40, align 4
  br label %835

835:                                              ; preds = %864, %817
  %836 = load i32, ptr %40, align 4
  %837 = load ptr, ptr %37, align 8
  %838 = getelementptr inbounds %struct.SetValue, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp slt i32 %836, %839
  br i1 %840, label %841, label %867

841:                                              ; preds = %835
  %842 = load ptr, ptr %5, align 8
  %843 = load ptr, ptr %37, align 8
  %844 = getelementptr inbounds %struct.SetValue, ptr %843, i32 0, i32 1
  %845 = load ptr, ptr %844, align 8
  %846 = load i32, ptr %40, align 4
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds ptr, ptr %845, i64 %847
  %849 = load ptr, ptr %848, align 8
  %850 = load ptr, ptr %38, align 8
  %851 = getelementptr inbounds %struct.SetValue, ptr %850, i32 0, i32 1
  %852 = load ptr, ptr %851, align 8
  %853 = load i32, ptr %40, align 4
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds ptr, ptr %852, i64 %854
  %856 = load ptr, ptr %855, align 8
  %857 = call ptr @addCalcLangValues(ptr noundef %842, ptr noundef %849, ptr noundef %856)
  %858 = load ptr, ptr %39, align 8
  %859 = getelementptr inbounds %struct.SetValue, ptr %858, i32 0, i32 1
  %860 = load ptr, ptr %859, align 8
  %861 = load i32, ptr %40, align 4
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds ptr, ptr %860, i64 %862
  store ptr %857, ptr %863, align 8
  br label %864

864:                                              ; preds = %841
  %865 = load i32, ptr %40, align 4
  %866 = add nsw i32 %865, 1
  store i32 %866, ptr %40, align 4
  br label %835, !llvm.loop !17

867:                                              ; preds = %835
  %868 = load ptr, ptr %8, align 8
  %869 = getelementptr inbounds %struct.CalcLangVal, ptr %868, i32 0, i32 0
  store i32 5, ptr %869, align 8
  %870 = load ptr, ptr %39, align 8
  %871 = load ptr, ptr %8, align 8
  %872 = getelementptr inbounds %struct.CalcLangVal, ptr %871, i32 0, i32 1
  store ptr %870, ptr %872, align 8
  br label %874

873:                                              ; preds = %803
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1415

874:                                              ; preds = %867
  br label %1398

875:                                              ; preds = %798, %793
  %876 = load ptr, ptr %6, align 8
  %877 = getelementptr inbounds %struct.CalcLangVal, ptr %876, i32 0, i32 0
  %878 = load i32, ptr %877, align 8
  %879 = icmp eq i32 %878, 5
  br i1 %879, label %880, label %938

880:                                              ; preds = %875
  %881 = load ptr, ptr %7, align 8
  %882 = getelementptr inbounds %struct.CalcLangVal, ptr %881, i32 0, i32 0
  %883 = load i32, ptr %882, align 8
  %884 = icmp eq i32 %883, 0
  br i1 %884, label %885, label %938

885:                                              ; preds = %880
  %886 = load ptr, ptr %6, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 1
  %888 = load ptr, ptr %887, align 8
  store ptr %888, ptr %41, align 8
  %889 = load ptr, ptr %5, align 8
  %890 = call ptr @arenaAlloc(ptr noundef %889, i32 noundef 16)
  store ptr %890, ptr %42, align 8
  %891 = load ptr, ptr %41, align 8
  %892 = getelementptr inbounds %struct.SetValue, ptr %891, i32 0, i32 0
  %893 = load i32, ptr %892, align 8
  %894 = load ptr, ptr %42, align 8
  %895 = getelementptr inbounds %struct.SetValue, ptr %894, i32 0, i32 0
  store i32 %893, ptr %895, align 8
  %896 = load ptr, ptr %5, align 8
  %897 = load ptr, ptr %42, align 8
  %898 = getelementptr inbounds %struct.SetValue, ptr %897, i32 0, i32 0
  %899 = load i32, ptr %898, align 8
  %900 = sext i32 %899 to i64
  %901 = mul i64 8, %900
  %902 = trunc i64 %901 to i32
  %903 = call ptr @arenaAlloc(ptr noundef %896, i32 noundef %902)
  %904 = load ptr, ptr %42, align 8
  %905 = getelementptr inbounds %struct.SetValue, ptr %904, i32 0, i32 1
  store ptr %903, ptr %905, align 8
  store i32 0, ptr %43, align 4
  br label %906

906:                                              ; preds = %929, %885
  %907 = load i32, ptr %43, align 4
  %908 = load ptr, ptr %41, align 8
  %909 = getelementptr inbounds %struct.SetValue, ptr %908, i32 0, i32 0
  %910 = load i32, ptr %909, align 8
  %911 = icmp slt i32 %907, %910
  br i1 %911, label %912, label %932

912:                                              ; preds = %906
  %913 = load ptr, ptr %5, align 8
  %914 = load ptr, ptr %41, align 8
  %915 = getelementptr inbounds %struct.SetValue, ptr %914, i32 0, i32 1
  %916 = load ptr, ptr %915, align 8
  %917 = load i32, ptr %43, align 4
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds ptr, ptr %916, i64 %918
  %920 = load ptr, ptr %919, align 8
  %921 = load ptr, ptr %7, align 8
  %922 = call ptr @addCalcLangValues(ptr noundef %913, ptr noundef %920, ptr noundef %921)
  %923 = load ptr, ptr %42, align 8
  %924 = getelementptr inbounds %struct.SetValue, ptr %923, i32 0, i32 1
  %925 = load ptr, ptr %924, align 8
  %926 = load i32, ptr %43, align 4
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds ptr, ptr %925, i64 %927
  store ptr %922, ptr %928, align 8
  br label %929

929:                                              ; preds = %912
  %930 = load i32, ptr %43, align 4
  %931 = add nsw i32 %930, 1
  store i32 %931, ptr %43, align 4
  br label %906, !llvm.loop !18

932:                                              ; preds = %906
  %933 = load ptr, ptr %8, align 8
  %934 = getelementptr inbounds %struct.CalcLangVal, ptr %933, i32 0, i32 0
  store i32 5, ptr %934, align 8
  %935 = load ptr, ptr %42, align 8
  %936 = load ptr, ptr %8, align 8
  %937 = getelementptr inbounds %struct.CalcLangVal, ptr %936, i32 0, i32 1
  store ptr %935, ptr %937, align 8
  br label %1397

938:                                              ; preds = %880, %875
  %939 = load ptr, ptr %6, align 8
  %940 = getelementptr inbounds %struct.CalcLangVal, ptr %939, i32 0, i32 0
  %941 = load i32, ptr %940, align 8
  %942 = icmp eq i32 %941, 0
  br i1 %942, label %943, label %1001

943:                                              ; preds = %938
  %944 = load ptr, ptr %7, align 8
  %945 = getelementptr inbounds %struct.CalcLangVal, ptr %944, i32 0, i32 0
  %946 = load i32, ptr %945, align 8
  %947 = icmp eq i32 %946, 5
  br i1 %947, label %948, label %1001

948:                                              ; preds = %943
  %949 = load ptr, ptr %7, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 1
  %951 = load ptr, ptr %950, align 8
  store ptr %951, ptr %44, align 8
  %952 = load ptr, ptr %5, align 8
  %953 = call ptr @arenaAlloc(ptr noundef %952, i32 noundef 16)
  store ptr %953, ptr %45, align 8
  %954 = load ptr, ptr %44, align 8
  %955 = getelementptr inbounds %struct.SetValue, ptr %954, i32 0, i32 0
  %956 = load i32, ptr %955, align 8
  %957 = load ptr, ptr %45, align 8
  %958 = getelementptr inbounds %struct.SetValue, ptr %957, i32 0, i32 0
  store i32 %956, ptr %958, align 8
  %959 = load ptr, ptr %5, align 8
  %960 = load ptr, ptr %45, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = sext i32 %962 to i64
  %964 = mul i64 8, %963
  %965 = trunc i64 %964 to i32
  %966 = call ptr @arenaAlloc(ptr noundef %959, i32 noundef %965)
  %967 = load ptr, ptr %45, align 8
  %968 = getelementptr inbounds %struct.SetValue, ptr %967, i32 0, i32 1
  store ptr %966, ptr %968, align 8
  store i32 0, ptr %46, align 4
  br label %969

969:                                              ; preds = %992, %948
  %970 = load i32, ptr %46, align 4
  %971 = load ptr, ptr %44, align 8
  %972 = getelementptr inbounds %struct.SetValue, ptr %971, i32 0, i32 0
  %973 = load i32, ptr %972, align 8
  %974 = icmp slt i32 %970, %973
  br i1 %974, label %975, label %995

975:                                              ; preds = %969
  %976 = load ptr, ptr %5, align 8
  %977 = load ptr, ptr %6, align 8
  %978 = load ptr, ptr %44, align 8
  %979 = getelementptr inbounds %struct.SetValue, ptr %978, i32 0, i32 1
  %980 = load ptr, ptr %979, align 8
  %981 = load i32, ptr %46, align 4
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds ptr, ptr %980, i64 %982
  %984 = load ptr, ptr %983, align 8
  %985 = call ptr @addCalcLangValues(ptr noundef %976, ptr noundef %977, ptr noundef %984)
  %986 = load ptr, ptr %45, align 8
  %987 = getelementptr inbounds %struct.SetValue, ptr %986, i32 0, i32 1
  %988 = load ptr, ptr %987, align 8
  %989 = load i32, ptr %46, align 4
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds ptr, ptr %988, i64 %990
  store ptr %985, ptr %991, align 8
  br label %992

992:                                              ; preds = %975
  %993 = load i32, ptr %46, align 4
  %994 = add nsw i32 %993, 1
  store i32 %994, ptr %46, align 4
  br label %969, !llvm.loop !19

995:                                              ; preds = %969
  %996 = load ptr, ptr %8, align 8
  %997 = getelementptr inbounds %struct.CalcLangVal, ptr %996, i32 0, i32 0
  store i32 5, ptr %997, align 8
  %998 = load ptr, ptr %45, align 8
  %999 = load ptr, ptr %8, align 8
  %1000 = getelementptr inbounds %struct.CalcLangVal, ptr %999, i32 0, i32 1
  store ptr %998, ptr %1000, align 8
  br label %1396

1001:                                             ; preds = %943, %938
  %1002 = load ptr, ptr %6, align 8
  %1003 = getelementptr inbounds %struct.CalcLangVal, ptr %1002, i32 0, i32 0
  %1004 = load i32, ptr %1003, align 8
  %1005 = icmp eq i32 %1004, 5
  br i1 %1005, label %1006, label %1064

1006:                                             ; preds = %1001
  %1007 = load ptr, ptr %7, align 8
  %1008 = getelementptr inbounds %struct.CalcLangVal, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp eq i32 %1009, 1
  br i1 %1010, label %1011, label %1064

1011:                                             ; preds = %1006
  %1012 = load ptr, ptr %6, align 8
  %1013 = getelementptr inbounds %struct.CalcLangVal, ptr %1012, i32 0, i32 1
  %1014 = load ptr, ptr %1013, align 8
  store ptr %1014, ptr %47, align 8
  %1015 = load ptr, ptr %5, align 8
  %1016 = call ptr @arenaAlloc(ptr noundef %1015, i32 noundef 16)
  store ptr %1016, ptr %48, align 8
  %1017 = load ptr, ptr %47, align 8
  %1018 = getelementptr inbounds %struct.SetValue, ptr %1017, i32 0, i32 0
  %1019 = load i32, ptr %1018, align 8
  %1020 = load ptr, ptr %48, align 8
  %1021 = getelementptr inbounds %struct.SetValue, ptr %1020, i32 0, i32 0
  store i32 %1019, ptr %1021, align 8
  %1022 = load ptr, ptr %5, align 8
  %1023 = load ptr, ptr %48, align 8
  %1024 = getelementptr inbounds %struct.SetValue, ptr %1023, i32 0, i32 0
  %1025 = load i32, ptr %1024, align 8
  %1026 = sext i32 %1025 to i64
  %1027 = mul i64 8, %1026
  %1028 = trunc i64 %1027 to i32
  %1029 = call ptr @arenaAlloc(ptr noundef %1022, i32 noundef %1028)
  %1030 = load ptr, ptr %48, align 8
  %1031 = getelementptr inbounds %struct.SetValue, ptr %1030, i32 0, i32 1
  store ptr %1029, ptr %1031, align 8
  store i32 0, ptr %49, align 4
  br label %1032

1032:                                             ; preds = %1055, %1011
  %1033 = load i32, ptr %49, align 4
  %1034 = load ptr, ptr %47, align 8
  %1035 = getelementptr inbounds %struct.SetValue, ptr %1034, i32 0, i32 0
  %1036 = load i32, ptr %1035, align 8
  %1037 = icmp slt i32 %1033, %1036
  br i1 %1037, label %1038, label %1058

1038:                                             ; preds = %1032
  %1039 = load ptr, ptr %5, align 8
  %1040 = load ptr, ptr %47, align 8
  %1041 = getelementptr inbounds %struct.SetValue, ptr %1040, i32 0, i32 1
  %1042 = load ptr, ptr %1041, align 8
  %1043 = load i32, ptr %49, align 4
  %1044 = sext i32 %1043 to i64
  %1045 = getelementptr inbounds ptr, ptr %1042, i64 %1044
  %1046 = load ptr, ptr %1045, align 8
  %1047 = load ptr, ptr %7, align 8
  %1048 = call ptr @addCalcLangValues(ptr noundef %1039, ptr noundef %1046, ptr noundef %1047)
  %1049 = load ptr, ptr %48, align 8
  %1050 = getelementptr inbounds %struct.SetValue, ptr %1049, i32 0, i32 1
  %1051 = load ptr, ptr %1050, align 8
  %1052 = load i32, ptr %49, align 4
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds ptr, ptr %1051, i64 %1053
  store ptr %1048, ptr %1054, align 8
  br label %1055

1055:                                             ; preds = %1038
  %1056 = load i32, ptr %49, align 4
  %1057 = add nsw i32 %1056, 1
  store i32 %1057, ptr %49, align 4
  br label %1032, !llvm.loop !20

1058:                                             ; preds = %1032
  %1059 = load ptr, ptr %8, align 8
  %1060 = getelementptr inbounds %struct.CalcLangVal, ptr %1059, i32 0, i32 0
  store i32 6, ptr %1060, align 8
  %1061 = load ptr, ptr %48, align 8
  %1062 = load ptr, ptr %8, align 8
  %1063 = getelementptr inbounds %struct.CalcLangVal, ptr %1062, i32 0, i32 1
  store ptr %1061, ptr %1063, align 8
  br label %1395

1064:                                             ; preds = %1006, %1001
  %1065 = load ptr, ptr %6, align 8
  %1066 = getelementptr inbounds %struct.CalcLangVal, ptr %1065, i32 0, i32 0
  %1067 = load i32, ptr %1066, align 8
  %1068 = icmp eq i32 %1067, 1
  br i1 %1068, label %1069, label %1127

1069:                                             ; preds = %1064
  %1070 = load ptr, ptr %7, align 8
  %1071 = getelementptr inbounds %struct.CalcLangVal, ptr %1070, i32 0, i32 0
  %1072 = load i32, ptr %1071, align 8
  %1073 = icmp eq i32 %1072, 5
  br i1 %1073, label %1074, label %1127

1074:                                             ; preds = %1069
  %1075 = load ptr, ptr %7, align 8
  %1076 = getelementptr inbounds %struct.CalcLangVal, ptr %1075, i32 0, i32 1
  %1077 = load ptr, ptr %1076, align 8
  store ptr %1077, ptr %50, align 8
  %1078 = load ptr, ptr %5, align 8
  %1079 = call ptr @arenaAlloc(ptr noundef %1078, i32 noundef 16)
  store ptr %1079, ptr %51, align 8
  %1080 = load ptr, ptr %50, align 8
  %1081 = getelementptr inbounds %struct.SetValue, ptr %1080, i32 0, i32 0
  %1082 = load i32, ptr %1081, align 8
  %1083 = load ptr, ptr %51, align 8
  %1084 = getelementptr inbounds %struct.SetValue, ptr %1083, i32 0, i32 0
  store i32 %1082, ptr %1084, align 8
  %1085 = load ptr, ptr %5, align 8
  %1086 = load ptr, ptr %51, align 8
  %1087 = getelementptr inbounds %struct.SetValue, ptr %1086, i32 0, i32 0
  %1088 = load i32, ptr %1087, align 8
  %1089 = sext i32 %1088 to i64
  %1090 = mul i64 8, %1089
  %1091 = trunc i64 %1090 to i32
  %1092 = call ptr @arenaAlloc(ptr noundef %1085, i32 noundef %1091)
  %1093 = load ptr, ptr %51, align 8
  %1094 = getelementptr inbounds %struct.SetValue, ptr %1093, i32 0, i32 1
  store ptr %1092, ptr %1094, align 8
  store i32 0, ptr %52, align 4
  br label %1095

1095:                                             ; preds = %1118, %1074
  %1096 = load i32, ptr %52, align 4
  %1097 = load ptr, ptr %50, align 8
  %1098 = getelementptr inbounds %struct.SetValue, ptr %1097, i32 0, i32 0
  %1099 = load i32, ptr %1098, align 8
  %1100 = icmp slt i32 %1096, %1099
  br i1 %1100, label %1101, label %1121

1101:                                             ; preds = %1095
  %1102 = load ptr, ptr %5, align 8
  %1103 = load ptr, ptr %6, align 8
  %1104 = load ptr, ptr %50, align 8
  %1105 = getelementptr inbounds %struct.SetValue, ptr %1104, i32 0, i32 1
  %1106 = load ptr, ptr %1105, align 8
  %1107 = load i32, ptr %52, align 4
  %1108 = sext i32 %1107 to i64
  %1109 = getelementptr inbounds ptr, ptr %1106, i64 %1108
  %1110 = load ptr, ptr %1109, align 8
  %1111 = call ptr @addCalcLangValues(ptr noundef %1102, ptr noundef %1103, ptr noundef %1110)
  %1112 = load ptr, ptr %51, align 8
  %1113 = getelementptr inbounds %struct.SetValue, ptr %1112, i32 0, i32 1
  %1114 = load ptr, ptr %1113, align 8
  %1115 = load i32, ptr %52, align 4
  %1116 = sext i32 %1115 to i64
  %1117 = getelementptr inbounds ptr, ptr %1114, i64 %1116
  store ptr %1111, ptr %1117, align 8
  br label %1118

1118:                                             ; preds = %1101
  %1119 = load i32, ptr %52, align 4
  %1120 = add nsw i32 %1119, 1
  store i32 %1120, ptr %52, align 4
  br label %1095, !llvm.loop !21

1121:                                             ; preds = %1095
  %1122 = load ptr, ptr %8, align 8
  %1123 = getelementptr inbounds %struct.CalcLangVal, ptr %1122, i32 0, i32 0
  store i32 5, ptr %1123, align 8
  %1124 = load ptr, ptr %51, align 8
  %1125 = load ptr, ptr %8, align 8
  %1126 = getelementptr inbounds %struct.CalcLangVal, ptr %1125, i32 0, i32 1
  store ptr %1124, ptr %1126, align 8
  br label %1394

1127:                                             ; preds = %1069, %1064
  %1128 = load ptr, ptr %6, align 8
  %1129 = getelementptr inbounds %struct.CalcLangVal, ptr %1128, i32 0, i32 0
  %1130 = load i32, ptr %1129, align 8
  %1131 = icmp eq i32 %1130, 5
  br i1 %1131, label %1132, label %1190

1132:                                             ; preds = %1127
  %1133 = load ptr, ptr %7, align 8
  %1134 = getelementptr inbounds %struct.CalcLangVal, ptr %1133, i32 0, i32 0
  %1135 = load i32, ptr %1134, align 8
  %1136 = icmp eq i32 %1135, 2
  br i1 %1136, label %1137, label %1190

1137:                                             ; preds = %1132
  %1138 = load ptr, ptr %6, align 8
  %1139 = getelementptr inbounds %struct.CalcLangVal, ptr %1138, i32 0, i32 1
  %1140 = load ptr, ptr %1139, align 8
  store ptr %1140, ptr %53, align 8
  %1141 = load ptr, ptr %5, align 8
  %1142 = call ptr @arenaAlloc(ptr noundef %1141, i32 noundef 16)
  store ptr %1142, ptr %54, align 8
  %1143 = load ptr, ptr %53, align 8
  %1144 = getelementptr inbounds %struct.SetValue, ptr %1143, i32 0, i32 0
  %1145 = load i32, ptr %1144, align 8
  %1146 = load ptr, ptr %54, align 8
  %1147 = getelementptr inbounds %struct.SetValue, ptr %1146, i32 0, i32 0
  store i32 %1145, ptr %1147, align 8
  %1148 = load ptr, ptr %5, align 8
  %1149 = load ptr, ptr %54, align 8
  %1150 = getelementptr inbounds %struct.SetValue, ptr %1149, i32 0, i32 0
  %1151 = load i32, ptr %1150, align 8
  %1152 = sext i32 %1151 to i64
  %1153 = mul i64 8, %1152
  %1154 = trunc i64 %1153 to i32
  %1155 = call ptr @arenaAlloc(ptr noundef %1148, i32 noundef %1154)
  %1156 = load ptr, ptr %54, align 8
  %1157 = getelementptr inbounds %struct.SetValue, ptr %1156, i32 0, i32 1
  store ptr %1155, ptr %1157, align 8
  store i32 0, ptr %55, align 4
  br label %1158

1158:                                             ; preds = %1181, %1137
  %1159 = load i32, ptr %55, align 4
  %1160 = load ptr, ptr %53, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 0
  %1162 = load i32, ptr %1161, align 8
  %1163 = icmp slt i32 %1159, %1162
  br i1 %1163, label %1164, label %1184

1164:                                             ; preds = %1158
  %1165 = load ptr, ptr %5, align 8
  %1166 = load ptr, ptr %53, align 8
  %1167 = getelementptr inbounds %struct.SetValue, ptr %1166, i32 0, i32 1
  %1168 = load ptr, ptr %1167, align 8
  %1169 = load i32, ptr %55, align 4
  %1170 = sext i32 %1169 to i64
  %1171 = getelementptr inbounds ptr, ptr %1168, i64 %1170
  %1172 = load ptr, ptr %1171, align 8
  %1173 = load ptr, ptr %7, align 8
  %1174 = call ptr @addCalcLangValues(ptr noundef %1165, ptr noundef %1172, ptr noundef %1173)
  %1175 = load ptr, ptr %54, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 1
  %1177 = load ptr, ptr %1176, align 8
  %1178 = load i32, ptr %55, align 4
  %1179 = sext i32 %1178 to i64
  %1180 = getelementptr inbounds ptr, ptr %1177, i64 %1179
  store ptr %1174, ptr %1180, align 8
  br label %1181

1181:                                             ; preds = %1164
  %1182 = load i32, ptr %55, align 4
  %1183 = add nsw i32 %1182, 1
  store i32 %1183, ptr %55, align 4
  br label %1158, !llvm.loop !22

1184:                                             ; preds = %1158
  %1185 = load ptr, ptr %8, align 8
  %1186 = getelementptr inbounds %struct.CalcLangVal, ptr %1185, i32 0, i32 0
  store i32 5, ptr %1186, align 8
  %1187 = load ptr, ptr %54, align 8
  %1188 = load ptr, ptr %8, align 8
  %1189 = getelementptr inbounds %struct.CalcLangVal, ptr %1188, i32 0, i32 1
  store ptr %1187, ptr %1189, align 8
  br label %1393

1190:                                             ; preds = %1132, %1127
  %1191 = load ptr, ptr %6, align 8
  %1192 = getelementptr inbounds %struct.CalcLangVal, ptr %1191, i32 0, i32 0
  %1193 = load i32, ptr %1192, align 8
  %1194 = icmp eq i32 %1193, 2
  br i1 %1194, label %1195, label %1253

1195:                                             ; preds = %1190
  %1196 = load ptr, ptr %7, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  %1198 = load i32, ptr %1197, align 8
  %1199 = icmp eq i32 %1198, 5
  br i1 %1199, label %1200, label %1253

1200:                                             ; preds = %1195
  %1201 = load ptr, ptr %7, align 8
  %1202 = getelementptr inbounds %struct.CalcLangVal, ptr %1201, i32 0, i32 1
  %1203 = load ptr, ptr %1202, align 8
  store ptr %1203, ptr %56, align 8
  %1204 = load ptr, ptr %5, align 8
  %1205 = call ptr @arenaAlloc(ptr noundef %1204, i32 noundef 16)
  store ptr %1205, ptr %57, align 8
  %1206 = load ptr, ptr %56, align 8
  %1207 = getelementptr inbounds %struct.SetValue, ptr %1206, i32 0, i32 0
  %1208 = load i32, ptr %1207, align 8
  %1209 = load ptr, ptr %57, align 8
  %1210 = getelementptr inbounds %struct.SetValue, ptr %1209, i32 0, i32 0
  store i32 %1208, ptr %1210, align 8
  %1211 = load ptr, ptr %5, align 8
  %1212 = load ptr, ptr %57, align 8
  %1213 = getelementptr inbounds %struct.SetValue, ptr %1212, i32 0, i32 0
  %1214 = load i32, ptr %1213, align 8
  %1215 = sext i32 %1214 to i64
  %1216 = mul i64 8, %1215
  %1217 = trunc i64 %1216 to i32
  %1218 = call ptr @arenaAlloc(ptr noundef %1211, i32 noundef %1217)
  %1219 = load ptr, ptr %57, align 8
  %1220 = getelementptr inbounds %struct.SetValue, ptr %1219, i32 0, i32 1
  store ptr %1218, ptr %1220, align 8
  store i32 0, ptr %58, align 4
  br label %1221

1221:                                             ; preds = %1244, %1200
  %1222 = load i32, ptr %58, align 4
  %1223 = load ptr, ptr %56, align 8
  %1224 = getelementptr inbounds %struct.SetValue, ptr %1223, i32 0, i32 0
  %1225 = load i32, ptr %1224, align 8
  %1226 = icmp slt i32 %1222, %1225
  br i1 %1226, label %1227, label %1247

1227:                                             ; preds = %1221
  %1228 = load ptr, ptr %5, align 8
  %1229 = load ptr, ptr %6, align 8
  %1230 = load ptr, ptr %56, align 8
  %1231 = getelementptr inbounds %struct.SetValue, ptr %1230, i32 0, i32 1
  %1232 = load ptr, ptr %1231, align 8
  %1233 = load i32, ptr %58, align 4
  %1234 = sext i32 %1233 to i64
  %1235 = getelementptr inbounds ptr, ptr %1232, i64 %1234
  %1236 = load ptr, ptr %1235, align 8
  %1237 = call ptr @addCalcLangValues(ptr noundef %1228, ptr noundef %1229, ptr noundef %1236)
  %1238 = load ptr, ptr %57, align 8
  %1239 = getelementptr inbounds %struct.SetValue, ptr %1238, i32 0, i32 1
  %1240 = load ptr, ptr %1239, align 8
  %1241 = load i32, ptr %58, align 4
  %1242 = sext i32 %1241 to i64
  %1243 = getelementptr inbounds ptr, ptr %1240, i64 %1242
  store ptr %1237, ptr %1243, align 8
  br label %1244

1244:                                             ; preds = %1227
  %1245 = load i32, ptr %58, align 4
  %1246 = add nsw i32 %1245, 1
  store i32 %1246, ptr %58, align 4
  br label %1221, !llvm.loop !23

1247:                                             ; preds = %1221
  %1248 = load ptr, ptr %8, align 8
  %1249 = getelementptr inbounds %struct.CalcLangVal, ptr %1248, i32 0, i32 0
  store i32 5, ptr %1249, align 8
  %1250 = load ptr, ptr %57, align 8
  %1251 = load ptr, ptr %8, align 8
  %1252 = getelementptr inbounds %struct.CalcLangVal, ptr %1251, i32 0, i32 1
  store ptr %1250, ptr %1252, align 8
  br label %1392

1253:                                             ; preds = %1195, %1190
  %1254 = load ptr, ptr %6, align 8
  %1255 = getelementptr inbounds %struct.CalcLangVal, ptr %1254, i32 0, i32 0
  %1256 = load i32, ptr %1255, align 8
  %1257 = icmp eq i32 %1256, 5
  br i1 %1257, label %1258, label %1316

1258:                                             ; preds = %1253
  %1259 = load ptr, ptr %7, align 8
  %1260 = getelementptr inbounds %struct.CalcLangVal, ptr %1259, i32 0, i32 0
  %1261 = load i32, ptr %1260, align 8
  %1262 = icmp eq i32 %1261, 3
  br i1 %1262, label %1263, label %1316

1263:                                             ; preds = %1258
  %1264 = load ptr, ptr %6, align 8
  %1265 = getelementptr inbounds %struct.CalcLangVal, ptr %1264, i32 0, i32 1
  %1266 = load ptr, ptr %1265, align 8
  store ptr %1266, ptr %59, align 8
  %1267 = load ptr, ptr %5, align 8
  %1268 = call ptr @arenaAlloc(ptr noundef %1267, i32 noundef 16)
  store ptr %1268, ptr %60, align 8
  %1269 = load ptr, ptr %59, align 8
  %1270 = getelementptr inbounds %struct.SetValue, ptr %1269, i32 0, i32 0
  %1271 = load i32, ptr %1270, align 8
  %1272 = load ptr, ptr %60, align 8
  %1273 = getelementptr inbounds %struct.SetValue, ptr %1272, i32 0, i32 0
  store i32 %1271, ptr %1273, align 8
  %1274 = load ptr, ptr %5, align 8
  %1275 = load ptr, ptr %60, align 8
  %1276 = getelementptr inbounds %struct.SetValue, ptr %1275, i32 0, i32 0
  %1277 = load i32, ptr %1276, align 8
  %1278 = sext i32 %1277 to i64
  %1279 = mul i64 8, %1278
  %1280 = trunc i64 %1279 to i32
  %1281 = call ptr @arenaAlloc(ptr noundef %1274, i32 noundef %1280)
  %1282 = load ptr, ptr %60, align 8
  %1283 = getelementptr inbounds %struct.SetValue, ptr %1282, i32 0, i32 1
  store ptr %1281, ptr %1283, align 8
  store i32 0, ptr %61, align 4
  br label %1284

1284:                                             ; preds = %1307, %1263
  %1285 = load i32, ptr %61, align 4
  %1286 = load ptr, ptr %59, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 0
  %1288 = load i32, ptr %1287, align 8
  %1289 = icmp slt i32 %1285, %1288
  br i1 %1289, label %1290, label %1310

1290:                                             ; preds = %1284
  %1291 = load ptr, ptr %5, align 8
  %1292 = load ptr, ptr %59, align 8
  %1293 = getelementptr inbounds %struct.SetValue, ptr %1292, i32 0, i32 1
  %1294 = load ptr, ptr %1293, align 8
  %1295 = load i32, ptr %61, align 4
  %1296 = sext i32 %1295 to i64
  %1297 = getelementptr inbounds ptr, ptr %1294, i64 %1296
  %1298 = load ptr, ptr %1297, align 8
  %1299 = load ptr, ptr %7, align 8
  %1300 = call ptr @addCalcLangValues(ptr noundef %1291, ptr noundef %1298, ptr noundef %1299)
  %1301 = load ptr, ptr %60, align 8
  %1302 = getelementptr inbounds %struct.SetValue, ptr %1301, i32 0, i32 1
  %1303 = load ptr, ptr %1302, align 8
  %1304 = load i32, ptr %61, align 4
  %1305 = sext i32 %1304 to i64
  %1306 = getelementptr inbounds ptr, ptr %1303, i64 %1305
  store ptr %1300, ptr %1306, align 8
  br label %1307

1307:                                             ; preds = %1290
  %1308 = load i32, ptr %61, align 4
  %1309 = add nsw i32 %1308, 1
  store i32 %1309, ptr %61, align 4
  br label %1284, !llvm.loop !24

1310:                                             ; preds = %1284
  %1311 = load ptr, ptr %8, align 8
  %1312 = getelementptr inbounds %struct.CalcLangVal, ptr %1311, i32 0, i32 0
  store i32 5, ptr %1312, align 8
  %1313 = load ptr, ptr %60, align 8
  %1314 = load ptr, ptr %8, align 8
  %1315 = getelementptr inbounds %struct.CalcLangVal, ptr %1314, i32 0, i32 1
  store ptr %1313, ptr %1315, align 8
  br label %1391

1316:                                             ; preds = %1258, %1253
  %1317 = load ptr, ptr %6, align 8
  %1318 = getelementptr inbounds %struct.CalcLangVal, ptr %1317, i32 0, i32 0
  %1319 = load i32, ptr %1318, align 8
  %1320 = icmp eq i32 %1319, 3
  br i1 %1320, label %1321, label %1379

1321:                                             ; preds = %1316
  %1322 = load ptr, ptr %7, align 8
  %1323 = getelementptr inbounds %struct.CalcLangVal, ptr %1322, i32 0, i32 0
  %1324 = load i32, ptr %1323, align 8
  %1325 = icmp eq i32 %1324, 5
  br i1 %1325, label %1326, label %1379

1326:                                             ; preds = %1321
  %1327 = load ptr, ptr %7, align 8
  %1328 = getelementptr inbounds %struct.CalcLangVal, ptr %1327, i32 0, i32 1
  %1329 = load ptr, ptr %1328, align 8
  store ptr %1329, ptr %62, align 8
  %1330 = load ptr, ptr %5, align 8
  %1331 = call ptr @arenaAlloc(ptr noundef %1330, i32 noundef 16)
  store ptr %1331, ptr %63, align 8
  %1332 = load ptr, ptr %62, align 8
  %1333 = getelementptr inbounds %struct.SetValue, ptr %1332, i32 0, i32 0
  %1334 = load i32, ptr %1333, align 8
  %1335 = load ptr, ptr %63, align 8
  %1336 = getelementptr inbounds %struct.SetValue, ptr %1335, i32 0, i32 0
  store i32 %1334, ptr %1336, align 8
  %1337 = load ptr, ptr %5, align 8
  %1338 = load ptr, ptr %63, align 8
  %1339 = getelementptr inbounds %struct.SetValue, ptr %1338, i32 0, i32 0
  %1340 = load i32, ptr %1339, align 8
  %1341 = sext i32 %1340 to i64
  %1342 = mul i64 8, %1341
  %1343 = trunc i64 %1342 to i32
  %1344 = call ptr @arenaAlloc(ptr noundef %1337, i32 noundef %1343)
  %1345 = load ptr, ptr %63, align 8
  %1346 = getelementptr inbounds %struct.SetValue, ptr %1345, i32 0, i32 1
  store ptr %1344, ptr %1346, align 8
  store i32 0, ptr %64, align 4
  br label %1347

1347:                                             ; preds = %1370, %1326
  %1348 = load i32, ptr %64, align 4
  %1349 = load ptr, ptr %62, align 8
  %1350 = getelementptr inbounds %struct.SetValue, ptr %1349, i32 0, i32 0
  %1351 = load i32, ptr %1350, align 8
  %1352 = icmp slt i32 %1348, %1351
  br i1 %1352, label %1353, label %1373

1353:                                             ; preds = %1347
  %1354 = load ptr, ptr %5, align 8
  %1355 = load ptr, ptr %6, align 8
  %1356 = load ptr, ptr %62, align 8
  %1357 = getelementptr inbounds %struct.SetValue, ptr %1356, i32 0, i32 1
  %1358 = load ptr, ptr %1357, align 8
  %1359 = load i32, ptr %64, align 4
  %1360 = sext i32 %1359 to i64
  %1361 = getelementptr inbounds ptr, ptr %1358, i64 %1360
  %1362 = load ptr, ptr %1361, align 8
  %1363 = call ptr @addCalcLangValues(ptr noundef %1354, ptr noundef %1355, ptr noundef %1362)
  %1364 = load ptr, ptr %63, align 8
  %1365 = getelementptr inbounds %struct.SetValue, ptr %1364, i32 0, i32 1
  %1366 = load ptr, ptr %1365, align 8
  %1367 = load i32, ptr %64, align 4
  %1368 = sext i32 %1367 to i64
  %1369 = getelementptr inbounds ptr, ptr %1366, i64 %1368
  store ptr %1363, ptr %1369, align 8
  br label %1370

1370:                                             ; preds = %1353
  %1371 = load i32, ptr %64, align 4
  %1372 = add nsw i32 %1371, 1
  store i32 %1372, ptr %64, align 4
  br label %1347, !llvm.loop !25

1373:                                             ; preds = %1347
  %1374 = load ptr, ptr %8, align 8
  %1375 = getelementptr inbounds %struct.CalcLangVal, ptr %1374, i32 0, i32 0
  store i32 5, ptr %1375, align 8
  %1376 = load ptr, ptr %63, align 8
  %1377 = load ptr, ptr %8, align 8
  %1378 = getelementptr inbounds %struct.CalcLangVal, ptr %1377, i32 0, i32 1
  store ptr %1376, ptr %1378, align 8
  br label %1390

1379:                                             ; preds = %1321, %1316
  %1380 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %1381 = load ptr, ptr %6, align 8
  %1382 = getelementptr inbounds %struct.CalcLangVal, ptr %1381, i32 0, i32 0
  %1383 = load i32, ptr %1382, align 8
  %1384 = load ptr, ptr %7, align 8
  %1385 = getelementptr inbounds %struct.CalcLangVal, ptr %1384, i32 0, i32 0
  %1386 = load i32, ptr %1385, align 8
  %1387 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %1383, i32 noundef %1386)
  %1388 = load ptr, ptr @stdout, align 8
  %1389 = call i32 @fflush(ptr noundef %1388)
  br label %1390

1390:                                             ; preds = %1379, %1373
  br label %1391

1391:                                             ; preds = %1390, %1310
  br label %1392

1392:                                             ; preds = %1391, %1247
  br label %1393

1393:                                             ; preds = %1392, %1184
  br label %1394

1394:                                             ; preds = %1393, %1121
  br label %1395

1395:                                             ; preds = %1394, %1058
  br label %1396

1396:                                             ; preds = %1395, %995
  br label %1397

1397:                                             ; preds = %1396, %932
  br label %1398

1398:                                             ; preds = %1397, %874
  br label %1399

1399:                                             ; preds = %1398, %787
  br label %1400

1400:                                             ; preds = %1399, %724
  br label %1401

1401:                                             ; preds = %1400, %661
  br label %1402

1402:                                             ; preds = %1401, %598
  br label %1403

1403:                                             ; preds = %1402, %535
  br label %1404

1404:                                             ; preds = %1403, %472
  br label %1405

1405:                                             ; preds = %1404, %409
  br label %1406

1406:                                             ; preds = %1405, %346
  br label %1407

1407:                                             ; preds = %1406, %288
  br label %1408

1408:                                             ; preds = %1407, %195
  br label %1409

1409:                                             ; preds = %1408, %173
  br label %1410

1410:                                             ; preds = %1409, %150
  br label %1411

1411:                                             ; preds = %1410, %127
  br label %1412

1412:                                             ; preds = %1411, %105
  br label %1413

1413:                                             ; preds = %1412, %83
  %1414 = load ptr, ptr %8, align 8
  store ptr %1414, ptr %4, align 8
  br label %1415

1415:                                             ; preds = %1413, %873, %287, %70
  %1416 = load ptr, ptr %4, align 8
  ret ptr %1416
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @subCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i32, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i32, align 4
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i32, align 4
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %70, label %67

67:                                               ; preds = %3
  %68 = load ptr, ptr %7, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %67, %3
  store ptr null, ptr %4, align 8
  br label %1415

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = call ptr @arenaAlloc(ptr noundef %72, i32 noundef 16)
  store ptr %73, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %95

78:                                               ; preds = %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %95

83:                                               ; preds = %78
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 0
  store i32 0, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 8
  %92 = sub nsw i32 %88, %91
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1
  store i32 %92, ptr %94, align 8
  br label %1413

95:                                               ; preds = %78, %71
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 1
  br i1 %99, label %100, label %117

100:                                              ; preds = %95
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %117

105:                                              ; preds = %100
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 0
  store i32 1, ptr %107, align 8
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = load ptr, ptr %7, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = fsub double %110, %113
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 1
  store double %114, ptr %116, align 8
  br label %1412

117:                                              ; preds = %100, %95
  %118 = load ptr, ptr %6, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %140

122:                                              ; preds = %117
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %127, label %140

127:                                              ; preds = %122
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 0
  store i32 1, ptr %129, align 8
  %130 = load ptr, ptr %6, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load i32, ptr %131, align 8
  %133 = sitofp i32 %132 to double
  %134 = load ptr, ptr %7, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load double, ptr %135, align 8
  %137 = fsub double %133, %136
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 1
  store double %137, ptr %139, align 8
  br label %1411

140:                                              ; preds = %122, %117
  %141 = load ptr, ptr %6, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  %143 = load i32, ptr %142, align 8
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %163

145:                                              ; preds = %140
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %163

150:                                              ; preds = %145
  %151 = load ptr, ptr %8, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 0
  store i32 1, ptr %152, align 8
  %153 = load ptr, ptr %6, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load i32, ptr %157, align 8
  %159 = sitofp i32 %158 to double
  %160 = fsub double %155, %159
  %161 = load ptr, ptr %8, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  store double %160, ptr %162, align 8
  br label %1410

163:                                              ; preds = %145, %140
  %164 = load ptr, ptr %6, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 0
  %166 = load i32, ptr %165, align 8
  %167 = icmp eq i32 %166, 2
  br i1 %167, label %168, label %185

168:                                              ; preds = %163
  %169 = load ptr, ptr %7, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %171, 2
  br i1 %172, label %173, label %185

173:                                              ; preds = %168
  %174 = load ptr, ptr %8, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 0
  store i32 2, ptr %175, align 8
  %176 = load ptr, ptr %6, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = load ptr, ptr %7, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load double, ptr %180, align 8
  %182 = fsub double %178, %181
  %183 = load ptr, ptr %8, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 1
  store double %182, ptr %184, align 8
  br label %1409

185:                                              ; preds = %168, %163
  %186 = load ptr, ptr %6, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = icmp eq i32 %188, 3
  br i1 %189, label %190, label %207

190:                                              ; preds = %185
  %191 = load ptr, ptr %7, align 8
  %192 = getelementptr inbounds %struct.CalcLangVal, ptr %191, i32 0, i32 0
  %193 = load i32, ptr %192, align 8
  %194 = icmp eq i32 %193, 3
  br i1 %194, label %195, label %207

195:                                              ; preds = %190
  %196 = load ptr, ptr %8, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 0
  store i32 3, ptr %197, align 8
  %198 = load ptr, ptr %6, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 1
  %200 = load double, ptr %199, align 8
  %201 = load ptr, ptr %7, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 1
  %203 = load double, ptr %202, align 8
  %204 = fsub double %200, %203
  %205 = load ptr, ptr %8, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 1
  store double %204, ptr %206, align 8
  br label %1408

207:                                              ; preds = %190, %185
  %208 = load ptr, ptr %6, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 0
  %210 = load i32, ptr %209, align 8
  %211 = icmp eq i32 %210, 6
  br i1 %211, label %212, label %289

212:                                              ; preds = %207
  %213 = load ptr, ptr %7, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 0
  %215 = load i32, ptr %214, align 8
  %216 = icmp eq i32 %215, 6
  br i1 %216, label %217, label %289

217:                                              ; preds = %212
  %218 = load ptr, ptr %6, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 1
  %220 = load ptr, ptr %219, align 8
  store ptr %220, ptr %9, align 8
  %221 = load ptr, ptr %7, align 8
  %222 = getelementptr inbounds %struct.CalcLangVal, ptr %221, i32 0, i32 1
  %223 = load ptr, ptr %222, align 8
  store ptr %223, ptr %10, align 8
  %224 = load ptr, ptr %10, align 8
  %225 = getelementptr inbounds %struct.TupleValue, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 8
  %227 = load ptr, ptr %9, align 8
  %228 = getelementptr inbounds %struct.TupleValue, ptr %227, i32 0, i32 0
  %229 = load i32, ptr %228, align 8
  %230 = icmp eq i32 %226, %229
  br i1 %230, label %231, label %287

231:                                              ; preds = %217
  %232 = load ptr, ptr %5, align 8
  %233 = call ptr @arenaAlloc(ptr noundef %232, i32 noundef 16)
  store ptr %233, ptr %11, align 8
  %234 = load ptr, ptr %9, align 8
  %235 = getelementptr inbounds %struct.TupleValue, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = load ptr, ptr %11, align 8
  %238 = getelementptr inbounds %struct.TupleValue, ptr %237, i32 0, i32 0
  store i32 %236, ptr %238, align 8
  %239 = load ptr, ptr %5, align 8
  %240 = load ptr, ptr %11, align 8
  %241 = getelementptr inbounds %struct.TupleValue, ptr %240, i32 0, i32 0
  %242 = load i32, ptr %241, align 8
  %243 = sext i32 %242 to i64
  %244 = mul i64 8, %243
  %245 = trunc i64 %244 to i32
  %246 = call ptr @arenaAlloc(ptr noundef %239, i32 noundef %245)
  %247 = load ptr, ptr %11, align 8
  %248 = getelementptr inbounds %struct.TupleValue, ptr %247, i32 0, i32 1
  store ptr %246, ptr %248, align 8
  store i32 0, ptr %12, align 4
  br label %249

249:                                              ; preds = %278, %231
  %250 = load i32, ptr %12, align 4
  %251 = load ptr, ptr %9, align 8
  %252 = getelementptr inbounds %struct.TupleValue, ptr %251, i32 0, i32 0
  %253 = load i32, ptr %252, align 8
  %254 = icmp slt i32 %250, %253
  br i1 %254, label %255, label %281

255:                                              ; preds = %249
  %256 = load ptr, ptr %5, align 8
  %257 = load ptr, ptr %9, align 8
  %258 = getelementptr inbounds %struct.TupleValue, ptr %257, i32 0, i32 1
  %259 = load ptr, ptr %258, align 8
  %260 = load i32, ptr %12, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds ptr, ptr %259, i64 %261
  %263 = load ptr, ptr %262, align 8
  %264 = load ptr, ptr %10, align 8
  %265 = getelementptr inbounds %struct.TupleValue, ptr %264, i32 0, i32 1
  %266 = load ptr, ptr %265, align 8
  %267 = load i32, ptr %12, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds ptr, ptr %266, i64 %268
  %270 = load ptr, ptr %269, align 8
  %271 = call ptr @subCalcLangValues(ptr noundef %256, ptr noundef %263, ptr noundef %270)
  %272 = load ptr, ptr %11, align 8
  %273 = getelementptr inbounds %struct.TupleValue, ptr %272, i32 0, i32 1
  %274 = load ptr, ptr %273, align 8
  %275 = load i32, ptr %12, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds ptr, ptr %274, i64 %276
  store ptr %271, ptr %277, align 8
  br label %278

278:                                              ; preds = %255
  %279 = load i32, ptr %12, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, ptr %12, align 4
  br label %249, !llvm.loop !26

281:                                              ; preds = %249
  %282 = load ptr, ptr %8, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 0
  store i32 6, ptr %283, align 8
  %284 = load ptr, ptr %11, align 8
  %285 = load ptr, ptr %8, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 1
  store ptr %284, ptr %286, align 8
  br label %288

287:                                              ; preds = %217
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1415

288:                                              ; preds = %281
  br label %1407

289:                                              ; preds = %212, %207
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 0
  %292 = load i32, ptr %291, align 8
  %293 = icmp eq i32 %292, 6
  br i1 %293, label %294, label %352

294:                                              ; preds = %289
  %295 = load ptr, ptr %7, align 8
  %296 = getelementptr inbounds %struct.CalcLangVal, ptr %295, i32 0, i32 0
  %297 = load i32, ptr %296, align 8
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %299, label %352

299:                                              ; preds = %294
  %300 = load ptr, ptr %6, align 8
  %301 = getelementptr inbounds %struct.CalcLangVal, ptr %300, i32 0, i32 1
  %302 = load ptr, ptr %301, align 8
  store ptr %302, ptr %13, align 8
  %303 = load ptr, ptr %5, align 8
  %304 = call ptr @arenaAlloc(ptr noundef %303, i32 noundef 16)
  store ptr %304, ptr %14, align 8
  %305 = load ptr, ptr %13, align 8
  %306 = getelementptr inbounds %struct.TupleValue, ptr %305, i32 0, i32 0
  %307 = load i32, ptr %306, align 8
  %308 = load ptr, ptr %14, align 8
  %309 = getelementptr inbounds %struct.TupleValue, ptr %308, i32 0, i32 0
  store i32 %307, ptr %309, align 8
  %310 = load ptr, ptr %5, align 8
  %311 = load ptr, ptr %14, align 8
  %312 = getelementptr inbounds %struct.TupleValue, ptr %311, i32 0, i32 0
  %313 = load i32, ptr %312, align 8
  %314 = sext i32 %313 to i64
  %315 = mul i64 8, %314
  %316 = trunc i64 %315 to i32
  %317 = call ptr @arenaAlloc(ptr noundef %310, i32 noundef %316)
  %318 = load ptr, ptr %14, align 8
  %319 = getelementptr inbounds %struct.TupleValue, ptr %318, i32 0, i32 1
  store ptr %317, ptr %319, align 8
  store i32 0, ptr %15, align 4
  br label %320

320:                                              ; preds = %343, %299
  %321 = load i32, ptr %15, align 4
  %322 = load ptr, ptr %13, align 8
  %323 = getelementptr inbounds %struct.TupleValue, ptr %322, i32 0, i32 0
  %324 = load i32, ptr %323, align 8
  %325 = icmp slt i32 %321, %324
  br i1 %325, label %326, label %346

326:                                              ; preds = %320
  %327 = load ptr, ptr %5, align 8
  %328 = load ptr, ptr %13, align 8
  %329 = getelementptr inbounds %struct.TupleValue, ptr %328, i32 0, i32 1
  %330 = load ptr, ptr %329, align 8
  %331 = load i32, ptr %15, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds ptr, ptr %330, i64 %332
  %334 = load ptr, ptr %333, align 8
  %335 = load ptr, ptr %7, align 8
  %336 = call ptr @subCalcLangValues(ptr noundef %327, ptr noundef %334, ptr noundef %335)
  %337 = load ptr, ptr %14, align 8
  %338 = getelementptr inbounds %struct.TupleValue, ptr %337, i32 0, i32 1
  %339 = load ptr, ptr %338, align 8
  %340 = load i32, ptr %15, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds ptr, ptr %339, i64 %341
  store ptr %336, ptr %342, align 8
  br label %343

343:                                              ; preds = %326
  %344 = load i32, ptr %15, align 4
  %345 = add nsw i32 %344, 1
  store i32 %345, ptr %15, align 4
  br label %320, !llvm.loop !27

346:                                              ; preds = %320
  %347 = load ptr, ptr %8, align 8
  %348 = getelementptr inbounds %struct.CalcLangVal, ptr %347, i32 0, i32 0
  store i32 6, ptr %348, align 8
  %349 = load ptr, ptr %14, align 8
  %350 = load ptr, ptr %8, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 1
  store ptr %349, ptr %351, align 8
  br label %1406

352:                                              ; preds = %294, %289
  %353 = load ptr, ptr %6, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 0
  %355 = load i32, ptr %354, align 8
  %356 = icmp eq i32 %355, 0
  br i1 %356, label %357, label %415

357:                                              ; preds = %352
  %358 = load ptr, ptr %7, align 8
  %359 = getelementptr inbounds %struct.CalcLangVal, ptr %358, i32 0, i32 0
  %360 = load i32, ptr %359, align 8
  %361 = icmp eq i32 %360, 6
  br i1 %361, label %362, label %415

362:                                              ; preds = %357
  %363 = load ptr, ptr %7, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 1
  %365 = load ptr, ptr %364, align 8
  store ptr %365, ptr %16, align 8
  %366 = load ptr, ptr %5, align 8
  %367 = call ptr @arenaAlloc(ptr noundef %366, i32 noundef 16)
  store ptr %367, ptr %17, align 8
  %368 = load ptr, ptr %16, align 8
  %369 = getelementptr inbounds %struct.TupleValue, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = load ptr, ptr %17, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 0
  store i32 %370, ptr %372, align 8
  %373 = load ptr, ptr %5, align 8
  %374 = load ptr, ptr %17, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 0
  %376 = load i32, ptr %375, align 8
  %377 = sext i32 %376 to i64
  %378 = mul i64 8, %377
  %379 = trunc i64 %378 to i32
  %380 = call ptr @arenaAlloc(ptr noundef %373, i32 noundef %379)
  %381 = load ptr, ptr %17, align 8
  %382 = getelementptr inbounds %struct.TupleValue, ptr %381, i32 0, i32 1
  store ptr %380, ptr %382, align 8
  store i32 0, ptr %18, align 4
  br label %383

383:                                              ; preds = %406, %362
  %384 = load i32, ptr %18, align 4
  %385 = load ptr, ptr %16, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = icmp slt i32 %384, %387
  br i1 %388, label %389, label %409

389:                                              ; preds = %383
  %390 = load ptr, ptr %5, align 8
  %391 = load ptr, ptr %6, align 8
  %392 = load ptr, ptr %16, align 8
  %393 = getelementptr inbounds %struct.TupleValue, ptr %392, i32 0, i32 1
  %394 = load ptr, ptr %393, align 8
  %395 = load i32, ptr %18, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds ptr, ptr %394, i64 %396
  %398 = load ptr, ptr %397, align 8
  %399 = call ptr @subCalcLangValues(ptr noundef %390, ptr noundef %391, ptr noundef %398)
  %400 = load ptr, ptr %17, align 8
  %401 = getelementptr inbounds %struct.TupleValue, ptr %400, i32 0, i32 1
  %402 = load ptr, ptr %401, align 8
  %403 = load i32, ptr %18, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds ptr, ptr %402, i64 %404
  store ptr %399, ptr %405, align 8
  br label %406

406:                                              ; preds = %389
  %407 = load i32, ptr %18, align 4
  %408 = add nsw i32 %407, 1
  store i32 %408, ptr %18, align 4
  br label %383, !llvm.loop !28

409:                                              ; preds = %383
  %410 = load ptr, ptr %8, align 8
  %411 = getelementptr inbounds %struct.CalcLangVal, ptr %410, i32 0, i32 0
  store i32 6, ptr %411, align 8
  %412 = load ptr, ptr %17, align 8
  %413 = load ptr, ptr %8, align 8
  %414 = getelementptr inbounds %struct.CalcLangVal, ptr %413, i32 0, i32 1
  store ptr %412, ptr %414, align 8
  br label %1405

415:                                              ; preds = %357, %352
  %416 = load ptr, ptr %6, align 8
  %417 = getelementptr inbounds %struct.CalcLangVal, ptr %416, i32 0, i32 0
  %418 = load i32, ptr %417, align 8
  %419 = icmp eq i32 %418, 6
  br i1 %419, label %420, label %478

420:                                              ; preds = %415
  %421 = load ptr, ptr %7, align 8
  %422 = getelementptr inbounds %struct.CalcLangVal, ptr %421, i32 0, i32 0
  %423 = load i32, ptr %422, align 8
  %424 = icmp eq i32 %423, 1
  br i1 %424, label %425, label %478

425:                                              ; preds = %420
  %426 = load ptr, ptr %6, align 8
  %427 = getelementptr inbounds %struct.CalcLangVal, ptr %426, i32 0, i32 1
  %428 = load ptr, ptr %427, align 8
  store ptr %428, ptr %19, align 8
  %429 = load ptr, ptr %5, align 8
  %430 = call ptr @arenaAlloc(ptr noundef %429, i32 noundef 16)
  store ptr %430, ptr %20, align 8
  %431 = load ptr, ptr %19, align 8
  %432 = getelementptr inbounds %struct.TupleValue, ptr %431, i32 0, i32 0
  %433 = load i32, ptr %432, align 8
  %434 = load ptr, ptr %20, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  store i32 %433, ptr %435, align 8
  %436 = load ptr, ptr %5, align 8
  %437 = load ptr, ptr %20, align 8
  %438 = getelementptr inbounds %struct.TupleValue, ptr %437, i32 0, i32 0
  %439 = load i32, ptr %438, align 8
  %440 = sext i32 %439 to i64
  %441 = mul i64 8, %440
  %442 = trunc i64 %441 to i32
  %443 = call ptr @arenaAlloc(ptr noundef %436, i32 noundef %442)
  %444 = load ptr, ptr %20, align 8
  %445 = getelementptr inbounds %struct.TupleValue, ptr %444, i32 0, i32 1
  store ptr %443, ptr %445, align 8
  store i32 0, ptr %21, align 4
  br label %446

446:                                              ; preds = %469, %425
  %447 = load i32, ptr %21, align 4
  %448 = load ptr, ptr %19, align 8
  %449 = getelementptr inbounds %struct.TupleValue, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = icmp slt i32 %447, %450
  br i1 %451, label %452, label %472

452:                                              ; preds = %446
  %453 = load ptr, ptr %5, align 8
  %454 = load ptr, ptr %19, align 8
  %455 = getelementptr inbounds %struct.TupleValue, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = load i32, ptr %21, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds ptr, ptr %456, i64 %458
  %460 = load ptr, ptr %459, align 8
  %461 = load ptr, ptr %7, align 8
  %462 = call ptr @subCalcLangValues(ptr noundef %453, ptr noundef %460, ptr noundef %461)
  %463 = load ptr, ptr %20, align 8
  %464 = getelementptr inbounds %struct.TupleValue, ptr %463, i32 0, i32 1
  %465 = load ptr, ptr %464, align 8
  %466 = load i32, ptr %21, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds ptr, ptr %465, i64 %467
  store ptr %462, ptr %468, align 8
  br label %469

469:                                              ; preds = %452
  %470 = load i32, ptr %21, align 4
  %471 = add nsw i32 %470, 1
  store i32 %471, ptr %21, align 4
  br label %446, !llvm.loop !29

472:                                              ; preds = %446
  %473 = load ptr, ptr %8, align 8
  %474 = getelementptr inbounds %struct.CalcLangVal, ptr %473, i32 0, i32 0
  store i32 6, ptr %474, align 8
  %475 = load ptr, ptr %20, align 8
  %476 = load ptr, ptr %8, align 8
  %477 = getelementptr inbounds %struct.CalcLangVal, ptr %476, i32 0, i32 1
  store ptr %475, ptr %477, align 8
  br label %1404

478:                                              ; preds = %420, %415
  %479 = load ptr, ptr %6, align 8
  %480 = getelementptr inbounds %struct.CalcLangVal, ptr %479, i32 0, i32 0
  %481 = load i32, ptr %480, align 8
  %482 = icmp eq i32 %481, 1
  br i1 %482, label %483, label %541

483:                                              ; preds = %478
  %484 = load ptr, ptr %7, align 8
  %485 = getelementptr inbounds %struct.CalcLangVal, ptr %484, i32 0, i32 0
  %486 = load i32, ptr %485, align 8
  %487 = icmp eq i32 %486, 6
  br i1 %487, label %488, label %541

488:                                              ; preds = %483
  %489 = load ptr, ptr %7, align 8
  %490 = getelementptr inbounds %struct.CalcLangVal, ptr %489, i32 0, i32 1
  %491 = load ptr, ptr %490, align 8
  store ptr %491, ptr %22, align 8
  %492 = load ptr, ptr %5, align 8
  %493 = call ptr @arenaAlloc(ptr noundef %492, i32 noundef 16)
  store ptr %493, ptr %23, align 8
  %494 = load ptr, ptr %22, align 8
  %495 = getelementptr inbounds %struct.TupleValue, ptr %494, i32 0, i32 0
  %496 = load i32, ptr %495, align 8
  %497 = load ptr, ptr %23, align 8
  %498 = getelementptr inbounds %struct.TupleValue, ptr %497, i32 0, i32 0
  store i32 %496, ptr %498, align 8
  %499 = load ptr, ptr %5, align 8
  %500 = load ptr, ptr %23, align 8
  %501 = getelementptr inbounds %struct.TupleValue, ptr %500, i32 0, i32 0
  %502 = load i32, ptr %501, align 8
  %503 = sext i32 %502 to i64
  %504 = mul i64 8, %503
  %505 = trunc i64 %504 to i32
  %506 = call ptr @arenaAlloc(ptr noundef %499, i32 noundef %505)
  %507 = load ptr, ptr %23, align 8
  %508 = getelementptr inbounds %struct.TupleValue, ptr %507, i32 0, i32 1
  store ptr %506, ptr %508, align 8
  store i32 0, ptr %24, align 4
  br label %509

509:                                              ; preds = %532, %488
  %510 = load i32, ptr %24, align 4
  %511 = load ptr, ptr %22, align 8
  %512 = getelementptr inbounds %struct.TupleValue, ptr %511, i32 0, i32 0
  %513 = load i32, ptr %512, align 8
  %514 = icmp slt i32 %510, %513
  br i1 %514, label %515, label %535

515:                                              ; preds = %509
  %516 = load ptr, ptr %5, align 8
  %517 = load ptr, ptr %6, align 8
  %518 = load ptr, ptr %22, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 1
  %520 = load ptr, ptr %519, align 8
  %521 = load i32, ptr %24, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds ptr, ptr %520, i64 %522
  %524 = load ptr, ptr %523, align 8
  %525 = call ptr @subCalcLangValues(ptr noundef %516, ptr noundef %517, ptr noundef %524)
  %526 = load ptr, ptr %23, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 1
  %528 = load ptr, ptr %527, align 8
  %529 = load i32, ptr %24, align 4
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds ptr, ptr %528, i64 %530
  store ptr %525, ptr %531, align 8
  br label %532

532:                                              ; preds = %515
  %533 = load i32, ptr %24, align 4
  %534 = add nsw i32 %533, 1
  store i32 %534, ptr %24, align 4
  br label %509, !llvm.loop !30

535:                                              ; preds = %509
  %536 = load ptr, ptr %8, align 8
  %537 = getelementptr inbounds %struct.CalcLangVal, ptr %536, i32 0, i32 0
  store i32 6, ptr %537, align 8
  %538 = load ptr, ptr %23, align 8
  %539 = load ptr, ptr %8, align 8
  %540 = getelementptr inbounds %struct.CalcLangVal, ptr %539, i32 0, i32 1
  store ptr %538, ptr %540, align 8
  br label %1403

541:                                              ; preds = %483, %478
  %542 = load ptr, ptr %6, align 8
  %543 = getelementptr inbounds %struct.CalcLangVal, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = icmp eq i32 %544, 6
  br i1 %545, label %546, label %604

546:                                              ; preds = %541
  %547 = load ptr, ptr %7, align 8
  %548 = getelementptr inbounds %struct.CalcLangVal, ptr %547, i32 0, i32 0
  %549 = load i32, ptr %548, align 8
  %550 = icmp eq i32 %549, 2
  br i1 %550, label %551, label %604

551:                                              ; preds = %546
  %552 = load ptr, ptr %6, align 8
  %553 = getelementptr inbounds %struct.CalcLangVal, ptr %552, i32 0, i32 1
  %554 = load ptr, ptr %553, align 8
  store ptr %554, ptr %25, align 8
  %555 = load ptr, ptr %5, align 8
  %556 = call ptr @arenaAlloc(ptr noundef %555, i32 noundef 16)
  store ptr %556, ptr %26, align 8
  %557 = load ptr, ptr %25, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 0
  %559 = load i32, ptr %558, align 8
  %560 = load ptr, ptr %26, align 8
  %561 = getelementptr inbounds %struct.TupleValue, ptr %560, i32 0, i32 0
  store i32 %559, ptr %561, align 8
  %562 = load ptr, ptr %5, align 8
  %563 = load ptr, ptr %26, align 8
  %564 = getelementptr inbounds %struct.TupleValue, ptr %563, i32 0, i32 0
  %565 = load i32, ptr %564, align 8
  %566 = sext i32 %565 to i64
  %567 = mul i64 8, %566
  %568 = trunc i64 %567 to i32
  %569 = call ptr @arenaAlloc(ptr noundef %562, i32 noundef %568)
  %570 = load ptr, ptr %26, align 8
  %571 = getelementptr inbounds %struct.TupleValue, ptr %570, i32 0, i32 1
  store ptr %569, ptr %571, align 8
  store i32 0, ptr %27, align 4
  br label %572

572:                                              ; preds = %595, %551
  %573 = load i32, ptr %27, align 4
  %574 = load ptr, ptr %25, align 8
  %575 = getelementptr inbounds %struct.TupleValue, ptr %574, i32 0, i32 0
  %576 = load i32, ptr %575, align 8
  %577 = icmp slt i32 %573, %576
  br i1 %577, label %578, label %598

578:                                              ; preds = %572
  %579 = load ptr, ptr %5, align 8
  %580 = load ptr, ptr %25, align 8
  %581 = getelementptr inbounds %struct.TupleValue, ptr %580, i32 0, i32 1
  %582 = load ptr, ptr %581, align 8
  %583 = load i32, ptr %27, align 4
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds ptr, ptr %582, i64 %584
  %586 = load ptr, ptr %585, align 8
  %587 = load ptr, ptr %7, align 8
  %588 = call ptr @subCalcLangValues(ptr noundef %579, ptr noundef %586, ptr noundef %587)
  %589 = load ptr, ptr %26, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 1
  %591 = load ptr, ptr %590, align 8
  %592 = load i32, ptr %27, align 4
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds ptr, ptr %591, i64 %593
  store ptr %588, ptr %594, align 8
  br label %595

595:                                              ; preds = %578
  %596 = load i32, ptr %27, align 4
  %597 = add nsw i32 %596, 1
  store i32 %597, ptr %27, align 4
  br label %572, !llvm.loop !31

598:                                              ; preds = %572
  %599 = load ptr, ptr %8, align 8
  %600 = getelementptr inbounds %struct.CalcLangVal, ptr %599, i32 0, i32 0
  store i32 6, ptr %600, align 8
  %601 = load ptr, ptr %26, align 8
  %602 = load ptr, ptr %8, align 8
  %603 = getelementptr inbounds %struct.CalcLangVal, ptr %602, i32 0, i32 1
  store ptr %601, ptr %603, align 8
  br label %1402

604:                                              ; preds = %546, %541
  %605 = load ptr, ptr %6, align 8
  %606 = getelementptr inbounds %struct.CalcLangVal, ptr %605, i32 0, i32 0
  %607 = load i32, ptr %606, align 8
  %608 = icmp eq i32 %607, 2
  br i1 %608, label %609, label %667

609:                                              ; preds = %604
  %610 = load ptr, ptr %7, align 8
  %611 = getelementptr inbounds %struct.CalcLangVal, ptr %610, i32 0, i32 0
  %612 = load i32, ptr %611, align 8
  %613 = icmp eq i32 %612, 6
  br i1 %613, label %614, label %667

614:                                              ; preds = %609
  %615 = load ptr, ptr %7, align 8
  %616 = getelementptr inbounds %struct.CalcLangVal, ptr %615, i32 0, i32 1
  %617 = load ptr, ptr %616, align 8
  store ptr %617, ptr %28, align 8
  %618 = load ptr, ptr %5, align 8
  %619 = call ptr @arenaAlloc(ptr noundef %618, i32 noundef 16)
  store ptr %619, ptr %29, align 8
  %620 = load ptr, ptr %28, align 8
  %621 = getelementptr inbounds %struct.TupleValue, ptr %620, i32 0, i32 0
  %622 = load i32, ptr %621, align 8
  %623 = load ptr, ptr %29, align 8
  %624 = getelementptr inbounds %struct.TupleValue, ptr %623, i32 0, i32 0
  store i32 %622, ptr %624, align 8
  %625 = load ptr, ptr %5, align 8
  %626 = load ptr, ptr %29, align 8
  %627 = getelementptr inbounds %struct.TupleValue, ptr %626, i32 0, i32 0
  %628 = load i32, ptr %627, align 8
  %629 = sext i32 %628 to i64
  %630 = mul i64 8, %629
  %631 = trunc i64 %630 to i32
  %632 = call ptr @arenaAlloc(ptr noundef %625, i32 noundef %631)
  %633 = load ptr, ptr %29, align 8
  %634 = getelementptr inbounds %struct.TupleValue, ptr %633, i32 0, i32 1
  store ptr %632, ptr %634, align 8
  store i32 0, ptr %30, align 4
  br label %635

635:                                              ; preds = %658, %614
  %636 = load i32, ptr %30, align 4
  %637 = load ptr, ptr %28, align 8
  %638 = getelementptr inbounds %struct.TupleValue, ptr %637, i32 0, i32 0
  %639 = load i32, ptr %638, align 8
  %640 = icmp slt i32 %636, %639
  br i1 %640, label %641, label %661

641:                                              ; preds = %635
  %642 = load ptr, ptr %5, align 8
  %643 = load ptr, ptr %6, align 8
  %644 = load ptr, ptr %28, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  %647 = load i32, ptr %30, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds ptr, ptr %646, i64 %648
  %650 = load ptr, ptr %649, align 8
  %651 = call ptr @subCalcLangValues(ptr noundef %642, ptr noundef %643, ptr noundef %650)
  %652 = load ptr, ptr %29, align 8
  %653 = getelementptr inbounds %struct.TupleValue, ptr %652, i32 0, i32 1
  %654 = load ptr, ptr %653, align 8
  %655 = load i32, ptr %30, align 4
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds ptr, ptr %654, i64 %656
  store ptr %651, ptr %657, align 8
  br label %658

658:                                              ; preds = %641
  %659 = load i32, ptr %30, align 4
  %660 = add nsw i32 %659, 1
  store i32 %660, ptr %30, align 4
  br label %635, !llvm.loop !32

661:                                              ; preds = %635
  %662 = load ptr, ptr %8, align 8
  %663 = getelementptr inbounds %struct.CalcLangVal, ptr %662, i32 0, i32 0
  store i32 6, ptr %663, align 8
  %664 = load ptr, ptr %29, align 8
  %665 = load ptr, ptr %8, align 8
  %666 = getelementptr inbounds %struct.CalcLangVal, ptr %665, i32 0, i32 1
  store ptr %664, ptr %666, align 8
  br label %1401

667:                                              ; preds = %609, %604
  %668 = load ptr, ptr %6, align 8
  %669 = getelementptr inbounds %struct.CalcLangVal, ptr %668, i32 0, i32 0
  %670 = load i32, ptr %669, align 8
  %671 = icmp eq i32 %670, 6
  br i1 %671, label %672, label %730

672:                                              ; preds = %667
  %673 = load ptr, ptr %7, align 8
  %674 = getelementptr inbounds %struct.CalcLangVal, ptr %673, i32 0, i32 0
  %675 = load i32, ptr %674, align 8
  %676 = icmp eq i32 %675, 3
  br i1 %676, label %677, label %730

677:                                              ; preds = %672
  %678 = load ptr, ptr %6, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 1
  %680 = load ptr, ptr %679, align 8
  store ptr %680, ptr %31, align 8
  %681 = load ptr, ptr %5, align 8
  %682 = call ptr @arenaAlloc(ptr noundef %681, i32 noundef 16)
  store ptr %682, ptr %32, align 8
  %683 = load ptr, ptr %31, align 8
  %684 = getelementptr inbounds %struct.TupleValue, ptr %683, i32 0, i32 0
  %685 = load i32, ptr %684, align 8
  %686 = load ptr, ptr %32, align 8
  %687 = getelementptr inbounds %struct.TupleValue, ptr %686, i32 0, i32 0
  store i32 %685, ptr %687, align 8
  %688 = load ptr, ptr %5, align 8
  %689 = load ptr, ptr %32, align 8
  %690 = getelementptr inbounds %struct.TupleValue, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = sext i32 %691 to i64
  %693 = mul i64 8, %692
  %694 = trunc i64 %693 to i32
  %695 = call ptr @arenaAlloc(ptr noundef %688, i32 noundef %694)
  %696 = load ptr, ptr %32, align 8
  %697 = getelementptr inbounds %struct.TupleValue, ptr %696, i32 0, i32 1
  store ptr %695, ptr %697, align 8
  store i32 0, ptr %33, align 4
  br label %698

698:                                              ; preds = %721, %677
  %699 = load i32, ptr %33, align 4
  %700 = load ptr, ptr %31, align 8
  %701 = getelementptr inbounds %struct.TupleValue, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = icmp slt i32 %699, %702
  br i1 %703, label %704, label %724

704:                                              ; preds = %698
  %705 = load ptr, ptr %5, align 8
  %706 = load ptr, ptr %31, align 8
  %707 = getelementptr inbounds %struct.TupleValue, ptr %706, i32 0, i32 1
  %708 = load ptr, ptr %707, align 8
  %709 = load i32, ptr %33, align 4
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds ptr, ptr %708, i64 %710
  %712 = load ptr, ptr %711, align 8
  %713 = load ptr, ptr %7, align 8
  %714 = call ptr @subCalcLangValues(ptr noundef %705, ptr noundef %712, ptr noundef %713)
  %715 = load ptr, ptr %32, align 8
  %716 = getelementptr inbounds %struct.TupleValue, ptr %715, i32 0, i32 1
  %717 = load ptr, ptr %716, align 8
  %718 = load i32, ptr %33, align 4
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds ptr, ptr %717, i64 %719
  store ptr %714, ptr %720, align 8
  br label %721

721:                                              ; preds = %704
  %722 = load i32, ptr %33, align 4
  %723 = add nsw i32 %722, 1
  store i32 %723, ptr %33, align 4
  br label %698, !llvm.loop !33

724:                                              ; preds = %698
  %725 = load ptr, ptr %8, align 8
  %726 = getelementptr inbounds %struct.CalcLangVal, ptr %725, i32 0, i32 0
  store i32 6, ptr %726, align 8
  %727 = load ptr, ptr %32, align 8
  %728 = load ptr, ptr %8, align 8
  %729 = getelementptr inbounds %struct.CalcLangVal, ptr %728, i32 0, i32 1
  store ptr %727, ptr %729, align 8
  br label %1400

730:                                              ; preds = %672, %667
  %731 = load ptr, ptr %6, align 8
  %732 = getelementptr inbounds %struct.CalcLangVal, ptr %731, i32 0, i32 0
  %733 = load i32, ptr %732, align 8
  %734 = icmp eq i32 %733, 3
  br i1 %734, label %735, label %793

735:                                              ; preds = %730
  %736 = load ptr, ptr %7, align 8
  %737 = getelementptr inbounds %struct.CalcLangVal, ptr %736, i32 0, i32 0
  %738 = load i32, ptr %737, align 8
  %739 = icmp eq i32 %738, 6
  br i1 %739, label %740, label %793

740:                                              ; preds = %735
  %741 = load ptr, ptr %7, align 8
  %742 = getelementptr inbounds %struct.CalcLangVal, ptr %741, i32 0, i32 1
  %743 = load ptr, ptr %742, align 8
  store ptr %743, ptr %34, align 8
  %744 = load ptr, ptr %5, align 8
  %745 = call ptr @arenaAlloc(ptr noundef %744, i32 noundef 16)
  store ptr %745, ptr %35, align 8
  %746 = load ptr, ptr %34, align 8
  %747 = getelementptr inbounds %struct.TupleValue, ptr %746, i32 0, i32 0
  %748 = load i32, ptr %747, align 8
  %749 = load ptr, ptr %35, align 8
  %750 = getelementptr inbounds %struct.TupleValue, ptr %749, i32 0, i32 0
  store i32 %748, ptr %750, align 8
  %751 = load ptr, ptr %5, align 8
  %752 = load ptr, ptr %35, align 8
  %753 = getelementptr inbounds %struct.TupleValue, ptr %752, i32 0, i32 0
  %754 = load i32, ptr %753, align 8
  %755 = sext i32 %754 to i64
  %756 = mul i64 8, %755
  %757 = trunc i64 %756 to i32
  %758 = call ptr @arenaAlloc(ptr noundef %751, i32 noundef %757)
  %759 = load ptr, ptr %35, align 8
  %760 = getelementptr inbounds %struct.TupleValue, ptr %759, i32 0, i32 1
  store ptr %758, ptr %760, align 8
  store i32 0, ptr %36, align 4
  br label %761

761:                                              ; preds = %784, %740
  %762 = load i32, ptr %36, align 4
  %763 = load ptr, ptr %34, align 8
  %764 = getelementptr inbounds %struct.TupleValue, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = icmp slt i32 %762, %765
  br i1 %766, label %767, label %787

767:                                              ; preds = %761
  %768 = load ptr, ptr %5, align 8
  %769 = load ptr, ptr %6, align 8
  %770 = load ptr, ptr %34, align 8
  %771 = getelementptr inbounds %struct.TupleValue, ptr %770, i32 0, i32 1
  %772 = load ptr, ptr %771, align 8
  %773 = load i32, ptr %36, align 4
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds ptr, ptr %772, i64 %774
  %776 = load ptr, ptr %775, align 8
  %777 = call ptr @subCalcLangValues(ptr noundef %768, ptr noundef %769, ptr noundef %776)
  %778 = load ptr, ptr %35, align 8
  %779 = getelementptr inbounds %struct.TupleValue, ptr %778, i32 0, i32 1
  %780 = load ptr, ptr %779, align 8
  %781 = load i32, ptr %36, align 4
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds ptr, ptr %780, i64 %782
  store ptr %777, ptr %783, align 8
  br label %784

784:                                              ; preds = %767
  %785 = load i32, ptr %36, align 4
  %786 = add nsw i32 %785, 1
  store i32 %786, ptr %36, align 4
  br label %761, !llvm.loop !34

787:                                              ; preds = %761
  %788 = load ptr, ptr %8, align 8
  %789 = getelementptr inbounds %struct.CalcLangVal, ptr %788, i32 0, i32 0
  store i32 6, ptr %789, align 8
  %790 = load ptr, ptr %35, align 8
  %791 = load ptr, ptr %8, align 8
  %792 = getelementptr inbounds %struct.CalcLangVal, ptr %791, i32 0, i32 1
  store ptr %790, ptr %792, align 8
  br label %1399

793:                                              ; preds = %735, %730
  %794 = load ptr, ptr %6, align 8
  %795 = getelementptr inbounds %struct.CalcLangVal, ptr %794, i32 0, i32 0
  %796 = load i32, ptr %795, align 8
  %797 = icmp eq i32 %796, 5
  br i1 %797, label %798, label %875

798:                                              ; preds = %793
  %799 = load ptr, ptr %7, align 8
  %800 = getelementptr inbounds %struct.CalcLangVal, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = icmp eq i32 %801, 5
  br i1 %802, label %803, label %875

803:                                              ; preds = %798
  %804 = load ptr, ptr %6, align 8
  %805 = getelementptr inbounds %struct.CalcLangVal, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  store ptr %806, ptr %37, align 8
  %807 = load ptr, ptr %7, align 8
  %808 = getelementptr inbounds %struct.CalcLangVal, ptr %807, i32 0, i32 1
  %809 = load ptr, ptr %808, align 8
  store ptr %809, ptr %38, align 8
  %810 = load ptr, ptr %38, align 8
  %811 = getelementptr inbounds %struct.SetValue, ptr %810, i32 0, i32 0
  %812 = load i32, ptr %811, align 8
  %813 = load ptr, ptr %37, align 8
  %814 = getelementptr inbounds %struct.SetValue, ptr %813, i32 0, i32 0
  %815 = load i32, ptr %814, align 8
  %816 = icmp eq i32 %812, %815
  br i1 %816, label %817, label %873

817:                                              ; preds = %803
  %818 = load ptr, ptr %5, align 8
  %819 = call ptr @arenaAlloc(ptr noundef %818, i32 noundef 16)
  store ptr %819, ptr %39, align 8
  %820 = load ptr, ptr %37, align 8
  %821 = getelementptr inbounds %struct.SetValue, ptr %820, i32 0, i32 0
  %822 = load i32, ptr %821, align 8
  %823 = load ptr, ptr %39, align 8
  %824 = getelementptr inbounds %struct.SetValue, ptr %823, i32 0, i32 0
  store i32 %822, ptr %824, align 8
  %825 = load ptr, ptr %5, align 8
  %826 = load ptr, ptr %39, align 8
  %827 = getelementptr inbounds %struct.SetValue, ptr %826, i32 0, i32 0
  %828 = load i32, ptr %827, align 8
  %829 = sext i32 %828 to i64
  %830 = mul i64 8, %829
  %831 = trunc i64 %830 to i32
  %832 = call ptr @arenaAlloc(ptr noundef %825, i32 noundef %831)
  %833 = load ptr, ptr %39, align 8
  %834 = getelementptr inbounds %struct.SetValue, ptr %833, i32 0, i32 1
  store ptr %832, ptr %834, align 8
  store i32 0, ptr %40, align 4
  br label %835

835:                                              ; preds = %864, %817
  %836 = load i32, ptr %40, align 4
  %837 = load ptr, ptr %37, align 8
  %838 = getelementptr inbounds %struct.SetValue, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp slt i32 %836, %839
  br i1 %840, label %841, label %867

841:                                              ; preds = %835
  %842 = load ptr, ptr %5, align 8
  %843 = load ptr, ptr %37, align 8
  %844 = getelementptr inbounds %struct.SetValue, ptr %843, i32 0, i32 1
  %845 = load ptr, ptr %844, align 8
  %846 = load i32, ptr %40, align 4
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds ptr, ptr %845, i64 %847
  %849 = load ptr, ptr %848, align 8
  %850 = load ptr, ptr %38, align 8
  %851 = getelementptr inbounds %struct.SetValue, ptr %850, i32 0, i32 1
  %852 = load ptr, ptr %851, align 8
  %853 = load i32, ptr %40, align 4
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds ptr, ptr %852, i64 %854
  %856 = load ptr, ptr %855, align 8
  %857 = call ptr @subCalcLangValues(ptr noundef %842, ptr noundef %849, ptr noundef %856)
  %858 = load ptr, ptr %39, align 8
  %859 = getelementptr inbounds %struct.SetValue, ptr %858, i32 0, i32 1
  %860 = load ptr, ptr %859, align 8
  %861 = load i32, ptr %40, align 4
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds ptr, ptr %860, i64 %862
  store ptr %857, ptr %863, align 8
  br label %864

864:                                              ; preds = %841
  %865 = load i32, ptr %40, align 4
  %866 = add nsw i32 %865, 1
  store i32 %866, ptr %40, align 4
  br label %835, !llvm.loop !35

867:                                              ; preds = %835
  %868 = load ptr, ptr %8, align 8
  %869 = getelementptr inbounds %struct.CalcLangVal, ptr %868, i32 0, i32 0
  store i32 5, ptr %869, align 8
  %870 = load ptr, ptr %39, align 8
  %871 = load ptr, ptr %8, align 8
  %872 = getelementptr inbounds %struct.CalcLangVal, ptr %871, i32 0, i32 1
  store ptr %870, ptr %872, align 8
  br label %874

873:                                              ; preds = %803
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1415

874:                                              ; preds = %867
  br label %1398

875:                                              ; preds = %798, %793
  %876 = load ptr, ptr %6, align 8
  %877 = getelementptr inbounds %struct.CalcLangVal, ptr %876, i32 0, i32 0
  %878 = load i32, ptr %877, align 8
  %879 = icmp eq i32 %878, 5
  br i1 %879, label %880, label %938

880:                                              ; preds = %875
  %881 = load ptr, ptr %7, align 8
  %882 = getelementptr inbounds %struct.CalcLangVal, ptr %881, i32 0, i32 0
  %883 = load i32, ptr %882, align 8
  %884 = icmp eq i32 %883, 0
  br i1 %884, label %885, label %938

885:                                              ; preds = %880
  %886 = load ptr, ptr %6, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 1
  %888 = load ptr, ptr %887, align 8
  store ptr %888, ptr %41, align 8
  %889 = load ptr, ptr %5, align 8
  %890 = call ptr @arenaAlloc(ptr noundef %889, i32 noundef 16)
  store ptr %890, ptr %42, align 8
  %891 = load ptr, ptr %41, align 8
  %892 = getelementptr inbounds %struct.SetValue, ptr %891, i32 0, i32 0
  %893 = load i32, ptr %892, align 8
  %894 = load ptr, ptr %42, align 8
  %895 = getelementptr inbounds %struct.SetValue, ptr %894, i32 0, i32 0
  store i32 %893, ptr %895, align 8
  %896 = load ptr, ptr %5, align 8
  %897 = load ptr, ptr %42, align 8
  %898 = getelementptr inbounds %struct.SetValue, ptr %897, i32 0, i32 0
  %899 = load i32, ptr %898, align 8
  %900 = sext i32 %899 to i64
  %901 = mul i64 8, %900
  %902 = trunc i64 %901 to i32
  %903 = call ptr @arenaAlloc(ptr noundef %896, i32 noundef %902)
  %904 = load ptr, ptr %42, align 8
  %905 = getelementptr inbounds %struct.SetValue, ptr %904, i32 0, i32 1
  store ptr %903, ptr %905, align 8
  store i32 0, ptr %43, align 4
  br label %906

906:                                              ; preds = %929, %885
  %907 = load i32, ptr %43, align 4
  %908 = load ptr, ptr %41, align 8
  %909 = getelementptr inbounds %struct.SetValue, ptr %908, i32 0, i32 0
  %910 = load i32, ptr %909, align 8
  %911 = icmp slt i32 %907, %910
  br i1 %911, label %912, label %932

912:                                              ; preds = %906
  %913 = load ptr, ptr %5, align 8
  %914 = load ptr, ptr %41, align 8
  %915 = getelementptr inbounds %struct.SetValue, ptr %914, i32 0, i32 1
  %916 = load ptr, ptr %915, align 8
  %917 = load i32, ptr %43, align 4
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds ptr, ptr %916, i64 %918
  %920 = load ptr, ptr %919, align 8
  %921 = load ptr, ptr %7, align 8
  %922 = call ptr @subCalcLangValues(ptr noundef %913, ptr noundef %920, ptr noundef %921)
  %923 = load ptr, ptr %42, align 8
  %924 = getelementptr inbounds %struct.SetValue, ptr %923, i32 0, i32 1
  %925 = load ptr, ptr %924, align 8
  %926 = load i32, ptr %43, align 4
  %927 = sext i32 %926 to i64
  %928 = getelementptr inbounds ptr, ptr %925, i64 %927
  store ptr %922, ptr %928, align 8
  br label %929

929:                                              ; preds = %912
  %930 = load i32, ptr %43, align 4
  %931 = add nsw i32 %930, 1
  store i32 %931, ptr %43, align 4
  br label %906, !llvm.loop !36

932:                                              ; preds = %906
  %933 = load ptr, ptr %8, align 8
  %934 = getelementptr inbounds %struct.CalcLangVal, ptr %933, i32 0, i32 0
  store i32 5, ptr %934, align 8
  %935 = load ptr, ptr %42, align 8
  %936 = load ptr, ptr %8, align 8
  %937 = getelementptr inbounds %struct.CalcLangVal, ptr %936, i32 0, i32 1
  store ptr %935, ptr %937, align 8
  br label %1397

938:                                              ; preds = %880, %875
  %939 = load ptr, ptr %6, align 8
  %940 = getelementptr inbounds %struct.CalcLangVal, ptr %939, i32 0, i32 0
  %941 = load i32, ptr %940, align 8
  %942 = icmp eq i32 %941, 0
  br i1 %942, label %943, label %1001

943:                                              ; preds = %938
  %944 = load ptr, ptr %7, align 8
  %945 = getelementptr inbounds %struct.CalcLangVal, ptr %944, i32 0, i32 0
  %946 = load i32, ptr %945, align 8
  %947 = icmp eq i32 %946, 5
  br i1 %947, label %948, label %1001

948:                                              ; preds = %943
  %949 = load ptr, ptr %7, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 1
  %951 = load ptr, ptr %950, align 8
  store ptr %951, ptr %44, align 8
  %952 = load ptr, ptr %5, align 8
  %953 = call ptr @arenaAlloc(ptr noundef %952, i32 noundef 16)
  store ptr %953, ptr %45, align 8
  %954 = load ptr, ptr %44, align 8
  %955 = getelementptr inbounds %struct.SetValue, ptr %954, i32 0, i32 0
  %956 = load i32, ptr %955, align 8
  %957 = load ptr, ptr %45, align 8
  %958 = getelementptr inbounds %struct.SetValue, ptr %957, i32 0, i32 0
  store i32 %956, ptr %958, align 8
  %959 = load ptr, ptr %5, align 8
  %960 = load ptr, ptr %45, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = sext i32 %962 to i64
  %964 = mul i64 8, %963
  %965 = trunc i64 %964 to i32
  %966 = call ptr @arenaAlloc(ptr noundef %959, i32 noundef %965)
  %967 = load ptr, ptr %45, align 8
  %968 = getelementptr inbounds %struct.SetValue, ptr %967, i32 0, i32 1
  store ptr %966, ptr %968, align 8
  store i32 0, ptr %46, align 4
  br label %969

969:                                              ; preds = %992, %948
  %970 = load i32, ptr %46, align 4
  %971 = load ptr, ptr %44, align 8
  %972 = getelementptr inbounds %struct.SetValue, ptr %971, i32 0, i32 0
  %973 = load i32, ptr %972, align 8
  %974 = icmp slt i32 %970, %973
  br i1 %974, label %975, label %995

975:                                              ; preds = %969
  %976 = load ptr, ptr %5, align 8
  %977 = load ptr, ptr %6, align 8
  %978 = load ptr, ptr %44, align 8
  %979 = getelementptr inbounds %struct.SetValue, ptr %978, i32 0, i32 1
  %980 = load ptr, ptr %979, align 8
  %981 = load i32, ptr %46, align 4
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds ptr, ptr %980, i64 %982
  %984 = load ptr, ptr %983, align 8
  %985 = call ptr @subCalcLangValues(ptr noundef %976, ptr noundef %977, ptr noundef %984)
  %986 = load ptr, ptr %45, align 8
  %987 = getelementptr inbounds %struct.SetValue, ptr %986, i32 0, i32 1
  %988 = load ptr, ptr %987, align 8
  %989 = load i32, ptr %46, align 4
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds ptr, ptr %988, i64 %990
  store ptr %985, ptr %991, align 8
  br label %992

992:                                              ; preds = %975
  %993 = load i32, ptr %46, align 4
  %994 = add nsw i32 %993, 1
  store i32 %994, ptr %46, align 4
  br label %969, !llvm.loop !37

995:                                              ; preds = %969
  %996 = load ptr, ptr %8, align 8
  %997 = getelementptr inbounds %struct.CalcLangVal, ptr %996, i32 0, i32 0
  store i32 5, ptr %997, align 8
  %998 = load ptr, ptr %45, align 8
  %999 = load ptr, ptr %8, align 8
  %1000 = getelementptr inbounds %struct.CalcLangVal, ptr %999, i32 0, i32 1
  store ptr %998, ptr %1000, align 8
  br label %1396

1001:                                             ; preds = %943, %938
  %1002 = load ptr, ptr %6, align 8
  %1003 = getelementptr inbounds %struct.CalcLangVal, ptr %1002, i32 0, i32 0
  %1004 = load i32, ptr %1003, align 8
  %1005 = icmp eq i32 %1004, 5
  br i1 %1005, label %1006, label %1064

1006:                                             ; preds = %1001
  %1007 = load ptr, ptr %7, align 8
  %1008 = getelementptr inbounds %struct.CalcLangVal, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp eq i32 %1009, 1
  br i1 %1010, label %1011, label %1064

1011:                                             ; preds = %1006
  %1012 = load ptr, ptr %6, align 8
  %1013 = getelementptr inbounds %struct.CalcLangVal, ptr %1012, i32 0, i32 1
  %1014 = load ptr, ptr %1013, align 8
  store ptr %1014, ptr %47, align 8
  %1015 = load ptr, ptr %5, align 8
  %1016 = call ptr @arenaAlloc(ptr noundef %1015, i32 noundef 16)
  store ptr %1016, ptr %48, align 8
  %1017 = load ptr, ptr %47, align 8
  %1018 = getelementptr inbounds %struct.SetValue, ptr %1017, i32 0, i32 0
  %1019 = load i32, ptr %1018, align 8
  %1020 = load ptr, ptr %48, align 8
  %1021 = getelementptr inbounds %struct.SetValue, ptr %1020, i32 0, i32 0
  store i32 %1019, ptr %1021, align 8
  %1022 = load ptr, ptr %5, align 8
  %1023 = load ptr, ptr %48, align 8
  %1024 = getelementptr inbounds %struct.SetValue, ptr %1023, i32 0, i32 0
  %1025 = load i32, ptr %1024, align 8
  %1026 = sext i32 %1025 to i64
  %1027 = mul i64 8, %1026
  %1028 = trunc i64 %1027 to i32
  %1029 = call ptr @arenaAlloc(ptr noundef %1022, i32 noundef %1028)
  %1030 = load ptr, ptr %48, align 8
  %1031 = getelementptr inbounds %struct.SetValue, ptr %1030, i32 0, i32 1
  store ptr %1029, ptr %1031, align 8
  store i32 0, ptr %49, align 4
  br label %1032

1032:                                             ; preds = %1055, %1011
  %1033 = load i32, ptr %49, align 4
  %1034 = load ptr, ptr %47, align 8
  %1035 = getelementptr inbounds %struct.SetValue, ptr %1034, i32 0, i32 0
  %1036 = load i32, ptr %1035, align 8
  %1037 = icmp slt i32 %1033, %1036
  br i1 %1037, label %1038, label %1058

1038:                                             ; preds = %1032
  %1039 = load ptr, ptr %5, align 8
  %1040 = load ptr, ptr %47, align 8
  %1041 = getelementptr inbounds %struct.SetValue, ptr %1040, i32 0, i32 1
  %1042 = load ptr, ptr %1041, align 8
  %1043 = load i32, ptr %49, align 4
  %1044 = sext i32 %1043 to i64
  %1045 = getelementptr inbounds ptr, ptr %1042, i64 %1044
  %1046 = load ptr, ptr %1045, align 8
  %1047 = load ptr, ptr %7, align 8
  %1048 = call ptr @subCalcLangValues(ptr noundef %1039, ptr noundef %1046, ptr noundef %1047)
  %1049 = load ptr, ptr %48, align 8
  %1050 = getelementptr inbounds %struct.SetValue, ptr %1049, i32 0, i32 1
  %1051 = load ptr, ptr %1050, align 8
  %1052 = load i32, ptr %49, align 4
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds ptr, ptr %1051, i64 %1053
  store ptr %1048, ptr %1054, align 8
  br label %1055

1055:                                             ; preds = %1038
  %1056 = load i32, ptr %49, align 4
  %1057 = add nsw i32 %1056, 1
  store i32 %1057, ptr %49, align 4
  br label %1032, !llvm.loop !38

1058:                                             ; preds = %1032
  %1059 = load ptr, ptr %8, align 8
  %1060 = getelementptr inbounds %struct.CalcLangVal, ptr %1059, i32 0, i32 0
  store i32 6, ptr %1060, align 8
  %1061 = load ptr, ptr %48, align 8
  %1062 = load ptr, ptr %8, align 8
  %1063 = getelementptr inbounds %struct.CalcLangVal, ptr %1062, i32 0, i32 1
  store ptr %1061, ptr %1063, align 8
  br label %1395

1064:                                             ; preds = %1006, %1001
  %1065 = load ptr, ptr %6, align 8
  %1066 = getelementptr inbounds %struct.CalcLangVal, ptr %1065, i32 0, i32 0
  %1067 = load i32, ptr %1066, align 8
  %1068 = icmp eq i32 %1067, 1
  br i1 %1068, label %1069, label %1127

1069:                                             ; preds = %1064
  %1070 = load ptr, ptr %7, align 8
  %1071 = getelementptr inbounds %struct.CalcLangVal, ptr %1070, i32 0, i32 0
  %1072 = load i32, ptr %1071, align 8
  %1073 = icmp eq i32 %1072, 5
  br i1 %1073, label %1074, label %1127

1074:                                             ; preds = %1069
  %1075 = load ptr, ptr %7, align 8
  %1076 = getelementptr inbounds %struct.CalcLangVal, ptr %1075, i32 0, i32 1
  %1077 = load ptr, ptr %1076, align 8
  store ptr %1077, ptr %50, align 8
  %1078 = load ptr, ptr %5, align 8
  %1079 = call ptr @arenaAlloc(ptr noundef %1078, i32 noundef 16)
  store ptr %1079, ptr %51, align 8
  %1080 = load ptr, ptr %50, align 8
  %1081 = getelementptr inbounds %struct.SetValue, ptr %1080, i32 0, i32 0
  %1082 = load i32, ptr %1081, align 8
  %1083 = load ptr, ptr %51, align 8
  %1084 = getelementptr inbounds %struct.SetValue, ptr %1083, i32 0, i32 0
  store i32 %1082, ptr %1084, align 8
  %1085 = load ptr, ptr %5, align 8
  %1086 = load ptr, ptr %51, align 8
  %1087 = getelementptr inbounds %struct.SetValue, ptr %1086, i32 0, i32 0
  %1088 = load i32, ptr %1087, align 8
  %1089 = sext i32 %1088 to i64
  %1090 = mul i64 8, %1089
  %1091 = trunc i64 %1090 to i32
  %1092 = call ptr @arenaAlloc(ptr noundef %1085, i32 noundef %1091)
  %1093 = load ptr, ptr %51, align 8
  %1094 = getelementptr inbounds %struct.SetValue, ptr %1093, i32 0, i32 1
  store ptr %1092, ptr %1094, align 8
  store i32 0, ptr %52, align 4
  br label %1095

1095:                                             ; preds = %1118, %1074
  %1096 = load i32, ptr %52, align 4
  %1097 = load ptr, ptr %50, align 8
  %1098 = getelementptr inbounds %struct.SetValue, ptr %1097, i32 0, i32 0
  %1099 = load i32, ptr %1098, align 8
  %1100 = icmp slt i32 %1096, %1099
  br i1 %1100, label %1101, label %1121

1101:                                             ; preds = %1095
  %1102 = load ptr, ptr %5, align 8
  %1103 = load ptr, ptr %6, align 8
  %1104 = load ptr, ptr %50, align 8
  %1105 = getelementptr inbounds %struct.SetValue, ptr %1104, i32 0, i32 1
  %1106 = load ptr, ptr %1105, align 8
  %1107 = load i32, ptr %52, align 4
  %1108 = sext i32 %1107 to i64
  %1109 = getelementptr inbounds ptr, ptr %1106, i64 %1108
  %1110 = load ptr, ptr %1109, align 8
  %1111 = call ptr @subCalcLangValues(ptr noundef %1102, ptr noundef %1103, ptr noundef %1110)
  %1112 = load ptr, ptr %51, align 8
  %1113 = getelementptr inbounds %struct.SetValue, ptr %1112, i32 0, i32 1
  %1114 = load ptr, ptr %1113, align 8
  %1115 = load i32, ptr %52, align 4
  %1116 = sext i32 %1115 to i64
  %1117 = getelementptr inbounds ptr, ptr %1114, i64 %1116
  store ptr %1111, ptr %1117, align 8
  br label %1118

1118:                                             ; preds = %1101
  %1119 = load i32, ptr %52, align 4
  %1120 = add nsw i32 %1119, 1
  store i32 %1120, ptr %52, align 4
  br label %1095, !llvm.loop !39

1121:                                             ; preds = %1095
  %1122 = load ptr, ptr %8, align 8
  %1123 = getelementptr inbounds %struct.CalcLangVal, ptr %1122, i32 0, i32 0
  store i32 5, ptr %1123, align 8
  %1124 = load ptr, ptr %51, align 8
  %1125 = load ptr, ptr %8, align 8
  %1126 = getelementptr inbounds %struct.CalcLangVal, ptr %1125, i32 0, i32 1
  store ptr %1124, ptr %1126, align 8
  br label %1394

1127:                                             ; preds = %1069, %1064
  %1128 = load ptr, ptr %6, align 8
  %1129 = getelementptr inbounds %struct.CalcLangVal, ptr %1128, i32 0, i32 0
  %1130 = load i32, ptr %1129, align 8
  %1131 = icmp eq i32 %1130, 5
  br i1 %1131, label %1132, label %1190

1132:                                             ; preds = %1127
  %1133 = load ptr, ptr %7, align 8
  %1134 = getelementptr inbounds %struct.CalcLangVal, ptr %1133, i32 0, i32 0
  %1135 = load i32, ptr %1134, align 8
  %1136 = icmp eq i32 %1135, 2
  br i1 %1136, label %1137, label %1190

1137:                                             ; preds = %1132
  %1138 = load ptr, ptr %6, align 8
  %1139 = getelementptr inbounds %struct.CalcLangVal, ptr %1138, i32 0, i32 1
  %1140 = load ptr, ptr %1139, align 8
  store ptr %1140, ptr %53, align 8
  %1141 = load ptr, ptr %5, align 8
  %1142 = call ptr @arenaAlloc(ptr noundef %1141, i32 noundef 16)
  store ptr %1142, ptr %54, align 8
  %1143 = load ptr, ptr %53, align 8
  %1144 = getelementptr inbounds %struct.SetValue, ptr %1143, i32 0, i32 0
  %1145 = load i32, ptr %1144, align 8
  %1146 = load ptr, ptr %54, align 8
  %1147 = getelementptr inbounds %struct.SetValue, ptr %1146, i32 0, i32 0
  store i32 %1145, ptr %1147, align 8
  %1148 = load ptr, ptr %5, align 8
  %1149 = load ptr, ptr %54, align 8
  %1150 = getelementptr inbounds %struct.SetValue, ptr %1149, i32 0, i32 0
  %1151 = load i32, ptr %1150, align 8
  %1152 = sext i32 %1151 to i64
  %1153 = mul i64 8, %1152
  %1154 = trunc i64 %1153 to i32
  %1155 = call ptr @arenaAlloc(ptr noundef %1148, i32 noundef %1154)
  %1156 = load ptr, ptr %54, align 8
  %1157 = getelementptr inbounds %struct.SetValue, ptr %1156, i32 0, i32 1
  store ptr %1155, ptr %1157, align 8
  store i32 0, ptr %55, align 4
  br label %1158

1158:                                             ; preds = %1181, %1137
  %1159 = load i32, ptr %55, align 4
  %1160 = load ptr, ptr %53, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 0
  %1162 = load i32, ptr %1161, align 8
  %1163 = icmp slt i32 %1159, %1162
  br i1 %1163, label %1164, label %1184

1164:                                             ; preds = %1158
  %1165 = load ptr, ptr %5, align 8
  %1166 = load ptr, ptr %53, align 8
  %1167 = getelementptr inbounds %struct.SetValue, ptr %1166, i32 0, i32 1
  %1168 = load ptr, ptr %1167, align 8
  %1169 = load i32, ptr %55, align 4
  %1170 = sext i32 %1169 to i64
  %1171 = getelementptr inbounds ptr, ptr %1168, i64 %1170
  %1172 = load ptr, ptr %1171, align 8
  %1173 = load ptr, ptr %7, align 8
  %1174 = call ptr @subCalcLangValues(ptr noundef %1165, ptr noundef %1172, ptr noundef %1173)
  %1175 = load ptr, ptr %54, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 1
  %1177 = load ptr, ptr %1176, align 8
  %1178 = load i32, ptr %55, align 4
  %1179 = sext i32 %1178 to i64
  %1180 = getelementptr inbounds ptr, ptr %1177, i64 %1179
  store ptr %1174, ptr %1180, align 8
  br label %1181

1181:                                             ; preds = %1164
  %1182 = load i32, ptr %55, align 4
  %1183 = add nsw i32 %1182, 1
  store i32 %1183, ptr %55, align 4
  br label %1158, !llvm.loop !40

1184:                                             ; preds = %1158
  %1185 = load ptr, ptr %8, align 8
  %1186 = getelementptr inbounds %struct.CalcLangVal, ptr %1185, i32 0, i32 0
  store i32 5, ptr %1186, align 8
  %1187 = load ptr, ptr %54, align 8
  %1188 = load ptr, ptr %8, align 8
  %1189 = getelementptr inbounds %struct.CalcLangVal, ptr %1188, i32 0, i32 1
  store ptr %1187, ptr %1189, align 8
  br label %1393

1190:                                             ; preds = %1132, %1127
  %1191 = load ptr, ptr %6, align 8
  %1192 = getelementptr inbounds %struct.CalcLangVal, ptr %1191, i32 0, i32 0
  %1193 = load i32, ptr %1192, align 8
  %1194 = icmp eq i32 %1193, 2
  br i1 %1194, label %1195, label %1253

1195:                                             ; preds = %1190
  %1196 = load ptr, ptr %7, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  %1198 = load i32, ptr %1197, align 8
  %1199 = icmp eq i32 %1198, 5
  br i1 %1199, label %1200, label %1253

1200:                                             ; preds = %1195
  %1201 = load ptr, ptr %7, align 8
  %1202 = getelementptr inbounds %struct.CalcLangVal, ptr %1201, i32 0, i32 1
  %1203 = load ptr, ptr %1202, align 8
  store ptr %1203, ptr %56, align 8
  %1204 = load ptr, ptr %5, align 8
  %1205 = call ptr @arenaAlloc(ptr noundef %1204, i32 noundef 16)
  store ptr %1205, ptr %57, align 8
  %1206 = load ptr, ptr %56, align 8
  %1207 = getelementptr inbounds %struct.SetValue, ptr %1206, i32 0, i32 0
  %1208 = load i32, ptr %1207, align 8
  %1209 = load ptr, ptr %57, align 8
  %1210 = getelementptr inbounds %struct.SetValue, ptr %1209, i32 0, i32 0
  store i32 %1208, ptr %1210, align 8
  %1211 = load ptr, ptr %5, align 8
  %1212 = load ptr, ptr %57, align 8
  %1213 = getelementptr inbounds %struct.SetValue, ptr %1212, i32 0, i32 0
  %1214 = load i32, ptr %1213, align 8
  %1215 = sext i32 %1214 to i64
  %1216 = mul i64 8, %1215
  %1217 = trunc i64 %1216 to i32
  %1218 = call ptr @arenaAlloc(ptr noundef %1211, i32 noundef %1217)
  %1219 = load ptr, ptr %57, align 8
  %1220 = getelementptr inbounds %struct.SetValue, ptr %1219, i32 0, i32 1
  store ptr %1218, ptr %1220, align 8
  store i32 0, ptr %58, align 4
  br label %1221

1221:                                             ; preds = %1244, %1200
  %1222 = load i32, ptr %58, align 4
  %1223 = load ptr, ptr %56, align 8
  %1224 = getelementptr inbounds %struct.SetValue, ptr %1223, i32 0, i32 0
  %1225 = load i32, ptr %1224, align 8
  %1226 = icmp slt i32 %1222, %1225
  br i1 %1226, label %1227, label %1247

1227:                                             ; preds = %1221
  %1228 = load ptr, ptr %5, align 8
  %1229 = load ptr, ptr %6, align 8
  %1230 = load ptr, ptr %56, align 8
  %1231 = getelementptr inbounds %struct.SetValue, ptr %1230, i32 0, i32 1
  %1232 = load ptr, ptr %1231, align 8
  %1233 = load i32, ptr %58, align 4
  %1234 = sext i32 %1233 to i64
  %1235 = getelementptr inbounds ptr, ptr %1232, i64 %1234
  %1236 = load ptr, ptr %1235, align 8
  %1237 = call ptr @subCalcLangValues(ptr noundef %1228, ptr noundef %1229, ptr noundef %1236)
  %1238 = load ptr, ptr %57, align 8
  %1239 = getelementptr inbounds %struct.SetValue, ptr %1238, i32 0, i32 1
  %1240 = load ptr, ptr %1239, align 8
  %1241 = load i32, ptr %58, align 4
  %1242 = sext i32 %1241 to i64
  %1243 = getelementptr inbounds ptr, ptr %1240, i64 %1242
  store ptr %1237, ptr %1243, align 8
  br label %1244

1244:                                             ; preds = %1227
  %1245 = load i32, ptr %58, align 4
  %1246 = add nsw i32 %1245, 1
  store i32 %1246, ptr %58, align 4
  br label %1221, !llvm.loop !41

1247:                                             ; preds = %1221
  %1248 = load ptr, ptr %8, align 8
  %1249 = getelementptr inbounds %struct.CalcLangVal, ptr %1248, i32 0, i32 0
  store i32 5, ptr %1249, align 8
  %1250 = load ptr, ptr %57, align 8
  %1251 = load ptr, ptr %8, align 8
  %1252 = getelementptr inbounds %struct.CalcLangVal, ptr %1251, i32 0, i32 1
  store ptr %1250, ptr %1252, align 8
  br label %1392

1253:                                             ; preds = %1195, %1190
  %1254 = load ptr, ptr %6, align 8
  %1255 = getelementptr inbounds %struct.CalcLangVal, ptr %1254, i32 0, i32 0
  %1256 = load i32, ptr %1255, align 8
  %1257 = icmp eq i32 %1256, 5
  br i1 %1257, label %1258, label %1316

1258:                                             ; preds = %1253
  %1259 = load ptr, ptr %7, align 8
  %1260 = getelementptr inbounds %struct.CalcLangVal, ptr %1259, i32 0, i32 0
  %1261 = load i32, ptr %1260, align 8
  %1262 = icmp eq i32 %1261, 3
  br i1 %1262, label %1263, label %1316

1263:                                             ; preds = %1258
  %1264 = load ptr, ptr %6, align 8
  %1265 = getelementptr inbounds %struct.CalcLangVal, ptr %1264, i32 0, i32 1
  %1266 = load ptr, ptr %1265, align 8
  store ptr %1266, ptr %59, align 8
  %1267 = load ptr, ptr %5, align 8
  %1268 = call ptr @arenaAlloc(ptr noundef %1267, i32 noundef 16)
  store ptr %1268, ptr %60, align 8
  %1269 = load ptr, ptr %59, align 8
  %1270 = getelementptr inbounds %struct.SetValue, ptr %1269, i32 0, i32 0
  %1271 = load i32, ptr %1270, align 8
  %1272 = load ptr, ptr %60, align 8
  %1273 = getelementptr inbounds %struct.SetValue, ptr %1272, i32 0, i32 0
  store i32 %1271, ptr %1273, align 8
  %1274 = load ptr, ptr %5, align 8
  %1275 = load ptr, ptr %60, align 8
  %1276 = getelementptr inbounds %struct.SetValue, ptr %1275, i32 0, i32 0
  %1277 = load i32, ptr %1276, align 8
  %1278 = sext i32 %1277 to i64
  %1279 = mul i64 8, %1278
  %1280 = trunc i64 %1279 to i32
  %1281 = call ptr @arenaAlloc(ptr noundef %1274, i32 noundef %1280)
  %1282 = load ptr, ptr %60, align 8
  %1283 = getelementptr inbounds %struct.SetValue, ptr %1282, i32 0, i32 1
  store ptr %1281, ptr %1283, align 8
  store i32 0, ptr %61, align 4
  br label %1284

1284:                                             ; preds = %1307, %1263
  %1285 = load i32, ptr %61, align 4
  %1286 = load ptr, ptr %59, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 0
  %1288 = load i32, ptr %1287, align 8
  %1289 = icmp slt i32 %1285, %1288
  br i1 %1289, label %1290, label %1310

1290:                                             ; preds = %1284
  %1291 = load ptr, ptr %5, align 8
  %1292 = load ptr, ptr %59, align 8
  %1293 = getelementptr inbounds %struct.SetValue, ptr %1292, i32 0, i32 1
  %1294 = load ptr, ptr %1293, align 8
  %1295 = load i32, ptr %61, align 4
  %1296 = sext i32 %1295 to i64
  %1297 = getelementptr inbounds ptr, ptr %1294, i64 %1296
  %1298 = load ptr, ptr %1297, align 8
  %1299 = load ptr, ptr %7, align 8
  %1300 = call ptr @subCalcLangValues(ptr noundef %1291, ptr noundef %1298, ptr noundef %1299)
  %1301 = load ptr, ptr %60, align 8
  %1302 = getelementptr inbounds %struct.SetValue, ptr %1301, i32 0, i32 1
  %1303 = load ptr, ptr %1302, align 8
  %1304 = load i32, ptr %61, align 4
  %1305 = sext i32 %1304 to i64
  %1306 = getelementptr inbounds ptr, ptr %1303, i64 %1305
  store ptr %1300, ptr %1306, align 8
  br label %1307

1307:                                             ; preds = %1290
  %1308 = load i32, ptr %61, align 4
  %1309 = add nsw i32 %1308, 1
  store i32 %1309, ptr %61, align 4
  br label %1284, !llvm.loop !42

1310:                                             ; preds = %1284
  %1311 = load ptr, ptr %8, align 8
  %1312 = getelementptr inbounds %struct.CalcLangVal, ptr %1311, i32 0, i32 0
  store i32 5, ptr %1312, align 8
  %1313 = load ptr, ptr %60, align 8
  %1314 = load ptr, ptr %8, align 8
  %1315 = getelementptr inbounds %struct.CalcLangVal, ptr %1314, i32 0, i32 1
  store ptr %1313, ptr %1315, align 8
  br label %1391

1316:                                             ; preds = %1258, %1253
  %1317 = load ptr, ptr %6, align 8
  %1318 = getelementptr inbounds %struct.CalcLangVal, ptr %1317, i32 0, i32 0
  %1319 = load i32, ptr %1318, align 8
  %1320 = icmp eq i32 %1319, 3
  br i1 %1320, label %1321, label %1379

1321:                                             ; preds = %1316
  %1322 = load ptr, ptr %7, align 8
  %1323 = getelementptr inbounds %struct.CalcLangVal, ptr %1322, i32 0, i32 0
  %1324 = load i32, ptr %1323, align 8
  %1325 = icmp eq i32 %1324, 5
  br i1 %1325, label %1326, label %1379

1326:                                             ; preds = %1321
  %1327 = load ptr, ptr %7, align 8
  %1328 = getelementptr inbounds %struct.CalcLangVal, ptr %1327, i32 0, i32 1
  %1329 = load ptr, ptr %1328, align 8
  store ptr %1329, ptr %62, align 8
  %1330 = load ptr, ptr %5, align 8
  %1331 = call ptr @arenaAlloc(ptr noundef %1330, i32 noundef 16)
  store ptr %1331, ptr %63, align 8
  %1332 = load ptr, ptr %62, align 8
  %1333 = getelementptr inbounds %struct.SetValue, ptr %1332, i32 0, i32 0
  %1334 = load i32, ptr %1333, align 8
  %1335 = load ptr, ptr %63, align 8
  %1336 = getelementptr inbounds %struct.SetValue, ptr %1335, i32 0, i32 0
  store i32 %1334, ptr %1336, align 8
  %1337 = load ptr, ptr %5, align 8
  %1338 = load ptr, ptr %63, align 8
  %1339 = getelementptr inbounds %struct.SetValue, ptr %1338, i32 0, i32 0
  %1340 = load i32, ptr %1339, align 8
  %1341 = sext i32 %1340 to i64
  %1342 = mul i64 8, %1341
  %1343 = trunc i64 %1342 to i32
  %1344 = call ptr @arenaAlloc(ptr noundef %1337, i32 noundef %1343)
  %1345 = load ptr, ptr %63, align 8
  %1346 = getelementptr inbounds %struct.SetValue, ptr %1345, i32 0, i32 1
  store ptr %1344, ptr %1346, align 8
  store i32 0, ptr %64, align 4
  br label %1347

1347:                                             ; preds = %1370, %1326
  %1348 = load i32, ptr %64, align 4
  %1349 = load ptr, ptr %62, align 8
  %1350 = getelementptr inbounds %struct.SetValue, ptr %1349, i32 0, i32 0
  %1351 = load i32, ptr %1350, align 8
  %1352 = icmp slt i32 %1348, %1351
  br i1 %1352, label %1353, label %1373

1353:                                             ; preds = %1347
  %1354 = load ptr, ptr %5, align 8
  %1355 = load ptr, ptr %6, align 8
  %1356 = load ptr, ptr %62, align 8
  %1357 = getelementptr inbounds %struct.SetValue, ptr %1356, i32 0, i32 1
  %1358 = load ptr, ptr %1357, align 8
  %1359 = load i32, ptr %64, align 4
  %1360 = sext i32 %1359 to i64
  %1361 = getelementptr inbounds ptr, ptr %1358, i64 %1360
  %1362 = load ptr, ptr %1361, align 8
  %1363 = call ptr @subCalcLangValues(ptr noundef %1354, ptr noundef %1355, ptr noundef %1362)
  %1364 = load ptr, ptr %63, align 8
  %1365 = getelementptr inbounds %struct.SetValue, ptr %1364, i32 0, i32 1
  %1366 = load ptr, ptr %1365, align 8
  %1367 = load i32, ptr %64, align 4
  %1368 = sext i32 %1367 to i64
  %1369 = getelementptr inbounds ptr, ptr %1366, i64 %1368
  store ptr %1363, ptr %1369, align 8
  br label %1370

1370:                                             ; preds = %1353
  %1371 = load i32, ptr %64, align 4
  %1372 = add nsw i32 %1371, 1
  store i32 %1372, ptr %64, align 4
  br label %1347, !llvm.loop !43

1373:                                             ; preds = %1347
  %1374 = load ptr, ptr %8, align 8
  %1375 = getelementptr inbounds %struct.CalcLangVal, ptr %1374, i32 0, i32 0
  store i32 5, ptr %1375, align 8
  %1376 = load ptr, ptr %63, align 8
  %1377 = load ptr, ptr %8, align 8
  %1378 = getelementptr inbounds %struct.CalcLangVal, ptr %1377, i32 0, i32 1
  store ptr %1376, ptr %1378, align 8
  br label %1390

1379:                                             ; preds = %1321, %1316
  %1380 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %1381 = load ptr, ptr %6, align 8
  %1382 = getelementptr inbounds %struct.CalcLangVal, ptr %1381, i32 0, i32 0
  %1383 = load i32, ptr %1382, align 8
  %1384 = load ptr, ptr %7, align 8
  %1385 = getelementptr inbounds %struct.CalcLangVal, ptr %1384, i32 0, i32 0
  %1386 = load i32, ptr %1385, align 8
  %1387 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %1383, i32 noundef %1386)
  %1388 = load ptr, ptr @stdout, align 8
  %1389 = call i32 @fflush(ptr noundef %1388)
  br label %1390

1390:                                             ; preds = %1379, %1373
  br label %1391

1391:                                             ; preds = %1390, %1310
  br label %1392

1392:                                             ; preds = %1391, %1247
  br label %1393

1393:                                             ; preds = %1392, %1184
  br label %1394

1394:                                             ; preds = %1393, %1121
  br label %1395

1395:                                             ; preds = %1394, %1058
  br label %1396

1396:                                             ; preds = %1395, %995
  br label %1397

1397:                                             ; preds = %1396, %932
  br label %1398

1398:                                             ; preds = %1397, %874
  br label %1399

1399:                                             ; preds = %1398, %787
  br label %1400

1400:                                             ; preds = %1399, %724
  br label %1401

1401:                                             ; preds = %1400, %661
  br label %1402

1402:                                             ; preds = %1401, %598
  br label %1403

1403:                                             ; preds = %1402, %535
  br label %1404

1404:                                             ; preds = %1403, %472
  br label %1405

1405:                                             ; preds = %1404, %409
  br label %1406

1406:                                             ; preds = %1405, %346
  br label %1407

1407:                                             ; preds = %1406, %288
  br label %1408

1408:                                             ; preds = %1407, %195
  br label %1409

1409:                                             ; preds = %1408, %173
  br label %1410

1410:                                             ; preds = %1409, %150
  br label %1411

1411:                                             ; preds = %1410, %127
  br label %1412

1412:                                             ; preds = %1411, %105
  br label %1413

1413:                                             ; preds = %1412, %83
  %1414 = load ptr, ptr %8, align 8
  store ptr %1414, ptr %4, align 8
  br label %1415

1415:                                             ; preds = %1413, %873, %287, %70
  %1416 = load ptr, ptr %4, align 8
  ret ptr %1416
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @multCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i32, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i32, align 4
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i32, align 4
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %70, label %67

67:                                               ; preds = %3
  %68 = load ptr, ptr %7, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %67, %3
  store ptr null, ptr %4, align 8
  br label %1570

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = call ptr @arenaAlloc(ptr noundef %72, i32 noundef 16)
  store ptr %73, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %95

78:                                               ; preds = %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %95

83:                                               ; preds = %78
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 0
  store i32 0, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 8
  %92 = mul nsw i32 %88, %91
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1
  store i32 %92, ptr %94, align 8
  br label %1568

95:                                               ; preds = %78, %71
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 1
  br i1 %99, label %100, label %117

100:                                              ; preds = %95
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %117

105:                                              ; preds = %100
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 0
  store i32 1, ptr %107, align 8
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = load ptr, ptr %7, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = fmul double %110, %113
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 1
  store double %114, ptr %116, align 8
  br label %1567

117:                                              ; preds = %100, %95
  %118 = load ptr, ptr %6, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %140

122:                                              ; preds = %117
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %127, label %140

127:                                              ; preds = %122
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 0
  store i32 1, ptr %129, align 8
  %130 = load ptr, ptr %6, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load i32, ptr %131, align 8
  %133 = sitofp i32 %132 to double
  %134 = load ptr, ptr %7, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load double, ptr %135, align 8
  %137 = fmul double %133, %136
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 1
  store double %137, ptr %139, align 8
  br label %1566

140:                                              ; preds = %122, %117
  %141 = load ptr, ptr %6, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  %143 = load i32, ptr %142, align 8
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %163

145:                                              ; preds = %140
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %163

150:                                              ; preds = %145
  %151 = load ptr, ptr %8, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 0
  store i32 1, ptr %152, align 8
  %153 = load ptr, ptr %6, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load i32, ptr %157, align 8
  %159 = sitofp i32 %158 to double
  %160 = fmul double %155, %159
  %161 = load ptr, ptr %8, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  store double %160, ptr %162, align 8
  br label %1565

163:                                              ; preds = %145, %140
  %164 = load ptr, ptr %6, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 0
  %166 = load i32, ptr %165, align 8
  %167 = icmp eq i32 %166, 2
  br i1 %167, label %168, label %186

168:                                              ; preds = %163
  %169 = load ptr, ptr %7, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %186

173:                                              ; preds = %168
  %174 = load ptr, ptr %8, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 0
  store i32 2, ptr %175, align 8
  %176 = load ptr, ptr %6, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = load ptr, ptr %7, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load i32, ptr %180, align 8
  %182 = sitofp i32 %181 to double
  %183 = fmul double %178, %182
  %184 = load ptr, ptr %8, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  store double %183, ptr %185, align 8
  br label %1564

186:                                              ; preds = %168, %163
  %187 = load ptr, ptr %6, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 0
  %189 = load i32, ptr %188, align 8
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %209

191:                                              ; preds = %186
  %192 = load ptr, ptr %7, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 2
  br i1 %195, label %196, label %209

196:                                              ; preds = %191
  %197 = load ptr, ptr %8, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 0
  store i32 2, ptr %198, align 8
  %199 = load ptr, ptr %6, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  %201 = load i32, ptr %200, align 8
  %202 = sitofp i32 %201 to double
  %203 = load ptr, ptr %7, align 8
  %204 = getelementptr inbounds %struct.CalcLangVal, ptr %203, i32 0, i32 1
  %205 = load double, ptr %204, align 8
  %206 = fmul double %202, %205
  %207 = load ptr, ptr %8, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 1
  store double %206, ptr %208, align 8
  br label %1563

209:                                              ; preds = %191, %186
  %210 = load ptr, ptr %6, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 0
  %212 = load i32, ptr %211, align 8
  %213 = icmp eq i32 %212, 1
  br i1 %213, label %214, label %231

214:                                              ; preds = %209
  %215 = load ptr, ptr %7, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 0
  %217 = load i32, ptr %216, align 8
  %218 = icmp eq i32 %217, 2
  br i1 %218, label %219, label %231

219:                                              ; preds = %214
  %220 = load ptr, ptr %8, align 8
  %221 = getelementptr inbounds %struct.CalcLangVal, ptr %220, i32 0, i32 0
  store i32 2, ptr %221, align 8
  %222 = load ptr, ptr %6, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 1
  %224 = load double, ptr %223, align 8
  %225 = load ptr, ptr %7, align 8
  %226 = getelementptr inbounds %struct.CalcLangVal, ptr %225, i32 0, i32 1
  %227 = load double, ptr %226, align 8
  %228 = fmul double %224, %227
  %229 = load ptr, ptr %8, align 8
  %230 = getelementptr inbounds %struct.CalcLangVal, ptr %229, i32 0, i32 1
  store double %228, ptr %230, align 8
  br label %1562

231:                                              ; preds = %214, %209
  %232 = load ptr, ptr %6, align 8
  %233 = getelementptr inbounds %struct.CalcLangVal, ptr %232, i32 0, i32 0
  %234 = load i32, ptr %233, align 8
  %235 = icmp eq i32 %234, 2
  br i1 %235, label %236, label %253

236:                                              ; preds = %231
  %237 = load ptr, ptr %7, align 8
  %238 = getelementptr inbounds %struct.CalcLangVal, ptr %237, i32 0, i32 0
  %239 = load i32, ptr %238, align 8
  %240 = icmp eq i32 %239, 1
  br i1 %240, label %241, label %253

241:                                              ; preds = %236
  %242 = load ptr, ptr %8, align 8
  %243 = getelementptr inbounds %struct.CalcLangVal, ptr %242, i32 0, i32 0
  store i32 2, ptr %243, align 8
  %244 = load ptr, ptr %6, align 8
  %245 = getelementptr inbounds %struct.CalcLangVal, ptr %244, i32 0, i32 1
  %246 = load double, ptr %245, align 8
  %247 = load ptr, ptr %7, align 8
  %248 = getelementptr inbounds %struct.CalcLangVal, ptr %247, i32 0, i32 1
  %249 = load double, ptr %248, align 8
  %250 = fmul double %246, %249
  %251 = load ptr, ptr %8, align 8
  %252 = getelementptr inbounds %struct.CalcLangVal, ptr %251, i32 0, i32 1
  store double %250, ptr %252, align 8
  br label %1561

253:                                              ; preds = %236, %231
  %254 = load ptr, ptr %6, align 8
  %255 = getelementptr inbounds %struct.CalcLangVal, ptr %254, i32 0, i32 0
  %256 = load i32, ptr %255, align 8
  %257 = icmp eq i32 %256, 3
  br i1 %257, label %258, label %276

258:                                              ; preds = %253
  %259 = load ptr, ptr %7, align 8
  %260 = getelementptr inbounds %struct.CalcLangVal, ptr %259, i32 0, i32 0
  %261 = load i32, ptr %260, align 8
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %276

263:                                              ; preds = %258
  %264 = load ptr, ptr %8, align 8
  %265 = getelementptr inbounds %struct.CalcLangVal, ptr %264, i32 0, i32 0
  store i32 3, ptr %265, align 8
  %266 = load ptr, ptr %6, align 8
  %267 = getelementptr inbounds %struct.CalcLangVal, ptr %266, i32 0, i32 1
  %268 = load double, ptr %267, align 8
  %269 = load ptr, ptr %7, align 8
  %270 = getelementptr inbounds %struct.CalcLangVal, ptr %269, i32 0, i32 1
  %271 = load i32, ptr %270, align 8
  %272 = sitofp i32 %271 to double
  %273 = fmul double %268, %272
  %274 = load ptr, ptr %8, align 8
  %275 = getelementptr inbounds %struct.CalcLangVal, ptr %274, i32 0, i32 1
  store double %273, ptr %275, align 8
  br label %1560

276:                                              ; preds = %258, %253
  %277 = load ptr, ptr %6, align 8
  %278 = getelementptr inbounds %struct.CalcLangVal, ptr %277, i32 0, i32 0
  %279 = load i32, ptr %278, align 8
  %280 = icmp eq i32 %279, 0
  br i1 %280, label %281, label %299

281:                                              ; preds = %276
  %282 = load ptr, ptr %7, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 0
  %284 = load i32, ptr %283, align 8
  %285 = icmp eq i32 %284, 3
  br i1 %285, label %286, label %299

286:                                              ; preds = %281
  %287 = load ptr, ptr %8, align 8
  %288 = getelementptr inbounds %struct.CalcLangVal, ptr %287, i32 0, i32 0
  store i32 3, ptr %288, align 8
  %289 = load ptr, ptr %6, align 8
  %290 = getelementptr inbounds %struct.CalcLangVal, ptr %289, i32 0, i32 1
  %291 = load i32, ptr %290, align 8
  %292 = sitofp i32 %291 to double
  %293 = load ptr, ptr %7, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = load double, ptr %294, align 8
  %296 = fmul double %292, %295
  %297 = load ptr, ptr %8, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 1
  store double %296, ptr %298, align 8
  br label %1559

299:                                              ; preds = %281, %276
  %300 = load ptr, ptr %6, align 8
  %301 = getelementptr inbounds %struct.CalcLangVal, ptr %300, i32 0, i32 0
  %302 = load i32, ptr %301, align 8
  %303 = icmp eq i32 %302, 1
  br i1 %303, label %304, label %321

304:                                              ; preds = %299
  %305 = load ptr, ptr %7, align 8
  %306 = getelementptr inbounds %struct.CalcLangVal, ptr %305, i32 0, i32 0
  %307 = load i32, ptr %306, align 8
  %308 = icmp eq i32 %307, 3
  br i1 %308, label %309, label %321

309:                                              ; preds = %304
  %310 = load ptr, ptr %8, align 8
  %311 = getelementptr inbounds %struct.CalcLangVal, ptr %310, i32 0, i32 0
  store i32 3, ptr %311, align 8
  %312 = load ptr, ptr %6, align 8
  %313 = getelementptr inbounds %struct.CalcLangVal, ptr %312, i32 0, i32 1
  %314 = load double, ptr %313, align 8
  %315 = load ptr, ptr %7, align 8
  %316 = getelementptr inbounds %struct.CalcLangVal, ptr %315, i32 0, i32 1
  %317 = load double, ptr %316, align 8
  %318 = fmul double %314, %317
  %319 = load ptr, ptr %8, align 8
  %320 = getelementptr inbounds %struct.CalcLangVal, ptr %319, i32 0, i32 1
  store double %318, ptr %320, align 8
  br label %1558

321:                                              ; preds = %304, %299
  %322 = load ptr, ptr %6, align 8
  %323 = getelementptr inbounds %struct.CalcLangVal, ptr %322, i32 0, i32 0
  %324 = load i32, ptr %323, align 8
  %325 = icmp eq i32 %324, 3
  br i1 %325, label %326, label %343

326:                                              ; preds = %321
  %327 = load ptr, ptr %7, align 8
  %328 = getelementptr inbounds %struct.CalcLangVal, ptr %327, i32 0, i32 0
  %329 = load i32, ptr %328, align 8
  %330 = icmp eq i32 %329, 1
  br i1 %330, label %331, label %343

331:                                              ; preds = %326
  %332 = load ptr, ptr %8, align 8
  %333 = getelementptr inbounds %struct.CalcLangVal, ptr %332, i32 0, i32 0
  store i32 3, ptr %333, align 8
  %334 = load ptr, ptr %6, align 8
  %335 = getelementptr inbounds %struct.CalcLangVal, ptr %334, i32 0, i32 1
  %336 = load double, ptr %335, align 8
  %337 = load ptr, ptr %7, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 1
  %339 = load double, ptr %338, align 8
  %340 = fmul double %336, %339
  %341 = load ptr, ptr %8, align 8
  %342 = getelementptr inbounds %struct.CalcLangVal, ptr %341, i32 0, i32 1
  store double %340, ptr %342, align 8
  br label %1557

343:                                              ; preds = %326, %321
  %344 = load ptr, ptr %6, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = icmp eq i32 %346, 3
  br i1 %347, label %348, label %365

348:                                              ; preds = %343
  %349 = load ptr, ptr %7, align 8
  %350 = getelementptr inbounds %struct.CalcLangVal, ptr %349, i32 0, i32 0
  %351 = load i32, ptr %350, align 8
  %352 = icmp eq i32 %351, 3
  br i1 %352, label %353, label %365

353:                                              ; preds = %348
  %354 = load ptr, ptr %8, align 8
  %355 = getelementptr inbounds %struct.CalcLangVal, ptr %354, i32 0, i32 0
  store i32 3, ptr %355, align 8
  %356 = load ptr, ptr %6, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load double, ptr %357, align 8
  %359 = load ptr, ptr %7, align 8
  %360 = getelementptr inbounds %struct.CalcLangVal, ptr %359, i32 0, i32 1
  %361 = load double, ptr %360, align 8
  %362 = fmul double %358, %361
  %363 = load ptr, ptr %8, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 1
  store double %362, ptr %364, align 8
  br label %1556

365:                                              ; preds = %348, %343
  %366 = load ptr, ptr %6, align 8
  %367 = getelementptr inbounds %struct.CalcLangVal, ptr %366, i32 0, i32 0
  %368 = load i32, ptr %367, align 8
  %369 = icmp eq i32 %368, 6
  br i1 %369, label %370, label %447

370:                                              ; preds = %365
  %371 = load ptr, ptr %7, align 8
  %372 = getelementptr inbounds %struct.CalcLangVal, ptr %371, i32 0, i32 0
  %373 = load i32, ptr %372, align 8
  %374 = icmp eq i32 %373, 6
  br i1 %374, label %375, label %447

375:                                              ; preds = %370
  %376 = load ptr, ptr %6, align 8
  %377 = getelementptr inbounds %struct.CalcLangVal, ptr %376, i32 0, i32 1
  %378 = load ptr, ptr %377, align 8
  store ptr %378, ptr %9, align 8
  %379 = load ptr, ptr %7, align 8
  %380 = getelementptr inbounds %struct.CalcLangVal, ptr %379, i32 0, i32 1
  %381 = load ptr, ptr %380, align 8
  store ptr %381, ptr %10, align 8
  %382 = load ptr, ptr %10, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 0
  %384 = load i32, ptr %383, align 8
  %385 = load ptr, ptr %9, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = icmp eq i32 %384, %387
  br i1 %388, label %389, label %445

389:                                              ; preds = %375
  %390 = load ptr, ptr %5, align 8
  %391 = call ptr @arenaAlloc(ptr noundef %390, i32 noundef 16)
  store ptr %391, ptr %11, align 8
  %392 = load ptr, ptr %9, align 8
  %393 = getelementptr inbounds %struct.TupleValue, ptr %392, i32 0, i32 0
  %394 = load i32, ptr %393, align 8
  %395 = load ptr, ptr %11, align 8
  %396 = getelementptr inbounds %struct.TupleValue, ptr %395, i32 0, i32 0
  store i32 %394, ptr %396, align 8
  %397 = load ptr, ptr %5, align 8
  %398 = load ptr, ptr %11, align 8
  %399 = getelementptr inbounds %struct.TupleValue, ptr %398, i32 0, i32 0
  %400 = load i32, ptr %399, align 8
  %401 = sext i32 %400 to i64
  %402 = mul i64 8, %401
  %403 = trunc i64 %402 to i32
  %404 = call ptr @arenaAlloc(ptr noundef %397, i32 noundef %403)
  %405 = load ptr, ptr %11, align 8
  %406 = getelementptr inbounds %struct.TupleValue, ptr %405, i32 0, i32 1
  store ptr %404, ptr %406, align 8
  store i32 0, ptr %12, align 4
  br label %407

407:                                              ; preds = %436, %389
  %408 = load i32, ptr %12, align 4
  %409 = load ptr, ptr %9, align 8
  %410 = getelementptr inbounds %struct.TupleValue, ptr %409, i32 0, i32 0
  %411 = load i32, ptr %410, align 8
  %412 = icmp slt i32 %408, %411
  br i1 %412, label %413, label %439

413:                                              ; preds = %407
  %414 = load ptr, ptr %5, align 8
  %415 = load ptr, ptr %9, align 8
  %416 = getelementptr inbounds %struct.TupleValue, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  %418 = load i32, ptr %12, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds ptr, ptr %417, i64 %419
  %421 = load ptr, ptr %420, align 8
  %422 = load ptr, ptr %10, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 1
  %424 = load ptr, ptr %423, align 8
  %425 = load i32, ptr %12, align 4
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds ptr, ptr %424, i64 %426
  %428 = load ptr, ptr %427, align 8
  %429 = call ptr @multCalcLangValues(ptr noundef %414, ptr noundef %421, ptr noundef %428)
  %430 = load ptr, ptr %11, align 8
  %431 = getelementptr inbounds %struct.TupleValue, ptr %430, i32 0, i32 1
  %432 = load ptr, ptr %431, align 8
  %433 = load i32, ptr %12, align 4
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds ptr, ptr %432, i64 %434
  store ptr %429, ptr %435, align 8
  br label %436

436:                                              ; preds = %413
  %437 = load i32, ptr %12, align 4
  %438 = add nsw i32 %437, 1
  store i32 %438, ptr %12, align 4
  br label %407, !llvm.loop !44

439:                                              ; preds = %407
  %440 = load ptr, ptr %8, align 8
  %441 = getelementptr inbounds %struct.CalcLangVal, ptr %440, i32 0, i32 0
  store i32 6, ptr %441, align 8
  %442 = load ptr, ptr %11, align 8
  %443 = load ptr, ptr %8, align 8
  %444 = getelementptr inbounds %struct.CalcLangVal, ptr %443, i32 0, i32 1
  store ptr %442, ptr %444, align 8
  br label %446

445:                                              ; preds = %375
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1570

446:                                              ; preds = %439
  br label %1555

447:                                              ; preds = %370, %365
  %448 = load ptr, ptr %6, align 8
  %449 = getelementptr inbounds %struct.CalcLangVal, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = icmp eq i32 %450, 6
  br i1 %451, label %452, label %510

452:                                              ; preds = %447
  %453 = load ptr, ptr %7, align 8
  %454 = getelementptr inbounds %struct.CalcLangVal, ptr %453, i32 0, i32 0
  %455 = load i32, ptr %454, align 8
  %456 = icmp eq i32 %455, 0
  br i1 %456, label %457, label %510

457:                                              ; preds = %452
  %458 = load ptr, ptr %6, align 8
  %459 = getelementptr inbounds %struct.CalcLangVal, ptr %458, i32 0, i32 1
  %460 = load ptr, ptr %459, align 8
  store ptr %460, ptr %13, align 8
  %461 = load ptr, ptr %5, align 8
  %462 = call ptr @arenaAlloc(ptr noundef %461, i32 noundef 16)
  store ptr %462, ptr %14, align 8
  %463 = load ptr, ptr %13, align 8
  %464 = getelementptr inbounds %struct.TupleValue, ptr %463, i32 0, i32 0
  %465 = load i32, ptr %464, align 8
  %466 = load ptr, ptr %14, align 8
  %467 = getelementptr inbounds %struct.TupleValue, ptr %466, i32 0, i32 0
  store i32 %465, ptr %467, align 8
  %468 = load ptr, ptr %5, align 8
  %469 = load ptr, ptr %14, align 8
  %470 = getelementptr inbounds %struct.TupleValue, ptr %469, i32 0, i32 0
  %471 = load i32, ptr %470, align 8
  %472 = sext i32 %471 to i64
  %473 = mul i64 8, %472
  %474 = trunc i64 %473 to i32
  %475 = call ptr @arenaAlloc(ptr noundef %468, i32 noundef %474)
  %476 = load ptr, ptr %14, align 8
  %477 = getelementptr inbounds %struct.TupleValue, ptr %476, i32 0, i32 1
  store ptr %475, ptr %477, align 8
  store i32 0, ptr %15, align 4
  br label %478

478:                                              ; preds = %501, %457
  %479 = load i32, ptr %15, align 4
  %480 = load ptr, ptr %13, align 8
  %481 = getelementptr inbounds %struct.TupleValue, ptr %480, i32 0, i32 0
  %482 = load i32, ptr %481, align 8
  %483 = icmp slt i32 %479, %482
  br i1 %483, label %484, label %504

484:                                              ; preds = %478
  %485 = load ptr, ptr %5, align 8
  %486 = load ptr, ptr %13, align 8
  %487 = getelementptr inbounds %struct.TupleValue, ptr %486, i32 0, i32 1
  %488 = load ptr, ptr %487, align 8
  %489 = load i32, ptr %15, align 4
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds ptr, ptr %488, i64 %490
  %492 = load ptr, ptr %491, align 8
  %493 = load ptr, ptr %7, align 8
  %494 = call ptr @multCalcLangValues(ptr noundef %485, ptr noundef %492, ptr noundef %493)
  %495 = load ptr, ptr %14, align 8
  %496 = getelementptr inbounds %struct.TupleValue, ptr %495, i32 0, i32 1
  %497 = load ptr, ptr %496, align 8
  %498 = load i32, ptr %15, align 4
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds ptr, ptr %497, i64 %499
  store ptr %494, ptr %500, align 8
  br label %501

501:                                              ; preds = %484
  %502 = load i32, ptr %15, align 4
  %503 = add nsw i32 %502, 1
  store i32 %503, ptr %15, align 4
  br label %478, !llvm.loop !45

504:                                              ; preds = %478
  %505 = load ptr, ptr %8, align 8
  %506 = getelementptr inbounds %struct.CalcLangVal, ptr %505, i32 0, i32 0
  store i32 6, ptr %506, align 8
  %507 = load ptr, ptr %14, align 8
  %508 = load ptr, ptr %8, align 8
  %509 = getelementptr inbounds %struct.CalcLangVal, ptr %508, i32 0, i32 1
  store ptr %507, ptr %509, align 8
  br label %1554

510:                                              ; preds = %452, %447
  %511 = load ptr, ptr %6, align 8
  %512 = getelementptr inbounds %struct.CalcLangVal, ptr %511, i32 0, i32 0
  %513 = load i32, ptr %512, align 8
  %514 = icmp eq i32 %513, 0
  br i1 %514, label %515, label %573

515:                                              ; preds = %510
  %516 = load ptr, ptr %7, align 8
  %517 = getelementptr inbounds %struct.CalcLangVal, ptr %516, i32 0, i32 0
  %518 = load i32, ptr %517, align 8
  %519 = icmp eq i32 %518, 6
  br i1 %519, label %520, label %573

520:                                              ; preds = %515
  %521 = load ptr, ptr %7, align 8
  %522 = getelementptr inbounds %struct.CalcLangVal, ptr %521, i32 0, i32 1
  %523 = load ptr, ptr %522, align 8
  store ptr %523, ptr %16, align 8
  %524 = load ptr, ptr %5, align 8
  %525 = call ptr @arenaAlloc(ptr noundef %524, i32 noundef 16)
  store ptr %525, ptr %17, align 8
  %526 = load ptr, ptr %16, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 0
  %528 = load i32, ptr %527, align 8
  %529 = load ptr, ptr %17, align 8
  %530 = getelementptr inbounds %struct.TupleValue, ptr %529, i32 0, i32 0
  store i32 %528, ptr %530, align 8
  %531 = load ptr, ptr %5, align 8
  %532 = load ptr, ptr %17, align 8
  %533 = getelementptr inbounds %struct.TupleValue, ptr %532, i32 0, i32 0
  %534 = load i32, ptr %533, align 8
  %535 = sext i32 %534 to i64
  %536 = mul i64 8, %535
  %537 = trunc i64 %536 to i32
  %538 = call ptr @arenaAlloc(ptr noundef %531, i32 noundef %537)
  %539 = load ptr, ptr %17, align 8
  %540 = getelementptr inbounds %struct.TupleValue, ptr %539, i32 0, i32 1
  store ptr %538, ptr %540, align 8
  store i32 0, ptr %18, align 4
  br label %541

541:                                              ; preds = %564, %520
  %542 = load i32, ptr %18, align 4
  %543 = load ptr, ptr %16, align 8
  %544 = getelementptr inbounds %struct.TupleValue, ptr %543, i32 0, i32 0
  %545 = load i32, ptr %544, align 8
  %546 = icmp slt i32 %542, %545
  br i1 %546, label %547, label %567

547:                                              ; preds = %541
  %548 = load ptr, ptr %5, align 8
  %549 = load ptr, ptr %6, align 8
  %550 = load ptr, ptr %16, align 8
  %551 = getelementptr inbounds %struct.TupleValue, ptr %550, i32 0, i32 1
  %552 = load ptr, ptr %551, align 8
  %553 = load i32, ptr %18, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds ptr, ptr %552, i64 %554
  %556 = load ptr, ptr %555, align 8
  %557 = call ptr @multCalcLangValues(ptr noundef %548, ptr noundef %549, ptr noundef %556)
  %558 = load ptr, ptr %17, align 8
  %559 = getelementptr inbounds %struct.TupleValue, ptr %558, i32 0, i32 1
  %560 = load ptr, ptr %559, align 8
  %561 = load i32, ptr %18, align 4
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds ptr, ptr %560, i64 %562
  store ptr %557, ptr %563, align 8
  br label %564

564:                                              ; preds = %547
  %565 = load i32, ptr %18, align 4
  %566 = add nsw i32 %565, 1
  store i32 %566, ptr %18, align 4
  br label %541, !llvm.loop !46

567:                                              ; preds = %541
  %568 = load ptr, ptr %8, align 8
  %569 = getelementptr inbounds %struct.CalcLangVal, ptr %568, i32 0, i32 0
  store i32 6, ptr %569, align 8
  %570 = load ptr, ptr %17, align 8
  %571 = load ptr, ptr %8, align 8
  %572 = getelementptr inbounds %struct.CalcLangVal, ptr %571, i32 0, i32 1
  store ptr %570, ptr %572, align 8
  br label %1553

573:                                              ; preds = %515, %510
  %574 = load ptr, ptr %6, align 8
  %575 = getelementptr inbounds %struct.CalcLangVal, ptr %574, i32 0, i32 0
  %576 = load i32, ptr %575, align 8
  %577 = icmp eq i32 %576, 6
  br i1 %577, label %578, label %636

578:                                              ; preds = %573
  %579 = load ptr, ptr %7, align 8
  %580 = getelementptr inbounds %struct.CalcLangVal, ptr %579, i32 0, i32 0
  %581 = load i32, ptr %580, align 8
  %582 = icmp eq i32 %581, 1
  br i1 %582, label %583, label %636

583:                                              ; preds = %578
  %584 = load ptr, ptr %6, align 8
  %585 = getelementptr inbounds %struct.CalcLangVal, ptr %584, i32 0, i32 1
  %586 = load ptr, ptr %585, align 8
  store ptr %586, ptr %19, align 8
  %587 = load ptr, ptr %5, align 8
  %588 = call ptr @arenaAlloc(ptr noundef %587, i32 noundef 16)
  store ptr %588, ptr %20, align 8
  %589 = load ptr, ptr %19, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 0
  %591 = load i32, ptr %590, align 8
  %592 = load ptr, ptr %20, align 8
  %593 = getelementptr inbounds %struct.TupleValue, ptr %592, i32 0, i32 0
  store i32 %591, ptr %593, align 8
  %594 = load ptr, ptr %5, align 8
  %595 = load ptr, ptr %20, align 8
  %596 = getelementptr inbounds %struct.TupleValue, ptr %595, i32 0, i32 0
  %597 = load i32, ptr %596, align 8
  %598 = sext i32 %597 to i64
  %599 = mul i64 8, %598
  %600 = trunc i64 %599 to i32
  %601 = call ptr @arenaAlloc(ptr noundef %594, i32 noundef %600)
  %602 = load ptr, ptr %20, align 8
  %603 = getelementptr inbounds %struct.TupleValue, ptr %602, i32 0, i32 1
  store ptr %601, ptr %603, align 8
  store i32 0, ptr %21, align 4
  br label %604

604:                                              ; preds = %627, %583
  %605 = load i32, ptr %21, align 4
  %606 = load ptr, ptr %19, align 8
  %607 = getelementptr inbounds %struct.TupleValue, ptr %606, i32 0, i32 0
  %608 = load i32, ptr %607, align 8
  %609 = icmp slt i32 %605, %608
  br i1 %609, label %610, label %630

610:                                              ; preds = %604
  %611 = load ptr, ptr %5, align 8
  %612 = load ptr, ptr %19, align 8
  %613 = getelementptr inbounds %struct.TupleValue, ptr %612, i32 0, i32 1
  %614 = load ptr, ptr %613, align 8
  %615 = load i32, ptr %21, align 4
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds ptr, ptr %614, i64 %616
  %618 = load ptr, ptr %617, align 8
  %619 = load ptr, ptr %7, align 8
  %620 = call ptr @multCalcLangValues(ptr noundef %611, ptr noundef %618, ptr noundef %619)
  %621 = load ptr, ptr %20, align 8
  %622 = getelementptr inbounds %struct.TupleValue, ptr %621, i32 0, i32 1
  %623 = load ptr, ptr %622, align 8
  %624 = load i32, ptr %21, align 4
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds ptr, ptr %623, i64 %625
  store ptr %620, ptr %626, align 8
  br label %627

627:                                              ; preds = %610
  %628 = load i32, ptr %21, align 4
  %629 = add nsw i32 %628, 1
  store i32 %629, ptr %21, align 4
  br label %604, !llvm.loop !47

630:                                              ; preds = %604
  %631 = load ptr, ptr %8, align 8
  %632 = getelementptr inbounds %struct.CalcLangVal, ptr %631, i32 0, i32 0
  store i32 6, ptr %632, align 8
  %633 = load ptr, ptr %20, align 8
  %634 = load ptr, ptr %8, align 8
  %635 = getelementptr inbounds %struct.CalcLangVal, ptr %634, i32 0, i32 1
  store ptr %633, ptr %635, align 8
  br label %1552

636:                                              ; preds = %578, %573
  %637 = load ptr, ptr %6, align 8
  %638 = getelementptr inbounds %struct.CalcLangVal, ptr %637, i32 0, i32 0
  %639 = load i32, ptr %638, align 8
  %640 = icmp eq i32 %639, 1
  br i1 %640, label %641, label %699

641:                                              ; preds = %636
  %642 = load ptr, ptr %7, align 8
  %643 = getelementptr inbounds %struct.CalcLangVal, ptr %642, i32 0, i32 0
  %644 = load i32, ptr %643, align 8
  %645 = icmp eq i32 %644, 6
  br i1 %645, label %646, label %699

646:                                              ; preds = %641
  %647 = load ptr, ptr %7, align 8
  %648 = getelementptr inbounds %struct.CalcLangVal, ptr %647, i32 0, i32 1
  %649 = load ptr, ptr %648, align 8
  store ptr %649, ptr %22, align 8
  %650 = load ptr, ptr %5, align 8
  %651 = call ptr @arenaAlloc(ptr noundef %650, i32 noundef 16)
  store ptr %651, ptr %23, align 8
  %652 = load ptr, ptr %22, align 8
  %653 = getelementptr inbounds %struct.TupleValue, ptr %652, i32 0, i32 0
  %654 = load i32, ptr %653, align 8
  %655 = load ptr, ptr %23, align 8
  %656 = getelementptr inbounds %struct.TupleValue, ptr %655, i32 0, i32 0
  store i32 %654, ptr %656, align 8
  %657 = load ptr, ptr %5, align 8
  %658 = load ptr, ptr %23, align 8
  %659 = getelementptr inbounds %struct.TupleValue, ptr %658, i32 0, i32 0
  %660 = load i32, ptr %659, align 8
  %661 = sext i32 %660 to i64
  %662 = mul i64 8, %661
  %663 = trunc i64 %662 to i32
  %664 = call ptr @arenaAlloc(ptr noundef %657, i32 noundef %663)
  %665 = load ptr, ptr %23, align 8
  %666 = getelementptr inbounds %struct.TupleValue, ptr %665, i32 0, i32 1
  store ptr %664, ptr %666, align 8
  store i32 0, ptr %24, align 4
  br label %667

667:                                              ; preds = %690, %646
  %668 = load i32, ptr %24, align 4
  %669 = load ptr, ptr %22, align 8
  %670 = getelementptr inbounds %struct.TupleValue, ptr %669, i32 0, i32 0
  %671 = load i32, ptr %670, align 8
  %672 = icmp slt i32 %668, %671
  br i1 %672, label %673, label %693

673:                                              ; preds = %667
  %674 = load ptr, ptr %5, align 8
  %675 = load ptr, ptr %6, align 8
  %676 = load ptr, ptr %22, align 8
  %677 = getelementptr inbounds %struct.TupleValue, ptr %676, i32 0, i32 1
  %678 = load ptr, ptr %677, align 8
  %679 = load i32, ptr %24, align 4
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds ptr, ptr %678, i64 %680
  %682 = load ptr, ptr %681, align 8
  %683 = call ptr @multCalcLangValues(ptr noundef %674, ptr noundef %675, ptr noundef %682)
  %684 = load ptr, ptr %23, align 8
  %685 = getelementptr inbounds %struct.TupleValue, ptr %684, i32 0, i32 1
  %686 = load ptr, ptr %685, align 8
  %687 = load i32, ptr %24, align 4
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds ptr, ptr %686, i64 %688
  store ptr %683, ptr %689, align 8
  br label %690

690:                                              ; preds = %673
  %691 = load i32, ptr %24, align 4
  %692 = add nsw i32 %691, 1
  store i32 %692, ptr %24, align 4
  br label %667, !llvm.loop !48

693:                                              ; preds = %667
  %694 = load ptr, ptr %8, align 8
  %695 = getelementptr inbounds %struct.CalcLangVal, ptr %694, i32 0, i32 0
  store i32 6, ptr %695, align 8
  %696 = load ptr, ptr %23, align 8
  %697 = load ptr, ptr %8, align 8
  %698 = getelementptr inbounds %struct.CalcLangVal, ptr %697, i32 0, i32 1
  store ptr %696, ptr %698, align 8
  br label %1551

699:                                              ; preds = %641, %636
  %700 = load ptr, ptr %6, align 8
  %701 = getelementptr inbounds %struct.CalcLangVal, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = icmp eq i32 %702, 6
  br i1 %703, label %704, label %762

704:                                              ; preds = %699
  %705 = load ptr, ptr %7, align 8
  %706 = getelementptr inbounds %struct.CalcLangVal, ptr %705, i32 0, i32 0
  %707 = load i32, ptr %706, align 8
  %708 = icmp eq i32 %707, 2
  br i1 %708, label %709, label %762

709:                                              ; preds = %704
  %710 = load ptr, ptr %6, align 8
  %711 = getelementptr inbounds %struct.CalcLangVal, ptr %710, i32 0, i32 1
  %712 = load ptr, ptr %711, align 8
  store ptr %712, ptr %25, align 8
  %713 = load ptr, ptr %5, align 8
  %714 = call ptr @arenaAlloc(ptr noundef %713, i32 noundef 16)
  store ptr %714, ptr %26, align 8
  %715 = load ptr, ptr %25, align 8
  %716 = getelementptr inbounds %struct.TupleValue, ptr %715, i32 0, i32 0
  %717 = load i32, ptr %716, align 8
  %718 = load ptr, ptr %26, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 0
  store i32 %717, ptr %719, align 8
  %720 = load ptr, ptr %5, align 8
  %721 = load ptr, ptr %26, align 8
  %722 = getelementptr inbounds %struct.TupleValue, ptr %721, i32 0, i32 0
  %723 = load i32, ptr %722, align 8
  %724 = sext i32 %723 to i64
  %725 = mul i64 8, %724
  %726 = trunc i64 %725 to i32
  %727 = call ptr @arenaAlloc(ptr noundef %720, i32 noundef %726)
  %728 = load ptr, ptr %26, align 8
  %729 = getelementptr inbounds %struct.TupleValue, ptr %728, i32 0, i32 1
  store ptr %727, ptr %729, align 8
  store i32 0, ptr %27, align 4
  br label %730

730:                                              ; preds = %753, %709
  %731 = load i32, ptr %27, align 4
  %732 = load ptr, ptr %25, align 8
  %733 = getelementptr inbounds %struct.TupleValue, ptr %732, i32 0, i32 0
  %734 = load i32, ptr %733, align 8
  %735 = icmp slt i32 %731, %734
  br i1 %735, label %736, label %756

736:                                              ; preds = %730
  %737 = load ptr, ptr %5, align 8
  %738 = load ptr, ptr %25, align 8
  %739 = getelementptr inbounds %struct.TupleValue, ptr %738, i32 0, i32 1
  %740 = load ptr, ptr %739, align 8
  %741 = load i32, ptr %27, align 4
  %742 = sext i32 %741 to i64
  %743 = getelementptr inbounds ptr, ptr %740, i64 %742
  %744 = load ptr, ptr %743, align 8
  %745 = load ptr, ptr %7, align 8
  %746 = call ptr @multCalcLangValues(ptr noundef %737, ptr noundef %744, ptr noundef %745)
  %747 = load ptr, ptr %26, align 8
  %748 = getelementptr inbounds %struct.TupleValue, ptr %747, i32 0, i32 1
  %749 = load ptr, ptr %748, align 8
  %750 = load i32, ptr %27, align 4
  %751 = sext i32 %750 to i64
  %752 = getelementptr inbounds ptr, ptr %749, i64 %751
  store ptr %746, ptr %752, align 8
  br label %753

753:                                              ; preds = %736
  %754 = load i32, ptr %27, align 4
  %755 = add nsw i32 %754, 1
  store i32 %755, ptr %27, align 4
  br label %730, !llvm.loop !49

756:                                              ; preds = %730
  %757 = load ptr, ptr %8, align 8
  %758 = getelementptr inbounds %struct.CalcLangVal, ptr %757, i32 0, i32 0
  store i32 6, ptr %758, align 8
  %759 = load ptr, ptr %26, align 8
  %760 = load ptr, ptr %8, align 8
  %761 = getelementptr inbounds %struct.CalcLangVal, ptr %760, i32 0, i32 1
  store ptr %759, ptr %761, align 8
  br label %1550

762:                                              ; preds = %704, %699
  %763 = load ptr, ptr %6, align 8
  %764 = getelementptr inbounds %struct.CalcLangVal, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = icmp eq i32 %765, 2
  br i1 %766, label %767, label %825

767:                                              ; preds = %762
  %768 = load ptr, ptr %7, align 8
  %769 = getelementptr inbounds %struct.CalcLangVal, ptr %768, i32 0, i32 0
  %770 = load i32, ptr %769, align 8
  %771 = icmp eq i32 %770, 6
  br i1 %771, label %772, label %825

772:                                              ; preds = %767
  %773 = load ptr, ptr %7, align 8
  %774 = getelementptr inbounds %struct.CalcLangVal, ptr %773, i32 0, i32 1
  %775 = load ptr, ptr %774, align 8
  store ptr %775, ptr %28, align 8
  %776 = load ptr, ptr %5, align 8
  %777 = call ptr @arenaAlloc(ptr noundef %776, i32 noundef 16)
  store ptr %777, ptr %29, align 8
  %778 = load ptr, ptr %28, align 8
  %779 = getelementptr inbounds %struct.TupleValue, ptr %778, i32 0, i32 0
  %780 = load i32, ptr %779, align 8
  %781 = load ptr, ptr %29, align 8
  %782 = getelementptr inbounds %struct.TupleValue, ptr %781, i32 0, i32 0
  store i32 %780, ptr %782, align 8
  %783 = load ptr, ptr %5, align 8
  %784 = load ptr, ptr %29, align 8
  %785 = getelementptr inbounds %struct.TupleValue, ptr %784, i32 0, i32 0
  %786 = load i32, ptr %785, align 8
  %787 = sext i32 %786 to i64
  %788 = mul i64 8, %787
  %789 = trunc i64 %788 to i32
  %790 = call ptr @arenaAlloc(ptr noundef %783, i32 noundef %789)
  %791 = load ptr, ptr %29, align 8
  %792 = getelementptr inbounds %struct.TupleValue, ptr %791, i32 0, i32 1
  store ptr %790, ptr %792, align 8
  store i32 0, ptr %30, align 4
  br label %793

793:                                              ; preds = %816, %772
  %794 = load i32, ptr %30, align 4
  %795 = load ptr, ptr %28, align 8
  %796 = getelementptr inbounds %struct.TupleValue, ptr %795, i32 0, i32 0
  %797 = load i32, ptr %796, align 8
  %798 = icmp slt i32 %794, %797
  br i1 %798, label %799, label %819

799:                                              ; preds = %793
  %800 = load ptr, ptr %5, align 8
  %801 = load ptr, ptr %6, align 8
  %802 = load ptr, ptr %28, align 8
  %803 = getelementptr inbounds %struct.TupleValue, ptr %802, i32 0, i32 1
  %804 = load ptr, ptr %803, align 8
  %805 = load i32, ptr %30, align 4
  %806 = sext i32 %805 to i64
  %807 = getelementptr inbounds ptr, ptr %804, i64 %806
  %808 = load ptr, ptr %807, align 8
  %809 = call ptr @multCalcLangValues(ptr noundef %800, ptr noundef %801, ptr noundef %808)
  %810 = load ptr, ptr %29, align 8
  %811 = getelementptr inbounds %struct.TupleValue, ptr %810, i32 0, i32 1
  %812 = load ptr, ptr %811, align 8
  %813 = load i32, ptr %30, align 4
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds ptr, ptr %812, i64 %814
  store ptr %809, ptr %815, align 8
  br label %816

816:                                              ; preds = %799
  %817 = load i32, ptr %30, align 4
  %818 = add nsw i32 %817, 1
  store i32 %818, ptr %30, align 4
  br label %793, !llvm.loop !50

819:                                              ; preds = %793
  %820 = load ptr, ptr %8, align 8
  %821 = getelementptr inbounds %struct.CalcLangVal, ptr %820, i32 0, i32 0
  store i32 6, ptr %821, align 8
  %822 = load ptr, ptr %29, align 8
  %823 = load ptr, ptr %8, align 8
  %824 = getelementptr inbounds %struct.CalcLangVal, ptr %823, i32 0, i32 1
  store ptr %822, ptr %824, align 8
  br label %1549

825:                                              ; preds = %767, %762
  %826 = load ptr, ptr %6, align 8
  %827 = getelementptr inbounds %struct.CalcLangVal, ptr %826, i32 0, i32 0
  %828 = load i32, ptr %827, align 8
  %829 = icmp eq i32 %828, 6
  br i1 %829, label %830, label %888

830:                                              ; preds = %825
  %831 = load ptr, ptr %7, align 8
  %832 = getelementptr inbounds %struct.CalcLangVal, ptr %831, i32 0, i32 0
  %833 = load i32, ptr %832, align 8
  %834 = icmp eq i32 %833, 3
  br i1 %834, label %835, label %888

835:                                              ; preds = %830
  %836 = load ptr, ptr %6, align 8
  %837 = getelementptr inbounds %struct.CalcLangVal, ptr %836, i32 0, i32 1
  %838 = load ptr, ptr %837, align 8
  store ptr %838, ptr %31, align 8
  %839 = load ptr, ptr %5, align 8
  %840 = call ptr @arenaAlloc(ptr noundef %839, i32 noundef 16)
  store ptr %840, ptr %32, align 8
  %841 = load ptr, ptr %31, align 8
  %842 = getelementptr inbounds %struct.TupleValue, ptr %841, i32 0, i32 0
  %843 = load i32, ptr %842, align 8
  %844 = load ptr, ptr %32, align 8
  %845 = getelementptr inbounds %struct.TupleValue, ptr %844, i32 0, i32 0
  store i32 %843, ptr %845, align 8
  %846 = load ptr, ptr %5, align 8
  %847 = load ptr, ptr %32, align 8
  %848 = getelementptr inbounds %struct.TupleValue, ptr %847, i32 0, i32 0
  %849 = load i32, ptr %848, align 8
  %850 = sext i32 %849 to i64
  %851 = mul i64 8, %850
  %852 = trunc i64 %851 to i32
  %853 = call ptr @arenaAlloc(ptr noundef %846, i32 noundef %852)
  %854 = load ptr, ptr %32, align 8
  %855 = getelementptr inbounds %struct.TupleValue, ptr %854, i32 0, i32 1
  store ptr %853, ptr %855, align 8
  store i32 0, ptr %33, align 4
  br label %856

856:                                              ; preds = %879, %835
  %857 = load i32, ptr %33, align 4
  %858 = load ptr, ptr %31, align 8
  %859 = getelementptr inbounds %struct.TupleValue, ptr %858, i32 0, i32 0
  %860 = load i32, ptr %859, align 8
  %861 = icmp slt i32 %857, %860
  br i1 %861, label %862, label %882

862:                                              ; preds = %856
  %863 = load ptr, ptr %5, align 8
  %864 = load ptr, ptr %31, align 8
  %865 = getelementptr inbounds %struct.TupleValue, ptr %864, i32 0, i32 1
  %866 = load ptr, ptr %865, align 8
  %867 = load i32, ptr %33, align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds ptr, ptr %866, i64 %868
  %870 = load ptr, ptr %869, align 8
  %871 = load ptr, ptr %7, align 8
  %872 = call ptr @multCalcLangValues(ptr noundef %863, ptr noundef %870, ptr noundef %871)
  %873 = load ptr, ptr %32, align 8
  %874 = getelementptr inbounds %struct.TupleValue, ptr %873, i32 0, i32 1
  %875 = load ptr, ptr %874, align 8
  %876 = load i32, ptr %33, align 4
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds ptr, ptr %875, i64 %877
  store ptr %872, ptr %878, align 8
  br label %879

879:                                              ; preds = %862
  %880 = load i32, ptr %33, align 4
  %881 = add nsw i32 %880, 1
  store i32 %881, ptr %33, align 4
  br label %856, !llvm.loop !51

882:                                              ; preds = %856
  %883 = load ptr, ptr %8, align 8
  %884 = getelementptr inbounds %struct.CalcLangVal, ptr %883, i32 0, i32 0
  store i32 6, ptr %884, align 8
  %885 = load ptr, ptr %32, align 8
  %886 = load ptr, ptr %8, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 1
  store ptr %885, ptr %887, align 8
  br label %1548

888:                                              ; preds = %830, %825
  %889 = load ptr, ptr %6, align 8
  %890 = getelementptr inbounds %struct.CalcLangVal, ptr %889, i32 0, i32 0
  %891 = load i32, ptr %890, align 8
  %892 = icmp eq i32 %891, 3
  br i1 %892, label %893, label %951

893:                                              ; preds = %888
  %894 = load ptr, ptr %7, align 8
  %895 = getelementptr inbounds %struct.CalcLangVal, ptr %894, i32 0, i32 0
  %896 = load i32, ptr %895, align 8
  %897 = icmp eq i32 %896, 6
  br i1 %897, label %898, label %951

898:                                              ; preds = %893
  %899 = load ptr, ptr %7, align 8
  %900 = getelementptr inbounds %struct.CalcLangVal, ptr %899, i32 0, i32 1
  %901 = load ptr, ptr %900, align 8
  store ptr %901, ptr %34, align 8
  %902 = load ptr, ptr %5, align 8
  %903 = call ptr @arenaAlloc(ptr noundef %902, i32 noundef 16)
  store ptr %903, ptr %35, align 8
  %904 = load ptr, ptr %34, align 8
  %905 = getelementptr inbounds %struct.TupleValue, ptr %904, i32 0, i32 0
  %906 = load i32, ptr %905, align 8
  %907 = load ptr, ptr %35, align 8
  %908 = getelementptr inbounds %struct.TupleValue, ptr %907, i32 0, i32 0
  store i32 %906, ptr %908, align 8
  %909 = load ptr, ptr %5, align 8
  %910 = load ptr, ptr %35, align 8
  %911 = getelementptr inbounds %struct.TupleValue, ptr %910, i32 0, i32 0
  %912 = load i32, ptr %911, align 8
  %913 = sext i32 %912 to i64
  %914 = mul i64 8, %913
  %915 = trunc i64 %914 to i32
  %916 = call ptr @arenaAlloc(ptr noundef %909, i32 noundef %915)
  %917 = load ptr, ptr %35, align 8
  %918 = getelementptr inbounds %struct.TupleValue, ptr %917, i32 0, i32 1
  store ptr %916, ptr %918, align 8
  store i32 0, ptr %36, align 4
  br label %919

919:                                              ; preds = %942, %898
  %920 = load i32, ptr %36, align 4
  %921 = load ptr, ptr %34, align 8
  %922 = getelementptr inbounds %struct.TupleValue, ptr %921, i32 0, i32 0
  %923 = load i32, ptr %922, align 8
  %924 = icmp slt i32 %920, %923
  br i1 %924, label %925, label %945

925:                                              ; preds = %919
  %926 = load ptr, ptr %5, align 8
  %927 = load ptr, ptr %6, align 8
  %928 = load ptr, ptr %34, align 8
  %929 = getelementptr inbounds %struct.TupleValue, ptr %928, i32 0, i32 1
  %930 = load ptr, ptr %929, align 8
  %931 = load i32, ptr %36, align 4
  %932 = sext i32 %931 to i64
  %933 = getelementptr inbounds ptr, ptr %930, i64 %932
  %934 = load ptr, ptr %933, align 8
  %935 = call ptr @multCalcLangValues(ptr noundef %926, ptr noundef %927, ptr noundef %934)
  %936 = load ptr, ptr %35, align 8
  %937 = getelementptr inbounds %struct.TupleValue, ptr %936, i32 0, i32 1
  %938 = load ptr, ptr %937, align 8
  %939 = load i32, ptr %36, align 4
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds ptr, ptr %938, i64 %940
  store ptr %935, ptr %941, align 8
  br label %942

942:                                              ; preds = %925
  %943 = load i32, ptr %36, align 4
  %944 = add nsw i32 %943, 1
  store i32 %944, ptr %36, align 4
  br label %919, !llvm.loop !52

945:                                              ; preds = %919
  %946 = load ptr, ptr %8, align 8
  %947 = getelementptr inbounds %struct.CalcLangVal, ptr %946, i32 0, i32 0
  store i32 6, ptr %947, align 8
  %948 = load ptr, ptr %35, align 8
  %949 = load ptr, ptr %8, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 1
  store ptr %948, ptr %950, align 8
  br label %1547

951:                                              ; preds = %893, %888
  %952 = load ptr, ptr %6, align 8
  %953 = getelementptr inbounds %struct.CalcLangVal, ptr %952, i32 0, i32 0
  %954 = load i32, ptr %953, align 8
  %955 = icmp eq i32 %954, 5
  br i1 %955, label %956, label %1033

956:                                              ; preds = %951
  %957 = load ptr, ptr %7, align 8
  %958 = getelementptr inbounds %struct.CalcLangVal, ptr %957, i32 0, i32 0
  %959 = load i32, ptr %958, align 8
  %960 = icmp eq i32 %959, 5
  br i1 %960, label %961, label %1033

961:                                              ; preds = %956
  %962 = load ptr, ptr %6, align 8
  %963 = getelementptr inbounds %struct.CalcLangVal, ptr %962, i32 0, i32 1
  %964 = load ptr, ptr %963, align 8
  store ptr %964, ptr %37, align 8
  %965 = load ptr, ptr %7, align 8
  %966 = getelementptr inbounds %struct.CalcLangVal, ptr %965, i32 0, i32 1
  %967 = load ptr, ptr %966, align 8
  store ptr %967, ptr %38, align 8
  %968 = load ptr, ptr %38, align 8
  %969 = getelementptr inbounds %struct.SetValue, ptr %968, i32 0, i32 0
  %970 = load i32, ptr %969, align 8
  %971 = load ptr, ptr %37, align 8
  %972 = getelementptr inbounds %struct.SetValue, ptr %971, i32 0, i32 0
  %973 = load i32, ptr %972, align 8
  %974 = icmp eq i32 %970, %973
  br i1 %974, label %975, label %1031

975:                                              ; preds = %961
  %976 = load ptr, ptr %5, align 8
  %977 = call ptr @arenaAlloc(ptr noundef %976, i32 noundef 16)
  store ptr %977, ptr %39, align 8
  %978 = load ptr, ptr %37, align 8
  %979 = getelementptr inbounds %struct.SetValue, ptr %978, i32 0, i32 0
  %980 = load i32, ptr %979, align 8
  %981 = load ptr, ptr %39, align 8
  %982 = getelementptr inbounds %struct.SetValue, ptr %981, i32 0, i32 0
  store i32 %980, ptr %982, align 8
  %983 = load ptr, ptr %5, align 8
  %984 = load ptr, ptr %39, align 8
  %985 = getelementptr inbounds %struct.SetValue, ptr %984, i32 0, i32 0
  %986 = load i32, ptr %985, align 8
  %987 = sext i32 %986 to i64
  %988 = mul i64 8, %987
  %989 = trunc i64 %988 to i32
  %990 = call ptr @arenaAlloc(ptr noundef %983, i32 noundef %989)
  %991 = load ptr, ptr %39, align 8
  %992 = getelementptr inbounds %struct.SetValue, ptr %991, i32 0, i32 1
  store ptr %990, ptr %992, align 8
  store i32 0, ptr %40, align 4
  br label %993

993:                                              ; preds = %1022, %975
  %994 = load i32, ptr %40, align 4
  %995 = load ptr, ptr %37, align 8
  %996 = getelementptr inbounds %struct.SetValue, ptr %995, i32 0, i32 0
  %997 = load i32, ptr %996, align 8
  %998 = icmp slt i32 %994, %997
  br i1 %998, label %999, label %1025

999:                                              ; preds = %993
  %1000 = load ptr, ptr %5, align 8
  %1001 = load ptr, ptr %37, align 8
  %1002 = getelementptr inbounds %struct.SetValue, ptr %1001, i32 0, i32 1
  %1003 = load ptr, ptr %1002, align 8
  %1004 = load i32, ptr %40, align 4
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds ptr, ptr %1003, i64 %1005
  %1007 = load ptr, ptr %1006, align 8
  %1008 = load ptr, ptr %38, align 8
  %1009 = getelementptr inbounds %struct.SetValue, ptr %1008, i32 0, i32 1
  %1010 = load ptr, ptr %1009, align 8
  %1011 = load i32, ptr %40, align 4
  %1012 = sext i32 %1011 to i64
  %1013 = getelementptr inbounds ptr, ptr %1010, i64 %1012
  %1014 = load ptr, ptr %1013, align 8
  %1015 = call ptr @multCalcLangValues(ptr noundef %1000, ptr noundef %1007, ptr noundef %1014)
  %1016 = load ptr, ptr %39, align 8
  %1017 = getelementptr inbounds %struct.SetValue, ptr %1016, i32 0, i32 1
  %1018 = load ptr, ptr %1017, align 8
  %1019 = load i32, ptr %40, align 4
  %1020 = sext i32 %1019 to i64
  %1021 = getelementptr inbounds ptr, ptr %1018, i64 %1020
  store ptr %1015, ptr %1021, align 8
  br label %1022

1022:                                             ; preds = %999
  %1023 = load i32, ptr %40, align 4
  %1024 = add nsw i32 %1023, 1
  store i32 %1024, ptr %40, align 4
  br label %993, !llvm.loop !53

1025:                                             ; preds = %993
  %1026 = load ptr, ptr %8, align 8
  %1027 = getelementptr inbounds %struct.CalcLangVal, ptr %1026, i32 0, i32 0
  store i32 5, ptr %1027, align 8
  %1028 = load ptr, ptr %39, align 8
  %1029 = load ptr, ptr %8, align 8
  %1030 = getelementptr inbounds %struct.CalcLangVal, ptr %1029, i32 0, i32 1
  store ptr %1028, ptr %1030, align 8
  br label %1032

1031:                                             ; preds = %961
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1570

1032:                                             ; preds = %1025
  br label %1546

1033:                                             ; preds = %956, %951
  %1034 = load ptr, ptr %6, align 8
  %1035 = getelementptr inbounds %struct.CalcLangVal, ptr %1034, i32 0, i32 0
  %1036 = load i32, ptr %1035, align 8
  %1037 = icmp eq i32 %1036, 5
  br i1 %1037, label %1038, label %1096

1038:                                             ; preds = %1033
  %1039 = load ptr, ptr %7, align 8
  %1040 = getelementptr inbounds %struct.CalcLangVal, ptr %1039, i32 0, i32 0
  %1041 = load i32, ptr %1040, align 8
  %1042 = icmp eq i32 %1041, 0
  br i1 %1042, label %1043, label %1096

1043:                                             ; preds = %1038
  %1044 = load ptr, ptr %6, align 8
  %1045 = getelementptr inbounds %struct.CalcLangVal, ptr %1044, i32 0, i32 1
  %1046 = load ptr, ptr %1045, align 8
  store ptr %1046, ptr %41, align 8
  %1047 = load ptr, ptr %5, align 8
  %1048 = call ptr @arenaAlloc(ptr noundef %1047, i32 noundef 16)
  store ptr %1048, ptr %42, align 8
  %1049 = load ptr, ptr %41, align 8
  %1050 = getelementptr inbounds %struct.SetValue, ptr %1049, i32 0, i32 0
  %1051 = load i32, ptr %1050, align 8
  %1052 = load ptr, ptr %42, align 8
  %1053 = getelementptr inbounds %struct.SetValue, ptr %1052, i32 0, i32 0
  store i32 %1051, ptr %1053, align 8
  %1054 = load ptr, ptr %5, align 8
  %1055 = load ptr, ptr %42, align 8
  %1056 = getelementptr inbounds %struct.SetValue, ptr %1055, i32 0, i32 0
  %1057 = load i32, ptr %1056, align 8
  %1058 = sext i32 %1057 to i64
  %1059 = mul i64 8, %1058
  %1060 = trunc i64 %1059 to i32
  %1061 = call ptr @arenaAlloc(ptr noundef %1054, i32 noundef %1060)
  %1062 = load ptr, ptr %42, align 8
  %1063 = getelementptr inbounds %struct.SetValue, ptr %1062, i32 0, i32 1
  store ptr %1061, ptr %1063, align 8
  store i32 0, ptr %43, align 4
  br label %1064

1064:                                             ; preds = %1087, %1043
  %1065 = load i32, ptr %43, align 4
  %1066 = load ptr, ptr %41, align 8
  %1067 = getelementptr inbounds %struct.SetValue, ptr %1066, i32 0, i32 0
  %1068 = load i32, ptr %1067, align 8
  %1069 = icmp slt i32 %1065, %1068
  br i1 %1069, label %1070, label %1090

1070:                                             ; preds = %1064
  %1071 = load ptr, ptr %5, align 8
  %1072 = load ptr, ptr %41, align 8
  %1073 = getelementptr inbounds %struct.SetValue, ptr %1072, i32 0, i32 1
  %1074 = load ptr, ptr %1073, align 8
  %1075 = load i32, ptr %43, align 4
  %1076 = sext i32 %1075 to i64
  %1077 = getelementptr inbounds ptr, ptr %1074, i64 %1076
  %1078 = load ptr, ptr %1077, align 8
  %1079 = load ptr, ptr %7, align 8
  %1080 = call ptr @multCalcLangValues(ptr noundef %1071, ptr noundef %1078, ptr noundef %1079)
  %1081 = load ptr, ptr %42, align 8
  %1082 = getelementptr inbounds %struct.SetValue, ptr %1081, i32 0, i32 1
  %1083 = load ptr, ptr %1082, align 8
  %1084 = load i32, ptr %43, align 4
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds ptr, ptr %1083, i64 %1085
  store ptr %1080, ptr %1086, align 8
  br label %1087

1087:                                             ; preds = %1070
  %1088 = load i32, ptr %43, align 4
  %1089 = add nsw i32 %1088, 1
  store i32 %1089, ptr %43, align 4
  br label %1064, !llvm.loop !54

1090:                                             ; preds = %1064
  %1091 = load ptr, ptr %8, align 8
  %1092 = getelementptr inbounds %struct.CalcLangVal, ptr %1091, i32 0, i32 0
  store i32 5, ptr %1092, align 8
  %1093 = load ptr, ptr %42, align 8
  %1094 = load ptr, ptr %8, align 8
  %1095 = getelementptr inbounds %struct.CalcLangVal, ptr %1094, i32 0, i32 1
  store ptr %1093, ptr %1095, align 8
  br label %1545

1096:                                             ; preds = %1038, %1033
  %1097 = load ptr, ptr %6, align 8
  %1098 = getelementptr inbounds %struct.CalcLangVal, ptr %1097, i32 0, i32 0
  %1099 = load i32, ptr %1098, align 8
  %1100 = icmp eq i32 %1099, 0
  br i1 %1100, label %1101, label %1159

1101:                                             ; preds = %1096
  %1102 = load ptr, ptr %7, align 8
  %1103 = getelementptr inbounds %struct.CalcLangVal, ptr %1102, i32 0, i32 0
  %1104 = load i32, ptr %1103, align 8
  %1105 = icmp eq i32 %1104, 5
  br i1 %1105, label %1106, label %1159

1106:                                             ; preds = %1101
  %1107 = load ptr, ptr %7, align 8
  %1108 = getelementptr inbounds %struct.CalcLangVal, ptr %1107, i32 0, i32 1
  %1109 = load ptr, ptr %1108, align 8
  store ptr %1109, ptr %44, align 8
  %1110 = load ptr, ptr %5, align 8
  %1111 = call ptr @arenaAlloc(ptr noundef %1110, i32 noundef 16)
  store ptr %1111, ptr %45, align 8
  %1112 = load ptr, ptr %44, align 8
  %1113 = getelementptr inbounds %struct.SetValue, ptr %1112, i32 0, i32 0
  %1114 = load i32, ptr %1113, align 8
  %1115 = load ptr, ptr %45, align 8
  %1116 = getelementptr inbounds %struct.SetValue, ptr %1115, i32 0, i32 0
  store i32 %1114, ptr %1116, align 8
  %1117 = load ptr, ptr %5, align 8
  %1118 = load ptr, ptr %45, align 8
  %1119 = getelementptr inbounds %struct.SetValue, ptr %1118, i32 0, i32 0
  %1120 = load i32, ptr %1119, align 8
  %1121 = sext i32 %1120 to i64
  %1122 = mul i64 8, %1121
  %1123 = trunc i64 %1122 to i32
  %1124 = call ptr @arenaAlloc(ptr noundef %1117, i32 noundef %1123)
  %1125 = load ptr, ptr %45, align 8
  %1126 = getelementptr inbounds %struct.SetValue, ptr %1125, i32 0, i32 1
  store ptr %1124, ptr %1126, align 8
  store i32 0, ptr %46, align 4
  br label %1127

1127:                                             ; preds = %1150, %1106
  %1128 = load i32, ptr %46, align 4
  %1129 = load ptr, ptr %44, align 8
  %1130 = getelementptr inbounds %struct.SetValue, ptr %1129, i32 0, i32 0
  %1131 = load i32, ptr %1130, align 8
  %1132 = icmp slt i32 %1128, %1131
  br i1 %1132, label %1133, label %1153

1133:                                             ; preds = %1127
  %1134 = load ptr, ptr %5, align 8
  %1135 = load ptr, ptr %6, align 8
  %1136 = load ptr, ptr %44, align 8
  %1137 = getelementptr inbounds %struct.SetValue, ptr %1136, i32 0, i32 1
  %1138 = load ptr, ptr %1137, align 8
  %1139 = load i32, ptr %46, align 4
  %1140 = sext i32 %1139 to i64
  %1141 = getelementptr inbounds ptr, ptr %1138, i64 %1140
  %1142 = load ptr, ptr %1141, align 8
  %1143 = call ptr @multCalcLangValues(ptr noundef %1134, ptr noundef %1135, ptr noundef %1142)
  %1144 = load ptr, ptr %45, align 8
  %1145 = getelementptr inbounds %struct.SetValue, ptr %1144, i32 0, i32 1
  %1146 = load ptr, ptr %1145, align 8
  %1147 = load i32, ptr %46, align 4
  %1148 = sext i32 %1147 to i64
  %1149 = getelementptr inbounds ptr, ptr %1146, i64 %1148
  store ptr %1143, ptr %1149, align 8
  br label %1150

1150:                                             ; preds = %1133
  %1151 = load i32, ptr %46, align 4
  %1152 = add nsw i32 %1151, 1
  store i32 %1152, ptr %46, align 4
  br label %1127, !llvm.loop !55

1153:                                             ; preds = %1127
  %1154 = load ptr, ptr %8, align 8
  %1155 = getelementptr inbounds %struct.CalcLangVal, ptr %1154, i32 0, i32 0
  store i32 5, ptr %1155, align 8
  %1156 = load ptr, ptr %45, align 8
  %1157 = load ptr, ptr %8, align 8
  %1158 = getelementptr inbounds %struct.CalcLangVal, ptr %1157, i32 0, i32 1
  store ptr %1156, ptr %1158, align 8
  br label %1544

1159:                                             ; preds = %1101, %1096
  %1160 = load ptr, ptr %6, align 8
  %1161 = getelementptr inbounds %struct.CalcLangVal, ptr %1160, i32 0, i32 0
  %1162 = load i32, ptr %1161, align 8
  %1163 = icmp eq i32 %1162, 5
  br i1 %1163, label %1164, label %1222

1164:                                             ; preds = %1159
  %1165 = load ptr, ptr %7, align 8
  %1166 = getelementptr inbounds %struct.CalcLangVal, ptr %1165, i32 0, i32 0
  %1167 = load i32, ptr %1166, align 8
  %1168 = icmp eq i32 %1167, 1
  br i1 %1168, label %1169, label %1222

1169:                                             ; preds = %1164
  %1170 = load ptr, ptr %6, align 8
  %1171 = getelementptr inbounds %struct.CalcLangVal, ptr %1170, i32 0, i32 1
  %1172 = load ptr, ptr %1171, align 8
  store ptr %1172, ptr %47, align 8
  %1173 = load ptr, ptr %5, align 8
  %1174 = call ptr @arenaAlloc(ptr noundef %1173, i32 noundef 16)
  store ptr %1174, ptr %48, align 8
  %1175 = load ptr, ptr %47, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 0
  %1177 = load i32, ptr %1176, align 8
  %1178 = load ptr, ptr %48, align 8
  %1179 = getelementptr inbounds %struct.SetValue, ptr %1178, i32 0, i32 0
  store i32 %1177, ptr %1179, align 8
  %1180 = load ptr, ptr %5, align 8
  %1181 = load ptr, ptr %48, align 8
  %1182 = getelementptr inbounds %struct.SetValue, ptr %1181, i32 0, i32 0
  %1183 = load i32, ptr %1182, align 8
  %1184 = sext i32 %1183 to i64
  %1185 = mul i64 8, %1184
  %1186 = trunc i64 %1185 to i32
  %1187 = call ptr @arenaAlloc(ptr noundef %1180, i32 noundef %1186)
  %1188 = load ptr, ptr %48, align 8
  %1189 = getelementptr inbounds %struct.SetValue, ptr %1188, i32 0, i32 1
  store ptr %1187, ptr %1189, align 8
  store i32 0, ptr %49, align 4
  br label %1190

1190:                                             ; preds = %1213, %1169
  %1191 = load i32, ptr %49, align 4
  %1192 = load ptr, ptr %47, align 8
  %1193 = getelementptr inbounds %struct.SetValue, ptr %1192, i32 0, i32 0
  %1194 = load i32, ptr %1193, align 8
  %1195 = icmp slt i32 %1191, %1194
  br i1 %1195, label %1196, label %1216

1196:                                             ; preds = %1190
  %1197 = load ptr, ptr %5, align 8
  %1198 = load ptr, ptr %47, align 8
  %1199 = getelementptr inbounds %struct.SetValue, ptr %1198, i32 0, i32 1
  %1200 = load ptr, ptr %1199, align 8
  %1201 = load i32, ptr %49, align 4
  %1202 = sext i32 %1201 to i64
  %1203 = getelementptr inbounds ptr, ptr %1200, i64 %1202
  %1204 = load ptr, ptr %1203, align 8
  %1205 = load ptr, ptr %7, align 8
  %1206 = call ptr @multCalcLangValues(ptr noundef %1197, ptr noundef %1204, ptr noundef %1205)
  %1207 = load ptr, ptr %48, align 8
  %1208 = getelementptr inbounds %struct.SetValue, ptr %1207, i32 0, i32 1
  %1209 = load ptr, ptr %1208, align 8
  %1210 = load i32, ptr %49, align 4
  %1211 = sext i32 %1210 to i64
  %1212 = getelementptr inbounds ptr, ptr %1209, i64 %1211
  store ptr %1206, ptr %1212, align 8
  br label %1213

1213:                                             ; preds = %1196
  %1214 = load i32, ptr %49, align 4
  %1215 = add nsw i32 %1214, 1
  store i32 %1215, ptr %49, align 4
  br label %1190, !llvm.loop !56

1216:                                             ; preds = %1190
  %1217 = load ptr, ptr %8, align 8
  %1218 = getelementptr inbounds %struct.CalcLangVal, ptr %1217, i32 0, i32 0
  store i32 6, ptr %1218, align 8
  %1219 = load ptr, ptr %48, align 8
  %1220 = load ptr, ptr %8, align 8
  %1221 = getelementptr inbounds %struct.CalcLangVal, ptr %1220, i32 0, i32 1
  store ptr %1219, ptr %1221, align 8
  br label %1543

1222:                                             ; preds = %1164, %1159
  %1223 = load ptr, ptr %6, align 8
  %1224 = getelementptr inbounds %struct.CalcLangVal, ptr %1223, i32 0, i32 0
  %1225 = load i32, ptr %1224, align 8
  %1226 = icmp eq i32 %1225, 1
  br i1 %1226, label %1227, label %1285

1227:                                             ; preds = %1222
  %1228 = load ptr, ptr %7, align 8
  %1229 = getelementptr inbounds %struct.CalcLangVal, ptr %1228, i32 0, i32 0
  %1230 = load i32, ptr %1229, align 8
  %1231 = icmp eq i32 %1230, 5
  br i1 %1231, label %1232, label %1285

1232:                                             ; preds = %1227
  %1233 = load ptr, ptr %7, align 8
  %1234 = getelementptr inbounds %struct.CalcLangVal, ptr %1233, i32 0, i32 1
  %1235 = load ptr, ptr %1234, align 8
  store ptr %1235, ptr %50, align 8
  %1236 = load ptr, ptr %5, align 8
  %1237 = call ptr @arenaAlloc(ptr noundef %1236, i32 noundef 16)
  store ptr %1237, ptr %51, align 8
  %1238 = load ptr, ptr %50, align 8
  %1239 = getelementptr inbounds %struct.SetValue, ptr %1238, i32 0, i32 0
  %1240 = load i32, ptr %1239, align 8
  %1241 = load ptr, ptr %51, align 8
  %1242 = getelementptr inbounds %struct.SetValue, ptr %1241, i32 0, i32 0
  store i32 %1240, ptr %1242, align 8
  %1243 = load ptr, ptr %5, align 8
  %1244 = load ptr, ptr %51, align 8
  %1245 = getelementptr inbounds %struct.SetValue, ptr %1244, i32 0, i32 0
  %1246 = load i32, ptr %1245, align 8
  %1247 = sext i32 %1246 to i64
  %1248 = mul i64 8, %1247
  %1249 = trunc i64 %1248 to i32
  %1250 = call ptr @arenaAlloc(ptr noundef %1243, i32 noundef %1249)
  %1251 = load ptr, ptr %51, align 8
  %1252 = getelementptr inbounds %struct.SetValue, ptr %1251, i32 0, i32 1
  store ptr %1250, ptr %1252, align 8
  store i32 0, ptr %52, align 4
  br label %1253

1253:                                             ; preds = %1276, %1232
  %1254 = load i32, ptr %52, align 4
  %1255 = load ptr, ptr %50, align 8
  %1256 = getelementptr inbounds %struct.SetValue, ptr %1255, i32 0, i32 0
  %1257 = load i32, ptr %1256, align 8
  %1258 = icmp slt i32 %1254, %1257
  br i1 %1258, label %1259, label %1279

1259:                                             ; preds = %1253
  %1260 = load ptr, ptr %5, align 8
  %1261 = load ptr, ptr %6, align 8
  %1262 = load ptr, ptr %50, align 8
  %1263 = getelementptr inbounds %struct.SetValue, ptr %1262, i32 0, i32 1
  %1264 = load ptr, ptr %1263, align 8
  %1265 = load i32, ptr %52, align 4
  %1266 = sext i32 %1265 to i64
  %1267 = getelementptr inbounds ptr, ptr %1264, i64 %1266
  %1268 = load ptr, ptr %1267, align 8
  %1269 = call ptr @multCalcLangValues(ptr noundef %1260, ptr noundef %1261, ptr noundef %1268)
  %1270 = load ptr, ptr %51, align 8
  %1271 = getelementptr inbounds %struct.SetValue, ptr %1270, i32 0, i32 1
  %1272 = load ptr, ptr %1271, align 8
  %1273 = load i32, ptr %52, align 4
  %1274 = sext i32 %1273 to i64
  %1275 = getelementptr inbounds ptr, ptr %1272, i64 %1274
  store ptr %1269, ptr %1275, align 8
  br label %1276

1276:                                             ; preds = %1259
  %1277 = load i32, ptr %52, align 4
  %1278 = add nsw i32 %1277, 1
  store i32 %1278, ptr %52, align 4
  br label %1253, !llvm.loop !57

1279:                                             ; preds = %1253
  %1280 = load ptr, ptr %8, align 8
  %1281 = getelementptr inbounds %struct.CalcLangVal, ptr %1280, i32 0, i32 0
  store i32 5, ptr %1281, align 8
  %1282 = load ptr, ptr %51, align 8
  %1283 = load ptr, ptr %8, align 8
  %1284 = getelementptr inbounds %struct.CalcLangVal, ptr %1283, i32 0, i32 1
  store ptr %1282, ptr %1284, align 8
  br label %1542

1285:                                             ; preds = %1227, %1222
  %1286 = load ptr, ptr %6, align 8
  %1287 = getelementptr inbounds %struct.CalcLangVal, ptr %1286, i32 0, i32 0
  %1288 = load i32, ptr %1287, align 8
  %1289 = icmp eq i32 %1288, 5
  br i1 %1289, label %1290, label %1348

1290:                                             ; preds = %1285
  %1291 = load ptr, ptr %7, align 8
  %1292 = getelementptr inbounds %struct.CalcLangVal, ptr %1291, i32 0, i32 0
  %1293 = load i32, ptr %1292, align 8
  %1294 = icmp eq i32 %1293, 2
  br i1 %1294, label %1295, label %1348

1295:                                             ; preds = %1290
  %1296 = load ptr, ptr %6, align 8
  %1297 = getelementptr inbounds %struct.CalcLangVal, ptr %1296, i32 0, i32 1
  %1298 = load ptr, ptr %1297, align 8
  store ptr %1298, ptr %53, align 8
  %1299 = load ptr, ptr %5, align 8
  %1300 = call ptr @arenaAlloc(ptr noundef %1299, i32 noundef 16)
  store ptr %1300, ptr %54, align 8
  %1301 = load ptr, ptr %53, align 8
  %1302 = getelementptr inbounds %struct.SetValue, ptr %1301, i32 0, i32 0
  %1303 = load i32, ptr %1302, align 8
  %1304 = load ptr, ptr %54, align 8
  %1305 = getelementptr inbounds %struct.SetValue, ptr %1304, i32 0, i32 0
  store i32 %1303, ptr %1305, align 8
  %1306 = load ptr, ptr %5, align 8
  %1307 = load ptr, ptr %54, align 8
  %1308 = getelementptr inbounds %struct.SetValue, ptr %1307, i32 0, i32 0
  %1309 = load i32, ptr %1308, align 8
  %1310 = sext i32 %1309 to i64
  %1311 = mul i64 8, %1310
  %1312 = trunc i64 %1311 to i32
  %1313 = call ptr @arenaAlloc(ptr noundef %1306, i32 noundef %1312)
  %1314 = load ptr, ptr %54, align 8
  %1315 = getelementptr inbounds %struct.SetValue, ptr %1314, i32 0, i32 1
  store ptr %1313, ptr %1315, align 8
  store i32 0, ptr %55, align 4
  br label %1316

1316:                                             ; preds = %1339, %1295
  %1317 = load i32, ptr %55, align 4
  %1318 = load ptr, ptr %53, align 8
  %1319 = getelementptr inbounds %struct.SetValue, ptr %1318, i32 0, i32 0
  %1320 = load i32, ptr %1319, align 8
  %1321 = icmp slt i32 %1317, %1320
  br i1 %1321, label %1322, label %1342

1322:                                             ; preds = %1316
  %1323 = load ptr, ptr %5, align 8
  %1324 = load ptr, ptr %53, align 8
  %1325 = getelementptr inbounds %struct.SetValue, ptr %1324, i32 0, i32 1
  %1326 = load ptr, ptr %1325, align 8
  %1327 = load i32, ptr %55, align 4
  %1328 = sext i32 %1327 to i64
  %1329 = getelementptr inbounds ptr, ptr %1326, i64 %1328
  %1330 = load ptr, ptr %1329, align 8
  %1331 = load ptr, ptr %7, align 8
  %1332 = call ptr @multCalcLangValues(ptr noundef %1323, ptr noundef %1330, ptr noundef %1331)
  %1333 = load ptr, ptr %54, align 8
  %1334 = getelementptr inbounds %struct.SetValue, ptr %1333, i32 0, i32 1
  %1335 = load ptr, ptr %1334, align 8
  %1336 = load i32, ptr %55, align 4
  %1337 = sext i32 %1336 to i64
  %1338 = getelementptr inbounds ptr, ptr %1335, i64 %1337
  store ptr %1332, ptr %1338, align 8
  br label %1339

1339:                                             ; preds = %1322
  %1340 = load i32, ptr %55, align 4
  %1341 = add nsw i32 %1340, 1
  store i32 %1341, ptr %55, align 4
  br label %1316, !llvm.loop !58

1342:                                             ; preds = %1316
  %1343 = load ptr, ptr %8, align 8
  %1344 = getelementptr inbounds %struct.CalcLangVal, ptr %1343, i32 0, i32 0
  store i32 5, ptr %1344, align 8
  %1345 = load ptr, ptr %54, align 8
  %1346 = load ptr, ptr %8, align 8
  %1347 = getelementptr inbounds %struct.CalcLangVal, ptr %1346, i32 0, i32 1
  store ptr %1345, ptr %1347, align 8
  br label %1541

1348:                                             ; preds = %1290, %1285
  %1349 = load ptr, ptr %6, align 8
  %1350 = getelementptr inbounds %struct.CalcLangVal, ptr %1349, i32 0, i32 0
  %1351 = load i32, ptr %1350, align 8
  %1352 = icmp eq i32 %1351, 2
  br i1 %1352, label %1353, label %1411

1353:                                             ; preds = %1348
  %1354 = load ptr, ptr %7, align 8
  %1355 = getelementptr inbounds %struct.CalcLangVal, ptr %1354, i32 0, i32 0
  %1356 = load i32, ptr %1355, align 8
  %1357 = icmp eq i32 %1356, 5
  br i1 %1357, label %1358, label %1411

1358:                                             ; preds = %1353
  %1359 = load ptr, ptr %7, align 8
  %1360 = getelementptr inbounds %struct.CalcLangVal, ptr %1359, i32 0, i32 1
  %1361 = load ptr, ptr %1360, align 8
  store ptr %1361, ptr %56, align 8
  %1362 = load ptr, ptr %5, align 8
  %1363 = call ptr @arenaAlloc(ptr noundef %1362, i32 noundef 16)
  store ptr %1363, ptr %57, align 8
  %1364 = load ptr, ptr %56, align 8
  %1365 = getelementptr inbounds %struct.SetValue, ptr %1364, i32 0, i32 0
  %1366 = load i32, ptr %1365, align 8
  %1367 = load ptr, ptr %57, align 8
  %1368 = getelementptr inbounds %struct.SetValue, ptr %1367, i32 0, i32 0
  store i32 %1366, ptr %1368, align 8
  %1369 = load ptr, ptr %5, align 8
  %1370 = load ptr, ptr %57, align 8
  %1371 = getelementptr inbounds %struct.SetValue, ptr %1370, i32 0, i32 0
  %1372 = load i32, ptr %1371, align 8
  %1373 = sext i32 %1372 to i64
  %1374 = mul i64 8, %1373
  %1375 = trunc i64 %1374 to i32
  %1376 = call ptr @arenaAlloc(ptr noundef %1369, i32 noundef %1375)
  %1377 = load ptr, ptr %57, align 8
  %1378 = getelementptr inbounds %struct.SetValue, ptr %1377, i32 0, i32 1
  store ptr %1376, ptr %1378, align 8
  store i32 0, ptr %58, align 4
  br label %1379

1379:                                             ; preds = %1402, %1358
  %1380 = load i32, ptr %58, align 4
  %1381 = load ptr, ptr %56, align 8
  %1382 = getelementptr inbounds %struct.SetValue, ptr %1381, i32 0, i32 0
  %1383 = load i32, ptr %1382, align 8
  %1384 = icmp slt i32 %1380, %1383
  br i1 %1384, label %1385, label %1405

1385:                                             ; preds = %1379
  %1386 = load ptr, ptr %5, align 8
  %1387 = load ptr, ptr %6, align 8
  %1388 = load ptr, ptr %56, align 8
  %1389 = getelementptr inbounds %struct.SetValue, ptr %1388, i32 0, i32 1
  %1390 = load ptr, ptr %1389, align 8
  %1391 = load i32, ptr %58, align 4
  %1392 = sext i32 %1391 to i64
  %1393 = getelementptr inbounds ptr, ptr %1390, i64 %1392
  %1394 = load ptr, ptr %1393, align 8
  %1395 = call ptr @multCalcLangValues(ptr noundef %1386, ptr noundef %1387, ptr noundef %1394)
  %1396 = load ptr, ptr %57, align 8
  %1397 = getelementptr inbounds %struct.SetValue, ptr %1396, i32 0, i32 1
  %1398 = load ptr, ptr %1397, align 8
  %1399 = load i32, ptr %58, align 4
  %1400 = sext i32 %1399 to i64
  %1401 = getelementptr inbounds ptr, ptr %1398, i64 %1400
  store ptr %1395, ptr %1401, align 8
  br label %1402

1402:                                             ; preds = %1385
  %1403 = load i32, ptr %58, align 4
  %1404 = add nsw i32 %1403, 1
  store i32 %1404, ptr %58, align 4
  br label %1379, !llvm.loop !59

1405:                                             ; preds = %1379
  %1406 = load ptr, ptr %8, align 8
  %1407 = getelementptr inbounds %struct.CalcLangVal, ptr %1406, i32 0, i32 0
  store i32 5, ptr %1407, align 8
  %1408 = load ptr, ptr %57, align 8
  %1409 = load ptr, ptr %8, align 8
  %1410 = getelementptr inbounds %struct.CalcLangVal, ptr %1409, i32 0, i32 1
  store ptr %1408, ptr %1410, align 8
  br label %1540

1411:                                             ; preds = %1353, %1348
  %1412 = load ptr, ptr %6, align 8
  %1413 = getelementptr inbounds %struct.CalcLangVal, ptr %1412, i32 0, i32 0
  %1414 = load i32, ptr %1413, align 8
  %1415 = icmp eq i32 %1414, 5
  br i1 %1415, label %1416, label %1474

1416:                                             ; preds = %1411
  %1417 = load ptr, ptr %7, align 8
  %1418 = getelementptr inbounds %struct.CalcLangVal, ptr %1417, i32 0, i32 0
  %1419 = load i32, ptr %1418, align 8
  %1420 = icmp eq i32 %1419, 3
  br i1 %1420, label %1421, label %1474

1421:                                             ; preds = %1416
  %1422 = load ptr, ptr %6, align 8
  %1423 = getelementptr inbounds %struct.CalcLangVal, ptr %1422, i32 0, i32 1
  %1424 = load ptr, ptr %1423, align 8
  store ptr %1424, ptr %59, align 8
  %1425 = load ptr, ptr %5, align 8
  %1426 = call ptr @arenaAlloc(ptr noundef %1425, i32 noundef 16)
  store ptr %1426, ptr %60, align 8
  %1427 = load ptr, ptr %59, align 8
  %1428 = getelementptr inbounds %struct.SetValue, ptr %1427, i32 0, i32 0
  %1429 = load i32, ptr %1428, align 8
  %1430 = load ptr, ptr %60, align 8
  %1431 = getelementptr inbounds %struct.SetValue, ptr %1430, i32 0, i32 0
  store i32 %1429, ptr %1431, align 8
  %1432 = load ptr, ptr %5, align 8
  %1433 = load ptr, ptr %60, align 8
  %1434 = getelementptr inbounds %struct.SetValue, ptr %1433, i32 0, i32 0
  %1435 = load i32, ptr %1434, align 8
  %1436 = sext i32 %1435 to i64
  %1437 = mul i64 8, %1436
  %1438 = trunc i64 %1437 to i32
  %1439 = call ptr @arenaAlloc(ptr noundef %1432, i32 noundef %1438)
  %1440 = load ptr, ptr %60, align 8
  %1441 = getelementptr inbounds %struct.SetValue, ptr %1440, i32 0, i32 1
  store ptr %1439, ptr %1441, align 8
  store i32 0, ptr %61, align 4
  br label %1442

1442:                                             ; preds = %1465, %1421
  %1443 = load i32, ptr %61, align 4
  %1444 = load ptr, ptr %59, align 8
  %1445 = getelementptr inbounds %struct.SetValue, ptr %1444, i32 0, i32 0
  %1446 = load i32, ptr %1445, align 8
  %1447 = icmp slt i32 %1443, %1446
  br i1 %1447, label %1448, label %1468

1448:                                             ; preds = %1442
  %1449 = load ptr, ptr %5, align 8
  %1450 = load ptr, ptr %59, align 8
  %1451 = getelementptr inbounds %struct.SetValue, ptr %1450, i32 0, i32 1
  %1452 = load ptr, ptr %1451, align 8
  %1453 = load i32, ptr %61, align 4
  %1454 = sext i32 %1453 to i64
  %1455 = getelementptr inbounds ptr, ptr %1452, i64 %1454
  %1456 = load ptr, ptr %1455, align 8
  %1457 = load ptr, ptr %7, align 8
  %1458 = call ptr @multCalcLangValues(ptr noundef %1449, ptr noundef %1456, ptr noundef %1457)
  %1459 = load ptr, ptr %60, align 8
  %1460 = getelementptr inbounds %struct.SetValue, ptr %1459, i32 0, i32 1
  %1461 = load ptr, ptr %1460, align 8
  %1462 = load i32, ptr %61, align 4
  %1463 = sext i32 %1462 to i64
  %1464 = getelementptr inbounds ptr, ptr %1461, i64 %1463
  store ptr %1458, ptr %1464, align 8
  br label %1465

1465:                                             ; preds = %1448
  %1466 = load i32, ptr %61, align 4
  %1467 = add nsw i32 %1466, 1
  store i32 %1467, ptr %61, align 4
  br label %1442, !llvm.loop !60

1468:                                             ; preds = %1442
  %1469 = load ptr, ptr %8, align 8
  %1470 = getelementptr inbounds %struct.CalcLangVal, ptr %1469, i32 0, i32 0
  store i32 5, ptr %1470, align 8
  %1471 = load ptr, ptr %60, align 8
  %1472 = load ptr, ptr %8, align 8
  %1473 = getelementptr inbounds %struct.CalcLangVal, ptr %1472, i32 0, i32 1
  store ptr %1471, ptr %1473, align 8
  br label %1539

1474:                                             ; preds = %1416, %1411
  %1475 = load ptr, ptr %6, align 8
  %1476 = getelementptr inbounds %struct.CalcLangVal, ptr %1475, i32 0, i32 0
  %1477 = load i32, ptr %1476, align 8
  %1478 = icmp eq i32 %1477, 3
  br i1 %1478, label %1479, label %1537

1479:                                             ; preds = %1474
  %1480 = load ptr, ptr %7, align 8
  %1481 = getelementptr inbounds %struct.CalcLangVal, ptr %1480, i32 0, i32 0
  %1482 = load i32, ptr %1481, align 8
  %1483 = icmp eq i32 %1482, 5
  br i1 %1483, label %1484, label %1537

1484:                                             ; preds = %1479
  %1485 = load ptr, ptr %7, align 8
  %1486 = getelementptr inbounds %struct.CalcLangVal, ptr %1485, i32 0, i32 1
  %1487 = load ptr, ptr %1486, align 8
  store ptr %1487, ptr %62, align 8
  %1488 = load ptr, ptr %5, align 8
  %1489 = call ptr @arenaAlloc(ptr noundef %1488, i32 noundef 16)
  store ptr %1489, ptr %63, align 8
  %1490 = load ptr, ptr %62, align 8
  %1491 = getelementptr inbounds %struct.SetValue, ptr %1490, i32 0, i32 0
  %1492 = load i32, ptr %1491, align 8
  %1493 = load ptr, ptr %63, align 8
  %1494 = getelementptr inbounds %struct.SetValue, ptr %1493, i32 0, i32 0
  store i32 %1492, ptr %1494, align 8
  %1495 = load ptr, ptr %5, align 8
  %1496 = load ptr, ptr %63, align 8
  %1497 = getelementptr inbounds %struct.SetValue, ptr %1496, i32 0, i32 0
  %1498 = load i32, ptr %1497, align 8
  %1499 = sext i32 %1498 to i64
  %1500 = mul i64 8, %1499
  %1501 = trunc i64 %1500 to i32
  %1502 = call ptr @arenaAlloc(ptr noundef %1495, i32 noundef %1501)
  %1503 = load ptr, ptr %63, align 8
  %1504 = getelementptr inbounds %struct.SetValue, ptr %1503, i32 0, i32 1
  store ptr %1502, ptr %1504, align 8
  store i32 0, ptr %64, align 4
  br label %1505

1505:                                             ; preds = %1528, %1484
  %1506 = load i32, ptr %64, align 4
  %1507 = load ptr, ptr %62, align 8
  %1508 = getelementptr inbounds %struct.SetValue, ptr %1507, i32 0, i32 0
  %1509 = load i32, ptr %1508, align 8
  %1510 = icmp slt i32 %1506, %1509
  br i1 %1510, label %1511, label %1531

1511:                                             ; preds = %1505
  %1512 = load ptr, ptr %5, align 8
  %1513 = load ptr, ptr %6, align 8
  %1514 = load ptr, ptr %62, align 8
  %1515 = getelementptr inbounds %struct.SetValue, ptr %1514, i32 0, i32 1
  %1516 = load ptr, ptr %1515, align 8
  %1517 = load i32, ptr %64, align 4
  %1518 = sext i32 %1517 to i64
  %1519 = getelementptr inbounds ptr, ptr %1516, i64 %1518
  %1520 = load ptr, ptr %1519, align 8
  %1521 = call ptr @multCalcLangValues(ptr noundef %1512, ptr noundef %1513, ptr noundef %1520)
  %1522 = load ptr, ptr %63, align 8
  %1523 = getelementptr inbounds %struct.SetValue, ptr %1522, i32 0, i32 1
  %1524 = load ptr, ptr %1523, align 8
  %1525 = load i32, ptr %64, align 4
  %1526 = sext i32 %1525 to i64
  %1527 = getelementptr inbounds ptr, ptr %1524, i64 %1526
  store ptr %1521, ptr %1527, align 8
  br label %1528

1528:                                             ; preds = %1511
  %1529 = load i32, ptr %64, align 4
  %1530 = add nsw i32 %1529, 1
  store i32 %1530, ptr %64, align 4
  br label %1505, !llvm.loop !61

1531:                                             ; preds = %1505
  %1532 = load ptr, ptr %8, align 8
  %1533 = getelementptr inbounds %struct.CalcLangVal, ptr %1532, i32 0, i32 0
  store i32 5, ptr %1533, align 8
  %1534 = load ptr, ptr %63, align 8
  %1535 = load ptr, ptr %8, align 8
  %1536 = getelementptr inbounds %struct.CalcLangVal, ptr %1535, i32 0, i32 1
  store ptr %1534, ptr %1536, align 8
  br label %1538

1537:                                             ; preds = %1479, %1474
  call void @perror(ptr noundef @.str.2) #6
  br label %1538

1538:                                             ; preds = %1537, %1531
  br label %1539

1539:                                             ; preds = %1538, %1468
  br label %1540

1540:                                             ; preds = %1539, %1405
  br label %1541

1541:                                             ; preds = %1540, %1342
  br label %1542

1542:                                             ; preds = %1541, %1279
  br label %1543

1543:                                             ; preds = %1542, %1216
  br label %1544

1544:                                             ; preds = %1543, %1153
  br label %1545

1545:                                             ; preds = %1544, %1090
  br label %1546

1546:                                             ; preds = %1545, %1032
  br label %1547

1547:                                             ; preds = %1546, %945
  br label %1548

1548:                                             ; preds = %1547, %882
  br label %1549

1549:                                             ; preds = %1548, %819
  br label %1550

1550:                                             ; preds = %1549, %756
  br label %1551

1551:                                             ; preds = %1550, %693
  br label %1552

1552:                                             ; preds = %1551, %630
  br label %1553

1553:                                             ; preds = %1552, %567
  br label %1554

1554:                                             ; preds = %1553, %504
  br label %1555

1555:                                             ; preds = %1554, %446
  br label %1556

1556:                                             ; preds = %1555, %353
  br label %1557

1557:                                             ; preds = %1556, %331
  br label %1558

1558:                                             ; preds = %1557, %309
  br label %1559

1559:                                             ; preds = %1558, %286
  br label %1560

1560:                                             ; preds = %1559, %263
  br label %1561

1561:                                             ; preds = %1560, %241
  br label %1562

1562:                                             ; preds = %1561, %219
  br label %1563

1563:                                             ; preds = %1562, %196
  br label %1564

1564:                                             ; preds = %1563, %173
  br label %1565

1565:                                             ; preds = %1564, %150
  br label %1566

1566:                                             ; preds = %1565, %127
  br label %1567

1567:                                             ; preds = %1566, %105
  br label %1568

1568:                                             ; preds = %1567, %83
  %1569 = load ptr, ptr %8, align 8
  store ptr %1569, ptr %4, align 8
  br label %1570

1570:                                             ; preds = %1568, %1031, %445, %70
  %1571 = load ptr, ptr %4, align 8
  ret ptr %1571
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @divCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i32, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i32, align 4
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i32, align 4
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %70, label %67

67:                                               ; preds = %3
  %68 = load ptr, ptr %7, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %67, %3
  store ptr null, ptr %4, align 8
  br label %1548

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = call ptr @arenaAlloc(ptr noundef %72, i32 noundef 16)
  store ptr %73, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %97

78:                                               ; preds = %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %97

83:                                               ; preds = %78
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 0
  store i32 1, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = sitofp i32 %88 to double
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = sitofp i32 %92 to double
  %94 = fdiv double %89, %93
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 1
  store double %94, ptr %96, align 8
  br label %1546

97:                                               ; preds = %78, %71
  %98 = load ptr, ptr %6, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %119

102:                                              ; preds = %97
  %103 = load ptr, ptr %7, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 0
  %105 = load i32, ptr %104, align 8
  %106 = icmp eq i32 %105, 1
  br i1 %106, label %107, label %119

107:                                              ; preds = %102
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 0
  store i32 1, ptr %109, align 8
  %110 = load ptr, ptr %6, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = load double, ptr %111, align 8
  %113 = load ptr, ptr %7, align 8
  %114 = getelementptr inbounds %struct.CalcLangVal, ptr %113, i32 0, i32 1
  %115 = load double, ptr %114, align 8
  %116 = fdiv double %112, %115
  %117 = load ptr, ptr %8, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 1
  store double %116, ptr %118, align 8
  br label %1545

119:                                              ; preds = %102, %97
  %120 = load ptr, ptr %6, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %142

124:                                              ; preds = %119
  %125 = load ptr, ptr %7, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  %127 = load i32, ptr %126, align 8
  %128 = icmp eq i32 %127, 1
  br i1 %128, label %129, label %142

129:                                              ; preds = %124
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 0
  store i32 1, ptr %131, align 8
  %132 = load ptr, ptr %6, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  %134 = load i32, ptr %133, align 8
  %135 = sitofp i32 %134 to double
  %136 = load ptr, ptr %7, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 1
  %138 = load double, ptr %137, align 8
  %139 = fdiv double %135, %138
  %140 = load ptr, ptr %8, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 1
  store double %139, ptr %141, align 8
  br label %1544

142:                                              ; preds = %124, %119
  %143 = load ptr, ptr %6, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 1
  br i1 %146, label %147, label %165

147:                                              ; preds = %142
  %148 = load ptr, ptr %7, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %149, align 8
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %165

152:                                              ; preds = %147
  %153 = load ptr, ptr %8, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 0
  store i32 1, ptr %154, align 8
  %155 = load ptr, ptr %6, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  %157 = load double, ptr %156, align 8
  %158 = load ptr, ptr %7, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 1
  %160 = load i32, ptr %159, align 8
  %161 = sitofp i32 %160 to double
  %162 = fdiv double %157, %161
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 1
  store double %162, ptr %164, align 8
  br label %1543

165:                                              ; preds = %147, %142
  %166 = load ptr, ptr %6, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = icmp eq i32 %168, 2
  br i1 %169, label %170, label %188

170:                                              ; preds = %165
  %171 = load ptr, ptr %7, align 8
  %172 = getelementptr inbounds %struct.CalcLangVal, ptr %171, i32 0, i32 0
  %173 = load i32, ptr %172, align 8
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %188

175:                                              ; preds = %170
  %176 = load ptr, ptr %8, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 0
  store i32 2, ptr %177, align 8
  %178 = load ptr, ptr %6, align 8
  %179 = getelementptr inbounds %struct.CalcLangVal, ptr %178, i32 0, i32 1
  %180 = load double, ptr %179, align 8
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr inbounds %struct.CalcLangVal, ptr %181, i32 0, i32 1
  %183 = load i32, ptr %182, align 8
  %184 = sitofp i32 %183 to double
  %185 = fdiv double %180, %184
  %186 = load ptr, ptr %8, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 1
  store double %185, ptr %187, align 8
  br label %1542

188:                                              ; preds = %170, %165
  %189 = load ptr, ptr %6, align 8
  %190 = getelementptr inbounds %struct.CalcLangVal, ptr %189, i32 0, i32 0
  %191 = load i32, ptr %190, align 8
  %192 = icmp eq i32 %191, 2
  br i1 %192, label %193, label %210

193:                                              ; preds = %188
  %194 = load ptr, ptr %7, align 8
  %195 = getelementptr inbounds %struct.CalcLangVal, ptr %194, i32 0, i32 0
  %196 = load i32, ptr %195, align 8
  %197 = icmp eq i32 %196, 2
  br i1 %197, label %198, label %210

198:                                              ; preds = %193
  %199 = load ptr, ptr %8, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 0
  store i32 1, ptr %200, align 8
  %201 = load ptr, ptr %6, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 1
  %203 = load double, ptr %202, align 8
  %204 = load ptr, ptr %7, align 8
  %205 = getelementptr inbounds %struct.CalcLangVal, ptr %204, i32 0, i32 1
  %206 = load double, ptr %205, align 8
  %207 = fdiv double %203, %206
  %208 = load ptr, ptr %8, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 1
  store double %207, ptr %209, align 8
  br label %1541

210:                                              ; preds = %193, %188
  %211 = load ptr, ptr %6, align 8
  %212 = getelementptr inbounds %struct.CalcLangVal, ptr %211, i32 0, i32 0
  %213 = load i32, ptr %212, align 8
  %214 = icmp eq i32 %213, 2
  br i1 %214, label %215, label %232

215:                                              ; preds = %210
  %216 = load ptr, ptr %7, align 8
  %217 = getelementptr inbounds %struct.CalcLangVal, ptr %216, i32 0, i32 0
  %218 = load i32, ptr %217, align 8
  %219 = icmp eq i32 %218, 1
  br i1 %219, label %220, label %232

220:                                              ; preds = %215
  %221 = load ptr, ptr %8, align 8
  %222 = getelementptr inbounds %struct.CalcLangVal, ptr %221, i32 0, i32 0
  store i32 2, ptr %222, align 8
  %223 = load ptr, ptr %6, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 1
  %225 = load double, ptr %224, align 8
  %226 = load ptr, ptr %7, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 1
  %228 = load double, ptr %227, align 8
  %229 = fdiv double %225, %228
  %230 = load ptr, ptr %8, align 8
  %231 = getelementptr inbounds %struct.CalcLangVal, ptr %230, i32 0, i32 1
  store double %229, ptr %231, align 8
  br label %1540

232:                                              ; preds = %215, %210
  %233 = load ptr, ptr %6, align 8
  %234 = getelementptr inbounds %struct.CalcLangVal, ptr %233, i32 0, i32 0
  %235 = load i32, ptr %234, align 8
  %236 = icmp eq i32 %235, 3
  br i1 %236, label %237, label %255

237:                                              ; preds = %232
  %238 = load ptr, ptr %7, align 8
  %239 = getelementptr inbounds %struct.CalcLangVal, ptr %238, i32 0, i32 0
  %240 = load i32, ptr %239, align 8
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %255

242:                                              ; preds = %237
  %243 = load ptr, ptr %8, align 8
  %244 = getelementptr inbounds %struct.CalcLangVal, ptr %243, i32 0, i32 0
  store i32 3, ptr %244, align 8
  %245 = load ptr, ptr %6, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 1
  %247 = load double, ptr %246, align 8
  %248 = load ptr, ptr %7, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 1
  %250 = load i32, ptr %249, align 8
  %251 = sitofp i32 %250 to double
  %252 = fdiv double %247, %251
  %253 = load ptr, ptr %8, align 8
  %254 = getelementptr inbounds %struct.CalcLangVal, ptr %253, i32 0, i32 1
  store double %252, ptr %254, align 8
  br label %1539

255:                                              ; preds = %237, %232
  %256 = load ptr, ptr %6, align 8
  %257 = getelementptr inbounds %struct.CalcLangVal, ptr %256, i32 0, i32 0
  %258 = load i32, ptr %257, align 8
  %259 = icmp eq i32 %258, 0
  br i1 %259, label %260, label %278

260:                                              ; preds = %255
  %261 = load ptr, ptr %7, align 8
  %262 = getelementptr inbounds %struct.CalcLangVal, ptr %261, i32 0, i32 0
  %263 = load i32, ptr %262, align 8
  %264 = icmp eq i32 %263, 3
  br i1 %264, label %265, label %278

265:                                              ; preds = %260
  %266 = load ptr, ptr %8, align 8
  %267 = getelementptr inbounds %struct.CalcLangVal, ptr %266, i32 0, i32 0
  store i32 3, ptr %267, align 8
  %268 = load ptr, ptr %6, align 8
  %269 = getelementptr inbounds %struct.CalcLangVal, ptr %268, i32 0, i32 1
  %270 = load i32, ptr %269, align 8
  %271 = sitofp i32 %270 to double
  %272 = load ptr, ptr %7, align 8
  %273 = getelementptr inbounds %struct.CalcLangVal, ptr %272, i32 0, i32 1
  %274 = load double, ptr %273, align 8
  %275 = fdiv double %271, %274
  %276 = load ptr, ptr %8, align 8
  %277 = getelementptr inbounds %struct.CalcLangVal, ptr %276, i32 0, i32 1
  store double %275, ptr %277, align 8
  br label %1538

278:                                              ; preds = %260, %255
  %279 = load ptr, ptr %6, align 8
  %280 = getelementptr inbounds %struct.CalcLangVal, ptr %279, i32 0, i32 0
  %281 = load i32, ptr %280, align 8
  %282 = icmp eq i32 %281, 1
  br i1 %282, label %283, label %300

283:                                              ; preds = %278
  %284 = load ptr, ptr %7, align 8
  %285 = getelementptr inbounds %struct.CalcLangVal, ptr %284, i32 0, i32 0
  %286 = load i32, ptr %285, align 8
  %287 = icmp eq i32 %286, 3
  br i1 %287, label %288, label %300

288:                                              ; preds = %283
  %289 = load ptr, ptr %8, align 8
  %290 = getelementptr inbounds %struct.CalcLangVal, ptr %289, i32 0, i32 0
  store i32 3, ptr %290, align 8
  %291 = load ptr, ptr %6, align 8
  %292 = getelementptr inbounds %struct.CalcLangVal, ptr %291, i32 0, i32 1
  %293 = load double, ptr %292, align 8
  %294 = load ptr, ptr %7, align 8
  %295 = getelementptr inbounds %struct.CalcLangVal, ptr %294, i32 0, i32 1
  %296 = load double, ptr %295, align 8
  %297 = fdiv double %293, %296
  %298 = load ptr, ptr %8, align 8
  %299 = getelementptr inbounds %struct.CalcLangVal, ptr %298, i32 0, i32 1
  store double %297, ptr %299, align 8
  br label %1537

300:                                              ; preds = %283, %278
  %301 = load ptr, ptr %6, align 8
  %302 = getelementptr inbounds %struct.CalcLangVal, ptr %301, i32 0, i32 0
  %303 = load i32, ptr %302, align 8
  %304 = icmp eq i32 %303, 3
  br i1 %304, label %305, label %322

305:                                              ; preds = %300
  %306 = load ptr, ptr %7, align 8
  %307 = getelementptr inbounds %struct.CalcLangVal, ptr %306, i32 0, i32 0
  %308 = load i32, ptr %307, align 8
  %309 = icmp eq i32 %308, 1
  br i1 %309, label %310, label %322

310:                                              ; preds = %305
  %311 = load ptr, ptr %8, align 8
  %312 = getelementptr inbounds %struct.CalcLangVal, ptr %311, i32 0, i32 0
  store i32 3, ptr %312, align 8
  %313 = load ptr, ptr %6, align 8
  %314 = getelementptr inbounds %struct.CalcLangVal, ptr %313, i32 0, i32 1
  %315 = load double, ptr %314, align 8
  %316 = load ptr, ptr %7, align 8
  %317 = getelementptr inbounds %struct.CalcLangVal, ptr %316, i32 0, i32 1
  %318 = load double, ptr %317, align 8
  %319 = fdiv double %315, %318
  %320 = load ptr, ptr %8, align 8
  %321 = getelementptr inbounds %struct.CalcLangVal, ptr %320, i32 0, i32 1
  store double %319, ptr %321, align 8
  br label %1536

322:                                              ; preds = %305, %300
  %323 = load ptr, ptr %6, align 8
  %324 = getelementptr inbounds %struct.CalcLangVal, ptr %323, i32 0, i32 0
  %325 = load i32, ptr %324, align 8
  %326 = icmp eq i32 %325, 3
  br i1 %326, label %327, label %344

327:                                              ; preds = %322
  %328 = load ptr, ptr %7, align 8
  %329 = getelementptr inbounds %struct.CalcLangVal, ptr %328, i32 0, i32 0
  %330 = load i32, ptr %329, align 8
  %331 = icmp eq i32 %330, 3
  br i1 %331, label %332, label %344

332:                                              ; preds = %327
  %333 = load ptr, ptr %8, align 8
  %334 = getelementptr inbounds %struct.CalcLangVal, ptr %333, i32 0, i32 0
  store i32 3, ptr %334, align 8
  %335 = load ptr, ptr %6, align 8
  %336 = getelementptr inbounds %struct.CalcLangVal, ptr %335, i32 0, i32 1
  %337 = load double, ptr %336, align 8
  %338 = load ptr, ptr %7, align 8
  %339 = getelementptr inbounds %struct.CalcLangVal, ptr %338, i32 0, i32 1
  %340 = load double, ptr %339, align 8
  %341 = fdiv double %337, %340
  %342 = load ptr, ptr %8, align 8
  %343 = getelementptr inbounds %struct.CalcLangVal, ptr %342, i32 0, i32 1
  store double %341, ptr %343, align 8
  br label %1535

344:                                              ; preds = %327, %322
  %345 = load ptr, ptr %6, align 8
  %346 = getelementptr inbounds %struct.CalcLangVal, ptr %345, i32 0, i32 0
  %347 = load i32, ptr %346, align 8
  %348 = icmp eq i32 %347, 6
  br i1 %348, label %349, label %426

349:                                              ; preds = %344
  %350 = load ptr, ptr %7, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 0
  %352 = load i32, ptr %351, align 8
  %353 = icmp eq i32 %352, 6
  br i1 %353, label %354, label %426

354:                                              ; preds = %349
  %355 = load ptr, ptr %6, align 8
  %356 = getelementptr inbounds %struct.CalcLangVal, ptr %355, i32 0, i32 1
  %357 = load ptr, ptr %356, align 8
  store ptr %357, ptr %9, align 8
  %358 = load ptr, ptr %7, align 8
  %359 = getelementptr inbounds %struct.CalcLangVal, ptr %358, i32 0, i32 1
  %360 = load ptr, ptr %359, align 8
  store ptr %360, ptr %10, align 8
  %361 = load ptr, ptr %10, align 8
  %362 = getelementptr inbounds %struct.TupleValue, ptr %361, i32 0, i32 0
  %363 = load i32, ptr %362, align 8
  %364 = load ptr, ptr %9, align 8
  %365 = getelementptr inbounds %struct.TupleValue, ptr %364, i32 0, i32 0
  %366 = load i32, ptr %365, align 8
  %367 = icmp eq i32 %363, %366
  br i1 %367, label %368, label %424

368:                                              ; preds = %354
  %369 = load ptr, ptr %5, align 8
  %370 = call ptr @arenaAlloc(ptr noundef %369, i32 noundef 16)
  store ptr %370, ptr %11, align 8
  %371 = load ptr, ptr %9, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 0
  %373 = load i32, ptr %372, align 8
  %374 = load ptr, ptr %11, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 0
  store i32 %373, ptr %375, align 8
  %376 = load ptr, ptr %5, align 8
  %377 = load ptr, ptr %11, align 8
  %378 = getelementptr inbounds %struct.TupleValue, ptr %377, i32 0, i32 0
  %379 = load i32, ptr %378, align 8
  %380 = sext i32 %379 to i64
  %381 = mul i64 8, %380
  %382 = trunc i64 %381 to i32
  %383 = call ptr @arenaAlloc(ptr noundef %376, i32 noundef %382)
  %384 = load ptr, ptr %11, align 8
  %385 = getelementptr inbounds %struct.TupleValue, ptr %384, i32 0, i32 1
  store ptr %383, ptr %385, align 8
  store i32 0, ptr %12, align 4
  br label %386

386:                                              ; preds = %415, %368
  %387 = load i32, ptr %12, align 4
  %388 = load ptr, ptr %9, align 8
  %389 = getelementptr inbounds %struct.TupleValue, ptr %388, i32 0, i32 0
  %390 = load i32, ptr %389, align 8
  %391 = icmp slt i32 %387, %390
  br i1 %391, label %392, label %418

392:                                              ; preds = %386
  %393 = load ptr, ptr %5, align 8
  %394 = load ptr, ptr %9, align 8
  %395 = getelementptr inbounds %struct.TupleValue, ptr %394, i32 0, i32 1
  %396 = load ptr, ptr %395, align 8
  %397 = load i32, ptr %12, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds ptr, ptr %396, i64 %398
  %400 = load ptr, ptr %399, align 8
  %401 = load ptr, ptr %10, align 8
  %402 = getelementptr inbounds %struct.TupleValue, ptr %401, i32 0, i32 1
  %403 = load ptr, ptr %402, align 8
  %404 = load i32, ptr %12, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds ptr, ptr %403, i64 %405
  %407 = load ptr, ptr %406, align 8
  %408 = call ptr @divCalcLangValues(ptr noundef %393, ptr noundef %400, ptr noundef %407)
  %409 = load ptr, ptr %11, align 8
  %410 = getelementptr inbounds %struct.TupleValue, ptr %409, i32 0, i32 1
  %411 = load ptr, ptr %410, align 8
  %412 = load i32, ptr %12, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds ptr, ptr %411, i64 %413
  store ptr %408, ptr %414, align 8
  br label %415

415:                                              ; preds = %392
  %416 = load i32, ptr %12, align 4
  %417 = add nsw i32 %416, 1
  store i32 %417, ptr %12, align 4
  br label %386, !llvm.loop !62

418:                                              ; preds = %386
  %419 = load ptr, ptr %8, align 8
  %420 = getelementptr inbounds %struct.CalcLangVal, ptr %419, i32 0, i32 0
  store i32 6, ptr %420, align 8
  %421 = load ptr, ptr %11, align 8
  %422 = load ptr, ptr %8, align 8
  %423 = getelementptr inbounds %struct.CalcLangVal, ptr %422, i32 0, i32 1
  store ptr %421, ptr %423, align 8
  br label %425

424:                                              ; preds = %354
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1548

425:                                              ; preds = %418
  br label %1534

426:                                              ; preds = %349, %344
  %427 = load ptr, ptr %6, align 8
  %428 = getelementptr inbounds %struct.CalcLangVal, ptr %427, i32 0, i32 0
  %429 = load i32, ptr %428, align 8
  %430 = icmp eq i32 %429, 6
  br i1 %430, label %431, label %489

431:                                              ; preds = %426
  %432 = load ptr, ptr %7, align 8
  %433 = getelementptr inbounds %struct.CalcLangVal, ptr %432, i32 0, i32 0
  %434 = load i32, ptr %433, align 8
  %435 = icmp eq i32 %434, 0
  br i1 %435, label %436, label %489

436:                                              ; preds = %431
  %437 = load ptr, ptr %6, align 8
  %438 = getelementptr inbounds %struct.CalcLangVal, ptr %437, i32 0, i32 1
  %439 = load ptr, ptr %438, align 8
  store ptr %439, ptr %13, align 8
  %440 = load ptr, ptr %5, align 8
  %441 = call ptr @arenaAlloc(ptr noundef %440, i32 noundef 16)
  store ptr %441, ptr %14, align 8
  %442 = load ptr, ptr %13, align 8
  %443 = getelementptr inbounds %struct.TupleValue, ptr %442, i32 0, i32 0
  %444 = load i32, ptr %443, align 8
  %445 = load ptr, ptr %14, align 8
  %446 = getelementptr inbounds %struct.TupleValue, ptr %445, i32 0, i32 0
  store i32 %444, ptr %446, align 8
  %447 = load ptr, ptr %5, align 8
  %448 = load ptr, ptr %14, align 8
  %449 = getelementptr inbounds %struct.TupleValue, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = sext i32 %450 to i64
  %452 = mul i64 8, %451
  %453 = trunc i64 %452 to i32
  %454 = call ptr @arenaAlloc(ptr noundef %447, i32 noundef %453)
  %455 = load ptr, ptr %14, align 8
  %456 = getelementptr inbounds %struct.TupleValue, ptr %455, i32 0, i32 1
  store ptr %454, ptr %456, align 8
  store i32 0, ptr %15, align 4
  br label %457

457:                                              ; preds = %480, %436
  %458 = load i32, ptr %15, align 4
  %459 = load ptr, ptr %13, align 8
  %460 = getelementptr inbounds %struct.TupleValue, ptr %459, i32 0, i32 0
  %461 = load i32, ptr %460, align 8
  %462 = icmp slt i32 %458, %461
  br i1 %462, label %463, label %483

463:                                              ; preds = %457
  %464 = load ptr, ptr %5, align 8
  %465 = load ptr, ptr %13, align 8
  %466 = getelementptr inbounds %struct.TupleValue, ptr %465, i32 0, i32 1
  %467 = load ptr, ptr %466, align 8
  %468 = load i32, ptr %15, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds ptr, ptr %467, i64 %469
  %471 = load ptr, ptr %470, align 8
  %472 = load ptr, ptr %7, align 8
  %473 = call ptr @divCalcLangValues(ptr noundef %464, ptr noundef %471, ptr noundef %472)
  %474 = load ptr, ptr %14, align 8
  %475 = getelementptr inbounds %struct.TupleValue, ptr %474, i32 0, i32 1
  %476 = load ptr, ptr %475, align 8
  %477 = load i32, ptr %15, align 4
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds ptr, ptr %476, i64 %478
  store ptr %473, ptr %479, align 8
  br label %480

480:                                              ; preds = %463
  %481 = load i32, ptr %15, align 4
  %482 = add nsw i32 %481, 1
  store i32 %482, ptr %15, align 4
  br label %457, !llvm.loop !63

483:                                              ; preds = %457
  %484 = load ptr, ptr %8, align 8
  %485 = getelementptr inbounds %struct.CalcLangVal, ptr %484, i32 0, i32 0
  store i32 6, ptr %485, align 8
  %486 = load ptr, ptr %14, align 8
  %487 = load ptr, ptr %8, align 8
  %488 = getelementptr inbounds %struct.CalcLangVal, ptr %487, i32 0, i32 1
  store ptr %486, ptr %488, align 8
  br label %1533

489:                                              ; preds = %431, %426
  %490 = load ptr, ptr %6, align 8
  %491 = getelementptr inbounds %struct.CalcLangVal, ptr %490, i32 0, i32 0
  %492 = load i32, ptr %491, align 8
  %493 = icmp eq i32 %492, 0
  br i1 %493, label %494, label %552

494:                                              ; preds = %489
  %495 = load ptr, ptr %7, align 8
  %496 = getelementptr inbounds %struct.CalcLangVal, ptr %495, i32 0, i32 0
  %497 = load i32, ptr %496, align 8
  %498 = icmp eq i32 %497, 6
  br i1 %498, label %499, label %552

499:                                              ; preds = %494
  %500 = load ptr, ptr %7, align 8
  %501 = getelementptr inbounds %struct.CalcLangVal, ptr %500, i32 0, i32 1
  %502 = load ptr, ptr %501, align 8
  store ptr %502, ptr %16, align 8
  %503 = load ptr, ptr %5, align 8
  %504 = call ptr @arenaAlloc(ptr noundef %503, i32 noundef 16)
  store ptr %504, ptr %17, align 8
  %505 = load ptr, ptr %16, align 8
  %506 = getelementptr inbounds %struct.TupleValue, ptr %505, i32 0, i32 0
  %507 = load i32, ptr %506, align 8
  %508 = load ptr, ptr %17, align 8
  %509 = getelementptr inbounds %struct.TupleValue, ptr %508, i32 0, i32 0
  store i32 %507, ptr %509, align 8
  %510 = load ptr, ptr %5, align 8
  %511 = load ptr, ptr %17, align 8
  %512 = getelementptr inbounds %struct.TupleValue, ptr %511, i32 0, i32 0
  %513 = load i32, ptr %512, align 8
  %514 = sext i32 %513 to i64
  %515 = mul i64 8, %514
  %516 = trunc i64 %515 to i32
  %517 = call ptr @arenaAlloc(ptr noundef %510, i32 noundef %516)
  %518 = load ptr, ptr %17, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 1
  store ptr %517, ptr %519, align 8
  store i32 0, ptr %18, align 4
  br label %520

520:                                              ; preds = %543, %499
  %521 = load i32, ptr %18, align 4
  %522 = load ptr, ptr %16, align 8
  %523 = getelementptr inbounds %struct.TupleValue, ptr %522, i32 0, i32 0
  %524 = load i32, ptr %523, align 8
  %525 = icmp slt i32 %521, %524
  br i1 %525, label %526, label %546

526:                                              ; preds = %520
  %527 = load ptr, ptr %5, align 8
  %528 = load ptr, ptr %6, align 8
  %529 = load ptr, ptr %16, align 8
  %530 = getelementptr inbounds %struct.TupleValue, ptr %529, i32 0, i32 1
  %531 = load ptr, ptr %530, align 8
  %532 = load i32, ptr %18, align 4
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds ptr, ptr %531, i64 %533
  %535 = load ptr, ptr %534, align 8
  %536 = call ptr @divCalcLangValues(ptr noundef %527, ptr noundef %528, ptr noundef %535)
  %537 = load ptr, ptr %17, align 8
  %538 = getelementptr inbounds %struct.TupleValue, ptr %537, i32 0, i32 1
  %539 = load ptr, ptr %538, align 8
  %540 = load i32, ptr %18, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds ptr, ptr %539, i64 %541
  store ptr %536, ptr %542, align 8
  br label %543

543:                                              ; preds = %526
  %544 = load i32, ptr %18, align 4
  %545 = add nsw i32 %544, 1
  store i32 %545, ptr %18, align 4
  br label %520, !llvm.loop !64

546:                                              ; preds = %520
  %547 = load ptr, ptr %8, align 8
  %548 = getelementptr inbounds %struct.CalcLangVal, ptr %547, i32 0, i32 0
  store i32 6, ptr %548, align 8
  %549 = load ptr, ptr %17, align 8
  %550 = load ptr, ptr %8, align 8
  %551 = getelementptr inbounds %struct.CalcLangVal, ptr %550, i32 0, i32 1
  store ptr %549, ptr %551, align 8
  br label %1532

552:                                              ; preds = %494, %489
  %553 = load ptr, ptr %6, align 8
  %554 = getelementptr inbounds %struct.CalcLangVal, ptr %553, i32 0, i32 0
  %555 = load i32, ptr %554, align 8
  %556 = icmp eq i32 %555, 6
  br i1 %556, label %557, label %615

557:                                              ; preds = %552
  %558 = load ptr, ptr %7, align 8
  %559 = getelementptr inbounds %struct.CalcLangVal, ptr %558, i32 0, i32 0
  %560 = load i32, ptr %559, align 8
  %561 = icmp eq i32 %560, 1
  br i1 %561, label %562, label %615

562:                                              ; preds = %557
  %563 = load ptr, ptr %6, align 8
  %564 = getelementptr inbounds %struct.CalcLangVal, ptr %563, i32 0, i32 1
  %565 = load ptr, ptr %564, align 8
  store ptr %565, ptr %19, align 8
  %566 = load ptr, ptr %5, align 8
  %567 = call ptr @arenaAlloc(ptr noundef %566, i32 noundef 16)
  store ptr %567, ptr %20, align 8
  %568 = load ptr, ptr %19, align 8
  %569 = getelementptr inbounds %struct.TupleValue, ptr %568, i32 0, i32 0
  %570 = load i32, ptr %569, align 8
  %571 = load ptr, ptr %20, align 8
  %572 = getelementptr inbounds %struct.TupleValue, ptr %571, i32 0, i32 0
  store i32 %570, ptr %572, align 8
  %573 = load ptr, ptr %5, align 8
  %574 = load ptr, ptr %20, align 8
  %575 = getelementptr inbounds %struct.TupleValue, ptr %574, i32 0, i32 0
  %576 = load i32, ptr %575, align 8
  %577 = sext i32 %576 to i64
  %578 = mul i64 8, %577
  %579 = trunc i64 %578 to i32
  %580 = call ptr @arenaAlloc(ptr noundef %573, i32 noundef %579)
  %581 = load ptr, ptr %20, align 8
  %582 = getelementptr inbounds %struct.TupleValue, ptr %581, i32 0, i32 1
  store ptr %580, ptr %582, align 8
  store i32 0, ptr %21, align 4
  br label %583

583:                                              ; preds = %606, %562
  %584 = load i32, ptr %21, align 4
  %585 = load ptr, ptr %19, align 8
  %586 = getelementptr inbounds %struct.TupleValue, ptr %585, i32 0, i32 0
  %587 = load i32, ptr %586, align 8
  %588 = icmp slt i32 %584, %587
  br i1 %588, label %589, label %609

589:                                              ; preds = %583
  %590 = load ptr, ptr %5, align 8
  %591 = load ptr, ptr %19, align 8
  %592 = getelementptr inbounds %struct.TupleValue, ptr %591, i32 0, i32 1
  %593 = load ptr, ptr %592, align 8
  %594 = load i32, ptr %21, align 4
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds ptr, ptr %593, i64 %595
  %597 = load ptr, ptr %596, align 8
  %598 = load ptr, ptr %7, align 8
  %599 = call ptr @divCalcLangValues(ptr noundef %590, ptr noundef %597, ptr noundef %598)
  %600 = load ptr, ptr %20, align 8
  %601 = getelementptr inbounds %struct.TupleValue, ptr %600, i32 0, i32 1
  %602 = load ptr, ptr %601, align 8
  %603 = load i32, ptr %21, align 4
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds ptr, ptr %602, i64 %604
  store ptr %599, ptr %605, align 8
  br label %606

606:                                              ; preds = %589
  %607 = load i32, ptr %21, align 4
  %608 = add nsw i32 %607, 1
  store i32 %608, ptr %21, align 4
  br label %583, !llvm.loop !65

609:                                              ; preds = %583
  %610 = load ptr, ptr %8, align 8
  %611 = getelementptr inbounds %struct.CalcLangVal, ptr %610, i32 0, i32 0
  store i32 6, ptr %611, align 8
  %612 = load ptr, ptr %20, align 8
  %613 = load ptr, ptr %8, align 8
  %614 = getelementptr inbounds %struct.CalcLangVal, ptr %613, i32 0, i32 1
  store ptr %612, ptr %614, align 8
  br label %1531

615:                                              ; preds = %557, %552
  %616 = load ptr, ptr %6, align 8
  %617 = getelementptr inbounds %struct.CalcLangVal, ptr %616, i32 0, i32 0
  %618 = load i32, ptr %617, align 8
  %619 = icmp eq i32 %618, 1
  br i1 %619, label %620, label %678

620:                                              ; preds = %615
  %621 = load ptr, ptr %7, align 8
  %622 = getelementptr inbounds %struct.CalcLangVal, ptr %621, i32 0, i32 0
  %623 = load i32, ptr %622, align 8
  %624 = icmp eq i32 %623, 6
  br i1 %624, label %625, label %678

625:                                              ; preds = %620
  %626 = load ptr, ptr %7, align 8
  %627 = getelementptr inbounds %struct.CalcLangVal, ptr %626, i32 0, i32 1
  %628 = load ptr, ptr %627, align 8
  store ptr %628, ptr %22, align 8
  %629 = load ptr, ptr %5, align 8
  %630 = call ptr @arenaAlloc(ptr noundef %629, i32 noundef 16)
  store ptr %630, ptr %23, align 8
  %631 = load ptr, ptr %22, align 8
  %632 = getelementptr inbounds %struct.TupleValue, ptr %631, i32 0, i32 0
  %633 = load i32, ptr %632, align 8
  %634 = load ptr, ptr %23, align 8
  %635 = getelementptr inbounds %struct.TupleValue, ptr %634, i32 0, i32 0
  store i32 %633, ptr %635, align 8
  %636 = load ptr, ptr %5, align 8
  %637 = load ptr, ptr %23, align 8
  %638 = getelementptr inbounds %struct.TupleValue, ptr %637, i32 0, i32 0
  %639 = load i32, ptr %638, align 8
  %640 = sext i32 %639 to i64
  %641 = mul i64 8, %640
  %642 = trunc i64 %641 to i32
  %643 = call ptr @arenaAlloc(ptr noundef %636, i32 noundef %642)
  %644 = load ptr, ptr %23, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 1
  store ptr %643, ptr %645, align 8
  store i32 0, ptr %24, align 4
  br label %646

646:                                              ; preds = %669, %625
  %647 = load i32, ptr %24, align 4
  %648 = load ptr, ptr %22, align 8
  %649 = getelementptr inbounds %struct.TupleValue, ptr %648, i32 0, i32 0
  %650 = load i32, ptr %649, align 8
  %651 = icmp slt i32 %647, %650
  br i1 %651, label %652, label %672

652:                                              ; preds = %646
  %653 = load ptr, ptr %5, align 8
  %654 = load ptr, ptr %6, align 8
  %655 = load ptr, ptr %22, align 8
  %656 = getelementptr inbounds %struct.TupleValue, ptr %655, i32 0, i32 1
  %657 = load ptr, ptr %656, align 8
  %658 = load i32, ptr %24, align 4
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds ptr, ptr %657, i64 %659
  %661 = load ptr, ptr %660, align 8
  %662 = call ptr @divCalcLangValues(ptr noundef %653, ptr noundef %654, ptr noundef %661)
  %663 = load ptr, ptr %23, align 8
  %664 = getelementptr inbounds %struct.TupleValue, ptr %663, i32 0, i32 1
  %665 = load ptr, ptr %664, align 8
  %666 = load i32, ptr %24, align 4
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds ptr, ptr %665, i64 %667
  store ptr %662, ptr %668, align 8
  br label %669

669:                                              ; preds = %652
  %670 = load i32, ptr %24, align 4
  %671 = add nsw i32 %670, 1
  store i32 %671, ptr %24, align 4
  br label %646, !llvm.loop !66

672:                                              ; preds = %646
  %673 = load ptr, ptr %8, align 8
  %674 = getelementptr inbounds %struct.CalcLangVal, ptr %673, i32 0, i32 0
  store i32 6, ptr %674, align 8
  %675 = load ptr, ptr %23, align 8
  %676 = load ptr, ptr %8, align 8
  %677 = getelementptr inbounds %struct.CalcLangVal, ptr %676, i32 0, i32 1
  store ptr %675, ptr %677, align 8
  br label %1530

678:                                              ; preds = %620, %615
  %679 = load ptr, ptr %6, align 8
  %680 = getelementptr inbounds %struct.CalcLangVal, ptr %679, i32 0, i32 0
  %681 = load i32, ptr %680, align 8
  %682 = icmp eq i32 %681, 6
  br i1 %682, label %683, label %741

683:                                              ; preds = %678
  %684 = load ptr, ptr %7, align 8
  %685 = getelementptr inbounds %struct.CalcLangVal, ptr %684, i32 0, i32 0
  %686 = load i32, ptr %685, align 8
  %687 = icmp eq i32 %686, 2
  br i1 %687, label %688, label %741

688:                                              ; preds = %683
  %689 = load ptr, ptr %6, align 8
  %690 = getelementptr inbounds %struct.CalcLangVal, ptr %689, i32 0, i32 1
  %691 = load ptr, ptr %690, align 8
  store ptr %691, ptr %25, align 8
  %692 = load ptr, ptr %5, align 8
  %693 = call ptr @arenaAlloc(ptr noundef %692, i32 noundef 16)
  store ptr %693, ptr %26, align 8
  %694 = load ptr, ptr %25, align 8
  %695 = getelementptr inbounds %struct.TupleValue, ptr %694, i32 0, i32 0
  %696 = load i32, ptr %695, align 8
  %697 = load ptr, ptr %26, align 8
  %698 = getelementptr inbounds %struct.TupleValue, ptr %697, i32 0, i32 0
  store i32 %696, ptr %698, align 8
  %699 = load ptr, ptr %5, align 8
  %700 = load ptr, ptr %26, align 8
  %701 = getelementptr inbounds %struct.TupleValue, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = sext i32 %702 to i64
  %704 = mul i64 8, %703
  %705 = trunc i64 %704 to i32
  %706 = call ptr @arenaAlloc(ptr noundef %699, i32 noundef %705)
  %707 = load ptr, ptr %26, align 8
  %708 = getelementptr inbounds %struct.TupleValue, ptr %707, i32 0, i32 1
  store ptr %706, ptr %708, align 8
  store i32 0, ptr %27, align 4
  br label %709

709:                                              ; preds = %732, %688
  %710 = load i32, ptr %27, align 4
  %711 = load ptr, ptr %25, align 8
  %712 = getelementptr inbounds %struct.TupleValue, ptr %711, i32 0, i32 0
  %713 = load i32, ptr %712, align 8
  %714 = icmp slt i32 %710, %713
  br i1 %714, label %715, label %735

715:                                              ; preds = %709
  %716 = load ptr, ptr %5, align 8
  %717 = load ptr, ptr %25, align 8
  %718 = getelementptr inbounds %struct.TupleValue, ptr %717, i32 0, i32 1
  %719 = load ptr, ptr %718, align 8
  %720 = load i32, ptr %27, align 4
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds ptr, ptr %719, i64 %721
  %723 = load ptr, ptr %722, align 8
  %724 = load ptr, ptr %7, align 8
  %725 = call ptr @divCalcLangValues(ptr noundef %716, ptr noundef %723, ptr noundef %724)
  %726 = load ptr, ptr %26, align 8
  %727 = getelementptr inbounds %struct.TupleValue, ptr %726, i32 0, i32 1
  %728 = load ptr, ptr %727, align 8
  %729 = load i32, ptr %27, align 4
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds ptr, ptr %728, i64 %730
  store ptr %725, ptr %731, align 8
  br label %732

732:                                              ; preds = %715
  %733 = load i32, ptr %27, align 4
  %734 = add nsw i32 %733, 1
  store i32 %734, ptr %27, align 4
  br label %709, !llvm.loop !67

735:                                              ; preds = %709
  %736 = load ptr, ptr %8, align 8
  %737 = getelementptr inbounds %struct.CalcLangVal, ptr %736, i32 0, i32 0
  store i32 6, ptr %737, align 8
  %738 = load ptr, ptr %26, align 8
  %739 = load ptr, ptr %8, align 8
  %740 = getelementptr inbounds %struct.CalcLangVal, ptr %739, i32 0, i32 1
  store ptr %738, ptr %740, align 8
  br label %1529

741:                                              ; preds = %683, %678
  %742 = load ptr, ptr %6, align 8
  %743 = getelementptr inbounds %struct.CalcLangVal, ptr %742, i32 0, i32 0
  %744 = load i32, ptr %743, align 8
  %745 = icmp eq i32 %744, 2
  br i1 %745, label %746, label %804

746:                                              ; preds = %741
  %747 = load ptr, ptr %7, align 8
  %748 = getelementptr inbounds %struct.CalcLangVal, ptr %747, i32 0, i32 0
  %749 = load i32, ptr %748, align 8
  %750 = icmp eq i32 %749, 6
  br i1 %750, label %751, label %804

751:                                              ; preds = %746
  %752 = load ptr, ptr %7, align 8
  %753 = getelementptr inbounds %struct.CalcLangVal, ptr %752, i32 0, i32 1
  %754 = load ptr, ptr %753, align 8
  store ptr %754, ptr %28, align 8
  %755 = load ptr, ptr %5, align 8
  %756 = call ptr @arenaAlloc(ptr noundef %755, i32 noundef 16)
  store ptr %756, ptr %29, align 8
  %757 = load ptr, ptr %28, align 8
  %758 = getelementptr inbounds %struct.TupleValue, ptr %757, i32 0, i32 0
  %759 = load i32, ptr %758, align 8
  %760 = load ptr, ptr %29, align 8
  %761 = getelementptr inbounds %struct.TupleValue, ptr %760, i32 0, i32 0
  store i32 %759, ptr %761, align 8
  %762 = load ptr, ptr %5, align 8
  %763 = load ptr, ptr %29, align 8
  %764 = getelementptr inbounds %struct.TupleValue, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = sext i32 %765 to i64
  %767 = mul i64 8, %766
  %768 = trunc i64 %767 to i32
  %769 = call ptr @arenaAlloc(ptr noundef %762, i32 noundef %768)
  %770 = load ptr, ptr %29, align 8
  %771 = getelementptr inbounds %struct.TupleValue, ptr %770, i32 0, i32 1
  store ptr %769, ptr %771, align 8
  store i32 0, ptr %30, align 4
  br label %772

772:                                              ; preds = %795, %751
  %773 = load i32, ptr %30, align 4
  %774 = load ptr, ptr %28, align 8
  %775 = getelementptr inbounds %struct.TupleValue, ptr %774, i32 0, i32 0
  %776 = load i32, ptr %775, align 8
  %777 = icmp slt i32 %773, %776
  br i1 %777, label %778, label %798

778:                                              ; preds = %772
  %779 = load ptr, ptr %5, align 8
  %780 = load ptr, ptr %6, align 8
  %781 = load ptr, ptr %28, align 8
  %782 = getelementptr inbounds %struct.TupleValue, ptr %781, i32 0, i32 1
  %783 = load ptr, ptr %782, align 8
  %784 = load i32, ptr %30, align 4
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds ptr, ptr %783, i64 %785
  %787 = load ptr, ptr %786, align 8
  %788 = call ptr @divCalcLangValues(ptr noundef %779, ptr noundef %780, ptr noundef %787)
  %789 = load ptr, ptr %29, align 8
  %790 = getelementptr inbounds %struct.TupleValue, ptr %789, i32 0, i32 1
  %791 = load ptr, ptr %790, align 8
  %792 = load i32, ptr %30, align 4
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds ptr, ptr %791, i64 %793
  store ptr %788, ptr %794, align 8
  br label %795

795:                                              ; preds = %778
  %796 = load i32, ptr %30, align 4
  %797 = add nsw i32 %796, 1
  store i32 %797, ptr %30, align 4
  br label %772, !llvm.loop !68

798:                                              ; preds = %772
  %799 = load ptr, ptr %8, align 8
  %800 = getelementptr inbounds %struct.CalcLangVal, ptr %799, i32 0, i32 0
  store i32 6, ptr %800, align 8
  %801 = load ptr, ptr %29, align 8
  %802 = load ptr, ptr %8, align 8
  %803 = getelementptr inbounds %struct.CalcLangVal, ptr %802, i32 0, i32 1
  store ptr %801, ptr %803, align 8
  br label %1528

804:                                              ; preds = %746, %741
  %805 = load ptr, ptr %6, align 8
  %806 = getelementptr inbounds %struct.CalcLangVal, ptr %805, i32 0, i32 0
  %807 = load i32, ptr %806, align 8
  %808 = icmp eq i32 %807, 6
  br i1 %808, label %809, label %867

809:                                              ; preds = %804
  %810 = load ptr, ptr %7, align 8
  %811 = getelementptr inbounds %struct.CalcLangVal, ptr %810, i32 0, i32 0
  %812 = load i32, ptr %811, align 8
  %813 = icmp eq i32 %812, 3
  br i1 %813, label %814, label %867

814:                                              ; preds = %809
  %815 = load ptr, ptr %6, align 8
  %816 = getelementptr inbounds %struct.CalcLangVal, ptr %815, i32 0, i32 1
  %817 = load ptr, ptr %816, align 8
  store ptr %817, ptr %31, align 8
  %818 = load ptr, ptr %5, align 8
  %819 = call ptr @arenaAlloc(ptr noundef %818, i32 noundef 16)
  store ptr %819, ptr %32, align 8
  %820 = load ptr, ptr %31, align 8
  %821 = getelementptr inbounds %struct.TupleValue, ptr %820, i32 0, i32 0
  %822 = load i32, ptr %821, align 8
  %823 = load ptr, ptr %32, align 8
  %824 = getelementptr inbounds %struct.TupleValue, ptr %823, i32 0, i32 0
  store i32 %822, ptr %824, align 8
  %825 = load ptr, ptr %5, align 8
  %826 = load ptr, ptr %32, align 8
  %827 = getelementptr inbounds %struct.TupleValue, ptr %826, i32 0, i32 0
  %828 = load i32, ptr %827, align 8
  %829 = sext i32 %828 to i64
  %830 = mul i64 8, %829
  %831 = trunc i64 %830 to i32
  %832 = call ptr @arenaAlloc(ptr noundef %825, i32 noundef %831)
  %833 = load ptr, ptr %32, align 8
  %834 = getelementptr inbounds %struct.TupleValue, ptr %833, i32 0, i32 1
  store ptr %832, ptr %834, align 8
  store i32 0, ptr %33, align 4
  br label %835

835:                                              ; preds = %858, %814
  %836 = load i32, ptr %33, align 4
  %837 = load ptr, ptr %31, align 8
  %838 = getelementptr inbounds %struct.TupleValue, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp slt i32 %836, %839
  br i1 %840, label %841, label %861

841:                                              ; preds = %835
  %842 = load ptr, ptr %5, align 8
  %843 = load ptr, ptr %31, align 8
  %844 = getelementptr inbounds %struct.TupleValue, ptr %843, i32 0, i32 1
  %845 = load ptr, ptr %844, align 8
  %846 = load i32, ptr %33, align 4
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds ptr, ptr %845, i64 %847
  %849 = load ptr, ptr %848, align 8
  %850 = load ptr, ptr %7, align 8
  %851 = call ptr @divCalcLangValues(ptr noundef %842, ptr noundef %849, ptr noundef %850)
  %852 = load ptr, ptr %32, align 8
  %853 = getelementptr inbounds %struct.TupleValue, ptr %852, i32 0, i32 1
  %854 = load ptr, ptr %853, align 8
  %855 = load i32, ptr %33, align 4
  %856 = sext i32 %855 to i64
  %857 = getelementptr inbounds ptr, ptr %854, i64 %856
  store ptr %851, ptr %857, align 8
  br label %858

858:                                              ; preds = %841
  %859 = load i32, ptr %33, align 4
  %860 = add nsw i32 %859, 1
  store i32 %860, ptr %33, align 4
  br label %835, !llvm.loop !69

861:                                              ; preds = %835
  %862 = load ptr, ptr %8, align 8
  %863 = getelementptr inbounds %struct.CalcLangVal, ptr %862, i32 0, i32 0
  store i32 6, ptr %863, align 8
  %864 = load ptr, ptr %32, align 8
  %865 = load ptr, ptr %8, align 8
  %866 = getelementptr inbounds %struct.CalcLangVal, ptr %865, i32 0, i32 1
  store ptr %864, ptr %866, align 8
  br label %1527

867:                                              ; preds = %809, %804
  %868 = load ptr, ptr %6, align 8
  %869 = getelementptr inbounds %struct.CalcLangVal, ptr %868, i32 0, i32 0
  %870 = load i32, ptr %869, align 8
  %871 = icmp eq i32 %870, 3
  br i1 %871, label %872, label %930

872:                                              ; preds = %867
  %873 = load ptr, ptr %7, align 8
  %874 = getelementptr inbounds %struct.CalcLangVal, ptr %873, i32 0, i32 0
  %875 = load i32, ptr %874, align 8
  %876 = icmp eq i32 %875, 6
  br i1 %876, label %877, label %930

877:                                              ; preds = %872
  %878 = load ptr, ptr %7, align 8
  %879 = getelementptr inbounds %struct.CalcLangVal, ptr %878, i32 0, i32 1
  %880 = load ptr, ptr %879, align 8
  store ptr %880, ptr %34, align 8
  %881 = load ptr, ptr %5, align 8
  %882 = call ptr @arenaAlloc(ptr noundef %881, i32 noundef 16)
  store ptr %882, ptr %35, align 8
  %883 = load ptr, ptr %34, align 8
  %884 = getelementptr inbounds %struct.TupleValue, ptr %883, i32 0, i32 0
  %885 = load i32, ptr %884, align 8
  %886 = load ptr, ptr %35, align 8
  %887 = getelementptr inbounds %struct.TupleValue, ptr %886, i32 0, i32 0
  store i32 %885, ptr %887, align 8
  %888 = load ptr, ptr %5, align 8
  %889 = load ptr, ptr %35, align 8
  %890 = getelementptr inbounds %struct.TupleValue, ptr %889, i32 0, i32 0
  %891 = load i32, ptr %890, align 8
  %892 = sext i32 %891 to i64
  %893 = mul i64 8, %892
  %894 = trunc i64 %893 to i32
  %895 = call ptr @arenaAlloc(ptr noundef %888, i32 noundef %894)
  %896 = load ptr, ptr %35, align 8
  %897 = getelementptr inbounds %struct.TupleValue, ptr %896, i32 0, i32 1
  store ptr %895, ptr %897, align 8
  store i32 0, ptr %36, align 4
  br label %898

898:                                              ; preds = %921, %877
  %899 = load i32, ptr %36, align 4
  %900 = load ptr, ptr %34, align 8
  %901 = getelementptr inbounds %struct.TupleValue, ptr %900, i32 0, i32 0
  %902 = load i32, ptr %901, align 8
  %903 = icmp slt i32 %899, %902
  br i1 %903, label %904, label %924

904:                                              ; preds = %898
  %905 = load ptr, ptr %5, align 8
  %906 = load ptr, ptr %6, align 8
  %907 = load ptr, ptr %34, align 8
  %908 = getelementptr inbounds %struct.TupleValue, ptr %907, i32 0, i32 1
  %909 = load ptr, ptr %908, align 8
  %910 = load i32, ptr %36, align 4
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds ptr, ptr %909, i64 %911
  %913 = load ptr, ptr %912, align 8
  %914 = call ptr @divCalcLangValues(ptr noundef %905, ptr noundef %906, ptr noundef %913)
  %915 = load ptr, ptr %35, align 8
  %916 = getelementptr inbounds %struct.TupleValue, ptr %915, i32 0, i32 1
  %917 = load ptr, ptr %916, align 8
  %918 = load i32, ptr %36, align 4
  %919 = sext i32 %918 to i64
  %920 = getelementptr inbounds ptr, ptr %917, i64 %919
  store ptr %914, ptr %920, align 8
  br label %921

921:                                              ; preds = %904
  %922 = load i32, ptr %36, align 4
  %923 = add nsw i32 %922, 1
  store i32 %923, ptr %36, align 4
  br label %898, !llvm.loop !70

924:                                              ; preds = %898
  %925 = load ptr, ptr %8, align 8
  %926 = getelementptr inbounds %struct.CalcLangVal, ptr %925, i32 0, i32 0
  store i32 6, ptr %926, align 8
  %927 = load ptr, ptr %35, align 8
  %928 = load ptr, ptr %8, align 8
  %929 = getelementptr inbounds %struct.CalcLangVal, ptr %928, i32 0, i32 1
  store ptr %927, ptr %929, align 8
  br label %1526

930:                                              ; preds = %872, %867
  %931 = load ptr, ptr %6, align 8
  %932 = getelementptr inbounds %struct.CalcLangVal, ptr %931, i32 0, i32 0
  %933 = load i32, ptr %932, align 8
  %934 = icmp eq i32 %933, 5
  br i1 %934, label %935, label %1012

935:                                              ; preds = %930
  %936 = load ptr, ptr %7, align 8
  %937 = getelementptr inbounds %struct.CalcLangVal, ptr %936, i32 0, i32 0
  %938 = load i32, ptr %937, align 8
  %939 = icmp eq i32 %938, 5
  br i1 %939, label %940, label %1012

940:                                              ; preds = %935
  %941 = load ptr, ptr %6, align 8
  %942 = getelementptr inbounds %struct.CalcLangVal, ptr %941, i32 0, i32 1
  %943 = load ptr, ptr %942, align 8
  store ptr %943, ptr %37, align 8
  %944 = load ptr, ptr %7, align 8
  %945 = getelementptr inbounds %struct.CalcLangVal, ptr %944, i32 0, i32 1
  %946 = load ptr, ptr %945, align 8
  store ptr %946, ptr %38, align 8
  %947 = load ptr, ptr %38, align 8
  %948 = getelementptr inbounds %struct.SetValue, ptr %947, i32 0, i32 0
  %949 = load i32, ptr %948, align 8
  %950 = load ptr, ptr %37, align 8
  %951 = getelementptr inbounds %struct.SetValue, ptr %950, i32 0, i32 0
  %952 = load i32, ptr %951, align 8
  %953 = icmp eq i32 %949, %952
  br i1 %953, label %954, label %1010

954:                                              ; preds = %940
  %955 = load ptr, ptr %5, align 8
  %956 = call ptr @arenaAlloc(ptr noundef %955, i32 noundef 16)
  store ptr %956, ptr %39, align 8
  %957 = load ptr, ptr %37, align 8
  %958 = getelementptr inbounds %struct.SetValue, ptr %957, i32 0, i32 0
  %959 = load i32, ptr %958, align 8
  %960 = load ptr, ptr %39, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 0
  store i32 %959, ptr %961, align 8
  %962 = load ptr, ptr %5, align 8
  %963 = load ptr, ptr %39, align 8
  %964 = getelementptr inbounds %struct.SetValue, ptr %963, i32 0, i32 0
  %965 = load i32, ptr %964, align 8
  %966 = sext i32 %965 to i64
  %967 = mul i64 8, %966
  %968 = trunc i64 %967 to i32
  %969 = call ptr @arenaAlloc(ptr noundef %962, i32 noundef %968)
  %970 = load ptr, ptr %39, align 8
  %971 = getelementptr inbounds %struct.SetValue, ptr %970, i32 0, i32 1
  store ptr %969, ptr %971, align 8
  store i32 0, ptr %40, align 4
  br label %972

972:                                              ; preds = %1001, %954
  %973 = load i32, ptr %40, align 4
  %974 = load ptr, ptr %37, align 8
  %975 = getelementptr inbounds %struct.SetValue, ptr %974, i32 0, i32 0
  %976 = load i32, ptr %975, align 8
  %977 = icmp slt i32 %973, %976
  br i1 %977, label %978, label %1004

978:                                              ; preds = %972
  %979 = load ptr, ptr %5, align 8
  %980 = load ptr, ptr %37, align 8
  %981 = getelementptr inbounds %struct.SetValue, ptr %980, i32 0, i32 1
  %982 = load ptr, ptr %981, align 8
  %983 = load i32, ptr %40, align 4
  %984 = sext i32 %983 to i64
  %985 = getelementptr inbounds ptr, ptr %982, i64 %984
  %986 = load ptr, ptr %985, align 8
  %987 = load ptr, ptr %38, align 8
  %988 = getelementptr inbounds %struct.SetValue, ptr %987, i32 0, i32 1
  %989 = load ptr, ptr %988, align 8
  %990 = load i32, ptr %40, align 4
  %991 = sext i32 %990 to i64
  %992 = getelementptr inbounds ptr, ptr %989, i64 %991
  %993 = load ptr, ptr %992, align 8
  %994 = call ptr @divCalcLangValues(ptr noundef %979, ptr noundef %986, ptr noundef %993)
  %995 = load ptr, ptr %39, align 8
  %996 = getelementptr inbounds %struct.SetValue, ptr %995, i32 0, i32 1
  %997 = load ptr, ptr %996, align 8
  %998 = load i32, ptr %40, align 4
  %999 = sext i32 %998 to i64
  %1000 = getelementptr inbounds ptr, ptr %997, i64 %999
  store ptr %994, ptr %1000, align 8
  br label %1001

1001:                                             ; preds = %978
  %1002 = load i32, ptr %40, align 4
  %1003 = add nsw i32 %1002, 1
  store i32 %1003, ptr %40, align 4
  br label %972, !llvm.loop !71

1004:                                             ; preds = %972
  %1005 = load ptr, ptr %8, align 8
  %1006 = getelementptr inbounds %struct.CalcLangVal, ptr %1005, i32 0, i32 0
  store i32 5, ptr %1006, align 8
  %1007 = load ptr, ptr %39, align 8
  %1008 = load ptr, ptr %8, align 8
  %1009 = getelementptr inbounds %struct.CalcLangVal, ptr %1008, i32 0, i32 1
  store ptr %1007, ptr %1009, align 8
  br label %1011

1010:                                             ; preds = %940
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1548

1011:                                             ; preds = %1004
  br label %1525

1012:                                             ; preds = %935, %930
  %1013 = load ptr, ptr %6, align 8
  %1014 = getelementptr inbounds %struct.CalcLangVal, ptr %1013, i32 0, i32 0
  %1015 = load i32, ptr %1014, align 8
  %1016 = icmp eq i32 %1015, 5
  br i1 %1016, label %1017, label %1075

1017:                                             ; preds = %1012
  %1018 = load ptr, ptr %7, align 8
  %1019 = getelementptr inbounds %struct.CalcLangVal, ptr %1018, i32 0, i32 0
  %1020 = load i32, ptr %1019, align 8
  %1021 = icmp eq i32 %1020, 0
  br i1 %1021, label %1022, label %1075

1022:                                             ; preds = %1017
  %1023 = load ptr, ptr %6, align 8
  %1024 = getelementptr inbounds %struct.CalcLangVal, ptr %1023, i32 0, i32 1
  %1025 = load ptr, ptr %1024, align 8
  store ptr %1025, ptr %41, align 8
  %1026 = load ptr, ptr %5, align 8
  %1027 = call ptr @arenaAlloc(ptr noundef %1026, i32 noundef 16)
  store ptr %1027, ptr %42, align 8
  %1028 = load ptr, ptr %41, align 8
  %1029 = getelementptr inbounds %struct.SetValue, ptr %1028, i32 0, i32 0
  %1030 = load i32, ptr %1029, align 8
  %1031 = load ptr, ptr %42, align 8
  %1032 = getelementptr inbounds %struct.SetValue, ptr %1031, i32 0, i32 0
  store i32 %1030, ptr %1032, align 8
  %1033 = load ptr, ptr %5, align 8
  %1034 = load ptr, ptr %42, align 8
  %1035 = getelementptr inbounds %struct.SetValue, ptr %1034, i32 0, i32 0
  %1036 = load i32, ptr %1035, align 8
  %1037 = sext i32 %1036 to i64
  %1038 = mul i64 8, %1037
  %1039 = trunc i64 %1038 to i32
  %1040 = call ptr @arenaAlloc(ptr noundef %1033, i32 noundef %1039)
  %1041 = load ptr, ptr %42, align 8
  %1042 = getelementptr inbounds %struct.SetValue, ptr %1041, i32 0, i32 1
  store ptr %1040, ptr %1042, align 8
  store i32 0, ptr %43, align 4
  br label %1043

1043:                                             ; preds = %1066, %1022
  %1044 = load i32, ptr %43, align 4
  %1045 = load ptr, ptr %41, align 8
  %1046 = getelementptr inbounds %struct.SetValue, ptr %1045, i32 0, i32 0
  %1047 = load i32, ptr %1046, align 8
  %1048 = icmp slt i32 %1044, %1047
  br i1 %1048, label %1049, label %1069

1049:                                             ; preds = %1043
  %1050 = load ptr, ptr %5, align 8
  %1051 = load ptr, ptr %41, align 8
  %1052 = getelementptr inbounds %struct.SetValue, ptr %1051, i32 0, i32 1
  %1053 = load ptr, ptr %1052, align 8
  %1054 = load i32, ptr %43, align 4
  %1055 = sext i32 %1054 to i64
  %1056 = getelementptr inbounds ptr, ptr %1053, i64 %1055
  %1057 = load ptr, ptr %1056, align 8
  %1058 = load ptr, ptr %7, align 8
  %1059 = call ptr @divCalcLangValues(ptr noundef %1050, ptr noundef %1057, ptr noundef %1058)
  %1060 = load ptr, ptr %42, align 8
  %1061 = getelementptr inbounds %struct.SetValue, ptr %1060, i32 0, i32 1
  %1062 = load ptr, ptr %1061, align 8
  %1063 = load i32, ptr %43, align 4
  %1064 = sext i32 %1063 to i64
  %1065 = getelementptr inbounds ptr, ptr %1062, i64 %1064
  store ptr %1059, ptr %1065, align 8
  br label %1066

1066:                                             ; preds = %1049
  %1067 = load i32, ptr %43, align 4
  %1068 = add nsw i32 %1067, 1
  store i32 %1068, ptr %43, align 4
  br label %1043, !llvm.loop !72

1069:                                             ; preds = %1043
  %1070 = load ptr, ptr %8, align 8
  %1071 = getelementptr inbounds %struct.CalcLangVal, ptr %1070, i32 0, i32 0
  store i32 5, ptr %1071, align 8
  %1072 = load ptr, ptr %42, align 8
  %1073 = load ptr, ptr %8, align 8
  %1074 = getelementptr inbounds %struct.CalcLangVal, ptr %1073, i32 0, i32 1
  store ptr %1072, ptr %1074, align 8
  br label %1524

1075:                                             ; preds = %1017, %1012
  %1076 = load ptr, ptr %6, align 8
  %1077 = getelementptr inbounds %struct.CalcLangVal, ptr %1076, i32 0, i32 0
  %1078 = load i32, ptr %1077, align 8
  %1079 = icmp eq i32 %1078, 0
  br i1 %1079, label %1080, label %1138

1080:                                             ; preds = %1075
  %1081 = load ptr, ptr %7, align 8
  %1082 = getelementptr inbounds %struct.CalcLangVal, ptr %1081, i32 0, i32 0
  %1083 = load i32, ptr %1082, align 8
  %1084 = icmp eq i32 %1083, 5
  br i1 %1084, label %1085, label %1138

1085:                                             ; preds = %1080
  %1086 = load ptr, ptr %7, align 8
  %1087 = getelementptr inbounds %struct.CalcLangVal, ptr %1086, i32 0, i32 1
  %1088 = load ptr, ptr %1087, align 8
  store ptr %1088, ptr %44, align 8
  %1089 = load ptr, ptr %5, align 8
  %1090 = call ptr @arenaAlloc(ptr noundef %1089, i32 noundef 16)
  store ptr %1090, ptr %45, align 8
  %1091 = load ptr, ptr %44, align 8
  %1092 = getelementptr inbounds %struct.SetValue, ptr %1091, i32 0, i32 0
  %1093 = load i32, ptr %1092, align 8
  %1094 = load ptr, ptr %45, align 8
  %1095 = getelementptr inbounds %struct.SetValue, ptr %1094, i32 0, i32 0
  store i32 %1093, ptr %1095, align 8
  %1096 = load ptr, ptr %5, align 8
  %1097 = load ptr, ptr %45, align 8
  %1098 = getelementptr inbounds %struct.SetValue, ptr %1097, i32 0, i32 0
  %1099 = load i32, ptr %1098, align 8
  %1100 = sext i32 %1099 to i64
  %1101 = mul i64 8, %1100
  %1102 = trunc i64 %1101 to i32
  %1103 = call ptr @arenaAlloc(ptr noundef %1096, i32 noundef %1102)
  %1104 = load ptr, ptr %45, align 8
  %1105 = getelementptr inbounds %struct.SetValue, ptr %1104, i32 0, i32 1
  store ptr %1103, ptr %1105, align 8
  store i32 0, ptr %46, align 4
  br label %1106

1106:                                             ; preds = %1129, %1085
  %1107 = load i32, ptr %46, align 4
  %1108 = load ptr, ptr %44, align 8
  %1109 = getelementptr inbounds %struct.SetValue, ptr %1108, i32 0, i32 0
  %1110 = load i32, ptr %1109, align 8
  %1111 = icmp slt i32 %1107, %1110
  br i1 %1111, label %1112, label %1132

1112:                                             ; preds = %1106
  %1113 = load ptr, ptr %5, align 8
  %1114 = load ptr, ptr %6, align 8
  %1115 = load ptr, ptr %44, align 8
  %1116 = getelementptr inbounds %struct.SetValue, ptr %1115, i32 0, i32 1
  %1117 = load ptr, ptr %1116, align 8
  %1118 = load i32, ptr %46, align 4
  %1119 = sext i32 %1118 to i64
  %1120 = getelementptr inbounds ptr, ptr %1117, i64 %1119
  %1121 = load ptr, ptr %1120, align 8
  %1122 = call ptr @divCalcLangValues(ptr noundef %1113, ptr noundef %1114, ptr noundef %1121)
  %1123 = load ptr, ptr %45, align 8
  %1124 = getelementptr inbounds %struct.SetValue, ptr %1123, i32 0, i32 1
  %1125 = load ptr, ptr %1124, align 8
  %1126 = load i32, ptr %46, align 4
  %1127 = sext i32 %1126 to i64
  %1128 = getelementptr inbounds ptr, ptr %1125, i64 %1127
  store ptr %1122, ptr %1128, align 8
  br label %1129

1129:                                             ; preds = %1112
  %1130 = load i32, ptr %46, align 4
  %1131 = add nsw i32 %1130, 1
  store i32 %1131, ptr %46, align 4
  br label %1106, !llvm.loop !73

1132:                                             ; preds = %1106
  %1133 = load ptr, ptr %8, align 8
  %1134 = getelementptr inbounds %struct.CalcLangVal, ptr %1133, i32 0, i32 0
  store i32 5, ptr %1134, align 8
  %1135 = load ptr, ptr %45, align 8
  %1136 = load ptr, ptr %8, align 8
  %1137 = getelementptr inbounds %struct.CalcLangVal, ptr %1136, i32 0, i32 1
  store ptr %1135, ptr %1137, align 8
  br label %1523

1138:                                             ; preds = %1080, %1075
  %1139 = load ptr, ptr %6, align 8
  %1140 = getelementptr inbounds %struct.CalcLangVal, ptr %1139, i32 0, i32 0
  %1141 = load i32, ptr %1140, align 8
  %1142 = icmp eq i32 %1141, 5
  br i1 %1142, label %1143, label %1201

1143:                                             ; preds = %1138
  %1144 = load ptr, ptr %7, align 8
  %1145 = getelementptr inbounds %struct.CalcLangVal, ptr %1144, i32 0, i32 0
  %1146 = load i32, ptr %1145, align 8
  %1147 = icmp eq i32 %1146, 1
  br i1 %1147, label %1148, label %1201

1148:                                             ; preds = %1143
  %1149 = load ptr, ptr %6, align 8
  %1150 = getelementptr inbounds %struct.CalcLangVal, ptr %1149, i32 0, i32 1
  %1151 = load ptr, ptr %1150, align 8
  store ptr %1151, ptr %47, align 8
  %1152 = load ptr, ptr %5, align 8
  %1153 = call ptr @arenaAlloc(ptr noundef %1152, i32 noundef 16)
  store ptr %1153, ptr %48, align 8
  %1154 = load ptr, ptr %47, align 8
  %1155 = getelementptr inbounds %struct.SetValue, ptr %1154, i32 0, i32 0
  %1156 = load i32, ptr %1155, align 8
  %1157 = load ptr, ptr %48, align 8
  %1158 = getelementptr inbounds %struct.SetValue, ptr %1157, i32 0, i32 0
  store i32 %1156, ptr %1158, align 8
  %1159 = load ptr, ptr %5, align 8
  %1160 = load ptr, ptr %48, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 0
  %1162 = load i32, ptr %1161, align 8
  %1163 = sext i32 %1162 to i64
  %1164 = mul i64 8, %1163
  %1165 = trunc i64 %1164 to i32
  %1166 = call ptr @arenaAlloc(ptr noundef %1159, i32 noundef %1165)
  %1167 = load ptr, ptr %48, align 8
  %1168 = getelementptr inbounds %struct.SetValue, ptr %1167, i32 0, i32 1
  store ptr %1166, ptr %1168, align 8
  store i32 0, ptr %49, align 4
  br label %1169

1169:                                             ; preds = %1192, %1148
  %1170 = load i32, ptr %49, align 4
  %1171 = load ptr, ptr %47, align 8
  %1172 = getelementptr inbounds %struct.SetValue, ptr %1171, i32 0, i32 0
  %1173 = load i32, ptr %1172, align 8
  %1174 = icmp slt i32 %1170, %1173
  br i1 %1174, label %1175, label %1195

1175:                                             ; preds = %1169
  %1176 = load ptr, ptr %5, align 8
  %1177 = load ptr, ptr %47, align 8
  %1178 = getelementptr inbounds %struct.SetValue, ptr %1177, i32 0, i32 1
  %1179 = load ptr, ptr %1178, align 8
  %1180 = load i32, ptr %49, align 4
  %1181 = sext i32 %1180 to i64
  %1182 = getelementptr inbounds ptr, ptr %1179, i64 %1181
  %1183 = load ptr, ptr %1182, align 8
  %1184 = load ptr, ptr %7, align 8
  %1185 = call ptr @divCalcLangValues(ptr noundef %1176, ptr noundef %1183, ptr noundef %1184)
  %1186 = load ptr, ptr %48, align 8
  %1187 = getelementptr inbounds %struct.SetValue, ptr %1186, i32 0, i32 1
  %1188 = load ptr, ptr %1187, align 8
  %1189 = load i32, ptr %49, align 4
  %1190 = sext i32 %1189 to i64
  %1191 = getelementptr inbounds ptr, ptr %1188, i64 %1190
  store ptr %1185, ptr %1191, align 8
  br label %1192

1192:                                             ; preds = %1175
  %1193 = load i32, ptr %49, align 4
  %1194 = add nsw i32 %1193, 1
  store i32 %1194, ptr %49, align 4
  br label %1169, !llvm.loop !74

1195:                                             ; preds = %1169
  %1196 = load ptr, ptr %8, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  store i32 6, ptr %1197, align 8
  %1198 = load ptr, ptr %48, align 8
  %1199 = load ptr, ptr %8, align 8
  %1200 = getelementptr inbounds %struct.CalcLangVal, ptr %1199, i32 0, i32 1
  store ptr %1198, ptr %1200, align 8
  br label %1522

1201:                                             ; preds = %1143, %1138
  %1202 = load ptr, ptr %6, align 8
  %1203 = getelementptr inbounds %struct.CalcLangVal, ptr %1202, i32 0, i32 0
  %1204 = load i32, ptr %1203, align 8
  %1205 = icmp eq i32 %1204, 1
  br i1 %1205, label %1206, label %1264

1206:                                             ; preds = %1201
  %1207 = load ptr, ptr %7, align 8
  %1208 = getelementptr inbounds %struct.CalcLangVal, ptr %1207, i32 0, i32 0
  %1209 = load i32, ptr %1208, align 8
  %1210 = icmp eq i32 %1209, 5
  br i1 %1210, label %1211, label %1264

1211:                                             ; preds = %1206
  %1212 = load ptr, ptr %7, align 8
  %1213 = getelementptr inbounds %struct.CalcLangVal, ptr %1212, i32 0, i32 1
  %1214 = load ptr, ptr %1213, align 8
  store ptr %1214, ptr %50, align 8
  %1215 = load ptr, ptr %5, align 8
  %1216 = call ptr @arenaAlloc(ptr noundef %1215, i32 noundef 16)
  store ptr %1216, ptr %51, align 8
  %1217 = load ptr, ptr %50, align 8
  %1218 = getelementptr inbounds %struct.SetValue, ptr %1217, i32 0, i32 0
  %1219 = load i32, ptr %1218, align 8
  %1220 = load ptr, ptr %51, align 8
  %1221 = getelementptr inbounds %struct.SetValue, ptr %1220, i32 0, i32 0
  store i32 %1219, ptr %1221, align 8
  %1222 = load ptr, ptr %5, align 8
  %1223 = load ptr, ptr %51, align 8
  %1224 = getelementptr inbounds %struct.SetValue, ptr %1223, i32 0, i32 0
  %1225 = load i32, ptr %1224, align 8
  %1226 = sext i32 %1225 to i64
  %1227 = mul i64 8, %1226
  %1228 = trunc i64 %1227 to i32
  %1229 = call ptr @arenaAlloc(ptr noundef %1222, i32 noundef %1228)
  %1230 = load ptr, ptr %51, align 8
  %1231 = getelementptr inbounds %struct.SetValue, ptr %1230, i32 0, i32 1
  store ptr %1229, ptr %1231, align 8
  store i32 0, ptr %52, align 4
  br label %1232

1232:                                             ; preds = %1255, %1211
  %1233 = load i32, ptr %52, align 4
  %1234 = load ptr, ptr %50, align 8
  %1235 = getelementptr inbounds %struct.SetValue, ptr %1234, i32 0, i32 0
  %1236 = load i32, ptr %1235, align 8
  %1237 = icmp slt i32 %1233, %1236
  br i1 %1237, label %1238, label %1258

1238:                                             ; preds = %1232
  %1239 = load ptr, ptr %5, align 8
  %1240 = load ptr, ptr %6, align 8
  %1241 = load ptr, ptr %50, align 8
  %1242 = getelementptr inbounds %struct.SetValue, ptr %1241, i32 0, i32 1
  %1243 = load ptr, ptr %1242, align 8
  %1244 = load i32, ptr %52, align 4
  %1245 = sext i32 %1244 to i64
  %1246 = getelementptr inbounds ptr, ptr %1243, i64 %1245
  %1247 = load ptr, ptr %1246, align 8
  %1248 = call ptr @divCalcLangValues(ptr noundef %1239, ptr noundef %1240, ptr noundef %1247)
  %1249 = load ptr, ptr %51, align 8
  %1250 = getelementptr inbounds %struct.SetValue, ptr %1249, i32 0, i32 1
  %1251 = load ptr, ptr %1250, align 8
  %1252 = load i32, ptr %52, align 4
  %1253 = sext i32 %1252 to i64
  %1254 = getelementptr inbounds ptr, ptr %1251, i64 %1253
  store ptr %1248, ptr %1254, align 8
  br label %1255

1255:                                             ; preds = %1238
  %1256 = load i32, ptr %52, align 4
  %1257 = add nsw i32 %1256, 1
  store i32 %1257, ptr %52, align 4
  br label %1232, !llvm.loop !75

1258:                                             ; preds = %1232
  %1259 = load ptr, ptr %8, align 8
  %1260 = getelementptr inbounds %struct.CalcLangVal, ptr %1259, i32 0, i32 0
  store i32 5, ptr %1260, align 8
  %1261 = load ptr, ptr %51, align 8
  %1262 = load ptr, ptr %8, align 8
  %1263 = getelementptr inbounds %struct.CalcLangVal, ptr %1262, i32 0, i32 1
  store ptr %1261, ptr %1263, align 8
  br label %1521

1264:                                             ; preds = %1206, %1201
  %1265 = load ptr, ptr %6, align 8
  %1266 = getelementptr inbounds %struct.CalcLangVal, ptr %1265, i32 0, i32 0
  %1267 = load i32, ptr %1266, align 8
  %1268 = icmp eq i32 %1267, 5
  br i1 %1268, label %1269, label %1327

1269:                                             ; preds = %1264
  %1270 = load ptr, ptr %7, align 8
  %1271 = getelementptr inbounds %struct.CalcLangVal, ptr %1270, i32 0, i32 0
  %1272 = load i32, ptr %1271, align 8
  %1273 = icmp eq i32 %1272, 2
  br i1 %1273, label %1274, label %1327

1274:                                             ; preds = %1269
  %1275 = load ptr, ptr %6, align 8
  %1276 = getelementptr inbounds %struct.CalcLangVal, ptr %1275, i32 0, i32 1
  %1277 = load ptr, ptr %1276, align 8
  store ptr %1277, ptr %53, align 8
  %1278 = load ptr, ptr %5, align 8
  %1279 = call ptr @arenaAlloc(ptr noundef %1278, i32 noundef 16)
  store ptr %1279, ptr %54, align 8
  %1280 = load ptr, ptr %53, align 8
  %1281 = getelementptr inbounds %struct.SetValue, ptr %1280, i32 0, i32 0
  %1282 = load i32, ptr %1281, align 8
  %1283 = load ptr, ptr %54, align 8
  %1284 = getelementptr inbounds %struct.SetValue, ptr %1283, i32 0, i32 0
  store i32 %1282, ptr %1284, align 8
  %1285 = load ptr, ptr %5, align 8
  %1286 = load ptr, ptr %54, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 0
  %1288 = load i32, ptr %1287, align 8
  %1289 = sext i32 %1288 to i64
  %1290 = mul i64 8, %1289
  %1291 = trunc i64 %1290 to i32
  %1292 = call ptr @arenaAlloc(ptr noundef %1285, i32 noundef %1291)
  %1293 = load ptr, ptr %54, align 8
  %1294 = getelementptr inbounds %struct.SetValue, ptr %1293, i32 0, i32 1
  store ptr %1292, ptr %1294, align 8
  store i32 0, ptr %55, align 4
  br label %1295

1295:                                             ; preds = %1318, %1274
  %1296 = load i32, ptr %55, align 4
  %1297 = load ptr, ptr %53, align 8
  %1298 = getelementptr inbounds %struct.SetValue, ptr %1297, i32 0, i32 0
  %1299 = load i32, ptr %1298, align 8
  %1300 = icmp slt i32 %1296, %1299
  br i1 %1300, label %1301, label %1321

1301:                                             ; preds = %1295
  %1302 = load ptr, ptr %5, align 8
  %1303 = load ptr, ptr %53, align 8
  %1304 = getelementptr inbounds %struct.SetValue, ptr %1303, i32 0, i32 1
  %1305 = load ptr, ptr %1304, align 8
  %1306 = load i32, ptr %55, align 4
  %1307 = sext i32 %1306 to i64
  %1308 = getelementptr inbounds ptr, ptr %1305, i64 %1307
  %1309 = load ptr, ptr %1308, align 8
  %1310 = load ptr, ptr %7, align 8
  %1311 = call ptr @divCalcLangValues(ptr noundef %1302, ptr noundef %1309, ptr noundef %1310)
  %1312 = load ptr, ptr %54, align 8
  %1313 = getelementptr inbounds %struct.SetValue, ptr %1312, i32 0, i32 1
  %1314 = load ptr, ptr %1313, align 8
  %1315 = load i32, ptr %55, align 4
  %1316 = sext i32 %1315 to i64
  %1317 = getelementptr inbounds ptr, ptr %1314, i64 %1316
  store ptr %1311, ptr %1317, align 8
  br label %1318

1318:                                             ; preds = %1301
  %1319 = load i32, ptr %55, align 4
  %1320 = add nsw i32 %1319, 1
  store i32 %1320, ptr %55, align 4
  br label %1295, !llvm.loop !76

1321:                                             ; preds = %1295
  %1322 = load ptr, ptr %8, align 8
  %1323 = getelementptr inbounds %struct.CalcLangVal, ptr %1322, i32 0, i32 0
  store i32 5, ptr %1323, align 8
  %1324 = load ptr, ptr %54, align 8
  %1325 = load ptr, ptr %8, align 8
  %1326 = getelementptr inbounds %struct.CalcLangVal, ptr %1325, i32 0, i32 1
  store ptr %1324, ptr %1326, align 8
  br label %1520

1327:                                             ; preds = %1269, %1264
  %1328 = load ptr, ptr %6, align 8
  %1329 = getelementptr inbounds %struct.CalcLangVal, ptr %1328, i32 0, i32 0
  %1330 = load i32, ptr %1329, align 8
  %1331 = icmp eq i32 %1330, 2
  br i1 %1331, label %1332, label %1390

1332:                                             ; preds = %1327
  %1333 = load ptr, ptr %7, align 8
  %1334 = getelementptr inbounds %struct.CalcLangVal, ptr %1333, i32 0, i32 0
  %1335 = load i32, ptr %1334, align 8
  %1336 = icmp eq i32 %1335, 5
  br i1 %1336, label %1337, label %1390

1337:                                             ; preds = %1332
  %1338 = load ptr, ptr %7, align 8
  %1339 = getelementptr inbounds %struct.CalcLangVal, ptr %1338, i32 0, i32 1
  %1340 = load ptr, ptr %1339, align 8
  store ptr %1340, ptr %56, align 8
  %1341 = load ptr, ptr %5, align 8
  %1342 = call ptr @arenaAlloc(ptr noundef %1341, i32 noundef 16)
  store ptr %1342, ptr %57, align 8
  %1343 = load ptr, ptr %56, align 8
  %1344 = getelementptr inbounds %struct.SetValue, ptr %1343, i32 0, i32 0
  %1345 = load i32, ptr %1344, align 8
  %1346 = load ptr, ptr %57, align 8
  %1347 = getelementptr inbounds %struct.SetValue, ptr %1346, i32 0, i32 0
  store i32 %1345, ptr %1347, align 8
  %1348 = load ptr, ptr %5, align 8
  %1349 = load ptr, ptr %57, align 8
  %1350 = getelementptr inbounds %struct.SetValue, ptr %1349, i32 0, i32 0
  %1351 = load i32, ptr %1350, align 8
  %1352 = sext i32 %1351 to i64
  %1353 = mul i64 8, %1352
  %1354 = trunc i64 %1353 to i32
  %1355 = call ptr @arenaAlloc(ptr noundef %1348, i32 noundef %1354)
  %1356 = load ptr, ptr %57, align 8
  %1357 = getelementptr inbounds %struct.SetValue, ptr %1356, i32 0, i32 1
  store ptr %1355, ptr %1357, align 8
  store i32 0, ptr %58, align 4
  br label %1358

1358:                                             ; preds = %1381, %1337
  %1359 = load i32, ptr %58, align 4
  %1360 = load ptr, ptr %56, align 8
  %1361 = getelementptr inbounds %struct.SetValue, ptr %1360, i32 0, i32 0
  %1362 = load i32, ptr %1361, align 8
  %1363 = icmp slt i32 %1359, %1362
  br i1 %1363, label %1364, label %1384

1364:                                             ; preds = %1358
  %1365 = load ptr, ptr %5, align 8
  %1366 = load ptr, ptr %6, align 8
  %1367 = load ptr, ptr %56, align 8
  %1368 = getelementptr inbounds %struct.SetValue, ptr %1367, i32 0, i32 1
  %1369 = load ptr, ptr %1368, align 8
  %1370 = load i32, ptr %58, align 4
  %1371 = sext i32 %1370 to i64
  %1372 = getelementptr inbounds ptr, ptr %1369, i64 %1371
  %1373 = load ptr, ptr %1372, align 8
  %1374 = call ptr @divCalcLangValues(ptr noundef %1365, ptr noundef %1366, ptr noundef %1373)
  %1375 = load ptr, ptr %57, align 8
  %1376 = getelementptr inbounds %struct.SetValue, ptr %1375, i32 0, i32 1
  %1377 = load ptr, ptr %1376, align 8
  %1378 = load i32, ptr %58, align 4
  %1379 = sext i32 %1378 to i64
  %1380 = getelementptr inbounds ptr, ptr %1377, i64 %1379
  store ptr %1374, ptr %1380, align 8
  br label %1381

1381:                                             ; preds = %1364
  %1382 = load i32, ptr %58, align 4
  %1383 = add nsw i32 %1382, 1
  store i32 %1383, ptr %58, align 4
  br label %1358, !llvm.loop !77

1384:                                             ; preds = %1358
  %1385 = load ptr, ptr %8, align 8
  %1386 = getelementptr inbounds %struct.CalcLangVal, ptr %1385, i32 0, i32 0
  store i32 5, ptr %1386, align 8
  %1387 = load ptr, ptr %57, align 8
  %1388 = load ptr, ptr %8, align 8
  %1389 = getelementptr inbounds %struct.CalcLangVal, ptr %1388, i32 0, i32 1
  store ptr %1387, ptr %1389, align 8
  br label %1519

1390:                                             ; preds = %1332, %1327
  %1391 = load ptr, ptr %6, align 8
  %1392 = getelementptr inbounds %struct.CalcLangVal, ptr %1391, i32 0, i32 0
  %1393 = load i32, ptr %1392, align 8
  %1394 = icmp eq i32 %1393, 5
  br i1 %1394, label %1395, label %1453

1395:                                             ; preds = %1390
  %1396 = load ptr, ptr %7, align 8
  %1397 = getelementptr inbounds %struct.CalcLangVal, ptr %1396, i32 0, i32 0
  %1398 = load i32, ptr %1397, align 8
  %1399 = icmp eq i32 %1398, 3
  br i1 %1399, label %1400, label %1453

1400:                                             ; preds = %1395
  %1401 = load ptr, ptr %6, align 8
  %1402 = getelementptr inbounds %struct.CalcLangVal, ptr %1401, i32 0, i32 1
  %1403 = load ptr, ptr %1402, align 8
  store ptr %1403, ptr %59, align 8
  %1404 = load ptr, ptr %5, align 8
  %1405 = call ptr @arenaAlloc(ptr noundef %1404, i32 noundef 16)
  store ptr %1405, ptr %60, align 8
  %1406 = load ptr, ptr %59, align 8
  %1407 = getelementptr inbounds %struct.SetValue, ptr %1406, i32 0, i32 0
  %1408 = load i32, ptr %1407, align 8
  %1409 = load ptr, ptr %60, align 8
  %1410 = getelementptr inbounds %struct.SetValue, ptr %1409, i32 0, i32 0
  store i32 %1408, ptr %1410, align 8
  %1411 = load ptr, ptr %5, align 8
  %1412 = load ptr, ptr %60, align 8
  %1413 = getelementptr inbounds %struct.SetValue, ptr %1412, i32 0, i32 0
  %1414 = load i32, ptr %1413, align 8
  %1415 = sext i32 %1414 to i64
  %1416 = mul i64 8, %1415
  %1417 = trunc i64 %1416 to i32
  %1418 = call ptr @arenaAlloc(ptr noundef %1411, i32 noundef %1417)
  %1419 = load ptr, ptr %60, align 8
  %1420 = getelementptr inbounds %struct.SetValue, ptr %1419, i32 0, i32 1
  store ptr %1418, ptr %1420, align 8
  store i32 0, ptr %61, align 4
  br label %1421

1421:                                             ; preds = %1444, %1400
  %1422 = load i32, ptr %61, align 4
  %1423 = load ptr, ptr %59, align 8
  %1424 = getelementptr inbounds %struct.SetValue, ptr %1423, i32 0, i32 0
  %1425 = load i32, ptr %1424, align 8
  %1426 = icmp slt i32 %1422, %1425
  br i1 %1426, label %1427, label %1447

1427:                                             ; preds = %1421
  %1428 = load ptr, ptr %5, align 8
  %1429 = load ptr, ptr %59, align 8
  %1430 = getelementptr inbounds %struct.SetValue, ptr %1429, i32 0, i32 1
  %1431 = load ptr, ptr %1430, align 8
  %1432 = load i32, ptr %61, align 4
  %1433 = sext i32 %1432 to i64
  %1434 = getelementptr inbounds ptr, ptr %1431, i64 %1433
  %1435 = load ptr, ptr %1434, align 8
  %1436 = load ptr, ptr %7, align 8
  %1437 = call ptr @divCalcLangValues(ptr noundef %1428, ptr noundef %1435, ptr noundef %1436)
  %1438 = load ptr, ptr %60, align 8
  %1439 = getelementptr inbounds %struct.SetValue, ptr %1438, i32 0, i32 1
  %1440 = load ptr, ptr %1439, align 8
  %1441 = load i32, ptr %61, align 4
  %1442 = sext i32 %1441 to i64
  %1443 = getelementptr inbounds ptr, ptr %1440, i64 %1442
  store ptr %1437, ptr %1443, align 8
  br label %1444

1444:                                             ; preds = %1427
  %1445 = load i32, ptr %61, align 4
  %1446 = add nsw i32 %1445, 1
  store i32 %1446, ptr %61, align 4
  br label %1421, !llvm.loop !78

1447:                                             ; preds = %1421
  %1448 = load ptr, ptr %8, align 8
  %1449 = getelementptr inbounds %struct.CalcLangVal, ptr %1448, i32 0, i32 0
  store i32 5, ptr %1449, align 8
  %1450 = load ptr, ptr %60, align 8
  %1451 = load ptr, ptr %8, align 8
  %1452 = getelementptr inbounds %struct.CalcLangVal, ptr %1451, i32 0, i32 1
  store ptr %1450, ptr %1452, align 8
  br label %1518

1453:                                             ; preds = %1395, %1390
  %1454 = load ptr, ptr %6, align 8
  %1455 = getelementptr inbounds %struct.CalcLangVal, ptr %1454, i32 0, i32 0
  %1456 = load i32, ptr %1455, align 8
  %1457 = icmp eq i32 %1456, 3
  br i1 %1457, label %1458, label %1516

1458:                                             ; preds = %1453
  %1459 = load ptr, ptr %7, align 8
  %1460 = getelementptr inbounds %struct.CalcLangVal, ptr %1459, i32 0, i32 0
  %1461 = load i32, ptr %1460, align 8
  %1462 = icmp eq i32 %1461, 5
  br i1 %1462, label %1463, label %1516

1463:                                             ; preds = %1458
  %1464 = load ptr, ptr %7, align 8
  %1465 = getelementptr inbounds %struct.CalcLangVal, ptr %1464, i32 0, i32 1
  %1466 = load ptr, ptr %1465, align 8
  store ptr %1466, ptr %62, align 8
  %1467 = load ptr, ptr %5, align 8
  %1468 = call ptr @arenaAlloc(ptr noundef %1467, i32 noundef 16)
  store ptr %1468, ptr %63, align 8
  %1469 = load ptr, ptr %62, align 8
  %1470 = getelementptr inbounds %struct.SetValue, ptr %1469, i32 0, i32 0
  %1471 = load i32, ptr %1470, align 8
  %1472 = load ptr, ptr %63, align 8
  %1473 = getelementptr inbounds %struct.SetValue, ptr %1472, i32 0, i32 0
  store i32 %1471, ptr %1473, align 8
  %1474 = load ptr, ptr %5, align 8
  %1475 = load ptr, ptr %63, align 8
  %1476 = getelementptr inbounds %struct.SetValue, ptr %1475, i32 0, i32 0
  %1477 = load i32, ptr %1476, align 8
  %1478 = sext i32 %1477 to i64
  %1479 = mul i64 8, %1478
  %1480 = trunc i64 %1479 to i32
  %1481 = call ptr @arenaAlloc(ptr noundef %1474, i32 noundef %1480)
  %1482 = load ptr, ptr %63, align 8
  %1483 = getelementptr inbounds %struct.SetValue, ptr %1482, i32 0, i32 1
  store ptr %1481, ptr %1483, align 8
  store i32 0, ptr %64, align 4
  br label %1484

1484:                                             ; preds = %1507, %1463
  %1485 = load i32, ptr %64, align 4
  %1486 = load ptr, ptr %62, align 8
  %1487 = getelementptr inbounds %struct.SetValue, ptr %1486, i32 0, i32 0
  %1488 = load i32, ptr %1487, align 8
  %1489 = icmp slt i32 %1485, %1488
  br i1 %1489, label %1490, label %1510

1490:                                             ; preds = %1484
  %1491 = load ptr, ptr %5, align 8
  %1492 = load ptr, ptr %6, align 8
  %1493 = load ptr, ptr %62, align 8
  %1494 = getelementptr inbounds %struct.SetValue, ptr %1493, i32 0, i32 1
  %1495 = load ptr, ptr %1494, align 8
  %1496 = load i32, ptr %64, align 4
  %1497 = sext i32 %1496 to i64
  %1498 = getelementptr inbounds ptr, ptr %1495, i64 %1497
  %1499 = load ptr, ptr %1498, align 8
  %1500 = call ptr @divCalcLangValues(ptr noundef %1491, ptr noundef %1492, ptr noundef %1499)
  %1501 = load ptr, ptr %63, align 8
  %1502 = getelementptr inbounds %struct.SetValue, ptr %1501, i32 0, i32 1
  %1503 = load ptr, ptr %1502, align 8
  %1504 = load i32, ptr %64, align 4
  %1505 = sext i32 %1504 to i64
  %1506 = getelementptr inbounds ptr, ptr %1503, i64 %1505
  store ptr %1500, ptr %1506, align 8
  br label %1507

1507:                                             ; preds = %1490
  %1508 = load i32, ptr %64, align 4
  %1509 = add nsw i32 %1508, 1
  store i32 %1509, ptr %64, align 4
  br label %1484, !llvm.loop !79

1510:                                             ; preds = %1484
  %1511 = load ptr, ptr %8, align 8
  %1512 = getelementptr inbounds %struct.CalcLangVal, ptr %1511, i32 0, i32 0
  store i32 5, ptr %1512, align 8
  %1513 = load ptr, ptr %63, align 8
  %1514 = load ptr, ptr %8, align 8
  %1515 = getelementptr inbounds %struct.CalcLangVal, ptr %1514, i32 0, i32 1
  store ptr %1513, ptr %1515, align 8
  br label %1517

1516:                                             ; preds = %1458, %1453
  call void @perror(ptr noundef @.str.2) #6
  br label %1517

1517:                                             ; preds = %1516, %1510
  br label %1518

1518:                                             ; preds = %1517, %1447
  br label %1519

1519:                                             ; preds = %1518, %1384
  br label %1520

1520:                                             ; preds = %1519, %1321
  br label %1521

1521:                                             ; preds = %1520, %1258
  br label %1522

1522:                                             ; preds = %1521, %1195
  br label %1523

1523:                                             ; preds = %1522, %1132
  br label %1524

1524:                                             ; preds = %1523, %1069
  br label %1525

1525:                                             ; preds = %1524, %1011
  br label %1526

1526:                                             ; preds = %1525, %924
  br label %1527

1527:                                             ; preds = %1526, %861
  br label %1528

1528:                                             ; preds = %1527, %798
  br label %1529

1529:                                             ; preds = %1528, %735
  br label %1530

1530:                                             ; preds = %1529, %672
  br label %1531

1531:                                             ; preds = %1530, %609
  br label %1532

1532:                                             ; preds = %1531, %546
  br label %1533

1533:                                             ; preds = %1532, %483
  br label %1534

1534:                                             ; preds = %1533, %425
  br label %1535

1535:                                             ; preds = %1534, %332
  br label %1536

1536:                                             ; preds = %1535, %310
  br label %1537

1537:                                             ; preds = %1536, %288
  br label %1538

1538:                                             ; preds = %1537, %265
  br label %1539

1539:                                             ; preds = %1538, %242
  br label %1540

1540:                                             ; preds = %1539, %220
  br label %1541

1541:                                             ; preds = %1540, %198
  br label %1542

1542:                                             ; preds = %1541, %175
  br label %1543

1543:                                             ; preds = %1542, %152
  br label %1544

1544:                                             ; preds = %1543, %129
  br label %1545

1545:                                             ; preds = %1544, %107
  br label %1546

1546:                                             ; preds = %1545, %83
  %1547 = load ptr, ptr %8, align 8
  store ptr %1547, ptr %4, align 8
  br label %1548

1548:                                             ; preds = %1546, %1010, %424, %70
  %1549 = load ptr, ptr %4, align 8
  ret ptr %1549
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @powCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i32, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i32, align 4
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i32, align 4
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %65 = load ptr, ptr %6, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %70, label %67

67:                                               ; preds = %3
  %68 = load ptr, ptr %7, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %67, %3
  store ptr null, ptr %4, align 8
  br label %1573

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = call ptr @arenaAlloc(ptr noundef %72, i32 noundef 16)
  store ptr %73, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %98

78:                                               ; preds = %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %98

83:                                               ; preds = %78
  %84 = load ptr, ptr %8, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 0
  store i32 0, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = sitofp i32 %88 to double
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = sitofp i32 %92 to double
  %94 = call double @pow(double noundef %89, double noundef %93) #7
  %95 = fptosi double %94 to i32
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 1
  store i32 %95, ptr %97, align 8
  br label %1571

98:                                               ; preds = %78, %71
  %99 = load ptr, ptr %6, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 0
  %101 = load i32, ptr %100, align 8
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %120

103:                                              ; preds = %98
  %104 = load ptr, ptr %7, align 8
  %105 = getelementptr inbounds %struct.CalcLangVal, ptr %104, i32 0, i32 0
  %106 = load i32, ptr %105, align 8
  %107 = icmp eq i32 %106, 1
  br i1 %107, label %108, label %120

108:                                              ; preds = %103
  %109 = load ptr, ptr %8, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 0
  store i32 1, ptr %110, align 8
  %111 = load ptr, ptr %6, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = load ptr, ptr %7, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 1
  %116 = load double, ptr %115, align 8
  %117 = call double @pow(double noundef %113, double noundef %116) #7
  %118 = load ptr, ptr %8, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 1
  store double %117, ptr %119, align 8
  br label %1570

120:                                              ; preds = %103, %98
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  %123 = load i32, ptr %122, align 8
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %143

125:                                              ; preds = %120
  %126 = load ptr, ptr %7, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 0
  %128 = load i32, ptr %127, align 8
  %129 = icmp eq i32 %128, 1
  br i1 %129, label %130, label %143

130:                                              ; preds = %125
  %131 = load ptr, ptr %8, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 0
  store i32 1, ptr %132, align 8
  %133 = load ptr, ptr %6, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 1
  %135 = load i32, ptr %134, align 8
  %136 = sitofp i32 %135 to double
  %137 = load ptr, ptr %7, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 1
  %139 = load double, ptr %138, align 8
  %140 = call double @pow(double noundef %136, double noundef %139) #7
  %141 = load ptr, ptr %8, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 1
  store double %140, ptr %142, align 8
  br label %1569

143:                                              ; preds = %125, %120
  %144 = load ptr, ptr %6, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp eq i32 %146, 1
  br i1 %147, label %148, label %166

148:                                              ; preds = %143
  %149 = load ptr, ptr %7, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 0
  %151 = load i32, ptr %150, align 8
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %166

153:                                              ; preds = %148
  %154 = load ptr, ptr %8, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 0
  store i32 1, ptr %155, align 8
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load double, ptr %157, align 8
  %159 = load ptr, ptr %7, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  %161 = load i32, ptr %160, align 8
  %162 = sitofp i32 %161 to double
  %163 = call double @pow(double noundef %158, double noundef %162) #7
  %164 = load ptr, ptr %8, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 1
  store double %163, ptr %165, align 8
  br label %1568

166:                                              ; preds = %148, %143
  %167 = load ptr, ptr %6, align 8
  %168 = getelementptr inbounds %struct.CalcLangVal, ptr %167, i32 0, i32 0
  %169 = load i32, ptr %168, align 8
  %170 = icmp eq i32 %169, 2
  br i1 %170, label %171, label %189

171:                                              ; preds = %166
  %172 = load ptr, ptr %7, align 8
  %173 = getelementptr inbounds %struct.CalcLangVal, ptr %172, i32 0, i32 0
  %174 = load i32, ptr %173, align 8
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %189

176:                                              ; preds = %171
  %177 = load ptr, ptr %8, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 0
  store i32 2, ptr %178, align 8
  %179 = load ptr, ptr %6, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load double, ptr %180, align 8
  %182 = load ptr, ptr %7, align 8
  %183 = getelementptr inbounds %struct.CalcLangVal, ptr %182, i32 0, i32 1
  %184 = load i32, ptr %183, align 8
  %185 = sitofp i32 %184 to double
  %186 = call double @pow(double noundef %181, double noundef %185) #7
  %187 = load ptr, ptr %8, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 1
  store double %186, ptr %188, align 8
  br label %1567

189:                                              ; preds = %171, %166
  %190 = load ptr, ptr %6, align 8
  %191 = getelementptr inbounds %struct.CalcLangVal, ptr %190, i32 0, i32 0
  %192 = load i32, ptr %191, align 8
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %212

194:                                              ; preds = %189
  %195 = load ptr, ptr %7, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 0
  %197 = load i32, ptr %196, align 8
  %198 = icmp eq i32 %197, 2
  br i1 %198, label %199, label %212

199:                                              ; preds = %194
  %200 = load ptr, ptr %8, align 8
  %201 = getelementptr inbounds %struct.CalcLangVal, ptr %200, i32 0, i32 0
  store i32 2, ptr %201, align 8
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  %204 = load i32, ptr %203, align 8
  %205 = sitofp i32 %204 to double
  %206 = load ptr, ptr %7, align 8
  %207 = getelementptr inbounds %struct.CalcLangVal, ptr %206, i32 0, i32 1
  %208 = load double, ptr %207, align 8
  %209 = call double @pow(double noundef %205, double noundef %208) #7
  %210 = load ptr, ptr %8, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 1
  store double %209, ptr %211, align 8
  br label %1566

212:                                              ; preds = %194, %189
  %213 = load ptr, ptr %6, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 0
  %215 = load i32, ptr %214, align 8
  %216 = icmp eq i32 %215, 1
  br i1 %216, label %217, label %234

217:                                              ; preds = %212
  %218 = load ptr, ptr %7, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 0
  %220 = load i32, ptr %219, align 8
  %221 = icmp eq i32 %220, 2
  br i1 %221, label %222, label %234

222:                                              ; preds = %217
  %223 = load ptr, ptr %8, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 0
  store i32 2, ptr %224, align 8
  %225 = load ptr, ptr %6, align 8
  %226 = getelementptr inbounds %struct.CalcLangVal, ptr %225, i32 0, i32 1
  %227 = load double, ptr %226, align 8
  %228 = load ptr, ptr %7, align 8
  %229 = getelementptr inbounds %struct.CalcLangVal, ptr %228, i32 0, i32 1
  %230 = load double, ptr %229, align 8
  %231 = call double @pow(double noundef %227, double noundef %230) #7
  %232 = load ptr, ptr %8, align 8
  %233 = getelementptr inbounds %struct.CalcLangVal, ptr %232, i32 0, i32 1
  store double %231, ptr %233, align 8
  br label %1565

234:                                              ; preds = %217, %212
  %235 = load ptr, ptr %6, align 8
  %236 = getelementptr inbounds %struct.CalcLangVal, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %236, align 8
  %238 = icmp eq i32 %237, 2
  br i1 %238, label %239, label %256

239:                                              ; preds = %234
  %240 = load ptr, ptr %7, align 8
  %241 = getelementptr inbounds %struct.CalcLangVal, ptr %240, i32 0, i32 0
  %242 = load i32, ptr %241, align 8
  %243 = icmp eq i32 %242, 1
  br i1 %243, label %244, label %256

244:                                              ; preds = %239
  %245 = load ptr, ptr %8, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 0
  store i32 2, ptr %246, align 8
  %247 = load ptr, ptr %6, align 8
  %248 = getelementptr inbounds %struct.CalcLangVal, ptr %247, i32 0, i32 1
  %249 = load double, ptr %248, align 8
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds %struct.CalcLangVal, ptr %250, i32 0, i32 1
  %252 = load double, ptr %251, align 8
  %253 = call double @pow(double noundef %249, double noundef %252) #7
  %254 = load ptr, ptr %8, align 8
  %255 = getelementptr inbounds %struct.CalcLangVal, ptr %254, i32 0, i32 1
  store double %253, ptr %255, align 8
  br label %1564

256:                                              ; preds = %239, %234
  %257 = load ptr, ptr %6, align 8
  %258 = getelementptr inbounds %struct.CalcLangVal, ptr %257, i32 0, i32 0
  %259 = load i32, ptr %258, align 8
  %260 = icmp eq i32 %259, 3
  br i1 %260, label %261, label %279

261:                                              ; preds = %256
  %262 = load ptr, ptr %7, align 8
  %263 = getelementptr inbounds %struct.CalcLangVal, ptr %262, i32 0, i32 0
  %264 = load i32, ptr %263, align 8
  %265 = icmp eq i32 %264, 0
  br i1 %265, label %266, label %279

266:                                              ; preds = %261
  %267 = load ptr, ptr %8, align 8
  %268 = getelementptr inbounds %struct.CalcLangVal, ptr %267, i32 0, i32 0
  store i32 3, ptr %268, align 8
  %269 = load ptr, ptr %6, align 8
  %270 = getelementptr inbounds %struct.CalcLangVal, ptr %269, i32 0, i32 1
  %271 = load double, ptr %270, align 8
  %272 = load ptr, ptr %7, align 8
  %273 = getelementptr inbounds %struct.CalcLangVal, ptr %272, i32 0, i32 1
  %274 = load i32, ptr %273, align 8
  %275 = sitofp i32 %274 to double
  %276 = call double @pow(double noundef %271, double noundef %275) #7
  %277 = load ptr, ptr %8, align 8
  %278 = getelementptr inbounds %struct.CalcLangVal, ptr %277, i32 0, i32 1
  store double %276, ptr %278, align 8
  br label %1563

279:                                              ; preds = %261, %256
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds %struct.CalcLangVal, ptr %280, i32 0, i32 0
  %282 = load i32, ptr %281, align 8
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %302

284:                                              ; preds = %279
  %285 = load ptr, ptr %7, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 0
  %287 = load i32, ptr %286, align 8
  %288 = icmp eq i32 %287, 3
  br i1 %288, label %289, label %302

289:                                              ; preds = %284
  %290 = load ptr, ptr %8, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 0
  store i32 3, ptr %291, align 8
  %292 = load ptr, ptr %6, align 8
  %293 = getelementptr inbounds %struct.CalcLangVal, ptr %292, i32 0, i32 1
  %294 = load i32, ptr %293, align 8
  %295 = sitofp i32 %294 to double
  %296 = load ptr, ptr %7, align 8
  %297 = getelementptr inbounds %struct.CalcLangVal, ptr %296, i32 0, i32 1
  %298 = load double, ptr %297, align 8
  %299 = call double @pow(double noundef %295, double noundef %298) #7
  %300 = load ptr, ptr %8, align 8
  %301 = getelementptr inbounds %struct.CalcLangVal, ptr %300, i32 0, i32 1
  store double %299, ptr %301, align 8
  br label %1562

302:                                              ; preds = %284, %279
  %303 = load ptr, ptr %6, align 8
  %304 = getelementptr inbounds %struct.CalcLangVal, ptr %303, i32 0, i32 0
  %305 = load i32, ptr %304, align 8
  %306 = icmp eq i32 %305, 1
  br i1 %306, label %307, label %324

307:                                              ; preds = %302
  %308 = load ptr, ptr %7, align 8
  %309 = getelementptr inbounds %struct.CalcLangVal, ptr %308, i32 0, i32 0
  %310 = load i32, ptr %309, align 8
  %311 = icmp eq i32 %310, 3
  br i1 %311, label %312, label %324

312:                                              ; preds = %307
  %313 = load ptr, ptr %8, align 8
  %314 = getelementptr inbounds %struct.CalcLangVal, ptr %313, i32 0, i32 0
  store i32 3, ptr %314, align 8
  %315 = load ptr, ptr %6, align 8
  %316 = getelementptr inbounds %struct.CalcLangVal, ptr %315, i32 0, i32 1
  %317 = load double, ptr %316, align 8
  %318 = load ptr, ptr %7, align 8
  %319 = getelementptr inbounds %struct.CalcLangVal, ptr %318, i32 0, i32 1
  %320 = load double, ptr %319, align 8
  %321 = call double @pow(double noundef %317, double noundef %320) #7
  %322 = load ptr, ptr %8, align 8
  %323 = getelementptr inbounds %struct.CalcLangVal, ptr %322, i32 0, i32 1
  store double %321, ptr %323, align 8
  br label %1561

324:                                              ; preds = %307, %302
  %325 = load ptr, ptr %6, align 8
  %326 = getelementptr inbounds %struct.CalcLangVal, ptr %325, i32 0, i32 0
  %327 = load i32, ptr %326, align 8
  %328 = icmp eq i32 %327, 3
  br i1 %328, label %329, label %346

329:                                              ; preds = %324
  %330 = load ptr, ptr %7, align 8
  %331 = getelementptr inbounds %struct.CalcLangVal, ptr %330, i32 0, i32 0
  %332 = load i32, ptr %331, align 8
  %333 = icmp eq i32 %332, 1
  br i1 %333, label %334, label %346

334:                                              ; preds = %329
  %335 = load ptr, ptr %8, align 8
  %336 = getelementptr inbounds %struct.CalcLangVal, ptr %335, i32 0, i32 0
  store i32 3, ptr %336, align 8
  %337 = load ptr, ptr %6, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 1
  %339 = load double, ptr %338, align 8
  %340 = load ptr, ptr %7, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 1
  %342 = load double, ptr %341, align 8
  %343 = call double @pow(double noundef %339, double noundef %342) #7
  %344 = load ptr, ptr %8, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 1
  store double %343, ptr %345, align 8
  br label %1560

346:                                              ; preds = %329, %324
  %347 = load ptr, ptr %6, align 8
  %348 = getelementptr inbounds %struct.CalcLangVal, ptr %347, i32 0, i32 0
  %349 = load i32, ptr %348, align 8
  %350 = icmp eq i32 %349, 3
  br i1 %350, label %351, label %368

351:                                              ; preds = %346
  %352 = load ptr, ptr %7, align 8
  %353 = getelementptr inbounds %struct.CalcLangVal, ptr %352, i32 0, i32 0
  %354 = load i32, ptr %353, align 8
  %355 = icmp eq i32 %354, 3
  br i1 %355, label %356, label %368

356:                                              ; preds = %351
  %357 = load ptr, ptr %8, align 8
  %358 = getelementptr inbounds %struct.CalcLangVal, ptr %357, i32 0, i32 0
  store i32 3, ptr %358, align 8
  %359 = load ptr, ptr %6, align 8
  %360 = getelementptr inbounds %struct.CalcLangVal, ptr %359, i32 0, i32 1
  %361 = load double, ptr %360, align 8
  %362 = load ptr, ptr %7, align 8
  %363 = getelementptr inbounds %struct.CalcLangVal, ptr %362, i32 0, i32 1
  %364 = load double, ptr %363, align 8
  %365 = call double @pow(double noundef %361, double noundef %364) #7
  %366 = load ptr, ptr %8, align 8
  %367 = getelementptr inbounds %struct.CalcLangVal, ptr %366, i32 0, i32 1
  store double %365, ptr %367, align 8
  br label %1559

368:                                              ; preds = %351, %346
  %369 = load ptr, ptr %6, align 8
  %370 = getelementptr inbounds %struct.CalcLangVal, ptr %369, i32 0, i32 0
  %371 = load i32, ptr %370, align 8
  %372 = icmp eq i32 %371, 6
  br i1 %372, label %373, label %450

373:                                              ; preds = %368
  %374 = load ptr, ptr %7, align 8
  %375 = getelementptr inbounds %struct.CalcLangVal, ptr %374, i32 0, i32 0
  %376 = load i32, ptr %375, align 8
  %377 = icmp eq i32 %376, 6
  br i1 %377, label %378, label %450

378:                                              ; preds = %373
  %379 = load ptr, ptr %6, align 8
  %380 = getelementptr inbounds %struct.CalcLangVal, ptr %379, i32 0, i32 1
  %381 = load ptr, ptr %380, align 8
  store ptr %381, ptr %9, align 8
  %382 = load ptr, ptr %7, align 8
  %383 = getelementptr inbounds %struct.CalcLangVal, ptr %382, i32 0, i32 1
  %384 = load ptr, ptr %383, align 8
  store ptr %384, ptr %10, align 8
  %385 = load ptr, ptr %10, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = load ptr, ptr %9, align 8
  %389 = getelementptr inbounds %struct.TupleValue, ptr %388, i32 0, i32 0
  %390 = load i32, ptr %389, align 8
  %391 = icmp eq i32 %387, %390
  br i1 %391, label %392, label %448

392:                                              ; preds = %378
  %393 = load ptr, ptr %5, align 8
  %394 = call ptr @arenaAlloc(ptr noundef %393, i32 noundef 16)
  store ptr %394, ptr %11, align 8
  %395 = load ptr, ptr %9, align 8
  %396 = getelementptr inbounds %struct.TupleValue, ptr %395, i32 0, i32 0
  %397 = load i32, ptr %396, align 8
  %398 = load ptr, ptr %11, align 8
  %399 = getelementptr inbounds %struct.TupleValue, ptr %398, i32 0, i32 0
  store i32 %397, ptr %399, align 8
  %400 = load ptr, ptr %5, align 8
  %401 = load ptr, ptr %11, align 8
  %402 = getelementptr inbounds %struct.TupleValue, ptr %401, i32 0, i32 0
  %403 = load i32, ptr %402, align 8
  %404 = sext i32 %403 to i64
  %405 = mul i64 8, %404
  %406 = trunc i64 %405 to i32
  %407 = call ptr @arenaAlloc(ptr noundef %400, i32 noundef %406)
  %408 = load ptr, ptr %11, align 8
  %409 = getelementptr inbounds %struct.TupleValue, ptr %408, i32 0, i32 1
  store ptr %407, ptr %409, align 8
  store i32 0, ptr %12, align 4
  br label %410

410:                                              ; preds = %439, %392
  %411 = load i32, ptr %12, align 4
  %412 = load ptr, ptr %9, align 8
  %413 = getelementptr inbounds %struct.TupleValue, ptr %412, i32 0, i32 0
  %414 = load i32, ptr %413, align 8
  %415 = icmp slt i32 %411, %414
  br i1 %415, label %416, label %442

416:                                              ; preds = %410
  %417 = load ptr, ptr %5, align 8
  %418 = load ptr, ptr %9, align 8
  %419 = getelementptr inbounds %struct.TupleValue, ptr %418, i32 0, i32 1
  %420 = load ptr, ptr %419, align 8
  %421 = load i32, ptr %12, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds ptr, ptr %420, i64 %422
  %424 = load ptr, ptr %423, align 8
  %425 = load ptr, ptr %10, align 8
  %426 = getelementptr inbounds %struct.TupleValue, ptr %425, i32 0, i32 1
  %427 = load ptr, ptr %426, align 8
  %428 = load i32, ptr %12, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds ptr, ptr %427, i64 %429
  %431 = load ptr, ptr %430, align 8
  %432 = call ptr @multCalcLangValues(ptr noundef %417, ptr noundef %424, ptr noundef %431)
  %433 = load ptr, ptr %11, align 8
  %434 = getelementptr inbounds %struct.TupleValue, ptr %433, i32 0, i32 1
  %435 = load ptr, ptr %434, align 8
  %436 = load i32, ptr %12, align 4
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds ptr, ptr %435, i64 %437
  store ptr %432, ptr %438, align 8
  br label %439

439:                                              ; preds = %416
  %440 = load i32, ptr %12, align 4
  %441 = add nsw i32 %440, 1
  store i32 %441, ptr %12, align 4
  br label %410, !llvm.loop !80

442:                                              ; preds = %410
  %443 = load ptr, ptr %8, align 8
  %444 = getelementptr inbounds %struct.CalcLangVal, ptr %443, i32 0, i32 0
  store i32 6, ptr %444, align 8
  %445 = load ptr, ptr %11, align 8
  %446 = load ptr, ptr %8, align 8
  %447 = getelementptr inbounds %struct.CalcLangVal, ptr %446, i32 0, i32 1
  store ptr %445, ptr %447, align 8
  br label %449

448:                                              ; preds = %378
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1573

449:                                              ; preds = %442
  br label %1558

450:                                              ; preds = %373, %368
  %451 = load ptr, ptr %6, align 8
  %452 = getelementptr inbounds %struct.CalcLangVal, ptr %451, i32 0, i32 0
  %453 = load i32, ptr %452, align 8
  %454 = icmp eq i32 %453, 6
  br i1 %454, label %455, label %513

455:                                              ; preds = %450
  %456 = load ptr, ptr %7, align 8
  %457 = getelementptr inbounds %struct.CalcLangVal, ptr %456, i32 0, i32 0
  %458 = load i32, ptr %457, align 8
  %459 = icmp eq i32 %458, 0
  br i1 %459, label %460, label %513

460:                                              ; preds = %455
  %461 = load ptr, ptr %6, align 8
  %462 = getelementptr inbounds %struct.CalcLangVal, ptr %461, i32 0, i32 1
  %463 = load ptr, ptr %462, align 8
  store ptr %463, ptr %13, align 8
  %464 = load ptr, ptr %5, align 8
  %465 = call ptr @arenaAlloc(ptr noundef %464, i32 noundef 16)
  store ptr %465, ptr %14, align 8
  %466 = load ptr, ptr %13, align 8
  %467 = getelementptr inbounds %struct.TupleValue, ptr %466, i32 0, i32 0
  %468 = load i32, ptr %467, align 8
  %469 = load ptr, ptr %14, align 8
  %470 = getelementptr inbounds %struct.TupleValue, ptr %469, i32 0, i32 0
  store i32 %468, ptr %470, align 8
  %471 = load ptr, ptr %5, align 8
  %472 = load ptr, ptr %14, align 8
  %473 = getelementptr inbounds %struct.TupleValue, ptr %472, i32 0, i32 0
  %474 = load i32, ptr %473, align 8
  %475 = sext i32 %474 to i64
  %476 = mul i64 8, %475
  %477 = trunc i64 %476 to i32
  %478 = call ptr @arenaAlloc(ptr noundef %471, i32 noundef %477)
  %479 = load ptr, ptr %14, align 8
  %480 = getelementptr inbounds %struct.TupleValue, ptr %479, i32 0, i32 1
  store ptr %478, ptr %480, align 8
  store i32 0, ptr %15, align 4
  br label %481

481:                                              ; preds = %504, %460
  %482 = load i32, ptr %15, align 4
  %483 = load ptr, ptr %13, align 8
  %484 = getelementptr inbounds %struct.TupleValue, ptr %483, i32 0, i32 0
  %485 = load i32, ptr %484, align 8
  %486 = icmp slt i32 %482, %485
  br i1 %486, label %487, label %507

487:                                              ; preds = %481
  %488 = load ptr, ptr %5, align 8
  %489 = load ptr, ptr %13, align 8
  %490 = getelementptr inbounds %struct.TupleValue, ptr %489, i32 0, i32 1
  %491 = load ptr, ptr %490, align 8
  %492 = load i32, ptr %15, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds ptr, ptr %491, i64 %493
  %495 = load ptr, ptr %494, align 8
  %496 = load ptr, ptr %7, align 8
  %497 = call ptr @powCalcLangValues(ptr noundef %488, ptr noundef %495, ptr noundef %496)
  %498 = load ptr, ptr %14, align 8
  %499 = getelementptr inbounds %struct.TupleValue, ptr %498, i32 0, i32 1
  %500 = load ptr, ptr %499, align 8
  %501 = load i32, ptr %15, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds ptr, ptr %500, i64 %502
  store ptr %497, ptr %503, align 8
  br label %504

504:                                              ; preds = %487
  %505 = load i32, ptr %15, align 4
  %506 = add nsw i32 %505, 1
  store i32 %506, ptr %15, align 4
  br label %481, !llvm.loop !81

507:                                              ; preds = %481
  %508 = load ptr, ptr %8, align 8
  %509 = getelementptr inbounds %struct.CalcLangVal, ptr %508, i32 0, i32 0
  store i32 6, ptr %509, align 8
  %510 = load ptr, ptr %14, align 8
  %511 = load ptr, ptr %8, align 8
  %512 = getelementptr inbounds %struct.CalcLangVal, ptr %511, i32 0, i32 1
  store ptr %510, ptr %512, align 8
  br label %1557

513:                                              ; preds = %455, %450
  %514 = load ptr, ptr %6, align 8
  %515 = getelementptr inbounds %struct.CalcLangVal, ptr %514, i32 0, i32 0
  %516 = load i32, ptr %515, align 8
  %517 = icmp eq i32 %516, 0
  br i1 %517, label %518, label %576

518:                                              ; preds = %513
  %519 = load ptr, ptr %7, align 8
  %520 = getelementptr inbounds %struct.CalcLangVal, ptr %519, i32 0, i32 0
  %521 = load i32, ptr %520, align 8
  %522 = icmp eq i32 %521, 6
  br i1 %522, label %523, label %576

523:                                              ; preds = %518
  %524 = load ptr, ptr %7, align 8
  %525 = getelementptr inbounds %struct.CalcLangVal, ptr %524, i32 0, i32 1
  %526 = load ptr, ptr %525, align 8
  store ptr %526, ptr %16, align 8
  %527 = load ptr, ptr %5, align 8
  %528 = call ptr @arenaAlloc(ptr noundef %527, i32 noundef 16)
  store ptr %528, ptr %17, align 8
  %529 = load ptr, ptr %16, align 8
  %530 = getelementptr inbounds %struct.TupleValue, ptr %529, i32 0, i32 0
  %531 = load i32, ptr %530, align 8
  %532 = load ptr, ptr %17, align 8
  %533 = getelementptr inbounds %struct.TupleValue, ptr %532, i32 0, i32 0
  store i32 %531, ptr %533, align 8
  %534 = load ptr, ptr %5, align 8
  %535 = load ptr, ptr %17, align 8
  %536 = getelementptr inbounds %struct.TupleValue, ptr %535, i32 0, i32 0
  %537 = load i32, ptr %536, align 8
  %538 = sext i32 %537 to i64
  %539 = mul i64 8, %538
  %540 = trunc i64 %539 to i32
  %541 = call ptr @arenaAlloc(ptr noundef %534, i32 noundef %540)
  %542 = load ptr, ptr %17, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 1
  store ptr %541, ptr %543, align 8
  store i32 0, ptr %18, align 4
  br label %544

544:                                              ; preds = %567, %523
  %545 = load i32, ptr %18, align 4
  %546 = load ptr, ptr %16, align 8
  %547 = getelementptr inbounds %struct.TupleValue, ptr %546, i32 0, i32 0
  %548 = load i32, ptr %547, align 8
  %549 = icmp slt i32 %545, %548
  br i1 %549, label %550, label %570

550:                                              ; preds = %544
  %551 = load ptr, ptr %5, align 8
  %552 = load ptr, ptr %6, align 8
  %553 = load ptr, ptr %16, align 8
  %554 = getelementptr inbounds %struct.TupleValue, ptr %553, i32 0, i32 1
  %555 = load ptr, ptr %554, align 8
  %556 = load i32, ptr %18, align 4
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds ptr, ptr %555, i64 %557
  %559 = load ptr, ptr %558, align 8
  %560 = call ptr @powCalcLangValues(ptr noundef %551, ptr noundef %552, ptr noundef %559)
  %561 = load ptr, ptr %17, align 8
  %562 = getelementptr inbounds %struct.TupleValue, ptr %561, i32 0, i32 1
  %563 = load ptr, ptr %562, align 8
  %564 = load i32, ptr %18, align 4
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds ptr, ptr %563, i64 %565
  store ptr %560, ptr %566, align 8
  br label %567

567:                                              ; preds = %550
  %568 = load i32, ptr %18, align 4
  %569 = add nsw i32 %568, 1
  store i32 %569, ptr %18, align 4
  br label %544, !llvm.loop !82

570:                                              ; preds = %544
  %571 = load ptr, ptr %8, align 8
  %572 = getelementptr inbounds %struct.CalcLangVal, ptr %571, i32 0, i32 0
  store i32 6, ptr %572, align 8
  %573 = load ptr, ptr %17, align 8
  %574 = load ptr, ptr %8, align 8
  %575 = getelementptr inbounds %struct.CalcLangVal, ptr %574, i32 0, i32 1
  store ptr %573, ptr %575, align 8
  br label %1556

576:                                              ; preds = %518, %513
  %577 = load ptr, ptr %6, align 8
  %578 = getelementptr inbounds %struct.CalcLangVal, ptr %577, i32 0, i32 0
  %579 = load i32, ptr %578, align 8
  %580 = icmp eq i32 %579, 6
  br i1 %580, label %581, label %639

581:                                              ; preds = %576
  %582 = load ptr, ptr %7, align 8
  %583 = getelementptr inbounds %struct.CalcLangVal, ptr %582, i32 0, i32 0
  %584 = load i32, ptr %583, align 8
  %585 = icmp eq i32 %584, 1
  br i1 %585, label %586, label %639

586:                                              ; preds = %581
  %587 = load ptr, ptr %6, align 8
  %588 = getelementptr inbounds %struct.CalcLangVal, ptr %587, i32 0, i32 1
  %589 = load ptr, ptr %588, align 8
  store ptr %589, ptr %19, align 8
  %590 = load ptr, ptr %5, align 8
  %591 = call ptr @arenaAlloc(ptr noundef %590, i32 noundef 16)
  store ptr %591, ptr %20, align 8
  %592 = load ptr, ptr %19, align 8
  %593 = getelementptr inbounds %struct.TupleValue, ptr %592, i32 0, i32 0
  %594 = load i32, ptr %593, align 8
  %595 = load ptr, ptr %20, align 8
  %596 = getelementptr inbounds %struct.TupleValue, ptr %595, i32 0, i32 0
  store i32 %594, ptr %596, align 8
  %597 = load ptr, ptr %5, align 8
  %598 = load ptr, ptr %20, align 8
  %599 = getelementptr inbounds %struct.TupleValue, ptr %598, i32 0, i32 0
  %600 = load i32, ptr %599, align 8
  %601 = sext i32 %600 to i64
  %602 = mul i64 8, %601
  %603 = trunc i64 %602 to i32
  %604 = call ptr @arenaAlloc(ptr noundef %597, i32 noundef %603)
  %605 = load ptr, ptr %20, align 8
  %606 = getelementptr inbounds %struct.TupleValue, ptr %605, i32 0, i32 1
  store ptr %604, ptr %606, align 8
  store i32 0, ptr %21, align 4
  br label %607

607:                                              ; preds = %630, %586
  %608 = load i32, ptr %21, align 4
  %609 = load ptr, ptr %19, align 8
  %610 = getelementptr inbounds %struct.TupleValue, ptr %609, i32 0, i32 0
  %611 = load i32, ptr %610, align 8
  %612 = icmp slt i32 %608, %611
  br i1 %612, label %613, label %633

613:                                              ; preds = %607
  %614 = load ptr, ptr %5, align 8
  %615 = load ptr, ptr %19, align 8
  %616 = getelementptr inbounds %struct.TupleValue, ptr %615, i32 0, i32 1
  %617 = load ptr, ptr %616, align 8
  %618 = load i32, ptr %21, align 4
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds ptr, ptr %617, i64 %619
  %621 = load ptr, ptr %620, align 8
  %622 = load ptr, ptr %7, align 8
  %623 = call ptr @powCalcLangValues(ptr noundef %614, ptr noundef %621, ptr noundef %622)
  %624 = load ptr, ptr %20, align 8
  %625 = getelementptr inbounds %struct.TupleValue, ptr %624, i32 0, i32 1
  %626 = load ptr, ptr %625, align 8
  %627 = load i32, ptr %21, align 4
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds ptr, ptr %626, i64 %628
  store ptr %623, ptr %629, align 8
  br label %630

630:                                              ; preds = %613
  %631 = load i32, ptr %21, align 4
  %632 = add nsw i32 %631, 1
  store i32 %632, ptr %21, align 4
  br label %607, !llvm.loop !83

633:                                              ; preds = %607
  %634 = load ptr, ptr %8, align 8
  %635 = getelementptr inbounds %struct.CalcLangVal, ptr %634, i32 0, i32 0
  store i32 6, ptr %635, align 8
  %636 = load ptr, ptr %20, align 8
  %637 = load ptr, ptr %8, align 8
  %638 = getelementptr inbounds %struct.CalcLangVal, ptr %637, i32 0, i32 1
  store ptr %636, ptr %638, align 8
  br label %1555

639:                                              ; preds = %581, %576
  %640 = load ptr, ptr %6, align 8
  %641 = getelementptr inbounds %struct.CalcLangVal, ptr %640, i32 0, i32 0
  %642 = load i32, ptr %641, align 8
  %643 = icmp eq i32 %642, 1
  br i1 %643, label %644, label %702

644:                                              ; preds = %639
  %645 = load ptr, ptr %7, align 8
  %646 = getelementptr inbounds %struct.CalcLangVal, ptr %645, i32 0, i32 0
  %647 = load i32, ptr %646, align 8
  %648 = icmp eq i32 %647, 6
  br i1 %648, label %649, label %702

649:                                              ; preds = %644
  %650 = load ptr, ptr %7, align 8
  %651 = getelementptr inbounds %struct.CalcLangVal, ptr %650, i32 0, i32 1
  %652 = load ptr, ptr %651, align 8
  store ptr %652, ptr %22, align 8
  %653 = load ptr, ptr %5, align 8
  %654 = call ptr @arenaAlloc(ptr noundef %653, i32 noundef 16)
  store ptr %654, ptr %23, align 8
  %655 = load ptr, ptr %22, align 8
  %656 = getelementptr inbounds %struct.TupleValue, ptr %655, i32 0, i32 0
  %657 = load i32, ptr %656, align 8
  %658 = load ptr, ptr %23, align 8
  %659 = getelementptr inbounds %struct.TupleValue, ptr %658, i32 0, i32 0
  store i32 %657, ptr %659, align 8
  %660 = load ptr, ptr %5, align 8
  %661 = load ptr, ptr %23, align 8
  %662 = getelementptr inbounds %struct.TupleValue, ptr %661, i32 0, i32 0
  %663 = load i32, ptr %662, align 8
  %664 = sext i32 %663 to i64
  %665 = mul i64 8, %664
  %666 = trunc i64 %665 to i32
  %667 = call ptr @arenaAlloc(ptr noundef %660, i32 noundef %666)
  %668 = load ptr, ptr %23, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  store ptr %667, ptr %669, align 8
  store i32 0, ptr %24, align 4
  br label %670

670:                                              ; preds = %693, %649
  %671 = load i32, ptr %24, align 4
  %672 = load ptr, ptr %22, align 8
  %673 = getelementptr inbounds %struct.TupleValue, ptr %672, i32 0, i32 0
  %674 = load i32, ptr %673, align 8
  %675 = icmp slt i32 %671, %674
  br i1 %675, label %676, label %696

676:                                              ; preds = %670
  %677 = load ptr, ptr %5, align 8
  %678 = load ptr, ptr %6, align 8
  %679 = load ptr, ptr %22, align 8
  %680 = getelementptr inbounds %struct.TupleValue, ptr %679, i32 0, i32 1
  %681 = load ptr, ptr %680, align 8
  %682 = load i32, ptr %24, align 4
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds ptr, ptr %681, i64 %683
  %685 = load ptr, ptr %684, align 8
  %686 = call ptr @powCalcLangValues(ptr noundef %677, ptr noundef %678, ptr noundef %685)
  %687 = load ptr, ptr %23, align 8
  %688 = getelementptr inbounds %struct.TupleValue, ptr %687, i32 0, i32 1
  %689 = load ptr, ptr %688, align 8
  %690 = load i32, ptr %24, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds ptr, ptr %689, i64 %691
  store ptr %686, ptr %692, align 8
  br label %693

693:                                              ; preds = %676
  %694 = load i32, ptr %24, align 4
  %695 = add nsw i32 %694, 1
  store i32 %695, ptr %24, align 4
  br label %670, !llvm.loop !84

696:                                              ; preds = %670
  %697 = load ptr, ptr %8, align 8
  %698 = getelementptr inbounds %struct.CalcLangVal, ptr %697, i32 0, i32 0
  store i32 6, ptr %698, align 8
  %699 = load ptr, ptr %23, align 8
  %700 = load ptr, ptr %8, align 8
  %701 = getelementptr inbounds %struct.CalcLangVal, ptr %700, i32 0, i32 1
  store ptr %699, ptr %701, align 8
  br label %1554

702:                                              ; preds = %644, %639
  %703 = load ptr, ptr %6, align 8
  %704 = getelementptr inbounds %struct.CalcLangVal, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = icmp eq i32 %705, 6
  br i1 %706, label %707, label %765

707:                                              ; preds = %702
  %708 = load ptr, ptr %7, align 8
  %709 = getelementptr inbounds %struct.CalcLangVal, ptr %708, i32 0, i32 0
  %710 = load i32, ptr %709, align 8
  %711 = icmp eq i32 %710, 2
  br i1 %711, label %712, label %765

712:                                              ; preds = %707
  %713 = load ptr, ptr %6, align 8
  %714 = getelementptr inbounds %struct.CalcLangVal, ptr %713, i32 0, i32 1
  %715 = load ptr, ptr %714, align 8
  store ptr %715, ptr %25, align 8
  %716 = load ptr, ptr %5, align 8
  %717 = call ptr @arenaAlloc(ptr noundef %716, i32 noundef 16)
  store ptr %717, ptr %26, align 8
  %718 = load ptr, ptr %25, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 0
  %720 = load i32, ptr %719, align 8
  %721 = load ptr, ptr %26, align 8
  %722 = getelementptr inbounds %struct.TupleValue, ptr %721, i32 0, i32 0
  store i32 %720, ptr %722, align 8
  %723 = load ptr, ptr %5, align 8
  %724 = load ptr, ptr %26, align 8
  %725 = getelementptr inbounds %struct.TupleValue, ptr %724, i32 0, i32 0
  %726 = load i32, ptr %725, align 8
  %727 = sext i32 %726 to i64
  %728 = mul i64 8, %727
  %729 = trunc i64 %728 to i32
  %730 = call ptr @arenaAlloc(ptr noundef %723, i32 noundef %729)
  %731 = load ptr, ptr %26, align 8
  %732 = getelementptr inbounds %struct.TupleValue, ptr %731, i32 0, i32 1
  store ptr %730, ptr %732, align 8
  store i32 0, ptr %27, align 4
  br label %733

733:                                              ; preds = %756, %712
  %734 = load i32, ptr %27, align 4
  %735 = load ptr, ptr %25, align 8
  %736 = getelementptr inbounds %struct.TupleValue, ptr %735, i32 0, i32 0
  %737 = load i32, ptr %736, align 8
  %738 = icmp slt i32 %734, %737
  br i1 %738, label %739, label %759

739:                                              ; preds = %733
  %740 = load ptr, ptr %5, align 8
  %741 = load ptr, ptr %25, align 8
  %742 = getelementptr inbounds %struct.TupleValue, ptr %741, i32 0, i32 1
  %743 = load ptr, ptr %742, align 8
  %744 = load i32, ptr %27, align 4
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds ptr, ptr %743, i64 %745
  %747 = load ptr, ptr %746, align 8
  %748 = load ptr, ptr %7, align 8
  %749 = call ptr @powCalcLangValues(ptr noundef %740, ptr noundef %747, ptr noundef %748)
  %750 = load ptr, ptr %26, align 8
  %751 = getelementptr inbounds %struct.TupleValue, ptr %750, i32 0, i32 1
  %752 = load ptr, ptr %751, align 8
  %753 = load i32, ptr %27, align 4
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds ptr, ptr %752, i64 %754
  store ptr %749, ptr %755, align 8
  br label %756

756:                                              ; preds = %739
  %757 = load i32, ptr %27, align 4
  %758 = add nsw i32 %757, 1
  store i32 %758, ptr %27, align 4
  br label %733, !llvm.loop !85

759:                                              ; preds = %733
  %760 = load ptr, ptr %8, align 8
  %761 = getelementptr inbounds %struct.CalcLangVal, ptr %760, i32 0, i32 0
  store i32 6, ptr %761, align 8
  %762 = load ptr, ptr %26, align 8
  %763 = load ptr, ptr %8, align 8
  %764 = getelementptr inbounds %struct.CalcLangVal, ptr %763, i32 0, i32 1
  store ptr %762, ptr %764, align 8
  br label %1553

765:                                              ; preds = %707, %702
  %766 = load ptr, ptr %6, align 8
  %767 = getelementptr inbounds %struct.CalcLangVal, ptr %766, i32 0, i32 0
  %768 = load i32, ptr %767, align 8
  %769 = icmp eq i32 %768, 2
  br i1 %769, label %770, label %828

770:                                              ; preds = %765
  %771 = load ptr, ptr %7, align 8
  %772 = getelementptr inbounds %struct.CalcLangVal, ptr %771, i32 0, i32 0
  %773 = load i32, ptr %772, align 8
  %774 = icmp eq i32 %773, 6
  br i1 %774, label %775, label %828

775:                                              ; preds = %770
  %776 = load ptr, ptr %7, align 8
  %777 = getelementptr inbounds %struct.CalcLangVal, ptr %776, i32 0, i32 1
  %778 = load ptr, ptr %777, align 8
  store ptr %778, ptr %28, align 8
  %779 = load ptr, ptr %5, align 8
  %780 = call ptr @arenaAlloc(ptr noundef %779, i32 noundef 16)
  store ptr %780, ptr %29, align 8
  %781 = load ptr, ptr %28, align 8
  %782 = getelementptr inbounds %struct.TupleValue, ptr %781, i32 0, i32 0
  %783 = load i32, ptr %782, align 8
  %784 = load ptr, ptr %29, align 8
  %785 = getelementptr inbounds %struct.TupleValue, ptr %784, i32 0, i32 0
  store i32 %783, ptr %785, align 8
  %786 = load ptr, ptr %5, align 8
  %787 = load ptr, ptr %29, align 8
  %788 = getelementptr inbounds %struct.TupleValue, ptr %787, i32 0, i32 0
  %789 = load i32, ptr %788, align 8
  %790 = sext i32 %789 to i64
  %791 = mul i64 8, %790
  %792 = trunc i64 %791 to i32
  %793 = call ptr @arenaAlloc(ptr noundef %786, i32 noundef %792)
  %794 = load ptr, ptr %29, align 8
  %795 = getelementptr inbounds %struct.TupleValue, ptr %794, i32 0, i32 1
  store ptr %793, ptr %795, align 8
  store i32 0, ptr %30, align 4
  br label %796

796:                                              ; preds = %819, %775
  %797 = load i32, ptr %30, align 4
  %798 = load ptr, ptr %28, align 8
  %799 = getelementptr inbounds %struct.TupleValue, ptr %798, i32 0, i32 0
  %800 = load i32, ptr %799, align 8
  %801 = icmp slt i32 %797, %800
  br i1 %801, label %802, label %822

802:                                              ; preds = %796
  %803 = load ptr, ptr %5, align 8
  %804 = load ptr, ptr %6, align 8
  %805 = load ptr, ptr %28, align 8
  %806 = getelementptr inbounds %struct.TupleValue, ptr %805, i32 0, i32 1
  %807 = load ptr, ptr %806, align 8
  %808 = load i32, ptr %30, align 4
  %809 = sext i32 %808 to i64
  %810 = getelementptr inbounds ptr, ptr %807, i64 %809
  %811 = load ptr, ptr %810, align 8
  %812 = call ptr @powCalcLangValues(ptr noundef %803, ptr noundef %804, ptr noundef %811)
  %813 = load ptr, ptr %29, align 8
  %814 = getelementptr inbounds %struct.TupleValue, ptr %813, i32 0, i32 1
  %815 = load ptr, ptr %814, align 8
  %816 = load i32, ptr %30, align 4
  %817 = sext i32 %816 to i64
  %818 = getelementptr inbounds ptr, ptr %815, i64 %817
  store ptr %812, ptr %818, align 8
  br label %819

819:                                              ; preds = %802
  %820 = load i32, ptr %30, align 4
  %821 = add nsw i32 %820, 1
  store i32 %821, ptr %30, align 4
  br label %796, !llvm.loop !86

822:                                              ; preds = %796
  %823 = load ptr, ptr %8, align 8
  %824 = getelementptr inbounds %struct.CalcLangVal, ptr %823, i32 0, i32 0
  store i32 6, ptr %824, align 8
  %825 = load ptr, ptr %29, align 8
  %826 = load ptr, ptr %8, align 8
  %827 = getelementptr inbounds %struct.CalcLangVal, ptr %826, i32 0, i32 1
  store ptr %825, ptr %827, align 8
  br label %1552

828:                                              ; preds = %770, %765
  %829 = load ptr, ptr %6, align 8
  %830 = getelementptr inbounds %struct.CalcLangVal, ptr %829, i32 0, i32 0
  %831 = load i32, ptr %830, align 8
  %832 = icmp eq i32 %831, 6
  br i1 %832, label %833, label %891

833:                                              ; preds = %828
  %834 = load ptr, ptr %7, align 8
  %835 = getelementptr inbounds %struct.CalcLangVal, ptr %834, i32 0, i32 0
  %836 = load i32, ptr %835, align 8
  %837 = icmp eq i32 %836, 3
  br i1 %837, label %838, label %891

838:                                              ; preds = %833
  %839 = load ptr, ptr %6, align 8
  %840 = getelementptr inbounds %struct.CalcLangVal, ptr %839, i32 0, i32 1
  %841 = load ptr, ptr %840, align 8
  store ptr %841, ptr %31, align 8
  %842 = load ptr, ptr %5, align 8
  %843 = call ptr @arenaAlloc(ptr noundef %842, i32 noundef 16)
  store ptr %843, ptr %32, align 8
  %844 = load ptr, ptr %31, align 8
  %845 = getelementptr inbounds %struct.TupleValue, ptr %844, i32 0, i32 0
  %846 = load i32, ptr %845, align 8
  %847 = load ptr, ptr %32, align 8
  %848 = getelementptr inbounds %struct.TupleValue, ptr %847, i32 0, i32 0
  store i32 %846, ptr %848, align 8
  %849 = load ptr, ptr %5, align 8
  %850 = load ptr, ptr %32, align 8
  %851 = getelementptr inbounds %struct.TupleValue, ptr %850, i32 0, i32 0
  %852 = load i32, ptr %851, align 8
  %853 = sext i32 %852 to i64
  %854 = mul i64 8, %853
  %855 = trunc i64 %854 to i32
  %856 = call ptr @arenaAlloc(ptr noundef %849, i32 noundef %855)
  %857 = load ptr, ptr %32, align 8
  %858 = getelementptr inbounds %struct.TupleValue, ptr %857, i32 0, i32 1
  store ptr %856, ptr %858, align 8
  store i32 0, ptr %33, align 4
  br label %859

859:                                              ; preds = %882, %838
  %860 = load i32, ptr %33, align 4
  %861 = load ptr, ptr %31, align 8
  %862 = getelementptr inbounds %struct.TupleValue, ptr %861, i32 0, i32 0
  %863 = load i32, ptr %862, align 8
  %864 = icmp slt i32 %860, %863
  br i1 %864, label %865, label %885

865:                                              ; preds = %859
  %866 = load ptr, ptr %5, align 8
  %867 = load ptr, ptr %31, align 8
  %868 = getelementptr inbounds %struct.TupleValue, ptr %867, i32 0, i32 1
  %869 = load ptr, ptr %868, align 8
  %870 = load i32, ptr %33, align 4
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds ptr, ptr %869, i64 %871
  %873 = load ptr, ptr %872, align 8
  %874 = load ptr, ptr %7, align 8
  %875 = call ptr @powCalcLangValues(ptr noundef %866, ptr noundef %873, ptr noundef %874)
  %876 = load ptr, ptr %32, align 8
  %877 = getelementptr inbounds %struct.TupleValue, ptr %876, i32 0, i32 1
  %878 = load ptr, ptr %877, align 8
  %879 = load i32, ptr %33, align 4
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds ptr, ptr %878, i64 %880
  store ptr %875, ptr %881, align 8
  br label %882

882:                                              ; preds = %865
  %883 = load i32, ptr %33, align 4
  %884 = add nsw i32 %883, 1
  store i32 %884, ptr %33, align 4
  br label %859, !llvm.loop !87

885:                                              ; preds = %859
  %886 = load ptr, ptr %8, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 0
  store i32 6, ptr %887, align 8
  %888 = load ptr, ptr %32, align 8
  %889 = load ptr, ptr %8, align 8
  %890 = getelementptr inbounds %struct.CalcLangVal, ptr %889, i32 0, i32 1
  store ptr %888, ptr %890, align 8
  br label %1551

891:                                              ; preds = %833, %828
  %892 = load ptr, ptr %6, align 8
  %893 = getelementptr inbounds %struct.CalcLangVal, ptr %892, i32 0, i32 0
  %894 = load i32, ptr %893, align 8
  %895 = icmp eq i32 %894, 3
  br i1 %895, label %896, label %954

896:                                              ; preds = %891
  %897 = load ptr, ptr %7, align 8
  %898 = getelementptr inbounds %struct.CalcLangVal, ptr %897, i32 0, i32 0
  %899 = load i32, ptr %898, align 8
  %900 = icmp eq i32 %899, 6
  br i1 %900, label %901, label %954

901:                                              ; preds = %896
  %902 = load ptr, ptr %7, align 8
  %903 = getelementptr inbounds %struct.CalcLangVal, ptr %902, i32 0, i32 1
  %904 = load ptr, ptr %903, align 8
  store ptr %904, ptr %34, align 8
  %905 = load ptr, ptr %5, align 8
  %906 = call ptr @arenaAlloc(ptr noundef %905, i32 noundef 16)
  store ptr %906, ptr %35, align 8
  %907 = load ptr, ptr %34, align 8
  %908 = getelementptr inbounds %struct.TupleValue, ptr %907, i32 0, i32 0
  %909 = load i32, ptr %908, align 8
  %910 = load ptr, ptr %35, align 8
  %911 = getelementptr inbounds %struct.TupleValue, ptr %910, i32 0, i32 0
  store i32 %909, ptr %911, align 8
  %912 = load ptr, ptr %5, align 8
  %913 = load ptr, ptr %35, align 8
  %914 = getelementptr inbounds %struct.TupleValue, ptr %913, i32 0, i32 0
  %915 = load i32, ptr %914, align 8
  %916 = sext i32 %915 to i64
  %917 = mul i64 8, %916
  %918 = trunc i64 %917 to i32
  %919 = call ptr @arenaAlloc(ptr noundef %912, i32 noundef %918)
  %920 = load ptr, ptr %35, align 8
  %921 = getelementptr inbounds %struct.TupleValue, ptr %920, i32 0, i32 1
  store ptr %919, ptr %921, align 8
  store i32 0, ptr %36, align 4
  br label %922

922:                                              ; preds = %945, %901
  %923 = load i32, ptr %36, align 4
  %924 = load ptr, ptr %34, align 8
  %925 = getelementptr inbounds %struct.TupleValue, ptr %924, i32 0, i32 0
  %926 = load i32, ptr %925, align 8
  %927 = icmp slt i32 %923, %926
  br i1 %927, label %928, label %948

928:                                              ; preds = %922
  %929 = load ptr, ptr %5, align 8
  %930 = load ptr, ptr %6, align 8
  %931 = load ptr, ptr %34, align 8
  %932 = getelementptr inbounds %struct.TupleValue, ptr %931, i32 0, i32 1
  %933 = load ptr, ptr %932, align 8
  %934 = load i32, ptr %36, align 4
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds ptr, ptr %933, i64 %935
  %937 = load ptr, ptr %936, align 8
  %938 = call ptr @powCalcLangValues(ptr noundef %929, ptr noundef %930, ptr noundef %937)
  %939 = load ptr, ptr %35, align 8
  %940 = getelementptr inbounds %struct.TupleValue, ptr %939, i32 0, i32 1
  %941 = load ptr, ptr %940, align 8
  %942 = load i32, ptr %36, align 4
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds ptr, ptr %941, i64 %943
  store ptr %938, ptr %944, align 8
  br label %945

945:                                              ; preds = %928
  %946 = load i32, ptr %36, align 4
  %947 = add nsw i32 %946, 1
  store i32 %947, ptr %36, align 4
  br label %922, !llvm.loop !88

948:                                              ; preds = %922
  %949 = load ptr, ptr %8, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 0
  store i32 6, ptr %950, align 8
  %951 = load ptr, ptr %35, align 8
  %952 = load ptr, ptr %8, align 8
  %953 = getelementptr inbounds %struct.CalcLangVal, ptr %952, i32 0, i32 1
  store ptr %951, ptr %953, align 8
  br label %1550

954:                                              ; preds = %896, %891
  %955 = load ptr, ptr %6, align 8
  %956 = getelementptr inbounds %struct.CalcLangVal, ptr %955, i32 0, i32 0
  %957 = load i32, ptr %956, align 8
  %958 = icmp eq i32 %957, 5
  br i1 %958, label %959, label %1036

959:                                              ; preds = %954
  %960 = load ptr, ptr %7, align 8
  %961 = getelementptr inbounds %struct.CalcLangVal, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = icmp eq i32 %962, 5
  br i1 %963, label %964, label %1036

964:                                              ; preds = %959
  %965 = load ptr, ptr %6, align 8
  %966 = getelementptr inbounds %struct.CalcLangVal, ptr %965, i32 0, i32 1
  %967 = load ptr, ptr %966, align 8
  store ptr %967, ptr %37, align 8
  %968 = load ptr, ptr %7, align 8
  %969 = getelementptr inbounds %struct.CalcLangVal, ptr %968, i32 0, i32 1
  %970 = load ptr, ptr %969, align 8
  store ptr %970, ptr %38, align 8
  %971 = load ptr, ptr %38, align 8
  %972 = getelementptr inbounds %struct.SetValue, ptr %971, i32 0, i32 0
  %973 = load i32, ptr %972, align 8
  %974 = load ptr, ptr %37, align 8
  %975 = getelementptr inbounds %struct.SetValue, ptr %974, i32 0, i32 0
  %976 = load i32, ptr %975, align 8
  %977 = icmp eq i32 %973, %976
  br i1 %977, label %978, label %1034

978:                                              ; preds = %964
  %979 = load ptr, ptr %5, align 8
  %980 = call ptr @arenaAlloc(ptr noundef %979, i32 noundef 16)
  store ptr %980, ptr %39, align 8
  %981 = load ptr, ptr %37, align 8
  %982 = getelementptr inbounds %struct.SetValue, ptr %981, i32 0, i32 0
  %983 = load i32, ptr %982, align 8
  %984 = load ptr, ptr %39, align 8
  %985 = getelementptr inbounds %struct.SetValue, ptr %984, i32 0, i32 0
  store i32 %983, ptr %985, align 8
  %986 = load ptr, ptr %5, align 8
  %987 = load ptr, ptr %39, align 8
  %988 = getelementptr inbounds %struct.SetValue, ptr %987, i32 0, i32 0
  %989 = load i32, ptr %988, align 8
  %990 = sext i32 %989 to i64
  %991 = mul i64 8, %990
  %992 = trunc i64 %991 to i32
  %993 = call ptr @arenaAlloc(ptr noundef %986, i32 noundef %992)
  %994 = load ptr, ptr %39, align 8
  %995 = getelementptr inbounds %struct.SetValue, ptr %994, i32 0, i32 1
  store ptr %993, ptr %995, align 8
  store i32 0, ptr %40, align 4
  br label %996

996:                                              ; preds = %1025, %978
  %997 = load i32, ptr %40, align 4
  %998 = load ptr, ptr %37, align 8
  %999 = getelementptr inbounds %struct.SetValue, ptr %998, i32 0, i32 0
  %1000 = load i32, ptr %999, align 8
  %1001 = icmp slt i32 %997, %1000
  br i1 %1001, label %1002, label %1028

1002:                                             ; preds = %996
  %1003 = load ptr, ptr %5, align 8
  %1004 = load ptr, ptr %37, align 8
  %1005 = getelementptr inbounds %struct.SetValue, ptr %1004, i32 0, i32 1
  %1006 = load ptr, ptr %1005, align 8
  %1007 = load i32, ptr %40, align 4
  %1008 = sext i32 %1007 to i64
  %1009 = getelementptr inbounds ptr, ptr %1006, i64 %1008
  %1010 = load ptr, ptr %1009, align 8
  %1011 = load ptr, ptr %38, align 8
  %1012 = getelementptr inbounds %struct.SetValue, ptr %1011, i32 0, i32 1
  %1013 = load ptr, ptr %1012, align 8
  %1014 = load i32, ptr %40, align 4
  %1015 = sext i32 %1014 to i64
  %1016 = getelementptr inbounds ptr, ptr %1013, i64 %1015
  %1017 = load ptr, ptr %1016, align 8
  %1018 = call ptr @powCalcLangValues(ptr noundef %1003, ptr noundef %1010, ptr noundef %1017)
  %1019 = load ptr, ptr %39, align 8
  %1020 = getelementptr inbounds %struct.SetValue, ptr %1019, i32 0, i32 1
  %1021 = load ptr, ptr %1020, align 8
  %1022 = load i32, ptr %40, align 4
  %1023 = sext i32 %1022 to i64
  %1024 = getelementptr inbounds ptr, ptr %1021, i64 %1023
  store ptr %1018, ptr %1024, align 8
  br label %1025

1025:                                             ; preds = %1002
  %1026 = load i32, ptr %40, align 4
  %1027 = add nsw i32 %1026, 1
  store i32 %1027, ptr %40, align 4
  br label %996, !llvm.loop !89

1028:                                             ; preds = %996
  %1029 = load ptr, ptr %8, align 8
  %1030 = getelementptr inbounds %struct.CalcLangVal, ptr %1029, i32 0, i32 0
  store i32 5, ptr %1030, align 8
  %1031 = load ptr, ptr %39, align 8
  %1032 = load ptr, ptr %8, align 8
  %1033 = getelementptr inbounds %struct.CalcLangVal, ptr %1032, i32 0, i32 1
  store ptr %1031, ptr %1033, align 8
  br label %1035

1034:                                             ; preds = %964
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %1573

1035:                                             ; preds = %1028
  br label %1549

1036:                                             ; preds = %959, %954
  %1037 = load ptr, ptr %6, align 8
  %1038 = getelementptr inbounds %struct.CalcLangVal, ptr %1037, i32 0, i32 0
  %1039 = load i32, ptr %1038, align 8
  %1040 = icmp eq i32 %1039, 5
  br i1 %1040, label %1041, label %1099

1041:                                             ; preds = %1036
  %1042 = load ptr, ptr %7, align 8
  %1043 = getelementptr inbounds %struct.CalcLangVal, ptr %1042, i32 0, i32 0
  %1044 = load i32, ptr %1043, align 8
  %1045 = icmp eq i32 %1044, 0
  br i1 %1045, label %1046, label %1099

1046:                                             ; preds = %1041
  %1047 = load ptr, ptr %6, align 8
  %1048 = getelementptr inbounds %struct.CalcLangVal, ptr %1047, i32 0, i32 1
  %1049 = load ptr, ptr %1048, align 8
  store ptr %1049, ptr %41, align 8
  %1050 = load ptr, ptr %5, align 8
  %1051 = call ptr @arenaAlloc(ptr noundef %1050, i32 noundef 16)
  store ptr %1051, ptr %42, align 8
  %1052 = load ptr, ptr %41, align 8
  %1053 = getelementptr inbounds %struct.SetValue, ptr %1052, i32 0, i32 0
  %1054 = load i32, ptr %1053, align 8
  %1055 = load ptr, ptr %42, align 8
  %1056 = getelementptr inbounds %struct.SetValue, ptr %1055, i32 0, i32 0
  store i32 %1054, ptr %1056, align 8
  %1057 = load ptr, ptr %5, align 8
  %1058 = load ptr, ptr %42, align 8
  %1059 = getelementptr inbounds %struct.SetValue, ptr %1058, i32 0, i32 0
  %1060 = load i32, ptr %1059, align 8
  %1061 = sext i32 %1060 to i64
  %1062 = mul i64 8, %1061
  %1063 = trunc i64 %1062 to i32
  %1064 = call ptr @arenaAlloc(ptr noundef %1057, i32 noundef %1063)
  %1065 = load ptr, ptr %42, align 8
  %1066 = getelementptr inbounds %struct.SetValue, ptr %1065, i32 0, i32 1
  store ptr %1064, ptr %1066, align 8
  store i32 0, ptr %43, align 4
  br label %1067

1067:                                             ; preds = %1090, %1046
  %1068 = load i32, ptr %43, align 4
  %1069 = load ptr, ptr %41, align 8
  %1070 = getelementptr inbounds %struct.SetValue, ptr %1069, i32 0, i32 0
  %1071 = load i32, ptr %1070, align 8
  %1072 = icmp slt i32 %1068, %1071
  br i1 %1072, label %1073, label %1093

1073:                                             ; preds = %1067
  %1074 = load ptr, ptr %5, align 8
  %1075 = load ptr, ptr %41, align 8
  %1076 = getelementptr inbounds %struct.SetValue, ptr %1075, i32 0, i32 1
  %1077 = load ptr, ptr %1076, align 8
  %1078 = load i32, ptr %43, align 4
  %1079 = sext i32 %1078 to i64
  %1080 = getelementptr inbounds ptr, ptr %1077, i64 %1079
  %1081 = load ptr, ptr %1080, align 8
  %1082 = load ptr, ptr %7, align 8
  %1083 = call ptr @powCalcLangValues(ptr noundef %1074, ptr noundef %1081, ptr noundef %1082)
  %1084 = load ptr, ptr %42, align 8
  %1085 = getelementptr inbounds %struct.SetValue, ptr %1084, i32 0, i32 1
  %1086 = load ptr, ptr %1085, align 8
  %1087 = load i32, ptr %43, align 4
  %1088 = sext i32 %1087 to i64
  %1089 = getelementptr inbounds ptr, ptr %1086, i64 %1088
  store ptr %1083, ptr %1089, align 8
  br label %1090

1090:                                             ; preds = %1073
  %1091 = load i32, ptr %43, align 4
  %1092 = add nsw i32 %1091, 1
  store i32 %1092, ptr %43, align 4
  br label %1067, !llvm.loop !90

1093:                                             ; preds = %1067
  %1094 = load ptr, ptr %8, align 8
  %1095 = getelementptr inbounds %struct.CalcLangVal, ptr %1094, i32 0, i32 0
  store i32 5, ptr %1095, align 8
  %1096 = load ptr, ptr %42, align 8
  %1097 = load ptr, ptr %8, align 8
  %1098 = getelementptr inbounds %struct.CalcLangVal, ptr %1097, i32 0, i32 1
  store ptr %1096, ptr %1098, align 8
  br label %1548

1099:                                             ; preds = %1041, %1036
  %1100 = load ptr, ptr %6, align 8
  %1101 = getelementptr inbounds %struct.CalcLangVal, ptr %1100, i32 0, i32 0
  %1102 = load i32, ptr %1101, align 8
  %1103 = icmp eq i32 %1102, 0
  br i1 %1103, label %1104, label %1162

1104:                                             ; preds = %1099
  %1105 = load ptr, ptr %7, align 8
  %1106 = getelementptr inbounds %struct.CalcLangVal, ptr %1105, i32 0, i32 0
  %1107 = load i32, ptr %1106, align 8
  %1108 = icmp eq i32 %1107, 5
  br i1 %1108, label %1109, label %1162

1109:                                             ; preds = %1104
  %1110 = load ptr, ptr %7, align 8
  %1111 = getelementptr inbounds %struct.CalcLangVal, ptr %1110, i32 0, i32 1
  %1112 = load ptr, ptr %1111, align 8
  store ptr %1112, ptr %44, align 8
  %1113 = load ptr, ptr %5, align 8
  %1114 = call ptr @arenaAlloc(ptr noundef %1113, i32 noundef 16)
  store ptr %1114, ptr %45, align 8
  %1115 = load ptr, ptr %44, align 8
  %1116 = getelementptr inbounds %struct.SetValue, ptr %1115, i32 0, i32 0
  %1117 = load i32, ptr %1116, align 8
  %1118 = load ptr, ptr %45, align 8
  %1119 = getelementptr inbounds %struct.SetValue, ptr %1118, i32 0, i32 0
  store i32 %1117, ptr %1119, align 8
  %1120 = load ptr, ptr %5, align 8
  %1121 = load ptr, ptr %45, align 8
  %1122 = getelementptr inbounds %struct.SetValue, ptr %1121, i32 0, i32 0
  %1123 = load i32, ptr %1122, align 8
  %1124 = sext i32 %1123 to i64
  %1125 = mul i64 8, %1124
  %1126 = trunc i64 %1125 to i32
  %1127 = call ptr @arenaAlloc(ptr noundef %1120, i32 noundef %1126)
  %1128 = load ptr, ptr %45, align 8
  %1129 = getelementptr inbounds %struct.SetValue, ptr %1128, i32 0, i32 1
  store ptr %1127, ptr %1129, align 8
  store i32 0, ptr %46, align 4
  br label %1130

1130:                                             ; preds = %1153, %1109
  %1131 = load i32, ptr %46, align 4
  %1132 = load ptr, ptr %44, align 8
  %1133 = getelementptr inbounds %struct.SetValue, ptr %1132, i32 0, i32 0
  %1134 = load i32, ptr %1133, align 8
  %1135 = icmp slt i32 %1131, %1134
  br i1 %1135, label %1136, label %1156

1136:                                             ; preds = %1130
  %1137 = load ptr, ptr %5, align 8
  %1138 = load ptr, ptr %6, align 8
  %1139 = load ptr, ptr %44, align 8
  %1140 = getelementptr inbounds %struct.SetValue, ptr %1139, i32 0, i32 1
  %1141 = load ptr, ptr %1140, align 8
  %1142 = load i32, ptr %46, align 4
  %1143 = sext i32 %1142 to i64
  %1144 = getelementptr inbounds ptr, ptr %1141, i64 %1143
  %1145 = load ptr, ptr %1144, align 8
  %1146 = call ptr @powCalcLangValues(ptr noundef %1137, ptr noundef %1138, ptr noundef %1145)
  %1147 = load ptr, ptr %45, align 8
  %1148 = getelementptr inbounds %struct.SetValue, ptr %1147, i32 0, i32 1
  %1149 = load ptr, ptr %1148, align 8
  %1150 = load i32, ptr %46, align 4
  %1151 = sext i32 %1150 to i64
  %1152 = getelementptr inbounds ptr, ptr %1149, i64 %1151
  store ptr %1146, ptr %1152, align 8
  br label %1153

1153:                                             ; preds = %1136
  %1154 = load i32, ptr %46, align 4
  %1155 = add nsw i32 %1154, 1
  store i32 %1155, ptr %46, align 4
  br label %1130, !llvm.loop !91

1156:                                             ; preds = %1130
  %1157 = load ptr, ptr %8, align 8
  %1158 = getelementptr inbounds %struct.CalcLangVal, ptr %1157, i32 0, i32 0
  store i32 5, ptr %1158, align 8
  %1159 = load ptr, ptr %45, align 8
  %1160 = load ptr, ptr %8, align 8
  %1161 = getelementptr inbounds %struct.CalcLangVal, ptr %1160, i32 0, i32 1
  store ptr %1159, ptr %1161, align 8
  br label %1547

1162:                                             ; preds = %1104, %1099
  %1163 = load ptr, ptr %6, align 8
  %1164 = getelementptr inbounds %struct.CalcLangVal, ptr %1163, i32 0, i32 0
  %1165 = load i32, ptr %1164, align 8
  %1166 = icmp eq i32 %1165, 5
  br i1 %1166, label %1167, label %1225

1167:                                             ; preds = %1162
  %1168 = load ptr, ptr %7, align 8
  %1169 = getelementptr inbounds %struct.CalcLangVal, ptr %1168, i32 0, i32 0
  %1170 = load i32, ptr %1169, align 8
  %1171 = icmp eq i32 %1170, 1
  br i1 %1171, label %1172, label %1225

1172:                                             ; preds = %1167
  %1173 = load ptr, ptr %6, align 8
  %1174 = getelementptr inbounds %struct.CalcLangVal, ptr %1173, i32 0, i32 1
  %1175 = load ptr, ptr %1174, align 8
  store ptr %1175, ptr %47, align 8
  %1176 = load ptr, ptr %5, align 8
  %1177 = call ptr @arenaAlloc(ptr noundef %1176, i32 noundef 16)
  store ptr %1177, ptr %48, align 8
  %1178 = load ptr, ptr %47, align 8
  %1179 = getelementptr inbounds %struct.SetValue, ptr %1178, i32 0, i32 0
  %1180 = load i32, ptr %1179, align 8
  %1181 = load ptr, ptr %48, align 8
  %1182 = getelementptr inbounds %struct.SetValue, ptr %1181, i32 0, i32 0
  store i32 %1180, ptr %1182, align 8
  %1183 = load ptr, ptr %5, align 8
  %1184 = load ptr, ptr %48, align 8
  %1185 = getelementptr inbounds %struct.SetValue, ptr %1184, i32 0, i32 0
  %1186 = load i32, ptr %1185, align 8
  %1187 = sext i32 %1186 to i64
  %1188 = mul i64 8, %1187
  %1189 = trunc i64 %1188 to i32
  %1190 = call ptr @arenaAlloc(ptr noundef %1183, i32 noundef %1189)
  %1191 = load ptr, ptr %48, align 8
  %1192 = getelementptr inbounds %struct.SetValue, ptr %1191, i32 0, i32 1
  store ptr %1190, ptr %1192, align 8
  store i32 0, ptr %49, align 4
  br label %1193

1193:                                             ; preds = %1216, %1172
  %1194 = load i32, ptr %49, align 4
  %1195 = load ptr, ptr %47, align 8
  %1196 = getelementptr inbounds %struct.SetValue, ptr %1195, i32 0, i32 0
  %1197 = load i32, ptr %1196, align 8
  %1198 = icmp slt i32 %1194, %1197
  br i1 %1198, label %1199, label %1219

1199:                                             ; preds = %1193
  %1200 = load ptr, ptr %5, align 8
  %1201 = load ptr, ptr %47, align 8
  %1202 = getelementptr inbounds %struct.SetValue, ptr %1201, i32 0, i32 1
  %1203 = load ptr, ptr %1202, align 8
  %1204 = load i32, ptr %49, align 4
  %1205 = sext i32 %1204 to i64
  %1206 = getelementptr inbounds ptr, ptr %1203, i64 %1205
  %1207 = load ptr, ptr %1206, align 8
  %1208 = load ptr, ptr %7, align 8
  %1209 = call ptr @powCalcLangValues(ptr noundef %1200, ptr noundef %1207, ptr noundef %1208)
  %1210 = load ptr, ptr %48, align 8
  %1211 = getelementptr inbounds %struct.SetValue, ptr %1210, i32 0, i32 1
  %1212 = load ptr, ptr %1211, align 8
  %1213 = load i32, ptr %49, align 4
  %1214 = sext i32 %1213 to i64
  %1215 = getelementptr inbounds ptr, ptr %1212, i64 %1214
  store ptr %1209, ptr %1215, align 8
  br label %1216

1216:                                             ; preds = %1199
  %1217 = load i32, ptr %49, align 4
  %1218 = add nsw i32 %1217, 1
  store i32 %1218, ptr %49, align 4
  br label %1193, !llvm.loop !92

1219:                                             ; preds = %1193
  %1220 = load ptr, ptr %8, align 8
  %1221 = getelementptr inbounds %struct.CalcLangVal, ptr %1220, i32 0, i32 0
  store i32 6, ptr %1221, align 8
  %1222 = load ptr, ptr %48, align 8
  %1223 = load ptr, ptr %8, align 8
  %1224 = getelementptr inbounds %struct.CalcLangVal, ptr %1223, i32 0, i32 1
  store ptr %1222, ptr %1224, align 8
  br label %1546

1225:                                             ; preds = %1167, %1162
  %1226 = load ptr, ptr %6, align 8
  %1227 = getelementptr inbounds %struct.CalcLangVal, ptr %1226, i32 0, i32 0
  %1228 = load i32, ptr %1227, align 8
  %1229 = icmp eq i32 %1228, 1
  br i1 %1229, label %1230, label %1288

1230:                                             ; preds = %1225
  %1231 = load ptr, ptr %7, align 8
  %1232 = getelementptr inbounds %struct.CalcLangVal, ptr %1231, i32 0, i32 0
  %1233 = load i32, ptr %1232, align 8
  %1234 = icmp eq i32 %1233, 5
  br i1 %1234, label %1235, label %1288

1235:                                             ; preds = %1230
  %1236 = load ptr, ptr %7, align 8
  %1237 = getelementptr inbounds %struct.CalcLangVal, ptr %1236, i32 0, i32 1
  %1238 = load ptr, ptr %1237, align 8
  store ptr %1238, ptr %50, align 8
  %1239 = load ptr, ptr %5, align 8
  %1240 = call ptr @arenaAlloc(ptr noundef %1239, i32 noundef 16)
  store ptr %1240, ptr %51, align 8
  %1241 = load ptr, ptr %50, align 8
  %1242 = getelementptr inbounds %struct.SetValue, ptr %1241, i32 0, i32 0
  %1243 = load i32, ptr %1242, align 8
  %1244 = load ptr, ptr %51, align 8
  %1245 = getelementptr inbounds %struct.SetValue, ptr %1244, i32 0, i32 0
  store i32 %1243, ptr %1245, align 8
  %1246 = load ptr, ptr %5, align 8
  %1247 = load ptr, ptr %51, align 8
  %1248 = getelementptr inbounds %struct.SetValue, ptr %1247, i32 0, i32 0
  %1249 = load i32, ptr %1248, align 8
  %1250 = sext i32 %1249 to i64
  %1251 = mul i64 8, %1250
  %1252 = trunc i64 %1251 to i32
  %1253 = call ptr @arenaAlloc(ptr noundef %1246, i32 noundef %1252)
  %1254 = load ptr, ptr %51, align 8
  %1255 = getelementptr inbounds %struct.SetValue, ptr %1254, i32 0, i32 1
  store ptr %1253, ptr %1255, align 8
  store i32 0, ptr %52, align 4
  br label %1256

1256:                                             ; preds = %1279, %1235
  %1257 = load i32, ptr %52, align 4
  %1258 = load ptr, ptr %50, align 8
  %1259 = getelementptr inbounds %struct.SetValue, ptr %1258, i32 0, i32 0
  %1260 = load i32, ptr %1259, align 8
  %1261 = icmp slt i32 %1257, %1260
  br i1 %1261, label %1262, label %1282

1262:                                             ; preds = %1256
  %1263 = load ptr, ptr %5, align 8
  %1264 = load ptr, ptr %6, align 8
  %1265 = load ptr, ptr %50, align 8
  %1266 = getelementptr inbounds %struct.SetValue, ptr %1265, i32 0, i32 1
  %1267 = load ptr, ptr %1266, align 8
  %1268 = load i32, ptr %52, align 4
  %1269 = sext i32 %1268 to i64
  %1270 = getelementptr inbounds ptr, ptr %1267, i64 %1269
  %1271 = load ptr, ptr %1270, align 8
  %1272 = call ptr @powCalcLangValues(ptr noundef %1263, ptr noundef %1264, ptr noundef %1271)
  %1273 = load ptr, ptr %51, align 8
  %1274 = getelementptr inbounds %struct.SetValue, ptr %1273, i32 0, i32 1
  %1275 = load ptr, ptr %1274, align 8
  %1276 = load i32, ptr %52, align 4
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds ptr, ptr %1275, i64 %1277
  store ptr %1272, ptr %1278, align 8
  br label %1279

1279:                                             ; preds = %1262
  %1280 = load i32, ptr %52, align 4
  %1281 = add nsw i32 %1280, 1
  store i32 %1281, ptr %52, align 4
  br label %1256, !llvm.loop !93

1282:                                             ; preds = %1256
  %1283 = load ptr, ptr %8, align 8
  %1284 = getelementptr inbounds %struct.CalcLangVal, ptr %1283, i32 0, i32 0
  store i32 5, ptr %1284, align 8
  %1285 = load ptr, ptr %51, align 8
  %1286 = load ptr, ptr %8, align 8
  %1287 = getelementptr inbounds %struct.CalcLangVal, ptr %1286, i32 0, i32 1
  store ptr %1285, ptr %1287, align 8
  br label %1545

1288:                                             ; preds = %1230, %1225
  %1289 = load ptr, ptr %6, align 8
  %1290 = getelementptr inbounds %struct.CalcLangVal, ptr %1289, i32 0, i32 0
  %1291 = load i32, ptr %1290, align 8
  %1292 = icmp eq i32 %1291, 5
  br i1 %1292, label %1293, label %1351

1293:                                             ; preds = %1288
  %1294 = load ptr, ptr %7, align 8
  %1295 = getelementptr inbounds %struct.CalcLangVal, ptr %1294, i32 0, i32 0
  %1296 = load i32, ptr %1295, align 8
  %1297 = icmp eq i32 %1296, 2
  br i1 %1297, label %1298, label %1351

1298:                                             ; preds = %1293
  %1299 = load ptr, ptr %6, align 8
  %1300 = getelementptr inbounds %struct.CalcLangVal, ptr %1299, i32 0, i32 1
  %1301 = load ptr, ptr %1300, align 8
  store ptr %1301, ptr %53, align 8
  %1302 = load ptr, ptr %5, align 8
  %1303 = call ptr @arenaAlloc(ptr noundef %1302, i32 noundef 16)
  store ptr %1303, ptr %54, align 8
  %1304 = load ptr, ptr %53, align 8
  %1305 = getelementptr inbounds %struct.SetValue, ptr %1304, i32 0, i32 0
  %1306 = load i32, ptr %1305, align 8
  %1307 = load ptr, ptr %54, align 8
  %1308 = getelementptr inbounds %struct.SetValue, ptr %1307, i32 0, i32 0
  store i32 %1306, ptr %1308, align 8
  %1309 = load ptr, ptr %5, align 8
  %1310 = load ptr, ptr %54, align 8
  %1311 = getelementptr inbounds %struct.SetValue, ptr %1310, i32 0, i32 0
  %1312 = load i32, ptr %1311, align 8
  %1313 = sext i32 %1312 to i64
  %1314 = mul i64 8, %1313
  %1315 = trunc i64 %1314 to i32
  %1316 = call ptr @arenaAlloc(ptr noundef %1309, i32 noundef %1315)
  %1317 = load ptr, ptr %54, align 8
  %1318 = getelementptr inbounds %struct.SetValue, ptr %1317, i32 0, i32 1
  store ptr %1316, ptr %1318, align 8
  store i32 0, ptr %55, align 4
  br label %1319

1319:                                             ; preds = %1342, %1298
  %1320 = load i32, ptr %55, align 4
  %1321 = load ptr, ptr %53, align 8
  %1322 = getelementptr inbounds %struct.SetValue, ptr %1321, i32 0, i32 0
  %1323 = load i32, ptr %1322, align 8
  %1324 = icmp slt i32 %1320, %1323
  br i1 %1324, label %1325, label %1345

1325:                                             ; preds = %1319
  %1326 = load ptr, ptr %5, align 8
  %1327 = load ptr, ptr %53, align 8
  %1328 = getelementptr inbounds %struct.SetValue, ptr %1327, i32 0, i32 1
  %1329 = load ptr, ptr %1328, align 8
  %1330 = load i32, ptr %55, align 4
  %1331 = sext i32 %1330 to i64
  %1332 = getelementptr inbounds ptr, ptr %1329, i64 %1331
  %1333 = load ptr, ptr %1332, align 8
  %1334 = load ptr, ptr %7, align 8
  %1335 = call ptr @powCalcLangValues(ptr noundef %1326, ptr noundef %1333, ptr noundef %1334)
  %1336 = load ptr, ptr %54, align 8
  %1337 = getelementptr inbounds %struct.SetValue, ptr %1336, i32 0, i32 1
  %1338 = load ptr, ptr %1337, align 8
  %1339 = load i32, ptr %55, align 4
  %1340 = sext i32 %1339 to i64
  %1341 = getelementptr inbounds ptr, ptr %1338, i64 %1340
  store ptr %1335, ptr %1341, align 8
  br label %1342

1342:                                             ; preds = %1325
  %1343 = load i32, ptr %55, align 4
  %1344 = add nsw i32 %1343, 1
  store i32 %1344, ptr %55, align 4
  br label %1319, !llvm.loop !94

1345:                                             ; preds = %1319
  %1346 = load ptr, ptr %8, align 8
  %1347 = getelementptr inbounds %struct.CalcLangVal, ptr %1346, i32 0, i32 0
  store i32 5, ptr %1347, align 8
  %1348 = load ptr, ptr %54, align 8
  %1349 = load ptr, ptr %8, align 8
  %1350 = getelementptr inbounds %struct.CalcLangVal, ptr %1349, i32 0, i32 1
  store ptr %1348, ptr %1350, align 8
  br label %1544

1351:                                             ; preds = %1293, %1288
  %1352 = load ptr, ptr %6, align 8
  %1353 = getelementptr inbounds %struct.CalcLangVal, ptr %1352, i32 0, i32 0
  %1354 = load i32, ptr %1353, align 8
  %1355 = icmp eq i32 %1354, 2
  br i1 %1355, label %1356, label %1414

1356:                                             ; preds = %1351
  %1357 = load ptr, ptr %7, align 8
  %1358 = getelementptr inbounds %struct.CalcLangVal, ptr %1357, i32 0, i32 0
  %1359 = load i32, ptr %1358, align 8
  %1360 = icmp eq i32 %1359, 5
  br i1 %1360, label %1361, label %1414

1361:                                             ; preds = %1356
  %1362 = load ptr, ptr %7, align 8
  %1363 = getelementptr inbounds %struct.CalcLangVal, ptr %1362, i32 0, i32 1
  %1364 = load ptr, ptr %1363, align 8
  store ptr %1364, ptr %56, align 8
  %1365 = load ptr, ptr %5, align 8
  %1366 = call ptr @arenaAlloc(ptr noundef %1365, i32 noundef 16)
  store ptr %1366, ptr %57, align 8
  %1367 = load ptr, ptr %56, align 8
  %1368 = getelementptr inbounds %struct.SetValue, ptr %1367, i32 0, i32 0
  %1369 = load i32, ptr %1368, align 8
  %1370 = load ptr, ptr %57, align 8
  %1371 = getelementptr inbounds %struct.SetValue, ptr %1370, i32 0, i32 0
  store i32 %1369, ptr %1371, align 8
  %1372 = load ptr, ptr %5, align 8
  %1373 = load ptr, ptr %57, align 8
  %1374 = getelementptr inbounds %struct.SetValue, ptr %1373, i32 0, i32 0
  %1375 = load i32, ptr %1374, align 8
  %1376 = sext i32 %1375 to i64
  %1377 = mul i64 8, %1376
  %1378 = trunc i64 %1377 to i32
  %1379 = call ptr @arenaAlloc(ptr noundef %1372, i32 noundef %1378)
  %1380 = load ptr, ptr %57, align 8
  %1381 = getelementptr inbounds %struct.SetValue, ptr %1380, i32 0, i32 1
  store ptr %1379, ptr %1381, align 8
  store i32 0, ptr %58, align 4
  br label %1382

1382:                                             ; preds = %1405, %1361
  %1383 = load i32, ptr %58, align 4
  %1384 = load ptr, ptr %56, align 8
  %1385 = getelementptr inbounds %struct.SetValue, ptr %1384, i32 0, i32 0
  %1386 = load i32, ptr %1385, align 8
  %1387 = icmp slt i32 %1383, %1386
  br i1 %1387, label %1388, label %1408

1388:                                             ; preds = %1382
  %1389 = load ptr, ptr %5, align 8
  %1390 = load ptr, ptr %6, align 8
  %1391 = load ptr, ptr %56, align 8
  %1392 = getelementptr inbounds %struct.SetValue, ptr %1391, i32 0, i32 1
  %1393 = load ptr, ptr %1392, align 8
  %1394 = load i32, ptr %58, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds ptr, ptr %1393, i64 %1395
  %1397 = load ptr, ptr %1396, align 8
  %1398 = call ptr @powCalcLangValues(ptr noundef %1389, ptr noundef %1390, ptr noundef %1397)
  %1399 = load ptr, ptr %57, align 8
  %1400 = getelementptr inbounds %struct.SetValue, ptr %1399, i32 0, i32 1
  %1401 = load ptr, ptr %1400, align 8
  %1402 = load i32, ptr %58, align 4
  %1403 = sext i32 %1402 to i64
  %1404 = getelementptr inbounds ptr, ptr %1401, i64 %1403
  store ptr %1398, ptr %1404, align 8
  br label %1405

1405:                                             ; preds = %1388
  %1406 = load i32, ptr %58, align 4
  %1407 = add nsw i32 %1406, 1
  store i32 %1407, ptr %58, align 4
  br label %1382, !llvm.loop !95

1408:                                             ; preds = %1382
  %1409 = load ptr, ptr %8, align 8
  %1410 = getelementptr inbounds %struct.CalcLangVal, ptr %1409, i32 0, i32 0
  store i32 5, ptr %1410, align 8
  %1411 = load ptr, ptr %57, align 8
  %1412 = load ptr, ptr %8, align 8
  %1413 = getelementptr inbounds %struct.CalcLangVal, ptr %1412, i32 0, i32 1
  store ptr %1411, ptr %1413, align 8
  br label %1543

1414:                                             ; preds = %1356, %1351
  %1415 = load ptr, ptr %6, align 8
  %1416 = getelementptr inbounds %struct.CalcLangVal, ptr %1415, i32 0, i32 0
  %1417 = load i32, ptr %1416, align 8
  %1418 = icmp eq i32 %1417, 5
  br i1 %1418, label %1419, label %1477

1419:                                             ; preds = %1414
  %1420 = load ptr, ptr %7, align 8
  %1421 = getelementptr inbounds %struct.CalcLangVal, ptr %1420, i32 0, i32 0
  %1422 = load i32, ptr %1421, align 8
  %1423 = icmp eq i32 %1422, 3
  br i1 %1423, label %1424, label %1477

1424:                                             ; preds = %1419
  %1425 = load ptr, ptr %6, align 8
  %1426 = getelementptr inbounds %struct.CalcLangVal, ptr %1425, i32 0, i32 1
  %1427 = load ptr, ptr %1426, align 8
  store ptr %1427, ptr %59, align 8
  %1428 = load ptr, ptr %5, align 8
  %1429 = call ptr @arenaAlloc(ptr noundef %1428, i32 noundef 16)
  store ptr %1429, ptr %60, align 8
  %1430 = load ptr, ptr %59, align 8
  %1431 = getelementptr inbounds %struct.SetValue, ptr %1430, i32 0, i32 0
  %1432 = load i32, ptr %1431, align 8
  %1433 = load ptr, ptr %60, align 8
  %1434 = getelementptr inbounds %struct.SetValue, ptr %1433, i32 0, i32 0
  store i32 %1432, ptr %1434, align 8
  %1435 = load ptr, ptr %5, align 8
  %1436 = load ptr, ptr %60, align 8
  %1437 = getelementptr inbounds %struct.SetValue, ptr %1436, i32 0, i32 0
  %1438 = load i32, ptr %1437, align 8
  %1439 = sext i32 %1438 to i64
  %1440 = mul i64 8, %1439
  %1441 = trunc i64 %1440 to i32
  %1442 = call ptr @arenaAlloc(ptr noundef %1435, i32 noundef %1441)
  %1443 = load ptr, ptr %60, align 8
  %1444 = getelementptr inbounds %struct.SetValue, ptr %1443, i32 0, i32 1
  store ptr %1442, ptr %1444, align 8
  store i32 0, ptr %61, align 4
  br label %1445

1445:                                             ; preds = %1468, %1424
  %1446 = load i32, ptr %61, align 4
  %1447 = load ptr, ptr %59, align 8
  %1448 = getelementptr inbounds %struct.SetValue, ptr %1447, i32 0, i32 0
  %1449 = load i32, ptr %1448, align 8
  %1450 = icmp slt i32 %1446, %1449
  br i1 %1450, label %1451, label %1471

1451:                                             ; preds = %1445
  %1452 = load ptr, ptr %5, align 8
  %1453 = load ptr, ptr %59, align 8
  %1454 = getelementptr inbounds %struct.SetValue, ptr %1453, i32 0, i32 1
  %1455 = load ptr, ptr %1454, align 8
  %1456 = load i32, ptr %61, align 4
  %1457 = sext i32 %1456 to i64
  %1458 = getelementptr inbounds ptr, ptr %1455, i64 %1457
  %1459 = load ptr, ptr %1458, align 8
  %1460 = load ptr, ptr %7, align 8
  %1461 = call ptr @powCalcLangValues(ptr noundef %1452, ptr noundef %1459, ptr noundef %1460)
  %1462 = load ptr, ptr %60, align 8
  %1463 = getelementptr inbounds %struct.SetValue, ptr %1462, i32 0, i32 1
  %1464 = load ptr, ptr %1463, align 8
  %1465 = load i32, ptr %61, align 4
  %1466 = sext i32 %1465 to i64
  %1467 = getelementptr inbounds ptr, ptr %1464, i64 %1466
  store ptr %1461, ptr %1467, align 8
  br label %1468

1468:                                             ; preds = %1451
  %1469 = load i32, ptr %61, align 4
  %1470 = add nsw i32 %1469, 1
  store i32 %1470, ptr %61, align 4
  br label %1445, !llvm.loop !96

1471:                                             ; preds = %1445
  %1472 = load ptr, ptr %8, align 8
  %1473 = getelementptr inbounds %struct.CalcLangVal, ptr %1472, i32 0, i32 0
  store i32 5, ptr %1473, align 8
  %1474 = load ptr, ptr %60, align 8
  %1475 = load ptr, ptr %8, align 8
  %1476 = getelementptr inbounds %struct.CalcLangVal, ptr %1475, i32 0, i32 1
  store ptr %1474, ptr %1476, align 8
  br label %1542

1477:                                             ; preds = %1419, %1414
  %1478 = load ptr, ptr %6, align 8
  %1479 = getelementptr inbounds %struct.CalcLangVal, ptr %1478, i32 0, i32 0
  %1480 = load i32, ptr %1479, align 8
  %1481 = icmp eq i32 %1480, 3
  br i1 %1481, label %1482, label %1540

1482:                                             ; preds = %1477
  %1483 = load ptr, ptr %7, align 8
  %1484 = getelementptr inbounds %struct.CalcLangVal, ptr %1483, i32 0, i32 0
  %1485 = load i32, ptr %1484, align 8
  %1486 = icmp eq i32 %1485, 5
  br i1 %1486, label %1487, label %1540

1487:                                             ; preds = %1482
  %1488 = load ptr, ptr %7, align 8
  %1489 = getelementptr inbounds %struct.CalcLangVal, ptr %1488, i32 0, i32 1
  %1490 = load ptr, ptr %1489, align 8
  store ptr %1490, ptr %62, align 8
  %1491 = load ptr, ptr %5, align 8
  %1492 = call ptr @arenaAlloc(ptr noundef %1491, i32 noundef 16)
  store ptr %1492, ptr %63, align 8
  %1493 = load ptr, ptr %62, align 8
  %1494 = getelementptr inbounds %struct.SetValue, ptr %1493, i32 0, i32 0
  %1495 = load i32, ptr %1494, align 8
  %1496 = load ptr, ptr %63, align 8
  %1497 = getelementptr inbounds %struct.SetValue, ptr %1496, i32 0, i32 0
  store i32 %1495, ptr %1497, align 8
  %1498 = load ptr, ptr %5, align 8
  %1499 = load ptr, ptr %63, align 8
  %1500 = getelementptr inbounds %struct.SetValue, ptr %1499, i32 0, i32 0
  %1501 = load i32, ptr %1500, align 8
  %1502 = sext i32 %1501 to i64
  %1503 = mul i64 8, %1502
  %1504 = trunc i64 %1503 to i32
  %1505 = call ptr @arenaAlloc(ptr noundef %1498, i32 noundef %1504)
  %1506 = load ptr, ptr %63, align 8
  %1507 = getelementptr inbounds %struct.SetValue, ptr %1506, i32 0, i32 1
  store ptr %1505, ptr %1507, align 8
  store i32 0, ptr %64, align 4
  br label %1508

1508:                                             ; preds = %1531, %1487
  %1509 = load i32, ptr %64, align 4
  %1510 = load ptr, ptr %62, align 8
  %1511 = getelementptr inbounds %struct.SetValue, ptr %1510, i32 0, i32 0
  %1512 = load i32, ptr %1511, align 8
  %1513 = icmp slt i32 %1509, %1512
  br i1 %1513, label %1514, label %1534

1514:                                             ; preds = %1508
  %1515 = load ptr, ptr %5, align 8
  %1516 = load ptr, ptr %6, align 8
  %1517 = load ptr, ptr %62, align 8
  %1518 = getelementptr inbounds %struct.SetValue, ptr %1517, i32 0, i32 1
  %1519 = load ptr, ptr %1518, align 8
  %1520 = load i32, ptr %64, align 4
  %1521 = sext i32 %1520 to i64
  %1522 = getelementptr inbounds ptr, ptr %1519, i64 %1521
  %1523 = load ptr, ptr %1522, align 8
  %1524 = call ptr @powCalcLangValues(ptr noundef %1515, ptr noundef %1516, ptr noundef %1523)
  %1525 = load ptr, ptr %63, align 8
  %1526 = getelementptr inbounds %struct.SetValue, ptr %1525, i32 0, i32 1
  %1527 = load ptr, ptr %1526, align 8
  %1528 = load i32, ptr %64, align 4
  %1529 = sext i32 %1528 to i64
  %1530 = getelementptr inbounds ptr, ptr %1527, i64 %1529
  store ptr %1524, ptr %1530, align 8
  br label %1531

1531:                                             ; preds = %1514
  %1532 = load i32, ptr %64, align 4
  %1533 = add nsw i32 %1532, 1
  store i32 %1533, ptr %64, align 4
  br label %1508, !llvm.loop !97

1534:                                             ; preds = %1508
  %1535 = load ptr, ptr %8, align 8
  %1536 = getelementptr inbounds %struct.CalcLangVal, ptr %1535, i32 0, i32 0
  store i32 5, ptr %1536, align 8
  %1537 = load ptr, ptr %63, align 8
  %1538 = load ptr, ptr %8, align 8
  %1539 = getelementptr inbounds %struct.CalcLangVal, ptr %1538, i32 0, i32 1
  store ptr %1537, ptr %1539, align 8
  br label %1541

1540:                                             ; preds = %1482, %1477
  call void @perror(ptr noundef @.str.2) #6
  br label %1541

1541:                                             ; preds = %1540, %1534
  br label %1542

1542:                                             ; preds = %1541, %1471
  br label %1543

1543:                                             ; preds = %1542, %1408
  br label %1544

1544:                                             ; preds = %1543, %1345
  br label %1545

1545:                                             ; preds = %1544, %1282
  br label %1546

1546:                                             ; preds = %1545, %1219
  br label %1547

1547:                                             ; preds = %1546, %1156
  br label %1548

1548:                                             ; preds = %1547, %1093
  br label %1549

1549:                                             ; preds = %1548, %1035
  br label %1550

1550:                                             ; preds = %1549, %948
  br label %1551

1551:                                             ; preds = %1550, %885
  br label %1552

1552:                                             ; preds = %1551, %822
  br label %1553

1553:                                             ; preds = %1552, %759
  br label %1554

1554:                                             ; preds = %1553, %696
  br label %1555

1555:                                             ; preds = %1554, %633
  br label %1556

1556:                                             ; preds = %1555, %570
  br label %1557

1557:                                             ; preds = %1556, %507
  br label %1558

1558:                                             ; preds = %1557, %449
  br label %1559

1559:                                             ; preds = %1558, %356
  br label %1560

1560:                                             ; preds = %1559, %334
  br label %1561

1561:                                             ; preds = %1560, %312
  br label %1562

1562:                                             ; preds = %1561, %289
  br label %1563

1563:                                             ; preds = %1562, %266
  br label %1564

1564:                                             ; preds = %1563, %244
  br label %1565

1565:                                             ; preds = %1564, %222
  br label %1566

1566:                                             ; preds = %1565, %199
  br label %1567

1567:                                             ; preds = %1566, %176
  br label %1568

1568:                                             ; preds = %1567, %153
  br label %1569

1569:                                             ; preds = %1568, %130
  br label %1570

1570:                                             ; preds = %1569, %108
  br label %1571

1571:                                             ; preds = %1570, %83
  %1572 = load ptr, ptr %8, align 8
  store ptr %1572, ptr %4, align 8
  br label %1573

1573:                                             ; preds = %1571, %1034, %448, %70
  %1574 = load ptr, ptr %4, align 8
  ret ptr %1574
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dotProductVals(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %20, label %17

17:                                               ; preds = %3
  %18 = load ptr, ptr %7, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %3
  store ptr null, ptr %4, align 8
  br label %86

21:                                               ; preds = %17
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = icmp eq i32 %24, 6
  br i1 %25, label %26, label %84

26:                                               ; preds = %21
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %29, 6
  br i1 %30, label %31, label %84

31:                                               ; preds = %26
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds %struct.CalcLangVal, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %8, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %9, align 8
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct.TupleValue, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds %struct.TupleValue, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %40, %43
  br i1 %44, label %45, label %82

45:                                               ; preds = %31
  %46 = load ptr, ptr %5, align 8
  %47 = call ptr @integerCalcLangValue(ptr noundef %46, i32 noundef 0)
  store ptr %47, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %48

48:                                               ; preds = %77, %45
  %49 = load i32, ptr %11, align 4
  %50 = load ptr, ptr %8, align 8
  %51 = getelementptr inbounds %struct.TupleValue, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %80

54:                                               ; preds = %48
  %55 = load ptr, ptr %8, align 8
  %56 = getelementptr inbounds %struct.TupleValue, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %11, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds ptr, ptr %57, i64 %59
  %61 = load ptr, ptr %60, align 8
  store ptr %61, ptr %12, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = getelementptr inbounds %struct.TupleValue, ptr %62, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %64, i64 %66
  %68 = load ptr, ptr %67, align 8
  store ptr %68, ptr %13, align 8
  %69 = load ptr, ptr %5, align 8
  %70 = load ptr, ptr %12, align 8
  %71 = load ptr, ptr %13, align 8
  %72 = call ptr @multCalcLangValues(ptr noundef %69, ptr noundef %70, ptr noundef %71)
  store ptr %72, ptr %14, align 8
  %73 = load ptr, ptr %5, align 8
  %74 = load ptr, ptr %10, align 8
  %75 = load ptr, ptr %14, align 8
  %76 = call ptr @addCalcLangValues(ptr noundef %73, ptr noundef %74, ptr noundef %75)
  store ptr %76, ptr %10, align 8
  br label %77

77:                                               ; preds = %54
  %78 = load i32, ptr %11, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %11, align 4
  br label %48, !llvm.loop !98

80:                                               ; preds = %48
  %81 = load ptr, ptr %10, align 8
  store ptr %81, ptr %4, align 8
  br label %86

82:                                               ; preds = %31
  call void @perror(ptr noundef @.str.5) #6
  br label %83

83:                                               ; preds = %82
  br label %85

84:                                               ; preds = %26, %21
  call void @perror(ptr noundef @.str.6) #6
  br label %85

85:                                               ; preds = %84, %83
  store ptr null, ptr %4, align 8
  br label %86

86:                                               ; preds = %85, %80, %20
  %87 = load ptr, ptr %4, align 8
  ret ptr %87
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @equalsCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %24, label %21

21:                                               ; preds = %3
  %22 = load ptr, ptr %7, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %21, %3
  store ptr null, ptr %4, align 8
  br label %461

25:                                               ; preds = %21
  %26 = load ptr, ptr %5, align 8
  %27 = call ptr @arenaAlloc(ptr noundef %26, i32 noundef 16)
  store ptr %27, ptr %8, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 8
  %31 = icmp eq i32 %30, 4
  br i1 %31, label %32, label %54

32:                                               ; preds = %25
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 8
  %36 = icmp eq i32 %35, 4
  br i1 %36, label %37, label %54

37:                                               ; preds = %32
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  store i32 4, ptr %39, align 8
  %40 = load ptr, ptr %6, align 8
  %41 = getelementptr inbounds %struct.CalcLangVal, ptr %40, i32 0, i32 1
  %42 = load i8, ptr %41, align 8
  %43 = trunc i8 %42 to i1
  %44 = zext i1 %43 to i32
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.CalcLangVal, ptr %45, i32 0, i32 1
  %47 = load i8, ptr %46, align 8
  %48 = trunc i8 %47 to i1
  %49 = zext i1 %48 to i32
  %50 = icmp eq i32 %44, %49
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 1
  %53 = zext i1 %50 to i8
  store i8 %53, ptr %52, align 8
  br label %459

54:                                               ; preds = %32, %25
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr inbounds %struct.CalcLangVal, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 8
  %58 = icmp eq i32 %57, 4
  br i1 %58, label %59, label %79

59:                                               ; preds = %54
  %60 = load ptr, ptr %7, align 8
  %61 = getelementptr inbounds %struct.CalcLangVal, ptr %60, i32 0, i32 0
  %62 = load i32, ptr %61, align 8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %79

64:                                               ; preds = %59
  %65 = load ptr, ptr %8, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  store i32 4, ptr %66, align 8
  %67 = load ptr, ptr %6, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 1
  %69 = load i8, ptr %68, align 8
  %70 = trunc i8 %69 to i1
  %71 = zext i1 %70 to i32
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 1
  %74 = load i32, ptr %73, align 8
  %75 = icmp eq i32 %71, %74
  %76 = load ptr, ptr %8, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 1
  %78 = zext i1 %75 to i8
  store i8 %78, ptr %77, align 8
  br label %458

79:                                               ; preds = %59, %54
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %104

84:                                               ; preds = %79
  %85 = load ptr, ptr %7, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  %87 = load i32, ptr %86, align 8
  %88 = icmp eq i32 %87, 4
  br i1 %88, label %89, label %104

89:                                               ; preds = %84
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  store i32 4, ptr %91, align 8
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 1
  %94 = load i32, ptr %93, align 8
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 1
  %97 = load i8, ptr %96, align 8
  %98 = trunc i8 %97 to i1
  %99 = zext i1 %98 to i32
  %100 = icmp eq i32 %94, %99
  %101 = load ptr, ptr %8, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 1
  %103 = zext i1 %100 to i8
  store i8 %103, ptr %102, align 8
  br label %457

104:                                              ; preds = %84, %79
  %105 = load ptr, ptr %6, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 8
  %108 = icmp eq i32 %107, 4
  br i1 %108, label %109, label %130

109:                                              ; preds = %104
  %110 = load ptr, ptr %7, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = icmp eq i32 %112, 1
  br i1 %113, label %114, label %130

114:                                              ; preds = %109
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  store i32 4, ptr %116, align 8
  %117 = load ptr, ptr %6, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 1
  %119 = load i8, ptr %118, align 8
  %120 = trunc i8 %119 to i1
  %121 = zext i1 %120 to i32
  %122 = sitofp i32 %121 to double
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 1
  %125 = load double, ptr %124, align 8
  %126 = fcmp oeq double %122, %125
  %127 = load ptr, ptr %8, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = zext i1 %126 to i8
  store i8 %129, ptr %128, align 8
  br label %456

130:                                              ; preds = %109, %104
  %131 = load ptr, ptr %6, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 0
  %133 = load i32, ptr %132, align 8
  %134 = icmp eq i32 %133, 1
  br i1 %134, label %135, label %156

135:                                              ; preds = %130
  %136 = load ptr, ptr %7, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %137, align 8
  %139 = icmp eq i32 %138, 4
  br i1 %139, label %140, label %156

140:                                              ; preds = %135
  %141 = load ptr, ptr %8, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  store i32 4, ptr %142, align 8
  %143 = load ptr, ptr %6, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 1
  %145 = load double, ptr %144, align 8
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 1
  %148 = load i8, ptr %147, align 8
  %149 = trunc i8 %148 to i1
  %150 = zext i1 %149 to i32
  %151 = sitofp i32 %150 to double
  %152 = fcmp oeq double %145, %151
  %153 = load ptr, ptr %8, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = zext i1 %152 to i8
  store i8 %155, ptr %154, align 8
  br label %455

156:                                              ; preds = %135, %130
  %157 = load ptr, ptr %6, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 0
  %159 = load i32, ptr %158, align 8
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %179

161:                                              ; preds = %156
  %162 = load ptr, ptr %7, align 8
  %163 = getelementptr inbounds %struct.CalcLangVal, ptr %162, i32 0, i32 0
  %164 = load i32, ptr %163, align 8
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %179

166:                                              ; preds = %161
  %167 = load ptr, ptr %8, align 8
  %168 = getelementptr inbounds %struct.CalcLangVal, ptr %167, i32 0, i32 0
  store i32 4, ptr %168, align 8
  %169 = load ptr, ptr %6, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 1
  %171 = load i32, ptr %170, align 8
  %172 = load ptr, ptr %7, align 8
  %173 = getelementptr inbounds %struct.CalcLangVal, ptr %172, i32 0, i32 1
  %174 = load i32, ptr %173, align 8
  %175 = icmp eq i32 %171, %174
  %176 = load ptr, ptr %8, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = zext i1 %175 to i8
  store i8 %178, ptr %177, align 8
  br label %454

179:                                              ; preds = %161, %156
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 0
  %182 = load i32, ptr %181, align 8
  %183 = icmp eq i32 %182, 1
  br i1 %183, label %184, label %202

184:                                              ; preds = %179
  %185 = load ptr, ptr %7, align 8
  %186 = getelementptr inbounds %struct.CalcLangVal, ptr %185, i32 0, i32 0
  %187 = load i32, ptr %186, align 8
  %188 = icmp eq i32 %187, 1
  br i1 %188, label %189, label %202

189:                                              ; preds = %184
  %190 = load ptr, ptr %8, align 8
  %191 = getelementptr inbounds %struct.CalcLangVal, ptr %190, i32 0, i32 0
  store i32 4, ptr %191, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 1
  %194 = load double, ptr %193, align 8
  %195 = load ptr, ptr %7, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 1
  %197 = load double, ptr %196, align 8
  %198 = fcmp oeq double %194, %197
  %199 = load ptr, ptr %8, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  %201 = zext i1 %198 to i8
  store i8 %201, ptr %200, align 8
  br label %453

202:                                              ; preds = %184, %179
  %203 = load ptr, ptr %6, align 8
  %204 = getelementptr inbounds %struct.CalcLangVal, ptr %203, i32 0, i32 0
  %205 = load i32, ptr %204, align 8
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %207, label %226

207:                                              ; preds = %202
  %208 = load ptr, ptr %7, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 0
  %210 = load i32, ptr %209, align 8
  %211 = icmp eq i32 %210, 1
  br i1 %211, label %212, label %226

212:                                              ; preds = %207
  %213 = load ptr, ptr %8, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 0
  store i32 4, ptr %214, align 8
  %215 = load ptr, ptr %6, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 1
  %217 = load i32, ptr %216, align 8
  %218 = sitofp i32 %217 to double
  %219 = load ptr, ptr %7, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 1
  %221 = load double, ptr %220, align 8
  %222 = fcmp oeq double %218, %221
  %223 = load ptr, ptr %8, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 1
  %225 = zext i1 %222 to i8
  store i8 %225, ptr %224, align 8
  br label %452

226:                                              ; preds = %207, %202
  %227 = load ptr, ptr %6, align 8
  %228 = getelementptr inbounds %struct.CalcLangVal, ptr %227, i32 0, i32 0
  %229 = load i32, ptr %228, align 8
  %230 = icmp eq i32 %229, 1
  br i1 %230, label %231, label %250

231:                                              ; preds = %226
  %232 = load ptr, ptr %7, align 8
  %233 = getelementptr inbounds %struct.CalcLangVal, ptr %232, i32 0, i32 0
  %234 = load i32, ptr %233, align 8
  %235 = icmp eq i32 %234, 0
  br i1 %235, label %236, label %250

236:                                              ; preds = %231
  %237 = load ptr, ptr %8, align 8
  %238 = getelementptr inbounds %struct.CalcLangVal, ptr %237, i32 0, i32 0
  store i32 4, ptr %238, align 8
  %239 = load ptr, ptr %6, align 8
  %240 = getelementptr inbounds %struct.CalcLangVal, ptr %239, i32 0, i32 1
  %241 = load double, ptr %240, align 8
  %242 = load ptr, ptr %7, align 8
  %243 = getelementptr inbounds %struct.CalcLangVal, ptr %242, i32 0, i32 1
  %244 = load i32, ptr %243, align 8
  %245 = sitofp i32 %244 to double
  %246 = fcmp oeq double %241, %245
  %247 = load ptr, ptr %8, align 8
  %248 = getelementptr inbounds %struct.CalcLangVal, ptr %247, i32 0, i32 1
  %249 = zext i1 %246 to i8
  store i8 %249, ptr %248, align 8
  br label %451

250:                                              ; preds = %231, %226
  %251 = load ptr, ptr %6, align 8
  %252 = getelementptr inbounds %struct.CalcLangVal, ptr %251, i32 0, i32 0
  %253 = load i32, ptr %252, align 8
  %254 = icmp eq i32 %253, 2
  br i1 %254, label %255, label %273

255:                                              ; preds = %250
  %256 = load ptr, ptr %7, align 8
  %257 = getelementptr inbounds %struct.CalcLangVal, ptr %256, i32 0, i32 0
  %258 = load i32, ptr %257, align 8
  %259 = icmp eq i32 %258, 2
  br i1 %259, label %260, label %273

260:                                              ; preds = %255
  %261 = load ptr, ptr %8, align 8
  %262 = getelementptr inbounds %struct.CalcLangVal, ptr %261, i32 0, i32 0
  store i32 4, ptr %262, align 8
  %263 = load ptr, ptr %6, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 1
  %265 = load double, ptr %264, align 8
  %266 = load ptr, ptr %7, align 8
  %267 = getelementptr inbounds %struct.CalcLangVal, ptr %266, i32 0, i32 1
  %268 = load double, ptr %267, align 8
  %269 = fcmp oeq double %265, %268
  %270 = load ptr, ptr %8, align 8
  %271 = getelementptr inbounds %struct.CalcLangVal, ptr %270, i32 0, i32 1
  %272 = zext i1 %269 to i8
  store i8 %272, ptr %271, align 8
  br label %450

273:                                              ; preds = %255, %250
  %274 = load ptr, ptr %6, align 8
  %275 = getelementptr inbounds %struct.CalcLangVal, ptr %274, i32 0, i32 0
  %276 = load i32, ptr %275, align 8
  %277 = icmp eq i32 %276, 3
  br i1 %277, label %278, label %296

278:                                              ; preds = %273
  %279 = load ptr, ptr %7, align 8
  %280 = getelementptr inbounds %struct.CalcLangVal, ptr %279, i32 0, i32 0
  %281 = load i32, ptr %280, align 8
  %282 = icmp eq i32 %281, 3
  br i1 %282, label %283, label %296

283:                                              ; preds = %278
  %284 = load ptr, ptr %8, align 8
  %285 = getelementptr inbounds %struct.CalcLangVal, ptr %284, i32 0, i32 0
  store i32 4, ptr %285, align 8
  %286 = load ptr, ptr %6, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 1
  %288 = load double, ptr %287, align 8
  %289 = load ptr, ptr %7, align 8
  %290 = getelementptr inbounds %struct.CalcLangVal, ptr %289, i32 0, i32 1
  %291 = load double, ptr %290, align 8
  %292 = fcmp oeq double %288, %291
  %293 = load ptr, ptr %8, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = zext i1 %292 to i8
  store i8 %295, ptr %294, align 8
  br label %449

296:                                              ; preds = %278, %273
  %297 = load ptr, ptr %6, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 0
  %299 = load i32, ptr %298, align 8
  %300 = icmp eq i32 %299, 6
  br i1 %300, label %301, label %371

301:                                              ; preds = %296
  %302 = load ptr, ptr %7, align 8
  %303 = getelementptr inbounds %struct.CalcLangVal, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = icmp eq i32 %304, 6
  br i1 %305, label %306, label %371

306:                                              ; preds = %301
  %307 = load ptr, ptr %6, align 8
  %308 = getelementptr inbounds %struct.CalcLangVal, ptr %307, i32 0, i32 1
  %309 = load ptr, ptr %308, align 8
  store ptr %309, ptr %9, align 8
  %310 = load ptr, ptr %7, align 8
  %311 = getelementptr inbounds %struct.CalcLangVal, ptr %310, i32 0, i32 1
  %312 = load ptr, ptr %311, align 8
  store ptr %312, ptr %10, align 8
  %313 = load ptr, ptr %10, align 8
  %314 = getelementptr inbounds %struct.TupleValue, ptr %313, i32 0, i32 0
  %315 = load i32, ptr %314, align 8
  %316 = load ptr, ptr %9, align 8
  %317 = getelementptr inbounds %struct.TupleValue, ptr %316, i32 0, i32 0
  %318 = load i32, ptr %317, align 8
  %319 = icmp eq i32 %315, %318
  br i1 %319, label %320, label %369

320:                                              ; preds = %306
  store i32 1, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %321

321:                                              ; preds = %358, %320
  %322 = load i32, ptr %12, align 4
  %323 = load ptr, ptr %9, align 8
  %324 = getelementptr inbounds %struct.TupleValue, ptr %323, i32 0, i32 0
  %325 = load i32, ptr %324, align 8
  %326 = icmp slt i32 %322, %325
  br i1 %326, label %327, label %361

327:                                              ; preds = %321
  %328 = load ptr, ptr %5, align 8
  %329 = load ptr, ptr %9, align 8
  %330 = getelementptr inbounds %struct.TupleValue, ptr %329, i32 0, i32 1
  %331 = load ptr, ptr %330, align 8
  %332 = load i32, ptr %12, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds ptr, ptr %331, i64 %333
  %335 = load ptr, ptr %334, align 8
  %336 = load ptr, ptr %10, align 8
  %337 = getelementptr inbounds %struct.TupleValue, ptr %336, i32 0, i32 1
  %338 = load ptr, ptr %337, align 8
  %339 = load i32, ptr %12, align 4
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds ptr, ptr %338, i64 %340
  %342 = load ptr, ptr %341, align 8
  %343 = call ptr @equalsCalcLangValues(ptr noundef %328, ptr noundef %335, ptr noundef %342)
  store ptr %343, ptr %13, align 8
  %344 = load ptr, ptr %13, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = icmp eq i32 %346, 4
  br i1 %347, label %348, label %357

348:                                              ; preds = %327
  %349 = load ptr, ptr %13, align 8
  %350 = getelementptr inbounds %struct.CalcLangVal, ptr %349, i32 0, i32 1
  %351 = load i8, ptr %350, align 8
  %352 = trunc i8 %351 to i1
  %353 = zext i1 %352 to i32
  %354 = icmp eq i32 %353, 0
  br i1 %354, label %355, label %356

355:                                              ; preds = %348
  store i32 0, ptr %11, align 4
  br label %361

356:                                              ; preds = %348
  br label %357

357:                                              ; preds = %356, %327
  br label %358

358:                                              ; preds = %357
  %359 = load i32, ptr %12, align 4
  %360 = add nsw i32 %359, 1
  store i32 %360, ptr %12, align 4
  br label %321, !llvm.loop !99

361:                                              ; preds = %355, %321
  %362 = load ptr, ptr %8, align 8
  %363 = getelementptr inbounds %struct.CalcLangVal, ptr %362, i32 0, i32 0
  store i32 4, ptr %363, align 8
  %364 = load i32, ptr %11, align 4
  %365 = icmp ne i32 %364, 0
  %366 = load ptr, ptr %8, align 8
  %367 = getelementptr inbounds %struct.CalcLangVal, ptr %366, i32 0, i32 1
  %368 = zext i1 %365 to i8
  store i8 %368, ptr %367, align 8
  br label %370

369:                                              ; preds = %306
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %461

370:                                              ; preds = %361
  br label %448

371:                                              ; preds = %301, %296
  %372 = load ptr, ptr %6, align 8
  %373 = getelementptr inbounds %struct.CalcLangVal, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = icmp eq i32 %374, 5
  br i1 %375, label %376, label %446

376:                                              ; preds = %371
  %377 = load ptr, ptr %7, align 8
  %378 = getelementptr inbounds %struct.CalcLangVal, ptr %377, i32 0, i32 0
  %379 = load i32, ptr %378, align 8
  %380 = icmp eq i32 %379, 5
  br i1 %380, label %381, label %446

381:                                              ; preds = %376
  %382 = load ptr, ptr %6, align 8
  %383 = getelementptr inbounds %struct.CalcLangVal, ptr %382, i32 0, i32 1
  %384 = load ptr, ptr %383, align 8
  store ptr %384, ptr %14, align 8
  %385 = load ptr, ptr %7, align 8
  %386 = getelementptr inbounds %struct.CalcLangVal, ptr %385, i32 0, i32 1
  %387 = load ptr, ptr %386, align 8
  store ptr %387, ptr %15, align 8
  %388 = load ptr, ptr %15, align 8
  %389 = getelementptr inbounds %struct.SetValue, ptr %388, i32 0, i32 0
  %390 = load i32, ptr %389, align 8
  %391 = load ptr, ptr %14, align 8
  %392 = getelementptr inbounds %struct.SetValue, ptr %391, i32 0, i32 0
  %393 = load i32, ptr %392, align 8
  %394 = icmp eq i32 %390, %393
  br i1 %394, label %395, label %444

395:                                              ; preds = %381
  store i32 1, ptr %16, align 4
  store i32 0, ptr %17, align 4
  br label %396

396:                                              ; preds = %433, %395
  %397 = load i32, ptr %17, align 4
  %398 = load ptr, ptr %14, align 8
  %399 = getelementptr inbounds %struct.SetValue, ptr %398, i32 0, i32 0
  %400 = load i32, ptr %399, align 8
  %401 = icmp slt i32 %397, %400
  br i1 %401, label %402, label %436

402:                                              ; preds = %396
  %403 = load ptr, ptr %5, align 8
  %404 = load ptr, ptr %14, align 8
  %405 = getelementptr inbounds %struct.SetValue, ptr %404, i32 0, i32 1
  %406 = load ptr, ptr %405, align 8
  %407 = load i32, ptr %17, align 4
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds ptr, ptr %406, i64 %408
  %410 = load ptr, ptr %409, align 8
  %411 = load ptr, ptr %15, align 8
  %412 = getelementptr inbounds %struct.SetValue, ptr %411, i32 0, i32 1
  %413 = load ptr, ptr %412, align 8
  %414 = load i32, ptr %17, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds ptr, ptr %413, i64 %415
  %417 = load ptr, ptr %416, align 8
  %418 = call ptr @equalsCalcLangValues(ptr noundef %403, ptr noundef %410, ptr noundef %417)
  store ptr %418, ptr %18, align 8
  %419 = load ptr, ptr %18, align 8
  %420 = getelementptr inbounds %struct.CalcLangVal, ptr %419, i32 0, i32 0
  %421 = load i32, ptr %420, align 8
  %422 = icmp eq i32 %421, 4
  br i1 %422, label %423, label %432

423:                                              ; preds = %402
  %424 = load ptr, ptr %18, align 8
  %425 = getelementptr inbounds %struct.CalcLangVal, ptr %424, i32 0, i32 1
  %426 = load i8, ptr %425, align 8
  %427 = trunc i8 %426 to i1
  %428 = zext i1 %427 to i32
  %429 = icmp eq i32 %428, 0
  br i1 %429, label %430, label %431

430:                                              ; preds = %423
  store i32 0, ptr %16, align 4
  br label %436

431:                                              ; preds = %423
  br label %432

432:                                              ; preds = %431, %402
  br label %433

433:                                              ; preds = %432
  %434 = load i32, ptr %17, align 4
  %435 = add nsw i32 %434, 1
  store i32 %435, ptr %17, align 4
  br label %396, !llvm.loop !100

436:                                              ; preds = %430, %396
  %437 = load ptr, ptr %8, align 8
  %438 = getelementptr inbounds %struct.CalcLangVal, ptr %437, i32 0, i32 0
  store i32 4, ptr %438, align 8
  %439 = load i32, ptr %16, align 4
  %440 = icmp ne i32 %439, 0
  %441 = load ptr, ptr %8, align 8
  %442 = getelementptr inbounds %struct.CalcLangVal, ptr %441, i32 0, i32 1
  %443 = zext i1 %440 to i8
  store i8 %443, ptr %442, align 8
  br label %445

444:                                              ; preds = %381
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %4, align 8
  br label %461

445:                                              ; preds = %436
  br label %447

446:                                              ; preds = %376, %371
  call void @perror(ptr noundef @.str.2) #6
  store ptr null, ptr %4, align 8
  br label %461

447:                                              ; preds = %445
  br label %448

448:                                              ; preds = %447, %370
  br label %449

449:                                              ; preds = %448, %283
  br label %450

450:                                              ; preds = %449, %260
  br label %451

451:                                              ; preds = %450, %236
  br label %452

452:                                              ; preds = %451, %212
  br label %453

453:                                              ; preds = %452, %189
  br label %454

454:                                              ; preds = %453, %166
  br label %455

455:                                              ; preds = %454, %140
  br label %456

456:                                              ; preds = %455, %114
  br label %457

457:                                              ; preds = %456, %89
  br label %458

458:                                              ; preds = %457, %64
  br label %459

459:                                              ; preds = %458, %37
  %460 = load ptr, ptr %8, align 8
  store ptr %460, ptr %4, align 8
  br label %461

461:                                              ; preds = %459, %446, %444, %369, %24
  %462 = load ptr, ptr %4, align 8
  ret ptr %462
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %7, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store ptr null, ptr %4, align 8
  br label %166

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = call ptr @arenaAlloc(ptr noundef %16, i32 noundef 16)
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %15
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %22
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  store i32 0, ptr %29, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = icmp slt i32 %32, %35
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = zext i1 %36 to i8
  store i8 %39, ptr %38, align 8
  br label %164

40:                                               ; preds = %22, %15
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %64

45:                                               ; preds = %40
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.CalcLangVal, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %64

50:                                               ; preds = %45
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 0
  store i32 1, ptr %52, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = fcmp olt double %55, %58
  %60 = zext i1 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 1
  store double %61, ptr %63, align 8
  br label %163

64:                                               ; preds = %45, %40
  %65 = load ptr, ptr %6, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %88

69:                                               ; preds = %64
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 0
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %88

74:                                               ; preds = %69
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  store i32 1, ptr %76, align 8
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 8
  %80 = sitofp i32 %79 to double
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 1
  %83 = load double, ptr %82, align 8
  %84 = fcmp olt double %80, %83
  %85 = load ptr, ptr %8, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 1
  %87 = zext i1 %84 to i8
  store i8 %87, ptr %86, align 8
  br label %162

88:                                               ; preds = %69, %64
  %89 = load ptr, ptr %6, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 0
  %91 = load i32, ptr %90, align 8
  %92 = icmp eq i32 %91, 1
  br i1 %92, label %93, label %112

93:                                               ; preds = %88
  %94 = load ptr, ptr %7, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %95, align 8
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %112

98:                                               ; preds = %93
  %99 = load ptr, ptr %8, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 0
  store i32 1, ptr %100, align 8
  %101 = load ptr, ptr %6, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 1
  %103 = load double, ptr %102, align 8
  %104 = load ptr, ptr %7, align 8
  %105 = getelementptr inbounds %struct.CalcLangVal, ptr %104, i32 0, i32 1
  %106 = load i32, ptr %105, align 8
  %107 = sitofp i32 %106 to double
  %108 = fcmp olt double %103, %107
  %109 = load ptr, ptr %8, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = zext i1 %108 to i8
  store i8 %111, ptr %110, align 8
  br label %161

112:                                              ; preds = %93, %88
  %113 = load ptr, ptr %6, align 8
  %114 = getelementptr inbounds %struct.CalcLangVal, ptr %113, i32 0, i32 0
  %115 = load i32, ptr %114, align 8
  %116 = icmp eq i32 %115, 2
  br i1 %116, label %117, label %135

117:                                              ; preds = %112
  %118 = load ptr, ptr %7, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 2
  br i1 %121, label %122, label %135

122:                                              ; preds = %117
  %123 = load ptr, ptr %8, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  store i32 2, ptr %124, align 8
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 1
  %127 = load double, ptr %126, align 8
  %128 = load ptr, ptr %7, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 1
  %130 = load double, ptr %129, align 8
  %131 = fcmp olt double %127, %130
  %132 = load ptr, ptr %8, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  %134 = zext i1 %131 to i8
  store i8 %134, ptr %133, align 8
  br label %160

135:                                              ; preds = %117, %112
  %136 = load ptr, ptr %6, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %137, align 8
  %139 = icmp eq i32 %138, 3
  br i1 %139, label %140, label %158

140:                                              ; preds = %135
  %141 = load ptr, ptr %7, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  %143 = load i32, ptr %142, align 8
  %144 = icmp eq i32 %143, 3
  br i1 %144, label %145, label %158

145:                                              ; preds = %140
  %146 = load ptr, ptr %8, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  store i32 3, ptr %147, align 8
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 1
  %150 = load double, ptr %149, align 8
  %151 = load ptr, ptr %7, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load double, ptr %152, align 8
  %154 = fcmp olt double %150, %153
  %155 = load ptr, ptr %8, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  %157 = zext i1 %154 to i8
  store i8 %157, ptr %156, align 8
  br label %159

158:                                              ; preds = %140, %135
  call void @perror(ptr noundef @.str.2) #6
  store ptr null, ptr %4, align 8
  br label %166

159:                                              ; preds = %145
  br label %160

160:                                              ; preds = %159, %122
  br label %161

161:                                              ; preds = %160, %98
  br label %162

162:                                              ; preds = %161, %74
  br label %163

163:                                              ; preds = %162, %50
  br label %164

164:                                              ; preds = %163, %27
  %165 = load ptr, ptr %8, align 8
  store ptr %165, ptr %4, align 8
  br label %166

166:                                              ; preds = %164, %158, %14
  %167 = load ptr, ptr %4, align 8
  ret ptr %167
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %7, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store ptr null, ptr %4, align 8
  br label %169

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = call ptr @arenaAlloc(ptr noundef %16, i32 noundef 16)
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %15
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %22
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  store i32 0, ptr %29, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = icmp sgt i32 %32, %35
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = zext i1 %36 to i8
  store i8 %39, ptr %38, align 8
  br label %167

40:                                               ; preds = %22, %15
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %64

45:                                               ; preds = %40
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.CalcLangVal, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %64

50:                                               ; preds = %45
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 0
  store i32 1, ptr %52, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = fcmp ogt double %55, %58
  %60 = zext i1 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 1
  store double %61, ptr %63, align 8
  br label %166

64:                                               ; preds = %45, %40
  %65 = load ptr, ptr %6, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %89

69:                                               ; preds = %64
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 0
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %89

74:                                               ; preds = %69
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  store i32 1, ptr %76, align 8
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 8
  %80 = sitofp i32 %79 to double
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 1
  %83 = load double, ptr %82, align 8
  %84 = fcmp ogt double %80, %83
  %85 = zext i1 %84 to i32
  %86 = sitofp i32 %85 to double
  %87 = load ptr, ptr %8, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store double %86, ptr %88, align 8
  br label %165

89:                                               ; preds = %69, %64
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %113

94:                                               ; preds = %89
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %113

99:                                               ; preds = %94
  %100 = load ptr, ptr %8, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %7, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load i32, ptr %106, align 8
  %108 = sitofp i32 %107 to double
  %109 = fcmp ogt double %104, %108
  %110 = load ptr, ptr %8, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = zext i1 %109 to i8
  store i8 %112, ptr %111, align 8
  br label %164

113:                                              ; preds = %94, %89
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 0
  %116 = load i32, ptr %115, align 8
  %117 = icmp eq i32 %116, 2
  br i1 %117, label %118, label %137

118:                                              ; preds = %113
  %119 = load ptr, ptr %7, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 2
  br i1 %122, label %123, label %137

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  store i32 2, ptr %125, align 8
  %126 = load ptr, ptr %6, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = load double, ptr %130, align 8
  %132 = fcmp ogt double %128, %131
  %133 = zext i1 %132 to i32
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %163

137:                                              ; preds = %118, %113
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 3
  br i1 %141, label %142, label %161

142:                                              ; preds = %137
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 3
  br i1 %146, label %147, label %161

147:                                              ; preds = %142
  %148 = load ptr, ptr %8, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 3, ptr %149, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %7, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = fcmp ogt double %152, %155
  %157 = zext i1 %156 to i32
  %158 = sitofp i32 %157 to double
  %159 = load ptr, ptr %8, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  store double %158, ptr %160, align 8
  br label %162

161:                                              ; preds = %142, %137
  call void @perror(ptr noundef @.str.2) #6
  br label %162

162:                                              ; preds = %161, %147
  br label %163

163:                                              ; preds = %162, %123
  br label %164

164:                                              ; preds = %163, %99
  br label %165

165:                                              ; preds = %164, %74
  br label %166

166:                                              ; preds = %165, %50
  br label %167

167:                                              ; preds = %166, %27
  %168 = load ptr, ptr %8, align 8
  store ptr %168, ptr %4, align 8
  br label %169

169:                                              ; preds = %167, %14
  %170 = load ptr, ptr %4, align 8
  ret ptr %170
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenOrEqualToCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %7, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store ptr null, ptr %4, align 8
  br label %169

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = call ptr @arenaAlloc(ptr noundef %16, i32 noundef 16)
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %15
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %22
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  store i32 0, ptr %29, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = icmp sle i32 %32, %35
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = zext i1 %36 to i8
  store i8 %39, ptr %38, align 8
  br label %167

40:                                               ; preds = %22, %15
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %64

45:                                               ; preds = %40
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.CalcLangVal, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %64

50:                                               ; preds = %45
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 0
  store i32 1, ptr %52, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = fcmp ole double %55, %58
  %60 = zext i1 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 1
  store double %61, ptr %63, align 8
  br label %166

64:                                               ; preds = %45, %40
  %65 = load ptr, ptr %6, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %89

69:                                               ; preds = %64
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 0
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %89

74:                                               ; preds = %69
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  store i32 1, ptr %76, align 8
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 8
  %80 = sitofp i32 %79 to double
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 1
  %83 = load double, ptr %82, align 8
  %84 = fcmp ole double %80, %83
  %85 = zext i1 %84 to i32
  %86 = sitofp i32 %85 to double
  %87 = load ptr, ptr %8, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store double %86, ptr %88, align 8
  br label %165

89:                                               ; preds = %69, %64
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %113

94:                                               ; preds = %89
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %113

99:                                               ; preds = %94
  %100 = load ptr, ptr %8, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %7, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load i32, ptr %106, align 8
  %108 = sitofp i32 %107 to double
  %109 = fcmp ole double %104, %108
  %110 = load ptr, ptr %8, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = zext i1 %109 to i8
  store i8 %112, ptr %111, align 8
  br label %164

113:                                              ; preds = %94, %89
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 0
  %116 = load i32, ptr %115, align 8
  %117 = icmp eq i32 %116, 2
  br i1 %117, label %118, label %137

118:                                              ; preds = %113
  %119 = load ptr, ptr %7, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 2
  br i1 %122, label %123, label %137

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  store i32 2, ptr %125, align 8
  %126 = load ptr, ptr %6, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = load double, ptr %130, align 8
  %132 = fcmp ole double %128, %131
  %133 = zext i1 %132 to i32
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %163

137:                                              ; preds = %118, %113
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 3
  br i1 %141, label %142, label %161

142:                                              ; preds = %137
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 3
  br i1 %146, label %147, label %161

147:                                              ; preds = %142
  %148 = load ptr, ptr %8, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 3, ptr %149, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %7, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = fcmp ole double %152, %155
  %157 = zext i1 %156 to i32
  %158 = sitofp i32 %157 to double
  %159 = load ptr, ptr %8, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  store double %158, ptr %160, align 8
  br label %162

161:                                              ; preds = %142, %137
  call void @perror(ptr noundef @.str.2) #6
  br label %162

162:                                              ; preds = %161, %147
  br label %163

163:                                              ; preds = %162, %123
  br label %164

164:                                              ; preds = %163, %99
  br label %165

165:                                              ; preds = %164, %74
  br label %166

166:                                              ; preds = %165, %50
  br label %167

167:                                              ; preds = %166, %27
  %168 = load ptr, ptr %8, align 8
  store ptr %168, ptr %4, align 8
  br label %169

169:                                              ; preds = %167, %14
  %170 = load ptr, ptr %4, align 8
  ret ptr %170
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenOrEqualToCalcLangValues(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %7, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store ptr null, ptr %4, align 8
  br label %169

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = call ptr @arenaAlloc(ptr noundef %16, i32 noundef 16)
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %15
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %22
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  store i32 0, ptr %29, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = icmp sge i32 %32, %35
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = zext i1 %36 to i8
  store i8 %39, ptr %38, align 8
  br label %167

40:                                               ; preds = %22, %15
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %64

45:                                               ; preds = %40
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.CalcLangVal, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %64

50:                                               ; preds = %45
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 0
  store i32 1, ptr %52, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = fcmp oge double %55, %58
  %60 = zext i1 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 1
  store double %61, ptr %63, align 8
  br label %166

64:                                               ; preds = %45, %40
  %65 = load ptr, ptr %6, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %89

69:                                               ; preds = %64
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 0
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %89

74:                                               ; preds = %69
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  store i32 1, ptr %76, align 8
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 8
  %80 = sitofp i32 %79 to double
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 1
  %83 = load double, ptr %82, align 8
  %84 = fcmp oge double %80, %83
  %85 = zext i1 %84 to i32
  %86 = sitofp i32 %85 to double
  %87 = load ptr, ptr %8, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store double %86, ptr %88, align 8
  br label %165

89:                                               ; preds = %69, %64
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %113

94:                                               ; preds = %89
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %113

99:                                               ; preds = %94
  %100 = load ptr, ptr %8, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %7, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load i32, ptr %106, align 8
  %108 = sitofp i32 %107 to double
  %109 = fcmp oge double %104, %108
  %110 = load ptr, ptr %8, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = zext i1 %109 to i8
  store i8 %112, ptr %111, align 8
  br label %164

113:                                              ; preds = %94, %89
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 0
  %116 = load i32, ptr %115, align 8
  %117 = icmp eq i32 %116, 2
  br i1 %117, label %118, label %137

118:                                              ; preds = %113
  %119 = load ptr, ptr %7, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 2
  br i1 %122, label %123, label %137

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  store i32 2, ptr %125, align 8
  %126 = load ptr, ptr %6, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = load double, ptr %130, align 8
  %132 = fcmp oge double %128, %131
  %133 = zext i1 %132 to i32
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %163

137:                                              ; preds = %118, %113
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 3
  br i1 %141, label %142, label %161

142:                                              ; preds = %137
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 3
  br i1 %146, label %147, label %161

147:                                              ; preds = %142
  %148 = load ptr, ptr %8, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 3, ptr %149, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %7, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = fcmp oge double %152, %155
  %157 = zext i1 %156 to i32
  %158 = sitofp i32 %157 to double
  %159 = load ptr, ptr %8, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  store double %158, ptr %160, align 8
  br label %162

161:                                              ; preds = %142, %137
  call void @perror(ptr noundef @.str.2) #6
  store ptr null, ptr %4, align 8
  br label %169

162:                                              ; preds = %147
  br label %163

163:                                              ; preds = %162, %123
  br label %164

164:                                              ; preds = %163, %99
  br label %165

165:                                              ; preds = %164, %74
  br label %166

166:                                              ; preds = %165, %50
  br label %167

167:                                              ; preds = %166, %27
  %168 = load ptr, ptr %8, align 8
  store ptr %168, ptr %4, align 8
  br label %169

169:                                              ; preds = %167, %161, %14
  %170 = load ptr, ptr %4, align 8
  ret ptr %170
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @notCalcLangValue(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %209

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @arenaAlloc(ptr noundef %15, i32 noundef 16)
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.CalcLangVal, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %31

21:                                               ; preds = %14
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0
  store i32 4, ptr %23, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  %27 = icmp ne i32 %26, 0
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 1
  %30 = zext i1 %27 to i8
  store i8 %30, ptr %29, align 8
  br label %207

31:                                               ; preds = %14
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds %struct.CalcLangVal, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %46

36:                                               ; preds = %31
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 0
  store i32 4, ptr %38, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  %41 = load double, ptr %40, align 8
  %42 = fcmp une double %41, 0.000000e+00
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 1
  %45 = zext i1 %42 to i8
  store i8 %45, ptr %44, align 8
  br label %206

46:                                               ; preds = %31
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 4
  br i1 %50, label %51, label %62

51:                                               ; preds = %46
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  store i32 4, ptr %53, align 8
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %struct.CalcLangVal, ptr %54, i32 0, i32 1
  %56 = load i8, ptr %55, align 8
  %57 = trunc i8 %56 to i1
  %58 = xor i1 %57, true
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  %61 = zext i1 %58 to i8
  store i8 %61, ptr %60, align 8
  br label %205

62:                                               ; preds = %46
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = icmp eq i32 %65, 6
  br i1 %66, label %67, label %132

67:                                               ; preds = %62
  %68 = load ptr, ptr %4, align 8
  %69 = call ptr @arenaAlloc(ptr noundef %68, i32 noundef 16)
  store ptr %69, ptr %7, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = call ptr @arenaAlloc(ptr noundef %70, i32 noundef 16)
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 1
  store ptr %71, ptr %73, align 8
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds %struct.TupleValue, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds %struct.TupleValue, ptr %81, i32 0, i32 0
  store i32 %78, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.TupleValue, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = sext i32 %88 to i64
  %90 = mul i64 8, %89
  %91 = trunc i64 %90 to i32
  %92 = call ptr @arenaAlloc(ptr noundef %83, i32 noundef %91)
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds %struct.TupleValue, ptr %95, i32 0, i32 1
  store ptr %92, ptr %96, align 8
  store i32 0, ptr %8, align 4
  br label %97

97:                                               ; preds = %125, %67
  %98 = load i32, ptr %8, align 4
  %99 = load ptr, ptr %7, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds %struct.TupleValue, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp slt i32 %98, %103
  br i1 %104, label %105, label %128

105:                                              ; preds = %97
  %106 = load ptr, ptr %4, align 8
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds %struct.TupleValue, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = load i32, ptr %8, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds ptr, ptr %111, i64 %113
  %115 = load ptr, ptr %114, align 8
  %116 = call ptr @notCalcLangValue(ptr noundef %106, ptr noundef %115)
  %117 = load ptr, ptr %7, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = getelementptr inbounds %struct.TupleValue, ptr %119, i32 0, i32 1
  %121 = load ptr, ptr %120, align 8
  %122 = load i32, ptr %8, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds ptr, ptr %121, i64 %123
  store ptr %116, ptr %124, align 8
  br label %125

125:                                              ; preds = %105
  %126 = load i32, ptr %8, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, ptr %8, align 4
  br label %97, !llvm.loop !101

128:                                              ; preds = %97
  %129 = load ptr, ptr %7, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 0
  store i32 6, ptr %130, align 8
  %131 = load ptr, ptr %7, align 8
  store ptr %131, ptr %3, align 8
  br label %209

132:                                              ; preds = %62
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 0
  %135 = load i32, ptr %134, align 8
  %136 = icmp eq i32 %135, 5
  br i1 %136, label %137, label %202

137:                                              ; preds = %132
  %138 = load ptr, ptr %4, align 8
  %139 = call ptr @arenaAlloc(ptr noundef %138, i32 noundef 16)
  store ptr %139, ptr %9, align 8
  %140 = load ptr, ptr %4, align 8
  %141 = call ptr @arenaAlloc(ptr noundef %140, i32 noundef 16)
  %142 = load ptr, ptr %9, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 1
  store ptr %141, ptr %143, align 8
  %144 = load ptr, ptr %5, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 1
  %146 = load ptr, ptr %145, align 8
  %147 = getelementptr inbounds %struct.SetValue, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = load ptr, ptr %9, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 1
  %151 = load ptr, ptr %150, align 8
  %152 = getelementptr inbounds %struct.SetValue, ptr %151, i32 0, i32 0
  store i32 %148, ptr %152, align 8
  %153 = load ptr, ptr %4, align 8
  %154 = load ptr, ptr %9, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr inbounds %struct.SetValue, ptr %156, i32 0, i32 0
  %158 = load i32, ptr %157, align 8
  %159 = sext i32 %158 to i64
  %160 = mul i64 8, %159
  %161 = trunc i64 %160 to i32
  %162 = call ptr @arenaAlloc(ptr noundef %153, i32 noundef %161)
  %163 = load ptr, ptr %9, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 1
  %165 = load ptr, ptr %164, align 8
  %166 = getelementptr inbounds %struct.SetValue, ptr %165, i32 0, i32 1
  store ptr %162, ptr %166, align 8
  store i32 0, ptr %10, align 4
  br label %167

167:                                              ; preds = %195, %137
  %168 = load i32, ptr %10, align 4
  %169 = load ptr, ptr %9, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 1
  %171 = load ptr, ptr %170, align 8
  %172 = getelementptr inbounds %struct.TupleValue, ptr %171, i32 0, i32 0
  %173 = load i32, ptr %172, align 8
  %174 = icmp slt i32 %168, %173
  br i1 %174, label %175, label %198

175:                                              ; preds = %167
  %176 = load ptr, ptr %4, align 8
  %177 = load ptr, ptr %5, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  %179 = load ptr, ptr %178, align 8
  %180 = getelementptr inbounds %struct.SetValue, ptr %179, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = load i32, ptr %10, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds ptr, ptr %181, i64 %183
  %185 = load ptr, ptr %184, align 8
  %186 = call ptr @notCalcLangValue(ptr noundef %176, ptr noundef %185)
  %187 = load ptr, ptr %9, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = getelementptr inbounds %struct.SetValue, ptr %189, i32 0, i32 1
  %191 = load ptr, ptr %190, align 8
  %192 = load i32, ptr %10, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds ptr, ptr %191, i64 %193
  store ptr %186, ptr %194, align 8
  br label %195

195:                                              ; preds = %175
  %196 = load i32, ptr %10, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %10, align 4
  br label %167, !llvm.loop !102

198:                                              ; preds = %167
  %199 = load ptr, ptr %9, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 0
  store i32 5, ptr %200, align 8
  %201 = load ptr, ptr %9, align 8
  store ptr %201, ptr %3, align 8
  br label %209

202:                                              ; preds = %132
  call void @perror(ptr noundef @.str.7) #6
  br label %203

203:                                              ; preds = %202
  br label %204

204:                                              ; preds = %203
  br label %205

205:                                              ; preds = %204, %51
  br label %206

206:                                              ; preds = %205, %36
  br label %207

207:                                              ; preds = %206, %21
  %208 = load ptr, ptr %6, align 8
  store ptr %208, ptr %3, align 8
  br label %209

209:                                              ; preds = %207, %198, %128, %13
  %210 = load ptr, ptr %3, align 8
  ret ptr %210
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @negateCalcLangValue(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %220

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @arenaAlloc(ptr noundef %15, i32 noundef 16)
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.CalcLangVal, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %30

21:                                               ; preds = %14
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0
  store i32 0, ptr %23, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  %27 = sub nsw i32 0, %26
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 1
  store i32 %27, ptr %29, align 8
  br label %218

30:                                               ; preds = %14
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %44

35:                                               ; preds = %30
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.CalcLangVal, ptr %36, i32 0, i32 0
  store i32 1, ptr %37, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 1
  %40 = load double, ptr %39, align 8
  %41 = fneg double %40
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 1
  store double %41, ptr %43, align 8
  br label %217

44:                                               ; preds = %30
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.CalcLangVal, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp eq i32 %47, 2
  br i1 %48, label %49, label %58

49:                                               ; preds = %44
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 0
  store i32 2, ptr %51, align 8
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 1
  %54 = load double, ptr %53, align 8
  %55 = fneg double %54
  %56 = load ptr, ptr %6, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  store double %55, ptr %57, align 8
  br label %216

58:                                               ; preds = %44
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %63, label %72

63:                                               ; preds = %58
  %64 = load ptr, ptr %6, align 8
  %65 = getelementptr inbounds %struct.CalcLangVal, ptr %64, i32 0, i32 0
  store i32 3, ptr %65, align 8
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds %struct.CalcLangVal, ptr %66, i32 0, i32 1
  %68 = load double, ptr %67, align 8
  %69 = fneg double %68
  %70 = load ptr, ptr %6, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 1
  store double %69, ptr %71, align 8
  br label %215

72:                                               ; preds = %58
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = icmp eq i32 %75, 6
  br i1 %76, label %77, label %142

77:                                               ; preds = %72
  %78 = load ptr, ptr %4, align 8
  %79 = call ptr @arenaAlloc(ptr noundef %78, i32 noundef 16)
  store ptr %79, ptr %7, align 8
  %80 = load ptr, ptr %4, align 8
  %81 = call ptr @arenaAlloc(ptr noundef %80, i32 noundef 16)
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  store ptr %81, ptr %83, align 8
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.TupleValue, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 1
  %91 = load ptr, ptr %90, align 8
  %92 = getelementptr inbounds %struct.TupleValue, ptr %91, i32 0, i32 0
  store i32 %88, ptr %92, align 8
  %93 = load ptr, ptr %4, align 8
  %94 = load ptr, ptr %7, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.TupleValue, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = sext i32 %98 to i64
  %100 = mul i64 8, %99
  %101 = trunc i64 %100 to i32
  %102 = call ptr @arenaAlloc(ptr noundef %93, i32 noundef %101)
  %103 = load ptr, ptr %7, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 1
  %105 = load ptr, ptr %104, align 8
  %106 = getelementptr inbounds %struct.TupleValue, ptr %105, i32 0, i32 1
  store ptr %102, ptr %106, align 8
  store i32 0, ptr %8, align 4
  br label %107

107:                                              ; preds = %135, %77
  %108 = load i32, ptr %8, align 4
  %109 = load ptr, ptr %7, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.TupleValue, ptr %111, i32 0, i32 0
  %113 = load i32, ptr %112, align 8
  %114 = icmp slt i32 %108, %113
  br i1 %114, label %115, label %138

115:                                              ; preds = %107
  %116 = load ptr, ptr %4, align 8
  %117 = load ptr, ptr %5, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = getelementptr inbounds %struct.TupleValue, ptr %119, i32 0, i32 1
  %121 = load ptr, ptr %120, align 8
  %122 = load i32, ptr %8, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds ptr, ptr %121, i64 %123
  %125 = load ptr, ptr %124, align 8
  %126 = call ptr @negateCalcLangValue(ptr noundef %116, ptr noundef %125)
  %127 = load ptr, ptr %7, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load ptr, ptr %128, align 8
  %130 = getelementptr inbounds %struct.TupleValue, ptr %129, i32 0, i32 1
  %131 = load ptr, ptr %130, align 8
  %132 = load i32, ptr %8, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds ptr, ptr %131, i64 %133
  store ptr %126, ptr %134, align 8
  br label %135

135:                                              ; preds = %115
  %136 = load i32, ptr %8, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, ptr %8, align 4
  br label %107, !llvm.loop !103

138:                                              ; preds = %107
  %139 = load ptr, ptr %7, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 0
  store i32 6, ptr %140, align 8
  %141 = load ptr, ptr %7, align 8
  store ptr %141, ptr %3, align 8
  br label %220

142:                                              ; preds = %72
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 5
  br i1 %146, label %147, label %212

147:                                              ; preds = %142
  %148 = load ptr, ptr %4, align 8
  %149 = call ptr @arenaAlloc(ptr noundef %148, i32 noundef 16)
  store ptr %149, ptr %9, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = call ptr @arenaAlloc(ptr noundef %150, i32 noundef 16)
  %152 = load ptr, ptr %9, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 1
  store ptr %151, ptr %153, align 8
  %154 = load ptr, ptr %5, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr inbounds %struct.SetValue, ptr %156, i32 0, i32 0
  %158 = load i32, ptr %157, align 8
  %159 = load ptr, ptr %9, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  %161 = load ptr, ptr %160, align 8
  %162 = getelementptr inbounds %struct.SetValue, ptr %161, i32 0, i32 0
  store i32 %158, ptr %162, align 8
  %163 = load ptr, ptr %4, align 8
  %164 = load ptr, ptr %9, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 1
  %166 = load ptr, ptr %165, align 8
  %167 = getelementptr inbounds %struct.SetValue, ptr %166, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = sext i32 %168 to i64
  %170 = mul i64 8, %169
  %171 = trunc i64 %170 to i32
  %172 = call ptr @arenaAlloc(ptr noundef %163, i32 noundef %171)
  %173 = load ptr, ptr %9, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load ptr, ptr %174, align 8
  %176 = getelementptr inbounds %struct.SetValue, ptr %175, i32 0, i32 1
  store ptr %172, ptr %176, align 8
  store i32 0, ptr %10, align 4
  br label %177

177:                                              ; preds = %205, %147
  %178 = load i32, ptr %10, align 4
  %179 = load ptr, ptr %9, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = getelementptr inbounds %struct.TupleValue, ptr %181, i32 0, i32 0
  %183 = load i32, ptr %182, align 8
  %184 = icmp slt i32 %178, %183
  br i1 %184, label %185, label %208

185:                                              ; preds = %177
  %186 = load ptr, ptr %4, align 8
  %187 = load ptr, ptr %5, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = getelementptr inbounds %struct.SetValue, ptr %189, i32 0, i32 1
  %191 = load ptr, ptr %190, align 8
  %192 = load i32, ptr %10, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds ptr, ptr %191, i64 %193
  %195 = load ptr, ptr %194, align 8
  %196 = call ptr @negateCalcLangValue(ptr noundef %186, ptr noundef %195)
  %197 = load ptr, ptr %9, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 1
  %199 = load ptr, ptr %198, align 8
  %200 = getelementptr inbounds %struct.SetValue, ptr %199, i32 0, i32 1
  %201 = load ptr, ptr %200, align 8
  %202 = load i32, ptr %10, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds ptr, ptr %201, i64 %203
  store ptr %196, ptr %204, align 8
  br label %205

205:                                              ; preds = %185
  %206 = load i32, ptr %10, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, ptr %10, align 4
  br label %177, !llvm.loop !104

208:                                              ; preds = %177
  %209 = load ptr, ptr %9, align 8
  %210 = getelementptr inbounds %struct.CalcLangVal, ptr %209, i32 0, i32 0
  store i32 5, ptr %210, align 8
  %211 = load ptr, ptr %9, align 8
  store ptr %211, ptr %3, align 8
  br label %220

212:                                              ; preds = %142
  call void @perror(ptr noundef @.str.8) #6
  br label %213

213:                                              ; preds = %212
  br label %214

214:                                              ; preds = %213
  br label %215

215:                                              ; preds = %214, %63
  br label %216

216:                                              ; preds = %215, %49
  br label %217

217:                                              ; preds = %216, %35
  br label %218

218:                                              ; preds = %217, %21
  %219 = load ptr, ptr %6, align 8
  store ptr %219, ptr %3, align 8
  br label %220

220:                                              ; preds = %218, %208, %138, %13
  %221 = load ptr, ptr %3, align 8
  ret ptr %221
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %167

9:                                                ; preds = %1
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %14, label %24

14:                                               ; preds = %9
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 1
  %17 = load i8, ptr %16, align 8
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %23

21:                                               ; preds = %14
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %23

23:                                               ; preds = %21, %19
  br label %166

24:                                               ; preds = %9
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %24
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %32)
  br label %165

34:                                               ; preds = %24
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = icmp eq i32 %37, 1
  br i1 %38, label %39, label %44

39:                                               ; preds = %34
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.CalcLangVal, ptr %40, i32 0, i32 1
  %42 = load double, ptr %41, align 8
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, double noundef %42)
  br label %164

44:                                               ; preds = %34
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds %struct.CalcLangVal, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp eq i32 %47, 2
  br i1 %48, label %49, label %54

49:                                               ; preds = %44
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, double noundef %52)
  br label %163

54:                                               ; preds = %44
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.CalcLangVal, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 8
  %58 = icmp eq i32 %57, 3
  br i1 %58, label %59, label %64

59:                                               ; preds = %54
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.CalcLangVal, ptr %60, i32 0, i32 1
  %62 = load double, ptr %61, align 8
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, double noundef %62)
  br label %162

64:                                               ; preds = %54
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 6
  br i1 %68, label %69, label %109

69:                                               ; preds = %64
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 0, ptr %3, align 4
  br label %71

71:                                               ; preds = %104, %69
  %72 = load i32, ptr %3, align 4
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %struct.TupleValue, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp slt i32 %72, %77
  br i1 %78, label %79, label %107

79:                                               ; preds = %71
  %80 = load i32, ptr %3, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %92

82:                                               ; preds = %79
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.TupleValue, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = load i32, ptr %3, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds ptr, ptr %87, i64 %89
  %91 = load ptr, ptr %90, align 8
  call void @printValue(ptr noundef %91)
  br label %103

92:                                               ; preds = %79
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %94 = load ptr, ptr %2, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.TupleValue, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = load i32, ptr %3, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds ptr, ptr %98, i64 %100
  %102 = load ptr, ptr %101, align 8
  call void @printValue(ptr noundef %102)
  br label %103

103:                                              ; preds = %92, %82
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %3, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %3, align 4
  br label %71, !llvm.loop !105

107:                                              ; preds = %71
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %161

109:                                              ; preds = %64
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = icmp eq i32 %112, 5
  br i1 %113, label %114, label %154

114:                                              ; preds = %109
  %115 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 0, ptr %4, align 4
  br label %116

116:                                              ; preds = %149, %114
  %117 = load i32, ptr %4, align 4
  %118 = load ptr, ptr %2, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 1
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds %struct.SetValue, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp slt i32 %117, %122
  br i1 %123, label %124, label %152

124:                                              ; preds = %116
  %125 = load i32, ptr %4, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %137

127:                                              ; preds = %124
  %128 = load ptr, ptr %2, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 1
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr inbounds %struct.SetValue, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = load i32, ptr %4, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds ptr, ptr %132, i64 %134
  %136 = load ptr, ptr %135, align 8
  call void @printValue(ptr noundef %136)
  br label %148

137:                                              ; preds = %124
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %139 = load ptr, ptr %2, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = getelementptr inbounds %struct.SetValue, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  %144 = load i32, ptr %4, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds ptr, ptr %143, i64 %145
  %147 = load ptr, ptr %146, align 8
  call void @printValue(ptr noundef %147)
  br label %148

148:                                              ; preds = %137, %127
  br label %149

149:                                              ; preds = %148
  %150 = load i32, ptr %4, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %4, align 4
  br label %116, !llvm.loop !106

152:                                              ; preds = %116
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %160

154:                                              ; preds = %109
  %155 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %156 = load ptr, ptr %2, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 0
  %158 = load i32, ptr %157, align 8
  %159 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %158)
  br label %160

160:                                              ; preds = %154, %152
  br label %161

161:                                              ; preds = %160, %107
  br label %162

162:                                              ; preds = %161, %59
  br label %163

163:                                              ; preds = %162, %49
  br label %164

164:                                              ; preds = %163, %39
  br label %165

165:                                              ; preds = %164, %29
  br label %166

166:                                              ; preds = %165, %23
  br label %167

167:                                              ; preds = %166, %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printString(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, ptr noundef %3)
  %5 = load ptr, ptr @stdout, align 8
  %6 = call i32 @fflush(ptr noundef %5)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @getInput() #0 {
  %1 = alloca i8, align 1
  br label %2

2:                                                ; preds = %0, %9
  %3 = call i32 @getchar()
  %4 = trunc i32 %3 to i8
  store i8 %4, ptr %1, align 1
  %5 = load i8, ptr %1, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 10
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %10

9:                                                ; preds = %2
  br label %2

10:                                               ; preds = %8
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @copyValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %152

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 6
  br i1 %17, label %18, label %78

18:                                               ; preds = %13
  %19 = call noalias ptr @malloc(i64 noundef 16) #8
  store ptr %19, ptr %4, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  store i32 6, ptr %21, align 8
  %22 = call noalias ptr @malloc(i64 noundef 16) #8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 1
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.TupleValue, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.TupleValue, ptr %32, i32 0, i32 0
  store i32 %29, ptr %33, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.TupleValue, ptr %36, i32 0, i32 0
  %38 = load i32, ptr %37, align 8
  %39 = sext i32 %38 to i64
  %40 = mul i64 8, %39
  %41 = call noalias ptr @malloc(i64 noundef %40) #8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.TupleValue, ptr %44, i32 0, i32 1
  store ptr %41, ptr %45, align 8
  store i32 0, ptr %5, align 4
  br label %46

46:                                               ; preds = %73, %18
  %47 = load i32, ptr %5, align 4
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.SetValue, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  %53 = icmp slt i32 %47, %52
  br i1 %53, label %54, label %76

54:                                               ; preds = %46
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds %struct.CalcLangVal, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.TupleValue, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = load i32, ptr %5, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds ptr, ptr %59, i64 %61
  %63 = load ptr, ptr %62, align 8
  %64 = call ptr @copyValue(ptr noundef %63)
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 1
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.TupleValue, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %5, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  store ptr %64, ptr %72, align 8
  br label %73

73:                                               ; preds = %54
  %74 = load i32, ptr %5, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %5, align 4
  br label %46, !llvm.loop !107

76:                                               ; preds = %46
  %77 = load ptr, ptr %4, align 8
  store ptr %77, ptr %2, align 8
  br label %152

78:                                               ; preds = %13
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 5
  br i1 %82, label %83, label %143

83:                                               ; preds = %78
  %84 = call noalias ptr @malloc(i64 noundef 16) #8
  store ptr %84, ptr %6, align 8
  %85 = load ptr, ptr %6, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 5, ptr %86, align 8
  %87 = call noalias ptr @malloc(i64 noundef 16) #8
  %88 = load ptr, ptr %6, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %3, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.SetValue, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = load ptr, ptr %6, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds %struct.SetValue, ptr %97, i32 0, i32 0
  store i32 %94, ptr %98, align 8
  %99 = load ptr, ptr %3, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds %struct.SetValue, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = sext i32 %103 to i64
  %105 = mul i64 8, %104
  %106 = call noalias ptr @malloc(i64 noundef %105) #8
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds %struct.SetValue, ptr %109, i32 0, i32 1
  store ptr %106, ptr %110, align 8
  store i32 0, ptr %7, align 4
  br label %111

111:                                              ; preds = %138, %83
  %112 = load i32, ptr %7, align 4
  %113 = load ptr, ptr %6, align 8
  %114 = getelementptr inbounds %struct.CalcLangVal, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = getelementptr inbounds %struct.SetValue, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp slt i32 %112, %117
  br i1 %118, label %119, label %141

119:                                              ; preds = %111
  %120 = load ptr, ptr %3, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr inbounds %struct.SetValue, ptr %122, i32 0, i32 1
  %124 = load ptr, ptr %123, align 8
  %125 = load i32, ptr %7, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds ptr, ptr %124, i64 %126
  %128 = load ptr, ptr %127, align 8
  %129 = call ptr @copyValue(ptr noundef %128)
  %130 = load ptr, ptr %6, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds %struct.SetValue, ptr %132, i32 0, i32 1
  %134 = load ptr, ptr %133, align 8
  %135 = load i32, ptr %7, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds ptr, ptr %134, i64 %136
  store ptr %129, ptr %137, align 8
  br label %138

138:                                              ; preds = %119
  %139 = load i32, ptr %7, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %7, align 4
  br label %111, !llvm.loop !108

141:                                              ; preds = %111
  %142 = load ptr, ptr %6, align 8
  store ptr %142, ptr %2, align 8
  br label %152

143:                                              ; preds = %78
  store i32 16, ptr %8, align 4
  %144 = load i32, ptr %8, align 4
  %145 = sext i32 %144 to i64
  %146 = call noalias ptr @malloc(i64 noundef %145) #8
  store ptr %146, ptr %9, align 8
  %147 = load ptr, ptr %9, align 8
  %148 = load ptr, ptr %3, align 8
  %149 = load i32, ptr %8, align 4
  %150 = sext i32 %149 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %147, ptr align 8 %148, i64 %150, i1 false)
  %151 = load ptr, ptr %9, align 8
  store ptr %151, ptr %2, align 8
  br label %152

152:                                              ; preds = %143, %141, %76, %12
  %153 = load ptr, ptr %2, align 8
  ret ptr %153
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @freeCalcLangValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %68

9:                                                ; preds = %1
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 6
  br i1 %13, label %14, label %37

14:                                               ; preds = %9
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %18

18:                                               ; preds = %32, %14
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.TupleValue, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %35

24:                                               ; preds = %18
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.TupleValue, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29
  %31 = load ptr, ptr %30, align 8
  call void @freeCalcLangValue(ptr noundef %31)
  br label %32

32:                                               ; preds = %24
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  br label %18, !llvm.loop !109

35:                                               ; preds = %18
  %36 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %36) #7
  br label %66

37:                                               ; preds = %9
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 5
  br i1 %41, label %42, label %65

42:                                               ; preds = %37
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  store ptr %45, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %46

46:                                               ; preds = %60, %42
  %47 = load i32, ptr %6, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.SetValue, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = icmp slt i32 %47, %50
  br i1 %51, label %52, label %63

52:                                               ; preds = %46
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.SetValue, ptr %53, i32 0, i32 1
  %55 = load ptr, ptr %54, align 8
  %56 = load i32, ptr %6, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds ptr, ptr %55, i64 %57
  %59 = load ptr, ptr %58, align 8
  call void @freeCalcLangValue(ptr noundef %59)
  br label %60

60:                                               ; preds = %52
  %61 = load i32, ptr %6, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %6, align 4
  br label %46, !llvm.loop !110

63:                                               ; preds = %46
  %64 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %64) #7
  br label %65

65:                                               ; preds = %63, %37
  br label %66

66:                                               ; preds = %65, %35
  %67 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %67) #7
  br label %68

68:                                               ; preds = %66, %1
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { cold }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
!78 = distinct !{!78, !7}
!79 = distinct !{!79, !7}
!80 = distinct !{!80, !7}
!81 = distinct !{!81, !7}
!82 = distinct !{!82, !7}
!83 = distinct !{!83, !7}
!84 = distinct !{!84, !7}
!85 = distinct !{!85, !7}
!86 = distinct !{!86, !7}
!87 = distinct !{!87, !7}
!88 = distinct !{!88, !7}
!89 = distinct !{!89, !7}
!90 = distinct !{!90, !7}
!91 = distinct !{!91, !7}
!92 = distinct !{!92, !7}
!93 = distinct !{!93, !7}
!94 = distinct !{!94, !7}
!95 = distinct !{!95, !7}
!96 = distinct !{!96, !7}
!97 = distinct !{!97, !7}
!98 = distinct !{!98, !7}
!99 = distinct !{!99, !7}
!100 = distinct !{!100, !7}
!101 = distinct !{!101, !7}
!102 = distinct !{!102, !7}
!103 = distinct !{!103, !7}
!104 = distinct !{!104, !7}
!105 = distinct !{!105, !7}
!106 = distinct !{!106, !7}
!107 = distinct !{!107, !7}
!108 = distinct !{!108, !7}
!109 = distinct !{!109, !7}
!110 = distinct !{!110, !7}
