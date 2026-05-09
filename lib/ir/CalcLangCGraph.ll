; ModuleID = '/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c'
source_filename = "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { x86_fp80 }
%struct.CalcLangPixel = type { ptr, ptr, i8 }
%struct.winsize = type { i16, i16, i16, i16 }

@.str = private unnamed_addr constant [9 x i8] c"_,.-~*'`\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [2 x i8] c"{\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [2 x i8] c"(\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [3 x i8] c", \00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [2 x i8] c")\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1, !dbg !21
@.str.6 = private unnamed_addr constant [15 x i8] c"Starting yMax=\00", align 1, !dbg !23
@.str.7 = private unnamed_addr constant [8 x i8] c" at %p\0A\00", align 1, !dbg !28
@.str.8 = private unnamed_addr constant [11 x i8] c"Index is: \00", align 1, !dbg !33
@.str.9 = private unnamed_addr constant [6 x i8] c"yMax=\00", align 1, !dbg !38
@.str.10 = private unnamed_addr constant [17 x i8] c"Highest YMax is \00", align 1, !dbg !43
@.str.11 = private unnamed_addr constant [13 x i8] c"ioctl failed\00", align 1, !dbg !48
@.str.12 = private unnamed_addr constant [9 x i8] c"MyBegin=\00", align 1, !dbg !53
@.str.13 = private unnamed_addr constant [8 x i8] c"\0AMyEnd=\00", align 1, !dbg !55
@.str.14 = private unnamed_addr constant [11 x i8] c"\0AMyAmount=\00", align 1, !dbg !57
@.str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !59
@.str.16 = private unnamed_addr constant [13 x i8] c"screenWidth=\00", align 1, !dbg !61
@.str.17 = private unnamed_addr constant [15 x i8] c"\0AscreenHeight=\00", align 1, !dbg !63
@.str.18 = private unnamed_addr constant [6 x i8] c"\0Atwo=\00", align 1, !dbg !65
@.str.19 = private unnamed_addr constant [8 x i8] c"\0AxStep=\00", align 1, !dbg !67
@.str.20 = private unnamed_addr constant [12 x i8] c"\0Adiv2Width=\00", align 1, !dbg !69
@.str.21 = private unnamed_addr constant [9 x i8] c"\0AxBegin=\00", align 1, !dbg !74
@.str.22 = private unnamed_addr constant [7 x i8] c"\0AxEnd=\00", align 1, !dbg !76

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @closeTo(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !135 {
  %5 = alloca i1, align 1
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !149, metadata !DIExpression()), !dbg !150
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !151, metadata !DIExpression()), !dbg !152
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !153, metadata !DIExpression()), !dbg !154
  store ptr %3, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !155, metadata !DIExpression()), !dbg !156
  %10 = load ptr, ptr %6, align 8, !dbg !157
  %11 = load ptr, ptr %7, align 8, !dbg !159
  %12 = load ptr, ptr %8, align 8, !dbg !160
  %13 = call ptr @greaterThenCalcLangValues(ptr noundef %10, ptr noundef %11, ptr noundef %12), !dbg !161
  %14 = call zeroext i1 @toBool(ptr noundef %13), !dbg !162
  br i1 %14, label %15, label %24, !dbg !163

15:                                               ; preds = %4
  %16 = load ptr, ptr %6, align 8, !dbg !164
  %17 = load ptr, ptr %6, align 8, !dbg !166
  %18 = load ptr, ptr %7, align 8, !dbg !167
  %19 = load ptr, ptr %8, align 8, !dbg !168
  %20 = call ptr @subCalcLangValues(ptr noundef %17, ptr noundef %18, ptr noundef %19), !dbg !169
  %21 = load ptr, ptr %9, align 8, !dbg !170
  %22 = call ptr @lessThenCalcLangValues(ptr noundef %16, ptr noundef %20, ptr noundef %21), !dbg !171
  %23 = call zeroext i1 @toBool(ptr noundef %22), !dbg !172
  store i1 %23, ptr %5, align 1, !dbg !173
  br label %33, !dbg !173

24:                                               ; preds = %4
  %25 = load ptr, ptr %6, align 8, !dbg !174
  %26 = load ptr, ptr %6, align 8, !dbg !176
  %27 = load ptr, ptr %8, align 8, !dbg !177
  %28 = load ptr, ptr %7, align 8, !dbg !178
  %29 = call ptr @subCalcLangValues(ptr noundef %26, ptr noundef %27, ptr noundef %28), !dbg !179
  %30 = load ptr, ptr %9, align 8, !dbg !180
  %31 = call ptr @lessThenCalcLangValues(ptr noundef %25, ptr noundef %29, ptr noundef %30), !dbg !181
  %32 = call zeroext i1 @toBool(ptr noundef %31), !dbg !182
  store i1 %32, ptr %5, align 1, !dbg !183
  br label %33, !dbg !183

33:                                               ; preds = %24, %15
  %34 = load i1, ptr %5, align 1, !dbg !184
  ret i1 %34, !dbg !184
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare zeroext i1 @toBool(ptr noundef) #2

declare ptr @greaterThenCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

declare ptr @lessThenCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

declare ptr @subCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @initializeDisplay(ptr noundef %0, ptr noundef %1) #0 !dbg !185 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !189, metadata !DIExpression()), !dbg !190
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata ptr %5, metadata !193, metadata !DIExpression()), !dbg !194
  %7 = load ptr, ptr %3, align 8, !dbg !195
  %8 = getelementptr inbounds %struct.CalcLangVal, ptr %7, i32 0, i32 1, !dbg !196
  %9 = load i32, ptr %8, align 16, !dbg !197
  %10 = sext i32 %9 to i64, !dbg !195
  %11 = mul i64 8, %10, !dbg !198
  %12 = call noalias ptr @malloc(i64 noundef %11) #7, !dbg !199
  store ptr %12, ptr %5, align 8, !dbg !194
  %13 = load ptr, ptr %5, align 8, !dbg !200
  %14 = load ptr, ptr %3, align 8, !dbg !201
  %15 = getelementptr inbounds %struct.CalcLangVal, ptr %14, i32 0, i32 1, !dbg !202
  %16 = load i32, ptr %15, align 16, !dbg !203
  %17 = sext i32 %16 to i64, !dbg !201
  call void @llvm.memset.p0.i64(ptr align 8 %13, i8 0, i64 %17, i1 false), !dbg !204
  call void @llvm.dbg.declare(metadata ptr %6, metadata !205, metadata !DIExpression()), !dbg !207
  store i32 0, ptr %6, align 4, !dbg !207
  br label %18, !dbg !208

18:                                               ; preds = %44, %2
  %19 = load i32, ptr %6, align 4, !dbg !209
  %20 = load ptr, ptr %3, align 8, !dbg !211
  %21 = getelementptr inbounds %struct.CalcLangVal, ptr %20, i32 0, i32 1, !dbg !212
  %22 = load i32, ptr %21, align 16, !dbg !213
  %23 = icmp slt i32 %19, %22, !dbg !214
  br i1 %23, label %24, label %47, !dbg !215

24:                                               ; preds = %18
  %25 = load ptr, ptr %4, align 8, !dbg !216
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 1, !dbg !218
  %27 = load i32, ptr %26, align 16, !dbg !219
  %28 = sext i32 %27 to i64, !dbg !216
  %29 = mul i64 24, %28, !dbg !220
  %30 = call noalias ptr @malloc(i64 noundef %29) #7, !dbg !221
  %31 = load ptr, ptr %5, align 8, !dbg !222
  %32 = load i32, ptr %6, align 4, !dbg !223
  %33 = sext i32 %32 to i64, !dbg !222
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !222
  store ptr %30, ptr %34, align 8, !dbg !224
  %35 = load ptr, ptr %5, align 8, !dbg !225
  %36 = load i32, ptr %6, align 4, !dbg !226
  %37 = sext i32 %36 to i64, !dbg !225
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !225
  %39 = load ptr, ptr %38, align 8, !dbg !225
  %40 = load ptr, ptr %4, align 8, !dbg !227
  %41 = getelementptr inbounds %struct.CalcLangVal, ptr %40, i32 0, i32 1, !dbg !228
  %42 = load i32, ptr %41, align 16, !dbg !229
  %43 = sext i32 %42 to i64, !dbg !227
  call void @llvm.memset.p0.i64(ptr align 8 %39, i8 0, i64 %43, i1 false), !dbg !230
  br label %44, !dbg !231

44:                                               ; preds = %24
  %45 = load i32, ptr %6, align 4, !dbg !232
  %46 = add nsw i32 %45, 1, !dbg !232
  store i32 %46, ptr %6, align 4, !dbg !232
  br label %18, !dbg !233, !llvm.loop !234

47:                                               ; preds = %18
  %48 = load ptr, ptr %5, align 8, !dbg !237
  ret ptr %48, !dbg !238
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 !dbg !239 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !242, metadata !DIExpression()), !dbg !243
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !244, metadata !DIExpression()), !dbg !245
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !246, metadata !DIExpression()), !dbg !247
  store ptr %3, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !248, metadata !DIExpression()), !dbg !249
  store ptr %4, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !250, metadata !DIExpression()), !dbg !251
  store ptr %5, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !252, metadata !DIExpression()), !dbg !253
  store ptr %6, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.declare(metadata ptr %15, metadata !256, metadata !DIExpression()), !dbg !257
  %20 = load ptr, ptr %13, align 8, !dbg !258
  %21 = load ptr, ptr %14, align 8, !dbg !259
  %22 = call ptr @initializeDisplay(ptr noundef %20, ptr noundef %21), !dbg !260
  store ptr %22, ptr %15, align 8, !dbg !257
  call void @llvm.dbg.declare(metadata ptr %16, metadata !261, metadata !DIExpression()), !dbg !263
  store i32 0, ptr %16, align 4, !dbg !263
  br label %23, !dbg !264

23:                                               ; preds = %82, %7
  %24 = load i32, ptr %16, align 4, !dbg !265
  %25 = load ptr, ptr %13, align 8, !dbg !267
  %26 = getelementptr inbounds %struct.CalcLangVal, ptr %25, i32 0, i32 1, !dbg !268
  %27 = load i32, ptr %26, align 16, !dbg !269
  %28 = icmp slt i32 %24, %27, !dbg !270
  br i1 %28, label %29, label %85, !dbg !271

29:                                               ; preds = %23
  call void @llvm.dbg.declare(metadata ptr %17, metadata !272, metadata !DIExpression()), !dbg !274
  %30 = load ptr, ptr %8, align 8, !dbg !275
  %31 = load i32, ptr %16, align 4, !dbg !276
  %32 = call ptr @integerCalcLangValue(ptr noundef %30, i32 noundef %31), !dbg !277
  store ptr %32, ptr %17, align 8, !dbg !274
  call void @llvm.dbg.declare(metadata ptr %18, metadata !278, metadata !DIExpression()), !dbg !280
  store i32 0, ptr %18, align 4, !dbg !280
  br label %33, !dbg !281

33:                                               ; preds = %77, %29
  %34 = load i32, ptr %18, align 4, !dbg !282
  %35 = load ptr, ptr %14, align 8, !dbg !284
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 1, !dbg !285
  %37 = load i32, ptr %36, align 16, !dbg !286
  %38 = icmp slt i32 %34, %37, !dbg !287
  br i1 %38, label %39, label %80, !dbg !288

39:                                               ; preds = %33
  call void @llvm.dbg.declare(metadata ptr %19, metadata !289, metadata !DIExpression()), !dbg !291
  %40 = load ptr, ptr %8, align 8, !dbg !292
  %41 = load i32, ptr %18, align 4, !dbg !293
  %42 = call ptr @integerCalcLangValue(ptr noundef %40, i32 noundef %41), !dbg !294
  store ptr %42, ptr %19, align 8, !dbg !291
  %43 = load ptr, ptr %8, align 8, !dbg !295
  %44 = load ptr, ptr %11, align 8, !dbg !296
  %45 = load ptr, ptr %8, align 8, !dbg !297
  %46 = load ptr, ptr %9, align 8, !dbg !298
  %47 = load ptr, ptr %19, align 8, !dbg !299
  %48 = call ptr @multCalcLangValues(ptr noundef %45, ptr noundef %46, ptr noundef %47), !dbg !300
  %49 = call ptr @addCalcLangValues(ptr noundef %43, ptr noundef %44, ptr noundef %48), !dbg !301
  %50 = call ptr @copyValue(ptr noundef %49), !dbg !302
  %51 = load ptr, ptr %15, align 8, !dbg !303
  %52 = load i32, ptr %16, align 4, !dbg !304
  %53 = sext i32 %52 to i64, !dbg !303
  %54 = getelementptr inbounds ptr, ptr %51, i64 %53, !dbg !303
  %55 = load ptr, ptr %54, align 8, !dbg !303
  %56 = load i32, ptr %18, align 4, !dbg !305
  %57 = sext i32 %56 to i64, !dbg !303
  %58 = getelementptr inbounds %struct.CalcLangPixel, ptr %55, i64 %57, !dbg !303
  %59 = getelementptr inbounds %struct.CalcLangPixel, ptr %58, i32 0, i32 0, !dbg !306
  store ptr %50, ptr %59, align 8, !dbg !307
  %60 = load ptr, ptr %8, align 8, !dbg !308
  %61 = load ptr, ptr %12, align 8, !dbg !309
  %62 = load ptr, ptr %8, align 8, !dbg !310
  %63 = load ptr, ptr %10, align 8, !dbg !311
  %64 = load ptr, ptr %17, align 8, !dbg !312
  %65 = call ptr @multCalcLangValues(ptr noundef %62, ptr noundef %63, ptr noundef %64), !dbg !313
  %66 = call ptr @subCalcLangValues(ptr noundef %60, ptr noundef %61, ptr noundef %65), !dbg !314
  %67 = call ptr @copyValue(ptr noundef %66), !dbg !315
  %68 = load ptr, ptr %15, align 8, !dbg !316
  %69 = load i32, ptr %16, align 4, !dbg !317
  %70 = sext i32 %69 to i64, !dbg !316
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70, !dbg !316
  %72 = load ptr, ptr %71, align 8, !dbg !316
  %73 = load i32, ptr %18, align 4, !dbg !318
  %74 = sext i32 %73 to i64, !dbg !316
  %75 = getelementptr inbounds %struct.CalcLangPixel, ptr %72, i64 %74, !dbg !316
  %76 = getelementptr inbounds %struct.CalcLangPixel, ptr %75, i32 0, i32 1, !dbg !319
  store ptr %67, ptr %76, align 8, !dbg !320
  br label %77, !dbg !321

77:                                               ; preds = %39
  %78 = load i32, ptr %18, align 4, !dbg !322
  %79 = add nsw i32 %78, 1, !dbg !322
  store i32 %79, ptr %18, align 4, !dbg !322
  br label %33, !dbg !323, !llvm.loop !324

80:                                               ; preds = %33
  %81 = load ptr, ptr %8, align 8, !dbg !326
  call void @arenaReset(ptr noundef %81), !dbg !327
  br label %82, !dbg !328

82:                                               ; preds = %80
  %83 = load i32, ptr %16, align 4, !dbg !329
  %84 = add nsw i32 %83, 1, !dbg !329
  store i32 %84, ptr %16, align 4, !dbg !329
  br label %23, !dbg !330, !llvm.loop !331

85:                                               ; preds = %23
  %86 = load ptr, ptr %15, align 8, !dbg !333
  ret ptr %86, !dbg !334
}

declare ptr @integerCalcLangValue(ptr noundef, i32 noundef) #2

declare ptr @copyValue(ptr noundef) #2

declare ptr @addCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

declare ptr @multCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

declare void @arenaReset(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !335 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !338, metadata !DIExpression()), !dbg !339
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !340, metadata !DIExpression()), !dbg !341
  store ptr %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !342, metadata !DIExpression()), !dbg !343
  store ptr %3, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !344, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata ptr %9, metadata !346, metadata !DIExpression()), !dbg !347
  store ptr @.str, ptr %9, align 8, !dbg !347
  call void @llvm.dbg.declare(metadata ptr %10, metadata !348, metadata !DIExpression()), !dbg !349
  %17 = load ptr, ptr %5, align 8, !dbg !350
  %18 = call ptr @integerCalcLangValue(ptr noundef %17, i32 noundef 8), !dbg !351
  store ptr %18, ptr %10, align 8, !dbg !349
  call void @llvm.dbg.declare(metadata ptr %11, metadata !352, metadata !DIExpression()), !dbg !353
  %19 = load ptr, ptr %5, align 8, !dbg !354
  %20 = load ptr, ptr %8, align 8, !dbg !355
  %21 = load ptr, ptr %10, align 8, !dbg !356
  %22 = call ptr @divCalcLangValues(ptr noundef %19, ptr noundef %20, ptr noundef %21), !dbg !357
  store ptr %22, ptr %11, align 8, !dbg !353
  call void @llvm.dbg.declare(metadata ptr %12, metadata !358, metadata !DIExpression()), !dbg !359
  %23 = load ptr, ptr %5, align 8, !dbg !360
  %24 = call ptr @integerCalcLangValue(ptr noundef %23, i32 noundef 2), !dbg !361
  store ptr %24, ptr %12, align 8, !dbg !359
  call void @llvm.dbg.declare(metadata ptr %13, metadata !362, metadata !DIExpression()), !dbg !363
  %25 = load ptr, ptr %5, align 8, !dbg !364
  %26 = load ptr, ptr %8, align 8, !dbg !365
  %27 = load ptr, ptr %12, align 8, !dbg !366
  %28 = call ptr @divCalcLangValues(ptr noundef %25, ptr noundef %26, ptr noundef %27), !dbg !367
  store ptr %28, ptr %13, align 8, !dbg !363
  call void @llvm.dbg.declare(metadata ptr %14, metadata !368, metadata !DIExpression()), !dbg !369
  %29 = load ptr, ptr %5, align 8, !dbg !370
  %30 = load ptr, ptr %6, align 8, !dbg !371
  %31 = load ptr, ptr %5, align 8, !dbg !372
  %32 = load ptr, ptr %7, align 8, !dbg !373
  %33 = load ptr, ptr %13, align 8, !dbg !374
  %34 = call ptr @subCalcLangValues(ptr noundef %31, ptr noundef %32, ptr noundef %33), !dbg !375
  %35 = call ptr @subCalcLangValues(ptr noundef %29, ptr noundef %30, ptr noundef %34), !dbg !376
  store ptr %35, ptr %14, align 8, !dbg !369
  call void @llvm.dbg.declare(metadata ptr %15, metadata !377, metadata !DIExpression()), !dbg !378
  store i32 0, ptr %15, align 4, !dbg !378
  call void @llvm.dbg.declare(metadata ptr %16, metadata !379, metadata !DIExpression()), !dbg !380
  %36 = load ptr, ptr %5, align 8, !dbg !381
  %37 = call ptr @integerCalcLangValue(ptr noundef %36, i32 noundef 0), !dbg !382
  store ptr %37, ptr %16, align 8, !dbg !380
  br label %38, !dbg !383

38:                                               ; preds = %44, %4
  %39 = load ptr, ptr %5, align 8, !dbg !384
  %40 = load ptr, ptr %16, align 8, !dbg !385
  %41 = load ptr, ptr %14, align 8, !dbg !386
  %42 = call ptr @lessThenCalcLangValues(ptr noundef %39, ptr noundef %40, ptr noundef %41), !dbg !387
  %43 = call zeroext i1 @toBool(ptr noundef %42), !dbg !388
  br i1 %43, label %44, label %51, !dbg !383

44:                                               ; preds = %38
  %45 = load ptr, ptr %5, align 8, !dbg !389
  %46 = load ptr, ptr %16, align 8, !dbg !391
  %47 = load ptr, ptr %11, align 8, !dbg !392
  %48 = call ptr @addCalcLangValues(ptr noundef %45, ptr noundef %46, ptr noundef %47), !dbg !393
  store ptr %48, ptr %16, align 8, !dbg !394
  %49 = load i32, ptr %15, align 4, !dbg !395
  %50 = add nsw i32 %49, 1, !dbg !395
  store i32 %50, ptr %15, align 4, !dbg !395
  br label %38, !dbg !383, !llvm.loop !396

51:                                               ; preds = %38
  %52 = load ptr, ptr %9, align 8, !dbg !398
  %53 = load i32, ptr %15, align 4, !dbg !399
  %54 = sub nsw i32 %53, 1, !dbg !400
  %55 = sext i32 %54 to i64, !dbg !398
  %56 = getelementptr inbounds i8, ptr %52, i64 %55, !dbg !398
  %57 = load i8, ptr %56, align 1, !dbg !398
  ret i8 %57, !dbg !401
}

declare ptr @divCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !402 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !405, metadata !DIExpression()), !dbg !406
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !407, metadata !DIExpression()), !dbg !408
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !409, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata ptr %7, metadata !411, metadata !DIExpression()), !dbg !413
  %13 = load ptr, ptr %5, align 8, !dbg !414
  %14 = getelementptr inbounds %struct.CalcLangVal, ptr %13, i32 0, i32 1, !dbg !415
  %15 = load i32, ptr %14, align 16, !dbg !416
  %16 = sext i32 %15 to i64, !dbg !414
  %17 = mul i64 8, %16, !dbg !417
  %18 = call noalias ptr @malloc(i64 noundef %17) #7, !dbg !418
  store ptr %18, ptr %7, align 8, !dbg !413
  call void @llvm.dbg.declare(metadata ptr %8, metadata !419, metadata !DIExpression()), !dbg !421
  store i32 0, ptr %8, align 4, !dbg !421
  br label %19, !dbg !422

19:                                               ; preds = %37, %3
  %20 = load i32, ptr %8, align 4, !dbg !423
  %21 = load ptr, ptr %5, align 8, !dbg !425
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 1, !dbg !426
  %23 = load i32, ptr %22, align 16, !dbg !427
  %24 = icmp slt i32 %20, %23, !dbg !428
  br i1 %24, label %25, label %40, !dbg !429

25:                                               ; preds = %19
  %26 = load ptr, ptr %6, align 8, !dbg !430
  %27 = getelementptr inbounds %struct.CalcLangVal, ptr %26, i32 0, i32 1, !dbg !432
  %28 = load i32, ptr %27, align 16, !dbg !433
  %29 = sext i32 %28 to i64, !dbg !430
  %30 = mul i64 1, %29, !dbg !434
  %31 = add i64 %30, 1, !dbg !435
  %32 = call noalias ptr @malloc(i64 noundef %31) #7, !dbg !436
  %33 = load ptr, ptr %7, align 8, !dbg !437
  %34 = load i32, ptr %8, align 4, !dbg !438
  %35 = sext i32 %34 to i64, !dbg !437
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35, !dbg !437
  store ptr %32, ptr %36, align 8, !dbg !439
  br label %37, !dbg !440

37:                                               ; preds = %25
  %38 = load i32, ptr %8, align 4, !dbg !441
  %39 = add nsw i32 %38, 1, !dbg !441
  store i32 %39, ptr %8, align 4, !dbg !441
  br label %19, !dbg !442, !llvm.loop !443

40:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %9, metadata !445, metadata !DIExpression()), !dbg !447
  store i32 0, ptr %9, align 4, !dbg !447
  br label %41, !dbg !448

41:                                               ; preds = %87, %40
  %42 = load i32, ptr %9, align 4, !dbg !449
  %43 = load ptr, ptr %5, align 8, !dbg !451
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 1, !dbg !452
  %45 = load i32, ptr %44, align 16, !dbg !453
  %46 = icmp slt i32 %42, %45, !dbg !454
  br i1 %46, label %47, label %90, !dbg !455

47:                                               ; preds = %41
  call void @llvm.dbg.declare(metadata ptr %10, metadata !456, metadata !DIExpression()), !dbg !459
  store i32 0, ptr %10, align 4, !dbg !459
  br label %48, !dbg !460

48:                                               ; preds = %73, %47
  %49 = load i32, ptr %10, align 4, !dbg !461
  %50 = load ptr, ptr %6, align 8, !dbg !463
  %51 = getelementptr inbounds %struct.CalcLangVal, ptr %50, i32 0, i32 1, !dbg !464
  %52 = load i32, ptr %51, align 16, !dbg !465
  %53 = icmp slt i32 %49, %52, !dbg !466
  br i1 %53, label %54, label %76, !dbg !467

54:                                               ; preds = %48
  %55 = load ptr, ptr %4, align 8, !dbg !468
  %56 = load i32, ptr %9, align 4, !dbg !469
  %57 = sext i32 %56 to i64, !dbg !468
  %58 = getelementptr inbounds ptr, ptr %55, i64 %57, !dbg !468
  %59 = load ptr, ptr %58, align 8, !dbg !468
  %60 = load i32, ptr %10, align 4, !dbg !470
  %61 = sext i32 %60 to i64, !dbg !468
  %62 = getelementptr inbounds %struct.CalcLangPixel, ptr %59, i64 %61, !dbg !468
  %63 = getelementptr inbounds %struct.CalcLangPixel, ptr %62, i32 0, i32 2, !dbg !471
  %64 = load i8, ptr %63, align 8, !dbg !471
  %65 = load ptr, ptr %7, align 8, !dbg !472
  %66 = load i32, ptr %9, align 4, !dbg !473
  %67 = sext i32 %66 to i64, !dbg !472
  %68 = getelementptr inbounds ptr, ptr %65, i64 %67, !dbg !472
  %69 = load ptr, ptr %68, align 8, !dbg !472
  %70 = load i32, ptr %10, align 4, !dbg !474
  %71 = sext i32 %70 to i64, !dbg !472
  %72 = getelementptr inbounds i8, ptr %69, i64 %71, !dbg !472
  store i8 %64, ptr %72, align 1, !dbg !475
  br label %73, !dbg !472

73:                                               ; preds = %54
  %74 = load i32, ptr %10, align 4, !dbg !476
  %75 = add nsw i32 %74, 1, !dbg !476
  store i32 %75, ptr %10, align 4, !dbg !476
  br label %48, !dbg !477, !llvm.loop !478

76:                                               ; preds = %48
  %77 = load ptr, ptr %7, align 8, !dbg !480
  %78 = load i32, ptr %9, align 4, !dbg !481
  %79 = sext i32 %78 to i64, !dbg !480
  %80 = getelementptr inbounds ptr, ptr %77, i64 %79, !dbg !480
  %81 = load ptr, ptr %80, align 8, !dbg !480
  %82 = load ptr, ptr %6, align 8, !dbg !482
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1, !dbg !483
  %84 = load i32, ptr %83, align 16, !dbg !484
  %85 = sext i32 %84 to i64, !dbg !480
  %86 = getelementptr inbounds i8, ptr %81, i64 %85, !dbg !480
  store i8 0, ptr %86, align 1, !dbg !485
  br label %87, !dbg !486

87:                                               ; preds = %76
  %88 = load i32, ptr %9, align 4, !dbg !487
  %89 = add nsw i32 %88, 1, !dbg !487
  store i32 %89, ptr %9, align 4, !dbg !487
  br label %41, !dbg !488, !llvm.loop !489

90:                                               ; preds = %41
  call void @llvm.dbg.declare(metadata ptr %11, metadata !491, metadata !DIExpression()), !dbg !493
  store i32 0, ptr %11, align 4, !dbg !493
  br label %91, !dbg !494

91:                                               ; preds = %104, %90
  %92 = load i32, ptr %11, align 4, !dbg !495
  %93 = load ptr, ptr %5, align 8, !dbg !497
  %94 = getelementptr inbounds %struct.CalcLangVal, ptr %93, i32 0, i32 1, !dbg !498
  %95 = load i32, ptr %94, align 16, !dbg !499
  %96 = icmp slt i32 %92, %95, !dbg !500
  br i1 %96, label %97, label %107, !dbg !501

97:                                               ; preds = %91
  %98 = load ptr, ptr %7, align 8, !dbg !502
  %99 = load i32, ptr %11, align 4, !dbg !503
  %100 = sext i32 %99 to i64, !dbg !502
  %101 = getelementptr inbounds ptr, ptr %98, i64 %100, !dbg !502
  %102 = load ptr, ptr %101, align 8, !dbg !502
  %103 = call i32 @puts(ptr noundef %102), !dbg !504
  br label %104, !dbg !504

104:                                              ; preds = %97
  %105 = load i32, ptr %11, align 4, !dbg !505
  %106 = add nsw i32 %105, 1, !dbg !505
  store i32 %106, ptr %11, align 4, !dbg !505
  br label %91, !dbg !506, !llvm.loop !507

107:                                              ; preds = %91
  call void @llvm.dbg.declare(metadata ptr %12, metadata !509, metadata !DIExpression()), !dbg !511
  store i32 0, ptr %12, align 4, !dbg !511
  br label %108, !dbg !512

108:                                              ; preds = %120, %107
  %109 = load i32, ptr %12, align 4, !dbg !513
  %110 = load ptr, ptr %5, align 8, !dbg !515
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1, !dbg !516
  %112 = load i32, ptr %111, align 16, !dbg !517
  %113 = icmp slt i32 %109, %112, !dbg !518
  br i1 %113, label %114, label %123, !dbg !519

114:                                              ; preds = %108
  %115 = load ptr, ptr %7, align 8, !dbg !520
  %116 = load i32, ptr %12, align 4, !dbg !521
  %117 = sext i32 %116 to i64, !dbg !520
  %118 = getelementptr inbounds ptr, ptr %115, i64 %117, !dbg !520
  %119 = load ptr, ptr %118, align 8, !dbg !520
  call void @free(ptr noundef %119) #8, !dbg !522
  br label %120, !dbg !522

120:                                              ; preds = %114
  %121 = load i32, ptr %12, align 4, !dbg !523
  %122 = add nsw i32 %121, 1, !dbg !523
  store i32 %122, ptr %12, align 4, !dbg !523
  br label %108, !dbg !524, !llvm.loop !525

123:                                              ; preds = %108
  %124 = load ptr, ptr %7, align 8, !dbg !527
  call void @free(ptr noundef %124) #8, !dbg !528
  ret void, !dbg !529
}

declare i32 @puts(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 !dbg !530 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !536, metadata !DIExpression()), !dbg !537
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !538, metadata !DIExpression()), !dbg !539
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !540, metadata !DIExpression()), !dbg !541
  store ptr %3, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !542, metadata !DIExpression()), !dbg !543
  store ptr %4, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !544, metadata !DIExpression()), !dbg !545
  store ptr %5, ptr %13, align 8
  call void @llvm.dbg.declare(metadata ptr %13, metadata !546, metadata !DIExpression()), !dbg !547
  store ptr %6, ptr %14, align 8
  call void @llvm.dbg.declare(metadata ptr %14, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata ptr %15, metadata !550, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.declare(metadata ptr %16, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata ptr %17, metadata !554, metadata !DIExpression()), !dbg !555
  %23 = load ptr, ptr %10, align 8, !dbg !556
  %24 = call ptr @realCalcLangValue(ptr noundef %23, x86_fp80 noundef 0xK40008666666666666800), !dbg !557
  %25 = call ptr @copyValue(ptr noundef %24), !dbg !558
  store ptr %25, ptr %17, align 8, !dbg !555
  call void @llvm.dbg.declare(metadata ptr %18, metadata !559, metadata !DIExpression()), !dbg !560
  %26 = load ptr, ptr %10, align 8, !dbg !561
  %27 = load ptr, ptr %12, align 8, !dbg !562
  %28 = load ptr, ptr %17, align 8, !dbg !563
  %29 = call ptr @divCalcLangValues(ptr noundef %26, ptr noundef %27, ptr noundef %28), !dbg !564
  %30 = call ptr @copyValue(ptr noundef %29), !dbg !565
  store ptr %30, ptr %18, align 8, !dbg !560
  %31 = load ptr, ptr %10, align 8, !dbg !566
  call void @arenaReset(ptr noundef %31), !dbg !567
  call void @llvm.dbg.declare(metadata ptr %19, metadata !568, metadata !DIExpression()), !dbg !570
  store i32 0, ptr %19, align 4, !dbg !570
  br label %32, !dbg !571

32:                                               ; preds = %85, %7
  %33 = load i32, ptr %19, align 4, !dbg !572
  %34 = load ptr, ptr %13, align 8, !dbg !574
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1, !dbg !575
  %36 = load i32, ptr %35, align 16, !dbg !576
  %37 = icmp slt i32 %33, %36, !dbg !577
  br i1 %37, label %38, label %88, !dbg !578

38:                                               ; preds = %32
  call void @llvm.dbg.declare(metadata ptr %20, metadata !579, metadata !DIExpression()), !dbg !582
  store i32 0, ptr %20, align 4, !dbg !582
  br label %39, !dbg !583

39:                                               ; preds = %81, %38
  %40 = load i32, ptr %20, align 4, !dbg !584
  %41 = load ptr, ptr %14, align 8, !dbg !586
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 1, !dbg !587
  %43 = load i32, ptr %42, align 16, !dbg !588
  %44 = icmp slt i32 %40, %43, !dbg !589
  br i1 %44, label %45, label %84, !dbg !590

45:                                               ; preds = %39
  call void @llvm.dbg.declare(metadata ptr %21, metadata !591, metadata !DIExpression()), !dbg !593
  %46 = load ptr, ptr %8, align 8, !dbg !594
  %47 = load i32, ptr %19, align 4, !dbg !595
  %48 = sext i32 %47 to i64, !dbg !594
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48, !dbg !594
  %50 = load ptr, ptr %49, align 8, !dbg !594
  %51 = load i32, ptr %20, align 4, !dbg !596
  %52 = sext i32 %51 to i64, !dbg !594
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %50, i64 %52, !dbg !594
  store ptr %53, ptr %21, align 8, !dbg !593
  %54 = load ptr, ptr %21, align 8, !dbg !597
  %55 = getelementptr inbounds %struct.CalcLangPixel, ptr %54, i32 0, i32 0, !dbg !598
  %56 = load ptr, ptr %55, align 8, !dbg !598
  store ptr %56, ptr %15, align 8, !dbg !599
  %57 = load ptr, ptr %21, align 8, !dbg !600
  %58 = getelementptr inbounds %struct.CalcLangPixel, ptr %57, i32 0, i32 1, !dbg !601
  %59 = load ptr, ptr %58, align 8, !dbg !601
  store ptr %59, ptr %16, align 8, !dbg !602
  call void @llvm.dbg.declare(metadata ptr %22, metadata !603, metadata !DIExpression()), !dbg !604
  %60 = load ptr, ptr %9, align 8, !dbg !605
  %61 = load ptr, ptr %10, align 8, !dbg !606
  %62 = load ptr, ptr %15, align 8, !dbg !607
  %63 = call ptr %60(ptr noundef %61, ptr noundef %62), !dbg !605
  %64 = call ptr @copyValue(ptr noundef %63), !dbg !608
  store ptr %64, ptr %22, align 8, !dbg !604
  %65 = load ptr, ptr %10, align 8, !dbg !609
  call void @arenaReset(ptr noundef %65), !dbg !610
  %66 = load ptr, ptr %10, align 8, !dbg !611
  %67 = load ptr, ptr %22, align 8, !dbg !613
  %68 = load ptr, ptr %16, align 8, !dbg !614
  %69 = load ptr, ptr %18, align 8, !dbg !615
  %70 = call zeroext i1 @closeTo(ptr noundef %66, ptr noundef %67, ptr noundef %68, ptr noundef %69), !dbg !616
  br i1 %70, label %71, label %79, !dbg !617

71:                                               ; preds = %45
  %72 = load ptr, ptr %10, align 8, !dbg !618
  %73 = load ptr, ptr %22, align 8, !dbg !619
  %74 = load ptr, ptr %16, align 8, !dbg !620
  %75 = load ptr, ptr %12, align 8, !dbg !621
  %76 = call signext i8 @yCompress(ptr noundef %72, ptr noundef %73, ptr noundef %74, ptr noundef %75), !dbg !622
  %77 = load ptr, ptr %21, align 8, !dbg !623
  %78 = getelementptr inbounds %struct.CalcLangPixel, ptr %77, i32 0, i32 2, !dbg !624
  store i8 %76, ptr %78, align 8, !dbg !625
  br label %79, !dbg !623

79:                                               ; preds = %71, %45
  %80 = load ptr, ptr %22, align 8, !dbg !626
  call void @freeCalcLangValue(ptr noundef %80), !dbg !627
  br label %81, !dbg !628

81:                                               ; preds = %79
  %82 = load i32, ptr %20, align 4, !dbg !629
  %83 = add nsw i32 %82, 1, !dbg !629
  store i32 %83, ptr %20, align 4, !dbg !629
  br label %39, !dbg !630, !llvm.loop !631

84:                                               ; preds = %39
  br label %85, !dbg !633

85:                                               ; preds = %84
  %86 = load i32, ptr %19, align 4, !dbg !634
  %87 = add nsw i32 %86, 1, !dbg !634
  store i32 %87, ptr %19, align 4, !dbg !634
  br label %32, !dbg !635, !llvm.loop !636

88:                                               ; preds = %32
  ret void, !dbg !638
}

declare ptr @realCalcLangValue(ptr noundef, x86_fp80 noundef) #2

declare void @freeCalcLangValue(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printDisplayCordinates(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !639 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !640, metadata !DIExpression()), !dbg !641
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !642, metadata !DIExpression()), !dbg !643
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !644, metadata !DIExpression()), !dbg !645
  call void @llvm.dbg.declare(metadata ptr %7, metadata !646, metadata !DIExpression()), !dbg !648
  store i32 0, ptr %7, align 4, !dbg !648
  br label %9, !dbg !649

9:                                                ; preds = %52, %3
  %10 = load i32, ptr %7, align 4, !dbg !650
  %11 = load ptr, ptr %5, align 8, !dbg !652
  %12 = getelementptr inbounds %struct.CalcLangVal, ptr %11, i32 0, i32 1, !dbg !653
  %13 = load i32, ptr %12, align 16, !dbg !654
  %14 = icmp slt i32 %10, %13, !dbg !655
  br i1 %14, label %15, label %55, !dbg !656

15:                                               ; preds = %9
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !657
  call void @llvm.dbg.declare(metadata ptr %8, metadata !659, metadata !DIExpression()), !dbg !661
  store i32 0, ptr %8, align 4, !dbg !661
  br label %17, !dbg !662

17:                                               ; preds = %47, %15
  %18 = load i32, ptr %8, align 4, !dbg !663
  %19 = load ptr, ptr %6, align 8, !dbg !665
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 1, !dbg !666
  %21 = load i32, ptr %20, align 16, !dbg !667
  %22 = icmp slt i32 %18, %21, !dbg !668
  br i1 %22, label %23, label %50, !dbg !669

23:                                               ; preds = %17
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !670
  %25 = load ptr, ptr %4, align 8, !dbg !672
  %26 = load i32, ptr %7, align 4, !dbg !673
  %27 = sext i32 %26 to i64, !dbg !672
  %28 = getelementptr inbounds ptr, ptr %25, i64 %27, !dbg !672
  %29 = load ptr, ptr %28, align 8, !dbg !672
  %30 = load i32, ptr %8, align 4, !dbg !674
  %31 = sext i32 %30 to i64, !dbg !672
  %32 = getelementptr inbounds %struct.CalcLangPixel, ptr %29, i64 %31, !dbg !672
  %33 = getelementptr inbounds %struct.CalcLangPixel, ptr %32, i32 0, i32 0, !dbg !675
  %34 = load ptr, ptr %33, align 8, !dbg !675
  call void @printValue(ptr noundef %34), !dbg !676
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !677
  %36 = load ptr, ptr %4, align 8, !dbg !678
  %37 = load i32, ptr %7, align 4, !dbg !679
  %38 = sext i32 %37 to i64, !dbg !678
  %39 = getelementptr inbounds ptr, ptr %36, i64 %38, !dbg !678
  %40 = load ptr, ptr %39, align 8, !dbg !678
  %41 = load i32, ptr %8, align 4, !dbg !680
  %42 = sext i32 %41 to i64, !dbg !678
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i64 %42, !dbg !678
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 1, !dbg !681
  %45 = load ptr, ptr %44, align 8, !dbg !681
  call void @printValue(ptr noundef %45), !dbg !682
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !dbg !683
  br label %47, !dbg !684

47:                                               ; preds = %23
  %48 = load i32, ptr %8, align 4, !dbg !685
  %49 = add nsw i32 %48, 1, !dbg !685
  store i32 %49, ptr %8, align 4, !dbg !685
  br label %17, !dbg !686, !llvm.loop !687

50:                                               ; preds = %17
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.5), !dbg !689
  br label %52, !dbg !690

52:                                               ; preds = %50
  %53 = load i32, ptr %7, align 4, !dbg !691
  %54 = add nsw i32 %53, 1, !dbg !691
  store i32 %54, ptr %7, align 4, !dbg !691
  br label %9, !dbg !692, !llvm.loop !693

55:                                               ; preds = %9
  ret void, !dbg !695
}

declare i32 @printf(ptr noundef, ...) #2

declare void @printValue(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !696 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !699, metadata !DIExpression()), !dbg !700
  store ptr %1, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !701, metadata !DIExpression()), !dbg !702
  store ptr %2, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !703, metadata !DIExpression()), !dbg !704
  store ptr %3, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !705, metadata !DIExpression()), !dbg !706
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !707, metadata !DIExpression()), !dbg !708
  store ptr %5, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !709, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.declare(metadata ptr %13, metadata !711, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.declare(metadata ptr %14, metadata !713, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.declare(metadata ptr %15, metadata !715, metadata !DIExpression()), !dbg !716
  %25 = load ptr, ptr %8, align 8, !dbg !717
  %26 = call ptr @realCalcLangValue(ptr noundef %25, x86_fp80 noundef 0xK40008666666666666800), !dbg !718
  %27 = call ptr @copyValue(ptr noundef %26), !dbg !719
  store ptr %27, ptr %15, align 8, !dbg !716
  call void @llvm.dbg.declare(metadata ptr %16, metadata !720, metadata !DIExpression()), !dbg !721
  %28 = load ptr, ptr %8, align 8, !dbg !722
  %29 = load ptr, ptr %10, align 8, !dbg !723
  %30 = load ptr, ptr %15, align 8, !dbg !724
  %31 = call ptr @divCalcLangValues(ptr noundef %28, ptr noundef %29, ptr noundef %30), !dbg !725
  %32 = call ptr @copyValue(ptr noundef %31), !dbg !726
  store ptr %32, ptr %16, align 8, !dbg !721
  call void @llvm.dbg.declare(metadata ptr %17, metadata !727, metadata !DIExpression()), !dbg !728
  %33 = load ptr, ptr %8, align 8, !dbg !729
  %34 = load ptr, ptr %9, align 8, !dbg !730
  %35 = load ptr, ptr %15, align 8, !dbg !731
  %36 = call ptr @divCalcLangValues(ptr noundef %33, ptr noundef %34, ptr noundef %35), !dbg !732
  %37 = call ptr @copyValue(ptr noundef %36), !dbg !733
  store ptr %37, ptr %17, align 8, !dbg !728
  call void @llvm.dbg.declare(metadata ptr %18, metadata !734, metadata !DIExpression()), !dbg !735
  %38 = load ptr, ptr %8, align 8, !dbg !736
  %39 = call ptr @integerCalcLangValue(ptr noundef %38, i32 noundef 0), !dbg !737
  %40 = call ptr @copyValue(ptr noundef %39), !dbg !738
  store ptr %40, ptr %18, align 8, !dbg !735
  %41 = load ptr, ptr %8, align 8, !dbg !739
  call void @arenaReset(ptr noundef %41), !dbg !740
  call void @llvm.dbg.declare(metadata ptr %19, metadata !741, metadata !DIExpression()), !dbg !743
  store i32 0, ptr %19, align 4, !dbg !743
  br label %42, !dbg !744

42:                                               ; preds = %118, %6
  %43 = load i32, ptr %19, align 4, !dbg !745
  %44 = load ptr, ptr %11, align 8, !dbg !747
  %45 = getelementptr inbounds %struct.CalcLangVal, ptr %44, i32 0, i32 1, !dbg !748
  %46 = load i32, ptr %45, align 16, !dbg !749
  %47 = icmp slt i32 %43, %46, !dbg !750
  br i1 %47, label %48, label %121, !dbg !751

48:                                               ; preds = %42
  call void @llvm.dbg.declare(metadata ptr %20, metadata !752, metadata !DIExpression()), !dbg !755
  store i32 0, ptr %20, align 4, !dbg !755
  br label %49, !dbg !756

49:                                               ; preds = %114, %48
  %50 = load i32, ptr %20, align 4, !dbg !757
  %51 = load ptr, ptr %12, align 8, !dbg !759
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 1, !dbg !760
  %53 = load i32, ptr %52, align 16, !dbg !761
  %54 = icmp slt i32 %50, %53, !dbg !762
  br i1 %54, label %55, label %117, !dbg !763

55:                                               ; preds = %49
  call void @llvm.dbg.declare(metadata ptr %21, metadata !764, metadata !DIExpression()), !dbg !766
  %56 = load ptr, ptr %7, align 8, !dbg !767
  %57 = load i32, ptr %19, align 4, !dbg !768
  %58 = sext i32 %57 to i64, !dbg !767
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58, !dbg !767
  %60 = load ptr, ptr %59, align 8, !dbg !767
  %61 = load i32, ptr %20, align 4, !dbg !769
  %62 = sext i32 %61 to i64, !dbg !767
  %63 = getelementptr inbounds %struct.CalcLangPixel, ptr %60, i64 %62, !dbg !767
  store ptr %63, ptr %21, align 8, !dbg !766
  %64 = load ptr, ptr %21, align 8, !dbg !770
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 0, !dbg !771
  %66 = load ptr, ptr %65, align 8, !dbg !771
  store ptr %66, ptr %13, align 8, !dbg !772
  %67 = load ptr, ptr %21, align 8, !dbg !773
  %68 = getelementptr inbounds %struct.CalcLangPixel, ptr %67, i32 0, i32 1, !dbg !774
  %69 = load ptr, ptr %68, align 8, !dbg !774
  store ptr %69, ptr %14, align 8, !dbg !775
  call void @llvm.dbg.declare(metadata ptr %22, metadata !776, metadata !DIExpression()), !dbg !777
  %70 = load ptr, ptr %8, align 8, !dbg !778
  %71 = load ptr, ptr %13, align 8, !dbg !779
  %72 = load ptr, ptr %18, align 8, !dbg !780
  %73 = load ptr, ptr %17, align 8, !dbg !781
  %74 = call zeroext i1 @closeTo(ptr noundef %70, ptr noundef %71, ptr noundef %72, ptr noundef %73), !dbg !782
  %75 = zext i1 %74 to i8, !dbg !777
  store i8 %75, ptr %22, align 1, !dbg !777
  call void @llvm.dbg.declare(metadata ptr %23, metadata !783, metadata !DIExpression()), !dbg !784
  %76 = load ptr, ptr %8, align 8, !dbg !785
  %77 = load ptr, ptr %14, align 8, !dbg !786
  %78 = load ptr, ptr %18, align 8, !dbg !787
  %79 = load ptr, ptr %16, align 8, !dbg !788
  %80 = call zeroext i1 @closeTo(ptr noundef %76, ptr noundef %77, ptr noundef %78, ptr noundef %79), !dbg !789
  %81 = zext i1 %80 to i8, !dbg !784
  store i8 %81, ptr %23, align 1, !dbg !784
  call void @llvm.dbg.declare(metadata ptr %24, metadata !790, metadata !DIExpression()), !dbg !791
  %82 = load i8, ptr %22, align 1, !dbg !792
  %83 = trunc i8 %82 to i1, !dbg !792
  br i1 %83, label %84, label %87, !dbg !793

84:                                               ; preds = %55
  %85 = load i8, ptr %23, align 1, !dbg !794
  %86 = trunc i8 %85 to i1, !dbg !794
  br label %87

87:                                               ; preds = %84, %55
  %88 = phi i1 [ false, %55 ], [ %86, %84 ], !dbg !795
  %89 = zext i1 %88 to i8, !dbg !791
  store i8 %89, ptr %24, align 1, !dbg !791
  %90 = load i8, ptr %24, align 1, !dbg !796
  %91 = trunc i8 %90 to i1, !dbg !796
  br i1 %91, label %92, label %95, !dbg !798

92:                                               ; preds = %87
  %93 = load ptr, ptr %21, align 8, !dbg !799
  %94 = getelementptr inbounds %struct.CalcLangPixel, ptr %93, i32 0, i32 2, !dbg !800
  store i8 43, ptr %94, align 8, !dbg !801
  br label %112, !dbg !799

95:                                               ; preds = %87
  %96 = load i8, ptr %22, align 1, !dbg !802
  %97 = trunc i8 %96 to i1, !dbg !802
  br i1 %97, label %98, label %101, !dbg !804

98:                                               ; preds = %95
  %99 = load ptr, ptr %21, align 8, !dbg !805
  %100 = getelementptr inbounds %struct.CalcLangPixel, ptr %99, i32 0, i32 2, !dbg !806
  store i8 124, ptr %100, align 8, !dbg !807
  br label %111, !dbg !805

101:                                              ; preds = %95
  %102 = load i8, ptr %23, align 1, !dbg !808
  %103 = trunc i8 %102 to i1, !dbg !808
  br i1 %103, label %104, label %107, !dbg !810

104:                                              ; preds = %101
  %105 = load ptr, ptr %21, align 8, !dbg !811
  %106 = getelementptr inbounds %struct.CalcLangPixel, ptr %105, i32 0, i32 2, !dbg !812
  store i8 45, ptr %106, align 8, !dbg !813
  br label %110, !dbg !811

107:                                              ; preds = %101
  %108 = load ptr, ptr %21, align 8, !dbg !814
  %109 = getelementptr inbounds %struct.CalcLangPixel, ptr %108, i32 0, i32 2, !dbg !815
  store i8 32, ptr %109, align 8, !dbg !816
  br label %110

110:                                              ; preds = %107, %104
  br label %111

111:                                              ; preds = %110, %98
  br label %112

112:                                              ; preds = %111, %92
  %113 = load ptr, ptr %8, align 8, !dbg !817
  call void @arenaReset(ptr noundef %113), !dbg !818
  br label %114, !dbg !819

114:                                              ; preds = %112
  %115 = load i32, ptr %20, align 4, !dbg !820
  %116 = add nsw i32 %115, 1, !dbg !820
  store i32 %116, ptr %20, align 4, !dbg !820
  br label %49, !dbg !821, !llvm.loop !822

117:                                              ; preds = %49
  br label %118, !dbg !824

118:                                              ; preds = %117
  %119 = load i32, ptr %19, align 4, !dbg !825
  %120 = add nsw i32 %119, 1, !dbg !825
  store i32 %120, ptr %19, align 4, !dbg !825
  br label %42, !dbg !826, !llvm.loop !827

121:                                              ; preds = %42
  %122 = load ptr, ptr %15, align 8, !dbg !829
  call void @freeCalcLangValue(ptr noundef %122), !dbg !830
  %123 = load ptr, ptr %16, align 8, !dbg !831
  call void @freeCalcLangValue(ptr noundef %123), !dbg !832
  %124 = load ptr, ptr %17, align 8, !dbg !833
  call void @freeCalcLangValue(ptr noundef %124), !dbg !834
  %125 = load ptr, ptr %18, align 8, !dbg !835
  call void @freeCalcLangValue(ptr noundef %125), !dbg !836
  ret void, !dbg !837
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, ptr noundef %1) #0 !dbg !838 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !841, metadata !DIExpression()), !dbg !842
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !843, metadata !DIExpression()), !dbg !844
  call void @llvm.dbg.declare(metadata ptr %5, metadata !845, metadata !DIExpression()), !dbg !847
  store i32 0, ptr %5, align 4, !dbg !847
  br label %6, !dbg !848

6:                                                ; preds = %32, %2
  %7 = load i32, ptr %5, align 4, !dbg !849
  %8 = load ptr, ptr %4, align 8, !dbg !851
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 1, !dbg !852
  %10 = load i32, ptr %9, align 16, !dbg !853
  %11 = icmp slt i32 %7, %10, !dbg !854
  br i1 %11, label %12, label %35, !dbg !855

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8, !dbg !856
  %14 = load i32, ptr %5, align 4, !dbg !858
  %15 = sext i32 %14 to i64, !dbg !856
  %16 = getelementptr inbounds ptr, ptr %13, i64 %15, !dbg !856
  %17 = load ptr, ptr %16, align 8, !dbg !856
  %18 = getelementptr inbounds %struct.CalcLangPixel, ptr %17, i32 0, i32 0, !dbg !859
  %19 = load ptr, ptr %18, align 8, !dbg !859
  call void @freeCalcLangValue(ptr noundef %19), !dbg !860
  %20 = load ptr, ptr %3, align 8, !dbg !861
  %21 = load i32, ptr %5, align 4, !dbg !862
  %22 = sext i32 %21 to i64, !dbg !861
  %23 = getelementptr inbounds ptr, ptr %20, i64 %22, !dbg !861
  %24 = load ptr, ptr %23, align 8, !dbg !861
  %25 = getelementptr inbounds %struct.CalcLangPixel, ptr %24, i32 0, i32 1, !dbg !863
  %26 = load ptr, ptr %25, align 8, !dbg !863
  call void @freeCalcLangValue(ptr noundef %26), !dbg !864
  %27 = load ptr, ptr %3, align 8, !dbg !865
  %28 = load i32, ptr %5, align 4, !dbg !866
  %29 = sext i32 %28 to i64, !dbg !865
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29, !dbg !865
  %31 = load ptr, ptr %30, align 8, !dbg !865
  call void @free(ptr noundef %31) #8, !dbg !867
  br label %32, !dbg !868

32:                                               ; preds = %12
  %33 = load i32, ptr %5, align 4, !dbg !869
  %34 = add nsw i32 %33, 1, !dbg !869
  store i32 %34, ptr %5, align 4, !dbg !869
  br label %6, !dbg !870, !llvm.loop !871

35:                                               ; preds = %6
  %36 = load ptr, ptr %3, align 8, !dbg !873
  call void @free(ptr noundef %36) #8, !dbg !874
  ret void, !dbg !875
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @findYMax(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !876 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !879, metadata !DIExpression()), !dbg !880
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !881, metadata !DIExpression()), !dbg !882
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !883, metadata !DIExpression()), !dbg !884
  store ptr %3, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !885, metadata !DIExpression()), !dbg !886
  store ptr %4, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !887, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.declare(metadata ptr %11, metadata !889, metadata !DIExpression()), !dbg !890
  %15 = load ptr, ptr %10, align 8, !dbg !891
  %16 = load ptr, ptr %6, align 8, !dbg !892
  %17 = load ptr, ptr %7, align 8, !dbg !893
  %18 = call ptr %15(ptr noundef %16, ptr noundef %17), !dbg !891
  %19 = call ptr @copyValue(ptr noundef %18), !dbg !894
  store ptr %19, ptr %11, align 8, !dbg !890
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !dbg !895
  %21 = load ptr, ptr %11, align 8, !dbg !896
  call void @printValue(ptr noundef %21), !dbg !897
  %22 = load ptr, ptr %11, align 8, !dbg !898
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %22), !dbg !899
  call void @llvm.dbg.declare(metadata ptr %12, metadata !900, metadata !DIExpression()), !dbg !901
  store ptr null, ptr %12, align 8, !dbg !901
  call void @llvm.dbg.declare(metadata ptr %13, metadata !902, metadata !DIExpression()), !dbg !904
  %24 = load ptr, ptr %6, align 8, !dbg !905
  %25 = load ptr, ptr %7, align 8, !dbg !906
  %26 = load ptr, ptr %9, align 8, !dbg !907
  %27 = call ptr @addCalcLangValues(ptr noundef %24, ptr noundef %25, ptr noundef %26), !dbg !908
  %28 = call ptr @copyValue(ptr noundef %27), !dbg !909
  store ptr %28, ptr %13, align 8, !dbg !904
  br label %29, !dbg !910

29:                                               ; preds = %63, %5
  %30 = load ptr, ptr %6, align 8, !dbg !911
  %31 = load ptr, ptr %13, align 8, !dbg !913
  %32 = load ptr, ptr %8, align 8, !dbg !914
  %33 = call ptr @lessThenOrEqualToCalcLangValues(ptr noundef %30, ptr noundef %31, ptr noundef %32), !dbg !915
  %34 = call zeroext i1 @toBool(ptr noundef %33), !dbg !916
  br i1 %34, label %35, label %71, !dbg !917

35:                                               ; preds = %29
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !dbg !918
  %37 = load ptr, ptr %13, align 8, !dbg !920
  call void @printValue(ptr noundef %37), !dbg !921
  %38 = load ptr, ptr %13, align 8, !dbg !922
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %38), !dbg !923
  call void @llvm.dbg.declare(metadata ptr %14, metadata !924, metadata !DIExpression()), !dbg !925
  %40 = load ptr, ptr %10, align 8, !dbg !926
  %41 = load ptr, ptr %6, align 8, !dbg !927
  %42 = load ptr, ptr %13, align 8, !dbg !928
  %43 = call ptr %40(ptr noundef %41, ptr noundef %42), !dbg !926
  %44 = call ptr @copyValue(ptr noundef %43), !dbg !929
  store ptr %44, ptr %14, align 8, !dbg !925
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !930
  %46 = load ptr, ptr %14, align 8, !dbg !931
  call void @printValue(ptr noundef %46), !dbg !932
  %47 = load ptr, ptr %14, align 8, !dbg !933
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %47), !dbg !934
  %49 = load ptr, ptr %6, align 8, !dbg !935
  %50 = load ptr, ptr %14, align 8, !dbg !937
  %51 = load ptr, ptr %11, align 8, !dbg !938
  %52 = call ptr @greaterThenCalcLangValues(ptr noundef %49, ptr noundef %50, ptr noundef %51), !dbg !939
  %53 = call zeroext i1 @toBool(ptr noundef %52), !dbg !940
  br i1 %53, label %54, label %61, !dbg !941

54:                                               ; preds = %35
  %55 = load ptr, ptr %11, align 8, !dbg !942
  call void @freeCalcLangValue(ptr noundef %55), !dbg !944
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !945
  %57 = load ptr, ptr %14, align 8, !dbg !946
  call void @printValue(ptr noundef %57), !dbg !947
  %58 = load ptr, ptr %14, align 8, !dbg !948
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %58), !dbg !949
  %60 = load ptr, ptr %14, align 8, !dbg !950
  store ptr %60, ptr %11, align 8, !dbg !951
  br label %61, !dbg !952

61:                                               ; preds = %54, %35
  %62 = load ptr, ptr %6, align 8, !dbg !953
  call void @arenaReset(ptr noundef %62), !dbg !954
  br label %63, !dbg !955

63:                                               ; preds = %61
  %64 = load ptr, ptr %13, align 8, !dbg !956
  store ptr %64, ptr %12, align 8, !dbg !957
  %65 = load ptr, ptr %6, align 8, !dbg !958
  %66 = load ptr, ptr %13, align 8, !dbg !959
  %67 = load ptr, ptr %9, align 8, !dbg !960
  %68 = call ptr @addCalcLangValues(ptr noundef %65, ptr noundef %66, ptr noundef %67), !dbg !961
  %69 = call ptr @copyValue(ptr noundef %68), !dbg !962
  store ptr %69, ptr %13, align 8, !dbg !963
  %70 = load ptr, ptr %12, align 8, !dbg !964
  call void @freeCalcLangValue(ptr noundef %70), !dbg !965
  br label %29, !dbg !966, !llvm.loop !967

71:                                               ; preds = %29
  %72 = load ptr, ptr %11, align 8, !dbg !969
  ret ptr %72, !dbg !970
}

declare ptr @lessThenOrEqualToCalcLangValues(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @findYMin(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !971 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !972, metadata !DIExpression()), !dbg !973
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !974, metadata !DIExpression()), !dbg !975
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !976, metadata !DIExpression()), !dbg !977
  store ptr %3, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !978, metadata !DIExpression()), !dbg !979
  store ptr %4, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !980, metadata !DIExpression()), !dbg !981
  call void @llvm.dbg.declare(metadata ptr %11, metadata !982, metadata !DIExpression()), !dbg !983
  %15 = load ptr, ptr %10, align 8, !dbg !984
  %16 = load ptr, ptr %6, align 8, !dbg !985
  %17 = load ptr, ptr %7, align 8, !dbg !986
  %18 = call ptr %15(ptr noundef %16, ptr noundef %17), !dbg !984
  %19 = call ptr @copyValue(ptr noundef %18), !dbg !987
  store ptr %19, ptr %11, align 8, !dbg !983
  call void @llvm.dbg.declare(metadata ptr %12, metadata !988, metadata !DIExpression()), !dbg !989
  store ptr null, ptr %12, align 8, !dbg !989
  call void @llvm.dbg.declare(metadata ptr %13, metadata !990, metadata !DIExpression()), !dbg !992
  %20 = load ptr, ptr %6, align 8, !dbg !993
  %21 = load ptr, ptr %7, align 8, !dbg !994
  %22 = load ptr, ptr %9, align 8, !dbg !995
  %23 = call ptr @addCalcLangValues(ptr noundef %20, ptr noundef %21, ptr noundef %22), !dbg !996
  %24 = call ptr @copyValue(ptr noundef %23), !dbg !997
  store ptr %24, ptr %13, align 8, !dbg !992
  br label %25, !dbg !998

25:                                               ; preds = %47, %5
  %26 = load ptr, ptr %6, align 8, !dbg !999
  %27 = load ptr, ptr %13, align 8, !dbg !1001
  %28 = load ptr, ptr %8, align 8, !dbg !1002
  %29 = call ptr @lessThenOrEqualToCalcLangValues(ptr noundef %26, ptr noundef %27, ptr noundef %28), !dbg !1003
  %30 = call zeroext i1 @toBool(ptr noundef %29), !dbg !1004
  br i1 %30, label %31, label %55, !dbg !1005

31:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %14, metadata !1006, metadata !DIExpression()), !dbg !1008
  %32 = load ptr, ptr %10, align 8, !dbg !1009
  %33 = load ptr, ptr %6, align 8, !dbg !1010
  %34 = load ptr, ptr %13, align 8, !dbg !1011
  %35 = call ptr %32(ptr noundef %33, ptr noundef %34), !dbg !1009
  %36 = call ptr @copyValue(ptr noundef %35), !dbg !1012
  store ptr %36, ptr %14, align 8, !dbg !1008
  %37 = load ptr, ptr %6, align 8, !dbg !1013
  %38 = load ptr, ptr %14, align 8, !dbg !1015
  %39 = load ptr, ptr %11, align 8, !dbg !1016
  %40 = call ptr @lessThenCalcLangValues(ptr noundef %37, ptr noundef %38, ptr noundef %39), !dbg !1017
  %41 = call zeroext i1 @toBool(ptr noundef %40), !dbg !1018
  br i1 %41, label %42, label %45, !dbg !1019

42:                                               ; preds = %31
  %43 = load ptr, ptr %11, align 8, !dbg !1020
  call void @freeCalcLangValue(ptr noundef %43), !dbg !1022
  %44 = load ptr, ptr %14, align 8, !dbg !1023
  store ptr %44, ptr %11, align 8, !dbg !1024
  br label %45, !dbg !1025

45:                                               ; preds = %42, %31
  %46 = load ptr, ptr %6, align 8, !dbg !1026
  call void @arenaReset(ptr noundef %46), !dbg !1027
  br label %47, !dbg !1028

47:                                               ; preds = %45
  %48 = load ptr, ptr %13, align 8, !dbg !1029
  store ptr %48, ptr %12, align 8, !dbg !1030
  %49 = load ptr, ptr %6, align 8, !dbg !1031
  %50 = load ptr, ptr %13, align 8, !dbg !1032
  %51 = load ptr, ptr %9, align 8, !dbg !1033
  %52 = call ptr @addCalcLangValues(ptr noundef %49, ptr noundef %50, ptr noundef %51), !dbg !1034
  %53 = call ptr @copyValue(ptr noundef %52), !dbg !1035
  store ptr %53, ptr %13, align 8, !dbg !1036
  %54 = load ptr, ptr %12, align 8, !dbg !1037
  call void @freeCalcLangValue(ptr noundef %54), !dbg !1038
  br label %25, !dbg !1039, !llvm.loop !1040

55:                                               ; preds = %25
  %56 = load ptr, ptr %11, align 8, !dbg !1042
  ret ptr %56, !dbg !1043
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !1044 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1047, metadata !DIExpression()), !dbg !1048
  store ptr %1, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1049, metadata !DIExpression()), !dbg !1050
  store ptr %2, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1051, metadata !DIExpression()), !dbg !1052
  store ptr %3, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1053, metadata !DIExpression()), !dbg !1054
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1055, metadata !DIExpression()), !dbg !1056
  call void @llvm.dbg.declare(metadata ptr %12, metadata !1057, metadata !DIExpression()), !dbg !1066
  %30 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #8, !dbg !1067
  %31 = icmp eq i32 %30, -1, !dbg !1069
  br i1 %31, label %32, label %33, !dbg !1070

32:                                               ; preds = %5
  call void @perror(ptr noundef @.str.11) #9, !dbg !1071
  store i1 false, ptr %6, align 1, !dbg !1073
  br label %180, !dbg !1073

33:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !1074, metadata !DIExpression()), !dbg !1075
  %34 = load ptr, ptr %8, align 8, !dbg !1076
  %35 = call ptr @copyValue(ptr noundef %34), !dbg !1077
  store ptr %35, ptr %13, align 8, !dbg !1075
  call void @llvm.dbg.declare(metadata ptr %14, metadata !1078, metadata !DIExpression()), !dbg !1079
  %36 = load ptr, ptr %9, align 8, !dbg !1080
  %37 = call ptr @copyValue(ptr noundef %36), !dbg !1081
  store ptr %37, ptr %14, align 8, !dbg !1079
  call void @llvm.dbg.declare(metadata ptr %15, metadata !1082, metadata !DIExpression()), !dbg !1083
  %38 = load ptr, ptr %10, align 8, !dbg !1084
  %39 = call ptr @copyValue(ptr noundef %38), !dbg !1085
  store ptr %39, ptr %15, align 8, !dbg !1083
  %40 = load ptr, ptr %7, align 8, !dbg !1086
  call void @arenaReset(ptr noundef %40), !dbg !1087
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.12), !dbg !1088
  %42 = load ptr, ptr %13, align 8, !dbg !1089
  call void @printValue(ptr noundef %42), !dbg !1090
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !dbg !1091
  %44 = load ptr, ptr %14, align 8, !dbg !1092
  call void @printValue(ptr noundef %44), !dbg !1093
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !dbg !1094
  %46 = load ptr, ptr %15, align 8, !dbg !1095
  call void @printValue(ptr noundef %46), !dbg !1096
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.15), !dbg !1097
  call void @llvm.dbg.declare(metadata ptr %16, metadata !1098, metadata !DIExpression()), !dbg !1099
  %48 = load ptr, ptr %7, align 8, !dbg !1100
  %49 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !1101
  %50 = load i16, ptr %49, align 2, !dbg !1101
  %51 = zext i16 %50 to i32, !dbg !1102
  %52 = call ptr @integerCalcLangValue(ptr noundef %48, i32 noundef %51), !dbg !1103
  %53 = call ptr @copyValue(ptr noundef %52), !dbg !1104
  store ptr %53, ptr %16, align 8, !dbg !1099
  call void @llvm.dbg.declare(metadata ptr %17, metadata !1105, metadata !DIExpression()), !dbg !1106
  %54 = load ptr, ptr %7, align 8, !dbg !1107
  %55 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !1108
  %56 = load i16, ptr %55, align 2, !dbg !1108
  %57 = zext i16 %56 to i32, !dbg !1109
  %58 = call ptr @integerCalcLangValue(ptr noundef %54, i32 noundef %57), !dbg !1110
  %59 = call ptr @copyValue(ptr noundef %58), !dbg !1111
  store ptr %59, ptr %17, align 8, !dbg !1106
  call void @llvm.dbg.declare(metadata ptr %18, metadata !1112, metadata !DIExpression()), !dbg !1113
  %60 = load ptr, ptr %7, align 8, !dbg !1114
  %61 = call ptr @integerCalcLangValue(ptr noundef %60, i32 noundef 2), !dbg !1115
  %62 = call ptr @copyValue(ptr noundef %61), !dbg !1116
  store ptr %62, ptr %18, align 8, !dbg !1113
  call void @llvm.dbg.declare(metadata ptr %19, metadata !1117, metadata !DIExpression()), !dbg !1118
  %63 = load ptr, ptr %7, align 8, !dbg !1119
  %64 = load ptr, ptr %7, align 8, !dbg !1120
  %65 = load ptr, ptr %7, align 8, !dbg !1121
  %66 = load ptr, ptr %14, align 8, !dbg !1122
  %67 = load ptr, ptr %13, align 8, !dbg !1123
  %68 = call ptr @subCalcLangValues(ptr noundef %65, ptr noundef %66, ptr noundef %67), !dbg !1124
  %69 = load ptr, ptr %16, align 8, !dbg !1125
  %70 = call ptr @divCalcLangValues(ptr noundef %64, ptr noundef %68, ptr noundef %69), !dbg !1126
  %71 = load ptr, ptr %18, align 8, !dbg !1127
  %72 = call ptr @multCalcLangValues(ptr noundef %63, ptr noundef %70, ptr noundef %71), !dbg !1128
  %73 = call ptr @copyValue(ptr noundef %72), !dbg !1129
  store ptr %73, ptr %19, align 8, !dbg !1118
  call void @llvm.dbg.declare(metadata ptr %20, metadata !1130, metadata !DIExpression()), !dbg !1131
  %74 = load ptr, ptr %7, align 8, !dbg !1132
  %75 = load ptr, ptr %16, align 8, !dbg !1133
  %76 = load ptr, ptr %18, align 8, !dbg !1134
  %77 = call ptr @divCalcLangValues(ptr noundef %74, ptr noundef %75, ptr noundef %76), !dbg !1135
  %78 = call ptr @copyValue(ptr noundef %77), !dbg !1136
  store ptr %78, ptr %20, align 8, !dbg !1131
  call void @llvm.dbg.declare(metadata ptr %21, metadata !1137, metadata !DIExpression()), !dbg !1138
  %79 = load ptr, ptr %7, align 8, !dbg !1139
  %80 = load ptr, ptr %7, align 8, !dbg !1140
  %81 = load ptr, ptr %19, align 8, !dbg !1141
  %82 = load ptr, ptr %20, align 8, !dbg !1142
  %83 = call ptr @multCalcLangValues(ptr noundef %80, ptr noundef %81, ptr noundef %82), !dbg !1143
  %84 = call ptr @negateCalcLangValue(ptr noundef %79, ptr noundef %83), !dbg !1144
  %85 = call ptr @copyValue(ptr noundef %84), !dbg !1145
  store ptr %85, ptr %21, align 8, !dbg !1138
  call void @llvm.dbg.declare(metadata ptr %22, metadata !1146, metadata !DIExpression()), !dbg !1147
  %86 = load ptr, ptr %7, align 8, !dbg !1148
  %87 = load ptr, ptr %19, align 8, !dbg !1149
  %88 = load ptr, ptr %20, align 8, !dbg !1150
  %89 = call ptr @multCalcLangValues(ptr noundef %86, ptr noundef %87, ptr noundef %88), !dbg !1151
  %90 = call ptr @copyValue(ptr noundef %89), !dbg !1152
  store ptr %90, ptr %22, align 8, !dbg !1147
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.16), !dbg !1153
  %92 = load ptr, ptr %16, align 8, !dbg !1154
  call void @printValue(ptr noundef %92), !dbg !1155
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.17), !dbg !1156
  %94 = load ptr, ptr %17, align 8, !dbg !1157
  call void @printValue(ptr noundef %94), !dbg !1158
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.18), !dbg !1159
  %96 = load ptr, ptr %18, align 8, !dbg !1160
  call void @printValue(ptr noundef %96), !dbg !1161
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.19), !dbg !1162
  %98 = load ptr, ptr %19, align 8, !dbg !1163
  call void @printValue(ptr noundef %98), !dbg !1164
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.20), !dbg !1165
  %100 = load ptr, ptr %20, align 8, !dbg !1166
  call void @printValue(ptr noundef %100), !dbg !1167
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.21), !dbg !1168
  %102 = load ptr, ptr %21, align 8, !dbg !1169
  call void @printValue(ptr noundef %102), !dbg !1170
  %103 = call i32 (ptr, ...) @printf(ptr noundef @.str.22), !dbg !1171
  %104 = load ptr, ptr %22, align 8, !dbg !1172
  call void @printValue(ptr noundef %104), !dbg !1173
  %105 = call i32 (ptr, ...) @printf(ptr noundef @.str.15), !dbg !1174
  %106 = load ptr, ptr %7, align 8, !dbg !1175
  call void @arenaReset(ptr noundef %106), !dbg !1176
  call void @llvm.dbg.declare(metadata ptr %23, metadata !1177, metadata !DIExpression()), !dbg !1178
  %107 = load ptr, ptr %7, align 8, !dbg !1179
  %108 = load ptr, ptr %21, align 8, !dbg !1180
  %109 = load ptr, ptr %22, align 8, !dbg !1181
  %110 = load ptr, ptr %19, align 8, !dbg !1182
  %111 = load ptr, ptr %11, align 8, !dbg !1183
  %112 = call ptr @findYMax(ptr noundef %107, ptr noundef %108, ptr noundef %109, ptr noundef %110, ptr noundef %111), !dbg !1184
  %113 = call ptr @copyValue(ptr noundef %112), !dbg !1185
  store ptr %113, ptr %23, align 8, !dbg !1178
  call void @llvm.dbg.declare(metadata ptr %24, metadata !1186, metadata !DIExpression()), !dbg !1187
  %114 = load ptr, ptr %7, align 8, !dbg !1188
  %115 = load ptr, ptr %21, align 8, !dbg !1189
  %116 = load ptr, ptr %22, align 8, !dbg !1190
  %117 = load ptr, ptr %19, align 8, !dbg !1191
  %118 = load ptr, ptr %11, align 8, !dbg !1192
  %119 = call ptr @findYMin(ptr noundef %114, ptr noundef %115, ptr noundef %116, ptr noundef %117, ptr noundef %118), !dbg !1193
  %120 = call ptr @copyValue(ptr noundef %119), !dbg !1194
  store ptr %120, ptr %24, align 8, !dbg !1187
  call void @llvm.dbg.declare(metadata ptr %25, metadata !1195, metadata !DIExpression()), !dbg !1196
  %121 = load ptr, ptr %7, align 8, !dbg !1197
  %122 = load ptr, ptr %7, align 8, !dbg !1198
  %123 = load ptr, ptr %23, align 8, !dbg !1199
  %124 = load ptr, ptr %24, align 8, !dbg !1200
  %125 = call ptr @subCalcLangValues(ptr noundef %122, ptr noundef %123, ptr noundef %124), !dbg !1201
  %126 = load ptr, ptr %17, align 8, !dbg !1202
  %127 = call ptr @divCalcLangValues(ptr noundef %121, ptr noundef %125, ptr noundef %126), !dbg !1203
  %128 = call ptr @copyValue(ptr noundef %127), !dbg !1204
  store ptr %128, ptr %25, align 8, !dbg !1196
  call void @llvm.dbg.declare(metadata ptr %26, metadata !1205, metadata !DIExpression()), !dbg !1206
  %129 = load ptr, ptr %7, align 8, !dbg !1207
  %130 = load ptr, ptr %17, align 8, !dbg !1208
  %131 = load ptr, ptr %18, align 8, !dbg !1209
  %132 = call ptr @divCalcLangValues(ptr noundef %129, ptr noundef %130, ptr noundef %131), !dbg !1210
  %133 = call ptr @copyValue(ptr noundef %132), !dbg !1211
  store ptr %133, ptr %26, align 8, !dbg !1206
  call void @llvm.dbg.declare(metadata ptr %27, metadata !1212, metadata !DIExpression()), !dbg !1213
  %134 = load ptr, ptr %7, align 8, !dbg !1214
  %135 = load ptr, ptr %7, align 8, !dbg !1215
  %136 = load ptr, ptr %25, align 8, !dbg !1216
  %137 = load ptr, ptr %26, align 8, !dbg !1217
  %138 = call ptr @multCalcLangValues(ptr noundef %135, ptr noundef %136, ptr noundef %137), !dbg !1218
  %139 = call ptr @negateCalcLangValue(ptr noundef %134, ptr noundef %138), !dbg !1219
  %140 = call ptr @copyValue(ptr noundef %139), !dbg !1220
  store ptr %140, ptr %27, align 8, !dbg !1213
  call void @llvm.dbg.declare(metadata ptr %28, metadata !1221, metadata !DIExpression()), !dbg !1222
  %141 = load ptr, ptr %7, align 8, !dbg !1223
  %142 = load ptr, ptr %25, align 8, !dbg !1224
  %143 = load ptr, ptr %26, align 8, !dbg !1225
  %144 = call ptr @multCalcLangValues(ptr noundef %141, ptr noundef %142, ptr noundef %143), !dbg !1226
  %145 = call ptr @copyValue(ptr noundef %144), !dbg !1227
  store ptr %145, ptr %28, align 8, !dbg !1222
  %146 = load ptr, ptr %7, align 8, !dbg !1228
  call void @arenaReset(ptr noundef %146), !dbg !1229
  call void @llvm.dbg.declare(metadata ptr %29, metadata !1230, metadata !DIExpression()), !dbg !1231
  %147 = load ptr, ptr %7, align 8, !dbg !1232
  %148 = load ptr, ptr %19, align 8, !dbg !1233
  %149 = load ptr, ptr %25, align 8, !dbg !1234
  %150 = load ptr, ptr %21, align 8, !dbg !1235
  %151 = load ptr, ptr %28, align 8, !dbg !1236
  %152 = load ptr, ptr %17, align 8, !dbg !1237
  %153 = load ptr, ptr %16, align 8, !dbg !1238
  %154 = call ptr @quantifyPlane(ptr noundef %147, ptr noundef %148, ptr noundef %149, ptr noundef %150, ptr noundef %151, ptr noundef %152, ptr noundef %153), !dbg !1239
  store ptr %154, ptr %29, align 8, !dbg !1231
  %155 = load ptr, ptr %29, align 8, !dbg !1240
  %156 = load ptr, ptr %7, align 8, !dbg !1241
  %157 = load ptr, ptr %19, align 8, !dbg !1242
  %158 = load ptr, ptr %25, align 8, !dbg !1243
  %159 = load ptr, ptr %17, align 8, !dbg !1244
  %160 = load ptr, ptr %16, align 8, !dbg !1245
  call void @drawPlane(ptr noundef %155, ptr noundef %156, ptr noundef %157, ptr noundef %158, ptr noundef %159, ptr noundef %160), !dbg !1246
  %161 = load ptr, ptr %29, align 8, !dbg !1247
  %162 = load ptr, ptr %11, align 8, !dbg !1248
  %163 = load ptr, ptr %7, align 8, !dbg !1249
  %164 = load ptr, ptr %19, align 8, !dbg !1250
  %165 = load ptr, ptr %25, align 8, !dbg !1251
  %166 = load ptr, ptr %17, align 8, !dbg !1252
  %167 = load ptr, ptr %16, align 8, !dbg !1253
  call void @drawLine(ptr noundef %161, ptr noundef %162, ptr noundef %163, ptr noundef %164, ptr noundef %165, ptr noundef %166, ptr noundef %167), !dbg !1254
  %168 = load ptr, ptr %29, align 8, !dbg !1255
  %169 = load ptr, ptr %17, align 8, !dbg !1256
  %170 = load ptr, ptr %16, align 8, !dbg !1257
  call void @printPlane(ptr noundef %168, ptr noundef %169, ptr noundef %170), !dbg !1258
  %171 = load ptr, ptr %29, align 8, !dbg !1259
  %172 = load ptr, ptr %17, align 8, !dbg !1260
  call void @clearDisplay(ptr noundef %171, ptr noundef %172), !dbg !1261
  %173 = load ptr, ptr %13, align 8, !dbg !1262
  call void @freeCalcLangValue(ptr noundef %173), !dbg !1263
  %174 = load ptr, ptr %14, align 8, !dbg !1264
  call void @freeCalcLangValue(ptr noundef %174), !dbg !1265
  %175 = load ptr, ptr %15, align 8, !dbg !1266
  call void @freeCalcLangValue(ptr noundef %175), !dbg !1267
  %176 = load ptr, ptr %16, align 8, !dbg !1268
  call void @freeCalcLangValue(ptr noundef %176), !dbg !1269
  %177 = load ptr, ptr %17, align 8, !dbg !1270
  call void @freeCalcLangValue(ptr noundef %177), !dbg !1271
  %178 = load ptr, ptr %18, align 8, !dbg !1272
  call void @freeCalcLangValue(ptr noundef %178), !dbg !1273
  %179 = load ptr, ptr %19, align 8, !dbg !1274
  call void @freeCalcLangValue(ptr noundef %179), !dbg !1275
  store i1 true, ptr %6, align 1, !dbg !1276
  br label %180, !dbg !1276

180:                                              ; preds = %33, %32
  %181 = load i1, ptr %6, align 1, !dbg !1277
  ret i1 %181, !dbg !1277
}

; Function Attrs: nounwind
declare i32 @ioctl(i32 noundef, i64 noundef, ...) #5

; Function Attrs: cold
declare void @perror(ptr noundef) #6

declare ptr @negateCalcLangValue(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.dbg.cu = !{!81}
!llvm.module.flags = !{!127, !128, !129, !130, !131, !132, !133}
!llvm.ident = !{!134}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "2d06795e8c29df9c1ff5c786e162139d")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 9)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 111, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 2)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 113, type: !9, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 115, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 3)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 117, type: !9, isLocal: true, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(scope: null, file: !2, line: 119, type: !16, isLocal: true, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !2, line: 175, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 15)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !2, line: 177, type: !30, isLocal: true, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 8)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(scope: null, file: !2, line: 182, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !2, line: 188, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 6)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !2, line: 195, type: !45, isLocal: true, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 17)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(scope: null, file: !2, line: 225, type: !50, isLocal: true, isDefinition: true)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 13)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(scope: null, file: !2, line: 235, type: !3, isLocal: true, isDefinition: true)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !2, line: 237, type: !30, isLocal: true, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !2, line: 239, type: !35, isLocal: true, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !2, line: 241, type: !9, isLocal: true, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !2, line: 252, type: !50, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(scope: null, file: !2, line: 254, type: !25, isLocal: true, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !2, line: 256, type: !40, isLocal: true, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !2, line: 258, type: !30, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !2, line: 260, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 12)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !2, line: 262, type: !3, isLocal: true, isDefinition: true)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(scope: null, file: !2, line: 264, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 7)
!81 = distinct !DICompileUnit(language: DW_LANG_C11, file: !82, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !83, globals: !126, splitDebugInlining: false, nameTableKind: None)
!82 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "2d06795e8c29df9c1ff5c786e162139d")
!83 = !{!84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangPixel", file: !86, line: 12, baseType: !87)
!86 = !DIFile(filename: "lib/include/c/CalcLangCGraph.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "076501b26a89fa5aa059ebc379edb11f")
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !86, line: 8, size: 192, elements: !88)
!88 = !{!89, !124, !125}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !87, file: !86, line: 9, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !92, line: 40, baseType: !93)
!92 = !DIFile(filename: "lib/include/c/CalcLangCInt.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "302a941c25e4b1a2ee2b998a348ce651")
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !92, line: 37, size: 256, elements: !94)
!94 = !{!95, !97}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !93, file: !92, line: 38, baseType: !96, size: 32)
!96 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !93, file: !92, line: 39, baseType: !98, size: 128, offset: 128)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !92, line: 35, baseType: !99)
!99 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !92, line: 27, size: 128, elements: !100)
!100 = !{!101, !110, !117, !118, !120, !121, !122}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !99, file: !92, line: 28, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !92, line: 20, baseType: !104)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !92, line: 17, size: 128, elements: !105)
!105 = !{!106, !107}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !104, file: !92, line: 18, baseType: !96, size: 32)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !104, file: !92, line: 19, baseType: !108, size: 64, offset: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !99, file: !92, line: 29, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !92, line: 25, baseType: !113)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !92, line: 22, size: 128, elements: !114)
!114 = !{!115, !116}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !113, file: !92, line: 23, baseType: !96, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !113, file: !92, line: 24, baseType: !108, size: 64, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !99, file: !92, line: 30, baseType: !96, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !99, file: !92, line: 31, baseType: !119, size: 128)
!119 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !99, file: !92, line: 32, baseType: !119, size: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !99, file: !92, line: 33, baseType: !119, size: 128)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !99, file: !92, line: 34, baseType: !123, size: 8)
!123 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !87, file: !86, line: 10, baseType: !90, size: 64, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "display", scope: !87, file: !86, line: 11, baseType: !4, size: 8, offset: 128)
!126 = !{!0, !7, !12, !14, !19, !21, !23, !28, !33, !38, !43, !48, !53, !55, !57, !59, !61, !63, !65, !67, !69, !74, !76}
!127 = !{i32 7, !"Dwarf Version", i32 5}
!128 = !{i32 2, !"Debug Info Version", i32 3}
!129 = !{i32 1, !"wchar_size", i32 4}
!130 = !{i32 8, !"PIC Level", i32 2}
!131 = !{i32 7, !"PIE Level", i32 2}
!132 = !{i32 7, !"uwtable", i32 2}
!133 = !{i32 7, !"frame-pointer", i32 2}
!134 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!135 = distinct !DISubprogram(name: "closeTo", scope: !2, file: !2, line: 13, type: !136, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!136 = !DISubroutineType(types: !137)
!137 = !{!123, !138, !90, !90, !90}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !140, line: 8, baseType: !141)
!140 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !140, line: 4, size: 128, elements: !142)
!142 = !{!143, !145, !147}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !141, file: !140, line: 5, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !141, file: !140, line: 6, baseType: !146, size: 32, offset: 64)
!146 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !141, file: !140, line: 7, baseType: !96, size: 32, offset: 96)
!148 = !{}
!149 = !DILocalVariable(name: "arena", arg: 1, scope: !135, file: !2, line: 13, type: !138)
!150 = !DILocation(line: 13, column: 28, scope: !135)
!151 = !DILocalVariable(name: "x", arg: 2, scope: !135, file: !2, line: 13, type: !90)
!152 = !DILocation(line: 13, column: 50, scope: !135)
!153 = !DILocalVariable(name: "y", arg: 3, scope: !135, file: !2, line: 13, type: !90)
!154 = !DILocation(line: 13, column: 68, scope: !135)
!155 = !DILocalVariable(name: "deviation", arg: 4, scope: !135, file: !2, line: 13, type: !90)
!156 = !DILocation(line: 13, column: 86, scope: !135)
!157 = !DILocation(line: 14, column: 39, scope: !158)
!158 = distinct !DILexicalBlock(scope: !135, file: !2, line: 14, column: 6)
!159 = !DILocation(line: 14, column: 46, scope: !158)
!160 = !DILocation(line: 14, column: 49, scope: !158)
!161 = !DILocation(line: 14, column: 13, scope: !158)
!162 = !DILocation(line: 14, column: 6, scope: !158)
!163 = !DILocation(line: 14, column: 6, scope: !135)
!164 = !DILocation(line: 15, column: 42, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !2, line: 14, column: 53)
!166 = !DILocation(line: 15, column: 67, scope: !165)
!167 = !DILocation(line: 15, column: 74, scope: !165)
!168 = !DILocation(line: 15, column: 77, scope: !165)
!169 = !DILocation(line: 15, column: 49, scope: !165)
!170 = !DILocation(line: 15, column: 81, scope: !165)
!171 = !DILocation(line: 15, column: 19, scope: !165)
!172 = !DILocation(line: 15, column: 12, scope: !165)
!173 = !DILocation(line: 15, column: 5, scope: !165)
!174 = !DILocation(line: 17, column: 42, scope: !175)
!175 = distinct !DILexicalBlock(scope: !158, file: !2, line: 16, column: 10)
!176 = !DILocation(line: 17, column: 67, scope: !175)
!177 = !DILocation(line: 17, column: 74, scope: !175)
!178 = !DILocation(line: 17, column: 77, scope: !175)
!179 = !DILocation(line: 17, column: 49, scope: !175)
!180 = !DILocation(line: 17, column: 81, scope: !175)
!181 = !DILocation(line: 17, column: 19, scope: !175)
!182 = !DILocation(line: 17, column: 12, scope: !175)
!183 = !DILocation(line: 17, column: 5, scope: !175)
!184 = !DILocation(line: 19, column: 1, scope: !135)
!185 = distinct !DISubprogram(name: "initializeDisplay", scope: !2, file: !2, line: 21, type: !186, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!186 = !DISubroutineType(types: !187)
!187 = !{!188, !90, !90}
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!189 = !DILocalVariable(name: "windowHeight", arg: 1, scope: !185, file: !2, line: 21, type: !90)
!190 = !DILocation(line: 21, column: 50, scope: !185)
!191 = !DILocalVariable(name: "windowWidth", arg: 2, scope: !185, file: !2, line: 21, type: !90)
!192 = !DILocation(line: 21, column: 79, scope: !185)
!193 = !DILocalVariable(name: "display", scope: !185, file: !2, line: 22, type: !188)
!194 = !DILocation(line: 22, column: 19, scope: !185)
!195 = !DILocation(line: 22, column: 61, scope: !185)
!196 = !DILocation(line: 22, column: 75, scope: !185)
!197 = !DILocation(line: 22, column: 83, scope: !185)
!198 = !DILocation(line: 22, column: 59, scope: !185)
!199 = !DILocation(line: 22, column: 29, scope: !185)
!200 = !DILocation(line: 23, column: 10, scope: !185)
!201 = !DILocation(line: 23, column: 22, scope: !185)
!202 = !DILocation(line: 23, column: 36, scope: !185)
!203 = !DILocation(line: 23, column: 44, scope: !185)
!204 = !DILocation(line: 23, column: 3, scope: !185)
!205 = !DILocalVariable(name: "i", scope: !206, file: !2, line: 24, type: !96)
!206 = distinct !DILexicalBlock(scope: !185, file: !2, line: 24, column: 3)
!207 = !DILocation(line: 24, column: 11, scope: !206)
!208 = !DILocation(line: 24, column: 7, scope: !206)
!209 = !DILocation(line: 24, column: 18, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !2, line: 24, column: 3)
!211 = !DILocation(line: 24, column: 22, scope: !210)
!212 = !DILocation(line: 24, column: 36, scope: !210)
!213 = !DILocation(line: 24, column: 44, scope: !210)
!214 = !DILocation(line: 24, column: 20, scope: !210)
!215 = !DILocation(line: 24, column: 3, scope: !206)
!216 = !DILocation(line: 25, column: 65, scope: !217)
!217 = distinct !DILexicalBlock(scope: !210, file: !2, line: 24, column: 57)
!218 = !DILocation(line: 25, column: 78, scope: !217)
!219 = !DILocation(line: 25, column: 86, scope: !217)
!220 = !DILocation(line: 25, column: 63, scope: !217)
!221 = !DILocation(line: 25, column: 34, scope: !217)
!222 = !DILocation(line: 25, column: 5, scope: !217)
!223 = !DILocation(line: 25, column: 13, scope: !217)
!224 = !DILocation(line: 25, column: 16, scope: !217)
!225 = !DILocation(line: 26, column: 12, scope: !217)
!226 = !DILocation(line: 26, column: 20, scope: !217)
!227 = !DILocation(line: 26, column: 27, scope: !217)
!228 = !DILocation(line: 26, column: 40, scope: !217)
!229 = !DILocation(line: 26, column: 48, scope: !217)
!230 = !DILocation(line: 26, column: 5, scope: !217)
!231 = !DILocation(line: 27, column: 3, scope: !217)
!232 = !DILocation(line: 24, column: 54, scope: !210)
!233 = !DILocation(line: 24, column: 3, scope: !210)
!234 = distinct !{!234, !215, !235, !236}
!235 = !DILocation(line: 27, column: 3, scope: !206)
!236 = !{!"llvm.loop.mustprogress"}
!237 = !DILocation(line: 28, column: 10, scope: !185)
!238 = !DILocation(line: 28, column: 3, scope: !185)
!239 = distinct !DISubprogram(name: "quantifyPlane", scope: !2, file: !2, line: 31, type: !240, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!240 = !DISubroutineType(types: !241)
!241 = !{!188, !138, !90, !90, !90, !90, !90, !90}
!242 = !DILocalVariable(name: "arena", arg: 1, scope: !239, file: !2, line: 31, type: !138)
!243 = !DILocation(line: 31, column: 45, scope: !239)
!244 = !DILocalVariable(name: "xSteps", arg: 2, scope: !239, file: !2, line: 31, type: !90)
!245 = !DILocation(line: 31, column: 67, scope: !239)
!246 = !DILocalVariable(name: "ySteps", arg: 3, scope: !239, file: !2, line: 31, type: !90)
!247 = !DILocation(line: 31, column: 90, scope: !239)
!248 = !DILocalVariable(name: "xMin", arg: 4, scope: !239, file: !2, line: 31, type: !90)
!249 = !DILocation(line: 31, column: 113, scope: !239)
!250 = !DILocalVariable(name: "yMax", arg: 5, scope: !239, file: !2, line: 31, type: !90)
!251 = !DILocation(line: 31, column: 134, scope: !239)
!252 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !239, file: !2, line: 31, type: !90)
!253 = !DILocation(line: 31, column: 155, scope: !239)
!254 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !239, file: !2, line: 31, type: !90)
!255 = !DILocation(line: 31, column: 184, scope: !239)
!256 = !DILocalVariable(name: "display", scope: !239, file: !2, line: 32, type: !188)
!257 = !DILocation(line: 32, column: 19, scope: !239)
!258 = !DILocation(line: 32, column: 47, scope: !239)
!259 = !DILocation(line: 32, column: 61, scope: !239)
!260 = !DILocation(line: 32, column: 29, scope: !239)
!261 = !DILocalVariable(name: "y", scope: !262, file: !2, line: 34, type: !96)
!262 = distinct !DILexicalBlock(scope: !239, file: !2, line: 34, column: 3)
!263 = !DILocation(line: 34, column: 11, scope: !262)
!264 = !DILocation(line: 34, column: 7, scope: !262)
!265 = !DILocation(line: 34, column: 18, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !2, line: 34, column: 3)
!267 = !DILocation(line: 34, column: 22, scope: !266)
!268 = !DILocation(line: 34, column: 36, scope: !266)
!269 = !DILocation(line: 34, column: 44, scope: !266)
!270 = !DILocation(line: 34, column: 20, scope: !266)
!271 = !DILocation(line: 34, column: 3, scope: !262)
!272 = !DILocalVariable(name: "yVal", scope: !273, file: !2, line: 35, type: !90)
!273 = distinct !DILexicalBlock(scope: !266, file: !2, line: 34, column: 57)
!274 = !DILocation(line: 35, column: 20, scope: !273)
!275 = !DILocation(line: 35, column: 48, scope: !273)
!276 = !DILocation(line: 35, column: 55, scope: !273)
!277 = !DILocation(line: 35, column: 27, scope: !273)
!278 = !DILocalVariable(name: "x", scope: !279, file: !2, line: 36, type: !96)
!279 = distinct !DILexicalBlock(scope: !273, file: !2, line: 36, column: 5)
!280 = !DILocation(line: 36, column: 13, scope: !279)
!281 = !DILocation(line: 36, column: 9, scope: !279)
!282 = !DILocation(line: 36, column: 20, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !2, line: 36, column: 5)
!284 = !DILocation(line: 36, column: 24, scope: !283)
!285 = !DILocation(line: 36, column: 37, scope: !283)
!286 = !DILocation(line: 36, column: 45, scope: !283)
!287 = !DILocation(line: 36, column: 22, scope: !283)
!288 = !DILocation(line: 36, column: 5, scope: !279)
!289 = !DILocalVariable(name: "xVal", scope: !290, file: !2, line: 37, type: !90)
!290 = distinct !DILexicalBlock(scope: !283, file: !2, line: 36, column: 58)
!291 = !DILocation(line: 37, column: 22, scope: !290)
!292 = !DILocation(line: 37, column: 50, scope: !290)
!293 = !DILocation(line: 37, column: 57, scope: !290)
!294 = !DILocation(line: 37, column: 29, scope: !290)
!295 = !DILocation(line: 38, column: 53, scope: !290)
!296 = !DILocation(line: 38, column: 60, scope: !290)
!297 = !DILocation(line: 38, column: 85, scope: !290)
!298 = !DILocation(line: 38, column: 92, scope: !290)
!299 = !DILocation(line: 38, column: 100, scope: !290)
!300 = !DILocation(line: 38, column: 66, scope: !290)
!301 = !DILocation(line: 38, column: 35, scope: !290)
!302 = !DILocation(line: 38, column: 25, scope: !290)
!303 = !DILocation(line: 38, column: 7, scope: !290)
!304 = !DILocation(line: 38, column: 15, scope: !290)
!305 = !DILocation(line: 38, column: 18, scope: !290)
!306 = !DILocation(line: 38, column: 21, scope: !290)
!307 = !DILocation(line: 38, column: 23, scope: !290)
!308 = !DILocation(line: 39, column: 53, scope: !290)
!309 = !DILocation(line: 39, column: 60, scope: !290)
!310 = !DILocation(line: 39, column: 85, scope: !290)
!311 = !DILocation(line: 39, column: 92, scope: !290)
!312 = !DILocation(line: 39, column: 100, scope: !290)
!313 = !DILocation(line: 39, column: 66, scope: !290)
!314 = !DILocation(line: 39, column: 35, scope: !290)
!315 = !DILocation(line: 39, column: 25, scope: !290)
!316 = !DILocation(line: 39, column: 7, scope: !290)
!317 = !DILocation(line: 39, column: 15, scope: !290)
!318 = !DILocation(line: 39, column: 18, scope: !290)
!319 = !DILocation(line: 39, column: 21, scope: !290)
!320 = !DILocation(line: 39, column: 23, scope: !290)
!321 = !DILocation(line: 40, column: 5, scope: !290)
!322 = !DILocation(line: 36, column: 55, scope: !283)
!323 = !DILocation(line: 36, column: 5, scope: !283)
!324 = distinct !{!324, !288, !325, !236}
!325 = !DILocation(line: 40, column: 5, scope: !279)
!326 = !DILocation(line: 41, column: 16, scope: !273)
!327 = !DILocation(line: 41, column: 5, scope: !273)
!328 = !DILocation(line: 42, column: 3, scope: !273)
!329 = !DILocation(line: 34, column: 54, scope: !266)
!330 = !DILocation(line: 34, column: 3, scope: !266)
!331 = distinct !{!331, !271, !332, !236}
!332 = !DILocation(line: 42, column: 3, scope: !262)
!333 = !DILocation(line: 44, column: 10, scope: !239)
!334 = !DILocation(line: 44, column: 3, scope: !239)
!335 = distinct !DISubprogram(name: "yCompress", scope: !2, file: !2, line: 47, type: !336, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!336 = !DISubroutineType(types: !337)
!337 = !{!4, !138, !90, !90, !90}
!338 = !DILocalVariable(name: "arena", arg: 1, scope: !335, file: !2, line: 47, type: !138)
!339 = !DILocation(line: 47, column: 30, scope: !335)
!340 = !DILocalVariable(name: "num", arg: 2, scope: !335, file: !2, line: 47, type: !90)
!341 = !DILocation(line: 47, column: 52, scope: !335)
!342 = !DILocalVariable(name: "pixel", arg: 3, scope: !335, file: !2, line: 47, type: !90)
!343 = !DILocation(line: 47, column: 72, scope: !335)
!344 = !DILocalVariable(name: "range", arg: 4, scope: !335, file: !2, line: 47, type: !90)
!345 = !DILocation(line: 47, column: 94, scope: !335)
!346 = !DILocalVariable(name: "table", scope: !335, file: !2, line: 48, type: !144)
!347 = !DILocation(line: 48, column: 9, scope: !335)
!348 = !DILocalVariable(name: "eight", scope: !335, file: !2, line: 50, type: !90)
!349 = !DILocation(line: 50, column: 18, scope: !335)
!350 = !DILocation(line: 50, column: 47, scope: !335)
!351 = !DILocation(line: 50, column: 26, scope: !335)
!352 = !DILocalVariable(name: "steps", scope: !335, file: !2, line: 52, type: !90)
!353 = !DILocation(line: 52, column: 18, scope: !335)
!354 = !DILocation(line: 52, column: 44, scope: !335)
!355 = !DILocation(line: 52, column: 51, scope: !335)
!356 = !DILocation(line: 52, column: 58, scope: !335)
!357 = !DILocation(line: 52, column: 26, scope: !335)
!358 = !DILocalVariable(name: "two", scope: !335, file: !2, line: 54, type: !90)
!359 = !DILocation(line: 54, column: 18, scope: !335)
!360 = !DILocation(line: 54, column: 45, scope: !335)
!361 = !DILocation(line: 54, column: 24, scope: !335)
!362 = !DILocalVariable(name: "rangeDiv2", scope: !335, file: !2, line: 55, type: !90)
!363 = !DILocation(line: 55, column: 18, scope: !335)
!364 = !DILocation(line: 55, column: 48, scope: !335)
!365 = !DILocation(line: 55, column: 55, scope: !335)
!366 = !DILocation(line: 55, column: 62, scope: !335)
!367 = !DILocation(line: 55, column: 30, scope: !335)
!368 = !DILocalVariable(name: "goal", scope: !335, file: !2, line: 56, type: !90)
!369 = !DILocation(line: 56, column: 18, scope: !335)
!370 = !DILocation(line: 56, column: 43, scope: !335)
!371 = !DILocation(line: 56, column: 50, scope: !335)
!372 = !DILocation(line: 56, column: 73, scope: !335)
!373 = !DILocation(line: 56, column: 80, scope: !335)
!374 = !DILocation(line: 56, column: 87, scope: !335)
!375 = !DILocation(line: 56, column: 55, scope: !335)
!376 = !DILocation(line: 56, column: 25, scope: !335)
!377 = !DILocalVariable(name: "counter", scope: !335, file: !2, line: 57, type: !96)
!378 = !DILocation(line: 57, column: 7, scope: !335)
!379 = !DILocalVariable(name: "step", scope: !335, file: !2, line: 58, type: !90)
!380 = !DILocation(line: 58, column: 18, scope: !335)
!381 = !DILocation(line: 58, column: 46, scope: !335)
!382 = !DILocation(line: 58, column: 25, scope: !335)
!383 = !DILocation(line: 59, column: 3, scope: !335)
!384 = !DILocation(line: 59, column: 39, scope: !335)
!385 = !DILocation(line: 59, column: 46, scope: !335)
!386 = !DILocation(line: 59, column: 52, scope: !335)
!387 = !DILocation(line: 59, column: 16, scope: !335)
!388 = !DILocation(line: 59, column: 9, scope: !335)
!389 = !DILocation(line: 60, column: 30, scope: !390)
!390 = distinct !DILexicalBlock(scope: !335, file: !2, line: 59, column: 59)
!391 = !DILocation(line: 60, column: 37, scope: !390)
!392 = !DILocation(line: 60, column: 43, scope: !390)
!393 = !DILocation(line: 60, column: 12, scope: !390)
!394 = !DILocation(line: 60, column: 10, scope: !390)
!395 = !DILocation(line: 61, column: 12, scope: !390)
!396 = distinct !{!396, !383, !397, !236}
!397 = !DILocation(line: 62, column: 3, scope: !335)
!398 = !DILocation(line: 63, column: 10, scope: !335)
!399 = !DILocation(line: 63, column: 16, scope: !335)
!400 = !DILocation(line: 63, column: 24, scope: !335)
!401 = !DILocation(line: 63, column: 3, scope: !335)
!402 = distinct !DISubprogram(name: "printPlane", scope: !2, file: !2, line: 66, type: !403, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!403 = !DISubroutineType(types: !404)
!404 = !{null, !188, !90, !90}
!405 = !DILocalVariable(name: "display", arg: 1, scope: !402, file: !2, line: 66, type: !188)
!406 = !DILocation(line: 66, column: 33, scope: !402)
!407 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !402, file: !2, line: 66, type: !90)
!408 = !DILocation(line: 66, column: 57, scope: !402)
!409 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !402, file: !2, line: 66, type: !90)
!410 = !DILocation(line: 66, column: 86, scope: !402)
!411 = !DILocalVariable(name: "output", scope: !402, file: !2, line: 67, type: !412)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!413 = !DILocation(line: 67, column: 10, scope: !402)
!414 = !DILocation(line: 67, column: 42, scope: !402)
!415 = !DILocation(line: 67, column: 56, scope: !402)
!416 = !DILocation(line: 67, column: 64, scope: !402)
!417 = !DILocation(line: 67, column: 40, scope: !402)
!418 = !DILocation(line: 67, column: 19, scope: !402)
!419 = !DILocalVariable(name: "i", scope: !420, file: !2, line: 68, type: !96)
!420 = distinct !DILexicalBlock(scope: !402, file: !2, line: 68, column: 3)
!421 = !DILocation(line: 68, column: 11, scope: !420)
!422 = !DILocation(line: 68, column: 7, scope: !420)
!423 = !DILocation(line: 68, column: 18, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !2, line: 68, column: 3)
!425 = !DILocation(line: 68, column: 22, scope: !424)
!426 = !DILocation(line: 68, column: 36, scope: !424)
!427 = !DILocation(line: 68, column: 44, scope: !424)
!428 = !DILocation(line: 68, column: 20, scope: !424)
!429 = !DILocation(line: 68, column: 3, scope: !420)
!430 = !DILocation(line: 69, column: 39, scope: !431)
!431 = distinct !DILexicalBlock(scope: !424, file: !2, line: 68, column: 57)
!432 = !DILocation(line: 69, column: 52, scope: !431)
!433 = !DILocation(line: 69, column: 60, scope: !431)
!434 = !DILocation(line: 69, column: 37, scope: !431)
!435 = !DILocation(line: 69, column: 68, scope: !431)
!436 = !DILocation(line: 69, column: 17, scope: !431)
!437 = !DILocation(line: 69, column: 5, scope: !431)
!438 = !DILocation(line: 69, column: 12, scope: !431)
!439 = !DILocation(line: 69, column: 15, scope: !431)
!440 = !DILocation(line: 70, column: 3, scope: !431)
!441 = !DILocation(line: 68, column: 54, scope: !424)
!442 = !DILocation(line: 68, column: 3, scope: !424)
!443 = distinct !{!443, !429, !444, !236}
!444 = !DILocation(line: 70, column: 3, scope: !420)
!445 = !DILocalVariable(name: "y", scope: !446, file: !2, line: 72, type: !96)
!446 = distinct !DILexicalBlock(scope: !402, file: !2, line: 72, column: 3)
!447 = !DILocation(line: 72, column: 11, scope: !446)
!448 = !DILocation(line: 72, column: 7, scope: !446)
!449 = !DILocation(line: 72, column: 18, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !2, line: 72, column: 3)
!451 = !DILocation(line: 72, column: 22, scope: !450)
!452 = !DILocation(line: 72, column: 36, scope: !450)
!453 = !DILocation(line: 72, column: 44, scope: !450)
!454 = !DILocation(line: 72, column: 20, scope: !450)
!455 = !DILocation(line: 72, column: 3, scope: !446)
!456 = !DILocalVariable(name: "x", scope: !457, file: !2, line: 73, type: !96)
!457 = distinct !DILexicalBlock(scope: !458, file: !2, line: 73, column: 5)
!458 = distinct !DILexicalBlock(scope: !450, file: !2, line: 72, column: 58)
!459 = !DILocation(line: 73, column: 13, scope: !457)
!460 = !DILocation(line: 73, column: 9, scope: !457)
!461 = !DILocation(line: 73, column: 20, scope: !462)
!462 = distinct !DILexicalBlock(scope: !457, file: !2, line: 73, column: 5)
!463 = !DILocation(line: 73, column: 24, scope: !462)
!464 = !DILocation(line: 73, column: 37, scope: !462)
!465 = !DILocation(line: 73, column: 45, scope: !462)
!466 = !DILocation(line: 73, column: 22, scope: !462)
!467 = !DILocation(line: 73, column: 5, scope: !457)
!468 = !DILocation(line: 74, column: 22, scope: !462)
!469 = !DILocation(line: 74, column: 30, scope: !462)
!470 = !DILocation(line: 74, column: 33, scope: !462)
!471 = !DILocation(line: 74, column: 36, scope: !462)
!472 = !DILocation(line: 74, column: 7, scope: !462)
!473 = !DILocation(line: 74, column: 14, scope: !462)
!474 = !DILocation(line: 74, column: 17, scope: !462)
!475 = !DILocation(line: 74, column: 20, scope: !462)
!476 = !DILocation(line: 73, column: 55, scope: !462)
!477 = !DILocation(line: 73, column: 5, scope: !462)
!478 = distinct !{!478, !467, !479, !236}
!479 = !DILocation(line: 74, column: 36, scope: !457)
!480 = !DILocation(line: 75, column: 5, scope: !458)
!481 = !DILocation(line: 75, column: 12, scope: !458)
!482 = !DILocation(line: 75, column: 15, scope: !458)
!483 = !DILocation(line: 75, column: 28, scope: !458)
!484 = !DILocation(line: 75, column: 36, scope: !458)
!485 = !DILocation(line: 75, column: 45, scope: !458)
!486 = !DILocation(line: 76, column: 3, scope: !458)
!487 = !DILocation(line: 72, column: 54, scope: !450)
!488 = !DILocation(line: 72, column: 3, scope: !450)
!489 = distinct !{!489, !455, !490, !236}
!490 = !DILocation(line: 76, column: 3, scope: !446)
!491 = !DILocalVariable(name: "y", scope: !492, file: !2, line: 78, type: !96)
!492 = distinct !DILexicalBlock(scope: !402, file: !2, line: 78, column: 3)
!493 = !DILocation(line: 78, column: 11, scope: !492)
!494 = !DILocation(line: 78, column: 7, scope: !492)
!495 = !DILocation(line: 78, column: 18, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !2, line: 78, column: 3)
!497 = !DILocation(line: 78, column: 22, scope: !496)
!498 = !DILocation(line: 78, column: 36, scope: !496)
!499 = !DILocation(line: 78, column: 44, scope: !496)
!500 = !DILocation(line: 78, column: 20, scope: !496)
!501 = !DILocation(line: 78, column: 3, scope: !492)
!502 = !DILocation(line: 79, column: 10, scope: !496)
!503 = !DILocation(line: 79, column: 17, scope: !496)
!504 = !DILocation(line: 79, column: 5, scope: !496)
!505 = !DILocation(line: 78, column: 54, scope: !496)
!506 = !DILocation(line: 78, column: 3, scope: !496)
!507 = distinct !{!507, !501, !508, !236}
!508 = !DILocation(line: 79, column: 19, scope: !492)
!509 = !DILocalVariable(name: "y", scope: !510, file: !2, line: 81, type: !96)
!510 = distinct !DILexicalBlock(scope: !402, file: !2, line: 81, column: 3)
!511 = !DILocation(line: 81, column: 11, scope: !510)
!512 = !DILocation(line: 81, column: 7, scope: !510)
!513 = !DILocation(line: 81, column: 18, scope: !514)
!514 = distinct !DILexicalBlock(scope: !510, file: !2, line: 81, column: 3)
!515 = !DILocation(line: 81, column: 22, scope: !514)
!516 = !DILocation(line: 81, column: 36, scope: !514)
!517 = !DILocation(line: 81, column: 44, scope: !514)
!518 = !DILocation(line: 81, column: 20, scope: !514)
!519 = !DILocation(line: 81, column: 3, scope: !510)
!520 = !DILocation(line: 82, column: 10, scope: !514)
!521 = !DILocation(line: 82, column: 17, scope: !514)
!522 = !DILocation(line: 82, column: 5, scope: !514)
!523 = !DILocation(line: 81, column: 54, scope: !514)
!524 = !DILocation(line: 81, column: 3, scope: !514)
!525 = distinct !{!525, !519, !526, !236}
!526 = !DILocation(line: 82, column: 19, scope: !510)
!527 = !DILocation(line: 83, column: 8, scope: !402)
!528 = !DILocation(line: 83, column: 3, scope: !402)
!529 = !DILocation(line: 84, column: 1, scope: !402)
!530 = distinct !DISubprogram(name: "drawLine", scope: !2, file: !2, line: 86, type: !531, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!531 = !DISubroutineType(types: !532)
!532 = !{null, !188, !533, !138, !90, !90, !90, !90}
!533 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !534, size: 64)
!534 = !DISubroutineType(types: !535)
!535 = !{!90, !138, !90}
!536 = !DILocalVariable(name: "display", arg: 1, scope: !530, file: !2, line: 86, type: !188)
!537 = !DILocation(line: 86, column: 31, scope: !530)
!538 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !530, file: !2, line: 86, type: !533)
!539 = !DILocation(line: 86, column: 57, scope: !530)
!540 = !DILocalVariable(name: "arena", arg: 3, scope: !530, file: !2, line: 86, type: !138)
!541 = !DILocation(line: 86, column: 112, scope: !530)
!542 = !DILocalVariable(name: "xSteps", arg: 4, scope: !530, file: !2, line: 86, type: !90)
!543 = !DILocation(line: 86, column: 134, scope: !530)
!544 = !DILocalVariable(name: "ySteps", arg: 5, scope: !530, file: !2, line: 86, type: !90)
!545 = !DILocation(line: 86, column: 157, scope: !530)
!546 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !530, file: !2, line: 86, type: !90)
!547 = !DILocation(line: 86, column: 180, scope: !530)
!548 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !530, file: !2, line: 86, type: !90)
!549 = !DILocation(line: 86, column: 209, scope: !530)
!550 = !DILocalVariable(name: "relX", scope: !530, file: !2, line: 87, type: !90)
!551 = !DILocation(line: 87, column: 20, scope: !530)
!552 = !DILocalVariable(name: "relY", scope: !530, file: !2, line: 88, type: !90)
!553 = !DILocation(line: 88, column: 20, scope: !530)
!554 = !DILocalVariable(name: "twoPoint1", scope: !530, file: !2, line: 90, type: !90)
!555 = !DILocation(line: 90, column: 20, scope: !530)
!556 = !DILocation(line: 90, column: 60, scope: !530)
!557 = !DILocation(line: 90, column: 42, scope: !530)
!558 = !DILocation(line: 90, column: 32, scope: !530)
!559 = !DILocalVariable(name: "stepDivTwoPoint1", scope: !530, file: !2, line: 91, type: !90)
!560 = !DILocation(line: 91, column: 20, scope: !530)
!561 = !DILocation(line: 91, column: 67, scope: !530)
!562 = !DILocation(line: 91, column: 74, scope: !530)
!563 = !DILocation(line: 91, column: 82, scope: !530)
!564 = !DILocation(line: 91, column: 49, scope: !530)
!565 = !DILocation(line: 91, column: 39, scope: !530)
!566 = !DILocation(line: 92, column: 16, scope: !530)
!567 = !DILocation(line: 92, column: 5, scope: !530)
!568 = !DILocalVariable(name: "y", scope: !569, file: !2, line: 94, type: !96)
!569 = distinct !DILexicalBlock(scope: !530, file: !2, line: 94, column: 5)
!570 = !DILocation(line: 94, column: 13, scope: !569)
!571 = !DILocation(line: 94, column: 9, scope: !569)
!572 = !DILocation(line: 94, column: 20, scope: !573)
!573 = distinct !DILexicalBlock(scope: !569, file: !2, line: 94, column: 5)
!574 = !DILocation(line: 94, column: 24, scope: !573)
!575 = !DILocation(line: 94, column: 38, scope: !573)
!576 = !DILocation(line: 94, column: 46, scope: !573)
!577 = !DILocation(line: 94, column: 22, scope: !573)
!578 = !DILocation(line: 94, column: 5, scope: !569)
!579 = !DILocalVariable(name: "x", scope: !580, file: !2, line: 95, type: !96)
!580 = distinct !DILexicalBlock(scope: !581, file: !2, line: 95, column: 9)
!581 = distinct !DILexicalBlock(scope: !573, file: !2, line: 94, column: 60)
!582 = !DILocation(line: 95, column: 17, scope: !580)
!583 = !DILocation(line: 95, column: 13, scope: !580)
!584 = !DILocation(line: 95, column: 24, scope: !585)
!585 = distinct !DILexicalBlock(scope: !580, file: !2, line: 95, column: 9)
!586 = !DILocation(line: 95, column: 28, scope: !585)
!587 = !DILocation(line: 95, column: 41, scope: !585)
!588 = !DILocation(line: 95, column: 49, scope: !585)
!589 = !DILocation(line: 95, column: 26, scope: !585)
!590 = !DILocation(line: 95, column: 9, scope: !580)
!591 = !DILocalVariable(name: "pixel", scope: !592, file: !2, line: 96, type: !84)
!592 = distinct !DILexicalBlock(scope: !585, file: !2, line: 95, column: 63)
!593 = !DILocation(line: 96, column: 21, scope: !592)
!594 = !DILocation(line: 96, column: 31, scope: !592)
!595 = !DILocation(line: 96, column: 39, scope: !592)
!596 = !DILocation(line: 96, column: 42, scope: !592)
!597 = !DILocation(line: 97, column: 20, scope: !592)
!598 = !DILocation(line: 97, column: 27, scope: !592)
!599 = !DILocation(line: 97, column: 18, scope: !592)
!600 = !DILocation(line: 98, column: 20, scope: !592)
!601 = !DILocation(line: 98, column: 27, scope: !592)
!602 = !DILocation(line: 98, column: 18, scope: !592)
!603 = !DILocalVariable(name: "output", scope: !592, file: !2, line: 100, type: !90)
!604 = !DILocation(line: 100, column: 28, scope: !592)
!605 = !DILocation(line: 100, column: 47, scope: !592)
!606 = !DILocation(line: 100, column: 56, scope: !592)
!607 = !DILocation(line: 100, column: 63, scope: !592)
!608 = !DILocation(line: 100, column: 37, scope: !592)
!609 = !DILocation(line: 101, column: 17, scope: !592)
!610 = !DILocation(line: 101, column: 6, scope: !592)
!611 = !DILocation(line: 102, column: 24, scope: !612)
!612 = distinct !DILexicalBlock(scope: !592, file: !2, line: 102, column: 16)
!613 = !DILocation(line: 102, column: 31, scope: !612)
!614 = !DILocation(line: 102, column: 39, scope: !612)
!615 = !DILocation(line: 102, column: 45, scope: !612)
!616 = !DILocation(line: 102, column: 16, scope: !612)
!617 = !DILocation(line: 102, column: 16, scope: !592)
!618 = !DILocation(line: 103, column: 35, scope: !612)
!619 = !DILocation(line: 103, column: 42, scope: !612)
!620 = !DILocation(line: 103, column: 50, scope: !612)
!621 = !DILocation(line: 103, column: 56, scope: !612)
!622 = !DILocation(line: 103, column: 25, scope: !612)
!623 = !DILocation(line: 103, column: 8, scope: !612)
!624 = !DILocation(line: 103, column: 15, scope: !612)
!625 = !DILocation(line: 103, column: 23, scope: !612)
!626 = !DILocation(line: 104, column: 24, scope: !592)
!627 = !DILocation(line: 104, column: 6, scope: !592)
!628 = !DILocation(line: 105, column: 9, scope: !592)
!629 = !DILocation(line: 95, column: 59, scope: !585)
!630 = !DILocation(line: 95, column: 9, scope: !585)
!631 = distinct !{!631, !590, !632, !236}
!632 = !DILocation(line: 105, column: 9, scope: !580)
!633 = !DILocation(line: 106, column: 5, scope: !581)
!634 = !DILocation(line: 94, column: 56, scope: !573)
!635 = !DILocation(line: 94, column: 5, scope: !573)
!636 = distinct !{!636, !578, !637, !236}
!637 = !DILocation(line: 106, column: 5, scope: !569)
!638 = !DILocation(line: 107, column: 1, scope: !530)
!639 = distinct !DISubprogram(name: "printDisplayCordinates", scope: !2, file: !2, line: 109, type: !403, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!640 = !DILocalVariable(name: "display", arg: 1, scope: !639, file: !2, line: 109, type: !188)
!641 = !DILocation(line: 109, column: 45, scope: !639)
!642 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !639, file: !2, line: 109, type: !90)
!643 = !DILocation(line: 109, column: 69, scope: !639)
!644 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !639, file: !2, line: 109, type: !90)
!645 = !DILocation(line: 109, column: 98, scope: !639)
!646 = !DILocalVariable(name: "y", scope: !647, file: !2, line: 110, type: !96)
!647 = distinct !DILexicalBlock(scope: !639, file: !2, line: 110, column: 3)
!648 = !DILocation(line: 110, column: 11, scope: !647)
!649 = !DILocation(line: 110, column: 7, scope: !647)
!650 = !DILocation(line: 110, column: 18, scope: !651)
!651 = distinct !DILexicalBlock(scope: !647, file: !2, line: 110, column: 3)
!652 = !DILocation(line: 110, column: 22, scope: !651)
!653 = !DILocation(line: 110, column: 36, scope: !651)
!654 = !DILocation(line: 110, column: 44, scope: !651)
!655 = !DILocation(line: 110, column: 20, scope: !651)
!656 = !DILocation(line: 110, column: 3, scope: !647)
!657 = !DILocation(line: 111, column: 5, scope: !658)
!658 = distinct !DILexicalBlock(scope: !651, file: !2, line: 110, column: 57)
!659 = !DILocalVariable(name: "x", scope: !660, file: !2, line: 112, type: !96)
!660 = distinct !DILexicalBlock(scope: !658, file: !2, line: 112, column: 5)
!661 = !DILocation(line: 112, column: 13, scope: !660)
!662 = !DILocation(line: 112, column: 9, scope: !660)
!663 = !DILocation(line: 112, column: 20, scope: !664)
!664 = distinct !DILexicalBlock(scope: !660, file: !2, line: 112, column: 5)
!665 = !DILocation(line: 112, column: 24, scope: !664)
!666 = !DILocation(line: 112, column: 37, scope: !664)
!667 = !DILocation(line: 112, column: 45, scope: !664)
!668 = !DILocation(line: 112, column: 22, scope: !664)
!669 = !DILocation(line: 112, column: 5, scope: !660)
!670 = !DILocation(line: 113, column: 7, scope: !671)
!671 = distinct !DILexicalBlock(scope: !664, file: !2, line: 112, column: 58)
!672 = !DILocation(line: 114, column: 18, scope: !671)
!673 = !DILocation(line: 114, column: 26, scope: !671)
!674 = !DILocation(line: 114, column: 29, scope: !671)
!675 = !DILocation(line: 114, column: 32, scope: !671)
!676 = !DILocation(line: 114, column: 7, scope: !671)
!677 = !DILocation(line: 115, column: 7, scope: !671)
!678 = !DILocation(line: 116, column: 18, scope: !671)
!679 = !DILocation(line: 116, column: 26, scope: !671)
!680 = !DILocation(line: 116, column: 29, scope: !671)
!681 = !DILocation(line: 116, column: 32, scope: !671)
!682 = !DILocation(line: 116, column: 7, scope: !671)
!683 = !DILocation(line: 117, column: 7, scope: !671)
!684 = !DILocation(line: 118, column: 5, scope: !671)
!685 = !DILocation(line: 112, column: 55, scope: !664)
!686 = !DILocation(line: 112, column: 5, scope: !664)
!687 = distinct !{!687, !669, !688, !236}
!688 = !DILocation(line: 118, column: 5, scope: !660)
!689 = !DILocation(line: 119, column: 5, scope: !658)
!690 = !DILocation(line: 120, column: 3, scope: !658)
!691 = !DILocation(line: 110, column: 54, scope: !651)
!692 = !DILocation(line: 110, column: 3, scope: !651)
!693 = distinct !{!693, !656, !694, !236}
!694 = !DILocation(line: 120, column: 3, scope: !647)
!695 = !DILocation(line: 121, column: 1, scope: !639)
!696 = distinct !DISubprogram(name: "drawPlane", scope: !2, file: !2, line: 123, type: !697, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!697 = !DISubroutineType(types: !698)
!698 = !{null, !188, !138, !90, !90, !90, !90}
!699 = !DILocalVariable(name: "display", arg: 1, scope: !696, file: !2, line: 123, type: !188)
!700 = !DILocation(line: 123, column: 32, scope: !696)
!701 = !DILocalVariable(name: "arena", arg: 2, scope: !696, file: !2, line: 123, type: !138)
!702 = !DILocation(line: 123, column: 55, scope: !696)
!703 = !DILocalVariable(name: "xSteps", arg: 3, scope: !696, file: !2, line: 123, type: !90)
!704 = !DILocation(line: 123, column: 77, scope: !696)
!705 = !DILocalVariable(name: "ySteps", arg: 4, scope: !696, file: !2, line: 123, type: !90)
!706 = !DILocation(line: 123, column: 100, scope: !696)
!707 = !DILocalVariable(name: "windowHeight", arg: 5, scope: !696, file: !2, line: 123, type: !90)
!708 = !DILocation(line: 123, column: 123, scope: !696)
!709 = !DILocalVariable(name: "windowWidth", arg: 6, scope: !696, file: !2, line: 123, type: !90)
!710 = !DILocation(line: 123, column: 152, scope: !696)
!711 = !DILocalVariable(name: "relX", scope: !696, file: !2, line: 124, type: !90)
!712 = !DILocation(line: 124, column: 18, scope: !696)
!713 = !DILocalVariable(name: "relY", scope: !696, file: !2, line: 125, type: !90)
!714 = !DILocation(line: 125, column: 18, scope: !696)
!715 = !DILocalVariable(name: "twoPoint1", scope: !696, file: !2, line: 127, type: !90)
!716 = !DILocation(line: 127, column: 18, scope: !696)
!717 = !DILocation(line: 127, column: 58, scope: !696)
!718 = !DILocation(line: 127, column: 40, scope: !696)
!719 = !DILocation(line: 127, column: 30, scope: !696)
!720 = !DILocalVariable(name: "yStepDivTwoPoint1", scope: !696, file: !2, line: 128, type: !90)
!721 = !DILocation(line: 128, column: 18, scope: !696)
!722 = !DILocation(line: 128, column: 66, scope: !696)
!723 = !DILocation(line: 128, column: 73, scope: !696)
!724 = !DILocation(line: 128, column: 81, scope: !696)
!725 = !DILocation(line: 128, column: 48, scope: !696)
!726 = !DILocation(line: 128, column: 38, scope: !696)
!727 = !DILocalVariable(name: "xStepDivTwoPoint1", scope: !696, file: !2, line: 129, type: !90)
!728 = !DILocation(line: 129, column: 18, scope: !696)
!729 = !DILocation(line: 129, column: 66, scope: !696)
!730 = !DILocation(line: 129, column: 73, scope: !696)
!731 = !DILocation(line: 129, column: 81, scope: !696)
!732 = !DILocation(line: 129, column: 48, scope: !696)
!733 = !DILocation(line: 129, column: 38, scope: !696)
!734 = !DILocalVariable(name: "zero", scope: !696, file: !2, line: 130, type: !90)
!735 = !DILocation(line: 130, column: 18, scope: !696)
!736 = !DILocation(line: 130, column: 56, scope: !696)
!737 = !DILocation(line: 130, column: 35, scope: !696)
!738 = !DILocation(line: 130, column: 25, scope: !696)
!739 = !DILocation(line: 132, column: 14, scope: !696)
!740 = !DILocation(line: 132, column: 3, scope: !696)
!741 = !DILocalVariable(name: "y", scope: !742, file: !2, line: 134, type: !96)
!742 = distinct !DILexicalBlock(scope: !696, file: !2, line: 134, column: 5)
!743 = !DILocation(line: 134, column: 13, scope: !742)
!744 = !DILocation(line: 134, column: 9, scope: !742)
!745 = !DILocation(line: 134, column: 20, scope: !746)
!746 = distinct !DILexicalBlock(scope: !742, file: !2, line: 134, column: 5)
!747 = !DILocation(line: 134, column: 24, scope: !746)
!748 = !DILocation(line: 134, column: 38, scope: !746)
!749 = !DILocation(line: 134, column: 46, scope: !746)
!750 = !DILocation(line: 134, column: 22, scope: !746)
!751 = !DILocation(line: 134, column: 5, scope: !742)
!752 = !DILocalVariable(name: "x", scope: !753, file: !2, line: 135, type: !96)
!753 = distinct !DILexicalBlock(scope: !754, file: !2, line: 135, column: 9)
!754 = distinct !DILexicalBlock(scope: !746, file: !2, line: 134, column: 60)
!755 = !DILocation(line: 135, column: 17, scope: !753)
!756 = !DILocation(line: 135, column: 13, scope: !753)
!757 = !DILocation(line: 135, column: 24, scope: !758)
!758 = distinct !DILexicalBlock(scope: !753, file: !2, line: 135, column: 9)
!759 = !DILocation(line: 135, column: 28, scope: !758)
!760 = !DILocation(line: 135, column: 41, scope: !758)
!761 = !DILocation(line: 135, column: 49, scope: !758)
!762 = !DILocation(line: 135, column: 26, scope: !758)
!763 = !DILocation(line: 135, column: 9, scope: !753)
!764 = !DILocalVariable(name: "pixel", scope: !765, file: !2, line: 136, type: !84)
!765 = distinct !DILexicalBlock(scope: !758, file: !2, line: 135, column: 63)
!766 = !DILocation(line: 136, column: 21, scope: !765)
!767 = !DILocation(line: 136, column: 31, scope: !765)
!768 = !DILocation(line: 136, column: 39, scope: !765)
!769 = !DILocation(line: 136, column: 42, scope: !765)
!770 = !DILocation(line: 137, column: 20, scope: !765)
!771 = !DILocation(line: 137, column: 27, scope: !765)
!772 = !DILocation(line: 137, column: 18, scope: !765)
!773 = !DILocation(line: 138, column: 20, scope: !765)
!774 = !DILocation(line: 138, column: 27, scope: !765)
!775 = !DILocation(line: 138, column: 18, scope: !765)
!776 = !DILocalVariable(name: "xZero", scope: !765, file: !2, line: 140, type: !123)
!777 = !DILocation(line: 140, column: 18, scope: !765)
!778 = !DILocation(line: 140, column: 34, scope: !765)
!779 = !DILocation(line: 140, column: 41, scope: !765)
!780 = !DILocation(line: 140, column: 47, scope: !765)
!781 = !DILocation(line: 140, column: 53, scope: !765)
!782 = !DILocation(line: 140, column: 26, scope: !765)
!783 = !DILocalVariable(name: "yZero", scope: !765, file: !2, line: 141, type: !123)
!784 = !DILocation(line: 141, column: 18, scope: !765)
!785 = !DILocation(line: 141, column: 34, scope: !765)
!786 = !DILocation(line: 141, column: 41, scope: !765)
!787 = !DILocation(line: 141, column: 47, scope: !765)
!788 = !DILocation(line: 141, column: 53, scope: !765)
!789 = !DILocation(line: 141, column: 26, scope: !765)
!790 = !DILocalVariable(name: "origin", scope: !765, file: !2, line: 142, type: !123)
!791 = !DILocation(line: 142, column: 18, scope: !765)
!792 = !DILocation(line: 142, column: 27, scope: !765)
!793 = !DILocation(line: 142, column: 33, scope: !765)
!794 = !DILocation(line: 142, column: 36, scope: !765)
!795 = !DILocation(line: 0, scope: !765)
!796 = !DILocation(line: 144, column: 16, scope: !797)
!797 = distinct !DILexicalBlock(scope: !765, file: !2, line: 144, column: 16)
!798 = !DILocation(line: 144, column: 16, scope: !765)
!799 = !DILocation(line: 145, column: 17, scope: !797)
!800 = !DILocation(line: 145, column: 26, scope: !797)
!801 = !DILocation(line: 145, column: 34, scope: !797)
!802 = !DILocation(line: 146, column: 21, scope: !803)
!803 = distinct !DILexicalBlock(scope: !797, file: !2, line: 146, column: 21)
!804 = !DILocation(line: 146, column: 21, scope: !797)
!805 = !DILocation(line: 147, column: 17, scope: !803)
!806 = !DILocation(line: 147, column: 26, scope: !803)
!807 = !DILocation(line: 147, column: 34, scope: !803)
!808 = !DILocation(line: 148, column: 21, scope: !809)
!809 = distinct !DILexicalBlock(scope: !803, file: !2, line: 148, column: 21)
!810 = !DILocation(line: 148, column: 21, scope: !803)
!811 = !DILocation(line: 149, column: 17, scope: !809)
!812 = !DILocation(line: 149, column: 26, scope: !809)
!813 = !DILocation(line: 149, column: 34, scope: !809)
!814 = !DILocation(line: 151, column: 17, scope: !809)
!815 = !DILocation(line: 151, column: 26, scope: !809)
!816 = !DILocation(line: 151, column: 34, scope: !809)
!817 = !DILocation(line: 153, column: 17, scope: !765)
!818 = !DILocation(line: 153, column: 6, scope: !765)
!819 = !DILocation(line: 154, column: 9, scope: !765)
!820 = !DILocation(line: 135, column: 59, scope: !758)
!821 = !DILocation(line: 135, column: 9, scope: !758)
!822 = distinct !{!822, !763, !823, !236}
!823 = !DILocation(line: 154, column: 9, scope: !753)
!824 = !DILocation(line: 155, column: 5, scope: !754)
!825 = !DILocation(line: 134, column: 56, scope: !746)
!826 = !DILocation(line: 134, column: 5, scope: !746)
!827 = distinct !{!827, !751, !828, !236}
!828 = !DILocation(line: 155, column: 5, scope: !742)
!829 = !DILocation(line: 157, column: 23, scope: !696)
!830 = !DILocation(line: 157, column: 5, scope: !696)
!831 = !DILocation(line: 158, column: 23, scope: !696)
!832 = !DILocation(line: 158, column: 5, scope: !696)
!833 = !DILocation(line: 159, column: 23, scope: !696)
!834 = !DILocation(line: 159, column: 5, scope: !696)
!835 = !DILocation(line: 160, column: 23, scope: !696)
!836 = !DILocation(line: 160, column: 5, scope: !696)
!837 = !DILocation(line: 161, column: 1, scope: !696)
!838 = distinct !DISubprogram(name: "clearDisplay", scope: !2, file: !2, line: 163, type: !839, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!839 = !DISubroutineType(types: !840)
!840 = !{null, !188, !90}
!841 = !DILocalVariable(name: "display", arg: 1, scope: !838, file: !2, line: 163, type: !188)
!842 = !DILocation(line: 163, column: 35, scope: !838)
!843 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !838, file: !2, line: 163, type: !90)
!844 = !DILocation(line: 163, column: 59, scope: !838)
!845 = !DILocalVariable(name: "i", scope: !846, file: !2, line: 164, type: !96)
!846 = distinct !DILexicalBlock(scope: !838, file: !2, line: 164, column: 3)
!847 = !DILocation(line: 164, column: 11, scope: !846)
!848 = !DILocation(line: 164, column: 7, scope: !846)
!849 = !DILocation(line: 164, column: 18, scope: !850)
!850 = distinct !DILexicalBlock(scope: !846, file: !2, line: 164, column: 3)
!851 = !DILocation(line: 164, column: 22, scope: !850)
!852 = !DILocation(line: 164, column: 36, scope: !850)
!853 = !DILocation(line: 164, column: 44, scope: !850)
!854 = !DILocation(line: 164, column: 20, scope: !850)
!855 = !DILocation(line: 164, column: 3, scope: !846)
!856 = !DILocation(line: 165, column: 23, scope: !857)
!857 = distinct !DILexicalBlock(scope: !850, file: !2, line: 164, column: 57)
!858 = !DILocation(line: 165, column: 31, scope: !857)
!859 = !DILocation(line: 165, column: 35, scope: !857)
!860 = !DILocation(line: 165, column: 5, scope: !857)
!861 = !DILocation(line: 166, column: 23, scope: !857)
!862 = !DILocation(line: 166, column: 31, scope: !857)
!863 = !DILocation(line: 166, column: 35, scope: !857)
!864 = !DILocation(line: 166, column: 5, scope: !857)
!865 = !DILocation(line: 167, column: 10, scope: !857)
!866 = !DILocation(line: 167, column: 18, scope: !857)
!867 = !DILocation(line: 167, column: 5, scope: !857)
!868 = !DILocation(line: 168, column: 3, scope: !857)
!869 = !DILocation(line: 164, column: 54, scope: !850)
!870 = !DILocation(line: 164, column: 3, scope: !850)
!871 = distinct !{!871, !855, !872, !236}
!872 = !DILocation(line: 168, column: 3, scope: !846)
!873 = !DILocation(line: 169, column: 8, scope: !838)
!874 = !DILocation(line: 169, column: 3, scope: !838)
!875 = !DILocation(line: 170, column: 1, scope: !838)
!876 = distinct !DISubprogram(name: "findYMax", scope: !2, file: !2, line: 172, type: !877, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!877 = !DISubroutineType(types: !878)
!878 = !{!90, !138, !90, !90, !90, !533}
!879 = !DILocalVariable(name: "arena", arg: 1, scope: !876, file: !2, line: 172, type: !138)
!880 = !DILocation(line: 172, column: 39, scope: !876)
!881 = !DILocalVariable(name: "begin", arg: 2, scope: !876, file: !2, line: 172, type: !90)
!882 = !DILocation(line: 172, column: 61, scope: !876)
!883 = !DILocalVariable(name: "end", arg: 3, scope: !876, file: !2, line: 172, type: !90)
!884 = !DILocation(line: 172, column: 83, scope: !876)
!885 = !DILocalVariable(name: "byAmount", arg: 4, scope: !876, file: !2, line: 172, type: !90)
!886 = !DILocation(line: 172, column: 103, scope: !876)
!887 = !DILocalVariable(name: "valFunc", arg: 5, scope: !876, file: !2, line: 172, type: !533)
!888 = !DILocation(line: 172, column: 130, scope: !876)
!889 = !DILocalVariable(name: "yMax", scope: !876, file: !2, line: 173, type: !90)
!890 = !DILocation(line: 173, column: 18, scope: !876)
!891 = !DILocation(line: 173, column: 35, scope: !876)
!892 = !DILocation(line: 173, column: 43, scope: !876)
!893 = !DILocation(line: 173, column: 50, scope: !876)
!894 = !DILocation(line: 173, column: 25, scope: !876)
!895 = !DILocation(line: 175, column: 3, scope: !876)
!896 = !DILocation(line: 176, column: 14, scope: !876)
!897 = !DILocation(line: 176, column: 3, scope: !876)
!898 = !DILocation(line: 177, column: 22, scope: !876)
!899 = !DILocation(line: 177, column: 3, scope: !876)
!900 = !DILocalVariable(name: "z", scope: !876, file: !2, line: 179, type: !90)
!901 = !DILocation(line: 179, column: 18, scope: !876)
!902 = !DILocalVariable(name: "i", scope: !903, file: !2, line: 180, type: !90)
!903 = distinct !DILexicalBlock(scope: !876, file: !2, line: 180, column: 3)
!904 = !DILocation(line: 180, column: 22, scope: !903)
!905 = !DILocation(line: 180, column: 54, scope: !903)
!906 = !DILocation(line: 180, column: 61, scope: !903)
!907 = !DILocation(line: 180, column: 68, scope: !903)
!908 = !DILocation(line: 180, column: 36, scope: !903)
!909 = !DILocation(line: 180, column: 26, scope: !903)
!910 = !DILocation(line: 180, column: 7, scope: !903)
!911 = !DILocation(line: 180, column: 119, scope: !912)
!912 = distinct !DILexicalBlock(scope: !903, file: !2, line: 180, column: 3)
!913 = !DILocation(line: 180, column: 126, scope: !912)
!914 = !DILocation(line: 180, column: 129, scope: !912)
!915 = !DILocation(line: 180, column: 87, scope: !912)
!916 = !DILocation(line: 180, column: 80, scope: !912)
!917 = !DILocation(line: 180, column: 3, scope: !903)
!918 = !DILocation(line: 182, column: 5, scope: !919)
!919 = distinct !DILexicalBlock(scope: !912, file: !2, line: 180, column: 218)
!920 = !DILocation(line: 183, column: 16, scope: !919)
!921 = !DILocation(line: 183, column: 5, scope: !919)
!922 = !DILocation(line: 184, column: 24, scope: !919)
!923 = !DILocation(line: 184, column: 5, scope: !919)
!924 = !DILocalVariable(name: "toRet", scope: !919, file: !2, line: 186, type: !90)
!925 = !DILocation(line: 186, column: 20, scope: !919)
!926 = !DILocation(line: 186, column: 38, scope: !919)
!927 = !DILocation(line: 186, column: 46, scope: !919)
!928 = !DILocation(line: 186, column: 53, scope: !919)
!929 = !DILocation(line: 186, column: 28, scope: !919)
!930 = !DILocation(line: 188, column: 5, scope: !919)
!931 = !DILocation(line: 189, column: 16, scope: !919)
!932 = !DILocation(line: 189, column: 5, scope: !919)
!933 = !DILocation(line: 190, column: 24, scope: !919)
!934 = !DILocation(line: 190, column: 5, scope: !919)
!935 = !DILocation(line: 192, column: 41, scope: !936)
!936 = distinct !DILexicalBlock(scope: !919, file: !2, line: 192, column: 8)
!937 = !DILocation(line: 192, column: 48, scope: !936)
!938 = !DILocation(line: 192, column: 55, scope: !936)
!939 = !DILocation(line: 192, column: 15, scope: !936)
!940 = !DILocation(line: 192, column: 8, scope: !936)
!941 = !DILocation(line: 192, column: 8, scope: !919)
!942 = !DILocation(line: 193, column: 25, scope: !943)
!943 = distinct !DILexicalBlock(scope: !936, file: !2, line: 192, column: 62)
!944 = !DILocation(line: 193, column: 7, scope: !943)
!945 = !DILocation(line: 195, column: 7, scope: !943)
!946 = !DILocation(line: 196, column: 18, scope: !943)
!947 = !DILocation(line: 196, column: 7, scope: !943)
!948 = !DILocation(line: 197, column: 26, scope: !943)
!949 = !DILocation(line: 197, column: 7, scope: !943)
!950 = !DILocation(line: 199, column: 14, scope: !943)
!951 = !DILocation(line: 199, column: 12, scope: !943)
!952 = !DILocation(line: 200, column: 5, scope: !943)
!953 = !DILocation(line: 201, column: 16, scope: !919)
!954 = !DILocation(line: 201, column: 5, scope: !919)
!955 = !DILocation(line: 202, column: 3, scope: !919)
!956 = !DILocation(line: 180, column: 140, scope: !912)
!957 = !DILocation(line: 180, column: 138, scope: !912)
!958 = !DILocation(line: 180, column: 175, scope: !912)
!959 = !DILocation(line: 180, column: 182, scope: !912)
!960 = !DILocation(line: 180, column: 185, scope: !912)
!961 = !DILocation(line: 180, column: 157, scope: !912)
!962 = !DILocation(line: 180, column: 147, scope: !912)
!963 = !DILocation(line: 180, column: 145, scope: !912)
!964 = !DILocation(line: 180, column: 215, scope: !912)
!965 = !DILocation(line: 180, column: 197, scope: !912)
!966 = !DILocation(line: 180, column: 3, scope: !912)
!967 = distinct !{!967, !917, !968, !236}
!968 = !DILocation(line: 202, column: 3, scope: !903)
!969 = !DILocation(line: 203, column: 10, scope: !876)
!970 = !DILocation(line: 203, column: 3, scope: !876)
!971 = distinct !DISubprogram(name: "findYMin", scope: !2, file: !2, line: 206, type: !877, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!972 = !DILocalVariable(name: "arena", arg: 1, scope: !971, file: !2, line: 206, type: !138)
!973 = !DILocation(line: 206, column: 39, scope: !971)
!974 = !DILocalVariable(name: "begin", arg: 2, scope: !971, file: !2, line: 206, type: !90)
!975 = !DILocation(line: 206, column: 61, scope: !971)
!976 = !DILocalVariable(name: "end", arg: 3, scope: !971, file: !2, line: 206, type: !90)
!977 = !DILocation(line: 206, column: 83, scope: !971)
!978 = !DILocalVariable(name: "byAmount", arg: 4, scope: !971, file: !2, line: 206, type: !90)
!979 = !DILocation(line: 206, column: 103, scope: !971)
!980 = !DILocalVariable(name: "valFunc", arg: 5, scope: !971, file: !2, line: 206, type: !533)
!981 = !DILocation(line: 206, column: 130, scope: !971)
!982 = !DILocalVariable(name: "yMin", scope: !971, file: !2, line: 207, type: !90)
!983 = !DILocation(line: 207, column: 18, scope: !971)
!984 = !DILocation(line: 207, column: 35, scope: !971)
!985 = !DILocation(line: 207, column: 43, scope: !971)
!986 = !DILocation(line: 207, column: 50, scope: !971)
!987 = !DILocation(line: 207, column: 25, scope: !971)
!988 = !DILocalVariable(name: "z", scope: !971, file: !2, line: 208, type: !90)
!989 = !DILocation(line: 208, column: 18, scope: !971)
!990 = !DILocalVariable(name: "i", scope: !991, file: !2, line: 209, type: !90)
!991 = distinct !DILexicalBlock(scope: !971, file: !2, line: 209, column: 3)
!992 = !DILocation(line: 209, column: 22, scope: !991)
!993 = !DILocation(line: 209, column: 54, scope: !991)
!994 = !DILocation(line: 209, column: 61, scope: !991)
!995 = !DILocation(line: 209, column: 68, scope: !991)
!996 = !DILocation(line: 209, column: 36, scope: !991)
!997 = !DILocation(line: 209, column: 26, scope: !991)
!998 = !DILocation(line: 209, column: 7, scope: !991)
!999 = !DILocation(line: 209, column: 119, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !991, file: !2, line: 209, column: 3)
!1001 = !DILocation(line: 209, column: 126, scope: !1000)
!1002 = !DILocation(line: 209, column: 129, scope: !1000)
!1003 = !DILocation(line: 209, column: 87, scope: !1000)
!1004 = !DILocation(line: 209, column: 80, scope: !1000)
!1005 = !DILocation(line: 209, column: 3, scope: !991)
!1006 = !DILocalVariable(name: "toRet", scope: !1007, file: !2, line: 210, type: !90)
!1007 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 209, column: 218)
!1008 = !DILocation(line: 210, column: 20, scope: !1007)
!1009 = !DILocation(line: 210, column: 38, scope: !1007)
!1010 = !DILocation(line: 210, column: 46, scope: !1007)
!1011 = !DILocation(line: 210, column: 53, scope: !1007)
!1012 = !DILocation(line: 210, column: 28, scope: !1007)
!1013 = !DILocation(line: 211, column: 38, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1007, file: !2, line: 211, column: 8)
!1015 = !DILocation(line: 211, column: 45, scope: !1014)
!1016 = !DILocation(line: 211, column: 52, scope: !1014)
!1017 = !DILocation(line: 211, column: 15, scope: !1014)
!1018 = !DILocation(line: 211, column: 8, scope: !1014)
!1019 = !DILocation(line: 211, column: 8, scope: !1007)
!1020 = !DILocation(line: 212, column: 25, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1014, file: !2, line: 211, column: 59)
!1022 = !DILocation(line: 212, column: 7, scope: !1021)
!1023 = !DILocation(line: 213, column: 14, scope: !1021)
!1024 = !DILocation(line: 213, column: 12, scope: !1021)
!1025 = !DILocation(line: 214, column: 5, scope: !1021)
!1026 = !DILocation(line: 215, column: 16, scope: !1007)
!1027 = !DILocation(line: 215, column: 5, scope: !1007)
!1028 = !DILocation(line: 216, column: 3, scope: !1007)
!1029 = !DILocation(line: 209, column: 140, scope: !1000)
!1030 = !DILocation(line: 209, column: 138, scope: !1000)
!1031 = !DILocation(line: 209, column: 175, scope: !1000)
!1032 = !DILocation(line: 209, column: 182, scope: !1000)
!1033 = !DILocation(line: 209, column: 185, scope: !1000)
!1034 = !DILocation(line: 209, column: 157, scope: !1000)
!1035 = !DILocation(line: 209, column: 147, scope: !1000)
!1036 = !DILocation(line: 209, column: 145, scope: !1000)
!1037 = !DILocation(line: 209, column: 215, scope: !1000)
!1038 = !DILocation(line: 209, column: 197, scope: !1000)
!1039 = !DILocation(line: 209, column: 3, scope: !1000)
!1040 = distinct !{!1040, !1005, !1041, !236}
!1041 = !DILocation(line: 216, column: 3, scope: !991)
!1042 = !DILocation(line: 217, column: 10, scope: !971)
!1043 = !DILocation(line: 217, column: 3, scope: !971)
!1044 = distinct !DISubprogram(name: "drawGraph", scope: !2, file: !2, line: 220, type: !1045, scopeLine: 220, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !148)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!123, !138, !90, !90, !90, !533}
!1047 = !DILocalVariable(name: "arena", arg: 1, scope: !1044, file: !2, line: 220, type: !138)
!1048 = !DILocation(line: 220, column: 30, scope: !1044)
!1049 = !DILocalVariable(name: "begin", arg: 2, scope: !1044, file: !2, line: 220, type: !90)
!1050 = !DILocation(line: 220, column: 52, scope: !1044)
!1051 = !DILocalVariable(name: "end", arg: 3, scope: !1044, file: !2, line: 220, type: !90)
!1052 = !DILocation(line: 220, column: 74, scope: !1044)
!1053 = !DILocalVariable(name: "byAmount", arg: 4, scope: !1044, file: !2, line: 220, type: !90)
!1054 = !DILocation(line: 220, column: 94, scope: !1044)
!1055 = !DILocalVariable(name: "valFunc", arg: 5, scope: !1044, file: !2, line: 220, type: !533)
!1056 = !DILocation(line: 220, column: 121, scope: !1044)
!1057 = !DILocalVariable(name: "w", scope: !1044, file: !2, line: 221, type: !1058)
!1058 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !1059, line: 27, size: 64, elements: !1060)
!1059 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!1060 = !{!1061, !1063, !1064, !1065}
!1061 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !1058, file: !1059, line: 29, baseType: !1062, size: 16)
!1062 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1063 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !1058, file: !1059, line: 30, baseType: !1062, size: 16, offset: 16)
!1064 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !1058, file: !1059, line: 31, baseType: !1062, size: 16, offset: 32)
!1065 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !1058, file: !1059, line: 32, baseType: !1062, size: 16, offset: 48)
!1066 = !DILocation(line: 221, column: 18, scope: !1044)
!1067 = !DILocation(line: 224, column: 7, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1044, file: !2, line: 224, column: 7)
!1069 = !DILocation(line: 224, column: 44, scope: !1068)
!1070 = !DILocation(line: 224, column: 7, scope: !1044)
!1071 = !DILocation(line: 225, column: 7, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1068, file: !2, line: 224, column: 51)
!1073 = !DILocation(line: 226, column: 7, scope: !1072)
!1074 = !DILocalVariable(name: "myBegin", scope: !1044, file: !2, line: 229, type: !90)
!1075 = !DILocation(line: 229, column: 18, scope: !1044)
!1076 = !DILocation(line: 229, column: 38, scope: !1044)
!1077 = !DILocation(line: 229, column: 28, scope: !1044)
!1078 = !DILocalVariable(name: "myEnd", scope: !1044, file: !2, line: 230, type: !90)
!1079 = !DILocation(line: 230, column: 18, scope: !1044)
!1080 = !DILocation(line: 230, column: 36, scope: !1044)
!1081 = !DILocation(line: 230, column: 26, scope: !1044)
!1082 = !DILocalVariable(name: "myAmount", scope: !1044, file: !2, line: 231, type: !90)
!1083 = !DILocation(line: 231, column: 18, scope: !1044)
!1084 = !DILocation(line: 231, column: 39, scope: !1044)
!1085 = !DILocation(line: 231, column: 29, scope: !1044)
!1086 = !DILocation(line: 232, column: 14, scope: !1044)
!1087 = !DILocation(line: 232, column: 3, scope: !1044)
!1088 = !DILocation(line: 235, column: 3, scope: !1044)
!1089 = !DILocation(line: 236, column: 14, scope: !1044)
!1090 = !DILocation(line: 236, column: 3, scope: !1044)
!1091 = !DILocation(line: 237, column: 3, scope: !1044)
!1092 = !DILocation(line: 238, column: 14, scope: !1044)
!1093 = !DILocation(line: 238, column: 3, scope: !1044)
!1094 = !DILocation(line: 239, column: 3, scope: !1044)
!1095 = !DILocation(line: 240, column: 14, scope: !1044)
!1096 = !DILocation(line: 240, column: 3, scope: !1044)
!1097 = !DILocation(line: 241, column: 3, scope: !1044)
!1098 = !DILocalVariable(name: "screenWidth", scope: !1044, file: !2, line: 244, type: !90)
!1099 = !DILocation(line: 244, column: 18, scope: !1044)
!1100 = !DILocation(line: 244, column: 63, scope: !1044)
!1101 = !DILocation(line: 244, column: 72, scope: !1044)
!1102 = !DILocation(line: 244, column: 70, scope: !1044)
!1103 = !DILocation(line: 244, column: 42, scope: !1044)
!1104 = !DILocation(line: 244, column: 32, scope: !1044)
!1105 = !DILocalVariable(name: "screenHeight", scope: !1044, file: !2, line: 245, type: !90)
!1106 = !DILocation(line: 245, column: 18, scope: !1044)
!1107 = !DILocation(line: 245, column: 64, scope: !1044)
!1108 = !DILocation(line: 245, column: 73, scope: !1044)
!1109 = !DILocation(line: 245, column: 71, scope: !1044)
!1110 = !DILocation(line: 245, column: 43, scope: !1044)
!1111 = !DILocation(line: 245, column: 33, scope: !1044)
!1112 = !DILocalVariable(name: "two", scope: !1044, file: !2, line: 246, type: !90)
!1113 = !DILocation(line: 246, column: 18, scope: !1044)
!1114 = !DILocation(line: 246, column: 55, scope: !1044)
!1115 = !DILocation(line: 246, column: 34, scope: !1044)
!1116 = !DILocation(line: 246, column: 24, scope: !1044)
!1117 = !DILocalVariable(name: "xStep", scope: !1044, file: !2, line: 247, type: !90)
!1118 = !DILocation(line: 247, column: 18, scope: !1044)
!1119 = !DILocation(line: 247, column: 55, scope: !1044)
!1120 = !DILocation(line: 247, column: 80, scope: !1044)
!1121 = !DILocation(line: 247, column: 105, scope: !1044)
!1122 = !DILocation(line: 247, column: 112, scope: !1044)
!1123 = !DILocation(line: 247, column: 119, scope: !1044)
!1124 = !DILocation(line: 247, column: 87, scope: !1044)
!1125 = !DILocation(line: 247, column: 129, scope: !1044)
!1126 = !DILocation(line: 247, column: 62, scope: !1044)
!1127 = !DILocation(line: 247, column: 143, scope: !1044)
!1128 = !DILocation(line: 247, column: 36, scope: !1044)
!1129 = !DILocation(line: 247, column: 26, scope: !1044)
!1130 = !DILocalVariable(name: "div2Width", scope: !1044, file: !2, line: 248, type: !90)
!1131 = !DILocation(line: 248, column: 18, scope: !1044)
!1132 = !DILocation(line: 248, column: 58, scope: !1044)
!1133 = !DILocation(line: 248, column: 65, scope: !1044)
!1134 = !DILocation(line: 248, column: 78, scope: !1044)
!1135 = !DILocation(line: 248, column: 40, scope: !1044)
!1136 = !DILocation(line: 248, column: 30, scope: !1044)
!1137 = !DILocalVariable(name: "xBegin", scope: !1044, file: !2, line: 249, type: !90)
!1138 = !DILocation(line: 249, column: 18, scope: !1044)
!1139 = !DILocation(line: 249, column: 57, scope: !1044)
!1140 = !DILocation(line: 249, column: 83, scope: !1044)
!1141 = !DILocation(line: 249, column: 90, scope: !1044)
!1142 = !DILocation(line: 249, column: 97, scope: !1044)
!1143 = !DILocation(line: 249, column: 64, scope: !1044)
!1144 = !DILocation(line: 249, column: 37, scope: !1044)
!1145 = !DILocation(line: 249, column: 27, scope: !1044)
!1146 = !DILocalVariable(name: "xEnd", scope: !1044, file: !2, line: 250, type: !90)
!1147 = !DILocation(line: 250, column: 18, scope: !1044)
!1148 = !DILocation(line: 250, column: 54, scope: !1044)
!1149 = !DILocation(line: 250, column: 61, scope: !1044)
!1150 = !DILocation(line: 250, column: 68, scope: !1044)
!1151 = !DILocation(line: 250, column: 35, scope: !1044)
!1152 = !DILocation(line: 250, column: 25, scope: !1044)
!1153 = !DILocation(line: 252, column: 3, scope: !1044)
!1154 = !DILocation(line: 253, column: 14, scope: !1044)
!1155 = !DILocation(line: 253, column: 3, scope: !1044)
!1156 = !DILocation(line: 254, column: 3, scope: !1044)
!1157 = !DILocation(line: 255, column: 14, scope: !1044)
!1158 = !DILocation(line: 255, column: 3, scope: !1044)
!1159 = !DILocation(line: 256, column: 3, scope: !1044)
!1160 = !DILocation(line: 257, column: 14, scope: !1044)
!1161 = !DILocation(line: 257, column: 3, scope: !1044)
!1162 = !DILocation(line: 258, column: 3, scope: !1044)
!1163 = !DILocation(line: 259, column: 14, scope: !1044)
!1164 = !DILocation(line: 259, column: 3, scope: !1044)
!1165 = !DILocation(line: 260, column: 3, scope: !1044)
!1166 = !DILocation(line: 261, column: 14, scope: !1044)
!1167 = !DILocation(line: 261, column: 3, scope: !1044)
!1168 = !DILocation(line: 262, column: 3, scope: !1044)
!1169 = !DILocation(line: 263, column: 14, scope: !1044)
!1170 = !DILocation(line: 263, column: 3, scope: !1044)
!1171 = !DILocation(line: 264, column: 3, scope: !1044)
!1172 = !DILocation(line: 265, column: 14, scope: !1044)
!1173 = !DILocation(line: 265, column: 3, scope: !1044)
!1174 = !DILocation(line: 266, column: 3, scope: !1044)
!1175 = !DILocation(line: 268, column: 14, scope: !1044)
!1176 = !DILocation(line: 268, column: 3, scope: !1044)
!1177 = !DILocalVariable(name: "yMax", scope: !1044, file: !2, line: 270, type: !90)
!1178 = !DILocation(line: 270, column: 18, scope: !1044)
!1179 = !DILocation(line: 270, column: 44, scope: !1044)
!1180 = !DILocation(line: 270, column: 51, scope: !1044)
!1181 = !DILocation(line: 270, column: 59, scope: !1044)
!1182 = !DILocation(line: 270, column: 65, scope: !1044)
!1183 = !DILocation(line: 270, column: 72, scope: !1044)
!1184 = !DILocation(line: 270, column: 35, scope: !1044)
!1185 = !DILocation(line: 270, column: 25, scope: !1044)
!1186 = !DILocalVariable(name: "yMin", scope: !1044, file: !2, line: 271, type: !90)
!1187 = !DILocation(line: 271, column: 18, scope: !1044)
!1188 = !DILocation(line: 271, column: 44, scope: !1044)
!1189 = !DILocation(line: 271, column: 51, scope: !1044)
!1190 = !DILocation(line: 271, column: 59, scope: !1044)
!1191 = !DILocation(line: 271, column: 65, scope: !1044)
!1192 = !DILocation(line: 271, column: 72, scope: !1044)
!1193 = !DILocation(line: 271, column: 35, scope: !1044)
!1194 = !DILocation(line: 271, column: 25, scope: !1044)
!1195 = !DILocalVariable(name: "yStep", scope: !1044, file: !2, line: 273, type: !90)
!1196 = !DILocation(line: 273, column: 18, scope: !1044)
!1197 = !DILocation(line: 273, column: 54, scope: !1044)
!1198 = !DILocation(line: 273, column: 79, scope: !1044)
!1199 = !DILocation(line: 273, column: 86, scope: !1044)
!1200 = !DILocation(line: 273, column: 92, scope: !1044)
!1201 = !DILocation(line: 273, column: 61, scope: !1044)
!1202 = !DILocation(line: 273, column: 99, scope: !1044)
!1203 = !DILocation(line: 273, column: 36, scope: !1044)
!1204 = !DILocation(line: 273, column: 26, scope: !1044)
!1205 = !DILocalVariable(name: "div2Height", scope: !1044, file: !2, line: 274, type: !90)
!1206 = !DILocation(line: 274, column: 18, scope: !1044)
!1207 = !DILocation(line: 274, column: 59, scope: !1044)
!1208 = !DILocation(line: 274, column: 66, scope: !1044)
!1209 = !DILocation(line: 274, column: 80, scope: !1044)
!1210 = !DILocation(line: 274, column: 41, scope: !1044)
!1211 = !DILocation(line: 274, column: 31, scope: !1044)
!1212 = !DILocalVariable(name: "yBegin", scope: !1044, file: !2, line: 275, type: !90)
!1213 = !DILocation(line: 275, column: 18, scope: !1044)
!1214 = !DILocation(line: 275, column: 57, scope: !1044)
!1215 = !DILocation(line: 275, column: 83, scope: !1044)
!1216 = !DILocation(line: 275, column: 90, scope: !1044)
!1217 = !DILocation(line: 275, column: 97, scope: !1044)
!1218 = !DILocation(line: 275, column: 64, scope: !1044)
!1219 = !DILocation(line: 275, column: 37, scope: !1044)
!1220 = !DILocation(line: 275, column: 27, scope: !1044)
!1221 = !DILocalVariable(name: "yEnd", scope: !1044, file: !2, line: 276, type: !90)
!1222 = !DILocation(line: 276, column: 18, scope: !1044)
!1223 = !DILocation(line: 276, column: 54, scope: !1044)
!1224 = !DILocation(line: 276, column: 61, scope: !1044)
!1225 = !DILocation(line: 276, column: 68, scope: !1044)
!1226 = !DILocation(line: 276, column: 35, scope: !1044)
!1227 = !DILocation(line: 276, column: 25, scope: !1044)
!1228 = !DILocation(line: 277, column: 14, scope: !1044)
!1229 = !DILocation(line: 277, column: 3, scope: !1044)
!1230 = !DILocalVariable(name: "display", scope: !1044, file: !2, line: 279, type: !188)
!1231 = !DILocation(line: 279, column: 19, scope: !1044)
!1232 = !DILocation(line: 279, column: 43, scope: !1044)
!1233 = !DILocation(line: 279, column: 50, scope: !1044)
!1234 = !DILocation(line: 279, column: 57, scope: !1044)
!1235 = !DILocation(line: 279, column: 64, scope: !1044)
!1236 = !DILocation(line: 279, column: 72, scope: !1044)
!1237 = !DILocation(line: 279, column: 78, scope: !1044)
!1238 = !DILocation(line: 279, column: 92, scope: !1044)
!1239 = !DILocation(line: 279, column: 29, scope: !1044)
!1240 = !DILocation(line: 280, column: 13, scope: !1044)
!1241 = !DILocation(line: 280, column: 22, scope: !1044)
!1242 = !DILocation(line: 280, column: 29, scope: !1044)
!1243 = !DILocation(line: 280, column: 36, scope: !1044)
!1244 = !DILocation(line: 280, column: 43, scope: !1044)
!1245 = !DILocation(line: 280, column: 57, scope: !1044)
!1246 = !DILocation(line: 280, column: 3, scope: !1044)
!1247 = !DILocation(line: 281, column: 12, scope: !1044)
!1248 = !DILocation(line: 281, column: 21, scope: !1044)
!1249 = !DILocation(line: 281, column: 30, scope: !1044)
!1250 = !DILocation(line: 281, column: 37, scope: !1044)
!1251 = !DILocation(line: 281, column: 44, scope: !1044)
!1252 = !DILocation(line: 281, column: 51, scope: !1044)
!1253 = !DILocation(line: 281, column: 65, scope: !1044)
!1254 = !DILocation(line: 281, column: 3, scope: !1044)
!1255 = !DILocation(line: 282, column: 14, scope: !1044)
!1256 = !DILocation(line: 282, column: 23, scope: !1044)
!1257 = !DILocation(line: 282, column: 37, scope: !1044)
!1258 = !DILocation(line: 282, column: 3, scope: !1044)
!1259 = !DILocation(line: 283, column: 16, scope: !1044)
!1260 = !DILocation(line: 283, column: 25, scope: !1044)
!1261 = !DILocation(line: 283, column: 3, scope: !1044)
!1262 = !DILocation(line: 285, column: 21, scope: !1044)
!1263 = !DILocation(line: 285, column: 3, scope: !1044)
!1264 = !DILocation(line: 286, column: 21, scope: !1044)
!1265 = !DILocation(line: 286, column: 3, scope: !1044)
!1266 = !DILocation(line: 287, column: 21, scope: !1044)
!1267 = !DILocation(line: 287, column: 3, scope: !1044)
!1268 = !DILocation(line: 288, column: 21, scope: !1044)
!1269 = !DILocation(line: 288, column: 3, scope: !1044)
!1270 = !DILocation(line: 289, column: 21, scope: !1044)
!1271 = !DILocation(line: 289, column: 3, scope: !1044)
!1272 = !DILocation(line: 290, column: 21, scope: !1044)
!1273 = !DILocation(line: 290, column: 3, scope: !1044)
!1274 = !DILocation(line: 291, column: 21, scope: !1044)
!1275 = !DILocation(line: 291, column: 3, scope: !1044)
!1276 = !DILocation(line: 292, column: 3, scope: !1044)
!1277 = !DILocation(line: 293, column: 1, scope: !1044)
