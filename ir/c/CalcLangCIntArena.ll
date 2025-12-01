; ModuleID = 'src/c/CalcLangCIntArena.c'
source_filename = "src/c/CalcLangCIntArena.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.LLVMIntArena = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [32 x i8] c"Failed to allocate Arena struct\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"Failed to allocate arena buffer\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [37 x i8] c"Error: Arena is NULL in arena_alloc\0A\00", align 1
@.str.3 = private unnamed_addr constant [55 x i8] c"Error: Arena out of memory for allocation of size %zu\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @arenaInit(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  %5 = call noalias ptr @malloc(i64 noundef 16) #6
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #7
  store ptr null, ptr %2, align 8
  br label %28

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = call noalias ptr @malloc(i64 noundef %11) #6
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 0
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.LLVMIntArena, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %21

19:                                               ; preds = %9
  call void @perror(ptr noundef @.str.1) #7
  %20 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %20) #8
  store ptr null, ptr %2, align 8
  br label %28

21:                                               ; preds = %9
  %22 = load i32, ptr %3, align 4
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.LLVMIntArena, ptr %23, i32 0, i32 1
  store i32 %22, ptr %24, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.LLVMIntArena, ptr %25, i32 0, i32 2
  store i32 0, ptr %26, align 4
  %27 = load ptr, ptr %4, align 8
  store ptr %27, ptr %2, align 8
  br label %28

28:                                               ; preds = %21, %19, %8
  %29 = load ptr, ptr %2, align 8
  ret ptr %29
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @arenaAlloc(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr @stderr, align 8
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.2)
  store ptr null, ptr %3, align 8
  br label %44

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.LLVMIntArena, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.LLVMIntArena, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  %21 = icmp sgt i32 %17, %20
  br i1 %21, label %22, label %26

22:                                               ; preds = %12
  %23 = load ptr, ptr @stderr, align 8
  %24 = load i32, ptr %5, align 4
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.3, i32 noundef %24)
  store ptr null, ptr %3, align 8
  br label %44

26:                                               ; preds = %12
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.LLVMIntArena, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.LLVMIntArena, ptr %30, i32 0, i32 2
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %29, i64 %33
  store ptr %34, ptr %6, align 8
  %35 = load i32, ptr %5, align 4
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.LLVMIntArena, ptr %36, i32 0, i32 2
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, %35
  store i32 %39, ptr %37, align 4
  %40 = load ptr, ptr %6, align 8
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %40, i8 0, i64 %42, i1 false)
  %43 = load ptr, ptr %6, align 8
  store ptr %43, ptr %3, align 8
  br label %44

44:                                               ; preds = %26, %22, %9
  %45 = load ptr, ptr %3, align 8
  ret ptr %45
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaReset(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 2
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %5, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @arenaFree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.LLVMIntArena, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %8) #8
  %9 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %9) #8
  br label %10

10:                                               ; preds = %5, %1
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
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
