; ModuleID = '/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c'
source_filename = "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangPixel = type { x86_fp80, x86_fp80, i8 }
%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { ptr }
%struct.winsize = type { i16, i16, i16, i16 }

@base = dso_local global x86_fp80 0xK4002A000000000000000, align 16, !dbg !0
@.str = private unnamed_addr constant [9 x i8] c"_,.-~*'`\00", align 1, !dbg !17
@.str.1 = private unnamed_addr constant [50 x i8] c"Error expected integer type from graphed function\00", align 1, !dbg !23
@.str.2 = private unnamed_addr constant [2 x i8] c"{\00", align 1, !dbg !28
@.str.3 = private unnamed_addr constant [10 x i8] c"(%Lf,%Lf)\00", align 1, !dbg !33
@.str.4 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1, !dbg !38
@.str.5 = private unnamed_addr constant [13 x i8] c"ioctl failed\00", align 1, !dbg !43
@.str.6 = private unnamed_addr constant [94 x i8] c"Metadata: xStep=%Lf,xBegin=%Lf,xEnd=%Lf, yMax=%Lf, yMin=%Lf, yStep=%Lf, yBegin=%Lf, yEnd=%Lf\0A\00", align 1, !dbg !48

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @closeTo(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !61 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !66, metadata !DIExpression()), !dbg !67
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !68, metadata !DIExpression()), !dbg !69
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !70, metadata !DIExpression()), !dbg !71
  %7 = load x86_fp80, ptr %4, align 16, !dbg !72
  %8 = load x86_fp80, ptr %5, align 16, !dbg !73
  %9 = fsub x86_fp80 %7, %8, !dbg !74
  %10 = call x86_fp80 @llvm.fabs.f80(x86_fp80 %9), !dbg !75
  %11 = load x86_fp80, ptr %6, align 16, !dbg !76
  %12 = fcmp olt x86_fp80 %10, %11, !dbg !77
  ret i1 %12, !dbg !78
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fabs.f80(x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @initializeDisplay(i32 noundef %0, i32 noundef %1) #0 !dbg !79 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %5, metadata !87, metadata !DIExpression()), !dbg !88
  %7 = load i32, ptr %3, align 4, !dbg !89
  %8 = sext i32 %7 to i64, !dbg !89
  %9 = mul i64 8, %8, !dbg !90
  %10 = call noalias ptr @malloc(i64 noundef %9) #7, !dbg !91
  store ptr %10, ptr %5, align 8, !dbg !88
  %11 = load ptr, ptr %5, align 8, !dbg !92
  %12 = load i32, ptr %3, align 4, !dbg !93
  %13 = sext i32 %12 to i64, !dbg !93
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 %13, i1 false), !dbg !94
  call void @llvm.dbg.declare(metadata ptr %6, metadata !95, metadata !DIExpression()), !dbg !97
  store i32 0, ptr %6, align 4, !dbg !97
  br label %14, !dbg !98

14:                                               ; preds = %34, %2
  %15 = load i32, ptr %6, align 4, !dbg !99
  %16 = load i32, ptr %3, align 4, !dbg !101
  %17 = icmp slt i32 %15, %16, !dbg !102
  br i1 %17, label %18, label %37, !dbg !103

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4, !dbg !104
  %20 = sext i32 %19 to i64, !dbg !104
  %21 = mul i64 48, %20, !dbg !106
  %22 = call noalias ptr @malloc(i64 noundef %21) #7, !dbg !107
  %23 = load ptr, ptr %5, align 8, !dbg !108
  %24 = load i32, ptr %6, align 4, !dbg !109
  %25 = sext i32 %24 to i64, !dbg !108
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25, !dbg !108
  store ptr %22, ptr %26, align 8, !dbg !110
  %27 = load ptr, ptr %5, align 8, !dbg !111
  %28 = load i32, ptr %6, align 4, !dbg !112
  %29 = sext i32 %28 to i64, !dbg !111
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !111
  %31 = load ptr, ptr %30, align 8, !dbg !111
  %32 = load i32, ptr %4, align 4, !dbg !113
  %33 = sext i32 %32 to i64, !dbg !113
  call void @llvm.memset.p0.i64(ptr align 16 %31, i8 0, i64 %33, i1 false), !dbg !114
  br label %34, !dbg !115

34:                                               ; preds = %18
  %35 = load i32, ptr %6, align 4, !dbg !116
  %36 = add nsw i32 %35, 1, !dbg !116
  store i32 %36, ptr %6, align 4, !dbg !116
  br label %14, !dbg !117, !llvm.loop !118

37:                                               ; preds = %14
  %38 = load ptr, ptr %5, align 8, !dbg !121
  ret ptr %38, !dbg !122
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, x86_fp80 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !123 {
  %7 = alloca x86_fp80, align 16
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca x86_fp80, align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store x86_fp80 %0, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !126, metadata !DIExpression()), !dbg !127
  store x86_fp80 %1, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !128, metadata !DIExpression()), !dbg !129
  store x86_fp80 %2, ptr %9, align 16
  call void @llvm.dbg.declare(metadata ptr %9, metadata !130, metadata !DIExpression()), !dbg !131
  store x86_fp80 %3, ptr %10, align 16
  call void @llvm.dbg.declare(metadata ptr %10, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 %5, ptr %12, align 4
  call void @llvm.dbg.declare(metadata ptr %12, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata ptr %13, metadata !138, metadata !DIExpression()), !dbg !139
  %16 = load i32, ptr %11, align 4, !dbg !140
  %17 = load i32, ptr %12, align 4, !dbg !141
  %18 = call ptr @initializeDisplay(i32 noundef %16, i32 noundef %17), !dbg !142
  store ptr %18, ptr %13, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata ptr %14, metadata !143, metadata !DIExpression()), !dbg !145
  store i32 0, ptr %14, align 4, !dbg !145
  br label %19, !dbg !146

19:                                               ; preds = %62, %6
  %20 = load i32, ptr %14, align 4, !dbg !147
  %21 = load i32, ptr %11, align 4, !dbg !149
  %22 = icmp slt i32 %20, %21, !dbg !150
  br i1 %22, label %23, label %65, !dbg !151

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %15, metadata !152, metadata !DIExpression()), !dbg !155
  store i32 0, ptr %15, align 4, !dbg !155
  br label %24, !dbg !156

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %15, align 4, !dbg !157
  %26 = load i32, ptr %12, align 4, !dbg !159
  %27 = icmp slt i32 %25, %26, !dbg !160
  br i1 %27, label %28, label %61, !dbg !161

28:                                               ; preds = %24
  %29 = load x86_fp80, ptr %9, align 16, !dbg !162
  %30 = load x86_fp80, ptr %7, align 16, !dbg !164
  %31 = load i32, ptr %15, align 4, !dbg !165
  %32 = sitofp i32 %31 to x86_fp80, !dbg !165
  %33 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %30, x86_fp80 %32, x86_fp80 %29), !dbg !166
  %34 = load ptr, ptr %13, align 8, !dbg !167
  %35 = load i32, ptr %14, align 4, !dbg !168
  %36 = sext i32 %35 to i64, !dbg !167
  %37 = getelementptr inbounds ptr, ptr %34, i64 %36, !dbg !167
  %38 = load ptr, ptr %37, align 8, !dbg !167
  %39 = load i32, ptr %15, align 4, !dbg !169
  %40 = sext i32 %39 to i64, !dbg !167
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %38, i64 %40, !dbg !167
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %41, i32 0, i32 0, !dbg !170
  store x86_fp80 %33, ptr %42, align 16, !dbg !171
  %43 = load x86_fp80, ptr %10, align 16, !dbg !172
  %44 = load x86_fp80, ptr %8, align 16, !dbg !173
  %45 = load i32, ptr %14, align 4, !dbg !174
  %46 = sitofp i32 %45 to x86_fp80, !dbg !174
  %47 = fneg x86_fp80 %44, !dbg !175
  %48 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %47, x86_fp80 %46, x86_fp80 %43), !dbg !175
  %49 = load ptr, ptr %13, align 8, !dbg !176
  %50 = load i32, ptr %14, align 4, !dbg !177
  %51 = sext i32 %50 to i64, !dbg !176
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !176
  %53 = load ptr, ptr %52, align 8, !dbg !176
  %54 = load i32, ptr %15, align 4, !dbg !178
  %55 = sext i32 %54 to i64, !dbg !176
  %56 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i64 %55, !dbg !176
  %57 = getelementptr inbounds %struct.CalcLangPixel, ptr %56, i32 0, i32 1, !dbg !179
  store x86_fp80 %48, ptr %57, align 16, !dbg !180
  br label %58, !dbg !181

58:                                               ; preds = %28
  %59 = load i32, ptr %15, align 4, !dbg !182
  %60 = add nsw i32 %59, 1, !dbg !182
  store i32 %60, ptr %15, align 4, !dbg !182
  br label %24, !dbg !183, !llvm.loop !184

61:                                               ; preds = %24
  br label %62, !dbg !186

62:                                               ; preds = %61
  %63 = load i32, ptr %14, align 4, !dbg !187
  %64 = add nsw i32 %63, 1, !dbg !187
  store i32 %64, ptr %14, align 4, !dbg !187
  br label %19, !dbg !188, !llvm.loop !189

65:                                               ; preds = %19
  %66 = load ptr, ptr %13, align 8, !dbg !191
  ret ptr %66, !dbg !192
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !193 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !196, metadata !DIExpression()), !dbg !197
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !198, metadata !DIExpression()), !dbg !199
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !200, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata ptr %7, metadata !202, metadata !DIExpression()), !dbg !204
  store ptr @.str, ptr %7, align 8, !dbg !204
  call void @llvm.dbg.declare(metadata ptr %8, metadata !205, metadata !DIExpression()), !dbg !206
  %12 = load x86_fp80, ptr %6, align 16, !dbg !207
  %13 = fdiv x86_fp80 %12, 0xK40028000000000000000, !dbg !208
  store x86_fp80 %13, ptr %8, align 16, !dbg !206
  call void @llvm.dbg.declare(metadata ptr %9, metadata !209, metadata !DIExpression()), !dbg !210
  %14 = load x86_fp80, ptr %4, align 16, !dbg !211
  %15 = load x86_fp80, ptr %5, align 16, !dbg !212
  %16 = load x86_fp80, ptr %6, align 16, !dbg !213
  %17 = fdiv x86_fp80 %16, 0xK40008000000000000000, !dbg !214
  %18 = fsub x86_fp80 %15, %17, !dbg !215
  %19 = fsub x86_fp80 %14, %18, !dbg !216
  store x86_fp80 %19, ptr %9, align 16, !dbg !210
  call void @llvm.dbg.declare(metadata ptr %10, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 0, ptr %10, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata ptr %11, metadata !219, metadata !DIExpression()), !dbg !220
  store x86_fp80 0xK00000000000000000000, ptr %11, align 16, !dbg !220
  br label %20, !dbg !221

20:                                               ; preds = %24, %3
  %21 = load x86_fp80, ptr %11, align 16, !dbg !222
  %22 = load x86_fp80, ptr %9, align 16, !dbg !223
  %23 = fcmp olt x86_fp80 %21, %22, !dbg !224
  br i1 %23, label %24, label %30, !dbg !221

24:                                               ; preds = %20
  %25 = load x86_fp80, ptr %8, align 16, !dbg !225
  %26 = load x86_fp80, ptr %11, align 16, !dbg !227
  %27 = fadd x86_fp80 %26, %25, !dbg !227
  store x86_fp80 %27, ptr %11, align 16, !dbg !227
  %28 = load i32, ptr %10, align 4, !dbg !228
  %29 = add nsw i32 %28, 1, !dbg !228
  store i32 %29, ptr %10, align 4, !dbg !228
  br label %20, !dbg !221, !llvm.loop !229

30:                                               ; preds = %20
  %31 = load ptr, ptr %7, align 8, !dbg !231
  %32 = load i32, ptr %10, align 4, !dbg !232
  %33 = sub nsw i32 %32, 1, !dbg !233
  %34 = sext i32 %33 to i64, !dbg !231
  %35 = getelementptr inbounds i8, ptr %31, i64 %34, !dbg !231
  %36 = load i8, ptr %35, align 1, !dbg !231
  ret i8 %36, !dbg !234
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !235 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata ptr %7, metadata !244, metadata !DIExpression()), !dbg !246
  %12 = load i32, ptr %5, align 4, !dbg !247
  %13 = sext i32 %12 to i64, !dbg !247
  %14 = mul i64 8, %13, !dbg !248
  %15 = add i64 %14, 1, !dbg !249
  %16 = call noalias ptr @malloc(i64 noundef %15) #7, !dbg !250
  store ptr %16, ptr %7, align 8, !dbg !246
  call void @llvm.dbg.declare(metadata ptr %8, metadata !251, metadata !DIExpression()), !dbg !253
  store i32 0, ptr %8, align 4, !dbg !253
  br label %17, !dbg !254

17:                                               ; preds = %31, %3
  %18 = load i32, ptr %8, align 4, !dbg !255
  %19 = load i32, ptr %5, align 4, !dbg !257
  %20 = icmp slt i32 %18, %19, !dbg !258
  br i1 %20, label %21, label %34, !dbg !259

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4, !dbg !260
  %23 = sext i32 %22 to i64, !dbg !260
  %24 = mul i64 1, %23, !dbg !262
  %25 = add i64 %24, 1, !dbg !263
  %26 = call noalias ptr @malloc(i64 noundef %25) #7, !dbg !264
  %27 = load ptr, ptr %7, align 8, !dbg !265
  %28 = load i32, ptr %8, align 4, !dbg !266
  %29 = sext i32 %28 to i64, !dbg !265
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !265
  store ptr %26, ptr %30, align 8, !dbg !267
  br label %31, !dbg !268

31:                                               ; preds = %21
  %32 = load i32, ptr %8, align 4, !dbg !269
  %33 = add nsw i32 %32, 1, !dbg !269
  store i32 %33, ptr %8, align 4, !dbg !269
  br label %17, !dbg !270, !llvm.loop !271

34:                                               ; preds = %17
  call void @llvm.dbg.declare(metadata ptr %9, metadata !273, metadata !DIExpression()), !dbg !275
  store i32 0, ptr %9, align 4, !dbg !275
  br label %35, !dbg !276

35:                                               ; preds = %75, %34
  %36 = load i32, ptr %9, align 4, !dbg !277
  %37 = load i32, ptr %5, align 4, !dbg !279
  %38 = icmp slt i32 %36, %37, !dbg !280
  br i1 %38, label %39, label %78, !dbg !281

39:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata ptr %10, metadata !282, metadata !DIExpression()), !dbg !285
  store i32 0, ptr %10, align 4, !dbg !285
  br label %40, !dbg !286

40:                                               ; preds = %63, %39
  %41 = load i32, ptr %10, align 4, !dbg !287
  %42 = load i32, ptr %6, align 4, !dbg !289
  %43 = icmp slt i32 %41, %42, !dbg !290
  br i1 %43, label %44, label %66, !dbg !291

44:                                               ; preds = %40
  %45 = load ptr, ptr %4, align 8, !dbg !292
  %46 = load i32, ptr %9, align 4, !dbg !293
  %47 = sext i32 %46 to i64, !dbg !292
  %48 = getelementptr inbounds ptr, ptr %45, i64 %47, !dbg !292
  %49 = load ptr, ptr %48, align 8, !dbg !292
  %50 = load i32, ptr %10, align 4, !dbg !294
  %51 = sext i32 %50 to i64, !dbg !292
  %52 = getelementptr inbounds %struct.CalcLangPixel, ptr %49, i64 %51, !dbg !292
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %52, i32 0, i32 2, !dbg !295
  %54 = load i8, ptr %53, align 16, !dbg !295
  %55 = load ptr, ptr %7, align 8, !dbg !296
  %56 = load i32, ptr %9, align 4, !dbg !297
  %57 = sext i32 %56 to i64, !dbg !296
  %58 = getelementptr inbounds ptr, ptr %55, i64 %57, !dbg !296
  %59 = load ptr, ptr %58, align 8, !dbg !296
  %60 = load i32, ptr %10, align 4, !dbg !298
  %61 = sext i32 %60 to i64, !dbg !296
  %62 = getelementptr inbounds i8, ptr %59, i64 %61, !dbg !296
  store i8 %54, ptr %62, align 1, !dbg !299
  br label %63, !dbg !296

63:                                               ; preds = %44
  %64 = load i32, ptr %10, align 4, !dbg !300
  %65 = add nsw i32 %64, 1, !dbg !300
  store i32 %65, ptr %10, align 4, !dbg !300
  br label %40, !dbg !301, !llvm.loop !302

66:                                               ; preds = %40
  %67 = load ptr, ptr %7, align 8, !dbg !304
  %68 = load i32, ptr %9, align 4, !dbg !305
  %69 = sext i32 %68 to i64, !dbg !304
  %70 = getelementptr inbounds ptr, ptr %67, i64 %69, !dbg !304
  %71 = load ptr, ptr %70, align 8, !dbg !304
  %72 = load i32, ptr %6, align 4, !dbg !306
  %73 = sext i32 %72 to i64, !dbg !304
  %74 = getelementptr inbounds i8, ptr %71, i64 %73, !dbg !304
  store i8 0, ptr %74, align 1, !dbg !307
  br label %75, !dbg !308

75:                                               ; preds = %66
  %76 = load i32, ptr %9, align 4, !dbg !309
  %77 = add nsw i32 %76, 1, !dbg !309
  store i32 %77, ptr %9, align 4, !dbg !309
  br label %35, !dbg !310, !llvm.loop !311

78:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata ptr %11, metadata !313, metadata !DIExpression()), !dbg !315
  store i32 0, ptr %11, align 4, !dbg !315
  br label %79, !dbg !316

79:                                               ; preds = %90, %78
  %80 = load i32, ptr %11, align 4, !dbg !317
  %81 = load i32, ptr %5, align 4, !dbg !319
  %82 = icmp slt i32 %80, %81, !dbg !320
  br i1 %82, label %83, label %93, !dbg !321

83:                                               ; preds = %79
  %84 = load ptr, ptr %7, align 8, !dbg !322
  %85 = load i32, ptr %11, align 4, !dbg !323
  %86 = sext i32 %85 to i64, !dbg !322
  %87 = getelementptr inbounds ptr, ptr %84, i64 %86, !dbg !322
  %88 = load ptr, ptr %87, align 8, !dbg !322
  %89 = call i32 @puts(ptr noundef %88), !dbg !324
  br label %90, !dbg !324

90:                                               ; preds = %83
  %91 = load i32, ptr %11, align 4, !dbg !325
  %92 = add nsw i32 %91, 1, !dbg !325
  store i32 %92, ptr %11, align 4, !dbg !325
  br label %79, !dbg !326, !llvm.loop !327

93:                                               ; preds = %79
  ret void, !dbg !329
}

declare i32 @puts(ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @calcLangValueFuncWrapper(ptr noundef %0, ptr noundef %1, x86_fp80 noundef %2) #0 !dbg !330 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !377, metadata !DIExpression()), !dbg !378
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !379, metadata !DIExpression()), !dbg !380
  store x86_fp80 %2, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !381, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata ptr %8, metadata !383, metadata !DIExpression()), !dbg !384
  %10 = load ptr, ptr %5, align 8, !dbg !385
  %11 = call ptr @arenaAlloc(ptr noundef %10, i32 noundef 16), !dbg !386
  store ptr %11, ptr %8, align 8, !dbg !384
  %12 = load ptr, ptr %8, align 8, !dbg !387
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 0, !dbg !388
  store i32 0, ptr %13, align 8, !dbg !389
  %14 = load x86_fp80, ptr %7, align 16, !dbg !390
  %15 = fptosi x86_fp80 %14 to i32, !dbg !391
  %16 = load ptr, ptr %8, align 8, !dbg !392
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 1, !dbg !393
  store i32 %15, ptr %17, align 8, !dbg !394
  call void @llvm.dbg.declare(metadata ptr %9, metadata !395, metadata !DIExpression()), !dbg !396
  %18 = load ptr, ptr %6, align 8, !dbg !397
  %19 = load ptr, ptr %5, align 8, !dbg !398
  %20 = load ptr, ptr %8, align 8, !dbg !399
  %21 = call ptr %18(ptr noundef %19, ptr noundef %20), !dbg !397
  store ptr %21, ptr %9, align 8, !dbg !396
  %22 = load ptr, ptr %9, align 8, !dbg !400
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0, !dbg !402
  %24 = load i32, ptr %23, align 8, !dbg !402
  %25 = icmp eq i32 %24, 0, !dbg !403
  br i1 %25, label %26, label %31, !dbg !404

26:                                               ; preds = %3
  %27 = load ptr, ptr %9, align 8, !dbg !405
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1, !dbg !406
  %29 = load i32, ptr %28, align 8, !dbg !407
  %30 = sitofp i32 %29 to x86_fp80, !dbg !408
  store x86_fp80 %30, ptr %4, align 16, !dbg !409
  br label %32, !dbg !409

31:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #8, !dbg !410
  store x86_fp80 0xKBFFF8000000000000000, ptr %4, align 16, !dbg !412
  br label %32, !dbg !412

32:                                               ; preds = %31, %26
  %33 = load x86_fp80, ptr %4, align 16, !dbg !413
  ret x86_fp80 %33, !dbg !413
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #4

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @shadeGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, x86_fp80 noundef %5, x86_fp80 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !414 {
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca x86_fp80, align 16
  %14 = alloca x86_fp80, align 16
  %15 = alloca x86_fp80, align 16
  %16 = alloca x86_fp80, align 16
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca x86_fp80, align 16
  %20 = alloca x86_fp80, align 16
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca x86_fp80, align 16
  store ptr %0, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !417, metadata !DIExpression()), !dbg !418
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !419, metadata !DIExpression()), !dbg !420
  store ptr %2, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !421, metadata !DIExpression()), !dbg !422
  store x86_fp80 %3, ptr %13, align 16
  call void @llvm.dbg.declare(metadata ptr %13, metadata !423, metadata !DIExpression()), !dbg !424
  store x86_fp80 %4, ptr %14, align 16
  call void @llvm.dbg.declare(metadata ptr %14, metadata !425, metadata !DIExpression()), !dbg !426
  store x86_fp80 %5, ptr %15, align 16
  call void @llvm.dbg.declare(metadata ptr %15, metadata !427, metadata !DIExpression()), !dbg !428
  store x86_fp80 %6, ptr %16, align 16
  call void @llvm.dbg.declare(metadata ptr %16, metadata !429, metadata !DIExpression()), !dbg !430
  store i32 %7, ptr %17, align 4
  call void @llvm.dbg.declare(metadata ptr %17, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 %8, ptr %18, align 4
  call void @llvm.dbg.declare(metadata ptr %18, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata ptr %19, metadata !435, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.declare(metadata ptr %20, metadata !437, metadata !DIExpression()), !dbg !438
  call void @llvm.dbg.declare(metadata ptr %21, metadata !439, metadata !DIExpression()), !dbg !441
  store i32 0, ptr %21, align 4, !dbg !441
  br label %25, !dbg !442

25:                                               ; preds = %104, %9
  %26 = load i32, ptr %21, align 4, !dbg !443
  %27 = load i32, ptr %17, align 4, !dbg !445
  %28 = icmp slt i32 %26, %27, !dbg !446
  br i1 %28, label %29, label %107, !dbg !447

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %22, metadata !448, metadata !DIExpression()), !dbg !451
  store i32 0, ptr %22, align 4, !dbg !451
  br label %30, !dbg !452

30:                                               ; preds = %100, %29
  %31 = load i32, ptr %22, align 4, !dbg !453
  %32 = load i32, ptr %18, align 4, !dbg !455
  %33 = icmp slt i32 %31, %32, !dbg !456
  br i1 %33, label %34, label %103, !dbg !457

34:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %23, metadata !458, metadata !DIExpression()), !dbg !460
  %35 = load ptr, ptr %10, align 8, !dbg !461
  %36 = load i32, ptr %21, align 4, !dbg !462
  %37 = sext i32 %36 to i64, !dbg !461
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !461
  %39 = load ptr, ptr %38, align 8, !dbg !461
  %40 = load i32, ptr %22, align 4, !dbg !463
  %41 = sext i32 %40 to i64, !dbg !461
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i64 %41, !dbg !461
  store ptr %42, ptr %23, align 8, !dbg !460
  %43 = load ptr, ptr %23, align 8, !dbg !464
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 0, !dbg !465
  %45 = load x86_fp80, ptr %44, align 16, !dbg !465
  store x86_fp80 %45, ptr %19, align 16, !dbg !466
  %46 = load ptr, ptr %23, align 8, !dbg !467
  %47 = getelementptr inbounds %struct.CalcLangPixel, ptr %46, i32 0, i32 1, !dbg !468
  %48 = load x86_fp80, ptr %47, align 16, !dbg !468
  store x86_fp80 %48, ptr %20, align 16, !dbg !469
  call void @llvm.dbg.declare(metadata ptr %24, metadata !470, metadata !DIExpression()), !dbg !471
  %49 = load ptr, ptr %12, align 8, !dbg !472
  %50 = load ptr, ptr %11, align 8, !dbg !473
  %51 = load x86_fp80, ptr %19, align 16, !dbg !474
  %52 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %49, ptr noundef %50, x86_fp80 noundef %51), !dbg !475
  store x86_fp80 %52, ptr %24, align 16, !dbg !471
  %53 = load x86_fp80, ptr %24, align 16, !dbg !476
  %54 = load x86_fp80, ptr %20, align 16, !dbg !478
  %55 = load x86_fp80, ptr %14, align 16, !dbg !479
  %56 = fdiv x86_fp80 %55, 0xK40008666666666666800, !dbg !480
  %57 = call zeroext i1 @closeTo(x86_fp80 noundef %53, x86_fp80 noundef %54, x86_fp80 noundef %56), !dbg !481
  br i1 %57, label %58, label %65, !dbg !482

58:                                               ; preds = %34
  %59 = load x86_fp80, ptr %24, align 16, !dbg !483
  %60 = load x86_fp80, ptr %20, align 16, !dbg !484
  %61 = load x86_fp80, ptr %14, align 16, !dbg !485
  %62 = call signext i8 @yCompress(x86_fp80 noundef %59, x86_fp80 noundef %60, x86_fp80 noundef %61), !dbg !486
  %63 = load ptr, ptr %23, align 8, !dbg !487
  %64 = getelementptr inbounds %struct.CalcLangPixel, ptr %63, i32 0, i32 2, !dbg !488
  store i8 %62, ptr %64, align 16, !dbg !489
  br label %99, !dbg !487

65:                                               ; preds = %34
  %66 = load x86_fp80, ptr %24, align 16, !dbg !490
  %67 = fcmp olt x86_fp80 %66, 0xK00000000000000000000, !dbg !492
  br i1 %67, label %68, label %77, !dbg !493

68:                                               ; preds = %65
  %69 = load x86_fp80, ptr %20, align 16, !dbg !494
  %70 = load x86_fp80, ptr %14, align 16, !dbg !495
  %71 = fdiv x86_fp80 %70, 0xK40008000000000000000, !dbg !496
  %72 = fcmp olt x86_fp80 %69, %71, !dbg !497
  br i1 %72, label %73, label %98, !dbg !498

73:                                               ; preds = %68
  %74 = load x86_fp80, ptr %20, align 16, !dbg !499
  %75 = load x86_fp80, ptr %24, align 16, !dbg !500
  %76 = fcmp ogt x86_fp80 %74, %75, !dbg !501
  br i1 %76, label %87, label %98, !dbg !502

77:                                               ; preds = %65
  %78 = load x86_fp80, ptr %20, align 16, !dbg !503
  %79 = load x86_fp80, ptr %14, align 16, !dbg !504
  %80 = fneg x86_fp80 %79, !dbg !505
  %81 = fdiv x86_fp80 %80, 0xK40008000000000000000, !dbg !506
  %82 = fcmp ogt x86_fp80 %78, %81, !dbg !507
  br i1 %82, label %83, label %98, !dbg !508

83:                                               ; preds = %77
  %84 = load x86_fp80, ptr %20, align 16, !dbg !509
  %85 = load x86_fp80, ptr %24, align 16, !dbg !510
  %86 = fcmp olt x86_fp80 %84, %85, !dbg !511
  br i1 %86, label %87, label %98, !dbg !493

87:                                               ; preds = %83, %73
  %88 = load x86_fp80, ptr %19, align 16, !dbg !512
  %89 = load x86_fp80, ptr %15, align 16, !dbg !513
  %90 = fcmp ogt x86_fp80 %88, %89, !dbg !514
  br i1 %90, label %91, label %98, !dbg !515

91:                                               ; preds = %87
  %92 = load x86_fp80, ptr %19, align 16, !dbg !516
  %93 = load x86_fp80, ptr %16, align 16, !dbg !517
  %94 = fcmp olt x86_fp80 %92, %93, !dbg !518
  br i1 %94, label %95, label %98, !dbg !519

95:                                               ; preds = %91
  %96 = load ptr, ptr %23, align 8, !dbg !520
  %97 = getelementptr inbounds %struct.CalcLangPixel, ptr %96, i32 0, i32 2, !dbg !521
  store i8 35, ptr %97, align 16, !dbg !522
  br label %98, !dbg !520

98:                                               ; preds = %95, %91, %87, %83, %77, %73, %68
  br label %99

99:                                               ; preds = %98, %58
  br label %100, !dbg !523

100:                                              ; preds = %99
  %101 = load i32, ptr %22, align 4, !dbg !524
  %102 = add nsw i32 %101, 1, !dbg !524
  store i32 %102, ptr %22, align 4, !dbg !524
  br label %30, !dbg !525, !llvm.loop !526

103:                                              ; preds = %30
  br label %104, !dbg !528

104:                                              ; preds = %103
  %105 = load i32, ptr %21, align 4, !dbg !529
  %106 = add nsw i32 %105, 1, !dbg !529
  store i32 %106, ptr %21, align 4, !dbg !529
  br label %25, !dbg !530, !llvm.loop !531

107:                                              ; preds = %25
  ret void, !dbg !533
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !534 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca x86_fp80, align 16
  %12 = alloca x86_fp80, align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca x86_fp80, align 16
  %16 = alloca x86_fp80, align 16
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca x86_fp80, align 16
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !537, metadata !DIExpression()), !dbg !538
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !539, metadata !DIExpression()), !dbg !540
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !541, metadata !DIExpression()), !dbg !542
  store x86_fp80 %3, ptr %11, align 16
  call void @llvm.dbg.declare(metadata ptr %11, metadata !543, metadata !DIExpression()), !dbg !544
  store x86_fp80 %4, ptr %12, align 16
  call void @llvm.dbg.declare(metadata ptr %12, metadata !545, metadata !DIExpression()), !dbg !546
  store i32 %5, ptr %13, align 4
  call void @llvm.dbg.declare(metadata ptr %13, metadata !547, metadata !DIExpression()), !dbg !548
  store i32 %6, ptr %14, align 4
  call void @llvm.dbg.declare(metadata ptr %14, metadata !549, metadata !DIExpression()), !dbg !550
  call void @llvm.dbg.declare(metadata ptr %15, metadata !551, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata ptr %16, metadata !553, metadata !DIExpression()), !dbg !554
  call void @llvm.dbg.declare(metadata ptr %17, metadata !555, metadata !DIExpression()), !dbg !557
  store i32 0, ptr %17, align 4, !dbg !557
  br label %21, !dbg !558

21:                                               ; preds = %67, %7
  %22 = load i32, ptr %17, align 4, !dbg !559
  %23 = load i32, ptr %13, align 4, !dbg !561
  %24 = icmp slt i32 %22, %23, !dbg !562
  br i1 %24, label %25, label %70, !dbg !563

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %18, metadata !564, metadata !DIExpression()), !dbg !567
  store i32 0, ptr %18, align 4, !dbg !567
  br label %26, !dbg !568

26:                                               ; preds = %63, %25
  %27 = load i32, ptr %18, align 4, !dbg !569
  %28 = load i32, ptr %14, align 4, !dbg !571
  %29 = icmp slt i32 %27, %28, !dbg !572
  br i1 %29, label %30, label %66, !dbg !573

30:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %19, metadata !574, metadata !DIExpression()), !dbg !576
  %31 = load ptr, ptr %8, align 8, !dbg !577
  %32 = load i32, ptr %17, align 4, !dbg !578
  %33 = sext i32 %32 to i64, !dbg !577
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !577
  %35 = load ptr, ptr %34, align 8, !dbg !577
  %36 = load i32, ptr %18, align 4, !dbg !579
  %37 = sext i32 %36 to i64, !dbg !577
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %35, i64 %37, !dbg !577
  store ptr %38, ptr %19, align 8, !dbg !576
  %39 = load ptr, ptr %19, align 8, !dbg !580
  %40 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i32 0, i32 0, !dbg !581
  %41 = load x86_fp80, ptr %40, align 16, !dbg !581
  store x86_fp80 %41, ptr %15, align 16, !dbg !582
  %42 = load ptr, ptr %19, align 8, !dbg !583
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %42, i32 0, i32 1, !dbg !584
  %44 = load x86_fp80, ptr %43, align 16, !dbg !584
  store x86_fp80 %44, ptr %16, align 16, !dbg !585
  call void @llvm.dbg.declare(metadata ptr %20, metadata !586, metadata !DIExpression()), !dbg !587
  %45 = load ptr, ptr %10, align 8, !dbg !588
  %46 = load ptr, ptr %9, align 8, !dbg !589
  %47 = load x86_fp80, ptr %15, align 16, !dbg !590
  %48 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %45, ptr noundef %46, x86_fp80 noundef %47), !dbg !591
  store x86_fp80 %48, ptr %20, align 16, !dbg !587
  %49 = load ptr, ptr %10, align 8, !dbg !592
  call void @arenaReset(ptr noundef %49), !dbg !593
  %50 = load x86_fp80, ptr %20, align 16, !dbg !594
  %51 = load x86_fp80, ptr %16, align 16, !dbg !596
  %52 = load x86_fp80, ptr %12, align 16, !dbg !597
  %53 = fdiv x86_fp80 %52, 0xK40008666666666666800, !dbg !598
  %54 = call zeroext i1 @closeTo(x86_fp80 noundef %50, x86_fp80 noundef %51, x86_fp80 noundef %53), !dbg !599
  br i1 %54, label %55, label %62, !dbg !600

55:                                               ; preds = %30
  %56 = load x86_fp80, ptr %20, align 16, !dbg !601
  %57 = load x86_fp80, ptr %16, align 16, !dbg !602
  %58 = load x86_fp80, ptr %12, align 16, !dbg !603
  %59 = call signext i8 @yCompress(x86_fp80 noundef %56, x86_fp80 noundef %57, x86_fp80 noundef %58), !dbg !604
  %60 = load ptr, ptr %19, align 8, !dbg !605
  %61 = getelementptr inbounds %struct.CalcLangPixel, ptr %60, i32 0, i32 2, !dbg !606
  store i8 %59, ptr %61, align 16, !dbg !607
  br label %62, !dbg !605

62:                                               ; preds = %55, %30
  br label %63, !dbg !608

63:                                               ; preds = %62
  %64 = load i32, ptr %18, align 4, !dbg !609
  %65 = add nsw i32 %64, 1, !dbg !609
  store i32 %65, ptr %18, align 4, !dbg !609
  br label %26, !dbg !610, !llvm.loop !611

66:                                               ; preds = %26
  br label %67, !dbg !613

67:                                               ; preds = %66
  %68 = load i32, ptr %17, align 4, !dbg !614
  %69 = add nsw i32 %68, 1, !dbg !614
  store i32 %69, ptr %17, align 4, !dbg !614
  br label %21, !dbg !615, !llvm.loop !616

70:                                               ; preds = %21
  ret void, !dbg !618
}

declare void @arenaReset(ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printDisplayCordinates(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !619 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !624, metadata !DIExpression()), !dbg !625
  call void @llvm.dbg.declare(metadata ptr %7, metadata !626, metadata !DIExpression()), !dbg !628
  store i32 0, ptr %7, align 4, !dbg !628
  br label %9, !dbg !629

9:                                                ; preds = %46, %3
  %10 = load i32, ptr %7, align 4, !dbg !630
  %11 = load i32, ptr %5, align 4, !dbg !632
  %12 = icmp slt i32 %10, %11, !dbg !633
  br i1 %12, label %13, label %49, !dbg !634

13:                                               ; preds = %9
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !635
  call void @llvm.dbg.declare(metadata ptr %8, metadata !637, metadata !DIExpression()), !dbg !639
  store i32 0, ptr %8, align 4, !dbg !639
  br label %15, !dbg !640

15:                                               ; preds = %41, %13
  %16 = load i32, ptr %8, align 4, !dbg !641
  %17 = load i32, ptr %6, align 4, !dbg !643
  %18 = icmp slt i32 %16, %17, !dbg !644
  br i1 %18, label %19, label %44, !dbg !645

19:                                               ; preds = %15
  %20 = load ptr, ptr %4, align 8, !dbg !646
  %21 = load i32, ptr %7, align 4, !dbg !648
  %22 = sext i32 %21 to i64, !dbg !646
  %23 = getelementptr inbounds ptr, ptr %20, i64 %22, !dbg !646
  %24 = load ptr, ptr %23, align 8, !dbg !646
  %25 = load i32, ptr %8, align 4, !dbg !649
  %26 = sext i32 %25 to i64, !dbg !646
  %27 = getelementptr inbounds %struct.CalcLangPixel, ptr %24, i64 %26, !dbg !646
  %28 = getelementptr inbounds %struct.CalcLangPixel, ptr %27, i32 0, i32 0, !dbg !650
  %29 = load x86_fp80, ptr %28, align 16, !dbg !650
  %30 = load ptr, ptr %4, align 8, !dbg !651
  %31 = load i32, ptr %7, align 4, !dbg !652
  %32 = sext i32 %31 to i64, !dbg !651
  %33 = getelementptr inbounds ptr, ptr %30, i64 %32, !dbg !651
  %34 = load ptr, ptr %33, align 8, !dbg !651
  %35 = load i32, ptr %8, align 4, !dbg !653
  %36 = sext i32 %35 to i64, !dbg !651
  %37 = getelementptr inbounds %struct.CalcLangPixel, ptr %34, i64 %36, !dbg !651
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 1, !dbg !654
  %39 = load x86_fp80, ptr %38, align 16, !dbg !654
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, x86_fp80 noundef %29, x86_fp80 noundef %39), !dbg !655
  br label %41, !dbg !656

41:                                               ; preds = %19
  %42 = load i32, ptr %8, align 4, !dbg !657
  %43 = add nsw i32 %42, 1, !dbg !657
  store i32 %43, ptr %8, align 4, !dbg !657
  br label %15, !dbg !658, !llvm.loop !659

44:                                               ; preds = %15
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !dbg !661
  br label %46, !dbg !662

46:                                               ; preds = %44
  %47 = load i32, ptr %7, align 4, !dbg !663
  %48 = add nsw i32 %47, 1, !dbg !663
  store i32 %48, ptr %7, align 4, !dbg !663
  br label %9, !dbg !664, !llvm.loop !665

49:                                               ; preds = %9
  ret void, !dbg !667
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !668 {
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca x86_fp80, align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  %12 = alloca x86_fp80, align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !671, metadata !DIExpression()), !dbg !672
  store x86_fp80 %1, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !673, metadata !DIExpression()), !dbg !674
  store x86_fp80 %2, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !675, metadata !DIExpression()), !dbg !676
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !677, metadata !DIExpression()), !dbg !678
  store i32 %4, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !679, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.declare(metadata ptr %11, metadata !681, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.declare(metadata ptr %12, metadata !683, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.declare(metadata ptr %13, metadata !685, metadata !DIExpression()), !dbg !687
  store i32 0, ptr %13, align 4, !dbg !687
  br label %19, !dbg !688

19:                                               ; preds = %88, %5
  %20 = load i32, ptr %13, align 4, !dbg !689
  %21 = load i32, ptr %9, align 4, !dbg !691
  %22 = icmp slt i32 %20, %21, !dbg !692
  br i1 %22, label %23, label %91, !dbg !693

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %14, metadata !694, metadata !DIExpression()), !dbg !697
  store i32 0, ptr %14, align 4, !dbg !697
  br label %24, !dbg !698

24:                                               ; preds = %84, %23
  %25 = load i32, ptr %14, align 4, !dbg !699
  %26 = load i32, ptr %10, align 4, !dbg !701
  %27 = icmp slt i32 %25, %26, !dbg !702
  br i1 %27, label %28, label %87, !dbg !703

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %15, metadata !704, metadata !DIExpression()), !dbg !706
  %29 = load ptr, ptr %6, align 8, !dbg !707
  %30 = load i32, ptr %13, align 4, !dbg !708
  %31 = sext i32 %30 to i64, !dbg !707
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31, !dbg !707
  %33 = load ptr, ptr %32, align 8, !dbg !707
  %34 = load i32, ptr %14, align 4, !dbg !709
  %35 = sext i32 %34 to i64, !dbg !707
  %36 = getelementptr inbounds %struct.CalcLangPixel, ptr %33, i64 %35, !dbg !707
  store ptr %36, ptr %15, align 8, !dbg !706
  %37 = load ptr, ptr %15, align 8, !dbg !710
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 0, !dbg !711
  %39 = load x86_fp80, ptr %38, align 16, !dbg !711
  store x86_fp80 %39, ptr %11, align 16, !dbg !712
  %40 = load ptr, ptr %15, align 8, !dbg !713
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i32 0, i32 1, !dbg !714
  %42 = load x86_fp80, ptr %41, align 16, !dbg !714
  store x86_fp80 %42, ptr %12, align 16, !dbg !715
  call void @llvm.dbg.declare(metadata ptr %16, metadata !716, metadata !DIExpression()), !dbg !717
  %43 = load x86_fp80, ptr %11, align 16, !dbg !718
  %44 = load x86_fp80, ptr %7, align 16, !dbg !719
  %45 = fdiv x86_fp80 %44, 0xK40008666666666666800, !dbg !720
  %46 = call zeroext i1 @closeTo(x86_fp80 noundef %43, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %45), !dbg !721
  %47 = zext i1 %46 to i8, !dbg !717
  store i8 %47, ptr %16, align 1, !dbg !717
  call void @llvm.dbg.declare(metadata ptr %17, metadata !722, metadata !DIExpression()), !dbg !723
  %48 = load x86_fp80, ptr %12, align 16, !dbg !724
  %49 = load x86_fp80, ptr %8, align 16, !dbg !725
  %50 = fdiv x86_fp80 %49, 0xK40008666666666666800, !dbg !726
  %51 = call zeroext i1 @closeTo(x86_fp80 noundef %48, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %50), !dbg !727
  %52 = zext i1 %51 to i8, !dbg !723
  store i8 %52, ptr %17, align 1, !dbg !723
  call void @llvm.dbg.declare(metadata ptr %18, metadata !728, metadata !DIExpression()), !dbg !729
  %53 = load i8, ptr %16, align 1, !dbg !730
  %54 = trunc i8 %53 to i1, !dbg !730
  br i1 %54, label %55, label %58, !dbg !731

55:                                               ; preds = %28
  %56 = load i8, ptr %17, align 1, !dbg !732
  %57 = trunc i8 %56 to i1, !dbg !732
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi i1 [ false, %28 ], [ %57, %55 ], !dbg !733
  %60 = zext i1 %59 to i8, !dbg !729
  store i8 %60, ptr %18, align 1, !dbg !729
  %61 = load i8, ptr %18, align 1, !dbg !734
  %62 = trunc i8 %61 to i1, !dbg !734
  br i1 %62, label %63, label %66, !dbg !736

63:                                               ; preds = %58
  %64 = load ptr, ptr %15, align 8, !dbg !737
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 2, !dbg !738
  store i8 43, ptr %65, align 16, !dbg !739
  br label %83, !dbg !737

66:                                               ; preds = %58
  %67 = load i8, ptr %16, align 1, !dbg !740
  %68 = trunc i8 %67 to i1, !dbg !740
  br i1 %68, label %69, label %72, !dbg !742

69:                                               ; preds = %66
  %70 = load ptr, ptr %15, align 8, !dbg !743
  %71 = getelementptr inbounds %struct.CalcLangPixel, ptr %70, i32 0, i32 2, !dbg !744
  store i8 124, ptr %71, align 16, !dbg !745
  br label %82, !dbg !743

72:                                               ; preds = %66
  %73 = load i8, ptr %17, align 1, !dbg !746
  %74 = trunc i8 %73 to i1, !dbg !746
  br i1 %74, label %75, label %78, !dbg !748

75:                                               ; preds = %72
  %76 = load ptr, ptr %15, align 8, !dbg !749
  %77 = getelementptr inbounds %struct.CalcLangPixel, ptr %76, i32 0, i32 2, !dbg !750
  store i8 45, ptr %77, align 16, !dbg !751
  br label %81, !dbg !749

78:                                               ; preds = %72
  %79 = load ptr, ptr %15, align 8, !dbg !752
  %80 = getelementptr inbounds %struct.CalcLangPixel, ptr %79, i32 0, i32 2, !dbg !753
  store i8 32, ptr %80, align 16, !dbg !754
  br label %81

81:                                               ; preds = %78, %75
  br label %82

82:                                               ; preds = %81, %69
  br label %83

83:                                               ; preds = %82, %63
  br label %84, !dbg !755

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4, !dbg !756
  %86 = add nsw i32 %85, 1, !dbg !756
  store i32 %86, ptr %14, align 4, !dbg !756
  br label %24, !dbg !757, !llvm.loop !758

87:                                               ; preds = %24
  br label %88, !dbg !760

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4, !dbg !761
  %90 = add nsw i32 %89, 1, !dbg !761
  store i32 %90, ptr %13, align 4, !dbg !761
  br label %19, !dbg !762, !llvm.loop !763

91:                                               ; preds = %19
  ret void, !dbg !765
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, i32 noundef %1) #0 !dbg !766 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !769, metadata !DIExpression()), !dbg !770
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !771, metadata !DIExpression()), !dbg !772
  call void @llvm.dbg.declare(metadata ptr %5, metadata !773, metadata !DIExpression()), !dbg !775
  store i32 0, ptr %5, align 4, !dbg !775
  br label %6, !dbg !776

6:                                                ; preds = %16, %2
  %7 = load i32, ptr %5, align 4, !dbg !777
  %8 = load i32, ptr %4, align 4, !dbg !779
  %9 = icmp slt i32 %7, %8, !dbg !780
  br i1 %9, label %10, label %19, !dbg !781

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8, !dbg !782
  %12 = load i32, ptr %5, align 4, !dbg !784
  %13 = sext i32 %12 to i64, !dbg !782
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13, !dbg !782
  %15 = load ptr, ptr %14, align 8, !dbg !782
  call void @free(ptr noundef %15) #9, !dbg !785
  br label %16, !dbg !786

16:                                               ; preds = %10
  %17 = load i32, ptr %5, align 4, !dbg !787
  %18 = add nsw i32 %17, 1, !dbg !787
  store i32 %18, ptr %5, align 4, !dbg !787
  br label %6, !dbg !788, !llvm.loop !789

19:                                               ; preds = %6
  %20 = load ptr, ptr %3, align 8, !dbg !791
  call void @free(ptr noundef %20) #9, !dbg !792
  ret void, !dbg !793
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @findYMax(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !794 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca x86_fp80, align 16
  %12 = alloca i32, align 4
  %13 = alloca x86_fp80, align 16
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !797, metadata !DIExpression()), !dbg !798
  store i32 %1, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !799, metadata !DIExpression()), !dbg !800
  store i32 %2, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !801, metadata !DIExpression()), !dbg !802
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !803, metadata !DIExpression()), !dbg !804
  store ptr %4, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !805, metadata !DIExpression()), !dbg !806
  call void @llvm.dbg.declare(metadata ptr %11, metadata !807, metadata !DIExpression()), !dbg !808
  %14 = load ptr, ptr %6, align 8, !dbg !809
  %15 = load ptr, ptr %10, align 8, !dbg !810
  %16 = load i32, ptr %7, align 4, !dbg !811
  %17 = sitofp i32 %16 to x86_fp80, !dbg !811
  %18 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %14, ptr noundef %15, x86_fp80 noundef %17), !dbg !812
  store x86_fp80 %18, ptr %11, align 16, !dbg !808
  call void @llvm.dbg.declare(metadata ptr %12, metadata !813, metadata !DIExpression()), !dbg !815
  %19 = load i32, ptr %7, align 4, !dbg !816
  %20 = add nsw i32 %19, 1, !dbg !817
  store i32 %20, ptr %12, align 4, !dbg !815
  br label %21, !dbg !818

21:                                               ; preds = %38, %5
  %22 = load i32, ptr %12, align 4, !dbg !819
  %23 = load i32, ptr %8, align 4, !dbg !821
  %24 = icmp sle i32 %22, %23, !dbg !822
  br i1 %24, label %25, label %42, !dbg !823

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %13, metadata !824, metadata !DIExpression()), !dbg !826
  %26 = load ptr, ptr %6, align 8, !dbg !827
  %27 = load ptr, ptr %10, align 8, !dbg !828
  %28 = load i32, ptr %12, align 4, !dbg !829
  %29 = sitofp i32 %28 to x86_fp80, !dbg !829
  %30 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %26, ptr noundef %27, x86_fp80 noundef %29), !dbg !830
  store x86_fp80 %30, ptr %13, align 16, !dbg !826
  %31 = load ptr, ptr %6, align 8, !dbg !831
  call void @arenaReset(ptr noundef %31), !dbg !832
  %32 = load x86_fp80, ptr %13, align 16, !dbg !833
  %33 = load x86_fp80, ptr %11, align 16, !dbg !835
  %34 = fcmp ogt x86_fp80 %32, %33, !dbg !836
  br i1 %34, label %35, label %37, !dbg !837

35:                                               ; preds = %25
  %36 = load x86_fp80, ptr %13, align 16, !dbg !838
  store x86_fp80 %36, ptr %11, align 16, !dbg !840
  br label %37, !dbg !841

37:                                               ; preds = %35, %25
  br label %38, !dbg !842

38:                                               ; preds = %37
  %39 = load i32, ptr %9, align 4, !dbg !843
  %40 = load i32, ptr %12, align 4, !dbg !844
  %41 = add nsw i32 %40, %39, !dbg !844
  store i32 %41, ptr %12, align 4, !dbg !844
  br label %21, !dbg !845, !llvm.loop !846

42:                                               ; preds = %21
  %43 = load x86_fp80, ptr %11, align 16, !dbg !848
  ret x86_fp80 %43, !dbg !849
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @findYMin(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !850 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca x86_fp80, align 16
  %12 = alloca i32, align 4
  %13 = alloca x86_fp80, align 16
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !851, metadata !DIExpression()), !dbg !852
  store i32 %1, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !853, metadata !DIExpression()), !dbg !854
  store i32 %2, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !855, metadata !DIExpression()), !dbg !856
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !857, metadata !DIExpression()), !dbg !858
  store ptr %4, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !859, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.declare(metadata ptr %11, metadata !861, metadata !DIExpression()), !dbg !862
  %14 = load ptr, ptr %6, align 8, !dbg !863
  %15 = load ptr, ptr %10, align 8, !dbg !864
  %16 = load i32, ptr %7, align 4, !dbg !865
  %17 = sitofp i32 %16 to x86_fp80, !dbg !865
  %18 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %14, ptr noundef %15, x86_fp80 noundef %17), !dbg !866
  store x86_fp80 %18, ptr %11, align 16, !dbg !862
  call void @llvm.dbg.declare(metadata ptr %12, metadata !867, metadata !DIExpression()), !dbg !869
  %19 = load i32, ptr %7, align 4, !dbg !870
  %20 = add nsw i32 %19, 1, !dbg !871
  store i32 %20, ptr %12, align 4, !dbg !869
  br label %21, !dbg !872

21:                                               ; preds = %38, %5
  %22 = load i32, ptr %12, align 4, !dbg !873
  %23 = load i32, ptr %8, align 4, !dbg !875
  %24 = icmp sle i32 %22, %23, !dbg !876
  br i1 %24, label %25, label %42, !dbg !877

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %13, metadata !878, metadata !DIExpression()), !dbg !880
  %26 = load ptr, ptr %6, align 8, !dbg !881
  %27 = load ptr, ptr %10, align 8, !dbg !882
  %28 = load i32, ptr %12, align 4, !dbg !883
  %29 = sitofp i32 %28 to x86_fp80, !dbg !883
  %30 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %26, ptr noundef %27, x86_fp80 noundef %29), !dbg !884
  store x86_fp80 %30, ptr %13, align 16, !dbg !880
  %31 = load ptr, ptr %6, align 8, !dbg !885
  call void @arenaReset(ptr noundef %31), !dbg !886
  %32 = load x86_fp80, ptr %13, align 16, !dbg !887
  %33 = load x86_fp80, ptr %11, align 16, !dbg !889
  %34 = fcmp olt x86_fp80 %32, %33, !dbg !890
  br i1 %34, label %35, label %37, !dbg !891

35:                                               ; preds = %25
  %36 = load x86_fp80, ptr %13, align 16, !dbg !892
  store x86_fp80 %36, ptr %11, align 16, !dbg !894
  br label %37, !dbg !895

37:                                               ; preds = %35, %25
  br label %38, !dbg !896

38:                                               ; preds = %37
  %39 = load i32, ptr %9, align 4, !dbg !897
  %40 = load i32, ptr %12, align 4, !dbg !898
  %41 = add nsw i32 %40, %39, !dbg !898
  store i32 %41, ptr %12, align 4, !dbg !898
  br label %21, !dbg !899, !llvm.loop !900

42:                                               ; preds = %21
  %43 = load x86_fp80, ptr %11, align 16, !dbg !902
  ret x86_fp80 %43, !dbg !903
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !904 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca x86_fp80, align 16
  %14 = alloca x86_fp80, align 16
  %15 = alloca x86_fp80, align 16
  %16 = alloca x86_fp80, align 16
  %17 = alloca x86_fp80, align 16
  %18 = alloca x86_fp80, align 16
  %19 = alloca x86_fp80, align 16
  %20 = alloca x86_fp80, align 16
  %21 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !907, metadata !DIExpression()), !dbg !908
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !909, metadata !DIExpression()), !dbg !910
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !911, metadata !DIExpression()), !dbg !912
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !913, metadata !DIExpression()), !dbg !914
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !915, metadata !DIExpression()), !dbg !916
  call void @llvm.dbg.declare(metadata ptr %12, metadata !917, metadata !DIExpression()), !dbg !926
  %22 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #9, !dbg !927
  %23 = icmp eq i32 %22, -1, !dbg !929
  br i1 %23, label %24, label %25, !dbg !930

24:                                               ; preds = %5
  call void @perror(ptr noundef @.str.5) #8, !dbg !931
  store i1 false, ptr %6, align 1, !dbg !933
  br label %153, !dbg !933

25:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !934, metadata !DIExpression()), !dbg !935
  %26 = load i32, ptr %9, align 4, !dbg !936
  %27 = load i32, ptr %8, align 4, !dbg !937
  %28 = sub nsw i32 %26, %27, !dbg !938
  %29 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !939
  %30 = load i16, ptr %29, align 2, !dbg !939
  %31 = zext i16 %30 to i32, !dbg !940
  %32 = sdiv i32 %28, %31, !dbg !941
  %33 = mul nsw i32 %32, 2, !dbg !942
  %34 = sitofp i32 %33 to x86_fp80, !dbg !943
  store x86_fp80 %34, ptr %13, align 16, !dbg !935
  call void @llvm.dbg.declare(metadata ptr %14, metadata !944, metadata !DIExpression()), !dbg !945
  %35 = load x86_fp80, ptr %13, align 16, !dbg !946
  %36 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !947
  %37 = load i16, ptr %36, align 2, !dbg !947
  %38 = zext i16 %37 to i32, !dbg !948
  %39 = sdiv i32 %38, 2, !dbg !949
  %40 = sitofp i32 %39 to x86_fp80, !dbg !950
  %41 = fmul x86_fp80 %35, %40, !dbg !951
  %42 = fneg x86_fp80 %41, !dbg !952
  store x86_fp80 %42, ptr %14, align 16, !dbg !945
  call void @llvm.dbg.declare(metadata ptr %15, metadata !953, metadata !DIExpression()), !dbg !954
  %43 = load x86_fp80, ptr %13, align 16, !dbg !955
  %44 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !956
  %45 = load i16, ptr %44, align 2, !dbg !956
  %46 = zext i16 %45 to i32, !dbg !957
  %47 = sdiv i32 %46, 2, !dbg !958
  %48 = sitofp i32 %47 to x86_fp80, !dbg !959
  %49 = fmul x86_fp80 %43, %48, !dbg !960
  store x86_fp80 %49, ptr %15, align 16, !dbg !954
  call void @llvm.dbg.declare(metadata ptr %16, metadata !961, metadata !DIExpression()), !dbg !962
  %50 = load ptr, ptr %7, align 8, !dbg !963
  %51 = load x86_fp80, ptr %14, align 16, !dbg !964
  %52 = fptosi x86_fp80 %51 to i32, !dbg !964
  %53 = load x86_fp80, ptr %15, align 16, !dbg !965
  %54 = fptosi x86_fp80 %53 to i32, !dbg !965
  %55 = load i32, ptr %10, align 4, !dbg !966
  %56 = load ptr, ptr %11, align 8, !dbg !967
  %57 = call x86_fp80 @findYMax(ptr noundef %50, i32 noundef %52, i32 noundef %54, i32 noundef %55, ptr noundef %56), !dbg !968
  store x86_fp80 %57, ptr %16, align 16, !dbg !962
  call void @llvm.dbg.declare(metadata ptr %17, metadata !969, metadata !DIExpression()), !dbg !970
  %58 = load ptr, ptr %7, align 8, !dbg !971
  %59 = load x86_fp80, ptr %14, align 16, !dbg !972
  %60 = fptosi x86_fp80 %59 to i32, !dbg !972
  %61 = load x86_fp80, ptr %15, align 16, !dbg !973
  %62 = fptosi x86_fp80 %61 to i32, !dbg !973
  %63 = load i32, ptr %10, align 4, !dbg !974
  %64 = load ptr, ptr %11, align 8, !dbg !975
  %65 = call x86_fp80 @findYMin(ptr noundef %58, i32 noundef %60, i32 noundef %62, i32 noundef %63, ptr noundef %64), !dbg !976
  store x86_fp80 %65, ptr %17, align 16, !dbg !970
  call void @llvm.dbg.declare(metadata ptr %18, metadata !977, metadata !DIExpression()), !dbg !978
  %66 = load x86_fp80, ptr %16, align 16, !dbg !979
  %67 = load x86_fp80, ptr %17, align 16, !dbg !980
  %68 = fsub x86_fp80 %66, %67, !dbg !981
  %69 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !982
  %70 = load i16, ptr %69, align 2, !dbg !982
  %71 = zext i16 %70 to i32, !dbg !983
  %72 = sitofp i32 %71 to x86_fp80, !dbg !983
  %73 = fdiv x86_fp80 %68, %72, !dbg !984
  store x86_fp80 %73, ptr %18, align 16, !dbg !978
  call void @llvm.dbg.declare(metadata ptr %19, metadata !985, metadata !DIExpression()), !dbg !986
  %74 = load x86_fp80, ptr %18, align 16, !dbg !987
  %75 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !988
  %76 = load i16, ptr %75, align 2, !dbg !988
  %77 = zext i16 %76 to i32, !dbg !989
  %78 = sdiv i32 %77, 2, !dbg !990
  %79 = sitofp i32 %78 to x86_fp80, !dbg !991
  %80 = fmul x86_fp80 %74, %79, !dbg !992
  %81 = fneg x86_fp80 %80, !dbg !993
  store x86_fp80 %81, ptr %19, align 16, !dbg !986
  call void @llvm.dbg.declare(metadata ptr %20, metadata !994, metadata !DIExpression()), !dbg !995
  %82 = load x86_fp80, ptr %18, align 16, !dbg !996
  %83 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !997
  %84 = load i16, ptr %83, align 2, !dbg !997
  %85 = zext i16 %84 to i32, !dbg !998
  %86 = sdiv i32 %85, 2, !dbg !999
  %87 = sitofp i32 %86 to x86_fp80, !dbg !1000
  %88 = fmul x86_fp80 %82, %87, !dbg !1001
  store x86_fp80 %88, ptr %20, align 16, !dbg !995
  %89 = load x86_fp80, ptr %13, align 16, !dbg !1002
  %90 = load x86_fp80, ptr %14, align 16, !dbg !1003
  %91 = load x86_fp80, ptr %15, align 16, !dbg !1004
  %92 = load x86_fp80, ptr %16, align 16, !dbg !1005
  %93 = load x86_fp80, ptr %17, align 16, !dbg !1006
  %94 = load x86_fp80, ptr %18, align 16, !dbg !1007
  %95 = load x86_fp80, ptr %19, align 16, !dbg !1008
  %96 = load x86_fp80, ptr %20, align 16, !dbg !1009
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, x86_fp80 noundef %89, x86_fp80 noundef %90, x86_fp80 noundef %91, x86_fp80 noundef %92, x86_fp80 noundef %93, x86_fp80 noundef %94, x86_fp80 noundef %95, x86_fp80 noundef %96), !dbg !1010
  call void @llvm.dbg.declare(metadata ptr %21, metadata !1011, metadata !DIExpression()), !dbg !1012
  %98 = load x86_fp80, ptr %13, align 16, !dbg !1013
  %99 = load x86_fp80, ptr %18, align 16, !dbg !1014
  %100 = load x86_fp80, ptr %14, align 16, !dbg !1015
  %101 = load x86_fp80, ptr %20, align 16, !dbg !1016
  %102 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1017
  %103 = load i16, ptr %102, align 2, !dbg !1017
  %104 = zext i16 %103 to i32, !dbg !1018
  %105 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1019
  %106 = load i16, ptr %105, align 2, !dbg !1019
  %107 = zext i16 %106 to i32, !dbg !1020
  %108 = call ptr @quantifyPlane(x86_fp80 noundef %98, x86_fp80 noundef %99, x86_fp80 noundef %100, x86_fp80 noundef %101, i32 noundef %104, i32 noundef %107), !dbg !1021
  store ptr %108, ptr %21, align 8, !dbg !1012
  %109 = load ptr, ptr %21, align 8, !dbg !1022
  %110 = load x86_fp80, ptr %13, align 16, !dbg !1023
  %111 = load x86_fp80, ptr %18, align 16, !dbg !1024
  %112 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1025
  %113 = load i16, ptr %112, align 2, !dbg !1025
  %114 = zext i16 %113 to i32, !dbg !1026
  %115 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1027
  %116 = load i16, ptr %115, align 2, !dbg !1027
  %117 = zext i16 %116 to i32, !dbg !1028
  call void @drawPlane(ptr noundef %109, x86_fp80 noundef %110, x86_fp80 noundef %111, i32 noundef %114, i32 noundef %117), !dbg !1029
  %118 = load ptr, ptr %21, align 8, !dbg !1030
  %119 = load ptr, ptr %11, align 8, !dbg !1031
  %120 = load ptr, ptr %7, align 8, !dbg !1032
  %121 = load x86_fp80, ptr %13, align 16, !dbg !1033
  %122 = load x86_fp80, ptr %18, align 16, !dbg !1034
  %123 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1035
  %124 = load i16, ptr %123, align 2, !dbg !1035
  %125 = zext i16 %124 to i32, !dbg !1036
  %126 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1037
  %127 = load i16, ptr %126, align 2, !dbg !1037
  %128 = zext i16 %127 to i32, !dbg !1038
  call void @drawLine(ptr noundef %118, ptr noundef %119, ptr noundef %120, x86_fp80 noundef %121, x86_fp80 noundef %122, i32 noundef %125, i32 noundef %128), !dbg !1039
  %129 = load ptr, ptr %21, align 8, !dbg !1040
  %130 = load ptr, ptr %11, align 8, !dbg !1041
  %131 = load ptr, ptr %7, align 8, !dbg !1042
  %132 = load x86_fp80, ptr %13, align 16, !dbg !1043
  %133 = load x86_fp80, ptr %18, align 16, !dbg !1044
  %134 = load x86_fp80, ptr %14, align 16, !dbg !1045
  %135 = load x86_fp80, ptr %15, align 16, !dbg !1046
  %136 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1047
  %137 = load i16, ptr %136, align 2, !dbg !1047
  %138 = zext i16 %137 to i32, !dbg !1048
  %139 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1049
  %140 = load i16, ptr %139, align 2, !dbg !1049
  %141 = zext i16 %140 to i32, !dbg !1050
  call void @shadeGraph(ptr noundef %129, ptr noundef %130, ptr noundef %131, x86_fp80 noundef %132, x86_fp80 noundef %133, x86_fp80 noundef %134, x86_fp80 noundef %135, i32 noundef %138, i32 noundef %141), !dbg !1051
  %142 = load ptr, ptr %21, align 8, !dbg !1052
  %143 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1053
  %144 = load i16, ptr %143, align 2, !dbg !1053
  %145 = zext i16 %144 to i32, !dbg !1054
  %146 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1055
  %147 = load i16, ptr %146, align 2, !dbg !1055
  %148 = zext i16 %147 to i32, !dbg !1056
  call void @printPlane(ptr noundef %142, i32 noundef %145, i32 noundef %148), !dbg !1057
  %149 = load ptr, ptr %21, align 8, !dbg !1058
  %150 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1059
  %151 = load i16, ptr %150, align 2, !dbg !1059
  %152 = zext i16 %151 to i32, !dbg !1060
  call void @clearDisplay(ptr noundef %149, i32 noundef %152), !dbg !1061
  store i1 true, ptr %6, align 1, !dbg !1062
  br label %153, !dbg !1062

153:                                              ; preds = %25, %24
  %154 = load i1, ptr %6, align 1, !dbg !1063
  ret i1 %154, !dbg !1063
}

; Function Attrs: nounwind
declare i32 @ioctl(i32 noundef, i64 noundef, ...) #6

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { cold }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!53, !54, !55, !56, !57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !7, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "7d96c843c0fb847fa84b0c330f2020e9")
!4 = !{!5, !15, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangPixel", file: !7, line: 14, baseType: !8)
!7 = !DIFile(filename: "lib/include/c/CalcLangCGraph.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "af8ebafaed073c52c356364ef6641baf")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 11, size: 384, elements: !9)
!9 = !{!10, !12, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !8, file: !7, line: 12, baseType: !11, size: 128)
!11 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !8, file: !7, line: 12, baseType: !11, size: 128, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "display", scope: !8, file: !7, line: 13, baseType: !14, size: 8, offset: 256)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!0, !17, !23, !28, !33, !38, !43, !48}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !19, line: 39, type: !20, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "7d96c843c0fb847fa84b0c330f2020e9")
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 72, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 9)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !19, line: 78, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !19, line: 121, type: !30, isLocal: true, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 16, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 2)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(scope: null, file: !19, line: 123, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !19, line: 125, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 24, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 3)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !19, line: 189, type: !45, isLocal: true, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 104, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 13)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(scope: null, file: !19, line: 204, type: !50, isLocal: true, isDefinition: true)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 752, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 94)
!53 = !{i32 7, !"Dwarf Version", i32 5}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{i32 8, !"PIC Level", i32 2}
!57 = !{i32 7, !"PIE Level", i32 2}
!58 = !{i32 7, !"uwtable", i32 2}
!59 = !{i32 7, !"frame-pointer", i32 2}
!60 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!61 = distinct !DISubprogram(name: "closeTo", scope: !19, file: !19, line: 11, type: !62, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !11, !11, !11}
!64 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!65 = !{}
!66 = !DILocalVariable(name: "x", arg: 1, scope: !61, file: !19, line: 11, type: !11)
!67 = !DILocation(line: 11, column: 26, scope: !61)
!68 = !DILocalVariable(name: "y", arg: 2, scope: !61, file: !19, line: 11, type: !11)
!69 = !DILocation(line: 11, column: 41, scope: !61)
!70 = !DILocalVariable(name: "deviation", arg: 3, scope: !61, file: !19, line: 11, type: !11)
!71 = !DILocation(line: 11, column: 56, scope: !61)
!72 = !DILocation(line: 12, column: 16, scope: !61)
!73 = !DILocation(line: 12, column: 18, scope: !61)
!74 = !DILocation(line: 12, column: 17, scope: !61)
!75 = !DILocation(line: 12, column: 10, scope: !61)
!76 = !DILocation(line: 12, column: 23, scope: !61)
!77 = !DILocation(line: 12, column: 21, scope: !61)
!78 = !DILocation(line: 12, column: 3, scope: !61)
!79 = distinct !DISubprogram(name: "initializeDisplay", scope: !19, file: !19, line: 15, type: !80, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !15, !15}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!83 = !DILocalVariable(name: "windowHeight", arg: 1, scope: !79, file: !19, line: 15, type: !15)
!84 = !DILocation(line: 15, column: 39, scope: !79)
!85 = !DILocalVariable(name: "windowWidth", arg: 2, scope: !79, file: !19, line: 15, type: !15)
!86 = !DILocation(line: 15, column: 57, scope: !79)
!87 = !DILocalVariable(name: "display", scope: !79, file: !19, line: 16, type: !82)
!88 = !DILocation(line: 16, column: 19, scope: !79)
!89 = !DILocation(line: 16, column: 61, scope: !79)
!90 = !DILocation(line: 16, column: 59, scope: !79)
!91 = !DILocation(line: 16, column: 29, scope: !79)
!92 = !DILocation(line: 17, column: 10, scope: !79)
!93 = !DILocation(line: 17, column: 22, scope: !79)
!94 = !DILocation(line: 17, column: 3, scope: !79)
!95 = !DILocalVariable(name: "i", scope: !96, file: !19, line: 18, type: !15)
!96 = distinct !DILexicalBlock(scope: !79, file: !19, line: 18, column: 3)
!97 = !DILocation(line: 18, column: 11, scope: !96)
!98 = !DILocation(line: 18, column: 7, scope: !96)
!99 = !DILocation(line: 18, column: 18, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 18, column: 3)
!101 = !DILocation(line: 18, column: 22, scope: !100)
!102 = !DILocation(line: 18, column: 20, scope: !100)
!103 = !DILocation(line: 18, column: 3, scope: !96)
!104 = !DILocation(line: 19, column: 65, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !19, line: 18, column: 40)
!106 = !DILocation(line: 19, column: 63, scope: !105)
!107 = !DILocation(line: 19, column: 34, scope: !105)
!108 = !DILocation(line: 19, column: 5, scope: !105)
!109 = !DILocation(line: 19, column: 13, scope: !105)
!110 = !DILocation(line: 19, column: 16, scope: !105)
!111 = !DILocation(line: 20, column: 12, scope: !105)
!112 = !DILocation(line: 20, column: 20, scope: !105)
!113 = !DILocation(line: 20, column: 27, scope: !105)
!114 = !DILocation(line: 20, column: 5, scope: !105)
!115 = !DILocation(line: 21, column: 3, scope: !105)
!116 = !DILocation(line: 18, column: 37, scope: !100)
!117 = !DILocation(line: 18, column: 3, scope: !100)
!118 = distinct !{!118, !103, !119, !120}
!119 = !DILocation(line: 21, column: 3, scope: !96)
!120 = !{!"llvm.loop.mustprogress"}
!121 = !DILocation(line: 22, column: 10, scope: !79)
!122 = !DILocation(line: 22, column: 3, scope: !79)
!123 = distinct !DISubprogram(name: "quantifyPlane", scope: !19, file: !19, line: 25, type: !124, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!124 = !DISubroutineType(types: !125)
!125 = !{!82, !11, !11, !11, !11, !15, !15}
!126 = !DILocalVariable(name: "xSteps", arg: 1, scope: !123, file: !19, line: 25, type: !11)
!127 = !DILocation(line: 25, column: 43, scope: !123)
!128 = !DILocalVariable(name: "ySteps", arg: 2, scope: !123, file: !19, line: 25, type: !11)
!129 = !DILocation(line: 25, column: 63, scope: !123)
!130 = !DILocalVariable(name: "xMin", arg: 3, scope: !123, file: !19, line: 25, type: !11)
!131 = !DILocation(line: 25, column: 83, scope: !123)
!132 = !DILocalVariable(name: "yMax", arg: 4, scope: !123, file: !19, line: 25, type: !11)
!133 = !DILocation(line: 25, column: 101, scope: !123)
!134 = !DILocalVariable(name: "windowHeight", arg: 5, scope: !123, file: !19, line: 25, type: !15)
!135 = !DILocation(line: 25, column: 111, scope: !123)
!136 = !DILocalVariable(name: "windowWidth", arg: 6, scope: !123, file: !19, line: 25, type: !15)
!137 = !DILocation(line: 25, column: 129, scope: !123)
!138 = !DILocalVariable(name: "display", scope: !123, file: !19, line: 26, type: !82)
!139 = !DILocation(line: 26, column: 19, scope: !123)
!140 = !DILocation(line: 26, column: 47, scope: !123)
!141 = !DILocation(line: 26, column: 61, scope: !123)
!142 = !DILocation(line: 26, column: 29, scope: !123)
!143 = !DILocalVariable(name: "y", scope: !144, file: !19, line: 28, type: !15)
!144 = distinct !DILexicalBlock(scope: !123, file: !19, line: 28, column: 3)
!145 = !DILocation(line: 28, column: 11, scope: !144)
!146 = !DILocation(line: 28, column: 7, scope: !144)
!147 = !DILocation(line: 28, column: 18, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !19, line: 28, column: 3)
!149 = !DILocation(line: 28, column: 22, scope: !148)
!150 = !DILocation(line: 28, column: 20, scope: !148)
!151 = !DILocation(line: 28, column: 3, scope: !144)
!152 = !DILocalVariable(name: "x", scope: !153, file: !19, line: 29, type: !15)
!153 = distinct !DILexicalBlock(scope: !154, file: !19, line: 29, column: 5)
!154 = distinct !DILexicalBlock(scope: !148, file: !19, line: 28, column: 40)
!155 = !DILocation(line: 29, column: 13, scope: !153)
!156 = !DILocation(line: 29, column: 9, scope: !153)
!157 = !DILocation(line: 29, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !19, line: 29, column: 5)
!159 = !DILocation(line: 29, column: 24, scope: !158)
!160 = !DILocation(line: 29, column: 22, scope: !158)
!161 = !DILocation(line: 29, column: 5, scope: !153)
!162 = !DILocation(line: 30, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !19, line: 29, column: 41)
!164 = !DILocation(line: 30, column: 33, scope: !163)
!165 = !DILocation(line: 30, column: 42, scope: !163)
!166 = !DILocation(line: 30, column: 30, scope: !163)
!167 = !DILocation(line: 30, column: 7, scope: !163)
!168 = !DILocation(line: 30, column: 15, scope: !163)
!169 = !DILocation(line: 30, column: 18, scope: !163)
!170 = !DILocation(line: 30, column: 21, scope: !163)
!171 = !DILocation(line: 30, column: 23, scope: !163)
!172 = !DILocation(line: 31, column: 25, scope: !163)
!173 = !DILocation(line: 31, column: 33, scope: !163)
!174 = !DILocation(line: 31, column: 42, scope: !163)
!175 = !DILocation(line: 31, column: 30, scope: !163)
!176 = !DILocation(line: 31, column: 7, scope: !163)
!177 = !DILocation(line: 31, column: 15, scope: !163)
!178 = !DILocation(line: 31, column: 18, scope: !163)
!179 = !DILocation(line: 31, column: 21, scope: !163)
!180 = !DILocation(line: 31, column: 23, scope: !163)
!181 = !DILocation(line: 32, column: 5, scope: !163)
!182 = !DILocation(line: 29, column: 38, scope: !158)
!183 = !DILocation(line: 29, column: 5, scope: !158)
!184 = distinct !{!184, !161, !185, !120}
!185 = !DILocation(line: 32, column: 5, scope: !153)
!186 = !DILocation(line: 33, column: 3, scope: !154)
!187 = !DILocation(line: 28, column: 37, scope: !148)
!188 = !DILocation(line: 28, column: 3, scope: !148)
!189 = distinct !{!189, !151, !190, !120}
!190 = !DILocation(line: 33, column: 3, scope: !144)
!191 = !DILocation(line: 35, column: 10, scope: !123)
!192 = !DILocation(line: 35, column: 3, scope: !123)
!193 = distinct !DISubprogram(name: "yCompress", scope: !19, file: !19, line: 38, type: !194, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!194 = !DISubroutineType(types: !195)
!195 = !{!14, !11, !11, !11}
!196 = !DILocalVariable(name: "num", arg: 1, scope: !193, file: !19, line: 38, type: !11)
!197 = !DILocation(line: 38, column: 28, scope: !193)
!198 = !DILocalVariable(name: "pixel", arg: 2, scope: !193, file: !19, line: 38, type: !11)
!199 = !DILocation(line: 38, column: 45, scope: !193)
!200 = !DILocalVariable(name: "range", arg: 3, scope: !193, file: !19, line: 38, type: !11)
!201 = !DILocation(line: 38, column: 64, scope: !193)
!202 = !DILocalVariable(name: "table", scope: !193, file: !19, line: 39, type: !203)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!204 = !DILocation(line: 39, column: 9, scope: !193)
!205 = !DILocalVariable(name: "steps", scope: !193, file: !19, line: 42, type: !11)
!206 = !DILocation(line: 42, column: 15, scope: !193)
!207 = !DILocation(line: 42, column: 23, scope: !193)
!208 = !DILocation(line: 42, column: 28, scope: !193)
!209 = !DILocalVariable(name: "goal", scope: !193, file: !19, line: 44, type: !11)
!210 = !DILocation(line: 44, column: 15, scope: !193)
!211 = !DILocation(line: 44, column: 22, scope: !193)
!212 = !DILocation(line: 44, column: 29, scope: !193)
!213 = !DILocation(line: 44, column: 38, scope: !193)
!214 = !DILocation(line: 44, column: 43, scope: !193)
!215 = !DILocation(line: 44, column: 35, scope: !193)
!216 = !DILocation(line: 44, column: 26, scope: !193)
!217 = !DILocalVariable(name: "counter", scope: !193, file: !19, line: 45, type: !15)
!218 = !DILocation(line: 45, column: 7, scope: !193)
!219 = !DILocalVariable(name: "step", scope: !193, file: !19, line: 46, type: !11)
!220 = !DILocation(line: 46, column: 15, scope: !193)
!221 = !DILocation(line: 47, column: 3, scope: !193)
!222 = !DILocation(line: 47, column: 9, scope: !193)
!223 = !DILocation(line: 47, column: 16, scope: !193)
!224 = !DILocation(line: 47, column: 14, scope: !193)
!225 = !DILocation(line: 48, column: 15, scope: !226)
!226 = distinct !DILexicalBlock(scope: !193, file: !19, line: 47, column: 22)
!227 = !DILocation(line: 48, column: 12, scope: !226)
!228 = !DILocation(line: 49, column: 14, scope: !226)
!229 = distinct !{!229, !221, !230, !120}
!230 = !DILocation(line: 50, column: 3, scope: !193)
!231 = !DILocation(line: 51, column: 10, scope: !193)
!232 = !DILocation(line: 51, column: 16, scope: !193)
!233 = !DILocation(line: 51, column: 24, scope: !193)
!234 = !DILocation(line: 51, column: 3, scope: !193)
!235 = distinct !DISubprogram(name: "printPlane", scope: !19, file: !19, line: 54, type: !236, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!236 = !DISubroutineType(types: !237)
!237 = !{null, !82, !15, !15}
!238 = !DILocalVariable(name: "display", arg: 1, scope: !235, file: !19, line: 54, type: !82)
!239 = !DILocation(line: 54, column: 33, scope: !235)
!240 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !235, file: !19, line: 54, type: !15)
!241 = !DILocation(line: 54, column: 46, scope: !235)
!242 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !235, file: !19, line: 54, type: !15)
!243 = !DILocation(line: 54, column: 64, scope: !235)
!244 = !DILocalVariable(name: "output", scope: !235, file: !19, line: 55, type: !245)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!246 = !DILocation(line: 55, column: 10, scope: !235)
!247 = !DILocation(line: 55, column: 42, scope: !235)
!248 = !DILocation(line: 55, column: 40, scope: !235)
!249 = !DILocation(line: 55, column: 55, scope: !235)
!250 = !DILocation(line: 55, column: 19, scope: !235)
!251 = !DILocalVariable(name: "i", scope: !252, file: !19, line: 56, type: !15)
!252 = distinct !DILexicalBlock(scope: !235, file: !19, line: 56, column: 3)
!253 = !DILocation(line: 56, column: 11, scope: !252)
!254 = !DILocation(line: 56, column: 7, scope: !252)
!255 = !DILocation(line: 56, column: 18, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !19, line: 56, column: 3)
!257 = !DILocation(line: 56, column: 22, scope: !256)
!258 = !DILocation(line: 56, column: 20, scope: !256)
!259 = !DILocation(line: 56, column: 3, scope: !252)
!260 = !DILocation(line: 57, column: 39, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !19, line: 56, column: 40)
!262 = !DILocation(line: 57, column: 37, scope: !261)
!263 = !DILocation(line: 57, column: 51, scope: !261)
!264 = !DILocation(line: 57, column: 17, scope: !261)
!265 = !DILocation(line: 57, column: 5, scope: !261)
!266 = !DILocation(line: 57, column: 12, scope: !261)
!267 = !DILocation(line: 57, column: 15, scope: !261)
!268 = !DILocation(line: 58, column: 3, scope: !261)
!269 = !DILocation(line: 56, column: 37, scope: !256)
!270 = !DILocation(line: 56, column: 3, scope: !256)
!271 = distinct !{!271, !259, !272, !120}
!272 = !DILocation(line: 58, column: 3, scope: !252)
!273 = !DILocalVariable(name: "y", scope: !274, file: !19, line: 60, type: !15)
!274 = distinct !DILexicalBlock(scope: !235, file: !19, line: 60, column: 3)
!275 = !DILocation(line: 60, column: 11, scope: !274)
!276 = !DILocation(line: 60, column: 7, scope: !274)
!277 = !DILocation(line: 60, column: 18, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !19, line: 60, column: 3)
!279 = !DILocation(line: 60, column: 22, scope: !278)
!280 = !DILocation(line: 60, column: 20, scope: !278)
!281 = !DILocation(line: 60, column: 3, scope: !274)
!282 = !DILocalVariable(name: "x", scope: !283, file: !19, line: 61, type: !15)
!283 = distinct !DILexicalBlock(scope: !284, file: !19, line: 61, column: 5)
!284 = distinct !DILexicalBlock(scope: !278, file: !19, line: 60, column: 41)
!285 = !DILocation(line: 61, column: 13, scope: !283)
!286 = !DILocation(line: 61, column: 9, scope: !283)
!287 = !DILocation(line: 61, column: 20, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !19, line: 61, column: 5)
!289 = !DILocation(line: 61, column: 24, scope: !288)
!290 = !DILocation(line: 61, column: 22, scope: !288)
!291 = !DILocation(line: 61, column: 5, scope: !283)
!292 = !DILocation(line: 62, column: 22, scope: !288)
!293 = !DILocation(line: 62, column: 30, scope: !288)
!294 = !DILocation(line: 62, column: 33, scope: !288)
!295 = !DILocation(line: 62, column: 36, scope: !288)
!296 = !DILocation(line: 62, column: 7, scope: !288)
!297 = !DILocation(line: 62, column: 14, scope: !288)
!298 = !DILocation(line: 62, column: 17, scope: !288)
!299 = !DILocation(line: 62, column: 20, scope: !288)
!300 = !DILocation(line: 61, column: 38, scope: !288)
!301 = !DILocation(line: 61, column: 5, scope: !288)
!302 = distinct !{!302, !291, !303, !120}
!303 = !DILocation(line: 62, column: 36, scope: !283)
!304 = !DILocation(line: 63, column: 5, scope: !284)
!305 = !DILocation(line: 63, column: 12, scope: !284)
!306 = !DILocation(line: 63, column: 15, scope: !284)
!307 = !DILocation(line: 63, column: 28, scope: !284)
!308 = !DILocation(line: 64, column: 3, scope: !284)
!309 = !DILocation(line: 60, column: 37, scope: !278)
!310 = !DILocation(line: 60, column: 3, scope: !278)
!311 = distinct !{!311, !281, !312, !120}
!312 = !DILocation(line: 64, column: 3, scope: !274)
!313 = !DILocalVariable(name: "y", scope: !314, file: !19, line: 66, type: !15)
!314 = distinct !DILexicalBlock(scope: !235, file: !19, line: 66, column: 3)
!315 = !DILocation(line: 66, column: 11, scope: !314)
!316 = !DILocation(line: 66, column: 7, scope: !314)
!317 = !DILocation(line: 66, column: 18, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !19, line: 66, column: 3)
!319 = !DILocation(line: 66, column: 22, scope: !318)
!320 = !DILocation(line: 66, column: 20, scope: !318)
!321 = !DILocation(line: 66, column: 3, scope: !314)
!322 = !DILocation(line: 67, column: 10, scope: !318)
!323 = !DILocation(line: 67, column: 17, scope: !318)
!324 = !DILocation(line: 67, column: 5, scope: !318)
!325 = !DILocation(line: 66, column: 37, scope: !318)
!326 = !DILocation(line: 66, column: 3, scope: !318)
!327 = distinct !{!327, !321, !328, !120}
!328 = !DILocation(line: 67, column: 19, scope: !314)
!329 = !DILocation(line: 68, column: 1, scope: !235)
!330 = distinct !DISubprogram(name: "calcLangValueFuncWrapper", scope: !19, file: !19, line: 70, type: !331, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!331 = !DISubroutineType(types: !332)
!332 = !{!11, !333, !342, !11}
!333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !334, size: 64)
!334 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !335, line: 8, baseType: !336)
!335 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!336 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !335, line: 4, size: 128, elements: !337)
!337 = !{!338, !339, !341}
!338 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !336, file: !335, line: 5, baseType: !203, size: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !336, file: !335, line: 6, baseType: !340, size: 32, offset: 64)
!340 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !336, file: !335, line: 7, baseType: !15, size: 32, offset: 96)
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64)
!343 = !DISubroutineType(types: !344)
!344 = !{!345, !333, !345}
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64)
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !347, line: 40, baseType: !348)
!347 = !DIFile(filename: "lib/include/c/CalcLangCInt.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "0c1186d1e0cb31b94761f16229b40f61")
!348 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !347, line: 37, size: 128, elements: !349)
!349 = !{!350, !351}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !348, file: !347, line: 38, baseType: !15, size: 32)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !348, file: !347, line: 39, baseType: !352, size: 64, offset: 64)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !347, line: 35, baseType: !353)
!353 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !347, line: 27, size: 64, elements: !354)
!354 = !{!355, !364, !371, !372, !374, !375, !376}
!355 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !353, file: !347, line: 28, baseType: !356, size: 64)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !347, line: 20, baseType: !358)
!358 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !347, line: 17, size: 128, elements: !359)
!359 = !{!360, !361}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !358, file: !347, line: 18, baseType: !15, size: 32)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !358, file: !347, line: 19, baseType: !362, size: 64, offset: 64)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !353, file: !347, line: 29, baseType: !365, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !347, line: 25, baseType: !367)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !347, line: 22, size: 128, elements: !368)
!368 = !{!369, !370}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !367, file: !347, line: 23, baseType: !15, size: 32)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !367, file: !347, line: 24, baseType: !362, size: 64, offset: 64)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !353, file: !347, line: 30, baseType: !15, size: 32)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !353, file: !347, line: 31, baseType: !373, size: 64)
!373 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !353, file: !347, line: 32, baseType: !373, size: 64)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !353, file: !347, line: 33, baseType: !373, size: 64)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !353, file: !347, line: 34, baseType: !64, size: 8)
!377 = !DILocalVariable(name: "arena", arg: 1, scope: !330, file: !19, line: 70, type: !333)
!378 = !DILocation(line: 70, column: 52, scope: !330)
!379 = !DILocalVariable(name: "valFunc", arg: 2, scope: !330, file: !19, line: 70, type: !342)
!380 = !DILocation(line: 70, column: 76, scope: !330)
!381 = !DILocalVariable(name: "val", arg: 3, scope: !330, file: !19, line: 70, type: !11)
!382 = !DILocation(line: 70, column: 129, scope: !330)
!383 = !DILocalVariable(name: "cVal", scope: !330, file: !19, line: 71, type: !345)
!384 = !DILocation(line: 71, column: 18, scope: !330)
!385 = !DILocation(line: 71, column: 36, scope: !330)
!386 = !DILocation(line: 71, column: 25, scope: !330)
!387 = !DILocation(line: 72, column: 3, scope: !330)
!388 = !DILocation(line: 72, column: 9, scope: !330)
!389 = !DILocation(line: 72, column: 17, scope: !330)
!390 = !DILocation(line: 73, column: 32, scope: !330)
!391 = !DILocation(line: 73, column: 27, scope: !330)
!392 = !DILocation(line: 73, column: 3, scope: !330)
!393 = !DILocation(line: 73, column: 9, scope: !330)
!394 = !DILocation(line: 73, column: 25, scope: !330)
!395 = !DILocalVariable(name: "res", scope: !330, file: !19, line: 74, type: !345)
!396 = !DILocation(line: 74, column: 18, scope: !330)
!397 = !DILocation(line: 74, column: 24, scope: !330)
!398 = !DILocation(line: 74, column: 32, scope: !330)
!399 = !DILocation(line: 74, column: 39, scope: !330)
!400 = !DILocation(line: 75, column: 6, scope: !401)
!401 = distinct !DILexicalBlock(scope: !330, file: !19, line: 75, column: 6)
!402 = !DILocation(line: 75, column: 11, scope: !401)
!403 = !DILocation(line: 75, column: 19, scope: !401)
!404 = !DILocation(line: 75, column: 6, scope: !330)
!405 = !DILocation(line: 76, column: 26, scope: !401)
!406 = !DILocation(line: 76, column: 31, scope: !401)
!407 = !DILocation(line: 76, column: 39, scope: !401)
!408 = !DILocation(line: 76, column: 12, scope: !401)
!409 = !DILocation(line: 76, column: 5, scope: !401)
!410 = !DILocation(line: 78, column: 5, scope: !411)
!411 = distinct !DILexicalBlock(scope: !401, file: !19, line: 77, column: 8)
!412 = !DILocation(line: 79, column: 5, scope: !411)
!413 = !DILocation(line: 81, column: 1, scope: !330)
!414 = distinct !DISubprogram(name: "shadeGraph", scope: !19, file: !19, line: 83, type: !415, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!415 = !DISubroutineType(types: !416)
!416 = !{null, !82, !342, !333, !11, !11, !11, !11, !15, !15}
!417 = !DILocalVariable(name: "display", arg: 1, scope: !414, file: !19, line: 83, type: !82)
!418 = !DILocation(line: 83, column: 33, scope: !414)
!419 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !414, file: !19, line: 83, type: !342)
!420 = !DILocation(line: 83, column: 59, scope: !414)
!421 = !DILocalVariable(name: "arena", arg: 3, scope: !414, file: !19, line: 83, type: !333)
!422 = !DILocation(line: 83, column: 114, scope: !414)
!423 = !DILocalVariable(name: "xSteps", arg: 4, scope: !414, file: !19, line: 83, type: !11)
!424 = !DILocation(line: 83, column: 133, scope: !414)
!425 = !DILocalVariable(name: "ySteps", arg: 5, scope: !414, file: !19, line: 83, type: !11)
!426 = !DILocation(line: 83, column: 153, scope: !414)
!427 = !DILocalVariable(name: "leftBound", arg: 6, scope: !414, file: !19, line: 83, type: !11)
!428 = !DILocation(line: 83, column: 173, scope: !414)
!429 = !DILocalVariable(name: "rightBound", arg: 7, scope: !414, file: !19, line: 83, type: !11)
!430 = !DILocation(line: 83, column: 196, scope: !414)
!431 = !DILocalVariable(name: "windowHeight", arg: 8, scope: !414, file: !19, line: 83, type: !15)
!432 = !DILocation(line: 83, column: 212, scope: !414)
!433 = !DILocalVariable(name: "windowWidth", arg: 9, scope: !414, file: !19, line: 83, type: !15)
!434 = !DILocation(line: 83, column: 230, scope: !414)
!435 = !DILocalVariable(name: "relX", scope: !414, file: !19, line: 84, type: !11)
!436 = !DILocation(line: 84, column: 15, scope: !414)
!437 = !DILocalVariable(name: "relY", scope: !414, file: !19, line: 84, type: !11)
!438 = !DILocation(line: 84, column: 21, scope: !414)
!439 = !DILocalVariable(name: "y", scope: !440, file: !19, line: 86, type: !15)
!440 = distinct !DILexicalBlock(scope: !414, file: !19, line: 86, column: 3)
!441 = !DILocation(line: 86, column: 11, scope: !440)
!442 = !DILocation(line: 86, column: 7, scope: !440)
!443 = !DILocation(line: 86, column: 18, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !19, line: 86, column: 3)
!445 = !DILocation(line: 86, column: 22, scope: !444)
!446 = !DILocation(line: 86, column: 20, scope: !444)
!447 = !DILocation(line: 86, column: 3, scope: !440)
!448 = !DILocalVariable(name: "x", scope: !449, file: !19, line: 87, type: !15)
!449 = distinct !DILexicalBlock(scope: !450, file: !19, line: 87, column: 5)
!450 = distinct !DILexicalBlock(scope: !444, file: !19, line: 86, column: 40)
!451 = !DILocation(line: 87, column: 13, scope: !449)
!452 = !DILocation(line: 87, column: 9, scope: !449)
!453 = !DILocation(line: 87, column: 20, scope: !454)
!454 = distinct !DILexicalBlock(scope: !449, file: !19, line: 87, column: 5)
!455 = !DILocation(line: 87, column: 24, scope: !454)
!456 = !DILocation(line: 87, column: 22, scope: !454)
!457 = !DILocation(line: 87, column: 5, scope: !449)
!458 = !DILocalVariable(name: "pixel", scope: !459, file: !19, line: 88, type: !5)
!459 = distinct !DILexicalBlock(scope: !454, file: !19, line: 87, column: 41)
!460 = !DILocation(line: 88, column: 22, scope: !459)
!461 = !DILocation(line: 88, column: 32, scope: !459)
!462 = !DILocation(line: 88, column: 40, scope: !459)
!463 = !DILocation(line: 88, column: 43, scope: !459)
!464 = !DILocation(line: 90, column: 14, scope: !459)
!465 = !DILocation(line: 90, column: 21, scope: !459)
!466 = !DILocation(line: 90, column: 12, scope: !459)
!467 = !DILocation(line: 91, column: 14, scope: !459)
!468 = !DILocation(line: 91, column: 21, scope: !459)
!469 = !DILocation(line: 91, column: 12, scope: !459)
!470 = !DILocalVariable(name: "output", scope: !459, file: !19, line: 93, type: !11)
!471 = !DILocation(line: 93, column: 19, scope: !459)
!472 = !DILocation(line: 93, column: 53, scope: !459)
!473 = !DILocation(line: 93, column: 60, scope: !459)
!474 = !DILocation(line: 93, column: 70, scope: !459)
!475 = !DILocation(line: 93, column: 28, scope: !459)
!476 = !DILocation(line: 94, column: 18, scope: !477)
!477 = distinct !DILexicalBlock(scope: !459, file: !19, line: 94, column: 10)
!478 = !DILocation(line: 94, column: 26, scope: !477)
!479 = !DILocation(line: 94, column: 32, scope: !477)
!480 = !DILocation(line: 94, column: 38, scope: !477)
!481 = !DILocation(line: 94, column: 10, scope: !477)
!482 = !DILocation(line: 94, column: 10, scope: !459)
!483 = !DILocation(line: 95, column: 29, scope: !477)
!484 = !DILocation(line: 95, column: 37, scope: !477)
!485 = !DILocation(line: 95, column: 43, scope: !477)
!486 = !DILocation(line: 95, column: 19, scope: !477)
!487 = !DILocation(line: 95, column: 2, scope: !477)
!488 = !DILocation(line: 95, column: 9, scope: !477)
!489 = !DILocation(line: 95, column: 17, scope: !477)
!490 = !DILocation(line: 96, column: 17, scope: !491)
!491 = distinct !DILexicalBlock(scope: !477, file: !19, line: 96, column: 15)
!492 = !DILocation(line: 96, column: 24, scope: !491)
!493 = !DILocation(line: 96, column: 105, scope: !491)
!494 = !DILocation(line: 96, column: 32, scope: !491)
!495 = !DILocation(line: 96, column: 39, scope: !491)
!496 = !DILocation(line: 96, column: 45, scope: !491)
!497 = !DILocation(line: 96, column: 37, scope: !491)
!498 = !DILocation(line: 96, column: 48, scope: !491)
!499 = !DILocation(line: 96, column: 51, scope: !491)
!500 = !DILocation(line: 96, column: 58, scope: !491)
!501 = !DILocation(line: 96, column: 56, scope: !491)
!502 = !DILocation(line: 96, column: 16, scope: !491)
!503 = !DILocation(line: 96, column: 69, scope: !491)
!504 = !DILocation(line: 96, column: 77, scope: !491)
!505 = !DILocation(line: 96, column: 76, scope: !491)
!506 = !DILocation(line: 96, column: 83, scope: !491)
!507 = !DILocation(line: 96, column: 74, scope: !491)
!508 = !DILocation(line: 96, column: 86, scope: !491)
!509 = !DILocation(line: 96, column: 89, scope: !491)
!510 = !DILocation(line: 96, column: 96, scope: !491)
!511 = !DILocation(line: 96, column: 94, scope: !491)
!512 = !DILocation(line: 96, column: 109, scope: !491)
!513 = !DILocation(line: 96, column: 116, scope: !491)
!514 = !DILocation(line: 96, column: 114, scope: !491)
!515 = !DILocation(line: 96, column: 126, scope: !491)
!516 = !DILocation(line: 96, column: 129, scope: !491)
!517 = !DILocation(line: 96, column: 136, scope: !491)
!518 = !DILocation(line: 96, column: 134, scope: !491)
!519 = !DILocation(line: 96, column: 15, scope: !477)
!520 = !DILocation(line: 97, column: 2, scope: !491)
!521 = !DILocation(line: 97, column: 9, scope: !491)
!522 = !DILocation(line: 97, column: 17, scope: !491)
!523 = !DILocation(line: 98, column: 5, scope: !459)
!524 = !DILocation(line: 87, column: 38, scope: !454)
!525 = !DILocation(line: 87, column: 5, scope: !454)
!526 = distinct !{!526, !457, !527, !120}
!527 = !DILocation(line: 98, column: 5, scope: !449)
!528 = !DILocation(line: 99, column: 3, scope: !450)
!529 = !DILocation(line: 86, column: 37, scope: !444)
!530 = !DILocation(line: 86, column: 3, scope: !444)
!531 = distinct !{!531, !447, !532, !120}
!532 = !DILocation(line: 99, column: 3, scope: !440)
!533 = !DILocation(line: 100, column: 1, scope: !414)
!534 = distinct !DISubprogram(name: "drawLine", scope: !19, file: !19, line: 102, type: !535, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !82, !342, !333, !11, !11, !15, !15}
!537 = !DILocalVariable(name: "display", arg: 1, scope: !534, file: !19, line: 102, type: !82)
!538 = !DILocation(line: 102, column: 31, scope: !534)
!539 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !534, file: !19, line: 102, type: !342)
!540 = !DILocation(line: 102, column: 57, scope: !534)
!541 = !DILocalVariable(name: "arena", arg: 3, scope: !534, file: !19, line: 102, type: !333)
!542 = !DILocation(line: 102, column: 112, scope: !534)
!543 = !DILocalVariable(name: "xSteps", arg: 4, scope: !534, file: !19, line: 102, type: !11)
!544 = !DILocation(line: 102, column: 131, scope: !534)
!545 = !DILocalVariable(name: "ySteps", arg: 5, scope: !534, file: !19, line: 102, type: !11)
!546 = !DILocation(line: 102, column: 151, scope: !534)
!547 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !534, file: !19, line: 102, type: !15)
!548 = !DILocation(line: 102, column: 163, scope: !534)
!549 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !534, file: !19, line: 102, type: !15)
!550 = !DILocation(line: 102, column: 181, scope: !534)
!551 = !DILocalVariable(name: "relX", scope: !534, file: !19, line: 103, type: !11)
!552 = !DILocation(line: 103, column: 15, scope: !534)
!553 = !DILocalVariable(name: "relY", scope: !534, file: !19, line: 103, type: !11)
!554 = !DILocation(line: 103, column: 21, scope: !534)
!555 = !DILocalVariable(name: "y", scope: !556, file: !19, line: 105, type: !15)
!556 = distinct !DILexicalBlock(scope: !534, file: !19, line: 105, column: 5)
!557 = !DILocation(line: 105, column: 13, scope: !556)
!558 = !DILocation(line: 105, column: 9, scope: !556)
!559 = !DILocation(line: 105, column: 20, scope: !560)
!560 = distinct !DILexicalBlock(scope: !556, file: !19, line: 105, column: 5)
!561 = !DILocation(line: 105, column: 24, scope: !560)
!562 = !DILocation(line: 105, column: 22, scope: !560)
!563 = !DILocation(line: 105, column: 5, scope: !556)
!564 = !DILocalVariable(name: "x", scope: !565, file: !19, line: 106, type: !15)
!565 = distinct !DILexicalBlock(scope: !566, file: !19, line: 106, column: 9)
!566 = distinct !DILexicalBlock(scope: !560, file: !19, line: 105, column: 43)
!567 = !DILocation(line: 106, column: 17, scope: !565)
!568 = !DILocation(line: 106, column: 13, scope: !565)
!569 = !DILocation(line: 106, column: 24, scope: !570)
!570 = distinct !DILexicalBlock(scope: !565, file: !19, line: 106, column: 9)
!571 = !DILocation(line: 106, column: 28, scope: !570)
!572 = !DILocation(line: 106, column: 26, scope: !570)
!573 = !DILocation(line: 106, column: 9, scope: !565)
!574 = !DILocalVariable(name: "pixel", scope: !575, file: !19, line: 107, type: !5)
!575 = distinct !DILexicalBlock(scope: !570, file: !19, line: 106, column: 47)
!576 = !DILocation(line: 107, column: 21, scope: !575)
!577 = !DILocation(line: 107, column: 31, scope: !575)
!578 = !DILocation(line: 107, column: 39, scope: !575)
!579 = !DILocation(line: 107, column: 42, scope: !575)
!580 = !DILocation(line: 108, column: 20, scope: !575)
!581 = !DILocation(line: 108, column: 27, scope: !575)
!582 = !DILocation(line: 108, column: 18, scope: !575)
!583 = !DILocation(line: 109, column: 20, scope: !575)
!584 = !DILocation(line: 109, column: 27, scope: !575)
!585 = !DILocation(line: 109, column: 18, scope: !575)
!586 = !DILocalVariable(name: "output", scope: !575, file: !19, line: 111, type: !11)
!587 = !DILocation(line: 111, column: 25, scope: !575)
!588 = !DILocation(line: 111, column: 59, scope: !575)
!589 = !DILocation(line: 111, column: 66, scope: !575)
!590 = !DILocation(line: 111, column: 76, scope: !575)
!591 = !DILocation(line: 111, column: 34, scope: !575)
!592 = !DILocation(line: 112, column: 17, scope: !575)
!593 = !DILocation(line: 112, column: 6, scope: !575)
!594 = !DILocation(line: 113, column: 24, scope: !595)
!595 = distinct !DILexicalBlock(scope: !575, file: !19, line: 113, column: 16)
!596 = !DILocation(line: 113, column: 32, scope: !595)
!597 = !DILocation(line: 113, column: 38, scope: !595)
!598 = !DILocation(line: 113, column: 44, scope: !595)
!599 = !DILocation(line: 113, column: 16, scope: !595)
!600 = !DILocation(line: 113, column: 16, scope: !575)
!601 = !DILocation(line: 114, column: 35, scope: !595)
!602 = !DILocation(line: 114, column: 43, scope: !595)
!603 = !DILocation(line: 114, column: 49, scope: !595)
!604 = !DILocation(line: 114, column: 25, scope: !595)
!605 = !DILocation(line: 114, column: 8, scope: !595)
!606 = !DILocation(line: 114, column: 15, scope: !595)
!607 = !DILocation(line: 114, column: 23, scope: !595)
!608 = !DILocation(line: 115, column: 9, scope: !575)
!609 = !DILocation(line: 106, column: 43, scope: !570)
!610 = !DILocation(line: 106, column: 9, scope: !570)
!611 = distinct !{!611, !573, !612, !120}
!612 = !DILocation(line: 115, column: 9, scope: !565)
!613 = !DILocation(line: 116, column: 5, scope: !566)
!614 = !DILocation(line: 105, column: 39, scope: !560)
!615 = !DILocation(line: 105, column: 5, scope: !560)
!616 = distinct !{!616, !563, !617, !120}
!617 = !DILocation(line: 116, column: 5, scope: !556)
!618 = !DILocation(line: 117, column: 1, scope: !534)
!619 = distinct !DISubprogram(name: "printDisplayCordinates", scope: !19, file: !19, line: 119, type: !236, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!620 = !DILocalVariable(name: "display", arg: 1, scope: !619, file: !19, line: 119, type: !82)
!621 = !DILocation(line: 119, column: 45, scope: !619)
!622 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !619, file: !19, line: 119, type: !15)
!623 = !DILocation(line: 119, column: 58, scope: !619)
!624 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !619, file: !19, line: 119, type: !15)
!625 = !DILocation(line: 119, column: 76, scope: !619)
!626 = !DILocalVariable(name: "y", scope: !627, file: !19, line: 120, type: !15)
!627 = distinct !DILexicalBlock(scope: !619, file: !19, line: 120, column: 3)
!628 = !DILocation(line: 120, column: 11, scope: !627)
!629 = !DILocation(line: 120, column: 7, scope: !627)
!630 = !DILocation(line: 120, column: 18, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !19, line: 120, column: 3)
!632 = !DILocation(line: 120, column: 22, scope: !631)
!633 = !DILocation(line: 120, column: 20, scope: !631)
!634 = !DILocation(line: 120, column: 3, scope: !627)
!635 = !DILocation(line: 121, column: 5, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !19, line: 120, column: 40)
!637 = !DILocalVariable(name: "x", scope: !638, file: !19, line: 122, type: !15)
!638 = distinct !DILexicalBlock(scope: !636, file: !19, line: 122, column: 5)
!639 = !DILocation(line: 122, column: 13, scope: !638)
!640 = !DILocation(line: 122, column: 9, scope: !638)
!641 = !DILocation(line: 122, column: 20, scope: !642)
!642 = distinct !DILexicalBlock(scope: !638, file: !19, line: 122, column: 5)
!643 = !DILocation(line: 122, column: 24, scope: !642)
!644 = !DILocation(line: 122, column: 22, scope: !642)
!645 = !DILocation(line: 122, column: 5, scope: !638)
!646 = !DILocation(line: 123, column: 27, scope: !647)
!647 = distinct !DILexicalBlock(scope: !642, file: !19, line: 122, column: 41)
!648 = !DILocation(line: 123, column: 35, scope: !647)
!649 = !DILocation(line: 123, column: 38, scope: !647)
!650 = !DILocation(line: 123, column: 41, scope: !647)
!651 = !DILocation(line: 123, column: 44, scope: !647)
!652 = !DILocation(line: 123, column: 52, scope: !647)
!653 = !DILocation(line: 123, column: 55, scope: !647)
!654 = !DILocation(line: 123, column: 58, scope: !647)
!655 = !DILocation(line: 123, column: 7, scope: !647)
!656 = !DILocation(line: 124, column: 5, scope: !647)
!657 = !DILocation(line: 122, column: 38, scope: !642)
!658 = !DILocation(line: 122, column: 5, scope: !642)
!659 = distinct !{!659, !645, !660, !120}
!660 = !DILocation(line: 124, column: 5, scope: !638)
!661 = !DILocation(line: 125, column: 5, scope: !636)
!662 = !DILocation(line: 126, column: 3, scope: !636)
!663 = !DILocation(line: 120, column: 37, scope: !631)
!664 = !DILocation(line: 120, column: 3, scope: !631)
!665 = distinct !{!665, !634, !666, !120}
!666 = !DILocation(line: 126, column: 3, scope: !627)
!667 = !DILocation(line: 127, column: 1, scope: !619)
!668 = distinct !DISubprogram(name: "drawPlane", scope: !19, file: !19, line: 129, type: !669, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !82, !11, !11, !15, !15}
!671 = !DILocalVariable(name: "display", arg: 1, scope: !668, file: !19, line: 129, type: !82)
!672 = !DILocation(line: 129, column: 32, scope: !668)
!673 = !DILocalVariable(name: "xSteps", arg: 2, scope: !668, file: !19, line: 129, type: !11)
!674 = !DILocation(line: 129, column: 53, scope: !668)
!675 = !DILocalVariable(name: "ySteps", arg: 3, scope: !668, file: !19, line: 129, type: !11)
!676 = !DILocation(line: 129, column: 73, scope: !668)
!677 = !DILocalVariable(name: "windowHeight", arg: 4, scope: !668, file: !19, line: 129, type: !15)
!678 = !DILocation(line: 129, column: 85, scope: !668)
!679 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !668, file: !19, line: 129, type: !15)
!680 = !DILocation(line: 129, column: 103, scope: !668)
!681 = !DILocalVariable(name: "relX", scope: !668, file: !19, line: 130, type: !11)
!682 = !DILocation(line: 130, column: 15, scope: !668)
!683 = !DILocalVariable(name: "relY", scope: !668, file: !19, line: 130, type: !11)
!684 = !DILocation(line: 130, column: 21, scope: !668)
!685 = !DILocalVariable(name: "y", scope: !686, file: !19, line: 131, type: !15)
!686 = distinct !DILexicalBlock(scope: !668, file: !19, line: 131, column: 5)
!687 = !DILocation(line: 131, column: 13, scope: !686)
!688 = !DILocation(line: 131, column: 9, scope: !686)
!689 = !DILocation(line: 131, column: 20, scope: !690)
!690 = distinct !DILexicalBlock(scope: !686, file: !19, line: 131, column: 5)
!691 = !DILocation(line: 131, column: 24, scope: !690)
!692 = !DILocation(line: 131, column: 22, scope: !690)
!693 = !DILocation(line: 131, column: 5, scope: !686)
!694 = !DILocalVariable(name: "x", scope: !695, file: !19, line: 132, type: !15)
!695 = distinct !DILexicalBlock(scope: !696, file: !19, line: 132, column: 9)
!696 = distinct !DILexicalBlock(scope: !690, file: !19, line: 131, column: 43)
!697 = !DILocation(line: 132, column: 17, scope: !695)
!698 = !DILocation(line: 132, column: 13, scope: !695)
!699 = !DILocation(line: 132, column: 24, scope: !700)
!700 = distinct !DILexicalBlock(scope: !695, file: !19, line: 132, column: 9)
!701 = !DILocation(line: 132, column: 28, scope: !700)
!702 = !DILocation(line: 132, column: 26, scope: !700)
!703 = !DILocation(line: 132, column: 9, scope: !695)
!704 = !DILocalVariable(name: "pixel", scope: !705, file: !19, line: 133, type: !5)
!705 = distinct !DILexicalBlock(scope: !700, file: !19, line: 132, column: 46)
!706 = !DILocation(line: 133, column: 21, scope: !705)
!707 = !DILocation(line: 133, column: 31, scope: !705)
!708 = !DILocation(line: 133, column: 39, scope: !705)
!709 = !DILocation(line: 133, column: 42, scope: !705)
!710 = !DILocation(line: 134, column: 20, scope: !705)
!711 = !DILocation(line: 134, column: 27, scope: !705)
!712 = !DILocation(line: 134, column: 18, scope: !705)
!713 = !DILocation(line: 135, column: 20, scope: !705)
!714 = !DILocation(line: 135, column: 27, scope: !705)
!715 = !DILocation(line: 135, column: 18, scope: !705)
!716 = !DILocalVariable(name: "xZero", scope: !705, file: !19, line: 137, type: !64)
!717 = !DILocation(line: 137, column: 18, scope: !705)
!718 = !DILocation(line: 137, column: 34, scope: !705)
!719 = !DILocation(line: 137, column: 43, scope: !705)
!720 = !DILocation(line: 137, column: 49, scope: !705)
!721 = !DILocation(line: 137, column: 26, scope: !705)
!722 = !DILocalVariable(name: "yZero", scope: !705, file: !19, line: 138, type: !64)
!723 = !DILocation(line: 138, column: 18, scope: !705)
!724 = !DILocation(line: 138, column: 34, scope: !705)
!725 = !DILocation(line: 138, column: 43, scope: !705)
!726 = !DILocation(line: 138, column: 49, scope: !705)
!727 = !DILocation(line: 138, column: 26, scope: !705)
!728 = !DILocalVariable(name: "origin", scope: !705, file: !19, line: 139, type: !64)
!729 = !DILocation(line: 139, column: 18, scope: !705)
!730 = !DILocation(line: 139, column: 27, scope: !705)
!731 = !DILocation(line: 139, column: 33, scope: !705)
!732 = !DILocation(line: 139, column: 36, scope: !705)
!733 = !DILocation(line: 0, scope: !705)
!734 = !DILocation(line: 141, column: 16, scope: !735)
!735 = distinct !DILexicalBlock(scope: !705, file: !19, line: 141, column: 16)
!736 = !DILocation(line: 141, column: 16, scope: !705)
!737 = !DILocation(line: 142, column: 17, scope: !735)
!738 = !DILocation(line: 142, column: 26, scope: !735)
!739 = !DILocation(line: 142, column: 34, scope: !735)
!740 = !DILocation(line: 143, column: 21, scope: !741)
!741 = distinct !DILexicalBlock(scope: !735, file: !19, line: 143, column: 21)
!742 = !DILocation(line: 143, column: 21, scope: !735)
!743 = !DILocation(line: 144, column: 17, scope: !741)
!744 = !DILocation(line: 144, column: 26, scope: !741)
!745 = !DILocation(line: 144, column: 34, scope: !741)
!746 = !DILocation(line: 145, column: 21, scope: !747)
!747 = distinct !DILexicalBlock(scope: !741, file: !19, line: 145, column: 21)
!748 = !DILocation(line: 145, column: 21, scope: !741)
!749 = !DILocation(line: 146, column: 17, scope: !747)
!750 = !DILocation(line: 146, column: 26, scope: !747)
!751 = !DILocation(line: 146, column: 34, scope: !747)
!752 = !DILocation(line: 148, column: 17, scope: !747)
!753 = !DILocation(line: 148, column: 26, scope: !747)
!754 = !DILocation(line: 148, column: 34, scope: !747)
!755 = !DILocation(line: 149, column: 9, scope: !705)
!756 = !DILocation(line: 132, column: 42, scope: !700)
!757 = !DILocation(line: 132, column: 9, scope: !700)
!758 = distinct !{!758, !703, !759, !120}
!759 = !DILocation(line: 149, column: 9, scope: !695)
!760 = !DILocation(line: 150, column: 5, scope: !696)
!761 = !DILocation(line: 131, column: 39, scope: !690)
!762 = !DILocation(line: 131, column: 5, scope: !690)
!763 = distinct !{!763, !693, !764, !120}
!764 = !DILocation(line: 150, column: 5, scope: !686)
!765 = !DILocation(line: 151, column: 1, scope: !668)
!766 = distinct !DISubprogram(name: "clearDisplay", scope: !19, file: !19, line: 153, type: !767, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!767 = !DISubroutineType(types: !768)
!768 = !{null, !82, !15}
!769 = !DILocalVariable(name: "display", arg: 1, scope: !766, file: !19, line: 153, type: !82)
!770 = !DILocation(line: 153, column: 35, scope: !766)
!771 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !766, file: !19, line: 153, type: !15)
!772 = !DILocation(line: 153, column: 48, scope: !766)
!773 = !DILocalVariable(name: "i", scope: !774, file: !19, line: 154, type: !15)
!774 = distinct !DILexicalBlock(scope: !766, file: !19, line: 154, column: 3)
!775 = !DILocation(line: 154, column: 11, scope: !774)
!776 = !DILocation(line: 154, column: 7, scope: !774)
!777 = !DILocation(line: 154, column: 18, scope: !778)
!778 = distinct !DILexicalBlock(scope: !774, file: !19, line: 154, column: 3)
!779 = !DILocation(line: 154, column: 22, scope: !778)
!780 = !DILocation(line: 154, column: 20, scope: !778)
!781 = !DILocation(line: 154, column: 3, scope: !774)
!782 = !DILocation(line: 155, column: 10, scope: !783)
!783 = distinct !DILexicalBlock(scope: !778, file: !19, line: 154, column: 40)
!784 = !DILocation(line: 155, column: 18, scope: !783)
!785 = !DILocation(line: 155, column: 5, scope: !783)
!786 = !DILocation(line: 156, column: 3, scope: !783)
!787 = !DILocation(line: 154, column: 37, scope: !778)
!788 = !DILocation(line: 154, column: 3, scope: !778)
!789 = distinct !{!789, !781, !790, !120}
!790 = !DILocation(line: 156, column: 3, scope: !774)
!791 = !DILocation(line: 157, column: 8, scope: !766)
!792 = !DILocation(line: 157, column: 3, scope: !766)
!793 = !DILocation(line: 158, column: 1, scope: !766)
!794 = distinct !DISubprogram(name: "findYMax", scope: !19, file: !19, line: 160, type: !795, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!795 = !DISubroutineType(types: !796)
!796 = !{!11, !333, !15, !15, !15, !342}
!797 = !DILocalVariable(name: "arena", arg: 1, scope: !794, file: !19, line: 160, type: !333)
!798 = !DILocation(line: 160, column: 36, scope: !794)
!799 = !DILocalVariable(name: "begin", arg: 2, scope: !794, file: !19, line: 160, type: !15)
!800 = !DILocation(line: 160, column: 47, scope: !794)
!801 = !DILocalVariable(name: "end", arg: 3, scope: !794, file: !19, line: 160, type: !15)
!802 = !DILocation(line: 160, column: 58, scope: !794)
!803 = !DILocalVariable(name: "byAmount", arg: 4, scope: !794, file: !19, line: 160, type: !15)
!804 = !DILocation(line: 160, column: 67, scope: !794)
!805 = !DILocalVariable(name: "valFunc", arg: 5, scope: !794, file: !19, line: 160, type: !342)
!806 = !DILocation(line: 160, column: 94, scope: !794)
!807 = !DILocalVariable(name: "yMax", scope: !794, file: !19, line: 161, type: !11)
!808 = !DILocation(line: 161, column: 15, scope: !794)
!809 = !DILocation(line: 161, column: 47, scope: !794)
!810 = !DILocation(line: 161, column: 54, scope: !794)
!811 = !DILocation(line: 161, column: 63, scope: !794)
!812 = !DILocation(line: 161, column: 22, scope: !794)
!813 = !DILocalVariable(name: "i", scope: !814, file: !19, line: 162, type: !15)
!814 = distinct !DILexicalBlock(scope: !794, file: !19, line: 162, column: 3)
!815 = !DILocation(line: 162, column: 11, scope: !814)
!816 = !DILocation(line: 162, column: 15, scope: !814)
!817 = !DILocation(line: 162, column: 21, scope: !814)
!818 = !DILocation(line: 162, column: 7, scope: !814)
!819 = !DILocation(line: 162, column: 26, scope: !820)
!820 = distinct !DILexicalBlock(scope: !814, file: !19, line: 162, column: 3)
!821 = !DILocation(line: 162, column: 31, scope: !820)
!822 = !DILocation(line: 162, column: 28, scope: !820)
!823 = !DILocation(line: 162, column: 3, scope: !814)
!824 = !DILocalVariable(name: "toRet", scope: !825, file: !19, line: 163, type: !11)
!825 = distinct !DILexicalBlock(scope: !820, file: !19, line: 162, column: 48)
!826 = !DILocation(line: 163, column: 17, scope: !825)
!827 = !DILocation(line: 163, column: 50, scope: !825)
!828 = !DILocation(line: 163, column: 57, scope: !825)
!829 = !DILocation(line: 163, column: 66, scope: !825)
!830 = !DILocation(line: 163, column: 25, scope: !825)
!831 = !DILocation(line: 164, column: 16, scope: !825)
!832 = !DILocation(line: 164, column: 5, scope: !825)
!833 = !DILocation(line: 165, column: 8, scope: !834)
!834 = distinct !DILexicalBlock(scope: !825, file: !19, line: 165, column: 8)
!835 = !DILocation(line: 165, column: 16, scope: !834)
!836 = !DILocation(line: 165, column: 14, scope: !834)
!837 = !DILocation(line: 165, column: 8, scope: !825)
!838 = !DILocation(line: 166, column: 14, scope: !839)
!839 = distinct !DILexicalBlock(scope: !834, file: !19, line: 165, column: 21)
!840 = !DILocation(line: 166, column: 12, scope: !839)
!841 = !DILocation(line: 167, column: 5, scope: !839)
!842 = !DILocation(line: 168, column: 3, scope: !825)
!843 = !DILocation(line: 162, column: 39, scope: !820)
!844 = !DILocation(line: 162, column: 37, scope: !820)
!845 = !DILocation(line: 162, column: 3, scope: !820)
!846 = distinct !{!846, !823, !847, !120}
!847 = !DILocation(line: 168, column: 3, scope: !814)
!848 = !DILocation(line: 169, column: 10, scope: !794)
!849 = !DILocation(line: 169, column: 3, scope: !794)
!850 = distinct !DISubprogram(name: "findYMin", scope: !19, file: !19, line: 172, type: !795, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!851 = !DILocalVariable(name: "arena", arg: 1, scope: !850, file: !19, line: 172, type: !333)
!852 = !DILocation(line: 172, column: 36, scope: !850)
!853 = !DILocalVariable(name: "begin", arg: 2, scope: !850, file: !19, line: 172, type: !15)
!854 = !DILocation(line: 172, column: 47, scope: !850)
!855 = !DILocalVariable(name: "end", arg: 3, scope: !850, file: !19, line: 172, type: !15)
!856 = !DILocation(line: 172, column: 58, scope: !850)
!857 = !DILocalVariable(name: "byAmount", arg: 4, scope: !850, file: !19, line: 172, type: !15)
!858 = !DILocation(line: 172, column: 67, scope: !850)
!859 = !DILocalVariable(name: "valFunc", arg: 5, scope: !850, file: !19, line: 172, type: !342)
!860 = !DILocation(line: 172, column: 94, scope: !850)
!861 = !DILocalVariable(name: "yMin", scope: !850, file: !19, line: 173, type: !11)
!862 = !DILocation(line: 173, column: 15, scope: !850)
!863 = !DILocation(line: 173, column: 47, scope: !850)
!864 = !DILocation(line: 173, column: 54, scope: !850)
!865 = !DILocation(line: 173, column: 63, scope: !850)
!866 = !DILocation(line: 173, column: 22, scope: !850)
!867 = !DILocalVariable(name: "i", scope: !868, file: !19, line: 174, type: !15)
!868 = distinct !DILexicalBlock(scope: !850, file: !19, line: 174, column: 3)
!869 = !DILocation(line: 174, column: 11, scope: !868)
!870 = !DILocation(line: 174, column: 15, scope: !868)
!871 = !DILocation(line: 174, column: 21, scope: !868)
!872 = !DILocation(line: 174, column: 7, scope: !868)
!873 = !DILocation(line: 174, column: 26, scope: !874)
!874 = distinct !DILexicalBlock(scope: !868, file: !19, line: 174, column: 3)
!875 = !DILocation(line: 174, column: 31, scope: !874)
!876 = !DILocation(line: 174, column: 28, scope: !874)
!877 = !DILocation(line: 174, column: 3, scope: !868)
!878 = !DILocalVariable(name: "toRet", scope: !879, file: !19, line: 175, type: !11)
!879 = distinct !DILexicalBlock(scope: !874, file: !19, line: 174, column: 48)
!880 = !DILocation(line: 175, column: 17, scope: !879)
!881 = !DILocation(line: 175, column: 50, scope: !879)
!882 = !DILocation(line: 175, column: 57, scope: !879)
!883 = !DILocation(line: 175, column: 66, scope: !879)
!884 = !DILocation(line: 175, column: 25, scope: !879)
!885 = !DILocation(line: 176, column: 16, scope: !879)
!886 = !DILocation(line: 176, column: 5, scope: !879)
!887 = !DILocation(line: 177, column: 8, scope: !888)
!888 = distinct !DILexicalBlock(scope: !879, file: !19, line: 177, column: 8)
!889 = !DILocation(line: 177, column: 16, scope: !888)
!890 = !DILocation(line: 177, column: 14, scope: !888)
!891 = !DILocation(line: 177, column: 8, scope: !879)
!892 = !DILocation(line: 178, column: 14, scope: !893)
!893 = distinct !DILexicalBlock(scope: !888, file: !19, line: 177, column: 21)
!894 = !DILocation(line: 178, column: 12, scope: !893)
!895 = !DILocation(line: 179, column: 5, scope: !893)
!896 = !DILocation(line: 180, column: 3, scope: !879)
!897 = !DILocation(line: 174, column: 39, scope: !874)
!898 = !DILocation(line: 174, column: 37, scope: !874)
!899 = !DILocation(line: 174, column: 3, scope: !874)
!900 = distinct !{!900, !877, !901, !120}
!901 = !DILocation(line: 180, column: 3, scope: !868)
!902 = !DILocation(line: 181, column: 10, scope: !850)
!903 = !DILocation(line: 181, column: 3, scope: !850)
!904 = distinct !DISubprogram(name: "drawGraph", scope: !19, file: !19, line: 184, type: !905, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !65)
!905 = !DISubroutineType(types: !906)
!906 = !{!64, !333, !15, !15, !15, !342}
!907 = !DILocalVariable(name: "arena", arg: 1, scope: !904, file: !19, line: 184, type: !333)
!908 = !DILocation(line: 184, column: 30, scope: !904)
!909 = !DILocalVariable(name: "begin", arg: 2, scope: !904, file: !19, line: 184, type: !15)
!910 = !DILocation(line: 184, column: 41, scope: !904)
!911 = !DILocalVariable(name: "end", arg: 3, scope: !904, file: !19, line: 184, type: !15)
!912 = !DILocation(line: 184, column: 52, scope: !904)
!913 = !DILocalVariable(name: "byAmount", arg: 4, scope: !904, file: !19, line: 184, type: !15)
!914 = !DILocation(line: 184, column: 61, scope: !904)
!915 = !DILocalVariable(name: "valFunc", arg: 5, scope: !904, file: !19, line: 184, type: !342)
!916 = !DILocation(line: 184, column: 88, scope: !904)
!917 = !DILocalVariable(name: "w", scope: !904, file: !19, line: 185, type: !918)
!918 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !919, line: 27, size: 64, elements: !920)
!919 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!920 = !{!921, !923, !924, !925}
!921 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !918, file: !919, line: 29, baseType: !922, size: 16)
!922 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !918, file: !919, line: 30, baseType: !922, size: 16, offset: 16)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !918, file: !919, line: 31, baseType: !922, size: 16, offset: 32)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !918, file: !919, line: 32, baseType: !922, size: 16, offset: 48)
!926 = !DILocation(line: 185, column: 18, scope: !904)
!927 = !DILocation(line: 188, column: 7, scope: !928)
!928 = distinct !DILexicalBlock(scope: !904, file: !19, line: 188, column: 7)
!929 = !DILocation(line: 188, column: 44, scope: !928)
!930 = !DILocation(line: 188, column: 7, scope: !904)
!931 = !DILocation(line: 189, column: 7, scope: !932)
!932 = distinct !DILexicalBlock(scope: !928, file: !19, line: 188, column: 51)
!933 = !DILocation(line: 190, column: 7, scope: !932)
!934 = !DILocalVariable(name: "xStep", scope: !904, file: !19, line: 193, type: !11)
!935 = !DILocation(line: 193, column: 15, scope: !904)
!936 = !DILocation(line: 193, column: 25, scope: !904)
!937 = !DILocation(line: 193, column: 31, scope: !904)
!938 = !DILocation(line: 193, column: 29, scope: !904)
!939 = !DILocation(line: 193, column: 42, scope: !904)
!940 = !DILocation(line: 193, column: 40, scope: !904)
!941 = !DILocation(line: 193, column: 38, scope: !904)
!942 = !DILocation(line: 193, column: 50, scope: !904)
!943 = !DILocation(line: 193, column: 23, scope: !904)
!944 = !DILocalVariable(name: "xBegin", scope: !904, file: !19, line: 194, type: !11)
!945 = !DILocation(line: 194, column: 15, scope: !904)
!946 = !DILocation(line: 194, column: 26, scope: !904)
!947 = !DILocation(line: 194, column: 37, scope: !904)
!948 = !DILocation(line: 194, column: 35, scope: !904)
!949 = !DILocation(line: 194, column: 44, scope: !904)
!950 = !DILocation(line: 194, column: 34, scope: !904)
!951 = !DILocation(line: 194, column: 32, scope: !904)
!952 = !DILocation(line: 194, column: 24, scope: !904)
!953 = !DILocalVariable(name: "xEnd", scope: !904, file: !19, line: 195, type: !11)
!954 = !DILocation(line: 195, column: 15, scope: !904)
!955 = !DILocation(line: 195, column: 24, scope: !904)
!956 = !DILocation(line: 195, column: 35, scope: !904)
!957 = !DILocation(line: 195, column: 33, scope: !904)
!958 = !DILocation(line: 195, column: 42, scope: !904)
!959 = !DILocation(line: 195, column: 32, scope: !904)
!960 = !DILocation(line: 195, column: 30, scope: !904)
!961 = !DILocalVariable(name: "yMax", scope: !904, file: !19, line: 197, type: !11)
!962 = !DILocation(line: 197, column: 15, scope: !904)
!963 = !DILocation(line: 197, column: 31, scope: !904)
!964 = !DILocation(line: 197, column: 38, scope: !904)
!965 = !DILocation(line: 197, column: 46, scope: !904)
!966 = !DILocation(line: 197, column: 52, scope: !904)
!967 = !DILocation(line: 197, column: 62, scope: !904)
!968 = !DILocation(line: 197, column: 22, scope: !904)
!969 = !DILocalVariable(name: "yMin", scope: !904, file: !19, line: 198, type: !11)
!970 = !DILocation(line: 198, column: 15, scope: !904)
!971 = !DILocation(line: 198, column: 31, scope: !904)
!972 = !DILocation(line: 198, column: 38, scope: !904)
!973 = !DILocation(line: 198, column: 46, scope: !904)
!974 = !DILocation(line: 198, column: 52, scope: !904)
!975 = !DILocation(line: 198, column: 62, scope: !904)
!976 = !DILocation(line: 198, column: 22, scope: !904)
!977 = !DILocalVariable(name: "yStep", scope: !904, file: !19, line: 200, type: !11)
!978 = !DILocation(line: 200, column: 15, scope: !904)
!979 = !DILocation(line: 200, column: 25, scope: !904)
!980 = !DILocation(line: 200, column: 32, scope: !904)
!981 = !DILocation(line: 200, column: 30, scope: !904)
!982 = !DILocation(line: 200, column: 42, scope: !904)
!983 = !DILocation(line: 200, column: 40, scope: !904)
!984 = !DILocation(line: 200, column: 38, scope: !904)
!985 = !DILocalVariable(name: "yBegin", scope: !904, file: !19, line: 201, type: !11)
!986 = !DILocation(line: 201, column: 15, scope: !904)
!987 = !DILocation(line: 201, column: 26, scope: !904)
!988 = !DILocation(line: 201, column: 37, scope: !904)
!989 = !DILocation(line: 201, column: 35, scope: !904)
!990 = !DILocation(line: 201, column: 43, scope: !904)
!991 = !DILocation(line: 201, column: 34, scope: !904)
!992 = !DILocation(line: 201, column: 32, scope: !904)
!993 = !DILocation(line: 201, column: 24, scope: !904)
!994 = !DILocalVariable(name: "yEnd", scope: !904, file: !19, line: 202, type: !11)
!995 = !DILocation(line: 202, column: 15, scope: !904)
!996 = !DILocation(line: 202, column: 24, scope: !904)
!997 = !DILocation(line: 202, column: 35, scope: !904)
!998 = !DILocation(line: 202, column: 33, scope: !904)
!999 = !DILocation(line: 202, column: 41, scope: !904)
!1000 = !DILocation(line: 202, column: 32, scope: !904)
!1001 = !DILocation(line: 202, column: 30, scope: !904)
!1002 = !DILocation(line: 204, column: 108, scope: !904)
!1003 = !DILocation(line: 204, column: 115, scope: !904)
!1004 = !DILocation(line: 204, column: 123, scope: !904)
!1005 = !DILocation(line: 204, column: 129, scope: !904)
!1006 = !DILocation(line: 204, column: 135, scope: !904)
!1007 = !DILocation(line: 204, column: 141, scope: !904)
!1008 = !DILocation(line: 204, column: 148, scope: !904)
!1009 = !DILocation(line: 204, column: 156, scope: !904)
!1010 = !DILocation(line: 204, column: 3, scope: !904)
!1011 = !DILocalVariable(name: "display", scope: !904, file: !19, line: 206, type: !82)
!1012 = !DILocation(line: 206, column: 19, scope: !904)
!1013 = !DILocation(line: 206, column: 43, scope: !904)
!1014 = !DILocation(line: 206, column: 50, scope: !904)
!1015 = !DILocation(line: 206, column: 57, scope: !904)
!1016 = !DILocation(line: 206, column: 65, scope: !904)
!1017 = !DILocation(line: 206, column: 73, scope: !904)
!1018 = !DILocation(line: 206, column: 71, scope: !904)
!1019 = !DILocation(line: 206, column: 83, scope: !904)
!1020 = !DILocation(line: 206, column: 81, scope: !904)
!1021 = !DILocation(line: 206, column: 29, scope: !904)
!1022 = !DILocation(line: 207, column: 13, scope: !904)
!1023 = !DILocation(line: 207, column: 22, scope: !904)
!1024 = !DILocation(line: 207, column: 29, scope: !904)
!1025 = !DILocation(line: 207, column: 38, scope: !904)
!1026 = !DILocation(line: 207, column: 36, scope: !904)
!1027 = !DILocation(line: 207, column: 48, scope: !904)
!1028 = !DILocation(line: 207, column: 46, scope: !904)
!1029 = !DILocation(line: 207, column: 3, scope: !904)
!1030 = !DILocation(line: 208, column: 12, scope: !904)
!1031 = !DILocation(line: 208, column: 21, scope: !904)
!1032 = !DILocation(line: 208, column: 30, scope: !904)
!1033 = !DILocation(line: 208, column: 37, scope: !904)
!1034 = !DILocation(line: 208, column: 44, scope: !904)
!1035 = !DILocation(line: 208, column: 53, scope: !904)
!1036 = !DILocation(line: 208, column: 51, scope: !904)
!1037 = !DILocation(line: 208, column: 63, scope: !904)
!1038 = !DILocation(line: 208, column: 61, scope: !904)
!1039 = !DILocation(line: 208, column: 3, scope: !904)
!1040 = !DILocation(line: 209, column: 14, scope: !904)
!1041 = !DILocation(line: 209, column: 23, scope: !904)
!1042 = !DILocation(line: 209, column: 32, scope: !904)
!1043 = !DILocation(line: 209, column: 39, scope: !904)
!1044 = !DILocation(line: 209, column: 46, scope: !904)
!1045 = !DILocation(line: 209, column: 53, scope: !904)
!1046 = !DILocation(line: 209, column: 61, scope: !904)
!1047 = !DILocation(line: 209, column: 69, scope: !904)
!1048 = !DILocation(line: 209, column: 67, scope: !904)
!1049 = !DILocation(line: 209, column: 79, scope: !904)
!1050 = !DILocation(line: 209, column: 77, scope: !904)
!1051 = !DILocation(line: 209, column: 3, scope: !904)
!1052 = !DILocation(line: 210, column: 14, scope: !904)
!1053 = !DILocation(line: 210, column: 25, scope: !904)
!1054 = !DILocation(line: 210, column: 23, scope: !904)
!1055 = !DILocation(line: 210, column: 35, scope: !904)
!1056 = !DILocation(line: 210, column: 33, scope: !904)
!1057 = !DILocation(line: 210, column: 3, scope: !904)
!1058 = !DILocation(line: 211, column: 16, scope: !904)
!1059 = !DILocation(line: 211, column: 27, scope: !904)
!1060 = !DILocation(line: 211, column: 25, scope: !904)
!1061 = !DILocation(line: 211, column: 3, scope: !904)
!1062 = !DILocation(line: 212, column: 3, scope: !904)
!1063 = !DILocation(line: 213, column: 1, scope: !904)
