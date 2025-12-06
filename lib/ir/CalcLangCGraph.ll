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
  %7 = load i32, ptr %4, align 4, !dbg !69
  %8 = sext i32 %7 to i64, !dbg !69
  %9 = mul i64 8, %8, !dbg !70
  %10 = call noalias ptr @malloc(i64 noundef %9) #7, !dbg !71
  store ptr %10, ptr %5, align 8, !dbg !68
  %11 = load ptr, ptr %5, align 8, !dbg !72
  %12 = load i32, ptr %4, align 4, !dbg !73
  %13 = sext i32 %12 to i64, !dbg !73
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 %13, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata ptr %6, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 0, ptr %6, align 4, !dbg !77
  br label %14, !dbg !78

14:                                               ; preds = %30, %2
  %15 = load i32, ptr %6, align 4, !dbg !79
  %16 = load i32, ptr %4, align 4, !dbg !81
  %17 = icmp slt i32 %15, %16, !dbg !82
  br i1 %17, label %18, label %33, !dbg !83

18:                                               ; preds = %14
  %19 = load i32, ptr %3, align 4, !dbg !84
  %20 = sext i32 %19 to i64, !dbg !84
  %21 = mul i64 48, %20, !dbg !86
  %22 = call noalias ptr @malloc(i64 noundef %21) #7, !dbg !87
  %23 = load ptr, ptr %5, align 8, !dbg !88
  %24 = load i32, ptr %6, align 4, !dbg !89
  %25 = sext i32 %24 to i64, !dbg !88
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25, !dbg !88
  store ptr %22, ptr %26, align 8, !dbg !90
  %27 = load ptr, ptr %5, align 8, !dbg !91
  %28 = load i32, ptr %3, align 4, !dbg !92
  %29 = sext i32 %28 to i64, !dbg !92
  call void @llvm.memset.p0.i64(ptr align 8 %27, i8 0, i64 %29, i1 false), !dbg !93
  br label %30, !dbg !94

30:                                               ; preds = %18
  %31 = load i32, ptr %6, align 4, !dbg !95
  %32 = add nsw i32 %31, 1, !dbg !95
  store i32 %32, ptr %6, align 4, !dbg !95
  br label %14, !dbg !96, !llvm.loop !97

33:                                               ; preds = %14
  %34 = load ptr, ptr %5, align 8, !dbg !100
  ret ptr %34, !dbg !101
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @quantifyPlane(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, x86_fp80 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !102 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !105, metadata !DIExpression()), !dbg !106
  store x86_fp80 %1, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !107, metadata !DIExpression()), !dbg !108
  store x86_fp80 %2, ptr %9, align 16
  call void @llvm.dbg.declare(metadata ptr %9, metadata !109, metadata !DIExpression()), !dbg !110
  store x86_fp80 %3, ptr %10, align 16
  call void @llvm.dbg.declare(metadata ptr %10, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 %5, ptr %12, align 4
  call void @llvm.dbg.declare(metadata ptr %12, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata ptr %13, metadata !117, metadata !DIExpression()), !dbg !118
  %16 = load i32, ptr %11, align 4, !dbg !119
  %17 = load i32, ptr %12, align 4, !dbg !120
  %18 = call ptr @initializeDisplay(i32 noundef %16, i32 noundef %17), !dbg !121
  store ptr %18, ptr %13, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata ptr %14, metadata !122, metadata !DIExpression()), !dbg !124
  store i32 0, ptr %14, align 4, !dbg !124
  br label %19, !dbg !125

19:                                               ; preds = %62, %6
  %20 = load i32, ptr %14, align 4, !dbg !126
  %21 = load i32, ptr %12, align 4, !dbg !128
  %22 = icmp slt i32 %20, %21, !dbg !129
  br i1 %22, label %23, label %65, !dbg !130

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %15, metadata !131, metadata !DIExpression()), !dbg !134
  store i32 0, ptr %15, align 4, !dbg !134
  br label %24, !dbg !135

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %15, align 4, !dbg !136
  %26 = load i32, ptr %11, align 4, !dbg !138
  %27 = icmp slt i32 %25, %26, !dbg !139
  br i1 %27, label %28, label %61, !dbg !140

28:                                               ; preds = %24
  %29 = load x86_fp80, ptr %9, align 16, !dbg !141
  %30 = load x86_fp80, ptr %7, align 16, !dbg !143
  %31 = load i32, ptr %15, align 4, !dbg !144
  %32 = sitofp i32 %31 to x86_fp80, !dbg !144
  %33 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %30, x86_fp80 %32, x86_fp80 %29), !dbg !145
  %34 = load ptr, ptr %13, align 8, !dbg !146
  %35 = load i32, ptr %14, align 4, !dbg !147
  %36 = sext i32 %35 to i64, !dbg !146
  %37 = getelementptr inbounds ptr, ptr %34, i64 %36, !dbg !146
  %38 = load ptr, ptr %37, align 8, !dbg !146
  %39 = load i32, ptr %15, align 4, !dbg !148
  %40 = sext i32 %39 to i64, !dbg !146
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %38, i64 %40, !dbg !146
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %41, i32 0, i32 0, !dbg !149
  store x86_fp80 %33, ptr %42, align 16, !dbg !150
  %43 = load x86_fp80, ptr %10, align 16, !dbg !151
  %44 = load x86_fp80, ptr %8, align 16, !dbg !152
  %45 = load i32, ptr %14, align 4, !dbg !153
  %46 = sitofp i32 %45 to x86_fp80, !dbg !153
  %47 = fneg x86_fp80 %44, !dbg !154
  %48 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %47, x86_fp80 %46, x86_fp80 %43), !dbg !154
  %49 = load ptr, ptr %13, align 8, !dbg !155
  %50 = load i32, ptr %15, align 4, !dbg !156
  %51 = sext i32 %50 to i64, !dbg !155
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !155
  %53 = load ptr, ptr %52, align 8, !dbg !155
  %54 = load i32, ptr %14, align 4, !dbg !157
  %55 = sext i32 %54 to i64, !dbg !155
  %56 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i64 %55, !dbg !155
  %57 = getelementptr inbounds %struct.CalcLangPixel, ptr %56, i32 0, i32 1, !dbg !158
  store x86_fp80 %48, ptr %57, align 16, !dbg !159
  br label %58, !dbg !160

58:                                               ; preds = %28
  %59 = load i32, ptr %15, align 4, !dbg !161
  %60 = add nsw i32 %59, 1, !dbg !161
  store i32 %60, ptr %15, align 4, !dbg !161
  br label %24, !dbg !162, !llvm.loop !163

61:                                               ; preds = %24
  br label %62, !dbg !165

62:                                               ; preds = %61
  %63 = load i32, ptr %14, align 4, !dbg !166
  %64 = add nsw i32 %63, 1, !dbg !166
  store i32 %64, ptr %14, align 4, !dbg !166
  br label %19, !dbg !167, !llvm.loop !168

65:                                               ; preds = %19
  %66 = load ptr, ptr %13, align 8, !dbg !170
  ret ptr %66, !dbg !171
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @yCompress(x86_fp80 noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2) #0 !dbg !172 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca ptr, align 8
  %8 = alloca x86_fp80, align 16
  %9 = alloca x86_fp80, align 16
  %10 = alloca i32, align 4
  %11 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %4, align 16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !175, metadata !DIExpression()), !dbg !176
  store x86_fp80 %1, ptr %5, align 16
  call void @llvm.dbg.declare(metadata ptr %5, metadata !177, metadata !DIExpression()), !dbg !178
  store x86_fp80 %2, ptr %6, align 16
  call void @llvm.dbg.declare(metadata ptr %6, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata ptr %7, metadata !181, metadata !DIExpression()), !dbg !183
  store ptr @.str, ptr %7, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata ptr %8, metadata !184, metadata !DIExpression()), !dbg !185
  %12 = load x86_fp80, ptr %6, align 16, !dbg !186
  %13 = fdiv x86_fp80 %12, 0xK40028000000000000000, !dbg !187
  store x86_fp80 %13, ptr %8, align 16, !dbg !185
  call void @llvm.dbg.declare(metadata ptr %9, metadata !188, metadata !DIExpression()), !dbg !189
  %14 = load x86_fp80, ptr %4, align 16, !dbg !190
  %15 = load x86_fp80, ptr %5, align 16, !dbg !191
  %16 = load x86_fp80, ptr %6, align 16, !dbg !192
  %17 = fdiv x86_fp80 %16, 0xK40008000000000000000, !dbg !193
  %18 = fsub x86_fp80 %15, %17, !dbg !194
  %19 = fsub x86_fp80 %14, %18, !dbg !195
  store x86_fp80 %19, ptr %9, align 16, !dbg !189
  call void @llvm.dbg.declare(metadata ptr %10, metadata !196, metadata !DIExpression()), !dbg !197
  store i32 0, ptr %10, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata ptr %11, metadata !198, metadata !DIExpression()), !dbg !199
  store x86_fp80 0xK00000000000000000000, ptr %11, align 16, !dbg !199
  br label %20, !dbg !200

20:                                               ; preds = %24, %3
  %21 = load x86_fp80, ptr %11, align 16, !dbg !201
  %22 = load x86_fp80, ptr %9, align 16, !dbg !202
  %23 = fcmp olt x86_fp80 %21, %22, !dbg !203
  br i1 %23, label %24, label %30, !dbg !200

24:                                               ; preds = %20
  %25 = load x86_fp80, ptr %8, align 16, !dbg !204
  %26 = load x86_fp80, ptr %11, align 16, !dbg !206
  %27 = fadd x86_fp80 %26, %25, !dbg !206
  store x86_fp80 %27, ptr %11, align 16, !dbg !206
  %28 = load i32, ptr %10, align 4, !dbg !207
  %29 = add nsw i32 %28, 1, !dbg !207
  store i32 %29, ptr %10, align 4, !dbg !207
  br label %20, !dbg !200, !llvm.loop !208

30:                                               ; preds = %20
  %31 = load ptr, ptr %7, align 8, !dbg !210
  %32 = load i32, ptr %10, align 4, !dbg !211
  %33 = sub nsw i32 %32, 1, !dbg !212
  %34 = sext i32 %33 to i64, !dbg !210
  %35 = getelementptr inbounds i8, ptr %31, i64 %34, !dbg !210
  %36 = load i8, ptr %35, align 1, !dbg !210
  ret i8 %36, !dbg !213
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printPlane(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !214 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata ptr %7, metadata !223, metadata !DIExpression()), !dbg !225
  %13 = load i32, ptr %5, align 4, !dbg !226
  %14 = sext i32 %13 to i64, !dbg !226
  %15 = mul i64 8, %14, !dbg !227
  %16 = add i64 %15, 1, !dbg !228
  %17 = call noalias ptr @malloc(i64 noundef %16) #7, !dbg !229
  store ptr %17, ptr %7, align 8, !dbg !225
  call void @llvm.dbg.declare(metadata ptr %8, metadata !230, metadata !DIExpression()), !dbg !232
  store i32 0, ptr %8, align 4, !dbg !232
  br label %18, !dbg !233

18:                                               ; preds = %32, %3
  %19 = load i32, ptr %8, align 4, !dbg !234
  %20 = load i32, ptr %5, align 4, !dbg !236
  %21 = icmp slt i32 %19, %20, !dbg !237
  br i1 %21, label %22, label %35, !dbg !238

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4, !dbg !239
  %24 = sext i32 %23 to i64, !dbg !239
  %25 = mul i64 1, %24, !dbg !241
  %26 = add i64 %25, 1, !dbg !242
  %27 = call noalias ptr @malloc(i64 noundef %26) #7, !dbg !243
  %28 = load ptr, ptr %7, align 8, !dbg !244
  %29 = load i32, ptr %8, align 4, !dbg !245
  %30 = sext i32 %29 to i64, !dbg !244
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30, !dbg !244
  store ptr %27, ptr %31, align 8, !dbg !246
  br label %32, !dbg !247

32:                                               ; preds = %22
  %33 = load i32, ptr %8, align 4, !dbg !248
  %34 = add nsw i32 %33, 1, !dbg !248
  store i32 %34, ptr %8, align 4, !dbg !248
  br label %18, !dbg !249, !llvm.loop !250

35:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %9, metadata !252, metadata !DIExpression()), !dbg !254
  store i32 0, ptr %9, align 4, !dbg !254
  br label %36, !dbg !255

36:                                               ; preds = %76, %35
  %37 = load i32, ptr %9, align 4, !dbg !256
  %38 = load i32, ptr %5, align 4, !dbg !258
  %39 = icmp slt i32 %37, %38, !dbg !259
  br i1 %39, label %40, label %79, !dbg !260

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %10, metadata !261, metadata !DIExpression()), !dbg !264
  store i32 0, ptr %10, align 4, !dbg !264
  br label %41, !dbg !265

41:                                               ; preds = %64, %40
  %42 = load i32, ptr %10, align 4, !dbg !266
  %43 = load i32, ptr %6, align 4, !dbg !268
  %44 = icmp slt i32 %42, %43, !dbg !269
  br i1 %44, label %45, label %67, !dbg !270

45:                                               ; preds = %41
  %46 = load ptr, ptr %4, align 8, !dbg !271
  %47 = load i32, ptr %9, align 4, !dbg !272
  %48 = sext i32 %47 to i64, !dbg !271
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48, !dbg !271
  %50 = load ptr, ptr %49, align 8, !dbg !271
  %51 = load i32, ptr %10, align 4, !dbg !273
  %52 = sext i32 %51 to i64, !dbg !271
  %53 = getelementptr inbounds %struct.CalcLangPixel, ptr %50, i64 %52, !dbg !271
  %54 = getelementptr inbounds %struct.CalcLangPixel, ptr %53, i32 0, i32 2, !dbg !274
  %55 = load i8, ptr %54, align 16, !dbg !275
  %56 = load ptr, ptr %7, align 8, !dbg !276
  %57 = load i32, ptr %9, align 4, !dbg !277
  %58 = sext i32 %57 to i64, !dbg !276
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58, !dbg !276
  %60 = load ptr, ptr %59, align 8, !dbg !276
  %61 = load i32, ptr %10, align 4, !dbg !278
  %62 = sext i32 %61 to i64, !dbg !276
  %63 = getelementptr inbounds i8, ptr %60, i64 %62, !dbg !276
  store i8 %55, ptr %63, align 1, !dbg !279
  br label %64, !dbg !276

64:                                               ; preds = %45
  %65 = load i32, ptr %10, align 4, !dbg !280
  %66 = add nsw i32 %65, 1, !dbg !280
  store i32 %66, ptr %10, align 4, !dbg !280
  br label %41, !dbg !281, !llvm.loop !282

67:                                               ; preds = %41
  %68 = load ptr, ptr %7, align 8, !dbg !284
  %69 = load i32, ptr %9, align 4, !dbg !285
  %70 = sext i32 %69 to i64, !dbg !284
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70, !dbg !284
  %72 = load ptr, ptr %71, align 8, !dbg !284
  %73 = load i32, ptr %6, align 4, !dbg !286
  %74 = sext i32 %73 to i64, !dbg !284
  %75 = getelementptr inbounds i8, ptr %72, i64 %74, !dbg !284
  store i8 0, ptr %75, align 1, !dbg !287
  br label %76, !dbg !288

76:                                               ; preds = %67
  %77 = load i32, ptr %9, align 4, !dbg !289
  %78 = add nsw i32 %77, 1, !dbg !289
  store i32 %78, ptr %9, align 4, !dbg !289
  br label %36, !dbg !290, !llvm.loop !291

79:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata ptr %11, metadata !293, metadata !DIExpression()), !dbg !295
  store i32 0, ptr %11, align 4, !dbg !295
  br label %80, !dbg !296

80:                                               ; preds = %91, %79
  %81 = load i32, ptr %11, align 4, !dbg !297
  %82 = load i32, ptr %5, align 4, !dbg !299
  %83 = icmp slt i32 %81, %82, !dbg !300
  br i1 %83, label %84, label %94, !dbg !301

84:                                               ; preds = %80
  %85 = load ptr, ptr %7, align 8, !dbg !302
  %86 = load i32, ptr %11, align 4, !dbg !303
  %87 = sext i32 %86 to i64, !dbg !302
  %88 = getelementptr inbounds ptr, ptr %85, i64 %87, !dbg !302
  %89 = load ptr, ptr %88, align 8, !dbg !302
  %90 = call i32 @puts(ptr noundef %89), !dbg !304
  br label %91, !dbg !304

91:                                               ; preds = %84
  %92 = load i32, ptr %11, align 4, !dbg !305
  %93 = add nsw i32 %92, 1, !dbg !305
  store i32 %93, ptr %11, align 4, !dbg !305
  br label %80, !dbg !306, !llvm.loop !307

94:                                               ; preds = %80
  call void @llvm.dbg.declare(metadata ptr %12, metadata !309, metadata !DIExpression()), !dbg !311
  store i32 0, ptr %12, align 4, !dbg !311
  br label %95, !dbg !312

95:                                               ; preds = %105, %94
  %96 = load i32, ptr %12, align 4, !dbg !313
  %97 = load i32, ptr %5, align 4, !dbg !315
  %98 = icmp sle i32 %96, %97, !dbg !316
  br i1 %98, label %99, label %108, !dbg !317

99:                                               ; preds = %95
  %100 = load ptr, ptr %7, align 8, !dbg !318
  %101 = load i32, ptr %12, align 4, !dbg !319
  %102 = sext i32 %101 to i64, !dbg !318
  %103 = getelementptr inbounds ptr, ptr %100, i64 %102, !dbg !318
  %104 = load ptr, ptr %103, align 8, !dbg !318
  call void @free(ptr noundef %104) #8, !dbg !320
  br label %105, !dbg !320

105:                                              ; preds = %99
  %106 = load i32, ptr %12, align 4, !dbg !321
  %107 = add nsw i32 %106, 1, !dbg !321
  store i32 %107, ptr %12, align 4, !dbg !321
  br label %95, !dbg !322, !llvm.loop !323

108:                                              ; preds = %95
  %109 = load ptr, ptr %7, align 8, !dbg !325
  call void @free(ptr noundef %109) #8, !dbg !326
  ret void, !dbg !327
}

declare i32 @puts(ptr noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @calcLangValueFuncWrapper(ptr noundef %0, ptr noundef %1, x86_fp80 noundef %2) #0 !dbg !328 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca x86_fp80, align 16
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !375, metadata !DIExpression()), !dbg !376
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !377, metadata !DIExpression()), !dbg !378
  store x86_fp80 %2, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !379, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata ptr %8, metadata !381, metadata !DIExpression()), !dbg !382
  %10 = load ptr, ptr %5, align 8, !dbg !383
  %11 = call ptr @arenaAlloc(ptr noundef %10, i32 noundef 8), !dbg !384
  store ptr %11, ptr %8, align 8, !dbg !382
  %12 = load ptr, ptr %8, align 8, !dbg !385
  %13 = getelementptr inbounds %struct.CalcLangVal, ptr %12, i32 0, i32 0, !dbg !386
  store i32 0, ptr %13, align 8, !dbg !387
  %14 = load x86_fp80, ptr %7, align 16, !dbg !388
  %15 = fptosi x86_fp80 %14 to i32, !dbg !389
  %16 = load ptr, ptr %8, align 8, !dbg !390
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 1, !dbg !391
  store i32 %15, ptr %17, align 8, !dbg !392
  call void @llvm.dbg.declare(metadata ptr %9, metadata !393, metadata !DIExpression()), !dbg !394
  %18 = load ptr, ptr %6, align 8, !dbg !395
  %19 = load ptr, ptr %5, align 8, !dbg !396
  %20 = load ptr, ptr %8, align 8, !dbg !397
  %21 = call ptr %18(ptr noundef %19, ptr noundef %20), !dbg !395
  store ptr %21, ptr %9, align 8, !dbg !394
  %22 = load ptr, ptr %9, align 8, !dbg !398
  %23 = getelementptr inbounds %struct.CalcLangVal, ptr %22, i32 0, i32 0, !dbg !400
  %24 = load i32, ptr %23, align 8, !dbg !400
  %25 = icmp eq i32 %24, 0, !dbg !401
  br i1 %25, label %26, label %31, !dbg !402

26:                                               ; preds = %3
  %27 = load ptr, ptr %9, align 8, !dbg !403
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1, !dbg !404
  %29 = load i32, ptr %28, align 8, !dbg !405
  %30 = sitofp i32 %29 to x86_fp80, !dbg !406
  store x86_fp80 %30, ptr %4, align 16, !dbg !407
  br label %32, !dbg !407

31:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #9, !dbg !408
  store x86_fp80 0xKBFFF8000000000000000, ptr %4, align 16, !dbg !410
  br label %32, !dbg !410

32:                                               ; preds = %31, %26
  %33 = load x86_fp80, ptr %4, align 16, !dbg !411
  ret x86_fp80 %33, !dbg !411
}

declare ptr @arenaAlloc(ptr noundef, i32 noundef) #4

; Function Attrs: cold
declare void @perror(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @shadeGraph(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, x86_fp80 noundef %5, x86_fp80 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !412 {
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !415, metadata !DIExpression()), !dbg !416
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !417, metadata !DIExpression()), !dbg !418
  store ptr %2, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %12, metadata !419, metadata !DIExpression()), !dbg !420
  store x86_fp80 %3, ptr %13, align 16
  call void @llvm.dbg.declare(metadata ptr %13, metadata !421, metadata !DIExpression()), !dbg !422
  store x86_fp80 %4, ptr %14, align 16
  call void @llvm.dbg.declare(metadata ptr %14, metadata !423, metadata !DIExpression()), !dbg !424
  store x86_fp80 %5, ptr %15, align 16
  call void @llvm.dbg.declare(metadata ptr %15, metadata !425, metadata !DIExpression()), !dbg !426
  store x86_fp80 %6, ptr %16, align 16
  call void @llvm.dbg.declare(metadata ptr %16, metadata !427, metadata !DIExpression()), !dbg !428
  store i32 %7, ptr %17, align 4
  call void @llvm.dbg.declare(metadata ptr %17, metadata !429, metadata !DIExpression()), !dbg !430
  store i32 %8, ptr %18, align 4
  call void @llvm.dbg.declare(metadata ptr %18, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata ptr %19, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata ptr %20, metadata !435, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.declare(metadata ptr %21, metadata !437, metadata !DIExpression()), !dbg !439
  store i32 0, ptr %21, align 4, !dbg !439
  br label %25, !dbg !440

25:                                               ; preds = %104, %9
  %26 = load i32, ptr %21, align 4, !dbg !441
  %27 = load i32, ptr %17, align 4, !dbg !443
  %28 = icmp slt i32 %26, %27, !dbg !444
  br i1 %28, label %29, label %107, !dbg !445

29:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %22, metadata !446, metadata !DIExpression()), !dbg !449
  store i32 0, ptr %22, align 4, !dbg !449
  br label %30, !dbg !450

30:                                               ; preds = %100, %29
  %31 = load i32, ptr %22, align 4, !dbg !451
  %32 = load i32, ptr %18, align 4, !dbg !453
  %33 = icmp slt i32 %31, %32, !dbg !454
  br i1 %33, label %34, label %103, !dbg !455

34:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %23, metadata !456, metadata !DIExpression()), !dbg !458
  %35 = load ptr, ptr %10, align 8, !dbg !459
  %36 = load i32, ptr %21, align 4, !dbg !460
  %37 = sext i32 %36 to i64, !dbg !459
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37, !dbg !459
  %39 = load ptr, ptr %38, align 8, !dbg !459
  %40 = load i32, ptr %22, align 4, !dbg !461
  %41 = sext i32 %40 to i64, !dbg !459
  %42 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i64 %41, !dbg !459
  store ptr %42, ptr %23, align 8, !dbg !458
  %43 = load ptr, ptr %23, align 8, !dbg !462
  %44 = getelementptr inbounds %struct.CalcLangPixel, ptr %43, i32 0, i32 0, !dbg !463
  %45 = load x86_fp80, ptr %44, align 16, !dbg !463
  store x86_fp80 %45, ptr %19, align 16, !dbg !464
  %46 = load ptr, ptr %23, align 8, !dbg !465
  %47 = getelementptr inbounds %struct.CalcLangPixel, ptr %46, i32 0, i32 1, !dbg !466
  %48 = load x86_fp80, ptr %47, align 16, !dbg !466
  store x86_fp80 %48, ptr %20, align 16, !dbg !467
  call void @llvm.dbg.declare(metadata ptr %24, metadata !468, metadata !DIExpression()), !dbg !469
  %49 = load ptr, ptr %12, align 8, !dbg !470
  %50 = load ptr, ptr %11, align 8, !dbg !471
  %51 = load x86_fp80, ptr %19, align 16, !dbg !472
  %52 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %49, ptr noundef %50, x86_fp80 noundef %51), !dbg !473
  store x86_fp80 %52, ptr %24, align 16, !dbg !469
  %53 = load x86_fp80, ptr %24, align 16, !dbg !474
  %54 = load x86_fp80, ptr %20, align 16, !dbg !476
  %55 = load x86_fp80, ptr %14, align 16, !dbg !477
  %56 = fdiv x86_fp80 %55, 0xK40008666666666666800, !dbg !478
  %57 = call zeroext i1 @closeTo(x86_fp80 noundef %53, x86_fp80 noundef %54, x86_fp80 noundef %56), !dbg !479
  br i1 %57, label %58, label %65, !dbg !480

58:                                               ; preds = %34
  %59 = load x86_fp80, ptr %24, align 16, !dbg !481
  %60 = load x86_fp80, ptr %20, align 16, !dbg !482
  %61 = load x86_fp80, ptr %14, align 16, !dbg !483
  %62 = call signext i8 @yCompress(x86_fp80 noundef %59, x86_fp80 noundef %60, x86_fp80 noundef %61), !dbg !484
  %63 = load ptr, ptr %23, align 8, !dbg !485
  %64 = getelementptr inbounds %struct.CalcLangPixel, ptr %63, i32 0, i32 2, !dbg !486
  store i8 %62, ptr %64, align 16, !dbg !487
  br label %99, !dbg !485

65:                                               ; preds = %34
  %66 = load x86_fp80, ptr %24, align 16, !dbg !488
  %67 = fcmp olt x86_fp80 %66, 0xK00000000000000000000, !dbg !490
  br i1 %67, label %68, label %77, !dbg !491

68:                                               ; preds = %65
  %69 = load x86_fp80, ptr %20, align 16, !dbg !492
  %70 = load x86_fp80, ptr %14, align 16, !dbg !493
  %71 = fdiv x86_fp80 %70, 0xK40008000000000000000, !dbg !494
  %72 = fcmp olt x86_fp80 %69, %71, !dbg !495
  br i1 %72, label %73, label %98, !dbg !496

73:                                               ; preds = %68
  %74 = load x86_fp80, ptr %20, align 16, !dbg !497
  %75 = load x86_fp80, ptr %24, align 16, !dbg !498
  %76 = fcmp ogt x86_fp80 %74, %75, !dbg !499
  br i1 %76, label %87, label %98, !dbg !500

77:                                               ; preds = %65
  %78 = load x86_fp80, ptr %20, align 16, !dbg !501
  %79 = load x86_fp80, ptr %14, align 16, !dbg !502
  %80 = fneg x86_fp80 %79, !dbg !503
  %81 = fdiv x86_fp80 %80, 0xK40008000000000000000, !dbg !504
  %82 = fcmp ogt x86_fp80 %78, %81, !dbg !505
  br i1 %82, label %83, label %98, !dbg !506

83:                                               ; preds = %77
  %84 = load x86_fp80, ptr %20, align 16, !dbg !507
  %85 = load x86_fp80, ptr %24, align 16, !dbg !508
  %86 = fcmp olt x86_fp80 %84, %85, !dbg !509
  br i1 %86, label %87, label %98, !dbg !491

87:                                               ; preds = %83, %73
  %88 = load x86_fp80, ptr %19, align 16, !dbg !510
  %89 = load x86_fp80, ptr %15, align 16, !dbg !511
  %90 = fcmp ogt x86_fp80 %88, %89, !dbg !512
  br i1 %90, label %91, label %98, !dbg !513

91:                                               ; preds = %87
  %92 = load x86_fp80, ptr %19, align 16, !dbg !514
  %93 = load x86_fp80, ptr %16, align 16, !dbg !515
  %94 = fcmp olt x86_fp80 %92, %93, !dbg !516
  br i1 %94, label %95, label %98, !dbg !517

95:                                               ; preds = %91
  %96 = load ptr, ptr %23, align 8, !dbg !518
  %97 = getelementptr inbounds %struct.CalcLangPixel, ptr %96, i32 0, i32 2, !dbg !519
  store i8 35, ptr %97, align 16, !dbg !520
  br label %98, !dbg !518

98:                                               ; preds = %95, %91, %87, %83, %77, %73, %68
  br label %99

99:                                               ; preds = %98, %58
  br label %100, !dbg !521

100:                                              ; preds = %99
  %101 = load i32, ptr %22, align 4, !dbg !522
  %102 = add nsw i32 %101, 1, !dbg !522
  store i32 %102, ptr %22, align 4, !dbg !522
  br label %30, !dbg !523, !llvm.loop !524

103:                                              ; preds = %30
  br label %104, !dbg !526

104:                                              ; preds = %103
  %105 = load i32, ptr %21, align 4, !dbg !527
  %106 = add nsw i32 %105, 1, !dbg !527
  store i32 %106, ptr %21, align 4, !dbg !527
  br label %25, !dbg !528, !llvm.loop !529

107:                                              ; preds = %25
  ret void, !dbg !531
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawLine(ptr noundef %0, ptr noundef %1, ptr noundef %2, x86_fp80 noundef %3, x86_fp80 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !532 {
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
  call void @llvm.dbg.declare(metadata ptr %8, metadata !535, metadata !DIExpression()), !dbg !536
  store ptr %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !537, metadata !DIExpression()), !dbg !538
  store ptr %2, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !539, metadata !DIExpression()), !dbg !540
  store x86_fp80 %3, ptr %11, align 16
  call void @llvm.dbg.declare(metadata ptr %11, metadata !541, metadata !DIExpression()), !dbg !542
  store x86_fp80 %4, ptr %12, align 16
  call void @llvm.dbg.declare(metadata ptr %12, metadata !543, metadata !DIExpression()), !dbg !544
  store i32 %5, ptr %13, align 4
  call void @llvm.dbg.declare(metadata ptr %13, metadata !545, metadata !DIExpression()), !dbg !546
  store i32 %6, ptr %14, align 4
  call void @llvm.dbg.declare(metadata ptr %14, metadata !547, metadata !DIExpression()), !dbg !548
  call void @llvm.dbg.declare(metadata ptr %15, metadata !549, metadata !DIExpression()), !dbg !550
  call void @llvm.dbg.declare(metadata ptr %16, metadata !551, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata ptr %17, metadata !553, metadata !DIExpression()), !dbg !555
  store i32 0, ptr %17, align 4, !dbg !555
  br label %21, !dbg !556

21:                                               ; preds = %66, %7
  %22 = load i32, ptr %17, align 4, !dbg !557
  %23 = load i32, ptr %13, align 4, !dbg !559
  %24 = icmp slt i32 %22, %23, !dbg !560
  br i1 %24, label %25, label %69, !dbg !561

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %18, metadata !562, metadata !DIExpression()), !dbg !565
  store i32 0, ptr %18, align 4, !dbg !565
  br label %26, !dbg !566

26:                                               ; preds = %62, %25
  %27 = load i32, ptr %18, align 4, !dbg !567
  %28 = load i32, ptr %14, align 4, !dbg !569
  %29 = icmp slt i32 %27, %28, !dbg !570
  br i1 %29, label %30, label %65, !dbg !571

30:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %19, metadata !572, metadata !DIExpression()), !dbg !574
  %31 = load ptr, ptr %8, align 8, !dbg !575
  %32 = load i32, ptr %17, align 4, !dbg !576
  %33 = sext i32 %32 to i64, !dbg !575
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33, !dbg !575
  %35 = load ptr, ptr %34, align 8, !dbg !575
  %36 = load i32, ptr %18, align 4, !dbg !577
  %37 = sext i32 %36 to i64, !dbg !575
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %35, i64 %37, !dbg !575
  store ptr %38, ptr %19, align 8, !dbg !574
  %39 = load ptr, ptr %19, align 8, !dbg !578
  %40 = getelementptr inbounds %struct.CalcLangPixel, ptr %39, i32 0, i32 0, !dbg !579
  %41 = load x86_fp80, ptr %40, align 16, !dbg !579
  store x86_fp80 %41, ptr %15, align 16, !dbg !580
  %42 = load ptr, ptr %19, align 8, !dbg !581
  %43 = getelementptr inbounds %struct.CalcLangPixel, ptr %42, i32 0, i32 1, !dbg !582
  %44 = load x86_fp80, ptr %43, align 16, !dbg !582
  store x86_fp80 %44, ptr %16, align 16, !dbg !583
  call void @llvm.dbg.declare(metadata ptr %20, metadata !584, metadata !DIExpression()), !dbg !585
  %45 = load ptr, ptr %10, align 8, !dbg !586
  %46 = load ptr, ptr %9, align 8, !dbg !587
  %47 = load x86_fp80, ptr %15, align 16, !dbg !588
  %48 = call x86_fp80 @calcLangValueFuncWrapper(ptr noundef %45, ptr noundef %46, x86_fp80 noundef %47), !dbg !589
  store x86_fp80 %48, ptr %20, align 16, !dbg !585
  %49 = load x86_fp80, ptr %20, align 16, !dbg !590
  %50 = load x86_fp80, ptr %16, align 16, !dbg !592
  %51 = load x86_fp80, ptr %12, align 16, !dbg !593
  %52 = fdiv x86_fp80 %51, 0xK40008666666666666800, !dbg !594
  %53 = call zeroext i1 @closeTo(x86_fp80 noundef %49, x86_fp80 noundef %50, x86_fp80 noundef %52), !dbg !595
  br i1 %53, label %54, label %61, !dbg !596

54:                                               ; preds = %30
  %55 = load x86_fp80, ptr %20, align 16, !dbg !597
  %56 = load x86_fp80, ptr %16, align 16, !dbg !598
  %57 = load x86_fp80, ptr %12, align 16, !dbg !599
  %58 = call signext i8 @yCompress(x86_fp80 noundef %55, x86_fp80 noundef %56, x86_fp80 noundef %57), !dbg !600
  %59 = load ptr, ptr %19, align 8, !dbg !601
  %60 = getelementptr inbounds %struct.CalcLangPixel, ptr %59, i32 0, i32 2, !dbg !602
  store i8 %58, ptr %60, align 16, !dbg !603
  br label %61, !dbg !601

61:                                               ; preds = %54, %30
  br label %62, !dbg !604

62:                                               ; preds = %61
  %63 = load i32, ptr %18, align 4, !dbg !605
  %64 = add nsw i32 %63, 1, !dbg !605
  store i32 %64, ptr %18, align 4, !dbg !605
  br label %26, !dbg !606, !llvm.loop !607

65:                                               ; preds = %26
  br label %66, !dbg !609

66:                                               ; preds = %65
  %67 = load i32, ptr %17, align 4, !dbg !610
  %68 = add nsw i32 %67, 1, !dbg !610
  store i32 %68, ptr %17, align 4, !dbg !610
  br label %21, !dbg !611, !llvm.loop !612

69:                                               ; preds = %21
  ret void, !dbg !614
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawPlane(ptr noundef %0, x86_fp80 noundef %1, x86_fp80 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !615 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !618, metadata !DIExpression()), !dbg !619
  store x86_fp80 %1, ptr %7, align 16
  call void @llvm.dbg.declare(metadata ptr %7, metadata !620, metadata !DIExpression()), !dbg !621
  store x86_fp80 %2, ptr %8, align 16
  call void @llvm.dbg.declare(metadata ptr %8, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !624, metadata !DIExpression()), !dbg !625
  store i32 %4, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !626, metadata !DIExpression()), !dbg !627
  call void @llvm.dbg.declare(metadata ptr %11, metadata !628, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.declare(metadata ptr %12, metadata !630, metadata !DIExpression()), !dbg !631
  call void @llvm.dbg.declare(metadata ptr %13, metadata !632, metadata !DIExpression()), !dbg !634
  store i32 0, ptr %13, align 4, !dbg !634
  br label %19, !dbg !635

19:                                               ; preds = %88, %5
  %20 = load i32, ptr %13, align 4, !dbg !636
  %21 = load i32, ptr %9, align 4, !dbg !638
  %22 = icmp slt i32 %20, %21, !dbg !639
  br i1 %22, label %23, label %91, !dbg !640

23:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %14, metadata !641, metadata !DIExpression()), !dbg !644
  store i32 0, ptr %14, align 4, !dbg !644
  br label %24, !dbg !645

24:                                               ; preds = %84, %23
  %25 = load i32, ptr %14, align 4, !dbg !646
  %26 = load i32, ptr %10, align 4, !dbg !648
  %27 = icmp slt i32 %25, %26, !dbg !649
  br i1 %27, label %28, label %87, !dbg !650

28:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %15, metadata !651, metadata !DIExpression()), !dbg !653
  %29 = load ptr, ptr %6, align 8, !dbg !654
  %30 = load i32, ptr %13, align 4, !dbg !655
  %31 = sext i32 %30 to i64, !dbg !654
  %32 = getelementptr inbounds ptr, ptr %29, i64 %31, !dbg !654
  %33 = load ptr, ptr %32, align 8, !dbg !654
  %34 = load i32, ptr %14, align 4, !dbg !656
  %35 = sext i32 %34 to i64, !dbg !654
  %36 = getelementptr inbounds %struct.CalcLangPixel, ptr %33, i64 %35, !dbg !654
  store ptr %36, ptr %15, align 8, !dbg !653
  %37 = load ptr, ptr %15, align 8, !dbg !657
  %38 = getelementptr inbounds %struct.CalcLangPixel, ptr %37, i32 0, i32 0, !dbg !658
  %39 = load x86_fp80, ptr %38, align 16, !dbg !658
  store x86_fp80 %39, ptr %11, align 16, !dbg !659
  %40 = load ptr, ptr %15, align 8, !dbg !660
  %41 = getelementptr inbounds %struct.CalcLangPixel, ptr %40, i32 0, i32 1, !dbg !661
  %42 = load x86_fp80, ptr %41, align 16, !dbg !661
  store x86_fp80 %42, ptr %12, align 16, !dbg !662
  call void @llvm.dbg.declare(metadata ptr %16, metadata !663, metadata !DIExpression()), !dbg !664
  %43 = load x86_fp80, ptr %11, align 16, !dbg !665
  %44 = load x86_fp80, ptr %7, align 16, !dbg !666
  %45 = fdiv x86_fp80 %44, 0xK40008666666666666800, !dbg !667
  %46 = call zeroext i1 @closeTo(x86_fp80 noundef %43, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %45), !dbg !668
  %47 = zext i1 %46 to i8, !dbg !664
  store i8 %47, ptr %16, align 1, !dbg !664
  call void @llvm.dbg.declare(metadata ptr %17, metadata !669, metadata !DIExpression()), !dbg !670
  %48 = load x86_fp80, ptr %12, align 16, !dbg !671
  %49 = load x86_fp80, ptr %8, align 16, !dbg !672
  %50 = fdiv x86_fp80 %49, 0xK40008666666666666800, !dbg !673
  %51 = call zeroext i1 @closeTo(x86_fp80 noundef %48, x86_fp80 noundef 0xK00000000000000000000, x86_fp80 noundef %50), !dbg !674
  %52 = zext i1 %51 to i8, !dbg !670
  store i8 %52, ptr %17, align 1, !dbg !670
  call void @llvm.dbg.declare(metadata ptr %18, metadata !675, metadata !DIExpression()), !dbg !676
  %53 = load i8, ptr %16, align 1, !dbg !677
  %54 = trunc i8 %53 to i1, !dbg !677
  br i1 %54, label %55, label %58, !dbg !678

55:                                               ; preds = %28
  %56 = load i8, ptr %17, align 1, !dbg !679
  %57 = trunc i8 %56 to i1, !dbg !679
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi i1 [ false, %28 ], [ %57, %55 ], !dbg !680
  %60 = zext i1 %59 to i8, !dbg !676
  store i8 %60, ptr %18, align 1, !dbg !676
  %61 = load i8, ptr %18, align 1, !dbg !681
  %62 = trunc i8 %61 to i1, !dbg !681
  br i1 %62, label %63, label %66, !dbg !683

63:                                               ; preds = %58
  %64 = load ptr, ptr %15, align 8, !dbg !684
  %65 = getelementptr inbounds %struct.CalcLangPixel, ptr %64, i32 0, i32 2, !dbg !685
  store i8 43, ptr %65, align 16, !dbg !686
  br label %83, !dbg !684

66:                                               ; preds = %58
  %67 = load i8, ptr %16, align 1, !dbg !687
  %68 = trunc i8 %67 to i1, !dbg !687
  br i1 %68, label %69, label %72, !dbg !689

69:                                               ; preds = %66
  %70 = load ptr, ptr %15, align 8, !dbg !690
  %71 = getelementptr inbounds %struct.CalcLangPixel, ptr %70, i32 0, i32 2, !dbg !691
  store i8 124, ptr %71, align 16, !dbg !692
  br label %82, !dbg !690

72:                                               ; preds = %66
  %73 = load i8, ptr %17, align 1, !dbg !693
  %74 = trunc i8 %73 to i1, !dbg !693
  br i1 %74, label %75, label %78, !dbg !695

75:                                               ; preds = %72
  %76 = load ptr, ptr %15, align 8, !dbg !696
  %77 = getelementptr inbounds %struct.CalcLangPixel, ptr %76, i32 0, i32 2, !dbg !697
  store i8 45, ptr %77, align 16, !dbg !698
  br label %81, !dbg !696

78:                                               ; preds = %72
  %79 = load ptr, ptr %15, align 8, !dbg !699
  %80 = getelementptr inbounds %struct.CalcLangPixel, ptr %79, i32 0, i32 2, !dbg !700
  store i8 32, ptr %80, align 16, !dbg !701
  br label %81

81:                                               ; preds = %78, %75
  br label %82

82:                                               ; preds = %81, %69
  br label %83

83:                                               ; preds = %82, %63
  br label %84, !dbg !702

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4, !dbg !703
  %86 = add nsw i32 %85, 1, !dbg !703
  store i32 %86, ptr %14, align 4, !dbg !703
  br label %24, !dbg !704, !llvm.loop !705

87:                                               ; preds = %24
  br label %88, !dbg !707

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4, !dbg !708
  %90 = add nsw i32 %89, 1, !dbg !708
  store i32 %90, ptr %13, align 4, !dbg !708
  br label %19, !dbg !709, !llvm.loop !710

91:                                               ; preds = %19
  ret void, !dbg !712
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearDisplay(ptr noundef %0, i32 noundef %1) #0 !dbg !713 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !716, metadata !DIExpression()), !dbg !717
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !718, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.declare(metadata ptr %5, metadata !720, metadata !DIExpression()), !dbg !722
  store i32 0, ptr %5, align 4, !dbg !722
  br label %6, !dbg !723

6:                                                ; preds = %16, %2
  %7 = load i32, ptr %5, align 4, !dbg !724
  %8 = load i32, ptr %4, align 4, !dbg !726
  %9 = icmp slt i32 %7, %8, !dbg !727
  br i1 %9, label %10, label %19, !dbg !728

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8, !dbg !729
  %12 = load i32, ptr %5, align 4, !dbg !731
  %13 = sext i32 %12 to i64, !dbg !729
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13, !dbg !729
  %15 = load ptr, ptr %14, align 8, !dbg !729
  call void @free(ptr noundef %15) #8, !dbg !732
  br label %16, !dbg !733

16:                                               ; preds = %10
  %17 = load i32, ptr %5, align 4, !dbg !734
  %18 = add nsw i32 %17, 1, !dbg !734
  store i32 %18, ptr %5, align 4, !dbg !734
  br label %6, !dbg !735, !llvm.loop !736

19:                                               ; preds = %6
  %20 = load ptr, ptr %3, align 8, !dbg !738
  call void @free(ptr noundef %20) #8, !dbg !739
  ret void, !dbg !740
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @drawGraph(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 !dbg !741 {
  %6 = alloca i1, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca %struct.winsize, align 2
  %13 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !744, metadata !DIExpression()), !dbg !745
  store i32 %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !746, metadata !DIExpression()), !dbg !747
  store i32 %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !748, metadata !DIExpression()), !dbg !749
  store i32 %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !750, metadata !DIExpression()), !dbg !751
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !752, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.declare(metadata ptr %12, metadata !754, metadata !DIExpression()), !dbg !763
  %14 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %12) #8, !dbg !764
  %15 = icmp eq i32 %14, -1, !dbg !766
  br i1 %15, label %16, label %17, !dbg !767

16:                                               ; preds = %5
  call void @perror(ptr noundef @.str.2) #9, !dbg !768
  store i1 false, ptr %6, align 1, !dbg !770
  br label %66, !dbg !770

17:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %13, metadata !771, metadata !DIExpression()), !dbg !772
  %18 = load i32, ptr %10, align 4, !dbg !773
  %19 = sitofp i32 %18 to x86_fp80, !dbg !773
  %20 = load i32, ptr %10, align 4, !dbg !774
  %21 = sitofp i32 %20 to x86_fp80, !dbg !774
  %22 = load i32, ptr %8, align 4, !dbg !775
  %23 = sitofp i32 %22 to x86_fp80, !dbg !775
  %24 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !776
  %25 = load i16, ptr %24, align 2, !dbg !776
  %26 = zext i16 %25 to i32, !dbg !777
  %27 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !778
  %28 = load i16, ptr %27, align 2, !dbg !778
  %29 = zext i16 %28 to i32, !dbg !779
  %30 = call ptr @quantifyPlane(x86_fp80 noundef %19, x86_fp80 noundef %21, x86_fp80 noundef %23, x86_fp80 noundef 0xK4002E000000000000000, i32 noundef %26, i32 noundef %29), !dbg !780
  store ptr %30, ptr %13, align 8, !dbg !772
  %31 = load ptr, ptr %13, align 8, !dbg !781
  %32 = load i32, ptr %10, align 4, !dbg !782
  %33 = sitofp i32 %32 to x86_fp80, !dbg !782
  %34 = load i32, ptr %10, align 4, !dbg !783
  %35 = sitofp i32 %34 to x86_fp80, !dbg !783
  %36 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !784
  %37 = load i16, ptr %36, align 2, !dbg !784
  %38 = zext i16 %37 to i32, !dbg !785
  %39 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !786
  %40 = load i16, ptr %39, align 2, !dbg !786
  %41 = zext i16 %40 to i32, !dbg !787
  call void @drawPlane(ptr noundef %31, x86_fp80 noundef %33, x86_fp80 noundef %35, i32 noundef %38, i32 noundef %41), !dbg !788
  %42 = load ptr, ptr %13, align 8, !dbg !789
  %43 = load ptr, ptr %11, align 8, !dbg !790
  %44 = load ptr, ptr %7, align 8, !dbg !791
  %45 = load i32, ptr %10, align 4, !dbg !792
  %46 = sitofp i32 %45 to x86_fp80, !dbg !792
  %47 = load i32, ptr %10, align 4, !dbg !793
  %48 = sitofp i32 %47 to x86_fp80, !dbg !793
  %49 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !794
  %50 = load i16, ptr %49, align 2, !dbg !794
  %51 = zext i16 %50 to i32, !dbg !795
  %52 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !796
  %53 = load i16, ptr %52, align 2, !dbg !796
  %54 = zext i16 %53 to i32, !dbg !797
  call void @drawLine(ptr noundef %42, ptr noundef %43, ptr noundef %44, x86_fp80 noundef %46, x86_fp80 noundef %48, i32 noundef %51, i32 noundef %54), !dbg !798
  %55 = load ptr, ptr %13, align 8, !dbg !799
  %56 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !800
  %57 = load i16, ptr %56, align 2, !dbg !800
  %58 = zext i16 %57 to i32, !dbg !801
  %59 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 1, !dbg !802
  %60 = load i16, ptr %59, align 2, !dbg !802
  %61 = zext i16 %60 to i32, !dbg !803
  call void @printPlane(ptr noundef %55, i32 noundef %58, i32 noundef %61), !dbg !804
  %62 = load ptr, ptr %13, align 8, !dbg !805
  %63 = getelementptr inbounds %struct.winsize, ptr %12, i32 0, i32 0, !dbg !806
  %64 = load i16, ptr %63, align 2, !dbg !806
  %65 = zext i16 %64 to i32, !dbg !807
  call void @clearDisplay(ptr noundef %62, i32 noundef %65), !dbg !808
  store i1 true, ptr %6, align 1, !dbg !809
  br label %66, !dbg !809

66:                                               ; preds = %17, %16
  %67 = load i1, ptr %6, align 1, !dbg !810
  ret i1 %67, !dbg !810
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
!3 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "39955d128e409339c1a60c725a4b0ab0")
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
!19 = !DIFile(filename: "lib/src/c/CalcLangCGraph.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "39955d128e409339c1a60c725a4b0ab0")
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
!63 = !DILocalVariable(name: "windowWidth", arg: 1, scope: !59, file: !19, line: 14, type: !15)
!64 = !DILocation(line: 14, column: 39, scope: !59)
!65 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !59, file: !19, line: 14, type: !15)
!66 = !DILocation(line: 14, column: 56, scope: !59)
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
!92 = !DILocation(line: 19, column: 24, scope: !85)
!93 = !DILocation(line: 19, column: 5, scope: !85)
!94 = !DILocation(line: 20, column: 3, scope: !85)
!95 = !DILocation(line: 17, column: 37, scope: !80)
!96 = !DILocation(line: 17, column: 3, scope: !80)
!97 = distinct !{!97, !83, !98, !99}
!98 = !DILocation(line: 20, column: 3, scope: !76)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 21, column: 10, scope: !59)
!101 = !DILocation(line: 21, column: 3, scope: !59)
!102 = distinct !DISubprogram(name: "quantifyPlane", scope: !19, file: !19, line: 24, type: !103, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!103 = !DISubroutineType(types: !104)
!104 = !{!62, !11, !11, !11, !11, !15, !15}
!105 = !DILocalVariable(name: "xSteps", arg: 1, scope: !102, file: !19, line: 24, type: !11)
!106 = !DILocation(line: 24, column: 43, scope: !102)
!107 = !DILocalVariable(name: "ySteps", arg: 2, scope: !102, file: !19, line: 24, type: !11)
!108 = !DILocation(line: 24, column: 63, scope: !102)
!109 = !DILocalVariable(name: "xMin", arg: 3, scope: !102, file: !19, line: 24, type: !11)
!110 = !DILocation(line: 24, column: 83, scope: !102)
!111 = !DILocalVariable(name: "yMax", arg: 4, scope: !102, file: !19, line: 24, type: !11)
!112 = !DILocation(line: 24, column: 101, scope: !102)
!113 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !102, file: !19, line: 24, type: !15)
!114 = !DILocation(line: 24, column: 111, scope: !102)
!115 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !102, file: !19, line: 24, type: !15)
!116 = !DILocation(line: 24, column: 128, scope: !102)
!117 = !DILocalVariable(name: "display", scope: !102, file: !19, line: 25, type: !62)
!118 = !DILocation(line: 25, column: 19, scope: !102)
!119 = !DILocation(line: 25, column: 47, scope: !102)
!120 = !DILocation(line: 25, column: 60, scope: !102)
!121 = !DILocation(line: 25, column: 29, scope: !102)
!122 = !DILocalVariable(name: "y", scope: !123, file: !19, line: 27, type: !15)
!123 = distinct !DILexicalBlock(scope: !102, file: !19, line: 27, column: 3)
!124 = !DILocation(line: 27, column: 11, scope: !123)
!125 = !DILocation(line: 27, column: 7, scope: !123)
!126 = !DILocation(line: 27, column: 18, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !19, line: 27, column: 3)
!128 = !DILocation(line: 27, column: 22, scope: !127)
!129 = !DILocation(line: 27, column: 20, scope: !127)
!130 = !DILocation(line: 27, column: 3, scope: !123)
!131 = !DILocalVariable(name: "x", scope: !132, file: !19, line: 28, type: !15)
!132 = distinct !DILexicalBlock(scope: !133, file: !19, line: 28, column: 5)
!133 = distinct !DILexicalBlock(scope: !127, file: !19, line: 27, column: 40)
!134 = !DILocation(line: 28, column: 13, scope: !132)
!135 = !DILocation(line: 28, column: 9, scope: !132)
!136 = !DILocation(line: 28, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !19, line: 28, column: 5)
!138 = !DILocation(line: 28, column: 24, scope: !137)
!139 = !DILocation(line: 28, column: 22, scope: !137)
!140 = !DILocation(line: 28, column: 5, scope: !132)
!141 = !DILocation(line: 29, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !19, line: 28, column: 41)
!143 = !DILocation(line: 29, column: 36, scope: !142)
!144 = !DILocation(line: 29, column: 45, scope: !142)
!145 = !DILocation(line: 29, column: 33, scope: !142)
!146 = !DILocation(line: 29, column: 9, scope: !142)
!147 = !DILocation(line: 29, column: 17, scope: !142)
!148 = !DILocation(line: 29, column: 20, scope: !142)
!149 = !DILocation(line: 29, column: 23, scope: !142)
!150 = !DILocation(line: 29, column: 25, scope: !142)
!151 = !DILocation(line: 30, column: 28, scope: !142)
!152 = !DILocation(line: 30, column: 36, scope: !142)
!153 = !DILocation(line: 30, column: 45, scope: !142)
!154 = !DILocation(line: 30, column: 33, scope: !142)
!155 = !DILocation(line: 30, column: 9, scope: !142)
!156 = !DILocation(line: 30, column: 17, scope: !142)
!157 = !DILocation(line: 30, column: 20, scope: !142)
!158 = !DILocation(line: 30, column: 23, scope: !142)
!159 = !DILocation(line: 30, column: 25, scope: !142)
!160 = !DILocation(line: 31, column: 5, scope: !142)
!161 = !DILocation(line: 28, column: 38, scope: !137)
!162 = !DILocation(line: 28, column: 5, scope: !137)
!163 = distinct !{!163, !140, !164, !99}
!164 = !DILocation(line: 31, column: 5, scope: !132)
!165 = !DILocation(line: 32, column: 3, scope: !133)
!166 = !DILocation(line: 27, column: 37, scope: !127)
!167 = !DILocation(line: 27, column: 3, scope: !127)
!168 = distinct !{!168, !130, !169, !99}
!169 = !DILocation(line: 32, column: 3, scope: !123)
!170 = !DILocation(line: 34, column: 10, scope: !102)
!171 = !DILocation(line: 34, column: 3, scope: !102)
!172 = distinct !DISubprogram(name: "yCompress", scope: !19, file: !19, line: 37, type: !173, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!173 = !DISubroutineType(types: !174)
!174 = !{!14, !11, !11, !11}
!175 = !DILocalVariable(name: "num", arg: 1, scope: !172, file: !19, line: 37, type: !11)
!176 = !DILocation(line: 37, column: 28, scope: !172)
!177 = !DILocalVariable(name: "pixel", arg: 2, scope: !172, file: !19, line: 37, type: !11)
!178 = !DILocation(line: 37, column: 45, scope: !172)
!179 = !DILocalVariable(name: "range", arg: 3, scope: !172, file: !19, line: 37, type: !11)
!180 = !DILocation(line: 37, column: 64, scope: !172)
!181 = !DILocalVariable(name: "table", scope: !172, file: !19, line: 38, type: !182)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!183 = !DILocation(line: 38, column: 9, scope: !172)
!184 = !DILocalVariable(name: "steps", scope: !172, file: !19, line: 41, type: !11)
!185 = !DILocation(line: 41, column: 15, scope: !172)
!186 = !DILocation(line: 41, column: 23, scope: !172)
!187 = !DILocation(line: 41, column: 28, scope: !172)
!188 = !DILocalVariable(name: "goal", scope: !172, file: !19, line: 43, type: !11)
!189 = !DILocation(line: 43, column: 15, scope: !172)
!190 = !DILocation(line: 43, column: 22, scope: !172)
!191 = !DILocation(line: 43, column: 29, scope: !172)
!192 = !DILocation(line: 43, column: 38, scope: !172)
!193 = !DILocation(line: 43, column: 43, scope: !172)
!194 = !DILocation(line: 43, column: 35, scope: !172)
!195 = !DILocation(line: 43, column: 26, scope: !172)
!196 = !DILocalVariable(name: "counter", scope: !172, file: !19, line: 44, type: !15)
!197 = !DILocation(line: 44, column: 7, scope: !172)
!198 = !DILocalVariable(name: "step", scope: !172, file: !19, line: 45, type: !11)
!199 = !DILocation(line: 45, column: 15, scope: !172)
!200 = !DILocation(line: 46, column: 3, scope: !172)
!201 = !DILocation(line: 46, column: 9, scope: !172)
!202 = !DILocation(line: 46, column: 16, scope: !172)
!203 = !DILocation(line: 46, column: 14, scope: !172)
!204 = !DILocation(line: 47, column: 15, scope: !205)
!205 = distinct !DILexicalBlock(scope: !172, file: !19, line: 46, column: 22)
!206 = !DILocation(line: 47, column: 12, scope: !205)
!207 = !DILocation(line: 48, column: 14, scope: !205)
!208 = distinct !{!208, !200, !209, !99}
!209 = !DILocation(line: 49, column: 3, scope: !172)
!210 = !DILocation(line: 50, column: 10, scope: !172)
!211 = !DILocation(line: 50, column: 16, scope: !172)
!212 = !DILocation(line: 50, column: 24, scope: !172)
!213 = !DILocation(line: 50, column: 3, scope: !172)
!214 = distinct !DISubprogram(name: "printPlane", scope: !19, file: !19, line: 53, type: !215, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !62, !15, !15}
!217 = !DILocalVariable(name: "display", arg: 1, scope: !214, file: !19, line: 53, type: !62)
!218 = !DILocation(line: 53, column: 33, scope: !214)
!219 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !214, file: !19, line: 53, type: !15)
!220 = !DILocation(line: 53, column: 46, scope: !214)
!221 = !DILocalVariable(name: "windowWidth", arg: 3, scope: !214, file: !19, line: 53, type: !15)
!222 = !DILocation(line: 53, column: 64, scope: !214)
!223 = !DILocalVariable(name: "output", scope: !214, file: !19, line: 54, type: !224)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!225 = !DILocation(line: 54, column: 10, scope: !214)
!226 = !DILocation(line: 54, column: 42, scope: !214)
!227 = !DILocation(line: 54, column: 40, scope: !214)
!228 = !DILocation(line: 54, column: 55, scope: !214)
!229 = !DILocation(line: 54, column: 19, scope: !214)
!230 = !DILocalVariable(name: "i", scope: !231, file: !19, line: 55, type: !15)
!231 = distinct !DILexicalBlock(scope: !214, file: !19, line: 55, column: 3)
!232 = !DILocation(line: 55, column: 11, scope: !231)
!233 = !DILocation(line: 55, column: 7, scope: !231)
!234 = !DILocation(line: 55, column: 18, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !19, line: 55, column: 3)
!236 = !DILocation(line: 55, column: 22, scope: !235)
!237 = !DILocation(line: 55, column: 20, scope: !235)
!238 = !DILocation(line: 55, column: 3, scope: !231)
!239 = !DILocation(line: 56, column: 39, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !19, line: 55, column: 40)
!241 = !DILocation(line: 56, column: 37, scope: !240)
!242 = !DILocation(line: 56, column: 51, scope: !240)
!243 = !DILocation(line: 56, column: 17, scope: !240)
!244 = !DILocation(line: 56, column: 5, scope: !240)
!245 = !DILocation(line: 56, column: 12, scope: !240)
!246 = !DILocation(line: 56, column: 15, scope: !240)
!247 = !DILocation(line: 57, column: 3, scope: !240)
!248 = !DILocation(line: 55, column: 37, scope: !235)
!249 = !DILocation(line: 55, column: 3, scope: !235)
!250 = distinct !{!250, !238, !251, !99}
!251 = !DILocation(line: 57, column: 3, scope: !231)
!252 = !DILocalVariable(name: "y", scope: !253, file: !19, line: 59, type: !15)
!253 = distinct !DILexicalBlock(scope: !214, file: !19, line: 59, column: 3)
!254 = !DILocation(line: 59, column: 11, scope: !253)
!255 = !DILocation(line: 59, column: 7, scope: !253)
!256 = !DILocation(line: 59, column: 18, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !19, line: 59, column: 3)
!258 = !DILocation(line: 59, column: 22, scope: !257)
!259 = !DILocation(line: 59, column: 20, scope: !257)
!260 = !DILocation(line: 59, column: 3, scope: !253)
!261 = !DILocalVariable(name: "x", scope: !262, file: !19, line: 60, type: !15)
!262 = distinct !DILexicalBlock(scope: !263, file: !19, line: 60, column: 5)
!263 = distinct !DILexicalBlock(scope: !257, file: !19, line: 59, column: 41)
!264 = !DILocation(line: 60, column: 13, scope: !262)
!265 = !DILocation(line: 60, column: 9, scope: !262)
!266 = !DILocation(line: 60, column: 20, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !19, line: 60, column: 5)
!268 = !DILocation(line: 60, column: 24, scope: !267)
!269 = !DILocation(line: 60, column: 22, scope: !267)
!270 = !DILocation(line: 60, column: 5, scope: !262)
!271 = !DILocation(line: 61, column: 24, scope: !267)
!272 = !DILocation(line: 61, column: 32, scope: !267)
!273 = !DILocation(line: 61, column: 35, scope: !267)
!274 = !DILocation(line: 61, column: 38, scope: !267)
!275 = !DILocation(line: 61, column: 22, scope: !267)
!276 = !DILocation(line: 61, column: 7, scope: !267)
!277 = !DILocation(line: 61, column: 14, scope: !267)
!278 = !DILocation(line: 61, column: 17, scope: !267)
!279 = !DILocation(line: 61, column: 20, scope: !267)
!280 = !DILocation(line: 60, column: 38, scope: !267)
!281 = !DILocation(line: 60, column: 5, scope: !267)
!282 = distinct !{!282, !270, !283, !99}
!283 = !DILocation(line: 61, column: 38, scope: !262)
!284 = !DILocation(line: 62, column: 5, scope: !263)
!285 = !DILocation(line: 62, column: 12, scope: !263)
!286 = !DILocation(line: 62, column: 15, scope: !263)
!287 = !DILocation(line: 62, column: 28, scope: !263)
!288 = !DILocation(line: 63, column: 3, scope: !263)
!289 = !DILocation(line: 59, column: 37, scope: !257)
!290 = !DILocation(line: 59, column: 3, scope: !257)
!291 = distinct !{!291, !260, !292, !99}
!292 = !DILocation(line: 63, column: 3, scope: !253)
!293 = !DILocalVariable(name: "y", scope: !294, file: !19, line: 65, type: !15)
!294 = distinct !DILexicalBlock(scope: !214, file: !19, line: 65, column: 3)
!295 = !DILocation(line: 65, column: 11, scope: !294)
!296 = !DILocation(line: 65, column: 7, scope: !294)
!297 = !DILocation(line: 65, column: 18, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !19, line: 65, column: 3)
!299 = !DILocation(line: 65, column: 22, scope: !298)
!300 = !DILocation(line: 65, column: 20, scope: !298)
!301 = !DILocation(line: 65, column: 3, scope: !294)
!302 = !DILocation(line: 66, column: 10, scope: !298)
!303 = !DILocation(line: 66, column: 17, scope: !298)
!304 = !DILocation(line: 66, column: 5, scope: !298)
!305 = !DILocation(line: 65, column: 37, scope: !298)
!306 = !DILocation(line: 65, column: 3, scope: !298)
!307 = distinct !{!307, !301, !308, !99}
!308 = !DILocation(line: 66, column: 19, scope: !294)
!309 = !DILocalVariable(name: "i", scope: !310, file: !19, line: 68, type: !15)
!310 = distinct !DILexicalBlock(scope: !214, file: !19, line: 68, column: 3)
!311 = !DILocation(line: 68, column: 11, scope: !310)
!312 = !DILocation(line: 68, column: 7, scope: !310)
!313 = !DILocation(line: 68, column: 18, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !19, line: 68, column: 3)
!315 = !DILocation(line: 68, column: 23, scope: !314)
!316 = !DILocation(line: 68, column: 20, scope: !314)
!317 = !DILocation(line: 68, column: 3, scope: !310)
!318 = !DILocation(line: 69, column: 10, scope: !314)
!319 = !DILocation(line: 69, column: 17, scope: !314)
!320 = !DILocation(line: 69, column: 5, scope: !314)
!321 = !DILocation(line: 68, column: 38, scope: !314)
!322 = !DILocation(line: 68, column: 3, scope: !314)
!323 = distinct !{!323, !317, !324, !99}
!324 = !DILocation(line: 69, column: 19, scope: !310)
!325 = !DILocation(line: 70, column: 8, scope: !214)
!326 = !DILocation(line: 70, column: 3, scope: !214)
!327 = !DILocation(line: 71, column: 1, scope: !214)
!328 = distinct !DISubprogram(name: "calcLangValueFuncWrapper", scope: !19, file: !19, line: 73, type: !329, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!329 = !DISubroutineType(types: !330)
!330 = !{!11, !331, !340, !11}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !333, line: 8, baseType: !334)
!333 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !333, line: 4, size: 128, elements: !335)
!335 = !{!336, !337, !339}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !334, file: !333, line: 5, baseType: !182, size: 64)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !334, file: !333, line: 6, baseType: !338, size: 32, offset: 64)
!338 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !334, file: !333, line: 7, baseType: !15, size: 32, offset: 96)
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!341 = !DISubroutineType(types: !342)
!342 = !{!343, !331, !343}
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValue", file: !345, line: 40, baseType: !346)
!345 = !DIFile(filename: "lib/include/c/CalcLangCInt.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "fc06603ba024469da7212531580c966f")
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CalcLangVal", file: !345, line: 37, size: 128, elements: !347)
!347 = !{!348, !349}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "valType", scope: !346, file: !345, line: 38, baseType: !15, size: 32)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "valData", scope: !346, file: !345, line: 39, baseType: !350, size: 64, offset: 64)
!350 = !DIDerivedType(tag: DW_TAG_typedef, name: "CalcLangValueData", file: !345, line: 35, baseType: !351)
!351 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "CalcLangValData", file: !345, line: 27, size: 64, elements: !352)
!352 = !{!353, !362, !369, !370, !372, !373, !374}
!353 = !DIDerivedType(tag: DW_TAG_member, name: "tuple", scope: !351, file: !345, line: 28, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !355, size: 64)
!355 = !DIDerivedType(tag: DW_TAG_typedef, name: "TupleValue", file: !345, line: 20, baseType: !356)
!356 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !345, line: 17, size: 128, elements: !357)
!357 = !{!358, !359}
!358 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !356, file: !345, line: 18, baseType: !15, size: 32)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !356, file: !345, line: 19, baseType: !360, size: 64, offset: 64)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "set", scope: !351, file: !345, line: 29, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "SetValue", file: !345, line: 25, baseType: !365)
!365 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !345, line: 22, size: 128, elements: !366)
!366 = !{!367, !368}
!367 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !365, file: !345, line: 23, baseType: !15, size: 32)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !365, file: !345, line: 24, baseType: !360, size: 64, offset: 64)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !351, file: !345, line: 30, baseType: !15, size: 32)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !351, file: !345, line: 31, baseType: !371, size: 64)
!371 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "dollar", scope: !351, file: !345, line: 32, baseType: !371, size: 64)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "percent", scope: !351, file: !345, line: 33, baseType: !371, size: 64)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !351, file: !345, line: 34, baseType: !44, size: 8)
!375 = !DILocalVariable(name: "arena", arg: 1, scope: !328, file: !19, line: 73, type: !331)
!376 = !DILocation(line: 73, column: 52, scope: !328)
!377 = !DILocalVariable(name: "valFunc", arg: 2, scope: !328, file: !19, line: 73, type: !340)
!378 = !DILocation(line: 73, column: 76, scope: !328)
!379 = !DILocalVariable(name: "val", arg: 3, scope: !328, file: !19, line: 73, type: !11)
!380 = !DILocation(line: 73, column: 129, scope: !328)
!381 = !DILocalVariable(name: "cVal", scope: !328, file: !19, line: 74, type: !343)
!382 = !DILocation(line: 74, column: 18, scope: !328)
!383 = !DILocation(line: 74, column: 36, scope: !328)
!384 = !DILocation(line: 74, column: 25, scope: !328)
!385 = !DILocation(line: 75, column: 3, scope: !328)
!386 = !DILocation(line: 75, column: 9, scope: !328)
!387 = !DILocation(line: 75, column: 17, scope: !328)
!388 = !DILocation(line: 76, column: 32, scope: !328)
!389 = !DILocation(line: 76, column: 27, scope: !328)
!390 = !DILocation(line: 76, column: 3, scope: !328)
!391 = !DILocation(line: 76, column: 9, scope: !328)
!392 = !DILocation(line: 76, column: 25, scope: !328)
!393 = !DILocalVariable(name: "res", scope: !328, file: !19, line: 77, type: !343)
!394 = !DILocation(line: 77, column: 18, scope: !328)
!395 = !DILocation(line: 77, column: 24, scope: !328)
!396 = !DILocation(line: 77, column: 32, scope: !328)
!397 = !DILocation(line: 77, column: 39, scope: !328)
!398 = !DILocation(line: 78, column: 6, scope: !399)
!399 = distinct !DILexicalBlock(scope: !328, file: !19, line: 78, column: 6)
!400 = !DILocation(line: 78, column: 11, scope: !399)
!401 = !DILocation(line: 78, column: 19, scope: !399)
!402 = !DILocation(line: 78, column: 6, scope: !328)
!403 = !DILocation(line: 79, column: 26, scope: !399)
!404 = !DILocation(line: 79, column: 31, scope: !399)
!405 = !DILocation(line: 79, column: 39, scope: !399)
!406 = !DILocation(line: 79, column: 12, scope: !399)
!407 = !DILocation(line: 79, column: 5, scope: !399)
!408 = !DILocation(line: 81, column: 5, scope: !409)
!409 = distinct !DILexicalBlock(scope: !399, file: !19, line: 80, column: 8)
!410 = !DILocation(line: 82, column: 5, scope: !409)
!411 = !DILocation(line: 84, column: 1, scope: !328)
!412 = distinct !DISubprogram(name: "shadeGraph", scope: !19, file: !19, line: 86, type: !413, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!413 = !DISubroutineType(types: !414)
!414 = !{null, !62, !340, !331, !11, !11, !11, !11, !15, !15}
!415 = !DILocalVariable(name: "display", arg: 1, scope: !412, file: !19, line: 86, type: !62)
!416 = !DILocation(line: 86, column: 33, scope: !412)
!417 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !412, file: !19, line: 86, type: !340)
!418 = !DILocation(line: 86, column: 59, scope: !412)
!419 = !DILocalVariable(name: "arena", arg: 3, scope: !412, file: !19, line: 86, type: !331)
!420 = !DILocation(line: 86, column: 114, scope: !412)
!421 = !DILocalVariable(name: "xSteps", arg: 4, scope: !412, file: !19, line: 86, type: !11)
!422 = !DILocation(line: 86, column: 133, scope: !412)
!423 = !DILocalVariable(name: "ySteps", arg: 5, scope: !412, file: !19, line: 86, type: !11)
!424 = !DILocation(line: 86, column: 153, scope: !412)
!425 = !DILocalVariable(name: "leftBound", arg: 6, scope: !412, file: !19, line: 86, type: !11)
!426 = !DILocation(line: 86, column: 173, scope: !412)
!427 = !DILocalVariable(name: "rightBound", arg: 7, scope: !412, file: !19, line: 86, type: !11)
!428 = !DILocation(line: 86, column: 196, scope: !412)
!429 = !DILocalVariable(name: "windowHeight", arg: 8, scope: !412, file: !19, line: 86, type: !15)
!430 = !DILocation(line: 86, column: 212, scope: !412)
!431 = !DILocalVariable(name: "windowWidth", arg: 9, scope: !412, file: !19, line: 86, type: !15)
!432 = !DILocation(line: 86, column: 230, scope: !412)
!433 = !DILocalVariable(name: "relX", scope: !412, file: !19, line: 87, type: !11)
!434 = !DILocation(line: 87, column: 15, scope: !412)
!435 = !DILocalVariable(name: "relY", scope: !412, file: !19, line: 87, type: !11)
!436 = !DILocation(line: 87, column: 21, scope: !412)
!437 = !DILocalVariable(name: "y", scope: !438, file: !19, line: 89, type: !15)
!438 = distinct !DILexicalBlock(scope: !412, file: !19, line: 89, column: 3)
!439 = !DILocation(line: 89, column: 11, scope: !438)
!440 = !DILocation(line: 89, column: 7, scope: !438)
!441 = !DILocation(line: 89, column: 18, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !19, line: 89, column: 3)
!443 = !DILocation(line: 89, column: 22, scope: !442)
!444 = !DILocation(line: 89, column: 20, scope: !442)
!445 = !DILocation(line: 89, column: 3, scope: !438)
!446 = !DILocalVariable(name: "x", scope: !447, file: !19, line: 90, type: !15)
!447 = distinct !DILexicalBlock(scope: !448, file: !19, line: 90, column: 5)
!448 = distinct !DILexicalBlock(scope: !442, file: !19, line: 89, column: 40)
!449 = !DILocation(line: 90, column: 13, scope: !447)
!450 = !DILocation(line: 90, column: 9, scope: !447)
!451 = !DILocation(line: 90, column: 20, scope: !452)
!452 = distinct !DILexicalBlock(scope: !447, file: !19, line: 90, column: 5)
!453 = !DILocation(line: 90, column: 24, scope: !452)
!454 = !DILocation(line: 90, column: 22, scope: !452)
!455 = !DILocation(line: 90, column: 5, scope: !447)
!456 = !DILocalVariable(name: "pixel", scope: !457, file: !19, line: 91, type: !5)
!457 = distinct !DILexicalBlock(scope: !452, file: !19, line: 90, column: 41)
!458 = !DILocation(line: 91, column: 22, scope: !457)
!459 = !DILocation(line: 91, column: 31, scope: !457)
!460 = !DILocation(line: 91, column: 39, scope: !457)
!461 = !DILocation(line: 91, column: 42, scope: !457)
!462 = !DILocation(line: 93, column: 14, scope: !457)
!463 = !DILocation(line: 93, column: 21, scope: !457)
!464 = !DILocation(line: 93, column: 12, scope: !457)
!465 = !DILocation(line: 94, column: 14, scope: !457)
!466 = !DILocation(line: 94, column: 21, scope: !457)
!467 = !DILocation(line: 94, column: 12, scope: !457)
!468 = !DILocalVariable(name: "output", scope: !457, file: !19, line: 96, type: !11)
!469 = !DILocation(line: 96, column: 19, scope: !457)
!470 = !DILocation(line: 96, column: 53, scope: !457)
!471 = !DILocation(line: 96, column: 60, scope: !457)
!472 = !DILocation(line: 96, column: 70, scope: !457)
!473 = !DILocation(line: 96, column: 28, scope: !457)
!474 = !DILocation(line: 97, column: 18, scope: !475)
!475 = distinct !DILexicalBlock(scope: !457, file: !19, line: 97, column: 10)
!476 = !DILocation(line: 97, column: 26, scope: !475)
!477 = !DILocation(line: 97, column: 32, scope: !475)
!478 = !DILocation(line: 97, column: 38, scope: !475)
!479 = !DILocation(line: 97, column: 10, scope: !475)
!480 = !DILocation(line: 97, column: 10, scope: !457)
!481 = !DILocation(line: 98, column: 29, scope: !475)
!482 = !DILocation(line: 98, column: 37, scope: !475)
!483 = !DILocation(line: 98, column: 43, scope: !475)
!484 = !DILocation(line: 98, column: 19, scope: !475)
!485 = !DILocation(line: 98, column: 2, scope: !475)
!486 = !DILocation(line: 98, column: 9, scope: !475)
!487 = !DILocation(line: 98, column: 17, scope: !475)
!488 = !DILocation(line: 99, column: 17, scope: !489)
!489 = distinct !DILexicalBlock(scope: !475, file: !19, line: 99, column: 15)
!490 = !DILocation(line: 99, column: 24, scope: !489)
!491 = !DILocation(line: 99, column: 105, scope: !489)
!492 = !DILocation(line: 99, column: 32, scope: !489)
!493 = !DILocation(line: 99, column: 39, scope: !489)
!494 = !DILocation(line: 99, column: 45, scope: !489)
!495 = !DILocation(line: 99, column: 37, scope: !489)
!496 = !DILocation(line: 99, column: 48, scope: !489)
!497 = !DILocation(line: 99, column: 51, scope: !489)
!498 = !DILocation(line: 99, column: 58, scope: !489)
!499 = !DILocation(line: 99, column: 56, scope: !489)
!500 = !DILocation(line: 99, column: 16, scope: !489)
!501 = !DILocation(line: 99, column: 69, scope: !489)
!502 = !DILocation(line: 99, column: 77, scope: !489)
!503 = !DILocation(line: 99, column: 76, scope: !489)
!504 = !DILocation(line: 99, column: 83, scope: !489)
!505 = !DILocation(line: 99, column: 74, scope: !489)
!506 = !DILocation(line: 99, column: 86, scope: !489)
!507 = !DILocation(line: 99, column: 89, scope: !489)
!508 = !DILocation(line: 99, column: 96, scope: !489)
!509 = !DILocation(line: 99, column: 94, scope: !489)
!510 = !DILocation(line: 99, column: 109, scope: !489)
!511 = !DILocation(line: 99, column: 116, scope: !489)
!512 = !DILocation(line: 99, column: 114, scope: !489)
!513 = !DILocation(line: 99, column: 126, scope: !489)
!514 = !DILocation(line: 99, column: 129, scope: !489)
!515 = !DILocation(line: 99, column: 136, scope: !489)
!516 = !DILocation(line: 99, column: 134, scope: !489)
!517 = !DILocation(line: 99, column: 15, scope: !475)
!518 = !DILocation(line: 100, column: 2, scope: !489)
!519 = !DILocation(line: 100, column: 9, scope: !489)
!520 = !DILocation(line: 100, column: 17, scope: !489)
!521 = !DILocation(line: 101, column: 5, scope: !457)
!522 = !DILocation(line: 90, column: 38, scope: !452)
!523 = !DILocation(line: 90, column: 5, scope: !452)
!524 = distinct !{!524, !455, !525, !99}
!525 = !DILocation(line: 101, column: 5, scope: !447)
!526 = !DILocation(line: 102, column: 3, scope: !448)
!527 = !DILocation(line: 89, column: 37, scope: !442)
!528 = !DILocation(line: 89, column: 3, scope: !442)
!529 = distinct !{!529, !445, !530, !99}
!530 = !DILocation(line: 102, column: 3, scope: !438)
!531 = !DILocation(line: 103, column: 1, scope: !412)
!532 = distinct !DISubprogram(name: "drawLine", scope: !19, file: !19, line: 105, type: !533, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!533 = !DISubroutineType(types: !534)
!534 = !{null, !62, !340, !331, !11, !11, !15, !15}
!535 = !DILocalVariable(name: "display", arg: 1, scope: !532, file: !19, line: 105, type: !62)
!536 = !DILocation(line: 105, column: 31, scope: !532)
!537 = !DILocalVariable(name: "dataFunc", arg: 2, scope: !532, file: !19, line: 105, type: !340)
!538 = !DILocation(line: 105, column: 57, scope: !532)
!539 = !DILocalVariable(name: "arena", arg: 3, scope: !532, file: !19, line: 105, type: !331)
!540 = !DILocation(line: 105, column: 112, scope: !532)
!541 = !DILocalVariable(name: "xSteps", arg: 4, scope: !532, file: !19, line: 105, type: !11)
!542 = !DILocation(line: 105, column: 131, scope: !532)
!543 = !DILocalVariable(name: "ySteps", arg: 5, scope: !532, file: !19, line: 105, type: !11)
!544 = !DILocation(line: 105, column: 151, scope: !532)
!545 = !DILocalVariable(name: "windowHeight", arg: 6, scope: !532, file: !19, line: 105, type: !15)
!546 = !DILocation(line: 105, column: 163, scope: !532)
!547 = !DILocalVariable(name: "windowWidth", arg: 7, scope: !532, file: !19, line: 105, type: !15)
!548 = !DILocation(line: 105, column: 181, scope: !532)
!549 = !DILocalVariable(name: "relX", scope: !532, file: !19, line: 106, type: !11)
!550 = !DILocation(line: 106, column: 15, scope: !532)
!551 = !DILocalVariable(name: "relY", scope: !532, file: !19, line: 106, type: !11)
!552 = !DILocation(line: 106, column: 21, scope: !532)
!553 = !DILocalVariable(name: "y", scope: !554, file: !19, line: 108, type: !15)
!554 = distinct !DILexicalBlock(scope: !532, file: !19, line: 108, column: 5)
!555 = !DILocation(line: 108, column: 13, scope: !554)
!556 = !DILocation(line: 108, column: 9, scope: !554)
!557 = !DILocation(line: 108, column: 21, scope: !558)
!558 = distinct !DILexicalBlock(scope: !554, file: !19, line: 108, column: 5)
!559 = !DILocation(line: 108, column: 25, scope: !558)
!560 = !DILocation(line: 108, column: 23, scope: !558)
!561 = !DILocation(line: 108, column: 5, scope: !554)
!562 = !DILocalVariable(name: "x", scope: !563, file: !19, line: 109, type: !15)
!563 = distinct !DILexicalBlock(scope: !564, file: !19, line: 109, column: 9)
!564 = distinct !DILexicalBlock(scope: !558, file: !19, line: 108, column: 45)
!565 = !DILocation(line: 109, column: 17, scope: !563)
!566 = !DILocation(line: 109, column: 13, scope: !563)
!567 = !DILocation(line: 109, column: 25, scope: !568)
!568 = distinct !DILexicalBlock(scope: !563, file: !19, line: 109, column: 9)
!569 = !DILocation(line: 109, column: 29, scope: !568)
!570 = !DILocation(line: 109, column: 27, scope: !568)
!571 = !DILocation(line: 109, column: 9, scope: !563)
!572 = !DILocalVariable(name: "pixel", scope: !573, file: !19, line: 110, type: !5)
!573 = distinct !DILexicalBlock(scope: !568, file: !19, line: 109, column: 48)
!574 = !DILocation(line: 110, column: 28, scope: !573)
!575 = !DILocation(line: 110, column: 37, scope: !573)
!576 = !DILocation(line: 110, column: 45, scope: !573)
!577 = !DILocation(line: 110, column: 48, scope: !573)
!578 = !DILocation(line: 111, column: 20, scope: !573)
!579 = !DILocation(line: 111, column: 29, scope: !573)
!580 = !DILocation(line: 111, column: 18, scope: !573)
!581 = !DILocation(line: 112, column: 20, scope: !573)
!582 = !DILocation(line: 112, column: 29, scope: !573)
!583 = !DILocation(line: 112, column: 18, scope: !573)
!584 = !DILocalVariable(name: "output", scope: !573, file: !19, line: 114, type: !11)
!585 = !DILocation(line: 114, column: 25, scope: !573)
!586 = !DILocation(line: 114, column: 59, scope: !573)
!587 = !DILocation(line: 114, column: 66, scope: !573)
!588 = !DILocation(line: 114, column: 76, scope: !573)
!589 = !DILocation(line: 114, column: 34, scope: !573)
!590 = !DILocation(line: 115, column: 24, scope: !591)
!591 = distinct !DILexicalBlock(scope: !573, file: !19, line: 115, column: 16)
!592 = !DILocation(line: 115, column: 32, scope: !591)
!593 = !DILocation(line: 115, column: 38, scope: !591)
!594 = !DILocation(line: 115, column: 44, scope: !591)
!595 = !DILocation(line: 115, column: 16, scope: !591)
!596 = !DILocation(line: 115, column: 16, scope: !573)
!597 = !DILocation(line: 116, column: 35, scope: !591)
!598 = !DILocation(line: 116, column: 43, scope: !591)
!599 = !DILocation(line: 116, column: 49, scope: !591)
!600 = !DILocation(line: 116, column: 25, scope: !591)
!601 = !DILocation(line: 116, column: 8, scope: !591)
!602 = !DILocation(line: 116, column: 15, scope: !591)
!603 = !DILocation(line: 116, column: 23, scope: !591)
!604 = !DILocation(line: 117, column: 9, scope: !573)
!605 = !DILocation(line: 109, column: 44, scope: !568)
!606 = !DILocation(line: 109, column: 9, scope: !568)
!607 = distinct !{!607, !571, !608, !99}
!608 = !DILocation(line: 117, column: 9, scope: !563)
!609 = !DILocation(line: 118, column: 5, scope: !564)
!610 = !DILocation(line: 108, column: 41, scope: !558)
!611 = !DILocation(line: 108, column: 5, scope: !558)
!612 = distinct !{!612, !561, !613, !99}
!613 = !DILocation(line: 118, column: 5, scope: !554)
!614 = !DILocation(line: 119, column: 1, scope: !532)
!615 = distinct !DISubprogram(name: "drawPlane", scope: !19, file: !19, line: 121, type: !616, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!616 = !DISubroutineType(types: !617)
!617 = !{null, !62, !11, !11, !15, !15}
!618 = !DILocalVariable(name: "display", arg: 1, scope: !615, file: !19, line: 121, type: !62)
!619 = !DILocation(line: 121, column: 32, scope: !615)
!620 = !DILocalVariable(name: "xSteps", arg: 2, scope: !615, file: !19, line: 121, type: !11)
!621 = !DILocation(line: 121, column: 53, scope: !615)
!622 = !DILocalVariable(name: "ySteps", arg: 3, scope: !615, file: !19, line: 121, type: !11)
!623 = !DILocation(line: 121, column: 73, scope: !615)
!624 = !DILocalVariable(name: "windowHeight", arg: 4, scope: !615, file: !19, line: 121, type: !15)
!625 = !DILocation(line: 121, column: 85, scope: !615)
!626 = !DILocalVariable(name: "windowWidth", arg: 5, scope: !615, file: !19, line: 121, type: !15)
!627 = !DILocation(line: 121, column: 103, scope: !615)
!628 = !DILocalVariable(name: "relX", scope: !615, file: !19, line: 122, type: !11)
!629 = !DILocation(line: 122, column: 15, scope: !615)
!630 = !DILocalVariable(name: "relY", scope: !615, file: !19, line: 122, type: !11)
!631 = !DILocation(line: 122, column: 21, scope: !615)
!632 = !DILocalVariable(name: "y", scope: !633, file: !19, line: 123, type: !15)
!633 = distinct !DILexicalBlock(scope: !615, file: !19, line: 123, column: 5)
!634 = !DILocation(line: 123, column: 13, scope: !633)
!635 = !DILocation(line: 123, column: 9, scope: !633)
!636 = !DILocation(line: 123, column: 20, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !19, line: 123, column: 5)
!638 = !DILocation(line: 123, column: 24, scope: !637)
!639 = !DILocation(line: 123, column: 22, scope: !637)
!640 = !DILocation(line: 123, column: 5, scope: !633)
!641 = !DILocalVariable(name: "x", scope: !642, file: !19, line: 124, type: !15)
!642 = distinct !DILexicalBlock(scope: !643, file: !19, line: 124, column: 9)
!643 = distinct !DILexicalBlock(scope: !637, file: !19, line: 123, column: 43)
!644 = !DILocation(line: 124, column: 17, scope: !642)
!645 = !DILocation(line: 124, column: 13, scope: !642)
!646 = !DILocation(line: 124, column: 24, scope: !647)
!647 = distinct !DILexicalBlock(scope: !642, file: !19, line: 124, column: 9)
!648 = !DILocation(line: 124, column: 28, scope: !647)
!649 = !DILocation(line: 124, column: 26, scope: !647)
!650 = !DILocation(line: 124, column: 9, scope: !642)
!651 = !DILocalVariable(name: "pixel", scope: !652, file: !19, line: 125, type: !5)
!652 = distinct !DILexicalBlock(scope: !647, file: !19, line: 124, column: 46)
!653 = !DILocation(line: 125, column: 28, scope: !652)
!654 = !DILocation(line: 125, column: 37, scope: !652)
!655 = !DILocation(line: 125, column: 45, scope: !652)
!656 = !DILocation(line: 125, column: 48, scope: !652)
!657 = !DILocation(line: 126, column: 20, scope: !652)
!658 = !DILocation(line: 126, column: 27, scope: !652)
!659 = !DILocation(line: 126, column: 18, scope: !652)
!660 = !DILocation(line: 127, column: 20, scope: !652)
!661 = !DILocation(line: 127, column: 27, scope: !652)
!662 = !DILocation(line: 127, column: 18, scope: !652)
!663 = !DILocalVariable(name: "xZero", scope: !652, file: !19, line: 129, type: !44)
!664 = !DILocation(line: 129, column: 18, scope: !652)
!665 = !DILocation(line: 129, column: 34, scope: !652)
!666 = !DILocation(line: 129, column: 43, scope: !652)
!667 = !DILocation(line: 129, column: 49, scope: !652)
!668 = !DILocation(line: 129, column: 26, scope: !652)
!669 = !DILocalVariable(name: "yZero", scope: !652, file: !19, line: 130, type: !44)
!670 = !DILocation(line: 130, column: 18, scope: !652)
!671 = !DILocation(line: 130, column: 34, scope: !652)
!672 = !DILocation(line: 130, column: 43, scope: !652)
!673 = !DILocation(line: 130, column: 49, scope: !652)
!674 = !DILocation(line: 130, column: 26, scope: !652)
!675 = !DILocalVariable(name: "origin", scope: !652, file: !19, line: 131, type: !44)
!676 = !DILocation(line: 131, column: 18, scope: !652)
!677 = !DILocation(line: 131, column: 27, scope: !652)
!678 = !DILocation(line: 131, column: 33, scope: !652)
!679 = !DILocation(line: 131, column: 36, scope: !652)
!680 = !DILocation(line: 0, scope: !652)
!681 = !DILocation(line: 133, column: 16, scope: !682)
!682 = distinct !DILexicalBlock(scope: !652, file: !19, line: 133, column: 16)
!683 = !DILocation(line: 133, column: 16, scope: !652)
!684 = !DILocation(line: 134, column: 17, scope: !682)
!685 = !DILocation(line: 134, column: 26, scope: !682)
!686 = !DILocation(line: 134, column: 34, scope: !682)
!687 = !DILocation(line: 135, column: 21, scope: !688)
!688 = distinct !DILexicalBlock(scope: !682, file: !19, line: 135, column: 21)
!689 = !DILocation(line: 135, column: 21, scope: !682)
!690 = !DILocation(line: 136, column: 17, scope: !688)
!691 = !DILocation(line: 136, column: 26, scope: !688)
!692 = !DILocation(line: 136, column: 34, scope: !688)
!693 = !DILocation(line: 137, column: 21, scope: !694)
!694 = distinct !DILexicalBlock(scope: !688, file: !19, line: 137, column: 21)
!695 = !DILocation(line: 137, column: 21, scope: !688)
!696 = !DILocation(line: 138, column: 17, scope: !694)
!697 = !DILocation(line: 138, column: 26, scope: !694)
!698 = !DILocation(line: 138, column: 34, scope: !694)
!699 = !DILocation(line: 140, column: 17, scope: !694)
!700 = !DILocation(line: 140, column: 26, scope: !694)
!701 = !DILocation(line: 140, column: 34, scope: !694)
!702 = !DILocation(line: 141, column: 9, scope: !652)
!703 = !DILocation(line: 124, column: 42, scope: !647)
!704 = !DILocation(line: 124, column: 9, scope: !647)
!705 = distinct !{!705, !650, !706, !99}
!706 = !DILocation(line: 141, column: 9, scope: !642)
!707 = !DILocation(line: 142, column: 5, scope: !643)
!708 = !DILocation(line: 123, column: 39, scope: !637)
!709 = !DILocation(line: 123, column: 5, scope: !637)
!710 = distinct !{!710, !640, !711, !99}
!711 = !DILocation(line: 142, column: 5, scope: !633)
!712 = !DILocation(line: 143, column: 1, scope: !615)
!713 = distinct !DISubprogram(name: "clearDisplay", scope: !19, file: !19, line: 145, type: !714, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!714 = !DISubroutineType(types: !715)
!715 = !{null, !62, !15}
!716 = !DILocalVariable(name: "display", arg: 1, scope: !713, file: !19, line: 145, type: !62)
!717 = !DILocation(line: 145, column: 35, scope: !713)
!718 = !DILocalVariable(name: "windowHeight", arg: 2, scope: !713, file: !19, line: 145, type: !15)
!719 = !DILocation(line: 145, column: 48, scope: !713)
!720 = !DILocalVariable(name: "i", scope: !721, file: !19, line: 146, type: !15)
!721 = distinct !DILexicalBlock(scope: !713, file: !19, line: 146, column: 3)
!722 = !DILocation(line: 146, column: 11, scope: !721)
!723 = !DILocation(line: 146, column: 7, scope: !721)
!724 = !DILocation(line: 146, column: 18, scope: !725)
!725 = distinct !DILexicalBlock(scope: !721, file: !19, line: 146, column: 3)
!726 = !DILocation(line: 146, column: 22, scope: !725)
!727 = !DILocation(line: 146, column: 20, scope: !725)
!728 = !DILocation(line: 146, column: 3, scope: !721)
!729 = !DILocation(line: 147, column: 10, scope: !730)
!730 = distinct !DILexicalBlock(scope: !725, file: !19, line: 146, column: 40)
!731 = !DILocation(line: 147, column: 18, scope: !730)
!732 = !DILocation(line: 147, column: 5, scope: !730)
!733 = !DILocation(line: 148, column: 3, scope: !730)
!734 = !DILocation(line: 146, column: 37, scope: !725)
!735 = !DILocation(line: 146, column: 3, scope: !725)
!736 = distinct !{!736, !728, !737, !99}
!737 = !DILocation(line: 148, column: 3, scope: !721)
!738 = !DILocation(line: 149, column: 8, scope: !713)
!739 = !DILocation(line: 149, column: 3, scope: !713)
!740 = !DILocation(line: 150, column: 1, scope: !713)
!741 = distinct !DISubprogram(name: "drawGraph", scope: !19, file: !19, line: 152, type: !742, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!742 = !DISubroutineType(types: !743)
!743 = !{!44, !331, !15, !15, !15, !340}
!744 = !DILocalVariable(name: "arena", arg: 1, scope: !741, file: !19, line: 152, type: !331)
!745 = !DILocation(line: 152, column: 30, scope: !741)
!746 = !DILocalVariable(name: "begin", arg: 2, scope: !741, file: !19, line: 152, type: !15)
!747 = !DILocation(line: 152, column: 41, scope: !741)
!748 = !DILocalVariable(name: "end", arg: 3, scope: !741, file: !19, line: 152, type: !15)
!749 = !DILocation(line: 152, column: 52, scope: !741)
!750 = !DILocalVariable(name: "byAmount", arg: 4, scope: !741, file: !19, line: 152, type: !15)
!751 = !DILocation(line: 152, column: 61, scope: !741)
!752 = !DILocalVariable(name: "valFunc", arg: 5, scope: !741, file: !19, line: 152, type: !340)
!753 = !DILocation(line: 152, column: 88, scope: !741)
!754 = !DILocalVariable(name: "w", scope: !741, file: !19, line: 153, type: !755)
!755 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "winsize", file: !756, line: 27, size: 64, elements: !757)
!756 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", directory: "", checksumkind: CSK_MD5, checksum: "e4532523603b53f47b871df94bc3d482")
!757 = !{!758, !760, !761, !762}
!758 = !DIDerivedType(tag: DW_TAG_member, name: "ws_row", scope: !755, file: !756, line: 29, baseType: !759, size: 16)
!759 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!760 = !DIDerivedType(tag: DW_TAG_member, name: "ws_col", scope: !755, file: !756, line: 30, baseType: !759, size: 16, offset: 16)
!761 = !DIDerivedType(tag: DW_TAG_member, name: "ws_xpixel", scope: !755, file: !756, line: 31, baseType: !759, size: 16, offset: 32)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "ws_ypixel", scope: !755, file: !756, line: 32, baseType: !759, size: 16, offset: 48)
!763 = !DILocation(line: 153, column: 18, scope: !741)
!764 = !DILocation(line: 156, column: 7, scope: !765)
!765 = distinct !DILexicalBlock(scope: !741, file: !19, line: 156, column: 7)
!766 = !DILocation(line: 156, column: 44, scope: !765)
!767 = !DILocation(line: 156, column: 7, scope: !741)
!768 = !DILocation(line: 157, column: 7, scope: !769)
!769 = distinct !DILexicalBlock(scope: !765, file: !19, line: 156, column: 51)
!770 = !DILocation(line: 158, column: 7, scope: !769)
!771 = !DILocalVariable(name: "display", scope: !741, file: !19, line: 161, type: !62)
!772 = !DILocation(line: 161, column: 19, scope: !741)
!773 = !DILocation(line: 161, column: 43, scope: !741)
!774 = !DILocation(line: 161, column: 53, scope: !741)
!775 = !DILocation(line: 161, column: 63, scope: !741)
!776 = !DILocation(line: 161, column: 76, scope: !741)
!777 = !DILocation(line: 161, column: 74, scope: !741)
!778 = !DILocation(line: 161, column: 86, scope: !741)
!779 = !DILocation(line: 161, column: 84, scope: !741)
!780 = !DILocation(line: 161, column: 29, scope: !741)
!781 = !DILocation(line: 162, column: 13, scope: !741)
!782 = !DILocation(line: 162, column: 22, scope: !741)
!783 = !DILocation(line: 162, column: 32, scope: !741)
!784 = !DILocation(line: 162, column: 44, scope: !741)
!785 = !DILocation(line: 162, column: 42, scope: !741)
!786 = !DILocation(line: 162, column: 54, scope: !741)
!787 = !DILocation(line: 162, column: 52, scope: !741)
!788 = !DILocation(line: 162, column: 3, scope: !741)
!789 = !DILocation(line: 163, column: 12, scope: !741)
!790 = !DILocation(line: 163, column: 21, scope: !741)
!791 = !DILocation(line: 163, column: 30, scope: !741)
!792 = !DILocation(line: 163, column: 37, scope: !741)
!793 = !DILocation(line: 163, column: 47, scope: !741)
!794 = !DILocation(line: 163, column: 59, scope: !741)
!795 = !DILocation(line: 163, column: 57, scope: !741)
!796 = !DILocation(line: 163, column: 69, scope: !741)
!797 = !DILocation(line: 163, column: 67, scope: !741)
!798 = !DILocation(line: 163, column: 3, scope: !741)
!799 = !DILocation(line: 164, column: 14, scope: !741)
!800 = !DILocation(line: 164, column: 25, scope: !741)
!801 = !DILocation(line: 164, column: 23, scope: !741)
!802 = !DILocation(line: 164, column: 35, scope: !741)
!803 = !DILocation(line: 164, column: 33, scope: !741)
!804 = !DILocation(line: 164, column: 3, scope: !741)
!805 = !DILocation(line: 165, column: 16, scope: !741)
!806 = !DILocation(line: 165, column: 27, scope: !741)
!807 = !DILocation(line: 165, column: 25, scope: !741)
!808 = !DILocation(line: 165, column: 3, scope: !741)
!809 = !DILocation(line: 166, column: 3, scope: !741)
!810 = !DILocation(line: 167, column: 1, scope: !741)
