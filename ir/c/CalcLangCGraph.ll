; ModuleID = 'src/c/CalcLangCGraph.c'
source_filename = "src/c/CalcLangCGraph.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangPixel = type { x86_fp80, x86_fp80, i8 }
%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { ptr }
%struct.winsize = type { i16, i16, i16, i16 }

@base = dso_local global x86_fp80 0xK4002A000000000000000, align 16, !dbg !0
@.str = private unnamed_addr constant [9 x i8] c"_,.-~*'`\00", align 1, !dbg !17
@.str.1 = private unnamed_addr constant [50 x i8] c"Error expected integer type from graphed function\00", align 1, !dbg !22
@.str.2 = private unnamed_addr constant [13 x i8] c"ioctl failed\00", align 1, !dbg !27

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @closeTo(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !40 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !45, metadata !DIExpression()), !dbg !46
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !47, metadata !DIExpression()), !dbg !48
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !49, metadata !DIExpression()), !dbg !50
  %7 = load x86_fp80, ptr %4, align 16, !dbg !51
  %8 = load x86_fp80, ptr %5, align 16, !dbg !52
  %9 = fsub x86_fp80 %7, %8, !dbg !53
  %10 = call x86_fp80 @llvm.fabs.f80(x86_fp80 %9), !dbg !54
  %11 = load x86_fp80, ptr %6, align 16, !dbg !55
  %12 = fcmp olt x86_fp80 %10, %11, !dbg !56
  ret i1 %12, !dbg !57
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fabs.f80(x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @initializeDisplay(i32 noundef %0, i32 noundef %1) #0 !dbg !58 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata ptr %5, metadata !66, metadata !DIExpression()), !dbg !67
  %7 = load i32, ptr %4, align 4, !dbg !68
  %8 = sext i32 %7 to i64, !dbg !68
  %9 = mul i64 8, %8, !dbg !69
  %10 = call noalias ptr @malloc(i64 noundef %9) #7, !dbg !70
  store ptr %10, ptr %5, align 8, !dbg !67
  %11 = load ptr, ptr %5, align 8, !dbg !71
  %12 = load i32, ptr %4, align 4, !dbg !72
  %13 = sext i32 %12 to i64, !dbg !72
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 %13, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata ptr %6, metadata !74, metadata !DIExpression()), !dbg !76
  store i32 0, ptr %6, align 4, !dbg !76
  br label %14, !dbg !77

14:                                               ; preds = %30, %2
  %15 = load i32, ptr %6, align 4, !dbg !78
  %16 = load i32, ptr %4, align 4, !dbg !80
  %17 = icmp slt i32 %15, %16, !dbg !81
  br i1 %17, label %18, label %33, !dbg !82

18:                                               ; preds = %14
  %19 = load i32, ptr %3, align 4, !dbg !83
  %20 = sext i32 %19 to i64, !dbg !83
  %21 = mul i64 48, %20, !dbg !85
  %22 = call noalias ptr @malloc(i64 noundef %21) #7, !dbg !86
  %23 = load ptr, ptr %5, align 8, !dbg !87
  %24 = load i32, ptr %6, align 4, !dbg !88
  %25 = sext i32 %24 to i64, !dbg !87
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25, !dbg !87
  store ptr %22, ptr %26, align 8, !dbg !89
  %27 = load ptr, ptr %5, align 8, !dbg !90
  %28 = load i32, ptr %3, align 4, !dbg !91
  %29 = sext i32 %28 to i64, !dbg !91
  call void @llvm.memset.p0.i64(ptr align 8 %27, i8 0, i64 %29, i1 false), !dbg !92
  br label %30, !dbg !93

30:                                               ; preds = %18
  %31 = load i32, ptr %6, align 4, !dbg !94
  %32 = add nsw i32 %31, 1, !dbg !94
  store i32 %32, ptr %6, align 4, !dbg !94
  br label %14, !dbg !95, !llvm.loop !96

33:                                               ; preds = %14
  %34 = load ptr, ptr %5, align 8, !dbg !99
  ret ptr %34, !dbg !100
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, x86_fp80 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !101 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !104, metadata !DIExpression()), !dbg !105
  store x86_fp80 %1, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !106, metadata !DIExpression()), !dbg !107
  store x86_fp80 %2, ptr %9, align 16
  call void @llvm.dbg.declare(metadata ptr %9, metadata !108, metadata !DIExpression()), !dbg !109
  store x86_fp80 %3, ptr %10, align 16
  call void @llvm.dbg.declare(metadata ptr %10, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 %5, ptr %12, align 4
  call void @llvm.dbg.declare(metadata ptr %12, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata ptr %13, metadata !116, metadata !DIExpression()), !dbg !117
  %16 = load i32, ptr %11, align 4, !dbg !118
  %17 = load i32, ptr %12, align 4, !dbg !119
  %18 = call ptr @initializeDisplay(i32 noundef %16, i32 noundef %17), !dbg !120
  store ptr %18, ptr %13, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata ptr %14, metadata !121, metadata !DIExpression()), !dbg !123
  store i32 0, ptr %14, align 4, !dbg !123
  br label %19, !dbg !124

19:                                               ; preds = %62, %6
  %20 = load i32, ptr %14, align 4, !dbg !125
  %21 = load i32, ptr %12, align 4, !dbg !127
  %22 = icmp slt i32 %20, %21, !dbg !128
  br i1 %22, label %23, label %65, !dbg !129

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %15, metadata !130, metadata !DIExpression()), !dbg !133
  store i32 0, ptr %15, align 4, !dbg !133
  br label %24, !dbg !134

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %15, align 4, !dbg !135
  %26 = load i32, ptr %11, align 4, !dbg !137
  %27 = icmp slt i32 %25, %26, !dbg !138
  br i1 %27, label %28, label %61, !dbg !139

28:                                               ; preds = %24
  %29 = load x86_fp80, ptr %9, align 16, !dbg !140
  %30 = load x86_fp80, ptr %7, align 16, !dbg !142
  %31 = load i32, ptr %15, align 4, !dbg !143
  %32 = sitofp i32 %31 to x86_fp80, !dbg !143
  %33 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %30, x86_fp80 %32, x86_fp80 %29), !dbg !144
  %34 = load ptr, ptr %13, align 8, !dbg !145
  %35 = load i32, ptr %14, align 4, !dbg !146
  %36 = sext i32 %35 to i64, !dbg !145
  %37 = getelementptr inbounds ptr, ptr %34, i64 %36, !dbg !145
  %38 = load ptr, ptr %37, align 8, !dbg !145
  %39 = load i32, ptr %15, align 4, !dbg !147
  %40 = sext i32 %39 to i64, !dbg !145
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %38, i64 %40, !dbg !145
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %41, i32 0, i32 0, !dbg !148
  store x86_fp80 %33, ptr %42, align 16, !dbg !149
  %43 = load x86_fp80, ptr %10, align 16, !dbg !150
  %44 = load x86_fp80, ptr %8, align 16, !dbg !151
  %45 = load i32, ptr %14, align 4, !dbg !152
  %46 = sitofp i32 %45 to x86_fp80, !dbg !152
  %47 = fneg x86_fp80 %44, !dbg !153
  %48 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %47, x86_fp80 %46, x86_fp80 %43), !dbg !153
  %49 = load ptr, ptr %13, align 8, !dbg !154
  %50 = load i32, ptr %15, align 4, !dbg !155
  %51 = sext i32 %50 to i64, !dbg !154
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !154
  %53 = load ptr, ptr %52, align 8, !dbg !154
  %54 = load i32, ptr %14, align 4, !dbg !156
  %55 = sext i32 %54 to i64, !dbg !154
  %56 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i64 %55, !dbg !154
  %57 = getelementptr inbounds %struct.CalcLangPixel, ptr %56, i32 0, i32 1, !dbg !157
  store x86_fp80 %48, ptr %57, align 16, !dbg !158
  br label %58, !dbg !159

58:                                               ; preds = %28
  %59 = load i32, ptr %15, align 4, !dbg !160
  %60 = add nsw i32 %59, 1, !dbg !160
  store i32 %60, ptr %15, align 4, !dbg !160
  br label %24, !dbg !161, !llvm.loop !162

61:                                               ; preds = %24
  br label %62, !dbg !164

62:                                               ; preds = %61
  %63 = load i32, ptr %14, align 4, !dbg !165
  %64 = add nsw i32 %63, 1, !dbg !165
  store i32 %64, ptr %14, align 4, !dbg !165
  br label %19, !dbg !166, !llvm.loop !167

65:                                               ; preds = %19
  %66 = load ptr, ptr %13, align 8, !dbg !169
  ret ptr %66, !dbg !170
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !171 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !174, metadata !DIExpression()), !dbg !175
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !176, metadata !DIExpression()), !dbg !177
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata ptr %7, metadata !180, metadata !DIExpression()), !dbg !182
  store ptr @.str, ptr %7, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata ptr %8, metadata !183, metadata !DIExpression()), !dbg !184
  %12 = load x86_fp80, ptr %6, align 16, !dbg !185
  %13 = fdiv x86_fp80 %12, 0xK40028000000000000000, !dbg !186
  store x86_fp80 %13, ptr %8, align 16, !dbg !184
  call void @llvm.dbg.declare(metadata ptr %9, metadata !187, metadata !DIExpression()), !dbg !188
  %14 = load x86_fp80, ptr %4, align 16, !dbg !189
  %15 = load x86_fp80, ptr %5, align 16, !dbg !190
  %16 = load x86_fp80, ptr %6, align 16, !dbg !191
  %17 = fdiv x86_fp80 %16, 0xK40008000000000000000, !dbg !192
  %18 = fsub x86_fp80 %15, %17, !dbg !193
  %19 = fsub x86_fp80 %14, %18, !dbg !194
  store x86_fp80 %19, ptr %9, align 16, !dbg !188
  call void @llvm.dbg.declare(metadata ptr %10, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 0, ptr %10, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata ptr %11, metadata !197, metadata !DIExpression()), !dbg !198
  store x86_fp80 0xK00000000000000000000, ptr %11, align 16, !dbg !198
  br label %20, !dbg !199

20:                                               ; preds = %24, %3
  %21 = load x86_fp80, ptr %11, align 16, !dbg !200
  %22 = load x86_fp80, ptr %9, align 16, !dbg !201
  %23 = fcmp olt x86_fp80 %21, %22, !dbg !202
  br i1 %23, label %24, label %30, !dbg !199

24:                                               ; preds = %20
  %25 = load x86_fp80, ptr %8, align 16, !dbg !203
  %26 = load x86_fp80, ptr %11, align 16, !dbg !205
  %27 = fadd x86_fp80 %26, %25, !dbg !205
  store x86_fp80 %27, ptr %11, align 16, !dbg !205
  %28 = load i32, ptr %10, align 4, !dbg !206
  %29 = add nsw i32 %28, 1, !dbg !206
  store i32 %29, ptr %10, align 4, !dbg !206
  br label %20, !dbg !199, !llvm.loop !207

30:                                               ; preds = %20
  %31 = load ptr, ptr %7, align 8, !dbg !209
  %32 = load i32, ptr %10, align 4, !dbg !210
  %33 = sub nsw i32 %32, 1, !dbg !211
  %34 = sext i32 %33 to i64, !dbg !209
  %35 = getelementptr inbounds i8, ptr %31, i64 %34, !dbg !209
  %36 = load i8, ptr %35, align 1, !dbg !209
  ret i8 %36, !dbg !212
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !213 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata ptr %7, metadata !222, metadata !DIExpression()), !dbg !224
  %13 = load i32, ptr %5, align 4, !dbg !225
  %14 = sext i32 %13 to i64, !dbg !225
  %15 = mul i64 8, %14, !dbg !226
  %16 = add i64 %15, 1, !dbg !227
  %17 = call noalias ptr @malloc(i64 noundef %16) #7, !dbg !228
  store ptr %17, ptr %7, align 8, !dbg !224
  call void @llvm.dbg.declare(metadata ptr %8, metadata !229, metadata !DIExpression()), !dbg !231
  store i32 0, ptr %8, align 4, !dbg !231
  br label %18, !dbg !232

18:                                               ; preds = %32, %3
  %19 = load i32, ptr %8, align 4, !dbg !233
  %20 = load i32, ptr %5, align 4, !dbg !235
  %21 = icmp slt i32 %19, %20, !dbg !236
  br i1 %21, label %22, label %35, !dbg !237

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4, !dbg !238
  %24 = sext i32 %23 to i64, !dbg !238
  %25 = mul i64 1, %24, !dbg !240
  %26 = add i64 %25, 1, !dbg !241
  %27 = call noalias ptr @malloc(i64 noundef %26) #7, !dbg !242
  %28 = load ptr, ptr %7, align 8, !dbg !243
  %29 = load i32, ptr %8, align 4, !dbg !244
  %30 = sext i32 %29 to i64, !dbg !243
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30, !dbg !243
  store ptr %27, ptr %31, align 8, !dbg !245
  br label %32, !dbg !246

32:                                               ; preds = %22
  %33 = load i32, ptr %8, align 4, !dbg !247
  %34 = add nsw i32 %33, 1, !dbg !247
  store i32 %34, ptr %8, align 4, !dbg !247
  br label %18, !dbg !248, !llvm.loop !249

35:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %9, metadata !251, metadata !DIExpression()), !dbg !253
  store i32 0, ptr %9, align 4, !dbg !253
  br label %36, !dbg !254

36:                                               ; preds = %76, %35
  %37 = load i32, ptr %9, align 4, !dbg !255
  %38 = load i32, ptr %5, align 4, !dbg !257
  %39 = icmp slt i32 %37, %38, !dbg !258
  br i1 %39, label %40, label %79, !dbg !259

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %10, metadata !260, metadata !DIExpression()), !dbg !263
  store i32 0, ptr %10, align 4, !dbg !263
  br label %41, !dbg !264

41:                                               ; preds = %64, %40
  %42 = load i32, ptr %10, align 4, !dbg !265
  %43 = load i32, ptr %6, align 4, !dbg !267
  %44 = icmp slt i32 %42, %43, !dbg !268
  br i1 %44, label %45, label %67, !dbg !269

45:                                               ; preds = %41
  %46 = load ptr, ptr %4, align 8, !dbg !270
  %47 = load i32, ptr %9, align 4, !dbg !271
  %48 = sext i32 %47 to i64, !dbg !270
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48, !dbg !270
  %50 = load ptr, ptr %49, align 8, !dbg !270
  %51 = load i32, ptr %10, align 4, !dbg !272
  %52 = sext i32 %51 to i64, !dbg !270
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %50, i64 %52, !dbg !270
  %54 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i32 0, i32 2, !dbg !273
  %55 = load i8, ptr %54, align 16, !dbg !274
  %56 = load ptr, ptr %7, align 8, !dbg !275
  %57 = load i32, ptr %9, align 4, !dbg !276
  %58 = sext i32 %57 to i64, !dbg !275
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58, !dbg !275
  %60 = load ptr, ptr %59, align 8, !dbg !275
  %61 = load i32, ptr %10, align 4, !dbg !277
  %62 = sext i32 %61 to i64, !dbg !275
  %63 = getelementptr inbounds i8, ptr %60, i64 %62, !dbg !275
  store i8 %55, ptr %63, align 1, !dbg !278
  br label %64, !dbg !275

64:                                               ; preds = %45
  %65 = load i32, ptr %10, align 4, !dbg !279
  %66 = add nsw i32 %65, 1, !dbg !279
  store i32 %66, ptr %10, align 4, !dbg !279
  br label %41, !dbg !280, !llvm.loop !281

67:                                               ; preds = %41
  %68 = load ptr, ptr %7, align 8, !dbg !283
  %69 = load i32, ptr %9, align 4, !dbg !284
  %70 = sext i32 %69 to i64, !dbg !283
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70, !dbg !283
  %72 = load ptr, ptr %71, align 8, !dbg !283
  %73 = load i32, ptr %6, align 4, !dbg !285
  %74 = sext i32 %73 to i64, !dbg !283
  %75 = getelementptr inbounds i8, ptr %72, i64 %74, !dbg !283
  store i8 0, ptr %75, align 1, !dbg !286
  br label %76, !dbg !287

76:                                               ; preds = %67
  %77 = load i32, ptr %9, align 4, !dbg !288
  %78 = add nsw i32 %77, 1, !dbg !288
  store i32 %78, ptr %9, align 4, !dbg !288
  br label %36, !dbg !289, !llvm.loop !290

79:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %11, metadata !292, metadata !DIExpression()), !dbg !294
  store i32 0, ptr %11, align 4, !dbg !294
  br label %80, !dbg !295

80:                                               ; preds = %91, %79
  %81 = load i32, ptr %11, align 4, !dbg !296
  %82 = load i32, ptr %5, align 4, !dbg !298
  %83 = icmp slt i32 %81, %82, !dbg !299
  br i1 %83, label %84, label %94, !dbg !300

84:                                               ; preds = %80
  %85 = load ptr, ptr %7, align 8, !dbg !301
  %86 = load i32, ptr %11, align 4, !dbg !302
  %87 = sext i32 %86 to i64, !dbg !301
  %88 = getelementptr inbounds ptr, ptr %85, i64 %87, !dbg !301
  %89 = load ptr, ptr %88, align 8, !dbg !301
  %90 = call i32 @puts(ptr noundef %89), !dbg !303
  br label %91, !dbg !303

91:                                               ; preds = %84
  %92 = load i32, ptr %11, align 4, !dbg !304
  %93 = add nsw i32 %92, 1, !dbg !304
  store i32 %93, ptr %11, align 4, !dbg !304
  br label %80, !dbg !305, !llvm.loop !306

94:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata ptr %12, metadata !308, metadata !DIExpression()), !dbg !310
  store i32 0, ptr %12, align 4, !dbg !310
  br label %95, !dbg !311

95:                                               ; preds = %105, %94
  %96 = load i32, ptr %12, align 4, !dbg !312
  %97 = load i32, ptr %5, align 4, !dbg !314
  %98 = icmp sle i32 %96, %97, !dbg !315
  br i1 %98, label %99, label %108, !dbg !316

99:                                               ; preds = %95
  %100 = load ptr, ptr %7, align 8, !dbg !317
  %101 = load i32, ptr %12, align 4, !dbg !318
  %102 = sext i32 %101 to i64, !dbg !317
  %103 = getelementptr inbounds ptr, ptr %100, i64 %102, !dbg !317
  %104 = load ptr, ptr %103, align 8, !dbg !317
  call void @free(ptr noundef %104) #8, !dbg !319
  br label %105, !dbg !319

105:                                              ; preds = %99
  %106 = load i32, ptr %12, align 4, !dbg !320
  %107 = add nsw i32 %106, 1, !dbg !320
  store i32 %107, ptr %12, align 4, !dbg !320
  br label %95, !dbg !321, !llvm.loop !322

108:                                              ; preds = %95
  %109 = load ptr, ptr %7, align 8, !dbg !324
  call void @free(ptr noundef %109) #8, !dbg !325
  ret void, !dbg !326
}

declare i32 @puts(ptr noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @calcLangValueFuncWrapper(ptr noundef %0, ptr noundef %1, x86_fp80 noundef %2) #0 !dbg !327 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !374, metadata !DIExpression()), !dbg !375
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !376, metadata !DIExpression()), !dbg !377
  store x86_fp80 %2, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata ptr %8, metadata !380, metadata !DIExpression()), !dbg !381
  %10 = load ptr, ptr %5, align 8, !dbg !382
  %11 = call ptr @arenaAlloc(ptr noundef %10, i32 noundef 8), !dbg !383
  store ptr %11, ptr %8, align 8, !dbg !381
  %12 = load ptr, ptr %8, align 8, !dbg !384
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 0, !dbg !385
  store i32 0, ptr %13, align 8, !dbg !386
  %14 = load x86_fp80, ptr %7, align 16, !dbg !387
  %15 = fptosi x86_fp80 %14 to i32, !dbg !388
  %16 = load ptr, ptr %8, align 8, !dbg !389
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 1, !dbg !390
  store i32 %15, ptr %17, align 8, !dbg !391
  call void @llvm.dbg.declare(metadata ptr %9, metadata !392, metadata !DIExpression()), !dbg !393
  %18 = load ptr, ptr %6, align 8, !dbg !394
  %19 = load ptr, ptr %8, align 8, !dbg !395
  %20 = call ptr %18(ptr noundef %19), !dbg !394
  store ptr %20, ptr %9, align 8, !dbg !393
  %21 = load ptr, ptr %9, align 8, !dbg !396
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 0, !dbg !398
  %23 = load i32, ptr %22, align 8, !dbg !398
  %24 = icmp eq i32 %23, 0, !dbg !399
  br i1 %24, label %25, label %30, !dbg !400

25:                                               ; preds = %3
  %26 = load ptr, ptr %9, align 8, !dbg !401
  %27 = getelementptr inbounds %struct.CalcLangVal, ptr %26, i32 0, i32 1, !dbg !402
  %28 = load i32, ptr %27, align 8, !dbg !403
  %29 = sitofp i32 %28 to x86_fp80, !dbg !404
  store x86_fp80 %29, ptr %4, align 16, !dbg !405
  br label %31, !dbg !405

30:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #9, !dbg !406
  store x86_fp80 0xKBFFF8000000000000000, ptr %4, align 16, !dbg !408
  br label %31, !dbg !408

31:                                               ; preds = %30, %25
  %32 = load x86_fp80, ptr %4, align 16, !dbg !409
  ret x86_fp80 %32, !dbg !409
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #4

; Function Attrs: cold
declare void @perror(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @shadeGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, x86_fp80 noundef %5, x86_fp80 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !410 {
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !413, metadata !DIExpression()), !dbg !414
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !415, metadata !DIExpression()), !dbg !416
  store ptr %2, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !417, metadata !DIExpression()), !dbg !418
  store x86_fp80 %3, ptr %13, align 16
  call void @llvm.dbg.declare(metadata ptr %13, metadata !419, metadata !DIExpression()), !dbg !420
  store x86_fp80 %4, ptr %14, align 16
  call void @llvm.dbg.declare(metadata ptr %14, metadata !421, metadata !DIExpression()), !dbg !422
  store x86_fp80 %5, ptr %15, align 16
  call void @llvm.dbg.declare(metadata ptr %15, metadata !423, metadata !DIExpression()), !dbg !424
  store x86_fp80 %6, ptr %16, align 16
  call void @llvm.dbg.declare(metadata ptr %16, metadata !425, metadata !DIExpression()), !dbg !426
  store i32 %7, ptr %17, align 4
  call void @llvm.dbg.declare(metadata ptr %17, metadata !427, metadata !DIExpression()), !dbg !428
  store i32 %8, ptr %18, align 4
  call void @llvm.dbg.declare(metadata ptr %18, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata ptr %19, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata ptr %20, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata ptr %21, metadata !435, metadata !DIExpression()), !dbg !437
  store i32 0, ptr %21, align 4, !dbg !437
  br label %25, !dbg !438

25:                                               ; preds = %104, %9
  %26 = load i32, ptr %21, align 4, !dbg !439
  %27 = load i32, ptr %17, align 4, !dbg !441
  %28 = icmp slt i32 %26, %27, !dbg !442
  br i1 %28, label %29, label %107, !dbg !443

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %22, metadata !444, metadata !DIExpression()), !dbg !447
  store i32 0, ptr %22, align 4, !dbg !447
  br label %30, !dbg !448

30:                                               ; preds = %100, %29
  %31 = load i32, ptr %22, align 4, !dbg !449
  %32 = load i32, ptr %18, align 4, !dbg !451
  %33 = icmp slt i32 %31, %32, !dbg !452
  br i1 %33, label %34, label %103, !dbg !453

34:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %23, metadata !454, metadata !DIExpression()), !dbg !456
  %35 = load ptr, ptr %10, align 8, !dbg !457
  %36 = load i32, ptr %21, align 4, !dbg !458
  %37 = sext i32 %36 to i64, !dbg !457
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !457
  %39 = load ptr, ptr %38, align 8, !dbg !457
  %40 = load i32, ptr %22, align 4, !dbg !459
  %41 = sext i32 %40 to i64, !dbg !457
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i64 %41, !dbg !457
  store ptr %42, ptr %23, align 8, !dbg !456
  %43 = load ptr, ptr %23, align 8, !dbg !460
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 0, !dbg !461
  %45 = load x86_fp80, ptr %44, align 16, !dbg !461
  store x86_fp80 %45, ptr %19, align 16, !dbg !462
  %46 = load ptr, ptr %23, align 8, !dbg !463
  %47 = getelementptr inbounds %struct.CalcLangPixel, ptr %46, i32 0, i32 1, !dbg !464
  %48 = load x86_fp80, ptr %47, align 16, !dbg !464
  store x86_fp80 %48, ptr %20, align 16, !dbg !465
  call void @llvm.dbg.declare(metadata ptr %24, metadata !466, metadata !DIExpression()), !dbg !467
  %49 = load ptr, ptr %12, align 8, !dbg !468
  %50 = load ptr, ptr %11, align 8, !dbg !469
  %51 = load x86_fp80, ptr %19, align 16, !dbg !470
  %52 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %49, ptr noundef %50, x86_fp80 noundef %51), !dbg !471
  store x86_fp80 %52, ptr %24, align 16, !dbg !467
  %53 = load x86_fp80, ptr %24, align 16, !dbg !472
  %54 = load x86_fp80, ptr %20, align 16, !dbg !474
  %55 = load x86_fp80, ptr %14, align 16, !dbg !475
  %56 = fdiv x86_fp80 %55, 0xK40008666666666666800, !dbg !476
  %57 = call zeroext i1 @closeTo(x86_fp80 noundef %53, x86_fp80 noundef %54, x86_fp80 noundef %56), !dbg !477
  br i1 %57, label %58, label %65, !dbg !478

58:                                               ; preds = %34
  %59 = load x86_fp80, ptr %24, align 16, !dbg !479
  %60 = load x86_fp80, ptr %20, align 16, !dbg !480
  %61 = load x86_fp80, ptr %14, align 16, !dbg !481
  %62 = call signext i8 @yCompress(x86_fp80 noundef %59, x86_fp80 noundef %60, x86_fp80 noundef %61), !dbg !482
  %63 = load ptr, ptr %23, align 8, !dbg !483
  %64 = getelementptr inbounds %struct.CalcLangPixel, ptr %63, i32 0, i32 2, !dbg !484
  store i8 %62, ptr %64, align 16, !dbg !485
  br label %99, !dbg !483

65:                                               ; preds = %34
  %66 = load x86_fp80, ptr %24, align 16, !dbg !486
  %67 = fcmp olt x86_fp80 %66, 0xK00000000000000000000, !dbg !488
  br i1 %67, label %68, label %77, !dbg !489

68:                                               ; preds = %65
  %69 = load x86_fp80, ptr %20, align 16, !dbg !490
  %70 = load x86_fp80, ptr %14, align 16, !dbg !491
  %71 = fdiv x86_fp80 %70, 0xK40008000000000000000, !dbg !492
  %72 = fcmp olt x86_fp80 %69, %71, !dbg !493
  br i1 %72, label %73, label %98, !dbg !494

73:                                               ; preds = %68
  %74 = load x86_fp80, ptr %20, align 16, !dbg !495
  %75 = load x86_fp80, ptr %24, align 16, !dbg !496
  %76 = fcmp ogt x86_fp80 %74, %75, !dbg !497
  br i1 %76, label %87, label %98, !dbg !498

77:                                               ; preds = %65
  %78 = load x86_fp80, ptr %20, align 16, !dbg !499
  %79 = load x86_fp80, ptr %14, align 16, !dbg !500
  %80 = fneg x86_fp80 %79, !dbg !501
  %81 = fdiv x86_fp80 %80, 0xK40008000000000000000, !dbg !502
  %82 = fcmp ogt x86_fp80 %78, %81, !dbg !503
  br i1 %82, label %83, label %98, !dbg !504

83:                                               ; preds = %77
  %84 = load x86_fp80, ptr %20, align 16, !dbg !505
  %85 = load x86_fp80, ptr %24, align 16, !dbg !506
  %86 = fcmp olt x86_fp80 %84, %85, !dbg !507
  br i1 %86, label %87, label %98, !dbg !489

87:                                               ; preds = %83, %73
  %88 = load x86_fp80, ptr %19, align 16, !dbg !508
  %89 = load x86_fp80, ptr %15, align 16, !dbg !509
  %90 = fcmp ogt x86_fp80 %88, %89, !dbg !510
  br i1 %90, label %91, label %98, !dbg !511

91:                                               ; preds = %87
  %92 = load x86_fp80, ptr %19, align 16, !dbg !512
  %93 = load x86_fp80, ptr %16, align 16, !dbg !513
  %94 = fcmp olt x86_fp80 %92, %93, !dbg !514
  br i1 %94, label %95, label %98, !dbg !515

95:                                               ; preds = %91
  %96 = load ptr, ptr %23, align 8, !dbg !516
  %97 = getelementptr inbounds %struct.CalcLangPixel, ptr %96, i32 0, i32 2, !dbg !517
  store i8 35, ptr %97, align 16, !dbg !518
  br label %98, !dbg !516

98:                                               ; preds = %95, %91, %87, %83, %77, %73, %68
  br label %99

99:                                               ; preds = %98, %58
  br label %100, !dbg !519

100:                                              ; preds = %99
  %101 = load i32, ptr %22, align 4, !dbg !520
  %102 = add nsw i32 %101, 1, !dbg !520
  store i32 %102, ptr %22, align 4, !dbg !520
  br label %30, !dbg !521, !llvm.loop !522

103:                                              ; preds = %30
  br label %104, !dbg !524

104:                                              ; preds = %103
  %105 = load i32, ptr %21, align 4, !dbg !525
  %106 = add nsw i32 %105, 1, !dbg !525
  store i32 %106, ptr %21, align 4, !dbg !525
  br label %25, !dbg !526, !llvm.loop !527

107:                                              ; preds = %25
  ret void, !dbg !529
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !530 {
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
  call void @llvm.dbg.declare(metadata ptr %8, metadata !533, metadata !DIExpression()), !dbg !534
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !535, metadata !DIExpression()), !dbg !536
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !537, metadata !DIExpression()), !dbg !538
  store x86_fp80 %3, ptr %11, align 16
  call void @llvm.dbg.declare(metadata ptr %11, metadata !539, metadata !DIExpression()), !dbg !540
  store x86_fp80 %4, ptr %12, align 16
  call void @llvm.dbg.declare(metadata ptr %12, metadata !541, metadata !DIExpression()), !dbg !542
  store i32 %5, ptr %13, align 4
  call void @llvm.dbg.declare(metadata ptr %13, metadata !543, metadata !DIExpression()), !dbg !544
  store i32 %6, ptr %14, align 4
  call void @llvm.dbg.declare(metadata ptr %14, metadata !545, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.declare(metadata ptr %15, metadata !547, metadata !DIExpression()), !dbg !548
  call void @llvm.dbg.declare(metadata ptr %16, metadata !549, metadata !DIExpression()), !dbg !550
  call void @llvm.dbg.declare(metadata ptr %17, metadata !551, metadata !DIExpression()), !dbg !553
  store i32 0, ptr %17, align 4, !dbg !553
  br label %21, !dbg !554

21:                                               ; preds = %66, %7
  %22 = load i32, ptr %17, align 4, !dbg !555
  %23 = load i32, ptr %13, align 4, !dbg !557
  %24 = icmp slt i32 %22, %23, !dbg !558
  br i1 %24, label %25, label %69, !dbg !559

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %18, metadata !560, metadata !DIExpression()), !dbg !563
  store i32 0, ptr %18, align 4, !dbg !563
  br label %26, !dbg !564

26:                                               ; preds = %62, %25
  %27 = load i32, ptr %18, align 4, !dbg !565
  %28 = load i32, ptr %14, align 4, !dbg !567
  %29 = icmp slt i32 %27, %28, !dbg !568
  br i1 %29, label %30, label %65, !dbg !569

30:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %19, metadata !570, metadata !DIExpression()), !dbg !572
  %31 = load ptr, ptr %8, align 8, !dbg !573
  %32 = load i32, ptr %17, align 4, !dbg !574
  %33 = sext i32 %32 to i64, !dbg !573
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !573
  %35 = load ptr, ptr %34, align 8, !dbg !573
  %36 = load i32, ptr %18, align 4, !dbg !575
  %37 = sext i32 %36 to i64, !dbg !573
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %35, i64 %37, !dbg !573
  store ptr %38, ptr %19, align 8, !dbg !572
  %39 = load ptr, ptr %19, align 8, !dbg !576
  %40 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i32 0, i32 0, !dbg !577
  %41 = load x86_fp80, ptr %40, align 16, !dbg !577
  store x86_fp80 %41, ptr %15, align 16, !dbg !578
  %42 = load ptr, ptr %19, align 8, !dbg !579
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %42, i32 0, i32 1, !dbg !580
  %44 = load x86_fp80, ptr %43, align 16, !dbg !580
  store x86_fp80 %44, ptr %16, align 16, !dbg !581
  call void @llvm.dbg.declare(metadata ptr %20, metadata !582, metadata !DIExpression()), !dbg !583
  %45 = load ptr, ptr %10, align 8, !dbg !584
  %46 = load ptr, ptr %9, align 8, !dbg !585
  %47 = load x86_fp80, ptr %15, align 16, !dbg !586
  %48 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %45, ptr noundef %46, x86_fp80 noundef %47), !dbg !587
  store x86_fp80 %48, ptr %20, align 16, !dbg !583
  %49 = load x86_fp80, ptr %20, align 16, !dbg !588
  %50 = load x86_fp80, ptr %16, align 16, !dbg !590
  %51 = load x86_fp80, ptr %12, align 16, !dbg !591
  %52 = fdiv x86_fp80 %51, 0xK40008666666666666800, !dbg !592
  %53 = call zeroext i1 @closeTo(x86_fp80 noundef %49, x86_fp80 noundef %50, x86_fp80 noundef %52), !dbg !593
  br i1 %53, label %54, label %61, !dbg !594

54:                                               ; preds = %30
  %55 = load x86_fp80, ptr %20, align 16, !dbg !595
  %56 = load x86_fp80, ptr %16, align 16, !dbg !596
  %57 = load x86_fp80, ptr %12, align 16, !dbg !597
  %58 = call signext i8 @yCompress(x86_fp80 noundef %55, x86_fp80 noundef %56, x86_fp80 noundef %57), !dbg !598
  %59 = load ptr, ptr %19, align 8, !dbg !599
  %60 = getelementptr inbounds %struct.CalcLangPixel, ptr %59, i32 0, i32 2, !dbg !600
  store i8 %58, ptr %60, align 16, !dbg !601
  br label %61, !dbg !599

61:                                               ; preds = %54, %30
  br label %62, !dbg !602

62:                                               ; preds = %61
  %63 = load i32, ptr %18, align 4, !dbg !603
  %64 = add nsw i32 %63, 1, !dbg !603
  store i32 %64, ptr %18, align 4, !dbg !603
  br label %26, !dbg !604, !llvm.loop !605

65:                                               ; preds = %26
  br label %66, !dbg !607

66:                                               ; preds = %65
  %67 = load i32, ptr %17, align 4, !dbg !608
  %68 = add nsw i32 %67, 1, !dbg !608
  store i32 %68, ptr %17, align 4, !dbg !608
  br label %21, !dbg !609, !llvm.loop !610

69:                                               ; preds = %21
  ret void, !dbg !612
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !613 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !616, metadata !DIExpression()), !dbg !617
  store x86_fp80 %1, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !618, metadata !DIExpression()), !dbg !619
  store x86_fp80 %2, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 %4, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !624, metadata !DIExpression()), !dbg !625
  call void @llvm.dbg.declare(metadata ptr %11, metadata !626, metadata !DIExpression()), !dbg !627
  call void @llvm.dbg.declare(metadata ptr %12, metadata !628, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.declare(metadata ptr %13, metadata !630, metadata !DIExpression()), !dbg !632
  store i32 0, ptr %13, align 4, !dbg !632
  br label %19, !dbg !633

19:                                               ; preds = %88, %5
  %20 = load i32, ptr %13, align 4, !dbg !634
  %21 = load i32, ptr %9, align 4, !dbg !636
  %22 = icmp slt i32 %20, %21, !dbg !637
  br i1 %22, label %23, label %91, !dbg !638

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %14, metadata !639, metadata !DIExpression()), !dbg !642
  store i32 0, ptr %14, align 4, !dbg !642
  br label %24, !dbg !643

24:                                               ; preds = %84, %23
  %25 = load i32, ptr %14, align 4, !dbg !644
  %26 = load i32, ptr %10, align 4, !dbg !646
  %27 = icmp slt i32 %25, %26, !dbg !647
  br i1 %27, label %28, label %87, !dbg !648

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %15, metadata !649, metadata !DIExpression()), !dbg !651
  %29 = load ptr, ptr %6, align 8, !dbg !652
  %30 = load i32, ptr %13, align 4, !dbg !653
  %31 = sext i32 %30 to i64, !dbg !652
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31, !dbg !652
  %33 = load ptr, ptr %32, align 8, !dbg !652
  %34 = load i32, ptr %14, align 4, !dbg !654
  %35 = sext i32 %34 to i64, !dbg !652
  %36 = getelementptr inbounds %struct.CalcLangPixel, ptr %33, i64 %35, !dbg !652
  store ptr %36, ptr %15, align 8, !dbg !651
  %37 = load ptr, ptr %15, align 8, !dbg !655
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 0, !dbg !656
  %39 = load x86_fp80, ptr %38, align 16, !dbg !656
  store x86_fp80 %39, ptr %11, align 16, !dbg !657
  %40 = load ptr, ptr %15, align 8, !dbg !658
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i32 0, i32 1, !dbg !659
  %42 = load x86_fp80, ptr %41, align 16, !dbg !659
  store x86_fp80 %42, ptr %12, align 16, !dbg !660
  call void @llvm.dbg.declare(metadata ptr %16, metadata !661, metadata !DIExpression()), !dbg !662
  %43 = load x86_fp80, ptr %11, align 16, !dbg !663
  %44 = load x86_fp80, ptr %7, align 16, !dbg !664
  %45 = fdiv x86_fp80 %44, 0xK40008666666666666800, !dbg !665
  %46 = call zeroext i1 @closeTo(x86_fp80 noundef %43, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %45), !dbg !666
  %47 = zext i1 %46 to i8, !dbg !662
  store i8 %47, ptr %16, align 1, !dbg !662
  call void @llvm.dbg.declare(metadata ptr %17, metadata !667, metadata !DIExpression()), !dbg !668
  %48 = load x86_fp80, ptr %12, align 16, !dbg !669
  %49 = load x86_fp80, ptr %8, align 16, !dbg !670
  %50 = fdiv x86_fp80 %49, 0xK40008666666666666800, !dbg !671
  %51 = call zeroext i1 @closeTo(x86_fp80 noundef %48, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %50), !dbg !672
  %52 = zext i1 %51 to i8, !dbg !668
  store i8 %52, ptr %17, align 1, !dbg !668
  call void @llvm.dbg.declare(metadata ptr %18, metadata !673, metadata !DIExpression()), !dbg !674
  %53 = load i8, ptr %16, align 1, !dbg !675
  %54 = trunc i8 %53 to i1, !dbg !675
  br i1 %54, label %55, label %58, !dbg !676

55:                                               ; preds = %28
  %56 = load i8, ptr %17, align 1, !dbg !677
  %57 = trunc i8 %56 to i1, !dbg !677
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi i1 [ false, %28 ], [ %57, %55 ], !dbg !678
  %60 = zext i1 %59 to i8, !dbg !674
  store i8 %60, ptr %18, align 1, !dbg !674
  %61 = load i8, ptr %18, align 1, !dbg !679
  %62 = trunc i8 %61 to i1, !dbg !679
  br i1 %62, label %63, label %66, !dbg !681

63:                                               ; preds = %58
  %64 = load ptr, ptr %15, align 8, !dbg !682
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 2, !dbg !683
  store i8 43, ptr %65, align 16, !dbg !684
  br label %83, !dbg !682

66:                                               ; preds = %58
  %67 = load i8, ptr %16, align 1, !dbg !685
  %68 = trunc i8 %67 to i1, !dbg !685
  br i1 %68, label %69, label %72, !dbg !687

69:                                               ; preds = %66
  %70 = load ptr, ptr %15, align 8, !dbg !688
  %71 = getelementptr inbounds %struct.CalcLangPixel, ptr %70, i32 0, i32 2, !dbg !689
  store i8 124, ptr %71, align 16, !dbg !690
  br label %82, !dbg !688

72:                                               ; preds = %66
  %73 = load i8, ptr %17, align 1, !dbg !691
  %74 = trunc i8 %73 to i1, !dbg !691
  br i1 %74, label %75, label %78, !dbg !693

75:                                               ; preds = %72
  %76 = load ptr, ptr %15, align 8, !dbg !694
  %77 = getelementptr inbounds %struct.CalcLangPixel, ptr %76, i32 0, i32 2, !dbg !695
  store i8 45, ptr %77, align 16, !dbg !696
  br label %81, !dbg !694

78:                                               ; preds = %72
  %79 = load ptr, ptr %15, align 8, !dbg !697
  %80 = getelementptr inbounds %struct.CalcLangPixel, ptr %79, i32 0, i32 2, !dbg !698
  store i8 32, ptr %80, align 16, !dbg !699
  br label %81

81:                                               ; preds = %78, %75
  br label %82

82:                                               ; preds = %81, %69
  br label %83

83:                                               ; preds = %82, %63
  br label %84, !dbg !700

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4, !dbg !701
  %86 = add nsw i32 %85, 1, !dbg !701
  store i32 %86, ptr %14, align 4, !dbg !701
  br label %24, !dbg !702, !llvm.loop !703

87:                                               ; preds = %24
  br label %88, !dbg !705

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4, !dbg !706
  %90 = add nsw i32 %89, 1, !dbg !706
  store i32 %90, ptr %13, align 4, !dbg !706
  br label %19, !dbg !707, !llvm.loop !708

91:                                               ; preds = %19
  ret void, !dbg !710
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, i32 noundef %1) #0 !dbg !711 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !714, metadata !DIExpression()), !dbg !715
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !716, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.declare(metadata ptr %5, metadata !718, metadata !DIExpression()), !dbg !720
  store i32 0, ptr %5, align 4, !dbg !720
  br label %6, !dbg !721

6:                                                ; preds = %16, %2
  %7 = load i32, ptr %5, align 4, !dbg !722
  %8 = load i32, ptr %4, align 4, !dbg !724
  %9 = icmp slt i32 %7, %8, !dbg !725
  br i1 %9, label %10, label %19, !dbg !726

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8, !dbg !727
  %12 = load i32, ptr %5, align 4, !dbg !729
  %13 = sext i32 %12 to i64, !dbg !727
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13, !dbg !727
  %15 = load ptr, ptr %14, align 8, !dbg !727
  call void @free(ptr noundef %15) #8, !dbg !730
  br label %16, !dbg !731

16:                                               ; preds = %10
  %17 = load i32, ptr %5, align 4, !dbg !732
  %18 = add nsw i32 %17, 1, !dbg !732
  store i32 %18, ptr %5, align 4, !dbg !732
  br label %6, !dbg !733, !llvm.loop !734

19:                                               ; preds = %6
  %20 = load ptr, ptr %3, align 8, !dbg !736
  call void @free(ptr noundef %20) #8, !dbg !737
  ret void, !dbg !738
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !739 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !742, metadata !DIExpression()), !dbg !743
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !744, metadata !DIExpression()), !dbg !745
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !746, metadata !DIExpression()), !dbg !747
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !748, metadata !DIExpression()), !dbg !749
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !750, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.declare(metadata ptr %12, metadata !752, metadata !DIExpression()), !dbg !761
  %14 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #8, !dbg !762
  %15 = icmp eq i32 %14, -1, !dbg !764
  br i1 %15, label %16, label %17, !dbg !765

16:                                               ; preds = %5
  call void @perror(ptr noundef @.str.2) #9, !dbg !766
  store i1 false, ptr %6, align 1, !dbg !768
  br label %66, !dbg !768

17:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !769, metadata !DIExpression()), !dbg !770
  %18 = load i32, ptr %10, align 4, !dbg !771
  %19 = sitofp i32 %18 to x86_fp80, !dbg !771
  %20 = load i32, ptr %10, align 4, !dbg !772
  %21 = sitofp i32 %20 to x86_fp80, !dbg !772
  %22 = load i32, ptr %8, align 4, !dbg !773
  %23 = sitofp i32 %22 to x86_fp80, !dbg !773
  %24 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !774
  %25 = load i16, ptr %24, align 2, !dbg !774
  %26 = zext i16 %25 to i32, !dbg !775
  %27 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !776
  %28 = load i16, ptr %27, align 2, !dbg !776
  %29 = zext i16 %28 to i32, !dbg !777
  %30 = call ptr @quantifyPlane(x86_fp80 noundef %19, x86_fp80 noundef %21, x86_fp80 noundef %23, x86_fp80 noundef 0xK4002E000000000000000, i32 noundef %26, i32 noundef %29), !dbg !778
  store ptr %30, ptr %13, align 8, !dbg !770
  %31 = load ptr, ptr %13, align 8, !dbg !779
  %32 = load i32, ptr %10, align 4, !dbg !780
  %33 = sitofp i32 %32 to x86_fp80, !dbg !780
  %34 = load i32, ptr %10, align 4, !dbg !781
  %35 = sitofp i32 %34 to x86_fp80, !dbg !781
  %36 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !782
  %37 = load i16, ptr %36, align 2, !dbg !782
  %38 = zext i16 %37 to i32, !dbg !783
  %39 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !784
  %40 = load i16, ptr %39, align 2, !dbg !784
  %41 = zext i16 %40 to i32, !dbg !785
  call void @drawPlane(ptr noundef %31, x86_fp80 noundef %33, x86_fp80 noundef %35, i32 noundef %38, i32 noundef %41), !dbg !786
  %42 = load ptr, ptr %13, align 8, !dbg !787
  %43 = load ptr, ptr %11, align 8, !dbg !788
  %44 = load ptr, ptr %7, align 8, !dbg !789
  %45 = load i32, ptr %10, align 4, !dbg !790
  %46 = sitofp i32 %45 to x86_fp80, !dbg !790
  %47 = load i32, ptr %10, align 4, !dbg !791
  %48 = sitofp i32 %47 to x86_fp80, !dbg !791
  %49 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !792
  %50 = load i16, ptr %49, align 2, !dbg !792
  %51 = zext i16 %50 to i32, !dbg !793
  %52 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !794
  %53 = load i16, ptr %52, align 2, !dbg !794
  %54 = zext i16 %53 to i32, !dbg !795
  call void @drawLine(ptr noundef %42, ptr noundef %43, ptr noundef %44, x86_fp80 noundef %46, x86_fp80 noundef %48, i32 noundef %51, i32 noundef %54), !dbg !796
  %55 = load ptr, ptr %13, align 8, !dbg !797
  %56 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !798
  %57 = load i16, ptr %56, align 2, !dbg !798
  %58 = zext i16 %57 to i32, !dbg !799
  %59 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !800
  %60 = load i16, ptr %59, align 2, !dbg !800
  %61 = zext i16 %60 to i32, !dbg !801
  call void @printPlane(ptr noundef %55, i32 noundef %58, i32 noundef %61), !dbg !802
  %62 = load ptr, ptr %13, align 8, !dbg !803
  %63 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !804
  %64 = load i16, ptr %63, align 2, !dbg !804
  %65 = zext i16 %64 to i32, !dbg !805
  call void @clearDisplay(ptr noundef %62, i32 noundef %65), !dbg !806
  store i1 true, ptr %6, align 1, !dbg !807
  br label %66, !dbg !807

66:                                               ; preds = %17, %16
  %67 = load i1, ptr %6, align 1, !dbg !808
  ret i1 %67, !dbg !808
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
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !7, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "4d3c45ab052eff601b7a8f89344d9744")
!4 = !{!5, !15, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangPixel", file: !7, line: 14, baseType: !8)
!7 = !DIFile(filename: "include/c/CalcLangCGraph.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "3b22e47eaae0bfb94269542c48e40927")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 11, size: 384, elements: !9)
!9 = !{!10, !12, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !8, file: !7, line: 12, baseType: !11, size: 128)
!11 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !8, file: !7, line: 12, baseType: !11, size: 128, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "display", scope: !8, file: !7, line: 13, baseType: !14, size: 8, offset: 256)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!0, !17, !22, !27}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !3, line: 38, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 72, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 9)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !3, line: 81, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !3, line: 157, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 104, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 13)
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 8, !"PIC Level", i32 2}
!36 = !{i32 7, !"PIE Level", i32 2}
!37 = !{i32 7, !"uwtable", i32 2}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!40 = distinct !DISubprogram(name: "closeTo", scope: !3, file: !3, line: 10, type: !41, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !11, !11, !11}
!43 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!44 = !{}
!45 = !DILocalVariable(name: "x", arg: 1, scope: !40, file: !3, line: 10, type: !11)
!46 = !DILocation(line: 10, column: 26, scope: !40)
!47 = !DILocalVariable(name: "y", arg: 2, scope: !40, file: !3, line: 10, type: !11)
!48 = !DILocation(line: 10, column: 41, scope: !40)
!49 = !DILocalVariable(name: "deviation", arg: 3, scope: !40, file: !3, line: 10, type: !11)
!50 = !DILocation(line: 10, column: 56, scope: !40)
!51 = !DILocation(line: 11, column: 16, scope: !40)
!52 = !DILocation(line: 11, column: 18, scope: !40)
!53 = !DILocation(line: 11, column: 17, scope: !40)
!54 = !DILocation(line: 11, column: 10, scope: !40)
!55 = !DILocation(line: 11, column: 23, scope: !40)
!56 = !DILocation(line: 11, column: 21, scope: !40)
!57 = !DILocation(line: 11, column: 3, scope: !40)
!58 = distinct !DISubprogram(name: "initializeDisplay", scope: !3, file: !3, line: 14, type: !59, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !15, !15}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!62 = !DILocalVariable(name: "windowWidth", arg: 1, scope: !58, file: !3, line: 14, type: !15)
!63 = !DILocation(line: 14, column: 39, scope: !58)
!64 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !58, file: !3, line: 14, type: !15)
!65 = !DILocation(line: 14, column: 56, scope: !58)
!66 = !DILocalVariable(name: "display", scope: !58, file: !3, line: 15, type: !61)
!67 = !DILocation(line: 15, column: 19, scope: !58)
!68 = !DILocation(line: 15, column: 61, scope: !58)
!69 = !DILocation(line: 15, column: 59, scope: !58)
!70 = !DILocation(line: 15, column: 29, scope: !58)
!71 = !DILocation(line: 16, column: 10, scope: !58)
!72 = !DILocation(line: 16, column: 22, scope: !58)
!73 = !DILocation(line: 16, column: 3, scope: !58)
!74 = !DILocalVariable(name: "i", scope: !75, file: !3, line: 17, type: !15)
!75 = distinct !DILexicalBlock(scope: !58, file: !3, line: 17, column: 3)
!76 = !DILocation(line: 17, column: 11, scope: !75)
!77 = !DILocation(line: 17, column: 7, scope: !75)
!78 = !DILocation(line: 17, column: 18, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 17, column: 3)
!80 = !DILocation(line: 17, column: 22, scope: !79)
!81 = !DILocation(line: 17, column: 20, scope: !79)
!82 = !DILocation(line: 17, column: 3, scope: !75)
!83 = !DILocation(line: 18, column: 65, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !3, line: 17, column: 40)
!85 = !DILocation(line: 18, column: 63, scope: !84)
!86 = !DILocation(line: 18, column: 34, scope: !84)
!87 = !DILocation(line: 18, column: 5, scope: !84)
!88 = !DILocation(line: 18, column: 13, scope: !84)
!89 = !DILocation(line: 18, column: 16, scope: !84)
!90 = !DILocation(line: 19, column: 12, scope: !84)
!91 = !DILocation(line: 19, column: 24, scope: !84)
!92 = !DILocation(line: 19, column: 5, scope: !84)
!93 = !DILocation(line: 20, column: 3, scope: !84)
!94 = !DILocation(line: 17, column: 37, scope: !79)
!95 = !DILocation(line: 17, column: 3, scope: !79)
!96 = distinct !{!96, !82, !97, !98}
!97 = !DILocation(line: 20, column: 3, scope: !75)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 21, column: 10, scope: !58)
!100 = !DILocation(line: 21, column: 3, scope: !58)
!101 = distinct !DISubprogram(name: "quantifyPlane", scope: !3, file: !3, line: 24, type: !102, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!102 = !DISubroutineType(types: !103)
!103 = !{!61, !11, !11, !11, !11, !15, !15}
!104 = !DILocalVariable(name: "xSteps", arg: 1, scope: !101, file: !3, line: 24, type: !11)
!105 = !DILocation(line: 24, column: 43, scope: !101)
!106 = !DILocalVariable(name: "ySteps", arg: 2, scope: !101, file: !3, line: 24, type: !11)
!107 = !DILocation(line: 24, column: 63, scope: !101)
!108 = !DILocalVariable(name: "xMin", arg: 3, scope: !101, file: !3, line: 24, type: !11)
!109 = !DILocation(line: 24, column: 83, scope: !101)
!110 = !DILocalVariable(name: "yMax", arg: 4, scope: !101, file: !3, line: 24, type: !11)
!111 = !DILocation(line: 24, column: 101, scope: !101)
!112 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !101, file: !3, line: 24, type: !15)
!113 = !DILocation(line: 24, column: 111, scope: !101)
!114 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !101, file: !3, line: 24, type: !15)
!115 = !DILocation(line: 24, column: 128, scope: !101)
!116 = !DILocalVariable(name: "display", scope: !101, file: !3, line: 25, type: !61)
!117 = !DILocation(line: 25, column: 19, scope: !101)
!118 = !DILocation(line: 25, column: 47, scope: !101)
!119 = !DILocation(line: 25, column: 60, scope: !101)
!120 = !DILocation(line: 25, column: 29, scope: !101)
!121 = !DILocalVariable(name: "y", scope: !122, file: !3, line: 27, type: !15)
!122 = distinct !DILexicalBlock(scope: !101, file: !3, line: 27, column: 3)
!123 = !DILocation(line: 27, column: 11, scope: !122)
!124 = !DILocation(line: 27, column: 7, scope: !122)
!125 = !DILocation(line: 27, column: 18, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !3, line: 27, column: 3)
!127 = !DILocation(line: 27, column: 22, scope: !126)
!128 = !DILocation(line: 27, column: 20, scope: !126)
!129 = !DILocation(line: 27, column: 3, scope: !122)
!130 = !DILocalVariable(name: "x", scope: !131, file: !3, line: 28, type: !15)
!131 = distinct !DILexicalBlock(scope: !132, file: !3, line: 28, column: 5)
!132 = distinct !DILexicalBlock(scope: !126, file: !3, line: 27, column: 40)
!133 = !DILocation(line: 28, column: 13, scope: !131)
!134 = !DILocation(line: 28, column: 9, scope: !131)
!135 = !DILocation(line: 28, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !3, line: 28, column: 5)
!137 = !DILocation(line: 28, column: 24, scope: !136)
!138 = !DILocation(line: 28, column: 22, scope: !136)
!139 = !DILocation(line: 28, column: 5, scope: !131)
!140 = !DILocation(line: 29, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !3, line: 28, column: 41)
!142 = !DILocation(line: 29, column: 36, scope: !141)
!143 = !DILocation(line: 29, column: 45, scope: !141)
!144 = !DILocation(line: 29, column: 33, scope: !141)
!145 = !DILocation(line: 29, column: 9, scope: !141)
!146 = !DILocation(line: 29, column: 17, scope: !141)
!147 = !DILocation(line: 29, column: 20, scope: !141)
!148 = !DILocation(line: 29, column: 23, scope: !141)
!149 = !DILocation(line: 29, column: 25, scope: !141)
!150 = !DILocation(line: 30, column: 28, scope: !141)
!151 = !DILocation(line: 30, column: 36, scope: !141)
!152 = !DILocation(line: 30, column: 45, scope: !141)
!153 = !DILocation(line: 30, column: 33, scope: !141)
!154 = !DILocation(line: 30, column: 9, scope: !141)
!155 = !DILocation(line: 30, column: 17, scope: !141)
!156 = !DILocation(line: 30, column: 20, scope: !141)
!157 = !DILocation(line: 30, column: 23, scope: !141)
!158 = !DILocation(line: 30, column: 25, scope: !141)
!159 = !DILocation(line: 31, column: 5, scope: !141)
!160 = !DILocation(line: 28, column: 38, scope: !136)
!161 = !DILocation(line: 28, column: 5, scope: !136)
!162 = distinct !{!162, !139, !163, !98}
!163 = !DILocation(line: 31, column: 5, scope: !131)
!164 = !DILocation(line: 32, column: 3, scope: !132)
!165 = !DILocation(line: 27, column: 37, scope: !126)
!166 = !DILocation(line: 27, column: 3, scope: !126)
!167 = distinct !{!167, !129, !168, !98}
!168 = !DILocation(line: 32, column: 3, scope: !122)
!169 = !DILocation(line: 34, column: 10, scope: !101)
!170 = !DILocation(line: 34, column: 3, scope: !101)
!171 = distinct !DISubprogram(name: "yCompress", scope: !3, file: !3, line: 37, type: !172, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!172 = !DISubroutineType(types: !173)
!173 = !{!14, !11, !11, !11}
!174 = !DILocalVariable(name: "num", arg: 1, scope: !171, file: !3, line: 37, type: !11)
!175 = !DILocation(line: 37, column: 28, scope: !171)
!176 = !DILocalVariable(name: "pixel", arg: 2, scope: !171, file: !3, line: 37, type: !11)
!177 = !DILocation(line: 37, column: 45, scope: !171)
!178 = !DILocalVariable(name: "range", arg: 3, scope: !171, file: !3, line: 37, type: !11)
!179 = !DILocation(line: 37, column: 64, scope: !171)
!180 = !DILocalVariable(name: "table", scope: !171, file: !3, line: 38, type: !181)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!182 = !DILocation(line: 38, column: 9, scope: !171)
!183 = !DILocalVariable(name: "steps", scope: !171, file: !3, line: 41, type: !11)
!184 = !DILocation(line: 41, column: 15, scope: !171)
!185 = !DILocation(line: 41, column: 23, scope: !171)
!186 = !DILocation(line: 41, column: 28, scope: !171)
!187 = !DILocalVariable(name: "goal", scope: !171, file: !3, line: 43, type: !11)
!188 = !DILocation(line: 43, column: 15, scope: !171)
!189 = !DILocation(line: 43, column: 22, scope: !171)
!190 = !DILocation(line: 43, column: 29, scope: !171)
!191 = !DILocation(line: 43, column: 38, scope: !171)
!192 = !DILocation(line: 43, column: 43, scope: !171)
!193 = !DILocation(line: 43, column: 35, scope: !171)
!194 = !DILocation(line: 43, column: 26, scope: !171)
!195 = !DILocalVariable(name: "counter", scope: !171, file: !3, line: 44, type: !15)
!196 = !DILocation(line: 44, column: 7, scope: !171)
!197 = !DILocalVariable(name: "step", scope: !171, file: !3, line: 45, type: !11)
!198 = !DILocation(line: 45, column: 15, scope: !171)
!199 = !DILocation(line: 46, column: 3, scope: !171)
!200 = !DILocation(line: 46, column: 9, scope: !171)
!201 = !DILocation(line: 46, column: 16, scope: !171)
!202 = !DILocation(line: 46, column: 14, scope: !171)
!203 = !DILocation(line: 47, column: 15, scope: !204)
!204 = distinct !DILexicalBlock(scope: !171, file: !3, line: 46, column: 22)
!205 = !DILocation(line: 47, column: 12, scope: !204)
!206 = !DILocation(line: 48, column: 14, scope: !204)
!207 = distinct !{!207, !199, !208, !98}
!208 = !DILocation(line: 49, column: 3, scope: !171)
!209 = !DILocation(line: 50, column: 10, scope: !171)
!210 = !DILocation(line: 50, column: 16, scope: !171)
!211 = !DILocation(line: 50, column: 24, scope: !171)
!212 = !DILocation(line: 50, column: 3, scope: !171)
!213 = distinct !DISubprogram(name: "printPlane", scope: !3, file: !3, line: 53, type: !214, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!214 = !DISubroutineType(types: !215)
!215 = !{null, !61, !15, !15}
!216 = !DILocalVariable(name: "display", arg: 1, scope: !213, file: !3, line: 53, type: !61)
!217 = !DILocation(line: 53, column: 33, scope: !213)
!218 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !213, file: !3, line: 53, type: !15)
!219 = !DILocation(line: 53, column: 46, scope: !213)
!220 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !213, file: !3, line: 53, type: !15)
!221 = !DILocation(line: 53, column: 64, scope: !213)
!222 = !DILocalVariable(name: "output", scope: !213, file: !3, line: 54, type: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!224 = !DILocation(line: 54, column: 10, scope: !213)
!225 = !DILocation(line: 54, column: 42, scope: !213)
!226 = !DILocation(line: 54, column: 40, scope: !213)
!227 = !DILocation(line: 54, column: 55, scope: !213)
!228 = !DILocation(line: 54, column: 19, scope: !213)
!229 = !DILocalVariable(name: "i", scope: !230, file: !3, line: 55, type: !15)
!230 = distinct !DILexicalBlock(scope: !213, file: !3, line: 55, column: 3)
!231 = !DILocation(line: 55, column: 11, scope: !230)
!232 = !DILocation(line: 55, column: 7, scope: !230)
!233 = !DILocation(line: 55, column: 18, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !3, line: 55, column: 3)
!235 = !DILocation(line: 55, column: 22, scope: !234)
!236 = !DILocation(line: 55, column: 20, scope: !234)
!237 = !DILocation(line: 55, column: 3, scope: !230)
!238 = !DILocation(line: 56, column: 39, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !3, line: 55, column: 40)
!240 = !DILocation(line: 56, column: 37, scope: !239)
!241 = !DILocation(line: 56, column: 51, scope: !239)
!242 = !DILocation(line: 56, column: 17, scope: !239)
!243 = !DILocation(line: 56, column: 5, scope: !239)
!244 = !DILocation(line: 56, column: 12, scope: !239)
!245 = !DILocation(line: 56, column: 15, scope: !239)
!246 = !DILocation(line: 57, column: 3, scope: !239)
!247 = !DILocation(line: 55, column: 37, scope: !234)
!248 = !DILocation(line: 55, column: 3, scope: !234)
!249 = distinct !{!249, !237, !250, !98}
!250 = !DILocation(line: 57, column: 3, scope: !230)
!251 = !DILocalVariable(name: "y", scope: !252, file: !3, line: 59, type: !15)
!252 = distinct !DILexicalBlock(scope: !213, file: !3, line: 59, column: 3)
!253 = !DILocation(line: 59, column: 11, scope: !252)
!254 = !DILocation(line: 59, column: 7, scope: !252)
!255 = !DILocation(line: 59, column: 18, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !3, line: 59, column: 3)
!257 = !DILocation(line: 59, column: 22, scope: !256)
!258 = !DILocation(line: 59, column: 20, scope: !256)
!259 = !DILocation(line: 59, column: 3, scope: !252)
!260 = !DILocalVariable(name: "x", scope: !261, file: !3, line: 60, type: !15)
!261 = distinct !DILexicalBlock(scope: !262, file: !3, line: 60, column: 5)
!262 = distinct !DILexicalBlock(scope: !256, file: !3, line: 59, column: 41)
!263 = !DILocation(line: 60, column: 13, scope: !261)
!264 = !DILocation(line: 60, column: 9, scope: !261)
!265 = !DILocation(line: 60, column: 20, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !3, line: 60, column: 5)
!267 = !DILocation(line: 60, column: 24, scope: !266)
!268 = !DILocation(line: 60, column: 22, scope: !266)
!269 = !DILocation(line: 60, column: 5, scope: !261)
!270 = !DILocation(line: 61, column: 24, scope: !266)
!271 = !DILocation(line: 61, column: 32, scope: !266)
!272 = !DILocation(line: 61, column: 35, scope: !266)
!273 = !DILocation(line: 61, column: 38, scope: !266)
!274 = !DILocation(line: 61, column: 22, scope: !266)
!275 = !DILocation(line: 61, column: 7, scope: !266)
!276 = !DILocation(line: 61, column: 14, scope: !266)
!277 = !DILocation(line: 61, column: 17, scope: !266)
!278 = !DILocation(line: 61, column: 20, scope: !266)
!279 = !DILocation(line: 60, column: 38, scope: !266)
!280 = !DILocation(line: 60, column: 5, scope: !266)
!281 = distinct !{!281, !269, !282, !98}
!282 = !DILocation(line: 61, column: 38, scope: !261)
!283 = !DILocation(line: 62, column: 5, scope: !262)
!284 = !DILocation(line: 62, column: 12, scope: !262)
!285 = !DILocation(line: 62, column: 15, scope: !262)
!286 = !DILocation(line: 62, column: 28, scope: !262)
!287 = !DILocation(line: 63, column: 3, scope: !262)
!288 = !DILocation(line: 59, column: 37, scope: !256)
!289 = !DILocation(line: 59, column: 3, scope: !256)
!290 = distinct !{!290, !259, !291, !98}
!291 = !DILocation(line: 63, column: 3, scope: !252)
!292 = !DILocalVariable(name: "y", scope: !293, file: !3, line: 65, type: !15)
!293 = distinct !DILexicalBlock(scope: !213, file: !3, line: 65, column: 3)
!294 = !DILocation(line: 65, column: 11, scope: !293)
!295 = !DILocation(line: 65, column: 7, scope: !293)
!296 = !DILocation(line: 65, column: 18, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !3, line: 65, column: 3)
!298 = !DILocation(line: 65, column: 22, scope: !297)
!299 = !DILocation(line: 65, column: 20, scope: !297)
!300 = !DILocation(line: 65, column: 3, scope: !293)
!301 = !DILocation(line: 66, column: 10, scope: !297)
!302 = !DILocation(line: 66, column: 17, scope: !297)
!303 = !DILocation(line: 66, column: 5, scope: !297)
!304 = !DILocation(line: 65, column: 37, scope: !297)
!305 = !DILocation(line: 65, column: 3, scope: !297)
!306 = distinct !{!306, !300, !307, !98}
!307 = !DILocation(line: 66, column: 19, scope: !293)
!308 = !DILocalVariable(name: "i", scope: !309, file: !3, line: 68, type: !15)
!309 = distinct !DILexicalBlock(scope: !213, file: !3, line: 68, column: 3)
!310 = !DILocation(line: 68, column: 11, scope: !309)
!311 = !DILocation(line: 68, column: 7, scope: !309)
!312 = !DILocation(line: 68, column: 18, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !3, line: 68, column: 3)
!314 = !DILocation(line: 68, column: 23, scope: !313)
!315 = !DILocation(line: 68, column: 20, scope: !313)
!316 = !DILocation(line: 68, column: 3, scope: !309)
!317 = !DILocation(line: 69, column: 10, scope: !313)
!318 = !DILocation(line: 69, column: 17, scope: !313)
!319 = !DILocation(line: 69, column: 5, scope: !313)
!320 = !DILocation(line: 68, column: 38, scope: !313)
!321 = !DILocation(line: 68, column: 3, scope: !313)
!322 = distinct !{!322, !316, !323, !98}
!323 = !DILocation(line: 69, column: 19, scope: !309)
!324 = !DILocation(line: 70, column: 8, scope: !213)
!325 = !DILocation(line: 70, column: 3, scope: !213)
!326 = !DILocation(line: 71, column: 1, scope: !213)
!327 = distinct !DISubprogram(name: "calcLangValueFuncWrapper", scope: !3, file: !3, line: 73, type: !328, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!328 = !DISubroutineType(types: !329)
!329 = !{!11, !330, !339, !11}
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64)
!331 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !332, line: 8, baseType: !333)
!332 = !DIFile(filename: "include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!333 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !332, line: 4, size: 128, elements: !334)
!334 = !{!335, !336, !338}
!335 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !333, file: !332, line: 5, baseType: !181, size: 64)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !333, file: !332, line: 6, baseType: !337, size: 32, offset: 64)
!337 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !333, file: !332, line: 7, baseType: !15, size: 32, offset: 96)
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64)
!340 = !DISubroutineType(types: !341)
!341 = !{!342, !342}
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64)
!343 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !344, line: 40, baseType: !345)
!344 = !DIFile(filename: "include/c/LinkToCalcLang.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "fc06603ba024469da7212531580c966f")
!345 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !344, line: 37, size: 128, elements: !346)
!346 = !{!347, !348}
!347 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !345, file: !344, line: 38, baseType: !15, size: 32)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !345, file: !344, line: 39, baseType: !349, size: 64, offset: 64)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !344, line: 35, baseType: !350)
!350 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !344, line: 27, size: 64, elements: !351)
!351 = !{!352, !361, !368, !369, !371, !372, !373}
!352 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !350, file: !344, line: 28, baseType: !353, size: 64)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !344, line: 20, baseType: !355)
!355 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !344, line: 17, size: 128, elements: !356)
!356 = !{!357, !358}
!357 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !355, file: !344, line: 18, baseType: !15, size: 32)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !355, file: !344, line: 19, baseType: !359, size: 64, offset: 64)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !350, file: !344, line: 29, baseType: !362, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !344, line: 25, baseType: !364)
!364 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !344, line: 22, size: 128, elements: !365)
!365 = !{!366, !367}
!366 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !364, file: !344, line: 23, baseType: !15, size: 32)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !364, file: !344, line: 24, baseType: !359, size: 64, offset: 64)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !350, file: !344, line: 30, baseType: !15, size: 32)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !350, file: !344, line: 31, baseType: !370, size: 64)
!370 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !350, file: !344, line: 32, baseType: !370, size: 64)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !350, file: !344, line: 33, baseType: !370, size: 64)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !350, file: !344, line: 34, baseType: !43, size: 8)
!374 = !DILocalVariable(name: "arena", arg: 1, scope: !327, file: !3, line: 73, type: !330)
!375 = !DILocation(line: 73, column: 52, scope: !327)
!376 = !DILocalVariable(name: "valFunc", arg: 2, scope: !327, file: !3, line: 73, type: !339)
!377 = !DILocation(line: 73, column: 76, scope: !327)
!378 = !DILocalVariable(name: "val", arg: 3, scope: !327, file: !3, line: 73, type: !11)
!379 = !DILocation(line: 73, column: 114, scope: !327)
!380 = !DILocalVariable(name: "cVal", scope: !327, file: !3, line: 74, type: !342)
!381 = !DILocation(line: 74, column: 18, scope: !327)
!382 = !DILocation(line: 74, column: 36, scope: !327)
!383 = !DILocation(line: 74, column: 25, scope: !327)
!384 = !DILocation(line: 75, column: 3, scope: !327)
!385 = !DILocation(line: 75, column: 9, scope: !327)
!386 = !DILocation(line: 75, column: 17, scope: !327)
!387 = !DILocation(line: 76, column: 32, scope: !327)
!388 = !DILocation(line: 76, column: 27, scope: !327)
!389 = !DILocation(line: 76, column: 3, scope: !327)
!390 = !DILocation(line: 76, column: 9, scope: !327)
!391 = !DILocation(line: 76, column: 25, scope: !327)
!392 = !DILocalVariable(name: "res", scope: !327, file: !3, line: 77, type: !342)
!393 = !DILocation(line: 77, column: 18, scope: !327)
!394 = !DILocation(line: 77, column: 24, scope: !327)
!395 = !DILocation(line: 77, column: 32, scope: !327)
!396 = !DILocation(line: 78, column: 6, scope: !397)
!397 = distinct !DILexicalBlock(scope: !327, file: !3, line: 78, column: 6)
!398 = !DILocation(line: 78, column: 11, scope: !397)
!399 = !DILocation(line: 78, column: 19, scope: !397)
!400 = !DILocation(line: 78, column: 6, scope: !327)
!401 = !DILocation(line: 79, column: 26, scope: !397)
!402 = !DILocation(line: 79, column: 31, scope: !397)
!403 = !DILocation(line: 79, column: 39, scope: !397)
!404 = !DILocation(line: 79, column: 12, scope: !397)
!405 = !DILocation(line: 79, column: 5, scope: !397)
!406 = !DILocation(line: 81, column: 5, scope: !407)
!407 = distinct !DILexicalBlock(scope: !397, file: !3, line: 80, column: 8)
!408 = !DILocation(line: 82, column: 5, scope: !407)
!409 = !DILocation(line: 84, column: 1, scope: !327)
!410 = distinct !DISubprogram(name: "shadeGraph", scope: !3, file: !3, line: 86, type: !411, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!411 = !DISubroutineType(types: !412)
!412 = !{null, !61, !339, !330, !11, !11, !11, !11, !15, !15}
!413 = !DILocalVariable(name: "display", arg: 1, scope: !410, file: !3, line: 86, type: !61)
!414 = !DILocation(line: 86, column: 33, scope: !410)
!415 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !410, file: !3, line: 86, type: !339)
!416 = !DILocation(line: 86, column: 59, scope: !410)
!417 = !DILocalVariable(name: "arena", arg: 3, scope: !410, file: !3, line: 86, type: !330)
!418 = !DILocation(line: 86, column: 100, scope: !410)
!419 = !DILocalVariable(name: "xSteps", arg: 4, scope: !410, file: !3, line: 86, type: !11)
!420 = !DILocation(line: 86, column: 119, scope: !410)
!421 = !DILocalVariable(name: "ySteps", arg: 5, scope: !410, file: !3, line: 86, type: !11)
!422 = !DILocation(line: 86, column: 139, scope: !410)
!423 = !DILocalVariable(name: "leftBound", arg: 6, scope: !410, file: !3, line: 86, type: !11)
!424 = !DILocation(line: 86, column: 159, scope: !410)
!425 = !DILocalVariable(name: "rightBound", arg: 7, scope: !410, file: !3, line: 86, type: !11)
!426 = !DILocation(line: 86, column: 182, scope: !410)
!427 = !DILocalVariable(name: "windowHeight", arg: 8, scope: !410, file: !3, line: 86, type: !15)
!428 = !DILocation(line: 86, column: 198, scope: !410)
!429 = !DILocalVariable(name: "windowWidth", arg: 9, scope: !410, file: !3, line: 86, type: !15)
!430 = !DILocation(line: 86, column: 216, scope: !410)
!431 = !DILocalVariable(name: "relX", scope: !410, file: !3, line: 87, type: !11)
!432 = !DILocation(line: 87, column: 15, scope: !410)
!433 = !DILocalVariable(name: "relY", scope: !410, file: !3, line: 87, type: !11)
!434 = !DILocation(line: 87, column: 21, scope: !410)
!435 = !DILocalVariable(name: "y", scope: !436, file: !3, line: 89, type: !15)
!436 = distinct !DILexicalBlock(scope: !410, file: !3, line: 89, column: 3)
!437 = !DILocation(line: 89, column: 11, scope: !436)
!438 = !DILocation(line: 89, column: 7, scope: !436)
!439 = !DILocation(line: 89, column: 18, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !3, line: 89, column: 3)
!441 = !DILocation(line: 89, column: 22, scope: !440)
!442 = !DILocation(line: 89, column: 20, scope: !440)
!443 = !DILocation(line: 89, column: 3, scope: !436)
!444 = !DILocalVariable(name: "x", scope: !445, file: !3, line: 90, type: !15)
!445 = distinct !DILexicalBlock(scope: !446, file: !3, line: 90, column: 5)
!446 = distinct !DILexicalBlock(scope: !440, file: !3, line: 89, column: 40)
!447 = !DILocation(line: 90, column: 13, scope: !445)
!448 = !DILocation(line: 90, column: 9, scope: !445)
!449 = !DILocation(line: 90, column: 20, scope: !450)
!450 = distinct !DILexicalBlock(scope: !445, file: !3, line: 90, column: 5)
!451 = !DILocation(line: 90, column: 24, scope: !450)
!452 = !DILocation(line: 90, column: 22, scope: !450)
!453 = !DILocation(line: 90, column: 5, scope: !445)
!454 = !DILocalVariable(name: "pixel", scope: !455, file: !3, line: 91, type: !5)
!455 = distinct !DILexicalBlock(scope: !450, file: !3, line: 90, column: 41)
!456 = !DILocation(line: 91, column: 22, scope: !455)
!457 = !DILocation(line: 91, column: 31, scope: !455)
!458 = !DILocation(line: 91, column: 39, scope: !455)
!459 = !DILocation(line: 91, column: 42, scope: !455)
!460 = !DILocation(line: 93, column: 14, scope: !455)
!461 = !DILocation(line: 93, column: 21, scope: !455)
!462 = !DILocation(line: 93, column: 12, scope: !455)
!463 = !DILocation(line: 94, column: 14, scope: !455)
!464 = !DILocation(line: 94, column: 21, scope: !455)
!465 = !DILocation(line: 94, column: 12, scope: !455)
!466 = !DILocalVariable(name: "output", scope: !455, file: !3, line: 96, type: !11)
!467 = !DILocation(line: 96, column: 19, scope: !455)
!468 = !DILocation(line: 96, column: 53, scope: !455)
!469 = !DILocation(line: 96, column: 60, scope: !455)
!470 = !DILocation(line: 96, column: 70, scope: !455)
!471 = !DILocation(line: 96, column: 28, scope: !455)
!472 = !DILocation(line: 97, column: 18, scope: !473)
!473 = distinct !DILexicalBlock(scope: !455, file: !3, line: 97, column: 10)
!474 = !DILocation(line: 97, column: 26, scope: !473)
!475 = !DILocation(line: 97, column: 32, scope: !473)
!476 = !DILocation(line: 97, column: 38, scope: !473)
!477 = !DILocation(line: 97, column: 10, scope: !473)
!478 = !DILocation(line: 97, column: 10, scope: !455)
!479 = !DILocation(line: 98, column: 29, scope: !473)
!480 = !DILocation(line: 98, column: 37, scope: !473)
!481 = !DILocation(line: 98, column: 43, scope: !473)
!482 = !DILocation(line: 98, column: 19, scope: !473)
!483 = !DILocation(line: 98, column: 2, scope: !473)
!484 = !DILocation(line: 98, column: 9, scope: !473)
!485 = !DILocation(line: 98, column: 17, scope: !473)
!486 = !DILocation(line: 99, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !473, file: !3, line: 99, column: 15)
!488 = !DILocation(line: 99, column: 24, scope: !487)
!489 = !DILocation(line: 99, column: 105, scope: !487)
!490 = !DILocation(line: 99, column: 32, scope: !487)
!491 = !DILocation(line: 99, column: 39, scope: !487)
!492 = !DILocation(line: 99, column: 45, scope: !487)
!493 = !DILocation(line: 99, column: 37, scope: !487)
!494 = !DILocation(line: 99, column: 48, scope: !487)
!495 = !DILocation(line: 99, column: 51, scope: !487)
!496 = !DILocation(line: 99, column: 58, scope: !487)
!497 = !DILocation(line: 99, column: 56, scope: !487)
!498 = !DILocation(line: 99, column: 16, scope: !487)
!499 = !DILocation(line: 99, column: 69, scope: !487)
!500 = !DILocation(line: 99, column: 77, scope: !487)
!501 = !DILocation(line: 99, column: 76, scope: !487)
!502 = !DILocation(line: 99, column: 83, scope: !487)
!503 = !DILocation(line: 99, column: 74, scope: !487)
!504 = !DILocation(line: 99, column: 86, scope: !487)
!505 = !DILocation(line: 99, column: 89, scope: !487)
!506 = !DILocation(line: 99, column: 96, scope: !487)
!507 = !DILocation(line: 99, column: 94, scope: !487)
!508 = !DILocation(line: 99, column: 109, scope: !487)
!509 = !DILocation(line: 99, column: 116, scope: !487)
!510 = !DILocation(line: 99, column: 114, scope: !487)
!511 = !DILocation(line: 99, column: 126, scope: !487)
!512 = !DILocation(line: 99, column: 129, scope: !487)
!513 = !DILocation(line: 99, column: 136, scope: !487)
!514 = !DILocation(line: 99, column: 134, scope: !487)
!515 = !DILocation(line: 99, column: 15, scope: !473)
!516 = !DILocation(line: 100, column: 2, scope: !487)
!517 = !DILocation(line: 100, column: 9, scope: !487)
!518 = !DILocation(line: 100, column: 17, scope: !487)
!519 = !DILocation(line: 101, column: 5, scope: !455)
!520 = !DILocation(line: 90, column: 38, scope: !450)
!521 = !DILocation(line: 90, column: 5, scope: !450)
!522 = distinct !{!522, !453, !523, !98}
!523 = !DILocation(line: 101, column: 5, scope: !445)
!524 = !DILocation(line: 102, column: 3, scope: !446)
!525 = !DILocation(line: 89, column: 37, scope: !440)
!526 = !DILocation(line: 89, column: 3, scope: !440)
!527 = distinct !{!527, !443, !528, !98}
!528 = !DILocation(line: 102, column: 3, scope: !436)
!529 = !DILocation(line: 103, column: 1, scope: !410)
!530 = distinct !DISubprogram(name: "drawLine", scope: !3, file: !3, line: 105, type: !531, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!531 = !DISubroutineType(types: !532)
!532 = !{null, !61, !339, !330, !11, !11, !15, !15}
!533 = !DILocalVariable(name: "display", arg: 1, scope: !530, file: !3, line: 105, type: !61)
!534 = !DILocation(line: 105, column: 31, scope: !530)
!535 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !530, file: !3, line: 105, type: !339)
!536 = !DILocation(line: 105, column: 57, scope: !530)
!537 = !DILocalVariable(name: "arena", arg: 3, scope: !530, file: !3, line: 105, type: !330)
!538 = !DILocation(line: 105, column: 98, scope: !530)
!539 = !DILocalVariable(name: "xSteps", arg: 4, scope: !530, file: !3, line: 105, type: !11)
!540 = !DILocation(line: 105, column: 117, scope: !530)
!541 = !DILocalVariable(name: "ySteps", arg: 5, scope: !530, file: !3, line: 105, type: !11)
!542 = !DILocation(line: 105, column: 137, scope: !530)
!543 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !530, file: !3, line: 105, type: !15)
!544 = !DILocation(line: 105, column: 149, scope: !530)
!545 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !530, file: !3, line: 105, type: !15)
!546 = !DILocation(line: 105, column: 167, scope: !530)
!547 = !DILocalVariable(name: "relX", scope: !530, file: !3, line: 106, type: !11)
!548 = !DILocation(line: 106, column: 15, scope: !530)
!549 = !DILocalVariable(name: "relY", scope: !530, file: !3, line: 106, type: !11)
!550 = !DILocation(line: 106, column: 21, scope: !530)
!551 = !DILocalVariable(name: "y", scope: !552, file: !3, line: 108, type: !15)
!552 = distinct !DILexicalBlock(scope: !530, file: !3, line: 108, column: 5)
!553 = !DILocation(line: 108, column: 13, scope: !552)
!554 = !DILocation(line: 108, column: 9, scope: !552)
!555 = !DILocation(line: 108, column: 21, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !3, line: 108, column: 5)
!557 = !DILocation(line: 108, column: 25, scope: !556)
!558 = !DILocation(line: 108, column: 23, scope: !556)
!559 = !DILocation(line: 108, column: 5, scope: !552)
!560 = !DILocalVariable(name: "x", scope: !561, file: !3, line: 109, type: !15)
!561 = distinct !DILexicalBlock(scope: !562, file: !3, line: 109, column: 9)
!562 = distinct !DILexicalBlock(scope: !556, file: !3, line: 108, column: 45)
!563 = !DILocation(line: 109, column: 17, scope: !561)
!564 = !DILocation(line: 109, column: 13, scope: !561)
!565 = !DILocation(line: 109, column: 25, scope: !566)
!566 = distinct !DILexicalBlock(scope: !561, file: !3, line: 109, column: 9)
!567 = !DILocation(line: 109, column: 29, scope: !566)
!568 = !DILocation(line: 109, column: 27, scope: !566)
!569 = !DILocation(line: 109, column: 9, scope: !561)
!570 = !DILocalVariable(name: "pixel", scope: !571, file: !3, line: 110, type: !5)
!571 = distinct !DILexicalBlock(scope: !566, file: !3, line: 109, column: 48)
!572 = !DILocation(line: 110, column: 28, scope: !571)
!573 = !DILocation(line: 110, column: 37, scope: !571)
!574 = !DILocation(line: 110, column: 45, scope: !571)
!575 = !DILocation(line: 110, column: 48, scope: !571)
!576 = !DILocation(line: 111, column: 20, scope: !571)
!577 = !DILocation(line: 111, column: 29, scope: !571)
!578 = !DILocation(line: 111, column: 18, scope: !571)
!579 = !DILocation(line: 112, column: 20, scope: !571)
!580 = !DILocation(line: 112, column: 29, scope: !571)
!581 = !DILocation(line: 112, column: 18, scope: !571)
!582 = !DILocalVariable(name: "output", scope: !571, file: !3, line: 114, type: !11)
!583 = !DILocation(line: 114, column: 25, scope: !571)
!584 = !DILocation(line: 114, column: 59, scope: !571)
!585 = !DILocation(line: 114, column: 66, scope: !571)
!586 = !DILocation(line: 114, column: 76, scope: !571)
!587 = !DILocation(line: 114, column: 34, scope: !571)
!588 = !DILocation(line: 115, column: 24, scope: !589)
!589 = distinct !DILexicalBlock(scope: !571, file: !3, line: 115, column: 16)
!590 = !DILocation(line: 115, column: 32, scope: !589)
!591 = !DILocation(line: 115, column: 38, scope: !589)
!592 = !DILocation(line: 115, column: 44, scope: !589)
!593 = !DILocation(line: 115, column: 16, scope: !589)
!594 = !DILocation(line: 115, column: 16, scope: !571)
!595 = !DILocation(line: 116, column: 35, scope: !589)
!596 = !DILocation(line: 116, column: 43, scope: !589)
!597 = !DILocation(line: 116, column: 49, scope: !589)
!598 = !DILocation(line: 116, column: 25, scope: !589)
!599 = !DILocation(line: 116, column: 8, scope: !589)
!600 = !DILocation(line: 116, column: 15, scope: !589)
!601 = !DILocation(line: 116, column: 23, scope: !589)
!602 = !DILocation(line: 117, column: 9, scope: !571)
!603 = !DILocation(line: 109, column: 44, scope: !566)
!604 = !DILocation(line: 109, column: 9, scope: !566)
!605 = distinct !{!605, !569, !606, !98}
!606 = !DILocation(line: 117, column: 9, scope: !561)
!607 = !DILocation(line: 118, column: 5, scope: !562)
!608 = !DILocation(line: 108, column: 41, scope: !556)
!609 = !DILocation(line: 108, column: 5, scope: !556)
!610 = distinct !{!610, !559, !611, !98}
!611 = !DILocation(line: 118, column: 5, scope: !552)
!612 = !DILocation(line: 119, column: 1, scope: !530)
!613 = distinct !DISubprogram(name: "drawPlane", scope: !3, file: !3, line: 121, type: !614, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!614 = !DISubroutineType(types: !615)
!615 = !{null, !61, !11, !11, !15, !15}
!616 = !DILocalVariable(name: "display", arg: 1, scope: !613, file: !3, line: 121, type: !61)
!617 = !DILocation(line: 121, column: 32, scope: !613)
!618 = !DILocalVariable(name: "xSteps", arg: 2, scope: !613, file: !3, line: 121, type: !11)
!619 = !DILocation(line: 121, column: 53, scope: !613)
!620 = !DILocalVariable(name: "ySteps", arg: 3, scope: !613, file: !3, line: 121, type: !11)
!621 = !DILocation(line: 121, column: 73, scope: !613)
!622 = !DILocalVariable(name: "windowHeight", arg: 4, scope: !613, file: !3, line: 121, type: !15)
!623 = !DILocation(line: 121, column: 85, scope: !613)
!624 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !613, file: !3, line: 121, type: !15)
!625 = !DILocation(line: 121, column: 103, scope: !613)
!626 = !DILocalVariable(name: "relX", scope: !613, file: !3, line: 122, type: !11)
!627 = !DILocation(line: 122, column: 15, scope: !613)
!628 = !DILocalVariable(name: "relY", scope: !613, file: !3, line: 122, type: !11)
!629 = !DILocation(line: 122, column: 21, scope: !613)
!630 = !DILocalVariable(name: "y", scope: !631, file: !3, line: 123, type: !15)
!631 = distinct !DILexicalBlock(scope: !613, file: !3, line: 123, column: 5)
!632 = !DILocation(line: 123, column: 13, scope: !631)
!633 = !DILocation(line: 123, column: 9, scope: !631)
!634 = !DILocation(line: 123, column: 20, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 123, column: 5)
!636 = !DILocation(line: 123, column: 24, scope: !635)
!637 = !DILocation(line: 123, column: 22, scope: !635)
!638 = !DILocation(line: 123, column: 5, scope: !631)
!639 = !DILocalVariable(name: "x", scope: !640, file: !3, line: 124, type: !15)
!640 = distinct !DILexicalBlock(scope: !641, file: !3, line: 124, column: 9)
!641 = distinct !DILexicalBlock(scope: !635, file: !3, line: 123, column: 43)
!642 = !DILocation(line: 124, column: 17, scope: !640)
!643 = !DILocation(line: 124, column: 13, scope: !640)
!644 = !DILocation(line: 124, column: 24, scope: !645)
!645 = distinct !DILexicalBlock(scope: !640, file: !3, line: 124, column: 9)
!646 = !DILocation(line: 124, column: 28, scope: !645)
!647 = !DILocation(line: 124, column: 26, scope: !645)
!648 = !DILocation(line: 124, column: 9, scope: !640)
!649 = !DILocalVariable(name: "pixel", scope: !650, file: !3, line: 125, type: !5)
!650 = distinct !DILexicalBlock(scope: !645, file: !3, line: 124, column: 46)
!651 = !DILocation(line: 125, column: 28, scope: !650)
!652 = !DILocation(line: 125, column: 37, scope: !650)
!653 = !DILocation(line: 125, column: 45, scope: !650)
!654 = !DILocation(line: 125, column: 48, scope: !650)
!655 = !DILocation(line: 126, column: 20, scope: !650)
!656 = !DILocation(line: 126, column: 27, scope: !650)
!657 = !DILocation(line: 126, column: 18, scope: !650)
!658 = !DILocation(line: 127, column: 20, scope: !650)
!659 = !DILocation(line: 127, column: 27, scope: !650)
!660 = !DILocation(line: 127, column: 18, scope: !650)
!661 = !DILocalVariable(name: "xZero", scope: !650, file: !3, line: 129, type: !43)
!662 = !DILocation(line: 129, column: 18, scope: !650)
!663 = !DILocation(line: 129, column: 34, scope: !650)
!664 = !DILocation(line: 129, column: 43, scope: !650)
!665 = !DILocation(line: 129, column: 49, scope: !650)
!666 = !DILocation(line: 129, column: 26, scope: !650)
!667 = !DILocalVariable(name: "yZero", scope: !650, file: !3, line: 130, type: !43)
!668 = !DILocation(line: 130, column: 18, scope: !650)
!669 = !DILocation(line: 130, column: 34, scope: !650)
!670 = !DILocation(line: 130, column: 43, scope: !650)
!671 = !DILocation(line: 130, column: 49, scope: !650)
!672 = !DILocation(line: 130, column: 26, scope: !650)
!673 = !DILocalVariable(name: "origin", scope: !650, file: !3, line: 131, type: !43)
!674 = !DILocation(line: 131, column: 18, scope: !650)
!675 = !DILocation(line: 131, column: 27, scope: !650)
!676 = !DILocation(line: 131, column: 33, scope: !650)
!677 = !DILocation(line: 131, column: 36, scope: !650)
!678 = !DILocation(line: 0, scope: !650)
!679 = !DILocation(line: 133, column: 16, scope: !680)
!680 = distinct !DILexicalBlock(scope: !650, file: !3, line: 133, column: 16)
!681 = !DILocation(line: 133, column: 16, scope: !650)
!682 = !DILocation(line: 134, column: 17, scope: !680)
!683 = !DILocation(line: 134, column: 26, scope: !680)
!684 = !DILocation(line: 134, column: 34, scope: !680)
!685 = !DILocation(line: 135, column: 21, scope: !686)
!686 = distinct !DILexicalBlock(scope: !680, file: !3, line: 135, column: 21)
!687 = !DILocation(line: 135, column: 21, scope: !680)
!688 = !DILocation(line: 136, column: 17, scope: !686)
!689 = !DILocation(line: 136, column: 26, scope: !686)
!690 = !DILocation(line: 136, column: 34, scope: !686)
!691 = !DILocation(line: 137, column: 21, scope: !692)
!692 = distinct !DILexicalBlock(scope: !686, file: !3, line: 137, column: 21)
!693 = !DILocation(line: 137, column: 21, scope: !686)
!694 = !DILocation(line: 138, column: 17, scope: !692)
!695 = !DILocation(line: 138, column: 26, scope: !692)
!696 = !DILocation(line: 138, column: 34, scope: !692)
!697 = !DILocation(line: 140, column: 17, scope: !692)
!698 = !DILocation(line: 140, column: 26, scope: !692)
!699 = !DILocation(line: 140, column: 34, scope: !692)
!700 = !DILocation(line: 141, column: 9, scope: !650)
!701 = !DILocation(line: 124, column: 42, scope: !645)
!702 = !DILocation(line: 124, column: 9, scope: !645)
!703 = distinct !{!703, !648, !704, !98}
!704 = !DILocation(line: 141, column: 9, scope: !640)
!705 = !DILocation(line: 142, column: 5, scope: !641)
!706 = !DILocation(line: 123, column: 39, scope: !635)
!707 = !DILocation(line: 123, column: 5, scope: !635)
!708 = distinct !{!708, !638, !709, !98}
!709 = !DILocation(line: 142, column: 5, scope: !631)
!710 = !DILocation(line: 143, column: 1, scope: !613)
!711 = distinct !DISubprogram(name: "clearDisplay", scope: !3, file: !3, line: 145, type: !712, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!712 = !DISubroutineType(types: !713)
!713 = !{null, !61, !15}
!714 = !DILocalVariable(name: "display", arg: 1, scope: !711, file: !3, line: 145, type: !61)
!715 = !DILocation(line: 145, column: 35, scope: !711)
!716 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !711, file: !3, line: 145, type: !15)
!717 = !DILocation(line: 145, column: 48, scope: !711)
!718 = !DILocalVariable(name: "i", scope: !719, file: !3, line: 146, type: !15)
!719 = distinct !DILexicalBlock(scope: !711, file: !3, line: 146, column: 3)
!720 = !DILocation(line: 146, column: 11, scope: !719)
!721 = !DILocation(line: 146, column: 7, scope: !719)
!722 = !DILocation(line: 146, column: 18, scope: !723)
!723 = distinct !DILexicalBlock(scope: !719, file: !3, line: 146, column: 3)
!724 = !DILocation(line: 146, column: 22, scope: !723)
!725 = !DILocation(line: 146, column: 20, scope: !723)
!726 = !DILocation(line: 146, column: 3, scope: !719)
!727 = !DILocation(line: 147, column: 10, scope: !728)
!728 = distinct !DILexicalBlock(scope: !723, file: !3, line: 146, column: 40)
!729 = !DILocation(line: 147, column: 18, scope: !728)
!730 = !DILocation(line: 147, column: 5, scope: !728)
!731 = !DILocation(line: 148, column: 3, scope: !728)
!732 = !DILocation(line: 146, column: 37, scope: !723)
!733 = !DILocation(line: 146, column: 3, scope: !723)
!734 = distinct !{!734, !726, !735, !98}
!735 = !DILocation(line: 148, column: 3, scope: !719)
!736 = !DILocation(line: 149, column: 8, scope: !711)
!737 = !DILocation(line: 149, column: 3, scope: !711)
!738 = !DILocation(line: 150, column: 1, scope: !711)
!739 = distinct !DISubprogram(name: "drawGraph", scope: !3, file: !3, line: 152, type: !740, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!740 = !DISubroutineType(types: !741)
!741 = !{!43, !330, !15, !15, !15, !339}
!742 = !DILocalVariable(name: "arena", arg: 1, scope: !739, file: !3, line: 152, type: !330)
!743 = !DILocation(line: 152, column: 30, scope: !739)
!744 = !DILocalVariable(name: "begin", arg: 2, scope: !739, file: !3, line: 152, type: !15)
!745 = !DILocation(line: 152, column: 41, scope: !739)
!746 = !DILocalVariable(name: "end", arg: 3, scope: !739, file: !3, line: 152, type: !15)
!747 = !DILocation(line: 152, column: 52, scope: !739)
!748 = !DILocalVariable(name: "byAmount", arg: 4, scope: !739, file: !3, line: 152, type: !15)
!749 = !DILocation(line: 152, column: 61, scope: !739)
!750 = !DILocalVariable(name: "valFunc", arg: 5, scope: !739, file: !3, line: 152, type: !339)
!751 = !DILocation(line: 152, column: 88, scope: !739)
!752 = !DILocalVariable(name: "w", scope: !739, file: !3, line: 153, type: !753)
!753 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !754, line: 27, size: 64, elements: !755)
!754 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!755 = !{!756, !758, !759, !760}
!756 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !753, file: !754, line: 29, baseType: !757, size: 16)
!757 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !753, file: !754, line: 30, baseType: !757, size: 16, offset: 16)
!759 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !753, file: !754, line: 31, baseType: !757, size: 16, offset: 32)
!760 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !753, file: !754, line: 32, baseType: !757, size: 16, offset: 48)
!761 = !DILocation(line: 153, column: 18, scope: !739)
!762 = !DILocation(line: 156, column: 7, scope: !763)
!763 = distinct !DILexicalBlock(scope: !739, file: !3, line: 156, column: 7)
!764 = !DILocation(line: 156, column: 44, scope: !763)
!765 = !DILocation(line: 156, column: 7, scope: !739)
!766 = !DILocation(line: 157, column: 7, scope: !767)
!767 = distinct !DILexicalBlock(scope: !763, file: !3, line: 156, column: 51)
!768 = !DILocation(line: 158, column: 7, scope: !767)
!769 = !DILocalVariable(name: "display", scope: !739, file: !3, line: 161, type: !61)
!770 = !DILocation(line: 161, column: 19, scope: !739)
!771 = !DILocation(line: 161, column: 43, scope: !739)
!772 = !DILocation(line: 161, column: 53, scope: !739)
!773 = !DILocation(line: 161, column: 63, scope: !739)
!774 = !DILocation(line: 161, column: 76, scope: !739)
!775 = !DILocation(line: 161, column: 74, scope: !739)
!776 = !DILocation(line: 161, column: 86, scope: !739)
!777 = !DILocation(line: 161, column: 84, scope: !739)
!778 = !DILocation(line: 161, column: 29, scope: !739)
!779 = !DILocation(line: 162, column: 13, scope: !739)
!780 = !DILocation(line: 162, column: 22, scope: !739)
!781 = !DILocation(line: 162, column: 32, scope: !739)
!782 = !DILocation(line: 162, column: 44, scope: !739)
!783 = !DILocation(line: 162, column: 42, scope: !739)
!784 = !DILocation(line: 162, column: 54, scope: !739)
!785 = !DILocation(line: 162, column: 52, scope: !739)
!786 = !DILocation(line: 162, column: 3, scope: !739)
!787 = !DILocation(line: 163, column: 12, scope: !739)
!788 = !DILocation(line: 163, column: 21, scope: !739)
!789 = !DILocation(line: 163, column: 30, scope: !739)
!790 = !DILocation(line: 163, column: 37, scope: !739)
!791 = !DILocation(line: 163, column: 47, scope: !739)
!792 = !DILocation(line: 163, column: 59, scope: !739)
!793 = !DILocation(line: 163, column: 57, scope: !739)
!794 = !DILocation(line: 163, column: 69, scope: !739)
!795 = !DILocation(line: 163, column: 67, scope: !739)
!796 = !DILocation(line: 163, column: 3, scope: !739)
!797 = !DILocation(line: 164, column: 14, scope: !739)
!798 = !DILocation(line: 164, column: 25, scope: !739)
!799 = !DILocation(line: 164, column: 23, scope: !739)
!800 = !DILocation(line: 164, column: 35, scope: !739)
!801 = !DILocation(line: 164, column: 33, scope: !739)
!802 = !DILocation(line: 164, column: 3, scope: !739)
!803 = !DILocation(line: 165, column: 16, scope: !739)
!804 = !DILocation(line: 165, column: 27, scope: !739)
!805 = !DILocation(line: 165, column: 25, scope: !739)
!806 = !DILocation(line: 165, column: 3, scope: !739)
!807 = !DILocation(line: 166, column: 3, scope: !739)
!808 = !DILocation(line: 167, column: 1, scope: !739)
