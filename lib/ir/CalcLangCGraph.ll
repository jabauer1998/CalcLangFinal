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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @closeTo(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !56 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !61, metadata !DIExpression()), !dbg !62
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !63, metadata !DIExpression()), !dbg !64
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !65, metadata !DIExpression()), !dbg !66
  %7 = load x86_fp80, ptr %4, align 16, !dbg !67
  %8 = load x86_fp80, ptr %5, align 16, !dbg !68
  %9 = fsub x86_fp80 %7, %8, !dbg !69
  %10 = call x86_fp80 @llvm.fabs.f80(x86_fp80 %9), !dbg !70
  %11 = load x86_fp80, ptr %6, align 16, !dbg !71
  %12 = fcmp olt x86_fp80 %10, %11, !dbg !72
  ret i1 %12, !dbg !73
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fabs.f80(x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @initializeDisplay(i32 noundef %0, i32 noundef %1) #0 !dbg !74 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata ptr %5, metadata !82, metadata !DIExpression()), !dbg !83
  %7 = load i32, ptr %3, align 4, !dbg !84
  %8 = sext i32 %7 to i64, !dbg !84
  %9 = mul i64 8, %8, !dbg !85
  %10 = call noalias ptr @malloc(i64 noundef %9) #7, !dbg !86
  store ptr %10, ptr %5, align 8, !dbg !83
  %11 = load ptr, ptr %5, align 8, !dbg !87
  %12 = load i32, ptr %3, align 4, !dbg !88
  %13 = sext i32 %12 to i64, !dbg !88
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 %13, i1 false), !dbg !89
  call void @llvm.dbg.declare(metadata ptr %6, metadata !90, metadata !DIExpression()), !dbg !92
  store i32 0, ptr %6, align 4, !dbg !92
  br label %14, !dbg !93

14:                                               ; preds = %34, %2
  %15 = load i32, ptr %6, align 4, !dbg !94
  %16 = load i32, ptr %3, align 4, !dbg !96
  %17 = icmp slt i32 %15, %16, !dbg !97
  br i1 %17, label %18, label %37, !dbg !98

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4, !dbg !99
  %20 = sext i32 %19 to i64, !dbg !99
  %21 = mul i64 48, %20, !dbg !101
  %22 = call noalias ptr @malloc(i64 noundef %21) #7, !dbg !102
  %23 = load ptr, ptr %5, align 8, !dbg !103
  %24 = load i32, ptr %6, align 4, !dbg !104
  %25 = sext i32 %24 to i64, !dbg !103
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25, !dbg !103
  store ptr %22, ptr %26, align 8, !dbg !105
  %27 = load ptr, ptr %5, align 8, !dbg !106
  %28 = load i32, ptr %6, align 4, !dbg !107
  %29 = sext i32 %28 to i64, !dbg !106
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !106
  %31 = load ptr, ptr %30, align 8, !dbg !106
  %32 = load i32, ptr %4, align 4, !dbg !108
  %33 = sext i32 %32 to i64, !dbg !108
  call void @llvm.memset.p0.i64(ptr align 16 %31, i8 0, i64 %33, i1 false), !dbg !109
  br label %34, !dbg !110

34:                                               ; preds = %18
  %35 = load i32, ptr %6, align 4, !dbg !111
  %36 = add nsw i32 %35, 1, !dbg !111
  store i32 %36, ptr %6, align 4, !dbg !111
  br label %14, !dbg !112, !llvm.loop !113

37:                                               ; preds = %14
  %38 = load ptr, ptr %5, align 8, !dbg !116
  ret ptr %38, !dbg !117
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, x86_fp80 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !118 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !121, metadata !DIExpression()), !dbg !122
  store x86_fp80 %1, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !123, metadata !DIExpression()), !dbg !124
  store x86_fp80 %2, ptr %9, align 16
  call void @llvm.dbg.declare(metadata ptr %9, metadata !125, metadata !DIExpression()), !dbg !126
  store x86_fp80 %3, ptr %10, align 16
  call void @llvm.dbg.declare(metadata ptr %10, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !129, metadata !DIExpression()), !dbg !130
  store i32 %5, ptr %12, align 4
  call void @llvm.dbg.declare(metadata ptr %12, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata ptr %13, metadata !133, metadata !DIExpression()), !dbg !134
  %16 = load i32, ptr %11, align 4, !dbg !135
  %17 = load i32, ptr %12, align 4, !dbg !136
  %18 = call ptr @initializeDisplay(i32 noundef %16, i32 noundef %17), !dbg !137
  store ptr %18, ptr %13, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata ptr %14, metadata !138, metadata !DIExpression()), !dbg !140
  store i32 0, ptr %14, align 4, !dbg !140
  br label %19, !dbg !141

19:                                               ; preds = %62, %6
  %20 = load i32, ptr %14, align 4, !dbg !142
  %21 = load i32, ptr %11, align 4, !dbg !144
  %22 = icmp slt i32 %20, %21, !dbg !145
  br i1 %22, label %23, label %65, !dbg !146

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %15, metadata !147, metadata !DIExpression()), !dbg !150
  store i32 0, ptr %15, align 4, !dbg !150
  br label %24, !dbg !151

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %15, align 4, !dbg !152
  %26 = load i32, ptr %12, align 4, !dbg !154
  %27 = icmp slt i32 %25, %26, !dbg !155
  br i1 %27, label %28, label %61, !dbg !156

28:                                               ; preds = %24
  %29 = load x86_fp80, ptr %9, align 16, !dbg !157
  %30 = load x86_fp80, ptr %7, align 16, !dbg !159
  %31 = load i32, ptr %15, align 4, !dbg !160
  %32 = sitofp i32 %31 to x86_fp80, !dbg !160
  %33 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %30, x86_fp80 %32, x86_fp80 %29), !dbg !161
  %34 = load ptr, ptr %13, align 8, !dbg !162
  %35 = load i32, ptr %14, align 4, !dbg !163
  %36 = sext i32 %35 to i64, !dbg !162
  %37 = getelementptr inbounds ptr, ptr %34, i64 %36, !dbg !162
  %38 = load ptr, ptr %37, align 8, !dbg !162
  %39 = load i32, ptr %15, align 4, !dbg !164
  %40 = sext i32 %39 to i64, !dbg !162
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %38, i64 %40, !dbg !162
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %41, i32 0, i32 0, !dbg !165
  store x86_fp80 %33, ptr %42, align 16, !dbg !166
  %43 = load x86_fp80, ptr %10, align 16, !dbg !167
  %44 = load x86_fp80, ptr %8, align 16, !dbg !168
  %45 = load i32, ptr %14, align 4, !dbg !169
  %46 = sitofp i32 %45 to x86_fp80, !dbg !169
  %47 = fneg x86_fp80 %44, !dbg !170
  %48 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %47, x86_fp80 %46, x86_fp80 %43), !dbg !170
  %49 = load ptr, ptr %13, align 8, !dbg !171
  %50 = load i32, ptr %14, align 4, !dbg !172
  %51 = sext i32 %50 to i64, !dbg !171
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !171
  %53 = load ptr, ptr %52, align 8, !dbg !171
  %54 = load i32, ptr %15, align 4, !dbg !173
  %55 = sext i32 %54 to i64, !dbg !171
  %56 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i64 %55, !dbg !171
  %57 = getelementptr inbounds %struct.CalcLangPixel, ptr %56, i32 0, i32 1, !dbg !174
  store x86_fp80 %48, ptr %57, align 16, !dbg !175
  br label %58, !dbg !176

58:                                               ; preds = %28
  %59 = load i32, ptr %15, align 4, !dbg !177
  %60 = add nsw i32 %59, 1, !dbg !177
  store i32 %60, ptr %15, align 4, !dbg !177
  br label %24, !dbg !178, !llvm.loop !179

61:                                               ; preds = %24
  br label %62, !dbg !181

62:                                               ; preds = %61
  %63 = load i32, ptr %14, align 4, !dbg !182
  %64 = add nsw i32 %63, 1, !dbg !182
  store i32 %64, ptr %14, align 4, !dbg !182
  br label %19, !dbg !183, !llvm.loop !184

65:                                               ; preds = %19
  %66 = load ptr, ptr %13, align 8, !dbg !186
  ret ptr %66, !dbg !187
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !188 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !191, metadata !DIExpression()), !dbg !192
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !193, metadata !DIExpression()), !dbg !194
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata ptr %7, metadata !197, metadata !DIExpression()), !dbg !199
  store ptr @.str, ptr %7, align 8, !dbg !199
  call void @llvm.dbg.declare(metadata ptr %8, metadata !200, metadata !DIExpression()), !dbg !201
  %12 = load x86_fp80, ptr %6, align 16, !dbg !202
  %13 = fdiv x86_fp80 %12, 0xK40028000000000000000, !dbg !203
  store x86_fp80 %13, ptr %8, align 16, !dbg !201
  call void @llvm.dbg.declare(metadata ptr %9, metadata !204, metadata !DIExpression()), !dbg !205
  %14 = load x86_fp80, ptr %4, align 16, !dbg !206
  %15 = load x86_fp80, ptr %5, align 16, !dbg !207
  %16 = load x86_fp80, ptr %6, align 16, !dbg !208
  %17 = fdiv x86_fp80 %16, 0xK40008000000000000000, !dbg !209
  %18 = fsub x86_fp80 %15, %17, !dbg !210
  %19 = fsub x86_fp80 %14, %18, !dbg !211
  store x86_fp80 %19, ptr %9, align 16, !dbg !205
  call void @llvm.dbg.declare(metadata ptr %10, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 0, ptr %10, align 4, !dbg !213
  call void @llvm.dbg.declare(metadata ptr %11, metadata !214, metadata !DIExpression()), !dbg !215
  store x86_fp80 0xK00000000000000000000, ptr %11, align 16, !dbg !215
  br label %20, !dbg !216

20:                                               ; preds = %24, %3
  %21 = load x86_fp80, ptr %11, align 16, !dbg !217
  %22 = load x86_fp80, ptr %9, align 16, !dbg !218
  %23 = fcmp olt x86_fp80 %21, %22, !dbg !219
  br i1 %23, label %24, label %30, !dbg !216

24:                                               ; preds = %20
  %25 = load x86_fp80, ptr %8, align 16, !dbg !220
  %26 = load x86_fp80, ptr %11, align 16, !dbg !222
  %27 = fadd x86_fp80 %26, %25, !dbg !222
  store x86_fp80 %27, ptr %11, align 16, !dbg !222
  %28 = load i32, ptr %10, align 4, !dbg !223
  %29 = add nsw i32 %28, 1, !dbg !223
  store i32 %29, ptr %10, align 4, !dbg !223
  br label %20, !dbg !216, !llvm.loop !224

30:                                               ; preds = %20
  %31 = load ptr, ptr %7, align 8, !dbg !226
  %32 = load i32, ptr %10, align 4, !dbg !227
  %33 = sub nsw i32 %32, 1, !dbg !228
  %34 = sext i32 %33 to i64, !dbg !226
  %35 = getelementptr inbounds i8, ptr %31, i64 %34, !dbg !226
  %36 = load i8, ptr %35, align 1, !dbg !226
  ret i8 %36, !dbg !229
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !230 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !237, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata ptr %7, metadata !239, metadata !DIExpression()), !dbg !241
  %12 = load i32, ptr %5, align 4, !dbg !242
  %13 = sext i32 %12 to i64, !dbg !242
  %14 = mul i64 8, %13, !dbg !243
  %15 = add i64 %14, 1, !dbg !244
  %16 = call noalias ptr @malloc(i64 noundef %15) #7, !dbg !245
  store ptr %16, ptr %7, align 8, !dbg !241
  call void @llvm.dbg.declare(metadata ptr %8, metadata !246, metadata !DIExpression()), !dbg !248
  store i32 0, ptr %8, align 4, !dbg !248
  br label %17, !dbg !249

17:                                               ; preds = %31, %3
  %18 = load i32, ptr %8, align 4, !dbg !250
  %19 = load i32, ptr %5, align 4, !dbg !252
  %20 = icmp slt i32 %18, %19, !dbg !253
  br i1 %20, label %21, label %34, !dbg !254

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4, !dbg !255
  %23 = sext i32 %22 to i64, !dbg !255
  %24 = mul i64 1, %23, !dbg !257
  %25 = add i64 %24, 1, !dbg !258
  %26 = call noalias ptr @malloc(i64 noundef %25) #7, !dbg !259
  %27 = load ptr, ptr %7, align 8, !dbg !260
  %28 = load i32, ptr %8, align 4, !dbg !261
  %29 = sext i32 %28 to i64, !dbg !260
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !260
  store ptr %26, ptr %30, align 8, !dbg !262
  br label %31, !dbg !263

31:                                               ; preds = %21
  %32 = load i32, ptr %8, align 4, !dbg !264
  %33 = add nsw i32 %32, 1, !dbg !264
  store i32 %33, ptr %8, align 4, !dbg !264
  br label %17, !dbg !265, !llvm.loop !266

34:                                               ; preds = %17
  call void @llvm.dbg.declare(metadata ptr %9, metadata !268, metadata !DIExpression()), !dbg !270
  store i32 0, ptr %9, align 4, !dbg !270
  br label %35, !dbg !271

35:                                               ; preds = %75, %34
  %36 = load i32, ptr %9, align 4, !dbg !272
  %37 = load i32, ptr %5, align 4, !dbg !274
  %38 = icmp slt i32 %36, %37, !dbg !275
  br i1 %38, label %39, label %78, !dbg !276

39:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata ptr %10, metadata !277, metadata !DIExpression()), !dbg !280
  store i32 0, ptr %10, align 4, !dbg !280
  br label %40, !dbg !281

40:                                               ; preds = %63, %39
  %41 = load i32, ptr %10, align 4, !dbg !282
  %42 = load i32, ptr %6, align 4, !dbg !284
  %43 = icmp slt i32 %41, %42, !dbg !285
  br i1 %43, label %44, label %66, !dbg !286

44:                                               ; preds = %40
  %45 = load ptr, ptr %4, align 8, !dbg !287
  %46 = load i32, ptr %9, align 4, !dbg !288
  %47 = sext i32 %46 to i64, !dbg !287
  %48 = getelementptr inbounds ptr, ptr %45, i64 %47, !dbg !287
  %49 = load ptr, ptr %48, align 8, !dbg !287
  %50 = load i32, ptr %10, align 4, !dbg !289
  %51 = sext i32 %50 to i64, !dbg !287
  %52 = getelementptr inbounds %struct.CalcLangPixel, ptr %49, i64 %51, !dbg !287
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %52, i32 0, i32 2, !dbg !290
  %54 = load i8, ptr %53, align 16, !dbg !290
  %55 = load ptr, ptr %7, align 8, !dbg !291
  %56 = load i32, ptr %9, align 4, !dbg !292
  %57 = sext i32 %56 to i64, !dbg !291
  %58 = getelementptr inbounds ptr, ptr %55, i64 %57, !dbg !291
  %59 = load ptr, ptr %58, align 8, !dbg !291
  %60 = load i32, ptr %10, align 4, !dbg !293
  %61 = sext i32 %60 to i64, !dbg !291
  %62 = getelementptr inbounds i8, ptr %59, i64 %61, !dbg !291
  store i8 %54, ptr %62, align 1, !dbg !294
  br label %63, !dbg !291

63:                                               ; preds = %44
  %64 = load i32, ptr %10, align 4, !dbg !295
  %65 = add nsw i32 %64, 1, !dbg !295
  store i32 %65, ptr %10, align 4, !dbg !295
  br label %40, !dbg !296, !llvm.loop !297

66:                                               ; preds = %40
  %67 = load ptr, ptr %7, align 8, !dbg !299
  %68 = load i32, ptr %9, align 4, !dbg !300
  %69 = sext i32 %68 to i64, !dbg !299
  %70 = getelementptr inbounds ptr, ptr %67, i64 %69, !dbg !299
  %71 = load ptr, ptr %70, align 8, !dbg !299
  %72 = load i32, ptr %6, align 4, !dbg !301
  %73 = sext i32 %72 to i64, !dbg !299
  %74 = getelementptr inbounds i8, ptr %71, i64 %73, !dbg !299
  store i8 0, ptr %74, align 1, !dbg !302
  br label %75, !dbg !303

75:                                               ; preds = %66
  %76 = load i32, ptr %9, align 4, !dbg !304
  %77 = add nsw i32 %76, 1, !dbg !304
  store i32 %77, ptr %9, align 4, !dbg !304
  br label %35, !dbg !305, !llvm.loop !306

78:                                               ; preds = %35
  call void @llvm.dbg.declare(metadata ptr %11, metadata !308, metadata !DIExpression()), !dbg !310
  store i32 0, ptr %11, align 4, !dbg !310
  br label %79, !dbg !311

79:                                               ; preds = %90, %78
  %80 = load i32, ptr %11, align 4, !dbg !312
  %81 = load i32, ptr %5, align 4, !dbg !314
  %82 = icmp slt i32 %80, %81, !dbg !315
  br i1 %82, label %83, label %93, !dbg !316

83:                                               ; preds = %79
  %84 = load ptr, ptr %7, align 8, !dbg !317
  %85 = load i32, ptr %11, align 4, !dbg !318
  %86 = sext i32 %85 to i64, !dbg !317
  %87 = getelementptr inbounds ptr, ptr %84, i64 %86, !dbg !317
  %88 = load ptr, ptr %87, align 8, !dbg !317
  %89 = call i32 @puts(ptr noundef %88), !dbg !319
  br label %90, !dbg !319

90:                                               ; preds = %83
  %91 = load i32, ptr %11, align 4, !dbg !320
  %92 = add nsw i32 %91, 1, !dbg !320
  store i32 %92, ptr %11, align 4, !dbg !320
  br label %79, !dbg !321, !llvm.loop !322

93:                                               ; preds = %79
  ret void, !dbg !324
}

declare i32 @puts(ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @calcLangValueFuncWrapper(ptr noundef %0, ptr noundef %1, x86_fp80 noundef %2) #0 !dbg !325 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !372, metadata !DIExpression()), !dbg !373
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !374, metadata !DIExpression()), !dbg !375
  store x86_fp80 %2, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata ptr %8, metadata !378, metadata !DIExpression()), !dbg !379
  %10 = load ptr, ptr %5, align 8, !dbg !380
  %11 = call ptr @arenaAlloc(ptr noundef %10, i32 noundef 16), !dbg !381
  store ptr %11, ptr %8, align 8, !dbg !379
  %12 = load ptr, ptr %8, align 8, !dbg !382
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 0, !dbg !383
  store i32 0, ptr %13, align 8, !dbg !384
  %14 = load x86_fp80, ptr %7, align 16, !dbg !385
  %15 = fptosi x86_fp80 %14 to i32, !dbg !386
  %16 = load ptr, ptr %8, align 8, !dbg !387
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 1, !dbg !388
  store i32 %15, ptr %17, align 8, !dbg !389
  call void @llvm.dbg.declare(metadata ptr %9, metadata !390, metadata !DIExpression()), !dbg !391
  %18 = load ptr, ptr %6, align 8, !dbg !392
  %19 = load ptr, ptr %5, align 8, !dbg !393
  %20 = load ptr, ptr %8, align 8, !dbg !394
  %21 = call ptr %18(ptr noundef %19, ptr noundef %20), !dbg !392
  store ptr %21, ptr %9, align 8, !dbg !391
  %22 = load ptr, ptr %9, align 8, !dbg !395
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0, !dbg !397
  %24 = load i32, ptr %23, align 8, !dbg !397
  %25 = icmp eq i32 %24, 0, !dbg !398
  br i1 %25, label %26, label %31, !dbg !399

26:                                               ; preds = %3
  %27 = load ptr, ptr %9, align 8, !dbg !400
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1, !dbg !401
  %29 = load i32, ptr %28, align 8, !dbg !402
  %30 = sitofp i32 %29 to x86_fp80, !dbg !403
  store x86_fp80 %30, ptr %4, align 16, !dbg !404
  br label %32, !dbg !404

31:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #8, !dbg !405
  store x86_fp80 0xKBFFF8000000000000000, ptr %4, align 16, !dbg !407
  br label %32, !dbg !407

32:                                               ; preds = %31, %26
  %33 = load x86_fp80, ptr %4, align 16, !dbg !408
  ret x86_fp80 %33, !dbg !408
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #4

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @shadeGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, x86_fp80 noundef %5, x86_fp80 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !409 {
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !412, metadata !DIExpression()), !dbg !413
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !414, metadata !DIExpression()), !dbg !415
  store ptr %2, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !416, metadata !DIExpression()), !dbg !417
  store x86_fp80 %3, ptr %13, align 16
  call void @llvm.dbg.declare(metadata ptr %13, metadata !418, metadata !DIExpression()), !dbg !419
  store x86_fp80 %4, ptr %14, align 16
  call void @llvm.dbg.declare(metadata ptr %14, metadata !420, metadata !DIExpression()), !dbg !421
  store x86_fp80 %5, ptr %15, align 16
  call void @llvm.dbg.declare(metadata ptr %15, metadata !422, metadata !DIExpression()), !dbg !423
  store x86_fp80 %6, ptr %16, align 16
  call void @llvm.dbg.declare(metadata ptr %16, metadata !424, metadata !DIExpression()), !dbg !425
  store i32 %7, ptr %17, align 4
  call void @llvm.dbg.declare(metadata ptr %17, metadata !426, metadata !DIExpression()), !dbg !427
  store i32 %8, ptr %18, align 4
  call void @llvm.dbg.declare(metadata ptr %18, metadata !428, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.declare(metadata ptr %19, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata ptr %20, metadata !432, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.declare(metadata ptr %21, metadata !434, metadata !DIExpression()), !dbg !436
  store i32 0, ptr %21, align 4, !dbg !436
  br label %25, !dbg !437

25:                                               ; preds = %104, %9
  %26 = load i32, ptr %21, align 4, !dbg !438
  %27 = load i32, ptr %17, align 4, !dbg !440
  %28 = icmp slt i32 %26, %27, !dbg !441
  br i1 %28, label %29, label %107, !dbg !442

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %22, metadata !443, metadata !DIExpression()), !dbg !446
  store i32 0, ptr %22, align 4, !dbg !446
  br label %30, !dbg !447

30:                                               ; preds = %100, %29
  %31 = load i32, ptr %22, align 4, !dbg !448
  %32 = load i32, ptr %18, align 4, !dbg !450
  %33 = icmp slt i32 %31, %32, !dbg !451
  br i1 %33, label %34, label %103, !dbg !452

34:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %23, metadata !453, metadata !DIExpression()), !dbg !455
  %35 = load ptr, ptr %10, align 8, !dbg !456
  %36 = load i32, ptr %21, align 4, !dbg !457
  %37 = sext i32 %36 to i64, !dbg !456
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !456
  %39 = load ptr, ptr %38, align 8, !dbg !456
  %40 = load i32, ptr %22, align 4, !dbg !458
  %41 = sext i32 %40 to i64, !dbg !456
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i64 %41, !dbg !456
  store ptr %42, ptr %23, align 8, !dbg !455
  %43 = load ptr, ptr %23, align 8, !dbg !459
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 0, !dbg !460
  %45 = load x86_fp80, ptr %44, align 16, !dbg !460
  store x86_fp80 %45, ptr %19, align 16, !dbg !461
  %46 = load ptr, ptr %23, align 8, !dbg !462
  %47 = getelementptr inbounds %struct.CalcLangPixel, ptr %46, i32 0, i32 1, !dbg !463
  %48 = load x86_fp80, ptr %47, align 16, !dbg !463
  store x86_fp80 %48, ptr %20, align 16, !dbg !464
  call void @llvm.dbg.declare(metadata ptr %24, metadata !465, metadata !DIExpression()), !dbg !466
  %49 = load ptr, ptr %12, align 8, !dbg !467
  %50 = load ptr, ptr %11, align 8, !dbg !468
  %51 = load x86_fp80, ptr %19, align 16, !dbg !469
  %52 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %49, ptr noundef %50, x86_fp80 noundef %51), !dbg !470
  store x86_fp80 %52, ptr %24, align 16, !dbg !466
  %53 = load x86_fp80, ptr %24, align 16, !dbg !471
  %54 = load x86_fp80, ptr %20, align 16, !dbg !473
  %55 = load x86_fp80, ptr %14, align 16, !dbg !474
  %56 = fdiv x86_fp80 %55, 0xK40008666666666666800, !dbg !475
  %57 = call zeroext i1 @closeTo(x86_fp80 noundef %53, x86_fp80 noundef %54, x86_fp80 noundef %56), !dbg !476
  br i1 %57, label %58, label %65, !dbg !477

58:                                               ; preds = %34
  %59 = load x86_fp80, ptr %24, align 16, !dbg !478
  %60 = load x86_fp80, ptr %20, align 16, !dbg !479
  %61 = load x86_fp80, ptr %14, align 16, !dbg !480
  %62 = call signext i8 @yCompress(x86_fp80 noundef %59, x86_fp80 noundef %60, x86_fp80 noundef %61), !dbg !481
  %63 = load ptr, ptr %23, align 8, !dbg !482
  %64 = getelementptr inbounds %struct.CalcLangPixel, ptr %63, i32 0, i32 2, !dbg !483
  store i8 %62, ptr %64, align 16, !dbg !484
  br label %99, !dbg !482

65:                                               ; preds = %34
  %66 = load x86_fp80, ptr %24, align 16, !dbg !485
  %67 = fcmp olt x86_fp80 %66, 0xK00000000000000000000, !dbg !487
  br i1 %67, label %68, label %77, !dbg !488

68:                                               ; preds = %65
  %69 = load x86_fp80, ptr %20, align 16, !dbg !489
  %70 = load x86_fp80, ptr %14, align 16, !dbg !490
  %71 = fdiv x86_fp80 %70, 0xK40008000000000000000, !dbg !491
  %72 = fcmp olt x86_fp80 %69, %71, !dbg !492
  br i1 %72, label %73, label %98, !dbg !493

73:                                               ; preds = %68
  %74 = load x86_fp80, ptr %20, align 16, !dbg !494
  %75 = load x86_fp80, ptr %24, align 16, !dbg !495
  %76 = fcmp ogt x86_fp80 %74, %75, !dbg !496
  br i1 %76, label %87, label %98, !dbg !497

77:                                               ; preds = %65
  %78 = load x86_fp80, ptr %20, align 16, !dbg !498
  %79 = load x86_fp80, ptr %14, align 16, !dbg !499
  %80 = fneg x86_fp80 %79, !dbg !500
  %81 = fdiv x86_fp80 %80, 0xK40008000000000000000, !dbg !501
  %82 = fcmp ogt x86_fp80 %78, %81, !dbg !502
  br i1 %82, label %83, label %98, !dbg !503

83:                                               ; preds = %77
  %84 = load x86_fp80, ptr %20, align 16, !dbg !504
  %85 = load x86_fp80, ptr %24, align 16, !dbg !505
  %86 = fcmp olt x86_fp80 %84, %85, !dbg !506
  br i1 %86, label %87, label %98, !dbg !488

87:                                               ; preds = %83, %73
  %88 = load x86_fp80, ptr %19, align 16, !dbg !507
  %89 = load x86_fp80, ptr %15, align 16, !dbg !508
  %90 = fcmp ogt x86_fp80 %88, %89, !dbg !509
  br i1 %90, label %91, label %98, !dbg !510

91:                                               ; preds = %87
  %92 = load x86_fp80, ptr %19, align 16, !dbg !511
  %93 = load x86_fp80, ptr %16, align 16, !dbg !512
  %94 = fcmp olt x86_fp80 %92, %93, !dbg !513
  br i1 %94, label %95, label %98, !dbg !514

95:                                               ; preds = %91
  %96 = load ptr, ptr %23, align 8, !dbg !515
  %97 = getelementptr inbounds %struct.CalcLangPixel, ptr %96, i32 0, i32 2, !dbg !516
  store i8 35, ptr %97, align 16, !dbg !517
  br label %98, !dbg !515

98:                                               ; preds = %95, %91, %87, %83, %77, %73, %68
  br label %99

99:                                               ; preds = %98, %58
  br label %100, !dbg !518

100:                                              ; preds = %99
  %101 = load i32, ptr %22, align 4, !dbg !519
  %102 = add nsw i32 %101, 1, !dbg !519
  store i32 %102, ptr %22, align 4, !dbg !519
  br label %30, !dbg !520, !llvm.loop !521

103:                                              ; preds = %30
  br label %104, !dbg !523

104:                                              ; preds = %103
  %105 = load i32, ptr %21, align 4, !dbg !524
  %106 = add nsw i32 %105, 1, !dbg !524
  store i32 %106, ptr %21, align 4, !dbg !524
  br label %25, !dbg !525, !llvm.loop !526

107:                                              ; preds = %25
  ret void, !dbg !528
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !529 {
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
  call void @llvm.dbg.declare(metadata ptr %8, metadata !532, metadata !DIExpression()), !dbg !533
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !534, metadata !DIExpression()), !dbg !535
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !536, metadata !DIExpression()), !dbg !537
  store x86_fp80 %3, ptr %11, align 16
  call void @llvm.dbg.declare(metadata ptr %11, metadata !538, metadata !DIExpression()), !dbg !539
  store x86_fp80 %4, ptr %12, align 16
  call void @llvm.dbg.declare(metadata ptr %12, metadata !540, metadata !DIExpression()), !dbg !541
  store i32 %5, ptr %13, align 4
  call void @llvm.dbg.declare(metadata ptr %13, metadata !542, metadata !DIExpression()), !dbg !543
  store i32 %6, ptr %14, align 4
  call void @llvm.dbg.declare(metadata ptr %14, metadata !544, metadata !DIExpression()), !dbg !545
  call void @llvm.dbg.declare(metadata ptr %15, metadata !546, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.declare(metadata ptr %16, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata ptr %17, metadata !550, metadata !DIExpression()), !dbg !552
  store i32 0, ptr %17, align 4, !dbg !552
  br label %21, !dbg !553

21:                                               ; preds = %67, %7
  %22 = load i32, ptr %17, align 4, !dbg !554
  %23 = load i32, ptr %13, align 4, !dbg !556
  %24 = icmp slt i32 %22, %23, !dbg !557
  br i1 %24, label %25, label %70, !dbg !558

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %18, metadata !559, metadata !DIExpression()), !dbg !562
  store i32 0, ptr %18, align 4, !dbg !562
  br label %26, !dbg !563

26:                                               ; preds = %63, %25
  %27 = load i32, ptr %18, align 4, !dbg !564
  %28 = load i32, ptr %14, align 4, !dbg !566
  %29 = icmp slt i32 %27, %28, !dbg !567
  br i1 %29, label %30, label %66, !dbg !568

30:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %19, metadata !569, metadata !DIExpression()), !dbg !571
  %31 = load ptr, ptr %8, align 8, !dbg !572
  %32 = load i32, ptr %17, align 4, !dbg !573
  %33 = sext i32 %32 to i64, !dbg !572
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !572
  %35 = load ptr, ptr %34, align 8, !dbg !572
  %36 = load i32, ptr %18, align 4, !dbg !574
  %37 = sext i32 %36 to i64, !dbg !572
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %35, i64 %37, !dbg !572
  store ptr %38, ptr %19, align 8, !dbg !571
  %39 = load ptr, ptr %19, align 8, !dbg !575
  %40 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i32 0, i32 0, !dbg !576
  %41 = load x86_fp80, ptr %40, align 16, !dbg !576
  store x86_fp80 %41, ptr %15, align 16, !dbg !577
  %42 = load ptr, ptr %19, align 8, !dbg !578
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %42, i32 0, i32 1, !dbg !579
  %44 = load x86_fp80, ptr %43, align 16, !dbg !579
  store x86_fp80 %44, ptr %16, align 16, !dbg !580
  call void @llvm.dbg.declare(metadata ptr %20, metadata !581, metadata !DIExpression()), !dbg !582
  %45 = load ptr, ptr %10, align 8, !dbg !583
  %46 = load ptr, ptr %9, align 8, !dbg !584
  %47 = load x86_fp80, ptr %15, align 16, !dbg !585
  %48 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %45, ptr noundef %46, x86_fp80 noundef %47), !dbg !586
  store x86_fp80 %48, ptr %20, align 16, !dbg !582
  %49 = load ptr, ptr %10, align 8, !dbg !587
  call void @arenaReset(ptr noundef %49), !dbg !588
  %50 = load x86_fp80, ptr %20, align 16, !dbg !589
  %51 = load x86_fp80, ptr %16, align 16, !dbg !591
  %52 = load x86_fp80, ptr %12, align 16, !dbg !592
  %53 = fdiv x86_fp80 %52, 0xK40008666666666666800, !dbg !593
  %54 = call zeroext i1 @closeTo(x86_fp80 noundef %50, x86_fp80 noundef %51, x86_fp80 noundef %53), !dbg !594
  br i1 %54, label %55, label %62, !dbg !595

55:                                               ; preds = %30
  %56 = load x86_fp80, ptr %20, align 16, !dbg !596
  %57 = load x86_fp80, ptr %16, align 16, !dbg !597
  %58 = load x86_fp80, ptr %12, align 16, !dbg !598
  %59 = call signext i8 @yCompress(x86_fp80 noundef %56, x86_fp80 noundef %57, x86_fp80 noundef %58), !dbg !599
  %60 = load ptr, ptr %19, align 8, !dbg !600
  %61 = getelementptr inbounds %struct.CalcLangPixel, ptr %60, i32 0, i32 2, !dbg !601
  store i8 %59, ptr %61, align 16, !dbg !602
  br label %62, !dbg !600

62:                                               ; preds = %55, %30
  br label %63, !dbg !603

63:                                               ; preds = %62
  %64 = load i32, ptr %18, align 4, !dbg !604
  %65 = add nsw i32 %64, 1, !dbg !604
  store i32 %65, ptr %18, align 4, !dbg !604
  br label %26, !dbg !605, !llvm.loop !606

66:                                               ; preds = %26
  br label %67, !dbg !608

67:                                               ; preds = %66
  %68 = load i32, ptr %17, align 4, !dbg !609
  %69 = add nsw i32 %68, 1, !dbg !609
  store i32 %69, ptr %17, align 4, !dbg !609
  br label %21, !dbg !610, !llvm.loop !611

70:                                               ; preds = %21
  ret void, !dbg !613
}

declare void @arenaReset(ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printDisplayCordinates(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !614 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !615, metadata !DIExpression()), !dbg !616
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !617, metadata !DIExpression()), !dbg !618
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !619, metadata !DIExpression()), !dbg !620
  call void @llvm.dbg.declare(metadata ptr %7, metadata !621, metadata !DIExpression()), !dbg !623
  store i32 0, ptr %7, align 4, !dbg !623
  br label %9, !dbg !624

9:                                                ; preds = %46, %3
  %10 = load i32, ptr %7, align 4, !dbg !625
  %11 = load i32, ptr %5, align 4, !dbg !627
  %12 = icmp slt i32 %10, %11, !dbg !628
  br i1 %12, label %13, label %49, !dbg !629

13:                                               ; preds = %9
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !630
  call void @llvm.dbg.declare(metadata ptr %8, metadata !632, metadata !DIExpression()), !dbg !634
  store i32 0, ptr %8, align 4, !dbg !634
  br label %15, !dbg !635

15:                                               ; preds = %41, %13
  %16 = load i32, ptr %8, align 4, !dbg !636
  %17 = load i32, ptr %6, align 4, !dbg !638
  %18 = icmp slt i32 %16, %17, !dbg !639
  br i1 %18, label %19, label %44, !dbg !640

19:                                               ; preds = %15
  %20 = load ptr, ptr %4, align 8, !dbg !641
  %21 = load i32, ptr %7, align 4, !dbg !643
  %22 = sext i32 %21 to i64, !dbg !641
  %23 = getelementptr inbounds ptr, ptr %20, i64 %22, !dbg !641
  %24 = load ptr, ptr %23, align 8, !dbg !641
  %25 = load i32, ptr %8, align 4, !dbg !644
  %26 = sext i32 %25 to i64, !dbg !641
  %27 = getelementptr inbounds %struct.CalcLangPixel, ptr %24, i64 %26, !dbg !641
  %28 = getelementptr inbounds %struct.CalcLangPixel, ptr %27, i32 0, i32 0, !dbg !645
  %29 = load x86_fp80, ptr %28, align 16, !dbg !645
  %30 = load ptr, ptr %4, align 8, !dbg !646
  %31 = load i32, ptr %7, align 4, !dbg !647
  %32 = sext i32 %31 to i64, !dbg !646
  %33 = getelementptr inbounds ptr, ptr %30, i64 %32, !dbg !646
  %34 = load ptr, ptr %33, align 8, !dbg !646
  %35 = load i32, ptr %8, align 4, !dbg !648
  %36 = sext i32 %35 to i64, !dbg !646
  %37 = getelementptr inbounds %struct.CalcLangPixel, ptr %34, i64 %36, !dbg !646
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 1, !dbg !649
  %39 = load x86_fp80, ptr %38, align 16, !dbg !649
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, x86_fp80 noundef %29, x86_fp80 noundef %39), !dbg !650
  br label %41, !dbg !651

41:                                               ; preds = %19
  %42 = load i32, ptr %8, align 4, !dbg !652
  %43 = add nsw i32 %42, 1, !dbg !652
  store i32 %43, ptr %8, align 4, !dbg !652
  br label %15, !dbg !653, !llvm.loop !654

44:                                               ; preds = %15
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !dbg !656
  br label %46, !dbg !657

46:                                               ; preds = %44
  %47 = load i32, ptr %7, align 4, !dbg !658
  %48 = add nsw i32 %47, 1, !dbg !658
  store i32 %48, ptr %7, align 4, !dbg !658
  br label %9, !dbg !659, !llvm.loop !660

49:                                               ; preds = %9
  ret void, !dbg !662
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !663 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !666, metadata !DIExpression()), !dbg !667
  store x86_fp80 %1, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !668, metadata !DIExpression()), !dbg !669
  store x86_fp80 %2, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !670, metadata !DIExpression()), !dbg !671
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !672, metadata !DIExpression()), !dbg !673
  store i32 %4, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !674, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.declare(metadata ptr %11, metadata !676, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.declare(metadata ptr %12, metadata !678, metadata !DIExpression()), !dbg !679
  call void @llvm.dbg.declare(metadata ptr %13, metadata !680, metadata !DIExpression()), !dbg !682
  store i32 0, ptr %13, align 4, !dbg !682
  br label %19, !dbg !683

19:                                               ; preds = %88, %5
  %20 = load i32, ptr %13, align 4, !dbg !684
  %21 = load i32, ptr %9, align 4, !dbg !686
  %22 = icmp slt i32 %20, %21, !dbg !687
  br i1 %22, label %23, label %91, !dbg !688

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %14, metadata !689, metadata !DIExpression()), !dbg !692
  store i32 0, ptr %14, align 4, !dbg !692
  br label %24, !dbg !693

24:                                               ; preds = %84, %23
  %25 = load i32, ptr %14, align 4, !dbg !694
  %26 = load i32, ptr %10, align 4, !dbg !696
  %27 = icmp slt i32 %25, %26, !dbg !697
  br i1 %27, label %28, label %87, !dbg !698

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %15, metadata !699, metadata !DIExpression()), !dbg !701
  %29 = load ptr, ptr %6, align 8, !dbg !702
  %30 = load i32, ptr %13, align 4, !dbg !703
  %31 = sext i32 %30 to i64, !dbg !702
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31, !dbg !702
  %33 = load ptr, ptr %32, align 8, !dbg !702
  %34 = load i32, ptr %14, align 4, !dbg !704
  %35 = sext i32 %34 to i64, !dbg !702
  %36 = getelementptr inbounds %struct.CalcLangPixel, ptr %33, i64 %35, !dbg !702
  store ptr %36, ptr %15, align 8, !dbg !701
  %37 = load ptr, ptr %15, align 8, !dbg !705
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 0, !dbg !706
  %39 = load x86_fp80, ptr %38, align 16, !dbg !706
  store x86_fp80 %39, ptr %11, align 16, !dbg !707
  %40 = load ptr, ptr %15, align 8, !dbg !708
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i32 0, i32 1, !dbg !709
  %42 = load x86_fp80, ptr %41, align 16, !dbg !709
  store x86_fp80 %42, ptr %12, align 16, !dbg !710
  call void @llvm.dbg.declare(metadata ptr %16, metadata !711, metadata !DIExpression()), !dbg !712
  %43 = load x86_fp80, ptr %11, align 16, !dbg !713
  %44 = load x86_fp80, ptr %7, align 16, !dbg !714
  %45 = fdiv x86_fp80 %44, 0xK40008666666666666800, !dbg !715
  %46 = call zeroext i1 @closeTo(x86_fp80 noundef %43, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %45), !dbg !716
  %47 = zext i1 %46 to i8, !dbg !712
  store i8 %47, ptr %16, align 1, !dbg !712
  call void @llvm.dbg.declare(metadata ptr %17, metadata !717, metadata !DIExpression()), !dbg !718
  %48 = load x86_fp80, ptr %12, align 16, !dbg !719
  %49 = load x86_fp80, ptr %8, align 16, !dbg !720
  %50 = fdiv x86_fp80 %49, 0xK40008666666666666800, !dbg !721
  %51 = call zeroext i1 @closeTo(x86_fp80 noundef %48, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %50), !dbg !722
  %52 = zext i1 %51 to i8, !dbg !718
  store i8 %52, ptr %17, align 1, !dbg !718
  call void @llvm.dbg.declare(metadata ptr %18, metadata !723, metadata !DIExpression()), !dbg !724
  %53 = load i8, ptr %16, align 1, !dbg !725
  %54 = trunc i8 %53 to i1, !dbg !725
  br i1 %54, label %55, label %58, !dbg !726

55:                                               ; preds = %28
  %56 = load i8, ptr %17, align 1, !dbg !727
  %57 = trunc i8 %56 to i1, !dbg !727
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi i1 [ false, %28 ], [ %57, %55 ], !dbg !728
  %60 = zext i1 %59 to i8, !dbg !724
  store i8 %60, ptr %18, align 1, !dbg !724
  %61 = load i8, ptr %18, align 1, !dbg !729
  %62 = trunc i8 %61 to i1, !dbg !729
  br i1 %62, label %63, label %66, !dbg !731

63:                                               ; preds = %58
  %64 = load ptr, ptr %15, align 8, !dbg !732
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 2, !dbg !733
  store i8 43, ptr %65, align 16, !dbg !734
  br label %83, !dbg !732

66:                                               ; preds = %58
  %67 = load i8, ptr %16, align 1, !dbg !735
  %68 = trunc i8 %67 to i1, !dbg !735
  br i1 %68, label %69, label %72, !dbg !737

69:                                               ; preds = %66
  %70 = load ptr, ptr %15, align 8, !dbg !738
  %71 = getelementptr inbounds %struct.CalcLangPixel, ptr %70, i32 0, i32 2, !dbg !739
  store i8 124, ptr %71, align 16, !dbg !740
  br label %82, !dbg !738

72:                                               ; preds = %66
  %73 = load i8, ptr %17, align 1, !dbg !741
  %74 = trunc i8 %73 to i1, !dbg !741
  br i1 %74, label %75, label %78, !dbg !743

75:                                               ; preds = %72
  %76 = load ptr, ptr %15, align 8, !dbg !744
  %77 = getelementptr inbounds %struct.CalcLangPixel, ptr %76, i32 0, i32 2, !dbg !745
  store i8 45, ptr %77, align 16, !dbg !746
  br label %81, !dbg !744

78:                                               ; preds = %72
  %79 = load ptr, ptr %15, align 8, !dbg !747
  %80 = getelementptr inbounds %struct.CalcLangPixel, ptr %79, i32 0, i32 2, !dbg !748
  store i8 32, ptr %80, align 16, !dbg !749
  br label %81

81:                                               ; preds = %78, %75
  br label %82

82:                                               ; preds = %81, %69
  br label %83

83:                                               ; preds = %82, %63
  br label %84, !dbg !750

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4, !dbg !751
  %86 = add nsw i32 %85, 1, !dbg !751
  store i32 %86, ptr %14, align 4, !dbg !751
  br label %24, !dbg !752, !llvm.loop !753

87:                                               ; preds = %24
  br label %88, !dbg !755

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4, !dbg !756
  %90 = add nsw i32 %89, 1, !dbg !756
  store i32 %90, ptr %13, align 4, !dbg !756
  br label %19, !dbg !757, !llvm.loop !758

91:                                               ; preds = %19
  ret void, !dbg !760
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, i32 noundef %1) #0 !dbg !761 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !764, metadata !DIExpression()), !dbg !765
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !766, metadata !DIExpression()), !dbg !767
  call void @llvm.dbg.declare(metadata ptr %5, metadata !768, metadata !DIExpression()), !dbg !770
  store i32 0, ptr %5, align 4, !dbg !770
  br label %6, !dbg !771

6:                                                ; preds = %16, %2
  %7 = load i32, ptr %5, align 4, !dbg !772
  %8 = load i32, ptr %4, align 4, !dbg !774
  %9 = icmp slt i32 %7, %8, !dbg !775
  br i1 %9, label %10, label %19, !dbg !776

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8, !dbg !777
  %12 = load i32, ptr %5, align 4, !dbg !779
  %13 = sext i32 %12 to i64, !dbg !777
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13, !dbg !777
  %15 = load ptr, ptr %14, align 8, !dbg !777
  call void @free(ptr noundef %15) #9, !dbg !780
  br label %16, !dbg !781

16:                                               ; preds = %10
  %17 = load i32, ptr %5, align 4, !dbg !782
  %18 = add nsw i32 %17, 1, !dbg !782
  store i32 %18, ptr %5, align 4, !dbg !782
  br label %6, !dbg !783, !llvm.loop !784

19:                                               ; preds = %6
  %20 = load ptr, ptr %3, align 8, !dbg !786
  call void @free(ptr noundef %20) #9, !dbg !787
  ret void, !dbg !788
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @findYMax(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !789 {
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca x86_fp80, align 16
  %13 = alloca i32, align 4
  %14 = alloca x86_fp80, align 16
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !792, metadata !DIExpression()), !dbg !793
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !794, metadata !DIExpression()), !dbg !795
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !796, metadata !DIExpression()), !dbg !797
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !798, metadata !DIExpression()), !dbg !799
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !800, metadata !DIExpression()), !dbg !801
  %15 = load i32, ptr %8, align 4, !dbg !802
  %16 = load i32, ptr %9, align 4, !dbg !804
  %17 = icmp sge i32 %15, %16, !dbg !805
  br i1 %17, label %18, label %19, !dbg !806

18:                                               ; preds = %5
  store x86_fp80 0xK00000000000000000000, ptr %6, align 16, !dbg !807
  br label %50, !dbg !807

19:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %12, metadata !808, metadata !DIExpression()), !dbg !809
  %20 = load ptr, ptr %7, align 8, !dbg !810
  %21 = load ptr, ptr %11, align 8, !dbg !811
  %22 = load i32, ptr %8, align 4, !dbg !812
  %23 = sitofp i32 %22 to x86_fp80, !dbg !812
  %24 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %20, ptr noundef %21, x86_fp80 noundef %23), !dbg !813
  store x86_fp80 %24, ptr %12, align 16, !dbg !809
  call void @llvm.dbg.declare(metadata ptr %13, metadata !814, metadata !DIExpression()), !dbg !816
  %25 = load i32, ptr %8, align 4, !dbg !817
  %26 = add nsw i32 %25, 1, !dbg !818
  store i32 %26, ptr %13, align 4, !dbg !816
  br label %27, !dbg !819

27:                                               ; preds = %44, %19
  %28 = load i32, ptr %13, align 4, !dbg !820
  %29 = load i32, ptr %9, align 4, !dbg !822
  %30 = icmp sle i32 %28, %29, !dbg !823
  br i1 %30, label %31, label %48, !dbg !824

31:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata ptr %14, metadata !825, metadata !DIExpression()), !dbg !827
  %32 = load ptr, ptr %7, align 8, !dbg !828
  %33 = load ptr, ptr %11, align 8, !dbg !829
  %34 = load i32, ptr %13, align 4, !dbg !830
  %35 = sitofp i32 %34 to x86_fp80, !dbg !830
  %36 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %32, ptr noundef %33, x86_fp80 noundef %35), !dbg !831
  store x86_fp80 %36, ptr %14, align 16, !dbg !827
  %37 = load ptr, ptr %7, align 8, !dbg !832
  call void @arenaReset(ptr noundef %37), !dbg !833
  %38 = load x86_fp80, ptr %14, align 16, !dbg !834
  %39 = load x86_fp80, ptr %12, align 16, !dbg !836
  %40 = fcmp ogt x86_fp80 %38, %39, !dbg !837
  br i1 %40, label %41, label %43, !dbg !838

41:                                               ; preds = %31
  %42 = load x86_fp80, ptr %14, align 16, !dbg !839
  store x86_fp80 %42, ptr %12, align 16, !dbg !841
  br label %43, !dbg !842

43:                                               ; preds = %41, %31
  br label %44, !dbg !843

44:                                               ; preds = %43
  %45 = load i32, ptr %10, align 4, !dbg !844
  %46 = load i32, ptr %13, align 4, !dbg !845
  %47 = add nsw i32 %46, %45, !dbg !845
  store i32 %47, ptr %13, align 4, !dbg !845
  br label %27, !dbg !846, !llvm.loop !847

48:                                               ; preds = %27
  %49 = load x86_fp80, ptr %12, align 16, !dbg !849
  store x86_fp80 %49, ptr %6, align 16, !dbg !850
  br label %50, !dbg !850

50:                                               ; preds = %48, %18
  %51 = load x86_fp80, ptr %6, align 16, !dbg !851
  ret x86_fp80 %51, !dbg !851
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !852 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca x86_fp80, align 16
  %14 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !855, metadata !DIExpression()), !dbg !856
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !857, metadata !DIExpression()), !dbg !858
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !859, metadata !DIExpression()), !dbg !860
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !861, metadata !DIExpression()), !dbg !862
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !863, metadata !DIExpression()), !dbg !864
  call void @llvm.dbg.declare(metadata ptr %12, metadata !865, metadata !DIExpression()), !dbg !874
  %15 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #9, !dbg !875
  %16 = icmp eq i32 %15, -1, !dbg !877
  br i1 %16, label %17, label %18, !dbg !878

17:                                               ; preds = %5
  call void @perror(ptr noundef @.str.5) #8, !dbg !879
  store i1 false, ptr %6, align 1, !dbg !881
  br label %131, !dbg !881

18:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !882, metadata !DIExpression()), !dbg !883
  %19 = load ptr, ptr %7, align 8, !dbg !884
  %20 = load i32, ptr %8, align 4, !dbg !885
  %21 = load i32, ptr %9, align 4, !dbg !886
  %22 = load i32, ptr %10, align 4, !dbg !887
  %23 = load ptr, ptr %11, align 8, !dbg !888
  %24 = call x86_fp80 @findYMax(ptr noundef %19, i32 noundef %20, i32 noundef %21, i32 noundef %22, ptr noundef %23), !dbg !889
  store x86_fp80 %24, ptr %13, align 16, !dbg !883
  call void @llvm.dbg.declare(metadata ptr %14, metadata !890, metadata !DIExpression()), !dbg !891
  %25 = load i32, ptr %9, align 4, !dbg !892
  %26 = load i32, ptr %8, align 4, !dbg !893
  %27 = sub nsw i32 %25, %26, !dbg !894
  %28 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !895
  %29 = load i16, ptr %28, align 2, !dbg !895
  %30 = zext i16 %29 to i32, !dbg !896
  %31 = sdiv i32 %27, %30, !dbg !897
  %32 = sitofp i32 %31 to x86_fp80, !dbg !898
  %33 = load x86_fp80, ptr %13, align 16, !dbg !899
  %34 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !900
  %35 = load i16, ptr %34, align 2, !dbg !900
  %36 = zext i16 %35 to i32, !dbg !901
  %37 = sitofp i32 %36 to x86_fp80, !dbg !901
  %38 = fdiv x86_fp80 %33, %37, !dbg !902
  %39 = load i32, ptr %8, align 4, !dbg !903
  %40 = sitofp i32 %39 to x86_fp80, !dbg !903
  %41 = load x86_fp80, ptr %13, align 16, !dbg !904
  %42 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !905
  %43 = load i16, ptr %42, align 2, !dbg !905
  %44 = zext i16 %43 to i32, !dbg !906
  %45 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !907
  %46 = load i16, ptr %45, align 2, !dbg !907
  %47 = zext i16 %46 to i32, !dbg !908
  %48 = call ptr @quantifyPlane(x86_fp80 noundef %32, x86_fp80 noundef %38, x86_fp80 noundef %40, x86_fp80 noundef %41, i32 noundef %44, i32 noundef %47), !dbg !909
  store ptr %48, ptr %14, align 8, !dbg !891
  %49 = load ptr, ptr %14, align 8, !dbg !910
  %50 = load i32, ptr %9, align 4, !dbg !911
  %51 = load i32, ptr %8, align 4, !dbg !912
  %52 = sub nsw i32 %50, %51, !dbg !913
  %53 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !914
  %54 = load i16, ptr %53, align 2, !dbg !914
  %55 = zext i16 %54 to i32, !dbg !915
  %56 = sdiv i32 %52, %55, !dbg !916
  %57 = sitofp i32 %56 to x86_fp80, !dbg !917
  %58 = load x86_fp80, ptr %13, align 16, !dbg !918
  %59 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !919
  %60 = load i16, ptr %59, align 2, !dbg !919
  %61 = zext i16 %60 to i32, !dbg !920
  %62 = sitofp i32 %61 to x86_fp80, !dbg !920
  %63 = fdiv x86_fp80 %58, %62, !dbg !921
  %64 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !922
  %65 = load i16, ptr %64, align 2, !dbg !922
  %66 = zext i16 %65 to i32, !dbg !923
  %67 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !924
  %68 = load i16, ptr %67, align 2, !dbg !924
  %69 = zext i16 %68 to i32, !dbg !925
  call void @drawPlane(ptr noundef %49, x86_fp80 noundef %57, x86_fp80 noundef %63, i32 noundef %66, i32 noundef %69), !dbg !926
  %70 = load ptr, ptr %14, align 8, !dbg !927
  %71 = load ptr, ptr %11, align 8, !dbg !928
  %72 = load ptr, ptr %7, align 8, !dbg !929
  %73 = load i32, ptr %9, align 4, !dbg !930
  %74 = load i32, ptr %8, align 4, !dbg !931
  %75 = sub nsw i32 %73, %74, !dbg !932
  %76 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !933
  %77 = load i16, ptr %76, align 2, !dbg !933
  %78 = zext i16 %77 to i32, !dbg !934
  %79 = sdiv i32 %75, %78, !dbg !935
  %80 = sitofp i32 %79 to x86_fp80, !dbg !936
  %81 = load x86_fp80, ptr %13, align 16, !dbg !937
  %82 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !938
  %83 = load i16, ptr %82, align 2, !dbg !938
  %84 = zext i16 %83 to i32, !dbg !939
  %85 = sitofp i32 %84 to x86_fp80, !dbg !939
  %86 = fdiv x86_fp80 %81, %85, !dbg !940
  %87 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !941
  %88 = load i16, ptr %87, align 2, !dbg !941
  %89 = zext i16 %88 to i32, !dbg !942
  %90 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !943
  %91 = load i16, ptr %90, align 2, !dbg !943
  %92 = zext i16 %91 to i32, !dbg !944
  call void @drawLine(ptr noundef %70, ptr noundef %71, ptr noundef %72, x86_fp80 noundef %80, x86_fp80 noundef %86, i32 noundef %89, i32 noundef %92), !dbg !945
  %93 = load ptr, ptr %14, align 8, !dbg !946
  %94 = load ptr, ptr %11, align 8, !dbg !947
  %95 = load ptr, ptr %7, align 8, !dbg !948
  %96 = load i32, ptr %9, align 4, !dbg !949
  %97 = load i32, ptr %8, align 4, !dbg !950
  %98 = sub nsw i32 %96, %97, !dbg !951
  %99 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !952
  %100 = load i16, ptr %99, align 2, !dbg !952
  %101 = zext i16 %100 to i32, !dbg !953
  %102 = sdiv i32 %98, %101, !dbg !954
  %103 = sitofp i32 %102 to x86_fp80, !dbg !955
  %104 = load x86_fp80, ptr %13, align 16, !dbg !956
  %105 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !957
  %106 = load i16, ptr %105, align 2, !dbg !957
  %107 = zext i16 %106 to i32, !dbg !958
  %108 = sitofp i32 %107 to x86_fp80, !dbg !958
  %109 = fdiv x86_fp80 %104, %108, !dbg !959
  %110 = load i32, ptr %8, align 4, !dbg !960
  %111 = sitofp i32 %110 to x86_fp80, !dbg !960
  %112 = load i32, ptr %9, align 4, !dbg !961
  %113 = sitofp i32 %112 to x86_fp80, !dbg !961
  %114 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !962
  %115 = load i16, ptr %114, align 2, !dbg !962
  %116 = zext i16 %115 to i32, !dbg !963
  %117 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !964
  %118 = load i16, ptr %117, align 2, !dbg !964
  %119 = zext i16 %118 to i32, !dbg !965
  call void @shadeGraph(ptr noundef %93, ptr noundef %94, ptr noundef %95, x86_fp80 noundef %103, x86_fp80 noundef %109, x86_fp80 noundef %111, x86_fp80 noundef %113, i32 noundef %116, i32 noundef %119), !dbg !966
  %120 = load ptr, ptr %14, align 8, !dbg !967
  %121 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !968
  %122 = load i16, ptr %121, align 2, !dbg !968
  %123 = zext i16 %122 to i32, !dbg !969
  %124 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !970
  %125 = load i16, ptr %124, align 2, !dbg !970
  %126 = zext i16 %125 to i32, !dbg !971
  call void @printPlane(ptr noundef %120, i32 noundef %123, i32 noundef %126), !dbg !972
  %127 = load ptr, ptr %14, align 8, !dbg !973
  %128 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !974
  %129 = load i16, ptr %128, align 2, !dbg !974
  %130 = zext i16 %129 to i32, !dbg !975
  call void @clearDisplay(ptr noundef %127, i32 noundef %130), !dbg !976
  store i1 true, ptr %6, align 1, !dbg !977
  br label %131, !dbg !977

131:                                              ; preds = %18, %17
  %132 = load i1, ptr %6, align 1, !dbg !978
  ret i1 %132, !dbg !978
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
!llvm.module.flags = !{!48, !49, !50, !51, !52, !53, !54}
!llvm.ident = !{!55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !7, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "1bc98a863da7cd4a803044f4dc7ae8f8")
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
!16 = !{!0, !17, !23, !28, !33, !38, !43}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !19, line: 39, type: !20, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "1bc98a863da7cd4a803044f4dc7ae8f8")
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
!44 = distinct !DIGlobalVariable(scope: null, file: !19, line: 180, type: !45, isLocal: true, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 104, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 13)
!48 = !{i32 7, !"Dwarf Version", i32 5}
!49 = !{i32 2, !"Debug Info Version", i32 3}
!50 = !{i32 1, !"wchar_size", i32 4}
!51 = !{i32 8, !"PIC Level", i32 2}
!52 = !{i32 7, !"PIE Level", i32 2}
!53 = !{i32 7, !"uwtable", i32 2}
!54 = !{i32 7, !"frame-pointer", i32 2}
!55 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!56 = distinct !DISubprogram(name: "closeTo", scope: !19, file: !19, line: 11, type: !57, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !11, !11, !11}
!59 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!60 = !{}
!61 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !19, line: 11, type: !11)
!62 = !DILocation(line: 11, column: 26, scope: !56)
!63 = !DILocalVariable(name: "y", arg: 2, scope: !56, file: !19, line: 11, type: !11)
!64 = !DILocation(line: 11, column: 41, scope: !56)
!65 = !DILocalVariable(name: "deviation", arg: 3, scope: !56, file: !19, line: 11, type: !11)
!66 = !DILocation(line: 11, column: 56, scope: !56)
!67 = !DILocation(line: 12, column: 16, scope: !56)
!68 = !DILocation(line: 12, column: 18, scope: !56)
!69 = !DILocation(line: 12, column: 17, scope: !56)
!70 = !DILocation(line: 12, column: 10, scope: !56)
!71 = !DILocation(line: 12, column: 23, scope: !56)
!72 = !DILocation(line: 12, column: 21, scope: !56)
!73 = !DILocation(line: 12, column: 3, scope: !56)
!74 = distinct !DISubprogram(name: "initializeDisplay", scope: !19, file: !19, line: 15, type: !75, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !15, !15}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!78 = !DILocalVariable(name: "windowHeight", arg: 1, scope: !74, file: !19, line: 15, type: !15)
!79 = !DILocation(line: 15, column: 39, scope: !74)
!80 = !DILocalVariable(name: "windowWidth", arg: 2, scope: !74, file: !19, line: 15, type: !15)
!81 = !DILocation(line: 15, column: 57, scope: !74)
!82 = !DILocalVariable(name: "display", scope: !74, file: !19, line: 16, type: !77)
!83 = !DILocation(line: 16, column: 19, scope: !74)
!84 = !DILocation(line: 16, column: 61, scope: !74)
!85 = !DILocation(line: 16, column: 59, scope: !74)
!86 = !DILocation(line: 16, column: 29, scope: !74)
!87 = !DILocation(line: 17, column: 10, scope: !74)
!88 = !DILocation(line: 17, column: 22, scope: !74)
!89 = !DILocation(line: 17, column: 3, scope: !74)
!90 = !DILocalVariable(name: "i", scope: !91, file: !19, line: 18, type: !15)
!91 = distinct !DILexicalBlock(scope: !74, file: !19, line: 18, column: 3)
!92 = !DILocation(line: 18, column: 11, scope: !91)
!93 = !DILocation(line: 18, column: 7, scope: !91)
!94 = !DILocation(line: 18, column: 18, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 18, column: 3)
!96 = !DILocation(line: 18, column: 22, scope: !95)
!97 = !DILocation(line: 18, column: 20, scope: !95)
!98 = !DILocation(line: 18, column: 3, scope: !91)
!99 = !DILocation(line: 19, column: 65, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !19, line: 18, column: 40)
!101 = !DILocation(line: 19, column: 63, scope: !100)
!102 = !DILocation(line: 19, column: 34, scope: !100)
!103 = !DILocation(line: 19, column: 5, scope: !100)
!104 = !DILocation(line: 19, column: 13, scope: !100)
!105 = !DILocation(line: 19, column: 16, scope: !100)
!106 = !DILocation(line: 20, column: 12, scope: !100)
!107 = !DILocation(line: 20, column: 20, scope: !100)
!108 = !DILocation(line: 20, column: 27, scope: !100)
!109 = !DILocation(line: 20, column: 5, scope: !100)
!110 = !DILocation(line: 21, column: 3, scope: !100)
!111 = !DILocation(line: 18, column: 37, scope: !95)
!112 = !DILocation(line: 18, column: 3, scope: !95)
!113 = distinct !{!113, !98, !114, !115}
!114 = !DILocation(line: 21, column: 3, scope: !91)
!115 = !{!"llvm.loop.mustprogress"}
!116 = !DILocation(line: 22, column: 10, scope: !74)
!117 = !DILocation(line: 22, column: 3, scope: !74)
!118 = distinct !DISubprogram(name: "quantifyPlane", scope: !19, file: !19, line: 25, type: !119, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!119 = !DISubroutineType(types: !120)
!120 = !{!77, !11, !11, !11, !11, !15, !15}
!121 = !DILocalVariable(name: "xSteps", arg: 1, scope: !118, file: !19, line: 25, type: !11)
!122 = !DILocation(line: 25, column: 43, scope: !118)
!123 = !DILocalVariable(name: "ySteps", arg: 2, scope: !118, file: !19, line: 25, type: !11)
!124 = !DILocation(line: 25, column: 63, scope: !118)
!125 = !DILocalVariable(name: "xMin", arg: 3, scope: !118, file: !19, line: 25, type: !11)
!126 = !DILocation(line: 25, column: 83, scope: !118)
!127 = !DILocalVariable(name: "yMax", arg: 4, scope: !118, file: !19, line: 25, type: !11)
!128 = !DILocation(line: 25, column: 101, scope: !118)
!129 = !DILocalVariable(name: "windowHeight", arg: 5, scope: !118, file: !19, line: 25, type: !15)
!130 = !DILocation(line: 25, column: 111, scope: !118)
!131 = !DILocalVariable(name: "windowWidth", arg: 6, scope: !118, file: !19, line: 25, type: !15)
!132 = !DILocation(line: 25, column: 129, scope: !118)
!133 = !DILocalVariable(name: "display", scope: !118, file: !19, line: 26, type: !77)
!134 = !DILocation(line: 26, column: 19, scope: !118)
!135 = !DILocation(line: 26, column: 47, scope: !118)
!136 = !DILocation(line: 26, column: 61, scope: !118)
!137 = !DILocation(line: 26, column: 29, scope: !118)
!138 = !DILocalVariable(name: "y", scope: !139, file: !19, line: 28, type: !15)
!139 = distinct !DILexicalBlock(scope: !118, file: !19, line: 28, column: 3)
!140 = !DILocation(line: 28, column: 11, scope: !139)
!141 = !DILocation(line: 28, column: 7, scope: !139)
!142 = !DILocation(line: 28, column: 18, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !19, line: 28, column: 3)
!144 = !DILocation(line: 28, column: 22, scope: !143)
!145 = !DILocation(line: 28, column: 20, scope: !143)
!146 = !DILocation(line: 28, column: 3, scope: !139)
!147 = !DILocalVariable(name: "x", scope: !148, file: !19, line: 29, type: !15)
!148 = distinct !DILexicalBlock(scope: !149, file: !19, line: 29, column: 5)
!149 = distinct !DILexicalBlock(scope: !143, file: !19, line: 28, column: 40)
!150 = !DILocation(line: 29, column: 13, scope: !148)
!151 = !DILocation(line: 29, column: 9, scope: !148)
!152 = !DILocation(line: 29, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !19, line: 29, column: 5)
!154 = !DILocation(line: 29, column: 24, scope: !153)
!155 = !DILocation(line: 29, column: 22, scope: !153)
!156 = !DILocation(line: 29, column: 5, scope: !148)
!157 = !DILocation(line: 30, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !19, line: 29, column: 41)
!159 = !DILocation(line: 30, column: 33, scope: !158)
!160 = !DILocation(line: 30, column: 42, scope: !158)
!161 = !DILocation(line: 30, column: 30, scope: !158)
!162 = !DILocation(line: 30, column: 7, scope: !158)
!163 = !DILocation(line: 30, column: 15, scope: !158)
!164 = !DILocation(line: 30, column: 18, scope: !158)
!165 = !DILocation(line: 30, column: 21, scope: !158)
!166 = !DILocation(line: 30, column: 23, scope: !158)
!167 = !DILocation(line: 31, column: 25, scope: !158)
!168 = !DILocation(line: 31, column: 33, scope: !158)
!169 = !DILocation(line: 31, column: 42, scope: !158)
!170 = !DILocation(line: 31, column: 30, scope: !158)
!171 = !DILocation(line: 31, column: 7, scope: !158)
!172 = !DILocation(line: 31, column: 15, scope: !158)
!173 = !DILocation(line: 31, column: 18, scope: !158)
!174 = !DILocation(line: 31, column: 21, scope: !158)
!175 = !DILocation(line: 31, column: 23, scope: !158)
!176 = !DILocation(line: 32, column: 5, scope: !158)
!177 = !DILocation(line: 29, column: 38, scope: !153)
!178 = !DILocation(line: 29, column: 5, scope: !153)
!179 = distinct !{!179, !156, !180, !115}
!180 = !DILocation(line: 32, column: 5, scope: !148)
!181 = !DILocation(line: 33, column: 3, scope: !149)
!182 = !DILocation(line: 28, column: 37, scope: !143)
!183 = !DILocation(line: 28, column: 3, scope: !143)
!184 = distinct !{!184, !146, !185, !115}
!185 = !DILocation(line: 33, column: 3, scope: !139)
!186 = !DILocation(line: 35, column: 10, scope: !118)
!187 = !DILocation(line: 35, column: 3, scope: !118)
!188 = distinct !DISubprogram(name: "yCompress", scope: !19, file: !19, line: 38, type: !189, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!189 = !DISubroutineType(types: !190)
!190 = !{!14, !11, !11, !11}
!191 = !DILocalVariable(name: "num", arg: 1, scope: !188, file: !19, line: 38, type: !11)
!192 = !DILocation(line: 38, column: 28, scope: !188)
!193 = !DILocalVariable(name: "pixel", arg: 2, scope: !188, file: !19, line: 38, type: !11)
!194 = !DILocation(line: 38, column: 45, scope: !188)
!195 = !DILocalVariable(name: "range", arg: 3, scope: !188, file: !19, line: 38, type: !11)
!196 = !DILocation(line: 38, column: 64, scope: !188)
!197 = !DILocalVariable(name: "table", scope: !188, file: !19, line: 39, type: !198)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!199 = !DILocation(line: 39, column: 9, scope: !188)
!200 = !DILocalVariable(name: "steps", scope: !188, file: !19, line: 42, type: !11)
!201 = !DILocation(line: 42, column: 15, scope: !188)
!202 = !DILocation(line: 42, column: 23, scope: !188)
!203 = !DILocation(line: 42, column: 28, scope: !188)
!204 = !DILocalVariable(name: "goal", scope: !188, file: !19, line: 44, type: !11)
!205 = !DILocation(line: 44, column: 15, scope: !188)
!206 = !DILocation(line: 44, column: 22, scope: !188)
!207 = !DILocation(line: 44, column: 29, scope: !188)
!208 = !DILocation(line: 44, column: 38, scope: !188)
!209 = !DILocation(line: 44, column: 43, scope: !188)
!210 = !DILocation(line: 44, column: 35, scope: !188)
!211 = !DILocation(line: 44, column: 26, scope: !188)
!212 = !DILocalVariable(name: "counter", scope: !188, file: !19, line: 45, type: !15)
!213 = !DILocation(line: 45, column: 7, scope: !188)
!214 = !DILocalVariable(name: "step", scope: !188, file: !19, line: 46, type: !11)
!215 = !DILocation(line: 46, column: 15, scope: !188)
!216 = !DILocation(line: 47, column: 3, scope: !188)
!217 = !DILocation(line: 47, column: 9, scope: !188)
!218 = !DILocation(line: 47, column: 16, scope: !188)
!219 = !DILocation(line: 47, column: 14, scope: !188)
!220 = !DILocation(line: 48, column: 15, scope: !221)
!221 = distinct !DILexicalBlock(scope: !188, file: !19, line: 47, column: 22)
!222 = !DILocation(line: 48, column: 12, scope: !221)
!223 = !DILocation(line: 49, column: 14, scope: !221)
!224 = distinct !{!224, !216, !225, !115}
!225 = !DILocation(line: 50, column: 3, scope: !188)
!226 = !DILocation(line: 51, column: 10, scope: !188)
!227 = !DILocation(line: 51, column: 16, scope: !188)
!228 = !DILocation(line: 51, column: 24, scope: !188)
!229 = !DILocation(line: 51, column: 3, scope: !188)
!230 = distinct !DISubprogram(name: "printPlane", scope: !19, file: !19, line: 54, type: !231, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!231 = !DISubroutineType(types: !232)
!232 = !{null, !77, !15, !15}
!233 = !DILocalVariable(name: "display", arg: 1, scope: !230, file: !19, line: 54, type: !77)
!234 = !DILocation(line: 54, column: 33, scope: !230)
!235 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !230, file: !19, line: 54, type: !15)
!236 = !DILocation(line: 54, column: 46, scope: !230)
!237 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !230, file: !19, line: 54, type: !15)
!238 = !DILocation(line: 54, column: 64, scope: !230)
!239 = !DILocalVariable(name: "output", scope: !230, file: !19, line: 55, type: !240)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!241 = !DILocation(line: 55, column: 10, scope: !230)
!242 = !DILocation(line: 55, column: 42, scope: !230)
!243 = !DILocation(line: 55, column: 40, scope: !230)
!244 = !DILocation(line: 55, column: 55, scope: !230)
!245 = !DILocation(line: 55, column: 19, scope: !230)
!246 = !DILocalVariable(name: "i", scope: !247, file: !19, line: 56, type: !15)
!247 = distinct !DILexicalBlock(scope: !230, file: !19, line: 56, column: 3)
!248 = !DILocation(line: 56, column: 11, scope: !247)
!249 = !DILocation(line: 56, column: 7, scope: !247)
!250 = !DILocation(line: 56, column: 18, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !19, line: 56, column: 3)
!252 = !DILocation(line: 56, column: 22, scope: !251)
!253 = !DILocation(line: 56, column: 20, scope: !251)
!254 = !DILocation(line: 56, column: 3, scope: !247)
!255 = !DILocation(line: 57, column: 39, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !19, line: 56, column: 40)
!257 = !DILocation(line: 57, column: 37, scope: !256)
!258 = !DILocation(line: 57, column: 51, scope: !256)
!259 = !DILocation(line: 57, column: 17, scope: !256)
!260 = !DILocation(line: 57, column: 5, scope: !256)
!261 = !DILocation(line: 57, column: 12, scope: !256)
!262 = !DILocation(line: 57, column: 15, scope: !256)
!263 = !DILocation(line: 58, column: 3, scope: !256)
!264 = !DILocation(line: 56, column: 37, scope: !251)
!265 = !DILocation(line: 56, column: 3, scope: !251)
!266 = distinct !{!266, !254, !267, !115}
!267 = !DILocation(line: 58, column: 3, scope: !247)
!268 = !DILocalVariable(name: "y", scope: !269, file: !19, line: 60, type: !15)
!269 = distinct !DILexicalBlock(scope: !230, file: !19, line: 60, column: 3)
!270 = !DILocation(line: 60, column: 11, scope: !269)
!271 = !DILocation(line: 60, column: 7, scope: !269)
!272 = !DILocation(line: 60, column: 18, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !19, line: 60, column: 3)
!274 = !DILocation(line: 60, column: 22, scope: !273)
!275 = !DILocation(line: 60, column: 20, scope: !273)
!276 = !DILocation(line: 60, column: 3, scope: !269)
!277 = !DILocalVariable(name: "x", scope: !278, file: !19, line: 61, type: !15)
!278 = distinct !DILexicalBlock(scope: !279, file: !19, line: 61, column: 5)
!279 = distinct !DILexicalBlock(scope: !273, file: !19, line: 60, column: 41)
!280 = !DILocation(line: 61, column: 13, scope: !278)
!281 = !DILocation(line: 61, column: 9, scope: !278)
!282 = !DILocation(line: 61, column: 20, scope: !283)
!283 = distinct !DILexicalBlock(scope: !278, file: !19, line: 61, column: 5)
!284 = !DILocation(line: 61, column: 24, scope: !283)
!285 = !DILocation(line: 61, column: 22, scope: !283)
!286 = !DILocation(line: 61, column: 5, scope: !278)
!287 = !DILocation(line: 62, column: 22, scope: !283)
!288 = !DILocation(line: 62, column: 30, scope: !283)
!289 = !DILocation(line: 62, column: 33, scope: !283)
!290 = !DILocation(line: 62, column: 36, scope: !283)
!291 = !DILocation(line: 62, column: 7, scope: !283)
!292 = !DILocation(line: 62, column: 14, scope: !283)
!293 = !DILocation(line: 62, column: 17, scope: !283)
!294 = !DILocation(line: 62, column: 20, scope: !283)
!295 = !DILocation(line: 61, column: 38, scope: !283)
!296 = !DILocation(line: 61, column: 5, scope: !283)
!297 = distinct !{!297, !286, !298, !115}
!298 = !DILocation(line: 62, column: 36, scope: !278)
!299 = !DILocation(line: 63, column: 5, scope: !279)
!300 = !DILocation(line: 63, column: 12, scope: !279)
!301 = !DILocation(line: 63, column: 15, scope: !279)
!302 = !DILocation(line: 63, column: 28, scope: !279)
!303 = !DILocation(line: 64, column: 3, scope: !279)
!304 = !DILocation(line: 60, column: 37, scope: !273)
!305 = !DILocation(line: 60, column: 3, scope: !273)
!306 = distinct !{!306, !276, !307, !115}
!307 = !DILocation(line: 64, column: 3, scope: !269)
!308 = !DILocalVariable(name: "y", scope: !309, file: !19, line: 66, type: !15)
!309 = distinct !DILexicalBlock(scope: !230, file: !19, line: 66, column: 3)
!310 = !DILocation(line: 66, column: 11, scope: !309)
!311 = !DILocation(line: 66, column: 7, scope: !309)
!312 = !DILocation(line: 66, column: 18, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !19, line: 66, column: 3)
!314 = !DILocation(line: 66, column: 22, scope: !313)
!315 = !DILocation(line: 66, column: 20, scope: !313)
!316 = !DILocation(line: 66, column: 3, scope: !309)
!317 = !DILocation(line: 67, column: 10, scope: !313)
!318 = !DILocation(line: 67, column: 17, scope: !313)
!319 = !DILocation(line: 67, column: 5, scope: !313)
!320 = !DILocation(line: 66, column: 37, scope: !313)
!321 = !DILocation(line: 66, column: 3, scope: !313)
!322 = distinct !{!322, !316, !323, !115}
!323 = !DILocation(line: 67, column: 19, scope: !309)
!324 = !DILocation(line: 68, column: 1, scope: !230)
!325 = distinct !DISubprogram(name: "calcLangValueFuncWrapper", scope: !19, file: !19, line: 70, type: !326, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!326 = !DISubroutineType(types: !327)
!327 = !{!11, !328, !337, !11}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!329 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !330, line: 8, baseType: !331)
!330 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!331 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !330, line: 4, size: 128, elements: !332)
!332 = !{!333, !334, !336}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !331, file: !330, line: 5, baseType: !198, size: 64)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !331, file: !330, line: 6, baseType: !335, size: 32, offset: 64)
!335 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !331, file: !330, line: 7, baseType: !15, size: 32, offset: 96)
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!338 = !DISubroutineType(types: !339)
!339 = !{!340, !328, !340}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !342, line: 40, baseType: !343)
!342 = !DIFile(filename: "lib/include/c/CalcLangCInt.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "fc06603ba024469da7212531580c966f")
!343 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !342, line: 37, size: 128, elements: !344)
!344 = !{!345, !346}
!345 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !343, file: !342, line: 38, baseType: !15, size: 32)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !343, file: !342, line: 39, baseType: !347, size: 64, offset: 64)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !342, line: 35, baseType: !348)
!348 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !342, line: 27, size: 64, elements: !349)
!349 = !{!350, !359, !366, !367, !369, !370, !371}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !348, file: !342, line: 28, baseType: !351, size: 64)
!351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !342, line: 20, baseType: !353)
!353 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !342, line: 17, size: 128, elements: !354)
!354 = !{!355, !356}
!355 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !353, file: !342, line: 18, baseType: !15, size: 32)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !353, file: !342, line: 19, baseType: !357, size: 64, offset: 64)
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !348, file: !342, line: 29, baseType: !360, size: 64)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !342, line: 25, baseType: !362)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !342, line: 22, size: 128, elements: !363)
!363 = !{!364, !365}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !362, file: !342, line: 23, baseType: !15, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !362, file: !342, line: 24, baseType: !357, size: 64, offset: 64)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !348, file: !342, line: 30, baseType: !15, size: 32)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !348, file: !342, line: 31, baseType: !368, size: 64)
!368 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !348, file: !342, line: 32, baseType: !368, size: 64)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !348, file: !342, line: 33, baseType: !368, size: 64)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !348, file: !342, line: 34, baseType: !59, size: 8)
!372 = !DILocalVariable(name: "arena", arg: 1, scope: !325, file: !19, line: 70, type: !328)
!373 = !DILocation(line: 70, column: 52, scope: !325)
!374 = !DILocalVariable(name: "valFunc", arg: 2, scope: !325, file: !19, line: 70, type: !337)
!375 = !DILocation(line: 70, column: 76, scope: !325)
!376 = !DILocalVariable(name: "val", arg: 3, scope: !325, file: !19, line: 70, type: !11)
!377 = !DILocation(line: 70, column: 129, scope: !325)
!378 = !DILocalVariable(name: "cVal", scope: !325, file: !19, line: 71, type: !340)
!379 = !DILocation(line: 71, column: 18, scope: !325)
!380 = !DILocation(line: 71, column: 36, scope: !325)
!381 = !DILocation(line: 71, column: 25, scope: !325)
!382 = !DILocation(line: 72, column: 3, scope: !325)
!383 = !DILocation(line: 72, column: 9, scope: !325)
!384 = !DILocation(line: 72, column: 17, scope: !325)
!385 = !DILocation(line: 73, column: 32, scope: !325)
!386 = !DILocation(line: 73, column: 27, scope: !325)
!387 = !DILocation(line: 73, column: 3, scope: !325)
!388 = !DILocation(line: 73, column: 9, scope: !325)
!389 = !DILocation(line: 73, column: 25, scope: !325)
!390 = !DILocalVariable(name: "res", scope: !325, file: !19, line: 74, type: !340)
!391 = !DILocation(line: 74, column: 18, scope: !325)
!392 = !DILocation(line: 74, column: 24, scope: !325)
!393 = !DILocation(line: 74, column: 32, scope: !325)
!394 = !DILocation(line: 74, column: 39, scope: !325)
!395 = !DILocation(line: 75, column: 6, scope: !396)
!396 = distinct !DILexicalBlock(scope: !325, file: !19, line: 75, column: 6)
!397 = !DILocation(line: 75, column: 11, scope: !396)
!398 = !DILocation(line: 75, column: 19, scope: !396)
!399 = !DILocation(line: 75, column: 6, scope: !325)
!400 = !DILocation(line: 76, column: 26, scope: !396)
!401 = !DILocation(line: 76, column: 31, scope: !396)
!402 = !DILocation(line: 76, column: 39, scope: !396)
!403 = !DILocation(line: 76, column: 12, scope: !396)
!404 = !DILocation(line: 76, column: 5, scope: !396)
!405 = !DILocation(line: 78, column: 5, scope: !406)
!406 = distinct !DILexicalBlock(scope: !396, file: !19, line: 77, column: 8)
!407 = !DILocation(line: 79, column: 5, scope: !406)
!408 = !DILocation(line: 81, column: 1, scope: !325)
!409 = distinct !DISubprogram(name: "shadeGraph", scope: !19, file: !19, line: 83, type: !410, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!410 = !DISubroutineType(types: !411)
!411 = !{null, !77, !337, !328, !11, !11, !11, !11, !15, !15}
!412 = !DILocalVariable(name: "display", arg: 1, scope: !409, file: !19, line: 83, type: !77)
!413 = !DILocation(line: 83, column: 33, scope: !409)
!414 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !409, file: !19, line: 83, type: !337)
!415 = !DILocation(line: 83, column: 59, scope: !409)
!416 = !DILocalVariable(name: "arena", arg: 3, scope: !409, file: !19, line: 83, type: !328)
!417 = !DILocation(line: 83, column: 114, scope: !409)
!418 = !DILocalVariable(name: "xSteps", arg: 4, scope: !409, file: !19, line: 83, type: !11)
!419 = !DILocation(line: 83, column: 133, scope: !409)
!420 = !DILocalVariable(name: "ySteps", arg: 5, scope: !409, file: !19, line: 83, type: !11)
!421 = !DILocation(line: 83, column: 153, scope: !409)
!422 = !DILocalVariable(name: "leftBound", arg: 6, scope: !409, file: !19, line: 83, type: !11)
!423 = !DILocation(line: 83, column: 173, scope: !409)
!424 = !DILocalVariable(name: "rightBound", arg: 7, scope: !409, file: !19, line: 83, type: !11)
!425 = !DILocation(line: 83, column: 196, scope: !409)
!426 = !DILocalVariable(name: "windowHeight", arg: 8, scope: !409, file: !19, line: 83, type: !15)
!427 = !DILocation(line: 83, column: 212, scope: !409)
!428 = !DILocalVariable(name: "windowWidth", arg: 9, scope: !409, file: !19, line: 83, type: !15)
!429 = !DILocation(line: 83, column: 230, scope: !409)
!430 = !DILocalVariable(name: "relX", scope: !409, file: !19, line: 84, type: !11)
!431 = !DILocation(line: 84, column: 15, scope: !409)
!432 = !DILocalVariable(name: "relY", scope: !409, file: !19, line: 84, type: !11)
!433 = !DILocation(line: 84, column: 21, scope: !409)
!434 = !DILocalVariable(name: "y", scope: !435, file: !19, line: 86, type: !15)
!435 = distinct !DILexicalBlock(scope: !409, file: !19, line: 86, column: 3)
!436 = !DILocation(line: 86, column: 11, scope: !435)
!437 = !DILocation(line: 86, column: 7, scope: !435)
!438 = !DILocation(line: 86, column: 18, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !19, line: 86, column: 3)
!440 = !DILocation(line: 86, column: 22, scope: !439)
!441 = !DILocation(line: 86, column: 20, scope: !439)
!442 = !DILocation(line: 86, column: 3, scope: !435)
!443 = !DILocalVariable(name: "x", scope: !444, file: !19, line: 87, type: !15)
!444 = distinct !DILexicalBlock(scope: !445, file: !19, line: 87, column: 5)
!445 = distinct !DILexicalBlock(scope: !439, file: !19, line: 86, column: 40)
!446 = !DILocation(line: 87, column: 13, scope: !444)
!447 = !DILocation(line: 87, column: 9, scope: !444)
!448 = !DILocation(line: 87, column: 20, scope: !449)
!449 = distinct !DILexicalBlock(scope: !444, file: !19, line: 87, column: 5)
!450 = !DILocation(line: 87, column: 24, scope: !449)
!451 = !DILocation(line: 87, column: 22, scope: !449)
!452 = !DILocation(line: 87, column: 5, scope: !444)
!453 = !DILocalVariable(name: "pixel", scope: !454, file: !19, line: 88, type: !5)
!454 = distinct !DILexicalBlock(scope: !449, file: !19, line: 87, column: 41)
!455 = !DILocation(line: 88, column: 22, scope: !454)
!456 = !DILocation(line: 88, column: 32, scope: !454)
!457 = !DILocation(line: 88, column: 40, scope: !454)
!458 = !DILocation(line: 88, column: 43, scope: !454)
!459 = !DILocation(line: 90, column: 14, scope: !454)
!460 = !DILocation(line: 90, column: 21, scope: !454)
!461 = !DILocation(line: 90, column: 12, scope: !454)
!462 = !DILocation(line: 91, column: 14, scope: !454)
!463 = !DILocation(line: 91, column: 21, scope: !454)
!464 = !DILocation(line: 91, column: 12, scope: !454)
!465 = !DILocalVariable(name: "output", scope: !454, file: !19, line: 93, type: !11)
!466 = !DILocation(line: 93, column: 19, scope: !454)
!467 = !DILocation(line: 93, column: 53, scope: !454)
!468 = !DILocation(line: 93, column: 60, scope: !454)
!469 = !DILocation(line: 93, column: 70, scope: !454)
!470 = !DILocation(line: 93, column: 28, scope: !454)
!471 = !DILocation(line: 94, column: 18, scope: !472)
!472 = distinct !DILexicalBlock(scope: !454, file: !19, line: 94, column: 10)
!473 = !DILocation(line: 94, column: 26, scope: !472)
!474 = !DILocation(line: 94, column: 32, scope: !472)
!475 = !DILocation(line: 94, column: 38, scope: !472)
!476 = !DILocation(line: 94, column: 10, scope: !472)
!477 = !DILocation(line: 94, column: 10, scope: !454)
!478 = !DILocation(line: 95, column: 29, scope: !472)
!479 = !DILocation(line: 95, column: 37, scope: !472)
!480 = !DILocation(line: 95, column: 43, scope: !472)
!481 = !DILocation(line: 95, column: 19, scope: !472)
!482 = !DILocation(line: 95, column: 2, scope: !472)
!483 = !DILocation(line: 95, column: 9, scope: !472)
!484 = !DILocation(line: 95, column: 17, scope: !472)
!485 = !DILocation(line: 96, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !472, file: !19, line: 96, column: 15)
!487 = !DILocation(line: 96, column: 24, scope: !486)
!488 = !DILocation(line: 96, column: 105, scope: !486)
!489 = !DILocation(line: 96, column: 32, scope: !486)
!490 = !DILocation(line: 96, column: 39, scope: !486)
!491 = !DILocation(line: 96, column: 45, scope: !486)
!492 = !DILocation(line: 96, column: 37, scope: !486)
!493 = !DILocation(line: 96, column: 48, scope: !486)
!494 = !DILocation(line: 96, column: 51, scope: !486)
!495 = !DILocation(line: 96, column: 58, scope: !486)
!496 = !DILocation(line: 96, column: 56, scope: !486)
!497 = !DILocation(line: 96, column: 16, scope: !486)
!498 = !DILocation(line: 96, column: 69, scope: !486)
!499 = !DILocation(line: 96, column: 77, scope: !486)
!500 = !DILocation(line: 96, column: 76, scope: !486)
!501 = !DILocation(line: 96, column: 83, scope: !486)
!502 = !DILocation(line: 96, column: 74, scope: !486)
!503 = !DILocation(line: 96, column: 86, scope: !486)
!504 = !DILocation(line: 96, column: 89, scope: !486)
!505 = !DILocation(line: 96, column: 96, scope: !486)
!506 = !DILocation(line: 96, column: 94, scope: !486)
!507 = !DILocation(line: 96, column: 109, scope: !486)
!508 = !DILocation(line: 96, column: 116, scope: !486)
!509 = !DILocation(line: 96, column: 114, scope: !486)
!510 = !DILocation(line: 96, column: 126, scope: !486)
!511 = !DILocation(line: 96, column: 129, scope: !486)
!512 = !DILocation(line: 96, column: 136, scope: !486)
!513 = !DILocation(line: 96, column: 134, scope: !486)
!514 = !DILocation(line: 96, column: 15, scope: !472)
!515 = !DILocation(line: 97, column: 2, scope: !486)
!516 = !DILocation(line: 97, column: 9, scope: !486)
!517 = !DILocation(line: 97, column: 17, scope: !486)
!518 = !DILocation(line: 98, column: 5, scope: !454)
!519 = !DILocation(line: 87, column: 38, scope: !449)
!520 = !DILocation(line: 87, column: 5, scope: !449)
!521 = distinct !{!521, !452, !522, !115}
!522 = !DILocation(line: 98, column: 5, scope: !444)
!523 = !DILocation(line: 99, column: 3, scope: !445)
!524 = !DILocation(line: 86, column: 37, scope: !439)
!525 = !DILocation(line: 86, column: 3, scope: !439)
!526 = distinct !{!526, !442, !527, !115}
!527 = !DILocation(line: 99, column: 3, scope: !435)
!528 = !DILocation(line: 100, column: 1, scope: !409)
!529 = distinct !DISubprogram(name: "drawLine", scope: !19, file: !19, line: 102, type: !530, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!530 = !DISubroutineType(types: !531)
!531 = !{null, !77, !337, !328, !11, !11, !15, !15}
!532 = !DILocalVariable(name: "display", arg: 1, scope: !529, file: !19, line: 102, type: !77)
!533 = !DILocation(line: 102, column: 31, scope: !529)
!534 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !529, file: !19, line: 102, type: !337)
!535 = !DILocation(line: 102, column: 57, scope: !529)
!536 = !DILocalVariable(name: "arena", arg: 3, scope: !529, file: !19, line: 102, type: !328)
!537 = !DILocation(line: 102, column: 112, scope: !529)
!538 = !DILocalVariable(name: "xSteps", arg: 4, scope: !529, file: !19, line: 102, type: !11)
!539 = !DILocation(line: 102, column: 131, scope: !529)
!540 = !DILocalVariable(name: "ySteps", arg: 5, scope: !529, file: !19, line: 102, type: !11)
!541 = !DILocation(line: 102, column: 151, scope: !529)
!542 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !529, file: !19, line: 102, type: !15)
!543 = !DILocation(line: 102, column: 163, scope: !529)
!544 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !529, file: !19, line: 102, type: !15)
!545 = !DILocation(line: 102, column: 181, scope: !529)
!546 = !DILocalVariable(name: "relX", scope: !529, file: !19, line: 103, type: !11)
!547 = !DILocation(line: 103, column: 15, scope: !529)
!548 = !DILocalVariable(name: "relY", scope: !529, file: !19, line: 103, type: !11)
!549 = !DILocation(line: 103, column: 21, scope: !529)
!550 = !DILocalVariable(name: "y", scope: !551, file: !19, line: 105, type: !15)
!551 = distinct !DILexicalBlock(scope: !529, file: !19, line: 105, column: 5)
!552 = !DILocation(line: 105, column: 13, scope: !551)
!553 = !DILocation(line: 105, column: 9, scope: !551)
!554 = !DILocation(line: 105, column: 20, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !19, line: 105, column: 5)
!556 = !DILocation(line: 105, column: 24, scope: !555)
!557 = !DILocation(line: 105, column: 22, scope: !555)
!558 = !DILocation(line: 105, column: 5, scope: !551)
!559 = !DILocalVariable(name: "x", scope: !560, file: !19, line: 106, type: !15)
!560 = distinct !DILexicalBlock(scope: !561, file: !19, line: 106, column: 9)
!561 = distinct !DILexicalBlock(scope: !555, file: !19, line: 105, column: 43)
!562 = !DILocation(line: 106, column: 17, scope: !560)
!563 = !DILocation(line: 106, column: 13, scope: !560)
!564 = !DILocation(line: 106, column: 24, scope: !565)
!565 = distinct !DILexicalBlock(scope: !560, file: !19, line: 106, column: 9)
!566 = !DILocation(line: 106, column: 28, scope: !565)
!567 = !DILocation(line: 106, column: 26, scope: !565)
!568 = !DILocation(line: 106, column: 9, scope: !560)
!569 = !DILocalVariable(name: "pixel", scope: !570, file: !19, line: 107, type: !5)
!570 = distinct !DILexicalBlock(scope: !565, file: !19, line: 106, column: 47)
!571 = !DILocation(line: 107, column: 21, scope: !570)
!572 = !DILocation(line: 107, column: 31, scope: !570)
!573 = !DILocation(line: 107, column: 39, scope: !570)
!574 = !DILocation(line: 107, column: 42, scope: !570)
!575 = !DILocation(line: 108, column: 20, scope: !570)
!576 = !DILocation(line: 108, column: 27, scope: !570)
!577 = !DILocation(line: 108, column: 18, scope: !570)
!578 = !DILocation(line: 109, column: 20, scope: !570)
!579 = !DILocation(line: 109, column: 27, scope: !570)
!580 = !DILocation(line: 109, column: 18, scope: !570)
!581 = !DILocalVariable(name: "output", scope: !570, file: !19, line: 111, type: !11)
!582 = !DILocation(line: 111, column: 25, scope: !570)
!583 = !DILocation(line: 111, column: 59, scope: !570)
!584 = !DILocation(line: 111, column: 66, scope: !570)
!585 = !DILocation(line: 111, column: 76, scope: !570)
!586 = !DILocation(line: 111, column: 34, scope: !570)
!587 = !DILocation(line: 112, column: 17, scope: !570)
!588 = !DILocation(line: 112, column: 6, scope: !570)
!589 = !DILocation(line: 113, column: 24, scope: !590)
!590 = distinct !DILexicalBlock(scope: !570, file: !19, line: 113, column: 16)
!591 = !DILocation(line: 113, column: 32, scope: !590)
!592 = !DILocation(line: 113, column: 38, scope: !590)
!593 = !DILocation(line: 113, column: 44, scope: !590)
!594 = !DILocation(line: 113, column: 16, scope: !590)
!595 = !DILocation(line: 113, column: 16, scope: !570)
!596 = !DILocation(line: 114, column: 35, scope: !590)
!597 = !DILocation(line: 114, column: 43, scope: !590)
!598 = !DILocation(line: 114, column: 49, scope: !590)
!599 = !DILocation(line: 114, column: 25, scope: !590)
!600 = !DILocation(line: 114, column: 8, scope: !590)
!601 = !DILocation(line: 114, column: 15, scope: !590)
!602 = !DILocation(line: 114, column: 23, scope: !590)
!603 = !DILocation(line: 115, column: 9, scope: !570)
!604 = !DILocation(line: 106, column: 43, scope: !565)
!605 = !DILocation(line: 106, column: 9, scope: !565)
!606 = distinct !{!606, !568, !607, !115}
!607 = !DILocation(line: 115, column: 9, scope: !560)
!608 = !DILocation(line: 116, column: 5, scope: !561)
!609 = !DILocation(line: 105, column: 39, scope: !555)
!610 = !DILocation(line: 105, column: 5, scope: !555)
!611 = distinct !{!611, !558, !612, !115}
!612 = !DILocation(line: 116, column: 5, scope: !551)
!613 = !DILocation(line: 117, column: 1, scope: !529)
!614 = distinct !DISubprogram(name: "printDisplayCordinates", scope: !19, file: !19, line: 119, type: !231, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!615 = !DILocalVariable(name: "display", arg: 1, scope: !614, file: !19, line: 119, type: !77)
!616 = !DILocation(line: 119, column: 45, scope: !614)
!617 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !614, file: !19, line: 119, type: !15)
!618 = !DILocation(line: 119, column: 58, scope: !614)
!619 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !614, file: !19, line: 119, type: !15)
!620 = !DILocation(line: 119, column: 76, scope: !614)
!621 = !DILocalVariable(name: "y", scope: !622, file: !19, line: 120, type: !15)
!622 = distinct !DILexicalBlock(scope: !614, file: !19, line: 120, column: 3)
!623 = !DILocation(line: 120, column: 11, scope: !622)
!624 = !DILocation(line: 120, column: 7, scope: !622)
!625 = !DILocation(line: 120, column: 18, scope: !626)
!626 = distinct !DILexicalBlock(scope: !622, file: !19, line: 120, column: 3)
!627 = !DILocation(line: 120, column: 22, scope: !626)
!628 = !DILocation(line: 120, column: 20, scope: !626)
!629 = !DILocation(line: 120, column: 3, scope: !622)
!630 = !DILocation(line: 121, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !626, file: !19, line: 120, column: 40)
!632 = !DILocalVariable(name: "x", scope: !633, file: !19, line: 122, type: !15)
!633 = distinct !DILexicalBlock(scope: !631, file: !19, line: 122, column: 5)
!634 = !DILocation(line: 122, column: 13, scope: !633)
!635 = !DILocation(line: 122, column: 9, scope: !633)
!636 = !DILocation(line: 122, column: 20, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !19, line: 122, column: 5)
!638 = !DILocation(line: 122, column: 24, scope: !637)
!639 = !DILocation(line: 122, column: 22, scope: !637)
!640 = !DILocation(line: 122, column: 5, scope: !633)
!641 = !DILocation(line: 123, column: 27, scope: !642)
!642 = distinct !DILexicalBlock(scope: !637, file: !19, line: 122, column: 41)
!643 = !DILocation(line: 123, column: 35, scope: !642)
!644 = !DILocation(line: 123, column: 38, scope: !642)
!645 = !DILocation(line: 123, column: 41, scope: !642)
!646 = !DILocation(line: 123, column: 44, scope: !642)
!647 = !DILocation(line: 123, column: 52, scope: !642)
!648 = !DILocation(line: 123, column: 55, scope: !642)
!649 = !DILocation(line: 123, column: 58, scope: !642)
!650 = !DILocation(line: 123, column: 7, scope: !642)
!651 = !DILocation(line: 124, column: 5, scope: !642)
!652 = !DILocation(line: 122, column: 38, scope: !637)
!653 = !DILocation(line: 122, column: 5, scope: !637)
!654 = distinct !{!654, !640, !655, !115}
!655 = !DILocation(line: 124, column: 5, scope: !633)
!656 = !DILocation(line: 125, column: 5, scope: !631)
!657 = !DILocation(line: 126, column: 3, scope: !631)
!658 = !DILocation(line: 120, column: 37, scope: !626)
!659 = !DILocation(line: 120, column: 3, scope: !626)
!660 = distinct !{!660, !629, !661, !115}
!661 = !DILocation(line: 126, column: 3, scope: !622)
!662 = !DILocation(line: 127, column: 1, scope: !614)
!663 = distinct !DISubprogram(name: "drawPlane", scope: !19, file: !19, line: 129, type: !664, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!664 = !DISubroutineType(types: !665)
!665 = !{null, !77, !11, !11, !15, !15}
!666 = !DILocalVariable(name: "display", arg: 1, scope: !663, file: !19, line: 129, type: !77)
!667 = !DILocation(line: 129, column: 32, scope: !663)
!668 = !DILocalVariable(name: "xSteps", arg: 2, scope: !663, file: !19, line: 129, type: !11)
!669 = !DILocation(line: 129, column: 53, scope: !663)
!670 = !DILocalVariable(name: "ySteps", arg: 3, scope: !663, file: !19, line: 129, type: !11)
!671 = !DILocation(line: 129, column: 73, scope: !663)
!672 = !DILocalVariable(name: "windowHeight", arg: 4, scope: !663, file: !19, line: 129, type: !15)
!673 = !DILocation(line: 129, column: 85, scope: !663)
!674 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !663, file: !19, line: 129, type: !15)
!675 = !DILocation(line: 129, column: 103, scope: !663)
!676 = !DILocalVariable(name: "relX", scope: !663, file: !19, line: 130, type: !11)
!677 = !DILocation(line: 130, column: 15, scope: !663)
!678 = !DILocalVariable(name: "relY", scope: !663, file: !19, line: 130, type: !11)
!679 = !DILocation(line: 130, column: 21, scope: !663)
!680 = !DILocalVariable(name: "y", scope: !681, file: !19, line: 131, type: !15)
!681 = distinct !DILexicalBlock(scope: !663, file: !19, line: 131, column: 5)
!682 = !DILocation(line: 131, column: 13, scope: !681)
!683 = !DILocation(line: 131, column: 9, scope: !681)
!684 = !DILocation(line: 131, column: 20, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !19, line: 131, column: 5)
!686 = !DILocation(line: 131, column: 24, scope: !685)
!687 = !DILocation(line: 131, column: 22, scope: !685)
!688 = !DILocation(line: 131, column: 5, scope: !681)
!689 = !DILocalVariable(name: "x", scope: !690, file: !19, line: 132, type: !15)
!690 = distinct !DILexicalBlock(scope: !691, file: !19, line: 132, column: 9)
!691 = distinct !DILexicalBlock(scope: !685, file: !19, line: 131, column: 43)
!692 = !DILocation(line: 132, column: 17, scope: !690)
!693 = !DILocation(line: 132, column: 13, scope: !690)
!694 = !DILocation(line: 132, column: 24, scope: !695)
!695 = distinct !DILexicalBlock(scope: !690, file: !19, line: 132, column: 9)
!696 = !DILocation(line: 132, column: 28, scope: !695)
!697 = !DILocation(line: 132, column: 26, scope: !695)
!698 = !DILocation(line: 132, column: 9, scope: !690)
!699 = !DILocalVariable(name: "pixel", scope: !700, file: !19, line: 133, type: !5)
!700 = distinct !DILexicalBlock(scope: !695, file: !19, line: 132, column: 46)
!701 = !DILocation(line: 133, column: 21, scope: !700)
!702 = !DILocation(line: 133, column: 31, scope: !700)
!703 = !DILocation(line: 133, column: 39, scope: !700)
!704 = !DILocation(line: 133, column: 42, scope: !700)
!705 = !DILocation(line: 134, column: 20, scope: !700)
!706 = !DILocation(line: 134, column: 27, scope: !700)
!707 = !DILocation(line: 134, column: 18, scope: !700)
!708 = !DILocation(line: 135, column: 20, scope: !700)
!709 = !DILocation(line: 135, column: 27, scope: !700)
!710 = !DILocation(line: 135, column: 18, scope: !700)
!711 = !DILocalVariable(name: "xZero", scope: !700, file: !19, line: 137, type: !59)
!712 = !DILocation(line: 137, column: 18, scope: !700)
!713 = !DILocation(line: 137, column: 34, scope: !700)
!714 = !DILocation(line: 137, column: 43, scope: !700)
!715 = !DILocation(line: 137, column: 49, scope: !700)
!716 = !DILocation(line: 137, column: 26, scope: !700)
!717 = !DILocalVariable(name: "yZero", scope: !700, file: !19, line: 138, type: !59)
!718 = !DILocation(line: 138, column: 18, scope: !700)
!719 = !DILocation(line: 138, column: 34, scope: !700)
!720 = !DILocation(line: 138, column: 43, scope: !700)
!721 = !DILocation(line: 138, column: 49, scope: !700)
!722 = !DILocation(line: 138, column: 26, scope: !700)
!723 = !DILocalVariable(name: "origin", scope: !700, file: !19, line: 139, type: !59)
!724 = !DILocation(line: 139, column: 18, scope: !700)
!725 = !DILocation(line: 139, column: 27, scope: !700)
!726 = !DILocation(line: 139, column: 33, scope: !700)
!727 = !DILocation(line: 139, column: 36, scope: !700)
!728 = !DILocation(line: 0, scope: !700)
!729 = !DILocation(line: 141, column: 16, scope: !730)
!730 = distinct !DILexicalBlock(scope: !700, file: !19, line: 141, column: 16)
!731 = !DILocation(line: 141, column: 16, scope: !700)
!732 = !DILocation(line: 142, column: 17, scope: !730)
!733 = !DILocation(line: 142, column: 26, scope: !730)
!734 = !DILocation(line: 142, column: 34, scope: !730)
!735 = !DILocation(line: 143, column: 21, scope: !736)
!736 = distinct !DILexicalBlock(scope: !730, file: !19, line: 143, column: 21)
!737 = !DILocation(line: 143, column: 21, scope: !730)
!738 = !DILocation(line: 144, column: 17, scope: !736)
!739 = !DILocation(line: 144, column: 26, scope: !736)
!740 = !DILocation(line: 144, column: 34, scope: !736)
!741 = !DILocation(line: 145, column: 21, scope: !742)
!742 = distinct !DILexicalBlock(scope: !736, file: !19, line: 145, column: 21)
!743 = !DILocation(line: 145, column: 21, scope: !736)
!744 = !DILocation(line: 146, column: 17, scope: !742)
!745 = !DILocation(line: 146, column: 26, scope: !742)
!746 = !DILocation(line: 146, column: 34, scope: !742)
!747 = !DILocation(line: 148, column: 17, scope: !742)
!748 = !DILocation(line: 148, column: 26, scope: !742)
!749 = !DILocation(line: 148, column: 34, scope: !742)
!750 = !DILocation(line: 149, column: 9, scope: !700)
!751 = !DILocation(line: 132, column: 42, scope: !695)
!752 = !DILocation(line: 132, column: 9, scope: !695)
!753 = distinct !{!753, !698, !754, !115}
!754 = !DILocation(line: 149, column: 9, scope: !690)
!755 = !DILocation(line: 150, column: 5, scope: !691)
!756 = !DILocation(line: 131, column: 39, scope: !685)
!757 = !DILocation(line: 131, column: 5, scope: !685)
!758 = distinct !{!758, !688, !759, !115}
!759 = !DILocation(line: 150, column: 5, scope: !681)
!760 = !DILocation(line: 151, column: 1, scope: !663)
!761 = distinct !DISubprogram(name: "clearDisplay", scope: !19, file: !19, line: 153, type: !762, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!762 = !DISubroutineType(types: !763)
!763 = !{null, !77, !15}
!764 = !DILocalVariable(name: "display", arg: 1, scope: !761, file: !19, line: 153, type: !77)
!765 = !DILocation(line: 153, column: 35, scope: !761)
!766 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !761, file: !19, line: 153, type: !15)
!767 = !DILocation(line: 153, column: 48, scope: !761)
!768 = !DILocalVariable(name: "i", scope: !769, file: !19, line: 154, type: !15)
!769 = distinct !DILexicalBlock(scope: !761, file: !19, line: 154, column: 3)
!770 = !DILocation(line: 154, column: 11, scope: !769)
!771 = !DILocation(line: 154, column: 7, scope: !769)
!772 = !DILocation(line: 154, column: 18, scope: !773)
!773 = distinct !DILexicalBlock(scope: !769, file: !19, line: 154, column: 3)
!774 = !DILocation(line: 154, column: 22, scope: !773)
!775 = !DILocation(line: 154, column: 20, scope: !773)
!776 = !DILocation(line: 154, column: 3, scope: !769)
!777 = !DILocation(line: 155, column: 10, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !19, line: 154, column: 40)
!779 = !DILocation(line: 155, column: 18, scope: !778)
!780 = !DILocation(line: 155, column: 5, scope: !778)
!781 = !DILocation(line: 156, column: 3, scope: !778)
!782 = !DILocation(line: 154, column: 37, scope: !773)
!783 = !DILocation(line: 154, column: 3, scope: !773)
!784 = distinct !{!784, !776, !785, !115}
!785 = !DILocation(line: 156, column: 3, scope: !769)
!786 = !DILocation(line: 157, column: 8, scope: !761)
!787 = !DILocation(line: 157, column: 3, scope: !761)
!788 = !DILocation(line: 158, column: 1, scope: !761)
!789 = distinct !DISubprogram(name: "findYMax", scope: !19, file: !19, line: 160, type: !790, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!790 = !DISubroutineType(types: !791)
!791 = !{!11, !328, !15, !15, !15, !337}
!792 = !DILocalVariable(name: "arena", arg: 1, scope: !789, file: !19, line: 160, type: !328)
!793 = !DILocation(line: 160, column: 36, scope: !789)
!794 = !DILocalVariable(name: "begin", arg: 2, scope: !789, file: !19, line: 160, type: !15)
!795 = !DILocation(line: 160, column: 47, scope: !789)
!796 = !DILocalVariable(name: "end", arg: 3, scope: !789, file: !19, line: 160, type: !15)
!797 = !DILocation(line: 160, column: 58, scope: !789)
!798 = !DILocalVariable(name: "byAmount", arg: 4, scope: !789, file: !19, line: 160, type: !15)
!799 = !DILocation(line: 160, column: 67, scope: !789)
!800 = !DILocalVariable(name: "valFunc", arg: 5, scope: !789, file: !19, line: 160, type: !337)
!801 = !DILocation(line: 160, column: 94, scope: !789)
!802 = !DILocation(line: 161, column: 6, scope: !803)
!803 = distinct !DILexicalBlock(scope: !789, file: !19, line: 161, column: 6)
!804 = !DILocation(line: 161, column: 15, scope: !803)
!805 = !DILocation(line: 161, column: 12, scope: !803)
!806 = !DILocation(line: 161, column: 6, scope: !789)
!807 = !DILocation(line: 162, column: 5, scope: !803)
!808 = !DILocalVariable(name: "yMax", scope: !789, file: !19, line: 164, type: !11)
!809 = !DILocation(line: 164, column: 15, scope: !789)
!810 = !DILocation(line: 164, column: 47, scope: !789)
!811 = !DILocation(line: 164, column: 54, scope: !789)
!812 = !DILocation(line: 164, column: 63, scope: !789)
!813 = !DILocation(line: 164, column: 22, scope: !789)
!814 = !DILocalVariable(name: "i", scope: !815, file: !19, line: 165, type: !15)
!815 = distinct !DILexicalBlock(scope: !789, file: !19, line: 165, column: 3)
!816 = !DILocation(line: 165, column: 11, scope: !815)
!817 = !DILocation(line: 165, column: 15, scope: !815)
!818 = !DILocation(line: 165, column: 21, scope: !815)
!819 = !DILocation(line: 165, column: 7, scope: !815)
!820 = !DILocation(line: 165, column: 26, scope: !821)
!821 = distinct !DILexicalBlock(scope: !815, file: !19, line: 165, column: 3)
!822 = !DILocation(line: 165, column: 31, scope: !821)
!823 = !DILocation(line: 165, column: 28, scope: !821)
!824 = !DILocation(line: 165, column: 3, scope: !815)
!825 = !DILocalVariable(name: "toRet", scope: !826, file: !19, line: 166, type: !11)
!826 = distinct !DILexicalBlock(scope: !821, file: !19, line: 165, column: 48)
!827 = !DILocation(line: 166, column: 17, scope: !826)
!828 = !DILocation(line: 166, column: 50, scope: !826)
!829 = !DILocation(line: 166, column: 57, scope: !826)
!830 = !DILocation(line: 166, column: 66, scope: !826)
!831 = !DILocation(line: 166, column: 25, scope: !826)
!832 = !DILocation(line: 167, column: 16, scope: !826)
!833 = !DILocation(line: 167, column: 5, scope: !826)
!834 = !DILocation(line: 168, column: 8, scope: !835)
!835 = distinct !DILexicalBlock(scope: !826, file: !19, line: 168, column: 8)
!836 = !DILocation(line: 168, column: 16, scope: !835)
!837 = !DILocation(line: 168, column: 14, scope: !835)
!838 = !DILocation(line: 168, column: 8, scope: !826)
!839 = !DILocation(line: 169, column: 14, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !19, line: 168, column: 21)
!841 = !DILocation(line: 169, column: 12, scope: !840)
!842 = !DILocation(line: 170, column: 5, scope: !840)
!843 = !DILocation(line: 171, column: 3, scope: !826)
!844 = !DILocation(line: 165, column: 39, scope: !821)
!845 = !DILocation(line: 165, column: 37, scope: !821)
!846 = !DILocation(line: 165, column: 3, scope: !821)
!847 = distinct !{!847, !824, !848, !115}
!848 = !DILocation(line: 171, column: 3, scope: !815)
!849 = !DILocation(line: 172, column: 10, scope: !789)
!850 = !DILocation(line: 172, column: 3, scope: !789)
!851 = !DILocation(line: 173, column: 1, scope: !789)
!852 = distinct !DISubprogram(name: "drawGraph", scope: !19, file: !19, line: 175, type: !853, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!853 = !DISubroutineType(types: !854)
!854 = !{!59, !328, !15, !15, !15, !337}
!855 = !DILocalVariable(name: "arena", arg: 1, scope: !852, file: !19, line: 175, type: !328)
!856 = !DILocation(line: 175, column: 30, scope: !852)
!857 = !DILocalVariable(name: "begin", arg: 2, scope: !852, file: !19, line: 175, type: !15)
!858 = !DILocation(line: 175, column: 41, scope: !852)
!859 = !DILocalVariable(name: "end", arg: 3, scope: !852, file: !19, line: 175, type: !15)
!860 = !DILocation(line: 175, column: 52, scope: !852)
!861 = !DILocalVariable(name: "byAmount", arg: 4, scope: !852, file: !19, line: 175, type: !15)
!862 = !DILocation(line: 175, column: 61, scope: !852)
!863 = !DILocalVariable(name: "valFunc", arg: 5, scope: !852, file: !19, line: 175, type: !337)
!864 = !DILocation(line: 175, column: 88, scope: !852)
!865 = !DILocalVariable(name: "w", scope: !852, file: !19, line: 176, type: !866)
!866 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !867, line: 27, size: 64, elements: !868)
!867 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!868 = !{!869, !871, !872, !873}
!869 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !866, file: !867, line: 29, baseType: !870, size: 16)
!870 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!871 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !866, file: !867, line: 30, baseType: !870, size: 16, offset: 16)
!872 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !866, file: !867, line: 31, baseType: !870, size: 16, offset: 32)
!873 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !866, file: !867, line: 32, baseType: !870, size: 16, offset: 48)
!874 = !DILocation(line: 176, column: 18, scope: !852)
!875 = !DILocation(line: 179, column: 7, scope: !876)
!876 = distinct !DILexicalBlock(scope: !852, file: !19, line: 179, column: 7)
!877 = !DILocation(line: 179, column: 44, scope: !876)
!878 = !DILocation(line: 179, column: 7, scope: !852)
!879 = !DILocation(line: 180, column: 7, scope: !880)
!880 = distinct !DILexicalBlock(scope: !876, file: !19, line: 179, column: 51)
!881 = !DILocation(line: 181, column: 7, scope: !880)
!882 = !DILocalVariable(name: "yMax", scope: !852, file: !19, line: 184, type: !11)
!883 = !DILocation(line: 184, column: 15, scope: !852)
!884 = !DILocation(line: 184, column: 31, scope: !852)
!885 = !DILocation(line: 184, column: 38, scope: !852)
!886 = !DILocation(line: 184, column: 45, scope: !852)
!887 = !DILocation(line: 184, column: 50, scope: !852)
!888 = !DILocation(line: 184, column: 60, scope: !852)
!889 = !DILocation(line: 184, column: 22, scope: !852)
!890 = !DILocalVariable(name: "display", scope: !852, file: !19, line: 185, type: !77)
!891 = !DILocation(line: 185, column: 19, scope: !852)
!892 = !DILocation(line: 185, column: 45, scope: !852)
!893 = !DILocation(line: 185, column: 51, scope: !852)
!894 = !DILocation(line: 185, column: 49, scope: !852)
!895 = !DILocation(line: 185, column: 62, scope: !852)
!896 = !DILocation(line: 185, column: 60, scope: !852)
!897 = !DILocation(line: 185, column: 58, scope: !852)
!898 = !DILocation(line: 185, column: 43, scope: !852)
!899 = !DILocation(line: 185, column: 72, scope: !852)
!900 = !DILocation(line: 185, column: 81, scope: !852)
!901 = !DILocation(line: 185, column: 79, scope: !852)
!902 = !DILocation(line: 185, column: 77, scope: !852)
!903 = !DILocation(line: 185, column: 90, scope: !852)
!904 = !DILocation(line: 185, column: 97, scope: !852)
!905 = !DILocation(line: 185, column: 105, scope: !852)
!906 = !DILocation(line: 185, column: 103, scope: !852)
!907 = !DILocation(line: 185, column: 115, scope: !852)
!908 = !DILocation(line: 185, column: 113, scope: !852)
!909 = !DILocation(line: 185, column: 29, scope: !852)
!910 = !DILocation(line: 187, column: 13, scope: !852)
!911 = !DILocation(line: 187, column: 24, scope: !852)
!912 = !DILocation(line: 187, column: 30, scope: !852)
!913 = !DILocation(line: 187, column: 28, scope: !852)
!914 = !DILocation(line: 187, column: 41, scope: !852)
!915 = !DILocation(line: 187, column: 39, scope: !852)
!916 = !DILocation(line: 187, column: 37, scope: !852)
!917 = !DILocation(line: 187, column: 22, scope: !852)
!918 = !DILocation(line: 187, column: 51, scope: !852)
!919 = !DILocation(line: 187, column: 60, scope: !852)
!920 = !DILocation(line: 187, column: 58, scope: !852)
!921 = !DILocation(line: 187, column: 56, scope: !852)
!922 = !DILocation(line: 187, column: 71, scope: !852)
!923 = !DILocation(line: 187, column: 69, scope: !852)
!924 = !DILocation(line: 187, column: 81, scope: !852)
!925 = !DILocation(line: 187, column: 79, scope: !852)
!926 = !DILocation(line: 187, column: 3, scope: !852)
!927 = !DILocation(line: 188, column: 12, scope: !852)
!928 = !DILocation(line: 188, column: 21, scope: !852)
!929 = !DILocation(line: 188, column: 30, scope: !852)
!930 = !DILocation(line: 188, column: 39, scope: !852)
!931 = !DILocation(line: 188, column: 45, scope: !852)
!932 = !DILocation(line: 188, column: 43, scope: !852)
!933 = !DILocation(line: 188, column: 56, scope: !852)
!934 = !DILocation(line: 188, column: 54, scope: !852)
!935 = !DILocation(line: 188, column: 52, scope: !852)
!936 = !DILocation(line: 188, column: 37, scope: !852)
!937 = !DILocation(line: 188, column: 66, scope: !852)
!938 = !DILocation(line: 188, column: 75, scope: !852)
!939 = !DILocation(line: 188, column: 73, scope: !852)
!940 = !DILocation(line: 188, column: 71, scope: !852)
!941 = !DILocation(line: 188, column: 86, scope: !852)
!942 = !DILocation(line: 188, column: 84, scope: !852)
!943 = !DILocation(line: 188, column: 96, scope: !852)
!944 = !DILocation(line: 188, column: 94, scope: !852)
!945 = !DILocation(line: 188, column: 3, scope: !852)
!946 = !DILocation(line: 189, column: 14, scope: !852)
!947 = !DILocation(line: 189, column: 23, scope: !852)
!948 = !DILocation(line: 189, column: 32, scope: !852)
!949 = !DILocation(line: 189, column: 41, scope: !852)
!950 = !DILocation(line: 189, column: 47, scope: !852)
!951 = !DILocation(line: 189, column: 45, scope: !852)
!952 = !DILocation(line: 189, column: 58, scope: !852)
!953 = !DILocation(line: 189, column: 56, scope: !852)
!954 = !DILocation(line: 189, column: 54, scope: !852)
!955 = !DILocation(line: 189, column: 39, scope: !852)
!956 = !DILocation(line: 189, column: 68, scope: !852)
!957 = !DILocation(line: 189, column: 77, scope: !852)
!958 = !DILocation(line: 189, column: 75, scope: !852)
!959 = !DILocation(line: 189, column: 73, scope: !852)
!960 = !DILocation(line: 189, column: 86, scope: !852)
!961 = !DILocation(line: 189, column: 93, scope: !852)
!962 = !DILocation(line: 189, column: 100, scope: !852)
!963 = !DILocation(line: 189, column: 98, scope: !852)
!964 = !DILocation(line: 189, column: 110, scope: !852)
!965 = !DILocation(line: 189, column: 108, scope: !852)
!966 = !DILocation(line: 189, column: 3, scope: !852)
!967 = !DILocation(line: 190, column: 14, scope: !852)
!968 = !DILocation(line: 190, column: 25, scope: !852)
!969 = !DILocation(line: 190, column: 23, scope: !852)
!970 = !DILocation(line: 190, column: 35, scope: !852)
!971 = !DILocation(line: 190, column: 33, scope: !852)
!972 = !DILocation(line: 190, column: 3, scope: !852)
!973 = !DILocation(line: 191, column: 16, scope: !852)
!974 = !DILocation(line: 191, column: 27, scope: !852)
!975 = !DILocation(line: 191, column: 25, scope: !852)
!976 = !DILocation(line: 191, column: 3, scope: !852)
!977 = !DILocation(line: 192, column: 3, scope: !852)
!978 = !DILocation(line: 193, column: 1, scope: !852)
