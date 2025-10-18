; ModuleID = 'src/c/LinkToCalcLang.c'
source_filename = "src/c/LinkToCalcLang.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { ptr }
%struct.SetValue = type { i32, ptr }
%struct.TupleValue = type { i32, ptr }

@.str = private unnamed_addr constant [39 x i8] c"Click Enter to view next line of text\0A\00", align 1
@header = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [42 x i8] c"Invalid type to transofrm into Bool found\00", align 1
@.str.2 = private unnamed_addr constant [48 x i8] c"Error Tuple sizes in expression do not match!!!\00", align 1
@.str.3 = private unnamed_addr constant [51 x i8] c"Invalid types found for CalcLangAddition Operation\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Mismatched tup for size\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"Invalid type for dot product expected Tuple and Tuple\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Invalid type for not operation\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"Invalid type for negate operation\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"TRUE\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"FALSE\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"$%f\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"%f%%\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"Cant print type for specified CalcLangValue!!!\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@stdout = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @integerCalcLangValue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 0, ptr %6, align 8
  %7 = load i32, ptr %2, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 1
  store i32 %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @booleanCalcLangValue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 5, ptr %6, align 8
  %7 = load i32, ptr %2, align 4
  %8 = icmp ne i32 %7, 0
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.CalcLangVal, ptr %9, i32 0, i32 1
  %11 = zext i1 %8 to i8
  store i8 %11, ptr %10, align 8
  %12 = load ptr, ptr %3, align 8
  ret ptr %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @realCalcLangValue(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca ptr, align 8
  store float %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 1, ptr %6, align 8
  %7 = load float, ptr %2, align 4
  %8 = fpext float %7 to double
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.CalcLangVal, ptr %9, i32 0, i32 1
  store double %8, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  ret ptr %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dollarCalcLangValue(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca ptr, align 8
  store float %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 3, ptr %6, align 8
  %7 = load float, ptr %2, align 4
  %8 = fpext float %7 to double
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.CalcLangVal, ptr %9, i32 0, i32 1
  store double %8, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  ret ptr %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @percentCalcLangValue(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca ptr, align 8
  store float %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 4, ptr %6, align 8
  %7 = load float, ptr %2, align 4
  %8 = fpext float %7 to double
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.CalcLangVal, ptr %9, i32 0, i32 1
  store double %8, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  ret ptr %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @setCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.CalcLangVal, ptr %7, i32 0, i32 0
  store i32 6, ptr %8, align 8
  %9 = call noalias ptr @malloc(i64 noundef 16) #6
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 1
  store ptr %9, ptr %11, align 8
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.CalcLangVal, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SetValue, ptr %15, i32 0, i32 0
  store i32 %12, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SetValue, ptr %20, i32 0, i32 1
  store ptr %17, ptr %21, align 8
  %22 = load ptr, ptr %5, align 8
  ret ptr %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @tupleCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.CalcLangVal, ptr %7, i32 0, i32 0
  store i32 7, ptr %8, align 8
  %9 = call noalias ptr @malloc(i64 noundef 16) #6
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 1
  store ptr %9, ptr %11, align 8
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.CalcLangVal, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SetValue, ptr %15, i32 0, i32 0
  store i32 %12, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.CalcLangVal, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SetValue, ptr %20, i32 0, i32 1
  store ptr %17, ptr %21, align 8
  %22 = load ptr, ptr %5, align 8
  ret ptr %22
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
  %27 = icmp eq i32 %26, 3
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
  %37 = icmp eq i32 %36, 5
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
  %47 = icmp eq i32 %46, 4
  br i1 %47, label %48, label %53

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 1
  %51 = load double, ptr %50, align 8
  %52 = fcmp une double %51, 0.000000e+00
  store i1 %52, ptr %2, align 1
  br label %54

53:                                               ; preds = %43
  call void @perror(ptr noundef @.str.1) #7
  store i1 true, ptr %2, align 1
  br label %54

54:                                               ; preds = %53, %48, %38, %28, %18, %8
  %55 = load i1, ptr %2, align 1
  ret i1 %55
}

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @addCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %2
  %66 = load ptr, ptr %5, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %69

68:                                               ; preds = %65, %2
  store ptr null, ptr %3, align 8
  br label %1347

69:                                               ; preds = %65
  %70 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %70, ptr %6, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %92

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %92

80:                                               ; preds = %75
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 0
  store i32 0, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = add nsw i32 %85, %88
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  store i32 %89, ptr %91, align 8
  br label %1345

92:                                               ; preds = %75, %69
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = icmp eq i32 %95, 1
  br i1 %96, label %97, label %114

97:                                               ; preds = %92
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %114

102:                                              ; preds = %97
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 0
  store i32 1, ptr %104, align 8
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = fadd double %107, %110
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store double %111, ptr %113, align 8
  br label %1344

114:                                              ; preds = %97, %92
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %137

119:                                              ; preds = %114
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 1
  br i1 %123, label %124, label %137

124:                                              ; preds = %119
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 1, ptr %126, align 8
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load i32, ptr %128, align 8
  %130 = sitofp i32 %129 to double
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load double, ptr %132, align 8
  %134 = fadd double %130, %133
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %1343

137:                                              ; preds = %119, %114
  %138 = load ptr, ptr %4, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %160

142:                                              ; preds = %137
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %160

147:                                              ; preds = %142
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 1, ptr %149, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load i32, ptr %154, align 8
  %156 = sitofp i32 %155 to double
  %157 = fadd double %152, %156
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 1
  store double %157, ptr %159, align 8
  br label %1342

160:                                              ; preds = %142, %137
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 0
  %163 = load i32, ptr %162, align 8
  %164 = icmp eq i32 %163, 3
  br i1 %164, label %165, label %182

165:                                              ; preds = %160
  %166 = load ptr, ptr %5, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = icmp eq i32 %168, 3
  br i1 %169, label %170, label %182

170:                                              ; preds = %165
  %171 = load ptr, ptr %6, align 8
  %172 = getelementptr inbounds %struct.CalcLangVal, ptr %171, i32 0, i32 0
  store i32 3, ptr %172, align 8
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = load ptr, ptr %5, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = fadd double %175, %178
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  store double %179, ptr %181, align 8
  br label %1341

182:                                              ; preds = %165, %160
  %183 = load ptr, ptr %4, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 0
  %185 = load i32, ptr %184, align 8
  %186 = icmp eq i32 %185, 4
  br i1 %186, label %187, label %204

187:                                              ; preds = %182
  %188 = load ptr, ptr %5, align 8
  %189 = getelementptr inbounds %struct.CalcLangVal, ptr %188, i32 0, i32 0
  %190 = load i32, ptr %189, align 8
  %191 = icmp eq i32 %190, 4
  br i1 %191, label %192, label %204

192:                                              ; preds = %187
  %193 = load ptr, ptr %6, align 8
  %194 = getelementptr inbounds %struct.CalcLangVal, ptr %193, i32 0, i32 0
  store i32 4, ptr %194, align 8
  %195 = load ptr, ptr %4, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 1
  %197 = load double, ptr %196, align 8
  %198 = load ptr, ptr %5, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 1
  %200 = load double, ptr %199, align 8
  %201 = fadd double %197, %200
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  store double %201, ptr %203, align 8
  br label %1340

204:                                              ; preds = %187, %182
  %205 = load ptr, ptr %4, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 0
  %207 = load i32, ptr %206, align 8
  %208 = icmp eq i32 %207, 7
  br i1 %208, label %209, label %282

209:                                              ; preds = %204
  %210 = load ptr, ptr %5, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 0
  %212 = load i32, ptr %211, align 8
  %213 = icmp eq i32 %212, 7
  br i1 %213, label %214, label %282

214:                                              ; preds = %209
  %215 = load ptr, ptr %4, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  store ptr %217, ptr %7, align 8
  %218 = load ptr, ptr %5, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 1
  %220 = load ptr, ptr %219, align 8
  store ptr %220, ptr %8, align 8
  %221 = load ptr, ptr %8, align 8
  %222 = getelementptr inbounds %struct.TupleValue, ptr %221, i32 0, i32 0
  %223 = load i32, ptr %222, align 8
  %224 = load ptr, ptr %7, align 8
  %225 = getelementptr inbounds %struct.TupleValue, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 8
  %227 = icmp eq i32 %223, %226
  br i1 %227, label %228, label %280

228:                                              ; preds = %214
  %229 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %229, ptr %9, align 8
  %230 = load ptr, ptr %7, align 8
  %231 = getelementptr inbounds %struct.TupleValue, ptr %230, i32 0, i32 0
  %232 = load i32, ptr %231, align 8
  %233 = load ptr, ptr %9, align 8
  %234 = getelementptr inbounds %struct.TupleValue, ptr %233, i32 0, i32 0
  store i32 %232, ptr %234, align 8
  %235 = load ptr, ptr %9, align 8
  %236 = getelementptr inbounds %struct.TupleValue, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %236, align 8
  %238 = sext i32 %237 to i64
  %239 = mul i64 8, %238
  %240 = call noalias ptr @malloc(i64 noundef %239) #6
  %241 = load ptr, ptr %9, align 8
  %242 = getelementptr inbounds %struct.TupleValue, ptr %241, i32 0, i32 1
  store ptr %240, ptr %242, align 8
  store i32 0, ptr %10, align 4
  br label %243

243:                                              ; preds = %271, %228
  %244 = load i32, ptr %10, align 4
  %245 = load ptr, ptr %7, align 8
  %246 = getelementptr inbounds %struct.TupleValue, ptr %245, i32 0, i32 0
  %247 = load i32, ptr %246, align 8
  %248 = icmp slt i32 %244, %247
  br i1 %248, label %249, label %274

249:                                              ; preds = %243
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds %struct.TupleValue, ptr %250, i32 0, i32 1
  %252 = load ptr, ptr %251, align 8
  %253 = load i32, ptr %10, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds ptr, ptr %252, i64 %254
  %256 = load ptr, ptr %255, align 8
  %257 = load ptr, ptr %8, align 8
  %258 = getelementptr inbounds %struct.TupleValue, ptr %257, i32 0, i32 1
  %259 = load ptr, ptr %258, align 8
  %260 = load i32, ptr %10, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds ptr, ptr %259, i64 %261
  %263 = load ptr, ptr %262, align 8
  %264 = call ptr @addCalcLangValues(ptr noundef %256, ptr noundef %263)
  %265 = load ptr, ptr %9, align 8
  %266 = getelementptr inbounds %struct.TupleValue, ptr %265, i32 0, i32 1
  %267 = load ptr, ptr %266, align 8
  %268 = load i32, ptr %10, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds ptr, ptr %267, i64 %269
  store ptr %264, ptr %270, align 8
  br label %271

271:                                              ; preds = %249
  %272 = load i32, ptr %10, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, ptr %10, align 4
  br label %243, !llvm.loop !6

274:                                              ; preds = %243
  %275 = load ptr, ptr %6, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 0
  store i32 7, ptr %276, align 8
  %277 = load ptr, ptr %9, align 8
  %278 = load ptr, ptr %6, align 8
  %279 = getelementptr inbounds %struct.CalcLangVal, ptr %278, i32 0, i32 1
  store ptr %277, ptr %279, align 8
  br label %281

280:                                              ; preds = %214
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1347

281:                                              ; preds = %274
  br label %1339

282:                                              ; preds = %209, %204
  %283 = load ptr, ptr %4, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 0
  %285 = load i32, ptr %284, align 8
  %286 = icmp eq i32 %285, 7
  br i1 %286, label %287, label %344

287:                                              ; preds = %282
  %288 = load ptr, ptr %5, align 8
  %289 = getelementptr inbounds %struct.CalcLangVal, ptr %288, i32 0, i32 0
  %290 = load i32, ptr %289, align 8
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %292, label %344

292:                                              ; preds = %287
  %293 = load ptr, ptr %4, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = load ptr, ptr %294, align 8
  store ptr %295, ptr %11, align 8
  %296 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %296, ptr %12, align 8
  %297 = load ptr, ptr %11, align 8
  %298 = getelementptr inbounds %struct.TupleValue, ptr %297, i32 0, i32 0
  %299 = load i32, ptr %298, align 8
  %300 = load ptr, ptr %12, align 8
  %301 = getelementptr inbounds %struct.TupleValue, ptr %300, i32 0, i32 0
  store i32 %299, ptr %301, align 8
  %302 = load ptr, ptr %12, align 8
  %303 = getelementptr inbounds %struct.TupleValue, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = sext i32 %304 to i64
  %306 = mul i64 8, %305
  %307 = call noalias ptr @malloc(i64 noundef %306) #6
  %308 = load ptr, ptr %12, align 8
  %309 = getelementptr inbounds %struct.TupleValue, ptr %308, i32 0, i32 1
  store ptr %307, ptr %309, align 8
  store i32 0, ptr %13, align 4
  br label %310

310:                                              ; preds = %333, %292
  %311 = load i32, ptr %13, align 4
  %312 = load ptr, ptr %11, align 8
  %313 = getelementptr inbounds %struct.TupleValue, ptr %312, i32 0, i32 0
  %314 = load i32, ptr %313, align 8
  %315 = icmp slt i32 %311, %314
  br i1 %315, label %316, label %336

316:                                              ; preds = %310
  %317 = load ptr, ptr %11, align 8
  %318 = getelementptr inbounds %struct.TupleValue, ptr %317, i32 0, i32 1
  %319 = load ptr, ptr %318, align 8
  %320 = load i32, ptr %13, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds ptr, ptr %319, i64 %321
  %323 = load ptr, ptr %322, align 8
  %324 = load ptr, ptr %5, align 8
  %325 = call ptr @copyValue(ptr noundef %324)
  %326 = call ptr @addCalcLangValues(ptr noundef %323, ptr noundef %325)
  %327 = load ptr, ptr %12, align 8
  %328 = getelementptr inbounds %struct.TupleValue, ptr %327, i32 0, i32 1
  %329 = load ptr, ptr %328, align 8
  %330 = load i32, ptr %13, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds ptr, ptr %329, i64 %331
  store ptr %326, ptr %332, align 8
  br label %333

333:                                              ; preds = %316
  %334 = load i32, ptr %13, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, ptr %13, align 4
  br label %310, !llvm.loop !8

336:                                              ; preds = %310
  %337 = load ptr, ptr %6, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 0
  store i32 7, ptr %338, align 8
  %339 = load ptr, ptr %12, align 8
  %340 = load ptr, ptr %6, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 1
  store ptr %339, ptr %341, align 8
  %342 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %342)
  %343 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %343)
  br label %1338

344:                                              ; preds = %287, %282
  %345 = load ptr, ptr %4, align 8
  %346 = getelementptr inbounds %struct.CalcLangVal, ptr %345, i32 0, i32 0
  %347 = load i32, ptr %346, align 8
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %349, label %404

349:                                              ; preds = %344
  %350 = load ptr, ptr %5, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 0
  %352 = load i32, ptr %351, align 8
  %353 = icmp eq i32 %352, 7
  br i1 %353, label %354, label %404

354:                                              ; preds = %349
  %355 = load ptr, ptr %5, align 8
  %356 = getelementptr inbounds %struct.CalcLangVal, ptr %355, i32 0, i32 1
  %357 = load ptr, ptr %356, align 8
  store ptr %357, ptr %14, align 8
  %358 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %358, ptr %15, align 8
  %359 = load ptr, ptr %14, align 8
  %360 = getelementptr inbounds %struct.TupleValue, ptr %359, i32 0, i32 0
  %361 = load i32, ptr %360, align 8
  %362 = load ptr, ptr %15, align 8
  %363 = getelementptr inbounds %struct.TupleValue, ptr %362, i32 0, i32 0
  store i32 %361, ptr %363, align 8
  %364 = load ptr, ptr %15, align 8
  %365 = getelementptr inbounds %struct.TupleValue, ptr %364, i32 0, i32 0
  %366 = load i32, ptr %365, align 8
  %367 = sext i32 %366 to i64
  %368 = mul i64 8, %367
  %369 = call noalias ptr @malloc(i64 noundef %368) #6
  %370 = load ptr, ptr %15, align 8
  %371 = getelementptr inbounds %struct.TupleValue, ptr %370, i32 0, i32 1
  store ptr %369, ptr %371, align 8
  store i32 0, ptr %16, align 4
  br label %372

372:                                              ; preds = %395, %354
  %373 = load i32, ptr %16, align 4
  %374 = load ptr, ptr %14, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 0
  %376 = load i32, ptr %375, align 8
  %377 = icmp slt i32 %373, %376
  br i1 %377, label %378, label %398

378:                                              ; preds = %372
  %379 = load ptr, ptr %4, align 8
  %380 = call ptr @copyValue(ptr noundef %379)
  %381 = load ptr, ptr %14, align 8
  %382 = getelementptr inbounds %struct.TupleValue, ptr %381, i32 0, i32 1
  %383 = load ptr, ptr %382, align 8
  %384 = load i32, ptr %16, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds ptr, ptr %383, i64 %385
  %387 = load ptr, ptr %386, align 8
  %388 = call ptr @addCalcLangValues(ptr noundef %380, ptr noundef %387)
  %389 = load ptr, ptr %15, align 8
  %390 = getelementptr inbounds %struct.TupleValue, ptr %389, i32 0, i32 1
  %391 = load ptr, ptr %390, align 8
  %392 = load i32, ptr %16, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds ptr, ptr %391, i64 %393
  store ptr %388, ptr %394, align 8
  br label %395

395:                                              ; preds = %378
  %396 = load i32, ptr %16, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, ptr %16, align 4
  br label %372, !llvm.loop !9

398:                                              ; preds = %372
  %399 = load ptr, ptr %6, align 8
  %400 = getelementptr inbounds %struct.CalcLangVal, ptr %399, i32 0, i32 0
  store i32 7, ptr %400, align 8
  %401 = load ptr, ptr %15, align 8
  %402 = load ptr, ptr %6, align 8
  %403 = getelementptr inbounds %struct.CalcLangVal, ptr %402, i32 0, i32 1
  store ptr %401, ptr %403, align 8
  br label %1337

404:                                              ; preds = %349, %344
  %405 = load ptr, ptr %4, align 8
  %406 = getelementptr inbounds %struct.CalcLangVal, ptr %405, i32 0, i32 0
  %407 = load i32, ptr %406, align 8
  %408 = icmp eq i32 %407, 7
  br i1 %408, label %409, label %464

409:                                              ; preds = %404
  %410 = load ptr, ptr %5, align 8
  %411 = getelementptr inbounds %struct.CalcLangVal, ptr %410, i32 0, i32 0
  %412 = load i32, ptr %411, align 8
  %413 = icmp eq i32 %412, 1
  br i1 %413, label %414, label %464

414:                                              ; preds = %409
  %415 = load ptr, ptr %4, align 8
  %416 = getelementptr inbounds %struct.CalcLangVal, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  store ptr %417, ptr %17, align 8
  %418 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %418, ptr %18, align 8
  %419 = load ptr, ptr %17, align 8
  %420 = getelementptr inbounds %struct.TupleValue, ptr %419, i32 0, i32 0
  %421 = load i32, ptr %420, align 8
  %422 = load ptr, ptr %18, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 0
  store i32 %421, ptr %423, align 8
  %424 = load ptr, ptr %18, align 8
  %425 = getelementptr inbounds %struct.TupleValue, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = sext i32 %426 to i64
  %428 = mul i64 8, %427
  %429 = call noalias ptr @malloc(i64 noundef %428) #6
  %430 = load ptr, ptr %18, align 8
  %431 = getelementptr inbounds %struct.TupleValue, ptr %430, i32 0, i32 1
  store ptr %429, ptr %431, align 8
  store i32 0, ptr %19, align 4
  br label %432

432:                                              ; preds = %455, %414
  %433 = load i32, ptr %19, align 4
  %434 = load ptr, ptr %17, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  %436 = load i32, ptr %435, align 8
  %437 = icmp slt i32 %433, %436
  br i1 %437, label %438, label %458

438:                                              ; preds = %432
  %439 = load ptr, ptr %17, align 8
  %440 = getelementptr inbounds %struct.TupleValue, ptr %439, i32 0, i32 1
  %441 = load ptr, ptr %440, align 8
  %442 = load i32, ptr %19, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds ptr, ptr %441, i64 %443
  %445 = load ptr, ptr %444, align 8
  %446 = load ptr, ptr %5, align 8
  %447 = call ptr @copyValue(ptr noundef %446)
  %448 = call ptr @addCalcLangValues(ptr noundef %445, ptr noundef %447)
  %449 = load ptr, ptr %18, align 8
  %450 = getelementptr inbounds %struct.TupleValue, ptr %449, i32 0, i32 1
  %451 = load ptr, ptr %450, align 8
  %452 = load i32, ptr %19, align 4
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds ptr, ptr %451, i64 %453
  store ptr %448, ptr %454, align 8
  br label %455

455:                                              ; preds = %438
  %456 = load i32, ptr %19, align 4
  %457 = add nsw i32 %456, 1
  store i32 %457, ptr %19, align 4
  br label %432, !llvm.loop !10

458:                                              ; preds = %432
  %459 = load ptr, ptr %6, align 8
  %460 = getelementptr inbounds %struct.CalcLangVal, ptr %459, i32 0, i32 0
  store i32 7, ptr %460, align 8
  %461 = load ptr, ptr %18, align 8
  %462 = load ptr, ptr %6, align 8
  %463 = getelementptr inbounds %struct.CalcLangVal, ptr %462, i32 0, i32 1
  store ptr %461, ptr %463, align 8
  br label %1336

464:                                              ; preds = %409, %404
  %465 = load ptr, ptr %4, align 8
  %466 = getelementptr inbounds %struct.CalcLangVal, ptr %465, i32 0, i32 0
  %467 = load i32, ptr %466, align 8
  %468 = icmp eq i32 %467, 1
  br i1 %468, label %469, label %524

469:                                              ; preds = %464
  %470 = load ptr, ptr %5, align 8
  %471 = getelementptr inbounds %struct.CalcLangVal, ptr %470, i32 0, i32 0
  %472 = load i32, ptr %471, align 8
  %473 = icmp eq i32 %472, 7
  br i1 %473, label %474, label %524

474:                                              ; preds = %469
  %475 = load ptr, ptr %5, align 8
  %476 = getelementptr inbounds %struct.CalcLangVal, ptr %475, i32 0, i32 1
  %477 = load ptr, ptr %476, align 8
  store ptr %477, ptr %20, align 8
  %478 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %478, ptr %21, align 8
  %479 = load ptr, ptr %20, align 8
  %480 = getelementptr inbounds %struct.TupleValue, ptr %479, i32 0, i32 0
  %481 = load i32, ptr %480, align 8
  %482 = load ptr, ptr %21, align 8
  %483 = getelementptr inbounds %struct.TupleValue, ptr %482, i32 0, i32 0
  store i32 %481, ptr %483, align 8
  %484 = load ptr, ptr %21, align 8
  %485 = getelementptr inbounds %struct.TupleValue, ptr %484, i32 0, i32 0
  %486 = load i32, ptr %485, align 8
  %487 = sext i32 %486 to i64
  %488 = mul i64 8, %487
  %489 = call noalias ptr @malloc(i64 noundef %488) #6
  %490 = load ptr, ptr %21, align 8
  %491 = getelementptr inbounds %struct.TupleValue, ptr %490, i32 0, i32 1
  store ptr %489, ptr %491, align 8
  store i32 0, ptr %22, align 4
  br label %492

492:                                              ; preds = %515, %474
  %493 = load i32, ptr %22, align 4
  %494 = load ptr, ptr %20, align 8
  %495 = getelementptr inbounds %struct.TupleValue, ptr %494, i32 0, i32 0
  %496 = load i32, ptr %495, align 8
  %497 = icmp slt i32 %493, %496
  br i1 %497, label %498, label %518

498:                                              ; preds = %492
  %499 = load ptr, ptr %4, align 8
  %500 = call ptr @copyValue(ptr noundef %499)
  %501 = load ptr, ptr %20, align 8
  %502 = getelementptr inbounds %struct.TupleValue, ptr %501, i32 0, i32 1
  %503 = load ptr, ptr %502, align 8
  %504 = load i32, ptr %22, align 4
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds ptr, ptr %503, i64 %505
  %507 = load ptr, ptr %506, align 8
  %508 = call ptr @addCalcLangValues(ptr noundef %500, ptr noundef %507)
  %509 = load ptr, ptr %21, align 8
  %510 = getelementptr inbounds %struct.TupleValue, ptr %509, i32 0, i32 1
  %511 = load ptr, ptr %510, align 8
  %512 = load i32, ptr %22, align 4
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds ptr, ptr %511, i64 %513
  store ptr %508, ptr %514, align 8
  br label %515

515:                                              ; preds = %498
  %516 = load i32, ptr %22, align 4
  %517 = add nsw i32 %516, 1
  store i32 %517, ptr %22, align 4
  br label %492, !llvm.loop !11

518:                                              ; preds = %492
  %519 = load ptr, ptr %6, align 8
  %520 = getelementptr inbounds %struct.CalcLangVal, ptr %519, i32 0, i32 0
  store i32 7, ptr %520, align 8
  %521 = load ptr, ptr %21, align 8
  %522 = load ptr, ptr %6, align 8
  %523 = getelementptr inbounds %struct.CalcLangVal, ptr %522, i32 0, i32 1
  store ptr %521, ptr %523, align 8
  br label %1335

524:                                              ; preds = %469, %464
  %525 = load ptr, ptr %4, align 8
  %526 = getelementptr inbounds %struct.CalcLangVal, ptr %525, i32 0, i32 0
  %527 = load i32, ptr %526, align 8
  %528 = icmp eq i32 %527, 7
  br i1 %528, label %529, label %584

529:                                              ; preds = %524
  %530 = load ptr, ptr %5, align 8
  %531 = getelementptr inbounds %struct.CalcLangVal, ptr %530, i32 0, i32 0
  %532 = load i32, ptr %531, align 8
  %533 = icmp eq i32 %532, 3
  br i1 %533, label %534, label %584

534:                                              ; preds = %529
  %535 = load ptr, ptr %4, align 8
  %536 = getelementptr inbounds %struct.CalcLangVal, ptr %535, i32 0, i32 1
  %537 = load ptr, ptr %536, align 8
  store ptr %537, ptr %23, align 8
  %538 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %538, ptr %24, align 8
  %539 = load ptr, ptr %23, align 8
  %540 = getelementptr inbounds %struct.TupleValue, ptr %539, i32 0, i32 0
  %541 = load i32, ptr %540, align 8
  %542 = load ptr, ptr %24, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 0
  store i32 %541, ptr %543, align 8
  %544 = load ptr, ptr %24, align 8
  %545 = getelementptr inbounds %struct.TupleValue, ptr %544, i32 0, i32 0
  %546 = load i32, ptr %545, align 8
  %547 = sext i32 %546 to i64
  %548 = mul i64 8, %547
  %549 = call noalias ptr @malloc(i64 noundef %548) #6
  %550 = load ptr, ptr %24, align 8
  %551 = getelementptr inbounds %struct.TupleValue, ptr %550, i32 0, i32 1
  store ptr %549, ptr %551, align 8
  store i32 0, ptr %25, align 4
  br label %552

552:                                              ; preds = %575, %534
  %553 = load i32, ptr %25, align 4
  %554 = load ptr, ptr %23, align 8
  %555 = getelementptr inbounds %struct.TupleValue, ptr %554, i32 0, i32 0
  %556 = load i32, ptr %555, align 8
  %557 = icmp slt i32 %553, %556
  br i1 %557, label %558, label %578

558:                                              ; preds = %552
  %559 = load ptr, ptr %23, align 8
  %560 = getelementptr inbounds %struct.TupleValue, ptr %559, i32 0, i32 1
  %561 = load ptr, ptr %560, align 8
  %562 = load i32, ptr %25, align 4
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds ptr, ptr %561, i64 %563
  %565 = load ptr, ptr %564, align 8
  %566 = load ptr, ptr %5, align 8
  %567 = call ptr @copyValue(ptr noundef %566)
  %568 = call ptr @addCalcLangValues(ptr noundef %565, ptr noundef %567)
  %569 = load ptr, ptr %24, align 8
  %570 = getelementptr inbounds %struct.TupleValue, ptr %569, i32 0, i32 1
  %571 = load ptr, ptr %570, align 8
  %572 = load i32, ptr %25, align 4
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds ptr, ptr %571, i64 %573
  store ptr %568, ptr %574, align 8
  br label %575

575:                                              ; preds = %558
  %576 = load i32, ptr %25, align 4
  %577 = add nsw i32 %576, 1
  store i32 %577, ptr %25, align 4
  br label %552, !llvm.loop !12

578:                                              ; preds = %552
  %579 = load ptr, ptr %6, align 8
  %580 = getelementptr inbounds %struct.CalcLangVal, ptr %579, i32 0, i32 0
  store i32 7, ptr %580, align 8
  %581 = load ptr, ptr %24, align 8
  %582 = load ptr, ptr %6, align 8
  %583 = getelementptr inbounds %struct.CalcLangVal, ptr %582, i32 0, i32 1
  store ptr %581, ptr %583, align 8
  br label %1334

584:                                              ; preds = %529, %524
  %585 = load ptr, ptr %4, align 8
  %586 = getelementptr inbounds %struct.CalcLangVal, ptr %585, i32 0, i32 0
  %587 = load i32, ptr %586, align 8
  %588 = icmp eq i32 %587, 3
  br i1 %588, label %589, label %644

589:                                              ; preds = %584
  %590 = load ptr, ptr %5, align 8
  %591 = getelementptr inbounds %struct.CalcLangVal, ptr %590, i32 0, i32 0
  %592 = load i32, ptr %591, align 8
  %593 = icmp eq i32 %592, 7
  br i1 %593, label %594, label %644

594:                                              ; preds = %589
  %595 = load ptr, ptr %5, align 8
  %596 = getelementptr inbounds %struct.CalcLangVal, ptr %595, i32 0, i32 1
  %597 = load ptr, ptr %596, align 8
  store ptr %597, ptr %26, align 8
  %598 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %598, ptr %27, align 8
  %599 = load ptr, ptr %26, align 8
  %600 = getelementptr inbounds %struct.TupleValue, ptr %599, i32 0, i32 0
  %601 = load i32, ptr %600, align 8
  %602 = load ptr, ptr %27, align 8
  %603 = getelementptr inbounds %struct.TupleValue, ptr %602, i32 0, i32 0
  store i32 %601, ptr %603, align 8
  %604 = load ptr, ptr %27, align 8
  %605 = getelementptr inbounds %struct.TupleValue, ptr %604, i32 0, i32 0
  %606 = load i32, ptr %605, align 8
  %607 = sext i32 %606 to i64
  %608 = mul i64 8, %607
  %609 = call noalias ptr @malloc(i64 noundef %608) #6
  %610 = load ptr, ptr %27, align 8
  %611 = getelementptr inbounds %struct.TupleValue, ptr %610, i32 0, i32 1
  store ptr %609, ptr %611, align 8
  store i32 0, ptr %28, align 4
  br label %612

612:                                              ; preds = %635, %594
  %613 = load i32, ptr %28, align 4
  %614 = load ptr, ptr %26, align 8
  %615 = getelementptr inbounds %struct.TupleValue, ptr %614, i32 0, i32 0
  %616 = load i32, ptr %615, align 8
  %617 = icmp slt i32 %613, %616
  br i1 %617, label %618, label %638

618:                                              ; preds = %612
  %619 = load ptr, ptr %4, align 8
  %620 = call ptr @copyValue(ptr noundef %619)
  %621 = load ptr, ptr %26, align 8
  %622 = getelementptr inbounds %struct.TupleValue, ptr %621, i32 0, i32 1
  %623 = load ptr, ptr %622, align 8
  %624 = load i32, ptr %28, align 4
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds ptr, ptr %623, i64 %625
  %627 = load ptr, ptr %626, align 8
  %628 = call ptr @addCalcLangValues(ptr noundef %620, ptr noundef %627)
  %629 = load ptr, ptr %27, align 8
  %630 = getelementptr inbounds %struct.TupleValue, ptr %629, i32 0, i32 1
  %631 = load ptr, ptr %630, align 8
  %632 = load i32, ptr %28, align 4
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds ptr, ptr %631, i64 %633
  store ptr %628, ptr %634, align 8
  br label %635

635:                                              ; preds = %618
  %636 = load i32, ptr %28, align 4
  %637 = add nsw i32 %636, 1
  store i32 %637, ptr %28, align 4
  br label %612, !llvm.loop !13

638:                                              ; preds = %612
  %639 = load ptr, ptr %6, align 8
  %640 = getelementptr inbounds %struct.CalcLangVal, ptr %639, i32 0, i32 0
  store i32 7, ptr %640, align 8
  %641 = load ptr, ptr %27, align 8
  %642 = load ptr, ptr %6, align 8
  %643 = getelementptr inbounds %struct.CalcLangVal, ptr %642, i32 0, i32 1
  store ptr %641, ptr %643, align 8
  br label %1333

644:                                              ; preds = %589, %584
  %645 = load ptr, ptr %4, align 8
  %646 = getelementptr inbounds %struct.CalcLangVal, ptr %645, i32 0, i32 0
  %647 = load i32, ptr %646, align 8
  %648 = icmp eq i32 %647, 7
  br i1 %648, label %649, label %704

649:                                              ; preds = %644
  %650 = load ptr, ptr %5, align 8
  %651 = getelementptr inbounds %struct.CalcLangVal, ptr %650, i32 0, i32 0
  %652 = load i32, ptr %651, align 8
  %653 = icmp eq i32 %652, 4
  br i1 %653, label %654, label %704

654:                                              ; preds = %649
  %655 = load ptr, ptr %4, align 8
  %656 = getelementptr inbounds %struct.CalcLangVal, ptr %655, i32 0, i32 1
  %657 = load ptr, ptr %656, align 8
  store ptr %657, ptr %29, align 8
  %658 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %658, ptr %30, align 8
  %659 = load ptr, ptr %29, align 8
  %660 = getelementptr inbounds %struct.TupleValue, ptr %659, i32 0, i32 0
  %661 = load i32, ptr %660, align 8
  %662 = load ptr, ptr %30, align 8
  %663 = getelementptr inbounds %struct.TupleValue, ptr %662, i32 0, i32 0
  store i32 %661, ptr %663, align 8
  %664 = load ptr, ptr %30, align 8
  %665 = getelementptr inbounds %struct.TupleValue, ptr %664, i32 0, i32 0
  %666 = load i32, ptr %665, align 8
  %667 = sext i32 %666 to i64
  %668 = mul i64 8, %667
  %669 = call noalias ptr @malloc(i64 noundef %668) #6
  %670 = load ptr, ptr %30, align 8
  %671 = getelementptr inbounds %struct.TupleValue, ptr %670, i32 0, i32 1
  store ptr %669, ptr %671, align 8
  store i32 0, ptr %31, align 4
  br label %672

672:                                              ; preds = %695, %654
  %673 = load i32, ptr %31, align 4
  %674 = load ptr, ptr %29, align 8
  %675 = getelementptr inbounds %struct.TupleValue, ptr %674, i32 0, i32 0
  %676 = load i32, ptr %675, align 8
  %677 = icmp slt i32 %673, %676
  br i1 %677, label %678, label %698

678:                                              ; preds = %672
  %679 = load ptr, ptr %29, align 8
  %680 = getelementptr inbounds %struct.TupleValue, ptr %679, i32 0, i32 1
  %681 = load ptr, ptr %680, align 8
  %682 = load i32, ptr %31, align 4
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds ptr, ptr %681, i64 %683
  %685 = load ptr, ptr %684, align 8
  %686 = load ptr, ptr %5, align 8
  %687 = call ptr @copyValue(ptr noundef %686)
  %688 = call ptr @addCalcLangValues(ptr noundef %685, ptr noundef %687)
  %689 = load ptr, ptr %30, align 8
  %690 = getelementptr inbounds %struct.TupleValue, ptr %689, i32 0, i32 1
  %691 = load ptr, ptr %690, align 8
  %692 = load i32, ptr %31, align 4
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds ptr, ptr %691, i64 %693
  store ptr %688, ptr %694, align 8
  br label %695

695:                                              ; preds = %678
  %696 = load i32, ptr %31, align 4
  %697 = add nsw i32 %696, 1
  store i32 %697, ptr %31, align 4
  br label %672, !llvm.loop !14

698:                                              ; preds = %672
  %699 = load ptr, ptr %6, align 8
  %700 = getelementptr inbounds %struct.CalcLangVal, ptr %699, i32 0, i32 0
  store i32 7, ptr %700, align 8
  %701 = load ptr, ptr %30, align 8
  %702 = load ptr, ptr %6, align 8
  %703 = getelementptr inbounds %struct.CalcLangVal, ptr %702, i32 0, i32 1
  store ptr %701, ptr %703, align 8
  br label %1332

704:                                              ; preds = %649, %644
  %705 = load ptr, ptr %4, align 8
  %706 = getelementptr inbounds %struct.CalcLangVal, ptr %705, i32 0, i32 0
  %707 = load i32, ptr %706, align 8
  %708 = icmp eq i32 %707, 4
  br i1 %708, label %709, label %764

709:                                              ; preds = %704
  %710 = load ptr, ptr %5, align 8
  %711 = getelementptr inbounds %struct.CalcLangVal, ptr %710, i32 0, i32 0
  %712 = load i32, ptr %711, align 8
  %713 = icmp eq i32 %712, 7
  br i1 %713, label %714, label %764

714:                                              ; preds = %709
  %715 = load ptr, ptr %5, align 8
  %716 = getelementptr inbounds %struct.CalcLangVal, ptr %715, i32 0, i32 1
  %717 = load ptr, ptr %716, align 8
  store ptr %717, ptr %32, align 8
  %718 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %718, ptr %33, align 8
  %719 = load ptr, ptr %32, align 8
  %720 = getelementptr inbounds %struct.TupleValue, ptr %719, i32 0, i32 0
  %721 = load i32, ptr %720, align 8
  %722 = load ptr, ptr %33, align 8
  %723 = getelementptr inbounds %struct.TupleValue, ptr %722, i32 0, i32 0
  store i32 %721, ptr %723, align 8
  %724 = load ptr, ptr %33, align 8
  %725 = getelementptr inbounds %struct.TupleValue, ptr %724, i32 0, i32 0
  %726 = load i32, ptr %725, align 8
  %727 = sext i32 %726 to i64
  %728 = mul i64 8, %727
  %729 = call noalias ptr @malloc(i64 noundef %728) #6
  %730 = load ptr, ptr %33, align 8
  %731 = getelementptr inbounds %struct.TupleValue, ptr %730, i32 0, i32 1
  store ptr %729, ptr %731, align 8
  store i32 0, ptr %34, align 4
  br label %732

732:                                              ; preds = %755, %714
  %733 = load i32, ptr %34, align 4
  %734 = load ptr, ptr %32, align 8
  %735 = getelementptr inbounds %struct.TupleValue, ptr %734, i32 0, i32 0
  %736 = load i32, ptr %735, align 8
  %737 = icmp slt i32 %733, %736
  br i1 %737, label %738, label %758

738:                                              ; preds = %732
  %739 = load ptr, ptr %4, align 8
  %740 = call ptr @copyValue(ptr noundef %739)
  %741 = load ptr, ptr %32, align 8
  %742 = getelementptr inbounds %struct.TupleValue, ptr %741, i32 0, i32 1
  %743 = load ptr, ptr %742, align 8
  %744 = load i32, ptr %34, align 4
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds ptr, ptr %743, i64 %745
  %747 = load ptr, ptr %746, align 8
  %748 = call ptr @addCalcLangValues(ptr noundef %740, ptr noundef %747)
  %749 = load ptr, ptr %33, align 8
  %750 = getelementptr inbounds %struct.TupleValue, ptr %749, i32 0, i32 1
  %751 = load ptr, ptr %750, align 8
  %752 = load i32, ptr %34, align 4
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds ptr, ptr %751, i64 %753
  store ptr %748, ptr %754, align 8
  br label %755

755:                                              ; preds = %738
  %756 = load i32, ptr %34, align 4
  %757 = add nsw i32 %756, 1
  store i32 %757, ptr %34, align 4
  br label %732, !llvm.loop !15

758:                                              ; preds = %732
  %759 = load ptr, ptr %6, align 8
  %760 = getelementptr inbounds %struct.CalcLangVal, ptr %759, i32 0, i32 0
  store i32 7, ptr %760, align 8
  %761 = load ptr, ptr %33, align 8
  %762 = load ptr, ptr %6, align 8
  %763 = getelementptr inbounds %struct.CalcLangVal, ptr %762, i32 0, i32 1
  store ptr %761, ptr %763, align 8
  br label %1331

764:                                              ; preds = %709, %704
  %765 = load ptr, ptr %4, align 8
  %766 = getelementptr inbounds %struct.CalcLangVal, ptr %765, i32 0, i32 0
  %767 = load i32, ptr %766, align 8
  %768 = icmp eq i32 %767, 6
  br i1 %768, label %769, label %842

769:                                              ; preds = %764
  %770 = load ptr, ptr %5, align 8
  %771 = getelementptr inbounds %struct.CalcLangVal, ptr %770, i32 0, i32 0
  %772 = load i32, ptr %771, align 8
  %773 = icmp eq i32 %772, 6
  br i1 %773, label %774, label %842

774:                                              ; preds = %769
  %775 = load ptr, ptr %4, align 8
  %776 = getelementptr inbounds %struct.CalcLangVal, ptr %775, i32 0, i32 1
  %777 = load ptr, ptr %776, align 8
  store ptr %777, ptr %35, align 8
  %778 = load ptr, ptr %5, align 8
  %779 = getelementptr inbounds %struct.CalcLangVal, ptr %778, i32 0, i32 1
  %780 = load ptr, ptr %779, align 8
  store ptr %780, ptr %36, align 8
  %781 = load ptr, ptr %36, align 8
  %782 = getelementptr inbounds %struct.SetValue, ptr %781, i32 0, i32 0
  %783 = load i32, ptr %782, align 8
  %784 = load ptr, ptr %35, align 8
  %785 = getelementptr inbounds %struct.SetValue, ptr %784, i32 0, i32 0
  %786 = load i32, ptr %785, align 8
  %787 = icmp eq i32 %783, %786
  br i1 %787, label %788, label %840

788:                                              ; preds = %774
  %789 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %789, ptr %37, align 8
  %790 = load ptr, ptr %35, align 8
  %791 = getelementptr inbounds %struct.SetValue, ptr %790, i32 0, i32 0
  %792 = load i32, ptr %791, align 8
  %793 = load ptr, ptr %37, align 8
  %794 = getelementptr inbounds %struct.SetValue, ptr %793, i32 0, i32 0
  store i32 %792, ptr %794, align 8
  %795 = load ptr, ptr %37, align 8
  %796 = getelementptr inbounds %struct.SetValue, ptr %795, i32 0, i32 0
  %797 = load i32, ptr %796, align 8
  %798 = sext i32 %797 to i64
  %799 = mul i64 8, %798
  %800 = call noalias ptr @malloc(i64 noundef %799) #6
  %801 = load ptr, ptr %37, align 8
  %802 = getelementptr inbounds %struct.SetValue, ptr %801, i32 0, i32 1
  store ptr %800, ptr %802, align 8
  store i32 0, ptr %38, align 4
  br label %803

803:                                              ; preds = %831, %788
  %804 = load i32, ptr %38, align 4
  %805 = load ptr, ptr %35, align 8
  %806 = getelementptr inbounds %struct.SetValue, ptr %805, i32 0, i32 0
  %807 = load i32, ptr %806, align 8
  %808 = icmp slt i32 %804, %807
  br i1 %808, label %809, label %834

809:                                              ; preds = %803
  %810 = load ptr, ptr %35, align 8
  %811 = getelementptr inbounds %struct.SetValue, ptr %810, i32 0, i32 1
  %812 = load ptr, ptr %811, align 8
  %813 = load i32, ptr %38, align 4
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds ptr, ptr %812, i64 %814
  %816 = load ptr, ptr %815, align 8
  %817 = load ptr, ptr %36, align 8
  %818 = getelementptr inbounds %struct.SetValue, ptr %817, i32 0, i32 1
  %819 = load ptr, ptr %818, align 8
  %820 = load i32, ptr %38, align 4
  %821 = sext i32 %820 to i64
  %822 = getelementptr inbounds ptr, ptr %819, i64 %821
  %823 = load ptr, ptr %822, align 8
  %824 = call ptr @addCalcLangValues(ptr noundef %816, ptr noundef %823)
  %825 = load ptr, ptr %37, align 8
  %826 = getelementptr inbounds %struct.SetValue, ptr %825, i32 0, i32 1
  %827 = load ptr, ptr %826, align 8
  %828 = load i32, ptr %38, align 4
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds ptr, ptr %827, i64 %829
  store ptr %824, ptr %830, align 8
  br label %831

831:                                              ; preds = %809
  %832 = load i32, ptr %38, align 4
  %833 = add nsw i32 %832, 1
  store i32 %833, ptr %38, align 4
  br label %803, !llvm.loop !16

834:                                              ; preds = %803
  %835 = load ptr, ptr %6, align 8
  %836 = getelementptr inbounds %struct.CalcLangVal, ptr %835, i32 0, i32 0
  store i32 6, ptr %836, align 8
  %837 = load ptr, ptr %37, align 8
  %838 = load ptr, ptr %6, align 8
  %839 = getelementptr inbounds %struct.CalcLangVal, ptr %838, i32 0, i32 1
  store ptr %837, ptr %839, align 8
  br label %841

840:                                              ; preds = %774
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1347

841:                                              ; preds = %834
  br label %1330

842:                                              ; preds = %769, %764
  %843 = load ptr, ptr %4, align 8
  %844 = getelementptr inbounds %struct.CalcLangVal, ptr %843, i32 0, i32 0
  %845 = load i32, ptr %844, align 8
  %846 = icmp eq i32 %845, 6
  br i1 %846, label %847, label %902

847:                                              ; preds = %842
  %848 = load ptr, ptr %5, align 8
  %849 = getelementptr inbounds %struct.CalcLangVal, ptr %848, i32 0, i32 0
  %850 = load i32, ptr %849, align 8
  %851 = icmp eq i32 %850, 0
  br i1 %851, label %852, label %902

852:                                              ; preds = %847
  %853 = load ptr, ptr %4, align 8
  %854 = getelementptr inbounds %struct.CalcLangVal, ptr %853, i32 0, i32 1
  %855 = load ptr, ptr %854, align 8
  store ptr %855, ptr %39, align 8
  %856 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %856, ptr %40, align 8
  %857 = load ptr, ptr %39, align 8
  %858 = getelementptr inbounds %struct.SetValue, ptr %857, i32 0, i32 0
  %859 = load i32, ptr %858, align 8
  %860 = load ptr, ptr %40, align 8
  %861 = getelementptr inbounds %struct.SetValue, ptr %860, i32 0, i32 0
  store i32 %859, ptr %861, align 8
  %862 = load ptr, ptr %40, align 8
  %863 = getelementptr inbounds %struct.SetValue, ptr %862, i32 0, i32 0
  %864 = load i32, ptr %863, align 8
  %865 = sext i32 %864 to i64
  %866 = mul i64 8, %865
  %867 = call noalias ptr @malloc(i64 noundef %866) #6
  %868 = load ptr, ptr %40, align 8
  %869 = getelementptr inbounds %struct.SetValue, ptr %868, i32 0, i32 1
  store ptr %867, ptr %869, align 8
  store i32 0, ptr %41, align 4
  br label %870

870:                                              ; preds = %893, %852
  %871 = load i32, ptr %41, align 4
  %872 = load ptr, ptr %39, align 8
  %873 = getelementptr inbounds %struct.SetValue, ptr %872, i32 0, i32 0
  %874 = load i32, ptr %873, align 8
  %875 = icmp slt i32 %871, %874
  br i1 %875, label %876, label %896

876:                                              ; preds = %870
  %877 = load ptr, ptr %39, align 8
  %878 = getelementptr inbounds %struct.SetValue, ptr %877, i32 0, i32 1
  %879 = load ptr, ptr %878, align 8
  %880 = load i32, ptr %41, align 4
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds ptr, ptr %879, i64 %881
  %883 = load ptr, ptr %882, align 8
  %884 = load ptr, ptr %5, align 8
  %885 = call ptr @copyValue(ptr noundef %884)
  %886 = call ptr @addCalcLangValues(ptr noundef %883, ptr noundef %885)
  %887 = load ptr, ptr %40, align 8
  %888 = getelementptr inbounds %struct.SetValue, ptr %887, i32 0, i32 1
  %889 = load ptr, ptr %888, align 8
  %890 = load i32, ptr %41, align 4
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds ptr, ptr %889, i64 %891
  store ptr %886, ptr %892, align 8
  br label %893

893:                                              ; preds = %876
  %894 = load i32, ptr %41, align 4
  %895 = add nsw i32 %894, 1
  store i32 %895, ptr %41, align 4
  br label %870, !llvm.loop !17

896:                                              ; preds = %870
  %897 = load ptr, ptr %6, align 8
  %898 = getelementptr inbounds %struct.CalcLangVal, ptr %897, i32 0, i32 0
  store i32 6, ptr %898, align 8
  %899 = load ptr, ptr %40, align 8
  %900 = load ptr, ptr %6, align 8
  %901 = getelementptr inbounds %struct.CalcLangVal, ptr %900, i32 0, i32 1
  store ptr %899, ptr %901, align 8
  br label %1329

902:                                              ; preds = %847, %842
  %903 = load ptr, ptr %4, align 8
  %904 = getelementptr inbounds %struct.CalcLangVal, ptr %903, i32 0, i32 0
  %905 = load i32, ptr %904, align 8
  %906 = icmp eq i32 %905, 0
  br i1 %906, label %907, label %961

907:                                              ; preds = %902
  %908 = load ptr, ptr %5, align 8
  %909 = getelementptr inbounds %struct.CalcLangVal, ptr %908, i32 0, i32 0
  %910 = load i32, ptr %909, align 8
  %911 = icmp eq i32 %910, 6
  br i1 %911, label %912, label %961

912:                                              ; preds = %907
  %913 = load ptr, ptr %5, align 8
  %914 = getelementptr inbounds %struct.CalcLangVal, ptr %913, i32 0, i32 1
  %915 = load ptr, ptr %914, align 8
  store ptr %915, ptr %42, align 8
  %916 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %916, ptr %43, align 8
  %917 = load ptr, ptr %42, align 8
  %918 = getelementptr inbounds %struct.SetValue, ptr %917, i32 0, i32 0
  %919 = load i32, ptr %918, align 8
  %920 = load ptr, ptr %43, align 8
  %921 = getelementptr inbounds %struct.SetValue, ptr %920, i32 0, i32 0
  store i32 %919, ptr %921, align 8
  %922 = load ptr, ptr %43, align 8
  %923 = getelementptr inbounds %struct.SetValue, ptr %922, i32 0, i32 0
  %924 = load i32, ptr %923, align 8
  %925 = sext i32 %924 to i64
  %926 = mul i64 8, %925
  %927 = call noalias ptr @malloc(i64 noundef %926) #6
  %928 = load ptr, ptr %43, align 8
  %929 = getelementptr inbounds %struct.SetValue, ptr %928, i32 0, i32 1
  store ptr %927, ptr %929, align 8
  store i32 0, ptr %44, align 4
  br label %930

930:                                              ; preds = %952, %912
  %931 = load i32, ptr %44, align 4
  %932 = load ptr, ptr %42, align 8
  %933 = getelementptr inbounds %struct.SetValue, ptr %932, i32 0, i32 0
  %934 = load i32, ptr %933, align 8
  %935 = icmp slt i32 %931, %934
  br i1 %935, label %936, label %955

936:                                              ; preds = %930
  %937 = load ptr, ptr %4, align 8
  %938 = load ptr, ptr %42, align 8
  %939 = getelementptr inbounds %struct.SetValue, ptr %938, i32 0, i32 1
  %940 = load ptr, ptr %939, align 8
  %941 = load i32, ptr %44, align 4
  %942 = sext i32 %941 to i64
  %943 = getelementptr inbounds ptr, ptr %940, i64 %942
  %944 = load ptr, ptr %943, align 8
  %945 = call ptr @addCalcLangValues(ptr noundef %937, ptr noundef %944)
  %946 = load ptr, ptr %43, align 8
  %947 = getelementptr inbounds %struct.SetValue, ptr %946, i32 0, i32 1
  %948 = load ptr, ptr %947, align 8
  %949 = load i32, ptr %44, align 4
  %950 = sext i32 %949 to i64
  %951 = getelementptr inbounds ptr, ptr %948, i64 %950
  store ptr %945, ptr %951, align 8
  br label %952

952:                                              ; preds = %936
  %953 = load i32, ptr %44, align 4
  %954 = add nsw i32 %953, 1
  store i32 %954, ptr %44, align 4
  br label %930, !llvm.loop !18

955:                                              ; preds = %930
  %956 = load ptr, ptr %6, align 8
  %957 = getelementptr inbounds %struct.CalcLangVal, ptr %956, i32 0, i32 0
  store i32 6, ptr %957, align 8
  %958 = load ptr, ptr %43, align 8
  %959 = load ptr, ptr %6, align 8
  %960 = getelementptr inbounds %struct.CalcLangVal, ptr %959, i32 0, i32 1
  store ptr %958, ptr %960, align 8
  br label %1328

961:                                              ; preds = %907, %902
  %962 = load ptr, ptr %4, align 8
  %963 = getelementptr inbounds %struct.CalcLangVal, ptr %962, i32 0, i32 0
  %964 = load i32, ptr %963, align 8
  %965 = icmp eq i32 %964, 6
  br i1 %965, label %966, label %1021

966:                                              ; preds = %961
  %967 = load ptr, ptr %5, align 8
  %968 = getelementptr inbounds %struct.CalcLangVal, ptr %967, i32 0, i32 0
  %969 = load i32, ptr %968, align 8
  %970 = icmp eq i32 %969, 1
  br i1 %970, label %971, label %1021

971:                                              ; preds = %966
  %972 = load ptr, ptr %4, align 8
  %973 = getelementptr inbounds %struct.CalcLangVal, ptr %972, i32 0, i32 1
  %974 = load ptr, ptr %973, align 8
  store ptr %974, ptr %45, align 8
  %975 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %975, ptr %46, align 8
  %976 = load ptr, ptr %45, align 8
  %977 = getelementptr inbounds %struct.SetValue, ptr %976, i32 0, i32 0
  %978 = load i32, ptr %977, align 8
  %979 = load ptr, ptr %46, align 8
  %980 = getelementptr inbounds %struct.SetValue, ptr %979, i32 0, i32 0
  store i32 %978, ptr %980, align 8
  %981 = load ptr, ptr %46, align 8
  %982 = getelementptr inbounds %struct.SetValue, ptr %981, i32 0, i32 0
  %983 = load i32, ptr %982, align 8
  %984 = sext i32 %983 to i64
  %985 = mul i64 8, %984
  %986 = call noalias ptr @malloc(i64 noundef %985) #6
  %987 = load ptr, ptr %46, align 8
  %988 = getelementptr inbounds %struct.SetValue, ptr %987, i32 0, i32 1
  store ptr %986, ptr %988, align 8
  store i32 0, ptr %47, align 4
  br label %989

989:                                              ; preds = %1012, %971
  %990 = load i32, ptr %47, align 4
  %991 = load ptr, ptr %45, align 8
  %992 = getelementptr inbounds %struct.SetValue, ptr %991, i32 0, i32 0
  %993 = load i32, ptr %992, align 8
  %994 = icmp slt i32 %990, %993
  br i1 %994, label %995, label %1015

995:                                              ; preds = %989
  %996 = load ptr, ptr %45, align 8
  %997 = getelementptr inbounds %struct.SetValue, ptr %996, i32 0, i32 1
  %998 = load ptr, ptr %997, align 8
  %999 = load i32, ptr %47, align 4
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds ptr, ptr %998, i64 %1000
  %1002 = load ptr, ptr %1001, align 8
  %1003 = load ptr, ptr %5, align 8
  %1004 = call ptr @copyValue(ptr noundef %1003)
  %1005 = call ptr @addCalcLangValues(ptr noundef %1002, ptr noundef %1004)
  %1006 = load ptr, ptr %46, align 8
  %1007 = getelementptr inbounds %struct.SetValue, ptr %1006, i32 0, i32 1
  %1008 = load ptr, ptr %1007, align 8
  %1009 = load i32, ptr %47, align 4
  %1010 = sext i32 %1009 to i64
  %1011 = getelementptr inbounds ptr, ptr %1008, i64 %1010
  store ptr %1005, ptr %1011, align 8
  br label %1012

1012:                                             ; preds = %995
  %1013 = load i32, ptr %47, align 4
  %1014 = add nsw i32 %1013, 1
  store i32 %1014, ptr %47, align 4
  br label %989, !llvm.loop !19

1015:                                             ; preds = %989
  %1016 = load ptr, ptr %6, align 8
  %1017 = getelementptr inbounds %struct.CalcLangVal, ptr %1016, i32 0, i32 0
  store i32 7, ptr %1017, align 8
  %1018 = load ptr, ptr %46, align 8
  %1019 = load ptr, ptr %6, align 8
  %1020 = getelementptr inbounds %struct.CalcLangVal, ptr %1019, i32 0, i32 1
  store ptr %1018, ptr %1020, align 8
  br label %1327

1021:                                             ; preds = %966, %961
  %1022 = load ptr, ptr %4, align 8
  %1023 = getelementptr inbounds %struct.CalcLangVal, ptr %1022, i32 0, i32 0
  %1024 = load i32, ptr %1023, align 8
  %1025 = icmp eq i32 %1024, 1
  br i1 %1025, label %1026, label %1081

1026:                                             ; preds = %1021
  %1027 = load ptr, ptr %5, align 8
  %1028 = getelementptr inbounds %struct.CalcLangVal, ptr %1027, i32 0, i32 0
  %1029 = load i32, ptr %1028, align 8
  %1030 = icmp eq i32 %1029, 6
  br i1 %1030, label %1031, label %1081

1031:                                             ; preds = %1026
  %1032 = load ptr, ptr %5, align 8
  %1033 = getelementptr inbounds %struct.CalcLangVal, ptr %1032, i32 0, i32 1
  %1034 = load ptr, ptr %1033, align 8
  store ptr %1034, ptr %48, align 8
  %1035 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1035, ptr %49, align 8
  %1036 = load ptr, ptr %48, align 8
  %1037 = getelementptr inbounds %struct.SetValue, ptr %1036, i32 0, i32 0
  %1038 = load i32, ptr %1037, align 8
  %1039 = load ptr, ptr %49, align 8
  %1040 = getelementptr inbounds %struct.SetValue, ptr %1039, i32 0, i32 0
  store i32 %1038, ptr %1040, align 8
  %1041 = load ptr, ptr %49, align 8
  %1042 = getelementptr inbounds %struct.SetValue, ptr %1041, i32 0, i32 0
  %1043 = load i32, ptr %1042, align 8
  %1044 = sext i32 %1043 to i64
  %1045 = mul i64 8, %1044
  %1046 = call noalias ptr @malloc(i64 noundef %1045) #6
  %1047 = load ptr, ptr %49, align 8
  %1048 = getelementptr inbounds %struct.SetValue, ptr %1047, i32 0, i32 1
  store ptr %1046, ptr %1048, align 8
  store i32 0, ptr %50, align 4
  br label %1049

1049:                                             ; preds = %1072, %1031
  %1050 = load i32, ptr %50, align 4
  %1051 = load ptr, ptr %48, align 8
  %1052 = getelementptr inbounds %struct.SetValue, ptr %1051, i32 0, i32 0
  %1053 = load i32, ptr %1052, align 8
  %1054 = icmp slt i32 %1050, %1053
  br i1 %1054, label %1055, label %1075

1055:                                             ; preds = %1049
  %1056 = load ptr, ptr %4, align 8
  %1057 = call ptr @copyValue(ptr noundef %1056)
  %1058 = load ptr, ptr %48, align 8
  %1059 = getelementptr inbounds %struct.SetValue, ptr %1058, i32 0, i32 1
  %1060 = load ptr, ptr %1059, align 8
  %1061 = load i32, ptr %50, align 4
  %1062 = sext i32 %1061 to i64
  %1063 = getelementptr inbounds ptr, ptr %1060, i64 %1062
  %1064 = load ptr, ptr %1063, align 8
  %1065 = call ptr @addCalcLangValues(ptr noundef %1057, ptr noundef %1064)
  %1066 = load ptr, ptr %49, align 8
  %1067 = getelementptr inbounds %struct.SetValue, ptr %1066, i32 0, i32 1
  %1068 = load ptr, ptr %1067, align 8
  %1069 = load i32, ptr %50, align 4
  %1070 = sext i32 %1069 to i64
  %1071 = getelementptr inbounds ptr, ptr %1068, i64 %1070
  store ptr %1065, ptr %1071, align 8
  br label %1072

1072:                                             ; preds = %1055
  %1073 = load i32, ptr %50, align 4
  %1074 = add nsw i32 %1073, 1
  store i32 %1074, ptr %50, align 4
  br label %1049, !llvm.loop !20

1075:                                             ; preds = %1049
  %1076 = load ptr, ptr %6, align 8
  %1077 = getelementptr inbounds %struct.CalcLangVal, ptr %1076, i32 0, i32 0
  store i32 6, ptr %1077, align 8
  %1078 = load ptr, ptr %49, align 8
  %1079 = load ptr, ptr %6, align 8
  %1080 = getelementptr inbounds %struct.CalcLangVal, ptr %1079, i32 0, i32 1
  store ptr %1078, ptr %1080, align 8
  br label %1326

1081:                                             ; preds = %1026, %1021
  %1082 = load ptr, ptr %4, align 8
  %1083 = getelementptr inbounds %struct.CalcLangVal, ptr %1082, i32 0, i32 0
  %1084 = load i32, ptr %1083, align 8
  %1085 = icmp eq i32 %1084, 6
  br i1 %1085, label %1086, label %1141

1086:                                             ; preds = %1081
  %1087 = load ptr, ptr %5, align 8
  %1088 = getelementptr inbounds %struct.CalcLangVal, ptr %1087, i32 0, i32 0
  %1089 = load i32, ptr %1088, align 8
  %1090 = icmp eq i32 %1089, 3
  br i1 %1090, label %1091, label %1141

1091:                                             ; preds = %1086
  %1092 = load ptr, ptr %4, align 8
  %1093 = getelementptr inbounds %struct.CalcLangVal, ptr %1092, i32 0, i32 1
  %1094 = load ptr, ptr %1093, align 8
  store ptr %1094, ptr %51, align 8
  %1095 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1095, ptr %52, align 8
  %1096 = load ptr, ptr %51, align 8
  %1097 = getelementptr inbounds %struct.SetValue, ptr %1096, i32 0, i32 0
  %1098 = load i32, ptr %1097, align 8
  %1099 = load ptr, ptr %52, align 8
  %1100 = getelementptr inbounds %struct.SetValue, ptr %1099, i32 0, i32 0
  store i32 %1098, ptr %1100, align 8
  %1101 = load ptr, ptr %52, align 8
  %1102 = getelementptr inbounds %struct.SetValue, ptr %1101, i32 0, i32 0
  %1103 = load i32, ptr %1102, align 8
  %1104 = sext i32 %1103 to i64
  %1105 = mul i64 8, %1104
  %1106 = call noalias ptr @malloc(i64 noundef %1105) #6
  %1107 = load ptr, ptr %52, align 8
  %1108 = getelementptr inbounds %struct.SetValue, ptr %1107, i32 0, i32 1
  store ptr %1106, ptr %1108, align 8
  store i32 0, ptr %53, align 4
  br label %1109

1109:                                             ; preds = %1132, %1091
  %1110 = load i32, ptr %53, align 4
  %1111 = load ptr, ptr %51, align 8
  %1112 = getelementptr inbounds %struct.SetValue, ptr %1111, i32 0, i32 0
  %1113 = load i32, ptr %1112, align 8
  %1114 = icmp slt i32 %1110, %1113
  br i1 %1114, label %1115, label %1135

1115:                                             ; preds = %1109
  %1116 = load ptr, ptr %51, align 8
  %1117 = getelementptr inbounds %struct.SetValue, ptr %1116, i32 0, i32 1
  %1118 = load ptr, ptr %1117, align 8
  %1119 = load i32, ptr %53, align 4
  %1120 = sext i32 %1119 to i64
  %1121 = getelementptr inbounds ptr, ptr %1118, i64 %1120
  %1122 = load ptr, ptr %1121, align 8
  %1123 = load ptr, ptr %5, align 8
  %1124 = call ptr @copyValue(ptr noundef %1123)
  %1125 = call ptr @addCalcLangValues(ptr noundef %1122, ptr noundef %1124)
  %1126 = load ptr, ptr %52, align 8
  %1127 = getelementptr inbounds %struct.SetValue, ptr %1126, i32 0, i32 1
  %1128 = load ptr, ptr %1127, align 8
  %1129 = load i32, ptr %53, align 4
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds ptr, ptr %1128, i64 %1130
  store ptr %1125, ptr %1131, align 8
  br label %1132

1132:                                             ; preds = %1115
  %1133 = load i32, ptr %53, align 4
  %1134 = add nsw i32 %1133, 1
  store i32 %1134, ptr %53, align 4
  br label %1109, !llvm.loop !21

1135:                                             ; preds = %1109
  %1136 = load ptr, ptr %6, align 8
  %1137 = getelementptr inbounds %struct.CalcLangVal, ptr %1136, i32 0, i32 0
  store i32 6, ptr %1137, align 8
  %1138 = load ptr, ptr %52, align 8
  %1139 = load ptr, ptr %6, align 8
  %1140 = getelementptr inbounds %struct.CalcLangVal, ptr %1139, i32 0, i32 1
  store ptr %1138, ptr %1140, align 8
  br label %1325

1141:                                             ; preds = %1086, %1081
  %1142 = load ptr, ptr %4, align 8
  %1143 = getelementptr inbounds %struct.CalcLangVal, ptr %1142, i32 0, i32 0
  %1144 = load i32, ptr %1143, align 8
  %1145 = icmp eq i32 %1144, 3
  br i1 %1145, label %1146, label %1201

1146:                                             ; preds = %1141
  %1147 = load ptr, ptr %5, align 8
  %1148 = getelementptr inbounds %struct.CalcLangVal, ptr %1147, i32 0, i32 0
  %1149 = load i32, ptr %1148, align 8
  %1150 = icmp eq i32 %1149, 6
  br i1 %1150, label %1151, label %1201

1151:                                             ; preds = %1146
  %1152 = load ptr, ptr %5, align 8
  %1153 = getelementptr inbounds %struct.CalcLangVal, ptr %1152, i32 0, i32 1
  %1154 = load ptr, ptr %1153, align 8
  store ptr %1154, ptr %54, align 8
  %1155 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1155, ptr %55, align 8
  %1156 = load ptr, ptr %54, align 8
  %1157 = getelementptr inbounds %struct.SetValue, ptr %1156, i32 0, i32 0
  %1158 = load i32, ptr %1157, align 8
  %1159 = load ptr, ptr %55, align 8
  %1160 = getelementptr inbounds %struct.SetValue, ptr %1159, i32 0, i32 0
  store i32 %1158, ptr %1160, align 8
  %1161 = load ptr, ptr %55, align 8
  %1162 = getelementptr inbounds %struct.SetValue, ptr %1161, i32 0, i32 0
  %1163 = load i32, ptr %1162, align 8
  %1164 = sext i32 %1163 to i64
  %1165 = mul i64 8, %1164
  %1166 = call noalias ptr @malloc(i64 noundef %1165) #6
  %1167 = load ptr, ptr %55, align 8
  %1168 = getelementptr inbounds %struct.SetValue, ptr %1167, i32 0, i32 1
  store ptr %1166, ptr %1168, align 8
  store i32 0, ptr %56, align 4
  br label %1169

1169:                                             ; preds = %1192, %1151
  %1170 = load i32, ptr %56, align 4
  %1171 = load ptr, ptr %54, align 8
  %1172 = getelementptr inbounds %struct.SetValue, ptr %1171, i32 0, i32 0
  %1173 = load i32, ptr %1172, align 8
  %1174 = icmp slt i32 %1170, %1173
  br i1 %1174, label %1175, label %1195

1175:                                             ; preds = %1169
  %1176 = load ptr, ptr %4, align 8
  %1177 = call ptr @copyValue(ptr noundef %1176)
  %1178 = load ptr, ptr %54, align 8
  %1179 = getelementptr inbounds %struct.SetValue, ptr %1178, i32 0, i32 1
  %1180 = load ptr, ptr %1179, align 8
  %1181 = load i32, ptr %56, align 4
  %1182 = sext i32 %1181 to i64
  %1183 = getelementptr inbounds ptr, ptr %1180, i64 %1182
  %1184 = load ptr, ptr %1183, align 8
  %1185 = call ptr @addCalcLangValues(ptr noundef %1177, ptr noundef %1184)
  %1186 = load ptr, ptr %55, align 8
  %1187 = getelementptr inbounds %struct.SetValue, ptr %1186, i32 0, i32 1
  %1188 = load ptr, ptr %1187, align 8
  %1189 = load i32, ptr %56, align 4
  %1190 = sext i32 %1189 to i64
  %1191 = getelementptr inbounds ptr, ptr %1188, i64 %1190
  store ptr %1185, ptr %1191, align 8
  br label %1192

1192:                                             ; preds = %1175
  %1193 = load i32, ptr %56, align 4
  %1194 = add nsw i32 %1193, 1
  store i32 %1194, ptr %56, align 4
  br label %1169, !llvm.loop !22

1195:                                             ; preds = %1169
  %1196 = load ptr, ptr %6, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  store i32 6, ptr %1197, align 8
  %1198 = load ptr, ptr %55, align 8
  %1199 = load ptr, ptr %6, align 8
  %1200 = getelementptr inbounds %struct.CalcLangVal, ptr %1199, i32 0, i32 1
  store ptr %1198, ptr %1200, align 8
  br label %1324

1201:                                             ; preds = %1146, %1141
  %1202 = load ptr, ptr %4, align 8
  %1203 = getelementptr inbounds %struct.CalcLangVal, ptr %1202, i32 0, i32 0
  %1204 = load i32, ptr %1203, align 8
  %1205 = icmp eq i32 %1204, 6
  br i1 %1205, label %1206, label %1261

1206:                                             ; preds = %1201
  %1207 = load ptr, ptr %5, align 8
  %1208 = getelementptr inbounds %struct.CalcLangVal, ptr %1207, i32 0, i32 0
  %1209 = load i32, ptr %1208, align 8
  %1210 = icmp eq i32 %1209, 4
  br i1 %1210, label %1211, label %1261

1211:                                             ; preds = %1206
  %1212 = load ptr, ptr %4, align 8
  %1213 = getelementptr inbounds %struct.CalcLangVal, ptr %1212, i32 0, i32 1
  %1214 = load ptr, ptr %1213, align 8
  store ptr %1214, ptr %57, align 8
  %1215 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1215, ptr %58, align 8
  %1216 = load ptr, ptr %57, align 8
  %1217 = getelementptr inbounds %struct.SetValue, ptr %1216, i32 0, i32 0
  %1218 = load i32, ptr %1217, align 8
  %1219 = load ptr, ptr %58, align 8
  %1220 = getelementptr inbounds %struct.SetValue, ptr %1219, i32 0, i32 0
  store i32 %1218, ptr %1220, align 8
  %1221 = load ptr, ptr %58, align 8
  %1222 = getelementptr inbounds %struct.SetValue, ptr %1221, i32 0, i32 0
  %1223 = load i32, ptr %1222, align 8
  %1224 = sext i32 %1223 to i64
  %1225 = mul i64 8, %1224
  %1226 = call noalias ptr @malloc(i64 noundef %1225) #6
  %1227 = load ptr, ptr %58, align 8
  %1228 = getelementptr inbounds %struct.SetValue, ptr %1227, i32 0, i32 1
  store ptr %1226, ptr %1228, align 8
  store i32 0, ptr %59, align 4
  br label %1229

1229:                                             ; preds = %1252, %1211
  %1230 = load i32, ptr %59, align 4
  %1231 = load ptr, ptr %57, align 8
  %1232 = getelementptr inbounds %struct.SetValue, ptr %1231, i32 0, i32 0
  %1233 = load i32, ptr %1232, align 8
  %1234 = icmp slt i32 %1230, %1233
  br i1 %1234, label %1235, label %1255

1235:                                             ; preds = %1229
  %1236 = load ptr, ptr %57, align 8
  %1237 = getelementptr inbounds %struct.SetValue, ptr %1236, i32 0, i32 1
  %1238 = load ptr, ptr %1237, align 8
  %1239 = load i32, ptr %59, align 4
  %1240 = sext i32 %1239 to i64
  %1241 = getelementptr inbounds ptr, ptr %1238, i64 %1240
  %1242 = load ptr, ptr %1241, align 8
  %1243 = load ptr, ptr %5, align 8
  %1244 = call ptr @copyValue(ptr noundef %1243)
  %1245 = call ptr @addCalcLangValues(ptr noundef %1242, ptr noundef %1244)
  %1246 = load ptr, ptr %58, align 8
  %1247 = getelementptr inbounds %struct.SetValue, ptr %1246, i32 0, i32 1
  %1248 = load ptr, ptr %1247, align 8
  %1249 = load i32, ptr %59, align 4
  %1250 = sext i32 %1249 to i64
  %1251 = getelementptr inbounds ptr, ptr %1248, i64 %1250
  store ptr %1245, ptr %1251, align 8
  br label %1252

1252:                                             ; preds = %1235
  %1253 = load i32, ptr %59, align 4
  %1254 = add nsw i32 %1253, 1
  store i32 %1254, ptr %59, align 4
  br label %1229, !llvm.loop !23

1255:                                             ; preds = %1229
  %1256 = load ptr, ptr %6, align 8
  %1257 = getelementptr inbounds %struct.CalcLangVal, ptr %1256, i32 0, i32 0
  store i32 6, ptr %1257, align 8
  %1258 = load ptr, ptr %58, align 8
  %1259 = load ptr, ptr %6, align 8
  %1260 = getelementptr inbounds %struct.CalcLangVal, ptr %1259, i32 0, i32 1
  store ptr %1258, ptr %1260, align 8
  br label %1323

1261:                                             ; preds = %1206, %1201
  %1262 = load ptr, ptr %4, align 8
  %1263 = getelementptr inbounds %struct.CalcLangVal, ptr %1262, i32 0, i32 0
  %1264 = load i32, ptr %1263, align 8
  %1265 = icmp eq i32 %1264, 4
  br i1 %1265, label %1266, label %1321

1266:                                             ; preds = %1261
  %1267 = load ptr, ptr %5, align 8
  %1268 = getelementptr inbounds %struct.CalcLangVal, ptr %1267, i32 0, i32 0
  %1269 = load i32, ptr %1268, align 8
  %1270 = icmp eq i32 %1269, 6
  br i1 %1270, label %1271, label %1321

1271:                                             ; preds = %1266
  %1272 = load ptr, ptr %5, align 8
  %1273 = getelementptr inbounds %struct.CalcLangVal, ptr %1272, i32 0, i32 1
  %1274 = load ptr, ptr %1273, align 8
  store ptr %1274, ptr %60, align 8
  %1275 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1275, ptr %61, align 8
  %1276 = load ptr, ptr %60, align 8
  %1277 = getelementptr inbounds %struct.SetValue, ptr %1276, i32 0, i32 0
  %1278 = load i32, ptr %1277, align 8
  %1279 = load ptr, ptr %61, align 8
  %1280 = getelementptr inbounds %struct.SetValue, ptr %1279, i32 0, i32 0
  store i32 %1278, ptr %1280, align 8
  %1281 = load ptr, ptr %61, align 8
  %1282 = getelementptr inbounds %struct.SetValue, ptr %1281, i32 0, i32 0
  %1283 = load i32, ptr %1282, align 8
  %1284 = sext i32 %1283 to i64
  %1285 = mul i64 8, %1284
  %1286 = call noalias ptr @malloc(i64 noundef %1285) #6
  %1287 = load ptr, ptr %61, align 8
  %1288 = getelementptr inbounds %struct.SetValue, ptr %1287, i32 0, i32 1
  store ptr %1286, ptr %1288, align 8
  store i32 0, ptr %62, align 4
  br label %1289

1289:                                             ; preds = %1312, %1271
  %1290 = load i32, ptr %62, align 4
  %1291 = load ptr, ptr %60, align 8
  %1292 = getelementptr inbounds %struct.SetValue, ptr %1291, i32 0, i32 0
  %1293 = load i32, ptr %1292, align 8
  %1294 = icmp slt i32 %1290, %1293
  br i1 %1294, label %1295, label %1315

1295:                                             ; preds = %1289
  %1296 = load ptr, ptr %4, align 8
  %1297 = call ptr @copyValue(ptr noundef %1296)
  %1298 = load ptr, ptr %60, align 8
  %1299 = getelementptr inbounds %struct.SetValue, ptr %1298, i32 0, i32 1
  %1300 = load ptr, ptr %1299, align 8
  %1301 = load i32, ptr %62, align 4
  %1302 = sext i32 %1301 to i64
  %1303 = getelementptr inbounds ptr, ptr %1300, i64 %1302
  %1304 = load ptr, ptr %1303, align 8
  %1305 = call ptr @addCalcLangValues(ptr noundef %1297, ptr noundef %1304)
  %1306 = load ptr, ptr %61, align 8
  %1307 = getelementptr inbounds %struct.SetValue, ptr %1306, i32 0, i32 1
  %1308 = load ptr, ptr %1307, align 8
  %1309 = load i32, ptr %62, align 4
  %1310 = sext i32 %1309 to i64
  %1311 = getelementptr inbounds ptr, ptr %1308, i64 %1310
  store ptr %1305, ptr %1311, align 8
  br label %1312

1312:                                             ; preds = %1295
  %1313 = load i32, ptr %62, align 4
  %1314 = add nsw i32 %1313, 1
  store i32 %1314, ptr %62, align 4
  br label %1289, !llvm.loop !24

1315:                                             ; preds = %1289
  %1316 = load ptr, ptr %6, align 8
  %1317 = getelementptr inbounds %struct.CalcLangVal, ptr %1316, i32 0, i32 0
  store i32 6, ptr %1317, align 8
  %1318 = load ptr, ptr %61, align 8
  %1319 = load ptr, ptr %6, align 8
  %1320 = getelementptr inbounds %struct.CalcLangVal, ptr %1319, i32 0, i32 1
  store ptr %1318, ptr %1320, align 8
  br label %1322

1321:                                             ; preds = %1266, %1261
  call void @perror(ptr noundef @.str.3) #7
  br label %1322

1322:                                             ; preds = %1321, %1315
  br label %1323

1323:                                             ; preds = %1322, %1255
  br label %1324

1324:                                             ; preds = %1323, %1195
  br label %1325

1325:                                             ; preds = %1324, %1135
  br label %1326

1326:                                             ; preds = %1325, %1075
  br label %1327

1327:                                             ; preds = %1326, %1015
  br label %1328

1328:                                             ; preds = %1327, %955
  br label %1329

1329:                                             ; preds = %1328, %896
  br label %1330

1330:                                             ; preds = %1329, %841
  br label %1331

1331:                                             ; preds = %1330, %758
  br label %1332

1332:                                             ; preds = %1331, %698
  br label %1333

1333:                                             ; preds = %1332, %638
  br label %1334

1334:                                             ; preds = %1333, %578
  br label %1335

1335:                                             ; preds = %1334, %518
  br label %1336

1336:                                             ; preds = %1335, %458
  br label %1337

1337:                                             ; preds = %1336, %398
  br label %1338

1338:                                             ; preds = %1337, %336
  br label %1339

1339:                                             ; preds = %1338, %281
  br label %1340

1340:                                             ; preds = %1339, %192
  br label %1341

1341:                                             ; preds = %1340, %170
  br label %1342

1342:                                             ; preds = %1341, %147
  br label %1343

1343:                                             ; preds = %1342, %124
  br label %1344

1344:                                             ; preds = %1343, %102
  br label %1345

1345:                                             ; preds = %1344, %80
  %1346 = load ptr, ptr %6, align 8
  store ptr %1346, ptr %3, align 8
  br label %1347

1347:                                             ; preds = %1345, %840, %280, %68
  %1348 = load ptr, ptr %3, align 8
  ret ptr %1348
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @copyValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %18

9:                                                ; preds = %1
  store i32 16, ptr %4, align 4
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = call noalias ptr @malloc(i64 noundef %11) #6
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %14, i64 %16, i1 false)
  %17 = load ptr, ptr %5, align 8
  store ptr %17, ptr %2, align 8
  br label %18

18:                                               ; preds = %9, %8
  %19 = load ptr, ptr %2, align 8
  ret ptr %19
}

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
  %13 = icmp eq i32 %12, 7
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
  br label %18, !llvm.loop !25

35:                                               ; preds = %18
  %36 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %36) #8
  br label %66

37:                                               ; preds = %9
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 6
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
  br label %46, !llvm.loop !26

63:                                               ; preds = %46
  %64 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %64) #8
  br label %65

65:                                               ; preds = %63, %37
  br label %66

66:                                               ; preds = %65, %35
  %67 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %67) #8
  br label %68

68:                                               ; preds = %66, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @subCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %2
  %66 = load ptr, ptr %5, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %69

68:                                               ; preds = %65, %2
  store ptr null, ptr %3, align 8
  br label %1348

69:                                               ; preds = %65
  %70 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %70, ptr %6, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %92

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %92

80:                                               ; preds = %75
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 0
  store i32 0, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = sub nsw i32 %85, %88
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  store i32 %89, ptr %91, align 8
  br label %1344

92:                                               ; preds = %75, %69
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = icmp eq i32 %95, 1
  br i1 %96, label %97, label %114

97:                                               ; preds = %92
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %114

102:                                              ; preds = %97
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 0
  store i32 1, ptr %104, align 8
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = fsub double %107, %110
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store double %111, ptr %113, align 8
  br label %1343

114:                                              ; preds = %97, %92
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %137

119:                                              ; preds = %114
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 1
  br i1 %123, label %124, label %137

124:                                              ; preds = %119
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 1, ptr %126, align 8
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load i32, ptr %128, align 8
  %130 = sitofp i32 %129 to double
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load double, ptr %132, align 8
  %134 = fsub double %130, %133
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %1342

137:                                              ; preds = %119, %114
  %138 = load ptr, ptr %4, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %160

142:                                              ; preds = %137
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %160

147:                                              ; preds = %142
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 1, ptr %149, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load i32, ptr %154, align 8
  %156 = sitofp i32 %155 to double
  %157 = fsub double %152, %156
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 1
  store double %157, ptr %159, align 8
  br label %1341

160:                                              ; preds = %142, %137
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 0
  %163 = load i32, ptr %162, align 8
  %164 = icmp eq i32 %163, 3
  br i1 %164, label %165, label %182

165:                                              ; preds = %160
  %166 = load ptr, ptr %5, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = icmp eq i32 %168, 3
  br i1 %169, label %170, label %182

170:                                              ; preds = %165
  %171 = load ptr, ptr %6, align 8
  %172 = getelementptr inbounds %struct.CalcLangVal, ptr %171, i32 0, i32 0
  store i32 3, ptr %172, align 8
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = load ptr, ptr %5, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = fsub double %175, %178
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  store double %179, ptr %181, align 8
  br label %1340

182:                                              ; preds = %165, %160
  %183 = load ptr, ptr %4, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 0
  %185 = load i32, ptr %184, align 8
  %186 = icmp eq i32 %185, 4
  br i1 %186, label %187, label %204

187:                                              ; preds = %182
  %188 = load ptr, ptr %5, align 8
  %189 = getelementptr inbounds %struct.CalcLangVal, ptr %188, i32 0, i32 0
  %190 = load i32, ptr %189, align 8
  %191 = icmp eq i32 %190, 4
  br i1 %191, label %192, label %204

192:                                              ; preds = %187
  %193 = load ptr, ptr %6, align 8
  %194 = getelementptr inbounds %struct.CalcLangVal, ptr %193, i32 0, i32 0
  store i32 4, ptr %194, align 8
  %195 = load ptr, ptr %4, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 1
  %197 = load double, ptr %196, align 8
  %198 = load ptr, ptr %5, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 1
  %200 = load double, ptr %199, align 8
  %201 = fsub double %197, %200
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  store double %201, ptr %203, align 8
  br label %1339

204:                                              ; preds = %187, %182
  %205 = load ptr, ptr %4, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 0
  %207 = load i32, ptr %206, align 8
  %208 = icmp eq i32 %207, 7
  br i1 %208, label %209, label %282

209:                                              ; preds = %204
  %210 = load ptr, ptr %5, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 0
  %212 = load i32, ptr %211, align 8
  %213 = icmp eq i32 %212, 7
  br i1 %213, label %214, label %282

214:                                              ; preds = %209
  %215 = load ptr, ptr %4, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  store ptr %217, ptr %7, align 8
  %218 = load ptr, ptr %5, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 1
  %220 = load ptr, ptr %219, align 8
  store ptr %220, ptr %8, align 8
  %221 = load ptr, ptr %8, align 8
  %222 = getelementptr inbounds %struct.TupleValue, ptr %221, i32 0, i32 0
  %223 = load i32, ptr %222, align 8
  %224 = load ptr, ptr %7, align 8
  %225 = getelementptr inbounds %struct.TupleValue, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 8
  %227 = icmp eq i32 %223, %226
  br i1 %227, label %228, label %280

228:                                              ; preds = %214
  %229 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %229, ptr %9, align 8
  %230 = load ptr, ptr %7, align 8
  %231 = getelementptr inbounds %struct.TupleValue, ptr %230, i32 0, i32 0
  %232 = load i32, ptr %231, align 8
  %233 = load ptr, ptr %9, align 8
  %234 = getelementptr inbounds %struct.TupleValue, ptr %233, i32 0, i32 0
  store i32 %232, ptr %234, align 8
  %235 = load ptr, ptr %9, align 8
  %236 = getelementptr inbounds %struct.TupleValue, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %236, align 8
  %238 = sext i32 %237 to i64
  %239 = mul i64 8, %238
  %240 = call noalias ptr @malloc(i64 noundef %239) #6
  %241 = load ptr, ptr %9, align 8
  %242 = getelementptr inbounds %struct.TupleValue, ptr %241, i32 0, i32 1
  store ptr %240, ptr %242, align 8
  store i32 0, ptr %10, align 4
  br label %243

243:                                              ; preds = %271, %228
  %244 = load i32, ptr %10, align 4
  %245 = load ptr, ptr %7, align 8
  %246 = getelementptr inbounds %struct.TupleValue, ptr %245, i32 0, i32 0
  %247 = load i32, ptr %246, align 8
  %248 = icmp slt i32 %244, %247
  br i1 %248, label %249, label %274

249:                                              ; preds = %243
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds %struct.TupleValue, ptr %250, i32 0, i32 1
  %252 = load ptr, ptr %251, align 8
  %253 = load i32, ptr %10, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds ptr, ptr %252, i64 %254
  %256 = load ptr, ptr %255, align 8
  %257 = load ptr, ptr %8, align 8
  %258 = getelementptr inbounds %struct.TupleValue, ptr %257, i32 0, i32 1
  %259 = load ptr, ptr %258, align 8
  %260 = load i32, ptr %10, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds ptr, ptr %259, i64 %261
  %263 = load ptr, ptr %262, align 8
  %264 = call ptr @subCalcLangValues(ptr noundef %256, ptr noundef %263)
  %265 = load ptr, ptr %9, align 8
  %266 = getelementptr inbounds %struct.TupleValue, ptr %265, i32 0, i32 1
  %267 = load ptr, ptr %266, align 8
  %268 = load i32, ptr %10, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds ptr, ptr %267, i64 %269
  store ptr %264, ptr %270, align 8
  br label %271

271:                                              ; preds = %249
  %272 = load i32, ptr %10, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, ptr %10, align 4
  br label %243, !llvm.loop !27

274:                                              ; preds = %243
  %275 = load ptr, ptr %6, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 0
  store i32 7, ptr %276, align 8
  %277 = load ptr, ptr %9, align 8
  %278 = load ptr, ptr %6, align 8
  %279 = getelementptr inbounds %struct.CalcLangVal, ptr %278, i32 0, i32 1
  store ptr %277, ptr %279, align 8
  br label %281

280:                                              ; preds = %214
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1348

281:                                              ; preds = %274
  br label %1338

282:                                              ; preds = %209, %204
  %283 = load ptr, ptr %4, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 0
  %285 = load i32, ptr %284, align 8
  %286 = icmp eq i32 %285, 7
  br i1 %286, label %287, label %342

287:                                              ; preds = %282
  %288 = load ptr, ptr %5, align 8
  %289 = getelementptr inbounds %struct.CalcLangVal, ptr %288, i32 0, i32 0
  %290 = load i32, ptr %289, align 8
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %292, label %342

292:                                              ; preds = %287
  %293 = load ptr, ptr %4, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = load ptr, ptr %294, align 8
  store ptr %295, ptr %11, align 8
  %296 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %296, ptr %12, align 8
  %297 = load ptr, ptr %11, align 8
  %298 = getelementptr inbounds %struct.TupleValue, ptr %297, i32 0, i32 0
  %299 = load i32, ptr %298, align 8
  %300 = load ptr, ptr %12, align 8
  %301 = getelementptr inbounds %struct.TupleValue, ptr %300, i32 0, i32 0
  store i32 %299, ptr %301, align 8
  %302 = load ptr, ptr %12, align 8
  %303 = getelementptr inbounds %struct.TupleValue, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = sext i32 %304 to i64
  %306 = mul i64 8, %305
  %307 = call noalias ptr @malloc(i64 noundef %306) #6
  %308 = load ptr, ptr %12, align 8
  %309 = getelementptr inbounds %struct.TupleValue, ptr %308, i32 0, i32 1
  store ptr %307, ptr %309, align 8
  store i32 0, ptr %13, align 4
  br label %310

310:                                              ; preds = %333, %292
  %311 = load i32, ptr %13, align 4
  %312 = load ptr, ptr %11, align 8
  %313 = getelementptr inbounds %struct.TupleValue, ptr %312, i32 0, i32 0
  %314 = load i32, ptr %313, align 8
  %315 = icmp slt i32 %311, %314
  br i1 %315, label %316, label %336

316:                                              ; preds = %310
  %317 = load ptr, ptr %11, align 8
  %318 = getelementptr inbounds %struct.TupleValue, ptr %317, i32 0, i32 1
  %319 = load ptr, ptr %318, align 8
  %320 = load i32, ptr %13, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds ptr, ptr %319, i64 %321
  %323 = load ptr, ptr %322, align 8
  %324 = load ptr, ptr %5, align 8
  %325 = call ptr @copyValue(ptr noundef %324)
  %326 = call ptr @subCalcLangValues(ptr noundef %323, ptr noundef %325)
  %327 = load ptr, ptr %12, align 8
  %328 = getelementptr inbounds %struct.TupleValue, ptr %327, i32 0, i32 1
  %329 = load ptr, ptr %328, align 8
  %330 = load i32, ptr %13, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds ptr, ptr %329, i64 %331
  store ptr %326, ptr %332, align 8
  br label %333

333:                                              ; preds = %316
  %334 = load i32, ptr %13, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, ptr %13, align 4
  br label %310, !llvm.loop !28

336:                                              ; preds = %310
  %337 = load ptr, ptr %6, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 0
  store i32 7, ptr %338, align 8
  %339 = load ptr, ptr %12, align 8
  %340 = load ptr, ptr %6, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 1
  store ptr %339, ptr %341, align 8
  br label %1337

342:                                              ; preds = %287, %282
  %343 = load ptr, ptr %4, align 8
  %344 = getelementptr inbounds %struct.CalcLangVal, ptr %343, i32 0, i32 0
  %345 = load i32, ptr %344, align 8
  %346 = icmp eq i32 %345, 0
  br i1 %346, label %347, label %402

347:                                              ; preds = %342
  %348 = load ptr, ptr %5, align 8
  %349 = getelementptr inbounds %struct.CalcLangVal, ptr %348, i32 0, i32 0
  %350 = load i32, ptr %349, align 8
  %351 = icmp eq i32 %350, 7
  br i1 %351, label %352, label %402

352:                                              ; preds = %347
  %353 = load ptr, ptr %5, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 1
  %355 = load ptr, ptr %354, align 8
  store ptr %355, ptr %14, align 8
  %356 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %356, ptr %15, align 8
  %357 = load ptr, ptr %14, align 8
  %358 = getelementptr inbounds %struct.TupleValue, ptr %357, i32 0, i32 0
  %359 = load i32, ptr %358, align 8
  %360 = load ptr, ptr %15, align 8
  %361 = getelementptr inbounds %struct.TupleValue, ptr %360, i32 0, i32 0
  store i32 %359, ptr %361, align 8
  %362 = load ptr, ptr %15, align 8
  %363 = getelementptr inbounds %struct.TupleValue, ptr %362, i32 0, i32 0
  %364 = load i32, ptr %363, align 8
  %365 = sext i32 %364 to i64
  %366 = mul i64 8, %365
  %367 = call noalias ptr @malloc(i64 noundef %366) #6
  %368 = load ptr, ptr %15, align 8
  %369 = getelementptr inbounds %struct.TupleValue, ptr %368, i32 0, i32 1
  store ptr %367, ptr %369, align 8
  store i32 0, ptr %16, align 4
  br label %370

370:                                              ; preds = %393, %352
  %371 = load i32, ptr %16, align 4
  %372 = load ptr, ptr %14, align 8
  %373 = getelementptr inbounds %struct.TupleValue, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = icmp slt i32 %371, %374
  br i1 %375, label %376, label %396

376:                                              ; preds = %370
  %377 = load ptr, ptr %4, align 8
  %378 = call ptr @copyValue(ptr noundef %377)
  %379 = load ptr, ptr %14, align 8
  %380 = getelementptr inbounds %struct.TupleValue, ptr %379, i32 0, i32 1
  %381 = load ptr, ptr %380, align 8
  %382 = load i32, ptr %16, align 4
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds ptr, ptr %381, i64 %383
  %385 = load ptr, ptr %384, align 8
  %386 = call ptr @subCalcLangValues(ptr noundef %378, ptr noundef %385)
  %387 = load ptr, ptr %15, align 8
  %388 = getelementptr inbounds %struct.TupleValue, ptr %387, i32 0, i32 1
  %389 = load ptr, ptr %388, align 8
  %390 = load i32, ptr %16, align 4
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds ptr, ptr %389, i64 %391
  store ptr %386, ptr %392, align 8
  br label %393

393:                                              ; preds = %376
  %394 = load i32, ptr %16, align 4
  %395 = add nsw i32 %394, 1
  store i32 %395, ptr %16, align 4
  br label %370, !llvm.loop !29

396:                                              ; preds = %370
  %397 = load ptr, ptr %6, align 8
  %398 = getelementptr inbounds %struct.CalcLangVal, ptr %397, i32 0, i32 0
  store i32 7, ptr %398, align 8
  %399 = load ptr, ptr %15, align 8
  %400 = load ptr, ptr %6, align 8
  %401 = getelementptr inbounds %struct.CalcLangVal, ptr %400, i32 0, i32 1
  store ptr %399, ptr %401, align 8
  br label %1336

402:                                              ; preds = %347, %342
  %403 = load ptr, ptr %4, align 8
  %404 = getelementptr inbounds %struct.CalcLangVal, ptr %403, i32 0, i32 0
  %405 = load i32, ptr %404, align 8
  %406 = icmp eq i32 %405, 7
  br i1 %406, label %407, label %462

407:                                              ; preds = %402
  %408 = load ptr, ptr %5, align 8
  %409 = getelementptr inbounds %struct.CalcLangVal, ptr %408, i32 0, i32 0
  %410 = load i32, ptr %409, align 8
  %411 = icmp eq i32 %410, 1
  br i1 %411, label %412, label %462

412:                                              ; preds = %407
  %413 = load ptr, ptr %4, align 8
  %414 = getelementptr inbounds %struct.CalcLangVal, ptr %413, i32 0, i32 1
  %415 = load ptr, ptr %414, align 8
  store ptr %415, ptr %17, align 8
  %416 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %416, ptr %18, align 8
  %417 = load ptr, ptr %17, align 8
  %418 = getelementptr inbounds %struct.TupleValue, ptr %417, i32 0, i32 0
  %419 = load i32, ptr %418, align 8
  %420 = load ptr, ptr %18, align 8
  %421 = getelementptr inbounds %struct.TupleValue, ptr %420, i32 0, i32 0
  store i32 %419, ptr %421, align 8
  %422 = load ptr, ptr %18, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 0
  %424 = load i32, ptr %423, align 8
  %425 = sext i32 %424 to i64
  %426 = mul i64 8, %425
  %427 = call noalias ptr @malloc(i64 noundef %426) #6
  %428 = load ptr, ptr %18, align 8
  %429 = getelementptr inbounds %struct.TupleValue, ptr %428, i32 0, i32 1
  store ptr %427, ptr %429, align 8
  store i32 0, ptr %19, align 4
  br label %430

430:                                              ; preds = %453, %412
  %431 = load i32, ptr %19, align 4
  %432 = load ptr, ptr %17, align 8
  %433 = getelementptr inbounds %struct.TupleValue, ptr %432, i32 0, i32 0
  %434 = load i32, ptr %433, align 8
  %435 = icmp slt i32 %431, %434
  br i1 %435, label %436, label %456

436:                                              ; preds = %430
  %437 = load ptr, ptr %17, align 8
  %438 = getelementptr inbounds %struct.TupleValue, ptr %437, i32 0, i32 1
  %439 = load ptr, ptr %438, align 8
  %440 = load i32, ptr %19, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds ptr, ptr %439, i64 %441
  %443 = load ptr, ptr %442, align 8
  %444 = load ptr, ptr %5, align 8
  %445 = call ptr @copyValue(ptr noundef %444)
  %446 = call ptr @subCalcLangValues(ptr noundef %443, ptr noundef %445)
  %447 = load ptr, ptr %18, align 8
  %448 = getelementptr inbounds %struct.TupleValue, ptr %447, i32 0, i32 1
  %449 = load ptr, ptr %448, align 8
  %450 = load i32, ptr %19, align 4
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds ptr, ptr %449, i64 %451
  store ptr %446, ptr %452, align 8
  br label %453

453:                                              ; preds = %436
  %454 = load i32, ptr %19, align 4
  %455 = add nsw i32 %454, 1
  store i32 %455, ptr %19, align 4
  br label %430, !llvm.loop !30

456:                                              ; preds = %430
  %457 = load ptr, ptr %6, align 8
  %458 = getelementptr inbounds %struct.CalcLangVal, ptr %457, i32 0, i32 0
  store i32 7, ptr %458, align 8
  %459 = load ptr, ptr %18, align 8
  %460 = load ptr, ptr %6, align 8
  %461 = getelementptr inbounds %struct.CalcLangVal, ptr %460, i32 0, i32 1
  store ptr %459, ptr %461, align 8
  br label %1335

462:                                              ; preds = %407, %402
  %463 = load ptr, ptr %4, align 8
  %464 = getelementptr inbounds %struct.CalcLangVal, ptr %463, i32 0, i32 0
  %465 = load i32, ptr %464, align 8
  %466 = icmp eq i32 %465, 1
  br i1 %466, label %467, label %522

467:                                              ; preds = %462
  %468 = load ptr, ptr %5, align 8
  %469 = getelementptr inbounds %struct.CalcLangVal, ptr %468, i32 0, i32 0
  %470 = load i32, ptr %469, align 8
  %471 = icmp eq i32 %470, 7
  br i1 %471, label %472, label %522

472:                                              ; preds = %467
  %473 = load ptr, ptr %5, align 8
  %474 = getelementptr inbounds %struct.CalcLangVal, ptr %473, i32 0, i32 1
  %475 = load ptr, ptr %474, align 8
  store ptr %475, ptr %20, align 8
  %476 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %476, ptr %21, align 8
  %477 = load ptr, ptr %20, align 8
  %478 = getelementptr inbounds %struct.TupleValue, ptr %477, i32 0, i32 0
  %479 = load i32, ptr %478, align 8
  %480 = load ptr, ptr %21, align 8
  %481 = getelementptr inbounds %struct.TupleValue, ptr %480, i32 0, i32 0
  store i32 %479, ptr %481, align 8
  %482 = load ptr, ptr %21, align 8
  %483 = getelementptr inbounds %struct.TupleValue, ptr %482, i32 0, i32 0
  %484 = load i32, ptr %483, align 8
  %485 = sext i32 %484 to i64
  %486 = mul i64 8, %485
  %487 = call noalias ptr @malloc(i64 noundef %486) #6
  %488 = load ptr, ptr %21, align 8
  %489 = getelementptr inbounds %struct.TupleValue, ptr %488, i32 0, i32 1
  store ptr %487, ptr %489, align 8
  store i32 0, ptr %22, align 4
  br label %490

490:                                              ; preds = %513, %472
  %491 = load i32, ptr %22, align 4
  %492 = load ptr, ptr %20, align 8
  %493 = getelementptr inbounds %struct.TupleValue, ptr %492, i32 0, i32 0
  %494 = load i32, ptr %493, align 8
  %495 = icmp slt i32 %491, %494
  br i1 %495, label %496, label %516

496:                                              ; preds = %490
  %497 = load ptr, ptr %4, align 8
  %498 = call ptr @copyValue(ptr noundef %497)
  %499 = load ptr, ptr %20, align 8
  %500 = getelementptr inbounds %struct.TupleValue, ptr %499, i32 0, i32 1
  %501 = load ptr, ptr %500, align 8
  %502 = load i32, ptr %22, align 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds ptr, ptr %501, i64 %503
  %505 = load ptr, ptr %504, align 8
  %506 = call ptr @subCalcLangValues(ptr noundef %498, ptr noundef %505)
  %507 = load ptr, ptr %21, align 8
  %508 = getelementptr inbounds %struct.TupleValue, ptr %507, i32 0, i32 1
  %509 = load ptr, ptr %508, align 8
  %510 = load i32, ptr %22, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds ptr, ptr %509, i64 %511
  store ptr %506, ptr %512, align 8
  br label %513

513:                                              ; preds = %496
  %514 = load i32, ptr %22, align 4
  %515 = add nsw i32 %514, 1
  store i32 %515, ptr %22, align 4
  br label %490, !llvm.loop !31

516:                                              ; preds = %490
  %517 = load ptr, ptr %6, align 8
  %518 = getelementptr inbounds %struct.CalcLangVal, ptr %517, i32 0, i32 0
  store i32 7, ptr %518, align 8
  %519 = load ptr, ptr %21, align 8
  %520 = load ptr, ptr %6, align 8
  %521 = getelementptr inbounds %struct.CalcLangVal, ptr %520, i32 0, i32 1
  store ptr %519, ptr %521, align 8
  br label %1334

522:                                              ; preds = %467, %462
  %523 = load ptr, ptr %4, align 8
  %524 = getelementptr inbounds %struct.CalcLangVal, ptr %523, i32 0, i32 0
  %525 = load i32, ptr %524, align 8
  %526 = icmp eq i32 %525, 7
  br i1 %526, label %527, label %582

527:                                              ; preds = %522
  %528 = load ptr, ptr %5, align 8
  %529 = getelementptr inbounds %struct.CalcLangVal, ptr %528, i32 0, i32 0
  %530 = load i32, ptr %529, align 8
  %531 = icmp eq i32 %530, 3
  br i1 %531, label %532, label %582

532:                                              ; preds = %527
  %533 = load ptr, ptr %4, align 8
  %534 = getelementptr inbounds %struct.CalcLangVal, ptr %533, i32 0, i32 1
  %535 = load ptr, ptr %534, align 8
  store ptr %535, ptr %23, align 8
  %536 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %536, ptr %24, align 8
  %537 = load ptr, ptr %23, align 8
  %538 = getelementptr inbounds %struct.TupleValue, ptr %537, i32 0, i32 0
  %539 = load i32, ptr %538, align 8
  %540 = load ptr, ptr %24, align 8
  %541 = getelementptr inbounds %struct.TupleValue, ptr %540, i32 0, i32 0
  store i32 %539, ptr %541, align 8
  %542 = load ptr, ptr %24, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = sext i32 %544 to i64
  %546 = mul i64 8, %545
  %547 = call noalias ptr @malloc(i64 noundef %546) #6
  %548 = load ptr, ptr %24, align 8
  %549 = getelementptr inbounds %struct.TupleValue, ptr %548, i32 0, i32 1
  store ptr %547, ptr %549, align 8
  store i32 0, ptr %25, align 4
  br label %550

550:                                              ; preds = %573, %532
  %551 = load i32, ptr %25, align 4
  %552 = load ptr, ptr %23, align 8
  %553 = getelementptr inbounds %struct.TupleValue, ptr %552, i32 0, i32 0
  %554 = load i32, ptr %553, align 8
  %555 = icmp slt i32 %551, %554
  br i1 %555, label %556, label %576

556:                                              ; preds = %550
  %557 = load ptr, ptr %23, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 1
  %559 = load ptr, ptr %558, align 8
  %560 = load i32, ptr %25, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds ptr, ptr %559, i64 %561
  %563 = load ptr, ptr %562, align 8
  %564 = load ptr, ptr %5, align 8
  %565 = call ptr @copyValue(ptr noundef %564)
  %566 = call ptr @subCalcLangValues(ptr noundef %563, ptr noundef %565)
  %567 = load ptr, ptr %24, align 8
  %568 = getelementptr inbounds %struct.TupleValue, ptr %567, i32 0, i32 1
  %569 = load ptr, ptr %568, align 8
  %570 = load i32, ptr %25, align 4
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds ptr, ptr %569, i64 %571
  store ptr %566, ptr %572, align 8
  br label %573

573:                                              ; preds = %556
  %574 = load i32, ptr %25, align 4
  %575 = add nsw i32 %574, 1
  store i32 %575, ptr %25, align 4
  br label %550, !llvm.loop !32

576:                                              ; preds = %550
  %577 = load ptr, ptr %6, align 8
  %578 = getelementptr inbounds %struct.CalcLangVal, ptr %577, i32 0, i32 0
  store i32 7, ptr %578, align 8
  %579 = load ptr, ptr %24, align 8
  %580 = load ptr, ptr %6, align 8
  %581 = getelementptr inbounds %struct.CalcLangVal, ptr %580, i32 0, i32 1
  store ptr %579, ptr %581, align 8
  br label %1333

582:                                              ; preds = %527, %522
  %583 = load ptr, ptr %4, align 8
  %584 = getelementptr inbounds %struct.CalcLangVal, ptr %583, i32 0, i32 0
  %585 = load i32, ptr %584, align 8
  %586 = icmp eq i32 %585, 3
  br i1 %586, label %587, label %642

587:                                              ; preds = %582
  %588 = load ptr, ptr %5, align 8
  %589 = getelementptr inbounds %struct.CalcLangVal, ptr %588, i32 0, i32 0
  %590 = load i32, ptr %589, align 8
  %591 = icmp eq i32 %590, 7
  br i1 %591, label %592, label %642

592:                                              ; preds = %587
  %593 = load ptr, ptr %5, align 8
  %594 = getelementptr inbounds %struct.CalcLangVal, ptr %593, i32 0, i32 1
  %595 = load ptr, ptr %594, align 8
  store ptr %595, ptr %26, align 8
  %596 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %596, ptr %27, align 8
  %597 = load ptr, ptr %26, align 8
  %598 = getelementptr inbounds %struct.TupleValue, ptr %597, i32 0, i32 0
  %599 = load i32, ptr %598, align 8
  %600 = load ptr, ptr %27, align 8
  %601 = getelementptr inbounds %struct.TupleValue, ptr %600, i32 0, i32 0
  store i32 %599, ptr %601, align 8
  %602 = load ptr, ptr %27, align 8
  %603 = getelementptr inbounds %struct.TupleValue, ptr %602, i32 0, i32 0
  %604 = load i32, ptr %603, align 8
  %605 = sext i32 %604 to i64
  %606 = mul i64 8, %605
  %607 = call noalias ptr @malloc(i64 noundef %606) #6
  %608 = load ptr, ptr %27, align 8
  %609 = getelementptr inbounds %struct.TupleValue, ptr %608, i32 0, i32 1
  store ptr %607, ptr %609, align 8
  store i32 0, ptr %28, align 4
  br label %610

610:                                              ; preds = %633, %592
  %611 = load i32, ptr %28, align 4
  %612 = load ptr, ptr %26, align 8
  %613 = getelementptr inbounds %struct.TupleValue, ptr %612, i32 0, i32 0
  %614 = load i32, ptr %613, align 8
  %615 = icmp slt i32 %611, %614
  br i1 %615, label %616, label %636

616:                                              ; preds = %610
  %617 = load ptr, ptr %4, align 8
  %618 = call ptr @copyValue(ptr noundef %617)
  %619 = load ptr, ptr %26, align 8
  %620 = getelementptr inbounds %struct.TupleValue, ptr %619, i32 0, i32 1
  %621 = load ptr, ptr %620, align 8
  %622 = load i32, ptr %28, align 4
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds ptr, ptr %621, i64 %623
  %625 = load ptr, ptr %624, align 8
  %626 = call ptr @subCalcLangValues(ptr noundef %618, ptr noundef %625)
  %627 = load ptr, ptr %27, align 8
  %628 = getelementptr inbounds %struct.TupleValue, ptr %627, i32 0, i32 1
  %629 = load ptr, ptr %628, align 8
  %630 = load i32, ptr %28, align 4
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds ptr, ptr %629, i64 %631
  store ptr %626, ptr %632, align 8
  br label %633

633:                                              ; preds = %616
  %634 = load i32, ptr %28, align 4
  %635 = add nsw i32 %634, 1
  store i32 %635, ptr %28, align 4
  br label %610, !llvm.loop !33

636:                                              ; preds = %610
  %637 = load ptr, ptr %6, align 8
  %638 = getelementptr inbounds %struct.CalcLangVal, ptr %637, i32 0, i32 0
  store i32 7, ptr %638, align 8
  %639 = load ptr, ptr %27, align 8
  %640 = load ptr, ptr %6, align 8
  %641 = getelementptr inbounds %struct.CalcLangVal, ptr %640, i32 0, i32 1
  store ptr %639, ptr %641, align 8
  br label %1332

642:                                              ; preds = %587, %582
  %643 = load ptr, ptr %4, align 8
  %644 = getelementptr inbounds %struct.CalcLangVal, ptr %643, i32 0, i32 0
  %645 = load i32, ptr %644, align 8
  %646 = icmp eq i32 %645, 7
  br i1 %646, label %647, label %702

647:                                              ; preds = %642
  %648 = load ptr, ptr %5, align 8
  %649 = getelementptr inbounds %struct.CalcLangVal, ptr %648, i32 0, i32 0
  %650 = load i32, ptr %649, align 8
  %651 = icmp eq i32 %650, 4
  br i1 %651, label %652, label %702

652:                                              ; preds = %647
  %653 = load ptr, ptr %4, align 8
  %654 = getelementptr inbounds %struct.CalcLangVal, ptr %653, i32 0, i32 1
  %655 = load ptr, ptr %654, align 8
  store ptr %655, ptr %29, align 8
  %656 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %656, ptr %30, align 8
  %657 = load ptr, ptr %29, align 8
  %658 = getelementptr inbounds %struct.TupleValue, ptr %657, i32 0, i32 0
  %659 = load i32, ptr %658, align 8
  %660 = load ptr, ptr %30, align 8
  %661 = getelementptr inbounds %struct.TupleValue, ptr %660, i32 0, i32 0
  store i32 %659, ptr %661, align 8
  %662 = load ptr, ptr %30, align 8
  %663 = getelementptr inbounds %struct.TupleValue, ptr %662, i32 0, i32 0
  %664 = load i32, ptr %663, align 8
  %665 = sext i32 %664 to i64
  %666 = mul i64 8, %665
  %667 = call noalias ptr @malloc(i64 noundef %666) #6
  %668 = load ptr, ptr %30, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  store ptr %667, ptr %669, align 8
  store i32 0, ptr %31, align 4
  br label %670

670:                                              ; preds = %693, %652
  %671 = load i32, ptr %31, align 4
  %672 = load ptr, ptr %29, align 8
  %673 = getelementptr inbounds %struct.TupleValue, ptr %672, i32 0, i32 0
  %674 = load i32, ptr %673, align 8
  %675 = icmp slt i32 %671, %674
  br i1 %675, label %676, label %696

676:                                              ; preds = %670
  %677 = load ptr, ptr %29, align 8
  %678 = getelementptr inbounds %struct.TupleValue, ptr %677, i32 0, i32 1
  %679 = load ptr, ptr %678, align 8
  %680 = load i32, ptr %31, align 4
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds ptr, ptr %679, i64 %681
  %683 = load ptr, ptr %682, align 8
  %684 = load ptr, ptr %5, align 8
  %685 = call ptr @copyValue(ptr noundef %684)
  %686 = call ptr @subCalcLangValues(ptr noundef %683, ptr noundef %685)
  %687 = load ptr, ptr %30, align 8
  %688 = getelementptr inbounds %struct.TupleValue, ptr %687, i32 0, i32 1
  %689 = load ptr, ptr %688, align 8
  %690 = load i32, ptr %31, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds ptr, ptr %689, i64 %691
  store ptr %686, ptr %692, align 8
  br label %693

693:                                              ; preds = %676
  %694 = load i32, ptr %31, align 4
  %695 = add nsw i32 %694, 1
  store i32 %695, ptr %31, align 4
  br label %670, !llvm.loop !34

696:                                              ; preds = %670
  %697 = load ptr, ptr %6, align 8
  %698 = getelementptr inbounds %struct.CalcLangVal, ptr %697, i32 0, i32 0
  store i32 7, ptr %698, align 8
  %699 = load ptr, ptr %30, align 8
  %700 = load ptr, ptr %6, align 8
  %701 = getelementptr inbounds %struct.CalcLangVal, ptr %700, i32 0, i32 1
  store ptr %699, ptr %701, align 8
  br label %1331

702:                                              ; preds = %647, %642
  %703 = load ptr, ptr %4, align 8
  %704 = getelementptr inbounds %struct.CalcLangVal, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = icmp eq i32 %705, 4
  br i1 %706, label %707, label %762

707:                                              ; preds = %702
  %708 = load ptr, ptr %5, align 8
  %709 = getelementptr inbounds %struct.CalcLangVal, ptr %708, i32 0, i32 0
  %710 = load i32, ptr %709, align 8
  %711 = icmp eq i32 %710, 7
  br i1 %711, label %712, label %762

712:                                              ; preds = %707
  %713 = load ptr, ptr %5, align 8
  %714 = getelementptr inbounds %struct.CalcLangVal, ptr %713, i32 0, i32 1
  %715 = load ptr, ptr %714, align 8
  store ptr %715, ptr %32, align 8
  %716 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %716, ptr %33, align 8
  %717 = load ptr, ptr %32, align 8
  %718 = getelementptr inbounds %struct.TupleValue, ptr %717, i32 0, i32 0
  %719 = load i32, ptr %718, align 8
  %720 = load ptr, ptr %33, align 8
  %721 = getelementptr inbounds %struct.TupleValue, ptr %720, i32 0, i32 0
  store i32 %719, ptr %721, align 8
  %722 = load ptr, ptr %33, align 8
  %723 = getelementptr inbounds %struct.TupleValue, ptr %722, i32 0, i32 0
  %724 = load i32, ptr %723, align 8
  %725 = sext i32 %724 to i64
  %726 = mul i64 8, %725
  %727 = call noalias ptr @malloc(i64 noundef %726) #6
  %728 = load ptr, ptr %33, align 8
  %729 = getelementptr inbounds %struct.TupleValue, ptr %728, i32 0, i32 1
  store ptr %727, ptr %729, align 8
  store i32 0, ptr %34, align 4
  br label %730

730:                                              ; preds = %753, %712
  %731 = load i32, ptr %34, align 4
  %732 = load ptr, ptr %32, align 8
  %733 = getelementptr inbounds %struct.TupleValue, ptr %732, i32 0, i32 0
  %734 = load i32, ptr %733, align 8
  %735 = icmp slt i32 %731, %734
  br i1 %735, label %736, label %756

736:                                              ; preds = %730
  %737 = load ptr, ptr %4, align 8
  %738 = call ptr @copyValue(ptr noundef %737)
  %739 = load ptr, ptr %32, align 8
  %740 = getelementptr inbounds %struct.TupleValue, ptr %739, i32 0, i32 1
  %741 = load ptr, ptr %740, align 8
  %742 = load i32, ptr %34, align 4
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds ptr, ptr %741, i64 %743
  %745 = load ptr, ptr %744, align 8
  %746 = call ptr @subCalcLangValues(ptr noundef %738, ptr noundef %745)
  %747 = load ptr, ptr %33, align 8
  %748 = getelementptr inbounds %struct.TupleValue, ptr %747, i32 0, i32 1
  %749 = load ptr, ptr %748, align 8
  %750 = load i32, ptr %34, align 4
  %751 = sext i32 %750 to i64
  %752 = getelementptr inbounds ptr, ptr %749, i64 %751
  store ptr %746, ptr %752, align 8
  br label %753

753:                                              ; preds = %736
  %754 = load i32, ptr %34, align 4
  %755 = add nsw i32 %754, 1
  store i32 %755, ptr %34, align 4
  br label %730, !llvm.loop !35

756:                                              ; preds = %730
  %757 = load ptr, ptr %6, align 8
  %758 = getelementptr inbounds %struct.CalcLangVal, ptr %757, i32 0, i32 0
  store i32 7, ptr %758, align 8
  %759 = load ptr, ptr %33, align 8
  %760 = load ptr, ptr %6, align 8
  %761 = getelementptr inbounds %struct.CalcLangVal, ptr %760, i32 0, i32 1
  store ptr %759, ptr %761, align 8
  br label %1330

762:                                              ; preds = %707, %702
  %763 = load ptr, ptr %4, align 8
  %764 = getelementptr inbounds %struct.CalcLangVal, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = icmp eq i32 %765, 6
  br i1 %766, label %767, label %840

767:                                              ; preds = %762
  %768 = load ptr, ptr %5, align 8
  %769 = getelementptr inbounds %struct.CalcLangVal, ptr %768, i32 0, i32 0
  %770 = load i32, ptr %769, align 8
  %771 = icmp eq i32 %770, 6
  br i1 %771, label %772, label %840

772:                                              ; preds = %767
  %773 = load ptr, ptr %4, align 8
  %774 = getelementptr inbounds %struct.CalcLangVal, ptr %773, i32 0, i32 1
  %775 = load ptr, ptr %774, align 8
  store ptr %775, ptr %35, align 8
  %776 = load ptr, ptr %5, align 8
  %777 = getelementptr inbounds %struct.CalcLangVal, ptr %776, i32 0, i32 1
  %778 = load ptr, ptr %777, align 8
  store ptr %778, ptr %36, align 8
  %779 = load ptr, ptr %36, align 8
  %780 = getelementptr inbounds %struct.SetValue, ptr %779, i32 0, i32 0
  %781 = load i32, ptr %780, align 8
  %782 = load ptr, ptr %35, align 8
  %783 = getelementptr inbounds %struct.SetValue, ptr %782, i32 0, i32 0
  %784 = load i32, ptr %783, align 8
  %785 = icmp eq i32 %781, %784
  br i1 %785, label %786, label %838

786:                                              ; preds = %772
  %787 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %787, ptr %37, align 8
  %788 = load ptr, ptr %35, align 8
  %789 = getelementptr inbounds %struct.SetValue, ptr %788, i32 0, i32 0
  %790 = load i32, ptr %789, align 8
  %791 = load ptr, ptr %37, align 8
  %792 = getelementptr inbounds %struct.SetValue, ptr %791, i32 0, i32 0
  store i32 %790, ptr %792, align 8
  %793 = load ptr, ptr %37, align 8
  %794 = getelementptr inbounds %struct.SetValue, ptr %793, i32 0, i32 0
  %795 = load i32, ptr %794, align 8
  %796 = sext i32 %795 to i64
  %797 = mul i64 8, %796
  %798 = call noalias ptr @malloc(i64 noundef %797) #6
  %799 = load ptr, ptr %37, align 8
  %800 = getelementptr inbounds %struct.SetValue, ptr %799, i32 0, i32 1
  store ptr %798, ptr %800, align 8
  store i32 0, ptr %38, align 4
  br label %801

801:                                              ; preds = %829, %786
  %802 = load i32, ptr %38, align 4
  %803 = load ptr, ptr %35, align 8
  %804 = getelementptr inbounds %struct.SetValue, ptr %803, i32 0, i32 0
  %805 = load i32, ptr %804, align 8
  %806 = icmp slt i32 %802, %805
  br i1 %806, label %807, label %832

807:                                              ; preds = %801
  %808 = load ptr, ptr %35, align 8
  %809 = getelementptr inbounds %struct.SetValue, ptr %808, i32 0, i32 1
  %810 = load ptr, ptr %809, align 8
  %811 = load i32, ptr %38, align 4
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds ptr, ptr %810, i64 %812
  %814 = load ptr, ptr %813, align 8
  %815 = load ptr, ptr %36, align 8
  %816 = getelementptr inbounds %struct.SetValue, ptr %815, i32 0, i32 1
  %817 = load ptr, ptr %816, align 8
  %818 = load i32, ptr %38, align 4
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds ptr, ptr %817, i64 %819
  %821 = load ptr, ptr %820, align 8
  %822 = call ptr @subCalcLangValues(ptr noundef %814, ptr noundef %821)
  %823 = load ptr, ptr %37, align 8
  %824 = getelementptr inbounds %struct.SetValue, ptr %823, i32 0, i32 1
  %825 = load ptr, ptr %824, align 8
  %826 = load i32, ptr %38, align 4
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds ptr, ptr %825, i64 %827
  store ptr %822, ptr %828, align 8
  br label %829

829:                                              ; preds = %807
  %830 = load i32, ptr %38, align 4
  %831 = add nsw i32 %830, 1
  store i32 %831, ptr %38, align 4
  br label %801, !llvm.loop !36

832:                                              ; preds = %801
  %833 = load ptr, ptr %6, align 8
  %834 = getelementptr inbounds %struct.CalcLangVal, ptr %833, i32 0, i32 0
  store i32 6, ptr %834, align 8
  %835 = load ptr, ptr %37, align 8
  %836 = load ptr, ptr %6, align 8
  %837 = getelementptr inbounds %struct.CalcLangVal, ptr %836, i32 0, i32 1
  store ptr %835, ptr %837, align 8
  br label %839

838:                                              ; preds = %772
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1348

839:                                              ; preds = %832
  br label %1329

840:                                              ; preds = %767, %762
  %841 = load ptr, ptr %4, align 8
  %842 = getelementptr inbounds %struct.CalcLangVal, ptr %841, i32 0, i32 0
  %843 = load i32, ptr %842, align 8
  %844 = icmp eq i32 %843, 6
  br i1 %844, label %845, label %900

845:                                              ; preds = %840
  %846 = load ptr, ptr %5, align 8
  %847 = getelementptr inbounds %struct.CalcLangVal, ptr %846, i32 0, i32 0
  %848 = load i32, ptr %847, align 8
  %849 = icmp eq i32 %848, 0
  br i1 %849, label %850, label %900

850:                                              ; preds = %845
  %851 = load ptr, ptr %4, align 8
  %852 = getelementptr inbounds %struct.CalcLangVal, ptr %851, i32 0, i32 1
  %853 = load ptr, ptr %852, align 8
  store ptr %853, ptr %39, align 8
  %854 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %854, ptr %40, align 8
  %855 = load ptr, ptr %39, align 8
  %856 = getelementptr inbounds %struct.SetValue, ptr %855, i32 0, i32 0
  %857 = load i32, ptr %856, align 8
  %858 = load ptr, ptr %40, align 8
  %859 = getelementptr inbounds %struct.SetValue, ptr %858, i32 0, i32 0
  store i32 %857, ptr %859, align 8
  %860 = load ptr, ptr %40, align 8
  %861 = getelementptr inbounds %struct.SetValue, ptr %860, i32 0, i32 0
  %862 = load i32, ptr %861, align 8
  %863 = sext i32 %862 to i64
  %864 = mul i64 8, %863
  %865 = call noalias ptr @malloc(i64 noundef %864) #6
  %866 = load ptr, ptr %40, align 8
  %867 = getelementptr inbounds %struct.SetValue, ptr %866, i32 0, i32 1
  store ptr %865, ptr %867, align 8
  store i32 0, ptr %41, align 4
  br label %868

868:                                              ; preds = %891, %850
  %869 = load i32, ptr %41, align 4
  %870 = load ptr, ptr %39, align 8
  %871 = getelementptr inbounds %struct.SetValue, ptr %870, i32 0, i32 0
  %872 = load i32, ptr %871, align 8
  %873 = icmp slt i32 %869, %872
  br i1 %873, label %874, label %894

874:                                              ; preds = %868
  %875 = load ptr, ptr %39, align 8
  %876 = getelementptr inbounds %struct.SetValue, ptr %875, i32 0, i32 1
  %877 = load ptr, ptr %876, align 8
  %878 = load i32, ptr %41, align 4
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds ptr, ptr %877, i64 %879
  %881 = load ptr, ptr %880, align 8
  %882 = load ptr, ptr %5, align 8
  %883 = call ptr @copyValue(ptr noundef %882)
  %884 = call ptr @subCalcLangValues(ptr noundef %881, ptr noundef %883)
  %885 = load ptr, ptr %40, align 8
  %886 = getelementptr inbounds %struct.SetValue, ptr %885, i32 0, i32 1
  %887 = load ptr, ptr %886, align 8
  %888 = load i32, ptr %41, align 4
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds ptr, ptr %887, i64 %889
  store ptr %884, ptr %890, align 8
  br label %891

891:                                              ; preds = %874
  %892 = load i32, ptr %41, align 4
  %893 = add nsw i32 %892, 1
  store i32 %893, ptr %41, align 4
  br label %868, !llvm.loop !37

894:                                              ; preds = %868
  %895 = load ptr, ptr %6, align 8
  %896 = getelementptr inbounds %struct.CalcLangVal, ptr %895, i32 0, i32 0
  store i32 6, ptr %896, align 8
  %897 = load ptr, ptr %40, align 8
  %898 = load ptr, ptr %6, align 8
  %899 = getelementptr inbounds %struct.CalcLangVal, ptr %898, i32 0, i32 1
  store ptr %897, ptr %899, align 8
  br label %1328

900:                                              ; preds = %845, %840
  %901 = load ptr, ptr %4, align 8
  %902 = getelementptr inbounds %struct.CalcLangVal, ptr %901, i32 0, i32 0
  %903 = load i32, ptr %902, align 8
  %904 = icmp eq i32 %903, 0
  br i1 %904, label %905, label %960

905:                                              ; preds = %900
  %906 = load ptr, ptr %5, align 8
  %907 = getelementptr inbounds %struct.CalcLangVal, ptr %906, i32 0, i32 0
  %908 = load i32, ptr %907, align 8
  %909 = icmp eq i32 %908, 6
  br i1 %909, label %910, label %960

910:                                              ; preds = %905
  %911 = load ptr, ptr %5, align 8
  %912 = getelementptr inbounds %struct.CalcLangVal, ptr %911, i32 0, i32 1
  %913 = load ptr, ptr %912, align 8
  store ptr %913, ptr %42, align 8
  %914 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %914, ptr %43, align 8
  %915 = load ptr, ptr %42, align 8
  %916 = getelementptr inbounds %struct.SetValue, ptr %915, i32 0, i32 0
  %917 = load i32, ptr %916, align 8
  %918 = load ptr, ptr %43, align 8
  %919 = getelementptr inbounds %struct.SetValue, ptr %918, i32 0, i32 0
  store i32 %917, ptr %919, align 8
  %920 = load ptr, ptr %43, align 8
  %921 = getelementptr inbounds %struct.SetValue, ptr %920, i32 0, i32 0
  %922 = load i32, ptr %921, align 8
  %923 = sext i32 %922 to i64
  %924 = mul i64 8, %923
  %925 = call noalias ptr @malloc(i64 noundef %924) #6
  %926 = load ptr, ptr %43, align 8
  %927 = getelementptr inbounds %struct.SetValue, ptr %926, i32 0, i32 1
  store ptr %925, ptr %927, align 8
  store i32 0, ptr %44, align 4
  br label %928

928:                                              ; preds = %951, %910
  %929 = load i32, ptr %44, align 4
  %930 = load ptr, ptr %42, align 8
  %931 = getelementptr inbounds %struct.SetValue, ptr %930, i32 0, i32 0
  %932 = load i32, ptr %931, align 8
  %933 = icmp slt i32 %929, %932
  br i1 %933, label %934, label %954

934:                                              ; preds = %928
  %935 = load ptr, ptr %4, align 8
  %936 = call ptr @copyValue(ptr noundef %935)
  %937 = load ptr, ptr %42, align 8
  %938 = getelementptr inbounds %struct.SetValue, ptr %937, i32 0, i32 1
  %939 = load ptr, ptr %938, align 8
  %940 = load i32, ptr %44, align 4
  %941 = sext i32 %940 to i64
  %942 = getelementptr inbounds ptr, ptr %939, i64 %941
  %943 = load ptr, ptr %942, align 8
  %944 = call ptr @subCalcLangValues(ptr noundef %936, ptr noundef %943)
  %945 = load ptr, ptr %43, align 8
  %946 = getelementptr inbounds %struct.SetValue, ptr %945, i32 0, i32 1
  %947 = load ptr, ptr %946, align 8
  %948 = load i32, ptr %44, align 4
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds ptr, ptr %947, i64 %949
  store ptr %944, ptr %950, align 8
  br label %951

951:                                              ; preds = %934
  %952 = load i32, ptr %44, align 4
  %953 = add nsw i32 %952, 1
  store i32 %953, ptr %44, align 4
  br label %928, !llvm.loop !38

954:                                              ; preds = %928
  %955 = load ptr, ptr %6, align 8
  %956 = getelementptr inbounds %struct.CalcLangVal, ptr %955, i32 0, i32 0
  store i32 6, ptr %956, align 8
  %957 = load ptr, ptr %43, align 8
  %958 = load ptr, ptr %6, align 8
  %959 = getelementptr inbounds %struct.CalcLangVal, ptr %958, i32 0, i32 1
  store ptr %957, ptr %959, align 8
  br label %1327

960:                                              ; preds = %905, %900
  %961 = load ptr, ptr %4, align 8
  %962 = getelementptr inbounds %struct.CalcLangVal, ptr %961, i32 0, i32 0
  %963 = load i32, ptr %962, align 8
  %964 = icmp eq i32 %963, 6
  br i1 %964, label %965, label %1020

965:                                              ; preds = %960
  %966 = load ptr, ptr %5, align 8
  %967 = getelementptr inbounds %struct.CalcLangVal, ptr %966, i32 0, i32 0
  %968 = load i32, ptr %967, align 8
  %969 = icmp eq i32 %968, 1
  br i1 %969, label %970, label %1020

970:                                              ; preds = %965
  %971 = load ptr, ptr %4, align 8
  %972 = getelementptr inbounds %struct.CalcLangVal, ptr %971, i32 0, i32 1
  %973 = load ptr, ptr %972, align 8
  store ptr %973, ptr %45, align 8
  %974 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %974, ptr %46, align 8
  %975 = load ptr, ptr %45, align 8
  %976 = getelementptr inbounds %struct.SetValue, ptr %975, i32 0, i32 0
  %977 = load i32, ptr %976, align 8
  %978 = load ptr, ptr %46, align 8
  %979 = getelementptr inbounds %struct.SetValue, ptr %978, i32 0, i32 0
  store i32 %977, ptr %979, align 8
  %980 = load ptr, ptr %46, align 8
  %981 = getelementptr inbounds %struct.SetValue, ptr %980, i32 0, i32 0
  %982 = load i32, ptr %981, align 8
  %983 = sext i32 %982 to i64
  %984 = mul i64 8, %983
  %985 = call noalias ptr @malloc(i64 noundef %984) #6
  %986 = load ptr, ptr %46, align 8
  %987 = getelementptr inbounds %struct.SetValue, ptr %986, i32 0, i32 1
  store ptr %985, ptr %987, align 8
  store i32 0, ptr %47, align 4
  br label %988

988:                                              ; preds = %1011, %970
  %989 = load i32, ptr %47, align 4
  %990 = load ptr, ptr %45, align 8
  %991 = getelementptr inbounds %struct.SetValue, ptr %990, i32 0, i32 0
  %992 = load i32, ptr %991, align 8
  %993 = icmp slt i32 %989, %992
  br i1 %993, label %994, label %1014

994:                                              ; preds = %988
  %995 = load ptr, ptr %45, align 8
  %996 = getelementptr inbounds %struct.SetValue, ptr %995, i32 0, i32 1
  %997 = load ptr, ptr %996, align 8
  %998 = load i32, ptr %47, align 4
  %999 = sext i32 %998 to i64
  %1000 = getelementptr inbounds ptr, ptr %997, i64 %999
  %1001 = load ptr, ptr %1000, align 8
  %1002 = load ptr, ptr %5, align 8
  %1003 = call ptr @copyValue(ptr noundef %1002)
  %1004 = call ptr @subCalcLangValues(ptr noundef %1001, ptr noundef %1003)
  %1005 = load ptr, ptr %46, align 8
  %1006 = getelementptr inbounds %struct.SetValue, ptr %1005, i32 0, i32 1
  %1007 = load ptr, ptr %1006, align 8
  %1008 = load i32, ptr %47, align 4
  %1009 = sext i32 %1008 to i64
  %1010 = getelementptr inbounds ptr, ptr %1007, i64 %1009
  store ptr %1004, ptr %1010, align 8
  br label %1011

1011:                                             ; preds = %994
  %1012 = load i32, ptr %47, align 4
  %1013 = add nsw i32 %1012, 1
  store i32 %1013, ptr %47, align 4
  br label %988, !llvm.loop !39

1014:                                             ; preds = %988
  %1015 = load ptr, ptr %6, align 8
  %1016 = getelementptr inbounds %struct.CalcLangVal, ptr %1015, i32 0, i32 0
  store i32 7, ptr %1016, align 8
  %1017 = load ptr, ptr %46, align 8
  %1018 = load ptr, ptr %6, align 8
  %1019 = getelementptr inbounds %struct.CalcLangVal, ptr %1018, i32 0, i32 1
  store ptr %1017, ptr %1019, align 8
  br label %1326

1020:                                             ; preds = %965, %960
  %1021 = load ptr, ptr %4, align 8
  %1022 = getelementptr inbounds %struct.CalcLangVal, ptr %1021, i32 0, i32 0
  %1023 = load i32, ptr %1022, align 8
  %1024 = icmp eq i32 %1023, 1
  br i1 %1024, label %1025, label %1080

1025:                                             ; preds = %1020
  %1026 = load ptr, ptr %5, align 8
  %1027 = getelementptr inbounds %struct.CalcLangVal, ptr %1026, i32 0, i32 0
  %1028 = load i32, ptr %1027, align 8
  %1029 = icmp eq i32 %1028, 6
  br i1 %1029, label %1030, label %1080

1030:                                             ; preds = %1025
  %1031 = load ptr, ptr %5, align 8
  %1032 = getelementptr inbounds %struct.CalcLangVal, ptr %1031, i32 0, i32 1
  %1033 = load ptr, ptr %1032, align 8
  store ptr %1033, ptr %48, align 8
  %1034 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1034, ptr %49, align 8
  %1035 = load ptr, ptr %48, align 8
  %1036 = getelementptr inbounds %struct.SetValue, ptr %1035, i32 0, i32 0
  %1037 = load i32, ptr %1036, align 8
  %1038 = load ptr, ptr %49, align 8
  %1039 = getelementptr inbounds %struct.SetValue, ptr %1038, i32 0, i32 0
  store i32 %1037, ptr %1039, align 8
  %1040 = load ptr, ptr %49, align 8
  %1041 = getelementptr inbounds %struct.SetValue, ptr %1040, i32 0, i32 0
  %1042 = load i32, ptr %1041, align 8
  %1043 = sext i32 %1042 to i64
  %1044 = mul i64 8, %1043
  %1045 = call noalias ptr @malloc(i64 noundef %1044) #6
  %1046 = load ptr, ptr %49, align 8
  %1047 = getelementptr inbounds %struct.SetValue, ptr %1046, i32 0, i32 1
  store ptr %1045, ptr %1047, align 8
  store i32 0, ptr %50, align 4
  br label %1048

1048:                                             ; preds = %1071, %1030
  %1049 = load i32, ptr %50, align 4
  %1050 = load ptr, ptr %48, align 8
  %1051 = getelementptr inbounds %struct.SetValue, ptr %1050, i32 0, i32 0
  %1052 = load i32, ptr %1051, align 8
  %1053 = icmp slt i32 %1049, %1052
  br i1 %1053, label %1054, label %1074

1054:                                             ; preds = %1048
  %1055 = load ptr, ptr %4, align 8
  %1056 = call ptr @copyValue(ptr noundef %1055)
  %1057 = load ptr, ptr %48, align 8
  %1058 = getelementptr inbounds %struct.SetValue, ptr %1057, i32 0, i32 1
  %1059 = load ptr, ptr %1058, align 8
  %1060 = load i32, ptr %50, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds ptr, ptr %1059, i64 %1061
  %1063 = load ptr, ptr %1062, align 8
  %1064 = call ptr @subCalcLangValues(ptr noundef %1056, ptr noundef %1063)
  %1065 = load ptr, ptr %49, align 8
  %1066 = getelementptr inbounds %struct.SetValue, ptr %1065, i32 0, i32 1
  %1067 = load ptr, ptr %1066, align 8
  %1068 = load i32, ptr %50, align 4
  %1069 = sext i32 %1068 to i64
  %1070 = getelementptr inbounds ptr, ptr %1067, i64 %1069
  store ptr %1064, ptr %1070, align 8
  br label %1071

1071:                                             ; preds = %1054
  %1072 = load i32, ptr %50, align 4
  %1073 = add nsw i32 %1072, 1
  store i32 %1073, ptr %50, align 4
  br label %1048, !llvm.loop !40

1074:                                             ; preds = %1048
  %1075 = load ptr, ptr %6, align 8
  %1076 = getelementptr inbounds %struct.CalcLangVal, ptr %1075, i32 0, i32 0
  store i32 6, ptr %1076, align 8
  %1077 = load ptr, ptr %49, align 8
  %1078 = load ptr, ptr %6, align 8
  %1079 = getelementptr inbounds %struct.CalcLangVal, ptr %1078, i32 0, i32 1
  store ptr %1077, ptr %1079, align 8
  br label %1325

1080:                                             ; preds = %1025, %1020
  %1081 = load ptr, ptr %4, align 8
  %1082 = getelementptr inbounds %struct.CalcLangVal, ptr %1081, i32 0, i32 0
  %1083 = load i32, ptr %1082, align 8
  %1084 = icmp eq i32 %1083, 6
  br i1 %1084, label %1085, label %1140

1085:                                             ; preds = %1080
  %1086 = load ptr, ptr %5, align 8
  %1087 = getelementptr inbounds %struct.CalcLangVal, ptr %1086, i32 0, i32 0
  %1088 = load i32, ptr %1087, align 8
  %1089 = icmp eq i32 %1088, 3
  br i1 %1089, label %1090, label %1140

1090:                                             ; preds = %1085
  %1091 = load ptr, ptr %4, align 8
  %1092 = getelementptr inbounds %struct.CalcLangVal, ptr %1091, i32 0, i32 1
  %1093 = load ptr, ptr %1092, align 8
  store ptr %1093, ptr %51, align 8
  %1094 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1094, ptr %52, align 8
  %1095 = load ptr, ptr %51, align 8
  %1096 = getelementptr inbounds %struct.SetValue, ptr %1095, i32 0, i32 0
  %1097 = load i32, ptr %1096, align 8
  %1098 = load ptr, ptr %52, align 8
  %1099 = getelementptr inbounds %struct.SetValue, ptr %1098, i32 0, i32 0
  store i32 %1097, ptr %1099, align 8
  %1100 = load ptr, ptr %52, align 8
  %1101 = getelementptr inbounds %struct.SetValue, ptr %1100, i32 0, i32 0
  %1102 = load i32, ptr %1101, align 8
  %1103 = sext i32 %1102 to i64
  %1104 = mul i64 8, %1103
  %1105 = call noalias ptr @malloc(i64 noundef %1104) #6
  %1106 = load ptr, ptr %52, align 8
  %1107 = getelementptr inbounds %struct.SetValue, ptr %1106, i32 0, i32 1
  store ptr %1105, ptr %1107, align 8
  store i32 0, ptr %53, align 4
  br label %1108

1108:                                             ; preds = %1131, %1090
  %1109 = load i32, ptr %53, align 4
  %1110 = load ptr, ptr %51, align 8
  %1111 = getelementptr inbounds %struct.SetValue, ptr %1110, i32 0, i32 0
  %1112 = load i32, ptr %1111, align 8
  %1113 = icmp slt i32 %1109, %1112
  br i1 %1113, label %1114, label %1134

1114:                                             ; preds = %1108
  %1115 = load ptr, ptr %51, align 8
  %1116 = getelementptr inbounds %struct.SetValue, ptr %1115, i32 0, i32 1
  %1117 = load ptr, ptr %1116, align 8
  %1118 = load i32, ptr %53, align 4
  %1119 = sext i32 %1118 to i64
  %1120 = getelementptr inbounds ptr, ptr %1117, i64 %1119
  %1121 = load ptr, ptr %1120, align 8
  %1122 = load ptr, ptr %5, align 8
  %1123 = call ptr @copyValue(ptr noundef %1122)
  %1124 = call ptr @subCalcLangValues(ptr noundef %1121, ptr noundef %1123)
  %1125 = load ptr, ptr %52, align 8
  %1126 = getelementptr inbounds %struct.SetValue, ptr %1125, i32 0, i32 1
  %1127 = load ptr, ptr %1126, align 8
  %1128 = load i32, ptr %53, align 4
  %1129 = sext i32 %1128 to i64
  %1130 = getelementptr inbounds ptr, ptr %1127, i64 %1129
  store ptr %1124, ptr %1130, align 8
  br label %1131

1131:                                             ; preds = %1114
  %1132 = load i32, ptr %53, align 4
  %1133 = add nsw i32 %1132, 1
  store i32 %1133, ptr %53, align 4
  br label %1108, !llvm.loop !41

1134:                                             ; preds = %1108
  %1135 = load ptr, ptr %6, align 8
  %1136 = getelementptr inbounds %struct.CalcLangVal, ptr %1135, i32 0, i32 0
  store i32 6, ptr %1136, align 8
  %1137 = load ptr, ptr %52, align 8
  %1138 = load ptr, ptr %6, align 8
  %1139 = getelementptr inbounds %struct.CalcLangVal, ptr %1138, i32 0, i32 1
  store ptr %1137, ptr %1139, align 8
  br label %1324

1140:                                             ; preds = %1085, %1080
  %1141 = load ptr, ptr %4, align 8
  %1142 = getelementptr inbounds %struct.CalcLangVal, ptr %1141, i32 0, i32 0
  %1143 = load i32, ptr %1142, align 8
  %1144 = icmp eq i32 %1143, 3
  br i1 %1144, label %1145, label %1200

1145:                                             ; preds = %1140
  %1146 = load ptr, ptr %5, align 8
  %1147 = getelementptr inbounds %struct.CalcLangVal, ptr %1146, i32 0, i32 0
  %1148 = load i32, ptr %1147, align 8
  %1149 = icmp eq i32 %1148, 6
  br i1 %1149, label %1150, label %1200

1150:                                             ; preds = %1145
  %1151 = load ptr, ptr %5, align 8
  %1152 = getelementptr inbounds %struct.CalcLangVal, ptr %1151, i32 0, i32 1
  %1153 = load ptr, ptr %1152, align 8
  store ptr %1153, ptr %54, align 8
  %1154 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1154, ptr %55, align 8
  %1155 = load ptr, ptr %54, align 8
  %1156 = getelementptr inbounds %struct.SetValue, ptr %1155, i32 0, i32 0
  %1157 = load i32, ptr %1156, align 8
  %1158 = load ptr, ptr %55, align 8
  %1159 = getelementptr inbounds %struct.SetValue, ptr %1158, i32 0, i32 0
  store i32 %1157, ptr %1159, align 8
  %1160 = load ptr, ptr %55, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 0
  %1162 = load i32, ptr %1161, align 8
  %1163 = sext i32 %1162 to i64
  %1164 = mul i64 8, %1163
  %1165 = call noalias ptr @malloc(i64 noundef %1164) #6
  %1166 = load ptr, ptr %55, align 8
  %1167 = getelementptr inbounds %struct.SetValue, ptr %1166, i32 0, i32 1
  store ptr %1165, ptr %1167, align 8
  store i32 0, ptr %56, align 4
  br label %1168

1168:                                             ; preds = %1191, %1150
  %1169 = load i32, ptr %56, align 4
  %1170 = load ptr, ptr %54, align 8
  %1171 = getelementptr inbounds %struct.SetValue, ptr %1170, i32 0, i32 0
  %1172 = load i32, ptr %1171, align 8
  %1173 = icmp slt i32 %1169, %1172
  br i1 %1173, label %1174, label %1194

1174:                                             ; preds = %1168
  %1175 = load ptr, ptr %4, align 8
  %1176 = call ptr @copyValue(ptr noundef %1175)
  %1177 = load ptr, ptr %54, align 8
  %1178 = getelementptr inbounds %struct.SetValue, ptr %1177, i32 0, i32 1
  %1179 = load ptr, ptr %1178, align 8
  %1180 = load i32, ptr %56, align 4
  %1181 = sext i32 %1180 to i64
  %1182 = getelementptr inbounds ptr, ptr %1179, i64 %1181
  %1183 = load ptr, ptr %1182, align 8
  %1184 = call ptr @subCalcLangValues(ptr noundef %1176, ptr noundef %1183)
  %1185 = load ptr, ptr %55, align 8
  %1186 = getelementptr inbounds %struct.SetValue, ptr %1185, i32 0, i32 1
  %1187 = load ptr, ptr %1186, align 8
  %1188 = load i32, ptr %56, align 4
  %1189 = sext i32 %1188 to i64
  %1190 = getelementptr inbounds ptr, ptr %1187, i64 %1189
  store ptr %1184, ptr %1190, align 8
  br label %1191

1191:                                             ; preds = %1174
  %1192 = load i32, ptr %56, align 4
  %1193 = add nsw i32 %1192, 1
  store i32 %1193, ptr %56, align 4
  br label %1168, !llvm.loop !42

1194:                                             ; preds = %1168
  %1195 = load ptr, ptr %6, align 8
  %1196 = getelementptr inbounds %struct.CalcLangVal, ptr %1195, i32 0, i32 0
  store i32 6, ptr %1196, align 8
  %1197 = load ptr, ptr %55, align 8
  %1198 = load ptr, ptr %6, align 8
  %1199 = getelementptr inbounds %struct.CalcLangVal, ptr %1198, i32 0, i32 1
  store ptr %1197, ptr %1199, align 8
  br label %1323

1200:                                             ; preds = %1145, %1140
  %1201 = load ptr, ptr %4, align 8
  %1202 = getelementptr inbounds %struct.CalcLangVal, ptr %1201, i32 0, i32 0
  %1203 = load i32, ptr %1202, align 8
  %1204 = icmp eq i32 %1203, 6
  br i1 %1204, label %1205, label %1260

1205:                                             ; preds = %1200
  %1206 = load ptr, ptr %5, align 8
  %1207 = getelementptr inbounds %struct.CalcLangVal, ptr %1206, i32 0, i32 0
  %1208 = load i32, ptr %1207, align 8
  %1209 = icmp eq i32 %1208, 4
  br i1 %1209, label %1210, label %1260

1210:                                             ; preds = %1205
  %1211 = load ptr, ptr %4, align 8
  %1212 = getelementptr inbounds %struct.CalcLangVal, ptr %1211, i32 0, i32 1
  %1213 = load ptr, ptr %1212, align 8
  store ptr %1213, ptr %57, align 8
  %1214 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1214, ptr %58, align 8
  %1215 = load ptr, ptr %57, align 8
  %1216 = getelementptr inbounds %struct.SetValue, ptr %1215, i32 0, i32 0
  %1217 = load i32, ptr %1216, align 8
  %1218 = load ptr, ptr %58, align 8
  %1219 = getelementptr inbounds %struct.SetValue, ptr %1218, i32 0, i32 0
  store i32 %1217, ptr %1219, align 8
  %1220 = load ptr, ptr %58, align 8
  %1221 = getelementptr inbounds %struct.SetValue, ptr %1220, i32 0, i32 0
  %1222 = load i32, ptr %1221, align 8
  %1223 = sext i32 %1222 to i64
  %1224 = mul i64 8, %1223
  %1225 = call noalias ptr @malloc(i64 noundef %1224) #6
  %1226 = load ptr, ptr %58, align 8
  %1227 = getelementptr inbounds %struct.SetValue, ptr %1226, i32 0, i32 1
  store ptr %1225, ptr %1227, align 8
  store i32 0, ptr %59, align 4
  br label %1228

1228:                                             ; preds = %1251, %1210
  %1229 = load i32, ptr %59, align 4
  %1230 = load ptr, ptr %57, align 8
  %1231 = getelementptr inbounds %struct.SetValue, ptr %1230, i32 0, i32 0
  %1232 = load i32, ptr %1231, align 8
  %1233 = icmp slt i32 %1229, %1232
  br i1 %1233, label %1234, label %1254

1234:                                             ; preds = %1228
  %1235 = load ptr, ptr %57, align 8
  %1236 = getelementptr inbounds %struct.SetValue, ptr %1235, i32 0, i32 1
  %1237 = load ptr, ptr %1236, align 8
  %1238 = load i32, ptr %59, align 4
  %1239 = sext i32 %1238 to i64
  %1240 = getelementptr inbounds ptr, ptr %1237, i64 %1239
  %1241 = load ptr, ptr %1240, align 8
  %1242 = load ptr, ptr %5, align 8
  %1243 = call ptr @copyValue(ptr noundef %1242)
  %1244 = call ptr @subCalcLangValues(ptr noundef %1241, ptr noundef %1243)
  %1245 = load ptr, ptr %58, align 8
  %1246 = getelementptr inbounds %struct.SetValue, ptr %1245, i32 0, i32 1
  %1247 = load ptr, ptr %1246, align 8
  %1248 = load i32, ptr %59, align 4
  %1249 = sext i32 %1248 to i64
  %1250 = getelementptr inbounds ptr, ptr %1247, i64 %1249
  store ptr %1244, ptr %1250, align 8
  br label %1251

1251:                                             ; preds = %1234
  %1252 = load i32, ptr %59, align 4
  %1253 = add nsw i32 %1252, 1
  store i32 %1253, ptr %59, align 4
  br label %1228, !llvm.loop !43

1254:                                             ; preds = %1228
  %1255 = load ptr, ptr %6, align 8
  %1256 = getelementptr inbounds %struct.CalcLangVal, ptr %1255, i32 0, i32 0
  store i32 6, ptr %1256, align 8
  %1257 = load ptr, ptr %58, align 8
  %1258 = load ptr, ptr %6, align 8
  %1259 = getelementptr inbounds %struct.CalcLangVal, ptr %1258, i32 0, i32 1
  store ptr %1257, ptr %1259, align 8
  br label %1322

1260:                                             ; preds = %1205, %1200
  %1261 = load ptr, ptr %4, align 8
  %1262 = getelementptr inbounds %struct.CalcLangVal, ptr %1261, i32 0, i32 0
  %1263 = load i32, ptr %1262, align 8
  %1264 = icmp eq i32 %1263, 4
  br i1 %1264, label %1265, label %1320

1265:                                             ; preds = %1260
  %1266 = load ptr, ptr %5, align 8
  %1267 = getelementptr inbounds %struct.CalcLangVal, ptr %1266, i32 0, i32 0
  %1268 = load i32, ptr %1267, align 8
  %1269 = icmp eq i32 %1268, 6
  br i1 %1269, label %1270, label %1320

1270:                                             ; preds = %1265
  %1271 = load ptr, ptr %5, align 8
  %1272 = getelementptr inbounds %struct.CalcLangVal, ptr %1271, i32 0, i32 1
  %1273 = load ptr, ptr %1272, align 8
  store ptr %1273, ptr %60, align 8
  %1274 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1274, ptr %61, align 8
  %1275 = load ptr, ptr %60, align 8
  %1276 = getelementptr inbounds %struct.SetValue, ptr %1275, i32 0, i32 0
  %1277 = load i32, ptr %1276, align 8
  %1278 = load ptr, ptr %61, align 8
  %1279 = getelementptr inbounds %struct.SetValue, ptr %1278, i32 0, i32 0
  store i32 %1277, ptr %1279, align 8
  %1280 = load ptr, ptr %61, align 8
  %1281 = getelementptr inbounds %struct.SetValue, ptr %1280, i32 0, i32 0
  %1282 = load i32, ptr %1281, align 8
  %1283 = sext i32 %1282 to i64
  %1284 = mul i64 8, %1283
  %1285 = call noalias ptr @malloc(i64 noundef %1284) #6
  %1286 = load ptr, ptr %61, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 1
  store ptr %1285, ptr %1287, align 8
  store i32 0, ptr %62, align 4
  br label %1288

1288:                                             ; preds = %1311, %1270
  %1289 = load i32, ptr %62, align 4
  %1290 = load ptr, ptr %60, align 8
  %1291 = getelementptr inbounds %struct.SetValue, ptr %1290, i32 0, i32 0
  %1292 = load i32, ptr %1291, align 8
  %1293 = icmp slt i32 %1289, %1292
  br i1 %1293, label %1294, label %1314

1294:                                             ; preds = %1288
  %1295 = load ptr, ptr %4, align 8
  %1296 = call ptr @copyValue(ptr noundef %1295)
  %1297 = load ptr, ptr %60, align 8
  %1298 = getelementptr inbounds %struct.SetValue, ptr %1297, i32 0, i32 1
  %1299 = load ptr, ptr %1298, align 8
  %1300 = load i32, ptr %62, align 4
  %1301 = sext i32 %1300 to i64
  %1302 = getelementptr inbounds ptr, ptr %1299, i64 %1301
  %1303 = load ptr, ptr %1302, align 8
  %1304 = call ptr @subCalcLangValues(ptr noundef %1296, ptr noundef %1303)
  %1305 = load ptr, ptr %61, align 8
  %1306 = getelementptr inbounds %struct.SetValue, ptr %1305, i32 0, i32 1
  %1307 = load ptr, ptr %1306, align 8
  %1308 = load i32, ptr %62, align 4
  %1309 = sext i32 %1308 to i64
  %1310 = getelementptr inbounds ptr, ptr %1307, i64 %1309
  store ptr %1304, ptr %1310, align 8
  br label %1311

1311:                                             ; preds = %1294
  %1312 = load i32, ptr %62, align 4
  %1313 = add nsw i32 %1312, 1
  store i32 %1313, ptr %62, align 4
  br label %1288, !llvm.loop !44

1314:                                             ; preds = %1288
  %1315 = load ptr, ptr %6, align 8
  %1316 = getelementptr inbounds %struct.CalcLangVal, ptr %1315, i32 0, i32 0
  store i32 6, ptr %1316, align 8
  %1317 = load ptr, ptr %61, align 8
  %1318 = load ptr, ptr %6, align 8
  %1319 = getelementptr inbounds %struct.CalcLangVal, ptr %1318, i32 0, i32 1
  store ptr %1317, ptr %1319, align 8
  br label %1321

1320:                                             ; preds = %1265, %1260
  call void @perror(ptr noundef @.str.3) #7
  br label %1321

1321:                                             ; preds = %1320, %1314
  br label %1322

1322:                                             ; preds = %1321, %1254
  br label %1323

1323:                                             ; preds = %1322, %1194
  br label %1324

1324:                                             ; preds = %1323, %1134
  br label %1325

1325:                                             ; preds = %1324, %1074
  br label %1326

1326:                                             ; preds = %1325, %1014
  br label %1327

1327:                                             ; preds = %1326, %954
  br label %1328

1328:                                             ; preds = %1327, %894
  br label %1329

1329:                                             ; preds = %1328, %839
  br label %1330

1330:                                             ; preds = %1329, %756
  br label %1331

1331:                                             ; preds = %1330, %696
  br label %1332

1332:                                             ; preds = %1331, %636
  br label %1333

1333:                                             ; preds = %1332, %576
  br label %1334

1334:                                             ; preds = %1333, %516
  br label %1335

1335:                                             ; preds = %1334, %456
  br label %1336

1336:                                             ; preds = %1335, %396
  br label %1337

1337:                                             ; preds = %1336, %336
  br label %1338

1338:                                             ; preds = %1337, %281
  br label %1339

1339:                                             ; preds = %1338, %192
  br label %1340

1340:                                             ; preds = %1339, %170
  br label %1341

1341:                                             ; preds = %1340, %147
  br label %1342

1342:                                             ; preds = %1341, %124
  br label %1343

1343:                                             ; preds = %1342, %102
  br label %1344

1344:                                             ; preds = %1343, %80
  %1345 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %1345)
  %1346 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %1346)
  %1347 = load ptr, ptr %6, align 8
  store ptr %1347, ptr %3, align 8
  br label %1348

1348:                                             ; preds = %1344, %838, %280, %68
  %1349 = load ptr, ptr %3, align 8
  ret ptr %1349
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @multCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %2
  %66 = load ptr, ptr %5, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %69

68:                                               ; preds = %65, %2
  store ptr null, ptr %3, align 8
  br label %1513

69:                                               ; preds = %65
  %70 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %70, ptr %6, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %92

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %92

80:                                               ; preds = %75
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 0
  store i32 0, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 8
  %89 = mul nsw i32 %85, %88
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  store i32 %89, ptr %91, align 8
  br label %1509

92:                                               ; preds = %75, %69
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = icmp eq i32 %95, 1
  br i1 %96, label %97, label %114

97:                                               ; preds = %92
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %114

102:                                              ; preds = %97
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 0
  store i32 1, ptr %104, align 8
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = fmul double %107, %110
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store double %111, ptr %113, align 8
  br label %1508

114:                                              ; preds = %97, %92
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %137

119:                                              ; preds = %114
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 1
  br i1 %123, label %124, label %137

124:                                              ; preds = %119
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 1, ptr %126, align 8
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load i32, ptr %128, align 8
  %130 = sitofp i32 %129 to double
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load double, ptr %132, align 8
  %134 = fmul double %130, %133
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  store double %134, ptr %136, align 8
  br label %1507

137:                                              ; preds = %119, %114
  %138 = load ptr, ptr %4, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %160

142:                                              ; preds = %137
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 8
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %160

147:                                              ; preds = %142
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 0
  store i32 1, ptr %149, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load i32, ptr %154, align 8
  %156 = sitofp i32 %155 to double
  %157 = fmul double %152, %156
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 1
  store double %157, ptr %159, align 8
  br label %1506

160:                                              ; preds = %142, %137
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 0
  %163 = load i32, ptr %162, align 8
  %164 = icmp eq i32 %163, 3
  br i1 %164, label %165, label %183

165:                                              ; preds = %160
  %166 = load ptr, ptr %5, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %183

170:                                              ; preds = %165
  %171 = load ptr, ptr %6, align 8
  %172 = getelementptr inbounds %struct.CalcLangVal, ptr %171, i32 0, i32 0
  store i32 3, ptr %172, align 8
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = load ptr, ptr %5, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load i32, ptr %177, align 8
  %179 = sitofp i32 %178 to double
  %180 = fmul double %175, %179
  %181 = load ptr, ptr %6, align 8
  %182 = getelementptr inbounds %struct.CalcLangVal, ptr %181, i32 0, i32 1
  store double %180, ptr %182, align 8
  br label %1505

183:                                              ; preds = %165, %160
  %184 = load ptr, ptr %4, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 0
  %186 = load i32, ptr %185, align 8
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %206

188:                                              ; preds = %183
  %189 = load ptr, ptr %5, align 8
  %190 = getelementptr inbounds %struct.CalcLangVal, ptr %189, i32 0, i32 0
  %191 = load i32, ptr %190, align 8
  %192 = icmp eq i32 %191, 3
  br i1 %192, label %193, label %206

193:                                              ; preds = %188
  %194 = load ptr, ptr %6, align 8
  %195 = getelementptr inbounds %struct.CalcLangVal, ptr %194, i32 0, i32 0
  store i32 3, ptr %195, align 8
  %196 = load ptr, ptr %4, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 1
  %198 = load i32, ptr %197, align 8
  %199 = sitofp i32 %198 to double
  %200 = load ptr, ptr %5, align 8
  %201 = getelementptr inbounds %struct.CalcLangVal, ptr %200, i32 0, i32 1
  %202 = load double, ptr %201, align 8
  %203 = fmul double %199, %202
  %204 = load ptr, ptr %6, align 8
  %205 = getelementptr inbounds %struct.CalcLangVal, ptr %204, i32 0, i32 1
  store double %203, ptr %205, align 8
  br label %1504

206:                                              ; preds = %188, %183
  %207 = load ptr, ptr %4, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 0
  %209 = load i32, ptr %208, align 8
  %210 = icmp eq i32 %209, 1
  br i1 %210, label %211, label %228

211:                                              ; preds = %206
  %212 = load ptr, ptr %5, align 8
  %213 = getelementptr inbounds %struct.CalcLangVal, ptr %212, i32 0, i32 0
  %214 = load i32, ptr %213, align 8
  %215 = icmp eq i32 %214, 3
  br i1 %215, label %216, label %228

216:                                              ; preds = %211
  %217 = load ptr, ptr %6, align 8
  %218 = getelementptr inbounds %struct.CalcLangVal, ptr %217, i32 0, i32 0
  store i32 3, ptr %218, align 8
  %219 = load ptr, ptr %4, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 1
  %221 = load double, ptr %220, align 8
  %222 = load ptr, ptr %5, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 1
  %224 = load double, ptr %223, align 8
  %225 = fmul double %221, %224
  %226 = load ptr, ptr %6, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 1
  store double %225, ptr %227, align 8
  br label %1503

228:                                              ; preds = %211, %206
  %229 = load ptr, ptr %4, align 8
  %230 = getelementptr inbounds %struct.CalcLangVal, ptr %229, i32 0, i32 0
  %231 = load i32, ptr %230, align 8
  %232 = icmp eq i32 %231, 3
  br i1 %232, label %233, label %250

233:                                              ; preds = %228
  %234 = load ptr, ptr %5, align 8
  %235 = getelementptr inbounds %struct.CalcLangVal, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = icmp eq i32 %236, 1
  br i1 %237, label %238, label %250

238:                                              ; preds = %233
  %239 = load ptr, ptr %6, align 8
  %240 = getelementptr inbounds %struct.CalcLangVal, ptr %239, i32 0, i32 0
  store i32 3, ptr %240, align 8
  %241 = load ptr, ptr %4, align 8
  %242 = getelementptr inbounds %struct.CalcLangVal, ptr %241, i32 0, i32 1
  %243 = load double, ptr %242, align 8
  %244 = load ptr, ptr %5, align 8
  %245 = getelementptr inbounds %struct.CalcLangVal, ptr %244, i32 0, i32 1
  %246 = load double, ptr %245, align 8
  %247 = fmul double %243, %246
  %248 = load ptr, ptr %6, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 1
  store double %247, ptr %249, align 8
  br label %1502

250:                                              ; preds = %233, %228
  %251 = load ptr, ptr %4, align 8
  %252 = getelementptr inbounds %struct.CalcLangVal, ptr %251, i32 0, i32 0
  %253 = load i32, ptr %252, align 8
  %254 = icmp eq i32 %253, 4
  br i1 %254, label %255, label %273

255:                                              ; preds = %250
  %256 = load ptr, ptr %5, align 8
  %257 = getelementptr inbounds %struct.CalcLangVal, ptr %256, i32 0, i32 0
  %258 = load i32, ptr %257, align 8
  %259 = icmp eq i32 %258, 0
  br i1 %259, label %260, label %273

260:                                              ; preds = %255
  %261 = load ptr, ptr %6, align 8
  %262 = getelementptr inbounds %struct.CalcLangVal, ptr %261, i32 0, i32 0
  store i32 4, ptr %262, align 8
  %263 = load ptr, ptr %4, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 1
  %265 = load double, ptr %264, align 8
  %266 = load ptr, ptr %5, align 8
  %267 = getelementptr inbounds %struct.CalcLangVal, ptr %266, i32 0, i32 1
  %268 = load i32, ptr %267, align 8
  %269 = sitofp i32 %268 to double
  %270 = fmul double %265, %269
  %271 = load ptr, ptr %6, align 8
  %272 = getelementptr inbounds %struct.CalcLangVal, ptr %271, i32 0, i32 1
  store double %270, ptr %272, align 8
  br label %1501

273:                                              ; preds = %255, %250
  %274 = load ptr, ptr %4, align 8
  %275 = getelementptr inbounds %struct.CalcLangVal, ptr %274, i32 0, i32 0
  %276 = load i32, ptr %275, align 8
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %278, label %296

278:                                              ; preds = %273
  %279 = load ptr, ptr %5, align 8
  %280 = getelementptr inbounds %struct.CalcLangVal, ptr %279, i32 0, i32 0
  %281 = load i32, ptr %280, align 8
  %282 = icmp eq i32 %281, 4
  br i1 %282, label %283, label %296

283:                                              ; preds = %278
  %284 = load ptr, ptr %6, align 8
  %285 = getelementptr inbounds %struct.CalcLangVal, ptr %284, i32 0, i32 0
  store i32 4, ptr %285, align 8
  %286 = load ptr, ptr %4, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 1
  %288 = load i32, ptr %287, align 8
  %289 = sitofp i32 %288 to double
  %290 = load ptr, ptr %5, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 1
  %292 = load double, ptr %291, align 8
  %293 = fmul double %289, %292
  %294 = load ptr, ptr %6, align 8
  %295 = getelementptr inbounds %struct.CalcLangVal, ptr %294, i32 0, i32 1
  store double %293, ptr %295, align 8
  br label %1500

296:                                              ; preds = %278, %273
  %297 = load ptr, ptr %4, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 0
  %299 = load i32, ptr %298, align 8
  %300 = icmp eq i32 %299, 1
  br i1 %300, label %301, label %318

301:                                              ; preds = %296
  %302 = load ptr, ptr %5, align 8
  %303 = getelementptr inbounds %struct.CalcLangVal, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = icmp eq i32 %304, 4
  br i1 %305, label %306, label %318

306:                                              ; preds = %301
  %307 = load ptr, ptr %6, align 8
  %308 = getelementptr inbounds %struct.CalcLangVal, ptr %307, i32 0, i32 0
  store i32 4, ptr %308, align 8
  %309 = load ptr, ptr %4, align 8
  %310 = getelementptr inbounds %struct.CalcLangVal, ptr %309, i32 0, i32 1
  %311 = load double, ptr %310, align 8
  %312 = load ptr, ptr %5, align 8
  %313 = getelementptr inbounds %struct.CalcLangVal, ptr %312, i32 0, i32 1
  %314 = load double, ptr %313, align 8
  %315 = fmul double %311, %314
  %316 = load ptr, ptr %6, align 8
  %317 = getelementptr inbounds %struct.CalcLangVal, ptr %316, i32 0, i32 1
  store double %315, ptr %317, align 8
  br label %1499

318:                                              ; preds = %301, %296
  %319 = load ptr, ptr %4, align 8
  %320 = getelementptr inbounds %struct.CalcLangVal, ptr %319, i32 0, i32 0
  %321 = load i32, ptr %320, align 8
  %322 = icmp eq i32 %321, 4
  br i1 %322, label %323, label %340

323:                                              ; preds = %318
  %324 = load ptr, ptr %5, align 8
  %325 = getelementptr inbounds %struct.CalcLangVal, ptr %324, i32 0, i32 0
  %326 = load i32, ptr %325, align 8
  %327 = icmp eq i32 %326, 1
  br i1 %327, label %328, label %340

328:                                              ; preds = %323
  %329 = load ptr, ptr %6, align 8
  %330 = getelementptr inbounds %struct.CalcLangVal, ptr %329, i32 0, i32 0
  store i32 4, ptr %330, align 8
  %331 = load ptr, ptr %4, align 8
  %332 = getelementptr inbounds %struct.CalcLangVal, ptr %331, i32 0, i32 1
  %333 = load double, ptr %332, align 8
  %334 = load ptr, ptr %5, align 8
  %335 = getelementptr inbounds %struct.CalcLangVal, ptr %334, i32 0, i32 1
  %336 = load double, ptr %335, align 8
  %337 = fmul double %333, %336
  %338 = load ptr, ptr %6, align 8
  %339 = getelementptr inbounds %struct.CalcLangVal, ptr %338, i32 0, i32 1
  store double %337, ptr %339, align 8
  br label %1498

340:                                              ; preds = %323, %318
  %341 = load ptr, ptr %4, align 8
  %342 = getelementptr inbounds %struct.CalcLangVal, ptr %341, i32 0, i32 0
  %343 = load i32, ptr %342, align 8
  %344 = icmp eq i32 %343, 4
  br i1 %344, label %345, label %362

345:                                              ; preds = %340
  %346 = load ptr, ptr %5, align 8
  %347 = getelementptr inbounds %struct.CalcLangVal, ptr %346, i32 0, i32 0
  %348 = load i32, ptr %347, align 8
  %349 = icmp eq i32 %348, 4
  br i1 %349, label %350, label %362

350:                                              ; preds = %345
  %351 = load ptr, ptr %6, align 8
  %352 = getelementptr inbounds %struct.CalcLangVal, ptr %351, i32 0, i32 0
  store i32 4, ptr %352, align 8
  %353 = load ptr, ptr %4, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 1
  %355 = load double, ptr %354, align 8
  %356 = load ptr, ptr %5, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load double, ptr %357, align 8
  %359 = fmul double %355, %358
  %360 = load ptr, ptr %6, align 8
  %361 = getelementptr inbounds %struct.CalcLangVal, ptr %360, i32 0, i32 1
  store double %359, ptr %361, align 8
  br label %1497

362:                                              ; preds = %345, %340
  %363 = load ptr, ptr %4, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 0
  %365 = load i32, ptr %364, align 8
  %366 = icmp eq i32 %365, 7
  br i1 %366, label %367, label %440

367:                                              ; preds = %362
  %368 = load ptr, ptr %5, align 8
  %369 = getelementptr inbounds %struct.CalcLangVal, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = icmp eq i32 %370, 7
  br i1 %371, label %372, label %440

372:                                              ; preds = %367
  %373 = load ptr, ptr %4, align 8
  %374 = getelementptr inbounds %struct.CalcLangVal, ptr %373, i32 0, i32 1
  %375 = load ptr, ptr %374, align 8
  store ptr %375, ptr %7, align 8
  %376 = load ptr, ptr %5, align 8
  %377 = getelementptr inbounds %struct.CalcLangVal, ptr %376, i32 0, i32 1
  %378 = load ptr, ptr %377, align 8
  store ptr %378, ptr %8, align 8
  %379 = load ptr, ptr %8, align 8
  %380 = getelementptr inbounds %struct.TupleValue, ptr %379, i32 0, i32 0
  %381 = load i32, ptr %380, align 8
  %382 = load ptr, ptr %7, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 0
  %384 = load i32, ptr %383, align 8
  %385 = icmp eq i32 %381, %384
  br i1 %385, label %386, label %438

386:                                              ; preds = %372
  %387 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %387, ptr %9, align 8
  %388 = load ptr, ptr %7, align 8
  %389 = getelementptr inbounds %struct.TupleValue, ptr %388, i32 0, i32 0
  %390 = load i32, ptr %389, align 8
  %391 = load ptr, ptr %9, align 8
  %392 = getelementptr inbounds %struct.TupleValue, ptr %391, i32 0, i32 0
  store i32 %390, ptr %392, align 8
  %393 = load ptr, ptr %9, align 8
  %394 = getelementptr inbounds %struct.TupleValue, ptr %393, i32 0, i32 0
  %395 = load i32, ptr %394, align 8
  %396 = sext i32 %395 to i64
  %397 = mul i64 8, %396
  %398 = call noalias ptr @malloc(i64 noundef %397) #6
  %399 = load ptr, ptr %9, align 8
  %400 = getelementptr inbounds %struct.TupleValue, ptr %399, i32 0, i32 1
  store ptr %398, ptr %400, align 8
  store i32 0, ptr %10, align 4
  br label %401

401:                                              ; preds = %429, %386
  %402 = load i32, ptr %10, align 4
  %403 = load ptr, ptr %7, align 8
  %404 = getelementptr inbounds %struct.TupleValue, ptr %403, i32 0, i32 0
  %405 = load i32, ptr %404, align 8
  %406 = icmp slt i32 %402, %405
  br i1 %406, label %407, label %432

407:                                              ; preds = %401
  %408 = load ptr, ptr %7, align 8
  %409 = getelementptr inbounds %struct.TupleValue, ptr %408, i32 0, i32 1
  %410 = load ptr, ptr %409, align 8
  %411 = load i32, ptr %10, align 4
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds ptr, ptr %410, i64 %412
  %414 = load ptr, ptr %413, align 8
  %415 = load ptr, ptr %8, align 8
  %416 = getelementptr inbounds %struct.TupleValue, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  %418 = load i32, ptr %10, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds ptr, ptr %417, i64 %419
  %421 = load ptr, ptr %420, align 8
  %422 = call ptr @multCalcLangValues(ptr noundef %414, ptr noundef %421)
  %423 = load ptr, ptr %9, align 8
  %424 = getelementptr inbounds %struct.TupleValue, ptr %423, i32 0, i32 1
  %425 = load ptr, ptr %424, align 8
  %426 = load i32, ptr %10, align 4
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds ptr, ptr %425, i64 %427
  store ptr %422, ptr %428, align 8
  br label %429

429:                                              ; preds = %407
  %430 = load i32, ptr %10, align 4
  %431 = add nsw i32 %430, 1
  store i32 %431, ptr %10, align 4
  br label %401, !llvm.loop !45

432:                                              ; preds = %401
  %433 = load ptr, ptr %6, align 8
  %434 = getelementptr inbounds %struct.CalcLangVal, ptr %433, i32 0, i32 0
  store i32 7, ptr %434, align 8
  %435 = load ptr, ptr %9, align 8
  %436 = load ptr, ptr %6, align 8
  %437 = getelementptr inbounds %struct.CalcLangVal, ptr %436, i32 0, i32 1
  store ptr %435, ptr %437, align 8
  br label %439

438:                                              ; preds = %372
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1513

439:                                              ; preds = %432
  br label %1496

440:                                              ; preds = %367, %362
  %441 = load ptr, ptr %4, align 8
  %442 = getelementptr inbounds %struct.CalcLangVal, ptr %441, i32 0, i32 0
  %443 = load i32, ptr %442, align 8
  %444 = icmp eq i32 %443, 7
  br i1 %444, label %445, label %500

445:                                              ; preds = %440
  %446 = load ptr, ptr %5, align 8
  %447 = getelementptr inbounds %struct.CalcLangVal, ptr %446, i32 0, i32 0
  %448 = load i32, ptr %447, align 8
  %449 = icmp eq i32 %448, 0
  br i1 %449, label %450, label %500

450:                                              ; preds = %445
  %451 = load ptr, ptr %4, align 8
  %452 = getelementptr inbounds %struct.CalcLangVal, ptr %451, i32 0, i32 1
  %453 = load ptr, ptr %452, align 8
  store ptr %453, ptr %11, align 8
  %454 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %454, ptr %12, align 8
  %455 = load ptr, ptr %11, align 8
  %456 = getelementptr inbounds %struct.TupleValue, ptr %455, i32 0, i32 0
  %457 = load i32, ptr %456, align 8
  %458 = load ptr, ptr %12, align 8
  %459 = getelementptr inbounds %struct.TupleValue, ptr %458, i32 0, i32 0
  store i32 %457, ptr %459, align 8
  %460 = load ptr, ptr %12, align 8
  %461 = getelementptr inbounds %struct.TupleValue, ptr %460, i32 0, i32 0
  %462 = load i32, ptr %461, align 8
  %463 = sext i32 %462 to i64
  %464 = mul i64 8, %463
  %465 = call noalias ptr @malloc(i64 noundef %464) #6
  %466 = load ptr, ptr %12, align 8
  %467 = getelementptr inbounds %struct.TupleValue, ptr %466, i32 0, i32 1
  store ptr %465, ptr %467, align 8
  store i32 0, ptr %13, align 4
  br label %468

468:                                              ; preds = %491, %450
  %469 = load i32, ptr %13, align 4
  %470 = load ptr, ptr %11, align 8
  %471 = getelementptr inbounds %struct.TupleValue, ptr %470, i32 0, i32 0
  %472 = load i32, ptr %471, align 8
  %473 = icmp slt i32 %469, %472
  br i1 %473, label %474, label %494

474:                                              ; preds = %468
  %475 = load ptr, ptr %11, align 8
  %476 = getelementptr inbounds %struct.TupleValue, ptr %475, i32 0, i32 1
  %477 = load ptr, ptr %476, align 8
  %478 = load i32, ptr %13, align 4
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds ptr, ptr %477, i64 %479
  %481 = load ptr, ptr %480, align 8
  %482 = load ptr, ptr %5, align 8
  %483 = call ptr @copyValue(ptr noundef %482)
  %484 = call ptr @multCalcLangValues(ptr noundef %481, ptr noundef %483)
  %485 = load ptr, ptr %12, align 8
  %486 = getelementptr inbounds %struct.TupleValue, ptr %485, i32 0, i32 1
  %487 = load ptr, ptr %486, align 8
  %488 = load i32, ptr %13, align 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds ptr, ptr %487, i64 %489
  store ptr %484, ptr %490, align 8
  br label %491

491:                                              ; preds = %474
  %492 = load i32, ptr %13, align 4
  %493 = add nsw i32 %492, 1
  store i32 %493, ptr %13, align 4
  br label %468, !llvm.loop !46

494:                                              ; preds = %468
  %495 = load ptr, ptr %6, align 8
  %496 = getelementptr inbounds %struct.CalcLangVal, ptr %495, i32 0, i32 0
  store i32 7, ptr %496, align 8
  %497 = load ptr, ptr %12, align 8
  %498 = load ptr, ptr %6, align 8
  %499 = getelementptr inbounds %struct.CalcLangVal, ptr %498, i32 0, i32 1
  store ptr %497, ptr %499, align 8
  br label %1495

500:                                              ; preds = %445, %440
  %501 = load ptr, ptr %4, align 8
  %502 = getelementptr inbounds %struct.CalcLangVal, ptr %501, i32 0, i32 0
  %503 = load i32, ptr %502, align 8
  %504 = icmp eq i32 %503, 0
  br i1 %504, label %505, label %560

505:                                              ; preds = %500
  %506 = load ptr, ptr %5, align 8
  %507 = getelementptr inbounds %struct.CalcLangVal, ptr %506, i32 0, i32 0
  %508 = load i32, ptr %507, align 8
  %509 = icmp eq i32 %508, 7
  br i1 %509, label %510, label %560

510:                                              ; preds = %505
  %511 = load ptr, ptr %5, align 8
  %512 = getelementptr inbounds %struct.CalcLangVal, ptr %511, i32 0, i32 1
  %513 = load ptr, ptr %512, align 8
  store ptr %513, ptr %14, align 8
  %514 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %514, ptr %15, align 8
  %515 = load ptr, ptr %14, align 8
  %516 = getelementptr inbounds %struct.TupleValue, ptr %515, i32 0, i32 0
  %517 = load i32, ptr %516, align 8
  %518 = load ptr, ptr %15, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 0
  store i32 %517, ptr %519, align 8
  %520 = load ptr, ptr %15, align 8
  %521 = getelementptr inbounds %struct.TupleValue, ptr %520, i32 0, i32 0
  %522 = load i32, ptr %521, align 8
  %523 = sext i32 %522 to i64
  %524 = mul i64 8, %523
  %525 = call noalias ptr @malloc(i64 noundef %524) #6
  %526 = load ptr, ptr %15, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 1
  store ptr %525, ptr %527, align 8
  store i32 0, ptr %16, align 4
  br label %528

528:                                              ; preds = %551, %510
  %529 = load i32, ptr %16, align 4
  %530 = load ptr, ptr %14, align 8
  %531 = getelementptr inbounds %struct.TupleValue, ptr %530, i32 0, i32 0
  %532 = load i32, ptr %531, align 8
  %533 = icmp slt i32 %529, %532
  br i1 %533, label %534, label %554

534:                                              ; preds = %528
  %535 = load ptr, ptr %4, align 8
  %536 = call ptr @copyValue(ptr noundef %535)
  %537 = load ptr, ptr %14, align 8
  %538 = getelementptr inbounds %struct.TupleValue, ptr %537, i32 0, i32 1
  %539 = load ptr, ptr %538, align 8
  %540 = load i32, ptr %16, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds ptr, ptr %539, i64 %541
  %543 = load ptr, ptr %542, align 8
  %544 = call ptr @multCalcLangValues(ptr noundef %536, ptr noundef %543)
  %545 = load ptr, ptr %15, align 8
  %546 = getelementptr inbounds %struct.TupleValue, ptr %545, i32 0, i32 1
  %547 = load ptr, ptr %546, align 8
  %548 = load i32, ptr %16, align 4
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds ptr, ptr %547, i64 %549
  store ptr %544, ptr %550, align 8
  br label %551

551:                                              ; preds = %534
  %552 = load i32, ptr %16, align 4
  %553 = add nsw i32 %552, 1
  store i32 %553, ptr %16, align 4
  br label %528, !llvm.loop !47

554:                                              ; preds = %528
  %555 = load ptr, ptr %6, align 8
  %556 = getelementptr inbounds %struct.CalcLangVal, ptr %555, i32 0, i32 0
  store i32 7, ptr %556, align 8
  %557 = load ptr, ptr %15, align 8
  %558 = load ptr, ptr %6, align 8
  %559 = getelementptr inbounds %struct.CalcLangVal, ptr %558, i32 0, i32 1
  store ptr %557, ptr %559, align 8
  br label %1494

560:                                              ; preds = %505, %500
  %561 = load ptr, ptr %4, align 8
  %562 = getelementptr inbounds %struct.CalcLangVal, ptr %561, i32 0, i32 0
  %563 = load i32, ptr %562, align 8
  %564 = icmp eq i32 %563, 7
  br i1 %564, label %565, label %620

565:                                              ; preds = %560
  %566 = load ptr, ptr %5, align 8
  %567 = getelementptr inbounds %struct.CalcLangVal, ptr %566, i32 0, i32 0
  %568 = load i32, ptr %567, align 8
  %569 = icmp eq i32 %568, 1
  br i1 %569, label %570, label %620

570:                                              ; preds = %565
  %571 = load ptr, ptr %4, align 8
  %572 = getelementptr inbounds %struct.CalcLangVal, ptr %571, i32 0, i32 1
  %573 = load ptr, ptr %572, align 8
  store ptr %573, ptr %17, align 8
  %574 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %574, ptr %18, align 8
  %575 = load ptr, ptr %17, align 8
  %576 = getelementptr inbounds %struct.TupleValue, ptr %575, i32 0, i32 0
  %577 = load i32, ptr %576, align 8
  %578 = load ptr, ptr %18, align 8
  %579 = getelementptr inbounds %struct.TupleValue, ptr %578, i32 0, i32 0
  store i32 %577, ptr %579, align 8
  %580 = load ptr, ptr %18, align 8
  %581 = getelementptr inbounds %struct.TupleValue, ptr %580, i32 0, i32 0
  %582 = load i32, ptr %581, align 8
  %583 = sext i32 %582 to i64
  %584 = mul i64 8, %583
  %585 = call noalias ptr @malloc(i64 noundef %584) #6
  %586 = load ptr, ptr %18, align 8
  %587 = getelementptr inbounds %struct.TupleValue, ptr %586, i32 0, i32 1
  store ptr %585, ptr %587, align 8
  store i32 0, ptr %19, align 4
  br label %588

588:                                              ; preds = %611, %570
  %589 = load i32, ptr %19, align 4
  %590 = load ptr, ptr %17, align 8
  %591 = getelementptr inbounds %struct.TupleValue, ptr %590, i32 0, i32 0
  %592 = load i32, ptr %591, align 8
  %593 = icmp slt i32 %589, %592
  br i1 %593, label %594, label %614

594:                                              ; preds = %588
  %595 = load ptr, ptr %17, align 8
  %596 = getelementptr inbounds %struct.TupleValue, ptr %595, i32 0, i32 1
  %597 = load ptr, ptr %596, align 8
  %598 = load i32, ptr %19, align 4
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds ptr, ptr %597, i64 %599
  %601 = load ptr, ptr %600, align 8
  %602 = load ptr, ptr %5, align 8
  %603 = call ptr @copyValue(ptr noundef %602)
  %604 = call ptr @multCalcLangValues(ptr noundef %601, ptr noundef %603)
  %605 = load ptr, ptr %18, align 8
  %606 = getelementptr inbounds %struct.TupleValue, ptr %605, i32 0, i32 1
  %607 = load ptr, ptr %606, align 8
  %608 = load i32, ptr %19, align 4
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds ptr, ptr %607, i64 %609
  store ptr %604, ptr %610, align 8
  br label %611

611:                                              ; preds = %594
  %612 = load i32, ptr %19, align 4
  %613 = add nsw i32 %612, 1
  store i32 %613, ptr %19, align 4
  br label %588, !llvm.loop !48

614:                                              ; preds = %588
  %615 = load ptr, ptr %6, align 8
  %616 = getelementptr inbounds %struct.CalcLangVal, ptr %615, i32 0, i32 0
  store i32 7, ptr %616, align 8
  %617 = load ptr, ptr %18, align 8
  %618 = load ptr, ptr %6, align 8
  %619 = getelementptr inbounds %struct.CalcLangVal, ptr %618, i32 0, i32 1
  store ptr %617, ptr %619, align 8
  br label %1493

620:                                              ; preds = %565, %560
  %621 = load ptr, ptr %4, align 8
  %622 = getelementptr inbounds %struct.CalcLangVal, ptr %621, i32 0, i32 0
  %623 = load i32, ptr %622, align 8
  %624 = icmp eq i32 %623, 1
  br i1 %624, label %625, label %680

625:                                              ; preds = %620
  %626 = load ptr, ptr %5, align 8
  %627 = getelementptr inbounds %struct.CalcLangVal, ptr %626, i32 0, i32 0
  %628 = load i32, ptr %627, align 8
  %629 = icmp eq i32 %628, 7
  br i1 %629, label %630, label %680

630:                                              ; preds = %625
  %631 = load ptr, ptr %5, align 8
  %632 = getelementptr inbounds %struct.CalcLangVal, ptr %631, i32 0, i32 1
  %633 = load ptr, ptr %632, align 8
  store ptr %633, ptr %20, align 8
  %634 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %634, ptr %21, align 8
  %635 = load ptr, ptr %20, align 8
  %636 = getelementptr inbounds %struct.TupleValue, ptr %635, i32 0, i32 0
  %637 = load i32, ptr %636, align 8
  %638 = load ptr, ptr %21, align 8
  %639 = getelementptr inbounds %struct.TupleValue, ptr %638, i32 0, i32 0
  store i32 %637, ptr %639, align 8
  %640 = load ptr, ptr %21, align 8
  %641 = getelementptr inbounds %struct.TupleValue, ptr %640, i32 0, i32 0
  %642 = load i32, ptr %641, align 8
  %643 = sext i32 %642 to i64
  %644 = mul i64 8, %643
  %645 = call noalias ptr @malloc(i64 noundef %644) #6
  %646 = load ptr, ptr %21, align 8
  %647 = getelementptr inbounds %struct.TupleValue, ptr %646, i32 0, i32 1
  store ptr %645, ptr %647, align 8
  store i32 0, ptr %22, align 4
  br label %648

648:                                              ; preds = %671, %630
  %649 = load i32, ptr %22, align 4
  %650 = load ptr, ptr %20, align 8
  %651 = getelementptr inbounds %struct.TupleValue, ptr %650, i32 0, i32 0
  %652 = load i32, ptr %651, align 8
  %653 = icmp slt i32 %649, %652
  br i1 %653, label %654, label %674

654:                                              ; preds = %648
  %655 = load ptr, ptr %4, align 8
  %656 = call ptr @copyValue(ptr noundef %655)
  %657 = load ptr, ptr %20, align 8
  %658 = getelementptr inbounds %struct.TupleValue, ptr %657, i32 0, i32 1
  %659 = load ptr, ptr %658, align 8
  %660 = load i32, ptr %22, align 4
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds ptr, ptr %659, i64 %661
  %663 = load ptr, ptr %662, align 8
  %664 = call ptr @multCalcLangValues(ptr noundef %656, ptr noundef %663)
  %665 = load ptr, ptr %21, align 8
  %666 = getelementptr inbounds %struct.TupleValue, ptr %665, i32 0, i32 1
  %667 = load ptr, ptr %666, align 8
  %668 = load i32, ptr %22, align 4
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds ptr, ptr %667, i64 %669
  store ptr %664, ptr %670, align 8
  br label %671

671:                                              ; preds = %654
  %672 = load i32, ptr %22, align 4
  %673 = add nsw i32 %672, 1
  store i32 %673, ptr %22, align 4
  br label %648, !llvm.loop !49

674:                                              ; preds = %648
  %675 = load ptr, ptr %6, align 8
  %676 = getelementptr inbounds %struct.CalcLangVal, ptr %675, i32 0, i32 0
  store i32 7, ptr %676, align 8
  %677 = load ptr, ptr %21, align 8
  %678 = load ptr, ptr %6, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 1
  store ptr %677, ptr %679, align 8
  br label %1492

680:                                              ; preds = %625, %620
  %681 = load ptr, ptr %4, align 8
  %682 = getelementptr inbounds %struct.CalcLangVal, ptr %681, i32 0, i32 0
  %683 = load i32, ptr %682, align 8
  %684 = icmp eq i32 %683, 7
  br i1 %684, label %685, label %740

685:                                              ; preds = %680
  %686 = load ptr, ptr %5, align 8
  %687 = getelementptr inbounds %struct.CalcLangVal, ptr %686, i32 0, i32 0
  %688 = load i32, ptr %687, align 8
  %689 = icmp eq i32 %688, 3
  br i1 %689, label %690, label %740

690:                                              ; preds = %685
  %691 = load ptr, ptr %4, align 8
  %692 = getelementptr inbounds %struct.CalcLangVal, ptr %691, i32 0, i32 1
  %693 = load ptr, ptr %692, align 8
  store ptr %693, ptr %23, align 8
  %694 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %694, ptr %24, align 8
  %695 = load ptr, ptr %23, align 8
  %696 = getelementptr inbounds %struct.TupleValue, ptr %695, i32 0, i32 0
  %697 = load i32, ptr %696, align 8
  %698 = load ptr, ptr %24, align 8
  %699 = getelementptr inbounds %struct.TupleValue, ptr %698, i32 0, i32 0
  store i32 %697, ptr %699, align 8
  %700 = load ptr, ptr %24, align 8
  %701 = getelementptr inbounds %struct.TupleValue, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = sext i32 %702 to i64
  %704 = mul i64 8, %703
  %705 = call noalias ptr @malloc(i64 noundef %704) #6
  %706 = load ptr, ptr %24, align 8
  %707 = getelementptr inbounds %struct.TupleValue, ptr %706, i32 0, i32 1
  store ptr %705, ptr %707, align 8
  store i32 0, ptr %25, align 4
  br label %708

708:                                              ; preds = %731, %690
  %709 = load i32, ptr %25, align 4
  %710 = load ptr, ptr %23, align 8
  %711 = getelementptr inbounds %struct.TupleValue, ptr %710, i32 0, i32 0
  %712 = load i32, ptr %711, align 8
  %713 = icmp slt i32 %709, %712
  br i1 %713, label %714, label %734

714:                                              ; preds = %708
  %715 = load ptr, ptr %23, align 8
  %716 = getelementptr inbounds %struct.TupleValue, ptr %715, i32 0, i32 1
  %717 = load ptr, ptr %716, align 8
  %718 = load i32, ptr %25, align 4
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds ptr, ptr %717, i64 %719
  %721 = load ptr, ptr %720, align 8
  %722 = load ptr, ptr %5, align 8
  %723 = call ptr @copyValue(ptr noundef %722)
  %724 = call ptr @multCalcLangValues(ptr noundef %721, ptr noundef %723)
  %725 = load ptr, ptr %24, align 8
  %726 = getelementptr inbounds %struct.TupleValue, ptr %725, i32 0, i32 1
  %727 = load ptr, ptr %726, align 8
  %728 = load i32, ptr %25, align 4
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds ptr, ptr %727, i64 %729
  store ptr %724, ptr %730, align 8
  br label %731

731:                                              ; preds = %714
  %732 = load i32, ptr %25, align 4
  %733 = add nsw i32 %732, 1
  store i32 %733, ptr %25, align 4
  br label %708, !llvm.loop !50

734:                                              ; preds = %708
  %735 = load ptr, ptr %6, align 8
  %736 = getelementptr inbounds %struct.CalcLangVal, ptr %735, i32 0, i32 0
  store i32 7, ptr %736, align 8
  %737 = load ptr, ptr %24, align 8
  %738 = load ptr, ptr %6, align 8
  %739 = getelementptr inbounds %struct.CalcLangVal, ptr %738, i32 0, i32 1
  store ptr %737, ptr %739, align 8
  br label %1491

740:                                              ; preds = %685, %680
  %741 = load ptr, ptr %4, align 8
  %742 = getelementptr inbounds %struct.CalcLangVal, ptr %741, i32 0, i32 0
  %743 = load i32, ptr %742, align 8
  %744 = icmp eq i32 %743, 3
  br i1 %744, label %745, label %800

745:                                              ; preds = %740
  %746 = load ptr, ptr %5, align 8
  %747 = getelementptr inbounds %struct.CalcLangVal, ptr %746, i32 0, i32 0
  %748 = load i32, ptr %747, align 8
  %749 = icmp eq i32 %748, 7
  br i1 %749, label %750, label %800

750:                                              ; preds = %745
  %751 = load ptr, ptr %5, align 8
  %752 = getelementptr inbounds %struct.CalcLangVal, ptr %751, i32 0, i32 1
  %753 = load ptr, ptr %752, align 8
  store ptr %753, ptr %26, align 8
  %754 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %754, ptr %27, align 8
  %755 = load ptr, ptr %26, align 8
  %756 = getelementptr inbounds %struct.TupleValue, ptr %755, i32 0, i32 0
  %757 = load i32, ptr %756, align 8
  %758 = load ptr, ptr %27, align 8
  %759 = getelementptr inbounds %struct.TupleValue, ptr %758, i32 0, i32 0
  store i32 %757, ptr %759, align 8
  %760 = load ptr, ptr %27, align 8
  %761 = getelementptr inbounds %struct.TupleValue, ptr %760, i32 0, i32 0
  %762 = load i32, ptr %761, align 8
  %763 = sext i32 %762 to i64
  %764 = mul i64 8, %763
  %765 = call noalias ptr @malloc(i64 noundef %764) #6
  %766 = load ptr, ptr %27, align 8
  %767 = getelementptr inbounds %struct.TupleValue, ptr %766, i32 0, i32 1
  store ptr %765, ptr %767, align 8
  store i32 0, ptr %28, align 4
  br label %768

768:                                              ; preds = %791, %750
  %769 = load i32, ptr %28, align 4
  %770 = load ptr, ptr %26, align 8
  %771 = getelementptr inbounds %struct.TupleValue, ptr %770, i32 0, i32 0
  %772 = load i32, ptr %771, align 8
  %773 = icmp slt i32 %769, %772
  br i1 %773, label %774, label %794

774:                                              ; preds = %768
  %775 = load ptr, ptr %4, align 8
  %776 = call ptr @copyValue(ptr noundef %775)
  %777 = load ptr, ptr %26, align 8
  %778 = getelementptr inbounds %struct.TupleValue, ptr %777, i32 0, i32 1
  %779 = load ptr, ptr %778, align 8
  %780 = load i32, ptr %28, align 4
  %781 = sext i32 %780 to i64
  %782 = getelementptr inbounds ptr, ptr %779, i64 %781
  %783 = load ptr, ptr %782, align 8
  %784 = call ptr @multCalcLangValues(ptr noundef %776, ptr noundef %783)
  %785 = load ptr, ptr %27, align 8
  %786 = getelementptr inbounds %struct.TupleValue, ptr %785, i32 0, i32 1
  %787 = load ptr, ptr %786, align 8
  %788 = load i32, ptr %28, align 4
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds ptr, ptr %787, i64 %789
  store ptr %784, ptr %790, align 8
  br label %791

791:                                              ; preds = %774
  %792 = load i32, ptr %28, align 4
  %793 = add nsw i32 %792, 1
  store i32 %793, ptr %28, align 4
  br label %768, !llvm.loop !51

794:                                              ; preds = %768
  %795 = load ptr, ptr %6, align 8
  %796 = getelementptr inbounds %struct.CalcLangVal, ptr %795, i32 0, i32 0
  store i32 7, ptr %796, align 8
  %797 = load ptr, ptr %27, align 8
  %798 = load ptr, ptr %6, align 8
  %799 = getelementptr inbounds %struct.CalcLangVal, ptr %798, i32 0, i32 1
  store ptr %797, ptr %799, align 8
  br label %1490

800:                                              ; preds = %745, %740
  %801 = load ptr, ptr %4, align 8
  %802 = getelementptr inbounds %struct.CalcLangVal, ptr %801, i32 0, i32 0
  %803 = load i32, ptr %802, align 8
  %804 = icmp eq i32 %803, 7
  br i1 %804, label %805, label %860

805:                                              ; preds = %800
  %806 = load ptr, ptr %5, align 8
  %807 = getelementptr inbounds %struct.CalcLangVal, ptr %806, i32 0, i32 0
  %808 = load i32, ptr %807, align 8
  %809 = icmp eq i32 %808, 4
  br i1 %809, label %810, label %860

810:                                              ; preds = %805
  %811 = load ptr, ptr %4, align 8
  %812 = getelementptr inbounds %struct.CalcLangVal, ptr %811, i32 0, i32 1
  %813 = load ptr, ptr %812, align 8
  store ptr %813, ptr %29, align 8
  %814 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %814, ptr %30, align 8
  %815 = load ptr, ptr %29, align 8
  %816 = getelementptr inbounds %struct.TupleValue, ptr %815, i32 0, i32 0
  %817 = load i32, ptr %816, align 8
  %818 = load ptr, ptr %30, align 8
  %819 = getelementptr inbounds %struct.TupleValue, ptr %818, i32 0, i32 0
  store i32 %817, ptr %819, align 8
  %820 = load ptr, ptr %30, align 8
  %821 = getelementptr inbounds %struct.TupleValue, ptr %820, i32 0, i32 0
  %822 = load i32, ptr %821, align 8
  %823 = sext i32 %822 to i64
  %824 = mul i64 8, %823
  %825 = call noalias ptr @malloc(i64 noundef %824) #6
  %826 = load ptr, ptr %30, align 8
  %827 = getelementptr inbounds %struct.TupleValue, ptr %826, i32 0, i32 1
  store ptr %825, ptr %827, align 8
  store i32 0, ptr %31, align 4
  br label %828

828:                                              ; preds = %851, %810
  %829 = load i32, ptr %31, align 4
  %830 = load ptr, ptr %29, align 8
  %831 = getelementptr inbounds %struct.TupleValue, ptr %830, i32 0, i32 0
  %832 = load i32, ptr %831, align 8
  %833 = icmp slt i32 %829, %832
  br i1 %833, label %834, label %854

834:                                              ; preds = %828
  %835 = load ptr, ptr %29, align 8
  %836 = getelementptr inbounds %struct.TupleValue, ptr %835, i32 0, i32 1
  %837 = load ptr, ptr %836, align 8
  %838 = load i32, ptr %31, align 4
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds ptr, ptr %837, i64 %839
  %841 = load ptr, ptr %840, align 8
  %842 = load ptr, ptr %5, align 8
  %843 = call ptr @copyValue(ptr noundef %842)
  %844 = call ptr @multCalcLangValues(ptr noundef %841, ptr noundef %843)
  %845 = load ptr, ptr %30, align 8
  %846 = getelementptr inbounds %struct.TupleValue, ptr %845, i32 0, i32 1
  %847 = load ptr, ptr %846, align 8
  %848 = load i32, ptr %31, align 4
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds ptr, ptr %847, i64 %849
  store ptr %844, ptr %850, align 8
  br label %851

851:                                              ; preds = %834
  %852 = load i32, ptr %31, align 4
  %853 = add nsw i32 %852, 1
  store i32 %853, ptr %31, align 4
  br label %828, !llvm.loop !52

854:                                              ; preds = %828
  %855 = load ptr, ptr %6, align 8
  %856 = getelementptr inbounds %struct.CalcLangVal, ptr %855, i32 0, i32 0
  store i32 7, ptr %856, align 8
  %857 = load ptr, ptr %30, align 8
  %858 = load ptr, ptr %6, align 8
  %859 = getelementptr inbounds %struct.CalcLangVal, ptr %858, i32 0, i32 1
  store ptr %857, ptr %859, align 8
  br label %1489

860:                                              ; preds = %805, %800
  %861 = load ptr, ptr %4, align 8
  %862 = getelementptr inbounds %struct.CalcLangVal, ptr %861, i32 0, i32 0
  %863 = load i32, ptr %862, align 8
  %864 = icmp eq i32 %863, 4
  br i1 %864, label %865, label %920

865:                                              ; preds = %860
  %866 = load ptr, ptr %5, align 8
  %867 = getelementptr inbounds %struct.CalcLangVal, ptr %866, i32 0, i32 0
  %868 = load i32, ptr %867, align 8
  %869 = icmp eq i32 %868, 7
  br i1 %869, label %870, label %920

870:                                              ; preds = %865
  %871 = load ptr, ptr %5, align 8
  %872 = getelementptr inbounds %struct.CalcLangVal, ptr %871, i32 0, i32 1
  %873 = load ptr, ptr %872, align 8
  store ptr %873, ptr %32, align 8
  %874 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %874, ptr %33, align 8
  %875 = load ptr, ptr %32, align 8
  %876 = getelementptr inbounds %struct.TupleValue, ptr %875, i32 0, i32 0
  %877 = load i32, ptr %876, align 8
  %878 = load ptr, ptr %33, align 8
  %879 = getelementptr inbounds %struct.TupleValue, ptr %878, i32 0, i32 0
  store i32 %877, ptr %879, align 8
  %880 = load ptr, ptr %33, align 8
  %881 = getelementptr inbounds %struct.TupleValue, ptr %880, i32 0, i32 0
  %882 = load i32, ptr %881, align 8
  %883 = sext i32 %882 to i64
  %884 = mul i64 8, %883
  %885 = call noalias ptr @malloc(i64 noundef %884) #6
  %886 = load ptr, ptr %33, align 8
  %887 = getelementptr inbounds %struct.TupleValue, ptr %886, i32 0, i32 1
  store ptr %885, ptr %887, align 8
  store i32 0, ptr %34, align 4
  br label %888

888:                                              ; preds = %911, %870
  %889 = load i32, ptr %34, align 4
  %890 = load ptr, ptr %32, align 8
  %891 = getelementptr inbounds %struct.TupleValue, ptr %890, i32 0, i32 0
  %892 = load i32, ptr %891, align 8
  %893 = icmp slt i32 %889, %892
  br i1 %893, label %894, label %914

894:                                              ; preds = %888
  %895 = load ptr, ptr %4, align 8
  %896 = call ptr @copyValue(ptr noundef %895)
  %897 = load ptr, ptr %32, align 8
  %898 = getelementptr inbounds %struct.TupleValue, ptr %897, i32 0, i32 1
  %899 = load ptr, ptr %898, align 8
  %900 = load i32, ptr %34, align 4
  %901 = sext i32 %900 to i64
  %902 = getelementptr inbounds ptr, ptr %899, i64 %901
  %903 = load ptr, ptr %902, align 8
  %904 = call ptr @multCalcLangValues(ptr noundef %896, ptr noundef %903)
  %905 = load ptr, ptr %33, align 8
  %906 = getelementptr inbounds %struct.TupleValue, ptr %905, i32 0, i32 1
  %907 = load ptr, ptr %906, align 8
  %908 = load i32, ptr %34, align 4
  %909 = sext i32 %908 to i64
  %910 = getelementptr inbounds ptr, ptr %907, i64 %909
  store ptr %904, ptr %910, align 8
  br label %911

911:                                              ; preds = %894
  %912 = load i32, ptr %34, align 4
  %913 = add nsw i32 %912, 1
  store i32 %913, ptr %34, align 4
  br label %888, !llvm.loop !53

914:                                              ; preds = %888
  %915 = load ptr, ptr %6, align 8
  %916 = getelementptr inbounds %struct.CalcLangVal, ptr %915, i32 0, i32 0
  store i32 7, ptr %916, align 8
  %917 = load ptr, ptr %33, align 8
  %918 = load ptr, ptr %6, align 8
  %919 = getelementptr inbounds %struct.CalcLangVal, ptr %918, i32 0, i32 1
  store ptr %917, ptr %919, align 8
  br label %1488

920:                                              ; preds = %865, %860
  %921 = load ptr, ptr %4, align 8
  %922 = getelementptr inbounds %struct.CalcLangVal, ptr %921, i32 0, i32 0
  %923 = load i32, ptr %922, align 8
  %924 = icmp eq i32 %923, 6
  br i1 %924, label %925, label %998

925:                                              ; preds = %920
  %926 = load ptr, ptr %5, align 8
  %927 = getelementptr inbounds %struct.CalcLangVal, ptr %926, i32 0, i32 0
  %928 = load i32, ptr %927, align 8
  %929 = icmp eq i32 %928, 6
  br i1 %929, label %930, label %998

930:                                              ; preds = %925
  %931 = load ptr, ptr %4, align 8
  %932 = getelementptr inbounds %struct.CalcLangVal, ptr %931, i32 0, i32 1
  %933 = load ptr, ptr %932, align 8
  store ptr %933, ptr %35, align 8
  %934 = load ptr, ptr %5, align 8
  %935 = getelementptr inbounds %struct.CalcLangVal, ptr %934, i32 0, i32 1
  %936 = load ptr, ptr %935, align 8
  store ptr %936, ptr %36, align 8
  %937 = load ptr, ptr %36, align 8
  %938 = getelementptr inbounds %struct.SetValue, ptr %937, i32 0, i32 0
  %939 = load i32, ptr %938, align 8
  %940 = load ptr, ptr %35, align 8
  %941 = getelementptr inbounds %struct.SetValue, ptr %940, i32 0, i32 0
  %942 = load i32, ptr %941, align 8
  %943 = icmp eq i32 %939, %942
  br i1 %943, label %944, label %996

944:                                              ; preds = %930
  %945 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %945, ptr %37, align 8
  %946 = load ptr, ptr %35, align 8
  %947 = getelementptr inbounds %struct.SetValue, ptr %946, i32 0, i32 0
  %948 = load i32, ptr %947, align 8
  %949 = load ptr, ptr %37, align 8
  %950 = getelementptr inbounds %struct.SetValue, ptr %949, i32 0, i32 0
  store i32 %948, ptr %950, align 8
  %951 = load ptr, ptr %37, align 8
  %952 = getelementptr inbounds %struct.SetValue, ptr %951, i32 0, i32 0
  %953 = load i32, ptr %952, align 8
  %954 = sext i32 %953 to i64
  %955 = mul i64 8, %954
  %956 = call noalias ptr @malloc(i64 noundef %955) #6
  %957 = load ptr, ptr %37, align 8
  %958 = getelementptr inbounds %struct.SetValue, ptr %957, i32 0, i32 1
  store ptr %956, ptr %958, align 8
  store i32 0, ptr %38, align 4
  br label %959

959:                                              ; preds = %987, %944
  %960 = load i32, ptr %38, align 4
  %961 = load ptr, ptr %35, align 8
  %962 = getelementptr inbounds %struct.SetValue, ptr %961, i32 0, i32 0
  %963 = load i32, ptr %962, align 8
  %964 = icmp slt i32 %960, %963
  br i1 %964, label %965, label %990

965:                                              ; preds = %959
  %966 = load ptr, ptr %35, align 8
  %967 = getelementptr inbounds %struct.SetValue, ptr %966, i32 0, i32 1
  %968 = load ptr, ptr %967, align 8
  %969 = load i32, ptr %38, align 4
  %970 = sext i32 %969 to i64
  %971 = getelementptr inbounds ptr, ptr %968, i64 %970
  %972 = load ptr, ptr %971, align 8
  %973 = load ptr, ptr %36, align 8
  %974 = getelementptr inbounds %struct.SetValue, ptr %973, i32 0, i32 1
  %975 = load ptr, ptr %974, align 8
  %976 = load i32, ptr %38, align 4
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds ptr, ptr %975, i64 %977
  %979 = load ptr, ptr %978, align 8
  %980 = call ptr @multCalcLangValues(ptr noundef %972, ptr noundef %979)
  %981 = load ptr, ptr %37, align 8
  %982 = getelementptr inbounds %struct.SetValue, ptr %981, i32 0, i32 1
  %983 = load ptr, ptr %982, align 8
  %984 = load i32, ptr %38, align 4
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds ptr, ptr %983, i64 %985
  store ptr %980, ptr %986, align 8
  br label %987

987:                                              ; preds = %965
  %988 = load i32, ptr %38, align 4
  %989 = add nsw i32 %988, 1
  store i32 %989, ptr %38, align 4
  br label %959, !llvm.loop !54

990:                                              ; preds = %959
  %991 = load ptr, ptr %6, align 8
  %992 = getelementptr inbounds %struct.CalcLangVal, ptr %991, i32 0, i32 0
  store i32 6, ptr %992, align 8
  %993 = load ptr, ptr %37, align 8
  %994 = load ptr, ptr %6, align 8
  %995 = getelementptr inbounds %struct.CalcLangVal, ptr %994, i32 0, i32 1
  store ptr %993, ptr %995, align 8
  br label %997

996:                                              ; preds = %930
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1513

997:                                              ; preds = %990
  br label %1487

998:                                              ; preds = %925, %920
  %999 = load ptr, ptr %4, align 8
  %1000 = getelementptr inbounds %struct.CalcLangVal, ptr %999, i32 0, i32 0
  %1001 = load i32, ptr %1000, align 8
  %1002 = icmp eq i32 %1001, 6
  br i1 %1002, label %1003, label %1058

1003:                                             ; preds = %998
  %1004 = load ptr, ptr %5, align 8
  %1005 = getelementptr inbounds %struct.CalcLangVal, ptr %1004, i32 0, i32 0
  %1006 = load i32, ptr %1005, align 8
  %1007 = icmp eq i32 %1006, 0
  br i1 %1007, label %1008, label %1058

1008:                                             ; preds = %1003
  %1009 = load ptr, ptr %4, align 8
  %1010 = getelementptr inbounds %struct.CalcLangVal, ptr %1009, i32 0, i32 1
  %1011 = load ptr, ptr %1010, align 8
  store ptr %1011, ptr %39, align 8
  %1012 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1012, ptr %40, align 8
  %1013 = load ptr, ptr %39, align 8
  %1014 = getelementptr inbounds %struct.SetValue, ptr %1013, i32 0, i32 0
  %1015 = load i32, ptr %1014, align 8
  %1016 = load ptr, ptr %40, align 8
  %1017 = getelementptr inbounds %struct.SetValue, ptr %1016, i32 0, i32 0
  store i32 %1015, ptr %1017, align 8
  %1018 = load ptr, ptr %40, align 8
  %1019 = getelementptr inbounds %struct.SetValue, ptr %1018, i32 0, i32 0
  %1020 = load i32, ptr %1019, align 8
  %1021 = sext i32 %1020 to i64
  %1022 = mul i64 8, %1021
  %1023 = call noalias ptr @malloc(i64 noundef %1022) #6
  %1024 = load ptr, ptr %40, align 8
  %1025 = getelementptr inbounds %struct.SetValue, ptr %1024, i32 0, i32 1
  store ptr %1023, ptr %1025, align 8
  store i32 0, ptr %41, align 4
  br label %1026

1026:                                             ; preds = %1049, %1008
  %1027 = load i32, ptr %41, align 4
  %1028 = load ptr, ptr %39, align 8
  %1029 = getelementptr inbounds %struct.SetValue, ptr %1028, i32 0, i32 0
  %1030 = load i32, ptr %1029, align 8
  %1031 = icmp slt i32 %1027, %1030
  br i1 %1031, label %1032, label %1052

1032:                                             ; preds = %1026
  %1033 = load ptr, ptr %39, align 8
  %1034 = getelementptr inbounds %struct.SetValue, ptr %1033, i32 0, i32 1
  %1035 = load ptr, ptr %1034, align 8
  %1036 = load i32, ptr %41, align 4
  %1037 = sext i32 %1036 to i64
  %1038 = getelementptr inbounds ptr, ptr %1035, i64 %1037
  %1039 = load ptr, ptr %1038, align 8
  %1040 = load ptr, ptr %5, align 8
  %1041 = call ptr @copyValue(ptr noundef %1040)
  %1042 = call ptr @multCalcLangValues(ptr noundef %1039, ptr noundef %1041)
  %1043 = load ptr, ptr %40, align 8
  %1044 = getelementptr inbounds %struct.SetValue, ptr %1043, i32 0, i32 1
  %1045 = load ptr, ptr %1044, align 8
  %1046 = load i32, ptr %41, align 4
  %1047 = sext i32 %1046 to i64
  %1048 = getelementptr inbounds ptr, ptr %1045, i64 %1047
  store ptr %1042, ptr %1048, align 8
  br label %1049

1049:                                             ; preds = %1032
  %1050 = load i32, ptr %41, align 4
  %1051 = add nsw i32 %1050, 1
  store i32 %1051, ptr %41, align 4
  br label %1026, !llvm.loop !55

1052:                                             ; preds = %1026
  %1053 = load ptr, ptr %6, align 8
  %1054 = getelementptr inbounds %struct.CalcLangVal, ptr %1053, i32 0, i32 0
  store i32 6, ptr %1054, align 8
  %1055 = load ptr, ptr %40, align 8
  %1056 = load ptr, ptr %6, align 8
  %1057 = getelementptr inbounds %struct.CalcLangVal, ptr %1056, i32 0, i32 1
  store ptr %1055, ptr %1057, align 8
  br label %1486

1058:                                             ; preds = %1003, %998
  %1059 = load ptr, ptr %4, align 8
  %1060 = getelementptr inbounds %struct.CalcLangVal, ptr %1059, i32 0, i32 0
  %1061 = load i32, ptr %1060, align 8
  %1062 = icmp eq i32 %1061, 0
  br i1 %1062, label %1063, label %1118

1063:                                             ; preds = %1058
  %1064 = load ptr, ptr %5, align 8
  %1065 = getelementptr inbounds %struct.CalcLangVal, ptr %1064, i32 0, i32 0
  %1066 = load i32, ptr %1065, align 8
  %1067 = icmp eq i32 %1066, 6
  br i1 %1067, label %1068, label %1118

1068:                                             ; preds = %1063
  %1069 = load ptr, ptr %5, align 8
  %1070 = getelementptr inbounds %struct.CalcLangVal, ptr %1069, i32 0, i32 1
  %1071 = load ptr, ptr %1070, align 8
  store ptr %1071, ptr %42, align 8
  %1072 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1072, ptr %43, align 8
  %1073 = load ptr, ptr %42, align 8
  %1074 = getelementptr inbounds %struct.SetValue, ptr %1073, i32 0, i32 0
  %1075 = load i32, ptr %1074, align 8
  %1076 = load ptr, ptr %43, align 8
  %1077 = getelementptr inbounds %struct.SetValue, ptr %1076, i32 0, i32 0
  store i32 %1075, ptr %1077, align 8
  %1078 = load ptr, ptr %43, align 8
  %1079 = getelementptr inbounds %struct.SetValue, ptr %1078, i32 0, i32 0
  %1080 = load i32, ptr %1079, align 8
  %1081 = sext i32 %1080 to i64
  %1082 = mul i64 8, %1081
  %1083 = call noalias ptr @malloc(i64 noundef %1082) #6
  %1084 = load ptr, ptr %43, align 8
  %1085 = getelementptr inbounds %struct.SetValue, ptr %1084, i32 0, i32 1
  store ptr %1083, ptr %1085, align 8
  store i32 0, ptr %44, align 4
  br label %1086

1086:                                             ; preds = %1109, %1068
  %1087 = load i32, ptr %44, align 4
  %1088 = load ptr, ptr %42, align 8
  %1089 = getelementptr inbounds %struct.SetValue, ptr %1088, i32 0, i32 0
  %1090 = load i32, ptr %1089, align 8
  %1091 = icmp slt i32 %1087, %1090
  br i1 %1091, label %1092, label %1112

1092:                                             ; preds = %1086
  %1093 = load ptr, ptr %4, align 8
  %1094 = call ptr @copyValue(ptr noundef %1093)
  %1095 = load ptr, ptr %42, align 8
  %1096 = getelementptr inbounds %struct.SetValue, ptr %1095, i32 0, i32 1
  %1097 = load ptr, ptr %1096, align 8
  %1098 = load i32, ptr %44, align 4
  %1099 = sext i32 %1098 to i64
  %1100 = getelementptr inbounds ptr, ptr %1097, i64 %1099
  %1101 = load ptr, ptr %1100, align 8
  %1102 = call ptr @multCalcLangValues(ptr noundef %1094, ptr noundef %1101)
  %1103 = load ptr, ptr %43, align 8
  %1104 = getelementptr inbounds %struct.SetValue, ptr %1103, i32 0, i32 1
  %1105 = load ptr, ptr %1104, align 8
  %1106 = load i32, ptr %44, align 4
  %1107 = sext i32 %1106 to i64
  %1108 = getelementptr inbounds ptr, ptr %1105, i64 %1107
  store ptr %1102, ptr %1108, align 8
  br label %1109

1109:                                             ; preds = %1092
  %1110 = load i32, ptr %44, align 4
  %1111 = add nsw i32 %1110, 1
  store i32 %1111, ptr %44, align 4
  br label %1086, !llvm.loop !56

1112:                                             ; preds = %1086
  %1113 = load ptr, ptr %6, align 8
  %1114 = getelementptr inbounds %struct.CalcLangVal, ptr %1113, i32 0, i32 0
  store i32 6, ptr %1114, align 8
  %1115 = load ptr, ptr %43, align 8
  %1116 = load ptr, ptr %6, align 8
  %1117 = getelementptr inbounds %struct.CalcLangVal, ptr %1116, i32 0, i32 1
  store ptr %1115, ptr %1117, align 8
  br label %1485

1118:                                             ; preds = %1063, %1058
  %1119 = load ptr, ptr %4, align 8
  %1120 = getelementptr inbounds %struct.CalcLangVal, ptr %1119, i32 0, i32 0
  %1121 = load i32, ptr %1120, align 8
  %1122 = icmp eq i32 %1121, 6
  br i1 %1122, label %1123, label %1178

1123:                                             ; preds = %1118
  %1124 = load ptr, ptr %5, align 8
  %1125 = getelementptr inbounds %struct.CalcLangVal, ptr %1124, i32 0, i32 0
  %1126 = load i32, ptr %1125, align 8
  %1127 = icmp eq i32 %1126, 1
  br i1 %1127, label %1128, label %1178

1128:                                             ; preds = %1123
  %1129 = load ptr, ptr %4, align 8
  %1130 = getelementptr inbounds %struct.CalcLangVal, ptr %1129, i32 0, i32 1
  %1131 = load ptr, ptr %1130, align 8
  store ptr %1131, ptr %45, align 8
  %1132 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1132, ptr %46, align 8
  %1133 = load ptr, ptr %45, align 8
  %1134 = getelementptr inbounds %struct.SetValue, ptr %1133, i32 0, i32 0
  %1135 = load i32, ptr %1134, align 8
  %1136 = load ptr, ptr %46, align 8
  %1137 = getelementptr inbounds %struct.SetValue, ptr %1136, i32 0, i32 0
  store i32 %1135, ptr %1137, align 8
  %1138 = load ptr, ptr %46, align 8
  %1139 = getelementptr inbounds %struct.SetValue, ptr %1138, i32 0, i32 0
  %1140 = load i32, ptr %1139, align 8
  %1141 = sext i32 %1140 to i64
  %1142 = mul i64 8, %1141
  %1143 = call noalias ptr @malloc(i64 noundef %1142) #6
  %1144 = load ptr, ptr %46, align 8
  %1145 = getelementptr inbounds %struct.SetValue, ptr %1144, i32 0, i32 1
  store ptr %1143, ptr %1145, align 8
  store i32 0, ptr %47, align 4
  br label %1146

1146:                                             ; preds = %1169, %1128
  %1147 = load i32, ptr %47, align 4
  %1148 = load ptr, ptr %45, align 8
  %1149 = getelementptr inbounds %struct.SetValue, ptr %1148, i32 0, i32 0
  %1150 = load i32, ptr %1149, align 8
  %1151 = icmp slt i32 %1147, %1150
  br i1 %1151, label %1152, label %1172

1152:                                             ; preds = %1146
  %1153 = load ptr, ptr %45, align 8
  %1154 = getelementptr inbounds %struct.SetValue, ptr %1153, i32 0, i32 1
  %1155 = load ptr, ptr %1154, align 8
  %1156 = load i32, ptr %47, align 4
  %1157 = sext i32 %1156 to i64
  %1158 = getelementptr inbounds ptr, ptr %1155, i64 %1157
  %1159 = load ptr, ptr %1158, align 8
  %1160 = load ptr, ptr %5, align 8
  %1161 = call ptr @copyValue(ptr noundef %1160)
  %1162 = call ptr @multCalcLangValues(ptr noundef %1159, ptr noundef %1161)
  %1163 = load ptr, ptr %46, align 8
  %1164 = getelementptr inbounds %struct.SetValue, ptr %1163, i32 0, i32 1
  %1165 = load ptr, ptr %1164, align 8
  %1166 = load i32, ptr %47, align 4
  %1167 = sext i32 %1166 to i64
  %1168 = getelementptr inbounds ptr, ptr %1165, i64 %1167
  store ptr %1162, ptr %1168, align 8
  br label %1169

1169:                                             ; preds = %1152
  %1170 = load i32, ptr %47, align 4
  %1171 = add nsw i32 %1170, 1
  store i32 %1171, ptr %47, align 4
  br label %1146, !llvm.loop !57

1172:                                             ; preds = %1146
  %1173 = load ptr, ptr %6, align 8
  %1174 = getelementptr inbounds %struct.CalcLangVal, ptr %1173, i32 0, i32 0
  store i32 7, ptr %1174, align 8
  %1175 = load ptr, ptr %46, align 8
  %1176 = load ptr, ptr %6, align 8
  %1177 = getelementptr inbounds %struct.CalcLangVal, ptr %1176, i32 0, i32 1
  store ptr %1175, ptr %1177, align 8
  br label %1484

1178:                                             ; preds = %1123, %1118
  %1179 = load ptr, ptr %4, align 8
  %1180 = getelementptr inbounds %struct.CalcLangVal, ptr %1179, i32 0, i32 0
  %1181 = load i32, ptr %1180, align 8
  %1182 = icmp eq i32 %1181, 1
  br i1 %1182, label %1183, label %1238

1183:                                             ; preds = %1178
  %1184 = load ptr, ptr %5, align 8
  %1185 = getelementptr inbounds %struct.CalcLangVal, ptr %1184, i32 0, i32 0
  %1186 = load i32, ptr %1185, align 8
  %1187 = icmp eq i32 %1186, 6
  br i1 %1187, label %1188, label %1238

1188:                                             ; preds = %1183
  %1189 = load ptr, ptr %5, align 8
  %1190 = getelementptr inbounds %struct.CalcLangVal, ptr %1189, i32 0, i32 1
  %1191 = load ptr, ptr %1190, align 8
  store ptr %1191, ptr %48, align 8
  %1192 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1192, ptr %49, align 8
  %1193 = load ptr, ptr %48, align 8
  %1194 = getelementptr inbounds %struct.SetValue, ptr %1193, i32 0, i32 0
  %1195 = load i32, ptr %1194, align 8
  %1196 = load ptr, ptr %49, align 8
  %1197 = getelementptr inbounds %struct.SetValue, ptr %1196, i32 0, i32 0
  store i32 %1195, ptr %1197, align 8
  %1198 = load ptr, ptr %49, align 8
  %1199 = getelementptr inbounds %struct.SetValue, ptr %1198, i32 0, i32 0
  %1200 = load i32, ptr %1199, align 8
  %1201 = sext i32 %1200 to i64
  %1202 = mul i64 8, %1201
  %1203 = call noalias ptr @malloc(i64 noundef %1202) #6
  %1204 = load ptr, ptr %49, align 8
  %1205 = getelementptr inbounds %struct.SetValue, ptr %1204, i32 0, i32 1
  store ptr %1203, ptr %1205, align 8
  store i32 0, ptr %50, align 4
  br label %1206

1206:                                             ; preds = %1229, %1188
  %1207 = load i32, ptr %50, align 4
  %1208 = load ptr, ptr %48, align 8
  %1209 = getelementptr inbounds %struct.SetValue, ptr %1208, i32 0, i32 0
  %1210 = load i32, ptr %1209, align 8
  %1211 = icmp slt i32 %1207, %1210
  br i1 %1211, label %1212, label %1232

1212:                                             ; preds = %1206
  %1213 = load ptr, ptr %4, align 8
  %1214 = call ptr @copyValue(ptr noundef %1213)
  %1215 = load ptr, ptr %48, align 8
  %1216 = getelementptr inbounds %struct.SetValue, ptr %1215, i32 0, i32 1
  %1217 = load ptr, ptr %1216, align 8
  %1218 = load i32, ptr %50, align 4
  %1219 = sext i32 %1218 to i64
  %1220 = getelementptr inbounds ptr, ptr %1217, i64 %1219
  %1221 = load ptr, ptr %1220, align 8
  %1222 = call ptr @multCalcLangValues(ptr noundef %1214, ptr noundef %1221)
  %1223 = load ptr, ptr %49, align 8
  %1224 = getelementptr inbounds %struct.SetValue, ptr %1223, i32 0, i32 1
  %1225 = load ptr, ptr %1224, align 8
  %1226 = load i32, ptr %50, align 4
  %1227 = sext i32 %1226 to i64
  %1228 = getelementptr inbounds ptr, ptr %1225, i64 %1227
  store ptr %1222, ptr %1228, align 8
  br label %1229

1229:                                             ; preds = %1212
  %1230 = load i32, ptr %50, align 4
  %1231 = add nsw i32 %1230, 1
  store i32 %1231, ptr %50, align 4
  br label %1206, !llvm.loop !58

1232:                                             ; preds = %1206
  %1233 = load ptr, ptr %6, align 8
  %1234 = getelementptr inbounds %struct.CalcLangVal, ptr %1233, i32 0, i32 0
  store i32 6, ptr %1234, align 8
  %1235 = load ptr, ptr %49, align 8
  %1236 = load ptr, ptr %6, align 8
  %1237 = getelementptr inbounds %struct.CalcLangVal, ptr %1236, i32 0, i32 1
  store ptr %1235, ptr %1237, align 8
  br label %1483

1238:                                             ; preds = %1183, %1178
  %1239 = load ptr, ptr %4, align 8
  %1240 = getelementptr inbounds %struct.CalcLangVal, ptr %1239, i32 0, i32 0
  %1241 = load i32, ptr %1240, align 8
  %1242 = icmp eq i32 %1241, 6
  br i1 %1242, label %1243, label %1298

1243:                                             ; preds = %1238
  %1244 = load ptr, ptr %5, align 8
  %1245 = getelementptr inbounds %struct.CalcLangVal, ptr %1244, i32 0, i32 0
  %1246 = load i32, ptr %1245, align 8
  %1247 = icmp eq i32 %1246, 3
  br i1 %1247, label %1248, label %1298

1248:                                             ; preds = %1243
  %1249 = load ptr, ptr %4, align 8
  %1250 = getelementptr inbounds %struct.CalcLangVal, ptr %1249, i32 0, i32 1
  %1251 = load ptr, ptr %1250, align 8
  store ptr %1251, ptr %51, align 8
  %1252 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1252, ptr %52, align 8
  %1253 = load ptr, ptr %51, align 8
  %1254 = getelementptr inbounds %struct.SetValue, ptr %1253, i32 0, i32 0
  %1255 = load i32, ptr %1254, align 8
  %1256 = load ptr, ptr %52, align 8
  %1257 = getelementptr inbounds %struct.SetValue, ptr %1256, i32 0, i32 0
  store i32 %1255, ptr %1257, align 8
  %1258 = load ptr, ptr %52, align 8
  %1259 = getelementptr inbounds %struct.SetValue, ptr %1258, i32 0, i32 0
  %1260 = load i32, ptr %1259, align 8
  %1261 = sext i32 %1260 to i64
  %1262 = mul i64 8, %1261
  %1263 = call noalias ptr @malloc(i64 noundef %1262) #6
  %1264 = load ptr, ptr %52, align 8
  %1265 = getelementptr inbounds %struct.SetValue, ptr %1264, i32 0, i32 1
  store ptr %1263, ptr %1265, align 8
  store i32 0, ptr %53, align 4
  br label %1266

1266:                                             ; preds = %1289, %1248
  %1267 = load i32, ptr %53, align 4
  %1268 = load ptr, ptr %51, align 8
  %1269 = getelementptr inbounds %struct.SetValue, ptr %1268, i32 0, i32 0
  %1270 = load i32, ptr %1269, align 8
  %1271 = icmp slt i32 %1267, %1270
  br i1 %1271, label %1272, label %1292

1272:                                             ; preds = %1266
  %1273 = load ptr, ptr %51, align 8
  %1274 = getelementptr inbounds %struct.SetValue, ptr %1273, i32 0, i32 1
  %1275 = load ptr, ptr %1274, align 8
  %1276 = load i32, ptr %53, align 4
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds ptr, ptr %1275, i64 %1277
  %1279 = load ptr, ptr %1278, align 8
  %1280 = load ptr, ptr %5, align 8
  %1281 = call ptr @copyValue(ptr noundef %1280)
  %1282 = call ptr @multCalcLangValues(ptr noundef %1279, ptr noundef %1281)
  %1283 = load ptr, ptr %52, align 8
  %1284 = getelementptr inbounds %struct.SetValue, ptr %1283, i32 0, i32 1
  %1285 = load ptr, ptr %1284, align 8
  %1286 = load i32, ptr %53, align 4
  %1287 = sext i32 %1286 to i64
  %1288 = getelementptr inbounds ptr, ptr %1285, i64 %1287
  store ptr %1282, ptr %1288, align 8
  br label %1289

1289:                                             ; preds = %1272
  %1290 = load i32, ptr %53, align 4
  %1291 = add nsw i32 %1290, 1
  store i32 %1291, ptr %53, align 4
  br label %1266, !llvm.loop !59

1292:                                             ; preds = %1266
  %1293 = load ptr, ptr %6, align 8
  %1294 = getelementptr inbounds %struct.CalcLangVal, ptr %1293, i32 0, i32 0
  store i32 6, ptr %1294, align 8
  %1295 = load ptr, ptr %52, align 8
  %1296 = load ptr, ptr %6, align 8
  %1297 = getelementptr inbounds %struct.CalcLangVal, ptr %1296, i32 0, i32 1
  store ptr %1295, ptr %1297, align 8
  br label %1482

1298:                                             ; preds = %1243, %1238
  %1299 = load ptr, ptr %4, align 8
  %1300 = getelementptr inbounds %struct.CalcLangVal, ptr %1299, i32 0, i32 0
  %1301 = load i32, ptr %1300, align 8
  %1302 = icmp eq i32 %1301, 3
  br i1 %1302, label %1303, label %1358

1303:                                             ; preds = %1298
  %1304 = load ptr, ptr %5, align 8
  %1305 = getelementptr inbounds %struct.CalcLangVal, ptr %1304, i32 0, i32 0
  %1306 = load i32, ptr %1305, align 8
  %1307 = icmp eq i32 %1306, 6
  br i1 %1307, label %1308, label %1358

1308:                                             ; preds = %1303
  %1309 = load ptr, ptr %5, align 8
  %1310 = getelementptr inbounds %struct.CalcLangVal, ptr %1309, i32 0, i32 1
  %1311 = load ptr, ptr %1310, align 8
  store ptr %1311, ptr %54, align 8
  %1312 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1312, ptr %55, align 8
  %1313 = load ptr, ptr %54, align 8
  %1314 = getelementptr inbounds %struct.SetValue, ptr %1313, i32 0, i32 0
  %1315 = load i32, ptr %1314, align 8
  %1316 = load ptr, ptr %55, align 8
  %1317 = getelementptr inbounds %struct.SetValue, ptr %1316, i32 0, i32 0
  store i32 %1315, ptr %1317, align 8
  %1318 = load ptr, ptr %55, align 8
  %1319 = getelementptr inbounds %struct.SetValue, ptr %1318, i32 0, i32 0
  %1320 = load i32, ptr %1319, align 8
  %1321 = sext i32 %1320 to i64
  %1322 = mul i64 8, %1321
  %1323 = call noalias ptr @malloc(i64 noundef %1322) #6
  %1324 = load ptr, ptr %55, align 8
  %1325 = getelementptr inbounds %struct.SetValue, ptr %1324, i32 0, i32 1
  store ptr %1323, ptr %1325, align 8
  store i32 0, ptr %56, align 4
  br label %1326

1326:                                             ; preds = %1349, %1308
  %1327 = load i32, ptr %56, align 4
  %1328 = load ptr, ptr %54, align 8
  %1329 = getelementptr inbounds %struct.SetValue, ptr %1328, i32 0, i32 0
  %1330 = load i32, ptr %1329, align 8
  %1331 = icmp slt i32 %1327, %1330
  br i1 %1331, label %1332, label %1352

1332:                                             ; preds = %1326
  %1333 = load ptr, ptr %4, align 8
  %1334 = call ptr @copyValue(ptr noundef %1333)
  %1335 = load ptr, ptr %54, align 8
  %1336 = getelementptr inbounds %struct.SetValue, ptr %1335, i32 0, i32 1
  %1337 = load ptr, ptr %1336, align 8
  %1338 = load i32, ptr %56, align 4
  %1339 = sext i32 %1338 to i64
  %1340 = getelementptr inbounds ptr, ptr %1337, i64 %1339
  %1341 = load ptr, ptr %1340, align 8
  %1342 = call ptr @multCalcLangValues(ptr noundef %1334, ptr noundef %1341)
  %1343 = load ptr, ptr %55, align 8
  %1344 = getelementptr inbounds %struct.SetValue, ptr %1343, i32 0, i32 1
  %1345 = load ptr, ptr %1344, align 8
  %1346 = load i32, ptr %56, align 4
  %1347 = sext i32 %1346 to i64
  %1348 = getelementptr inbounds ptr, ptr %1345, i64 %1347
  store ptr %1342, ptr %1348, align 8
  br label %1349

1349:                                             ; preds = %1332
  %1350 = load i32, ptr %56, align 4
  %1351 = add nsw i32 %1350, 1
  store i32 %1351, ptr %56, align 4
  br label %1326, !llvm.loop !60

1352:                                             ; preds = %1326
  %1353 = load ptr, ptr %6, align 8
  %1354 = getelementptr inbounds %struct.CalcLangVal, ptr %1353, i32 0, i32 0
  store i32 6, ptr %1354, align 8
  %1355 = load ptr, ptr %55, align 8
  %1356 = load ptr, ptr %6, align 8
  %1357 = getelementptr inbounds %struct.CalcLangVal, ptr %1356, i32 0, i32 1
  store ptr %1355, ptr %1357, align 8
  br label %1481

1358:                                             ; preds = %1303, %1298
  %1359 = load ptr, ptr %4, align 8
  %1360 = getelementptr inbounds %struct.CalcLangVal, ptr %1359, i32 0, i32 0
  %1361 = load i32, ptr %1360, align 8
  %1362 = icmp eq i32 %1361, 6
  br i1 %1362, label %1363, label %1418

1363:                                             ; preds = %1358
  %1364 = load ptr, ptr %5, align 8
  %1365 = getelementptr inbounds %struct.CalcLangVal, ptr %1364, i32 0, i32 0
  %1366 = load i32, ptr %1365, align 8
  %1367 = icmp eq i32 %1366, 4
  br i1 %1367, label %1368, label %1418

1368:                                             ; preds = %1363
  %1369 = load ptr, ptr %4, align 8
  %1370 = getelementptr inbounds %struct.CalcLangVal, ptr %1369, i32 0, i32 1
  %1371 = load ptr, ptr %1370, align 8
  store ptr %1371, ptr %57, align 8
  %1372 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1372, ptr %58, align 8
  %1373 = load ptr, ptr %57, align 8
  %1374 = getelementptr inbounds %struct.SetValue, ptr %1373, i32 0, i32 0
  %1375 = load i32, ptr %1374, align 8
  %1376 = load ptr, ptr %58, align 8
  %1377 = getelementptr inbounds %struct.SetValue, ptr %1376, i32 0, i32 0
  store i32 %1375, ptr %1377, align 8
  %1378 = load ptr, ptr %58, align 8
  %1379 = getelementptr inbounds %struct.SetValue, ptr %1378, i32 0, i32 0
  %1380 = load i32, ptr %1379, align 8
  %1381 = sext i32 %1380 to i64
  %1382 = mul i64 8, %1381
  %1383 = call noalias ptr @malloc(i64 noundef %1382) #6
  %1384 = load ptr, ptr %58, align 8
  %1385 = getelementptr inbounds %struct.SetValue, ptr %1384, i32 0, i32 1
  store ptr %1383, ptr %1385, align 8
  store i32 0, ptr %59, align 4
  br label %1386

1386:                                             ; preds = %1409, %1368
  %1387 = load i32, ptr %59, align 4
  %1388 = load ptr, ptr %57, align 8
  %1389 = getelementptr inbounds %struct.SetValue, ptr %1388, i32 0, i32 0
  %1390 = load i32, ptr %1389, align 8
  %1391 = icmp slt i32 %1387, %1390
  br i1 %1391, label %1392, label %1412

1392:                                             ; preds = %1386
  %1393 = load ptr, ptr %57, align 8
  %1394 = getelementptr inbounds %struct.SetValue, ptr %1393, i32 0, i32 1
  %1395 = load ptr, ptr %1394, align 8
  %1396 = load i32, ptr %59, align 4
  %1397 = sext i32 %1396 to i64
  %1398 = getelementptr inbounds ptr, ptr %1395, i64 %1397
  %1399 = load ptr, ptr %1398, align 8
  %1400 = load ptr, ptr %5, align 8
  %1401 = call ptr @copyValue(ptr noundef %1400)
  %1402 = call ptr @multCalcLangValues(ptr noundef %1399, ptr noundef %1401)
  %1403 = load ptr, ptr %58, align 8
  %1404 = getelementptr inbounds %struct.SetValue, ptr %1403, i32 0, i32 1
  %1405 = load ptr, ptr %1404, align 8
  %1406 = load i32, ptr %59, align 4
  %1407 = sext i32 %1406 to i64
  %1408 = getelementptr inbounds ptr, ptr %1405, i64 %1407
  store ptr %1402, ptr %1408, align 8
  br label %1409

1409:                                             ; preds = %1392
  %1410 = load i32, ptr %59, align 4
  %1411 = add nsw i32 %1410, 1
  store i32 %1411, ptr %59, align 4
  br label %1386, !llvm.loop !61

1412:                                             ; preds = %1386
  %1413 = load ptr, ptr %6, align 8
  %1414 = getelementptr inbounds %struct.CalcLangVal, ptr %1413, i32 0, i32 0
  store i32 6, ptr %1414, align 8
  %1415 = load ptr, ptr %58, align 8
  %1416 = load ptr, ptr %6, align 8
  %1417 = getelementptr inbounds %struct.CalcLangVal, ptr %1416, i32 0, i32 1
  store ptr %1415, ptr %1417, align 8
  br label %1480

1418:                                             ; preds = %1363, %1358
  %1419 = load ptr, ptr %4, align 8
  %1420 = getelementptr inbounds %struct.CalcLangVal, ptr %1419, i32 0, i32 0
  %1421 = load i32, ptr %1420, align 8
  %1422 = icmp eq i32 %1421, 4
  br i1 %1422, label %1423, label %1478

1423:                                             ; preds = %1418
  %1424 = load ptr, ptr %5, align 8
  %1425 = getelementptr inbounds %struct.CalcLangVal, ptr %1424, i32 0, i32 0
  %1426 = load i32, ptr %1425, align 8
  %1427 = icmp eq i32 %1426, 6
  br i1 %1427, label %1428, label %1478

1428:                                             ; preds = %1423
  %1429 = load ptr, ptr %5, align 8
  %1430 = getelementptr inbounds %struct.CalcLangVal, ptr %1429, i32 0, i32 1
  %1431 = load ptr, ptr %1430, align 8
  store ptr %1431, ptr %60, align 8
  %1432 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1432, ptr %61, align 8
  %1433 = load ptr, ptr %60, align 8
  %1434 = getelementptr inbounds %struct.SetValue, ptr %1433, i32 0, i32 0
  %1435 = load i32, ptr %1434, align 8
  %1436 = load ptr, ptr %61, align 8
  %1437 = getelementptr inbounds %struct.SetValue, ptr %1436, i32 0, i32 0
  store i32 %1435, ptr %1437, align 8
  %1438 = load ptr, ptr %61, align 8
  %1439 = getelementptr inbounds %struct.SetValue, ptr %1438, i32 0, i32 0
  %1440 = load i32, ptr %1439, align 8
  %1441 = sext i32 %1440 to i64
  %1442 = mul i64 8, %1441
  %1443 = call noalias ptr @malloc(i64 noundef %1442) #6
  %1444 = load ptr, ptr %61, align 8
  %1445 = getelementptr inbounds %struct.SetValue, ptr %1444, i32 0, i32 1
  store ptr %1443, ptr %1445, align 8
  store i32 0, ptr %62, align 4
  br label %1446

1446:                                             ; preds = %1469, %1428
  %1447 = load i32, ptr %62, align 4
  %1448 = load ptr, ptr %60, align 8
  %1449 = getelementptr inbounds %struct.SetValue, ptr %1448, i32 0, i32 0
  %1450 = load i32, ptr %1449, align 8
  %1451 = icmp slt i32 %1447, %1450
  br i1 %1451, label %1452, label %1472

1452:                                             ; preds = %1446
  %1453 = load ptr, ptr %4, align 8
  %1454 = call ptr @copyValue(ptr noundef %1453)
  %1455 = load ptr, ptr %60, align 8
  %1456 = getelementptr inbounds %struct.SetValue, ptr %1455, i32 0, i32 1
  %1457 = load ptr, ptr %1456, align 8
  %1458 = load i32, ptr %62, align 4
  %1459 = sext i32 %1458 to i64
  %1460 = getelementptr inbounds ptr, ptr %1457, i64 %1459
  %1461 = load ptr, ptr %1460, align 8
  %1462 = call ptr @multCalcLangValues(ptr noundef %1454, ptr noundef %1461)
  %1463 = load ptr, ptr %61, align 8
  %1464 = getelementptr inbounds %struct.SetValue, ptr %1463, i32 0, i32 1
  %1465 = load ptr, ptr %1464, align 8
  %1466 = load i32, ptr %62, align 4
  %1467 = sext i32 %1466 to i64
  %1468 = getelementptr inbounds ptr, ptr %1465, i64 %1467
  store ptr %1462, ptr %1468, align 8
  br label %1469

1469:                                             ; preds = %1452
  %1470 = load i32, ptr %62, align 4
  %1471 = add nsw i32 %1470, 1
  store i32 %1471, ptr %62, align 4
  br label %1446, !llvm.loop !62

1472:                                             ; preds = %1446
  %1473 = load ptr, ptr %6, align 8
  %1474 = getelementptr inbounds %struct.CalcLangVal, ptr %1473, i32 0, i32 0
  store i32 6, ptr %1474, align 8
  %1475 = load ptr, ptr %61, align 8
  %1476 = load ptr, ptr %6, align 8
  %1477 = getelementptr inbounds %struct.CalcLangVal, ptr %1476, i32 0, i32 1
  store ptr %1475, ptr %1477, align 8
  br label %1479

1478:                                             ; preds = %1423, %1418
  call void @perror(ptr noundef @.str.3) #7
  br label %1479

1479:                                             ; preds = %1478, %1472
  br label %1480

1480:                                             ; preds = %1479, %1412
  br label %1481

1481:                                             ; preds = %1480, %1352
  br label %1482

1482:                                             ; preds = %1481, %1292
  br label %1483

1483:                                             ; preds = %1482, %1232
  br label %1484

1484:                                             ; preds = %1483, %1172
  br label %1485

1485:                                             ; preds = %1484, %1112
  br label %1486

1486:                                             ; preds = %1485, %1052
  br label %1487

1487:                                             ; preds = %1486, %997
  br label %1488

1488:                                             ; preds = %1487, %914
  br label %1489

1489:                                             ; preds = %1488, %854
  br label %1490

1490:                                             ; preds = %1489, %794
  br label %1491

1491:                                             ; preds = %1490, %734
  br label %1492

1492:                                             ; preds = %1491, %674
  br label %1493

1493:                                             ; preds = %1492, %614
  br label %1494

1494:                                             ; preds = %1493, %554
  br label %1495

1495:                                             ; preds = %1494, %494
  br label %1496

1496:                                             ; preds = %1495, %439
  br label %1497

1497:                                             ; preds = %1496, %350
  br label %1498

1498:                                             ; preds = %1497, %328
  br label %1499

1499:                                             ; preds = %1498, %306
  br label %1500

1500:                                             ; preds = %1499, %283
  br label %1501

1501:                                             ; preds = %1500, %260
  br label %1502

1502:                                             ; preds = %1501, %238
  br label %1503

1503:                                             ; preds = %1502, %216
  br label %1504

1504:                                             ; preds = %1503, %193
  br label %1505

1505:                                             ; preds = %1504, %170
  br label %1506

1506:                                             ; preds = %1505, %147
  br label %1507

1507:                                             ; preds = %1506, %124
  br label %1508

1508:                                             ; preds = %1507, %102
  br label %1509

1509:                                             ; preds = %1508, %80
  %1510 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %1510)
  %1511 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %1511)
  %1512 = load ptr, ptr %6, align 8
  store ptr %1512, ptr %3, align 8
  br label %1513

1513:                                             ; preds = %1509, %996, %438, %68
  %1514 = load ptr, ptr %3, align 8
  ret ptr %1514
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @divCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %2
  %66 = load ptr, ptr %5, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %69

68:                                               ; preds = %65, %2
  store ptr null, ptr %3, align 8
  br label %1491

69:                                               ; preds = %65
  %70 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %70, ptr %6, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %94

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %94

80:                                               ; preds = %75
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 0
  store i32 1, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = sitofp i32 %85 to double
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = sitofp i32 %89 to double
  %91 = fdiv double %86, %90
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 1
  store double %91, ptr %93, align 8
  br label %1487

94:                                               ; preds = %75, %69
  %95 = load ptr, ptr %4, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %116

99:                                               ; preds = %94
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  %102 = load i32, ptr %101, align 8
  %103 = icmp eq i32 %102, 1
  br i1 %103, label %104, label %116

104:                                              ; preds = %99
  %105 = load ptr, ptr %6, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 0
  store i32 1, ptr %106, align 8
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = load double, ptr %108, align 8
  %110 = load ptr, ptr %5, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = load double, ptr %111, align 8
  %113 = fdiv double %109, %112
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 1
  store double %113, ptr %115, align 8
  br label %1486

116:                                              ; preds = %99, %94
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %121, label %139

121:                                              ; preds = %116
  %122 = load ptr, ptr %5, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  %124 = load i32, ptr %123, align 8
  %125 = icmp eq i32 %124, 1
  br i1 %125, label %126, label %139

126:                                              ; preds = %121
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 0
  store i32 1, ptr %128, align 8
  %129 = load ptr, ptr %4, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = load i32, ptr %130, align 8
  %132 = sitofp i32 %131 to double
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 1
  %135 = load double, ptr %134, align 8
  %136 = fdiv double %132, %135
  %137 = load ptr, ptr %6, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 1
  store double %136, ptr %138, align 8
  br label %1485

139:                                              ; preds = %121, %116
  %140 = load ptr, ptr %4, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 1
  br i1 %143, label %144, label %162

144:                                              ; preds = %139
  %145 = load ptr, ptr %5, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  %147 = load i32, ptr %146, align 8
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %149, label %162

149:                                              ; preds = %144
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 0
  store i32 1, ptr %151, align 8
  %152 = load ptr, ptr %4, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 1
  %154 = load double, ptr %153, align 8
  %155 = load ptr, ptr %5, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  %157 = load i32, ptr %156, align 8
  %158 = sitofp i32 %157 to double
  %159 = fdiv double %154, %158
  %160 = load ptr, ptr %6, align 8
  %161 = getelementptr inbounds %struct.CalcLangVal, ptr %160, i32 0, i32 1
  store double %159, ptr %161, align 8
  br label %1484

162:                                              ; preds = %144, %139
  %163 = load ptr, ptr %4, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 0
  %165 = load i32, ptr %164, align 8
  %166 = icmp eq i32 %165, 3
  br i1 %166, label %167, label %185

167:                                              ; preds = %162
  %168 = load ptr, ptr %5, align 8
  %169 = getelementptr inbounds %struct.CalcLangVal, ptr %168, i32 0, i32 0
  %170 = load i32, ptr %169, align 8
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %185

172:                                              ; preds = %167
  %173 = load ptr, ptr %6, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 0
  store i32 3, ptr %174, align 8
  %175 = load ptr, ptr %4, align 8
  %176 = getelementptr inbounds %struct.CalcLangVal, ptr %175, i32 0, i32 1
  %177 = load double, ptr %176, align 8
  %178 = load ptr, ptr %5, align 8
  %179 = getelementptr inbounds %struct.CalcLangVal, ptr %178, i32 0, i32 1
  %180 = load i32, ptr %179, align 8
  %181 = sitofp i32 %180 to double
  %182 = fdiv double %177, %181
  %183 = load ptr, ptr %6, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 1
  store double %182, ptr %184, align 8
  br label %1483

185:                                              ; preds = %167, %162
  %186 = load ptr, ptr %4, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = icmp eq i32 %188, 3
  br i1 %189, label %190, label %207

190:                                              ; preds = %185
  %191 = load ptr, ptr %5, align 8
  %192 = getelementptr inbounds %struct.CalcLangVal, ptr %191, i32 0, i32 0
  %193 = load i32, ptr %192, align 8
  %194 = icmp eq i32 %193, 3
  br i1 %194, label %195, label %207

195:                                              ; preds = %190
  %196 = load ptr, ptr %6, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 0
  store i32 1, ptr %197, align 8
  %198 = load ptr, ptr %4, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 1
  %200 = load double, ptr %199, align 8
  %201 = load ptr, ptr %5, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 1
  %203 = load double, ptr %202, align 8
  %204 = fdiv double %200, %203
  %205 = load ptr, ptr %6, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 1
  store double %204, ptr %206, align 8
  br label %1482

207:                                              ; preds = %190, %185
  %208 = load ptr, ptr %4, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 0
  %210 = load i32, ptr %209, align 8
  %211 = icmp eq i32 %210, 3
  br i1 %211, label %212, label %229

212:                                              ; preds = %207
  %213 = load ptr, ptr %5, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 0
  %215 = load i32, ptr %214, align 8
  %216 = icmp eq i32 %215, 1
  br i1 %216, label %217, label %229

217:                                              ; preds = %212
  %218 = load ptr, ptr %6, align 8
  %219 = getelementptr inbounds %struct.CalcLangVal, ptr %218, i32 0, i32 0
  store i32 3, ptr %219, align 8
  %220 = load ptr, ptr %4, align 8
  %221 = getelementptr inbounds %struct.CalcLangVal, ptr %220, i32 0, i32 1
  %222 = load double, ptr %221, align 8
  %223 = load ptr, ptr %5, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 1
  %225 = load double, ptr %224, align 8
  %226 = fdiv double %222, %225
  %227 = load ptr, ptr %6, align 8
  %228 = getelementptr inbounds %struct.CalcLangVal, ptr %227, i32 0, i32 1
  store double %226, ptr %228, align 8
  br label %1481

229:                                              ; preds = %212, %207
  %230 = load ptr, ptr %4, align 8
  %231 = getelementptr inbounds %struct.CalcLangVal, ptr %230, i32 0, i32 0
  %232 = load i32, ptr %231, align 8
  %233 = icmp eq i32 %232, 4
  br i1 %233, label %234, label %252

234:                                              ; preds = %229
  %235 = load ptr, ptr %5, align 8
  %236 = getelementptr inbounds %struct.CalcLangVal, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %236, align 8
  %238 = icmp eq i32 %237, 0
  br i1 %238, label %239, label %252

239:                                              ; preds = %234
  %240 = load ptr, ptr %6, align 8
  %241 = getelementptr inbounds %struct.CalcLangVal, ptr %240, i32 0, i32 0
  store i32 4, ptr %241, align 8
  %242 = load ptr, ptr %4, align 8
  %243 = getelementptr inbounds %struct.CalcLangVal, ptr %242, i32 0, i32 1
  %244 = load double, ptr %243, align 8
  %245 = load ptr, ptr %5, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 1
  %247 = load i32, ptr %246, align 8
  %248 = sitofp i32 %247 to double
  %249 = fdiv double %244, %248
  %250 = load ptr, ptr %6, align 8
  %251 = getelementptr inbounds %struct.CalcLangVal, ptr %250, i32 0, i32 1
  store double %249, ptr %251, align 8
  br label %1480

252:                                              ; preds = %234, %229
  %253 = load ptr, ptr %4, align 8
  %254 = getelementptr inbounds %struct.CalcLangVal, ptr %253, i32 0, i32 0
  %255 = load i32, ptr %254, align 8
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %257, label %275

257:                                              ; preds = %252
  %258 = load ptr, ptr %5, align 8
  %259 = getelementptr inbounds %struct.CalcLangVal, ptr %258, i32 0, i32 0
  %260 = load i32, ptr %259, align 8
  %261 = icmp eq i32 %260, 4
  br i1 %261, label %262, label %275

262:                                              ; preds = %257
  %263 = load ptr, ptr %6, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 0
  store i32 4, ptr %264, align 8
  %265 = load ptr, ptr %4, align 8
  %266 = getelementptr inbounds %struct.CalcLangVal, ptr %265, i32 0, i32 1
  %267 = load i32, ptr %266, align 8
  %268 = sitofp i32 %267 to double
  %269 = load ptr, ptr %5, align 8
  %270 = getelementptr inbounds %struct.CalcLangVal, ptr %269, i32 0, i32 1
  %271 = load double, ptr %270, align 8
  %272 = fdiv double %268, %271
  %273 = load ptr, ptr %6, align 8
  %274 = getelementptr inbounds %struct.CalcLangVal, ptr %273, i32 0, i32 1
  store double %272, ptr %274, align 8
  br label %1479

275:                                              ; preds = %257, %252
  %276 = load ptr, ptr %4, align 8
  %277 = getelementptr inbounds %struct.CalcLangVal, ptr %276, i32 0, i32 0
  %278 = load i32, ptr %277, align 8
  %279 = icmp eq i32 %278, 1
  br i1 %279, label %280, label %297

280:                                              ; preds = %275
  %281 = load ptr, ptr %5, align 8
  %282 = getelementptr inbounds %struct.CalcLangVal, ptr %281, i32 0, i32 0
  %283 = load i32, ptr %282, align 8
  %284 = icmp eq i32 %283, 4
  br i1 %284, label %285, label %297

285:                                              ; preds = %280
  %286 = load ptr, ptr %6, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 0
  store i32 4, ptr %287, align 8
  %288 = load ptr, ptr %4, align 8
  %289 = getelementptr inbounds %struct.CalcLangVal, ptr %288, i32 0, i32 1
  %290 = load double, ptr %289, align 8
  %291 = load ptr, ptr %5, align 8
  %292 = getelementptr inbounds %struct.CalcLangVal, ptr %291, i32 0, i32 1
  %293 = load double, ptr %292, align 8
  %294 = fdiv double %290, %293
  %295 = load ptr, ptr %6, align 8
  %296 = getelementptr inbounds %struct.CalcLangVal, ptr %295, i32 0, i32 1
  store double %294, ptr %296, align 8
  br label %1478

297:                                              ; preds = %280, %275
  %298 = load ptr, ptr %4, align 8
  %299 = getelementptr inbounds %struct.CalcLangVal, ptr %298, i32 0, i32 0
  %300 = load i32, ptr %299, align 8
  %301 = icmp eq i32 %300, 4
  br i1 %301, label %302, label %319

302:                                              ; preds = %297
  %303 = load ptr, ptr %5, align 8
  %304 = getelementptr inbounds %struct.CalcLangVal, ptr %303, i32 0, i32 0
  %305 = load i32, ptr %304, align 8
  %306 = icmp eq i32 %305, 1
  br i1 %306, label %307, label %319

307:                                              ; preds = %302
  %308 = load ptr, ptr %6, align 8
  %309 = getelementptr inbounds %struct.CalcLangVal, ptr %308, i32 0, i32 0
  store i32 4, ptr %309, align 8
  %310 = load ptr, ptr %4, align 8
  %311 = getelementptr inbounds %struct.CalcLangVal, ptr %310, i32 0, i32 1
  %312 = load double, ptr %311, align 8
  %313 = load ptr, ptr %5, align 8
  %314 = getelementptr inbounds %struct.CalcLangVal, ptr %313, i32 0, i32 1
  %315 = load double, ptr %314, align 8
  %316 = fdiv double %312, %315
  %317 = load ptr, ptr %6, align 8
  %318 = getelementptr inbounds %struct.CalcLangVal, ptr %317, i32 0, i32 1
  store double %316, ptr %318, align 8
  br label %1477

319:                                              ; preds = %302, %297
  %320 = load ptr, ptr %4, align 8
  %321 = getelementptr inbounds %struct.CalcLangVal, ptr %320, i32 0, i32 0
  %322 = load i32, ptr %321, align 8
  %323 = icmp eq i32 %322, 4
  br i1 %323, label %324, label %341

324:                                              ; preds = %319
  %325 = load ptr, ptr %5, align 8
  %326 = getelementptr inbounds %struct.CalcLangVal, ptr %325, i32 0, i32 0
  %327 = load i32, ptr %326, align 8
  %328 = icmp eq i32 %327, 4
  br i1 %328, label %329, label %341

329:                                              ; preds = %324
  %330 = load ptr, ptr %6, align 8
  %331 = getelementptr inbounds %struct.CalcLangVal, ptr %330, i32 0, i32 0
  store i32 4, ptr %331, align 8
  %332 = load ptr, ptr %4, align 8
  %333 = getelementptr inbounds %struct.CalcLangVal, ptr %332, i32 0, i32 1
  %334 = load double, ptr %333, align 8
  %335 = load ptr, ptr %5, align 8
  %336 = getelementptr inbounds %struct.CalcLangVal, ptr %335, i32 0, i32 1
  %337 = load double, ptr %336, align 8
  %338 = fdiv double %334, %337
  %339 = load ptr, ptr %6, align 8
  %340 = getelementptr inbounds %struct.CalcLangVal, ptr %339, i32 0, i32 1
  store double %338, ptr %340, align 8
  br label %1476

341:                                              ; preds = %324, %319
  %342 = load ptr, ptr %4, align 8
  %343 = getelementptr inbounds %struct.CalcLangVal, ptr %342, i32 0, i32 0
  %344 = load i32, ptr %343, align 8
  %345 = icmp eq i32 %344, 7
  br i1 %345, label %346, label %419

346:                                              ; preds = %341
  %347 = load ptr, ptr %5, align 8
  %348 = getelementptr inbounds %struct.CalcLangVal, ptr %347, i32 0, i32 0
  %349 = load i32, ptr %348, align 8
  %350 = icmp eq i32 %349, 7
  br i1 %350, label %351, label %419

351:                                              ; preds = %346
  %352 = load ptr, ptr %4, align 8
  %353 = getelementptr inbounds %struct.CalcLangVal, ptr %352, i32 0, i32 1
  %354 = load ptr, ptr %353, align 8
  store ptr %354, ptr %7, align 8
  %355 = load ptr, ptr %5, align 8
  %356 = getelementptr inbounds %struct.CalcLangVal, ptr %355, i32 0, i32 1
  %357 = load ptr, ptr %356, align 8
  store ptr %357, ptr %8, align 8
  %358 = load ptr, ptr %8, align 8
  %359 = getelementptr inbounds %struct.TupleValue, ptr %358, i32 0, i32 0
  %360 = load i32, ptr %359, align 8
  %361 = load ptr, ptr %7, align 8
  %362 = getelementptr inbounds %struct.TupleValue, ptr %361, i32 0, i32 0
  %363 = load i32, ptr %362, align 8
  %364 = icmp eq i32 %360, %363
  br i1 %364, label %365, label %417

365:                                              ; preds = %351
  %366 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %366, ptr %9, align 8
  %367 = load ptr, ptr %7, align 8
  %368 = getelementptr inbounds %struct.TupleValue, ptr %367, i32 0, i32 0
  %369 = load i32, ptr %368, align 8
  %370 = load ptr, ptr %9, align 8
  %371 = getelementptr inbounds %struct.TupleValue, ptr %370, i32 0, i32 0
  store i32 %369, ptr %371, align 8
  %372 = load ptr, ptr %9, align 8
  %373 = getelementptr inbounds %struct.TupleValue, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = sext i32 %374 to i64
  %376 = mul i64 8, %375
  %377 = call noalias ptr @malloc(i64 noundef %376) #6
  %378 = load ptr, ptr %9, align 8
  %379 = getelementptr inbounds %struct.TupleValue, ptr %378, i32 0, i32 1
  store ptr %377, ptr %379, align 8
  store i32 0, ptr %10, align 4
  br label %380

380:                                              ; preds = %408, %365
  %381 = load i32, ptr %10, align 4
  %382 = load ptr, ptr %7, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 0
  %384 = load i32, ptr %383, align 8
  %385 = icmp slt i32 %381, %384
  br i1 %385, label %386, label %411

386:                                              ; preds = %380
  %387 = load ptr, ptr %7, align 8
  %388 = getelementptr inbounds %struct.TupleValue, ptr %387, i32 0, i32 1
  %389 = load ptr, ptr %388, align 8
  %390 = load i32, ptr %10, align 4
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds ptr, ptr %389, i64 %391
  %393 = load ptr, ptr %392, align 8
  %394 = load ptr, ptr %8, align 8
  %395 = getelementptr inbounds %struct.TupleValue, ptr %394, i32 0, i32 1
  %396 = load ptr, ptr %395, align 8
  %397 = load i32, ptr %10, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds ptr, ptr %396, i64 %398
  %400 = load ptr, ptr %399, align 8
  %401 = call ptr @divCalcLangValues(ptr noundef %393, ptr noundef %400)
  %402 = load ptr, ptr %9, align 8
  %403 = getelementptr inbounds %struct.TupleValue, ptr %402, i32 0, i32 1
  %404 = load ptr, ptr %403, align 8
  %405 = load i32, ptr %10, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds ptr, ptr %404, i64 %406
  store ptr %401, ptr %407, align 8
  br label %408

408:                                              ; preds = %386
  %409 = load i32, ptr %10, align 4
  %410 = add nsw i32 %409, 1
  store i32 %410, ptr %10, align 4
  br label %380, !llvm.loop !63

411:                                              ; preds = %380
  %412 = load ptr, ptr %6, align 8
  %413 = getelementptr inbounds %struct.CalcLangVal, ptr %412, i32 0, i32 0
  store i32 7, ptr %413, align 8
  %414 = load ptr, ptr %9, align 8
  %415 = load ptr, ptr %6, align 8
  %416 = getelementptr inbounds %struct.CalcLangVal, ptr %415, i32 0, i32 1
  store ptr %414, ptr %416, align 8
  br label %418

417:                                              ; preds = %351
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1491

418:                                              ; preds = %411
  br label %1475

419:                                              ; preds = %346, %341
  %420 = load ptr, ptr %4, align 8
  %421 = getelementptr inbounds %struct.CalcLangVal, ptr %420, i32 0, i32 0
  %422 = load i32, ptr %421, align 8
  %423 = icmp eq i32 %422, 7
  br i1 %423, label %424, label %479

424:                                              ; preds = %419
  %425 = load ptr, ptr %5, align 8
  %426 = getelementptr inbounds %struct.CalcLangVal, ptr %425, i32 0, i32 0
  %427 = load i32, ptr %426, align 8
  %428 = icmp eq i32 %427, 0
  br i1 %428, label %429, label %479

429:                                              ; preds = %424
  %430 = load ptr, ptr %4, align 8
  %431 = getelementptr inbounds %struct.CalcLangVal, ptr %430, i32 0, i32 1
  %432 = load ptr, ptr %431, align 8
  store ptr %432, ptr %11, align 8
  %433 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %433, ptr %12, align 8
  %434 = load ptr, ptr %11, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  %436 = load i32, ptr %435, align 8
  %437 = load ptr, ptr %12, align 8
  %438 = getelementptr inbounds %struct.TupleValue, ptr %437, i32 0, i32 0
  store i32 %436, ptr %438, align 8
  %439 = load ptr, ptr %12, align 8
  %440 = getelementptr inbounds %struct.TupleValue, ptr %439, i32 0, i32 0
  %441 = load i32, ptr %440, align 8
  %442 = sext i32 %441 to i64
  %443 = mul i64 8, %442
  %444 = call noalias ptr @malloc(i64 noundef %443) #6
  %445 = load ptr, ptr %12, align 8
  %446 = getelementptr inbounds %struct.TupleValue, ptr %445, i32 0, i32 1
  store ptr %444, ptr %446, align 8
  store i32 0, ptr %13, align 4
  br label %447

447:                                              ; preds = %470, %429
  %448 = load i32, ptr %13, align 4
  %449 = load ptr, ptr %11, align 8
  %450 = getelementptr inbounds %struct.TupleValue, ptr %449, i32 0, i32 0
  %451 = load i32, ptr %450, align 8
  %452 = icmp slt i32 %448, %451
  br i1 %452, label %453, label %473

453:                                              ; preds = %447
  %454 = load ptr, ptr %11, align 8
  %455 = getelementptr inbounds %struct.TupleValue, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = load i32, ptr %13, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds ptr, ptr %456, i64 %458
  %460 = load ptr, ptr %459, align 8
  %461 = load ptr, ptr %5, align 8
  %462 = call ptr @copyValue(ptr noundef %461)
  %463 = call ptr @divCalcLangValues(ptr noundef %460, ptr noundef %462)
  %464 = load ptr, ptr %12, align 8
  %465 = getelementptr inbounds %struct.TupleValue, ptr %464, i32 0, i32 1
  %466 = load ptr, ptr %465, align 8
  %467 = load i32, ptr %13, align 4
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds ptr, ptr %466, i64 %468
  store ptr %463, ptr %469, align 8
  br label %470

470:                                              ; preds = %453
  %471 = load i32, ptr %13, align 4
  %472 = add nsw i32 %471, 1
  store i32 %472, ptr %13, align 4
  br label %447, !llvm.loop !64

473:                                              ; preds = %447
  %474 = load ptr, ptr %6, align 8
  %475 = getelementptr inbounds %struct.CalcLangVal, ptr %474, i32 0, i32 0
  store i32 7, ptr %475, align 8
  %476 = load ptr, ptr %12, align 8
  %477 = load ptr, ptr %6, align 8
  %478 = getelementptr inbounds %struct.CalcLangVal, ptr %477, i32 0, i32 1
  store ptr %476, ptr %478, align 8
  br label %1474

479:                                              ; preds = %424, %419
  %480 = load ptr, ptr %4, align 8
  %481 = getelementptr inbounds %struct.CalcLangVal, ptr %480, i32 0, i32 0
  %482 = load i32, ptr %481, align 8
  %483 = icmp eq i32 %482, 0
  br i1 %483, label %484, label %539

484:                                              ; preds = %479
  %485 = load ptr, ptr %5, align 8
  %486 = getelementptr inbounds %struct.CalcLangVal, ptr %485, i32 0, i32 0
  %487 = load i32, ptr %486, align 8
  %488 = icmp eq i32 %487, 7
  br i1 %488, label %489, label %539

489:                                              ; preds = %484
  %490 = load ptr, ptr %5, align 8
  %491 = getelementptr inbounds %struct.CalcLangVal, ptr %490, i32 0, i32 1
  %492 = load ptr, ptr %491, align 8
  store ptr %492, ptr %14, align 8
  %493 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %493, ptr %15, align 8
  %494 = load ptr, ptr %14, align 8
  %495 = getelementptr inbounds %struct.TupleValue, ptr %494, i32 0, i32 0
  %496 = load i32, ptr %495, align 8
  %497 = load ptr, ptr %15, align 8
  %498 = getelementptr inbounds %struct.TupleValue, ptr %497, i32 0, i32 0
  store i32 %496, ptr %498, align 8
  %499 = load ptr, ptr %15, align 8
  %500 = getelementptr inbounds %struct.TupleValue, ptr %499, i32 0, i32 0
  %501 = load i32, ptr %500, align 8
  %502 = sext i32 %501 to i64
  %503 = mul i64 8, %502
  %504 = call noalias ptr @malloc(i64 noundef %503) #6
  %505 = load ptr, ptr %15, align 8
  %506 = getelementptr inbounds %struct.TupleValue, ptr %505, i32 0, i32 1
  store ptr %504, ptr %506, align 8
  store i32 0, ptr %16, align 4
  br label %507

507:                                              ; preds = %530, %489
  %508 = load i32, ptr %16, align 4
  %509 = load ptr, ptr %14, align 8
  %510 = getelementptr inbounds %struct.TupleValue, ptr %509, i32 0, i32 0
  %511 = load i32, ptr %510, align 8
  %512 = icmp slt i32 %508, %511
  br i1 %512, label %513, label %533

513:                                              ; preds = %507
  %514 = load ptr, ptr %4, align 8
  %515 = call ptr @copyValue(ptr noundef %514)
  %516 = load ptr, ptr %14, align 8
  %517 = getelementptr inbounds %struct.TupleValue, ptr %516, i32 0, i32 1
  %518 = load ptr, ptr %517, align 8
  %519 = load i32, ptr %16, align 4
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds ptr, ptr %518, i64 %520
  %522 = load ptr, ptr %521, align 8
  %523 = call ptr @divCalcLangValues(ptr noundef %515, ptr noundef %522)
  %524 = load ptr, ptr %15, align 8
  %525 = getelementptr inbounds %struct.TupleValue, ptr %524, i32 0, i32 1
  %526 = load ptr, ptr %525, align 8
  %527 = load i32, ptr %16, align 4
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds ptr, ptr %526, i64 %528
  store ptr %523, ptr %529, align 8
  br label %530

530:                                              ; preds = %513
  %531 = load i32, ptr %16, align 4
  %532 = add nsw i32 %531, 1
  store i32 %532, ptr %16, align 4
  br label %507, !llvm.loop !65

533:                                              ; preds = %507
  %534 = load ptr, ptr %6, align 8
  %535 = getelementptr inbounds %struct.CalcLangVal, ptr %534, i32 0, i32 0
  store i32 7, ptr %535, align 8
  %536 = load ptr, ptr %15, align 8
  %537 = load ptr, ptr %6, align 8
  %538 = getelementptr inbounds %struct.CalcLangVal, ptr %537, i32 0, i32 1
  store ptr %536, ptr %538, align 8
  br label %1473

539:                                              ; preds = %484, %479
  %540 = load ptr, ptr %4, align 8
  %541 = getelementptr inbounds %struct.CalcLangVal, ptr %540, i32 0, i32 0
  %542 = load i32, ptr %541, align 8
  %543 = icmp eq i32 %542, 7
  br i1 %543, label %544, label %599

544:                                              ; preds = %539
  %545 = load ptr, ptr %5, align 8
  %546 = getelementptr inbounds %struct.CalcLangVal, ptr %545, i32 0, i32 0
  %547 = load i32, ptr %546, align 8
  %548 = icmp eq i32 %547, 1
  br i1 %548, label %549, label %599

549:                                              ; preds = %544
  %550 = load ptr, ptr %4, align 8
  %551 = getelementptr inbounds %struct.CalcLangVal, ptr %550, i32 0, i32 1
  %552 = load ptr, ptr %551, align 8
  store ptr %552, ptr %17, align 8
  %553 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %553, ptr %18, align 8
  %554 = load ptr, ptr %17, align 8
  %555 = getelementptr inbounds %struct.TupleValue, ptr %554, i32 0, i32 0
  %556 = load i32, ptr %555, align 8
  %557 = load ptr, ptr %18, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 0
  store i32 %556, ptr %558, align 8
  %559 = load ptr, ptr %18, align 8
  %560 = getelementptr inbounds %struct.TupleValue, ptr %559, i32 0, i32 0
  %561 = load i32, ptr %560, align 8
  %562 = sext i32 %561 to i64
  %563 = mul i64 8, %562
  %564 = call noalias ptr @malloc(i64 noundef %563) #6
  %565 = load ptr, ptr %18, align 8
  %566 = getelementptr inbounds %struct.TupleValue, ptr %565, i32 0, i32 1
  store ptr %564, ptr %566, align 8
  store i32 0, ptr %19, align 4
  br label %567

567:                                              ; preds = %590, %549
  %568 = load i32, ptr %19, align 4
  %569 = load ptr, ptr %17, align 8
  %570 = getelementptr inbounds %struct.TupleValue, ptr %569, i32 0, i32 0
  %571 = load i32, ptr %570, align 8
  %572 = icmp slt i32 %568, %571
  br i1 %572, label %573, label %593

573:                                              ; preds = %567
  %574 = load ptr, ptr %17, align 8
  %575 = getelementptr inbounds %struct.TupleValue, ptr %574, i32 0, i32 1
  %576 = load ptr, ptr %575, align 8
  %577 = load i32, ptr %19, align 4
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds ptr, ptr %576, i64 %578
  %580 = load ptr, ptr %579, align 8
  %581 = load ptr, ptr %5, align 8
  %582 = call ptr @copyValue(ptr noundef %581)
  %583 = call ptr @divCalcLangValues(ptr noundef %580, ptr noundef %582)
  %584 = load ptr, ptr %18, align 8
  %585 = getelementptr inbounds %struct.TupleValue, ptr %584, i32 0, i32 1
  %586 = load ptr, ptr %585, align 8
  %587 = load i32, ptr %19, align 4
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds ptr, ptr %586, i64 %588
  store ptr %583, ptr %589, align 8
  br label %590

590:                                              ; preds = %573
  %591 = load i32, ptr %19, align 4
  %592 = add nsw i32 %591, 1
  store i32 %592, ptr %19, align 4
  br label %567, !llvm.loop !66

593:                                              ; preds = %567
  %594 = load ptr, ptr %6, align 8
  %595 = getelementptr inbounds %struct.CalcLangVal, ptr %594, i32 0, i32 0
  store i32 7, ptr %595, align 8
  %596 = load ptr, ptr %18, align 8
  %597 = load ptr, ptr %6, align 8
  %598 = getelementptr inbounds %struct.CalcLangVal, ptr %597, i32 0, i32 1
  store ptr %596, ptr %598, align 8
  br label %1472

599:                                              ; preds = %544, %539
  %600 = load ptr, ptr %4, align 8
  %601 = getelementptr inbounds %struct.CalcLangVal, ptr %600, i32 0, i32 0
  %602 = load i32, ptr %601, align 8
  %603 = icmp eq i32 %602, 1
  br i1 %603, label %604, label %659

604:                                              ; preds = %599
  %605 = load ptr, ptr %5, align 8
  %606 = getelementptr inbounds %struct.CalcLangVal, ptr %605, i32 0, i32 0
  %607 = load i32, ptr %606, align 8
  %608 = icmp eq i32 %607, 7
  br i1 %608, label %609, label %659

609:                                              ; preds = %604
  %610 = load ptr, ptr %5, align 8
  %611 = getelementptr inbounds %struct.CalcLangVal, ptr %610, i32 0, i32 1
  %612 = load ptr, ptr %611, align 8
  store ptr %612, ptr %20, align 8
  %613 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %613, ptr %21, align 8
  %614 = load ptr, ptr %20, align 8
  %615 = getelementptr inbounds %struct.TupleValue, ptr %614, i32 0, i32 0
  %616 = load i32, ptr %615, align 8
  %617 = load ptr, ptr %21, align 8
  %618 = getelementptr inbounds %struct.TupleValue, ptr %617, i32 0, i32 0
  store i32 %616, ptr %618, align 8
  %619 = load ptr, ptr %21, align 8
  %620 = getelementptr inbounds %struct.TupleValue, ptr %619, i32 0, i32 0
  %621 = load i32, ptr %620, align 8
  %622 = sext i32 %621 to i64
  %623 = mul i64 8, %622
  %624 = call noalias ptr @malloc(i64 noundef %623) #6
  %625 = load ptr, ptr %21, align 8
  %626 = getelementptr inbounds %struct.TupleValue, ptr %625, i32 0, i32 1
  store ptr %624, ptr %626, align 8
  store i32 0, ptr %22, align 4
  br label %627

627:                                              ; preds = %650, %609
  %628 = load i32, ptr %22, align 4
  %629 = load ptr, ptr %20, align 8
  %630 = getelementptr inbounds %struct.TupleValue, ptr %629, i32 0, i32 0
  %631 = load i32, ptr %630, align 8
  %632 = icmp slt i32 %628, %631
  br i1 %632, label %633, label %653

633:                                              ; preds = %627
  %634 = load ptr, ptr %4, align 8
  %635 = call ptr @copyValue(ptr noundef %634)
  %636 = load ptr, ptr %20, align 8
  %637 = getelementptr inbounds %struct.TupleValue, ptr %636, i32 0, i32 1
  %638 = load ptr, ptr %637, align 8
  %639 = load i32, ptr %22, align 4
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds ptr, ptr %638, i64 %640
  %642 = load ptr, ptr %641, align 8
  %643 = call ptr @divCalcLangValues(ptr noundef %635, ptr noundef %642)
  %644 = load ptr, ptr %21, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  %647 = load i32, ptr %22, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds ptr, ptr %646, i64 %648
  store ptr %643, ptr %649, align 8
  br label %650

650:                                              ; preds = %633
  %651 = load i32, ptr %22, align 4
  %652 = add nsw i32 %651, 1
  store i32 %652, ptr %22, align 4
  br label %627, !llvm.loop !67

653:                                              ; preds = %627
  %654 = load ptr, ptr %6, align 8
  %655 = getelementptr inbounds %struct.CalcLangVal, ptr %654, i32 0, i32 0
  store i32 7, ptr %655, align 8
  %656 = load ptr, ptr %21, align 8
  %657 = load ptr, ptr %6, align 8
  %658 = getelementptr inbounds %struct.CalcLangVal, ptr %657, i32 0, i32 1
  store ptr %656, ptr %658, align 8
  br label %1471

659:                                              ; preds = %604, %599
  %660 = load ptr, ptr %4, align 8
  %661 = getelementptr inbounds %struct.CalcLangVal, ptr %660, i32 0, i32 0
  %662 = load i32, ptr %661, align 8
  %663 = icmp eq i32 %662, 7
  br i1 %663, label %664, label %719

664:                                              ; preds = %659
  %665 = load ptr, ptr %5, align 8
  %666 = getelementptr inbounds %struct.CalcLangVal, ptr %665, i32 0, i32 0
  %667 = load i32, ptr %666, align 8
  %668 = icmp eq i32 %667, 3
  br i1 %668, label %669, label %719

669:                                              ; preds = %664
  %670 = load ptr, ptr %4, align 8
  %671 = getelementptr inbounds %struct.CalcLangVal, ptr %670, i32 0, i32 1
  %672 = load ptr, ptr %671, align 8
  store ptr %672, ptr %23, align 8
  %673 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %673, ptr %24, align 8
  %674 = load ptr, ptr %23, align 8
  %675 = getelementptr inbounds %struct.TupleValue, ptr %674, i32 0, i32 0
  %676 = load i32, ptr %675, align 8
  %677 = load ptr, ptr %24, align 8
  %678 = getelementptr inbounds %struct.TupleValue, ptr %677, i32 0, i32 0
  store i32 %676, ptr %678, align 8
  %679 = load ptr, ptr %24, align 8
  %680 = getelementptr inbounds %struct.TupleValue, ptr %679, i32 0, i32 0
  %681 = load i32, ptr %680, align 8
  %682 = sext i32 %681 to i64
  %683 = mul i64 8, %682
  %684 = call noalias ptr @malloc(i64 noundef %683) #6
  %685 = load ptr, ptr %24, align 8
  %686 = getelementptr inbounds %struct.TupleValue, ptr %685, i32 0, i32 1
  store ptr %684, ptr %686, align 8
  store i32 0, ptr %25, align 4
  br label %687

687:                                              ; preds = %710, %669
  %688 = load i32, ptr %25, align 4
  %689 = load ptr, ptr %23, align 8
  %690 = getelementptr inbounds %struct.TupleValue, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = icmp slt i32 %688, %691
  br i1 %692, label %693, label %713

693:                                              ; preds = %687
  %694 = load ptr, ptr %23, align 8
  %695 = getelementptr inbounds %struct.TupleValue, ptr %694, i32 0, i32 1
  %696 = load ptr, ptr %695, align 8
  %697 = load i32, ptr %25, align 4
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds ptr, ptr %696, i64 %698
  %700 = load ptr, ptr %699, align 8
  %701 = load ptr, ptr %5, align 8
  %702 = call ptr @copyValue(ptr noundef %701)
  %703 = call ptr @divCalcLangValues(ptr noundef %700, ptr noundef %702)
  %704 = load ptr, ptr %24, align 8
  %705 = getelementptr inbounds %struct.TupleValue, ptr %704, i32 0, i32 1
  %706 = load ptr, ptr %705, align 8
  %707 = load i32, ptr %25, align 4
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds ptr, ptr %706, i64 %708
  store ptr %703, ptr %709, align 8
  br label %710

710:                                              ; preds = %693
  %711 = load i32, ptr %25, align 4
  %712 = add nsw i32 %711, 1
  store i32 %712, ptr %25, align 4
  br label %687, !llvm.loop !68

713:                                              ; preds = %687
  %714 = load ptr, ptr %6, align 8
  %715 = getelementptr inbounds %struct.CalcLangVal, ptr %714, i32 0, i32 0
  store i32 7, ptr %715, align 8
  %716 = load ptr, ptr %24, align 8
  %717 = load ptr, ptr %6, align 8
  %718 = getelementptr inbounds %struct.CalcLangVal, ptr %717, i32 0, i32 1
  store ptr %716, ptr %718, align 8
  br label %1470

719:                                              ; preds = %664, %659
  %720 = load ptr, ptr %4, align 8
  %721 = getelementptr inbounds %struct.CalcLangVal, ptr %720, i32 0, i32 0
  %722 = load i32, ptr %721, align 8
  %723 = icmp eq i32 %722, 3
  br i1 %723, label %724, label %779

724:                                              ; preds = %719
  %725 = load ptr, ptr %5, align 8
  %726 = getelementptr inbounds %struct.CalcLangVal, ptr %725, i32 0, i32 0
  %727 = load i32, ptr %726, align 8
  %728 = icmp eq i32 %727, 7
  br i1 %728, label %729, label %779

729:                                              ; preds = %724
  %730 = load ptr, ptr %5, align 8
  %731 = getelementptr inbounds %struct.CalcLangVal, ptr %730, i32 0, i32 1
  %732 = load ptr, ptr %731, align 8
  store ptr %732, ptr %26, align 8
  %733 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %733, ptr %27, align 8
  %734 = load ptr, ptr %26, align 8
  %735 = getelementptr inbounds %struct.TupleValue, ptr %734, i32 0, i32 0
  %736 = load i32, ptr %735, align 8
  %737 = load ptr, ptr %27, align 8
  %738 = getelementptr inbounds %struct.TupleValue, ptr %737, i32 0, i32 0
  store i32 %736, ptr %738, align 8
  %739 = load ptr, ptr %27, align 8
  %740 = getelementptr inbounds %struct.TupleValue, ptr %739, i32 0, i32 0
  %741 = load i32, ptr %740, align 8
  %742 = sext i32 %741 to i64
  %743 = mul i64 8, %742
  %744 = call noalias ptr @malloc(i64 noundef %743) #6
  %745 = load ptr, ptr %27, align 8
  %746 = getelementptr inbounds %struct.TupleValue, ptr %745, i32 0, i32 1
  store ptr %744, ptr %746, align 8
  store i32 0, ptr %28, align 4
  br label %747

747:                                              ; preds = %770, %729
  %748 = load i32, ptr %28, align 4
  %749 = load ptr, ptr %26, align 8
  %750 = getelementptr inbounds %struct.TupleValue, ptr %749, i32 0, i32 0
  %751 = load i32, ptr %750, align 8
  %752 = icmp slt i32 %748, %751
  br i1 %752, label %753, label %773

753:                                              ; preds = %747
  %754 = load ptr, ptr %4, align 8
  %755 = call ptr @copyValue(ptr noundef %754)
  %756 = load ptr, ptr %26, align 8
  %757 = getelementptr inbounds %struct.TupleValue, ptr %756, i32 0, i32 1
  %758 = load ptr, ptr %757, align 8
  %759 = load i32, ptr %28, align 4
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds ptr, ptr %758, i64 %760
  %762 = load ptr, ptr %761, align 8
  %763 = call ptr @divCalcLangValues(ptr noundef %755, ptr noundef %762)
  %764 = load ptr, ptr %27, align 8
  %765 = getelementptr inbounds %struct.TupleValue, ptr %764, i32 0, i32 1
  %766 = load ptr, ptr %765, align 8
  %767 = load i32, ptr %28, align 4
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds ptr, ptr %766, i64 %768
  store ptr %763, ptr %769, align 8
  br label %770

770:                                              ; preds = %753
  %771 = load i32, ptr %28, align 4
  %772 = add nsw i32 %771, 1
  store i32 %772, ptr %28, align 4
  br label %747, !llvm.loop !69

773:                                              ; preds = %747
  %774 = load ptr, ptr %6, align 8
  %775 = getelementptr inbounds %struct.CalcLangVal, ptr %774, i32 0, i32 0
  store i32 7, ptr %775, align 8
  %776 = load ptr, ptr %27, align 8
  %777 = load ptr, ptr %6, align 8
  %778 = getelementptr inbounds %struct.CalcLangVal, ptr %777, i32 0, i32 1
  store ptr %776, ptr %778, align 8
  br label %1469

779:                                              ; preds = %724, %719
  %780 = load ptr, ptr %4, align 8
  %781 = getelementptr inbounds %struct.CalcLangVal, ptr %780, i32 0, i32 0
  %782 = load i32, ptr %781, align 8
  %783 = icmp eq i32 %782, 7
  br i1 %783, label %784, label %839

784:                                              ; preds = %779
  %785 = load ptr, ptr %5, align 8
  %786 = getelementptr inbounds %struct.CalcLangVal, ptr %785, i32 0, i32 0
  %787 = load i32, ptr %786, align 8
  %788 = icmp eq i32 %787, 4
  br i1 %788, label %789, label %839

789:                                              ; preds = %784
  %790 = load ptr, ptr %4, align 8
  %791 = getelementptr inbounds %struct.CalcLangVal, ptr %790, i32 0, i32 1
  %792 = load ptr, ptr %791, align 8
  store ptr %792, ptr %29, align 8
  %793 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %793, ptr %30, align 8
  %794 = load ptr, ptr %29, align 8
  %795 = getelementptr inbounds %struct.TupleValue, ptr %794, i32 0, i32 0
  %796 = load i32, ptr %795, align 8
  %797 = load ptr, ptr %30, align 8
  %798 = getelementptr inbounds %struct.TupleValue, ptr %797, i32 0, i32 0
  store i32 %796, ptr %798, align 8
  %799 = load ptr, ptr %30, align 8
  %800 = getelementptr inbounds %struct.TupleValue, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = sext i32 %801 to i64
  %803 = mul i64 8, %802
  %804 = call noalias ptr @malloc(i64 noundef %803) #6
  %805 = load ptr, ptr %30, align 8
  %806 = getelementptr inbounds %struct.TupleValue, ptr %805, i32 0, i32 1
  store ptr %804, ptr %806, align 8
  store i32 0, ptr %31, align 4
  br label %807

807:                                              ; preds = %830, %789
  %808 = load i32, ptr %31, align 4
  %809 = load ptr, ptr %29, align 8
  %810 = getelementptr inbounds %struct.TupleValue, ptr %809, i32 0, i32 0
  %811 = load i32, ptr %810, align 8
  %812 = icmp slt i32 %808, %811
  br i1 %812, label %813, label %833

813:                                              ; preds = %807
  %814 = load ptr, ptr %29, align 8
  %815 = getelementptr inbounds %struct.TupleValue, ptr %814, i32 0, i32 1
  %816 = load ptr, ptr %815, align 8
  %817 = load i32, ptr %31, align 4
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds ptr, ptr %816, i64 %818
  %820 = load ptr, ptr %819, align 8
  %821 = load ptr, ptr %5, align 8
  %822 = call ptr @copyValue(ptr noundef %821)
  %823 = call ptr @divCalcLangValues(ptr noundef %820, ptr noundef %822)
  %824 = load ptr, ptr %30, align 8
  %825 = getelementptr inbounds %struct.TupleValue, ptr %824, i32 0, i32 1
  %826 = load ptr, ptr %825, align 8
  %827 = load i32, ptr %31, align 4
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds ptr, ptr %826, i64 %828
  store ptr %823, ptr %829, align 8
  br label %830

830:                                              ; preds = %813
  %831 = load i32, ptr %31, align 4
  %832 = add nsw i32 %831, 1
  store i32 %832, ptr %31, align 4
  br label %807, !llvm.loop !70

833:                                              ; preds = %807
  %834 = load ptr, ptr %6, align 8
  %835 = getelementptr inbounds %struct.CalcLangVal, ptr %834, i32 0, i32 0
  store i32 7, ptr %835, align 8
  %836 = load ptr, ptr %30, align 8
  %837 = load ptr, ptr %6, align 8
  %838 = getelementptr inbounds %struct.CalcLangVal, ptr %837, i32 0, i32 1
  store ptr %836, ptr %838, align 8
  br label %1468

839:                                              ; preds = %784, %779
  %840 = load ptr, ptr %4, align 8
  %841 = getelementptr inbounds %struct.CalcLangVal, ptr %840, i32 0, i32 0
  %842 = load i32, ptr %841, align 8
  %843 = icmp eq i32 %842, 4
  br i1 %843, label %844, label %899

844:                                              ; preds = %839
  %845 = load ptr, ptr %5, align 8
  %846 = getelementptr inbounds %struct.CalcLangVal, ptr %845, i32 0, i32 0
  %847 = load i32, ptr %846, align 8
  %848 = icmp eq i32 %847, 7
  br i1 %848, label %849, label %899

849:                                              ; preds = %844
  %850 = load ptr, ptr %5, align 8
  %851 = getelementptr inbounds %struct.CalcLangVal, ptr %850, i32 0, i32 1
  %852 = load ptr, ptr %851, align 8
  store ptr %852, ptr %32, align 8
  %853 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %853, ptr %33, align 8
  %854 = load ptr, ptr %32, align 8
  %855 = getelementptr inbounds %struct.TupleValue, ptr %854, i32 0, i32 0
  %856 = load i32, ptr %855, align 8
  %857 = load ptr, ptr %33, align 8
  %858 = getelementptr inbounds %struct.TupleValue, ptr %857, i32 0, i32 0
  store i32 %856, ptr %858, align 8
  %859 = load ptr, ptr %33, align 8
  %860 = getelementptr inbounds %struct.TupleValue, ptr %859, i32 0, i32 0
  %861 = load i32, ptr %860, align 8
  %862 = sext i32 %861 to i64
  %863 = mul i64 8, %862
  %864 = call noalias ptr @malloc(i64 noundef %863) #6
  %865 = load ptr, ptr %33, align 8
  %866 = getelementptr inbounds %struct.TupleValue, ptr %865, i32 0, i32 1
  store ptr %864, ptr %866, align 8
  store i32 0, ptr %34, align 4
  br label %867

867:                                              ; preds = %890, %849
  %868 = load i32, ptr %34, align 4
  %869 = load ptr, ptr %32, align 8
  %870 = getelementptr inbounds %struct.TupleValue, ptr %869, i32 0, i32 0
  %871 = load i32, ptr %870, align 8
  %872 = icmp slt i32 %868, %871
  br i1 %872, label %873, label %893

873:                                              ; preds = %867
  %874 = load ptr, ptr %4, align 8
  %875 = call ptr @copyValue(ptr noundef %874)
  %876 = load ptr, ptr %32, align 8
  %877 = getelementptr inbounds %struct.TupleValue, ptr %876, i32 0, i32 1
  %878 = load ptr, ptr %877, align 8
  %879 = load i32, ptr %34, align 4
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds ptr, ptr %878, i64 %880
  %882 = load ptr, ptr %881, align 8
  %883 = call ptr @divCalcLangValues(ptr noundef %875, ptr noundef %882)
  %884 = load ptr, ptr %33, align 8
  %885 = getelementptr inbounds %struct.TupleValue, ptr %884, i32 0, i32 1
  %886 = load ptr, ptr %885, align 8
  %887 = load i32, ptr %34, align 4
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds ptr, ptr %886, i64 %888
  store ptr %883, ptr %889, align 8
  br label %890

890:                                              ; preds = %873
  %891 = load i32, ptr %34, align 4
  %892 = add nsw i32 %891, 1
  store i32 %892, ptr %34, align 4
  br label %867, !llvm.loop !71

893:                                              ; preds = %867
  %894 = load ptr, ptr %6, align 8
  %895 = getelementptr inbounds %struct.CalcLangVal, ptr %894, i32 0, i32 0
  store i32 7, ptr %895, align 8
  %896 = load ptr, ptr %33, align 8
  %897 = load ptr, ptr %6, align 8
  %898 = getelementptr inbounds %struct.CalcLangVal, ptr %897, i32 0, i32 1
  store ptr %896, ptr %898, align 8
  br label %1467

899:                                              ; preds = %844, %839
  %900 = load ptr, ptr %4, align 8
  %901 = getelementptr inbounds %struct.CalcLangVal, ptr %900, i32 0, i32 0
  %902 = load i32, ptr %901, align 8
  %903 = icmp eq i32 %902, 6
  br i1 %903, label %904, label %977

904:                                              ; preds = %899
  %905 = load ptr, ptr %5, align 8
  %906 = getelementptr inbounds %struct.CalcLangVal, ptr %905, i32 0, i32 0
  %907 = load i32, ptr %906, align 8
  %908 = icmp eq i32 %907, 6
  br i1 %908, label %909, label %977

909:                                              ; preds = %904
  %910 = load ptr, ptr %4, align 8
  %911 = getelementptr inbounds %struct.CalcLangVal, ptr %910, i32 0, i32 1
  %912 = load ptr, ptr %911, align 8
  store ptr %912, ptr %35, align 8
  %913 = load ptr, ptr %5, align 8
  %914 = getelementptr inbounds %struct.CalcLangVal, ptr %913, i32 0, i32 1
  %915 = load ptr, ptr %914, align 8
  store ptr %915, ptr %36, align 8
  %916 = load ptr, ptr %36, align 8
  %917 = getelementptr inbounds %struct.SetValue, ptr %916, i32 0, i32 0
  %918 = load i32, ptr %917, align 8
  %919 = load ptr, ptr %35, align 8
  %920 = getelementptr inbounds %struct.SetValue, ptr %919, i32 0, i32 0
  %921 = load i32, ptr %920, align 8
  %922 = icmp eq i32 %918, %921
  br i1 %922, label %923, label %975

923:                                              ; preds = %909
  %924 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %924, ptr %37, align 8
  %925 = load ptr, ptr %35, align 8
  %926 = getelementptr inbounds %struct.SetValue, ptr %925, i32 0, i32 0
  %927 = load i32, ptr %926, align 8
  %928 = load ptr, ptr %37, align 8
  %929 = getelementptr inbounds %struct.SetValue, ptr %928, i32 0, i32 0
  store i32 %927, ptr %929, align 8
  %930 = load ptr, ptr %37, align 8
  %931 = getelementptr inbounds %struct.SetValue, ptr %930, i32 0, i32 0
  %932 = load i32, ptr %931, align 8
  %933 = sext i32 %932 to i64
  %934 = mul i64 8, %933
  %935 = call noalias ptr @malloc(i64 noundef %934) #6
  %936 = load ptr, ptr %37, align 8
  %937 = getelementptr inbounds %struct.SetValue, ptr %936, i32 0, i32 1
  store ptr %935, ptr %937, align 8
  store i32 0, ptr %38, align 4
  br label %938

938:                                              ; preds = %966, %923
  %939 = load i32, ptr %38, align 4
  %940 = load ptr, ptr %35, align 8
  %941 = getelementptr inbounds %struct.SetValue, ptr %940, i32 0, i32 0
  %942 = load i32, ptr %941, align 8
  %943 = icmp slt i32 %939, %942
  br i1 %943, label %944, label %969

944:                                              ; preds = %938
  %945 = load ptr, ptr %35, align 8
  %946 = getelementptr inbounds %struct.SetValue, ptr %945, i32 0, i32 1
  %947 = load ptr, ptr %946, align 8
  %948 = load i32, ptr %38, align 4
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds ptr, ptr %947, i64 %949
  %951 = load ptr, ptr %950, align 8
  %952 = load ptr, ptr %36, align 8
  %953 = getelementptr inbounds %struct.SetValue, ptr %952, i32 0, i32 1
  %954 = load ptr, ptr %953, align 8
  %955 = load i32, ptr %38, align 4
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds ptr, ptr %954, i64 %956
  %958 = load ptr, ptr %957, align 8
  %959 = call ptr @divCalcLangValues(ptr noundef %951, ptr noundef %958)
  %960 = load ptr, ptr %37, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 1
  %962 = load ptr, ptr %961, align 8
  %963 = load i32, ptr %38, align 4
  %964 = sext i32 %963 to i64
  %965 = getelementptr inbounds ptr, ptr %962, i64 %964
  store ptr %959, ptr %965, align 8
  br label %966

966:                                              ; preds = %944
  %967 = load i32, ptr %38, align 4
  %968 = add nsw i32 %967, 1
  store i32 %968, ptr %38, align 4
  br label %938, !llvm.loop !72

969:                                              ; preds = %938
  %970 = load ptr, ptr %6, align 8
  %971 = getelementptr inbounds %struct.CalcLangVal, ptr %970, i32 0, i32 0
  store i32 6, ptr %971, align 8
  %972 = load ptr, ptr %37, align 8
  %973 = load ptr, ptr %6, align 8
  %974 = getelementptr inbounds %struct.CalcLangVal, ptr %973, i32 0, i32 1
  store ptr %972, ptr %974, align 8
  br label %976

975:                                              ; preds = %909
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1491

976:                                              ; preds = %969
  br label %1466

977:                                              ; preds = %904, %899
  %978 = load ptr, ptr %4, align 8
  %979 = getelementptr inbounds %struct.CalcLangVal, ptr %978, i32 0, i32 0
  %980 = load i32, ptr %979, align 8
  %981 = icmp eq i32 %980, 6
  br i1 %981, label %982, label %1037

982:                                              ; preds = %977
  %983 = load ptr, ptr %5, align 8
  %984 = getelementptr inbounds %struct.CalcLangVal, ptr %983, i32 0, i32 0
  %985 = load i32, ptr %984, align 8
  %986 = icmp eq i32 %985, 0
  br i1 %986, label %987, label %1037

987:                                              ; preds = %982
  %988 = load ptr, ptr %4, align 8
  %989 = getelementptr inbounds %struct.CalcLangVal, ptr %988, i32 0, i32 1
  %990 = load ptr, ptr %989, align 8
  store ptr %990, ptr %39, align 8
  %991 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %991, ptr %40, align 8
  %992 = load ptr, ptr %39, align 8
  %993 = getelementptr inbounds %struct.SetValue, ptr %992, i32 0, i32 0
  %994 = load i32, ptr %993, align 8
  %995 = load ptr, ptr %40, align 8
  %996 = getelementptr inbounds %struct.SetValue, ptr %995, i32 0, i32 0
  store i32 %994, ptr %996, align 8
  %997 = load ptr, ptr %40, align 8
  %998 = getelementptr inbounds %struct.SetValue, ptr %997, i32 0, i32 0
  %999 = load i32, ptr %998, align 8
  %1000 = sext i32 %999 to i64
  %1001 = mul i64 8, %1000
  %1002 = call noalias ptr @malloc(i64 noundef %1001) #6
  %1003 = load ptr, ptr %40, align 8
  %1004 = getelementptr inbounds %struct.SetValue, ptr %1003, i32 0, i32 1
  store ptr %1002, ptr %1004, align 8
  store i32 0, ptr %41, align 4
  br label %1005

1005:                                             ; preds = %1028, %987
  %1006 = load i32, ptr %41, align 4
  %1007 = load ptr, ptr %39, align 8
  %1008 = getelementptr inbounds %struct.SetValue, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp slt i32 %1006, %1009
  br i1 %1010, label %1011, label %1031

1011:                                             ; preds = %1005
  %1012 = load ptr, ptr %39, align 8
  %1013 = getelementptr inbounds %struct.SetValue, ptr %1012, i32 0, i32 1
  %1014 = load ptr, ptr %1013, align 8
  %1015 = load i32, ptr %41, align 4
  %1016 = sext i32 %1015 to i64
  %1017 = getelementptr inbounds ptr, ptr %1014, i64 %1016
  %1018 = load ptr, ptr %1017, align 8
  %1019 = load ptr, ptr %5, align 8
  %1020 = call ptr @copyValue(ptr noundef %1019)
  %1021 = call ptr @divCalcLangValues(ptr noundef %1018, ptr noundef %1020)
  %1022 = load ptr, ptr %40, align 8
  %1023 = getelementptr inbounds %struct.SetValue, ptr %1022, i32 0, i32 1
  %1024 = load ptr, ptr %1023, align 8
  %1025 = load i32, ptr %41, align 4
  %1026 = sext i32 %1025 to i64
  %1027 = getelementptr inbounds ptr, ptr %1024, i64 %1026
  store ptr %1021, ptr %1027, align 8
  br label %1028

1028:                                             ; preds = %1011
  %1029 = load i32, ptr %41, align 4
  %1030 = add nsw i32 %1029, 1
  store i32 %1030, ptr %41, align 4
  br label %1005, !llvm.loop !73

1031:                                             ; preds = %1005
  %1032 = load ptr, ptr %6, align 8
  %1033 = getelementptr inbounds %struct.CalcLangVal, ptr %1032, i32 0, i32 0
  store i32 6, ptr %1033, align 8
  %1034 = load ptr, ptr %40, align 8
  %1035 = load ptr, ptr %6, align 8
  %1036 = getelementptr inbounds %struct.CalcLangVal, ptr %1035, i32 0, i32 1
  store ptr %1034, ptr %1036, align 8
  br label %1465

1037:                                             ; preds = %982, %977
  %1038 = load ptr, ptr %4, align 8
  %1039 = getelementptr inbounds %struct.CalcLangVal, ptr %1038, i32 0, i32 0
  %1040 = load i32, ptr %1039, align 8
  %1041 = icmp eq i32 %1040, 0
  br i1 %1041, label %1042, label %1097

1042:                                             ; preds = %1037
  %1043 = load ptr, ptr %5, align 8
  %1044 = getelementptr inbounds %struct.CalcLangVal, ptr %1043, i32 0, i32 0
  %1045 = load i32, ptr %1044, align 8
  %1046 = icmp eq i32 %1045, 6
  br i1 %1046, label %1047, label %1097

1047:                                             ; preds = %1042
  %1048 = load ptr, ptr %5, align 8
  %1049 = getelementptr inbounds %struct.CalcLangVal, ptr %1048, i32 0, i32 1
  %1050 = load ptr, ptr %1049, align 8
  store ptr %1050, ptr %42, align 8
  %1051 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1051, ptr %43, align 8
  %1052 = load ptr, ptr %42, align 8
  %1053 = getelementptr inbounds %struct.SetValue, ptr %1052, i32 0, i32 0
  %1054 = load i32, ptr %1053, align 8
  %1055 = load ptr, ptr %43, align 8
  %1056 = getelementptr inbounds %struct.SetValue, ptr %1055, i32 0, i32 0
  store i32 %1054, ptr %1056, align 8
  %1057 = load ptr, ptr %43, align 8
  %1058 = getelementptr inbounds %struct.SetValue, ptr %1057, i32 0, i32 0
  %1059 = load i32, ptr %1058, align 8
  %1060 = sext i32 %1059 to i64
  %1061 = mul i64 8, %1060
  %1062 = call noalias ptr @malloc(i64 noundef %1061) #6
  %1063 = load ptr, ptr %43, align 8
  %1064 = getelementptr inbounds %struct.SetValue, ptr %1063, i32 0, i32 1
  store ptr %1062, ptr %1064, align 8
  store i32 0, ptr %44, align 4
  br label %1065

1065:                                             ; preds = %1088, %1047
  %1066 = load i32, ptr %44, align 4
  %1067 = load ptr, ptr %42, align 8
  %1068 = getelementptr inbounds %struct.SetValue, ptr %1067, i32 0, i32 0
  %1069 = load i32, ptr %1068, align 8
  %1070 = icmp slt i32 %1066, %1069
  br i1 %1070, label %1071, label %1091

1071:                                             ; preds = %1065
  %1072 = load ptr, ptr %4, align 8
  %1073 = call ptr @copyValue(ptr noundef %1072)
  %1074 = load ptr, ptr %42, align 8
  %1075 = getelementptr inbounds %struct.SetValue, ptr %1074, i32 0, i32 1
  %1076 = load ptr, ptr %1075, align 8
  %1077 = load i32, ptr %44, align 4
  %1078 = sext i32 %1077 to i64
  %1079 = getelementptr inbounds ptr, ptr %1076, i64 %1078
  %1080 = load ptr, ptr %1079, align 8
  %1081 = call ptr @divCalcLangValues(ptr noundef %1073, ptr noundef %1080)
  %1082 = load ptr, ptr %43, align 8
  %1083 = getelementptr inbounds %struct.SetValue, ptr %1082, i32 0, i32 1
  %1084 = load ptr, ptr %1083, align 8
  %1085 = load i32, ptr %44, align 4
  %1086 = sext i32 %1085 to i64
  %1087 = getelementptr inbounds ptr, ptr %1084, i64 %1086
  store ptr %1081, ptr %1087, align 8
  br label %1088

1088:                                             ; preds = %1071
  %1089 = load i32, ptr %44, align 4
  %1090 = add nsw i32 %1089, 1
  store i32 %1090, ptr %44, align 4
  br label %1065, !llvm.loop !74

1091:                                             ; preds = %1065
  %1092 = load ptr, ptr %6, align 8
  %1093 = getelementptr inbounds %struct.CalcLangVal, ptr %1092, i32 0, i32 0
  store i32 6, ptr %1093, align 8
  %1094 = load ptr, ptr %43, align 8
  %1095 = load ptr, ptr %6, align 8
  %1096 = getelementptr inbounds %struct.CalcLangVal, ptr %1095, i32 0, i32 1
  store ptr %1094, ptr %1096, align 8
  br label %1464

1097:                                             ; preds = %1042, %1037
  %1098 = load ptr, ptr %4, align 8
  %1099 = getelementptr inbounds %struct.CalcLangVal, ptr %1098, i32 0, i32 0
  %1100 = load i32, ptr %1099, align 8
  %1101 = icmp eq i32 %1100, 6
  br i1 %1101, label %1102, label %1157

1102:                                             ; preds = %1097
  %1103 = load ptr, ptr %5, align 8
  %1104 = getelementptr inbounds %struct.CalcLangVal, ptr %1103, i32 0, i32 0
  %1105 = load i32, ptr %1104, align 8
  %1106 = icmp eq i32 %1105, 1
  br i1 %1106, label %1107, label %1157

1107:                                             ; preds = %1102
  %1108 = load ptr, ptr %4, align 8
  %1109 = getelementptr inbounds %struct.CalcLangVal, ptr %1108, i32 0, i32 1
  %1110 = load ptr, ptr %1109, align 8
  store ptr %1110, ptr %45, align 8
  %1111 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1111, ptr %46, align 8
  %1112 = load ptr, ptr %45, align 8
  %1113 = getelementptr inbounds %struct.SetValue, ptr %1112, i32 0, i32 0
  %1114 = load i32, ptr %1113, align 8
  %1115 = load ptr, ptr %46, align 8
  %1116 = getelementptr inbounds %struct.SetValue, ptr %1115, i32 0, i32 0
  store i32 %1114, ptr %1116, align 8
  %1117 = load ptr, ptr %46, align 8
  %1118 = getelementptr inbounds %struct.SetValue, ptr %1117, i32 0, i32 0
  %1119 = load i32, ptr %1118, align 8
  %1120 = sext i32 %1119 to i64
  %1121 = mul i64 8, %1120
  %1122 = call noalias ptr @malloc(i64 noundef %1121) #6
  %1123 = load ptr, ptr %46, align 8
  %1124 = getelementptr inbounds %struct.SetValue, ptr %1123, i32 0, i32 1
  store ptr %1122, ptr %1124, align 8
  store i32 0, ptr %47, align 4
  br label %1125

1125:                                             ; preds = %1148, %1107
  %1126 = load i32, ptr %47, align 4
  %1127 = load ptr, ptr %45, align 8
  %1128 = getelementptr inbounds %struct.SetValue, ptr %1127, i32 0, i32 0
  %1129 = load i32, ptr %1128, align 8
  %1130 = icmp slt i32 %1126, %1129
  br i1 %1130, label %1131, label %1151

1131:                                             ; preds = %1125
  %1132 = load ptr, ptr %45, align 8
  %1133 = getelementptr inbounds %struct.SetValue, ptr %1132, i32 0, i32 1
  %1134 = load ptr, ptr %1133, align 8
  %1135 = load i32, ptr %47, align 4
  %1136 = sext i32 %1135 to i64
  %1137 = getelementptr inbounds ptr, ptr %1134, i64 %1136
  %1138 = load ptr, ptr %1137, align 8
  %1139 = load ptr, ptr %5, align 8
  %1140 = call ptr @copyValue(ptr noundef %1139)
  %1141 = call ptr @divCalcLangValues(ptr noundef %1138, ptr noundef %1140)
  %1142 = load ptr, ptr %46, align 8
  %1143 = getelementptr inbounds %struct.SetValue, ptr %1142, i32 0, i32 1
  %1144 = load ptr, ptr %1143, align 8
  %1145 = load i32, ptr %47, align 4
  %1146 = sext i32 %1145 to i64
  %1147 = getelementptr inbounds ptr, ptr %1144, i64 %1146
  store ptr %1141, ptr %1147, align 8
  br label %1148

1148:                                             ; preds = %1131
  %1149 = load i32, ptr %47, align 4
  %1150 = add nsw i32 %1149, 1
  store i32 %1150, ptr %47, align 4
  br label %1125, !llvm.loop !75

1151:                                             ; preds = %1125
  %1152 = load ptr, ptr %6, align 8
  %1153 = getelementptr inbounds %struct.CalcLangVal, ptr %1152, i32 0, i32 0
  store i32 7, ptr %1153, align 8
  %1154 = load ptr, ptr %46, align 8
  %1155 = load ptr, ptr %6, align 8
  %1156 = getelementptr inbounds %struct.CalcLangVal, ptr %1155, i32 0, i32 1
  store ptr %1154, ptr %1156, align 8
  br label %1463

1157:                                             ; preds = %1102, %1097
  %1158 = load ptr, ptr %4, align 8
  %1159 = getelementptr inbounds %struct.CalcLangVal, ptr %1158, i32 0, i32 0
  %1160 = load i32, ptr %1159, align 8
  %1161 = icmp eq i32 %1160, 1
  br i1 %1161, label %1162, label %1217

1162:                                             ; preds = %1157
  %1163 = load ptr, ptr %5, align 8
  %1164 = getelementptr inbounds %struct.CalcLangVal, ptr %1163, i32 0, i32 0
  %1165 = load i32, ptr %1164, align 8
  %1166 = icmp eq i32 %1165, 6
  br i1 %1166, label %1167, label %1217

1167:                                             ; preds = %1162
  %1168 = load ptr, ptr %5, align 8
  %1169 = getelementptr inbounds %struct.CalcLangVal, ptr %1168, i32 0, i32 1
  %1170 = load ptr, ptr %1169, align 8
  store ptr %1170, ptr %48, align 8
  %1171 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1171, ptr %49, align 8
  %1172 = load ptr, ptr %48, align 8
  %1173 = getelementptr inbounds %struct.SetValue, ptr %1172, i32 0, i32 0
  %1174 = load i32, ptr %1173, align 8
  %1175 = load ptr, ptr %49, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 0
  store i32 %1174, ptr %1176, align 8
  %1177 = load ptr, ptr %49, align 8
  %1178 = getelementptr inbounds %struct.SetValue, ptr %1177, i32 0, i32 0
  %1179 = load i32, ptr %1178, align 8
  %1180 = sext i32 %1179 to i64
  %1181 = mul i64 8, %1180
  %1182 = call noalias ptr @malloc(i64 noundef %1181) #6
  %1183 = load ptr, ptr %49, align 8
  %1184 = getelementptr inbounds %struct.SetValue, ptr %1183, i32 0, i32 1
  store ptr %1182, ptr %1184, align 8
  store i32 0, ptr %50, align 4
  br label %1185

1185:                                             ; preds = %1208, %1167
  %1186 = load i32, ptr %50, align 4
  %1187 = load ptr, ptr %48, align 8
  %1188 = getelementptr inbounds %struct.SetValue, ptr %1187, i32 0, i32 0
  %1189 = load i32, ptr %1188, align 8
  %1190 = icmp slt i32 %1186, %1189
  br i1 %1190, label %1191, label %1211

1191:                                             ; preds = %1185
  %1192 = load ptr, ptr %4, align 8
  %1193 = call ptr @copyValue(ptr noundef %1192)
  %1194 = load ptr, ptr %48, align 8
  %1195 = getelementptr inbounds %struct.SetValue, ptr %1194, i32 0, i32 1
  %1196 = load ptr, ptr %1195, align 8
  %1197 = load i32, ptr %50, align 4
  %1198 = sext i32 %1197 to i64
  %1199 = getelementptr inbounds ptr, ptr %1196, i64 %1198
  %1200 = load ptr, ptr %1199, align 8
  %1201 = call ptr @divCalcLangValues(ptr noundef %1193, ptr noundef %1200)
  %1202 = load ptr, ptr %49, align 8
  %1203 = getelementptr inbounds %struct.SetValue, ptr %1202, i32 0, i32 1
  %1204 = load ptr, ptr %1203, align 8
  %1205 = load i32, ptr %50, align 4
  %1206 = sext i32 %1205 to i64
  %1207 = getelementptr inbounds ptr, ptr %1204, i64 %1206
  store ptr %1201, ptr %1207, align 8
  br label %1208

1208:                                             ; preds = %1191
  %1209 = load i32, ptr %50, align 4
  %1210 = add nsw i32 %1209, 1
  store i32 %1210, ptr %50, align 4
  br label %1185, !llvm.loop !76

1211:                                             ; preds = %1185
  %1212 = load ptr, ptr %6, align 8
  %1213 = getelementptr inbounds %struct.CalcLangVal, ptr %1212, i32 0, i32 0
  store i32 6, ptr %1213, align 8
  %1214 = load ptr, ptr %49, align 8
  %1215 = load ptr, ptr %6, align 8
  %1216 = getelementptr inbounds %struct.CalcLangVal, ptr %1215, i32 0, i32 1
  store ptr %1214, ptr %1216, align 8
  br label %1462

1217:                                             ; preds = %1162, %1157
  %1218 = load ptr, ptr %4, align 8
  %1219 = getelementptr inbounds %struct.CalcLangVal, ptr %1218, i32 0, i32 0
  %1220 = load i32, ptr %1219, align 8
  %1221 = icmp eq i32 %1220, 6
  br i1 %1221, label %1222, label %1277

1222:                                             ; preds = %1217
  %1223 = load ptr, ptr %5, align 8
  %1224 = getelementptr inbounds %struct.CalcLangVal, ptr %1223, i32 0, i32 0
  %1225 = load i32, ptr %1224, align 8
  %1226 = icmp eq i32 %1225, 3
  br i1 %1226, label %1227, label %1277

1227:                                             ; preds = %1222
  %1228 = load ptr, ptr %4, align 8
  %1229 = getelementptr inbounds %struct.CalcLangVal, ptr %1228, i32 0, i32 1
  %1230 = load ptr, ptr %1229, align 8
  store ptr %1230, ptr %51, align 8
  %1231 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1231, ptr %52, align 8
  %1232 = load ptr, ptr %51, align 8
  %1233 = getelementptr inbounds %struct.SetValue, ptr %1232, i32 0, i32 0
  %1234 = load i32, ptr %1233, align 8
  %1235 = load ptr, ptr %52, align 8
  %1236 = getelementptr inbounds %struct.SetValue, ptr %1235, i32 0, i32 0
  store i32 %1234, ptr %1236, align 8
  %1237 = load ptr, ptr %52, align 8
  %1238 = getelementptr inbounds %struct.SetValue, ptr %1237, i32 0, i32 0
  %1239 = load i32, ptr %1238, align 8
  %1240 = sext i32 %1239 to i64
  %1241 = mul i64 8, %1240
  %1242 = call noalias ptr @malloc(i64 noundef %1241) #6
  %1243 = load ptr, ptr %52, align 8
  %1244 = getelementptr inbounds %struct.SetValue, ptr %1243, i32 0, i32 1
  store ptr %1242, ptr %1244, align 8
  store i32 0, ptr %53, align 4
  br label %1245

1245:                                             ; preds = %1268, %1227
  %1246 = load i32, ptr %53, align 4
  %1247 = load ptr, ptr %51, align 8
  %1248 = getelementptr inbounds %struct.SetValue, ptr %1247, i32 0, i32 0
  %1249 = load i32, ptr %1248, align 8
  %1250 = icmp slt i32 %1246, %1249
  br i1 %1250, label %1251, label %1271

1251:                                             ; preds = %1245
  %1252 = load ptr, ptr %51, align 8
  %1253 = getelementptr inbounds %struct.SetValue, ptr %1252, i32 0, i32 1
  %1254 = load ptr, ptr %1253, align 8
  %1255 = load i32, ptr %53, align 4
  %1256 = sext i32 %1255 to i64
  %1257 = getelementptr inbounds ptr, ptr %1254, i64 %1256
  %1258 = load ptr, ptr %1257, align 8
  %1259 = load ptr, ptr %5, align 8
  %1260 = call ptr @copyValue(ptr noundef %1259)
  %1261 = call ptr @divCalcLangValues(ptr noundef %1258, ptr noundef %1260)
  %1262 = load ptr, ptr %52, align 8
  %1263 = getelementptr inbounds %struct.SetValue, ptr %1262, i32 0, i32 1
  %1264 = load ptr, ptr %1263, align 8
  %1265 = load i32, ptr %53, align 4
  %1266 = sext i32 %1265 to i64
  %1267 = getelementptr inbounds ptr, ptr %1264, i64 %1266
  store ptr %1261, ptr %1267, align 8
  br label %1268

1268:                                             ; preds = %1251
  %1269 = load i32, ptr %53, align 4
  %1270 = add nsw i32 %1269, 1
  store i32 %1270, ptr %53, align 4
  br label %1245, !llvm.loop !77

1271:                                             ; preds = %1245
  %1272 = load ptr, ptr %6, align 8
  %1273 = getelementptr inbounds %struct.CalcLangVal, ptr %1272, i32 0, i32 0
  store i32 6, ptr %1273, align 8
  %1274 = load ptr, ptr %52, align 8
  %1275 = load ptr, ptr %6, align 8
  %1276 = getelementptr inbounds %struct.CalcLangVal, ptr %1275, i32 0, i32 1
  store ptr %1274, ptr %1276, align 8
  br label %1461

1277:                                             ; preds = %1222, %1217
  %1278 = load ptr, ptr %4, align 8
  %1279 = getelementptr inbounds %struct.CalcLangVal, ptr %1278, i32 0, i32 0
  %1280 = load i32, ptr %1279, align 8
  %1281 = icmp eq i32 %1280, 3
  br i1 %1281, label %1282, label %1337

1282:                                             ; preds = %1277
  %1283 = load ptr, ptr %5, align 8
  %1284 = getelementptr inbounds %struct.CalcLangVal, ptr %1283, i32 0, i32 0
  %1285 = load i32, ptr %1284, align 8
  %1286 = icmp eq i32 %1285, 6
  br i1 %1286, label %1287, label %1337

1287:                                             ; preds = %1282
  %1288 = load ptr, ptr %5, align 8
  %1289 = getelementptr inbounds %struct.CalcLangVal, ptr %1288, i32 0, i32 1
  %1290 = load ptr, ptr %1289, align 8
  store ptr %1290, ptr %54, align 8
  %1291 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1291, ptr %55, align 8
  %1292 = load ptr, ptr %54, align 8
  %1293 = getelementptr inbounds %struct.SetValue, ptr %1292, i32 0, i32 0
  %1294 = load i32, ptr %1293, align 8
  %1295 = load ptr, ptr %55, align 8
  %1296 = getelementptr inbounds %struct.SetValue, ptr %1295, i32 0, i32 0
  store i32 %1294, ptr %1296, align 8
  %1297 = load ptr, ptr %55, align 8
  %1298 = getelementptr inbounds %struct.SetValue, ptr %1297, i32 0, i32 0
  %1299 = load i32, ptr %1298, align 8
  %1300 = sext i32 %1299 to i64
  %1301 = mul i64 8, %1300
  %1302 = call noalias ptr @malloc(i64 noundef %1301) #6
  %1303 = load ptr, ptr %55, align 8
  %1304 = getelementptr inbounds %struct.SetValue, ptr %1303, i32 0, i32 1
  store ptr %1302, ptr %1304, align 8
  store i32 0, ptr %56, align 4
  br label %1305

1305:                                             ; preds = %1328, %1287
  %1306 = load i32, ptr %56, align 4
  %1307 = load ptr, ptr %54, align 8
  %1308 = getelementptr inbounds %struct.SetValue, ptr %1307, i32 0, i32 0
  %1309 = load i32, ptr %1308, align 8
  %1310 = icmp slt i32 %1306, %1309
  br i1 %1310, label %1311, label %1331

1311:                                             ; preds = %1305
  %1312 = load ptr, ptr %4, align 8
  %1313 = call ptr @copyValue(ptr noundef %1312)
  %1314 = load ptr, ptr %54, align 8
  %1315 = getelementptr inbounds %struct.SetValue, ptr %1314, i32 0, i32 1
  %1316 = load ptr, ptr %1315, align 8
  %1317 = load i32, ptr %56, align 4
  %1318 = sext i32 %1317 to i64
  %1319 = getelementptr inbounds ptr, ptr %1316, i64 %1318
  %1320 = load ptr, ptr %1319, align 8
  %1321 = call ptr @divCalcLangValues(ptr noundef %1313, ptr noundef %1320)
  %1322 = load ptr, ptr %55, align 8
  %1323 = getelementptr inbounds %struct.SetValue, ptr %1322, i32 0, i32 1
  %1324 = load ptr, ptr %1323, align 8
  %1325 = load i32, ptr %56, align 4
  %1326 = sext i32 %1325 to i64
  %1327 = getelementptr inbounds ptr, ptr %1324, i64 %1326
  store ptr %1321, ptr %1327, align 8
  br label %1328

1328:                                             ; preds = %1311
  %1329 = load i32, ptr %56, align 4
  %1330 = add nsw i32 %1329, 1
  store i32 %1330, ptr %56, align 4
  br label %1305, !llvm.loop !78

1331:                                             ; preds = %1305
  %1332 = load ptr, ptr %6, align 8
  %1333 = getelementptr inbounds %struct.CalcLangVal, ptr %1332, i32 0, i32 0
  store i32 6, ptr %1333, align 8
  %1334 = load ptr, ptr %55, align 8
  %1335 = load ptr, ptr %6, align 8
  %1336 = getelementptr inbounds %struct.CalcLangVal, ptr %1335, i32 0, i32 1
  store ptr %1334, ptr %1336, align 8
  br label %1460

1337:                                             ; preds = %1282, %1277
  %1338 = load ptr, ptr %4, align 8
  %1339 = getelementptr inbounds %struct.CalcLangVal, ptr %1338, i32 0, i32 0
  %1340 = load i32, ptr %1339, align 8
  %1341 = icmp eq i32 %1340, 6
  br i1 %1341, label %1342, label %1397

1342:                                             ; preds = %1337
  %1343 = load ptr, ptr %5, align 8
  %1344 = getelementptr inbounds %struct.CalcLangVal, ptr %1343, i32 0, i32 0
  %1345 = load i32, ptr %1344, align 8
  %1346 = icmp eq i32 %1345, 4
  br i1 %1346, label %1347, label %1397

1347:                                             ; preds = %1342
  %1348 = load ptr, ptr %4, align 8
  %1349 = getelementptr inbounds %struct.CalcLangVal, ptr %1348, i32 0, i32 1
  %1350 = load ptr, ptr %1349, align 8
  store ptr %1350, ptr %57, align 8
  %1351 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1351, ptr %58, align 8
  %1352 = load ptr, ptr %57, align 8
  %1353 = getelementptr inbounds %struct.SetValue, ptr %1352, i32 0, i32 0
  %1354 = load i32, ptr %1353, align 8
  %1355 = load ptr, ptr %58, align 8
  %1356 = getelementptr inbounds %struct.SetValue, ptr %1355, i32 0, i32 0
  store i32 %1354, ptr %1356, align 8
  %1357 = load ptr, ptr %58, align 8
  %1358 = getelementptr inbounds %struct.SetValue, ptr %1357, i32 0, i32 0
  %1359 = load i32, ptr %1358, align 8
  %1360 = sext i32 %1359 to i64
  %1361 = mul i64 8, %1360
  %1362 = call noalias ptr @malloc(i64 noundef %1361) #6
  %1363 = load ptr, ptr %58, align 8
  %1364 = getelementptr inbounds %struct.SetValue, ptr %1363, i32 0, i32 1
  store ptr %1362, ptr %1364, align 8
  store i32 0, ptr %59, align 4
  br label %1365

1365:                                             ; preds = %1388, %1347
  %1366 = load i32, ptr %59, align 4
  %1367 = load ptr, ptr %57, align 8
  %1368 = getelementptr inbounds %struct.SetValue, ptr %1367, i32 0, i32 0
  %1369 = load i32, ptr %1368, align 8
  %1370 = icmp slt i32 %1366, %1369
  br i1 %1370, label %1371, label %1391

1371:                                             ; preds = %1365
  %1372 = load ptr, ptr %57, align 8
  %1373 = getelementptr inbounds %struct.SetValue, ptr %1372, i32 0, i32 1
  %1374 = load ptr, ptr %1373, align 8
  %1375 = load i32, ptr %59, align 4
  %1376 = sext i32 %1375 to i64
  %1377 = getelementptr inbounds ptr, ptr %1374, i64 %1376
  %1378 = load ptr, ptr %1377, align 8
  %1379 = load ptr, ptr %5, align 8
  %1380 = call ptr @copyValue(ptr noundef %1379)
  %1381 = call ptr @divCalcLangValues(ptr noundef %1378, ptr noundef %1380)
  %1382 = load ptr, ptr %58, align 8
  %1383 = getelementptr inbounds %struct.SetValue, ptr %1382, i32 0, i32 1
  %1384 = load ptr, ptr %1383, align 8
  %1385 = load i32, ptr %59, align 4
  %1386 = sext i32 %1385 to i64
  %1387 = getelementptr inbounds ptr, ptr %1384, i64 %1386
  store ptr %1381, ptr %1387, align 8
  br label %1388

1388:                                             ; preds = %1371
  %1389 = load i32, ptr %59, align 4
  %1390 = add nsw i32 %1389, 1
  store i32 %1390, ptr %59, align 4
  br label %1365, !llvm.loop !79

1391:                                             ; preds = %1365
  %1392 = load ptr, ptr %6, align 8
  %1393 = getelementptr inbounds %struct.CalcLangVal, ptr %1392, i32 0, i32 0
  store i32 6, ptr %1393, align 8
  %1394 = load ptr, ptr %58, align 8
  %1395 = load ptr, ptr %6, align 8
  %1396 = getelementptr inbounds %struct.CalcLangVal, ptr %1395, i32 0, i32 1
  store ptr %1394, ptr %1396, align 8
  br label %1459

1397:                                             ; preds = %1342, %1337
  %1398 = load ptr, ptr %4, align 8
  %1399 = getelementptr inbounds %struct.CalcLangVal, ptr %1398, i32 0, i32 0
  %1400 = load i32, ptr %1399, align 8
  %1401 = icmp eq i32 %1400, 4
  br i1 %1401, label %1402, label %1457

1402:                                             ; preds = %1397
  %1403 = load ptr, ptr %5, align 8
  %1404 = getelementptr inbounds %struct.CalcLangVal, ptr %1403, i32 0, i32 0
  %1405 = load i32, ptr %1404, align 8
  %1406 = icmp eq i32 %1405, 6
  br i1 %1406, label %1407, label %1457

1407:                                             ; preds = %1402
  %1408 = load ptr, ptr %5, align 8
  %1409 = getelementptr inbounds %struct.CalcLangVal, ptr %1408, i32 0, i32 1
  %1410 = load ptr, ptr %1409, align 8
  store ptr %1410, ptr %60, align 8
  %1411 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1411, ptr %61, align 8
  %1412 = load ptr, ptr %60, align 8
  %1413 = getelementptr inbounds %struct.SetValue, ptr %1412, i32 0, i32 0
  %1414 = load i32, ptr %1413, align 8
  %1415 = load ptr, ptr %61, align 8
  %1416 = getelementptr inbounds %struct.SetValue, ptr %1415, i32 0, i32 0
  store i32 %1414, ptr %1416, align 8
  %1417 = load ptr, ptr %61, align 8
  %1418 = getelementptr inbounds %struct.SetValue, ptr %1417, i32 0, i32 0
  %1419 = load i32, ptr %1418, align 8
  %1420 = sext i32 %1419 to i64
  %1421 = mul i64 8, %1420
  %1422 = call noalias ptr @malloc(i64 noundef %1421) #6
  %1423 = load ptr, ptr %61, align 8
  %1424 = getelementptr inbounds %struct.SetValue, ptr %1423, i32 0, i32 1
  store ptr %1422, ptr %1424, align 8
  store i32 0, ptr %62, align 4
  br label %1425

1425:                                             ; preds = %1448, %1407
  %1426 = load i32, ptr %62, align 4
  %1427 = load ptr, ptr %60, align 8
  %1428 = getelementptr inbounds %struct.SetValue, ptr %1427, i32 0, i32 0
  %1429 = load i32, ptr %1428, align 8
  %1430 = icmp slt i32 %1426, %1429
  br i1 %1430, label %1431, label %1451

1431:                                             ; preds = %1425
  %1432 = load ptr, ptr %4, align 8
  %1433 = call ptr @copyValue(ptr noundef %1432)
  %1434 = load ptr, ptr %60, align 8
  %1435 = getelementptr inbounds %struct.SetValue, ptr %1434, i32 0, i32 1
  %1436 = load ptr, ptr %1435, align 8
  %1437 = load i32, ptr %62, align 4
  %1438 = sext i32 %1437 to i64
  %1439 = getelementptr inbounds ptr, ptr %1436, i64 %1438
  %1440 = load ptr, ptr %1439, align 8
  %1441 = call ptr @divCalcLangValues(ptr noundef %1433, ptr noundef %1440)
  %1442 = load ptr, ptr %61, align 8
  %1443 = getelementptr inbounds %struct.SetValue, ptr %1442, i32 0, i32 1
  %1444 = load ptr, ptr %1443, align 8
  %1445 = load i32, ptr %62, align 4
  %1446 = sext i32 %1445 to i64
  %1447 = getelementptr inbounds ptr, ptr %1444, i64 %1446
  store ptr %1441, ptr %1447, align 8
  br label %1448

1448:                                             ; preds = %1431
  %1449 = load i32, ptr %62, align 4
  %1450 = add nsw i32 %1449, 1
  store i32 %1450, ptr %62, align 4
  br label %1425, !llvm.loop !80

1451:                                             ; preds = %1425
  %1452 = load ptr, ptr %6, align 8
  %1453 = getelementptr inbounds %struct.CalcLangVal, ptr %1452, i32 0, i32 0
  store i32 6, ptr %1453, align 8
  %1454 = load ptr, ptr %61, align 8
  %1455 = load ptr, ptr %6, align 8
  %1456 = getelementptr inbounds %struct.CalcLangVal, ptr %1455, i32 0, i32 1
  store ptr %1454, ptr %1456, align 8
  br label %1458

1457:                                             ; preds = %1402, %1397
  call void @perror(ptr noundef @.str.3) #7
  br label %1458

1458:                                             ; preds = %1457, %1451
  br label %1459

1459:                                             ; preds = %1458, %1391
  br label %1460

1460:                                             ; preds = %1459, %1331
  br label %1461

1461:                                             ; preds = %1460, %1271
  br label %1462

1462:                                             ; preds = %1461, %1211
  br label %1463

1463:                                             ; preds = %1462, %1151
  br label %1464

1464:                                             ; preds = %1463, %1091
  br label %1465

1465:                                             ; preds = %1464, %1031
  br label %1466

1466:                                             ; preds = %1465, %976
  br label %1467

1467:                                             ; preds = %1466, %893
  br label %1468

1468:                                             ; preds = %1467, %833
  br label %1469

1469:                                             ; preds = %1468, %773
  br label %1470

1470:                                             ; preds = %1469, %713
  br label %1471

1471:                                             ; preds = %1470, %653
  br label %1472

1472:                                             ; preds = %1471, %593
  br label %1473

1473:                                             ; preds = %1472, %533
  br label %1474

1474:                                             ; preds = %1473, %473
  br label %1475

1475:                                             ; preds = %1474, %418
  br label %1476

1476:                                             ; preds = %1475, %329
  br label %1477

1477:                                             ; preds = %1476, %307
  br label %1478

1478:                                             ; preds = %1477, %285
  br label %1479

1479:                                             ; preds = %1478, %262
  br label %1480

1480:                                             ; preds = %1479, %239
  br label %1481

1481:                                             ; preds = %1480, %217
  br label %1482

1482:                                             ; preds = %1481, %195
  br label %1483

1483:                                             ; preds = %1482, %172
  br label %1484

1484:                                             ; preds = %1483, %149
  br label %1485

1485:                                             ; preds = %1484, %126
  br label %1486

1486:                                             ; preds = %1485, %104
  br label %1487

1487:                                             ; preds = %1486, %80
  %1488 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %1488)
  %1489 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %1489)
  %1490 = load ptr, ptr %6, align 8
  store ptr %1490, ptr %3, align 8
  br label %1491

1491:                                             ; preds = %1487, %975, %417, %68
  %1492 = load ptr, ptr %3, align 8
  ret ptr %1492
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @powCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %68, label %65

65:                                               ; preds = %2
  %66 = load ptr, ptr %5, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %69

68:                                               ; preds = %65, %2
  store ptr null, ptr %3, align 8
  br label %1516

69:                                               ; preds = %65
  %70 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %70, ptr %6, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %95

75:                                               ; preds = %69
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %95

80:                                               ; preds = %75
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 0
  store i32 0, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = sitofp i32 %85 to double
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = sitofp i32 %89 to double
  %91 = call double @pow(double noundef %86, double noundef %90) #8
  %92 = fptosi double %91 to i32
  %93 = load ptr, ptr %6, align 8
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1
  store i32 %92, ptr %94, align 8
  br label %1512

95:                                               ; preds = %75, %69
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 1
  br i1 %99, label %100, label %117

100:                                              ; preds = %95
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 8
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %117

105:                                              ; preds = %100
  %106 = load ptr, ptr %6, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 0
  store i32 1, ptr %107, align 8
  %108 = load ptr, ptr %4, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = load ptr, ptr %5, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = call double @pow(double noundef %110, double noundef %113) #8
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 1
  store double %114, ptr %116, align 8
  br label %1511

117:                                              ; preds = %100, %95
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %140

122:                                              ; preds = %117
  %123 = load ptr, ptr %5, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = icmp eq i32 %125, 1
  br i1 %126, label %127, label %140

127:                                              ; preds = %122
  %128 = load ptr, ptr %6, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 0
  store i32 1, ptr %129, align 8
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load i32, ptr %131, align 8
  %133 = sitofp i32 %132 to double
  %134 = load ptr, ptr %5, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load double, ptr %135, align 8
  %137 = call double @pow(double noundef %133, double noundef %136) #8
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 1
  store double %137, ptr %139, align 8
  br label %1510

140:                                              ; preds = %122, %117
  %141 = load ptr, ptr %4, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 0
  %143 = load i32, ptr %142, align 8
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %163

145:                                              ; preds = %140
  %146 = load ptr, ptr %5, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %163

150:                                              ; preds = %145
  %151 = load ptr, ptr %6, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 0
  store i32 1, ptr %152, align 8
  %153 = load ptr, ptr %4, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load double, ptr %154, align 8
  %156 = load ptr, ptr %5, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load i32, ptr %157, align 8
  %159 = sitofp i32 %158 to double
  %160 = call double @pow(double noundef %155, double noundef %159) #8
  %161 = load ptr, ptr %6, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  store double %160, ptr %162, align 8
  br label %1509

163:                                              ; preds = %145, %140
  %164 = load ptr, ptr %4, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 0
  %166 = load i32, ptr %165, align 8
  %167 = icmp eq i32 %166, 3
  br i1 %167, label %168, label %186

168:                                              ; preds = %163
  %169 = load ptr, ptr %5, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %186

173:                                              ; preds = %168
  %174 = load ptr, ptr %6, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 0
  store i32 3, ptr %175, align 8
  %176 = load ptr, ptr %4, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load double, ptr %177, align 8
  %179 = load ptr, ptr %5, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load i32, ptr %180, align 8
  %182 = sitofp i32 %181 to double
  %183 = call double @pow(double noundef %178, double noundef %182) #8
  %184 = load ptr, ptr %6, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  store double %183, ptr %185, align 8
  br label %1508

186:                                              ; preds = %168, %163
  %187 = load ptr, ptr %4, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 0
  %189 = load i32, ptr %188, align 8
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %209

191:                                              ; preds = %186
  %192 = load ptr, ptr %5, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 3
  br i1 %195, label %196, label %209

196:                                              ; preds = %191
  %197 = load ptr, ptr %6, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 0
  store i32 3, ptr %198, align 8
  %199 = load ptr, ptr %4, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  %201 = load i32, ptr %200, align 8
  %202 = sitofp i32 %201 to double
  %203 = load ptr, ptr %5, align 8
  %204 = getelementptr inbounds %struct.CalcLangVal, ptr %203, i32 0, i32 1
  %205 = load double, ptr %204, align 8
  %206 = call double @pow(double noundef %202, double noundef %205) #8
  %207 = load ptr, ptr %6, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 1
  store double %206, ptr %208, align 8
  br label %1507

209:                                              ; preds = %191, %186
  %210 = load ptr, ptr %4, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 0
  %212 = load i32, ptr %211, align 8
  %213 = icmp eq i32 %212, 1
  br i1 %213, label %214, label %231

214:                                              ; preds = %209
  %215 = load ptr, ptr %5, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 0
  %217 = load i32, ptr %216, align 8
  %218 = icmp eq i32 %217, 3
  br i1 %218, label %219, label %231

219:                                              ; preds = %214
  %220 = load ptr, ptr %6, align 8
  %221 = getelementptr inbounds %struct.CalcLangVal, ptr %220, i32 0, i32 0
  store i32 3, ptr %221, align 8
  %222 = load ptr, ptr %4, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 1
  %224 = load double, ptr %223, align 8
  %225 = load ptr, ptr %5, align 8
  %226 = getelementptr inbounds %struct.CalcLangVal, ptr %225, i32 0, i32 1
  %227 = load double, ptr %226, align 8
  %228 = call double @pow(double noundef %224, double noundef %227) #8
  %229 = load ptr, ptr %6, align 8
  %230 = getelementptr inbounds %struct.CalcLangVal, ptr %229, i32 0, i32 1
  store double %228, ptr %230, align 8
  br label %1506

231:                                              ; preds = %214, %209
  %232 = load ptr, ptr %4, align 8
  %233 = getelementptr inbounds %struct.CalcLangVal, ptr %232, i32 0, i32 0
  %234 = load i32, ptr %233, align 8
  %235 = icmp eq i32 %234, 3
  br i1 %235, label %236, label %253

236:                                              ; preds = %231
  %237 = load ptr, ptr %5, align 8
  %238 = getelementptr inbounds %struct.CalcLangVal, ptr %237, i32 0, i32 0
  %239 = load i32, ptr %238, align 8
  %240 = icmp eq i32 %239, 1
  br i1 %240, label %241, label %253

241:                                              ; preds = %236
  %242 = load ptr, ptr %6, align 8
  %243 = getelementptr inbounds %struct.CalcLangVal, ptr %242, i32 0, i32 0
  store i32 3, ptr %243, align 8
  %244 = load ptr, ptr %4, align 8
  %245 = getelementptr inbounds %struct.CalcLangVal, ptr %244, i32 0, i32 1
  %246 = load double, ptr %245, align 8
  %247 = load ptr, ptr %5, align 8
  %248 = getelementptr inbounds %struct.CalcLangVal, ptr %247, i32 0, i32 1
  %249 = load double, ptr %248, align 8
  %250 = call double @pow(double noundef %246, double noundef %249) #8
  %251 = load ptr, ptr %6, align 8
  %252 = getelementptr inbounds %struct.CalcLangVal, ptr %251, i32 0, i32 1
  store double %250, ptr %252, align 8
  br label %1505

253:                                              ; preds = %236, %231
  %254 = load ptr, ptr %4, align 8
  %255 = getelementptr inbounds %struct.CalcLangVal, ptr %254, i32 0, i32 0
  %256 = load i32, ptr %255, align 8
  %257 = icmp eq i32 %256, 4
  br i1 %257, label %258, label %276

258:                                              ; preds = %253
  %259 = load ptr, ptr %5, align 8
  %260 = getelementptr inbounds %struct.CalcLangVal, ptr %259, i32 0, i32 0
  %261 = load i32, ptr %260, align 8
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %276

263:                                              ; preds = %258
  %264 = load ptr, ptr %6, align 8
  %265 = getelementptr inbounds %struct.CalcLangVal, ptr %264, i32 0, i32 0
  store i32 4, ptr %265, align 8
  %266 = load ptr, ptr %4, align 8
  %267 = getelementptr inbounds %struct.CalcLangVal, ptr %266, i32 0, i32 1
  %268 = load double, ptr %267, align 8
  %269 = load ptr, ptr %5, align 8
  %270 = getelementptr inbounds %struct.CalcLangVal, ptr %269, i32 0, i32 1
  %271 = load i32, ptr %270, align 8
  %272 = sitofp i32 %271 to double
  %273 = call double @pow(double noundef %268, double noundef %272) #8
  %274 = load ptr, ptr %6, align 8
  %275 = getelementptr inbounds %struct.CalcLangVal, ptr %274, i32 0, i32 1
  store double %273, ptr %275, align 8
  br label %1504

276:                                              ; preds = %258, %253
  %277 = load ptr, ptr %4, align 8
  %278 = getelementptr inbounds %struct.CalcLangVal, ptr %277, i32 0, i32 0
  %279 = load i32, ptr %278, align 8
  %280 = icmp eq i32 %279, 0
  br i1 %280, label %281, label %299

281:                                              ; preds = %276
  %282 = load ptr, ptr %5, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 0
  %284 = load i32, ptr %283, align 8
  %285 = icmp eq i32 %284, 4
  br i1 %285, label %286, label %299

286:                                              ; preds = %281
  %287 = load ptr, ptr %6, align 8
  %288 = getelementptr inbounds %struct.CalcLangVal, ptr %287, i32 0, i32 0
  store i32 4, ptr %288, align 8
  %289 = load ptr, ptr %4, align 8
  %290 = getelementptr inbounds %struct.CalcLangVal, ptr %289, i32 0, i32 1
  %291 = load i32, ptr %290, align 8
  %292 = sitofp i32 %291 to double
  %293 = load ptr, ptr %5, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = load double, ptr %294, align 8
  %296 = call double @pow(double noundef %292, double noundef %295) #8
  %297 = load ptr, ptr %6, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 1
  store double %296, ptr %298, align 8
  br label %1503

299:                                              ; preds = %281, %276
  %300 = load ptr, ptr %4, align 8
  %301 = getelementptr inbounds %struct.CalcLangVal, ptr %300, i32 0, i32 0
  %302 = load i32, ptr %301, align 8
  %303 = icmp eq i32 %302, 1
  br i1 %303, label %304, label %321

304:                                              ; preds = %299
  %305 = load ptr, ptr %5, align 8
  %306 = getelementptr inbounds %struct.CalcLangVal, ptr %305, i32 0, i32 0
  %307 = load i32, ptr %306, align 8
  %308 = icmp eq i32 %307, 4
  br i1 %308, label %309, label %321

309:                                              ; preds = %304
  %310 = load ptr, ptr %6, align 8
  %311 = getelementptr inbounds %struct.CalcLangVal, ptr %310, i32 0, i32 0
  store i32 4, ptr %311, align 8
  %312 = load ptr, ptr %4, align 8
  %313 = getelementptr inbounds %struct.CalcLangVal, ptr %312, i32 0, i32 1
  %314 = load double, ptr %313, align 8
  %315 = load ptr, ptr %5, align 8
  %316 = getelementptr inbounds %struct.CalcLangVal, ptr %315, i32 0, i32 1
  %317 = load double, ptr %316, align 8
  %318 = call double @pow(double noundef %314, double noundef %317) #8
  %319 = load ptr, ptr %6, align 8
  %320 = getelementptr inbounds %struct.CalcLangVal, ptr %319, i32 0, i32 1
  store double %318, ptr %320, align 8
  br label %1502

321:                                              ; preds = %304, %299
  %322 = load ptr, ptr %4, align 8
  %323 = getelementptr inbounds %struct.CalcLangVal, ptr %322, i32 0, i32 0
  %324 = load i32, ptr %323, align 8
  %325 = icmp eq i32 %324, 4
  br i1 %325, label %326, label %343

326:                                              ; preds = %321
  %327 = load ptr, ptr %5, align 8
  %328 = getelementptr inbounds %struct.CalcLangVal, ptr %327, i32 0, i32 0
  %329 = load i32, ptr %328, align 8
  %330 = icmp eq i32 %329, 1
  br i1 %330, label %331, label %343

331:                                              ; preds = %326
  %332 = load ptr, ptr %6, align 8
  %333 = getelementptr inbounds %struct.CalcLangVal, ptr %332, i32 0, i32 0
  store i32 4, ptr %333, align 8
  %334 = load ptr, ptr %4, align 8
  %335 = getelementptr inbounds %struct.CalcLangVal, ptr %334, i32 0, i32 1
  %336 = load double, ptr %335, align 8
  %337 = load ptr, ptr %5, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 1
  %339 = load double, ptr %338, align 8
  %340 = call double @pow(double noundef %336, double noundef %339) #8
  %341 = load ptr, ptr %6, align 8
  %342 = getelementptr inbounds %struct.CalcLangVal, ptr %341, i32 0, i32 1
  store double %340, ptr %342, align 8
  br label %1501

343:                                              ; preds = %326, %321
  %344 = load ptr, ptr %4, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = icmp eq i32 %346, 4
  br i1 %347, label %348, label %365

348:                                              ; preds = %343
  %349 = load ptr, ptr %5, align 8
  %350 = getelementptr inbounds %struct.CalcLangVal, ptr %349, i32 0, i32 0
  %351 = load i32, ptr %350, align 8
  %352 = icmp eq i32 %351, 4
  br i1 %352, label %353, label %365

353:                                              ; preds = %348
  %354 = load ptr, ptr %6, align 8
  %355 = getelementptr inbounds %struct.CalcLangVal, ptr %354, i32 0, i32 0
  store i32 4, ptr %355, align 8
  %356 = load ptr, ptr %4, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load double, ptr %357, align 8
  %359 = load ptr, ptr %5, align 8
  %360 = getelementptr inbounds %struct.CalcLangVal, ptr %359, i32 0, i32 1
  %361 = load double, ptr %360, align 8
  %362 = call double @pow(double noundef %358, double noundef %361) #8
  %363 = load ptr, ptr %6, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 1
  store double %362, ptr %364, align 8
  br label %1500

365:                                              ; preds = %348, %343
  %366 = load ptr, ptr %4, align 8
  %367 = getelementptr inbounds %struct.CalcLangVal, ptr %366, i32 0, i32 0
  %368 = load i32, ptr %367, align 8
  %369 = icmp eq i32 %368, 7
  br i1 %369, label %370, label %443

370:                                              ; preds = %365
  %371 = load ptr, ptr %5, align 8
  %372 = getelementptr inbounds %struct.CalcLangVal, ptr %371, i32 0, i32 0
  %373 = load i32, ptr %372, align 8
  %374 = icmp eq i32 %373, 7
  br i1 %374, label %375, label %443

375:                                              ; preds = %370
  %376 = load ptr, ptr %4, align 8
  %377 = getelementptr inbounds %struct.CalcLangVal, ptr %376, i32 0, i32 1
  %378 = load ptr, ptr %377, align 8
  store ptr %378, ptr %7, align 8
  %379 = load ptr, ptr %5, align 8
  %380 = getelementptr inbounds %struct.CalcLangVal, ptr %379, i32 0, i32 1
  %381 = load ptr, ptr %380, align 8
  store ptr %381, ptr %8, align 8
  %382 = load ptr, ptr %8, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 0
  %384 = load i32, ptr %383, align 8
  %385 = load ptr, ptr %7, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = icmp eq i32 %384, %387
  br i1 %388, label %389, label %441

389:                                              ; preds = %375
  %390 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %390, ptr %9, align 8
  %391 = load ptr, ptr %7, align 8
  %392 = getelementptr inbounds %struct.TupleValue, ptr %391, i32 0, i32 0
  %393 = load i32, ptr %392, align 8
  %394 = load ptr, ptr %9, align 8
  %395 = getelementptr inbounds %struct.TupleValue, ptr %394, i32 0, i32 0
  store i32 %393, ptr %395, align 8
  %396 = load ptr, ptr %9, align 8
  %397 = getelementptr inbounds %struct.TupleValue, ptr %396, i32 0, i32 0
  %398 = load i32, ptr %397, align 8
  %399 = sext i32 %398 to i64
  %400 = mul i64 8, %399
  %401 = call noalias ptr @malloc(i64 noundef %400) #6
  %402 = load ptr, ptr %9, align 8
  %403 = getelementptr inbounds %struct.TupleValue, ptr %402, i32 0, i32 1
  store ptr %401, ptr %403, align 8
  store i32 0, ptr %10, align 4
  br label %404

404:                                              ; preds = %432, %389
  %405 = load i32, ptr %10, align 4
  %406 = load ptr, ptr %7, align 8
  %407 = getelementptr inbounds %struct.TupleValue, ptr %406, i32 0, i32 0
  %408 = load i32, ptr %407, align 8
  %409 = icmp slt i32 %405, %408
  br i1 %409, label %410, label %435

410:                                              ; preds = %404
  %411 = load ptr, ptr %7, align 8
  %412 = getelementptr inbounds %struct.TupleValue, ptr %411, i32 0, i32 1
  %413 = load ptr, ptr %412, align 8
  %414 = load i32, ptr %10, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds ptr, ptr %413, i64 %415
  %417 = load ptr, ptr %416, align 8
  %418 = load ptr, ptr %8, align 8
  %419 = getelementptr inbounds %struct.TupleValue, ptr %418, i32 0, i32 1
  %420 = load ptr, ptr %419, align 8
  %421 = load i32, ptr %10, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds ptr, ptr %420, i64 %422
  %424 = load ptr, ptr %423, align 8
  %425 = call ptr @multCalcLangValues(ptr noundef %417, ptr noundef %424)
  %426 = load ptr, ptr %9, align 8
  %427 = getelementptr inbounds %struct.TupleValue, ptr %426, i32 0, i32 1
  %428 = load ptr, ptr %427, align 8
  %429 = load i32, ptr %10, align 4
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds ptr, ptr %428, i64 %430
  store ptr %425, ptr %431, align 8
  br label %432

432:                                              ; preds = %410
  %433 = load i32, ptr %10, align 4
  %434 = add nsw i32 %433, 1
  store i32 %434, ptr %10, align 4
  br label %404, !llvm.loop !81

435:                                              ; preds = %404
  %436 = load ptr, ptr %6, align 8
  %437 = getelementptr inbounds %struct.CalcLangVal, ptr %436, i32 0, i32 0
  store i32 7, ptr %437, align 8
  %438 = load ptr, ptr %9, align 8
  %439 = load ptr, ptr %6, align 8
  %440 = getelementptr inbounds %struct.CalcLangVal, ptr %439, i32 0, i32 1
  store ptr %438, ptr %440, align 8
  br label %442

441:                                              ; preds = %375
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1516

442:                                              ; preds = %435
  br label %1499

443:                                              ; preds = %370, %365
  %444 = load ptr, ptr %4, align 8
  %445 = getelementptr inbounds %struct.CalcLangVal, ptr %444, i32 0, i32 0
  %446 = load i32, ptr %445, align 8
  %447 = icmp eq i32 %446, 7
  br i1 %447, label %448, label %503

448:                                              ; preds = %443
  %449 = load ptr, ptr %5, align 8
  %450 = getelementptr inbounds %struct.CalcLangVal, ptr %449, i32 0, i32 0
  %451 = load i32, ptr %450, align 8
  %452 = icmp eq i32 %451, 0
  br i1 %452, label %453, label %503

453:                                              ; preds = %448
  %454 = load ptr, ptr %4, align 8
  %455 = getelementptr inbounds %struct.CalcLangVal, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  store ptr %456, ptr %11, align 8
  %457 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %457, ptr %12, align 8
  %458 = load ptr, ptr %11, align 8
  %459 = getelementptr inbounds %struct.TupleValue, ptr %458, i32 0, i32 0
  %460 = load i32, ptr %459, align 8
  %461 = load ptr, ptr %12, align 8
  %462 = getelementptr inbounds %struct.TupleValue, ptr %461, i32 0, i32 0
  store i32 %460, ptr %462, align 8
  %463 = load ptr, ptr %12, align 8
  %464 = getelementptr inbounds %struct.TupleValue, ptr %463, i32 0, i32 0
  %465 = load i32, ptr %464, align 8
  %466 = sext i32 %465 to i64
  %467 = mul i64 8, %466
  %468 = call noalias ptr @malloc(i64 noundef %467) #6
  %469 = load ptr, ptr %12, align 8
  %470 = getelementptr inbounds %struct.TupleValue, ptr %469, i32 0, i32 1
  store ptr %468, ptr %470, align 8
  store i32 0, ptr %13, align 4
  br label %471

471:                                              ; preds = %494, %453
  %472 = load i32, ptr %13, align 4
  %473 = load ptr, ptr %11, align 8
  %474 = getelementptr inbounds %struct.TupleValue, ptr %473, i32 0, i32 0
  %475 = load i32, ptr %474, align 8
  %476 = icmp slt i32 %472, %475
  br i1 %476, label %477, label %497

477:                                              ; preds = %471
  %478 = load ptr, ptr %11, align 8
  %479 = getelementptr inbounds %struct.TupleValue, ptr %478, i32 0, i32 1
  %480 = load ptr, ptr %479, align 8
  %481 = load i32, ptr %13, align 4
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds ptr, ptr %480, i64 %482
  %484 = load ptr, ptr %483, align 8
  %485 = load ptr, ptr %5, align 8
  %486 = call ptr @copyValue(ptr noundef %485)
  %487 = call ptr @powCalcLangValues(ptr noundef %484, ptr noundef %486)
  %488 = load ptr, ptr %12, align 8
  %489 = getelementptr inbounds %struct.TupleValue, ptr %488, i32 0, i32 1
  %490 = load ptr, ptr %489, align 8
  %491 = load i32, ptr %13, align 4
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds ptr, ptr %490, i64 %492
  store ptr %487, ptr %493, align 8
  br label %494

494:                                              ; preds = %477
  %495 = load i32, ptr %13, align 4
  %496 = add nsw i32 %495, 1
  store i32 %496, ptr %13, align 4
  br label %471, !llvm.loop !82

497:                                              ; preds = %471
  %498 = load ptr, ptr %6, align 8
  %499 = getelementptr inbounds %struct.CalcLangVal, ptr %498, i32 0, i32 0
  store i32 7, ptr %499, align 8
  %500 = load ptr, ptr %12, align 8
  %501 = load ptr, ptr %6, align 8
  %502 = getelementptr inbounds %struct.CalcLangVal, ptr %501, i32 0, i32 1
  store ptr %500, ptr %502, align 8
  br label %1498

503:                                              ; preds = %448, %443
  %504 = load ptr, ptr %4, align 8
  %505 = getelementptr inbounds %struct.CalcLangVal, ptr %504, i32 0, i32 0
  %506 = load i32, ptr %505, align 8
  %507 = icmp eq i32 %506, 0
  br i1 %507, label %508, label %563

508:                                              ; preds = %503
  %509 = load ptr, ptr %5, align 8
  %510 = getelementptr inbounds %struct.CalcLangVal, ptr %509, i32 0, i32 0
  %511 = load i32, ptr %510, align 8
  %512 = icmp eq i32 %511, 7
  br i1 %512, label %513, label %563

513:                                              ; preds = %508
  %514 = load ptr, ptr %5, align 8
  %515 = getelementptr inbounds %struct.CalcLangVal, ptr %514, i32 0, i32 1
  %516 = load ptr, ptr %515, align 8
  store ptr %516, ptr %14, align 8
  %517 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %517, ptr %15, align 8
  %518 = load ptr, ptr %14, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 0
  %520 = load i32, ptr %519, align 8
  %521 = load ptr, ptr %15, align 8
  %522 = getelementptr inbounds %struct.TupleValue, ptr %521, i32 0, i32 0
  store i32 %520, ptr %522, align 8
  %523 = load ptr, ptr %15, align 8
  %524 = getelementptr inbounds %struct.TupleValue, ptr %523, i32 0, i32 0
  %525 = load i32, ptr %524, align 8
  %526 = sext i32 %525 to i64
  %527 = mul i64 8, %526
  %528 = call noalias ptr @malloc(i64 noundef %527) #6
  %529 = load ptr, ptr %15, align 8
  %530 = getelementptr inbounds %struct.TupleValue, ptr %529, i32 0, i32 1
  store ptr %528, ptr %530, align 8
  store i32 0, ptr %16, align 4
  br label %531

531:                                              ; preds = %554, %513
  %532 = load i32, ptr %16, align 4
  %533 = load ptr, ptr %14, align 8
  %534 = getelementptr inbounds %struct.TupleValue, ptr %533, i32 0, i32 0
  %535 = load i32, ptr %534, align 8
  %536 = icmp slt i32 %532, %535
  br i1 %536, label %537, label %557

537:                                              ; preds = %531
  %538 = load ptr, ptr %4, align 8
  %539 = call ptr @copyValue(ptr noundef %538)
  %540 = load ptr, ptr %14, align 8
  %541 = getelementptr inbounds %struct.TupleValue, ptr %540, i32 0, i32 1
  %542 = load ptr, ptr %541, align 8
  %543 = load i32, ptr %16, align 4
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds ptr, ptr %542, i64 %544
  %546 = load ptr, ptr %545, align 8
  %547 = call ptr @powCalcLangValues(ptr noundef %539, ptr noundef %546)
  %548 = load ptr, ptr %15, align 8
  %549 = getelementptr inbounds %struct.TupleValue, ptr %548, i32 0, i32 1
  %550 = load ptr, ptr %549, align 8
  %551 = load i32, ptr %16, align 4
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds ptr, ptr %550, i64 %552
  store ptr %547, ptr %553, align 8
  br label %554

554:                                              ; preds = %537
  %555 = load i32, ptr %16, align 4
  %556 = add nsw i32 %555, 1
  store i32 %556, ptr %16, align 4
  br label %531, !llvm.loop !83

557:                                              ; preds = %531
  %558 = load ptr, ptr %6, align 8
  %559 = getelementptr inbounds %struct.CalcLangVal, ptr %558, i32 0, i32 0
  store i32 7, ptr %559, align 8
  %560 = load ptr, ptr %15, align 8
  %561 = load ptr, ptr %6, align 8
  %562 = getelementptr inbounds %struct.CalcLangVal, ptr %561, i32 0, i32 1
  store ptr %560, ptr %562, align 8
  br label %1497

563:                                              ; preds = %508, %503
  %564 = load ptr, ptr %4, align 8
  %565 = getelementptr inbounds %struct.CalcLangVal, ptr %564, i32 0, i32 0
  %566 = load i32, ptr %565, align 8
  %567 = icmp eq i32 %566, 7
  br i1 %567, label %568, label %623

568:                                              ; preds = %563
  %569 = load ptr, ptr %5, align 8
  %570 = getelementptr inbounds %struct.CalcLangVal, ptr %569, i32 0, i32 0
  %571 = load i32, ptr %570, align 8
  %572 = icmp eq i32 %571, 1
  br i1 %572, label %573, label %623

573:                                              ; preds = %568
  %574 = load ptr, ptr %4, align 8
  %575 = getelementptr inbounds %struct.CalcLangVal, ptr %574, i32 0, i32 1
  %576 = load ptr, ptr %575, align 8
  store ptr %576, ptr %17, align 8
  %577 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %577, ptr %18, align 8
  %578 = load ptr, ptr %17, align 8
  %579 = getelementptr inbounds %struct.TupleValue, ptr %578, i32 0, i32 0
  %580 = load i32, ptr %579, align 8
  %581 = load ptr, ptr %18, align 8
  %582 = getelementptr inbounds %struct.TupleValue, ptr %581, i32 0, i32 0
  store i32 %580, ptr %582, align 8
  %583 = load ptr, ptr %18, align 8
  %584 = getelementptr inbounds %struct.TupleValue, ptr %583, i32 0, i32 0
  %585 = load i32, ptr %584, align 8
  %586 = sext i32 %585 to i64
  %587 = mul i64 8, %586
  %588 = call noalias ptr @malloc(i64 noundef %587) #6
  %589 = load ptr, ptr %18, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 1
  store ptr %588, ptr %590, align 8
  store i32 0, ptr %19, align 4
  br label %591

591:                                              ; preds = %614, %573
  %592 = load i32, ptr %19, align 4
  %593 = load ptr, ptr %17, align 8
  %594 = getelementptr inbounds %struct.TupleValue, ptr %593, i32 0, i32 0
  %595 = load i32, ptr %594, align 8
  %596 = icmp slt i32 %592, %595
  br i1 %596, label %597, label %617

597:                                              ; preds = %591
  %598 = load ptr, ptr %17, align 8
  %599 = getelementptr inbounds %struct.TupleValue, ptr %598, i32 0, i32 1
  %600 = load ptr, ptr %599, align 8
  %601 = load i32, ptr %19, align 4
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds ptr, ptr %600, i64 %602
  %604 = load ptr, ptr %603, align 8
  %605 = load ptr, ptr %5, align 8
  %606 = call ptr @copyValue(ptr noundef %605)
  %607 = call ptr @powCalcLangValues(ptr noundef %604, ptr noundef %606)
  %608 = load ptr, ptr %18, align 8
  %609 = getelementptr inbounds %struct.TupleValue, ptr %608, i32 0, i32 1
  %610 = load ptr, ptr %609, align 8
  %611 = load i32, ptr %19, align 4
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds ptr, ptr %610, i64 %612
  store ptr %607, ptr %613, align 8
  br label %614

614:                                              ; preds = %597
  %615 = load i32, ptr %19, align 4
  %616 = add nsw i32 %615, 1
  store i32 %616, ptr %19, align 4
  br label %591, !llvm.loop !84

617:                                              ; preds = %591
  %618 = load ptr, ptr %6, align 8
  %619 = getelementptr inbounds %struct.CalcLangVal, ptr %618, i32 0, i32 0
  store i32 7, ptr %619, align 8
  %620 = load ptr, ptr %18, align 8
  %621 = load ptr, ptr %6, align 8
  %622 = getelementptr inbounds %struct.CalcLangVal, ptr %621, i32 0, i32 1
  store ptr %620, ptr %622, align 8
  br label %1496

623:                                              ; preds = %568, %563
  %624 = load ptr, ptr %4, align 8
  %625 = getelementptr inbounds %struct.CalcLangVal, ptr %624, i32 0, i32 0
  %626 = load i32, ptr %625, align 8
  %627 = icmp eq i32 %626, 1
  br i1 %627, label %628, label %683

628:                                              ; preds = %623
  %629 = load ptr, ptr %5, align 8
  %630 = getelementptr inbounds %struct.CalcLangVal, ptr %629, i32 0, i32 0
  %631 = load i32, ptr %630, align 8
  %632 = icmp eq i32 %631, 7
  br i1 %632, label %633, label %683

633:                                              ; preds = %628
  %634 = load ptr, ptr %5, align 8
  %635 = getelementptr inbounds %struct.CalcLangVal, ptr %634, i32 0, i32 1
  %636 = load ptr, ptr %635, align 8
  store ptr %636, ptr %20, align 8
  %637 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %637, ptr %21, align 8
  %638 = load ptr, ptr %20, align 8
  %639 = getelementptr inbounds %struct.TupleValue, ptr %638, i32 0, i32 0
  %640 = load i32, ptr %639, align 8
  %641 = load ptr, ptr %21, align 8
  %642 = getelementptr inbounds %struct.TupleValue, ptr %641, i32 0, i32 0
  store i32 %640, ptr %642, align 8
  %643 = load ptr, ptr %21, align 8
  %644 = getelementptr inbounds %struct.TupleValue, ptr %643, i32 0, i32 0
  %645 = load i32, ptr %644, align 8
  %646 = sext i32 %645 to i64
  %647 = mul i64 8, %646
  %648 = call noalias ptr @malloc(i64 noundef %647) #6
  %649 = load ptr, ptr %21, align 8
  %650 = getelementptr inbounds %struct.TupleValue, ptr %649, i32 0, i32 1
  store ptr %648, ptr %650, align 8
  store i32 0, ptr %22, align 4
  br label %651

651:                                              ; preds = %674, %633
  %652 = load i32, ptr %22, align 4
  %653 = load ptr, ptr %20, align 8
  %654 = getelementptr inbounds %struct.TupleValue, ptr %653, i32 0, i32 0
  %655 = load i32, ptr %654, align 8
  %656 = icmp slt i32 %652, %655
  br i1 %656, label %657, label %677

657:                                              ; preds = %651
  %658 = load ptr, ptr %4, align 8
  %659 = call ptr @copyValue(ptr noundef %658)
  %660 = load ptr, ptr %20, align 8
  %661 = getelementptr inbounds %struct.TupleValue, ptr %660, i32 0, i32 1
  %662 = load ptr, ptr %661, align 8
  %663 = load i32, ptr %22, align 4
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds ptr, ptr %662, i64 %664
  %666 = load ptr, ptr %665, align 8
  %667 = call ptr @powCalcLangValues(ptr noundef %659, ptr noundef %666)
  %668 = load ptr, ptr %21, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  %670 = load ptr, ptr %669, align 8
  %671 = load i32, ptr %22, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds ptr, ptr %670, i64 %672
  store ptr %667, ptr %673, align 8
  br label %674

674:                                              ; preds = %657
  %675 = load i32, ptr %22, align 4
  %676 = add nsw i32 %675, 1
  store i32 %676, ptr %22, align 4
  br label %651, !llvm.loop !85

677:                                              ; preds = %651
  %678 = load ptr, ptr %6, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 0
  store i32 7, ptr %679, align 8
  %680 = load ptr, ptr %21, align 8
  %681 = load ptr, ptr %6, align 8
  %682 = getelementptr inbounds %struct.CalcLangVal, ptr %681, i32 0, i32 1
  store ptr %680, ptr %682, align 8
  br label %1495

683:                                              ; preds = %628, %623
  %684 = load ptr, ptr %4, align 8
  %685 = getelementptr inbounds %struct.CalcLangVal, ptr %684, i32 0, i32 0
  %686 = load i32, ptr %685, align 8
  %687 = icmp eq i32 %686, 7
  br i1 %687, label %688, label %743

688:                                              ; preds = %683
  %689 = load ptr, ptr %5, align 8
  %690 = getelementptr inbounds %struct.CalcLangVal, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = icmp eq i32 %691, 3
  br i1 %692, label %693, label %743

693:                                              ; preds = %688
  %694 = load ptr, ptr %4, align 8
  %695 = getelementptr inbounds %struct.CalcLangVal, ptr %694, i32 0, i32 1
  %696 = load ptr, ptr %695, align 8
  store ptr %696, ptr %23, align 8
  %697 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %697, ptr %24, align 8
  %698 = load ptr, ptr %23, align 8
  %699 = getelementptr inbounds %struct.TupleValue, ptr %698, i32 0, i32 0
  %700 = load i32, ptr %699, align 8
  %701 = load ptr, ptr %24, align 8
  %702 = getelementptr inbounds %struct.TupleValue, ptr %701, i32 0, i32 0
  store i32 %700, ptr %702, align 8
  %703 = load ptr, ptr %24, align 8
  %704 = getelementptr inbounds %struct.TupleValue, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = sext i32 %705 to i64
  %707 = mul i64 8, %706
  %708 = call noalias ptr @malloc(i64 noundef %707) #6
  %709 = load ptr, ptr %24, align 8
  %710 = getelementptr inbounds %struct.TupleValue, ptr %709, i32 0, i32 1
  store ptr %708, ptr %710, align 8
  store i32 0, ptr %25, align 4
  br label %711

711:                                              ; preds = %734, %693
  %712 = load i32, ptr %25, align 4
  %713 = load ptr, ptr %23, align 8
  %714 = getelementptr inbounds %struct.TupleValue, ptr %713, i32 0, i32 0
  %715 = load i32, ptr %714, align 8
  %716 = icmp slt i32 %712, %715
  br i1 %716, label %717, label %737

717:                                              ; preds = %711
  %718 = load ptr, ptr %23, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 1
  %720 = load ptr, ptr %719, align 8
  %721 = load i32, ptr %25, align 4
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds ptr, ptr %720, i64 %722
  %724 = load ptr, ptr %723, align 8
  %725 = load ptr, ptr %5, align 8
  %726 = call ptr @copyValue(ptr noundef %725)
  %727 = call ptr @powCalcLangValues(ptr noundef %724, ptr noundef %726)
  %728 = load ptr, ptr %24, align 8
  %729 = getelementptr inbounds %struct.TupleValue, ptr %728, i32 0, i32 1
  %730 = load ptr, ptr %729, align 8
  %731 = load i32, ptr %25, align 4
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds ptr, ptr %730, i64 %732
  store ptr %727, ptr %733, align 8
  br label %734

734:                                              ; preds = %717
  %735 = load i32, ptr %25, align 4
  %736 = add nsw i32 %735, 1
  store i32 %736, ptr %25, align 4
  br label %711, !llvm.loop !86

737:                                              ; preds = %711
  %738 = load ptr, ptr %6, align 8
  %739 = getelementptr inbounds %struct.CalcLangVal, ptr %738, i32 0, i32 0
  store i32 7, ptr %739, align 8
  %740 = load ptr, ptr %24, align 8
  %741 = load ptr, ptr %6, align 8
  %742 = getelementptr inbounds %struct.CalcLangVal, ptr %741, i32 0, i32 1
  store ptr %740, ptr %742, align 8
  br label %1494

743:                                              ; preds = %688, %683
  %744 = load ptr, ptr %4, align 8
  %745 = getelementptr inbounds %struct.CalcLangVal, ptr %744, i32 0, i32 0
  %746 = load i32, ptr %745, align 8
  %747 = icmp eq i32 %746, 3
  br i1 %747, label %748, label %803

748:                                              ; preds = %743
  %749 = load ptr, ptr %5, align 8
  %750 = getelementptr inbounds %struct.CalcLangVal, ptr %749, i32 0, i32 0
  %751 = load i32, ptr %750, align 8
  %752 = icmp eq i32 %751, 7
  br i1 %752, label %753, label %803

753:                                              ; preds = %748
  %754 = load ptr, ptr %5, align 8
  %755 = getelementptr inbounds %struct.CalcLangVal, ptr %754, i32 0, i32 1
  %756 = load ptr, ptr %755, align 8
  store ptr %756, ptr %26, align 8
  %757 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %757, ptr %27, align 8
  %758 = load ptr, ptr %26, align 8
  %759 = getelementptr inbounds %struct.TupleValue, ptr %758, i32 0, i32 0
  %760 = load i32, ptr %759, align 8
  %761 = load ptr, ptr %27, align 8
  %762 = getelementptr inbounds %struct.TupleValue, ptr %761, i32 0, i32 0
  store i32 %760, ptr %762, align 8
  %763 = load ptr, ptr %27, align 8
  %764 = getelementptr inbounds %struct.TupleValue, ptr %763, i32 0, i32 0
  %765 = load i32, ptr %764, align 8
  %766 = sext i32 %765 to i64
  %767 = mul i64 8, %766
  %768 = call noalias ptr @malloc(i64 noundef %767) #6
  %769 = load ptr, ptr %27, align 8
  %770 = getelementptr inbounds %struct.TupleValue, ptr %769, i32 0, i32 1
  store ptr %768, ptr %770, align 8
  store i32 0, ptr %28, align 4
  br label %771

771:                                              ; preds = %794, %753
  %772 = load i32, ptr %28, align 4
  %773 = load ptr, ptr %26, align 8
  %774 = getelementptr inbounds %struct.TupleValue, ptr %773, i32 0, i32 0
  %775 = load i32, ptr %774, align 8
  %776 = icmp slt i32 %772, %775
  br i1 %776, label %777, label %797

777:                                              ; preds = %771
  %778 = load ptr, ptr %4, align 8
  %779 = call ptr @copyValue(ptr noundef %778)
  %780 = load ptr, ptr %26, align 8
  %781 = getelementptr inbounds %struct.TupleValue, ptr %780, i32 0, i32 1
  %782 = load ptr, ptr %781, align 8
  %783 = load i32, ptr %28, align 4
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds ptr, ptr %782, i64 %784
  %786 = load ptr, ptr %785, align 8
  %787 = call ptr @powCalcLangValues(ptr noundef %779, ptr noundef %786)
  %788 = load ptr, ptr %27, align 8
  %789 = getelementptr inbounds %struct.TupleValue, ptr %788, i32 0, i32 1
  %790 = load ptr, ptr %789, align 8
  %791 = load i32, ptr %28, align 4
  %792 = sext i32 %791 to i64
  %793 = getelementptr inbounds ptr, ptr %790, i64 %792
  store ptr %787, ptr %793, align 8
  br label %794

794:                                              ; preds = %777
  %795 = load i32, ptr %28, align 4
  %796 = add nsw i32 %795, 1
  store i32 %796, ptr %28, align 4
  br label %771, !llvm.loop !87

797:                                              ; preds = %771
  %798 = load ptr, ptr %6, align 8
  %799 = getelementptr inbounds %struct.CalcLangVal, ptr %798, i32 0, i32 0
  store i32 7, ptr %799, align 8
  %800 = load ptr, ptr %27, align 8
  %801 = load ptr, ptr %6, align 8
  %802 = getelementptr inbounds %struct.CalcLangVal, ptr %801, i32 0, i32 1
  store ptr %800, ptr %802, align 8
  br label %1493

803:                                              ; preds = %748, %743
  %804 = load ptr, ptr %4, align 8
  %805 = getelementptr inbounds %struct.CalcLangVal, ptr %804, i32 0, i32 0
  %806 = load i32, ptr %805, align 8
  %807 = icmp eq i32 %806, 7
  br i1 %807, label %808, label %863

808:                                              ; preds = %803
  %809 = load ptr, ptr %5, align 8
  %810 = getelementptr inbounds %struct.CalcLangVal, ptr %809, i32 0, i32 0
  %811 = load i32, ptr %810, align 8
  %812 = icmp eq i32 %811, 4
  br i1 %812, label %813, label %863

813:                                              ; preds = %808
  %814 = load ptr, ptr %4, align 8
  %815 = getelementptr inbounds %struct.CalcLangVal, ptr %814, i32 0, i32 1
  %816 = load ptr, ptr %815, align 8
  store ptr %816, ptr %29, align 8
  %817 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %817, ptr %30, align 8
  %818 = load ptr, ptr %29, align 8
  %819 = getelementptr inbounds %struct.TupleValue, ptr %818, i32 0, i32 0
  %820 = load i32, ptr %819, align 8
  %821 = load ptr, ptr %30, align 8
  %822 = getelementptr inbounds %struct.TupleValue, ptr %821, i32 0, i32 0
  store i32 %820, ptr %822, align 8
  %823 = load ptr, ptr %30, align 8
  %824 = getelementptr inbounds %struct.TupleValue, ptr %823, i32 0, i32 0
  %825 = load i32, ptr %824, align 8
  %826 = sext i32 %825 to i64
  %827 = mul i64 8, %826
  %828 = call noalias ptr @malloc(i64 noundef %827) #6
  %829 = load ptr, ptr %30, align 8
  %830 = getelementptr inbounds %struct.TupleValue, ptr %829, i32 0, i32 1
  store ptr %828, ptr %830, align 8
  store i32 0, ptr %31, align 4
  br label %831

831:                                              ; preds = %854, %813
  %832 = load i32, ptr %31, align 4
  %833 = load ptr, ptr %29, align 8
  %834 = getelementptr inbounds %struct.TupleValue, ptr %833, i32 0, i32 0
  %835 = load i32, ptr %834, align 8
  %836 = icmp slt i32 %832, %835
  br i1 %836, label %837, label %857

837:                                              ; preds = %831
  %838 = load ptr, ptr %29, align 8
  %839 = getelementptr inbounds %struct.TupleValue, ptr %838, i32 0, i32 1
  %840 = load ptr, ptr %839, align 8
  %841 = load i32, ptr %31, align 4
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds ptr, ptr %840, i64 %842
  %844 = load ptr, ptr %843, align 8
  %845 = load ptr, ptr %5, align 8
  %846 = call ptr @copyValue(ptr noundef %845)
  %847 = call ptr @powCalcLangValues(ptr noundef %844, ptr noundef %846)
  %848 = load ptr, ptr %30, align 8
  %849 = getelementptr inbounds %struct.TupleValue, ptr %848, i32 0, i32 1
  %850 = load ptr, ptr %849, align 8
  %851 = load i32, ptr %31, align 4
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds ptr, ptr %850, i64 %852
  store ptr %847, ptr %853, align 8
  br label %854

854:                                              ; preds = %837
  %855 = load i32, ptr %31, align 4
  %856 = add nsw i32 %855, 1
  store i32 %856, ptr %31, align 4
  br label %831, !llvm.loop !88

857:                                              ; preds = %831
  %858 = load ptr, ptr %6, align 8
  %859 = getelementptr inbounds %struct.CalcLangVal, ptr %858, i32 0, i32 0
  store i32 7, ptr %859, align 8
  %860 = load ptr, ptr %30, align 8
  %861 = load ptr, ptr %6, align 8
  %862 = getelementptr inbounds %struct.CalcLangVal, ptr %861, i32 0, i32 1
  store ptr %860, ptr %862, align 8
  br label %1492

863:                                              ; preds = %808, %803
  %864 = load ptr, ptr %4, align 8
  %865 = getelementptr inbounds %struct.CalcLangVal, ptr %864, i32 0, i32 0
  %866 = load i32, ptr %865, align 8
  %867 = icmp eq i32 %866, 4
  br i1 %867, label %868, label %923

868:                                              ; preds = %863
  %869 = load ptr, ptr %5, align 8
  %870 = getelementptr inbounds %struct.CalcLangVal, ptr %869, i32 0, i32 0
  %871 = load i32, ptr %870, align 8
  %872 = icmp eq i32 %871, 7
  br i1 %872, label %873, label %923

873:                                              ; preds = %868
  %874 = load ptr, ptr %5, align 8
  %875 = getelementptr inbounds %struct.CalcLangVal, ptr %874, i32 0, i32 1
  %876 = load ptr, ptr %875, align 8
  store ptr %876, ptr %32, align 8
  %877 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %877, ptr %33, align 8
  %878 = load ptr, ptr %32, align 8
  %879 = getelementptr inbounds %struct.TupleValue, ptr %878, i32 0, i32 0
  %880 = load i32, ptr %879, align 8
  %881 = load ptr, ptr %33, align 8
  %882 = getelementptr inbounds %struct.TupleValue, ptr %881, i32 0, i32 0
  store i32 %880, ptr %882, align 8
  %883 = load ptr, ptr %33, align 8
  %884 = getelementptr inbounds %struct.TupleValue, ptr %883, i32 0, i32 0
  %885 = load i32, ptr %884, align 8
  %886 = sext i32 %885 to i64
  %887 = mul i64 8, %886
  %888 = call noalias ptr @malloc(i64 noundef %887) #6
  %889 = load ptr, ptr %33, align 8
  %890 = getelementptr inbounds %struct.TupleValue, ptr %889, i32 0, i32 1
  store ptr %888, ptr %890, align 8
  store i32 0, ptr %34, align 4
  br label %891

891:                                              ; preds = %914, %873
  %892 = load i32, ptr %34, align 4
  %893 = load ptr, ptr %32, align 8
  %894 = getelementptr inbounds %struct.TupleValue, ptr %893, i32 0, i32 0
  %895 = load i32, ptr %894, align 8
  %896 = icmp slt i32 %892, %895
  br i1 %896, label %897, label %917

897:                                              ; preds = %891
  %898 = load ptr, ptr %4, align 8
  %899 = call ptr @copyValue(ptr noundef %898)
  %900 = load ptr, ptr %32, align 8
  %901 = getelementptr inbounds %struct.TupleValue, ptr %900, i32 0, i32 1
  %902 = load ptr, ptr %901, align 8
  %903 = load i32, ptr %34, align 4
  %904 = sext i32 %903 to i64
  %905 = getelementptr inbounds ptr, ptr %902, i64 %904
  %906 = load ptr, ptr %905, align 8
  %907 = call ptr @powCalcLangValues(ptr noundef %899, ptr noundef %906)
  %908 = load ptr, ptr %33, align 8
  %909 = getelementptr inbounds %struct.TupleValue, ptr %908, i32 0, i32 1
  %910 = load ptr, ptr %909, align 8
  %911 = load i32, ptr %34, align 4
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds ptr, ptr %910, i64 %912
  store ptr %907, ptr %913, align 8
  br label %914

914:                                              ; preds = %897
  %915 = load i32, ptr %34, align 4
  %916 = add nsw i32 %915, 1
  store i32 %916, ptr %34, align 4
  br label %891, !llvm.loop !89

917:                                              ; preds = %891
  %918 = load ptr, ptr %6, align 8
  %919 = getelementptr inbounds %struct.CalcLangVal, ptr %918, i32 0, i32 0
  store i32 7, ptr %919, align 8
  %920 = load ptr, ptr %33, align 8
  %921 = load ptr, ptr %6, align 8
  %922 = getelementptr inbounds %struct.CalcLangVal, ptr %921, i32 0, i32 1
  store ptr %920, ptr %922, align 8
  br label %1491

923:                                              ; preds = %868, %863
  %924 = load ptr, ptr %4, align 8
  %925 = getelementptr inbounds %struct.CalcLangVal, ptr %924, i32 0, i32 0
  %926 = load i32, ptr %925, align 8
  %927 = icmp eq i32 %926, 6
  br i1 %927, label %928, label %1001

928:                                              ; preds = %923
  %929 = load ptr, ptr %5, align 8
  %930 = getelementptr inbounds %struct.CalcLangVal, ptr %929, i32 0, i32 0
  %931 = load i32, ptr %930, align 8
  %932 = icmp eq i32 %931, 6
  br i1 %932, label %933, label %1001

933:                                              ; preds = %928
  %934 = load ptr, ptr %4, align 8
  %935 = getelementptr inbounds %struct.CalcLangVal, ptr %934, i32 0, i32 1
  %936 = load ptr, ptr %935, align 8
  store ptr %936, ptr %35, align 8
  %937 = load ptr, ptr %5, align 8
  %938 = getelementptr inbounds %struct.CalcLangVal, ptr %937, i32 0, i32 1
  %939 = load ptr, ptr %938, align 8
  store ptr %939, ptr %36, align 8
  %940 = load ptr, ptr %36, align 8
  %941 = getelementptr inbounds %struct.SetValue, ptr %940, i32 0, i32 0
  %942 = load i32, ptr %941, align 8
  %943 = load ptr, ptr %35, align 8
  %944 = getelementptr inbounds %struct.SetValue, ptr %943, i32 0, i32 0
  %945 = load i32, ptr %944, align 8
  %946 = icmp eq i32 %942, %945
  br i1 %946, label %947, label %999

947:                                              ; preds = %933
  %948 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %948, ptr %37, align 8
  %949 = load ptr, ptr %35, align 8
  %950 = getelementptr inbounds %struct.SetValue, ptr %949, i32 0, i32 0
  %951 = load i32, ptr %950, align 8
  %952 = load ptr, ptr %37, align 8
  %953 = getelementptr inbounds %struct.SetValue, ptr %952, i32 0, i32 0
  store i32 %951, ptr %953, align 8
  %954 = load ptr, ptr %37, align 8
  %955 = getelementptr inbounds %struct.SetValue, ptr %954, i32 0, i32 0
  %956 = load i32, ptr %955, align 8
  %957 = sext i32 %956 to i64
  %958 = mul i64 8, %957
  %959 = call noalias ptr @malloc(i64 noundef %958) #6
  %960 = load ptr, ptr %37, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 1
  store ptr %959, ptr %961, align 8
  store i32 0, ptr %38, align 4
  br label %962

962:                                              ; preds = %990, %947
  %963 = load i32, ptr %38, align 4
  %964 = load ptr, ptr %35, align 8
  %965 = getelementptr inbounds %struct.SetValue, ptr %964, i32 0, i32 0
  %966 = load i32, ptr %965, align 8
  %967 = icmp slt i32 %963, %966
  br i1 %967, label %968, label %993

968:                                              ; preds = %962
  %969 = load ptr, ptr %35, align 8
  %970 = getelementptr inbounds %struct.SetValue, ptr %969, i32 0, i32 1
  %971 = load ptr, ptr %970, align 8
  %972 = load i32, ptr %38, align 4
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds ptr, ptr %971, i64 %973
  %975 = load ptr, ptr %974, align 8
  %976 = load ptr, ptr %36, align 8
  %977 = getelementptr inbounds %struct.SetValue, ptr %976, i32 0, i32 1
  %978 = load ptr, ptr %977, align 8
  %979 = load i32, ptr %38, align 4
  %980 = sext i32 %979 to i64
  %981 = getelementptr inbounds ptr, ptr %978, i64 %980
  %982 = load ptr, ptr %981, align 8
  %983 = call ptr @powCalcLangValues(ptr noundef %975, ptr noundef %982)
  %984 = load ptr, ptr %37, align 8
  %985 = getelementptr inbounds %struct.SetValue, ptr %984, i32 0, i32 1
  %986 = load ptr, ptr %985, align 8
  %987 = load i32, ptr %38, align 4
  %988 = sext i32 %987 to i64
  %989 = getelementptr inbounds ptr, ptr %986, i64 %988
  store ptr %983, ptr %989, align 8
  br label %990

990:                                              ; preds = %968
  %991 = load i32, ptr %38, align 4
  %992 = add nsw i32 %991, 1
  store i32 %992, ptr %38, align 4
  br label %962, !llvm.loop !90

993:                                              ; preds = %962
  %994 = load ptr, ptr %6, align 8
  %995 = getelementptr inbounds %struct.CalcLangVal, ptr %994, i32 0, i32 0
  store i32 6, ptr %995, align 8
  %996 = load ptr, ptr %37, align 8
  %997 = load ptr, ptr %6, align 8
  %998 = getelementptr inbounds %struct.CalcLangVal, ptr %997, i32 0, i32 1
  store ptr %996, ptr %998, align 8
  br label %1000

999:                                              ; preds = %933
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %1516

1000:                                             ; preds = %993
  br label %1490

1001:                                             ; preds = %928, %923
  %1002 = load ptr, ptr %4, align 8
  %1003 = getelementptr inbounds %struct.CalcLangVal, ptr %1002, i32 0, i32 0
  %1004 = load i32, ptr %1003, align 8
  %1005 = icmp eq i32 %1004, 6
  br i1 %1005, label %1006, label %1061

1006:                                             ; preds = %1001
  %1007 = load ptr, ptr %5, align 8
  %1008 = getelementptr inbounds %struct.CalcLangVal, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp eq i32 %1009, 0
  br i1 %1010, label %1011, label %1061

1011:                                             ; preds = %1006
  %1012 = load ptr, ptr %4, align 8
  %1013 = getelementptr inbounds %struct.CalcLangVal, ptr %1012, i32 0, i32 1
  %1014 = load ptr, ptr %1013, align 8
  store ptr %1014, ptr %39, align 8
  %1015 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1015, ptr %40, align 8
  %1016 = load ptr, ptr %39, align 8
  %1017 = getelementptr inbounds %struct.SetValue, ptr %1016, i32 0, i32 0
  %1018 = load i32, ptr %1017, align 8
  %1019 = load ptr, ptr %40, align 8
  %1020 = getelementptr inbounds %struct.SetValue, ptr %1019, i32 0, i32 0
  store i32 %1018, ptr %1020, align 8
  %1021 = load ptr, ptr %40, align 8
  %1022 = getelementptr inbounds %struct.SetValue, ptr %1021, i32 0, i32 0
  %1023 = load i32, ptr %1022, align 8
  %1024 = sext i32 %1023 to i64
  %1025 = mul i64 8, %1024
  %1026 = call noalias ptr @malloc(i64 noundef %1025) #6
  %1027 = load ptr, ptr %40, align 8
  %1028 = getelementptr inbounds %struct.SetValue, ptr %1027, i32 0, i32 1
  store ptr %1026, ptr %1028, align 8
  store i32 0, ptr %41, align 4
  br label %1029

1029:                                             ; preds = %1052, %1011
  %1030 = load i32, ptr %41, align 4
  %1031 = load ptr, ptr %39, align 8
  %1032 = getelementptr inbounds %struct.SetValue, ptr %1031, i32 0, i32 0
  %1033 = load i32, ptr %1032, align 8
  %1034 = icmp slt i32 %1030, %1033
  br i1 %1034, label %1035, label %1055

1035:                                             ; preds = %1029
  %1036 = load ptr, ptr %39, align 8
  %1037 = getelementptr inbounds %struct.SetValue, ptr %1036, i32 0, i32 1
  %1038 = load ptr, ptr %1037, align 8
  %1039 = load i32, ptr %41, align 4
  %1040 = sext i32 %1039 to i64
  %1041 = getelementptr inbounds ptr, ptr %1038, i64 %1040
  %1042 = load ptr, ptr %1041, align 8
  %1043 = load ptr, ptr %5, align 8
  %1044 = call ptr @copyValue(ptr noundef %1043)
  %1045 = call ptr @powCalcLangValues(ptr noundef %1042, ptr noundef %1044)
  %1046 = load ptr, ptr %40, align 8
  %1047 = getelementptr inbounds %struct.SetValue, ptr %1046, i32 0, i32 1
  %1048 = load ptr, ptr %1047, align 8
  %1049 = load i32, ptr %41, align 4
  %1050 = sext i32 %1049 to i64
  %1051 = getelementptr inbounds ptr, ptr %1048, i64 %1050
  store ptr %1045, ptr %1051, align 8
  br label %1052

1052:                                             ; preds = %1035
  %1053 = load i32, ptr %41, align 4
  %1054 = add nsw i32 %1053, 1
  store i32 %1054, ptr %41, align 4
  br label %1029, !llvm.loop !91

1055:                                             ; preds = %1029
  %1056 = load ptr, ptr %6, align 8
  %1057 = getelementptr inbounds %struct.CalcLangVal, ptr %1056, i32 0, i32 0
  store i32 6, ptr %1057, align 8
  %1058 = load ptr, ptr %40, align 8
  %1059 = load ptr, ptr %6, align 8
  %1060 = getelementptr inbounds %struct.CalcLangVal, ptr %1059, i32 0, i32 1
  store ptr %1058, ptr %1060, align 8
  br label %1489

1061:                                             ; preds = %1006, %1001
  %1062 = load ptr, ptr %4, align 8
  %1063 = getelementptr inbounds %struct.CalcLangVal, ptr %1062, i32 0, i32 0
  %1064 = load i32, ptr %1063, align 8
  %1065 = icmp eq i32 %1064, 0
  br i1 %1065, label %1066, label %1121

1066:                                             ; preds = %1061
  %1067 = load ptr, ptr %5, align 8
  %1068 = getelementptr inbounds %struct.CalcLangVal, ptr %1067, i32 0, i32 0
  %1069 = load i32, ptr %1068, align 8
  %1070 = icmp eq i32 %1069, 6
  br i1 %1070, label %1071, label %1121

1071:                                             ; preds = %1066
  %1072 = load ptr, ptr %5, align 8
  %1073 = getelementptr inbounds %struct.CalcLangVal, ptr %1072, i32 0, i32 1
  %1074 = load ptr, ptr %1073, align 8
  store ptr %1074, ptr %42, align 8
  %1075 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1075, ptr %43, align 8
  %1076 = load ptr, ptr %42, align 8
  %1077 = getelementptr inbounds %struct.SetValue, ptr %1076, i32 0, i32 0
  %1078 = load i32, ptr %1077, align 8
  %1079 = load ptr, ptr %43, align 8
  %1080 = getelementptr inbounds %struct.SetValue, ptr %1079, i32 0, i32 0
  store i32 %1078, ptr %1080, align 8
  %1081 = load ptr, ptr %43, align 8
  %1082 = getelementptr inbounds %struct.SetValue, ptr %1081, i32 0, i32 0
  %1083 = load i32, ptr %1082, align 8
  %1084 = sext i32 %1083 to i64
  %1085 = mul i64 8, %1084
  %1086 = call noalias ptr @malloc(i64 noundef %1085) #6
  %1087 = load ptr, ptr %43, align 8
  %1088 = getelementptr inbounds %struct.SetValue, ptr %1087, i32 0, i32 1
  store ptr %1086, ptr %1088, align 8
  store i32 0, ptr %44, align 4
  br label %1089

1089:                                             ; preds = %1112, %1071
  %1090 = load i32, ptr %44, align 4
  %1091 = load ptr, ptr %42, align 8
  %1092 = getelementptr inbounds %struct.SetValue, ptr %1091, i32 0, i32 0
  %1093 = load i32, ptr %1092, align 8
  %1094 = icmp slt i32 %1090, %1093
  br i1 %1094, label %1095, label %1115

1095:                                             ; preds = %1089
  %1096 = load ptr, ptr %4, align 8
  %1097 = call ptr @copyValue(ptr noundef %1096)
  %1098 = load ptr, ptr %42, align 8
  %1099 = getelementptr inbounds %struct.SetValue, ptr %1098, i32 0, i32 1
  %1100 = load ptr, ptr %1099, align 8
  %1101 = load i32, ptr %44, align 4
  %1102 = sext i32 %1101 to i64
  %1103 = getelementptr inbounds ptr, ptr %1100, i64 %1102
  %1104 = load ptr, ptr %1103, align 8
  %1105 = call ptr @powCalcLangValues(ptr noundef %1097, ptr noundef %1104)
  %1106 = load ptr, ptr %43, align 8
  %1107 = getelementptr inbounds %struct.SetValue, ptr %1106, i32 0, i32 1
  %1108 = load ptr, ptr %1107, align 8
  %1109 = load i32, ptr %44, align 4
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds ptr, ptr %1108, i64 %1110
  store ptr %1105, ptr %1111, align 8
  br label %1112

1112:                                             ; preds = %1095
  %1113 = load i32, ptr %44, align 4
  %1114 = add nsw i32 %1113, 1
  store i32 %1114, ptr %44, align 4
  br label %1089, !llvm.loop !92

1115:                                             ; preds = %1089
  %1116 = load ptr, ptr %6, align 8
  %1117 = getelementptr inbounds %struct.CalcLangVal, ptr %1116, i32 0, i32 0
  store i32 6, ptr %1117, align 8
  %1118 = load ptr, ptr %43, align 8
  %1119 = load ptr, ptr %6, align 8
  %1120 = getelementptr inbounds %struct.CalcLangVal, ptr %1119, i32 0, i32 1
  store ptr %1118, ptr %1120, align 8
  br label %1488

1121:                                             ; preds = %1066, %1061
  %1122 = load ptr, ptr %4, align 8
  %1123 = getelementptr inbounds %struct.CalcLangVal, ptr %1122, i32 0, i32 0
  %1124 = load i32, ptr %1123, align 8
  %1125 = icmp eq i32 %1124, 6
  br i1 %1125, label %1126, label %1181

1126:                                             ; preds = %1121
  %1127 = load ptr, ptr %5, align 8
  %1128 = getelementptr inbounds %struct.CalcLangVal, ptr %1127, i32 0, i32 0
  %1129 = load i32, ptr %1128, align 8
  %1130 = icmp eq i32 %1129, 1
  br i1 %1130, label %1131, label %1181

1131:                                             ; preds = %1126
  %1132 = load ptr, ptr %4, align 8
  %1133 = getelementptr inbounds %struct.CalcLangVal, ptr %1132, i32 0, i32 1
  %1134 = load ptr, ptr %1133, align 8
  store ptr %1134, ptr %45, align 8
  %1135 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1135, ptr %46, align 8
  %1136 = load ptr, ptr %45, align 8
  %1137 = getelementptr inbounds %struct.SetValue, ptr %1136, i32 0, i32 0
  %1138 = load i32, ptr %1137, align 8
  %1139 = load ptr, ptr %46, align 8
  %1140 = getelementptr inbounds %struct.SetValue, ptr %1139, i32 0, i32 0
  store i32 %1138, ptr %1140, align 8
  %1141 = load ptr, ptr %46, align 8
  %1142 = getelementptr inbounds %struct.SetValue, ptr %1141, i32 0, i32 0
  %1143 = load i32, ptr %1142, align 8
  %1144 = sext i32 %1143 to i64
  %1145 = mul i64 8, %1144
  %1146 = call noalias ptr @malloc(i64 noundef %1145) #6
  %1147 = load ptr, ptr %46, align 8
  %1148 = getelementptr inbounds %struct.SetValue, ptr %1147, i32 0, i32 1
  store ptr %1146, ptr %1148, align 8
  store i32 0, ptr %47, align 4
  br label %1149

1149:                                             ; preds = %1172, %1131
  %1150 = load i32, ptr %47, align 4
  %1151 = load ptr, ptr %45, align 8
  %1152 = getelementptr inbounds %struct.SetValue, ptr %1151, i32 0, i32 0
  %1153 = load i32, ptr %1152, align 8
  %1154 = icmp slt i32 %1150, %1153
  br i1 %1154, label %1155, label %1175

1155:                                             ; preds = %1149
  %1156 = load ptr, ptr %45, align 8
  %1157 = getelementptr inbounds %struct.SetValue, ptr %1156, i32 0, i32 1
  %1158 = load ptr, ptr %1157, align 8
  %1159 = load i32, ptr %47, align 4
  %1160 = sext i32 %1159 to i64
  %1161 = getelementptr inbounds ptr, ptr %1158, i64 %1160
  %1162 = load ptr, ptr %1161, align 8
  %1163 = load ptr, ptr %5, align 8
  %1164 = call ptr @copyValue(ptr noundef %1163)
  %1165 = call ptr @powCalcLangValues(ptr noundef %1162, ptr noundef %1164)
  %1166 = load ptr, ptr %46, align 8
  %1167 = getelementptr inbounds %struct.SetValue, ptr %1166, i32 0, i32 1
  %1168 = load ptr, ptr %1167, align 8
  %1169 = load i32, ptr %47, align 4
  %1170 = sext i32 %1169 to i64
  %1171 = getelementptr inbounds ptr, ptr %1168, i64 %1170
  store ptr %1165, ptr %1171, align 8
  br label %1172

1172:                                             ; preds = %1155
  %1173 = load i32, ptr %47, align 4
  %1174 = add nsw i32 %1173, 1
  store i32 %1174, ptr %47, align 4
  br label %1149, !llvm.loop !93

1175:                                             ; preds = %1149
  %1176 = load ptr, ptr %6, align 8
  %1177 = getelementptr inbounds %struct.CalcLangVal, ptr %1176, i32 0, i32 0
  store i32 7, ptr %1177, align 8
  %1178 = load ptr, ptr %46, align 8
  %1179 = load ptr, ptr %6, align 8
  %1180 = getelementptr inbounds %struct.CalcLangVal, ptr %1179, i32 0, i32 1
  store ptr %1178, ptr %1180, align 8
  br label %1487

1181:                                             ; preds = %1126, %1121
  %1182 = load ptr, ptr %4, align 8
  %1183 = getelementptr inbounds %struct.CalcLangVal, ptr %1182, i32 0, i32 0
  %1184 = load i32, ptr %1183, align 8
  %1185 = icmp eq i32 %1184, 1
  br i1 %1185, label %1186, label %1241

1186:                                             ; preds = %1181
  %1187 = load ptr, ptr %5, align 8
  %1188 = getelementptr inbounds %struct.CalcLangVal, ptr %1187, i32 0, i32 0
  %1189 = load i32, ptr %1188, align 8
  %1190 = icmp eq i32 %1189, 6
  br i1 %1190, label %1191, label %1241

1191:                                             ; preds = %1186
  %1192 = load ptr, ptr %5, align 8
  %1193 = getelementptr inbounds %struct.CalcLangVal, ptr %1192, i32 0, i32 1
  %1194 = load ptr, ptr %1193, align 8
  store ptr %1194, ptr %48, align 8
  %1195 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1195, ptr %49, align 8
  %1196 = load ptr, ptr %48, align 8
  %1197 = getelementptr inbounds %struct.SetValue, ptr %1196, i32 0, i32 0
  %1198 = load i32, ptr %1197, align 8
  %1199 = load ptr, ptr %49, align 8
  %1200 = getelementptr inbounds %struct.SetValue, ptr %1199, i32 0, i32 0
  store i32 %1198, ptr %1200, align 8
  %1201 = load ptr, ptr %49, align 8
  %1202 = getelementptr inbounds %struct.SetValue, ptr %1201, i32 0, i32 0
  %1203 = load i32, ptr %1202, align 8
  %1204 = sext i32 %1203 to i64
  %1205 = mul i64 8, %1204
  %1206 = call noalias ptr @malloc(i64 noundef %1205) #6
  %1207 = load ptr, ptr %49, align 8
  %1208 = getelementptr inbounds %struct.SetValue, ptr %1207, i32 0, i32 1
  store ptr %1206, ptr %1208, align 8
  store i32 0, ptr %50, align 4
  br label %1209

1209:                                             ; preds = %1232, %1191
  %1210 = load i32, ptr %50, align 4
  %1211 = load ptr, ptr %48, align 8
  %1212 = getelementptr inbounds %struct.SetValue, ptr %1211, i32 0, i32 0
  %1213 = load i32, ptr %1212, align 8
  %1214 = icmp slt i32 %1210, %1213
  br i1 %1214, label %1215, label %1235

1215:                                             ; preds = %1209
  %1216 = load ptr, ptr %4, align 8
  %1217 = call ptr @copyValue(ptr noundef %1216)
  %1218 = load ptr, ptr %48, align 8
  %1219 = getelementptr inbounds %struct.SetValue, ptr %1218, i32 0, i32 1
  %1220 = load ptr, ptr %1219, align 8
  %1221 = load i32, ptr %50, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = getelementptr inbounds ptr, ptr %1220, i64 %1222
  %1224 = load ptr, ptr %1223, align 8
  %1225 = call ptr @powCalcLangValues(ptr noundef %1217, ptr noundef %1224)
  %1226 = load ptr, ptr %49, align 8
  %1227 = getelementptr inbounds %struct.SetValue, ptr %1226, i32 0, i32 1
  %1228 = load ptr, ptr %1227, align 8
  %1229 = load i32, ptr %50, align 4
  %1230 = sext i32 %1229 to i64
  %1231 = getelementptr inbounds ptr, ptr %1228, i64 %1230
  store ptr %1225, ptr %1231, align 8
  br label %1232

1232:                                             ; preds = %1215
  %1233 = load i32, ptr %50, align 4
  %1234 = add nsw i32 %1233, 1
  store i32 %1234, ptr %50, align 4
  br label %1209, !llvm.loop !94

1235:                                             ; preds = %1209
  %1236 = load ptr, ptr %6, align 8
  %1237 = getelementptr inbounds %struct.CalcLangVal, ptr %1236, i32 0, i32 0
  store i32 6, ptr %1237, align 8
  %1238 = load ptr, ptr %49, align 8
  %1239 = load ptr, ptr %6, align 8
  %1240 = getelementptr inbounds %struct.CalcLangVal, ptr %1239, i32 0, i32 1
  store ptr %1238, ptr %1240, align 8
  br label %1486

1241:                                             ; preds = %1186, %1181
  %1242 = load ptr, ptr %4, align 8
  %1243 = getelementptr inbounds %struct.CalcLangVal, ptr %1242, i32 0, i32 0
  %1244 = load i32, ptr %1243, align 8
  %1245 = icmp eq i32 %1244, 6
  br i1 %1245, label %1246, label %1301

1246:                                             ; preds = %1241
  %1247 = load ptr, ptr %5, align 8
  %1248 = getelementptr inbounds %struct.CalcLangVal, ptr %1247, i32 0, i32 0
  %1249 = load i32, ptr %1248, align 8
  %1250 = icmp eq i32 %1249, 3
  br i1 %1250, label %1251, label %1301

1251:                                             ; preds = %1246
  %1252 = load ptr, ptr %4, align 8
  %1253 = getelementptr inbounds %struct.CalcLangVal, ptr %1252, i32 0, i32 1
  %1254 = load ptr, ptr %1253, align 8
  store ptr %1254, ptr %51, align 8
  %1255 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1255, ptr %52, align 8
  %1256 = load ptr, ptr %51, align 8
  %1257 = getelementptr inbounds %struct.SetValue, ptr %1256, i32 0, i32 0
  %1258 = load i32, ptr %1257, align 8
  %1259 = load ptr, ptr %52, align 8
  %1260 = getelementptr inbounds %struct.SetValue, ptr %1259, i32 0, i32 0
  store i32 %1258, ptr %1260, align 8
  %1261 = load ptr, ptr %52, align 8
  %1262 = getelementptr inbounds %struct.SetValue, ptr %1261, i32 0, i32 0
  %1263 = load i32, ptr %1262, align 8
  %1264 = sext i32 %1263 to i64
  %1265 = mul i64 8, %1264
  %1266 = call noalias ptr @malloc(i64 noundef %1265) #6
  %1267 = load ptr, ptr %52, align 8
  %1268 = getelementptr inbounds %struct.SetValue, ptr %1267, i32 0, i32 1
  store ptr %1266, ptr %1268, align 8
  store i32 0, ptr %53, align 4
  br label %1269

1269:                                             ; preds = %1292, %1251
  %1270 = load i32, ptr %53, align 4
  %1271 = load ptr, ptr %51, align 8
  %1272 = getelementptr inbounds %struct.SetValue, ptr %1271, i32 0, i32 0
  %1273 = load i32, ptr %1272, align 8
  %1274 = icmp slt i32 %1270, %1273
  br i1 %1274, label %1275, label %1295

1275:                                             ; preds = %1269
  %1276 = load ptr, ptr %51, align 8
  %1277 = getelementptr inbounds %struct.SetValue, ptr %1276, i32 0, i32 1
  %1278 = load ptr, ptr %1277, align 8
  %1279 = load i32, ptr %53, align 4
  %1280 = sext i32 %1279 to i64
  %1281 = getelementptr inbounds ptr, ptr %1278, i64 %1280
  %1282 = load ptr, ptr %1281, align 8
  %1283 = load ptr, ptr %5, align 8
  %1284 = call ptr @copyValue(ptr noundef %1283)
  %1285 = call ptr @powCalcLangValues(ptr noundef %1282, ptr noundef %1284)
  %1286 = load ptr, ptr %52, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 1
  %1288 = load ptr, ptr %1287, align 8
  %1289 = load i32, ptr %53, align 4
  %1290 = sext i32 %1289 to i64
  %1291 = getelementptr inbounds ptr, ptr %1288, i64 %1290
  store ptr %1285, ptr %1291, align 8
  br label %1292

1292:                                             ; preds = %1275
  %1293 = load i32, ptr %53, align 4
  %1294 = add nsw i32 %1293, 1
  store i32 %1294, ptr %53, align 4
  br label %1269, !llvm.loop !95

1295:                                             ; preds = %1269
  %1296 = load ptr, ptr %6, align 8
  %1297 = getelementptr inbounds %struct.CalcLangVal, ptr %1296, i32 0, i32 0
  store i32 6, ptr %1297, align 8
  %1298 = load ptr, ptr %52, align 8
  %1299 = load ptr, ptr %6, align 8
  %1300 = getelementptr inbounds %struct.CalcLangVal, ptr %1299, i32 0, i32 1
  store ptr %1298, ptr %1300, align 8
  br label %1485

1301:                                             ; preds = %1246, %1241
  %1302 = load ptr, ptr %4, align 8
  %1303 = getelementptr inbounds %struct.CalcLangVal, ptr %1302, i32 0, i32 0
  %1304 = load i32, ptr %1303, align 8
  %1305 = icmp eq i32 %1304, 3
  br i1 %1305, label %1306, label %1361

1306:                                             ; preds = %1301
  %1307 = load ptr, ptr %5, align 8
  %1308 = getelementptr inbounds %struct.CalcLangVal, ptr %1307, i32 0, i32 0
  %1309 = load i32, ptr %1308, align 8
  %1310 = icmp eq i32 %1309, 6
  br i1 %1310, label %1311, label %1361

1311:                                             ; preds = %1306
  %1312 = load ptr, ptr %5, align 8
  %1313 = getelementptr inbounds %struct.CalcLangVal, ptr %1312, i32 0, i32 1
  %1314 = load ptr, ptr %1313, align 8
  store ptr %1314, ptr %54, align 8
  %1315 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1315, ptr %55, align 8
  %1316 = load ptr, ptr %54, align 8
  %1317 = getelementptr inbounds %struct.SetValue, ptr %1316, i32 0, i32 0
  %1318 = load i32, ptr %1317, align 8
  %1319 = load ptr, ptr %55, align 8
  %1320 = getelementptr inbounds %struct.SetValue, ptr %1319, i32 0, i32 0
  store i32 %1318, ptr %1320, align 8
  %1321 = load ptr, ptr %55, align 8
  %1322 = getelementptr inbounds %struct.SetValue, ptr %1321, i32 0, i32 0
  %1323 = load i32, ptr %1322, align 8
  %1324 = sext i32 %1323 to i64
  %1325 = mul i64 8, %1324
  %1326 = call noalias ptr @malloc(i64 noundef %1325) #6
  %1327 = load ptr, ptr %55, align 8
  %1328 = getelementptr inbounds %struct.SetValue, ptr %1327, i32 0, i32 1
  store ptr %1326, ptr %1328, align 8
  store i32 0, ptr %56, align 4
  br label %1329

1329:                                             ; preds = %1352, %1311
  %1330 = load i32, ptr %56, align 4
  %1331 = load ptr, ptr %54, align 8
  %1332 = getelementptr inbounds %struct.SetValue, ptr %1331, i32 0, i32 0
  %1333 = load i32, ptr %1332, align 8
  %1334 = icmp slt i32 %1330, %1333
  br i1 %1334, label %1335, label %1355

1335:                                             ; preds = %1329
  %1336 = load ptr, ptr %4, align 8
  %1337 = call ptr @copyValue(ptr noundef %1336)
  %1338 = load ptr, ptr %54, align 8
  %1339 = getelementptr inbounds %struct.SetValue, ptr %1338, i32 0, i32 1
  %1340 = load ptr, ptr %1339, align 8
  %1341 = load i32, ptr %56, align 4
  %1342 = sext i32 %1341 to i64
  %1343 = getelementptr inbounds ptr, ptr %1340, i64 %1342
  %1344 = load ptr, ptr %1343, align 8
  %1345 = call ptr @powCalcLangValues(ptr noundef %1337, ptr noundef %1344)
  %1346 = load ptr, ptr %55, align 8
  %1347 = getelementptr inbounds %struct.SetValue, ptr %1346, i32 0, i32 1
  %1348 = load ptr, ptr %1347, align 8
  %1349 = load i32, ptr %56, align 4
  %1350 = sext i32 %1349 to i64
  %1351 = getelementptr inbounds ptr, ptr %1348, i64 %1350
  store ptr %1345, ptr %1351, align 8
  br label %1352

1352:                                             ; preds = %1335
  %1353 = load i32, ptr %56, align 4
  %1354 = add nsw i32 %1353, 1
  store i32 %1354, ptr %56, align 4
  br label %1329, !llvm.loop !96

1355:                                             ; preds = %1329
  %1356 = load ptr, ptr %6, align 8
  %1357 = getelementptr inbounds %struct.CalcLangVal, ptr %1356, i32 0, i32 0
  store i32 6, ptr %1357, align 8
  %1358 = load ptr, ptr %55, align 8
  %1359 = load ptr, ptr %6, align 8
  %1360 = getelementptr inbounds %struct.CalcLangVal, ptr %1359, i32 0, i32 1
  store ptr %1358, ptr %1360, align 8
  br label %1484

1361:                                             ; preds = %1306, %1301
  %1362 = load ptr, ptr %4, align 8
  %1363 = getelementptr inbounds %struct.CalcLangVal, ptr %1362, i32 0, i32 0
  %1364 = load i32, ptr %1363, align 8
  %1365 = icmp eq i32 %1364, 6
  br i1 %1365, label %1366, label %1421

1366:                                             ; preds = %1361
  %1367 = load ptr, ptr %5, align 8
  %1368 = getelementptr inbounds %struct.CalcLangVal, ptr %1367, i32 0, i32 0
  %1369 = load i32, ptr %1368, align 8
  %1370 = icmp eq i32 %1369, 4
  br i1 %1370, label %1371, label %1421

1371:                                             ; preds = %1366
  %1372 = load ptr, ptr %4, align 8
  %1373 = getelementptr inbounds %struct.CalcLangVal, ptr %1372, i32 0, i32 1
  %1374 = load ptr, ptr %1373, align 8
  store ptr %1374, ptr %57, align 8
  %1375 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1375, ptr %58, align 8
  %1376 = load ptr, ptr %57, align 8
  %1377 = getelementptr inbounds %struct.SetValue, ptr %1376, i32 0, i32 0
  %1378 = load i32, ptr %1377, align 8
  %1379 = load ptr, ptr %58, align 8
  %1380 = getelementptr inbounds %struct.SetValue, ptr %1379, i32 0, i32 0
  store i32 %1378, ptr %1380, align 8
  %1381 = load ptr, ptr %58, align 8
  %1382 = getelementptr inbounds %struct.SetValue, ptr %1381, i32 0, i32 0
  %1383 = load i32, ptr %1382, align 8
  %1384 = sext i32 %1383 to i64
  %1385 = mul i64 8, %1384
  %1386 = call noalias ptr @malloc(i64 noundef %1385) #6
  %1387 = load ptr, ptr %58, align 8
  %1388 = getelementptr inbounds %struct.SetValue, ptr %1387, i32 0, i32 1
  store ptr %1386, ptr %1388, align 8
  store i32 0, ptr %59, align 4
  br label %1389

1389:                                             ; preds = %1412, %1371
  %1390 = load i32, ptr %59, align 4
  %1391 = load ptr, ptr %57, align 8
  %1392 = getelementptr inbounds %struct.SetValue, ptr %1391, i32 0, i32 0
  %1393 = load i32, ptr %1392, align 8
  %1394 = icmp slt i32 %1390, %1393
  br i1 %1394, label %1395, label %1415

1395:                                             ; preds = %1389
  %1396 = load ptr, ptr %57, align 8
  %1397 = getelementptr inbounds %struct.SetValue, ptr %1396, i32 0, i32 1
  %1398 = load ptr, ptr %1397, align 8
  %1399 = load i32, ptr %59, align 4
  %1400 = sext i32 %1399 to i64
  %1401 = getelementptr inbounds ptr, ptr %1398, i64 %1400
  %1402 = load ptr, ptr %1401, align 8
  %1403 = load ptr, ptr %5, align 8
  %1404 = call ptr @copyValue(ptr noundef %1403)
  %1405 = call ptr @powCalcLangValues(ptr noundef %1402, ptr noundef %1404)
  %1406 = load ptr, ptr %58, align 8
  %1407 = getelementptr inbounds %struct.SetValue, ptr %1406, i32 0, i32 1
  %1408 = load ptr, ptr %1407, align 8
  %1409 = load i32, ptr %59, align 4
  %1410 = sext i32 %1409 to i64
  %1411 = getelementptr inbounds ptr, ptr %1408, i64 %1410
  store ptr %1405, ptr %1411, align 8
  br label %1412

1412:                                             ; preds = %1395
  %1413 = load i32, ptr %59, align 4
  %1414 = add nsw i32 %1413, 1
  store i32 %1414, ptr %59, align 4
  br label %1389, !llvm.loop !97

1415:                                             ; preds = %1389
  %1416 = load ptr, ptr %6, align 8
  %1417 = getelementptr inbounds %struct.CalcLangVal, ptr %1416, i32 0, i32 0
  store i32 6, ptr %1417, align 8
  %1418 = load ptr, ptr %58, align 8
  %1419 = load ptr, ptr %6, align 8
  %1420 = getelementptr inbounds %struct.CalcLangVal, ptr %1419, i32 0, i32 1
  store ptr %1418, ptr %1420, align 8
  br label %1483

1421:                                             ; preds = %1366, %1361
  %1422 = load ptr, ptr %4, align 8
  %1423 = getelementptr inbounds %struct.CalcLangVal, ptr %1422, i32 0, i32 0
  %1424 = load i32, ptr %1423, align 8
  %1425 = icmp eq i32 %1424, 4
  br i1 %1425, label %1426, label %1481

1426:                                             ; preds = %1421
  %1427 = load ptr, ptr %5, align 8
  %1428 = getelementptr inbounds %struct.CalcLangVal, ptr %1427, i32 0, i32 0
  %1429 = load i32, ptr %1428, align 8
  %1430 = icmp eq i32 %1429, 6
  br i1 %1430, label %1431, label %1481

1431:                                             ; preds = %1426
  %1432 = load ptr, ptr %5, align 8
  %1433 = getelementptr inbounds %struct.CalcLangVal, ptr %1432, i32 0, i32 1
  %1434 = load ptr, ptr %1433, align 8
  store ptr %1434, ptr %60, align 8
  %1435 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %1435, ptr %61, align 8
  %1436 = load ptr, ptr %60, align 8
  %1437 = getelementptr inbounds %struct.SetValue, ptr %1436, i32 0, i32 0
  %1438 = load i32, ptr %1437, align 8
  %1439 = load ptr, ptr %61, align 8
  %1440 = getelementptr inbounds %struct.SetValue, ptr %1439, i32 0, i32 0
  store i32 %1438, ptr %1440, align 8
  %1441 = load ptr, ptr %61, align 8
  %1442 = getelementptr inbounds %struct.SetValue, ptr %1441, i32 0, i32 0
  %1443 = load i32, ptr %1442, align 8
  %1444 = sext i32 %1443 to i64
  %1445 = mul i64 8, %1444
  %1446 = call noalias ptr @malloc(i64 noundef %1445) #6
  %1447 = load ptr, ptr %61, align 8
  %1448 = getelementptr inbounds %struct.SetValue, ptr %1447, i32 0, i32 1
  store ptr %1446, ptr %1448, align 8
  store i32 0, ptr %62, align 4
  br label %1449

1449:                                             ; preds = %1472, %1431
  %1450 = load i32, ptr %62, align 4
  %1451 = load ptr, ptr %60, align 8
  %1452 = getelementptr inbounds %struct.SetValue, ptr %1451, i32 0, i32 0
  %1453 = load i32, ptr %1452, align 8
  %1454 = icmp slt i32 %1450, %1453
  br i1 %1454, label %1455, label %1475

1455:                                             ; preds = %1449
  %1456 = load ptr, ptr %4, align 8
  %1457 = call ptr @copyValue(ptr noundef %1456)
  %1458 = load ptr, ptr %60, align 8
  %1459 = getelementptr inbounds %struct.SetValue, ptr %1458, i32 0, i32 1
  %1460 = load ptr, ptr %1459, align 8
  %1461 = load i32, ptr %62, align 4
  %1462 = sext i32 %1461 to i64
  %1463 = getelementptr inbounds ptr, ptr %1460, i64 %1462
  %1464 = load ptr, ptr %1463, align 8
  %1465 = call ptr @powCalcLangValues(ptr noundef %1457, ptr noundef %1464)
  %1466 = load ptr, ptr %61, align 8
  %1467 = getelementptr inbounds %struct.SetValue, ptr %1466, i32 0, i32 1
  %1468 = load ptr, ptr %1467, align 8
  %1469 = load i32, ptr %62, align 4
  %1470 = sext i32 %1469 to i64
  %1471 = getelementptr inbounds ptr, ptr %1468, i64 %1470
  store ptr %1465, ptr %1471, align 8
  br label %1472

1472:                                             ; preds = %1455
  %1473 = load i32, ptr %62, align 4
  %1474 = add nsw i32 %1473, 1
  store i32 %1474, ptr %62, align 4
  br label %1449, !llvm.loop !98

1475:                                             ; preds = %1449
  %1476 = load ptr, ptr %6, align 8
  %1477 = getelementptr inbounds %struct.CalcLangVal, ptr %1476, i32 0, i32 0
  store i32 6, ptr %1477, align 8
  %1478 = load ptr, ptr %61, align 8
  %1479 = load ptr, ptr %6, align 8
  %1480 = getelementptr inbounds %struct.CalcLangVal, ptr %1479, i32 0, i32 1
  store ptr %1478, ptr %1480, align 8
  br label %1482

1481:                                             ; preds = %1426, %1421
  call void @perror(ptr noundef @.str.3) #7
  br label %1482

1482:                                             ; preds = %1481, %1475
  br label %1483

1483:                                             ; preds = %1482, %1415
  br label %1484

1484:                                             ; preds = %1483, %1355
  br label %1485

1485:                                             ; preds = %1484, %1295
  br label %1486

1486:                                             ; preds = %1485, %1235
  br label %1487

1487:                                             ; preds = %1486, %1175
  br label %1488

1488:                                             ; preds = %1487, %1115
  br label %1489

1489:                                             ; preds = %1488, %1055
  br label %1490

1490:                                             ; preds = %1489, %1000
  br label %1491

1491:                                             ; preds = %1490, %917
  br label %1492

1492:                                             ; preds = %1491, %857
  br label %1493

1493:                                             ; preds = %1492, %797
  br label %1494

1494:                                             ; preds = %1493, %737
  br label %1495

1495:                                             ; preds = %1494, %677
  br label %1496

1496:                                             ; preds = %1495, %617
  br label %1497

1497:                                             ; preds = %1496, %557
  br label %1498

1498:                                             ; preds = %1497, %497
  br label %1499

1499:                                             ; preds = %1498, %442
  br label %1500

1500:                                             ; preds = %1499, %353
  br label %1501

1501:                                             ; preds = %1500, %331
  br label %1502

1502:                                             ; preds = %1501, %309
  br label %1503

1503:                                             ; preds = %1502, %286
  br label %1504

1504:                                             ; preds = %1503, %263
  br label %1505

1505:                                             ; preds = %1504, %241
  br label %1506

1506:                                             ; preds = %1505, %219
  br label %1507

1507:                                             ; preds = %1506, %196
  br label %1508

1508:                                             ; preds = %1507, %173
  br label %1509

1509:                                             ; preds = %1508, %150
  br label %1510

1510:                                             ; preds = %1509, %127
  br label %1511

1511:                                             ; preds = %1510, %105
  br label %1512

1512:                                             ; preds = %1511, %80
  %1513 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %1513)
  %1514 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %1514)
  %1515 = load ptr, ptr %6, align 8
  store ptr %1515, ptr %3, align 8
  br label %1516

1516:                                             ; preds = %1512, %999, %441, %68
  %1517 = load ptr, ptr %3, align 8
  ret ptr %1517
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dotProductVals(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %18, label %15

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %15, %2
  store ptr null, ptr %3, align 8
  br label %83

19:                                               ; preds = %15
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 7
  br i1 %23, label %24, label %79

24:                                               ; preds = %19
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp eq i32 %27, 7
  br i1 %28, label %29, label %79

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %6, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %7, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.TupleValue, ptr %36, i32 0, i32 0
  %38 = load i32, ptr %37, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.TupleValue, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = icmp eq i32 %38, %41
  br i1 %42, label %43, label %77

43:                                               ; preds = %29
  %44 = call ptr @integerCalcLangValue(i32 noundef 0)
  store ptr %44, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %45

45:                                               ; preds = %72, %43
  %46 = load i32, ptr %9, align 4
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.TupleValue, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp slt i32 %46, %49
  br i1 %50, label %51, label %75

51:                                               ; preds = %45
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds %struct.TupleValue, ptr %52, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds ptr, ptr %54, i64 %56
  %58 = load ptr, ptr %57, align 8
  store ptr %58, ptr %10, align 8
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds %struct.TupleValue, ptr %59, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = load i32, ptr %9, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds ptr, ptr %61, i64 %63
  %65 = load ptr, ptr %64, align 8
  store ptr %65, ptr %11, align 8
  %66 = load ptr, ptr %10, align 8
  %67 = load ptr, ptr %11, align 8
  %68 = call ptr @multCalcLangValues(ptr noundef %66, ptr noundef %67)
  store ptr %68, ptr %12, align 8
  %69 = load ptr, ptr %8, align 8
  %70 = load ptr, ptr %12, align 8
  %71 = call ptr @addCalcLangValues(ptr noundef %69, ptr noundef %70)
  store ptr %71, ptr %8, align 8
  br label %72

72:                                               ; preds = %51
  %73 = load i32, ptr %9, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %9, align 4
  br label %45, !llvm.loop !99

75:                                               ; preds = %45
  %76 = load ptr, ptr %8, align 8
  store ptr %76, ptr %3, align 8
  br label %83

77:                                               ; preds = %29
  call void @perror(ptr noundef @.str.4) #7
  br label %78

78:                                               ; preds = %77
  br label %80

79:                                               ; preds = %24, %19
  call void @perror(ptr noundef @.str.5) #7
  br label %80

80:                                               ; preds = %79, %78
  %81 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %81)
  %82 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %82)
  store ptr null, ptr %3, align 8
  br label %83

83:                                               ; preds = %80, %75, %18
  %84 = load ptr, ptr %3, align 8
  ret ptr %84
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @equalsCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %2
  store ptr null, ptr %3, align 8
  br label %458

23:                                               ; preds = %19
  %24 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp eq i32 %27, 5
  br i1 %28, label %29, label %51

29:                                               ; preds = %23
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = icmp eq i32 %32, 5
  br i1 %33, label %34, label %51

34:                                               ; preds = %29
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 0
  store i32 5, ptr %36, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = load i8, ptr %38, align 8
  %40 = trunc i8 %39 to i1
  %41 = zext i1 %40 to i32
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 1
  %44 = load i8, ptr %43, align 8
  %45 = trunc i8 %44 to i1
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 %41, %46
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 1
  %50 = zext i1 %47 to i8
  store i8 %50, ptr %49, align 8
  br label %454

51:                                               ; preds = %29, %23
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  %54 = load i32, ptr %53, align 8
  %55 = icmp eq i32 %54, 5
  br i1 %55, label %56, label %76

56:                                               ; preds = %51
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 0
  %59 = load i32, ptr %58, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %76

61:                                               ; preds = %56
  %62 = load ptr, ptr %6, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  store i32 5, ptr %63, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.CalcLangVal, ptr %64, i32 0, i32 1
  %66 = load i8, ptr %65, align 8
  %67 = trunc i8 %66 to i1
  %68 = zext i1 %67 to i32
  %69 = load ptr, ptr %5, align 8
  %70 = getelementptr inbounds %struct.CalcLangVal, ptr %69, i32 0, i32 1
  %71 = load i32, ptr %70, align 8
  %72 = icmp eq i32 %68, %71
  %73 = load ptr, ptr %6, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 1
  %75 = zext i1 %72 to i8
  store i8 %75, ptr %74, align 8
  br label %453

76:                                               ; preds = %56, %51
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %78, align 8
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %101

81:                                               ; preds = %76
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 0
  %84 = load i32, ptr %83, align 8
  %85 = icmp eq i32 %84, 5
  br i1 %85, label %86, label %101

86:                                               ; preds = %81
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 0
  store i32 5, ptr %88, align 8
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds %struct.CalcLangVal, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 8
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 1
  %94 = load i8, ptr %93, align 8
  %95 = trunc i8 %94 to i1
  %96 = zext i1 %95 to i32
  %97 = icmp eq i32 %91, %96
  %98 = load ptr, ptr %6, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 1
  %100 = zext i1 %97 to i8
  store i8 %100, ptr %99, align 8
  br label %452

101:                                              ; preds = %81, %76
  %102 = load ptr, ptr %4, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 0
  %104 = load i32, ptr %103, align 8
  %105 = icmp eq i32 %104, 5
  br i1 %105, label %106, label %127

106:                                              ; preds = %101
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 0
  %109 = load i32, ptr %108, align 8
  %110 = icmp eq i32 %109, 1
  br i1 %110, label %111, label %127

111:                                              ; preds = %106
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 0
  store i32 5, ptr %113, align 8
  %114 = load ptr, ptr %4, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 1
  %116 = load i8, ptr %115, align 8
  %117 = trunc i8 %116 to i1
  %118 = zext i1 %117 to i32
  %119 = sitofp i32 %118 to double
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 1
  %122 = load double, ptr %121, align 8
  %123 = fcmp oeq double %119, %122
  %124 = load ptr, ptr %6, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 1
  %126 = zext i1 %123 to i8
  store i8 %126, ptr %125, align 8
  br label %451

127:                                              ; preds = %106, %101
  %128 = load ptr, ptr %4, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 0
  %130 = load i32, ptr %129, align 8
  %131 = icmp eq i32 %130, 1
  br i1 %131, label %132, label %153

132:                                              ; preds = %127
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 0
  %135 = load i32, ptr %134, align 8
  %136 = icmp eq i32 %135, 5
  br i1 %136, label %137, label %153

137:                                              ; preds = %132
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  store i32 5, ptr %139, align 8
  %140 = load ptr, ptr %4, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 1
  %142 = load double, ptr %141, align 8
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 1
  %145 = load i8, ptr %144, align 8
  %146 = trunc i8 %145 to i1
  %147 = zext i1 %146 to i32
  %148 = sitofp i32 %147 to double
  %149 = fcmp oeq double %142, %148
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = zext i1 %149 to i8
  store i8 %152, ptr %151, align 8
  br label %450

153:                                              ; preds = %132, %127
  %154 = load ptr, ptr %4, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 0
  %156 = load i32, ptr %155, align 8
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %176

158:                                              ; preds = %153
  %159 = load ptr, ptr %5, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 0
  %161 = load i32, ptr %160, align 8
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %163, label %176

163:                                              ; preds = %158
  %164 = load ptr, ptr %6, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 0
  store i32 5, ptr %165, align 8
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 1
  %168 = load i32, ptr %167, align 8
  %169 = load ptr, ptr %5, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 1
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %168, %171
  %173 = load ptr, ptr %6, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = zext i1 %172 to i8
  store i8 %175, ptr %174, align 8
  br label %449

176:                                              ; preds = %158, %153
  %177 = load ptr, ptr %4, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 0
  %179 = load i32, ptr %178, align 8
  %180 = icmp eq i32 %179, 1
  br i1 %180, label %181, label %199

181:                                              ; preds = %176
  %182 = load ptr, ptr %5, align 8
  %183 = getelementptr inbounds %struct.CalcLangVal, ptr %182, i32 0, i32 0
  %184 = load i32, ptr %183, align 8
  %185 = icmp eq i32 %184, 1
  br i1 %185, label %186, label %199

186:                                              ; preds = %181
  %187 = load ptr, ptr %6, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 0
  store i32 5, ptr %188, align 8
  %189 = load ptr, ptr %4, align 8
  %190 = getelementptr inbounds %struct.CalcLangVal, ptr %189, i32 0, i32 1
  %191 = load double, ptr %190, align 8
  %192 = load ptr, ptr %5, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 1
  %194 = load double, ptr %193, align 8
  %195 = fcmp oeq double %191, %194
  %196 = load ptr, ptr %6, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 1
  %198 = zext i1 %195 to i8
  store i8 %198, ptr %197, align 8
  br label %448

199:                                              ; preds = %181, %176
  %200 = load ptr, ptr %4, align 8
  %201 = getelementptr inbounds %struct.CalcLangVal, ptr %200, i32 0, i32 0
  %202 = load i32, ptr %201, align 8
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %223

204:                                              ; preds = %199
  %205 = load ptr, ptr %5, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 0
  %207 = load i32, ptr %206, align 8
  %208 = icmp eq i32 %207, 1
  br i1 %208, label %209, label %223

209:                                              ; preds = %204
  %210 = load ptr, ptr %6, align 8
  %211 = getelementptr inbounds %struct.CalcLangVal, ptr %210, i32 0, i32 0
  store i32 5, ptr %211, align 8
  %212 = load ptr, ptr %4, align 8
  %213 = getelementptr inbounds %struct.CalcLangVal, ptr %212, i32 0, i32 1
  %214 = load i32, ptr %213, align 8
  %215 = sitofp i32 %214 to double
  %216 = load ptr, ptr %5, align 8
  %217 = getelementptr inbounds %struct.CalcLangVal, ptr %216, i32 0, i32 1
  %218 = load double, ptr %217, align 8
  %219 = fcmp oeq double %215, %218
  %220 = load ptr, ptr %6, align 8
  %221 = getelementptr inbounds %struct.CalcLangVal, ptr %220, i32 0, i32 1
  %222 = zext i1 %219 to i8
  store i8 %222, ptr %221, align 8
  br label %447

223:                                              ; preds = %204, %199
  %224 = load ptr, ptr %4, align 8
  %225 = getelementptr inbounds %struct.CalcLangVal, ptr %224, i32 0, i32 0
  %226 = load i32, ptr %225, align 8
  %227 = icmp eq i32 %226, 1
  br i1 %227, label %228, label %247

228:                                              ; preds = %223
  %229 = load ptr, ptr %5, align 8
  %230 = getelementptr inbounds %struct.CalcLangVal, ptr %229, i32 0, i32 0
  %231 = load i32, ptr %230, align 8
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %247

233:                                              ; preds = %228
  %234 = load ptr, ptr %6, align 8
  %235 = getelementptr inbounds %struct.CalcLangVal, ptr %234, i32 0, i32 0
  store i32 5, ptr %235, align 8
  %236 = load ptr, ptr %4, align 8
  %237 = getelementptr inbounds %struct.CalcLangVal, ptr %236, i32 0, i32 1
  %238 = load double, ptr %237, align 8
  %239 = load ptr, ptr %5, align 8
  %240 = getelementptr inbounds %struct.CalcLangVal, ptr %239, i32 0, i32 1
  %241 = load i32, ptr %240, align 8
  %242 = sitofp i32 %241 to double
  %243 = fcmp oeq double %238, %242
  %244 = load ptr, ptr %6, align 8
  %245 = getelementptr inbounds %struct.CalcLangVal, ptr %244, i32 0, i32 1
  %246 = zext i1 %243 to i8
  store i8 %246, ptr %245, align 8
  br label %446

247:                                              ; preds = %228, %223
  %248 = load ptr, ptr %4, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 0
  %250 = load i32, ptr %249, align 8
  %251 = icmp eq i32 %250, 3
  br i1 %251, label %252, label %270

252:                                              ; preds = %247
  %253 = load ptr, ptr %5, align 8
  %254 = getelementptr inbounds %struct.CalcLangVal, ptr %253, i32 0, i32 0
  %255 = load i32, ptr %254, align 8
  %256 = icmp eq i32 %255, 3
  br i1 %256, label %257, label %270

257:                                              ; preds = %252
  %258 = load ptr, ptr %6, align 8
  %259 = getelementptr inbounds %struct.CalcLangVal, ptr %258, i32 0, i32 0
  store i32 5, ptr %259, align 8
  %260 = load ptr, ptr %4, align 8
  %261 = getelementptr inbounds %struct.CalcLangVal, ptr %260, i32 0, i32 1
  %262 = load double, ptr %261, align 8
  %263 = load ptr, ptr %5, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 1
  %265 = load double, ptr %264, align 8
  %266 = fcmp oeq double %262, %265
  %267 = load ptr, ptr %6, align 8
  %268 = getelementptr inbounds %struct.CalcLangVal, ptr %267, i32 0, i32 1
  %269 = zext i1 %266 to i8
  store i8 %269, ptr %268, align 8
  br label %445

270:                                              ; preds = %252, %247
  %271 = load ptr, ptr %4, align 8
  %272 = getelementptr inbounds %struct.CalcLangVal, ptr %271, i32 0, i32 0
  %273 = load i32, ptr %272, align 8
  %274 = icmp eq i32 %273, 4
  br i1 %274, label %275, label %293

275:                                              ; preds = %270
  %276 = load ptr, ptr %5, align 8
  %277 = getelementptr inbounds %struct.CalcLangVal, ptr %276, i32 0, i32 0
  %278 = load i32, ptr %277, align 8
  %279 = icmp eq i32 %278, 4
  br i1 %279, label %280, label %293

280:                                              ; preds = %275
  %281 = load ptr, ptr %6, align 8
  %282 = getelementptr inbounds %struct.CalcLangVal, ptr %281, i32 0, i32 0
  store i32 5, ptr %282, align 8
  %283 = load ptr, ptr %4, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 1
  %285 = load double, ptr %284, align 8
  %286 = load ptr, ptr %5, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 1
  %288 = load double, ptr %287, align 8
  %289 = fcmp oeq double %285, %288
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 1
  %292 = zext i1 %289 to i8
  store i8 %292, ptr %291, align 8
  br label %444

293:                                              ; preds = %275, %270
  %294 = load ptr, ptr %4, align 8
  %295 = getelementptr inbounds %struct.CalcLangVal, ptr %294, i32 0, i32 0
  %296 = load i32, ptr %295, align 8
  %297 = icmp eq i32 %296, 7
  br i1 %297, label %298, label %367

298:                                              ; preds = %293
  %299 = load ptr, ptr %5, align 8
  %300 = getelementptr inbounds %struct.CalcLangVal, ptr %299, i32 0, i32 0
  %301 = load i32, ptr %300, align 8
  %302 = icmp eq i32 %301, 7
  br i1 %302, label %303, label %367

303:                                              ; preds = %298
  %304 = load ptr, ptr %4, align 8
  %305 = getelementptr inbounds %struct.CalcLangVal, ptr %304, i32 0, i32 1
  %306 = load ptr, ptr %305, align 8
  store ptr %306, ptr %7, align 8
  %307 = load ptr, ptr %5, align 8
  %308 = getelementptr inbounds %struct.CalcLangVal, ptr %307, i32 0, i32 1
  %309 = load ptr, ptr %308, align 8
  store ptr %309, ptr %8, align 8
  %310 = load ptr, ptr %8, align 8
  %311 = getelementptr inbounds %struct.TupleValue, ptr %310, i32 0, i32 0
  %312 = load i32, ptr %311, align 8
  %313 = load ptr, ptr %7, align 8
  %314 = getelementptr inbounds %struct.TupleValue, ptr %313, i32 0, i32 0
  %315 = load i32, ptr %314, align 8
  %316 = icmp eq i32 %312, %315
  br i1 %316, label %317, label %365

317:                                              ; preds = %303
  store i32 1, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %318

318:                                              ; preds = %354, %317
  %319 = load i32, ptr %10, align 4
  %320 = load ptr, ptr %7, align 8
  %321 = getelementptr inbounds %struct.TupleValue, ptr %320, i32 0, i32 0
  %322 = load i32, ptr %321, align 8
  %323 = icmp slt i32 %319, %322
  br i1 %323, label %324, label %357

324:                                              ; preds = %318
  %325 = load ptr, ptr %7, align 8
  %326 = getelementptr inbounds %struct.TupleValue, ptr %325, i32 0, i32 1
  %327 = load ptr, ptr %326, align 8
  %328 = load i32, ptr %10, align 4
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds ptr, ptr %327, i64 %329
  %331 = load ptr, ptr %330, align 8
  %332 = load ptr, ptr %8, align 8
  %333 = getelementptr inbounds %struct.TupleValue, ptr %332, i32 0, i32 1
  %334 = load ptr, ptr %333, align 8
  %335 = load i32, ptr %10, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds ptr, ptr %334, i64 %336
  %338 = load ptr, ptr %337, align 8
  %339 = call ptr @equalsCalcLangValues(ptr noundef %331, ptr noundef %338)
  store ptr %339, ptr %11, align 8
  %340 = load ptr, ptr %11, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 0
  %342 = load i32, ptr %341, align 8
  %343 = icmp eq i32 %342, 5
  br i1 %343, label %344, label %353

344:                                              ; preds = %324
  %345 = load ptr, ptr %11, align 8
  %346 = getelementptr inbounds %struct.CalcLangVal, ptr %345, i32 0, i32 1
  %347 = load i8, ptr %346, align 8
  %348 = trunc i8 %347 to i1
  %349 = zext i1 %348 to i32
  %350 = icmp eq i32 %349, 0
  br i1 %350, label %351, label %352

351:                                              ; preds = %344
  store i32 0, ptr %9, align 4
  br label %357

352:                                              ; preds = %344
  br label %353

353:                                              ; preds = %352, %324
  br label %354

354:                                              ; preds = %353
  %355 = load i32, ptr %10, align 4
  %356 = add nsw i32 %355, 1
  store i32 %356, ptr %10, align 4
  br label %318, !llvm.loop !100

357:                                              ; preds = %351, %318
  %358 = load ptr, ptr %6, align 8
  %359 = getelementptr inbounds %struct.CalcLangVal, ptr %358, i32 0, i32 0
  store i32 5, ptr %359, align 8
  %360 = load i32, ptr %9, align 4
  %361 = icmp ne i32 %360, 0
  %362 = load ptr, ptr %6, align 8
  %363 = getelementptr inbounds %struct.CalcLangVal, ptr %362, i32 0, i32 1
  %364 = zext i1 %361 to i8
  store i8 %364, ptr %363, align 8
  br label %366

365:                                              ; preds = %303
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %458

366:                                              ; preds = %357
  br label %443

367:                                              ; preds = %298, %293
  %368 = load ptr, ptr %4, align 8
  %369 = getelementptr inbounds %struct.CalcLangVal, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = icmp eq i32 %370, 6
  br i1 %371, label %372, label %441

372:                                              ; preds = %367
  %373 = load ptr, ptr %5, align 8
  %374 = getelementptr inbounds %struct.CalcLangVal, ptr %373, i32 0, i32 0
  %375 = load i32, ptr %374, align 8
  %376 = icmp eq i32 %375, 6
  br i1 %376, label %377, label %441

377:                                              ; preds = %372
  %378 = load ptr, ptr %4, align 8
  %379 = getelementptr inbounds %struct.CalcLangVal, ptr %378, i32 0, i32 1
  %380 = load ptr, ptr %379, align 8
  store ptr %380, ptr %12, align 8
  %381 = load ptr, ptr %5, align 8
  %382 = getelementptr inbounds %struct.CalcLangVal, ptr %381, i32 0, i32 1
  %383 = load ptr, ptr %382, align 8
  store ptr %383, ptr %13, align 8
  %384 = load ptr, ptr %13, align 8
  %385 = getelementptr inbounds %struct.SetValue, ptr %384, i32 0, i32 0
  %386 = load i32, ptr %385, align 8
  %387 = load ptr, ptr %12, align 8
  %388 = getelementptr inbounds %struct.SetValue, ptr %387, i32 0, i32 0
  %389 = load i32, ptr %388, align 8
  %390 = icmp eq i32 %386, %389
  br i1 %390, label %391, label %439

391:                                              ; preds = %377
  store i32 1, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %392

392:                                              ; preds = %428, %391
  %393 = load i32, ptr %15, align 4
  %394 = load ptr, ptr %12, align 8
  %395 = getelementptr inbounds %struct.SetValue, ptr %394, i32 0, i32 0
  %396 = load i32, ptr %395, align 8
  %397 = icmp slt i32 %393, %396
  br i1 %397, label %398, label %431

398:                                              ; preds = %392
  %399 = load ptr, ptr %12, align 8
  %400 = getelementptr inbounds %struct.SetValue, ptr %399, i32 0, i32 1
  %401 = load ptr, ptr %400, align 8
  %402 = load i32, ptr %15, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds ptr, ptr %401, i64 %403
  %405 = load ptr, ptr %404, align 8
  %406 = load ptr, ptr %13, align 8
  %407 = getelementptr inbounds %struct.SetValue, ptr %406, i32 0, i32 1
  %408 = load ptr, ptr %407, align 8
  %409 = load i32, ptr %15, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds ptr, ptr %408, i64 %410
  %412 = load ptr, ptr %411, align 8
  %413 = call ptr @equalsCalcLangValues(ptr noundef %405, ptr noundef %412)
  store ptr %413, ptr %16, align 8
  %414 = load ptr, ptr %16, align 8
  %415 = getelementptr inbounds %struct.CalcLangVal, ptr %414, i32 0, i32 0
  %416 = load i32, ptr %415, align 8
  %417 = icmp eq i32 %416, 5
  br i1 %417, label %418, label %427

418:                                              ; preds = %398
  %419 = load ptr, ptr %16, align 8
  %420 = getelementptr inbounds %struct.CalcLangVal, ptr %419, i32 0, i32 1
  %421 = load i8, ptr %420, align 8
  %422 = trunc i8 %421 to i1
  %423 = zext i1 %422 to i32
  %424 = icmp eq i32 %423, 0
  br i1 %424, label %425, label %426

425:                                              ; preds = %418
  store i32 0, ptr %14, align 4
  br label %431

426:                                              ; preds = %418
  br label %427

427:                                              ; preds = %426, %398
  br label %428

428:                                              ; preds = %427
  %429 = load i32, ptr %15, align 4
  %430 = add nsw i32 %429, 1
  store i32 %430, ptr %15, align 4
  br label %392, !llvm.loop !101

431:                                              ; preds = %425, %392
  %432 = load ptr, ptr %6, align 8
  %433 = getelementptr inbounds %struct.CalcLangVal, ptr %432, i32 0, i32 0
  store i32 5, ptr %433, align 8
  %434 = load i32, ptr %14, align 4
  %435 = icmp ne i32 %434, 0
  %436 = load ptr, ptr %6, align 8
  %437 = getelementptr inbounds %struct.CalcLangVal, ptr %436, i32 0, i32 1
  %438 = zext i1 %435 to i8
  store i8 %438, ptr %437, align 8
  br label %440

439:                                              ; preds = %377
  call void @perror(ptr noundef @.str.2) #7
  store ptr null, ptr %3, align 8
  br label %458

440:                                              ; preds = %431
  br label %442

441:                                              ; preds = %372, %367
  call void @perror(ptr noundef @.str.3) #7
  store ptr null, ptr %3, align 8
  br label %458

442:                                              ; preds = %440
  br label %443

443:                                              ; preds = %442, %366
  br label %444

444:                                              ; preds = %443, %280
  br label %445

445:                                              ; preds = %444, %257
  br label %446

446:                                              ; preds = %445, %233
  br label %447

447:                                              ; preds = %446, %209
  br label %448

448:                                              ; preds = %447, %186
  br label %449

449:                                              ; preds = %448, %163
  br label %450

450:                                              ; preds = %449, %137
  br label %451

451:                                              ; preds = %450, %111
  br label %452

452:                                              ; preds = %451, %86
  br label %453

453:                                              ; preds = %452, %61
  br label %454

454:                                              ; preds = %453, %34
  %455 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %455)
  %456 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %456)
  %457 = load ptr, ptr %6, align 8
  store ptr %457, ptr %3, align 8
  br label %458

458:                                              ; preds = %454, %441, %439, %365, %22
  %459 = load ptr, ptr %3, align 8
  ret ptr %459
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store ptr null, ptr %3, align 8
  br label %165

13:                                               ; preds = %9
  %14 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %37

19:                                               ; preds = %13
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = icmp slt i32 %29, %32
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = zext i1 %33 to i8
  store i8 %36, ptr %35, align 8
  br label %161

37:                                               ; preds = %19, %13
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %61

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %61

47:                                               ; preds = %42
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 0
  store i32 1, ptr %49, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = fcmp olt double %52, %55
  %57 = zext i1 %56 to i32
  %58 = sitofp i32 %57 to double
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  store double %58, ptr %60, align 8
  br label %160

61:                                               ; preds = %42, %37
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %85

66:                                               ; preds = %61
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 8
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %71, label %85

71:                                               ; preds = %66
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 0
  store i32 1, ptr %73, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 8
  %77 = sitofp i32 %76 to double
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load double, ptr %79, align 8
  %81 = fcmp olt double %77, %80
  %82 = load ptr, ptr %6, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  %84 = zext i1 %81 to i8
  store i8 %84, ptr %83, align 8
  br label %159

85:                                               ; preds = %66, %61
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 8
  %89 = icmp eq i32 %88, 1
  br i1 %89, label %90, label %109

90:                                               ; preds = %85
  %91 = load ptr, ptr %5, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 0
  %93 = load i32, ptr %92, align 8
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %109

95:                                               ; preds = %90
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  store i32 1, ptr %97, align 8
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 1
  %100 = load double, ptr %99, align 8
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 1
  %103 = load i32, ptr %102, align 8
  %104 = sitofp i32 %103 to double
  %105 = fcmp olt double %100, %104
  %106 = load ptr, ptr %6, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 1
  %108 = zext i1 %105 to i8
  store i8 %108, ptr %107, align 8
  br label %158

109:                                              ; preds = %90, %85
  %110 = load ptr, ptr %4, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = icmp eq i32 %112, 3
  br i1 %113, label %114, label %132

114:                                              ; preds = %109
  %115 = load ptr, ptr %5, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 3
  br i1 %118, label %119, label %132

119:                                              ; preds = %114
  %120 = load ptr, ptr %6, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  store i32 3, ptr %121, align 8
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 1
  %124 = load double, ptr %123, align 8
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 1
  %127 = load double, ptr %126, align 8
  %128 = fcmp olt double %124, %127
  %129 = load ptr, ptr %6, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = zext i1 %128 to i8
  store i8 %131, ptr %130, align 8
  br label %157

132:                                              ; preds = %114, %109
  %133 = load ptr, ptr %4, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 0
  %135 = load i32, ptr %134, align 8
  %136 = icmp eq i32 %135, 4
  br i1 %136, label %137, label %155

137:                                              ; preds = %132
  %138 = load ptr, ptr %5, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = icmp eq i32 %140, 4
  br i1 %141, label %142, label %155

142:                                              ; preds = %137
  %143 = load ptr, ptr %6, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 0
  store i32 4, ptr %144, align 8
  %145 = load ptr, ptr %4, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 1
  %147 = load double, ptr %146, align 8
  %148 = load ptr, ptr %5, align 8
  %149 = getelementptr inbounds %struct.CalcLangVal, ptr %148, i32 0, i32 1
  %150 = load double, ptr %149, align 8
  %151 = fcmp olt double %147, %150
  %152 = load ptr, ptr %6, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 1
  %154 = zext i1 %151 to i8
  store i8 %154, ptr %153, align 8
  br label %156

155:                                              ; preds = %137, %132
  call void @perror(ptr noundef @.str.3) #7
  store ptr null, ptr %3, align 8
  br label %165

156:                                              ; preds = %142
  br label %157

157:                                              ; preds = %156, %119
  br label %158

158:                                              ; preds = %157, %95
  br label %159

159:                                              ; preds = %158, %71
  br label %160

160:                                              ; preds = %159, %47
  br label %161

161:                                              ; preds = %160, %24
  %162 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %162)
  %163 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %163)
  %164 = load ptr, ptr %6, align 8
  store ptr %164, ptr %3, align 8
  br label %165

165:                                              ; preds = %161, %155, %12
  %166 = load ptr, ptr %3, align 8
  ret ptr %166
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store ptr null, ptr %3, align 8
  br label %168

13:                                               ; preds = %9
  %14 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %37

19:                                               ; preds = %13
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = icmp sgt i32 %29, %32
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = zext i1 %33 to i8
  store i8 %36, ptr %35, align 8
  br label %164

37:                                               ; preds = %19, %13
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %61

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %61

47:                                               ; preds = %42
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 0
  store i32 1, ptr %49, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = fcmp ogt double %52, %55
  %57 = zext i1 %56 to i32
  %58 = sitofp i32 %57 to double
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  store double %58, ptr %60, align 8
  br label %163

61:                                               ; preds = %42, %37
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %86

66:                                               ; preds = %61
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 8
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %71, label %86

71:                                               ; preds = %66
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 0
  store i32 1, ptr %73, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 8
  %77 = sitofp i32 %76 to double
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load double, ptr %79, align 8
  %81 = fcmp ogt double %77, %80
  %82 = zext i1 %81 to i32
  %83 = sitofp i32 %82 to double
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  store double %83, ptr %85, align 8
  br label %162

86:                                               ; preds = %66, %61
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 0
  %89 = load i32, ptr %88, align 8
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %110

91:                                               ; preds = %86
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %110

96:                                               ; preds = %91
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  store i32 1, ptr %98, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load double, ptr %100, align 8
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load i32, ptr %103, align 8
  %105 = sitofp i32 %104 to double
  %106 = fcmp ogt double %101, %105
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = zext i1 %106 to i8
  store i8 %109, ptr %108, align 8
  br label %161

110:                                              ; preds = %91, %86
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 0
  %113 = load i32, ptr %112, align 8
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %115, label %134

115:                                              ; preds = %110
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 8
  %119 = icmp eq i32 %118, 3
  br i1 %119, label %120, label %134

120:                                              ; preds = %115
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  store i32 3, ptr %122, align 8
  %123 = load ptr, ptr %4, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 1
  %125 = load double, ptr %124, align 8
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = fcmp ogt double %125, %128
  %130 = zext i1 %129 to i32
  %131 = sitofp i32 %130 to double
  %132 = load ptr, ptr %6, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %160

134:                                              ; preds = %115, %110
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 4
  br i1 %138, label %139, label %158

139:                                              ; preds = %134
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 4
  br i1 %143, label %144, label %158

144:                                              ; preds = %139
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 4, ptr %146, align 8
  %147 = load ptr, ptr %4, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %5, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = fcmp ogt double %149, %152
  %154 = zext i1 %153 to i32
  %155 = sitofp i32 %154 to double
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  store double %155, ptr %157, align 8
  br label %159

158:                                              ; preds = %139, %134
  call void @perror(ptr noundef @.str.3) #7
  br label %159

159:                                              ; preds = %158, %144
  br label %160

160:                                              ; preds = %159, %120
  br label %161

161:                                              ; preds = %160, %96
  br label %162

162:                                              ; preds = %161, %71
  br label %163

163:                                              ; preds = %162, %47
  br label %164

164:                                              ; preds = %163, %24
  %165 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %165)
  %166 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %166)
  %167 = load ptr, ptr %6, align 8
  store ptr %167, ptr %3, align 8
  br label %168

168:                                              ; preds = %164, %12
  %169 = load ptr, ptr %3, align 8
  ret ptr %169
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenOrEqualToCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store ptr null, ptr %3, align 8
  br label %168

13:                                               ; preds = %9
  %14 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %37

19:                                               ; preds = %13
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = icmp sle i32 %29, %32
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = zext i1 %33 to i8
  store i8 %36, ptr %35, align 8
  br label %164

37:                                               ; preds = %19, %13
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %61

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %61

47:                                               ; preds = %42
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 0
  store i32 1, ptr %49, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = fcmp ole double %52, %55
  %57 = zext i1 %56 to i32
  %58 = sitofp i32 %57 to double
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  store double %58, ptr %60, align 8
  br label %163

61:                                               ; preds = %42, %37
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %86

66:                                               ; preds = %61
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 8
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %71, label %86

71:                                               ; preds = %66
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 0
  store i32 1, ptr %73, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 8
  %77 = sitofp i32 %76 to double
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load double, ptr %79, align 8
  %81 = fcmp ole double %77, %80
  %82 = zext i1 %81 to i32
  %83 = sitofp i32 %82 to double
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  store double %83, ptr %85, align 8
  br label %162

86:                                               ; preds = %66, %61
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 0
  %89 = load i32, ptr %88, align 8
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %110

91:                                               ; preds = %86
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %110

96:                                               ; preds = %91
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  store i32 1, ptr %98, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load double, ptr %100, align 8
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load i32, ptr %103, align 8
  %105 = sitofp i32 %104 to double
  %106 = fcmp ole double %101, %105
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = zext i1 %106 to i8
  store i8 %109, ptr %108, align 8
  br label %161

110:                                              ; preds = %91, %86
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 0
  %113 = load i32, ptr %112, align 8
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %115, label %134

115:                                              ; preds = %110
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 8
  %119 = icmp eq i32 %118, 3
  br i1 %119, label %120, label %134

120:                                              ; preds = %115
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  store i32 3, ptr %122, align 8
  %123 = load ptr, ptr %4, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 1
  %125 = load double, ptr %124, align 8
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = fcmp ole double %125, %128
  %130 = zext i1 %129 to i32
  %131 = sitofp i32 %130 to double
  %132 = load ptr, ptr %6, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %160

134:                                              ; preds = %115, %110
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 4
  br i1 %138, label %139, label %158

139:                                              ; preds = %134
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 4
  br i1 %143, label %144, label %158

144:                                              ; preds = %139
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 4, ptr %146, align 8
  %147 = load ptr, ptr %4, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %5, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = fcmp ole double %149, %152
  %154 = zext i1 %153 to i32
  %155 = sitofp i32 %154 to double
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  store double %155, ptr %157, align 8
  br label %159

158:                                              ; preds = %139, %134
  call void @perror(ptr noundef @.str.3) #7
  br label %159

159:                                              ; preds = %158, %144
  br label %160

160:                                              ; preds = %159, %120
  br label %161

161:                                              ; preds = %160, %96
  br label %162

162:                                              ; preds = %161, %71
  br label %163

163:                                              ; preds = %162, %47
  br label %164

164:                                              ; preds = %163, %24
  %165 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %165)
  %166 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %166)
  %167 = load ptr, ptr %6, align 8
  store ptr %167, ptr %3, align 8
  br label %168

168:                                              ; preds = %164, %12
  %169 = load ptr, ptr %3, align 8
  ret ptr %169
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenOrEqualToCalcLangValues(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %2
  store ptr null, ptr %3, align 8
  br label %168

13:                                               ; preds = %9
  %14 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %37

19:                                               ; preds = %13
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 0
  store i32 0, ptr %26, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = icmp sge i32 %29, %32
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = zext i1 %33 to i8
  store i8 %36, ptr %35, align 8
  br label %164

37:                                               ; preds = %19, %13
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %61

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %61

47:                                               ; preds = %42
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.CalcLangVal, ptr %48, i32 0, i32 0
  store i32 1, ptr %49, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = fcmp oge double %52, %55
  %57 = zext i1 %56 to i32
  %58 = sitofp i32 %57 to double
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  store double %58, ptr %60, align 8
  br label %163

61:                                               ; preds = %42, %37
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %86

66:                                               ; preds = %61
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 8
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %71, label %86

71:                                               ; preds = %66
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 0
  store i32 1, ptr %73, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 8
  %77 = sitofp i32 %76 to double
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load double, ptr %79, align 8
  %81 = fcmp oge double %77, %80
  %82 = zext i1 %81 to i32
  %83 = sitofp i32 %82 to double
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  store double %83, ptr %85, align 8
  br label %162

86:                                               ; preds = %66, %61
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 0
  %89 = load i32, ptr %88, align 8
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %110

91:                                               ; preds = %86
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %110

96:                                               ; preds = %91
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  store i32 1, ptr %98, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load double, ptr %100, align 8
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load i32, ptr %103, align 8
  %105 = sitofp i32 %104 to double
  %106 = fcmp oge double %101, %105
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 1
  %109 = zext i1 %106 to i8
  store i8 %109, ptr %108, align 8
  br label %161

110:                                              ; preds = %91, %86
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 0
  %113 = load i32, ptr %112, align 8
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %115, label %134

115:                                              ; preds = %110
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 8
  %119 = icmp eq i32 %118, 3
  br i1 %119, label %120, label %134

120:                                              ; preds = %115
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  store i32 3, ptr %122, align 8
  %123 = load ptr, ptr %4, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 1
  %125 = load double, ptr %124, align 8
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = fcmp oge double %125, %128
  %130 = zext i1 %129 to i32
  %131 = sitofp i32 %130 to double
  %132 = load ptr, ptr %6, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %160

134:                                              ; preds = %115, %110
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 4
  br i1 %138, label %139, label %158

139:                                              ; preds = %134
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 4
  br i1 %143, label %144, label %158

144:                                              ; preds = %139
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 4, ptr %146, align 8
  %147 = load ptr, ptr %4, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %5, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load double, ptr %151, align 8
  %153 = fcmp oge double %149, %152
  %154 = zext i1 %153 to i32
  %155 = sitofp i32 %154 to double
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  store double %155, ptr %157, align 8
  br label %159

158:                                              ; preds = %139, %134
  call void @perror(ptr noundef @.str.3) #7
  store ptr null, ptr %3, align 8
  br label %168

159:                                              ; preds = %144
  br label %160

160:                                              ; preds = %159, %120
  br label %161

161:                                              ; preds = %160, %96
  br label %162

162:                                              ; preds = %161, %71
  br label %163

163:                                              ; preds = %162, %47
  br label %164

164:                                              ; preds = %163, %24
  %165 = load ptr, ptr %4, align 8
  call void @freeCalcLangValue(ptr noundef %165)
  %166 = load ptr, ptr %5, align 8
  call void @freeCalcLangValue(ptr noundef %166)
  %167 = load ptr, ptr %6, align 8
  store ptr %167, ptr %3, align 8
  br label %168

168:                                              ; preds = %164, %158, %12
  %169 = load ptr, ptr %3, align 8
  ret ptr %169
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @notCalcLangValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %197

12:                                               ; preds = %1
  %13 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %13, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %28

18:                                               ; preds = %12
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  store i32 5, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 8
  %24 = icmp ne i32 %23, 0
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 1
  %27 = zext i1 %24 to i8
  store i8 %27, ptr %26, align 8
  br label %194

28:                                               ; preds = %12
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %33, label %43

33:                                               ; preds = %28
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 0
  store i32 5, ptr %35, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.CalcLangVal, ptr %36, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = fcmp une double %38, 0.000000e+00
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.CalcLangVal, ptr %40, i32 0, i32 1
  %42 = zext i1 %39 to i8
  store i8 %42, ptr %41, align 8
  br label %193

43:                                               ; preds = %28
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.CalcLangVal, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = icmp eq i32 %46, 5
  br i1 %47, label %48, label %59

48:                                               ; preds = %43
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 0
  store i32 5, ptr %50, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 1
  %53 = load i8, ptr %52, align 8
  %54 = trunc i8 %53 to i1
  %55 = xor i1 %54, true
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 1
  %58 = zext i1 %55 to i8
  store i8 %58, ptr %57, align 8
  br label %192

59:                                               ; preds = %43
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.CalcLangVal, ptr %60, i32 0, i32 0
  %62 = load i32, ptr %61, align 8
  %63 = icmp eq i32 %62, 7
  br i1 %63, label %64, label %124

64:                                               ; preds = %59
  %65 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %65, ptr %5, align 8
  %66 = call noalias ptr @malloc(i64 noundef 16) #6
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 1
  store ptr %66, ptr %68, align 8
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds %struct.CalcLangVal, ptr %69, i32 0, i32 1
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds %struct.TupleValue, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds %struct.CalcLangVal, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds %struct.TupleValue, ptr %76, i32 0, i32 0
  store i32 %73, ptr %77, align 8
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.TupleValue, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = sext i32 %82 to i64
  %84 = mul i64 8, %83
  %85 = call noalias ptr @malloc(i64 noundef %84) #6
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds %struct.TupleValue, ptr %88, i32 0, i32 1
  store ptr %85, ptr %89, align 8
  store i32 0, ptr %6, align 4
  br label %90

90:                                               ; preds = %117, %64
  %91 = load i32, ptr %6, align 4
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.CalcLangVal, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds %struct.TupleValue, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %95, align 8
  %97 = icmp slt i32 %91, %96
  br i1 %97, label %98, label %120

98:                                               ; preds = %90
  %99 = load ptr, ptr %3, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds %struct.TupleValue, ptr %101, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %6, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds ptr, ptr %103, i64 %105
  %107 = load ptr, ptr %106, align 8
  %108 = call ptr @notCalcLangValue(ptr noundef %107)
  %109 = load ptr, ptr %5, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.TupleValue, ptr %111, i32 0, i32 1
  %113 = load ptr, ptr %112, align 8
  %114 = load i32, ptr %6, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds ptr, ptr %113, i64 %115
  store ptr %108, ptr %116, align 8
  br label %117

117:                                              ; preds = %98
  %118 = load i32, ptr %6, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %6, align 4
  br label %90, !llvm.loop !102

120:                                              ; preds = %90
  %121 = load ptr, ptr %5, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  store i32 7, ptr %122, align 8
  %123 = load ptr, ptr %5, align 8
  store ptr %123, ptr %2, align 8
  br label %197

124:                                              ; preds = %59
  %125 = load ptr, ptr %3, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  %127 = load i32, ptr %126, align 8
  %128 = icmp eq i32 %127, 6
  br i1 %128, label %129, label %189

129:                                              ; preds = %124
  %130 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %130, ptr %7, align 8
  %131 = call noalias ptr @malloc(i64 noundef 16) #6
  %132 = load ptr, ptr %7, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store ptr %131, ptr %133, align 8
  %134 = load ptr, ptr %3, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds %struct.SetValue, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %137, align 8
  %139 = load ptr, ptr %7, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = getelementptr inbounds %struct.SetValue, ptr %141, i32 0, i32 0
  store i32 %138, ptr %142, align 8
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 1
  %145 = load ptr, ptr %144, align 8
  %146 = getelementptr inbounds %struct.SetValue, ptr %145, i32 0, i32 0
  %147 = load i32, ptr %146, align 8
  %148 = sext i32 %147 to i64
  %149 = mul i64 8, %148
  %150 = call noalias ptr @malloc(i64 noundef %149) #6
  %151 = load ptr, ptr %7, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load ptr, ptr %152, align 8
  %154 = getelementptr inbounds %struct.SetValue, ptr %153, i32 0, i32 1
  store ptr %150, ptr %154, align 8
  store i32 0, ptr %8, align 4
  br label %155

155:                                              ; preds = %182, %129
  %156 = load i32, ptr %8, align 4
  %157 = load ptr, ptr %7, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  %159 = load ptr, ptr %158, align 8
  %160 = getelementptr inbounds %struct.TupleValue, ptr %159, i32 0, i32 0
  %161 = load i32, ptr %160, align 8
  %162 = icmp slt i32 %156, %161
  br i1 %162, label %163, label %185

163:                                              ; preds = %155
  %164 = load ptr, ptr %3, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 1
  %166 = load ptr, ptr %165, align 8
  %167 = getelementptr inbounds %struct.SetValue, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  %169 = load i32, ptr %8, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds ptr, ptr %168, i64 %170
  %172 = load ptr, ptr %171, align 8
  %173 = call ptr @notCalcLangValue(ptr noundef %172)
  %174 = load ptr, ptr %7, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 1
  %176 = load ptr, ptr %175, align 8
  %177 = getelementptr inbounds %struct.SetValue, ptr %176, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  %179 = load i32, ptr %8, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds ptr, ptr %178, i64 %180
  store ptr %173, ptr %181, align 8
  br label %182

182:                                              ; preds = %163
  %183 = load i32, ptr %8, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, ptr %8, align 4
  br label %155, !llvm.loop !103

185:                                              ; preds = %155
  %186 = load ptr, ptr %7, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 0
  store i32 6, ptr %187, align 8
  %188 = load ptr, ptr %7, align 8
  store ptr %188, ptr %2, align 8
  br label %197

189:                                              ; preds = %124
  call void @perror(ptr noundef @.str.6) #7
  br label %190

190:                                              ; preds = %189
  br label %191

191:                                              ; preds = %190
  br label %192

192:                                              ; preds = %191, %48
  br label %193

193:                                              ; preds = %192, %33
  br label %194

194:                                              ; preds = %193, %18
  %195 = load ptr, ptr %3, align 8
  call void @freeCalcLangValue(ptr noundef %195)
  %196 = load ptr, ptr %4, align 8
  store ptr %196, ptr %2, align 8
  br label %197

197:                                              ; preds = %194, %185, %120, %11
  %198 = load ptr, ptr %2, align 8
  ret ptr %198
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @negateCalcLangValue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %208

12:                                               ; preds = %1
  %13 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %13, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %27

18:                                               ; preds = %12
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  store i32 0, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 8
  %24 = sub nsw i32 0, %23
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 1
  store i32 %24, ptr %26, align 8
  br label %205

27:                                               ; preds = %12
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 8
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %41

32:                                               ; preds = %27
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.CalcLangVal, ptr %33, i32 0, i32 0
  store i32 1, ptr %34, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 1
  %37 = load double, ptr %36, align 8
  %38 = fneg double %37
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  store double %38, ptr %40, align 8
  br label %204

41:                                               ; preds = %27
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 3
  br i1 %45, label %46, label %55

46:                                               ; preds = %41
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  store i32 3, ptr %48, align 8
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 1
  %51 = load double, ptr %50, align 8
  %52 = fneg double %51
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  store double %52, ptr %54, align 8
  br label %203

55:                                               ; preds = %41
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds %struct.CalcLangVal, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %57, align 8
  %59 = icmp eq i32 %58, 4
  br i1 %59, label %60, label %69

60:                                               ; preds = %55
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.CalcLangVal, ptr %61, i32 0, i32 0
  store i32 4, ptr %62, align 8
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 1
  %65 = load double, ptr %64, align 8
  %66 = fneg double %65
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 1
  store double %66, ptr %68, align 8
  br label %202

69:                                               ; preds = %55
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds %struct.CalcLangVal, ptr %70, i32 0, i32 0
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %72, 7
  br i1 %73, label %74, label %134

74:                                               ; preds = %69
  %75 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %75, ptr %5, align 8
  %76 = call noalias ptr @malloc(i64 noundef 16) #6
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds %struct.CalcLangVal, ptr %77, i32 0, i32 1
  store ptr %76, ptr %78, align 8
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds %struct.TupleValue, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %82, align 8
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.CalcLangVal, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.TupleValue, ptr %86, i32 0, i32 0
  store i32 %83, ptr %87, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds %struct.TupleValue, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = sext i32 %92 to i64
  %94 = mul i64 8, %93
  %95 = call noalias ptr @malloc(i64 noundef %94) #6
  %96 = load ptr, ptr %5, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds %struct.TupleValue, ptr %98, i32 0, i32 1
  store ptr %95, ptr %99, align 8
  store i32 0, ptr %6, align 4
  br label %100

100:                                              ; preds = %127, %74
  %101 = load i32, ptr %6, align 4
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load ptr, ptr %103, align 8
  %105 = getelementptr inbounds %struct.TupleValue, ptr %104, i32 0, i32 0
  %106 = load i32, ptr %105, align 8
  %107 = icmp slt i32 %101, %106
  br i1 %107, label %108, label %130

108:                                              ; preds = %100
  %109 = load ptr, ptr %3, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.TupleValue, ptr %111, i32 0, i32 1
  %113 = load ptr, ptr %112, align 8
  %114 = load i32, ptr %6, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds ptr, ptr %113, i64 %115
  %117 = load ptr, ptr %116, align 8
  %118 = call ptr @negateCalcLangValue(ptr noundef %117)
  %119 = load ptr, ptr %5, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 1
  %121 = load ptr, ptr %120, align 8
  %122 = getelementptr inbounds %struct.TupleValue, ptr %121, i32 0, i32 1
  %123 = load ptr, ptr %122, align 8
  %124 = load i32, ptr %6, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds ptr, ptr %123, i64 %125
  store ptr %118, ptr %126, align 8
  br label %127

127:                                              ; preds = %108
  %128 = load i32, ptr %6, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %6, align 4
  br label %100, !llvm.loop !104

130:                                              ; preds = %100
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 0
  store i32 7, ptr %132, align 8
  %133 = load ptr, ptr %5, align 8
  store ptr %133, ptr %2, align 8
  br label %208

134:                                              ; preds = %69
  %135 = load ptr, ptr %3, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 6
  br i1 %138, label %139, label %199

139:                                              ; preds = %134
  %140 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %140, ptr %7, align 8
  %141 = call noalias ptr @malloc(i64 noundef 16) #6
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 1
  store ptr %141, ptr %143, align 8
  %144 = load ptr, ptr %3, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 1
  %146 = load ptr, ptr %145, align 8
  %147 = getelementptr inbounds %struct.SetValue, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = load ptr, ptr %7, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 1
  %151 = load ptr, ptr %150, align 8
  %152 = getelementptr inbounds %struct.SetValue, ptr %151, i32 0, i32 0
  store i32 %148, ptr %152, align 8
  %153 = load ptr, ptr %7, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load ptr, ptr %154, align 8
  %156 = getelementptr inbounds %struct.SetValue, ptr %155, i32 0, i32 0
  %157 = load i32, ptr %156, align 8
  %158 = sext i32 %157 to i64
  %159 = mul i64 8, %158
  %160 = call noalias ptr @malloc(i64 noundef %159) #6
  %161 = load ptr, ptr %7, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  %163 = load ptr, ptr %162, align 8
  %164 = getelementptr inbounds %struct.SetValue, ptr %163, i32 0, i32 1
  store ptr %160, ptr %164, align 8
  store i32 0, ptr %8, align 4
  br label %165

165:                                              ; preds = %192, %139
  %166 = load i32, ptr %8, align 4
  %167 = load ptr, ptr %7, align 8
  %168 = getelementptr inbounds %struct.CalcLangVal, ptr %167, i32 0, i32 1
  %169 = load ptr, ptr %168, align 8
  %170 = getelementptr inbounds %struct.TupleValue, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp slt i32 %166, %171
  br i1 %172, label %173, label %195

173:                                              ; preds = %165
  %174 = load ptr, ptr %3, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 1
  %176 = load ptr, ptr %175, align 8
  %177 = getelementptr inbounds %struct.SetValue, ptr %176, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  %179 = load i32, ptr %8, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds ptr, ptr %178, i64 %180
  %182 = load ptr, ptr %181, align 8
  %183 = call ptr @negateCalcLangValue(ptr noundef %182)
  %184 = load ptr, ptr %7, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  %186 = load ptr, ptr %185, align 8
  %187 = getelementptr inbounds %struct.SetValue, ptr %186, i32 0, i32 1
  %188 = load ptr, ptr %187, align 8
  %189 = load i32, ptr %8, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds ptr, ptr %188, i64 %190
  store ptr %183, ptr %191, align 8
  br label %192

192:                                              ; preds = %173
  %193 = load i32, ptr %8, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, ptr %8, align 4
  br label %165, !llvm.loop !105

195:                                              ; preds = %165
  %196 = load ptr, ptr %7, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 0
  store i32 6, ptr %197, align 8
  %198 = load ptr, ptr %7, align 8
  store ptr %198, ptr %2, align 8
  br label %208

199:                                              ; preds = %134
  call void @perror(ptr noundef @.str.7) #7
  br label %200

200:                                              ; preds = %199
  br label %201

201:                                              ; preds = %200
  br label %202

202:                                              ; preds = %201, %60
  br label %203

203:                                              ; preds = %202, %46
  br label %204

204:                                              ; preds = %203, %32
  br label %205

205:                                              ; preds = %204, %18
  %206 = load ptr, ptr %3, align 8
  call void @freeCalcLangValue(ptr noundef %206)
  %207 = load ptr, ptr %4, align 8
  store ptr %207, ptr %2, align 8
  br label %208

208:                                              ; preds = %205, %195, %130, %11
  %209 = load ptr, ptr %2, align 8
  ret ptr %209
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
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %162

9:                                                ; preds = %1
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.CalcLangVal, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 5
  br i1 %13, label %14, label %24

14:                                               ; preds = %9
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.CalcLangVal, ptr %15, i32 0, i32 1
  %17 = load i8, ptr %16, align 8
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %23

21:                                               ; preds = %14
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %23

23:                                               ; preds = %21, %19
  br label %161

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
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %32)
  br label %160

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
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %42)
  br label %159

44:                                               ; preds = %34
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds %struct.CalcLangVal, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp eq i32 %47, 3
  br i1 %48, label %49, label %54

49:                                               ; preds = %44
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1
  %52 = load double, ptr %51, align 8
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, double noundef %52)
  br label %158

54:                                               ; preds = %44
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.CalcLangVal, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 8
  %58 = icmp eq i32 %57, 4
  br i1 %58, label %59, label %64

59:                                               ; preds = %54
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.CalcLangVal, ptr %60, i32 0, i32 1
  %62 = load double, ptr %61, align 8
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, double noundef %62)
  br label %157

64:                                               ; preds = %54
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 7
  br i1 %68, label %69, label %109

69:                                               ; preds = %64
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
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
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
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
  br label %71, !llvm.loop !106

107:                                              ; preds = %71
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %156

109:                                              ; preds = %64
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = icmp eq i32 %112, 6
  br i1 %113, label %114, label %154

114:                                              ; preds = %109
  %115 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
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
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
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
  br label %116, !llvm.loop !107

152:                                              ; preds = %116
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %155

154:                                              ; preds = %109
  call void @perror(ptr noundef @.str.20) #7
  br label %155

155:                                              ; preds = %154, %152
  br label %156

156:                                              ; preds = %155, %107
  br label %157

157:                                              ; preds = %156, %59
  br label %158

158:                                              ; preds = %157, %49
  br label %159

159:                                              ; preds = %158, %39
  br label %160

160:                                              ; preds = %159, %29
  br label %161

161:                                              ; preds = %160, %23
  br label %162

162:                                              ; preds = %161, %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printString(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %3)
  %5 = load ptr, ptr @stdout, align 8
  %6 = call i32 @fflush(ptr noundef %5)
  ret void
}

declare i32 @fflush(ptr noundef) #4

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

declare i32 @getchar() #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { cold }
attributes #8 = { nounwind }

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
