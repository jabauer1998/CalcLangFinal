; ModuleID = 'src/c/CalcLangCIntArena.c'
source_filename = "src/c/CalcLangCIntArena.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.LLVMIntArena = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [32 x i8] c"Failed to allocate Arena struct\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [32 x i8] c"Failed to allocate arena buffer\00", align 1, !dbg !7
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [37 x i8] c"Error: Arena is NULL in arena_alloc\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [95 x i8] c"Error: Arena out of memory for allocation of size %zu\0A and capacity %d, and current offset %d\0A\00", align 1, !dbg !14
@stdout = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @arenaInit(i32 noundef %0) #0 !dbg !42 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %4, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = call noalias ptr @malloc(i64 noundef 16) #7, !dbg !50
  store ptr %5, ptr %4, align 8, !dbg !49
  %6 = load ptr, ptr %4, align 8, !dbg !51
  %7 = icmp eq ptr %6, null, !dbg !53
  br i1 %7, label %8, label %9, !dbg !54

8:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #8, !dbg !55
  store ptr null, ptr %2, align 8, !dbg !57
  br label %28, !dbg !57

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !58
  %11 = zext i32 %10 to i64, !dbg !58
  %12 = call noalias ptr @malloc(i64 noundef %11) #7, !dbg !59
  %13 = load ptr, ptr %4, align 8, !dbg !60
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 0, !dbg !61
  store ptr %12, ptr %14, align 8, !dbg !62
  %15 = load ptr, ptr %4, align 8, !dbg !63
  %16 = getelementptr inbounds %struct.LLVMIntArena, ptr %15, i32 0, i32 0, !dbg !65
  %17 = load ptr, ptr %16, align 8, !dbg !65
  %18 = icmp eq ptr %17, null, !dbg !66
  br i1 %18, label %19, label %21, !dbg !67

19:                                               ; preds = %9
  call void @perror(ptr noundef @.str.1) #8, !dbg !68
  %20 = load ptr, ptr %4, align 8, !dbg !70
  call void @free(ptr noundef %20) #9, !dbg !71
  store ptr null, ptr %2, align 8, !dbg !72
  br label %28, !dbg !72

21:                                               ; preds = %9
  %22 = load i32, ptr %3, align 4, !dbg !73
  %23 = load ptr, ptr %4, align 8, !dbg !74
  %24 = getelementptr inbounds %struct.LLVMIntArena, ptr %23, i32 0, i32 1, !dbg !75
  store i32 %22, ptr %24, align 8, !dbg !76
  %25 = load ptr, ptr %4, align 8, !dbg !77
  %26 = getelementptr inbounds %struct.LLVMIntArena, ptr %25, i32 0, i32 2, !dbg !78
  store i32 0, ptr %26, align 4, !dbg !79
  %27 = load ptr, ptr %4, align 8, !dbg !80
  store ptr %27, ptr %2, align 8, !dbg !81
  br label %28, !dbg !81

28:                                               ; preds = %21, %19, %8
  %29 = load ptr, ptr %2, align 8, !dbg !82
  ret ptr %29, !dbg !82
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @arenaAlloc(ptr noundef %0, i32 noundef %1) #0 !dbg !83 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !88, metadata !DIExpression()), !dbg !89
  %7 = load ptr, ptr %4, align 8, !dbg !90
  %8 = icmp eq ptr %7, null, !dbg !92
  br i1 %8, label %9, label %12, !dbg !93

9:                                                ; preds = %2
  %10 = load ptr, ptr @stderr, align 8, !dbg !94
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.2), !dbg !96
  store ptr null, ptr %3, align 8, !dbg !97
  br label %54, !dbg !97

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !98
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 2, !dbg !100
  %15 = load i32, ptr %14, align 4, !dbg !100
  %16 = load i32, ptr %5, align 4, !dbg !101
  %17 = add nsw i32 %15, %16, !dbg !102
  %18 = load ptr, ptr %4, align 8, !dbg !103
  %19 = getelementptr inbounds %struct.LLVMIntArena, ptr %18, i32 0, i32 1, !dbg !104
  %20 = load i32, ptr %19, align 8, !dbg !104
  %21 = icmp ugt i32 %17, %20, !dbg !105
  br i1 %21, label %22, label %34, !dbg !106

22:                                               ; preds = %12
  %23 = load ptr, ptr @stderr, align 8, !dbg !107
  %24 = load i32, ptr %5, align 4, !dbg !109
  %25 = load ptr, ptr %4, align 8, !dbg !110
  %26 = getelementptr inbounds %struct.LLVMIntArena, ptr %25, i32 0, i32 1, !dbg !111
  %27 = load i32, ptr %26, align 8, !dbg !111
  %28 = load ptr, ptr %4, align 8, !dbg !112
  %29 = getelementptr inbounds %struct.LLVMIntArena, ptr %28, i32 0, i32 2, !dbg !113
  %30 = load i32, ptr %29, align 4, !dbg !113
  %31 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.3, i32 noundef %24, i32 noundef %27, i32 noundef %30), !dbg !114
  %32 = load ptr, ptr @stdout, align 8, !dbg !115
  %33 = call i32 @fflush(ptr noundef %32), !dbg !116
  store ptr null, ptr %3, align 8, !dbg !117
  br label %54, !dbg !117

34:                                               ; preds = %12
  call void @llvm.dbg.declare(metadata ptr %6, metadata !118, metadata !DIExpression()), !dbg !119
  %35 = load ptr, ptr %4, align 8, !dbg !120
  %36 = getelementptr inbounds %struct.LLVMIntArena, ptr %35, i32 0, i32 0, !dbg !121
  %37 = load ptr, ptr %36, align 8, !dbg !121
  %38 = load ptr, ptr %4, align 8, !dbg !122
  %39 = getelementptr inbounds %struct.LLVMIntArena, ptr %38, i32 0, i32 2, !dbg !123
  %40 = load i32, ptr %39, align 4, !dbg !123
  %41 = sext i32 %40 to i64, !dbg !124
  %42 = getelementptr inbounds i8, ptr %37, i64 %41, !dbg !124
  store ptr %42, ptr %6, align 8, !dbg !119
  %43 = load i32, ptr %5, align 4, !dbg !125
  %44 = load ptr, ptr %4, align 8, !dbg !126
  %45 = getelementptr inbounds %struct.LLVMIntArena, ptr %44, i32 0, i32 2, !dbg !127
  %46 = load i32, ptr %45, align 4, !dbg !128
  %47 = add nsw i32 %46, %43, !dbg !128
  store i32 %47, ptr %45, align 4, !dbg !128
  %48 = load ptr, ptr @stdout, align 8, !dbg !129
  %49 = call i32 @fflush(ptr noundef %48), !dbg !130
  %50 = load ptr, ptr %6, align 8, !dbg !131
  %51 = load i32, ptr %5, align 4, !dbg !132
  %52 = sext i32 %51 to i64, !dbg !132
  call void @llvm.memset.p0.i64(ptr align 1 %50, i8 0, i64 %52, i1 false), !dbg !133
  %53 = load ptr, ptr %6, align 8, !dbg !134
  store ptr %53, ptr %3, align 8, !dbg !135
  br label %54, !dbg !135

54:                                               ; preds = %34, %22, %9
  %55 = load ptr, ptr %3, align 8, !dbg !136
  ret ptr %55, !dbg !136
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @fflush(ptr noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaReset(ptr noundef %0) #0 !dbg !137 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !140, metadata !DIExpression()), !dbg !141
  %3 = load ptr, ptr %2, align 8, !dbg !142
  %4 = icmp ne ptr %3, null, !dbg !144
  br i1 %4, label %5, label %8, !dbg !145

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8, !dbg !146
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 2, !dbg !148
  store i32 0, ptr %7, align 4, !dbg !149
  br label %8, !dbg !150

8:                                                ; preds = %5, %1
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaFree(ptr noundef %0) #0 !dbg !152 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !153, metadata !DIExpression()), !dbg !154
  %3 = load ptr, ptr %2, align 8, !dbg !155
  %4 = icmp ne ptr %3, null, !dbg !157
  br i1 %4, label %5, label %10, !dbg !158

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8, !dbg !159
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 0, !dbg !161
  %8 = load ptr, ptr %7, align 8, !dbg !161
  call void @free(ptr noundef %8) #9, !dbg !162
  %9 = load ptr, ptr %2, align 8, !dbg !163
  call void @free(ptr noundef %9) #9, !dbg !164
  br label %10, !dbg !165

10:                                               ; preds = %5, %1
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { cold }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "src/c/CalcLangCIntArena.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "7beb23931fa6004c901346541d4eee42")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 32)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 17, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 296, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 37)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 760, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 95)
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !20, globals: !33, splitDebugInlining: false, nameTableKind: None)
!20 = !{!21, !32, !27}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !23, line: 8, baseType: !24)
!23 = !DIFile(filename: "include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !23, line: 4, size: 128, elements: !25)
!25 = !{!26, !28, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !24, file: !23, line: 5, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !24, file: !23, line: 6, baseType: !29, size: 32, offset: 64)
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !24, file: !23, line: 7, baseType: !31, size: 32, offset: 96)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!33 = !{!0, !7, !9, !14}
!34 = !{i32 7, !"Dwarf Version", i32 5}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 8, !"PIC Level", i32 2}
!38 = !{i32 7, !"PIE Level", i32 2}
!39 = !{i32 7, !"uwtable", i32 2}
!40 = !{i32 7, !"frame-pointer", i32 2}
!41 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!42 = distinct !DISubprogram(name: "arenaInit", scope: !2, file: !2, line: 7, type: !43, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !45)
!43 = !DISubroutineType(types: !44)
!44 = !{!21, !29}
!45 = !{}
!46 = !DILocalVariable(name: "capacity", arg: 1, scope: !42, file: !2, line: 7, type: !29)
!47 = !DILocation(line: 7, column: 38, scope: !42)
!48 = !DILocalVariable(name: "arena", scope: !42, file: !2, line: 8, type: !21)
!49 = !DILocation(line: 8, column: 17, scope: !42)
!50 = !DILocation(line: 8, column: 40, scope: !42)
!51 = !DILocation(line: 9, column: 7, scope: !52)
!52 = distinct !DILexicalBlock(scope: !42, file: !2, line: 9, column: 7)
!53 = !DILocation(line: 9, column: 13, scope: !52)
!54 = !DILocation(line: 9, column: 7, scope: !42)
!55 = !DILocation(line: 10, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !2, line: 9, column: 22)
!57 = !DILocation(line: 11, column: 9, scope: !56)
!58 = !DILocation(line: 14, column: 33, scope: !42)
!59 = !DILocation(line: 14, column: 26, scope: !42)
!60 = !DILocation(line: 14, column: 3, scope: !42)
!61 = !DILocation(line: 14, column: 10, scope: !42)
!62 = !DILocation(line: 14, column: 17, scope: !42)
!63 = !DILocation(line: 16, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !42, file: !2, line: 16, column: 7)
!65 = !DILocation(line: 16, column: 14, scope: !64)
!66 = !DILocation(line: 16, column: 21, scope: !64)
!67 = !DILocation(line: 16, column: 7, scope: !42)
!68 = !DILocation(line: 17, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !2, line: 16, column: 30)
!70 = !DILocation(line: 18, column: 13, scope: !69)
!71 = !DILocation(line: 18, column: 8, scope: !69)
!72 = !DILocation(line: 19, column: 8, scope: !69)
!73 = !DILocation(line: 22, column: 22, scope: !42)
!74 = !DILocation(line: 22, column: 4, scope: !42)
!75 = !DILocation(line: 22, column: 11, scope: !42)
!76 = !DILocation(line: 22, column: 20, scope: !42)
!77 = !DILocation(line: 23, column: 4, scope: !42)
!78 = !DILocation(line: 23, column: 11, scope: !42)
!79 = !DILocation(line: 23, column: 18, scope: !42)
!80 = !DILocation(line: 24, column: 11, scope: !42)
!81 = !DILocation(line: 24, column: 4, scope: !42)
!82 = !DILocation(line: 25, column: 1, scope: !42)
!83 = distinct !DISubprogram(name: "arenaAlloc", scope: !2, file: !2, line: 27, type: !84, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !45)
!84 = !DISubroutineType(types: !85)
!85 = !{!32, !21, !31}
!86 = !DILocalVariable(name: "arena", arg: 1, scope: !83, file: !2, line: 27, type: !21)
!87 = !DILocation(line: 27, column: 32, scope: !83)
!88 = !DILocalVariable(name: "size", arg: 2, scope: !83, file: !2, line: 27, type: !31)
!89 = !DILocation(line: 27, column: 43, scope: !83)
!90 = !DILocation(line: 28, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !2, line: 28, column: 9)
!92 = !DILocation(line: 28, column: 15, scope: !91)
!93 = !DILocation(line: 28, column: 9, scope: !83)
!94 = !DILocation(line: 29, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !2, line: 28, column: 24)
!96 = !DILocation(line: 29, column: 9, scope: !95)
!97 = !DILocation(line: 30, column: 9, scope: !95)
!98 = !DILocation(line: 32, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !83, file: !2, line: 32, column: 9)
!100 = !DILocation(line: 32, column: 16, scope: !99)
!101 = !DILocation(line: 32, column: 25, scope: !99)
!102 = !DILocation(line: 32, column: 23, scope: !99)
!103 = !DILocation(line: 32, column: 32, scope: !99)
!104 = !DILocation(line: 32, column: 39, scope: !99)
!105 = !DILocation(line: 32, column: 30, scope: !99)
!106 = !DILocation(line: 32, column: 9, scope: !83)
!107 = !DILocation(line: 33, column: 15, scope: !108)
!108 = distinct !DILexicalBlock(scope: !99, file: !2, line: 32, column: 49)
!109 = !DILocation(line: 33, column: 123, scope: !108)
!110 = !DILocation(line: 33, column: 129, scope: !108)
!111 = !DILocation(line: 33, column: 136, scope: !108)
!112 = !DILocation(line: 33, column: 146, scope: !108)
!113 = !DILocation(line: 33, column: 153, scope: !108)
!114 = !DILocation(line: 33, column: 7, scope: !108)
!115 = !DILocation(line: 34, column: 14, scope: !108)
!116 = !DILocation(line: 34, column: 7, scope: !108)
!117 = !DILocation(line: 35, column: 9, scope: !108)
!118 = !DILocalVariable(name: "ptr", scope: !83, file: !2, line: 38, type: !32)
!119 = !DILocation(line: 38, column: 11, scope: !83)
!120 = !DILocation(line: 38, column: 17, scope: !83)
!121 = !DILocation(line: 38, column: 24, scope: !83)
!122 = !DILocation(line: 38, column: 33, scope: !83)
!123 = !DILocation(line: 38, column: 40, scope: !83)
!124 = !DILocation(line: 38, column: 31, scope: !83)
!125 = !DILocation(line: 39, column: 22, scope: !83)
!126 = !DILocation(line: 39, column: 5, scope: !83)
!127 = !DILocation(line: 39, column: 12, scope: !83)
!128 = !DILocation(line: 39, column: 19, scope: !83)
!129 = !DILocation(line: 40, column: 12, scope: !83)
!130 = !DILocation(line: 40, column: 5, scope: !83)
!131 = !DILocation(line: 41, column: 12, scope: !83)
!132 = !DILocation(line: 41, column: 20, scope: !83)
!133 = !DILocation(line: 41, column: 5, scope: !83)
!134 = !DILocation(line: 42, column: 12, scope: !83)
!135 = !DILocation(line: 42, column: 5, scope: !83)
!136 = !DILocation(line: 43, column: 1, scope: !83)
!137 = distinct !DISubprogram(name: "arenaReset", scope: !2, file: !2, line: 45, type: !138, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !45)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !21}
!140 = !DILocalVariable(name: "arena", arg: 1, scope: !137, file: !2, line: 45, type: !21)
!141 = !DILocation(line: 45, column: 31, scope: !137)
!142 = !DILocation(line: 46, column: 9, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !2, line: 46, column: 9)
!144 = !DILocation(line: 46, column: 15, scope: !143)
!145 = !DILocation(line: 46, column: 9, scope: !137)
!146 = !DILocation(line: 47, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !2, line: 46, column: 24)
!148 = !DILocation(line: 47, column: 16, scope: !147)
!149 = !DILocation(line: 47, column: 23, scope: !147)
!150 = !DILocation(line: 50, column: 5, scope: !147)
!151 = !DILocation(line: 51, column: 1, scope: !137)
!152 = distinct !DISubprogram(name: "arenaFree", scope: !2, file: !2, line: 53, type: !138, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !45)
!153 = !DILocalVariable(name: "arena", arg: 1, scope: !152, file: !2, line: 53, type: !21)
!154 = !DILocation(line: 53, column: 30, scope: !152)
!155 = !DILocation(line: 54, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !2, line: 54, column: 9)
!157 = !DILocation(line: 54, column: 15, scope: !156)
!158 = !DILocation(line: 54, column: 9, scope: !152)
!159 = !DILocation(line: 55, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !2, line: 54, column: 24)
!161 = !DILocation(line: 55, column: 21, scope: !160)
!162 = !DILocation(line: 55, column: 9, scope: !160)
!163 = !DILocation(line: 56, column: 14, scope: !160)
!164 = !DILocation(line: 56, column: 9, scope: !160)
!165 = !DILocation(line: 57, column: 5, scope: !160)
!166 = !DILocation(line: 58, column: 1, scope: !152)
