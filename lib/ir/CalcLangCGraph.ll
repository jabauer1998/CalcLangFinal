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
@.str.2 = private unnamed_addr constant [13 x i8] c"ioctl failed\00", align 1, !dbg !28

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @closeTo(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !41 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !46, metadata !DIExpression()), !dbg !47
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !48, metadata !DIExpression()), !dbg !49
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !50, metadata !DIExpression()), !dbg !51
  %7 = load x86_fp80, ptr %4, align 16, !dbg !52
  %8 = load x86_fp80, ptr %5, align 16, !dbg !53
  %9 = fsub x86_fp80 %7, %8, !dbg !54
  %10 = call x86_fp80 @llvm.fabs.f80(x86_fp80 %9), !dbg !55
  %11 = load x86_fp80, ptr %6, align 16, !dbg !56
  %12 = fcmp olt x86_fp80 %10, %11, !dbg !57
  ret i1 %12, !dbg !58
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fabs.f80(x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @initializeDisplay(i32 noundef %0, i32 noundef %1) #0 !dbg !59 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %5, metadata !67, metadata !DIExpression()), !dbg !68
  %7 = load i32, ptr %3, align 4, !dbg !69
  %8 = sext i32 %7 to i64, !dbg !69
  %9 = mul i64 8, %8, !dbg !70
  %10 = call noalias ptr @malloc(i64 noundef %9) #7, !dbg !71
  store ptr %10, ptr %5, align 8, !dbg !68
  %11 = load ptr, ptr %5, align 8, !dbg !72
  %12 = load i32, ptr %3, align 4, !dbg !73
  %13 = sext i32 %12 to i64, !dbg !73
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 %13, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata ptr %6, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 0, ptr %6, align 4, !dbg !77
  br label %14, !dbg !78

14:                                               ; preds = %34, %2
  %15 = load i32, ptr %6, align 4, !dbg !79
  %16 = load i32, ptr %3, align 4, !dbg !81
  %17 = icmp slt i32 %15, %16, !dbg !82
  br i1 %17, label %18, label %37, !dbg !83

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4, !dbg !84
  %20 = sext i32 %19 to i64, !dbg !84
  %21 = mul i64 48, %20, !dbg !86
  %22 = call noalias ptr @malloc(i64 noundef %21) #7, !dbg !87
  %23 = load ptr, ptr %5, align 8, !dbg !88
  %24 = load i32, ptr %6, align 4, !dbg !89
  %25 = sext i32 %24 to i64, !dbg !88
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25, !dbg !88
  store ptr %22, ptr %26, align 8, !dbg !90
  %27 = load ptr, ptr %5, align 8, !dbg !91
  %28 = load i32, ptr %6, align 4, !dbg !92
  %29 = sext i32 %28 to i64, !dbg !91
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !91
  %31 = load ptr, ptr %30, align 8, !dbg !91
  %32 = load i32, ptr %4, align 4, !dbg !93
  %33 = sext i32 %32 to i64, !dbg !93
  call void @llvm.memset.p0.i64(ptr align 16 %31, i8 0, i64 %33, i1 false), !dbg !94
  br label %34, !dbg !95

34:                                               ; preds = %18
  %35 = load i32, ptr %6, align 4, !dbg !96
  %36 = add nsw i32 %35, 1, !dbg !96
  store i32 %36, ptr %6, align 4, !dbg !96
  br label %14, !dbg !97, !llvm.loop !98

37:                                               ; preds = %14
  %38 = load ptr, ptr %5, align 8, !dbg !101
  ret ptr %38, !dbg !102
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, x86_fp80 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !103 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !106, metadata !DIExpression()), !dbg !107
  store x86_fp80 %1, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !108, metadata !DIExpression()), !dbg !109
  store x86_fp80 %2, ptr %9, align 16
  call void @llvm.dbg.declare(metadata ptr %9, metadata !110, metadata !DIExpression()), !dbg !111
  store x86_fp80 %3, ptr %10, align 16
  call void @llvm.dbg.declare(metadata ptr %10, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 %5, ptr %12, align 4
  call void @llvm.dbg.declare(metadata ptr %12, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata ptr %13, metadata !118, metadata !DIExpression()), !dbg !119
  %16 = load i32, ptr %11, align 4, !dbg !120
  %17 = load i32, ptr %12, align 4, !dbg !121
  %18 = call ptr @initializeDisplay(i32 noundef %16, i32 noundef %17), !dbg !122
  store ptr %18, ptr %13, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata ptr %14, metadata !123, metadata !DIExpression()), !dbg !125
  store i32 0, ptr %14, align 4, !dbg !125
  br label %19, !dbg !126

19:                                               ; preds = %62, %6
  %20 = load i32, ptr %14, align 4, !dbg !127
  %21 = load i32, ptr %11, align 4, !dbg !129
  %22 = icmp slt i32 %20, %21, !dbg !130
  br i1 %22, label %23, label %65, !dbg !131

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %15, metadata !132, metadata !DIExpression()), !dbg !135
  store i32 0, ptr %15, align 4, !dbg !135
  br label %24, !dbg !136

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %15, align 4, !dbg !137
  %26 = load i32, ptr %12, align 4, !dbg !139
  %27 = icmp slt i32 %25, %26, !dbg !140
  br i1 %27, label %28, label %61, !dbg !141

28:                                               ; preds = %24
  %29 = load x86_fp80, ptr %9, align 16, !dbg !142
  %30 = load x86_fp80, ptr %7, align 16, !dbg !144
  %31 = load i32, ptr %15, align 4, !dbg !145
  %32 = sitofp i32 %31 to x86_fp80, !dbg !145
  %33 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %30, x86_fp80 %32, x86_fp80 %29), !dbg !146
  %34 = load ptr, ptr %13, align 8, !dbg !147
  %35 = load i32, ptr %14, align 4, !dbg !148
  %36 = sext i32 %35 to i64, !dbg !147
  %37 = getelementptr inbounds ptr, ptr %34, i64 %36, !dbg !147
  %38 = load ptr, ptr %37, align 8, !dbg !147
  %39 = load i32, ptr %15, align 4, !dbg !149
  %40 = sext i32 %39 to i64, !dbg !147
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %38, i64 %40, !dbg !147
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %41, i32 0, i32 0, !dbg !150
  store x86_fp80 %33, ptr %42, align 16, !dbg !151
  %43 = load x86_fp80, ptr %10, align 16, !dbg !152
  %44 = load x86_fp80, ptr %8, align 16, !dbg !153
  %45 = load i32, ptr %14, align 4, !dbg !154
  %46 = sitofp i32 %45 to x86_fp80, !dbg !154
  %47 = fneg x86_fp80 %44, !dbg !155
  %48 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %47, x86_fp80 %46, x86_fp80 %43), !dbg !155
  %49 = load ptr, ptr %13, align 8, !dbg !156
  %50 = load i32, ptr %14, align 4, !dbg !157
  %51 = sext i32 %50 to i64, !dbg !156
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !156
  %53 = load ptr, ptr %52, align 8, !dbg !156
  %54 = load i32, ptr %15, align 4, !dbg !158
  %55 = sext i32 %54 to i64, !dbg !156
  %56 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i64 %55, !dbg !156
  %57 = getelementptr inbounds %struct.CalcLangPixel, ptr %56, i32 0, i32 1, !dbg !159
  store x86_fp80 %48, ptr %57, align 16, !dbg !160
  br label %58, !dbg !161

58:                                               ; preds = %28
  %59 = load i32, ptr %15, align 4, !dbg !162
  %60 = add nsw i32 %59, 1, !dbg !162
  store i32 %60, ptr %15, align 4, !dbg !162
  br label %24, !dbg !163, !llvm.loop !164

61:                                               ; preds = %24
  br label %62, !dbg !166

62:                                               ; preds = %61
  %63 = load i32, ptr %14, align 4, !dbg !167
  %64 = add nsw i32 %63, 1, !dbg !167
  store i32 %64, ptr %14, align 4, !dbg !167
  br label %19, !dbg !168, !llvm.loop !169

65:                                               ; preds = %19
  %66 = load ptr, ptr %13, align 8, !dbg !171
  ret ptr %66, !dbg !172
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !173 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !176, metadata !DIExpression()), !dbg !177
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !178, metadata !DIExpression()), !dbg !179
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata ptr %7, metadata !182, metadata !DIExpression()), !dbg !184
  store ptr @.str, ptr %7, align 8, !dbg !184
  call void @llvm.dbg.declare(metadata ptr %8, metadata !185, metadata !DIExpression()), !dbg !186
  %12 = load x86_fp80, ptr %6, align 16, !dbg !187
  %13 = fdiv x86_fp80 %12, 0xK40028000000000000000, !dbg !188
  store x86_fp80 %13, ptr %8, align 16, !dbg !186
  call void @llvm.dbg.declare(metadata ptr %9, metadata !189, metadata !DIExpression()), !dbg !190
  %14 = load x86_fp80, ptr %4, align 16, !dbg !191
  %15 = load x86_fp80, ptr %5, align 16, !dbg !192
  %16 = load x86_fp80, ptr %6, align 16, !dbg !193
  %17 = fdiv x86_fp80 %16, 0xK40008000000000000000, !dbg !194
  %18 = fsub x86_fp80 %15, %17, !dbg !195
  %19 = fsub x86_fp80 %14, %18, !dbg !196
  store x86_fp80 %19, ptr %9, align 16, !dbg !190
  call void @llvm.dbg.declare(metadata ptr %10, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 0, ptr %10, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata ptr %11, metadata !199, metadata !DIExpression()), !dbg !200
  store x86_fp80 0xK00000000000000000000, ptr %11, align 16, !dbg !200
  br label %20, !dbg !201

20:                                               ; preds = %24, %3
  %21 = load x86_fp80, ptr %11, align 16, !dbg !202
  %22 = load x86_fp80, ptr %9, align 16, !dbg !203
  %23 = fcmp olt x86_fp80 %21, %22, !dbg !204
  br i1 %23, label %24, label %30, !dbg !201

24:                                               ; preds = %20
  %25 = load x86_fp80, ptr %8, align 16, !dbg !205
  %26 = load x86_fp80, ptr %11, align 16, !dbg !207
  %27 = fadd x86_fp80 %26, %25, !dbg !207
  store x86_fp80 %27, ptr %11, align 16, !dbg !207
  %28 = load i32, ptr %10, align 4, !dbg !208
  %29 = add nsw i32 %28, 1, !dbg !208
  store i32 %29, ptr %10, align 4, !dbg !208
  br label %20, !dbg !201, !llvm.loop !209

30:                                               ; preds = %20
  %31 = load ptr, ptr %7, align 8, !dbg !211
  %32 = load i32, ptr %10, align 4, !dbg !212
  %33 = sub nsw i32 %32, 1, !dbg !213
  %34 = sext i32 %33 to i64, !dbg !211
  %35 = getelementptr inbounds i8, ptr %31, i64 %34, !dbg !211
  %36 = load i8, ptr %35, align 1, !dbg !211
  ret i8 %36, !dbg !214
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !215 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata ptr %7, metadata !224, metadata !DIExpression()), !dbg !226
  %13 = load i32, ptr %5, align 4, !dbg !227
  %14 = sext i32 %13 to i64, !dbg !227
  %15 = mul i64 8, %14, !dbg !228
  %16 = add i64 %15, 1, !dbg !229
  %17 = call noalias ptr @malloc(i64 noundef %16) #7, !dbg !230
  store ptr %17, ptr %7, align 8, !dbg !226
  call void @llvm.dbg.declare(metadata ptr %8, metadata !231, metadata !DIExpression()), !dbg !233
  store i32 0, ptr %8, align 4, !dbg !233
  br label %18, !dbg !234

18:                                               ; preds = %32, %3
  %19 = load i32, ptr %8, align 4, !dbg !235
  %20 = load i32, ptr %5, align 4, !dbg !237
  %21 = icmp slt i32 %19, %20, !dbg !238
  br i1 %21, label %22, label %35, !dbg !239

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4, !dbg !240
  %24 = sext i32 %23 to i64, !dbg !240
  %25 = mul i64 1, %24, !dbg !242
  %26 = add i64 %25, 1, !dbg !243
  %27 = call noalias ptr @malloc(i64 noundef %26) #7, !dbg !244
  %28 = load ptr, ptr %7, align 8, !dbg !245
  %29 = load i32, ptr %8, align 4, !dbg !246
  %30 = sext i32 %29 to i64, !dbg !245
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30, !dbg !245
  store ptr %27, ptr %31, align 8, !dbg !247
  br label %32, !dbg !248

32:                                               ; preds = %22
  %33 = load i32, ptr %8, align 4, !dbg !249
  %34 = add nsw i32 %33, 1, !dbg !249
  store i32 %34, ptr %8, align 4, !dbg !249
  br label %18, !dbg !250, !llvm.loop !251

35:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %9, metadata !253, metadata !DIExpression()), !dbg !255
  store i32 0, ptr %9, align 4, !dbg !255
  br label %36, !dbg !256

36:                                               ; preds = %76, %35
  %37 = load i32, ptr %9, align 4, !dbg !257
  %38 = load i32, ptr %5, align 4, !dbg !259
  %39 = icmp slt i32 %37, %38, !dbg !260
  br i1 %39, label %40, label %79, !dbg !261

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %10, metadata !262, metadata !DIExpression()), !dbg !265
  store i32 0, ptr %10, align 4, !dbg !265
  br label %41, !dbg !266

41:                                               ; preds = %64, %40
  %42 = load i32, ptr %10, align 4, !dbg !267
  %43 = load i32, ptr %6, align 4, !dbg !269
  %44 = icmp slt i32 %42, %43, !dbg !270
  br i1 %44, label %45, label %67, !dbg !271

45:                                               ; preds = %41
  %46 = load ptr, ptr %4, align 8, !dbg !272
  %47 = load i32, ptr %9, align 4, !dbg !273
  %48 = sext i32 %47 to i64, !dbg !272
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48, !dbg !272
  %50 = load ptr, ptr %49, align 8, !dbg !272
  %51 = load i32, ptr %10, align 4, !dbg !274
  %52 = sext i32 %51 to i64, !dbg !272
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %50, i64 %52, !dbg !272
  %54 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i32 0, i32 2, !dbg !275
  %55 = load i8, ptr %54, align 16, !dbg !276
  %56 = load ptr, ptr %7, align 8, !dbg !277
  %57 = load i32, ptr %9, align 4, !dbg !278
  %58 = sext i32 %57 to i64, !dbg !277
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58, !dbg !277
  %60 = load ptr, ptr %59, align 8, !dbg !277
  %61 = load i32, ptr %10, align 4, !dbg !279
  %62 = sext i32 %61 to i64, !dbg !277
  %63 = getelementptr inbounds i8, ptr %60, i64 %62, !dbg !277
  store i8 %55, ptr %63, align 1, !dbg !280
  br label %64, !dbg !277

64:                                               ; preds = %45
  %65 = load i32, ptr %10, align 4, !dbg !281
  %66 = add nsw i32 %65, 1, !dbg !281
  store i32 %66, ptr %10, align 4, !dbg !281
  br label %41, !dbg !282, !llvm.loop !283

67:                                               ; preds = %41
  %68 = load ptr, ptr %7, align 8, !dbg !285
  %69 = load i32, ptr %9, align 4, !dbg !286
  %70 = sext i32 %69 to i64, !dbg !285
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70, !dbg !285
  %72 = load ptr, ptr %71, align 8, !dbg !285
  %73 = load i32, ptr %6, align 4, !dbg !287
  %74 = sext i32 %73 to i64, !dbg !285
  %75 = getelementptr inbounds i8, ptr %72, i64 %74, !dbg !285
  store i8 0, ptr %75, align 1, !dbg !288
  br label %76, !dbg !289

76:                                               ; preds = %67
  %77 = load i32, ptr %9, align 4, !dbg !290
  %78 = add nsw i32 %77, 1, !dbg !290
  store i32 %78, ptr %9, align 4, !dbg !290
  br label %36, !dbg !291, !llvm.loop !292

79:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %11, metadata !294, metadata !DIExpression()), !dbg !296
  store i32 0, ptr %11, align 4, !dbg !296
  br label %80, !dbg !297

80:                                               ; preds = %91, %79
  %81 = load i32, ptr %11, align 4, !dbg !298
  %82 = load i32, ptr %5, align 4, !dbg !300
  %83 = icmp slt i32 %81, %82, !dbg !301
  br i1 %83, label %84, label %94, !dbg !302

84:                                               ; preds = %80
  %85 = load ptr, ptr %7, align 8, !dbg !303
  %86 = load i32, ptr %11, align 4, !dbg !304
  %87 = sext i32 %86 to i64, !dbg !303
  %88 = getelementptr inbounds ptr, ptr %85, i64 %87, !dbg !303
  %89 = load ptr, ptr %88, align 8, !dbg !303
  %90 = call i32 @puts(ptr noundef %89), !dbg !305
  br label %91, !dbg !305

91:                                               ; preds = %84
  %92 = load i32, ptr %11, align 4, !dbg !306
  %93 = add nsw i32 %92, 1, !dbg !306
  store i32 %93, ptr %11, align 4, !dbg !306
  br label %80, !dbg !307, !llvm.loop !308

94:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata ptr %12, metadata !310, metadata !DIExpression()), !dbg !312
  store i32 0, ptr %12, align 4, !dbg !312
  br label %95, !dbg !313

95:                                               ; preds = %105, %94
  %96 = load i32, ptr %12, align 4, !dbg !314
  %97 = load i32, ptr %5, align 4, !dbg !316
  %98 = icmp slt i32 %96, %97, !dbg !317
  br i1 %98, label %99, label %108, !dbg !318

99:                                               ; preds = %95
  %100 = load ptr, ptr %7, align 8, !dbg !319
  %101 = load i32, ptr %12, align 4, !dbg !320
  %102 = sext i32 %101 to i64, !dbg !319
  %103 = getelementptr inbounds ptr, ptr %100, i64 %102, !dbg !319
  %104 = load ptr, ptr %103, align 8, !dbg !319
  call void @free(ptr noundef %104) #8, !dbg !321
  br label %105, !dbg !321

105:                                              ; preds = %99
  %106 = load i32, ptr %12, align 4, !dbg !322
  %107 = add nsw i32 %106, 1, !dbg !322
  store i32 %107, ptr %12, align 4, !dbg !322
  br label %95, !dbg !323, !llvm.loop !324

108:                                              ; preds = %95
  %109 = load ptr, ptr %7, align 8, !dbg !326
  call void @free(ptr noundef %109) #8, !dbg !327
  ret void, !dbg !328
}

declare i32 @puts(ptr noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @calcLangValueFuncWrapper(ptr noundef %0, ptr noundef %1, x86_fp80 noundef %2) #0 !dbg !329 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !376, metadata !DIExpression()), !dbg !377
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !378, metadata !DIExpression()), !dbg !379
  store x86_fp80 %2, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !380, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata ptr %8, metadata !382, metadata !DIExpression()), !dbg !383
  %10 = load ptr, ptr %5, align 8, !dbg !384
  %11 = call ptr @arenaAlloc(ptr noundef %10, i32 noundef 8), !dbg !385
  store ptr %11, ptr %8, align 8, !dbg !383
  %12 = load ptr, ptr %8, align 8, !dbg !386
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 0, !dbg !387
  store i32 0, ptr %13, align 8, !dbg !388
  %14 = load x86_fp80, ptr %7, align 16, !dbg !389
  %15 = fptosi x86_fp80 %14 to i32, !dbg !390
  %16 = load ptr, ptr %8, align 8, !dbg !391
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 1, !dbg !392
  store i32 %15, ptr %17, align 8, !dbg !393
  call void @llvm.dbg.declare(metadata ptr %9, metadata !394, metadata !DIExpression()), !dbg !395
  %18 = load ptr, ptr %6, align 8, !dbg !396
  %19 = load ptr, ptr %5, align 8, !dbg !397
  %20 = load ptr, ptr %8, align 8, !dbg !398
  %21 = call ptr %18(ptr noundef %19, ptr noundef %20), !dbg !396
  store ptr %21, ptr %9, align 8, !dbg !395
  %22 = load ptr, ptr %9, align 8, !dbg !399
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0, !dbg !401
  %24 = load i32, ptr %23, align 8, !dbg !401
  %25 = icmp eq i32 %24, 0, !dbg !402
  br i1 %25, label %26, label %31, !dbg !403

26:                                               ; preds = %3
  %27 = load ptr, ptr %9, align 8, !dbg !404
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1, !dbg !405
  %29 = load i32, ptr %28, align 8, !dbg !406
  %30 = sitofp i32 %29 to x86_fp80, !dbg !407
  store x86_fp80 %30, ptr %4, align 16, !dbg !408
  br label %32, !dbg !408

31:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #9, !dbg !409
  store x86_fp80 0xKBFFF8000000000000000, ptr %4, align 16, !dbg !411
  br label %32, !dbg !411

32:                                               ; preds = %31, %26
  %33 = load x86_fp80, ptr %4, align 16, !dbg !412
  ret x86_fp80 %33, !dbg !412
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #4

; Function Attrs: cold
declare void @perror(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @shadeGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, x86_fp80 noundef %5, x86_fp80 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !413 {
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !416, metadata !DIExpression()), !dbg !417
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !418, metadata !DIExpression()), !dbg !419
  store ptr %2, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !420, metadata !DIExpression()), !dbg !421
  store x86_fp80 %3, ptr %13, align 16
  call void @llvm.dbg.declare(metadata ptr %13, metadata !422, metadata !DIExpression()), !dbg !423
  store x86_fp80 %4, ptr %14, align 16
  call void @llvm.dbg.declare(metadata ptr %14, metadata !424, metadata !DIExpression()), !dbg !425
  store x86_fp80 %5, ptr %15, align 16
  call void @llvm.dbg.declare(metadata ptr %15, metadata !426, metadata !DIExpression()), !dbg !427
  store x86_fp80 %6, ptr %16, align 16
  call void @llvm.dbg.declare(metadata ptr %16, metadata !428, metadata !DIExpression()), !dbg !429
  store i32 %7, ptr %17, align 4
  call void @llvm.dbg.declare(metadata ptr %17, metadata !430, metadata !DIExpression()), !dbg !431
  store i32 %8, ptr %18, align 4
  call void @llvm.dbg.declare(metadata ptr %18, metadata !432, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.declare(metadata ptr %19, metadata !434, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata ptr %20, metadata !436, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.declare(metadata ptr %21, metadata !438, metadata !DIExpression()), !dbg !440
  store i32 0, ptr %21, align 4, !dbg !440
  br label %25, !dbg !441

25:                                               ; preds = %104, %9
  %26 = load i32, ptr %21, align 4, !dbg !442
  %27 = load i32, ptr %17, align 4, !dbg !444
  %28 = icmp slt i32 %26, %27, !dbg !445
  br i1 %28, label %29, label %107, !dbg !446

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %22, metadata !447, metadata !DIExpression()), !dbg !450
  store i32 0, ptr %22, align 4, !dbg !450
  br label %30, !dbg !451

30:                                               ; preds = %100, %29
  %31 = load i32, ptr %22, align 4, !dbg !452
  %32 = load i32, ptr %18, align 4, !dbg !454
  %33 = icmp slt i32 %31, %32, !dbg !455
  br i1 %33, label %34, label %103, !dbg !456

34:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %23, metadata !457, metadata !DIExpression()), !dbg !459
  %35 = load ptr, ptr %10, align 8, !dbg !460
  %36 = load i32, ptr %21, align 4, !dbg !461
  %37 = sext i32 %36 to i64, !dbg !460
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !460
  %39 = load ptr, ptr %38, align 8, !dbg !460
  %40 = load i32, ptr %22, align 4, !dbg !462
  %41 = sext i32 %40 to i64, !dbg !460
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i64 %41, !dbg !460
  store ptr %42, ptr %23, align 8, !dbg !459
  %43 = load ptr, ptr %23, align 8, !dbg !463
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 0, !dbg !464
  %45 = load x86_fp80, ptr %44, align 16, !dbg !464
  store x86_fp80 %45, ptr %19, align 16, !dbg !465
  %46 = load ptr, ptr %23, align 8, !dbg !466
  %47 = getelementptr inbounds %struct.CalcLangPixel, ptr %46, i32 0, i32 1, !dbg !467
  %48 = load x86_fp80, ptr %47, align 16, !dbg !467
  store x86_fp80 %48, ptr %20, align 16, !dbg !468
  call void @llvm.dbg.declare(metadata ptr %24, metadata !469, metadata !DIExpression()), !dbg !470
  %49 = load ptr, ptr %12, align 8, !dbg !471
  %50 = load ptr, ptr %11, align 8, !dbg !472
  %51 = load x86_fp80, ptr %19, align 16, !dbg !473
  %52 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %49, ptr noundef %50, x86_fp80 noundef %51), !dbg !474
  store x86_fp80 %52, ptr %24, align 16, !dbg !470
  %53 = load x86_fp80, ptr %24, align 16, !dbg !475
  %54 = load x86_fp80, ptr %20, align 16, !dbg !477
  %55 = load x86_fp80, ptr %14, align 16, !dbg !478
  %56 = fdiv x86_fp80 %55, 0xK40008666666666666800, !dbg !479
  %57 = call zeroext i1 @closeTo(x86_fp80 noundef %53, x86_fp80 noundef %54, x86_fp80 noundef %56), !dbg !480
  br i1 %57, label %58, label %65, !dbg !481

58:                                               ; preds = %34
  %59 = load x86_fp80, ptr %24, align 16, !dbg !482
  %60 = load x86_fp80, ptr %20, align 16, !dbg !483
  %61 = load x86_fp80, ptr %14, align 16, !dbg !484
  %62 = call signext i8 @yCompress(x86_fp80 noundef %59, x86_fp80 noundef %60, x86_fp80 noundef %61), !dbg !485
  %63 = load ptr, ptr %23, align 8, !dbg !486
  %64 = getelementptr inbounds %struct.CalcLangPixel, ptr %63, i32 0, i32 2, !dbg !487
  store i8 %62, ptr %64, align 16, !dbg !488
  br label %99, !dbg !486

65:                                               ; preds = %34
  %66 = load x86_fp80, ptr %24, align 16, !dbg !489
  %67 = fcmp olt x86_fp80 %66, 0xK00000000000000000000, !dbg !491
  br i1 %67, label %68, label %77, !dbg !492

68:                                               ; preds = %65
  %69 = load x86_fp80, ptr %20, align 16, !dbg !493
  %70 = load x86_fp80, ptr %14, align 16, !dbg !494
  %71 = fdiv x86_fp80 %70, 0xK40008000000000000000, !dbg !495
  %72 = fcmp olt x86_fp80 %69, %71, !dbg !496
  br i1 %72, label %73, label %98, !dbg !497

73:                                               ; preds = %68
  %74 = load x86_fp80, ptr %20, align 16, !dbg !498
  %75 = load x86_fp80, ptr %24, align 16, !dbg !499
  %76 = fcmp ogt x86_fp80 %74, %75, !dbg !500
  br i1 %76, label %87, label %98, !dbg !501

77:                                               ; preds = %65
  %78 = load x86_fp80, ptr %20, align 16, !dbg !502
  %79 = load x86_fp80, ptr %14, align 16, !dbg !503
  %80 = fneg x86_fp80 %79, !dbg !504
  %81 = fdiv x86_fp80 %80, 0xK40008000000000000000, !dbg !505
  %82 = fcmp ogt x86_fp80 %78, %81, !dbg !506
  br i1 %82, label %83, label %98, !dbg !507

83:                                               ; preds = %77
  %84 = load x86_fp80, ptr %20, align 16, !dbg !508
  %85 = load x86_fp80, ptr %24, align 16, !dbg !509
  %86 = fcmp olt x86_fp80 %84, %85, !dbg !510
  br i1 %86, label %87, label %98, !dbg !492

87:                                               ; preds = %83, %73
  %88 = load x86_fp80, ptr %19, align 16, !dbg !511
  %89 = load x86_fp80, ptr %15, align 16, !dbg !512
  %90 = fcmp ogt x86_fp80 %88, %89, !dbg !513
  br i1 %90, label %91, label %98, !dbg !514

91:                                               ; preds = %87
  %92 = load x86_fp80, ptr %19, align 16, !dbg !515
  %93 = load x86_fp80, ptr %16, align 16, !dbg !516
  %94 = fcmp olt x86_fp80 %92, %93, !dbg !517
  br i1 %94, label %95, label %98, !dbg !518

95:                                               ; preds = %91
  %96 = load ptr, ptr %23, align 8, !dbg !519
  %97 = getelementptr inbounds %struct.CalcLangPixel, ptr %96, i32 0, i32 2, !dbg !520
  store i8 35, ptr %97, align 16, !dbg !521
  br label %98, !dbg !519

98:                                               ; preds = %95, %91, %87, %83, %77, %73, %68
  br label %99

99:                                               ; preds = %98, %58
  br label %100, !dbg !522

100:                                              ; preds = %99
  %101 = load i32, ptr %22, align 4, !dbg !523
  %102 = add nsw i32 %101, 1, !dbg !523
  store i32 %102, ptr %22, align 4, !dbg !523
  br label %30, !dbg !524, !llvm.loop !525

103:                                              ; preds = %30
  br label %104, !dbg !527

104:                                              ; preds = %103
  %105 = load i32, ptr %21, align 4, !dbg !528
  %106 = add nsw i32 %105, 1, !dbg !528
  store i32 %106, ptr %21, align 4, !dbg !528
  br label %25, !dbg !529, !llvm.loop !530

107:                                              ; preds = %25
  ret void, !dbg !532
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !533 {
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
  call void @llvm.dbg.declare(metadata ptr %8, metadata !536, metadata !DIExpression()), !dbg !537
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !538, metadata !DIExpression()), !dbg !539
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !540, metadata !DIExpression()), !dbg !541
  store x86_fp80 %3, ptr %11, align 16
  call void @llvm.dbg.declare(metadata ptr %11, metadata !542, metadata !DIExpression()), !dbg !543
  store x86_fp80 %4, ptr %12, align 16
  call void @llvm.dbg.declare(metadata ptr %12, metadata !544, metadata !DIExpression()), !dbg !545
  store i32 %5, ptr %13, align 4
  call void @llvm.dbg.declare(metadata ptr %13, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 %6, ptr %14, align 4
  call void @llvm.dbg.declare(metadata ptr %14, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata ptr %15, metadata !550, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.declare(metadata ptr %16, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata ptr %17, metadata !554, metadata !DIExpression()), !dbg !556
  store i32 0, ptr %17, align 4, !dbg !556
  br label %21, !dbg !557

21:                                               ; preds = %66, %7
  %22 = load i32, ptr %17, align 4, !dbg !558
  %23 = load i32, ptr %13, align 4, !dbg !560
  %24 = icmp slt i32 %22, %23, !dbg !561
  br i1 %24, label %25, label %69, !dbg !562

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %18, metadata !563, metadata !DIExpression()), !dbg !566
  store i32 0, ptr %18, align 4, !dbg !566
  br label %26, !dbg !567

26:                                               ; preds = %62, %25
  %27 = load i32, ptr %18, align 4, !dbg !568
  %28 = load i32, ptr %14, align 4, !dbg !570
  %29 = icmp slt i32 %27, %28, !dbg !571
  br i1 %29, label %30, label %65, !dbg !572

30:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %19, metadata !573, metadata !DIExpression()), !dbg !575
  %31 = load ptr, ptr %8, align 8, !dbg !576
  %32 = load i32, ptr %17, align 4, !dbg !577
  %33 = sext i32 %32 to i64, !dbg !576
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !576
  %35 = load ptr, ptr %34, align 8, !dbg !576
  %36 = load i32, ptr %18, align 4, !dbg !578
  %37 = sext i32 %36 to i64, !dbg !576
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %35, i64 %37, !dbg !576
  store ptr %38, ptr %19, align 8, !dbg !575
  %39 = load ptr, ptr %19, align 8, !dbg !579
  %40 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i32 0, i32 0, !dbg !580
  %41 = load x86_fp80, ptr %40, align 16, !dbg !580
  store x86_fp80 %41, ptr %15, align 16, !dbg !581
  %42 = load ptr, ptr %19, align 8, !dbg !582
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %42, i32 0, i32 1, !dbg !583
  %44 = load x86_fp80, ptr %43, align 16, !dbg !583
  store x86_fp80 %44, ptr %16, align 16, !dbg !584
  call void @llvm.dbg.declare(metadata ptr %20, metadata !585, metadata !DIExpression()), !dbg !586
  %45 = load ptr, ptr %10, align 8, !dbg !587
  %46 = load ptr, ptr %9, align 8, !dbg !588
  %47 = load x86_fp80, ptr %15, align 16, !dbg !589
  %48 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %45, ptr noundef %46, x86_fp80 noundef %47), !dbg !590
  store x86_fp80 %48, ptr %20, align 16, !dbg !586
  %49 = load x86_fp80, ptr %20, align 16, !dbg !591
  %50 = load x86_fp80, ptr %16, align 16, !dbg !593
  %51 = load x86_fp80, ptr %12, align 16, !dbg !594
  %52 = fdiv x86_fp80 %51, 0xK40008666666666666800, !dbg !595
  %53 = call zeroext i1 @closeTo(x86_fp80 noundef %49, x86_fp80 noundef %50, x86_fp80 noundef %52), !dbg !596
  br i1 %53, label %54, label %61, !dbg !597

54:                                               ; preds = %30
  %55 = load x86_fp80, ptr %20, align 16, !dbg !598
  %56 = load x86_fp80, ptr %16, align 16, !dbg !599
  %57 = load x86_fp80, ptr %12, align 16, !dbg !600
  %58 = call signext i8 @yCompress(x86_fp80 noundef %55, x86_fp80 noundef %56, x86_fp80 noundef %57), !dbg !601
  %59 = load ptr, ptr %19, align 8, !dbg !602
  %60 = getelementptr inbounds %struct.CalcLangPixel, ptr %59, i32 0, i32 2, !dbg !603
  store i8 %58, ptr %60, align 16, !dbg !604
  br label %61, !dbg !602

61:                                               ; preds = %54, %30
  br label %62, !dbg !605

62:                                               ; preds = %61
  %63 = load i32, ptr %18, align 4, !dbg !606
  %64 = add nsw i32 %63, 1, !dbg !606
  store i32 %64, ptr %18, align 4, !dbg !606
  br label %26, !dbg !607, !llvm.loop !608

65:                                               ; preds = %26
  br label %66, !dbg !610

66:                                               ; preds = %65
  %67 = load i32, ptr %17, align 4, !dbg !611
  %68 = add nsw i32 %67, 1, !dbg !611
  store i32 %68, ptr %17, align 4, !dbg !611
  br label %21, !dbg !612, !llvm.loop !613

69:                                               ; preds = %21
  ret void, !dbg !615
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !616 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !619, metadata !DIExpression()), !dbg !620
  store x86_fp80 %1, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !621, metadata !DIExpression()), !dbg !622
  store x86_fp80 %2, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !625, metadata !DIExpression()), !dbg !626
  store i32 %4, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !627, metadata !DIExpression()), !dbg !628
  call void @llvm.dbg.declare(metadata ptr %11, metadata !629, metadata !DIExpression()), !dbg !630
  call void @llvm.dbg.declare(metadata ptr %12, metadata !631, metadata !DIExpression()), !dbg !632
  call void @llvm.dbg.declare(metadata ptr %13, metadata !633, metadata !DIExpression()), !dbg !635
  store i32 0, ptr %13, align 4, !dbg !635
  br label %19, !dbg !636

19:                                               ; preds = %88, %5
  %20 = load i32, ptr %13, align 4, !dbg !637
  %21 = load i32, ptr %9, align 4, !dbg !639
  %22 = icmp slt i32 %20, %21, !dbg !640
  br i1 %22, label %23, label %91, !dbg !641

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %14, metadata !642, metadata !DIExpression()), !dbg !645
  store i32 0, ptr %14, align 4, !dbg !645
  br label %24, !dbg !646

24:                                               ; preds = %84, %23
  %25 = load i32, ptr %14, align 4, !dbg !647
  %26 = load i32, ptr %10, align 4, !dbg !649
  %27 = icmp slt i32 %25, %26, !dbg !650
  br i1 %27, label %28, label %87, !dbg !651

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %15, metadata !652, metadata !DIExpression()), !dbg !654
  %29 = load ptr, ptr %6, align 8, !dbg !655
  %30 = load i32, ptr %13, align 4, !dbg !656
  %31 = sext i32 %30 to i64, !dbg !655
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31, !dbg !655
  %33 = load ptr, ptr %32, align 8, !dbg !655
  %34 = load i32, ptr %14, align 4, !dbg !657
  %35 = sext i32 %34 to i64, !dbg !655
  %36 = getelementptr inbounds %struct.CalcLangPixel, ptr %33, i64 %35, !dbg !655
  store ptr %36, ptr %15, align 8, !dbg !654
  %37 = load ptr, ptr %15, align 8, !dbg !658
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 0, !dbg !659
  %39 = load x86_fp80, ptr %38, align 16, !dbg !659
  store x86_fp80 %39, ptr %11, align 16, !dbg !660
  %40 = load ptr, ptr %15, align 8, !dbg !661
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i32 0, i32 1, !dbg !662
  %42 = load x86_fp80, ptr %41, align 16, !dbg !662
  store x86_fp80 %42, ptr %12, align 16, !dbg !663
  call void @llvm.dbg.declare(metadata ptr %16, metadata !664, metadata !DIExpression()), !dbg !665
  %43 = load x86_fp80, ptr %11, align 16, !dbg !666
  %44 = load x86_fp80, ptr %7, align 16, !dbg !667
  %45 = fdiv x86_fp80 %44, 0xK40008666666666666800, !dbg !668
  %46 = call zeroext i1 @closeTo(x86_fp80 noundef %43, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %45), !dbg !669
  %47 = zext i1 %46 to i8, !dbg !665
  store i8 %47, ptr %16, align 1, !dbg !665
  call void @llvm.dbg.declare(metadata ptr %17, metadata !670, metadata !DIExpression()), !dbg !671
  %48 = load x86_fp80, ptr %12, align 16, !dbg !672
  %49 = load x86_fp80, ptr %8, align 16, !dbg !673
  %50 = fdiv x86_fp80 %49, 0xK40008666666666666800, !dbg !674
  %51 = call zeroext i1 @closeTo(x86_fp80 noundef %48, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %50), !dbg !675
  %52 = zext i1 %51 to i8, !dbg !671
  store i8 %52, ptr %17, align 1, !dbg !671
  call void @llvm.dbg.declare(metadata ptr %18, metadata !676, metadata !DIExpression()), !dbg !677
  %53 = load i8, ptr %16, align 1, !dbg !678
  %54 = trunc i8 %53 to i1, !dbg !678
  br i1 %54, label %55, label %58, !dbg !679

55:                                               ; preds = %28
  %56 = load i8, ptr %17, align 1, !dbg !680
  %57 = trunc i8 %56 to i1, !dbg !680
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi i1 [ false, %28 ], [ %57, %55 ], !dbg !681
  %60 = zext i1 %59 to i8, !dbg !677
  store i8 %60, ptr %18, align 1, !dbg !677
  %61 = load i8, ptr %18, align 1, !dbg !682
  %62 = trunc i8 %61 to i1, !dbg !682
  br i1 %62, label %63, label %66, !dbg !684

63:                                               ; preds = %58
  %64 = load ptr, ptr %15, align 8, !dbg !685
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 2, !dbg !686
  store i8 43, ptr %65, align 16, !dbg !687
  br label %83, !dbg !685

66:                                               ; preds = %58
  %67 = load i8, ptr %16, align 1, !dbg !688
  %68 = trunc i8 %67 to i1, !dbg !688
  br i1 %68, label %69, label %72, !dbg !690

69:                                               ; preds = %66
  %70 = load ptr, ptr %15, align 8, !dbg !691
  %71 = getelementptr inbounds %struct.CalcLangPixel, ptr %70, i32 0, i32 2, !dbg !692
  store i8 124, ptr %71, align 16, !dbg !693
  br label %82, !dbg !691

72:                                               ; preds = %66
  %73 = load i8, ptr %17, align 1, !dbg !694
  %74 = trunc i8 %73 to i1, !dbg !694
  br i1 %74, label %75, label %78, !dbg !696

75:                                               ; preds = %72
  %76 = load ptr, ptr %15, align 8, !dbg !697
  %77 = getelementptr inbounds %struct.CalcLangPixel, ptr %76, i32 0, i32 2, !dbg !698
  store i8 45, ptr %77, align 16, !dbg !699
  br label %81, !dbg !697

78:                                               ; preds = %72
  %79 = load ptr, ptr %15, align 8, !dbg !700
  %80 = getelementptr inbounds %struct.CalcLangPixel, ptr %79, i32 0, i32 2, !dbg !701
  store i8 32, ptr %80, align 16, !dbg !702
  br label %81

81:                                               ; preds = %78, %75
  br label %82

82:                                               ; preds = %81, %69
  br label %83

83:                                               ; preds = %82, %63
  br label %84, !dbg !703

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4, !dbg !704
  %86 = add nsw i32 %85, 1, !dbg !704
  store i32 %86, ptr %14, align 4, !dbg !704
  br label %24, !dbg !705, !llvm.loop !706

87:                                               ; preds = %24
  br label %88, !dbg !708

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4, !dbg !709
  %90 = add nsw i32 %89, 1, !dbg !709
  store i32 %90, ptr %13, align 4, !dbg !709
  br label %19, !dbg !710, !llvm.loop !711

91:                                               ; preds = %19
  ret void, !dbg !713
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, i32 noundef %1) #0 !dbg !714 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !717, metadata !DIExpression()), !dbg !718
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !719, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.declare(metadata ptr %5, metadata !721, metadata !DIExpression()), !dbg !723
  store i32 0, ptr %5, align 4, !dbg !723
  br label %6, !dbg !724

6:                                                ; preds = %16, %2
  %7 = load i32, ptr %5, align 4, !dbg !725
  %8 = load i32, ptr %4, align 4, !dbg !727
  %9 = icmp slt i32 %7, %8, !dbg !728
  br i1 %9, label %10, label %19, !dbg !729

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8, !dbg !730
  %12 = load i32, ptr %5, align 4, !dbg !732
  %13 = sext i32 %12 to i64, !dbg !730
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13, !dbg !730
  %15 = load ptr, ptr %14, align 8, !dbg !730
  call void @free(ptr noundef %15) #8, !dbg !733
  br label %16, !dbg !734

16:                                               ; preds = %10
  %17 = load i32, ptr %5, align 4, !dbg !735
  %18 = add nsw i32 %17, 1, !dbg !735
  store i32 %18, ptr %5, align 4, !dbg !735
  br label %6, !dbg !736, !llvm.loop !737

19:                                               ; preds = %6
  %20 = load ptr, ptr %3, align 8, !dbg !739
  call void @free(ptr noundef %20) #8, !dbg !740
  ret void, !dbg !741
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !742 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !745, metadata !DIExpression()), !dbg !746
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !747, metadata !DIExpression()), !dbg !748
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !749, metadata !DIExpression()), !dbg !750
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !751, metadata !DIExpression()), !dbg !752
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !753, metadata !DIExpression()), !dbg !754
  call void @llvm.dbg.declare(metadata ptr %12, metadata !755, metadata !DIExpression()), !dbg !764
  %14 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #8, !dbg !765
  %15 = icmp eq i32 %14, -1, !dbg !767
  br i1 %15, label %16, label %17, !dbg !768

16:                                               ; preds = %5
  call void @perror(ptr noundef @.str.2) #9, !dbg !769
  store i1 false, ptr %6, align 1, !dbg !771
  br label %66, !dbg !771

17:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !772, metadata !DIExpression()), !dbg !773
  %18 = load i32, ptr %10, align 4, !dbg !774
  %19 = sitofp i32 %18 to x86_fp80, !dbg !774
  %20 = load i32, ptr %10, align 4, !dbg !775
  %21 = sitofp i32 %20 to x86_fp80, !dbg !775
  %22 = load i32, ptr %8, align 4, !dbg !776
  %23 = sitofp i32 %22 to x86_fp80, !dbg !776
  %24 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !777
  %25 = load i16, ptr %24, align 2, !dbg !777
  %26 = zext i16 %25 to i32, !dbg !778
  %27 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !779
  %28 = load i16, ptr %27, align 2, !dbg !779
  %29 = zext i16 %28 to i32, !dbg !780
  %30 = call ptr @quantifyPlane(x86_fp80 noundef %19, x86_fp80 noundef %21, x86_fp80 noundef %23, x86_fp80 noundef 0xK4002E000000000000000, i32 noundef %26, i32 noundef %29), !dbg !781
  store ptr %30, ptr %13, align 8, !dbg !773
  %31 = load ptr, ptr %13, align 8, !dbg !782
  %32 = load i32, ptr %10, align 4, !dbg !783
  %33 = sitofp i32 %32 to x86_fp80, !dbg !783
  %34 = load i32, ptr %10, align 4, !dbg !784
  %35 = sitofp i32 %34 to x86_fp80, !dbg !784
  %36 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !785
  %37 = load i16, ptr %36, align 2, !dbg !785
  %38 = zext i16 %37 to i32, !dbg !786
  %39 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !787
  %40 = load i16, ptr %39, align 2, !dbg !787
  %41 = zext i16 %40 to i32, !dbg !788
  call void @drawPlane(ptr noundef %31, x86_fp80 noundef %33, x86_fp80 noundef %35, i32 noundef %38, i32 noundef %41), !dbg !789
  %42 = load ptr, ptr %13, align 8, !dbg !790
  %43 = load ptr, ptr %11, align 8, !dbg !791
  %44 = load ptr, ptr %7, align 8, !dbg !792
  %45 = load i32, ptr %10, align 4, !dbg !793
  %46 = sitofp i32 %45 to x86_fp80, !dbg !793
  %47 = load i32, ptr %10, align 4, !dbg !794
  %48 = sitofp i32 %47 to x86_fp80, !dbg !794
  %49 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !795
  %50 = load i16, ptr %49, align 2, !dbg !795
  %51 = zext i16 %50 to i32, !dbg !796
  %52 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !797
  %53 = load i16, ptr %52, align 2, !dbg !797
  %54 = zext i16 %53 to i32, !dbg !798
  call void @drawLine(ptr noundef %42, ptr noundef %43, ptr noundef %44, x86_fp80 noundef %46, x86_fp80 noundef %48, i32 noundef %51, i32 noundef %54), !dbg !799
  %55 = load ptr, ptr %13, align 8, !dbg !800
  %56 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !801
  %57 = load i16, ptr %56, align 2, !dbg !801
  %58 = zext i16 %57 to i32, !dbg !802
  %59 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !803
  %60 = load i16, ptr %59, align 2, !dbg !803
  %61 = zext i16 %60 to i32, !dbg !804
  call void @printPlane(ptr noundef %55, i32 noundef %58, i32 noundef %61), !dbg !805
  %62 = load ptr, ptr %13, align 8, !dbg !806
  %63 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !807
  %64 = load i16, ptr %63, align 2, !dbg !807
  %65 = zext i16 %64 to i32, !dbg !808
  call void @clearDisplay(ptr noundef %62, i32 noundef %65), !dbg !809
  store i1 true, ptr %6, align 1, !dbg !810
  br label %66, !dbg !810

66:                                               ; preds = %17, %16
  %67 = load i1, ptr %6, align 1, !dbg !811
  ret i1 %67, !dbg !811
}

; Function Attrs: nounwind
declare i32 @ioctl(i32 noundef, i64 noundef, ...) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !7, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "b9b828e81192a80c6a89421920af78fe")
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
!16 = !{!0, !17, !23, !28}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !19, line: 38, type: !20, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "b9b828e81192a80c6a89421920af78fe")
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 72, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 9)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !19, line: 81, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !19, line: 157, type: !30, isLocal: true, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 104, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 13)
!33 = !{i32 7, !"Dwarf Version", i32 5}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 8, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 2}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!41 = distinct !DISubprogram(name: "closeTo", scope: !19, file: !19, line: 10, type: !42, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !11, !11, !11}
!44 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!45 = !{}
!46 = !DILocalVariable(name: "x", arg: 1, scope: !41, file: !19, line: 10, type: !11)
!47 = !DILocation(line: 10, column: 26, scope: !41)
!48 = !DILocalVariable(name: "y", arg: 2, scope: !41, file: !19, line: 10, type: !11)
!49 = !DILocation(line: 10, column: 41, scope: !41)
!50 = !DILocalVariable(name: "deviation", arg: 3, scope: !41, file: !19, line: 10, type: !11)
!51 = !DILocation(line: 10, column: 56, scope: !41)
!52 = !DILocation(line: 11, column: 16, scope: !41)
!53 = !DILocation(line: 11, column: 18, scope: !41)
!54 = !DILocation(line: 11, column: 17, scope: !41)
!55 = !DILocation(line: 11, column: 10, scope: !41)
!56 = !DILocation(line: 11, column: 23, scope: !41)
!57 = !DILocation(line: 11, column: 21, scope: !41)
!58 = !DILocation(line: 11, column: 3, scope: !41)
!59 = distinct !DISubprogram(name: "initializeDisplay", scope: !19, file: !19, line: 14, type: !60, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !15, !15}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!63 = !DILocalVariable(name: "windowHeight", arg: 1, scope: !59, file: !19, line: 14, type: !15)
!64 = !DILocation(line: 14, column: 39, scope: !59)
!65 = !DILocalVariable(name: "windowWidth", arg: 2, scope: !59, file: !19, line: 14, type: !15)
!66 = !DILocation(line: 14, column: 57, scope: !59)
!67 = !DILocalVariable(name: "display", scope: !59, file: !19, line: 15, type: !62)
!68 = !DILocation(line: 15, column: 19, scope: !59)
!69 = !DILocation(line: 15, column: 61, scope: !59)
!70 = !DILocation(line: 15, column: 59, scope: !59)
!71 = !DILocation(line: 15, column: 29, scope: !59)
!72 = !DILocation(line: 16, column: 10, scope: !59)
!73 = !DILocation(line: 16, column: 22, scope: !59)
!74 = !DILocation(line: 16, column: 3, scope: !59)
!75 = !DILocalVariable(name: "i", scope: !76, file: !19, line: 17, type: !15)
!76 = distinct !DILexicalBlock(scope: !59, file: !19, line: 17, column: 3)
!77 = !DILocation(line: 17, column: 11, scope: !76)
!78 = !DILocation(line: 17, column: 7, scope: !76)
!79 = !DILocation(line: 17, column: 18, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !19, line: 17, column: 3)
!81 = !DILocation(line: 17, column: 22, scope: !80)
!82 = !DILocation(line: 17, column: 20, scope: !80)
!83 = !DILocation(line: 17, column: 3, scope: !76)
!84 = !DILocation(line: 18, column: 65, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !19, line: 17, column: 40)
!86 = !DILocation(line: 18, column: 63, scope: !85)
!87 = !DILocation(line: 18, column: 34, scope: !85)
!88 = !DILocation(line: 18, column: 5, scope: !85)
!89 = !DILocation(line: 18, column: 13, scope: !85)
!90 = !DILocation(line: 18, column: 16, scope: !85)
!91 = !DILocation(line: 19, column: 12, scope: !85)
!92 = !DILocation(line: 19, column: 20, scope: !85)
!93 = !DILocation(line: 19, column: 27, scope: !85)
!94 = !DILocation(line: 19, column: 5, scope: !85)
!95 = !DILocation(line: 20, column: 3, scope: !85)
!96 = !DILocation(line: 17, column: 37, scope: !80)
!97 = !DILocation(line: 17, column: 3, scope: !80)
!98 = distinct !{!98, !83, !99, !100}
!99 = !DILocation(line: 20, column: 3, scope: !76)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 21, column: 10, scope: !59)
!102 = !DILocation(line: 21, column: 3, scope: !59)
!103 = distinct !DISubprogram(name: "quantifyPlane", scope: !19, file: !19, line: 24, type: !104, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!104 = !DISubroutineType(types: !105)
!105 = !{!62, !11, !11, !11, !11, !15, !15}
!106 = !DILocalVariable(name: "xSteps", arg: 1, scope: !103, file: !19, line: 24, type: !11)
!107 = !DILocation(line: 24, column: 43, scope: !103)
!108 = !DILocalVariable(name: "ySteps", arg: 2, scope: !103, file: !19, line: 24, type: !11)
!109 = !DILocation(line: 24, column: 63, scope: !103)
!110 = !DILocalVariable(name: "xMin", arg: 3, scope: !103, file: !19, line: 24, type: !11)
!111 = !DILocation(line: 24, column: 83, scope: !103)
!112 = !DILocalVariable(name: "yMax", arg: 4, scope: !103, file: !19, line: 24, type: !11)
!113 = !DILocation(line: 24, column: 101, scope: !103)
!114 = !DILocalVariable(name: "windowHeight", arg: 5, scope: !103, file: !19, line: 24, type: !15)
!115 = !DILocation(line: 24, column: 111, scope: !103)
!116 = !DILocalVariable(name: "windowWidth", arg: 6, scope: !103, file: !19, line: 24, type: !15)
!117 = !DILocation(line: 24, column: 129, scope: !103)
!118 = !DILocalVariable(name: "display", scope: !103, file: !19, line: 25, type: !62)
!119 = !DILocation(line: 25, column: 19, scope: !103)
!120 = !DILocation(line: 25, column: 47, scope: !103)
!121 = !DILocation(line: 25, column: 61, scope: !103)
!122 = !DILocation(line: 25, column: 29, scope: !103)
!123 = !DILocalVariable(name: "y", scope: !124, file: !19, line: 27, type: !15)
!124 = distinct !DILexicalBlock(scope: !103, file: !19, line: 27, column: 3)
!125 = !DILocation(line: 27, column: 11, scope: !124)
!126 = !DILocation(line: 27, column: 7, scope: !124)
!127 = !DILocation(line: 27, column: 18, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !19, line: 27, column: 3)
!129 = !DILocation(line: 27, column: 22, scope: !128)
!130 = !DILocation(line: 27, column: 20, scope: !128)
!131 = !DILocation(line: 27, column: 3, scope: !124)
!132 = !DILocalVariable(name: "x", scope: !133, file: !19, line: 28, type: !15)
!133 = distinct !DILexicalBlock(scope: !134, file: !19, line: 28, column: 5)
!134 = distinct !DILexicalBlock(scope: !128, file: !19, line: 27, column: 40)
!135 = !DILocation(line: 28, column: 13, scope: !133)
!136 = !DILocation(line: 28, column: 9, scope: !133)
!137 = !DILocation(line: 28, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !19, line: 28, column: 5)
!139 = !DILocation(line: 28, column: 24, scope: !138)
!140 = !DILocation(line: 28, column: 22, scope: !138)
!141 = !DILocation(line: 28, column: 5, scope: !133)
!142 = !DILocation(line: 29, column: 26, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !19, line: 28, column: 41)
!144 = !DILocation(line: 29, column: 34, scope: !143)
!145 = !DILocation(line: 29, column: 43, scope: !143)
!146 = !DILocation(line: 29, column: 31, scope: !143)
!147 = !DILocation(line: 29, column: 7, scope: !143)
!148 = !DILocation(line: 29, column: 15, scope: !143)
!149 = !DILocation(line: 29, column: 18, scope: !143)
!150 = !DILocation(line: 29, column: 21, scope: !143)
!151 = !DILocation(line: 29, column: 23, scope: !143)
!152 = !DILocation(line: 30, column: 26, scope: !143)
!153 = !DILocation(line: 30, column: 34, scope: !143)
!154 = !DILocation(line: 30, column: 43, scope: !143)
!155 = !DILocation(line: 30, column: 31, scope: !143)
!156 = !DILocation(line: 30, column: 7, scope: !143)
!157 = !DILocation(line: 30, column: 15, scope: !143)
!158 = !DILocation(line: 30, column: 18, scope: !143)
!159 = !DILocation(line: 30, column: 21, scope: !143)
!160 = !DILocation(line: 30, column: 23, scope: !143)
!161 = !DILocation(line: 31, column: 5, scope: !143)
!162 = !DILocation(line: 28, column: 38, scope: !138)
!163 = !DILocation(line: 28, column: 5, scope: !138)
!164 = distinct !{!164, !141, !165, !100}
!165 = !DILocation(line: 31, column: 5, scope: !133)
!166 = !DILocation(line: 32, column: 3, scope: !134)
!167 = !DILocation(line: 27, column: 37, scope: !128)
!168 = !DILocation(line: 27, column: 3, scope: !128)
!169 = distinct !{!169, !131, !170, !100}
!170 = !DILocation(line: 32, column: 3, scope: !124)
!171 = !DILocation(line: 34, column: 10, scope: !103)
!172 = !DILocation(line: 34, column: 3, scope: !103)
!173 = distinct !DISubprogram(name: "yCompress", scope: !19, file: !19, line: 37, type: !174, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!174 = !DISubroutineType(types: !175)
!175 = !{!14, !11, !11, !11}
!176 = !DILocalVariable(name: "num", arg: 1, scope: !173, file: !19, line: 37, type: !11)
!177 = !DILocation(line: 37, column: 28, scope: !173)
!178 = !DILocalVariable(name: "pixel", arg: 2, scope: !173, file: !19, line: 37, type: !11)
!179 = !DILocation(line: 37, column: 45, scope: !173)
!180 = !DILocalVariable(name: "range", arg: 3, scope: !173, file: !19, line: 37, type: !11)
!181 = !DILocation(line: 37, column: 64, scope: !173)
!182 = !DILocalVariable(name: "table", scope: !173, file: !19, line: 38, type: !183)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!184 = !DILocation(line: 38, column: 9, scope: !173)
!185 = !DILocalVariable(name: "steps", scope: !173, file: !19, line: 41, type: !11)
!186 = !DILocation(line: 41, column: 15, scope: !173)
!187 = !DILocation(line: 41, column: 23, scope: !173)
!188 = !DILocation(line: 41, column: 28, scope: !173)
!189 = !DILocalVariable(name: "goal", scope: !173, file: !19, line: 43, type: !11)
!190 = !DILocation(line: 43, column: 15, scope: !173)
!191 = !DILocation(line: 43, column: 22, scope: !173)
!192 = !DILocation(line: 43, column: 29, scope: !173)
!193 = !DILocation(line: 43, column: 38, scope: !173)
!194 = !DILocation(line: 43, column: 43, scope: !173)
!195 = !DILocation(line: 43, column: 35, scope: !173)
!196 = !DILocation(line: 43, column: 26, scope: !173)
!197 = !DILocalVariable(name: "counter", scope: !173, file: !19, line: 44, type: !15)
!198 = !DILocation(line: 44, column: 7, scope: !173)
!199 = !DILocalVariable(name: "step", scope: !173, file: !19, line: 45, type: !11)
!200 = !DILocation(line: 45, column: 15, scope: !173)
!201 = !DILocation(line: 46, column: 3, scope: !173)
!202 = !DILocation(line: 46, column: 9, scope: !173)
!203 = !DILocation(line: 46, column: 16, scope: !173)
!204 = !DILocation(line: 46, column: 14, scope: !173)
!205 = !DILocation(line: 47, column: 15, scope: !206)
!206 = distinct !DILexicalBlock(scope: !173, file: !19, line: 46, column: 22)
!207 = !DILocation(line: 47, column: 12, scope: !206)
!208 = !DILocation(line: 48, column: 14, scope: !206)
!209 = distinct !{!209, !201, !210, !100}
!210 = !DILocation(line: 49, column: 3, scope: !173)
!211 = !DILocation(line: 50, column: 10, scope: !173)
!212 = !DILocation(line: 50, column: 16, scope: !173)
!213 = !DILocation(line: 50, column: 24, scope: !173)
!214 = !DILocation(line: 50, column: 3, scope: !173)
!215 = distinct !DISubprogram(name: "printPlane", scope: !19, file: !19, line: 53, type: !216, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!216 = !DISubroutineType(types: !217)
!217 = !{null, !62, !15, !15}
!218 = !DILocalVariable(name: "display", arg: 1, scope: !215, file: !19, line: 53, type: !62)
!219 = !DILocation(line: 53, column: 33, scope: !215)
!220 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !215, file: !19, line: 53, type: !15)
!221 = !DILocation(line: 53, column: 46, scope: !215)
!222 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !215, file: !19, line: 53, type: !15)
!223 = !DILocation(line: 53, column: 64, scope: !215)
!224 = !DILocalVariable(name: "output", scope: !215, file: !19, line: 54, type: !225)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!226 = !DILocation(line: 54, column: 10, scope: !215)
!227 = !DILocation(line: 54, column: 42, scope: !215)
!228 = !DILocation(line: 54, column: 40, scope: !215)
!229 = !DILocation(line: 54, column: 55, scope: !215)
!230 = !DILocation(line: 54, column: 19, scope: !215)
!231 = !DILocalVariable(name: "i", scope: !232, file: !19, line: 55, type: !15)
!232 = distinct !DILexicalBlock(scope: !215, file: !19, line: 55, column: 3)
!233 = !DILocation(line: 55, column: 11, scope: !232)
!234 = !DILocation(line: 55, column: 7, scope: !232)
!235 = !DILocation(line: 55, column: 18, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !19, line: 55, column: 3)
!237 = !DILocation(line: 55, column: 22, scope: !236)
!238 = !DILocation(line: 55, column: 20, scope: !236)
!239 = !DILocation(line: 55, column: 3, scope: !232)
!240 = !DILocation(line: 56, column: 39, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !19, line: 55, column: 40)
!242 = !DILocation(line: 56, column: 37, scope: !241)
!243 = !DILocation(line: 56, column: 51, scope: !241)
!244 = !DILocation(line: 56, column: 17, scope: !241)
!245 = !DILocation(line: 56, column: 5, scope: !241)
!246 = !DILocation(line: 56, column: 12, scope: !241)
!247 = !DILocation(line: 56, column: 15, scope: !241)
!248 = !DILocation(line: 57, column: 3, scope: !241)
!249 = !DILocation(line: 55, column: 37, scope: !236)
!250 = !DILocation(line: 55, column: 3, scope: !236)
!251 = distinct !{!251, !239, !252, !100}
!252 = !DILocation(line: 57, column: 3, scope: !232)
!253 = !DILocalVariable(name: "y", scope: !254, file: !19, line: 59, type: !15)
!254 = distinct !DILexicalBlock(scope: !215, file: !19, line: 59, column: 3)
!255 = !DILocation(line: 59, column: 11, scope: !254)
!256 = !DILocation(line: 59, column: 7, scope: !254)
!257 = !DILocation(line: 59, column: 18, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !19, line: 59, column: 3)
!259 = !DILocation(line: 59, column: 22, scope: !258)
!260 = !DILocation(line: 59, column: 20, scope: !258)
!261 = !DILocation(line: 59, column: 3, scope: !254)
!262 = !DILocalVariable(name: "x", scope: !263, file: !19, line: 60, type: !15)
!263 = distinct !DILexicalBlock(scope: !264, file: !19, line: 60, column: 5)
!264 = distinct !DILexicalBlock(scope: !258, file: !19, line: 59, column: 41)
!265 = !DILocation(line: 60, column: 13, scope: !263)
!266 = !DILocation(line: 60, column: 9, scope: !263)
!267 = !DILocation(line: 60, column: 20, scope: !268)
!268 = distinct !DILexicalBlock(scope: !263, file: !19, line: 60, column: 5)
!269 = !DILocation(line: 60, column: 24, scope: !268)
!270 = !DILocation(line: 60, column: 22, scope: !268)
!271 = !DILocation(line: 60, column: 5, scope: !263)
!272 = !DILocation(line: 61, column: 24, scope: !268)
!273 = !DILocation(line: 61, column: 32, scope: !268)
!274 = !DILocation(line: 61, column: 35, scope: !268)
!275 = !DILocation(line: 61, column: 38, scope: !268)
!276 = !DILocation(line: 61, column: 22, scope: !268)
!277 = !DILocation(line: 61, column: 7, scope: !268)
!278 = !DILocation(line: 61, column: 14, scope: !268)
!279 = !DILocation(line: 61, column: 17, scope: !268)
!280 = !DILocation(line: 61, column: 20, scope: !268)
!281 = !DILocation(line: 60, column: 38, scope: !268)
!282 = !DILocation(line: 60, column: 5, scope: !268)
!283 = distinct !{!283, !271, !284, !100}
!284 = !DILocation(line: 61, column: 38, scope: !263)
!285 = !DILocation(line: 62, column: 5, scope: !264)
!286 = !DILocation(line: 62, column: 12, scope: !264)
!287 = !DILocation(line: 62, column: 15, scope: !264)
!288 = !DILocation(line: 62, column: 28, scope: !264)
!289 = !DILocation(line: 63, column: 3, scope: !264)
!290 = !DILocation(line: 59, column: 37, scope: !258)
!291 = !DILocation(line: 59, column: 3, scope: !258)
!292 = distinct !{!292, !261, !293, !100}
!293 = !DILocation(line: 63, column: 3, scope: !254)
!294 = !DILocalVariable(name: "y", scope: !295, file: !19, line: 65, type: !15)
!295 = distinct !DILexicalBlock(scope: !215, file: !19, line: 65, column: 3)
!296 = !DILocation(line: 65, column: 11, scope: !295)
!297 = !DILocation(line: 65, column: 7, scope: !295)
!298 = !DILocation(line: 65, column: 18, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !19, line: 65, column: 3)
!300 = !DILocation(line: 65, column: 22, scope: !299)
!301 = !DILocation(line: 65, column: 20, scope: !299)
!302 = !DILocation(line: 65, column: 3, scope: !295)
!303 = !DILocation(line: 66, column: 10, scope: !299)
!304 = !DILocation(line: 66, column: 17, scope: !299)
!305 = !DILocation(line: 66, column: 5, scope: !299)
!306 = !DILocation(line: 65, column: 37, scope: !299)
!307 = !DILocation(line: 65, column: 3, scope: !299)
!308 = distinct !{!308, !302, !309, !100}
!309 = !DILocation(line: 66, column: 19, scope: !295)
!310 = !DILocalVariable(name: "i", scope: !311, file: !19, line: 68, type: !15)
!311 = distinct !DILexicalBlock(scope: !215, file: !19, line: 68, column: 3)
!312 = !DILocation(line: 68, column: 11, scope: !311)
!313 = !DILocation(line: 68, column: 7, scope: !311)
!314 = !DILocation(line: 68, column: 18, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !19, line: 68, column: 3)
!316 = !DILocation(line: 68, column: 22, scope: !315)
!317 = !DILocation(line: 68, column: 20, scope: !315)
!318 = !DILocation(line: 68, column: 3, scope: !311)
!319 = !DILocation(line: 69, column: 10, scope: !315)
!320 = !DILocation(line: 69, column: 17, scope: !315)
!321 = !DILocation(line: 69, column: 5, scope: !315)
!322 = !DILocation(line: 68, column: 37, scope: !315)
!323 = !DILocation(line: 68, column: 3, scope: !315)
!324 = distinct !{!324, !318, !325, !100}
!325 = !DILocation(line: 69, column: 19, scope: !311)
!326 = !DILocation(line: 70, column: 8, scope: !215)
!327 = !DILocation(line: 70, column: 3, scope: !215)
!328 = !DILocation(line: 71, column: 1, scope: !215)
!329 = distinct !DISubprogram(name: "calcLangValueFuncWrapper", scope: !19, file: !19, line: 73, type: !330, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!330 = !DISubroutineType(types: !331)
!331 = !{!11, !332, !341, !11}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !333, size: 64)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !334, line: 8, baseType: !335)
!334 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!335 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !334, line: 4, size: 128, elements: !336)
!336 = !{!337, !338, !340}
!337 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !335, file: !334, line: 5, baseType: !183, size: 64)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !335, file: !334, line: 6, baseType: !339, size: 32, offset: 64)
!339 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !335, file: !334, line: 7, baseType: !15, size: 32, offset: 96)
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !342, size: 64)
!342 = !DISubroutineType(types: !343)
!343 = !{!344, !332, !344}
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !346, line: 40, baseType: !347)
!346 = !DIFile(filename: "lib/include/c/CalcLangCInt.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "fc06603ba024469da7212531580c966f")
!347 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !346, line: 37, size: 128, elements: !348)
!348 = !{!349, !350}
!349 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !347, file: !346, line: 38, baseType: !15, size: 32)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !347, file: !346, line: 39, baseType: !351, size: 64, offset: 64)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !346, line: 35, baseType: !352)
!352 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !346, line: 27, size: 64, elements: !353)
!353 = !{!354, !363, !370, !371, !373, !374, !375}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !352, file: !346, line: 28, baseType: !355, size: 64)
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 64)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !346, line: 20, baseType: !357)
!357 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !346, line: 17, size: 128, elements: !358)
!358 = !{!359, !360}
!359 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !357, file: !346, line: 18, baseType: !15, size: 32)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !357, file: !346, line: 19, baseType: !361, size: 64, offset: 64)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !352, file: !346, line: 29, baseType: !364, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !346, line: 25, baseType: !366)
!366 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !346, line: 22, size: 128, elements: !367)
!367 = !{!368, !369}
!368 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !366, file: !346, line: 23, baseType: !15, size: 32)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !366, file: !346, line: 24, baseType: !361, size: 64, offset: 64)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !352, file: !346, line: 30, baseType: !15, size: 32)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !352, file: !346, line: 31, baseType: !372, size: 64)
!372 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !352, file: !346, line: 32, baseType: !372, size: 64)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !352, file: !346, line: 33, baseType: !372, size: 64)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !352, file: !346, line: 34, baseType: !44, size: 8)
!376 = !DILocalVariable(name: "arena", arg: 1, scope: !329, file: !19, line: 73, type: !332)
!377 = !DILocation(line: 73, column: 52, scope: !329)
!378 = !DILocalVariable(name: "valFunc", arg: 2, scope: !329, file: !19, line: 73, type: !341)
!379 = !DILocation(line: 73, column: 76, scope: !329)
!380 = !DILocalVariable(name: "val", arg: 3, scope: !329, file: !19, line: 73, type: !11)
!381 = !DILocation(line: 73, column: 129, scope: !329)
!382 = !DILocalVariable(name: "cVal", scope: !329, file: !19, line: 74, type: !344)
!383 = !DILocation(line: 74, column: 18, scope: !329)
!384 = !DILocation(line: 74, column: 36, scope: !329)
!385 = !DILocation(line: 74, column: 25, scope: !329)
!386 = !DILocation(line: 75, column: 3, scope: !329)
!387 = !DILocation(line: 75, column: 9, scope: !329)
!388 = !DILocation(line: 75, column: 17, scope: !329)
!389 = !DILocation(line: 76, column: 32, scope: !329)
!390 = !DILocation(line: 76, column: 27, scope: !329)
!391 = !DILocation(line: 76, column: 3, scope: !329)
!392 = !DILocation(line: 76, column: 9, scope: !329)
!393 = !DILocation(line: 76, column: 25, scope: !329)
!394 = !DILocalVariable(name: "res", scope: !329, file: !19, line: 77, type: !344)
!395 = !DILocation(line: 77, column: 18, scope: !329)
!396 = !DILocation(line: 77, column: 24, scope: !329)
!397 = !DILocation(line: 77, column: 32, scope: !329)
!398 = !DILocation(line: 77, column: 39, scope: !329)
!399 = !DILocation(line: 78, column: 6, scope: !400)
!400 = distinct !DILexicalBlock(scope: !329, file: !19, line: 78, column: 6)
!401 = !DILocation(line: 78, column: 11, scope: !400)
!402 = !DILocation(line: 78, column: 19, scope: !400)
!403 = !DILocation(line: 78, column: 6, scope: !329)
!404 = !DILocation(line: 79, column: 26, scope: !400)
!405 = !DILocation(line: 79, column: 31, scope: !400)
!406 = !DILocation(line: 79, column: 39, scope: !400)
!407 = !DILocation(line: 79, column: 12, scope: !400)
!408 = !DILocation(line: 79, column: 5, scope: !400)
!409 = !DILocation(line: 81, column: 5, scope: !410)
!410 = distinct !DILexicalBlock(scope: !400, file: !19, line: 80, column: 8)
!411 = !DILocation(line: 82, column: 5, scope: !410)
!412 = !DILocation(line: 84, column: 1, scope: !329)
!413 = distinct !DISubprogram(name: "shadeGraph", scope: !19, file: !19, line: 86, type: !414, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!414 = !DISubroutineType(types: !415)
!415 = !{null, !62, !341, !332, !11, !11, !11, !11, !15, !15}
!416 = !DILocalVariable(name: "display", arg: 1, scope: !413, file: !19, line: 86, type: !62)
!417 = !DILocation(line: 86, column: 33, scope: !413)
!418 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !413, file: !19, line: 86, type: !341)
!419 = !DILocation(line: 86, column: 59, scope: !413)
!420 = !DILocalVariable(name: "arena", arg: 3, scope: !413, file: !19, line: 86, type: !332)
!421 = !DILocation(line: 86, column: 114, scope: !413)
!422 = !DILocalVariable(name: "xSteps", arg: 4, scope: !413, file: !19, line: 86, type: !11)
!423 = !DILocation(line: 86, column: 133, scope: !413)
!424 = !DILocalVariable(name: "ySteps", arg: 5, scope: !413, file: !19, line: 86, type: !11)
!425 = !DILocation(line: 86, column: 153, scope: !413)
!426 = !DILocalVariable(name: "leftBound", arg: 6, scope: !413, file: !19, line: 86, type: !11)
!427 = !DILocation(line: 86, column: 173, scope: !413)
!428 = !DILocalVariable(name: "rightBound", arg: 7, scope: !413, file: !19, line: 86, type: !11)
!429 = !DILocation(line: 86, column: 196, scope: !413)
!430 = !DILocalVariable(name: "windowHeight", arg: 8, scope: !413, file: !19, line: 86, type: !15)
!431 = !DILocation(line: 86, column: 212, scope: !413)
!432 = !DILocalVariable(name: "windowWidth", arg: 9, scope: !413, file: !19, line: 86, type: !15)
!433 = !DILocation(line: 86, column: 230, scope: !413)
!434 = !DILocalVariable(name: "relX", scope: !413, file: !19, line: 87, type: !11)
!435 = !DILocation(line: 87, column: 15, scope: !413)
!436 = !DILocalVariable(name: "relY", scope: !413, file: !19, line: 87, type: !11)
!437 = !DILocation(line: 87, column: 21, scope: !413)
!438 = !DILocalVariable(name: "y", scope: !439, file: !19, line: 89, type: !15)
!439 = distinct !DILexicalBlock(scope: !413, file: !19, line: 89, column: 3)
!440 = !DILocation(line: 89, column: 11, scope: !439)
!441 = !DILocation(line: 89, column: 7, scope: !439)
!442 = !DILocation(line: 89, column: 18, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !19, line: 89, column: 3)
!444 = !DILocation(line: 89, column: 22, scope: !443)
!445 = !DILocation(line: 89, column: 20, scope: !443)
!446 = !DILocation(line: 89, column: 3, scope: !439)
!447 = !DILocalVariable(name: "x", scope: !448, file: !19, line: 90, type: !15)
!448 = distinct !DILexicalBlock(scope: !449, file: !19, line: 90, column: 5)
!449 = distinct !DILexicalBlock(scope: !443, file: !19, line: 89, column: 40)
!450 = !DILocation(line: 90, column: 13, scope: !448)
!451 = !DILocation(line: 90, column: 9, scope: !448)
!452 = !DILocation(line: 90, column: 20, scope: !453)
!453 = distinct !DILexicalBlock(scope: !448, file: !19, line: 90, column: 5)
!454 = !DILocation(line: 90, column: 24, scope: !453)
!455 = !DILocation(line: 90, column: 22, scope: !453)
!456 = !DILocation(line: 90, column: 5, scope: !448)
!457 = !DILocalVariable(name: "pixel", scope: !458, file: !19, line: 91, type: !5)
!458 = distinct !DILexicalBlock(scope: !453, file: !19, line: 90, column: 41)
!459 = !DILocation(line: 91, column: 22, scope: !458)
!460 = !DILocation(line: 91, column: 32, scope: !458)
!461 = !DILocation(line: 91, column: 40, scope: !458)
!462 = !DILocation(line: 91, column: 43, scope: !458)
!463 = !DILocation(line: 93, column: 14, scope: !458)
!464 = !DILocation(line: 93, column: 21, scope: !458)
!465 = !DILocation(line: 93, column: 12, scope: !458)
!466 = !DILocation(line: 94, column: 14, scope: !458)
!467 = !DILocation(line: 94, column: 21, scope: !458)
!468 = !DILocation(line: 94, column: 12, scope: !458)
!469 = !DILocalVariable(name: "output", scope: !458, file: !19, line: 96, type: !11)
!470 = !DILocation(line: 96, column: 19, scope: !458)
!471 = !DILocation(line: 96, column: 53, scope: !458)
!472 = !DILocation(line: 96, column: 60, scope: !458)
!473 = !DILocation(line: 96, column: 70, scope: !458)
!474 = !DILocation(line: 96, column: 28, scope: !458)
!475 = !DILocation(line: 97, column: 18, scope: !476)
!476 = distinct !DILexicalBlock(scope: !458, file: !19, line: 97, column: 10)
!477 = !DILocation(line: 97, column: 26, scope: !476)
!478 = !DILocation(line: 97, column: 32, scope: !476)
!479 = !DILocation(line: 97, column: 38, scope: !476)
!480 = !DILocation(line: 97, column: 10, scope: !476)
!481 = !DILocation(line: 97, column: 10, scope: !458)
!482 = !DILocation(line: 98, column: 29, scope: !476)
!483 = !DILocation(line: 98, column: 37, scope: !476)
!484 = !DILocation(line: 98, column: 43, scope: !476)
!485 = !DILocation(line: 98, column: 19, scope: !476)
!486 = !DILocation(line: 98, column: 2, scope: !476)
!487 = !DILocation(line: 98, column: 9, scope: !476)
!488 = !DILocation(line: 98, column: 17, scope: !476)
!489 = !DILocation(line: 99, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !476, file: !19, line: 99, column: 15)
!491 = !DILocation(line: 99, column: 24, scope: !490)
!492 = !DILocation(line: 99, column: 105, scope: !490)
!493 = !DILocation(line: 99, column: 32, scope: !490)
!494 = !DILocation(line: 99, column: 39, scope: !490)
!495 = !DILocation(line: 99, column: 45, scope: !490)
!496 = !DILocation(line: 99, column: 37, scope: !490)
!497 = !DILocation(line: 99, column: 48, scope: !490)
!498 = !DILocation(line: 99, column: 51, scope: !490)
!499 = !DILocation(line: 99, column: 58, scope: !490)
!500 = !DILocation(line: 99, column: 56, scope: !490)
!501 = !DILocation(line: 99, column: 16, scope: !490)
!502 = !DILocation(line: 99, column: 69, scope: !490)
!503 = !DILocation(line: 99, column: 77, scope: !490)
!504 = !DILocation(line: 99, column: 76, scope: !490)
!505 = !DILocation(line: 99, column: 83, scope: !490)
!506 = !DILocation(line: 99, column: 74, scope: !490)
!507 = !DILocation(line: 99, column: 86, scope: !490)
!508 = !DILocation(line: 99, column: 89, scope: !490)
!509 = !DILocation(line: 99, column: 96, scope: !490)
!510 = !DILocation(line: 99, column: 94, scope: !490)
!511 = !DILocation(line: 99, column: 109, scope: !490)
!512 = !DILocation(line: 99, column: 116, scope: !490)
!513 = !DILocation(line: 99, column: 114, scope: !490)
!514 = !DILocation(line: 99, column: 126, scope: !490)
!515 = !DILocation(line: 99, column: 129, scope: !490)
!516 = !DILocation(line: 99, column: 136, scope: !490)
!517 = !DILocation(line: 99, column: 134, scope: !490)
!518 = !DILocation(line: 99, column: 15, scope: !476)
!519 = !DILocation(line: 100, column: 2, scope: !490)
!520 = !DILocation(line: 100, column: 9, scope: !490)
!521 = !DILocation(line: 100, column: 17, scope: !490)
!522 = !DILocation(line: 101, column: 5, scope: !458)
!523 = !DILocation(line: 90, column: 38, scope: !453)
!524 = !DILocation(line: 90, column: 5, scope: !453)
!525 = distinct !{!525, !456, !526, !100}
!526 = !DILocation(line: 101, column: 5, scope: !448)
!527 = !DILocation(line: 102, column: 3, scope: !449)
!528 = !DILocation(line: 89, column: 37, scope: !443)
!529 = !DILocation(line: 89, column: 3, scope: !443)
!530 = distinct !{!530, !446, !531, !100}
!531 = !DILocation(line: 102, column: 3, scope: !439)
!532 = !DILocation(line: 103, column: 1, scope: !413)
!533 = distinct !DISubprogram(name: "drawLine", scope: !19, file: !19, line: 105, type: !534, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!534 = !DISubroutineType(types: !535)
!535 = !{null, !62, !341, !332, !11, !11, !15, !15}
!536 = !DILocalVariable(name: "display", arg: 1, scope: !533, file: !19, line: 105, type: !62)
!537 = !DILocation(line: 105, column: 31, scope: !533)
!538 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !533, file: !19, line: 105, type: !341)
!539 = !DILocation(line: 105, column: 57, scope: !533)
!540 = !DILocalVariable(name: "arena", arg: 3, scope: !533, file: !19, line: 105, type: !332)
!541 = !DILocation(line: 105, column: 112, scope: !533)
!542 = !DILocalVariable(name: "xSteps", arg: 4, scope: !533, file: !19, line: 105, type: !11)
!543 = !DILocation(line: 105, column: 131, scope: !533)
!544 = !DILocalVariable(name: "ySteps", arg: 5, scope: !533, file: !19, line: 105, type: !11)
!545 = !DILocation(line: 105, column: 151, scope: !533)
!546 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !533, file: !19, line: 105, type: !15)
!547 = !DILocation(line: 105, column: 163, scope: !533)
!548 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !533, file: !19, line: 105, type: !15)
!549 = !DILocation(line: 105, column: 181, scope: !533)
!550 = !DILocalVariable(name: "relX", scope: !533, file: !19, line: 106, type: !11)
!551 = !DILocation(line: 106, column: 15, scope: !533)
!552 = !DILocalVariable(name: "relY", scope: !533, file: !19, line: 106, type: !11)
!553 = !DILocation(line: 106, column: 21, scope: !533)
!554 = !DILocalVariable(name: "y", scope: !555, file: !19, line: 108, type: !15)
!555 = distinct !DILexicalBlock(scope: !533, file: !19, line: 108, column: 5)
!556 = !DILocation(line: 108, column: 13, scope: !555)
!557 = !DILocation(line: 108, column: 9, scope: !555)
!558 = !DILocation(line: 108, column: 20, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !19, line: 108, column: 5)
!560 = !DILocation(line: 108, column: 24, scope: !559)
!561 = !DILocation(line: 108, column: 22, scope: !559)
!562 = !DILocation(line: 108, column: 5, scope: !555)
!563 = !DILocalVariable(name: "x", scope: !564, file: !19, line: 109, type: !15)
!564 = distinct !DILexicalBlock(scope: !565, file: !19, line: 109, column: 9)
!565 = distinct !DILexicalBlock(scope: !559, file: !19, line: 108, column: 44)
!566 = !DILocation(line: 109, column: 17, scope: !564)
!567 = !DILocation(line: 109, column: 13, scope: !564)
!568 = !DILocation(line: 109, column: 24, scope: !569)
!569 = distinct !DILexicalBlock(scope: !564, file: !19, line: 109, column: 9)
!570 = !DILocation(line: 109, column: 28, scope: !569)
!571 = !DILocation(line: 109, column: 26, scope: !569)
!572 = !DILocation(line: 109, column: 9, scope: !564)
!573 = !DILocalVariable(name: "pixel", scope: !574, file: !19, line: 110, type: !5)
!574 = distinct !DILexicalBlock(scope: !569, file: !19, line: 109, column: 47)
!575 = !DILocation(line: 110, column: 21, scope: !574)
!576 = !DILocation(line: 110, column: 31, scope: !574)
!577 = !DILocation(line: 110, column: 39, scope: !574)
!578 = !DILocation(line: 110, column: 42, scope: !574)
!579 = !DILocation(line: 111, column: 20, scope: !574)
!580 = !DILocation(line: 111, column: 27, scope: !574)
!581 = !DILocation(line: 111, column: 18, scope: !574)
!582 = !DILocation(line: 112, column: 20, scope: !574)
!583 = !DILocation(line: 112, column: 27, scope: !574)
!584 = !DILocation(line: 112, column: 18, scope: !574)
!585 = !DILocalVariable(name: "output", scope: !574, file: !19, line: 114, type: !11)
!586 = !DILocation(line: 114, column: 25, scope: !574)
!587 = !DILocation(line: 114, column: 59, scope: !574)
!588 = !DILocation(line: 114, column: 66, scope: !574)
!589 = !DILocation(line: 114, column: 76, scope: !574)
!590 = !DILocation(line: 114, column: 34, scope: !574)
!591 = !DILocation(line: 115, column: 24, scope: !592)
!592 = distinct !DILexicalBlock(scope: !574, file: !19, line: 115, column: 16)
!593 = !DILocation(line: 115, column: 32, scope: !592)
!594 = !DILocation(line: 115, column: 38, scope: !592)
!595 = !DILocation(line: 115, column: 44, scope: !592)
!596 = !DILocation(line: 115, column: 16, scope: !592)
!597 = !DILocation(line: 115, column: 16, scope: !574)
!598 = !DILocation(line: 116, column: 35, scope: !592)
!599 = !DILocation(line: 116, column: 43, scope: !592)
!600 = !DILocation(line: 116, column: 49, scope: !592)
!601 = !DILocation(line: 116, column: 25, scope: !592)
!602 = !DILocation(line: 116, column: 8, scope: !592)
!603 = !DILocation(line: 116, column: 15, scope: !592)
!604 = !DILocation(line: 116, column: 23, scope: !592)
!605 = !DILocation(line: 117, column: 9, scope: !574)
!606 = !DILocation(line: 109, column: 43, scope: !569)
!607 = !DILocation(line: 109, column: 9, scope: !569)
!608 = distinct !{!608, !572, !609, !100}
!609 = !DILocation(line: 117, column: 9, scope: !564)
!610 = !DILocation(line: 118, column: 5, scope: !565)
!611 = !DILocation(line: 108, column: 40, scope: !559)
!612 = !DILocation(line: 108, column: 5, scope: !559)
!613 = distinct !{!613, !562, !614, !100}
!614 = !DILocation(line: 118, column: 5, scope: !555)
!615 = !DILocation(line: 119, column: 1, scope: !533)
!616 = distinct !DISubprogram(name: "drawPlane", scope: !19, file: !19, line: 121, type: !617, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!617 = !DISubroutineType(types: !618)
!618 = !{null, !62, !11, !11, !15, !15}
!619 = !DILocalVariable(name: "display", arg: 1, scope: !616, file: !19, line: 121, type: !62)
!620 = !DILocation(line: 121, column: 32, scope: !616)
!621 = !DILocalVariable(name: "xSteps", arg: 2, scope: !616, file: !19, line: 121, type: !11)
!622 = !DILocation(line: 121, column: 53, scope: !616)
!623 = !DILocalVariable(name: "ySteps", arg: 3, scope: !616, file: !19, line: 121, type: !11)
!624 = !DILocation(line: 121, column: 73, scope: !616)
!625 = !DILocalVariable(name: "windowHeight", arg: 4, scope: !616, file: !19, line: 121, type: !15)
!626 = !DILocation(line: 121, column: 85, scope: !616)
!627 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !616, file: !19, line: 121, type: !15)
!628 = !DILocation(line: 121, column: 103, scope: !616)
!629 = !DILocalVariable(name: "relX", scope: !616, file: !19, line: 122, type: !11)
!630 = !DILocation(line: 122, column: 15, scope: !616)
!631 = !DILocalVariable(name: "relY", scope: !616, file: !19, line: 122, type: !11)
!632 = !DILocation(line: 122, column: 21, scope: !616)
!633 = !DILocalVariable(name: "y", scope: !634, file: !19, line: 123, type: !15)
!634 = distinct !DILexicalBlock(scope: !616, file: !19, line: 123, column: 5)
!635 = !DILocation(line: 123, column: 13, scope: !634)
!636 = !DILocation(line: 123, column: 9, scope: !634)
!637 = !DILocation(line: 123, column: 20, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !19, line: 123, column: 5)
!639 = !DILocation(line: 123, column: 24, scope: !638)
!640 = !DILocation(line: 123, column: 22, scope: !638)
!641 = !DILocation(line: 123, column: 5, scope: !634)
!642 = !DILocalVariable(name: "x", scope: !643, file: !19, line: 124, type: !15)
!643 = distinct !DILexicalBlock(scope: !644, file: !19, line: 124, column: 9)
!644 = distinct !DILexicalBlock(scope: !638, file: !19, line: 123, column: 43)
!645 = !DILocation(line: 124, column: 17, scope: !643)
!646 = !DILocation(line: 124, column: 13, scope: !643)
!647 = !DILocation(line: 124, column: 24, scope: !648)
!648 = distinct !DILexicalBlock(scope: !643, file: !19, line: 124, column: 9)
!649 = !DILocation(line: 124, column: 28, scope: !648)
!650 = !DILocation(line: 124, column: 26, scope: !648)
!651 = !DILocation(line: 124, column: 9, scope: !643)
!652 = !DILocalVariable(name: "pixel", scope: !653, file: !19, line: 125, type: !5)
!653 = distinct !DILexicalBlock(scope: !648, file: !19, line: 124, column: 46)
!654 = !DILocation(line: 125, column: 21, scope: !653)
!655 = !DILocation(line: 125, column: 31, scope: !653)
!656 = !DILocation(line: 125, column: 39, scope: !653)
!657 = !DILocation(line: 125, column: 42, scope: !653)
!658 = !DILocation(line: 126, column: 20, scope: !653)
!659 = !DILocation(line: 126, column: 27, scope: !653)
!660 = !DILocation(line: 126, column: 18, scope: !653)
!661 = !DILocation(line: 127, column: 20, scope: !653)
!662 = !DILocation(line: 127, column: 27, scope: !653)
!663 = !DILocation(line: 127, column: 18, scope: !653)
!664 = !DILocalVariable(name: "xZero", scope: !653, file: !19, line: 129, type: !44)
!665 = !DILocation(line: 129, column: 18, scope: !653)
!666 = !DILocation(line: 129, column: 34, scope: !653)
!667 = !DILocation(line: 129, column: 43, scope: !653)
!668 = !DILocation(line: 129, column: 49, scope: !653)
!669 = !DILocation(line: 129, column: 26, scope: !653)
!670 = !DILocalVariable(name: "yZero", scope: !653, file: !19, line: 130, type: !44)
!671 = !DILocation(line: 130, column: 18, scope: !653)
!672 = !DILocation(line: 130, column: 34, scope: !653)
!673 = !DILocation(line: 130, column: 43, scope: !653)
!674 = !DILocation(line: 130, column: 49, scope: !653)
!675 = !DILocation(line: 130, column: 26, scope: !653)
!676 = !DILocalVariable(name: "origin", scope: !653, file: !19, line: 131, type: !44)
!677 = !DILocation(line: 131, column: 18, scope: !653)
!678 = !DILocation(line: 131, column: 27, scope: !653)
!679 = !DILocation(line: 131, column: 33, scope: !653)
!680 = !DILocation(line: 131, column: 36, scope: !653)
!681 = !DILocation(line: 0, scope: !653)
!682 = !DILocation(line: 133, column: 16, scope: !683)
!683 = distinct !DILexicalBlock(scope: !653, file: !19, line: 133, column: 16)
!684 = !DILocation(line: 133, column: 16, scope: !653)
!685 = !DILocation(line: 134, column: 17, scope: !683)
!686 = !DILocation(line: 134, column: 26, scope: !683)
!687 = !DILocation(line: 134, column: 34, scope: !683)
!688 = !DILocation(line: 135, column: 21, scope: !689)
!689 = distinct !DILexicalBlock(scope: !683, file: !19, line: 135, column: 21)
!690 = !DILocation(line: 135, column: 21, scope: !683)
!691 = !DILocation(line: 136, column: 17, scope: !689)
!692 = !DILocation(line: 136, column: 26, scope: !689)
!693 = !DILocation(line: 136, column: 34, scope: !689)
!694 = !DILocation(line: 137, column: 21, scope: !695)
!695 = distinct !DILexicalBlock(scope: !689, file: !19, line: 137, column: 21)
!696 = !DILocation(line: 137, column: 21, scope: !689)
!697 = !DILocation(line: 138, column: 17, scope: !695)
!698 = !DILocation(line: 138, column: 26, scope: !695)
!699 = !DILocation(line: 138, column: 34, scope: !695)
!700 = !DILocation(line: 140, column: 17, scope: !695)
!701 = !DILocation(line: 140, column: 26, scope: !695)
!702 = !DILocation(line: 140, column: 34, scope: !695)
!703 = !DILocation(line: 141, column: 9, scope: !653)
!704 = !DILocation(line: 124, column: 42, scope: !648)
!705 = !DILocation(line: 124, column: 9, scope: !648)
!706 = distinct !{!706, !651, !707, !100}
!707 = !DILocation(line: 141, column: 9, scope: !643)
!708 = !DILocation(line: 142, column: 5, scope: !644)
!709 = !DILocation(line: 123, column: 39, scope: !638)
!710 = !DILocation(line: 123, column: 5, scope: !638)
!711 = distinct !{!711, !641, !712, !100}
!712 = !DILocation(line: 142, column: 5, scope: !634)
!713 = !DILocation(line: 143, column: 1, scope: !616)
!714 = distinct !DISubprogram(name: "clearDisplay", scope: !19, file: !19, line: 145, type: !715, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!715 = !DISubroutineType(types: !716)
!716 = !{null, !62, !15}
!717 = !DILocalVariable(name: "display", arg: 1, scope: !714, file: !19, line: 145, type: !62)
!718 = !DILocation(line: 145, column: 35, scope: !714)
!719 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !714, file: !19, line: 145, type: !15)
!720 = !DILocation(line: 145, column: 48, scope: !714)
!721 = !DILocalVariable(name: "i", scope: !722, file: !19, line: 146, type: !15)
!722 = distinct !DILexicalBlock(scope: !714, file: !19, line: 146, column: 3)
!723 = !DILocation(line: 146, column: 11, scope: !722)
!724 = !DILocation(line: 146, column: 7, scope: !722)
!725 = !DILocation(line: 146, column: 18, scope: !726)
!726 = distinct !DILexicalBlock(scope: !722, file: !19, line: 146, column: 3)
!727 = !DILocation(line: 146, column: 22, scope: !726)
!728 = !DILocation(line: 146, column: 20, scope: !726)
!729 = !DILocation(line: 146, column: 3, scope: !722)
!730 = !DILocation(line: 147, column: 10, scope: !731)
!731 = distinct !DILexicalBlock(scope: !726, file: !19, line: 146, column: 40)
!732 = !DILocation(line: 147, column: 18, scope: !731)
!733 = !DILocation(line: 147, column: 5, scope: !731)
!734 = !DILocation(line: 148, column: 3, scope: !731)
!735 = !DILocation(line: 146, column: 37, scope: !726)
!736 = !DILocation(line: 146, column: 3, scope: !726)
!737 = distinct !{!737, !729, !738, !100}
!738 = !DILocation(line: 148, column: 3, scope: !722)
!739 = !DILocation(line: 149, column: 8, scope: !714)
!740 = !DILocation(line: 149, column: 3, scope: !714)
!741 = !DILocation(line: 150, column: 1, scope: !714)
!742 = distinct !DISubprogram(name: "drawGraph", scope: !19, file: !19, line: 152, type: !743, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!743 = !DISubroutineType(types: !744)
!744 = !{!44, !332, !15, !15, !15, !341}
!745 = !DILocalVariable(name: "arena", arg: 1, scope: !742, file: !19, line: 152, type: !332)
!746 = !DILocation(line: 152, column: 30, scope: !742)
!747 = !DILocalVariable(name: "begin", arg: 2, scope: !742, file: !19, line: 152, type: !15)
!748 = !DILocation(line: 152, column: 41, scope: !742)
!749 = !DILocalVariable(name: "end", arg: 3, scope: !742, file: !19, line: 152, type: !15)
!750 = !DILocation(line: 152, column: 52, scope: !742)
!751 = !DILocalVariable(name: "byAmount", arg: 4, scope: !742, file: !19, line: 152, type: !15)
!752 = !DILocation(line: 152, column: 61, scope: !742)
!753 = !DILocalVariable(name: "valFunc", arg: 5, scope: !742, file: !19, line: 152, type: !341)
!754 = !DILocation(line: 152, column: 88, scope: !742)
!755 = !DILocalVariable(name: "w", scope: !742, file: !19, line: 153, type: !756)
!756 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !757, line: 27, size: 64, elements: !758)
!757 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!758 = !{!759, !761, !762, !763}
!759 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !756, file: !757, line: 29, baseType: !760, size: 16)
!760 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!761 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !756, file: !757, line: 30, baseType: !760, size: 16, offset: 16)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !756, file: !757, line: 31, baseType: !760, size: 16, offset: 32)
!763 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !756, file: !757, line: 32, baseType: !760, size: 16, offset: 48)
!764 = !DILocation(line: 153, column: 18, scope: !742)
!765 = !DILocation(line: 156, column: 7, scope: !766)
!766 = distinct !DILexicalBlock(scope: !742, file: !19, line: 156, column: 7)
!767 = !DILocation(line: 156, column: 44, scope: !766)
!768 = !DILocation(line: 156, column: 7, scope: !742)
!769 = !DILocation(line: 157, column: 7, scope: !770)
!770 = distinct !DILexicalBlock(scope: !766, file: !19, line: 156, column: 51)
!771 = !DILocation(line: 158, column: 7, scope: !770)
!772 = !DILocalVariable(name: "display", scope: !742, file: !19, line: 161, type: !62)
!773 = !DILocation(line: 161, column: 19, scope: !742)
!774 = !DILocation(line: 161, column: 43, scope: !742)
!775 = !DILocation(line: 161, column: 53, scope: !742)
!776 = !DILocation(line: 161, column: 63, scope: !742)
!777 = !DILocation(line: 161, column: 76, scope: !742)
!778 = !DILocation(line: 161, column: 74, scope: !742)
!779 = !DILocation(line: 161, column: 86, scope: !742)
!780 = !DILocation(line: 161, column: 84, scope: !742)
!781 = !DILocation(line: 161, column: 29, scope: !742)
!782 = !DILocation(line: 162, column: 13, scope: !742)
!783 = !DILocation(line: 162, column: 22, scope: !742)
!784 = !DILocation(line: 162, column: 32, scope: !742)
!785 = !DILocation(line: 162, column: 44, scope: !742)
!786 = !DILocation(line: 162, column: 42, scope: !742)
!787 = !DILocation(line: 162, column: 54, scope: !742)
!788 = !DILocation(line: 162, column: 52, scope: !742)
!789 = !DILocation(line: 162, column: 3, scope: !742)
!790 = !DILocation(line: 163, column: 12, scope: !742)
!791 = !DILocation(line: 163, column: 21, scope: !742)
!792 = !DILocation(line: 163, column: 30, scope: !742)
!793 = !DILocation(line: 163, column: 37, scope: !742)
!794 = !DILocation(line: 163, column: 47, scope: !742)
!795 = !DILocation(line: 163, column: 59, scope: !742)
!796 = !DILocation(line: 163, column: 57, scope: !742)
!797 = !DILocation(line: 163, column: 69, scope: !742)
!798 = !DILocation(line: 163, column: 67, scope: !742)
!799 = !DILocation(line: 163, column: 3, scope: !742)
!800 = !DILocation(line: 164, column: 14, scope: !742)
!801 = !DILocation(line: 164, column: 25, scope: !742)
!802 = !DILocation(line: 164, column: 23, scope: !742)
!803 = !DILocation(line: 164, column: 35, scope: !742)
!804 = !DILocation(line: 164, column: 33, scope: !742)
!805 = !DILocation(line: 164, column: 3, scope: !742)
!806 = !DILocation(line: 165, column: 16, scope: !742)
!807 = !DILocation(line: 165, column: 27, scope: !742)
!808 = !DILocation(line: 165, column: 25, scope: !742)
!809 = !DILocation(line: 165, column: 3, scope: !742)
!810 = !DILocation(line: 166, column: 3, scope: !742)
!811 = !DILocation(line: 167, column: 1, scope: !742)
