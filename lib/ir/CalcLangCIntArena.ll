; ModuleID = '/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCIntArena.c'
source_filename = "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCIntArena.c"
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
define dso_local ptr @arenaInit(i32 noundef %0) #0 !dbg !43 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %4, metadata !49, metadata !DIExpression()), !dbg !50
  %5 = call noalias ptr @malloc(i64 noundef 16) #7, !dbg !51
  store ptr %5, ptr %4, align 8, !dbg !50
  %6 = load ptr, ptr %4, align 8, !dbg !52
  %7 = icmp eq ptr %6, null, !dbg !54
  br i1 %7, label %8, label %9, !dbg !55

8:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #8, !dbg !56
  store ptr null, ptr %2, align 8, !dbg !58
  br label %28, !dbg !58

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !59
  %11 = zext i32 %10 to i64, !dbg !59
  %12 = call noalias ptr @malloc(i64 noundef %11) #7, !dbg !60
  %13 = load ptr, ptr %4, align 8, !dbg !61
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 0, !dbg !62
  store ptr %12, ptr %14, align 8, !dbg !63
  %15 = load ptr, ptr %4, align 8, !dbg !64
  %16 = getelementptr inbounds %struct.LLVMIntArena, ptr %15, i32 0, i32 0, !dbg !66
  %17 = load ptr, ptr %16, align 8, !dbg !66
  %18 = icmp eq ptr %17, null, !dbg !67
  br i1 %18, label %19, label %21, !dbg !68

19:                                               ; preds = %9
  call void @perror(ptr noundef @.str.1) #8, !dbg !69
  %20 = load ptr, ptr %4, align 8, !dbg !71
  call void @free(ptr noundef %20) #9, !dbg !72
  store ptr null, ptr %2, align 8, !dbg !73
  br label %28, !dbg !73

21:                                               ; preds = %9
  %22 = load i32, ptr %3, align 4, !dbg !74
  %23 = load ptr, ptr %4, align 8, !dbg !75
  %24 = getelementptr inbounds %struct.LLVMIntArena, ptr %23, i32 0, i32 1, !dbg !76
  store i32 %22, ptr %24, align 8, !dbg !77
  %25 = load ptr, ptr %4, align 8, !dbg !78
  %26 = getelementptr inbounds %struct.LLVMIntArena, ptr %25, i32 0, i32 2, !dbg !79
  store i32 0, ptr %26, align 4, !dbg !80
  %27 = load ptr, ptr %4, align 8, !dbg !81
  store ptr %27, ptr %2, align 8, !dbg !82
  br label %28, !dbg !82

28:                                               ; preds = %21, %19, %8
  %29 = load ptr, ptr %2, align 8, !dbg !83
  ret ptr %29, !dbg !83
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
define dso_local ptr @arenaAlloc(ptr noundef %0, i32 noundef %1) #0 !dbg !84 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !89, metadata !DIExpression()), !dbg !90
  %7 = load ptr, ptr %4, align 8, !dbg !91
  %8 = icmp eq ptr %7, null, !dbg !93
  br i1 %8, label %9, label %12, !dbg !94

9:                                                ; preds = %2
  %10 = load ptr, ptr @stderr, align 8, !dbg !95
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.2), !dbg !97
  store ptr null, ptr %3, align 8, !dbg !98
  br label %54, !dbg !98

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !99
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 2, !dbg !101
  %15 = load i32, ptr %14, align 4, !dbg !101
  %16 = load i32, ptr %5, align 4, !dbg !102
  %17 = add nsw i32 %15, %16, !dbg !103
  %18 = load ptr, ptr %4, align 8, !dbg !104
  %19 = getelementptr inbounds %struct.LLVMIntArena, ptr %18, i32 0, i32 1, !dbg !105
  %20 = load i32, ptr %19, align 8, !dbg !105
  %21 = icmp ugt i32 %17, %20, !dbg !106
  br i1 %21, label %22, label %34, !dbg !107

22:                                               ; preds = %12
  %23 = load ptr, ptr @stderr, align 8, !dbg !108
  %24 = load i32, ptr %5, align 4, !dbg !110
  %25 = load ptr, ptr %4, align 8, !dbg !111
  %26 = getelementptr inbounds %struct.LLVMIntArena, ptr %25, i32 0, i32 1, !dbg !112
  %27 = load i32, ptr %26, align 8, !dbg !112
  %28 = load ptr, ptr %4, align 8, !dbg !113
  %29 = getelementptr inbounds %struct.LLVMIntArena, ptr %28, i32 0, i32 2, !dbg !114
  %30 = load i32, ptr %29, align 4, !dbg !114
  %31 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.3, i32 noundef %24, i32 noundef %27, i32 noundef %30), !dbg !115
  %32 = load ptr, ptr @stdout, align 8, !dbg !116
  %33 = call i32 @fflush(ptr noundef %32), !dbg !117
  store ptr null, ptr %3, align 8, !dbg !118
  br label %54, !dbg !118

34:                                               ; preds = %12
  call void @llvm.dbg.declare(metadata ptr %6, metadata !119, metadata !DIExpression()), !dbg !120
  %35 = load ptr, ptr %4, align 8, !dbg !121
  %36 = getelementptr inbounds %struct.LLVMIntArena, ptr %35, i32 0, i32 0, !dbg !122
  %37 = load ptr, ptr %36, align 8, !dbg !122
  %38 = load ptr, ptr %4, align 8, !dbg !123
  %39 = getelementptr inbounds %struct.LLVMIntArena, ptr %38, i32 0, i32 2, !dbg !124
  %40 = load i32, ptr %39, align 4, !dbg !124
  %41 = sext i32 %40 to i64, !dbg !125
  %42 = getelementptr inbounds i8, ptr %37, i64 %41, !dbg !125
  store ptr %42, ptr %6, align 8, !dbg !120
  %43 = load i32, ptr %5, align 4, !dbg !126
  %44 = load ptr, ptr %4, align 8, !dbg !127
  %45 = getelementptr inbounds %struct.LLVMIntArena, ptr %44, i32 0, i32 2, !dbg !128
  %46 = load i32, ptr %45, align 4, !dbg !129
  %47 = add nsw i32 %46, %43, !dbg !129
  store i32 %47, ptr %45, align 4, !dbg !129
  %48 = load ptr, ptr @stdout, align 8, !dbg !130
  %49 = call i32 @fflush(ptr noundef %48), !dbg !131
  %50 = load ptr, ptr %6, align 8, !dbg !132
  %51 = load i32, ptr %5, align 4, !dbg !133
  %52 = sext i32 %51 to i64, !dbg !133
  call void @llvm.memset.p0.i64(ptr align 1 %50, i8 0, i64 %52, i1 false), !dbg !134
  %53 = load ptr, ptr %6, align 8, !dbg !135
  store ptr %53, ptr %3, align 8, !dbg !136
  br label %54, !dbg !136

54:                                               ; preds = %34, %22, %9
  %55 = load ptr, ptr %3, align 8, !dbg !137
  ret ptr %55, !dbg !137
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @fflush(ptr noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaReset(ptr noundef %0) #0 !dbg !138 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !141, metadata !DIExpression()), !dbg !142
  %3 = load ptr, ptr %2, align 8, !dbg !143
  %4 = icmp ne ptr %3, null, !dbg !145
  br i1 %4, label %5, label %8, !dbg !146

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8, !dbg !147
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 2, !dbg !149
  store i32 0, ptr %7, align 4, !dbg !150
  br label %8, !dbg !151

8:                                                ; preds = %5, %1
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaFree(ptr noundef %0) #0 !dbg !153 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !154, metadata !DIExpression()), !dbg !155
  %3 = load ptr, ptr %2, align 8, !dbg !156
  %4 = icmp ne ptr %3, null, !dbg !158
  br i1 %4, label %5, label %10, !dbg !159

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8, !dbg !160
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 0, !dbg !162
  %8 = load ptr, ptr %7, align 8, !dbg !162
  call void @free(ptr noundef %8) #9, !dbg !163
  %9 = load ptr, ptr %2, align 8, !dbg !164
  call void @free(ptr noundef %9) #9, !dbg !165
  br label %10, !dbg !166

10:                                               ; preds = %5, %1
  ret void, !dbg !167
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
!llvm.module.flags = !{!35, !36, !37, !38, !39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "lib/src/c/CalcLangCIntArena.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "7beb23931fa6004c901346541d4eee42")
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
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !20, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !21, globals: !34, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "/home/jabauer/source/repos/CalcLangFinal/lib/src/c/CalcLangCIntArena.c", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "7beb23931fa6004c901346541d4eee42")
!21 = !{!22, !33, !28}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "LLVMIntArena", file: !24, line: 8, baseType: !25)
!24 = !DIFile(filename: "lib/include/c/CalcLangCIntArena.h", directory: "/home/jabauer/source/repos/CalcLangFinal", checksumkind: CSK_MD5, checksum: "205daf9486d6d3e4b8030cae0ecc1481")
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "LLVMIntArena", file: !24, line: 4, size: 128, elements: !26)
!26 = !{!27, !29, !31}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !25, file: !24, line: 5, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !25, file: !24, line: 6, baseType: !30, size: 32, offset: 64)
!30 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !25, file: !24, line: 7, baseType: !32, size: 32, offset: 96)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !{!0, !7, !9, !14}
!35 = !{i32 7, !"Dwarf Version", i32 5}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{i32 8, !"PIC Level", i32 2}
!39 = !{i32 7, !"PIE Level", i32 2}
!40 = !{i32 7, !"uwtable", i32 2}
!41 = !{i32 7, !"frame-pointer", i32 2}
!42 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!43 = distinct !DISubprogram(name: "arenaInit", scope: !2, file: !2, line: 7, type: !44, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !46)
!44 = !DISubroutineType(types: !45)
!45 = !{!22, !30}
!46 = !{}
!47 = !DILocalVariable(name: "capacity", arg: 1, scope: !43, file: !2, line: 7, type: !30)
!48 = !DILocation(line: 7, column: 38, scope: !43)
!49 = !DILocalVariable(name: "arena", scope: !43, file: !2, line: 8, type: !22)
!50 = !DILocation(line: 8, column: 17, scope: !43)
!51 = !DILocation(line: 8, column: 40, scope: !43)
!52 = !DILocation(line: 9, column: 7, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !2, line: 9, column: 7)
!54 = !DILocation(line: 9, column: 13, scope: !53)
!55 = !DILocation(line: 9, column: 7, scope: !43)
!56 = !DILocation(line: 10, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !2, line: 9, column: 22)
!58 = !DILocation(line: 11, column: 9, scope: !57)
!59 = !DILocation(line: 14, column: 33, scope: !43)
!60 = !DILocation(line: 14, column: 26, scope: !43)
!61 = !DILocation(line: 14, column: 3, scope: !43)
!62 = !DILocation(line: 14, column: 10, scope: !43)
!63 = !DILocation(line: 14, column: 17, scope: !43)
!64 = !DILocation(line: 16, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !43, file: !2, line: 16, column: 7)
!66 = !DILocation(line: 16, column: 14, scope: !65)
!67 = !DILocation(line: 16, column: 21, scope: !65)
!68 = !DILocation(line: 16, column: 7, scope: !43)
!69 = !DILocation(line: 17, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !2, line: 16, column: 30)
!71 = !DILocation(line: 18, column: 13, scope: !70)
!72 = !DILocation(line: 18, column: 8, scope: !70)
!73 = !DILocation(line: 19, column: 8, scope: !70)
!74 = !DILocation(line: 22, column: 22, scope: !43)
!75 = !DILocation(line: 22, column: 4, scope: !43)
!76 = !DILocation(line: 22, column: 11, scope: !43)
!77 = !DILocation(line: 22, column: 20, scope: !43)
!78 = !DILocation(line: 23, column: 4, scope: !43)
!79 = !DILocation(line: 23, column: 11, scope: !43)
!80 = !DILocation(line: 23, column: 18, scope: !43)
!81 = !DILocation(line: 24, column: 11, scope: !43)
!82 = !DILocation(line: 24, column: 4, scope: !43)
!83 = !DILocation(line: 25, column: 1, scope: !43)
!84 = distinct !DISubprogram(name: "arenaAlloc", scope: !2, file: !2, line: 27, type: !85, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !46)
!85 = !DISubroutineType(types: !86)
!86 = !{!33, !22, !32}
!87 = !DILocalVariable(name: "arena", arg: 1, scope: !84, file: !2, line: 27, type: !22)
!88 = !DILocation(line: 27, column: 32, scope: !84)
!89 = !DILocalVariable(name: "size", arg: 2, scope: !84, file: !2, line: 27, type: !32)
!90 = !DILocation(line: 27, column: 43, scope: !84)
!91 = !DILocation(line: 28, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !2, line: 28, column: 9)
!93 = !DILocation(line: 28, column: 15, scope: !92)
!94 = !DILocation(line: 28, column: 9, scope: !84)
!95 = !DILocation(line: 29, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 28, column: 24)
!97 = !DILocation(line: 29, column: 9, scope: !96)
!98 = !DILocation(line: 30, column: 9, scope: !96)
!99 = !DILocation(line: 32, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !84, file: !2, line: 32, column: 9)
!101 = !DILocation(line: 32, column: 16, scope: !100)
!102 = !DILocation(line: 32, column: 25, scope: !100)
!103 = !DILocation(line: 32, column: 23, scope: !100)
!104 = !DILocation(line: 32, column: 32, scope: !100)
!105 = !DILocation(line: 32, column: 39, scope: !100)
!106 = !DILocation(line: 32, column: 30, scope: !100)
!107 = !DILocation(line: 32, column: 9, scope: !84)
!108 = !DILocation(line: 33, column: 15, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !2, line: 32, column: 49)
!110 = !DILocation(line: 33, column: 123, scope: !109)
!111 = !DILocation(line: 33, column: 129, scope: !109)
!112 = !DILocation(line: 33, column: 136, scope: !109)
!113 = !DILocation(line: 33, column: 146, scope: !109)
!114 = !DILocation(line: 33, column: 153, scope: !109)
!115 = !DILocation(line: 33, column: 7, scope: !109)
!116 = !DILocation(line: 34, column: 14, scope: !109)
!117 = !DILocation(line: 34, column: 7, scope: !109)
!118 = !DILocation(line: 35, column: 9, scope: !109)
!119 = !DILocalVariable(name: "ptr", scope: !84, file: !2, line: 38, type: !33)
!120 = !DILocation(line: 38, column: 11, scope: !84)
!121 = !DILocation(line: 38, column: 17, scope: !84)
!122 = !DILocation(line: 38, column: 24, scope: !84)
!123 = !DILocation(line: 38, column: 33, scope: !84)
!124 = !DILocation(line: 38, column: 40, scope: !84)
!125 = !DILocation(line: 38, column: 31, scope: !84)
!126 = !DILocation(line: 39, column: 22, scope: !84)
!127 = !DILocation(line: 39, column: 5, scope: !84)
!128 = !DILocation(line: 39, column: 12, scope: !84)
!129 = !DILocation(line: 39, column: 19, scope: !84)
!130 = !DILocation(line: 40, column: 12, scope: !84)
!131 = !DILocation(line: 40, column: 5, scope: !84)
!132 = !DILocation(line: 41, column: 12, scope: !84)
!133 = !DILocation(line: 41, column: 20, scope: !84)
!134 = !DILocation(line: 41, column: 5, scope: !84)
!135 = !DILocation(line: 42, column: 12, scope: !84)
!136 = !DILocation(line: 42, column: 5, scope: !84)
!137 = !DILocation(line: 43, column: 1, scope: !84)
!138 = distinct !DISubprogram(name: "arenaReset", scope: !2, file: !2, line: 45, type: !139, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !46)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !22}
!141 = !DILocalVariable(name: "arena", arg: 1, scope: !138, file: !2, line: 45, type: !22)
!142 = !DILocation(line: 45, column: 31, scope: !138)
!143 = !DILocation(line: 46, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !2, line: 46, column: 9)
!145 = !DILocation(line: 46, column: 15, scope: !144)
!146 = !DILocation(line: 46, column: 9, scope: !138)
!147 = !DILocation(line: 47, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !2, line: 46, column: 24)
!149 = !DILocation(line: 47, column: 16, scope: !148)
!150 = !DILocation(line: 47, column: 23, scope: !148)
!151 = !DILocation(line: 50, column: 5, scope: !148)
!152 = !DILocation(line: 51, column: 1, scope: !138)
!153 = distinct !DISubprogram(name: "arenaFree", scope: !2, file: !2, line: 53, type: !139, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !46)
!154 = !DILocalVariable(name: "arena", arg: 1, scope: !153, file: !2, line: 53, type: !22)
!155 = !DILocation(line: 53, column: 30, scope: !153)
!156 = !DILocation(line: 54, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !2, line: 54, column: 9)
!158 = !DILocation(line: 54, column: 15, scope: !157)
!159 = !DILocation(line: 54, column: 9, scope: !153)
!160 = !DILocation(line: 55, column: 14, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !2, line: 54, column: 24)
!162 = !DILocation(line: 55, column: 21, scope: !161)
!163 = !DILocation(line: 55, column: 9, scope: !161)
!164 = !DILocation(line: 56, column: 14, scope: !161)
!165 = !DILocation(line: 56, column: 9, scope: !161)
!166 = !DILocation(line: 57, column: 5, scope: !161)
!167 = !DILocation(line: 58, column: 1, scope: !153)
