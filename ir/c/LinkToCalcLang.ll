; ModuleID = 'src/c/LinkToCalcLang.c'
source_filename = "src/c/LinkToCalcLang.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CalcLangVal = type { i32, %union.CalcLangValData }
%union.CalcLangValData = type { ptr }
%struct.TupleValue = type { i32, ptr }
%struct.SetValue = type { i32, ptr }

@.str = private unnamed_addr constant [48 x i8] c"Error Tuple sizes in expression do not match!!!\00", align 1
@.str.1 = private unnamed_addr constant [51 x i8] c"Invalid types found for CalcLangAddition Operation\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Mismatched tup for size\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"Invalid type for dot product expected Tuple and Tuple\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Invalid type for not operation\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"Invalid type for negate operation\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"TRUE\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"FALSE\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"$%f\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%f%%\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.18 = private unnamed_addr constant [47 x i8] c"Cant print type for specified CalcLangValue!!!\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @newIntValue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #5
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
define dso_local ptr @newRealValue(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  store double %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 1, ptr %6, align 8
  %7 = load double, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 1
  store double %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @newDollarValue(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  store double %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 3, ptr %6, align 8
  %7 = load double, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 1
  store double %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @newPercentValue(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  store double %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.CalcLangVal, ptr %5, i32 0, i32 0
  store i32 4, ptr %6, align 8
  %7 = load double, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.CalcLangVal, ptr %8, i32 0, i32 1
  store double %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @addCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i32, align 4
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i32, align 4
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i32, align 4
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %67 = load ptr, ptr %6, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %72, label %69

69:                                               ; preds = %4
  %70 = load ptr, ptr %8, align 8
  %71 = icmp eq ptr %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %69, %4
  store ptr null, ptr %5, align 8
  br label %1345

73:                                               ; preds = %69
  %74 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %74, ptr %10, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %96

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %96

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = add nsw i32 %89, %92
  %94 = load ptr, ptr %10, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  store i32 %93, ptr %95, align 8
  br label %1332

96:                                               ; preds = %79, %73
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  %99 = load i32, ptr %98, align 8
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %101, label %118

101:                                              ; preds = %96
  %102 = load ptr, ptr %8, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 0
  %104 = load i32, ptr %103, align 8
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %118

106:                                              ; preds = %101
  %107 = load ptr, ptr %10, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 0
  store i32 1, ptr %108, align 8
  %109 = load ptr, ptr %6, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load double, ptr %110, align 8
  %112 = load ptr, ptr %8, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  %114 = load double, ptr %113, align 8
  %115 = fadd double %111, %114
  %116 = load ptr, ptr %10, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 1
  store double %115, ptr %117, align 8
  br label %1331

118:                                              ; preds = %101, %96
  %119 = load ptr, ptr %6, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %141

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %125, align 8
  %127 = icmp eq i32 %126, 1
  br i1 %127, label %128, label %141

128:                                              ; preds = %123
  %129 = load ptr, ptr %10, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 0
  store i32 1, ptr %130, align 8
  %131 = load ptr, ptr %6, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load i32, ptr %132, align 8
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  %137 = load double, ptr %136, align 8
  %138 = fadd double %134, %137
  %139 = load ptr, ptr %10, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 1
  store double %138, ptr %140, align 8
  br label %1330

141:                                              ; preds = %123, %118
  %142 = load ptr, ptr %6, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = icmp eq i32 %144, 1
  br i1 %145, label %146, label %164

146:                                              ; preds = %141
  %147 = load ptr, ptr %8, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 0
  %149 = load i32, ptr %148, align 8
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %164

151:                                              ; preds = %146
  %152 = load ptr, ptr %10, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 0
  store i32 1, ptr %153, align 8
  %154 = load ptr, ptr %6, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = load ptr, ptr %8, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  %159 = load i32, ptr %158, align 8
  %160 = sitofp i32 %159 to double
  %161 = fadd double %156, %160
  %162 = load ptr, ptr %10, align 8
  %163 = getelementptr inbounds %struct.CalcLangVal, ptr %162, i32 0, i32 1
  store double %161, ptr %163, align 8
  br label %1329

164:                                              ; preds = %146, %141
  %165 = load ptr, ptr %6, align 8
  %166 = getelementptr inbounds %struct.CalcLangVal, ptr %165, i32 0, i32 0
  %167 = load i32, ptr %166, align 8
  %168 = icmp eq i32 %167, 3
  br i1 %168, label %169, label %186

169:                                              ; preds = %164
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 0
  %172 = load i32, ptr %171, align 8
  %173 = icmp eq i32 %172, 3
  br i1 %173, label %174, label %186

174:                                              ; preds = %169
  %175 = load ptr, ptr %10, align 8
  %176 = getelementptr inbounds %struct.CalcLangVal, ptr %175, i32 0, i32 0
  store i32 3, ptr %176, align 8
  %177 = load ptr, ptr %6, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  %179 = load double, ptr %178, align 8
  %180 = load ptr, ptr %8, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  %182 = load double, ptr %181, align 8
  %183 = fadd double %179, %182
  %184 = load ptr, ptr %10, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  store double %183, ptr %185, align 8
  br label %1328

186:                                              ; preds = %169, %164
  %187 = load ptr, ptr %6, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 0
  %189 = load i32, ptr %188, align 8
  %190 = icmp eq i32 %189, 4
  br i1 %190, label %191, label %208

191:                                              ; preds = %186
  %192 = load ptr, ptr %8, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 4
  br i1 %195, label %196, label %208

196:                                              ; preds = %191
  %197 = load ptr, ptr %10, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 0
  store i32 4, ptr %198, align 8
  %199 = load ptr, ptr %6, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  %201 = load double, ptr %200, align 8
  %202 = load ptr, ptr %8, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  %204 = load double, ptr %203, align 8
  %205 = fadd double %201, %204
  %206 = load ptr, ptr %10, align 8
  %207 = getelementptr inbounds %struct.CalcLangVal, ptr %206, i32 0, i32 1
  store double %205, ptr %207, align 8
  br label %1327

208:                                              ; preds = %191, %186
  %209 = load ptr, ptr %6, align 8
  %210 = getelementptr inbounds %struct.CalcLangVal, ptr %209, i32 0, i32 0
  %211 = load i32, ptr %210, align 8
  %212 = icmp eq i32 %211, 7
  br i1 %212, label %213, label %286

213:                                              ; preds = %208
  %214 = load ptr, ptr %8, align 8
  %215 = getelementptr inbounds %struct.CalcLangVal, ptr %214, i32 0, i32 0
  %216 = load i32, ptr %215, align 8
  %217 = icmp eq i32 %216, 7
  br i1 %217, label %218, label %286

218:                                              ; preds = %213
  %219 = load ptr, ptr %6, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 1
  %221 = load ptr, ptr %220, align 8
  store ptr %221, ptr %11, align 8
  %222 = load ptr, ptr %8, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 1
  %224 = load ptr, ptr %223, align 8
  store ptr %224, ptr %12, align 8
  %225 = load ptr, ptr %12, align 8
  %226 = getelementptr inbounds %struct.TupleValue, ptr %225, i32 0, i32 0
  %227 = load i32, ptr %226, align 8
  %228 = load ptr, ptr %11, align 8
  %229 = getelementptr inbounds %struct.TupleValue, ptr %228, i32 0, i32 0
  %230 = load i32, ptr %229, align 8
  %231 = icmp eq i32 %227, %230
  br i1 %231, label %232, label %284

232:                                              ; preds = %218
  %233 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %233, ptr %13, align 8
  %234 = load ptr, ptr %11, align 8
  %235 = getelementptr inbounds %struct.TupleValue, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = load ptr, ptr %13, align 8
  %238 = getelementptr inbounds %struct.TupleValue, ptr %237, i32 0, i32 0
  store i32 %236, ptr %238, align 8
  %239 = load ptr, ptr %13, align 8
  %240 = getelementptr inbounds %struct.TupleValue, ptr %239, i32 0, i32 0
  %241 = load i32, ptr %240, align 8
  %242 = sext i32 %241 to i64
  %243 = mul i64 8, %242
  %244 = call noalias ptr @malloc(i64 noundef %243) #5
  %245 = load ptr, ptr %13, align 8
  %246 = getelementptr inbounds %struct.TupleValue, ptr %245, i32 0, i32 1
  store ptr %244, ptr %246, align 8
  store i32 0, ptr %14, align 4
  br label %247

247:                                              ; preds = %275, %232
  %248 = load i32, ptr %14, align 4
  %249 = load ptr, ptr %11, align 8
  %250 = getelementptr inbounds %struct.TupleValue, ptr %249, i32 0, i32 0
  %251 = load i32, ptr %250, align 8
  %252 = icmp slt i32 %248, %251
  br i1 %252, label %253, label %278

253:                                              ; preds = %247
  %254 = load ptr, ptr %11, align 8
  %255 = getelementptr inbounds %struct.TupleValue, ptr %254, i32 0, i32 1
  %256 = load ptr, ptr %255, align 8
  %257 = load i32, ptr %14, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds ptr, ptr %256, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = load ptr, ptr %12, align 8
  %262 = getelementptr inbounds %struct.TupleValue, ptr %261, i32 0, i32 1
  %263 = load ptr, ptr %262, align 8
  %264 = load i32, ptr %14, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds ptr, ptr %263, i64 %265
  %267 = load ptr, ptr %266, align 8
  %268 = call ptr @addCalcLangValues(ptr noundef %260, i32 noundef 1, ptr noundef %267, i32 noundef 0)
  %269 = load ptr, ptr %13, align 8
  %270 = getelementptr inbounds %struct.TupleValue, ptr %269, i32 0, i32 1
  %271 = load ptr, ptr %270, align 8
  %272 = load i32, ptr %14, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds ptr, ptr %271, i64 %273
  store ptr %268, ptr %274, align 8
  br label %275

275:                                              ; preds = %253
  %276 = load i32, ptr %14, align 4
  %277 = add nsw i32 %276, 1
  store i32 %277, ptr %14, align 4
  br label %247, !llvm.loop !6

278:                                              ; preds = %247
  %279 = load ptr, ptr %10, align 8
  %280 = getelementptr inbounds %struct.CalcLangVal, ptr %279, i32 0, i32 0
  store i32 7, ptr %280, align 8
  %281 = load ptr, ptr %13, align 8
  %282 = load ptr, ptr %10, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 1
  store ptr %281, ptr %283, align 8
  br label %285

284:                                              ; preds = %218
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1345

285:                                              ; preds = %278
  br label %1326

286:                                              ; preds = %213, %208
  %287 = load ptr, ptr %6, align 8
  %288 = getelementptr inbounds %struct.CalcLangVal, ptr %287, i32 0, i32 0
  %289 = load i32, ptr %288, align 8
  %290 = icmp eq i32 %289, 7
  br i1 %290, label %291, label %345

291:                                              ; preds = %286
  %292 = load ptr, ptr %8, align 8
  %293 = getelementptr inbounds %struct.CalcLangVal, ptr %292, i32 0, i32 0
  %294 = load i32, ptr %293, align 8
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %296, label %345

296:                                              ; preds = %291
  %297 = load ptr, ptr %6, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 1
  %299 = load ptr, ptr %298, align 8
  store ptr %299, ptr %15, align 8
  %300 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %300, ptr %16, align 8
  %301 = load ptr, ptr %15, align 8
  %302 = getelementptr inbounds %struct.TupleValue, ptr %301, i32 0, i32 0
  %303 = load i32, ptr %302, align 8
  %304 = load ptr, ptr %16, align 8
  %305 = getelementptr inbounds %struct.TupleValue, ptr %304, i32 0, i32 0
  store i32 %303, ptr %305, align 8
  %306 = load ptr, ptr %16, align 8
  %307 = getelementptr inbounds %struct.TupleValue, ptr %306, i32 0, i32 0
  %308 = load i32, ptr %307, align 8
  %309 = sext i32 %308 to i64
  %310 = mul i64 8, %309
  %311 = call noalias ptr @malloc(i64 noundef %310) #5
  %312 = load ptr, ptr %16, align 8
  %313 = getelementptr inbounds %struct.TupleValue, ptr %312, i32 0, i32 1
  store ptr %311, ptr %313, align 8
  store i32 0, ptr %17, align 4
  br label %314

314:                                              ; preds = %336, %296
  %315 = load i32, ptr %17, align 4
  %316 = load ptr, ptr %15, align 8
  %317 = getelementptr inbounds %struct.TupleValue, ptr %316, i32 0, i32 0
  %318 = load i32, ptr %317, align 8
  %319 = icmp slt i32 %315, %318
  br i1 %319, label %320, label %339

320:                                              ; preds = %314
  %321 = load ptr, ptr %15, align 8
  %322 = getelementptr inbounds %struct.TupleValue, ptr %321, i32 0, i32 1
  %323 = load ptr, ptr %322, align 8
  %324 = load i32, ptr %17, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds ptr, ptr %323, i64 %325
  %327 = load ptr, ptr %326, align 8
  %328 = load ptr, ptr %8, align 8
  %329 = call ptr @addCalcLangValues(ptr noundef %327, i32 noundef 1, ptr noundef %328, i32 noundef 0)
  %330 = load ptr, ptr %16, align 8
  %331 = getelementptr inbounds %struct.TupleValue, ptr %330, i32 0, i32 1
  %332 = load ptr, ptr %331, align 8
  %333 = load i32, ptr %17, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds ptr, ptr %332, i64 %334
  store ptr %329, ptr %335, align 8
  br label %336

336:                                              ; preds = %320
  %337 = load i32, ptr %17, align 4
  %338 = add nsw i32 %337, 1
  store i32 %338, ptr %17, align 4
  br label %314, !llvm.loop !8

339:                                              ; preds = %314
  %340 = load ptr, ptr %10, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 0
  store i32 7, ptr %341, align 8
  %342 = load ptr, ptr %16, align 8
  %343 = load ptr, ptr %10, align 8
  %344 = getelementptr inbounds %struct.CalcLangVal, ptr %343, i32 0, i32 1
  store ptr %342, ptr %344, align 8
  br label %1325

345:                                              ; preds = %291, %286
  %346 = load ptr, ptr %6, align 8
  %347 = getelementptr inbounds %struct.CalcLangVal, ptr %346, i32 0, i32 0
  %348 = load i32, ptr %347, align 8
  %349 = icmp eq i32 %348, 0
  br i1 %349, label %350, label %404

350:                                              ; preds = %345
  %351 = load ptr, ptr %8, align 8
  %352 = getelementptr inbounds %struct.CalcLangVal, ptr %351, i32 0, i32 0
  %353 = load i32, ptr %352, align 8
  %354 = icmp eq i32 %353, 7
  br i1 %354, label %355, label %404

355:                                              ; preds = %350
  %356 = load ptr, ptr %8, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load ptr, ptr %357, align 8
  store ptr %358, ptr %18, align 8
  %359 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %359, ptr %19, align 8
  %360 = load ptr, ptr %18, align 8
  %361 = getelementptr inbounds %struct.TupleValue, ptr %360, i32 0, i32 0
  %362 = load i32, ptr %361, align 8
  %363 = load ptr, ptr %19, align 8
  %364 = getelementptr inbounds %struct.TupleValue, ptr %363, i32 0, i32 0
  store i32 %362, ptr %364, align 8
  %365 = load ptr, ptr %19, align 8
  %366 = getelementptr inbounds %struct.TupleValue, ptr %365, i32 0, i32 0
  %367 = load i32, ptr %366, align 8
  %368 = sext i32 %367 to i64
  %369 = mul i64 8, %368
  %370 = call noalias ptr @malloc(i64 noundef %369) #5
  %371 = load ptr, ptr %19, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 1
  store ptr %370, ptr %372, align 8
  store i32 0, ptr %20, align 4
  br label %373

373:                                              ; preds = %395, %355
  %374 = load i32, ptr %20, align 4
  %375 = load ptr, ptr %18, align 8
  %376 = getelementptr inbounds %struct.TupleValue, ptr %375, i32 0, i32 0
  %377 = load i32, ptr %376, align 8
  %378 = icmp slt i32 %374, %377
  br i1 %378, label %379, label %398

379:                                              ; preds = %373
  %380 = load ptr, ptr %6, align 8
  %381 = load ptr, ptr %18, align 8
  %382 = getelementptr inbounds %struct.TupleValue, ptr %381, i32 0, i32 1
  %383 = load ptr, ptr %382, align 8
  %384 = load i32, ptr %20, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds ptr, ptr %383, i64 %385
  %387 = load ptr, ptr %386, align 8
  %388 = call ptr @addCalcLangValues(ptr noundef %380, i32 noundef 0, ptr noundef %387, i32 noundef 1)
  %389 = load ptr, ptr %19, align 8
  %390 = getelementptr inbounds %struct.TupleValue, ptr %389, i32 0, i32 1
  %391 = load ptr, ptr %390, align 8
  %392 = load i32, ptr %20, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds ptr, ptr %391, i64 %393
  store ptr %388, ptr %394, align 8
  br label %395

395:                                              ; preds = %379
  %396 = load i32, ptr %20, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, ptr %20, align 4
  br label %373, !llvm.loop !9

398:                                              ; preds = %373
  %399 = load ptr, ptr %10, align 8
  %400 = getelementptr inbounds %struct.CalcLangVal, ptr %399, i32 0, i32 0
  store i32 7, ptr %400, align 8
  %401 = load ptr, ptr %19, align 8
  %402 = load ptr, ptr %10, align 8
  %403 = getelementptr inbounds %struct.CalcLangVal, ptr %402, i32 0, i32 1
  store ptr %401, ptr %403, align 8
  br label %1324

404:                                              ; preds = %350, %345
  %405 = load ptr, ptr %6, align 8
  %406 = getelementptr inbounds %struct.CalcLangVal, ptr %405, i32 0, i32 0
  %407 = load i32, ptr %406, align 8
  %408 = icmp eq i32 %407, 7
  br i1 %408, label %409, label %463

409:                                              ; preds = %404
  %410 = load ptr, ptr %8, align 8
  %411 = getelementptr inbounds %struct.CalcLangVal, ptr %410, i32 0, i32 0
  %412 = load i32, ptr %411, align 8
  %413 = icmp eq i32 %412, 1
  br i1 %413, label %414, label %463

414:                                              ; preds = %409
  %415 = load ptr, ptr %6, align 8
  %416 = getelementptr inbounds %struct.CalcLangVal, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  store ptr %417, ptr %21, align 8
  %418 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %418, ptr %22, align 8
  %419 = load ptr, ptr %21, align 8
  %420 = getelementptr inbounds %struct.TupleValue, ptr %419, i32 0, i32 0
  %421 = load i32, ptr %420, align 8
  %422 = load ptr, ptr %22, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 0
  store i32 %421, ptr %423, align 8
  %424 = load ptr, ptr %22, align 8
  %425 = getelementptr inbounds %struct.TupleValue, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = sext i32 %426 to i64
  %428 = mul i64 8, %427
  %429 = call noalias ptr @malloc(i64 noundef %428) #5
  %430 = load ptr, ptr %22, align 8
  %431 = getelementptr inbounds %struct.TupleValue, ptr %430, i32 0, i32 1
  store ptr %429, ptr %431, align 8
  store i32 0, ptr %23, align 4
  br label %432

432:                                              ; preds = %454, %414
  %433 = load i32, ptr %23, align 4
  %434 = load ptr, ptr %21, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  %436 = load i32, ptr %435, align 8
  %437 = icmp slt i32 %433, %436
  br i1 %437, label %438, label %457

438:                                              ; preds = %432
  %439 = load ptr, ptr %21, align 8
  %440 = getelementptr inbounds %struct.TupleValue, ptr %439, i32 0, i32 1
  %441 = load ptr, ptr %440, align 8
  %442 = load i32, ptr %23, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds ptr, ptr %441, i64 %443
  %445 = load ptr, ptr %444, align 8
  %446 = load ptr, ptr %8, align 8
  %447 = call ptr @addCalcLangValues(ptr noundef %445, i32 noundef 1, ptr noundef %446, i32 noundef 0)
  %448 = load ptr, ptr %22, align 8
  %449 = getelementptr inbounds %struct.TupleValue, ptr %448, i32 0, i32 1
  %450 = load ptr, ptr %449, align 8
  %451 = load i32, ptr %23, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds ptr, ptr %450, i64 %452
  store ptr %447, ptr %453, align 8
  br label %454

454:                                              ; preds = %438
  %455 = load i32, ptr %23, align 4
  %456 = add nsw i32 %455, 1
  store i32 %456, ptr %23, align 4
  br label %432, !llvm.loop !10

457:                                              ; preds = %432
  %458 = load ptr, ptr %10, align 8
  %459 = getelementptr inbounds %struct.CalcLangVal, ptr %458, i32 0, i32 0
  store i32 7, ptr %459, align 8
  %460 = load ptr, ptr %22, align 8
  %461 = load ptr, ptr %10, align 8
  %462 = getelementptr inbounds %struct.CalcLangVal, ptr %461, i32 0, i32 1
  store ptr %460, ptr %462, align 8
  br label %1323

463:                                              ; preds = %409, %404
  %464 = load ptr, ptr %6, align 8
  %465 = getelementptr inbounds %struct.CalcLangVal, ptr %464, i32 0, i32 0
  %466 = load i32, ptr %465, align 8
  %467 = icmp eq i32 %466, 1
  br i1 %467, label %468, label %522

468:                                              ; preds = %463
  %469 = load ptr, ptr %8, align 8
  %470 = getelementptr inbounds %struct.CalcLangVal, ptr %469, i32 0, i32 0
  %471 = load i32, ptr %470, align 8
  %472 = icmp eq i32 %471, 7
  br i1 %472, label %473, label %522

473:                                              ; preds = %468
  %474 = load ptr, ptr %8, align 8
  %475 = getelementptr inbounds %struct.CalcLangVal, ptr %474, i32 0, i32 1
  %476 = load ptr, ptr %475, align 8
  store ptr %476, ptr %24, align 8
  %477 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %477, ptr %25, align 8
  %478 = load ptr, ptr %24, align 8
  %479 = getelementptr inbounds %struct.TupleValue, ptr %478, i32 0, i32 0
  %480 = load i32, ptr %479, align 8
  %481 = load ptr, ptr %25, align 8
  %482 = getelementptr inbounds %struct.TupleValue, ptr %481, i32 0, i32 0
  store i32 %480, ptr %482, align 8
  %483 = load ptr, ptr %25, align 8
  %484 = getelementptr inbounds %struct.TupleValue, ptr %483, i32 0, i32 0
  %485 = load i32, ptr %484, align 8
  %486 = sext i32 %485 to i64
  %487 = mul i64 8, %486
  %488 = call noalias ptr @malloc(i64 noundef %487) #5
  %489 = load ptr, ptr %25, align 8
  %490 = getelementptr inbounds %struct.TupleValue, ptr %489, i32 0, i32 1
  store ptr %488, ptr %490, align 8
  store i32 0, ptr %26, align 4
  br label %491

491:                                              ; preds = %513, %473
  %492 = load i32, ptr %26, align 4
  %493 = load ptr, ptr %24, align 8
  %494 = getelementptr inbounds %struct.TupleValue, ptr %493, i32 0, i32 0
  %495 = load i32, ptr %494, align 8
  %496 = icmp slt i32 %492, %495
  br i1 %496, label %497, label %516

497:                                              ; preds = %491
  %498 = load ptr, ptr %6, align 8
  %499 = load ptr, ptr %24, align 8
  %500 = getelementptr inbounds %struct.TupleValue, ptr %499, i32 0, i32 1
  %501 = load ptr, ptr %500, align 8
  %502 = load i32, ptr %26, align 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds ptr, ptr %501, i64 %503
  %505 = load ptr, ptr %504, align 8
  %506 = call ptr @addCalcLangValues(ptr noundef %498, i32 noundef 0, ptr noundef %505, i32 noundef 1)
  %507 = load ptr, ptr %25, align 8
  %508 = getelementptr inbounds %struct.TupleValue, ptr %507, i32 0, i32 1
  %509 = load ptr, ptr %508, align 8
  %510 = load i32, ptr %26, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds ptr, ptr %509, i64 %511
  store ptr %506, ptr %512, align 8
  br label %513

513:                                              ; preds = %497
  %514 = load i32, ptr %26, align 4
  %515 = add nsw i32 %514, 1
  store i32 %515, ptr %26, align 4
  br label %491, !llvm.loop !11

516:                                              ; preds = %491
  %517 = load ptr, ptr %10, align 8
  %518 = getelementptr inbounds %struct.CalcLangVal, ptr %517, i32 0, i32 0
  store i32 7, ptr %518, align 8
  %519 = load ptr, ptr %25, align 8
  %520 = load ptr, ptr %10, align 8
  %521 = getelementptr inbounds %struct.CalcLangVal, ptr %520, i32 0, i32 1
  store ptr %519, ptr %521, align 8
  br label %1322

522:                                              ; preds = %468, %463
  %523 = load ptr, ptr %6, align 8
  %524 = getelementptr inbounds %struct.CalcLangVal, ptr %523, i32 0, i32 0
  %525 = load i32, ptr %524, align 8
  %526 = icmp eq i32 %525, 7
  br i1 %526, label %527, label %581

527:                                              ; preds = %522
  %528 = load ptr, ptr %8, align 8
  %529 = getelementptr inbounds %struct.CalcLangVal, ptr %528, i32 0, i32 0
  %530 = load i32, ptr %529, align 8
  %531 = icmp eq i32 %530, 3
  br i1 %531, label %532, label %581

532:                                              ; preds = %527
  %533 = load ptr, ptr %6, align 8
  %534 = getelementptr inbounds %struct.CalcLangVal, ptr %533, i32 0, i32 1
  %535 = load ptr, ptr %534, align 8
  store ptr %535, ptr %27, align 8
  %536 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %536, ptr %28, align 8
  %537 = load ptr, ptr %27, align 8
  %538 = getelementptr inbounds %struct.TupleValue, ptr %537, i32 0, i32 0
  %539 = load i32, ptr %538, align 8
  %540 = load ptr, ptr %28, align 8
  %541 = getelementptr inbounds %struct.TupleValue, ptr %540, i32 0, i32 0
  store i32 %539, ptr %541, align 8
  %542 = load ptr, ptr %28, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = sext i32 %544 to i64
  %546 = mul i64 8, %545
  %547 = call noalias ptr @malloc(i64 noundef %546) #5
  %548 = load ptr, ptr %28, align 8
  %549 = getelementptr inbounds %struct.TupleValue, ptr %548, i32 0, i32 1
  store ptr %547, ptr %549, align 8
  store i32 0, ptr %29, align 4
  br label %550

550:                                              ; preds = %572, %532
  %551 = load i32, ptr %29, align 4
  %552 = load ptr, ptr %27, align 8
  %553 = getelementptr inbounds %struct.TupleValue, ptr %552, i32 0, i32 0
  %554 = load i32, ptr %553, align 8
  %555 = icmp slt i32 %551, %554
  br i1 %555, label %556, label %575

556:                                              ; preds = %550
  %557 = load ptr, ptr %27, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 1
  %559 = load ptr, ptr %558, align 8
  %560 = load i32, ptr %29, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds ptr, ptr %559, i64 %561
  %563 = load ptr, ptr %562, align 8
  %564 = load ptr, ptr %8, align 8
  %565 = call ptr @addCalcLangValues(ptr noundef %563, i32 noundef 1, ptr noundef %564, i32 noundef 0)
  %566 = load ptr, ptr %28, align 8
  %567 = getelementptr inbounds %struct.TupleValue, ptr %566, i32 0, i32 1
  %568 = load ptr, ptr %567, align 8
  %569 = load i32, ptr %29, align 4
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds ptr, ptr %568, i64 %570
  store ptr %565, ptr %571, align 8
  br label %572

572:                                              ; preds = %556
  %573 = load i32, ptr %29, align 4
  %574 = add nsw i32 %573, 1
  store i32 %574, ptr %29, align 4
  br label %550, !llvm.loop !12

575:                                              ; preds = %550
  %576 = load ptr, ptr %10, align 8
  %577 = getelementptr inbounds %struct.CalcLangVal, ptr %576, i32 0, i32 0
  store i32 7, ptr %577, align 8
  %578 = load ptr, ptr %28, align 8
  %579 = load ptr, ptr %10, align 8
  %580 = getelementptr inbounds %struct.CalcLangVal, ptr %579, i32 0, i32 1
  store ptr %578, ptr %580, align 8
  br label %1321

581:                                              ; preds = %527, %522
  %582 = load ptr, ptr %6, align 8
  %583 = getelementptr inbounds %struct.CalcLangVal, ptr %582, i32 0, i32 0
  %584 = load i32, ptr %583, align 8
  %585 = icmp eq i32 %584, 3
  br i1 %585, label %586, label %640

586:                                              ; preds = %581
  %587 = load ptr, ptr %8, align 8
  %588 = getelementptr inbounds %struct.CalcLangVal, ptr %587, i32 0, i32 0
  %589 = load i32, ptr %588, align 8
  %590 = icmp eq i32 %589, 7
  br i1 %590, label %591, label %640

591:                                              ; preds = %586
  %592 = load ptr, ptr %8, align 8
  %593 = getelementptr inbounds %struct.CalcLangVal, ptr %592, i32 0, i32 1
  %594 = load ptr, ptr %593, align 8
  store ptr %594, ptr %30, align 8
  %595 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %595, ptr %31, align 8
  %596 = load ptr, ptr %30, align 8
  %597 = getelementptr inbounds %struct.TupleValue, ptr %596, i32 0, i32 0
  %598 = load i32, ptr %597, align 8
  %599 = load ptr, ptr %31, align 8
  %600 = getelementptr inbounds %struct.TupleValue, ptr %599, i32 0, i32 0
  store i32 %598, ptr %600, align 8
  %601 = load ptr, ptr %31, align 8
  %602 = getelementptr inbounds %struct.TupleValue, ptr %601, i32 0, i32 0
  %603 = load i32, ptr %602, align 8
  %604 = sext i32 %603 to i64
  %605 = mul i64 8, %604
  %606 = call noalias ptr @malloc(i64 noundef %605) #5
  %607 = load ptr, ptr %31, align 8
  %608 = getelementptr inbounds %struct.TupleValue, ptr %607, i32 0, i32 1
  store ptr %606, ptr %608, align 8
  store i32 0, ptr %32, align 4
  br label %609

609:                                              ; preds = %631, %591
  %610 = load i32, ptr %32, align 4
  %611 = load ptr, ptr %30, align 8
  %612 = getelementptr inbounds %struct.TupleValue, ptr %611, i32 0, i32 0
  %613 = load i32, ptr %612, align 8
  %614 = icmp slt i32 %610, %613
  br i1 %614, label %615, label %634

615:                                              ; preds = %609
  %616 = load ptr, ptr %6, align 8
  %617 = load ptr, ptr %30, align 8
  %618 = getelementptr inbounds %struct.TupleValue, ptr %617, i32 0, i32 1
  %619 = load ptr, ptr %618, align 8
  %620 = load i32, ptr %32, align 4
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds ptr, ptr %619, i64 %621
  %623 = load ptr, ptr %622, align 8
  %624 = call ptr @addCalcLangValues(ptr noundef %616, i32 noundef 0, ptr noundef %623, i32 noundef 1)
  %625 = load ptr, ptr %31, align 8
  %626 = getelementptr inbounds %struct.TupleValue, ptr %625, i32 0, i32 1
  %627 = load ptr, ptr %626, align 8
  %628 = load i32, ptr %32, align 4
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds ptr, ptr %627, i64 %629
  store ptr %624, ptr %630, align 8
  br label %631

631:                                              ; preds = %615
  %632 = load i32, ptr %32, align 4
  %633 = add nsw i32 %632, 1
  store i32 %633, ptr %32, align 4
  br label %609, !llvm.loop !13

634:                                              ; preds = %609
  %635 = load ptr, ptr %10, align 8
  %636 = getelementptr inbounds %struct.CalcLangVal, ptr %635, i32 0, i32 0
  store i32 7, ptr %636, align 8
  %637 = load ptr, ptr %31, align 8
  %638 = load ptr, ptr %10, align 8
  %639 = getelementptr inbounds %struct.CalcLangVal, ptr %638, i32 0, i32 1
  store ptr %637, ptr %639, align 8
  br label %1320

640:                                              ; preds = %586, %581
  %641 = load ptr, ptr %6, align 8
  %642 = getelementptr inbounds %struct.CalcLangVal, ptr %641, i32 0, i32 0
  %643 = load i32, ptr %642, align 8
  %644 = icmp eq i32 %643, 7
  br i1 %644, label %645, label %699

645:                                              ; preds = %640
  %646 = load ptr, ptr %8, align 8
  %647 = getelementptr inbounds %struct.CalcLangVal, ptr %646, i32 0, i32 0
  %648 = load i32, ptr %647, align 8
  %649 = icmp eq i32 %648, 4
  br i1 %649, label %650, label %699

650:                                              ; preds = %645
  %651 = load ptr, ptr %6, align 8
  %652 = getelementptr inbounds %struct.CalcLangVal, ptr %651, i32 0, i32 1
  %653 = load ptr, ptr %652, align 8
  store ptr %653, ptr %33, align 8
  %654 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %654, ptr %34, align 8
  %655 = load ptr, ptr %33, align 8
  %656 = getelementptr inbounds %struct.TupleValue, ptr %655, i32 0, i32 0
  %657 = load i32, ptr %656, align 8
  %658 = load ptr, ptr %34, align 8
  %659 = getelementptr inbounds %struct.TupleValue, ptr %658, i32 0, i32 0
  store i32 %657, ptr %659, align 8
  %660 = load ptr, ptr %34, align 8
  %661 = getelementptr inbounds %struct.TupleValue, ptr %660, i32 0, i32 0
  %662 = load i32, ptr %661, align 8
  %663 = sext i32 %662 to i64
  %664 = mul i64 8, %663
  %665 = call noalias ptr @malloc(i64 noundef %664) #5
  %666 = load ptr, ptr %34, align 8
  %667 = getelementptr inbounds %struct.TupleValue, ptr %666, i32 0, i32 1
  store ptr %665, ptr %667, align 8
  store i32 0, ptr %35, align 4
  br label %668

668:                                              ; preds = %690, %650
  %669 = load i32, ptr %35, align 4
  %670 = load ptr, ptr %33, align 8
  %671 = getelementptr inbounds %struct.TupleValue, ptr %670, i32 0, i32 0
  %672 = load i32, ptr %671, align 8
  %673 = icmp slt i32 %669, %672
  br i1 %673, label %674, label %693

674:                                              ; preds = %668
  %675 = load ptr, ptr %33, align 8
  %676 = getelementptr inbounds %struct.TupleValue, ptr %675, i32 0, i32 1
  %677 = load ptr, ptr %676, align 8
  %678 = load i32, ptr %35, align 4
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds ptr, ptr %677, i64 %679
  %681 = load ptr, ptr %680, align 8
  %682 = load ptr, ptr %8, align 8
  %683 = call ptr @addCalcLangValues(ptr noundef %681, i32 noundef 1, ptr noundef %682, i32 noundef 0)
  %684 = load ptr, ptr %34, align 8
  %685 = getelementptr inbounds %struct.TupleValue, ptr %684, i32 0, i32 1
  %686 = load ptr, ptr %685, align 8
  %687 = load i32, ptr %35, align 4
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds ptr, ptr %686, i64 %688
  store ptr %683, ptr %689, align 8
  br label %690

690:                                              ; preds = %674
  %691 = load i32, ptr %35, align 4
  %692 = add nsw i32 %691, 1
  store i32 %692, ptr %35, align 4
  br label %668, !llvm.loop !14

693:                                              ; preds = %668
  %694 = load ptr, ptr %10, align 8
  %695 = getelementptr inbounds %struct.CalcLangVal, ptr %694, i32 0, i32 0
  store i32 7, ptr %695, align 8
  %696 = load ptr, ptr %34, align 8
  %697 = load ptr, ptr %10, align 8
  %698 = getelementptr inbounds %struct.CalcLangVal, ptr %697, i32 0, i32 1
  store ptr %696, ptr %698, align 8
  br label %1319

699:                                              ; preds = %645, %640
  %700 = load ptr, ptr %6, align 8
  %701 = getelementptr inbounds %struct.CalcLangVal, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = icmp eq i32 %702, 4
  br i1 %703, label %704, label %758

704:                                              ; preds = %699
  %705 = load ptr, ptr %8, align 8
  %706 = getelementptr inbounds %struct.CalcLangVal, ptr %705, i32 0, i32 0
  %707 = load i32, ptr %706, align 8
  %708 = icmp eq i32 %707, 7
  br i1 %708, label %709, label %758

709:                                              ; preds = %704
  %710 = load ptr, ptr %8, align 8
  %711 = getelementptr inbounds %struct.CalcLangVal, ptr %710, i32 0, i32 1
  %712 = load ptr, ptr %711, align 8
  store ptr %712, ptr %36, align 8
  %713 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %713, ptr %37, align 8
  %714 = load ptr, ptr %36, align 8
  %715 = getelementptr inbounds %struct.TupleValue, ptr %714, i32 0, i32 0
  %716 = load i32, ptr %715, align 8
  %717 = load ptr, ptr %37, align 8
  %718 = getelementptr inbounds %struct.TupleValue, ptr %717, i32 0, i32 0
  store i32 %716, ptr %718, align 8
  %719 = load ptr, ptr %37, align 8
  %720 = getelementptr inbounds %struct.TupleValue, ptr %719, i32 0, i32 0
  %721 = load i32, ptr %720, align 8
  %722 = sext i32 %721 to i64
  %723 = mul i64 8, %722
  %724 = call noalias ptr @malloc(i64 noundef %723) #5
  %725 = load ptr, ptr %37, align 8
  %726 = getelementptr inbounds %struct.TupleValue, ptr %725, i32 0, i32 1
  store ptr %724, ptr %726, align 8
  store i32 0, ptr %38, align 4
  br label %727

727:                                              ; preds = %749, %709
  %728 = load i32, ptr %38, align 4
  %729 = load ptr, ptr %36, align 8
  %730 = getelementptr inbounds %struct.TupleValue, ptr %729, i32 0, i32 0
  %731 = load i32, ptr %730, align 8
  %732 = icmp slt i32 %728, %731
  br i1 %732, label %733, label %752

733:                                              ; preds = %727
  %734 = load ptr, ptr %6, align 8
  %735 = load ptr, ptr %36, align 8
  %736 = getelementptr inbounds %struct.TupleValue, ptr %735, i32 0, i32 1
  %737 = load ptr, ptr %736, align 8
  %738 = load i32, ptr %38, align 4
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds ptr, ptr %737, i64 %739
  %741 = load ptr, ptr %740, align 8
  %742 = call ptr @addCalcLangValues(ptr noundef %734, i32 noundef 0, ptr noundef %741, i32 noundef 1)
  %743 = load ptr, ptr %37, align 8
  %744 = getelementptr inbounds %struct.TupleValue, ptr %743, i32 0, i32 1
  %745 = load ptr, ptr %744, align 8
  %746 = load i32, ptr %38, align 4
  %747 = sext i32 %746 to i64
  %748 = getelementptr inbounds ptr, ptr %745, i64 %747
  store ptr %742, ptr %748, align 8
  br label %749

749:                                              ; preds = %733
  %750 = load i32, ptr %38, align 4
  %751 = add nsw i32 %750, 1
  store i32 %751, ptr %38, align 4
  br label %727, !llvm.loop !15

752:                                              ; preds = %727
  %753 = load ptr, ptr %10, align 8
  %754 = getelementptr inbounds %struct.CalcLangVal, ptr %753, i32 0, i32 0
  store i32 7, ptr %754, align 8
  %755 = load ptr, ptr %37, align 8
  %756 = load ptr, ptr %10, align 8
  %757 = getelementptr inbounds %struct.CalcLangVal, ptr %756, i32 0, i32 1
  store ptr %755, ptr %757, align 8
  br label %1318

758:                                              ; preds = %704, %699
  %759 = load ptr, ptr %6, align 8
  %760 = getelementptr inbounds %struct.CalcLangVal, ptr %759, i32 0, i32 0
  %761 = load i32, ptr %760, align 8
  %762 = icmp eq i32 %761, 6
  br i1 %762, label %763, label %836

763:                                              ; preds = %758
  %764 = load ptr, ptr %8, align 8
  %765 = getelementptr inbounds %struct.CalcLangVal, ptr %764, i32 0, i32 0
  %766 = load i32, ptr %765, align 8
  %767 = icmp eq i32 %766, 6
  br i1 %767, label %768, label %836

768:                                              ; preds = %763
  %769 = load ptr, ptr %6, align 8
  %770 = getelementptr inbounds %struct.CalcLangVal, ptr %769, i32 0, i32 1
  %771 = load ptr, ptr %770, align 8
  store ptr %771, ptr %39, align 8
  %772 = load ptr, ptr %8, align 8
  %773 = getelementptr inbounds %struct.CalcLangVal, ptr %772, i32 0, i32 1
  %774 = load ptr, ptr %773, align 8
  store ptr %774, ptr %40, align 8
  %775 = load ptr, ptr %40, align 8
  %776 = getelementptr inbounds %struct.SetValue, ptr %775, i32 0, i32 0
  %777 = load i32, ptr %776, align 8
  %778 = load ptr, ptr %39, align 8
  %779 = getelementptr inbounds %struct.SetValue, ptr %778, i32 0, i32 0
  %780 = load i32, ptr %779, align 8
  %781 = icmp eq i32 %777, %780
  br i1 %781, label %782, label %834

782:                                              ; preds = %768
  %783 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %783, ptr %41, align 8
  %784 = load ptr, ptr %39, align 8
  %785 = getelementptr inbounds %struct.SetValue, ptr %784, i32 0, i32 0
  %786 = load i32, ptr %785, align 8
  %787 = load ptr, ptr %41, align 8
  %788 = getelementptr inbounds %struct.SetValue, ptr %787, i32 0, i32 0
  store i32 %786, ptr %788, align 8
  %789 = load ptr, ptr %41, align 8
  %790 = getelementptr inbounds %struct.SetValue, ptr %789, i32 0, i32 0
  %791 = load i32, ptr %790, align 8
  %792 = sext i32 %791 to i64
  %793 = mul i64 8, %792
  %794 = call noalias ptr @malloc(i64 noundef %793) #5
  %795 = load ptr, ptr %41, align 8
  %796 = getelementptr inbounds %struct.SetValue, ptr %795, i32 0, i32 1
  store ptr %794, ptr %796, align 8
  store i32 0, ptr %42, align 4
  br label %797

797:                                              ; preds = %825, %782
  %798 = load i32, ptr %42, align 4
  %799 = load ptr, ptr %39, align 8
  %800 = getelementptr inbounds %struct.SetValue, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = icmp slt i32 %798, %801
  br i1 %802, label %803, label %828

803:                                              ; preds = %797
  %804 = load ptr, ptr %39, align 8
  %805 = getelementptr inbounds %struct.SetValue, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  %807 = load i32, ptr %42, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds ptr, ptr %806, i64 %808
  %810 = load ptr, ptr %809, align 8
  %811 = load ptr, ptr %40, align 8
  %812 = getelementptr inbounds %struct.SetValue, ptr %811, i32 0, i32 1
  %813 = load ptr, ptr %812, align 8
  %814 = load i32, ptr %42, align 4
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds ptr, ptr %813, i64 %815
  %817 = load ptr, ptr %816, align 8
  %818 = call ptr @addCalcLangValues(ptr noundef %810, i32 noundef 1, ptr noundef %817, i32 noundef 1)
  %819 = load ptr, ptr %41, align 8
  %820 = getelementptr inbounds %struct.SetValue, ptr %819, i32 0, i32 1
  %821 = load ptr, ptr %820, align 8
  %822 = load i32, ptr %42, align 4
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds ptr, ptr %821, i64 %823
  store ptr %818, ptr %824, align 8
  br label %825

825:                                              ; preds = %803
  %826 = load i32, ptr %42, align 4
  %827 = add nsw i32 %826, 1
  store i32 %827, ptr %42, align 4
  br label %797, !llvm.loop !16

828:                                              ; preds = %797
  %829 = load ptr, ptr %10, align 8
  %830 = getelementptr inbounds %struct.CalcLangVal, ptr %829, i32 0, i32 0
  store i32 6, ptr %830, align 8
  %831 = load ptr, ptr %41, align 8
  %832 = load ptr, ptr %10, align 8
  %833 = getelementptr inbounds %struct.CalcLangVal, ptr %832, i32 0, i32 1
  store ptr %831, ptr %833, align 8
  br label %835

834:                                              ; preds = %768
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1345

835:                                              ; preds = %828
  br label %1317

836:                                              ; preds = %763, %758
  %837 = load ptr, ptr %6, align 8
  %838 = getelementptr inbounds %struct.CalcLangVal, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp eq i32 %839, 6
  br i1 %840, label %841, label %895

841:                                              ; preds = %836
  %842 = load ptr, ptr %8, align 8
  %843 = getelementptr inbounds %struct.CalcLangVal, ptr %842, i32 0, i32 0
  %844 = load i32, ptr %843, align 8
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %895

846:                                              ; preds = %841
  %847 = load ptr, ptr %6, align 8
  %848 = getelementptr inbounds %struct.CalcLangVal, ptr %847, i32 0, i32 1
  %849 = load ptr, ptr %848, align 8
  store ptr %849, ptr %43, align 8
  %850 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %850, ptr %44, align 8
  %851 = load ptr, ptr %43, align 8
  %852 = getelementptr inbounds %struct.SetValue, ptr %851, i32 0, i32 0
  %853 = load i32, ptr %852, align 8
  %854 = load ptr, ptr %44, align 8
  %855 = getelementptr inbounds %struct.SetValue, ptr %854, i32 0, i32 0
  store i32 %853, ptr %855, align 8
  %856 = load ptr, ptr %44, align 8
  %857 = getelementptr inbounds %struct.SetValue, ptr %856, i32 0, i32 0
  %858 = load i32, ptr %857, align 8
  %859 = sext i32 %858 to i64
  %860 = mul i64 8, %859
  %861 = call noalias ptr @malloc(i64 noundef %860) #5
  %862 = load ptr, ptr %44, align 8
  %863 = getelementptr inbounds %struct.SetValue, ptr %862, i32 0, i32 1
  store ptr %861, ptr %863, align 8
  store i32 0, ptr %45, align 4
  br label %864

864:                                              ; preds = %886, %846
  %865 = load i32, ptr %45, align 4
  %866 = load ptr, ptr %43, align 8
  %867 = getelementptr inbounds %struct.SetValue, ptr %866, i32 0, i32 0
  %868 = load i32, ptr %867, align 8
  %869 = icmp slt i32 %865, %868
  br i1 %869, label %870, label %889

870:                                              ; preds = %864
  %871 = load ptr, ptr %43, align 8
  %872 = getelementptr inbounds %struct.SetValue, ptr %871, i32 0, i32 1
  %873 = load ptr, ptr %872, align 8
  %874 = load i32, ptr %45, align 4
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds ptr, ptr %873, i64 %875
  %877 = load ptr, ptr %876, align 8
  %878 = load ptr, ptr %8, align 8
  %879 = call ptr @addCalcLangValues(ptr noundef %877, i32 noundef 1, ptr noundef %878, i32 noundef 0)
  %880 = load ptr, ptr %44, align 8
  %881 = getelementptr inbounds %struct.SetValue, ptr %880, i32 0, i32 1
  %882 = load ptr, ptr %881, align 8
  %883 = load i32, ptr %45, align 4
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds ptr, ptr %882, i64 %884
  store ptr %879, ptr %885, align 8
  br label %886

886:                                              ; preds = %870
  %887 = load i32, ptr %45, align 4
  %888 = add nsw i32 %887, 1
  store i32 %888, ptr %45, align 4
  br label %864, !llvm.loop !17

889:                                              ; preds = %864
  %890 = load ptr, ptr %10, align 8
  %891 = getelementptr inbounds %struct.CalcLangVal, ptr %890, i32 0, i32 0
  store i32 6, ptr %891, align 8
  %892 = load ptr, ptr %44, align 8
  %893 = load ptr, ptr %10, align 8
  %894 = getelementptr inbounds %struct.CalcLangVal, ptr %893, i32 0, i32 1
  store ptr %892, ptr %894, align 8
  br label %1316

895:                                              ; preds = %841, %836
  %896 = load ptr, ptr %6, align 8
  %897 = getelementptr inbounds %struct.CalcLangVal, ptr %896, i32 0, i32 0
  %898 = load i32, ptr %897, align 8
  %899 = icmp eq i32 %898, 0
  br i1 %899, label %900, label %954

900:                                              ; preds = %895
  %901 = load ptr, ptr %8, align 8
  %902 = getelementptr inbounds %struct.CalcLangVal, ptr %901, i32 0, i32 0
  %903 = load i32, ptr %902, align 8
  %904 = icmp eq i32 %903, 6
  br i1 %904, label %905, label %954

905:                                              ; preds = %900
  %906 = load ptr, ptr %8, align 8
  %907 = getelementptr inbounds %struct.CalcLangVal, ptr %906, i32 0, i32 1
  %908 = load ptr, ptr %907, align 8
  store ptr %908, ptr %46, align 8
  %909 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %909, ptr %47, align 8
  %910 = load ptr, ptr %46, align 8
  %911 = getelementptr inbounds %struct.SetValue, ptr %910, i32 0, i32 0
  %912 = load i32, ptr %911, align 8
  %913 = load ptr, ptr %47, align 8
  %914 = getelementptr inbounds %struct.SetValue, ptr %913, i32 0, i32 0
  store i32 %912, ptr %914, align 8
  %915 = load ptr, ptr %47, align 8
  %916 = getelementptr inbounds %struct.SetValue, ptr %915, i32 0, i32 0
  %917 = load i32, ptr %916, align 8
  %918 = sext i32 %917 to i64
  %919 = mul i64 8, %918
  %920 = call noalias ptr @malloc(i64 noundef %919) #5
  %921 = load ptr, ptr %47, align 8
  %922 = getelementptr inbounds %struct.SetValue, ptr %921, i32 0, i32 1
  store ptr %920, ptr %922, align 8
  store i32 0, ptr %48, align 4
  br label %923

923:                                              ; preds = %945, %905
  %924 = load i32, ptr %48, align 4
  %925 = load ptr, ptr %46, align 8
  %926 = getelementptr inbounds %struct.SetValue, ptr %925, i32 0, i32 0
  %927 = load i32, ptr %926, align 8
  %928 = icmp slt i32 %924, %927
  br i1 %928, label %929, label %948

929:                                              ; preds = %923
  %930 = load ptr, ptr %6, align 8
  %931 = load ptr, ptr %46, align 8
  %932 = getelementptr inbounds %struct.SetValue, ptr %931, i32 0, i32 1
  %933 = load ptr, ptr %932, align 8
  %934 = load i32, ptr %48, align 4
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds ptr, ptr %933, i64 %935
  %937 = load ptr, ptr %936, align 8
  %938 = call ptr @addCalcLangValues(ptr noundef %930, i32 noundef 0, ptr noundef %937, i32 noundef 1)
  %939 = load ptr, ptr %47, align 8
  %940 = getelementptr inbounds %struct.SetValue, ptr %939, i32 0, i32 1
  %941 = load ptr, ptr %940, align 8
  %942 = load i32, ptr %48, align 4
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds ptr, ptr %941, i64 %943
  store ptr %938, ptr %944, align 8
  br label %945

945:                                              ; preds = %929
  %946 = load i32, ptr %48, align 4
  %947 = add nsw i32 %946, 1
  store i32 %947, ptr %48, align 4
  br label %923, !llvm.loop !18

948:                                              ; preds = %923
  %949 = load ptr, ptr %10, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 0
  store i32 6, ptr %950, align 8
  %951 = load ptr, ptr %47, align 8
  %952 = load ptr, ptr %10, align 8
  %953 = getelementptr inbounds %struct.CalcLangVal, ptr %952, i32 0, i32 1
  store ptr %951, ptr %953, align 8
  br label %1315

954:                                              ; preds = %900, %895
  %955 = load ptr, ptr %6, align 8
  %956 = getelementptr inbounds %struct.CalcLangVal, ptr %955, i32 0, i32 0
  %957 = load i32, ptr %956, align 8
  %958 = icmp eq i32 %957, 6
  br i1 %958, label %959, label %1013

959:                                              ; preds = %954
  %960 = load ptr, ptr %8, align 8
  %961 = getelementptr inbounds %struct.CalcLangVal, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = icmp eq i32 %962, 1
  br i1 %963, label %964, label %1013

964:                                              ; preds = %959
  %965 = load ptr, ptr %6, align 8
  %966 = getelementptr inbounds %struct.CalcLangVal, ptr %965, i32 0, i32 1
  %967 = load ptr, ptr %966, align 8
  store ptr %967, ptr %49, align 8
  %968 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %968, ptr %50, align 8
  %969 = load ptr, ptr %49, align 8
  %970 = getelementptr inbounds %struct.SetValue, ptr %969, i32 0, i32 0
  %971 = load i32, ptr %970, align 8
  %972 = load ptr, ptr %50, align 8
  %973 = getelementptr inbounds %struct.SetValue, ptr %972, i32 0, i32 0
  store i32 %971, ptr %973, align 8
  %974 = load ptr, ptr %50, align 8
  %975 = getelementptr inbounds %struct.SetValue, ptr %974, i32 0, i32 0
  %976 = load i32, ptr %975, align 8
  %977 = sext i32 %976 to i64
  %978 = mul i64 8, %977
  %979 = call noalias ptr @malloc(i64 noundef %978) #5
  %980 = load ptr, ptr %50, align 8
  %981 = getelementptr inbounds %struct.SetValue, ptr %980, i32 0, i32 1
  store ptr %979, ptr %981, align 8
  store i32 0, ptr %51, align 4
  br label %982

982:                                              ; preds = %1004, %964
  %983 = load i32, ptr %51, align 4
  %984 = load ptr, ptr %49, align 8
  %985 = getelementptr inbounds %struct.SetValue, ptr %984, i32 0, i32 0
  %986 = load i32, ptr %985, align 8
  %987 = icmp slt i32 %983, %986
  br i1 %987, label %988, label %1007

988:                                              ; preds = %982
  %989 = load ptr, ptr %49, align 8
  %990 = getelementptr inbounds %struct.SetValue, ptr %989, i32 0, i32 1
  %991 = load ptr, ptr %990, align 8
  %992 = load i32, ptr %51, align 4
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds ptr, ptr %991, i64 %993
  %995 = load ptr, ptr %994, align 8
  %996 = load ptr, ptr %8, align 8
  %997 = call ptr @addCalcLangValues(ptr noundef %995, i32 noundef 1, ptr noundef %996, i32 noundef 0)
  %998 = load ptr, ptr %50, align 8
  %999 = getelementptr inbounds %struct.SetValue, ptr %998, i32 0, i32 1
  %1000 = load ptr, ptr %999, align 8
  %1001 = load i32, ptr %51, align 4
  %1002 = sext i32 %1001 to i64
  %1003 = getelementptr inbounds ptr, ptr %1000, i64 %1002
  store ptr %997, ptr %1003, align 8
  br label %1004

1004:                                             ; preds = %988
  %1005 = load i32, ptr %51, align 4
  %1006 = add nsw i32 %1005, 1
  store i32 %1006, ptr %51, align 4
  br label %982, !llvm.loop !19

1007:                                             ; preds = %982
  %1008 = load ptr, ptr %10, align 8
  %1009 = getelementptr inbounds %struct.CalcLangVal, ptr %1008, i32 0, i32 0
  store i32 7, ptr %1009, align 8
  %1010 = load ptr, ptr %50, align 8
  %1011 = load ptr, ptr %10, align 8
  %1012 = getelementptr inbounds %struct.CalcLangVal, ptr %1011, i32 0, i32 1
  store ptr %1010, ptr %1012, align 8
  br label %1314

1013:                                             ; preds = %959, %954
  %1014 = load ptr, ptr %6, align 8
  %1015 = getelementptr inbounds %struct.CalcLangVal, ptr %1014, i32 0, i32 0
  %1016 = load i32, ptr %1015, align 8
  %1017 = icmp eq i32 %1016, 1
  br i1 %1017, label %1018, label %1072

1018:                                             ; preds = %1013
  %1019 = load ptr, ptr %8, align 8
  %1020 = getelementptr inbounds %struct.CalcLangVal, ptr %1019, i32 0, i32 0
  %1021 = load i32, ptr %1020, align 8
  %1022 = icmp eq i32 %1021, 6
  br i1 %1022, label %1023, label %1072

1023:                                             ; preds = %1018
  %1024 = load ptr, ptr %8, align 8
  %1025 = getelementptr inbounds %struct.CalcLangVal, ptr %1024, i32 0, i32 1
  %1026 = load ptr, ptr %1025, align 8
  store ptr %1026, ptr %52, align 8
  %1027 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1027, ptr %53, align 8
  %1028 = load ptr, ptr %52, align 8
  %1029 = getelementptr inbounds %struct.SetValue, ptr %1028, i32 0, i32 0
  %1030 = load i32, ptr %1029, align 8
  %1031 = load ptr, ptr %53, align 8
  %1032 = getelementptr inbounds %struct.SetValue, ptr %1031, i32 0, i32 0
  store i32 %1030, ptr %1032, align 8
  %1033 = load ptr, ptr %53, align 8
  %1034 = getelementptr inbounds %struct.SetValue, ptr %1033, i32 0, i32 0
  %1035 = load i32, ptr %1034, align 8
  %1036 = sext i32 %1035 to i64
  %1037 = mul i64 8, %1036
  %1038 = call noalias ptr @malloc(i64 noundef %1037) #5
  %1039 = load ptr, ptr %53, align 8
  %1040 = getelementptr inbounds %struct.SetValue, ptr %1039, i32 0, i32 1
  store ptr %1038, ptr %1040, align 8
  store i32 0, ptr %54, align 4
  br label %1041

1041:                                             ; preds = %1063, %1023
  %1042 = load i32, ptr %54, align 4
  %1043 = load ptr, ptr %52, align 8
  %1044 = getelementptr inbounds %struct.SetValue, ptr %1043, i32 0, i32 0
  %1045 = load i32, ptr %1044, align 8
  %1046 = icmp slt i32 %1042, %1045
  br i1 %1046, label %1047, label %1066

1047:                                             ; preds = %1041
  %1048 = load ptr, ptr %6, align 8
  %1049 = load ptr, ptr %52, align 8
  %1050 = getelementptr inbounds %struct.SetValue, ptr %1049, i32 0, i32 1
  %1051 = load ptr, ptr %1050, align 8
  %1052 = load i32, ptr %54, align 4
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds ptr, ptr %1051, i64 %1053
  %1055 = load ptr, ptr %1054, align 8
  %1056 = call ptr @addCalcLangValues(ptr noundef %1048, i32 noundef 0, ptr noundef %1055, i32 noundef 1)
  %1057 = load ptr, ptr %53, align 8
  %1058 = getelementptr inbounds %struct.SetValue, ptr %1057, i32 0, i32 1
  %1059 = load ptr, ptr %1058, align 8
  %1060 = load i32, ptr %54, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds ptr, ptr %1059, i64 %1061
  store ptr %1056, ptr %1062, align 8
  br label %1063

1063:                                             ; preds = %1047
  %1064 = load i32, ptr %54, align 4
  %1065 = add nsw i32 %1064, 1
  store i32 %1065, ptr %54, align 4
  br label %1041, !llvm.loop !20

1066:                                             ; preds = %1041
  %1067 = load ptr, ptr %10, align 8
  %1068 = getelementptr inbounds %struct.CalcLangVal, ptr %1067, i32 0, i32 0
  store i32 6, ptr %1068, align 8
  %1069 = load ptr, ptr %53, align 8
  %1070 = load ptr, ptr %10, align 8
  %1071 = getelementptr inbounds %struct.CalcLangVal, ptr %1070, i32 0, i32 1
  store ptr %1069, ptr %1071, align 8
  br label %1313

1072:                                             ; preds = %1018, %1013
  %1073 = load ptr, ptr %6, align 8
  %1074 = getelementptr inbounds %struct.CalcLangVal, ptr %1073, i32 0, i32 0
  %1075 = load i32, ptr %1074, align 8
  %1076 = icmp eq i32 %1075, 6
  br i1 %1076, label %1077, label %1131

1077:                                             ; preds = %1072
  %1078 = load ptr, ptr %8, align 8
  %1079 = getelementptr inbounds %struct.CalcLangVal, ptr %1078, i32 0, i32 0
  %1080 = load i32, ptr %1079, align 8
  %1081 = icmp eq i32 %1080, 3
  br i1 %1081, label %1082, label %1131

1082:                                             ; preds = %1077
  %1083 = load ptr, ptr %6, align 8
  %1084 = getelementptr inbounds %struct.CalcLangVal, ptr %1083, i32 0, i32 1
  %1085 = load ptr, ptr %1084, align 8
  store ptr %1085, ptr %55, align 8
  %1086 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1086, ptr %56, align 8
  %1087 = load ptr, ptr %55, align 8
  %1088 = getelementptr inbounds %struct.SetValue, ptr %1087, i32 0, i32 0
  %1089 = load i32, ptr %1088, align 8
  %1090 = load ptr, ptr %56, align 8
  %1091 = getelementptr inbounds %struct.SetValue, ptr %1090, i32 0, i32 0
  store i32 %1089, ptr %1091, align 8
  %1092 = load ptr, ptr %56, align 8
  %1093 = getelementptr inbounds %struct.SetValue, ptr %1092, i32 0, i32 0
  %1094 = load i32, ptr %1093, align 8
  %1095 = sext i32 %1094 to i64
  %1096 = mul i64 8, %1095
  %1097 = call noalias ptr @malloc(i64 noundef %1096) #5
  %1098 = load ptr, ptr %56, align 8
  %1099 = getelementptr inbounds %struct.SetValue, ptr %1098, i32 0, i32 1
  store ptr %1097, ptr %1099, align 8
  store i32 0, ptr %57, align 4
  br label %1100

1100:                                             ; preds = %1122, %1082
  %1101 = load i32, ptr %57, align 4
  %1102 = load ptr, ptr %55, align 8
  %1103 = getelementptr inbounds %struct.SetValue, ptr %1102, i32 0, i32 0
  %1104 = load i32, ptr %1103, align 8
  %1105 = icmp slt i32 %1101, %1104
  br i1 %1105, label %1106, label %1125

1106:                                             ; preds = %1100
  %1107 = load ptr, ptr %55, align 8
  %1108 = getelementptr inbounds %struct.SetValue, ptr %1107, i32 0, i32 1
  %1109 = load ptr, ptr %1108, align 8
  %1110 = load i32, ptr %57, align 4
  %1111 = sext i32 %1110 to i64
  %1112 = getelementptr inbounds ptr, ptr %1109, i64 %1111
  %1113 = load ptr, ptr %1112, align 8
  %1114 = load ptr, ptr %8, align 8
  %1115 = call ptr @addCalcLangValues(ptr noundef %1113, i32 noundef 1, ptr noundef %1114, i32 noundef 0)
  %1116 = load ptr, ptr %56, align 8
  %1117 = getelementptr inbounds %struct.SetValue, ptr %1116, i32 0, i32 1
  %1118 = load ptr, ptr %1117, align 8
  %1119 = load i32, ptr %57, align 4
  %1120 = sext i32 %1119 to i64
  %1121 = getelementptr inbounds ptr, ptr %1118, i64 %1120
  store ptr %1115, ptr %1121, align 8
  br label %1122

1122:                                             ; preds = %1106
  %1123 = load i32, ptr %57, align 4
  %1124 = add nsw i32 %1123, 1
  store i32 %1124, ptr %57, align 4
  br label %1100, !llvm.loop !21

1125:                                             ; preds = %1100
  %1126 = load ptr, ptr %10, align 8
  %1127 = getelementptr inbounds %struct.CalcLangVal, ptr %1126, i32 0, i32 0
  store i32 6, ptr %1127, align 8
  %1128 = load ptr, ptr %56, align 8
  %1129 = load ptr, ptr %10, align 8
  %1130 = getelementptr inbounds %struct.CalcLangVal, ptr %1129, i32 0, i32 1
  store ptr %1128, ptr %1130, align 8
  br label %1312

1131:                                             ; preds = %1077, %1072
  %1132 = load ptr, ptr %6, align 8
  %1133 = getelementptr inbounds %struct.CalcLangVal, ptr %1132, i32 0, i32 0
  %1134 = load i32, ptr %1133, align 8
  %1135 = icmp eq i32 %1134, 3
  br i1 %1135, label %1136, label %1190

1136:                                             ; preds = %1131
  %1137 = load ptr, ptr %8, align 8
  %1138 = getelementptr inbounds %struct.CalcLangVal, ptr %1137, i32 0, i32 0
  %1139 = load i32, ptr %1138, align 8
  %1140 = icmp eq i32 %1139, 6
  br i1 %1140, label %1141, label %1190

1141:                                             ; preds = %1136
  %1142 = load ptr, ptr %8, align 8
  %1143 = getelementptr inbounds %struct.CalcLangVal, ptr %1142, i32 0, i32 1
  %1144 = load ptr, ptr %1143, align 8
  store ptr %1144, ptr %58, align 8
  %1145 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1145, ptr %59, align 8
  %1146 = load ptr, ptr %58, align 8
  %1147 = getelementptr inbounds %struct.SetValue, ptr %1146, i32 0, i32 0
  %1148 = load i32, ptr %1147, align 8
  %1149 = load ptr, ptr %59, align 8
  %1150 = getelementptr inbounds %struct.SetValue, ptr %1149, i32 0, i32 0
  store i32 %1148, ptr %1150, align 8
  %1151 = load ptr, ptr %59, align 8
  %1152 = getelementptr inbounds %struct.SetValue, ptr %1151, i32 0, i32 0
  %1153 = load i32, ptr %1152, align 8
  %1154 = sext i32 %1153 to i64
  %1155 = mul i64 8, %1154
  %1156 = call noalias ptr @malloc(i64 noundef %1155) #5
  %1157 = load ptr, ptr %59, align 8
  %1158 = getelementptr inbounds %struct.SetValue, ptr %1157, i32 0, i32 1
  store ptr %1156, ptr %1158, align 8
  store i32 0, ptr %60, align 4
  br label %1159

1159:                                             ; preds = %1181, %1141
  %1160 = load i32, ptr %60, align 4
  %1161 = load ptr, ptr %58, align 8
  %1162 = getelementptr inbounds %struct.SetValue, ptr %1161, i32 0, i32 0
  %1163 = load i32, ptr %1162, align 8
  %1164 = icmp slt i32 %1160, %1163
  br i1 %1164, label %1165, label %1184

1165:                                             ; preds = %1159
  %1166 = load ptr, ptr %6, align 8
  %1167 = load ptr, ptr %58, align 8
  %1168 = getelementptr inbounds %struct.SetValue, ptr %1167, i32 0, i32 1
  %1169 = load ptr, ptr %1168, align 8
  %1170 = load i32, ptr %60, align 4
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds ptr, ptr %1169, i64 %1171
  %1173 = load ptr, ptr %1172, align 8
  %1174 = call ptr @addCalcLangValues(ptr noundef %1166, i32 noundef 0, ptr noundef %1173, i32 noundef 1)
  %1175 = load ptr, ptr %59, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 1
  %1177 = load ptr, ptr %1176, align 8
  %1178 = load i32, ptr %60, align 4
  %1179 = sext i32 %1178 to i64
  %1180 = getelementptr inbounds ptr, ptr %1177, i64 %1179
  store ptr %1174, ptr %1180, align 8
  br label %1181

1181:                                             ; preds = %1165
  %1182 = load i32, ptr %60, align 4
  %1183 = add nsw i32 %1182, 1
  store i32 %1183, ptr %60, align 4
  br label %1159, !llvm.loop !22

1184:                                             ; preds = %1159
  %1185 = load ptr, ptr %10, align 8
  %1186 = getelementptr inbounds %struct.CalcLangVal, ptr %1185, i32 0, i32 0
  store i32 6, ptr %1186, align 8
  %1187 = load ptr, ptr %59, align 8
  %1188 = load ptr, ptr %10, align 8
  %1189 = getelementptr inbounds %struct.CalcLangVal, ptr %1188, i32 0, i32 1
  store ptr %1187, ptr %1189, align 8
  br label %1311

1190:                                             ; preds = %1136, %1131
  %1191 = load ptr, ptr %6, align 8
  %1192 = getelementptr inbounds %struct.CalcLangVal, ptr %1191, i32 0, i32 0
  %1193 = load i32, ptr %1192, align 8
  %1194 = icmp eq i32 %1193, 6
  br i1 %1194, label %1195, label %1249

1195:                                             ; preds = %1190
  %1196 = load ptr, ptr %8, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  %1198 = load i32, ptr %1197, align 8
  %1199 = icmp eq i32 %1198, 4
  br i1 %1199, label %1200, label %1249

1200:                                             ; preds = %1195
  %1201 = load ptr, ptr %6, align 8
  %1202 = getelementptr inbounds %struct.CalcLangVal, ptr %1201, i32 0, i32 1
  %1203 = load ptr, ptr %1202, align 8
  store ptr %1203, ptr %61, align 8
  %1204 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1204, ptr %62, align 8
  %1205 = load ptr, ptr %61, align 8
  %1206 = getelementptr inbounds %struct.SetValue, ptr %1205, i32 0, i32 0
  %1207 = load i32, ptr %1206, align 8
  %1208 = load ptr, ptr %62, align 8
  %1209 = getelementptr inbounds %struct.SetValue, ptr %1208, i32 0, i32 0
  store i32 %1207, ptr %1209, align 8
  %1210 = load ptr, ptr %62, align 8
  %1211 = getelementptr inbounds %struct.SetValue, ptr %1210, i32 0, i32 0
  %1212 = load i32, ptr %1211, align 8
  %1213 = sext i32 %1212 to i64
  %1214 = mul i64 8, %1213
  %1215 = call noalias ptr @malloc(i64 noundef %1214) #5
  %1216 = load ptr, ptr %62, align 8
  %1217 = getelementptr inbounds %struct.SetValue, ptr %1216, i32 0, i32 1
  store ptr %1215, ptr %1217, align 8
  store i32 0, ptr %63, align 4
  br label %1218

1218:                                             ; preds = %1240, %1200
  %1219 = load i32, ptr %63, align 4
  %1220 = load ptr, ptr %61, align 8
  %1221 = getelementptr inbounds %struct.SetValue, ptr %1220, i32 0, i32 0
  %1222 = load i32, ptr %1221, align 8
  %1223 = icmp slt i32 %1219, %1222
  br i1 %1223, label %1224, label %1243

1224:                                             ; preds = %1218
  %1225 = load ptr, ptr %61, align 8
  %1226 = getelementptr inbounds %struct.SetValue, ptr %1225, i32 0, i32 1
  %1227 = load ptr, ptr %1226, align 8
  %1228 = load i32, ptr %63, align 4
  %1229 = sext i32 %1228 to i64
  %1230 = getelementptr inbounds ptr, ptr %1227, i64 %1229
  %1231 = load ptr, ptr %1230, align 8
  %1232 = load ptr, ptr %8, align 8
  %1233 = call ptr @addCalcLangValues(ptr noundef %1231, i32 noundef 1, ptr noundef %1232, i32 noundef 0)
  %1234 = load ptr, ptr %62, align 8
  %1235 = getelementptr inbounds %struct.SetValue, ptr %1234, i32 0, i32 1
  %1236 = load ptr, ptr %1235, align 8
  %1237 = load i32, ptr %63, align 4
  %1238 = sext i32 %1237 to i64
  %1239 = getelementptr inbounds ptr, ptr %1236, i64 %1238
  store ptr %1233, ptr %1239, align 8
  br label %1240

1240:                                             ; preds = %1224
  %1241 = load i32, ptr %63, align 4
  %1242 = add nsw i32 %1241, 1
  store i32 %1242, ptr %63, align 4
  br label %1218, !llvm.loop !23

1243:                                             ; preds = %1218
  %1244 = load ptr, ptr %10, align 8
  %1245 = getelementptr inbounds %struct.CalcLangVal, ptr %1244, i32 0, i32 0
  store i32 6, ptr %1245, align 8
  %1246 = load ptr, ptr %62, align 8
  %1247 = load ptr, ptr %10, align 8
  %1248 = getelementptr inbounds %struct.CalcLangVal, ptr %1247, i32 0, i32 1
  store ptr %1246, ptr %1248, align 8
  br label %1310

1249:                                             ; preds = %1195, %1190
  %1250 = load ptr, ptr %6, align 8
  %1251 = getelementptr inbounds %struct.CalcLangVal, ptr %1250, i32 0, i32 0
  %1252 = load i32, ptr %1251, align 8
  %1253 = icmp eq i32 %1252, 4
  br i1 %1253, label %1254, label %1308

1254:                                             ; preds = %1249
  %1255 = load ptr, ptr %8, align 8
  %1256 = getelementptr inbounds %struct.CalcLangVal, ptr %1255, i32 0, i32 0
  %1257 = load i32, ptr %1256, align 8
  %1258 = icmp eq i32 %1257, 6
  br i1 %1258, label %1259, label %1308

1259:                                             ; preds = %1254
  %1260 = load ptr, ptr %8, align 8
  %1261 = getelementptr inbounds %struct.CalcLangVal, ptr %1260, i32 0, i32 1
  %1262 = load ptr, ptr %1261, align 8
  store ptr %1262, ptr %64, align 8
  %1263 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1263, ptr %65, align 8
  %1264 = load ptr, ptr %64, align 8
  %1265 = getelementptr inbounds %struct.SetValue, ptr %1264, i32 0, i32 0
  %1266 = load i32, ptr %1265, align 8
  %1267 = load ptr, ptr %65, align 8
  %1268 = getelementptr inbounds %struct.SetValue, ptr %1267, i32 0, i32 0
  store i32 %1266, ptr %1268, align 8
  %1269 = load ptr, ptr %65, align 8
  %1270 = getelementptr inbounds %struct.SetValue, ptr %1269, i32 0, i32 0
  %1271 = load i32, ptr %1270, align 8
  %1272 = sext i32 %1271 to i64
  %1273 = mul i64 8, %1272
  %1274 = call noalias ptr @malloc(i64 noundef %1273) #5
  %1275 = load ptr, ptr %65, align 8
  %1276 = getelementptr inbounds %struct.SetValue, ptr %1275, i32 0, i32 1
  store ptr %1274, ptr %1276, align 8
  store i32 0, ptr %66, align 4
  br label %1277

1277:                                             ; preds = %1299, %1259
  %1278 = load i32, ptr %66, align 4
  %1279 = load ptr, ptr %64, align 8
  %1280 = getelementptr inbounds %struct.SetValue, ptr %1279, i32 0, i32 0
  %1281 = load i32, ptr %1280, align 8
  %1282 = icmp slt i32 %1278, %1281
  br i1 %1282, label %1283, label %1302

1283:                                             ; preds = %1277
  %1284 = load ptr, ptr %6, align 8
  %1285 = load ptr, ptr %64, align 8
  %1286 = getelementptr inbounds %struct.SetValue, ptr %1285, i32 0, i32 1
  %1287 = load ptr, ptr %1286, align 8
  %1288 = load i32, ptr %66, align 4
  %1289 = sext i32 %1288 to i64
  %1290 = getelementptr inbounds ptr, ptr %1287, i64 %1289
  %1291 = load ptr, ptr %1290, align 8
  %1292 = call ptr @addCalcLangValues(ptr noundef %1284, i32 noundef 0, ptr noundef %1291, i32 noundef 1)
  %1293 = load ptr, ptr %65, align 8
  %1294 = getelementptr inbounds %struct.SetValue, ptr %1293, i32 0, i32 1
  %1295 = load ptr, ptr %1294, align 8
  %1296 = load i32, ptr %66, align 4
  %1297 = sext i32 %1296 to i64
  %1298 = getelementptr inbounds ptr, ptr %1295, i64 %1297
  store ptr %1292, ptr %1298, align 8
  br label %1299

1299:                                             ; preds = %1283
  %1300 = load i32, ptr %66, align 4
  %1301 = add nsw i32 %1300, 1
  store i32 %1301, ptr %66, align 4
  br label %1277, !llvm.loop !24

1302:                                             ; preds = %1277
  %1303 = load ptr, ptr %10, align 8
  %1304 = getelementptr inbounds %struct.CalcLangVal, ptr %1303, i32 0, i32 0
  store i32 6, ptr %1304, align 8
  %1305 = load ptr, ptr %65, align 8
  %1306 = load ptr, ptr %10, align 8
  %1307 = getelementptr inbounds %struct.CalcLangVal, ptr %1306, i32 0, i32 1
  store ptr %1305, ptr %1307, align 8
  br label %1309

1308:                                             ; preds = %1254, %1249
  call void @perror(ptr noundef @.str.1) #6
  br label %1309

1309:                                             ; preds = %1308, %1302
  br label %1310

1310:                                             ; preds = %1309, %1243
  br label %1311

1311:                                             ; preds = %1310, %1184
  br label %1312

1312:                                             ; preds = %1311, %1125
  br label %1313

1313:                                             ; preds = %1312, %1066
  br label %1314

1314:                                             ; preds = %1313, %1007
  br label %1315

1315:                                             ; preds = %1314, %948
  br label %1316

1316:                                             ; preds = %1315, %889
  br label %1317

1317:                                             ; preds = %1316, %835
  br label %1318

1318:                                             ; preds = %1317, %752
  br label %1319

1319:                                             ; preds = %1318, %693
  br label %1320

1320:                                             ; preds = %1319, %634
  br label %1321

1321:                                             ; preds = %1320, %575
  br label %1322

1322:                                             ; preds = %1321, %516
  br label %1323

1323:                                             ; preds = %1322, %457
  br label %1324

1324:                                             ; preds = %1323, %398
  br label %1325

1325:                                             ; preds = %1324, %339
  br label %1326

1326:                                             ; preds = %1325, %285
  br label %1327

1327:                                             ; preds = %1326, %196
  br label %1328

1328:                                             ; preds = %1327, %174
  br label %1329

1329:                                             ; preds = %1328, %151
  br label %1330

1330:                                             ; preds = %1329, %128
  br label %1331

1331:                                             ; preds = %1330, %106
  br label %1332

1332:                                             ; preds = %1331, %84
  %1333 = load i32, ptr %7, align 4
  %1334 = icmp ne i32 %1333, 0
  br i1 %1334, label %1335, label %1337

1335:                                             ; preds = %1332
  %1336 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1336)
  br label %1343

1337:                                             ; preds = %1332
  %1338 = load i32, ptr %9, align 4
  %1339 = icmp ne i32 %1338, 0
  br i1 %1339, label %1340, label %1342

1340:                                             ; preds = %1337
  %1341 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1341)
  br label %1342

1342:                                             ; preds = %1340, %1337
  br label %1343

1343:                                             ; preds = %1342, %1335
  %1344 = load ptr, ptr %10, align 8
  store ptr %1344, ptr %5, align 8
  br label %1345

1345:                                             ; preds = %1343, %834, %284, %72
  %1346 = load ptr, ptr %5, align 8
  ret ptr %1346
}

; Function Attrs: cold
declare void @perror(ptr noundef) #2

declare void @freeCalcLangValue(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @subCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i32, align 4
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i32, align 4
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i32, align 4
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %67 = load ptr, ptr %6, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %72, label %69

69:                                               ; preds = %4
  %70 = load ptr, ptr %8, align 8
  %71 = icmp eq ptr %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %69, %4
  store ptr null, ptr %5, align 8
  br label %1345

73:                                               ; preds = %69
  %74 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %74, ptr %10, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %96

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %96

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = sub nsw i32 %89, %92
  %94 = load ptr, ptr %10, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  store i32 %93, ptr %95, align 8
  br label %1332

96:                                               ; preds = %79, %73
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  %99 = load i32, ptr %98, align 8
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %101, label %118

101:                                              ; preds = %96
  %102 = load ptr, ptr %8, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 0
  %104 = load i32, ptr %103, align 8
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %118

106:                                              ; preds = %101
  %107 = load ptr, ptr %10, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 0
  store i32 1, ptr %108, align 8
  %109 = load ptr, ptr %6, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load double, ptr %110, align 8
  %112 = load ptr, ptr %8, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  %114 = load double, ptr %113, align 8
  %115 = fsub double %111, %114
  %116 = load ptr, ptr %10, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 1
  store double %115, ptr %117, align 8
  br label %1331

118:                                              ; preds = %101, %96
  %119 = load ptr, ptr %6, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %141

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %125, align 8
  %127 = icmp eq i32 %126, 1
  br i1 %127, label %128, label %141

128:                                              ; preds = %123
  %129 = load ptr, ptr %10, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 0
  store i32 1, ptr %130, align 8
  %131 = load ptr, ptr %6, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load i32, ptr %132, align 8
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  %137 = load double, ptr %136, align 8
  %138 = fsub double %134, %137
  %139 = load ptr, ptr %10, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 1
  store double %138, ptr %140, align 8
  br label %1330

141:                                              ; preds = %123, %118
  %142 = load ptr, ptr %6, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = icmp eq i32 %144, 1
  br i1 %145, label %146, label %164

146:                                              ; preds = %141
  %147 = load ptr, ptr %8, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 0
  %149 = load i32, ptr %148, align 8
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %164

151:                                              ; preds = %146
  %152 = load ptr, ptr %10, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 0
  store i32 1, ptr %153, align 8
  %154 = load ptr, ptr %6, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = load ptr, ptr %8, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  %159 = load i32, ptr %158, align 8
  %160 = sitofp i32 %159 to double
  %161 = fsub double %156, %160
  %162 = load ptr, ptr %10, align 8
  %163 = getelementptr inbounds %struct.CalcLangVal, ptr %162, i32 0, i32 1
  store double %161, ptr %163, align 8
  br label %1329

164:                                              ; preds = %146, %141
  %165 = load ptr, ptr %6, align 8
  %166 = getelementptr inbounds %struct.CalcLangVal, ptr %165, i32 0, i32 0
  %167 = load i32, ptr %166, align 8
  %168 = icmp eq i32 %167, 3
  br i1 %168, label %169, label %186

169:                                              ; preds = %164
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 0
  %172 = load i32, ptr %171, align 8
  %173 = icmp eq i32 %172, 3
  br i1 %173, label %174, label %186

174:                                              ; preds = %169
  %175 = load ptr, ptr %10, align 8
  %176 = getelementptr inbounds %struct.CalcLangVal, ptr %175, i32 0, i32 0
  store i32 3, ptr %176, align 8
  %177 = load ptr, ptr %6, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  %179 = load double, ptr %178, align 8
  %180 = load ptr, ptr %8, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  %182 = load double, ptr %181, align 8
  %183 = fsub double %179, %182
  %184 = load ptr, ptr %10, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  store double %183, ptr %185, align 8
  br label %1328

186:                                              ; preds = %169, %164
  %187 = load ptr, ptr %6, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 0
  %189 = load i32, ptr %188, align 8
  %190 = icmp eq i32 %189, 4
  br i1 %190, label %191, label %208

191:                                              ; preds = %186
  %192 = load ptr, ptr %8, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 4
  br i1 %195, label %196, label %208

196:                                              ; preds = %191
  %197 = load ptr, ptr %10, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 0
  store i32 4, ptr %198, align 8
  %199 = load ptr, ptr %6, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  %201 = load double, ptr %200, align 8
  %202 = load ptr, ptr %8, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  %204 = load double, ptr %203, align 8
  %205 = fsub double %201, %204
  %206 = load ptr, ptr %10, align 8
  %207 = getelementptr inbounds %struct.CalcLangVal, ptr %206, i32 0, i32 1
  store double %205, ptr %207, align 8
  br label %1327

208:                                              ; preds = %191, %186
  %209 = load ptr, ptr %6, align 8
  %210 = getelementptr inbounds %struct.CalcLangVal, ptr %209, i32 0, i32 0
  %211 = load i32, ptr %210, align 8
  %212 = icmp eq i32 %211, 7
  br i1 %212, label %213, label %286

213:                                              ; preds = %208
  %214 = load ptr, ptr %8, align 8
  %215 = getelementptr inbounds %struct.CalcLangVal, ptr %214, i32 0, i32 0
  %216 = load i32, ptr %215, align 8
  %217 = icmp eq i32 %216, 7
  br i1 %217, label %218, label %286

218:                                              ; preds = %213
  %219 = load ptr, ptr %6, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 1
  %221 = load ptr, ptr %220, align 8
  store ptr %221, ptr %11, align 8
  %222 = load ptr, ptr %8, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 1
  %224 = load ptr, ptr %223, align 8
  store ptr %224, ptr %12, align 8
  %225 = load ptr, ptr %12, align 8
  %226 = getelementptr inbounds %struct.TupleValue, ptr %225, i32 0, i32 0
  %227 = load i32, ptr %226, align 8
  %228 = load ptr, ptr %11, align 8
  %229 = getelementptr inbounds %struct.TupleValue, ptr %228, i32 0, i32 0
  %230 = load i32, ptr %229, align 8
  %231 = icmp eq i32 %227, %230
  br i1 %231, label %232, label %284

232:                                              ; preds = %218
  %233 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %233, ptr %13, align 8
  %234 = load ptr, ptr %11, align 8
  %235 = getelementptr inbounds %struct.TupleValue, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = load ptr, ptr %13, align 8
  %238 = getelementptr inbounds %struct.TupleValue, ptr %237, i32 0, i32 0
  store i32 %236, ptr %238, align 8
  %239 = load ptr, ptr %13, align 8
  %240 = getelementptr inbounds %struct.TupleValue, ptr %239, i32 0, i32 0
  %241 = load i32, ptr %240, align 8
  %242 = sext i32 %241 to i64
  %243 = mul i64 8, %242
  %244 = call noalias ptr @malloc(i64 noundef %243) #5
  %245 = load ptr, ptr %13, align 8
  %246 = getelementptr inbounds %struct.TupleValue, ptr %245, i32 0, i32 1
  store ptr %244, ptr %246, align 8
  store i32 0, ptr %14, align 4
  br label %247

247:                                              ; preds = %275, %232
  %248 = load i32, ptr %14, align 4
  %249 = load ptr, ptr %11, align 8
  %250 = getelementptr inbounds %struct.TupleValue, ptr %249, i32 0, i32 0
  %251 = load i32, ptr %250, align 8
  %252 = icmp slt i32 %248, %251
  br i1 %252, label %253, label %278

253:                                              ; preds = %247
  %254 = load ptr, ptr %11, align 8
  %255 = getelementptr inbounds %struct.TupleValue, ptr %254, i32 0, i32 1
  %256 = load ptr, ptr %255, align 8
  %257 = load i32, ptr %14, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds ptr, ptr %256, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = load ptr, ptr %12, align 8
  %262 = getelementptr inbounds %struct.TupleValue, ptr %261, i32 0, i32 1
  %263 = load ptr, ptr %262, align 8
  %264 = load i32, ptr %14, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds ptr, ptr %263, i64 %265
  %267 = load ptr, ptr %266, align 8
  %268 = call ptr @subCalcLangValues(ptr noundef %260, i32 noundef 1, ptr noundef %267, i32 noundef 0)
  %269 = load ptr, ptr %13, align 8
  %270 = getelementptr inbounds %struct.TupleValue, ptr %269, i32 0, i32 1
  %271 = load ptr, ptr %270, align 8
  %272 = load i32, ptr %14, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds ptr, ptr %271, i64 %273
  store ptr %268, ptr %274, align 8
  br label %275

275:                                              ; preds = %253
  %276 = load i32, ptr %14, align 4
  %277 = add nsw i32 %276, 1
  store i32 %277, ptr %14, align 4
  br label %247, !llvm.loop !25

278:                                              ; preds = %247
  %279 = load ptr, ptr %10, align 8
  %280 = getelementptr inbounds %struct.CalcLangVal, ptr %279, i32 0, i32 0
  store i32 7, ptr %280, align 8
  %281 = load ptr, ptr %13, align 8
  %282 = load ptr, ptr %10, align 8
  %283 = getelementptr inbounds %struct.CalcLangVal, ptr %282, i32 0, i32 1
  store ptr %281, ptr %283, align 8
  br label %285

284:                                              ; preds = %218
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1345

285:                                              ; preds = %278
  br label %1326

286:                                              ; preds = %213, %208
  %287 = load ptr, ptr %6, align 8
  %288 = getelementptr inbounds %struct.CalcLangVal, ptr %287, i32 0, i32 0
  %289 = load i32, ptr %288, align 8
  %290 = icmp eq i32 %289, 7
  br i1 %290, label %291, label %345

291:                                              ; preds = %286
  %292 = load ptr, ptr %8, align 8
  %293 = getelementptr inbounds %struct.CalcLangVal, ptr %292, i32 0, i32 0
  %294 = load i32, ptr %293, align 8
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %296, label %345

296:                                              ; preds = %291
  %297 = load ptr, ptr %6, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 1
  %299 = load ptr, ptr %298, align 8
  store ptr %299, ptr %15, align 8
  %300 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %300, ptr %16, align 8
  %301 = load ptr, ptr %15, align 8
  %302 = getelementptr inbounds %struct.TupleValue, ptr %301, i32 0, i32 0
  %303 = load i32, ptr %302, align 8
  %304 = load ptr, ptr %16, align 8
  %305 = getelementptr inbounds %struct.TupleValue, ptr %304, i32 0, i32 0
  store i32 %303, ptr %305, align 8
  %306 = load ptr, ptr %16, align 8
  %307 = getelementptr inbounds %struct.TupleValue, ptr %306, i32 0, i32 0
  %308 = load i32, ptr %307, align 8
  %309 = sext i32 %308 to i64
  %310 = mul i64 8, %309
  %311 = call noalias ptr @malloc(i64 noundef %310) #5
  %312 = load ptr, ptr %16, align 8
  %313 = getelementptr inbounds %struct.TupleValue, ptr %312, i32 0, i32 1
  store ptr %311, ptr %313, align 8
  store i32 0, ptr %17, align 4
  br label %314

314:                                              ; preds = %336, %296
  %315 = load i32, ptr %17, align 4
  %316 = load ptr, ptr %15, align 8
  %317 = getelementptr inbounds %struct.TupleValue, ptr %316, i32 0, i32 0
  %318 = load i32, ptr %317, align 8
  %319 = icmp slt i32 %315, %318
  br i1 %319, label %320, label %339

320:                                              ; preds = %314
  %321 = load ptr, ptr %15, align 8
  %322 = getelementptr inbounds %struct.TupleValue, ptr %321, i32 0, i32 1
  %323 = load ptr, ptr %322, align 8
  %324 = load i32, ptr %17, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds ptr, ptr %323, i64 %325
  %327 = load ptr, ptr %326, align 8
  %328 = load ptr, ptr %8, align 8
  %329 = call ptr @subCalcLangValues(ptr noundef %327, i32 noundef 1, ptr noundef %328, i32 noundef 0)
  %330 = load ptr, ptr %16, align 8
  %331 = getelementptr inbounds %struct.TupleValue, ptr %330, i32 0, i32 1
  %332 = load ptr, ptr %331, align 8
  %333 = load i32, ptr %17, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds ptr, ptr %332, i64 %334
  store ptr %329, ptr %335, align 8
  br label %336

336:                                              ; preds = %320
  %337 = load i32, ptr %17, align 4
  %338 = add nsw i32 %337, 1
  store i32 %338, ptr %17, align 4
  br label %314, !llvm.loop !26

339:                                              ; preds = %314
  %340 = load ptr, ptr %10, align 8
  %341 = getelementptr inbounds %struct.CalcLangVal, ptr %340, i32 0, i32 0
  store i32 7, ptr %341, align 8
  %342 = load ptr, ptr %16, align 8
  %343 = load ptr, ptr %10, align 8
  %344 = getelementptr inbounds %struct.CalcLangVal, ptr %343, i32 0, i32 1
  store ptr %342, ptr %344, align 8
  br label %1325

345:                                              ; preds = %291, %286
  %346 = load ptr, ptr %6, align 8
  %347 = getelementptr inbounds %struct.CalcLangVal, ptr %346, i32 0, i32 0
  %348 = load i32, ptr %347, align 8
  %349 = icmp eq i32 %348, 0
  br i1 %349, label %350, label %404

350:                                              ; preds = %345
  %351 = load ptr, ptr %8, align 8
  %352 = getelementptr inbounds %struct.CalcLangVal, ptr %351, i32 0, i32 0
  %353 = load i32, ptr %352, align 8
  %354 = icmp eq i32 %353, 7
  br i1 %354, label %355, label %404

355:                                              ; preds = %350
  %356 = load ptr, ptr %8, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load ptr, ptr %357, align 8
  store ptr %358, ptr %18, align 8
  %359 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %359, ptr %19, align 8
  %360 = load ptr, ptr %18, align 8
  %361 = getelementptr inbounds %struct.TupleValue, ptr %360, i32 0, i32 0
  %362 = load i32, ptr %361, align 8
  %363 = load ptr, ptr %19, align 8
  %364 = getelementptr inbounds %struct.TupleValue, ptr %363, i32 0, i32 0
  store i32 %362, ptr %364, align 8
  %365 = load ptr, ptr %19, align 8
  %366 = getelementptr inbounds %struct.TupleValue, ptr %365, i32 0, i32 0
  %367 = load i32, ptr %366, align 8
  %368 = sext i32 %367 to i64
  %369 = mul i64 8, %368
  %370 = call noalias ptr @malloc(i64 noundef %369) #5
  %371 = load ptr, ptr %19, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 1
  store ptr %370, ptr %372, align 8
  store i32 0, ptr %20, align 4
  br label %373

373:                                              ; preds = %395, %355
  %374 = load i32, ptr %20, align 4
  %375 = load ptr, ptr %18, align 8
  %376 = getelementptr inbounds %struct.TupleValue, ptr %375, i32 0, i32 0
  %377 = load i32, ptr %376, align 8
  %378 = icmp slt i32 %374, %377
  br i1 %378, label %379, label %398

379:                                              ; preds = %373
  %380 = load ptr, ptr %6, align 8
  %381 = load ptr, ptr %18, align 8
  %382 = getelementptr inbounds %struct.TupleValue, ptr %381, i32 0, i32 1
  %383 = load ptr, ptr %382, align 8
  %384 = load i32, ptr %20, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds ptr, ptr %383, i64 %385
  %387 = load ptr, ptr %386, align 8
  %388 = call ptr @subCalcLangValues(ptr noundef %380, i32 noundef 0, ptr noundef %387, i32 noundef 1)
  %389 = load ptr, ptr %19, align 8
  %390 = getelementptr inbounds %struct.TupleValue, ptr %389, i32 0, i32 1
  %391 = load ptr, ptr %390, align 8
  %392 = load i32, ptr %20, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds ptr, ptr %391, i64 %393
  store ptr %388, ptr %394, align 8
  br label %395

395:                                              ; preds = %379
  %396 = load i32, ptr %20, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, ptr %20, align 4
  br label %373, !llvm.loop !27

398:                                              ; preds = %373
  %399 = load ptr, ptr %10, align 8
  %400 = getelementptr inbounds %struct.CalcLangVal, ptr %399, i32 0, i32 0
  store i32 7, ptr %400, align 8
  %401 = load ptr, ptr %19, align 8
  %402 = load ptr, ptr %10, align 8
  %403 = getelementptr inbounds %struct.CalcLangVal, ptr %402, i32 0, i32 1
  store ptr %401, ptr %403, align 8
  br label %1324

404:                                              ; preds = %350, %345
  %405 = load ptr, ptr %6, align 8
  %406 = getelementptr inbounds %struct.CalcLangVal, ptr %405, i32 0, i32 0
  %407 = load i32, ptr %406, align 8
  %408 = icmp eq i32 %407, 7
  br i1 %408, label %409, label %463

409:                                              ; preds = %404
  %410 = load ptr, ptr %8, align 8
  %411 = getelementptr inbounds %struct.CalcLangVal, ptr %410, i32 0, i32 0
  %412 = load i32, ptr %411, align 8
  %413 = icmp eq i32 %412, 1
  br i1 %413, label %414, label %463

414:                                              ; preds = %409
  %415 = load ptr, ptr %6, align 8
  %416 = getelementptr inbounds %struct.CalcLangVal, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  store ptr %417, ptr %21, align 8
  %418 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %418, ptr %22, align 8
  %419 = load ptr, ptr %21, align 8
  %420 = getelementptr inbounds %struct.TupleValue, ptr %419, i32 0, i32 0
  %421 = load i32, ptr %420, align 8
  %422 = load ptr, ptr %22, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 0
  store i32 %421, ptr %423, align 8
  %424 = load ptr, ptr %22, align 8
  %425 = getelementptr inbounds %struct.TupleValue, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = sext i32 %426 to i64
  %428 = mul i64 8, %427
  %429 = call noalias ptr @malloc(i64 noundef %428) #5
  %430 = load ptr, ptr %22, align 8
  %431 = getelementptr inbounds %struct.TupleValue, ptr %430, i32 0, i32 1
  store ptr %429, ptr %431, align 8
  store i32 0, ptr %23, align 4
  br label %432

432:                                              ; preds = %454, %414
  %433 = load i32, ptr %23, align 4
  %434 = load ptr, ptr %21, align 8
  %435 = getelementptr inbounds %struct.TupleValue, ptr %434, i32 0, i32 0
  %436 = load i32, ptr %435, align 8
  %437 = icmp slt i32 %433, %436
  br i1 %437, label %438, label %457

438:                                              ; preds = %432
  %439 = load ptr, ptr %21, align 8
  %440 = getelementptr inbounds %struct.TupleValue, ptr %439, i32 0, i32 1
  %441 = load ptr, ptr %440, align 8
  %442 = load i32, ptr %23, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds ptr, ptr %441, i64 %443
  %445 = load ptr, ptr %444, align 8
  %446 = load ptr, ptr %8, align 8
  %447 = call ptr @subCalcLangValues(ptr noundef %445, i32 noundef 1, ptr noundef %446, i32 noundef 0)
  %448 = load ptr, ptr %22, align 8
  %449 = getelementptr inbounds %struct.TupleValue, ptr %448, i32 0, i32 1
  %450 = load ptr, ptr %449, align 8
  %451 = load i32, ptr %23, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds ptr, ptr %450, i64 %452
  store ptr %447, ptr %453, align 8
  br label %454

454:                                              ; preds = %438
  %455 = load i32, ptr %23, align 4
  %456 = add nsw i32 %455, 1
  store i32 %456, ptr %23, align 4
  br label %432, !llvm.loop !28

457:                                              ; preds = %432
  %458 = load ptr, ptr %10, align 8
  %459 = getelementptr inbounds %struct.CalcLangVal, ptr %458, i32 0, i32 0
  store i32 7, ptr %459, align 8
  %460 = load ptr, ptr %22, align 8
  %461 = load ptr, ptr %10, align 8
  %462 = getelementptr inbounds %struct.CalcLangVal, ptr %461, i32 0, i32 1
  store ptr %460, ptr %462, align 8
  br label %1323

463:                                              ; preds = %409, %404
  %464 = load ptr, ptr %6, align 8
  %465 = getelementptr inbounds %struct.CalcLangVal, ptr %464, i32 0, i32 0
  %466 = load i32, ptr %465, align 8
  %467 = icmp eq i32 %466, 1
  br i1 %467, label %468, label %522

468:                                              ; preds = %463
  %469 = load ptr, ptr %8, align 8
  %470 = getelementptr inbounds %struct.CalcLangVal, ptr %469, i32 0, i32 0
  %471 = load i32, ptr %470, align 8
  %472 = icmp eq i32 %471, 7
  br i1 %472, label %473, label %522

473:                                              ; preds = %468
  %474 = load ptr, ptr %8, align 8
  %475 = getelementptr inbounds %struct.CalcLangVal, ptr %474, i32 0, i32 1
  %476 = load ptr, ptr %475, align 8
  store ptr %476, ptr %24, align 8
  %477 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %477, ptr %25, align 8
  %478 = load ptr, ptr %24, align 8
  %479 = getelementptr inbounds %struct.TupleValue, ptr %478, i32 0, i32 0
  %480 = load i32, ptr %479, align 8
  %481 = load ptr, ptr %25, align 8
  %482 = getelementptr inbounds %struct.TupleValue, ptr %481, i32 0, i32 0
  store i32 %480, ptr %482, align 8
  %483 = load ptr, ptr %25, align 8
  %484 = getelementptr inbounds %struct.TupleValue, ptr %483, i32 0, i32 0
  %485 = load i32, ptr %484, align 8
  %486 = sext i32 %485 to i64
  %487 = mul i64 8, %486
  %488 = call noalias ptr @malloc(i64 noundef %487) #5
  %489 = load ptr, ptr %25, align 8
  %490 = getelementptr inbounds %struct.TupleValue, ptr %489, i32 0, i32 1
  store ptr %488, ptr %490, align 8
  store i32 0, ptr %26, align 4
  br label %491

491:                                              ; preds = %513, %473
  %492 = load i32, ptr %26, align 4
  %493 = load ptr, ptr %24, align 8
  %494 = getelementptr inbounds %struct.TupleValue, ptr %493, i32 0, i32 0
  %495 = load i32, ptr %494, align 8
  %496 = icmp slt i32 %492, %495
  br i1 %496, label %497, label %516

497:                                              ; preds = %491
  %498 = load ptr, ptr %6, align 8
  %499 = load ptr, ptr %24, align 8
  %500 = getelementptr inbounds %struct.TupleValue, ptr %499, i32 0, i32 1
  %501 = load ptr, ptr %500, align 8
  %502 = load i32, ptr %26, align 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds ptr, ptr %501, i64 %503
  %505 = load ptr, ptr %504, align 8
  %506 = call ptr @subCalcLangValues(ptr noundef %498, i32 noundef 0, ptr noundef %505, i32 noundef 1)
  %507 = load ptr, ptr %25, align 8
  %508 = getelementptr inbounds %struct.TupleValue, ptr %507, i32 0, i32 1
  %509 = load ptr, ptr %508, align 8
  %510 = load i32, ptr %26, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds ptr, ptr %509, i64 %511
  store ptr %506, ptr %512, align 8
  br label %513

513:                                              ; preds = %497
  %514 = load i32, ptr %26, align 4
  %515 = add nsw i32 %514, 1
  store i32 %515, ptr %26, align 4
  br label %491, !llvm.loop !29

516:                                              ; preds = %491
  %517 = load ptr, ptr %10, align 8
  %518 = getelementptr inbounds %struct.CalcLangVal, ptr %517, i32 0, i32 0
  store i32 7, ptr %518, align 8
  %519 = load ptr, ptr %25, align 8
  %520 = load ptr, ptr %10, align 8
  %521 = getelementptr inbounds %struct.CalcLangVal, ptr %520, i32 0, i32 1
  store ptr %519, ptr %521, align 8
  br label %1322

522:                                              ; preds = %468, %463
  %523 = load ptr, ptr %6, align 8
  %524 = getelementptr inbounds %struct.CalcLangVal, ptr %523, i32 0, i32 0
  %525 = load i32, ptr %524, align 8
  %526 = icmp eq i32 %525, 7
  br i1 %526, label %527, label %581

527:                                              ; preds = %522
  %528 = load ptr, ptr %8, align 8
  %529 = getelementptr inbounds %struct.CalcLangVal, ptr %528, i32 0, i32 0
  %530 = load i32, ptr %529, align 8
  %531 = icmp eq i32 %530, 3
  br i1 %531, label %532, label %581

532:                                              ; preds = %527
  %533 = load ptr, ptr %6, align 8
  %534 = getelementptr inbounds %struct.CalcLangVal, ptr %533, i32 0, i32 1
  %535 = load ptr, ptr %534, align 8
  store ptr %535, ptr %27, align 8
  %536 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %536, ptr %28, align 8
  %537 = load ptr, ptr %27, align 8
  %538 = getelementptr inbounds %struct.TupleValue, ptr %537, i32 0, i32 0
  %539 = load i32, ptr %538, align 8
  %540 = load ptr, ptr %28, align 8
  %541 = getelementptr inbounds %struct.TupleValue, ptr %540, i32 0, i32 0
  store i32 %539, ptr %541, align 8
  %542 = load ptr, ptr %28, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = sext i32 %544 to i64
  %546 = mul i64 8, %545
  %547 = call noalias ptr @malloc(i64 noundef %546) #5
  %548 = load ptr, ptr %28, align 8
  %549 = getelementptr inbounds %struct.TupleValue, ptr %548, i32 0, i32 1
  store ptr %547, ptr %549, align 8
  store i32 0, ptr %29, align 4
  br label %550

550:                                              ; preds = %572, %532
  %551 = load i32, ptr %29, align 4
  %552 = load ptr, ptr %27, align 8
  %553 = getelementptr inbounds %struct.TupleValue, ptr %552, i32 0, i32 0
  %554 = load i32, ptr %553, align 8
  %555 = icmp slt i32 %551, %554
  br i1 %555, label %556, label %575

556:                                              ; preds = %550
  %557 = load ptr, ptr %27, align 8
  %558 = getelementptr inbounds %struct.TupleValue, ptr %557, i32 0, i32 1
  %559 = load ptr, ptr %558, align 8
  %560 = load i32, ptr %29, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds ptr, ptr %559, i64 %561
  %563 = load ptr, ptr %562, align 8
  %564 = load ptr, ptr %8, align 8
  %565 = call ptr @subCalcLangValues(ptr noundef %563, i32 noundef 1, ptr noundef %564, i32 noundef 0)
  %566 = load ptr, ptr %28, align 8
  %567 = getelementptr inbounds %struct.TupleValue, ptr %566, i32 0, i32 1
  %568 = load ptr, ptr %567, align 8
  %569 = load i32, ptr %29, align 4
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds ptr, ptr %568, i64 %570
  store ptr %565, ptr %571, align 8
  br label %572

572:                                              ; preds = %556
  %573 = load i32, ptr %29, align 4
  %574 = add nsw i32 %573, 1
  store i32 %574, ptr %29, align 4
  br label %550, !llvm.loop !30

575:                                              ; preds = %550
  %576 = load ptr, ptr %10, align 8
  %577 = getelementptr inbounds %struct.CalcLangVal, ptr %576, i32 0, i32 0
  store i32 7, ptr %577, align 8
  %578 = load ptr, ptr %28, align 8
  %579 = load ptr, ptr %10, align 8
  %580 = getelementptr inbounds %struct.CalcLangVal, ptr %579, i32 0, i32 1
  store ptr %578, ptr %580, align 8
  br label %1321

581:                                              ; preds = %527, %522
  %582 = load ptr, ptr %6, align 8
  %583 = getelementptr inbounds %struct.CalcLangVal, ptr %582, i32 0, i32 0
  %584 = load i32, ptr %583, align 8
  %585 = icmp eq i32 %584, 3
  br i1 %585, label %586, label %640

586:                                              ; preds = %581
  %587 = load ptr, ptr %8, align 8
  %588 = getelementptr inbounds %struct.CalcLangVal, ptr %587, i32 0, i32 0
  %589 = load i32, ptr %588, align 8
  %590 = icmp eq i32 %589, 7
  br i1 %590, label %591, label %640

591:                                              ; preds = %586
  %592 = load ptr, ptr %8, align 8
  %593 = getelementptr inbounds %struct.CalcLangVal, ptr %592, i32 0, i32 1
  %594 = load ptr, ptr %593, align 8
  store ptr %594, ptr %30, align 8
  %595 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %595, ptr %31, align 8
  %596 = load ptr, ptr %30, align 8
  %597 = getelementptr inbounds %struct.TupleValue, ptr %596, i32 0, i32 0
  %598 = load i32, ptr %597, align 8
  %599 = load ptr, ptr %31, align 8
  %600 = getelementptr inbounds %struct.TupleValue, ptr %599, i32 0, i32 0
  store i32 %598, ptr %600, align 8
  %601 = load ptr, ptr %31, align 8
  %602 = getelementptr inbounds %struct.TupleValue, ptr %601, i32 0, i32 0
  %603 = load i32, ptr %602, align 8
  %604 = sext i32 %603 to i64
  %605 = mul i64 8, %604
  %606 = call noalias ptr @malloc(i64 noundef %605) #5
  %607 = load ptr, ptr %31, align 8
  %608 = getelementptr inbounds %struct.TupleValue, ptr %607, i32 0, i32 1
  store ptr %606, ptr %608, align 8
  store i32 0, ptr %32, align 4
  br label %609

609:                                              ; preds = %631, %591
  %610 = load i32, ptr %32, align 4
  %611 = load ptr, ptr %30, align 8
  %612 = getelementptr inbounds %struct.TupleValue, ptr %611, i32 0, i32 0
  %613 = load i32, ptr %612, align 8
  %614 = icmp slt i32 %610, %613
  br i1 %614, label %615, label %634

615:                                              ; preds = %609
  %616 = load ptr, ptr %6, align 8
  %617 = load ptr, ptr %30, align 8
  %618 = getelementptr inbounds %struct.TupleValue, ptr %617, i32 0, i32 1
  %619 = load ptr, ptr %618, align 8
  %620 = load i32, ptr %32, align 4
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds ptr, ptr %619, i64 %621
  %623 = load ptr, ptr %622, align 8
  %624 = call ptr @subCalcLangValues(ptr noundef %616, i32 noundef 0, ptr noundef %623, i32 noundef 1)
  %625 = load ptr, ptr %31, align 8
  %626 = getelementptr inbounds %struct.TupleValue, ptr %625, i32 0, i32 1
  %627 = load ptr, ptr %626, align 8
  %628 = load i32, ptr %32, align 4
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds ptr, ptr %627, i64 %629
  store ptr %624, ptr %630, align 8
  br label %631

631:                                              ; preds = %615
  %632 = load i32, ptr %32, align 4
  %633 = add nsw i32 %632, 1
  store i32 %633, ptr %32, align 4
  br label %609, !llvm.loop !31

634:                                              ; preds = %609
  %635 = load ptr, ptr %10, align 8
  %636 = getelementptr inbounds %struct.CalcLangVal, ptr %635, i32 0, i32 0
  store i32 7, ptr %636, align 8
  %637 = load ptr, ptr %31, align 8
  %638 = load ptr, ptr %10, align 8
  %639 = getelementptr inbounds %struct.CalcLangVal, ptr %638, i32 0, i32 1
  store ptr %637, ptr %639, align 8
  br label %1320

640:                                              ; preds = %586, %581
  %641 = load ptr, ptr %6, align 8
  %642 = getelementptr inbounds %struct.CalcLangVal, ptr %641, i32 0, i32 0
  %643 = load i32, ptr %642, align 8
  %644 = icmp eq i32 %643, 7
  br i1 %644, label %645, label %699

645:                                              ; preds = %640
  %646 = load ptr, ptr %8, align 8
  %647 = getelementptr inbounds %struct.CalcLangVal, ptr %646, i32 0, i32 0
  %648 = load i32, ptr %647, align 8
  %649 = icmp eq i32 %648, 4
  br i1 %649, label %650, label %699

650:                                              ; preds = %645
  %651 = load ptr, ptr %6, align 8
  %652 = getelementptr inbounds %struct.CalcLangVal, ptr %651, i32 0, i32 1
  %653 = load ptr, ptr %652, align 8
  store ptr %653, ptr %33, align 8
  %654 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %654, ptr %34, align 8
  %655 = load ptr, ptr %33, align 8
  %656 = getelementptr inbounds %struct.TupleValue, ptr %655, i32 0, i32 0
  %657 = load i32, ptr %656, align 8
  %658 = load ptr, ptr %34, align 8
  %659 = getelementptr inbounds %struct.TupleValue, ptr %658, i32 0, i32 0
  store i32 %657, ptr %659, align 8
  %660 = load ptr, ptr %34, align 8
  %661 = getelementptr inbounds %struct.TupleValue, ptr %660, i32 0, i32 0
  %662 = load i32, ptr %661, align 8
  %663 = sext i32 %662 to i64
  %664 = mul i64 8, %663
  %665 = call noalias ptr @malloc(i64 noundef %664) #5
  %666 = load ptr, ptr %34, align 8
  %667 = getelementptr inbounds %struct.TupleValue, ptr %666, i32 0, i32 1
  store ptr %665, ptr %667, align 8
  store i32 0, ptr %35, align 4
  br label %668

668:                                              ; preds = %690, %650
  %669 = load i32, ptr %35, align 4
  %670 = load ptr, ptr %33, align 8
  %671 = getelementptr inbounds %struct.TupleValue, ptr %670, i32 0, i32 0
  %672 = load i32, ptr %671, align 8
  %673 = icmp slt i32 %669, %672
  br i1 %673, label %674, label %693

674:                                              ; preds = %668
  %675 = load ptr, ptr %33, align 8
  %676 = getelementptr inbounds %struct.TupleValue, ptr %675, i32 0, i32 1
  %677 = load ptr, ptr %676, align 8
  %678 = load i32, ptr %35, align 4
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds ptr, ptr %677, i64 %679
  %681 = load ptr, ptr %680, align 8
  %682 = load ptr, ptr %8, align 8
  %683 = call ptr @subCalcLangValues(ptr noundef %681, i32 noundef 1, ptr noundef %682, i32 noundef 0)
  %684 = load ptr, ptr %34, align 8
  %685 = getelementptr inbounds %struct.TupleValue, ptr %684, i32 0, i32 1
  %686 = load ptr, ptr %685, align 8
  %687 = load i32, ptr %35, align 4
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds ptr, ptr %686, i64 %688
  store ptr %683, ptr %689, align 8
  br label %690

690:                                              ; preds = %674
  %691 = load i32, ptr %35, align 4
  %692 = add nsw i32 %691, 1
  store i32 %692, ptr %35, align 4
  br label %668, !llvm.loop !32

693:                                              ; preds = %668
  %694 = load ptr, ptr %10, align 8
  %695 = getelementptr inbounds %struct.CalcLangVal, ptr %694, i32 0, i32 0
  store i32 7, ptr %695, align 8
  %696 = load ptr, ptr %34, align 8
  %697 = load ptr, ptr %10, align 8
  %698 = getelementptr inbounds %struct.CalcLangVal, ptr %697, i32 0, i32 1
  store ptr %696, ptr %698, align 8
  br label %1319

699:                                              ; preds = %645, %640
  %700 = load ptr, ptr %6, align 8
  %701 = getelementptr inbounds %struct.CalcLangVal, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = icmp eq i32 %702, 4
  br i1 %703, label %704, label %758

704:                                              ; preds = %699
  %705 = load ptr, ptr %8, align 8
  %706 = getelementptr inbounds %struct.CalcLangVal, ptr %705, i32 0, i32 0
  %707 = load i32, ptr %706, align 8
  %708 = icmp eq i32 %707, 7
  br i1 %708, label %709, label %758

709:                                              ; preds = %704
  %710 = load ptr, ptr %8, align 8
  %711 = getelementptr inbounds %struct.CalcLangVal, ptr %710, i32 0, i32 1
  %712 = load ptr, ptr %711, align 8
  store ptr %712, ptr %36, align 8
  %713 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %713, ptr %37, align 8
  %714 = load ptr, ptr %36, align 8
  %715 = getelementptr inbounds %struct.TupleValue, ptr %714, i32 0, i32 0
  %716 = load i32, ptr %715, align 8
  %717 = load ptr, ptr %37, align 8
  %718 = getelementptr inbounds %struct.TupleValue, ptr %717, i32 0, i32 0
  store i32 %716, ptr %718, align 8
  %719 = load ptr, ptr %37, align 8
  %720 = getelementptr inbounds %struct.TupleValue, ptr %719, i32 0, i32 0
  %721 = load i32, ptr %720, align 8
  %722 = sext i32 %721 to i64
  %723 = mul i64 8, %722
  %724 = call noalias ptr @malloc(i64 noundef %723) #5
  %725 = load ptr, ptr %37, align 8
  %726 = getelementptr inbounds %struct.TupleValue, ptr %725, i32 0, i32 1
  store ptr %724, ptr %726, align 8
  store i32 0, ptr %38, align 4
  br label %727

727:                                              ; preds = %749, %709
  %728 = load i32, ptr %38, align 4
  %729 = load ptr, ptr %36, align 8
  %730 = getelementptr inbounds %struct.TupleValue, ptr %729, i32 0, i32 0
  %731 = load i32, ptr %730, align 8
  %732 = icmp slt i32 %728, %731
  br i1 %732, label %733, label %752

733:                                              ; preds = %727
  %734 = load ptr, ptr %6, align 8
  %735 = load ptr, ptr %36, align 8
  %736 = getelementptr inbounds %struct.TupleValue, ptr %735, i32 0, i32 1
  %737 = load ptr, ptr %736, align 8
  %738 = load i32, ptr %38, align 4
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds ptr, ptr %737, i64 %739
  %741 = load ptr, ptr %740, align 8
  %742 = call ptr @subCalcLangValues(ptr noundef %734, i32 noundef 0, ptr noundef %741, i32 noundef 1)
  %743 = load ptr, ptr %37, align 8
  %744 = getelementptr inbounds %struct.TupleValue, ptr %743, i32 0, i32 1
  %745 = load ptr, ptr %744, align 8
  %746 = load i32, ptr %38, align 4
  %747 = sext i32 %746 to i64
  %748 = getelementptr inbounds ptr, ptr %745, i64 %747
  store ptr %742, ptr %748, align 8
  br label %749

749:                                              ; preds = %733
  %750 = load i32, ptr %38, align 4
  %751 = add nsw i32 %750, 1
  store i32 %751, ptr %38, align 4
  br label %727, !llvm.loop !33

752:                                              ; preds = %727
  %753 = load ptr, ptr %10, align 8
  %754 = getelementptr inbounds %struct.CalcLangVal, ptr %753, i32 0, i32 0
  store i32 7, ptr %754, align 8
  %755 = load ptr, ptr %37, align 8
  %756 = load ptr, ptr %10, align 8
  %757 = getelementptr inbounds %struct.CalcLangVal, ptr %756, i32 0, i32 1
  store ptr %755, ptr %757, align 8
  br label %1318

758:                                              ; preds = %704, %699
  %759 = load ptr, ptr %6, align 8
  %760 = getelementptr inbounds %struct.CalcLangVal, ptr %759, i32 0, i32 0
  %761 = load i32, ptr %760, align 8
  %762 = icmp eq i32 %761, 6
  br i1 %762, label %763, label %836

763:                                              ; preds = %758
  %764 = load ptr, ptr %8, align 8
  %765 = getelementptr inbounds %struct.CalcLangVal, ptr %764, i32 0, i32 0
  %766 = load i32, ptr %765, align 8
  %767 = icmp eq i32 %766, 6
  br i1 %767, label %768, label %836

768:                                              ; preds = %763
  %769 = load ptr, ptr %6, align 8
  %770 = getelementptr inbounds %struct.CalcLangVal, ptr %769, i32 0, i32 1
  %771 = load ptr, ptr %770, align 8
  store ptr %771, ptr %39, align 8
  %772 = load ptr, ptr %8, align 8
  %773 = getelementptr inbounds %struct.CalcLangVal, ptr %772, i32 0, i32 1
  %774 = load ptr, ptr %773, align 8
  store ptr %774, ptr %40, align 8
  %775 = load ptr, ptr %40, align 8
  %776 = getelementptr inbounds %struct.SetValue, ptr %775, i32 0, i32 0
  %777 = load i32, ptr %776, align 8
  %778 = load ptr, ptr %39, align 8
  %779 = getelementptr inbounds %struct.SetValue, ptr %778, i32 0, i32 0
  %780 = load i32, ptr %779, align 8
  %781 = icmp eq i32 %777, %780
  br i1 %781, label %782, label %834

782:                                              ; preds = %768
  %783 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %783, ptr %41, align 8
  %784 = load ptr, ptr %39, align 8
  %785 = getelementptr inbounds %struct.SetValue, ptr %784, i32 0, i32 0
  %786 = load i32, ptr %785, align 8
  %787 = load ptr, ptr %41, align 8
  %788 = getelementptr inbounds %struct.SetValue, ptr %787, i32 0, i32 0
  store i32 %786, ptr %788, align 8
  %789 = load ptr, ptr %41, align 8
  %790 = getelementptr inbounds %struct.SetValue, ptr %789, i32 0, i32 0
  %791 = load i32, ptr %790, align 8
  %792 = sext i32 %791 to i64
  %793 = mul i64 8, %792
  %794 = call noalias ptr @malloc(i64 noundef %793) #5
  %795 = load ptr, ptr %41, align 8
  %796 = getelementptr inbounds %struct.SetValue, ptr %795, i32 0, i32 1
  store ptr %794, ptr %796, align 8
  store i32 0, ptr %42, align 4
  br label %797

797:                                              ; preds = %825, %782
  %798 = load i32, ptr %42, align 4
  %799 = load ptr, ptr %39, align 8
  %800 = getelementptr inbounds %struct.SetValue, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = icmp slt i32 %798, %801
  br i1 %802, label %803, label %828

803:                                              ; preds = %797
  %804 = load ptr, ptr %39, align 8
  %805 = getelementptr inbounds %struct.SetValue, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  %807 = load i32, ptr %42, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds ptr, ptr %806, i64 %808
  %810 = load ptr, ptr %809, align 8
  %811 = load ptr, ptr %40, align 8
  %812 = getelementptr inbounds %struct.SetValue, ptr %811, i32 0, i32 1
  %813 = load ptr, ptr %812, align 8
  %814 = load i32, ptr %42, align 4
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds ptr, ptr %813, i64 %815
  %817 = load ptr, ptr %816, align 8
  %818 = call ptr @subCalcLangValues(ptr noundef %810, i32 noundef 1, ptr noundef %817, i32 noundef 1)
  %819 = load ptr, ptr %41, align 8
  %820 = getelementptr inbounds %struct.SetValue, ptr %819, i32 0, i32 1
  %821 = load ptr, ptr %820, align 8
  %822 = load i32, ptr %42, align 4
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds ptr, ptr %821, i64 %823
  store ptr %818, ptr %824, align 8
  br label %825

825:                                              ; preds = %803
  %826 = load i32, ptr %42, align 4
  %827 = add nsw i32 %826, 1
  store i32 %827, ptr %42, align 4
  br label %797, !llvm.loop !34

828:                                              ; preds = %797
  %829 = load ptr, ptr %10, align 8
  %830 = getelementptr inbounds %struct.CalcLangVal, ptr %829, i32 0, i32 0
  store i32 6, ptr %830, align 8
  %831 = load ptr, ptr %41, align 8
  %832 = load ptr, ptr %10, align 8
  %833 = getelementptr inbounds %struct.CalcLangVal, ptr %832, i32 0, i32 1
  store ptr %831, ptr %833, align 8
  br label %835

834:                                              ; preds = %768
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1345

835:                                              ; preds = %828
  br label %1317

836:                                              ; preds = %763, %758
  %837 = load ptr, ptr %6, align 8
  %838 = getelementptr inbounds %struct.CalcLangVal, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp eq i32 %839, 6
  br i1 %840, label %841, label %895

841:                                              ; preds = %836
  %842 = load ptr, ptr %8, align 8
  %843 = getelementptr inbounds %struct.CalcLangVal, ptr %842, i32 0, i32 0
  %844 = load i32, ptr %843, align 8
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %895

846:                                              ; preds = %841
  %847 = load ptr, ptr %6, align 8
  %848 = getelementptr inbounds %struct.CalcLangVal, ptr %847, i32 0, i32 1
  %849 = load ptr, ptr %848, align 8
  store ptr %849, ptr %43, align 8
  %850 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %850, ptr %44, align 8
  %851 = load ptr, ptr %43, align 8
  %852 = getelementptr inbounds %struct.SetValue, ptr %851, i32 0, i32 0
  %853 = load i32, ptr %852, align 8
  %854 = load ptr, ptr %44, align 8
  %855 = getelementptr inbounds %struct.SetValue, ptr %854, i32 0, i32 0
  store i32 %853, ptr %855, align 8
  %856 = load ptr, ptr %44, align 8
  %857 = getelementptr inbounds %struct.SetValue, ptr %856, i32 0, i32 0
  %858 = load i32, ptr %857, align 8
  %859 = sext i32 %858 to i64
  %860 = mul i64 8, %859
  %861 = call noalias ptr @malloc(i64 noundef %860) #5
  %862 = load ptr, ptr %44, align 8
  %863 = getelementptr inbounds %struct.SetValue, ptr %862, i32 0, i32 1
  store ptr %861, ptr %863, align 8
  store i32 0, ptr %45, align 4
  br label %864

864:                                              ; preds = %886, %846
  %865 = load i32, ptr %45, align 4
  %866 = load ptr, ptr %43, align 8
  %867 = getelementptr inbounds %struct.SetValue, ptr %866, i32 0, i32 0
  %868 = load i32, ptr %867, align 8
  %869 = icmp slt i32 %865, %868
  br i1 %869, label %870, label %889

870:                                              ; preds = %864
  %871 = load ptr, ptr %43, align 8
  %872 = getelementptr inbounds %struct.SetValue, ptr %871, i32 0, i32 1
  %873 = load ptr, ptr %872, align 8
  %874 = load i32, ptr %45, align 4
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds ptr, ptr %873, i64 %875
  %877 = load ptr, ptr %876, align 8
  %878 = load ptr, ptr %8, align 8
  %879 = call ptr @subCalcLangValues(ptr noundef %877, i32 noundef 1, ptr noundef %878, i32 noundef 0)
  %880 = load ptr, ptr %44, align 8
  %881 = getelementptr inbounds %struct.SetValue, ptr %880, i32 0, i32 1
  %882 = load ptr, ptr %881, align 8
  %883 = load i32, ptr %45, align 4
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds ptr, ptr %882, i64 %884
  store ptr %879, ptr %885, align 8
  br label %886

886:                                              ; preds = %870
  %887 = load i32, ptr %45, align 4
  %888 = add nsw i32 %887, 1
  store i32 %888, ptr %45, align 4
  br label %864, !llvm.loop !35

889:                                              ; preds = %864
  %890 = load ptr, ptr %10, align 8
  %891 = getelementptr inbounds %struct.CalcLangVal, ptr %890, i32 0, i32 0
  store i32 6, ptr %891, align 8
  %892 = load ptr, ptr %44, align 8
  %893 = load ptr, ptr %10, align 8
  %894 = getelementptr inbounds %struct.CalcLangVal, ptr %893, i32 0, i32 1
  store ptr %892, ptr %894, align 8
  br label %1316

895:                                              ; preds = %841, %836
  %896 = load ptr, ptr %6, align 8
  %897 = getelementptr inbounds %struct.CalcLangVal, ptr %896, i32 0, i32 0
  %898 = load i32, ptr %897, align 8
  %899 = icmp eq i32 %898, 0
  br i1 %899, label %900, label %954

900:                                              ; preds = %895
  %901 = load ptr, ptr %8, align 8
  %902 = getelementptr inbounds %struct.CalcLangVal, ptr %901, i32 0, i32 0
  %903 = load i32, ptr %902, align 8
  %904 = icmp eq i32 %903, 6
  br i1 %904, label %905, label %954

905:                                              ; preds = %900
  %906 = load ptr, ptr %8, align 8
  %907 = getelementptr inbounds %struct.CalcLangVal, ptr %906, i32 0, i32 1
  %908 = load ptr, ptr %907, align 8
  store ptr %908, ptr %46, align 8
  %909 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %909, ptr %47, align 8
  %910 = load ptr, ptr %46, align 8
  %911 = getelementptr inbounds %struct.SetValue, ptr %910, i32 0, i32 0
  %912 = load i32, ptr %911, align 8
  %913 = load ptr, ptr %47, align 8
  %914 = getelementptr inbounds %struct.SetValue, ptr %913, i32 0, i32 0
  store i32 %912, ptr %914, align 8
  %915 = load ptr, ptr %47, align 8
  %916 = getelementptr inbounds %struct.SetValue, ptr %915, i32 0, i32 0
  %917 = load i32, ptr %916, align 8
  %918 = sext i32 %917 to i64
  %919 = mul i64 8, %918
  %920 = call noalias ptr @malloc(i64 noundef %919) #5
  %921 = load ptr, ptr %47, align 8
  %922 = getelementptr inbounds %struct.SetValue, ptr %921, i32 0, i32 1
  store ptr %920, ptr %922, align 8
  store i32 0, ptr %48, align 4
  br label %923

923:                                              ; preds = %945, %905
  %924 = load i32, ptr %48, align 4
  %925 = load ptr, ptr %46, align 8
  %926 = getelementptr inbounds %struct.SetValue, ptr %925, i32 0, i32 0
  %927 = load i32, ptr %926, align 8
  %928 = icmp slt i32 %924, %927
  br i1 %928, label %929, label %948

929:                                              ; preds = %923
  %930 = load ptr, ptr %6, align 8
  %931 = load ptr, ptr %46, align 8
  %932 = getelementptr inbounds %struct.SetValue, ptr %931, i32 0, i32 1
  %933 = load ptr, ptr %932, align 8
  %934 = load i32, ptr %48, align 4
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds ptr, ptr %933, i64 %935
  %937 = load ptr, ptr %936, align 8
  %938 = call ptr @subCalcLangValues(ptr noundef %930, i32 noundef 0, ptr noundef %937, i32 noundef 1)
  %939 = load ptr, ptr %47, align 8
  %940 = getelementptr inbounds %struct.SetValue, ptr %939, i32 0, i32 1
  %941 = load ptr, ptr %940, align 8
  %942 = load i32, ptr %48, align 4
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds ptr, ptr %941, i64 %943
  store ptr %938, ptr %944, align 8
  br label %945

945:                                              ; preds = %929
  %946 = load i32, ptr %48, align 4
  %947 = add nsw i32 %946, 1
  store i32 %947, ptr %48, align 4
  br label %923, !llvm.loop !36

948:                                              ; preds = %923
  %949 = load ptr, ptr %10, align 8
  %950 = getelementptr inbounds %struct.CalcLangVal, ptr %949, i32 0, i32 0
  store i32 6, ptr %950, align 8
  %951 = load ptr, ptr %47, align 8
  %952 = load ptr, ptr %10, align 8
  %953 = getelementptr inbounds %struct.CalcLangVal, ptr %952, i32 0, i32 1
  store ptr %951, ptr %953, align 8
  br label %1315

954:                                              ; preds = %900, %895
  %955 = load ptr, ptr %6, align 8
  %956 = getelementptr inbounds %struct.CalcLangVal, ptr %955, i32 0, i32 0
  %957 = load i32, ptr %956, align 8
  %958 = icmp eq i32 %957, 6
  br i1 %958, label %959, label %1013

959:                                              ; preds = %954
  %960 = load ptr, ptr %8, align 8
  %961 = getelementptr inbounds %struct.CalcLangVal, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = icmp eq i32 %962, 1
  br i1 %963, label %964, label %1013

964:                                              ; preds = %959
  %965 = load ptr, ptr %6, align 8
  %966 = getelementptr inbounds %struct.CalcLangVal, ptr %965, i32 0, i32 1
  %967 = load ptr, ptr %966, align 8
  store ptr %967, ptr %49, align 8
  %968 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %968, ptr %50, align 8
  %969 = load ptr, ptr %49, align 8
  %970 = getelementptr inbounds %struct.SetValue, ptr %969, i32 0, i32 0
  %971 = load i32, ptr %970, align 8
  %972 = load ptr, ptr %50, align 8
  %973 = getelementptr inbounds %struct.SetValue, ptr %972, i32 0, i32 0
  store i32 %971, ptr %973, align 8
  %974 = load ptr, ptr %50, align 8
  %975 = getelementptr inbounds %struct.SetValue, ptr %974, i32 0, i32 0
  %976 = load i32, ptr %975, align 8
  %977 = sext i32 %976 to i64
  %978 = mul i64 8, %977
  %979 = call noalias ptr @malloc(i64 noundef %978) #5
  %980 = load ptr, ptr %50, align 8
  %981 = getelementptr inbounds %struct.SetValue, ptr %980, i32 0, i32 1
  store ptr %979, ptr %981, align 8
  store i32 0, ptr %51, align 4
  br label %982

982:                                              ; preds = %1004, %964
  %983 = load i32, ptr %51, align 4
  %984 = load ptr, ptr %49, align 8
  %985 = getelementptr inbounds %struct.SetValue, ptr %984, i32 0, i32 0
  %986 = load i32, ptr %985, align 8
  %987 = icmp slt i32 %983, %986
  br i1 %987, label %988, label %1007

988:                                              ; preds = %982
  %989 = load ptr, ptr %49, align 8
  %990 = getelementptr inbounds %struct.SetValue, ptr %989, i32 0, i32 1
  %991 = load ptr, ptr %990, align 8
  %992 = load i32, ptr %51, align 4
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds ptr, ptr %991, i64 %993
  %995 = load ptr, ptr %994, align 8
  %996 = load ptr, ptr %8, align 8
  %997 = call ptr @subCalcLangValues(ptr noundef %995, i32 noundef 1, ptr noundef %996, i32 noundef 0)
  %998 = load ptr, ptr %50, align 8
  %999 = getelementptr inbounds %struct.SetValue, ptr %998, i32 0, i32 1
  %1000 = load ptr, ptr %999, align 8
  %1001 = load i32, ptr %51, align 4
  %1002 = sext i32 %1001 to i64
  %1003 = getelementptr inbounds ptr, ptr %1000, i64 %1002
  store ptr %997, ptr %1003, align 8
  br label %1004

1004:                                             ; preds = %988
  %1005 = load i32, ptr %51, align 4
  %1006 = add nsw i32 %1005, 1
  store i32 %1006, ptr %51, align 4
  br label %982, !llvm.loop !37

1007:                                             ; preds = %982
  %1008 = load ptr, ptr %10, align 8
  %1009 = getelementptr inbounds %struct.CalcLangVal, ptr %1008, i32 0, i32 0
  store i32 7, ptr %1009, align 8
  %1010 = load ptr, ptr %50, align 8
  %1011 = load ptr, ptr %10, align 8
  %1012 = getelementptr inbounds %struct.CalcLangVal, ptr %1011, i32 0, i32 1
  store ptr %1010, ptr %1012, align 8
  br label %1314

1013:                                             ; preds = %959, %954
  %1014 = load ptr, ptr %6, align 8
  %1015 = getelementptr inbounds %struct.CalcLangVal, ptr %1014, i32 0, i32 0
  %1016 = load i32, ptr %1015, align 8
  %1017 = icmp eq i32 %1016, 1
  br i1 %1017, label %1018, label %1072

1018:                                             ; preds = %1013
  %1019 = load ptr, ptr %8, align 8
  %1020 = getelementptr inbounds %struct.CalcLangVal, ptr %1019, i32 0, i32 0
  %1021 = load i32, ptr %1020, align 8
  %1022 = icmp eq i32 %1021, 6
  br i1 %1022, label %1023, label %1072

1023:                                             ; preds = %1018
  %1024 = load ptr, ptr %8, align 8
  %1025 = getelementptr inbounds %struct.CalcLangVal, ptr %1024, i32 0, i32 1
  %1026 = load ptr, ptr %1025, align 8
  store ptr %1026, ptr %52, align 8
  %1027 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1027, ptr %53, align 8
  %1028 = load ptr, ptr %52, align 8
  %1029 = getelementptr inbounds %struct.SetValue, ptr %1028, i32 0, i32 0
  %1030 = load i32, ptr %1029, align 8
  %1031 = load ptr, ptr %53, align 8
  %1032 = getelementptr inbounds %struct.SetValue, ptr %1031, i32 0, i32 0
  store i32 %1030, ptr %1032, align 8
  %1033 = load ptr, ptr %53, align 8
  %1034 = getelementptr inbounds %struct.SetValue, ptr %1033, i32 0, i32 0
  %1035 = load i32, ptr %1034, align 8
  %1036 = sext i32 %1035 to i64
  %1037 = mul i64 8, %1036
  %1038 = call noalias ptr @malloc(i64 noundef %1037) #5
  %1039 = load ptr, ptr %53, align 8
  %1040 = getelementptr inbounds %struct.SetValue, ptr %1039, i32 0, i32 1
  store ptr %1038, ptr %1040, align 8
  store i32 0, ptr %54, align 4
  br label %1041

1041:                                             ; preds = %1063, %1023
  %1042 = load i32, ptr %54, align 4
  %1043 = load ptr, ptr %52, align 8
  %1044 = getelementptr inbounds %struct.SetValue, ptr %1043, i32 0, i32 0
  %1045 = load i32, ptr %1044, align 8
  %1046 = icmp slt i32 %1042, %1045
  br i1 %1046, label %1047, label %1066

1047:                                             ; preds = %1041
  %1048 = load ptr, ptr %6, align 8
  %1049 = load ptr, ptr %52, align 8
  %1050 = getelementptr inbounds %struct.SetValue, ptr %1049, i32 0, i32 1
  %1051 = load ptr, ptr %1050, align 8
  %1052 = load i32, ptr %54, align 4
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds ptr, ptr %1051, i64 %1053
  %1055 = load ptr, ptr %1054, align 8
  %1056 = call ptr @subCalcLangValues(ptr noundef %1048, i32 noundef 0, ptr noundef %1055, i32 noundef 1)
  %1057 = load ptr, ptr %53, align 8
  %1058 = getelementptr inbounds %struct.SetValue, ptr %1057, i32 0, i32 1
  %1059 = load ptr, ptr %1058, align 8
  %1060 = load i32, ptr %54, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds ptr, ptr %1059, i64 %1061
  store ptr %1056, ptr %1062, align 8
  br label %1063

1063:                                             ; preds = %1047
  %1064 = load i32, ptr %54, align 4
  %1065 = add nsw i32 %1064, 1
  store i32 %1065, ptr %54, align 4
  br label %1041, !llvm.loop !38

1066:                                             ; preds = %1041
  %1067 = load ptr, ptr %10, align 8
  %1068 = getelementptr inbounds %struct.CalcLangVal, ptr %1067, i32 0, i32 0
  store i32 6, ptr %1068, align 8
  %1069 = load ptr, ptr %53, align 8
  %1070 = load ptr, ptr %10, align 8
  %1071 = getelementptr inbounds %struct.CalcLangVal, ptr %1070, i32 0, i32 1
  store ptr %1069, ptr %1071, align 8
  br label %1313

1072:                                             ; preds = %1018, %1013
  %1073 = load ptr, ptr %6, align 8
  %1074 = getelementptr inbounds %struct.CalcLangVal, ptr %1073, i32 0, i32 0
  %1075 = load i32, ptr %1074, align 8
  %1076 = icmp eq i32 %1075, 6
  br i1 %1076, label %1077, label %1131

1077:                                             ; preds = %1072
  %1078 = load ptr, ptr %8, align 8
  %1079 = getelementptr inbounds %struct.CalcLangVal, ptr %1078, i32 0, i32 0
  %1080 = load i32, ptr %1079, align 8
  %1081 = icmp eq i32 %1080, 3
  br i1 %1081, label %1082, label %1131

1082:                                             ; preds = %1077
  %1083 = load ptr, ptr %6, align 8
  %1084 = getelementptr inbounds %struct.CalcLangVal, ptr %1083, i32 0, i32 1
  %1085 = load ptr, ptr %1084, align 8
  store ptr %1085, ptr %55, align 8
  %1086 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1086, ptr %56, align 8
  %1087 = load ptr, ptr %55, align 8
  %1088 = getelementptr inbounds %struct.SetValue, ptr %1087, i32 0, i32 0
  %1089 = load i32, ptr %1088, align 8
  %1090 = load ptr, ptr %56, align 8
  %1091 = getelementptr inbounds %struct.SetValue, ptr %1090, i32 0, i32 0
  store i32 %1089, ptr %1091, align 8
  %1092 = load ptr, ptr %56, align 8
  %1093 = getelementptr inbounds %struct.SetValue, ptr %1092, i32 0, i32 0
  %1094 = load i32, ptr %1093, align 8
  %1095 = sext i32 %1094 to i64
  %1096 = mul i64 8, %1095
  %1097 = call noalias ptr @malloc(i64 noundef %1096) #5
  %1098 = load ptr, ptr %56, align 8
  %1099 = getelementptr inbounds %struct.SetValue, ptr %1098, i32 0, i32 1
  store ptr %1097, ptr %1099, align 8
  store i32 0, ptr %57, align 4
  br label %1100

1100:                                             ; preds = %1122, %1082
  %1101 = load i32, ptr %57, align 4
  %1102 = load ptr, ptr %55, align 8
  %1103 = getelementptr inbounds %struct.SetValue, ptr %1102, i32 0, i32 0
  %1104 = load i32, ptr %1103, align 8
  %1105 = icmp slt i32 %1101, %1104
  br i1 %1105, label %1106, label %1125

1106:                                             ; preds = %1100
  %1107 = load ptr, ptr %55, align 8
  %1108 = getelementptr inbounds %struct.SetValue, ptr %1107, i32 0, i32 1
  %1109 = load ptr, ptr %1108, align 8
  %1110 = load i32, ptr %57, align 4
  %1111 = sext i32 %1110 to i64
  %1112 = getelementptr inbounds ptr, ptr %1109, i64 %1111
  %1113 = load ptr, ptr %1112, align 8
  %1114 = load ptr, ptr %8, align 8
  %1115 = call ptr @subCalcLangValues(ptr noundef %1113, i32 noundef 1, ptr noundef %1114, i32 noundef 0)
  %1116 = load ptr, ptr %56, align 8
  %1117 = getelementptr inbounds %struct.SetValue, ptr %1116, i32 0, i32 1
  %1118 = load ptr, ptr %1117, align 8
  %1119 = load i32, ptr %57, align 4
  %1120 = sext i32 %1119 to i64
  %1121 = getelementptr inbounds ptr, ptr %1118, i64 %1120
  store ptr %1115, ptr %1121, align 8
  br label %1122

1122:                                             ; preds = %1106
  %1123 = load i32, ptr %57, align 4
  %1124 = add nsw i32 %1123, 1
  store i32 %1124, ptr %57, align 4
  br label %1100, !llvm.loop !39

1125:                                             ; preds = %1100
  %1126 = load ptr, ptr %10, align 8
  %1127 = getelementptr inbounds %struct.CalcLangVal, ptr %1126, i32 0, i32 0
  store i32 6, ptr %1127, align 8
  %1128 = load ptr, ptr %56, align 8
  %1129 = load ptr, ptr %10, align 8
  %1130 = getelementptr inbounds %struct.CalcLangVal, ptr %1129, i32 0, i32 1
  store ptr %1128, ptr %1130, align 8
  br label %1312

1131:                                             ; preds = %1077, %1072
  %1132 = load ptr, ptr %6, align 8
  %1133 = getelementptr inbounds %struct.CalcLangVal, ptr %1132, i32 0, i32 0
  %1134 = load i32, ptr %1133, align 8
  %1135 = icmp eq i32 %1134, 3
  br i1 %1135, label %1136, label %1190

1136:                                             ; preds = %1131
  %1137 = load ptr, ptr %8, align 8
  %1138 = getelementptr inbounds %struct.CalcLangVal, ptr %1137, i32 0, i32 0
  %1139 = load i32, ptr %1138, align 8
  %1140 = icmp eq i32 %1139, 6
  br i1 %1140, label %1141, label %1190

1141:                                             ; preds = %1136
  %1142 = load ptr, ptr %8, align 8
  %1143 = getelementptr inbounds %struct.CalcLangVal, ptr %1142, i32 0, i32 1
  %1144 = load ptr, ptr %1143, align 8
  store ptr %1144, ptr %58, align 8
  %1145 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1145, ptr %59, align 8
  %1146 = load ptr, ptr %58, align 8
  %1147 = getelementptr inbounds %struct.SetValue, ptr %1146, i32 0, i32 0
  %1148 = load i32, ptr %1147, align 8
  %1149 = load ptr, ptr %59, align 8
  %1150 = getelementptr inbounds %struct.SetValue, ptr %1149, i32 0, i32 0
  store i32 %1148, ptr %1150, align 8
  %1151 = load ptr, ptr %59, align 8
  %1152 = getelementptr inbounds %struct.SetValue, ptr %1151, i32 0, i32 0
  %1153 = load i32, ptr %1152, align 8
  %1154 = sext i32 %1153 to i64
  %1155 = mul i64 8, %1154
  %1156 = call noalias ptr @malloc(i64 noundef %1155) #5
  %1157 = load ptr, ptr %59, align 8
  %1158 = getelementptr inbounds %struct.SetValue, ptr %1157, i32 0, i32 1
  store ptr %1156, ptr %1158, align 8
  store i32 0, ptr %60, align 4
  br label %1159

1159:                                             ; preds = %1181, %1141
  %1160 = load i32, ptr %60, align 4
  %1161 = load ptr, ptr %58, align 8
  %1162 = getelementptr inbounds %struct.SetValue, ptr %1161, i32 0, i32 0
  %1163 = load i32, ptr %1162, align 8
  %1164 = icmp slt i32 %1160, %1163
  br i1 %1164, label %1165, label %1184

1165:                                             ; preds = %1159
  %1166 = load ptr, ptr %6, align 8
  %1167 = load ptr, ptr %58, align 8
  %1168 = getelementptr inbounds %struct.SetValue, ptr %1167, i32 0, i32 1
  %1169 = load ptr, ptr %1168, align 8
  %1170 = load i32, ptr %60, align 4
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds ptr, ptr %1169, i64 %1171
  %1173 = load ptr, ptr %1172, align 8
  %1174 = call ptr @subCalcLangValues(ptr noundef %1166, i32 noundef 0, ptr noundef %1173, i32 noundef 1)
  %1175 = load ptr, ptr %59, align 8
  %1176 = getelementptr inbounds %struct.SetValue, ptr %1175, i32 0, i32 1
  %1177 = load ptr, ptr %1176, align 8
  %1178 = load i32, ptr %60, align 4
  %1179 = sext i32 %1178 to i64
  %1180 = getelementptr inbounds ptr, ptr %1177, i64 %1179
  store ptr %1174, ptr %1180, align 8
  br label %1181

1181:                                             ; preds = %1165
  %1182 = load i32, ptr %60, align 4
  %1183 = add nsw i32 %1182, 1
  store i32 %1183, ptr %60, align 4
  br label %1159, !llvm.loop !40

1184:                                             ; preds = %1159
  %1185 = load ptr, ptr %10, align 8
  %1186 = getelementptr inbounds %struct.CalcLangVal, ptr %1185, i32 0, i32 0
  store i32 6, ptr %1186, align 8
  %1187 = load ptr, ptr %59, align 8
  %1188 = load ptr, ptr %10, align 8
  %1189 = getelementptr inbounds %struct.CalcLangVal, ptr %1188, i32 0, i32 1
  store ptr %1187, ptr %1189, align 8
  br label %1311

1190:                                             ; preds = %1136, %1131
  %1191 = load ptr, ptr %6, align 8
  %1192 = getelementptr inbounds %struct.CalcLangVal, ptr %1191, i32 0, i32 0
  %1193 = load i32, ptr %1192, align 8
  %1194 = icmp eq i32 %1193, 6
  br i1 %1194, label %1195, label %1249

1195:                                             ; preds = %1190
  %1196 = load ptr, ptr %8, align 8
  %1197 = getelementptr inbounds %struct.CalcLangVal, ptr %1196, i32 0, i32 0
  %1198 = load i32, ptr %1197, align 8
  %1199 = icmp eq i32 %1198, 4
  br i1 %1199, label %1200, label %1249

1200:                                             ; preds = %1195
  %1201 = load ptr, ptr %6, align 8
  %1202 = getelementptr inbounds %struct.CalcLangVal, ptr %1201, i32 0, i32 1
  %1203 = load ptr, ptr %1202, align 8
  store ptr %1203, ptr %61, align 8
  %1204 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1204, ptr %62, align 8
  %1205 = load ptr, ptr %61, align 8
  %1206 = getelementptr inbounds %struct.SetValue, ptr %1205, i32 0, i32 0
  %1207 = load i32, ptr %1206, align 8
  %1208 = load ptr, ptr %62, align 8
  %1209 = getelementptr inbounds %struct.SetValue, ptr %1208, i32 0, i32 0
  store i32 %1207, ptr %1209, align 8
  %1210 = load ptr, ptr %62, align 8
  %1211 = getelementptr inbounds %struct.SetValue, ptr %1210, i32 0, i32 0
  %1212 = load i32, ptr %1211, align 8
  %1213 = sext i32 %1212 to i64
  %1214 = mul i64 8, %1213
  %1215 = call noalias ptr @malloc(i64 noundef %1214) #5
  %1216 = load ptr, ptr %62, align 8
  %1217 = getelementptr inbounds %struct.SetValue, ptr %1216, i32 0, i32 1
  store ptr %1215, ptr %1217, align 8
  store i32 0, ptr %63, align 4
  br label %1218

1218:                                             ; preds = %1240, %1200
  %1219 = load i32, ptr %63, align 4
  %1220 = load ptr, ptr %61, align 8
  %1221 = getelementptr inbounds %struct.SetValue, ptr %1220, i32 0, i32 0
  %1222 = load i32, ptr %1221, align 8
  %1223 = icmp slt i32 %1219, %1222
  br i1 %1223, label %1224, label %1243

1224:                                             ; preds = %1218
  %1225 = load ptr, ptr %61, align 8
  %1226 = getelementptr inbounds %struct.SetValue, ptr %1225, i32 0, i32 1
  %1227 = load ptr, ptr %1226, align 8
  %1228 = load i32, ptr %63, align 4
  %1229 = sext i32 %1228 to i64
  %1230 = getelementptr inbounds ptr, ptr %1227, i64 %1229
  %1231 = load ptr, ptr %1230, align 8
  %1232 = load ptr, ptr %8, align 8
  %1233 = call ptr @subCalcLangValues(ptr noundef %1231, i32 noundef 1, ptr noundef %1232, i32 noundef 0)
  %1234 = load ptr, ptr %62, align 8
  %1235 = getelementptr inbounds %struct.SetValue, ptr %1234, i32 0, i32 1
  %1236 = load ptr, ptr %1235, align 8
  %1237 = load i32, ptr %63, align 4
  %1238 = sext i32 %1237 to i64
  %1239 = getelementptr inbounds ptr, ptr %1236, i64 %1238
  store ptr %1233, ptr %1239, align 8
  br label %1240

1240:                                             ; preds = %1224
  %1241 = load i32, ptr %63, align 4
  %1242 = add nsw i32 %1241, 1
  store i32 %1242, ptr %63, align 4
  br label %1218, !llvm.loop !41

1243:                                             ; preds = %1218
  %1244 = load ptr, ptr %10, align 8
  %1245 = getelementptr inbounds %struct.CalcLangVal, ptr %1244, i32 0, i32 0
  store i32 6, ptr %1245, align 8
  %1246 = load ptr, ptr %62, align 8
  %1247 = load ptr, ptr %10, align 8
  %1248 = getelementptr inbounds %struct.CalcLangVal, ptr %1247, i32 0, i32 1
  store ptr %1246, ptr %1248, align 8
  br label %1310

1249:                                             ; preds = %1195, %1190
  %1250 = load ptr, ptr %6, align 8
  %1251 = getelementptr inbounds %struct.CalcLangVal, ptr %1250, i32 0, i32 0
  %1252 = load i32, ptr %1251, align 8
  %1253 = icmp eq i32 %1252, 4
  br i1 %1253, label %1254, label %1308

1254:                                             ; preds = %1249
  %1255 = load ptr, ptr %8, align 8
  %1256 = getelementptr inbounds %struct.CalcLangVal, ptr %1255, i32 0, i32 0
  %1257 = load i32, ptr %1256, align 8
  %1258 = icmp eq i32 %1257, 6
  br i1 %1258, label %1259, label %1308

1259:                                             ; preds = %1254
  %1260 = load ptr, ptr %8, align 8
  %1261 = getelementptr inbounds %struct.CalcLangVal, ptr %1260, i32 0, i32 1
  %1262 = load ptr, ptr %1261, align 8
  store ptr %1262, ptr %64, align 8
  %1263 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1263, ptr %65, align 8
  %1264 = load ptr, ptr %64, align 8
  %1265 = getelementptr inbounds %struct.SetValue, ptr %1264, i32 0, i32 0
  %1266 = load i32, ptr %1265, align 8
  %1267 = load ptr, ptr %65, align 8
  %1268 = getelementptr inbounds %struct.SetValue, ptr %1267, i32 0, i32 0
  store i32 %1266, ptr %1268, align 8
  %1269 = load ptr, ptr %65, align 8
  %1270 = getelementptr inbounds %struct.SetValue, ptr %1269, i32 0, i32 0
  %1271 = load i32, ptr %1270, align 8
  %1272 = sext i32 %1271 to i64
  %1273 = mul i64 8, %1272
  %1274 = call noalias ptr @malloc(i64 noundef %1273) #5
  %1275 = load ptr, ptr %65, align 8
  %1276 = getelementptr inbounds %struct.SetValue, ptr %1275, i32 0, i32 1
  store ptr %1274, ptr %1276, align 8
  store i32 0, ptr %66, align 4
  br label %1277

1277:                                             ; preds = %1299, %1259
  %1278 = load i32, ptr %66, align 4
  %1279 = load ptr, ptr %64, align 8
  %1280 = getelementptr inbounds %struct.SetValue, ptr %1279, i32 0, i32 0
  %1281 = load i32, ptr %1280, align 8
  %1282 = icmp slt i32 %1278, %1281
  br i1 %1282, label %1283, label %1302

1283:                                             ; preds = %1277
  %1284 = load ptr, ptr %6, align 8
  %1285 = load ptr, ptr %64, align 8
  %1286 = getelementptr inbounds %struct.SetValue, ptr %1285, i32 0, i32 1
  %1287 = load ptr, ptr %1286, align 8
  %1288 = load i32, ptr %66, align 4
  %1289 = sext i32 %1288 to i64
  %1290 = getelementptr inbounds ptr, ptr %1287, i64 %1289
  %1291 = load ptr, ptr %1290, align 8
  %1292 = call ptr @subCalcLangValues(ptr noundef %1284, i32 noundef 0, ptr noundef %1291, i32 noundef 1)
  %1293 = load ptr, ptr %65, align 8
  %1294 = getelementptr inbounds %struct.SetValue, ptr %1293, i32 0, i32 1
  %1295 = load ptr, ptr %1294, align 8
  %1296 = load i32, ptr %66, align 4
  %1297 = sext i32 %1296 to i64
  %1298 = getelementptr inbounds ptr, ptr %1295, i64 %1297
  store ptr %1292, ptr %1298, align 8
  br label %1299

1299:                                             ; preds = %1283
  %1300 = load i32, ptr %66, align 4
  %1301 = add nsw i32 %1300, 1
  store i32 %1301, ptr %66, align 4
  br label %1277, !llvm.loop !42

1302:                                             ; preds = %1277
  %1303 = load ptr, ptr %10, align 8
  %1304 = getelementptr inbounds %struct.CalcLangVal, ptr %1303, i32 0, i32 0
  store i32 6, ptr %1304, align 8
  %1305 = load ptr, ptr %65, align 8
  %1306 = load ptr, ptr %10, align 8
  %1307 = getelementptr inbounds %struct.CalcLangVal, ptr %1306, i32 0, i32 1
  store ptr %1305, ptr %1307, align 8
  br label %1309

1308:                                             ; preds = %1254, %1249
  call void @perror(ptr noundef @.str.1) #6
  br label %1309

1309:                                             ; preds = %1308, %1302
  br label %1310

1310:                                             ; preds = %1309, %1243
  br label %1311

1311:                                             ; preds = %1310, %1184
  br label %1312

1312:                                             ; preds = %1311, %1125
  br label %1313

1313:                                             ; preds = %1312, %1066
  br label %1314

1314:                                             ; preds = %1313, %1007
  br label %1315

1315:                                             ; preds = %1314, %948
  br label %1316

1316:                                             ; preds = %1315, %889
  br label %1317

1317:                                             ; preds = %1316, %835
  br label %1318

1318:                                             ; preds = %1317, %752
  br label %1319

1319:                                             ; preds = %1318, %693
  br label %1320

1320:                                             ; preds = %1319, %634
  br label %1321

1321:                                             ; preds = %1320, %575
  br label %1322

1322:                                             ; preds = %1321, %516
  br label %1323

1323:                                             ; preds = %1322, %457
  br label %1324

1324:                                             ; preds = %1323, %398
  br label %1325

1325:                                             ; preds = %1324, %339
  br label %1326

1326:                                             ; preds = %1325, %285
  br label %1327

1327:                                             ; preds = %1326, %196
  br label %1328

1328:                                             ; preds = %1327, %174
  br label %1329

1329:                                             ; preds = %1328, %151
  br label %1330

1330:                                             ; preds = %1329, %128
  br label %1331

1331:                                             ; preds = %1330, %106
  br label %1332

1332:                                             ; preds = %1331, %84
  %1333 = load i32, ptr %7, align 4
  %1334 = icmp ne i32 %1333, 0
  br i1 %1334, label %1335, label %1337

1335:                                             ; preds = %1332
  %1336 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1336)
  br label %1343

1337:                                             ; preds = %1332
  %1338 = load i32, ptr %9, align 4
  %1339 = icmp ne i32 %1338, 0
  br i1 %1339, label %1340, label %1342

1340:                                             ; preds = %1337
  %1341 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1341)
  br label %1342

1342:                                             ; preds = %1340, %1337
  br label %1343

1343:                                             ; preds = %1342, %1335
  %1344 = load ptr, ptr %10, align 8
  store ptr %1344, ptr %5, align 8
  br label %1345

1345:                                             ; preds = %1343, %834, %284, %72
  %1346 = load ptr, ptr %5, align 8
  ret ptr %1346
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @multCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i32, align 4
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i32, align 4
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i32, align 4
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %67 = load ptr, ptr %6, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %72, label %69

69:                                               ; preds = %4
  %70 = load ptr, ptr %8, align 8
  %71 = icmp eq ptr %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %69, %4
  store ptr null, ptr %5, align 8
  br label %1510

73:                                               ; preds = %69
  %74 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %74, ptr %10, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %96

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %96

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = mul nsw i32 %89, %92
  %94 = load ptr, ptr %10, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  store i32 %93, ptr %95, align 8
  br label %1497

96:                                               ; preds = %79, %73
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 0
  %99 = load i32, ptr %98, align 8
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %101, label %118

101:                                              ; preds = %96
  %102 = load ptr, ptr %8, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 0
  %104 = load i32, ptr %103, align 8
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %118

106:                                              ; preds = %101
  %107 = load ptr, ptr %10, align 8
  %108 = getelementptr inbounds %struct.CalcLangVal, ptr %107, i32 0, i32 0
  store i32 1, ptr %108, align 8
  %109 = load ptr, ptr %6, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  %111 = load double, ptr %110, align 8
  %112 = load ptr, ptr %8, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  %114 = load double, ptr %113, align 8
  %115 = fmul double %111, %114
  %116 = load ptr, ptr %10, align 8
  %117 = getelementptr inbounds %struct.CalcLangVal, ptr %116, i32 0, i32 1
  store double %115, ptr %117, align 8
  br label %1496

118:                                              ; preds = %101, %96
  %119 = load ptr, ptr %6, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %141

123:                                              ; preds = %118
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %125, align 8
  %127 = icmp eq i32 %126, 1
  br i1 %127, label %128, label %141

128:                                              ; preds = %123
  %129 = load ptr, ptr %10, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 0
  store i32 1, ptr %130, align 8
  %131 = load ptr, ptr %6, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 1
  %133 = load i32, ptr %132, align 8
  %134 = sitofp i32 %133 to double
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 1
  %137 = load double, ptr %136, align 8
  %138 = fmul double %134, %137
  %139 = load ptr, ptr %10, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 1
  store double %138, ptr %140, align 8
  br label %1495

141:                                              ; preds = %123, %118
  %142 = load ptr, ptr %6, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = icmp eq i32 %144, 1
  br i1 %145, label %146, label %164

146:                                              ; preds = %141
  %147 = load ptr, ptr %8, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 0
  %149 = load i32, ptr %148, align 8
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %164

151:                                              ; preds = %146
  %152 = load ptr, ptr %10, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 0
  store i32 1, ptr %153, align 8
  %154 = load ptr, ptr %6, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = load ptr, ptr %8, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  %159 = load i32, ptr %158, align 8
  %160 = sitofp i32 %159 to double
  %161 = fmul double %156, %160
  %162 = load ptr, ptr %10, align 8
  %163 = getelementptr inbounds %struct.CalcLangVal, ptr %162, i32 0, i32 1
  store double %161, ptr %163, align 8
  br label %1494

164:                                              ; preds = %146, %141
  %165 = load ptr, ptr %6, align 8
  %166 = getelementptr inbounds %struct.CalcLangVal, ptr %165, i32 0, i32 0
  %167 = load i32, ptr %166, align 8
  %168 = icmp eq i32 %167, 3
  br i1 %168, label %169, label %187

169:                                              ; preds = %164
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 0
  %172 = load i32, ptr %171, align 8
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %174, label %187

174:                                              ; preds = %169
  %175 = load ptr, ptr %10, align 8
  %176 = getelementptr inbounds %struct.CalcLangVal, ptr %175, i32 0, i32 0
  store i32 3, ptr %176, align 8
  %177 = load ptr, ptr %6, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  %179 = load double, ptr %178, align 8
  %180 = load ptr, ptr %8, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  %182 = load i32, ptr %181, align 8
  %183 = sitofp i32 %182 to double
  %184 = fmul double %179, %183
  %185 = load ptr, ptr %10, align 8
  %186 = getelementptr inbounds %struct.CalcLangVal, ptr %185, i32 0, i32 1
  store double %184, ptr %186, align 8
  br label %1493

187:                                              ; preds = %169, %164
  %188 = load ptr, ptr %6, align 8
  %189 = getelementptr inbounds %struct.CalcLangVal, ptr %188, i32 0, i32 0
  %190 = load i32, ptr %189, align 8
  %191 = icmp eq i32 %190, 0
  br i1 %191, label %192, label %210

192:                                              ; preds = %187
  %193 = load ptr, ptr %8, align 8
  %194 = getelementptr inbounds %struct.CalcLangVal, ptr %193, i32 0, i32 0
  %195 = load i32, ptr %194, align 8
  %196 = icmp eq i32 %195, 3
  br i1 %196, label %197, label %210

197:                                              ; preds = %192
  %198 = load ptr, ptr %10, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 0
  store i32 3, ptr %199, align 8
  %200 = load ptr, ptr %6, align 8
  %201 = getelementptr inbounds %struct.CalcLangVal, ptr %200, i32 0, i32 1
  %202 = load i32, ptr %201, align 8
  %203 = sitofp i32 %202 to double
  %204 = load ptr, ptr %8, align 8
  %205 = getelementptr inbounds %struct.CalcLangVal, ptr %204, i32 0, i32 1
  %206 = load double, ptr %205, align 8
  %207 = fmul double %203, %206
  %208 = load ptr, ptr %10, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 1
  store double %207, ptr %209, align 8
  br label %1492

210:                                              ; preds = %192, %187
  %211 = load ptr, ptr %6, align 8
  %212 = getelementptr inbounds %struct.CalcLangVal, ptr %211, i32 0, i32 0
  %213 = load i32, ptr %212, align 8
  %214 = icmp eq i32 %213, 1
  br i1 %214, label %215, label %232

215:                                              ; preds = %210
  %216 = load ptr, ptr %8, align 8
  %217 = getelementptr inbounds %struct.CalcLangVal, ptr %216, i32 0, i32 0
  %218 = load i32, ptr %217, align 8
  %219 = icmp eq i32 %218, 3
  br i1 %219, label %220, label %232

220:                                              ; preds = %215
  %221 = load ptr, ptr %10, align 8
  %222 = getelementptr inbounds %struct.CalcLangVal, ptr %221, i32 0, i32 0
  store i32 3, ptr %222, align 8
  %223 = load ptr, ptr %6, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 1
  %225 = load double, ptr %224, align 8
  %226 = load ptr, ptr %8, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 1
  %228 = load double, ptr %227, align 8
  %229 = fmul double %225, %228
  %230 = load ptr, ptr %10, align 8
  %231 = getelementptr inbounds %struct.CalcLangVal, ptr %230, i32 0, i32 1
  store double %229, ptr %231, align 8
  br label %1491

232:                                              ; preds = %215, %210
  %233 = load ptr, ptr %6, align 8
  %234 = getelementptr inbounds %struct.CalcLangVal, ptr %233, i32 0, i32 0
  %235 = load i32, ptr %234, align 8
  %236 = icmp eq i32 %235, 3
  br i1 %236, label %237, label %254

237:                                              ; preds = %232
  %238 = load ptr, ptr %8, align 8
  %239 = getelementptr inbounds %struct.CalcLangVal, ptr %238, i32 0, i32 0
  %240 = load i32, ptr %239, align 8
  %241 = icmp eq i32 %240, 1
  br i1 %241, label %242, label %254

242:                                              ; preds = %237
  %243 = load ptr, ptr %10, align 8
  %244 = getelementptr inbounds %struct.CalcLangVal, ptr %243, i32 0, i32 0
  store i32 3, ptr %244, align 8
  %245 = load ptr, ptr %6, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 1
  %247 = load double, ptr %246, align 8
  %248 = load ptr, ptr %8, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 1
  %250 = load double, ptr %249, align 8
  %251 = fmul double %247, %250
  %252 = load ptr, ptr %10, align 8
  %253 = getelementptr inbounds %struct.CalcLangVal, ptr %252, i32 0, i32 1
  store double %251, ptr %253, align 8
  br label %1490

254:                                              ; preds = %237, %232
  %255 = load ptr, ptr %6, align 8
  %256 = getelementptr inbounds %struct.CalcLangVal, ptr %255, i32 0, i32 0
  %257 = load i32, ptr %256, align 8
  %258 = icmp eq i32 %257, 4
  br i1 %258, label %259, label %277

259:                                              ; preds = %254
  %260 = load ptr, ptr %8, align 8
  %261 = getelementptr inbounds %struct.CalcLangVal, ptr %260, i32 0, i32 0
  %262 = load i32, ptr %261, align 8
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %277

264:                                              ; preds = %259
  %265 = load ptr, ptr %10, align 8
  %266 = getelementptr inbounds %struct.CalcLangVal, ptr %265, i32 0, i32 0
  store i32 4, ptr %266, align 8
  %267 = load ptr, ptr %6, align 8
  %268 = getelementptr inbounds %struct.CalcLangVal, ptr %267, i32 0, i32 1
  %269 = load double, ptr %268, align 8
  %270 = load ptr, ptr %8, align 8
  %271 = getelementptr inbounds %struct.CalcLangVal, ptr %270, i32 0, i32 1
  %272 = load i32, ptr %271, align 8
  %273 = sitofp i32 %272 to double
  %274 = fmul double %269, %273
  %275 = load ptr, ptr %10, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 1
  store double %274, ptr %276, align 8
  br label %1489

277:                                              ; preds = %259, %254
  %278 = load ptr, ptr %6, align 8
  %279 = getelementptr inbounds %struct.CalcLangVal, ptr %278, i32 0, i32 0
  %280 = load i32, ptr %279, align 8
  %281 = icmp eq i32 %280, 0
  br i1 %281, label %282, label %300

282:                                              ; preds = %277
  %283 = load ptr, ptr %8, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 0
  %285 = load i32, ptr %284, align 8
  %286 = icmp eq i32 %285, 4
  br i1 %286, label %287, label %300

287:                                              ; preds = %282
  %288 = load ptr, ptr %10, align 8
  %289 = getelementptr inbounds %struct.CalcLangVal, ptr %288, i32 0, i32 0
  store i32 4, ptr %289, align 8
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 1
  %292 = load i32, ptr %291, align 8
  %293 = sitofp i32 %292 to double
  %294 = load ptr, ptr %8, align 8
  %295 = getelementptr inbounds %struct.CalcLangVal, ptr %294, i32 0, i32 1
  %296 = load double, ptr %295, align 8
  %297 = fmul double %293, %296
  %298 = load ptr, ptr %10, align 8
  %299 = getelementptr inbounds %struct.CalcLangVal, ptr %298, i32 0, i32 1
  store double %297, ptr %299, align 8
  br label %1488

300:                                              ; preds = %282, %277
  %301 = load ptr, ptr %6, align 8
  %302 = getelementptr inbounds %struct.CalcLangVal, ptr %301, i32 0, i32 0
  %303 = load i32, ptr %302, align 8
  %304 = icmp eq i32 %303, 1
  br i1 %304, label %305, label %322

305:                                              ; preds = %300
  %306 = load ptr, ptr %8, align 8
  %307 = getelementptr inbounds %struct.CalcLangVal, ptr %306, i32 0, i32 0
  %308 = load i32, ptr %307, align 8
  %309 = icmp eq i32 %308, 4
  br i1 %309, label %310, label %322

310:                                              ; preds = %305
  %311 = load ptr, ptr %10, align 8
  %312 = getelementptr inbounds %struct.CalcLangVal, ptr %311, i32 0, i32 0
  store i32 4, ptr %312, align 8
  %313 = load ptr, ptr %6, align 8
  %314 = getelementptr inbounds %struct.CalcLangVal, ptr %313, i32 0, i32 1
  %315 = load double, ptr %314, align 8
  %316 = load ptr, ptr %8, align 8
  %317 = getelementptr inbounds %struct.CalcLangVal, ptr %316, i32 0, i32 1
  %318 = load double, ptr %317, align 8
  %319 = fmul double %315, %318
  %320 = load ptr, ptr %10, align 8
  %321 = getelementptr inbounds %struct.CalcLangVal, ptr %320, i32 0, i32 1
  store double %319, ptr %321, align 8
  br label %1487

322:                                              ; preds = %305, %300
  %323 = load ptr, ptr %6, align 8
  %324 = getelementptr inbounds %struct.CalcLangVal, ptr %323, i32 0, i32 0
  %325 = load i32, ptr %324, align 8
  %326 = icmp eq i32 %325, 4
  br i1 %326, label %327, label %344

327:                                              ; preds = %322
  %328 = load ptr, ptr %8, align 8
  %329 = getelementptr inbounds %struct.CalcLangVal, ptr %328, i32 0, i32 0
  %330 = load i32, ptr %329, align 8
  %331 = icmp eq i32 %330, 1
  br i1 %331, label %332, label %344

332:                                              ; preds = %327
  %333 = load ptr, ptr %10, align 8
  %334 = getelementptr inbounds %struct.CalcLangVal, ptr %333, i32 0, i32 0
  store i32 4, ptr %334, align 8
  %335 = load ptr, ptr %6, align 8
  %336 = getelementptr inbounds %struct.CalcLangVal, ptr %335, i32 0, i32 1
  %337 = load double, ptr %336, align 8
  %338 = load ptr, ptr %8, align 8
  %339 = getelementptr inbounds %struct.CalcLangVal, ptr %338, i32 0, i32 1
  %340 = load double, ptr %339, align 8
  %341 = fmul double %337, %340
  %342 = load ptr, ptr %10, align 8
  %343 = getelementptr inbounds %struct.CalcLangVal, ptr %342, i32 0, i32 1
  store double %341, ptr %343, align 8
  br label %1486

344:                                              ; preds = %327, %322
  %345 = load ptr, ptr %6, align 8
  %346 = getelementptr inbounds %struct.CalcLangVal, ptr %345, i32 0, i32 0
  %347 = load i32, ptr %346, align 8
  %348 = icmp eq i32 %347, 4
  br i1 %348, label %349, label %366

349:                                              ; preds = %344
  %350 = load ptr, ptr %8, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 0
  %352 = load i32, ptr %351, align 8
  %353 = icmp eq i32 %352, 4
  br i1 %353, label %354, label %366

354:                                              ; preds = %349
  %355 = load ptr, ptr %10, align 8
  %356 = getelementptr inbounds %struct.CalcLangVal, ptr %355, i32 0, i32 0
  store i32 4, ptr %356, align 8
  %357 = load ptr, ptr %6, align 8
  %358 = getelementptr inbounds %struct.CalcLangVal, ptr %357, i32 0, i32 1
  %359 = load double, ptr %358, align 8
  %360 = load ptr, ptr %8, align 8
  %361 = getelementptr inbounds %struct.CalcLangVal, ptr %360, i32 0, i32 1
  %362 = load double, ptr %361, align 8
  %363 = fmul double %359, %362
  %364 = load ptr, ptr %10, align 8
  %365 = getelementptr inbounds %struct.CalcLangVal, ptr %364, i32 0, i32 1
  store double %363, ptr %365, align 8
  br label %1485

366:                                              ; preds = %349, %344
  %367 = load ptr, ptr %6, align 8
  %368 = getelementptr inbounds %struct.CalcLangVal, ptr %367, i32 0, i32 0
  %369 = load i32, ptr %368, align 8
  %370 = icmp eq i32 %369, 7
  br i1 %370, label %371, label %444

371:                                              ; preds = %366
  %372 = load ptr, ptr %8, align 8
  %373 = getelementptr inbounds %struct.CalcLangVal, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = icmp eq i32 %374, 7
  br i1 %375, label %376, label %444

376:                                              ; preds = %371
  %377 = load ptr, ptr %6, align 8
  %378 = getelementptr inbounds %struct.CalcLangVal, ptr %377, i32 0, i32 1
  %379 = load ptr, ptr %378, align 8
  store ptr %379, ptr %11, align 8
  %380 = load ptr, ptr %8, align 8
  %381 = getelementptr inbounds %struct.CalcLangVal, ptr %380, i32 0, i32 1
  %382 = load ptr, ptr %381, align 8
  store ptr %382, ptr %12, align 8
  %383 = load ptr, ptr %12, align 8
  %384 = getelementptr inbounds %struct.TupleValue, ptr %383, i32 0, i32 0
  %385 = load i32, ptr %384, align 8
  %386 = load ptr, ptr %11, align 8
  %387 = getelementptr inbounds %struct.TupleValue, ptr %386, i32 0, i32 0
  %388 = load i32, ptr %387, align 8
  %389 = icmp eq i32 %385, %388
  br i1 %389, label %390, label %442

390:                                              ; preds = %376
  %391 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %391, ptr %13, align 8
  %392 = load ptr, ptr %11, align 8
  %393 = getelementptr inbounds %struct.TupleValue, ptr %392, i32 0, i32 0
  %394 = load i32, ptr %393, align 8
  %395 = load ptr, ptr %13, align 8
  %396 = getelementptr inbounds %struct.TupleValue, ptr %395, i32 0, i32 0
  store i32 %394, ptr %396, align 8
  %397 = load ptr, ptr %13, align 8
  %398 = getelementptr inbounds %struct.TupleValue, ptr %397, i32 0, i32 0
  %399 = load i32, ptr %398, align 8
  %400 = sext i32 %399 to i64
  %401 = mul i64 8, %400
  %402 = call noalias ptr @malloc(i64 noundef %401) #5
  %403 = load ptr, ptr %13, align 8
  %404 = getelementptr inbounds %struct.TupleValue, ptr %403, i32 0, i32 1
  store ptr %402, ptr %404, align 8
  store i32 0, ptr %14, align 4
  br label %405

405:                                              ; preds = %433, %390
  %406 = load i32, ptr %14, align 4
  %407 = load ptr, ptr %11, align 8
  %408 = getelementptr inbounds %struct.TupleValue, ptr %407, i32 0, i32 0
  %409 = load i32, ptr %408, align 8
  %410 = icmp slt i32 %406, %409
  br i1 %410, label %411, label %436

411:                                              ; preds = %405
  %412 = load ptr, ptr %11, align 8
  %413 = getelementptr inbounds %struct.TupleValue, ptr %412, i32 0, i32 1
  %414 = load ptr, ptr %413, align 8
  %415 = load i32, ptr %14, align 4
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds ptr, ptr %414, i64 %416
  %418 = load ptr, ptr %417, align 8
  %419 = load ptr, ptr %12, align 8
  %420 = getelementptr inbounds %struct.TupleValue, ptr %419, i32 0, i32 1
  %421 = load ptr, ptr %420, align 8
  %422 = load i32, ptr %14, align 4
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds ptr, ptr %421, i64 %423
  %425 = load ptr, ptr %424, align 8
  %426 = call ptr @multCalcLangValues(ptr noundef %418, i32 noundef 1, ptr noundef %425, i32 noundef 0)
  %427 = load ptr, ptr %13, align 8
  %428 = getelementptr inbounds %struct.TupleValue, ptr %427, i32 0, i32 1
  %429 = load ptr, ptr %428, align 8
  %430 = load i32, ptr %14, align 4
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds ptr, ptr %429, i64 %431
  store ptr %426, ptr %432, align 8
  br label %433

433:                                              ; preds = %411
  %434 = load i32, ptr %14, align 4
  %435 = add nsw i32 %434, 1
  store i32 %435, ptr %14, align 4
  br label %405, !llvm.loop !43

436:                                              ; preds = %405
  %437 = load ptr, ptr %10, align 8
  %438 = getelementptr inbounds %struct.CalcLangVal, ptr %437, i32 0, i32 0
  store i32 7, ptr %438, align 8
  %439 = load ptr, ptr %13, align 8
  %440 = load ptr, ptr %10, align 8
  %441 = getelementptr inbounds %struct.CalcLangVal, ptr %440, i32 0, i32 1
  store ptr %439, ptr %441, align 8
  br label %443

442:                                              ; preds = %376
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1510

443:                                              ; preds = %436
  br label %1484

444:                                              ; preds = %371, %366
  %445 = load ptr, ptr %6, align 8
  %446 = getelementptr inbounds %struct.CalcLangVal, ptr %445, i32 0, i32 0
  %447 = load i32, ptr %446, align 8
  %448 = icmp eq i32 %447, 7
  br i1 %448, label %449, label %503

449:                                              ; preds = %444
  %450 = load ptr, ptr %8, align 8
  %451 = getelementptr inbounds %struct.CalcLangVal, ptr %450, i32 0, i32 0
  %452 = load i32, ptr %451, align 8
  %453 = icmp eq i32 %452, 0
  br i1 %453, label %454, label %503

454:                                              ; preds = %449
  %455 = load ptr, ptr %6, align 8
  %456 = getelementptr inbounds %struct.CalcLangVal, ptr %455, i32 0, i32 1
  %457 = load ptr, ptr %456, align 8
  store ptr %457, ptr %15, align 8
  %458 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %458, ptr %16, align 8
  %459 = load ptr, ptr %15, align 8
  %460 = getelementptr inbounds %struct.TupleValue, ptr %459, i32 0, i32 0
  %461 = load i32, ptr %460, align 8
  %462 = load ptr, ptr %16, align 8
  %463 = getelementptr inbounds %struct.TupleValue, ptr %462, i32 0, i32 0
  store i32 %461, ptr %463, align 8
  %464 = load ptr, ptr %16, align 8
  %465 = getelementptr inbounds %struct.TupleValue, ptr %464, i32 0, i32 0
  %466 = load i32, ptr %465, align 8
  %467 = sext i32 %466 to i64
  %468 = mul i64 8, %467
  %469 = call noalias ptr @malloc(i64 noundef %468) #5
  %470 = load ptr, ptr %16, align 8
  %471 = getelementptr inbounds %struct.TupleValue, ptr %470, i32 0, i32 1
  store ptr %469, ptr %471, align 8
  store i32 0, ptr %17, align 4
  br label %472

472:                                              ; preds = %494, %454
  %473 = load i32, ptr %17, align 4
  %474 = load ptr, ptr %15, align 8
  %475 = getelementptr inbounds %struct.TupleValue, ptr %474, i32 0, i32 0
  %476 = load i32, ptr %475, align 8
  %477 = icmp slt i32 %473, %476
  br i1 %477, label %478, label %497

478:                                              ; preds = %472
  %479 = load ptr, ptr %15, align 8
  %480 = getelementptr inbounds %struct.TupleValue, ptr %479, i32 0, i32 1
  %481 = load ptr, ptr %480, align 8
  %482 = load i32, ptr %17, align 4
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds ptr, ptr %481, i64 %483
  %485 = load ptr, ptr %484, align 8
  %486 = load ptr, ptr %8, align 8
  %487 = call ptr @multCalcLangValues(ptr noundef %485, i32 noundef 1, ptr noundef %486, i32 noundef 0)
  %488 = load ptr, ptr %16, align 8
  %489 = getelementptr inbounds %struct.TupleValue, ptr %488, i32 0, i32 1
  %490 = load ptr, ptr %489, align 8
  %491 = load i32, ptr %17, align 4
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds ptr, ptr %490, i64 %492
  store ptr %487, ptr %493, align 8
  br label %494

494:                                              ; preds = %478
  %495 = load i32, ptr %17, align 4
  %496 = add nsw i32 %495, 1
  store i32 %496, ptr %17, align 4
  br label %472, !llvm.loop !44

497:                                              ; preds = %472
  %498 = load ptr, ptr %10, align 8
  %499 = getelementptr inbounds %struct.CalcLangVal, ptr %498, i32 0, i32 0
  store i32 7, ptr %499, align 8
  %500 = load ptr, ptr %16, align 8
  %501 = load ptr, ptr %10, align 8
  %502 = getelementptr inbounds %struct.CalcLangVal, ptr %501, i32 0, i32 1
  store ptr %500, ptr %502, align 8
  br label %1483

503:                                              ; preds = %449, %444
  %504 = load ptr, ptr %6, align 8
  %505 = getelementptr inbounds %struct.CalcLangVal, ptr %504, i32 0, i32 0
  %506 = load i32, ptr %505, align 8
  %507 = icmp eq i32 %506, 0
  br i1 %507, label %508, label %562

508:                                              ; preds = %503
  %509 = load ptr, ptr %8, align 8
  %510 = getelementptr inbounds %struct.CalcLangVal, ptr %509, i32 0, i32 0
  %511 = load i32, ptr %510, align 8
  %512 = icmp eq i32 %511, 7
  br i1 %512, label %513, label %562

513:                                              ; preds = %508
  %514 = load ptr, ptr %8, align 8
  %515 = getelementptr inbounds %struct.CalcLangVal, ptr %514, i32 0, i32 1
  %516 = load ptr, ptr %515, align 8
  store ptr %516, ptr %18, align 8
  %517 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %517, ptr %19, align 8
  %518 = load ptr, ptr %18, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 0
  %520 = load i32, ptr %519, align 8
  %521 = load ptr, ptr %19, align 8
  %522 = getelementptr inbounds %struct.TupleValue, ptr %521, i32 0, i32 0
  store i32 %520, ptr %522, align 8
  %523 = load ptr, ptr %19, align 8
  %524 = getelementptr inbounds %struct.TupleValue, ptr %523, i32 0, i32 0
  %525 = load i32, ptr %524, align 8
  %526 = sext i32 %525 to i64
  %527 = mul i64 8, %526
  %528 = call noalias ptr @malloc(i64 noundef %527) #5
  %529 = load ptr, ptr %19, align 8
  %530 = getelementptr inbounds %struct.TupleValue, ptr %529, i32 0, i32 1
  store ptr %528, ptr %530, align 8
  store i32 0, ptr %20, align 4
  br label %531

531:                                              ; preds = %553, %513
  %532 = load i32, ptr %20, align 4
  %533 = load ptr, ptr %18, align 8
  %534 = getelementptr inbounds %struct.TupleValue, ptr %533, i32 0, i32 0
  %535 = load i32, ptr %534, align 8
  %536 = icmp slt i32 %532, %535
  br i1 %536, label %537, label %556

537:                                              ; preds = %531
  %538 = load ptr, ptr %6, align 8
  %539 = load ptr, ptr %18, align 8
  %540 = getelementptr inbounds %struct.TupleValue, ptr %539, i32 0, i32 1
  %541 = load ptr, ptr %540, align 8
  %542 = load i32, ptr %20, align 4
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds ptr, ptr %541, i64 %543
  %545 = load ptr, ptr %544, align 8
  %546 = call ptr @multCalcLangValues(ptr noundef %538, i32 noundef 0, ptr noundef %545, i32 noundef 1)
  %547 = load ptr, ptr %19, align 8
  %548 = getelementptr inbounds %struct.TupleValue, ptr %547, i32 0, i32 1
  %549 = load ptr, ptr %548, align 8
  %550 = load i32, ptr %20, align 4
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds ptr, ptr %549, i64 %551
  store ptr %546, ptr %552, align 8
  br label %553

553:                                              ; preds = %537
  %554 = load i32, ptr %20, align 4
  %555 = add nsw i32 %554, 1
  store i32 %555, ptr %20, align 4
  br label %531, !llvm.loop !45

556:                                              ; preds = %531
  %557 = load ptr, ptr %10, align 8
  %558 = getelementptr inbounds %struct.CalcLangVal, ptr %557, i32 0, i32 0
  store i32 7, ptr %558, align 8
  %559 = load ptr, ptr %19, align 8
  %560 = load ptr, ptr %10, align 8
  %561 = getelementptr inbounds %struct.CalcLangVal, ptr %560, i32 0, i32 1
  store ptr %559, ptr %561, align 8
  br label %1482

562:                                              ; preds = %508, %503
  %563 = load ptr, ptr %6, align 8
  %564 = getelementptr inbounds %struct.CalcLangVal, ptr %563, i32 0, i32 0
  %565 = load i32, ptr %564, align 8
  %566 = icmp eq i32 %565, 7
  br i1 %566, label %567, label %621

567:                                              ; preds = %562
  %568 = load ptr, ptr %8, align 8
  %569 = getelementptr inbounds %struct.CalcLangVal, ptr %568, i32 0, i32 0
  %570 = load i32, ptr %569, align 8
  %571 = icmp eq i32 %570, 1
  br i1 %571, label %572, label %621

572:                                              ; preds = %567
  %573 = load ptr, ptr %6, align 8
  %574 = getelementptr inbounds %struct.CalcLangVal, ptr %573, i32 0, i32 1
  %575 = load ptr, ptr %574, align 8
  store ptr %575, ptr %21, align 8
  %576 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %576, ptr %22, align 8
  %577 = load ptr, ptr %21, align 8
  %578 = getelementptr inbounds %struct.TupleValue, ptr %577, i32 0, i32 0
  %579 = load i32, ptr %578, align 8
  %580 = load ptr, ptr %22, align 8
  %581 = getelementptr inbounds %struct.TupleValue, ptr %580, i32 0, i32 0
  store i32 %579, ptr %581, align 8
  %582 = load ptr, ptr %22, align 8
  %583 = getelementptr inbounds %struct.TupleValue, ptr %582, i32 0, i32 0
  %584 = load i32, ptr %583, align 8
  %585 = sext i32 %584 to i64
  %586 = mul i64 8, %585
  %587 = call noalias ptr @malloc(i64 noundef %586) #5
  %588 = load ptr, ptr %22, align 8
  %589 = getelementptr inbounds %struct.TupleValue, ptr %588, i32 0, i32 1
  store ptr %587, ptr %589, align 8
  store i32 0, ptr %23, align 4
  br label %590

590:                                              ; preds = %612, %572
  %591 = load i32, ptr %23, align 4
  %592 = load ptr, ptr %21, align 8
  %593 = getelementptr inbounds %struct.TupleValue, ptr %592, i32 0, i32 0
  %594 = load i32, ptr %593, align 8
  %595 = icmp slt i32 %591, %594
  br i1 %595, label %596, label %615

596:                                              ; preds = %590
  %597 = load ptr, ptr %21, align 8
  %598 = getelementptr inbounds %struct.TupleValue, ptr %597, i32 0, i32 1
  %599 = load ptr, ptr %598, align 8
  %600 = load i32, ptr %23, align 4
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds ptr, ptr %599, i64 %601
  %603 = load ptr, ptr %602, align 8
  %604 = load ptr, ptr %8, align 8
  %605 = call ptr @multCalcLangValues(ptr noundef %603, i32 noundef 1, ptr noundef %604, i32 noundef 0)
  %606 = load ptr, ptr %22, align 8
  %607 = getelementptr inbounds %struct.TupleValue, ptr %606, i32 0, i32 1
  %608 = load ptr, ptr %607, align 8
  %609 = load i32, ptr %23, align 4
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds ptr, ptr %608, i64 %610
  store ptr %605, ptr %611, align 8
  br label %612

612:                                              ; preds = %596
  %613 = load i32, ptr %23, align 4
  %614 = add nsw i32 %613, 1
  store i32 %614, ptr %23, align 4
  br label %590, !llvm.loop !46

615:                                              ; preds = %590
  %616 = load ptr, ptr %10, align 8
  %617 = getelementptr inbounds %struct.CalcLangVal, ptr %616, i32 0, i32 0
  store i32 7, ptr %617, align 8
  %618 = load ptr, ptr %22, align 8
  %619 = load ptr, ptr %10, align 8
  %620 = getelementptr inbounds %struct.CalcLangVal, ptr %619, i32 0, i32 1
  store ptr %618, ptr %620, align 8
  br label %1481

621:                                              ; preds = %567, %562
  %622 = load ptr, ptr %6, align 8
  %623 = getelementptr inbounds %struct.CalcLangVal, ptr %622, i32 0, i32 0
  %624 = load i32, ptr %623, align 8
  %625 = icmp eq i32 %624, 1
  br i1 %625, label %626, label %680

626:                                              ; preds = %621
  %627 = load ptr, ptr %8, align 8
  %628 = getelementptr inbounds %struct.CalcLangVal, ptr %627, i32 0, i32 0
  %629 = load i32, ptr %628, align 8
  %630 = icmp eq i32 %629, 7
  br i1 %630, label %631, label %680

631:                                              ; preds = %626
  %632 = load ptr, ptr %8, align 8
  %633 = getelementptr inbounds %struct.CalcLangVal, ptr %632, i32 0, i32 1
  %634 = load ptr, ptr %633, align 8
  store ptr %634, ptr %24, align 8
  %635 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %635, ptr %25, align 8
  %636 = load ptr, ptr %24, align 8
  %637 = getelementptr inbounds %struct.TupleValue, ptr %636, i32 0, i32 0
  %638 = load i32, ptr %637, align 8
  %639 = load ptr, ptr %25, align 8
  %640 = getelementptr inbounds %struct.TupleValue, ptr %639, i32 0, i32 0
  store i32 %638, ptr %640, align 8
  %641 = load ptr, ptr %25, align 8
  %642 = getelementptr inbounds %struct.TupleValue, ptr %641, i32 0, i32 0
  %643 = load i32, ptr %642, align 8
  %644 = sext i32 %643 to i64
  %645 = mul i64 8, %644
  %646 = call noalias ptr @malloc(i64 noundef %645) #5
  %647 = load ptr, ptr %25, align 8
  %648 = getelementptr inbounds %struct.TupleValue, ptr %647, i32 0, i32 1
  store ptr %646, ptr %648, align 8
  store i32 0, ptr %26, align 4
  br label %649

649:                                              ; preds = %671, %631
  %650 = load i32, ptr %26, align 4
  %651 = load ptr, ptr %24, align 8
  %652 = getelementptr inbounds %struct.TupleValue, ptr %651, i32 0, i32 0
  %653 = load i32, ptr %652, align 8
  %654 = icmp slt i32 %650, %653
  br i1 %654, label %655, label %674

655:                                              ; preds = %649
  %656 = load ptr, ptr %6, align 8
  %657 = load ptr, ptr %24, align 8
  %658 = getelementptr inbounds %struct.TupleValue, ptr %657, i32 0, i32 1
  %659 = load ptr, ptr %658, align 8
  %660 = load i32, ptr %26, align 4
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds ptr, ptr %659, i64 %661
  %663 = load ptr, ptr %662, align 8
  %664 = call ptr @multCalcLangValues(ptr noundef %656, i32 noundef 0, ptr noundef %663, i32 noundef 1)
  %665 = load ptr, ptr %25, align 8
  %666 = getelementptr inbounds %struct.TupleValue, ptr %665, i32 0, i32 1
  %667 = load ptr, ptr %666, align 8
  %668 = load i32, ptr %26, align 4
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds ptr, ptr %667, i64 %669
  store ptr %664, ptr %670, align 8
  br label %671

671:                                              ; preds = %655
  %672 = load i32, ptr %26, align 4
  %673 = add nsw i32 %672, 1
  store i32 %673, ptr %26, align 4
  br label %649, !llvm.loop !47

674:                                              ; preds = %649
  %675 = load ptr, ptr %10, align 8
  %676 = getelementptr inbounds %struct.CalcLangVal, ptr %675, i32 0, i32 0
  store i32 7, ptr %676, align 8
  %677 = load ptr, ptr %25, align 8
  %678 = load ptr, ptr %10, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 1
  store ptr %677, ptr %679, align 8
  br label %1480

680:                                              ; preds = %626, %621
  %681 = load ptr, ptr %6, align 8
  %682 = getelementptr inbounds %struct.CalcLangVal, ptr %681, i32 0, i32 0
  %683 = load i32, ptr %682, align 8
  %684 = icmp eq i32 %683, 7
  br i1 %684, label %685, label %739

685:                                              ; preds = %680
  %686 = load ptr, ptr %8, align 8
  %687 = getelementptr inbounds %struct.CalcLangVal, ptr %686, i32 0, i32 0
  %688 = load i32, ptr %687, align 8
  %689 = icmp eq i32 %688, 3
  br i1 %689, label %690, label %739

690:                                              ; preds = %685
  %691 = load ptr, ptr %6, align 8
  %692 = getelementptr inbounds %struct.CalcLangVal, ptr %691, i32 0, i32 1
  %693 = load ptr, ptr %692, align 8
  store ptr %693, ptr %27, align 8
  %694 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %694, ptr %28, align 8
  %695 = load ptr, ptr %27, align 8
  %696 = getelementptr inbounds %struct.TupleValue, ptr %695, i32 0, i32 0
  %697 = load i32, ptr %696, align 8
  %698 = load ptr, ptr %28, align 8
  %699 = getelementptr inbounds %struct.TupleValue, ptr %698, i32 0, i32 0
  store i32 %697, ptr %699, align 8
  %700 = load ptr, ptr %28, align 8
  %701 = getelementptr inbounds %struct.TupleValue, ptr %700, i32 0, i32 0
  %702 = load i32, ptr %701, align 8
  %703 = sext i32 %702 to i64
  %704 = mul i64 8, %703
  %705 = call noalias ptr @malloc(i64 noundef %704) #5
  %706 = load ptr, ptr %28, align 8
  %707 = getelementptr inbounds %struct.TupleValue, ptr %706, i32 0, i32 1
  store ptr %705, ptr %707, align 8
  store i32 0, ptr %29, align 4
  br label %708

708:                                              ; preds = %730, %690
  %709 = load i32, ptr %29, align 4
  %710 = load ptr, ptr %27, align 8
  %711 = getelementptr inbounds %struct.TupleValue, ptr %710, i32 0, i32 0
  %712 = load i32, ptr %711, align 8
  %713 = icmp slt i32 %709, %712
  br i1 %713, label %714, label %733

714:                                              ; preds = %708
  %715 = load ptr, ptr %27, align 8
  %716 = getelementptr inbounds %struct.TupleValue, ptr %715, i32 0, i32 1
  %717 = load ptr, ptr %716, align 8
  %718 = load i32, ptr %29, align 4
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds ptr, ptr %717, i64 %719
  %721 = load ptr, ptr %720, align 8
  %722 = load ptr, ptr %8, align 8
  %723 = call ptr @multCalcLangValues(ptr noundef %721, i32 noundef 1, ptr noundef %722, i32 noundef 0)
  %724 = load ptr, ptr %28, align 8
  %725 = getelementptr inbounds %struct.TupleValue, ptr %724, i32 0, i32 1
  %726 = load ptr, ptr %725, align 8
  %727 = load i32, ptr %29, align 4
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds ptr, ptr %726, i64 %728
  store ptr %723, ptr %729, align 8
  br label %730

730:                                              ; preds = %714
  %731 = load i32, ptr %29, align 4
  %732 = add nsw i32 %731, 1
  store i32 %732, ptr %29, align 4
  br label %708, !llvm.loop !48

733:                                              ; preds = %708
  %734 = load ptr, ptr %10, align 8
  %735 = getelementptr inbounds %struct.CalcLangVal, ptr %734, i32 0, i32 0
  store i32 7, ptr %735, align 8
  %736 = load ptr, ptr %28, align 8
  %737 = load ptr, ptr %10, align 8
  %738 = getelementptr inbounds %struct.CalcLangVal, ptr %737, i32 0, i32 1
  store ptr %736, ptr %738, align 8
  br label %1479

739:                                              ; preds = %685, %680
  %740 = load ptr, ptr %6, align 8
  %741 = getelementptr inbounds %struct.CalcLangVal, ptr %740, i32 0, i32 0
  %742 = load i32, ptr %741, align 8
  %743 = icmp eq i32 %742, 3
  br i1 %743, label %744, label %798

744:                                              ; preds = %739
  %745 = load ptr, ptr %8, align 8
  %746 = getelementptr inbounds %struct.CalcLangVal, ptr %745, i32 0, i32 0
  %747 = load i32, ptr %746, align 8
  %748 = icmp eq i32 %747, 7
  br i1 %748, label %749, label %798

749:                                              ; preds = %744
  %750 = load ptr, ptr %8, align 8
  %751 = getelementptr inbounds %struct.CalcLangVal, ptr %750, i32 0, i32 1
  %752 = load ptr, ptr %751, align 8
  store ptr %752, ptr %30, align 8
  %753 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %753, ptr %31, align 8
  %754 = load ptr, ptr %30, align 8
  %755 = getelementptr inbounds %struct.TupleValue, ptr %754, i32 0, i32 0
  %756 = load i32, ptr %755, align 8
  %757 = load ptr, ptr %31, align 8
  %758 = getelementptr inbounds %struct.TupleValue, ptr %757, i32 0, i32 0
  store i32 %756, ptr %758, align 8
  %759 = load ptr, ptr %31, align 8
  %760 = getelementptr inbounds %struct.TupleValue, ptr %759, i32 0, i32 0
  %761 = load i32, ptr %760, align 8
  %762 = sext i32 %761 to i64
  %763 = mul i64 8, %762
  %764 = call noalias ptr @malloc(i64 noundef %763) #5
  %765 = load ptr, ptr %31, align 8
  %766 = getelementptr inbounds %struct.TupleValue, ptr %765, i32 0, i32 1
  store ptr %764, ptr %766, align 8
  store i32 0, ptr %32, align 4
  br label %767

767:                                              ; preds = %789, %749
  %768 = load i32, ptr %32, align 4
  %769 = load ptr, ptr %30, align 8
  %770 = getelementptr inbounds %struct.TupleValue, ptr %769, i32 0, i32 0
  %771 = load i32, ptr %770, align 8
  %772 = icmp slt i32 %768, %771
  br i1 %772, label %773, label %792

773:                                              ; preds = %767
  %774 = load ptr, ptr %6, align 8
  %775 = load ptr, ptr %30, align 8
  %776 = getelementptr inbounds %struct.TupleValue, ptr %775, i32 0, i32 1
  %777 = load ptr, ptr %776, align 8
  %778 = load i32, ptr %32, align 4
  %779 = sext i32 %778 to i64
  %780 = getelementptr inbounds ptr, ptr %777, i64 %779
  %781 = load ptr, ptr %780, align 8
  %782 = call ptr @multCalcLangValues(ptr noundef %774, i32 noundef 0, ptr noundef %781, i32 noundef 1)
  %783 = load ptr, ptr %31, align 8
  %784 = getelementptr inbounds %struct.TupleValue, ptr %783, i32 0, i32 1
  %785 = load ptr, ptr %784, align 8
  %786 = load i32, ptr %32, align 4
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds ptr, ptr %785, i64 %787
  store ptr %782, ptr %788, align 8
  br label %789

789:                                              ; preds = %773
  %790 = load i32, ptr %32, align 4
  %791 = add nsw i32 %790, 1
  store i32 %791, ptr %32, align 4
  br label %767, !llvm.loop !49

792:                                              ; preds = %767
  %793 = load ptr, ptr %10, align 8
  %794 = getelementptr inbounds %struct.CalcLangVal, ptr %793, i32 0, i32 0
  store i32 7, ptr %794, align 8
  %795 = load ptr, ptr %31, align 8
  %796 = load ptr, ptr %10, align 8
  %797 = getelementptr inbounds %struct.CalcLangVal, ptr %796, i32 0, i32 1
  store ptr %795, ptr %797, align 8
  br label %1478

798:                                              ; preds = %744, %739
  %799 = load ptr, ptr %6, align 8
  %800 = getelementptr inbounds %struct.CalcLangVal, ptr %799, i32 0, i32 0
  %801 = load i32, ptr %800, align 8
  %802 = icmp eq i32 %801, 7
  br i1 %802, label %803, label %857

803:                                              ; preds = %798
  %804 = load ptr, ptr %8, align 8
  %805 = getelementptr inbounds %struct.CalcLangVal, ptr %804, i32 0, i32 0
  %806 = load i32, ptr %805, align 8
  %807 = icmp eq i32 %806, 4
  br i1 %807, label %808, label %857

808:                                              ; preds = %803
  %809 = load ptr, ptr %6, align 8
  %810 = getelementptr inbounds %struct.CalcLangVal, ptr %809, i32 0, i32 1
  %811 = load ptr, ptr %810, align 8
  store ptr %811, ptr %33, align 8
  %812 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %812, ptr %34, align 8
  %813 = load ptr, ptr %33, align 8
  %814 = getelementptr inbounds %struct.TupleValue, ptr %813, i32 0, i32 0
  %815 = load i32, ptr %814, align 8
  %816 = load ptr, ptr %34, align 8
  %817 = getelementptr inbounds %struct.TupleValue, ptr %816, i32 0, i32 0
  store i32 %815, ptr %817, align 8
  %818 = load ptr, ptr %34, align 8
  %819 = getelementptr inbounds %struct.TupleValue, ptr %818, i32 0, i32 0
  %820 = load i32, ptr %819, align 8
  %821 = sext i32 %820 to i64
  %822 = mul i64 8, %821
  %823 = call noalias ptr @malloc(i64 noundef %822) #5
  %824 = load ptr, ptr %34, align 8
  %825 = getelementptr inbounds %struct.TupleValue, ptr %824, i32 0, i32 1
  store ptr %823, ptr %825, align 8
  store i32 0, ptr %35, align 4
  br label %826

826:                                              ; preds = %848, %808
  %827 = load i32, ptr %35, align 4
  %828 = load ptr, ptr %33, align 8
  %829 = getelementptr inbounds %struct.TupleValue, ptr %828, i32 0, i32 0
  %830 = load i32, ptr %829, align 8
  %831 = icmp slt i32 %827, %830
  br i1 %831, label %832, label %851

832:                                              ; preds = %826
  %833 = load ptr, ptr %33, align 8
  %834 = getelementptr inbounds %struct.TupleValue, ptr %833, i32 0, i32 1
  %835 = load ptr, ptr %834, align 8
  %836 = load i32, ptr %35, align 4
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds ptr, ptr %835, i64 %837
  %839 = load ptr, ptr %838, align 8
  %840 = load ptr, ptr %8, align 8
  %841 = call ptr @multCalcLangValues(ptr noundef %839, i32 noundef 1, ptr noundef %840, i32 noundef 0)
  %842 = load ptr, ptr %34, align 8
  %843 = getelementptr inbounds %struct.TupleValue, ptr %842, i32 0, i32 1
  %844 = load ptr, ptr %843, align 8
  %845 = load i32, ptr %35, align 4
  %846 = sext i32 %845 to i64
  %847 = getelementptr inbounds ptr, ptr %844, i64 %846
  store ptr %841, ptr %847, align 8
  br label %848

848:                                              ; preds = %832
  %849 = load i32, ptr %35, align 4
  %850 = add nsw i32 %849, 1
  store i32 %850, ptr %35, align 4
  br label %826, !llvm.loop !50

851:                                              ; preds = %826
  %852 = load ptr, ptr %10, align 8
  %853 = getelementptr inbounds %struct.CalcLangVal, ptr %852, i32 0, i32 0
  store i32 7, ptr %853, align 8
  %854 = load ptr, ptr %34, align 8
  %855 = load ptr, ptr %10, align 8
  %856 = getelementptr inbounds %struct.CalcLangVal, ptr %855, i32 0, i32 1
  store ptr %854, ptr %856, align 8
  br label %1477

857:                                              ; preds = %803, %798
  %858 = load ptr, ptr %6, align 8
  %859 = getelementptr inbounds %struct.CalcLangVal, ptr %858, i32 0, i32 0
  %860 = load i32, ptr %859, align 8
  %861 = icmp eq i32 %860, 4
  br i1 %861, label %862, label %916

862:                                              ; preds = %857
  %863 = load ptr, ptr %8, align 8
  %864 = getelementptr inbounds %struct.CalcLangVal, ptr %863, i32 0, i32 0
  %865 = load i32, ptr %864, align 8
  %866 = icmp eq i32 %865, 7
  br i1 %866, label %867, label %916

867:                                              ; preds = %862
  %868 = load ptr, ptr %8, align 8
  %869 = getelementptr inbounds %struct.CalcLangVal, ptr %868, i32 0, i32 1
  %870 = load ptr, ptr %869, align 8
  store ptr %870, ptr %36, align 8
  %871 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %871, ptr %37, align 8
  %872 = load ptr, ptr %36, align 8
  %873 = getelementptr inbounds %struct.TupleValue, ptr %872, i32 0, i32 0
  %874 = load i32, ptr %873, align 8
  %875 = load ptr, ptr %37, align 8
  %876 = getelementptr inbounds %struct.TupleValue, ptr %875, i32 0, i32 0
  store i32 %874, ptr %876, align 8
  %877 = load ptr, ptr %37, align 8
  %878 = getelementptr inbounds %struct.TupleValue, ptr %877, i32 0, i32 0
  %879 = load i32, ptr %878, align 8
  %880 = sext i32 %879 to i64
  %881 = mul i64 8, %880
  %882 = call noalias ptr @malloc(i64 noundef %881) #5
  %883 = load ptr, ptr %37, align 8
  %884 = getelementptr inbounds %struct.TupleValue, ptr %883, i32 0, i32 1
  store ptr %882, ptr %884, align 8
  store i32 0, ptr %38, align 4
  br label %885

885:                                              ; preds = %907, %867
  %886 = load i32, ptr %38, align 4
  %887 = load ptr, ptr %36, align 8
  %888 = getelementptr inbounds %struct.TupleValue, ptr %887, i32 0, i32 0
  %889 = load i32, ptr %888, align 8
  %890 = icmp slt i32 %886, %889
  br i1 %890, label %891, label %910

891:                                              ; preds = %885
  %892 = load ptr, ptr %6, align 8
  %893 = load ptr, ptr %36, align 8
  %894 = getelementptr inbounds %struct.TupleValue, ptr %893, i32 0, i32 1
  %895 = load ptr, ptr %894, align 8
  %896 = load i32, ptr %38, align 4
  %897 = sext i32 %896 to i64
  %898 = getelementptr inbounds ptr, ptr %895, i64 %897
  %899 = load ptr, ptr %898, align 8
  %900 = call ptr @multCalcLangValues(ptr noundef %892, i32 noundef 0, ptr noundef %899, i32 noundef 1)
  %901 = load ptr, ptr %37, align 8
  %902 = getelementptr inbounds %struct.TupleValue, ptr %901, i32 0, i32 1
  %903 = load ptr, ptr %902, align 8
  %904 = load i32, ptr %38, align 4
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds ptr, ptr %903, i64 %905
  store ptr %900, ptr %906, align 8
  br label %907

907:                                              ; preds = %891
  %908 = load i32, ptr %38, align 4
  %909 = add nsw i32 %908, 1
  store i32 %909, ptr %38, align 4
  br label %885, !llvm.loop !51

910:                                              ; preds = %885
  %911 = load ptr, ptr %10, align 8
  %912 = getelementptr inbounds %struct.CalcLangVal, ptr %911, i32 0, i32 0
  store i32 7, ptr %912, align 8
  %913 = load ptr, ptr %37, align 8
  %914 = load ptr, ptr %10, align 8
  %915 = getelementptr inbounds %struct.CalcLangVal, ptr %914, i32 0, i32 1
  store ptr %913, ptr %915, align 8
  br label %1476

916:                                              ; preds = %862, %857
  %917 = load ptr, ptr %6, align 8
  %918 = getelementptr inbounds %struct.CalcLangVal, ptr %917, i32 0, i32 0
  %919 = load i32, ptr %918, align 8
  %920 = icmp eq i32 %919, 6
  br i1 %920, label %921, label %994

921:                                              ; preds = %916
  %922 = load ptr, ptr %8, align 8
  %923 = getelementptr inbounds %struct.CalcLangVal, ptr %922, i32 0, i32 0
  %924 = load i32, ptr %923, align 8
  %925 = icmp eq i32 %924, 6
  br i1 %925, label %926, label %994

926:                                              ; preds = %921
  %927 = load ptr, ptr %6, align 8
  %928 = getelementptr inbounds %struct.CalcLangVal, ptr %927, i32 0, i32 1
  %929 = load ptr, ptr %928, align 8
  store ptr %929, ptr %39, align 8
  %930 = load ptr, ptr %8, align 8
  %931 = getelementptr inbounds %struct.CalcLangVal, ptr %930, i32 0, i32 1
  %932 = load ptr, ptr %931, align 8
  store ptr %932, ptr %40, align 8
  %933 = load ptr, ptr %40, align 8
  %934 = getelementptr inbounds %struct.SetValue, ptr %933, i32 0, i32 0
  %935 = load i32, ptr %934, align 8
  %936 = load ptr, ptr %39, align 8
  %937 = getelementptr inbounds %struct.SetValue, ptr %936, i32 0, i32 0
  %938 = load i32, ptr %937, align 8
  %939 = icmp eq i32 %935, %938
  br i1 %939, label %940, label %992

940:                                              ; preds = %926
  %941 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %941, ptr %41, align 8
  %942 = load ptr, ptr %39, align 8
  %943 = getelementptr inbounds %struct.SetValue, ptr %942, i32 0, i32 0
  %944 = load i32, ptr %943, align 8
  %945 = load ptr, ptr %41, align 8
  %946 = getelementptr inbounds %struct.SetValue, ptr %945, i32 0, i32 0
  store i32 %944, ptr %946, align 8
  %947 = load ptr, ptr %41, align 8
  %948 = getelementptr inbounds %struct.SetValue, ptr %947, i32 0, i32 0
  %949 = load i32, ptr %948, align 8
  %950 = sext i32 %949 to i64
  %951 = mul i64 8, %950
  %952 = call noalias ptr @malloc(i64 noundef %951) #5
  %953 = load ptr, ptr %41, align 8
  %954 = getelementptr inbounds %struct.SetValue, ptr %953, i32 0, i32 1
  store ptr %952, ptr %954, align 8
  store i32 0, ptr %42, align 4
  br label %955

955:                                              ; preds = %983, %940
  %956 = load i32, ptr %42, align 4
  %957 = load ptr, ptr %39, align 8
  %958 = getelementptr inbounds %struct.SetValue, ptr %957, i32 0, i32 0
  %959 = load i32, ptr %958, align 8
  %960 = icmp slt i32 %956, %959
  br i1 %960, label %961, label %986

961:                                              ; preds = %955
  %962 = load ptr, ptr %39, align 8
  %963 = getelementptr inbounds %struct.SetValue, ptr %962, i32 0, i32 1
  %964 = load ptr, ptr %963, align 8
  %965 = load i32, ptr %42, align 4
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds ptr, ptr %964, i64 %966
  %968 = load ptr, ptr %967, align 8
  %969 = load ptr, ptr %40, align 8
  %970 = getelementptr inbounds %struct.SetValue, ptr %969, i32 0, i32 1
  %971 = load ptr, ptr %970, align 8
  %972 = load i32, ptr %42, align 4
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds ptr, ptr %971, i64 %973
  %975 = load ptr, ptr %974, align 8
  %976 = call ptr @multCalcLangValues(ptr noundef %968, i32 noundef 1, ptr noundef %975, i32 noundef 1)
  %977 = load ptr, ptr %41, align 8
  %978 = getelementptr inbounds %struct.SetValue, ptr %977, i32 0, i32 1
  %979 = load ptr, ptr %978, align 8
  %980 = load i32, ptr %42, align 4
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds ptr, ptr %979, i64 %981
  store ptr %976, ptr %982, align 8
  br label %983

983:                                              ; preds = %961
  %984 = load i32, ptr %42, align 4
  %985 = add nsw i32 %984, 1
  store i32 %985, ptr %42, align 4
  br label %955, !llvm.loop !52

986:                                              ; preds = %955
  %987 = load ptr, ptr %10, align 8
  %988 = getelementptr inbounds %struct.CalcLangVal, ptr %987, i32 0, i32 0
  store i32 6, ptr %988, align 8
  %989 = load ptr, ptr %41, align 8
  %990 = load ptr, ptr %10, align 8
  %991 = getelementptr inbounds %struct.CalcLangVal, ptr %990, i32 0, i32 1
  store ptr %989, ptr %991, align 8
  br label %993

992:                                              ; preds = %926
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1510

993:                                              ; preds = %986
  br label %1475

994:                                              ; preds = %921, %916
  %995 = load ptr, ptr %6, align 8
  %996 = getelementptr inbounds %struct.CalcLangVal, ptr %995, i32 0, i32 0
  %997 = load i32, ptr %996, align 8
  %998 = icmp eq i32 %997, 6
  br i1 %998, label %999, label %1053

999:                                              ; preds = %994
  %1000 = load ptr, ptr %8, align 8
  %1001 = getelementptr inbounds %struct.CalcLangVal, ptr %1000, i32 0, i32 0
  %1002 = load i32, ptr %1001, align 8
  %1003 = icmp eq i32 %1002, 0
  br i1 %1003, label %1004, label %1053

1004:                                             ; preds = %999
  %1005 = load ptr, ptr %6, align 8
  %1006 = getelementptr inbounds %struct.CalcLangVal, ptr %1005, i32 0, i32 1
  %1007 = load ptr, ptr %1006, align 8
  store ptr %1007, ptr %43, align 8
  %1008 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1008, ptr %44, align 8
  %1009 = load ptr, ptr %43, align 8
  %1010 = getelementptr inbounds %struct.SetValue, ptr %1009, i32 0, i32 0
  %1011 = load i32, ptr %1010, align 8
  %1012 = load ptr, ptr %44, align 8
  %1013 = getelementptr inbounds %struct.SetValue, ptr %1012, i32 0, i32 0
  store i32 %1011, ptr %1013, align 8
  %1014 = load ptr, ptr %44, align 8
  %1015 = getelementptr inbounds %struct.SetValue, ptr %1014, i32 0, i32 0
  %1016 = load i32, ptr %1015, align 8
  %1017 = sext i32 %1016 to i64
  %1018 = mul i64 8, %1017
  %1019 = call noalias ptr @malloc(i64 noundef %1018) #5
  %1020 = load ptr, ptr %44, align 8
  %1021 = getelementptr inbounds %struct.SetValue, ptr %1020, i32 0, i32 1
  store ptr %1019, ptr %1021, align 8
  store i32 0, ptr %45, align 4
  br label %1022

1022:                                             ; preds = %1044, %1004
  %1023 = load i32, ptr %45, align 4
  %1024 = load ptr, ptr %43, align 8
  %1025 = getelementptr inbounds %struct.SetValue, ptr %1024, i32 0, i32 0
  %1026 = load i32, ptr %1025, align 8
  %1027 = icmp slt i32 %1023, %1026
  br i1 %1027, label %1028, label %1047

1028:                                             ; preds = %1022
  %1029 = load ptr, ptr %43, align 8
  %1030 = getelementptr inbounds %struct.SetValue, ptr %1029, i32 0, i32 1
  %1031 = load ptr, ptr %1030, align 8
  %1032 = load i32, ptr %45, align 4
  %1033 = sext i32 %1032 to i64
  %1034 = getelementptr inbounds ptr, ptr %1031, i64 %1033
  %1035 = load ptr, ptr %1034, align 8
  %1036 = load ptr, ptr %8, align 8
  %1037 = call ptr @multCalcLangValues(ptr noundef %1035, i32 noundef 1, ptr noundef %1036, i32 noundef 0)
  %1038 = load ptr, ptr %44, align 8
  %1039 = getelementptr inbounds %struct.SetValue, ptr %1038, i32 0, i32 1
  %1040 = load ptr, ptr %1039, align 8
  %1041 = load i32, ptr %45, align 4
  %1042 = sext i32 %1041 to i64
  %1043 = getelementptr inbounds ptr, ptr %1040, i64 %1042
  store ptr %1037, ptr %1043, align 8
  br label %1044

1044:                                             ; preds = %1028
  %1045 = load i32, ptr %45, align 4
  %1046 = add nsw i32 %1045, 1
  store i32 %1046, ptr %45, align 4
  br label %1022, !llvm.loop !53

1047:                                             ; preds = %1022
  %1048 = load ptr, ptr %10, align 8
  %1049 = getelementptr inbounds %struct.CalcLangVal, ptr %1048, i32 0, i32 0
  store i32 6, ptr %1049, align 8
  %1050 = load ptr, ptr %44, align 8
  %1051 = load ptr, ptr %10, align 8
  %1052 = getelementptr inbounds %struct.CalcLangVal, ptr %1051, i32 0, i32 1
  store ptr %1050, ptr %1052, align 8
  br label %1474

1053:                                             ; preds = %999, %994
  %1054 = load ptr, ptr %6, align 8
  %1055 = getelementptr inbounds %struct.CalcLangVal, ptr %1054, i32 0, i32 0
  %1056 = load i32, ptr %1055, align 8
  %1057 = icmp eq i32 %1056, 0
  br i1 %1057, label %1058, label %1112

1058:                                             ; preds = %1053
  %1059 = load ptr, ptr %8, align 8
  %1060 = getelementptr inbounds %struct.CalcLangVal, ptr %1059, i32 0, i32 0
  %1061 = load i32, ptr %1060, align 8
  %1062 = icmp eq i32 %1061, 6
  br i1 %1062, label %1063, label %1112

1063:                                             ; preds = %1058
  %1064 = load ptr, ptr %8, align 8
  %1065 = getelementptr inbounds %struct.CalcLangVal, ptr %1064, i32 0, i32 1
  %1066 = load ptr, ptr %1065, align 8
  store ptr %1066, ptr %46, align 8
  %1067 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1067, ptr %47, align 8
  %1068 = load ptr, ptr %46, align 8
  %1069 = getelementptr inbounds %struct.SetValue, ptr %1068, i32 0, i32 0
  %1070 = load i32, ptr %1069, align 8
  %1071 = load ptr, ptr %47, align 8
  %1072 = getelementptr inbounds %struct.SetValue, ptr %1071, i32 0, i32 0
  store i32 %1070, ptr %1072, align 8
  %1073 = load ptr, ptr %47, align 8
  %1074 = getelementptr inbounds %struct.SetValue, ptr %1073, i32 0, i32 0
  %1075 = load i32, ptr %1074, align 8
  %1076 = sext i32 %1075 to i64
  %1077 = mul i64 8, %1076
  %1078 = call noalias ptr @malloc(i64 noundef %1077) #5
  %1079 = load ptr, ptr %47, align 8
  %1080 = getelementptr inbounds %struct.SetValue, ptr %1079, i32 0, i32 1
  store ptr %1078, ptr %1080, align 8
  store i32 0, ptr %48, align 4
  br label %1081

1081:                                             ; preds = %1103, %1063
  %1082 = load i32, ptr %48, align 4
  %1083 = load ptr, ptr %46, align 8
  %1084 = getelementptr inbounds %struct.SetValue, ptr %1083, i32 0, i32 0
  %1085 = load i32, ptr %1084, align 8
  %1086 = icmp slt i32 %1082, %1085
  br i1 %1086, label %1087, label %1106

1087:                                             ; preds = %1081
  %1088 = load ptr, ptr %6, align 8
  %1089 = load ptr, ptr %46, align 8
  %1090 = getelementptr inbounds %struct.SetValue, ptr %1089, i32 0, i32 1
  %1091 = load ptr, ptr %1090, align 8
  %1092 = load i32, ptr %48, align 4
  %1093 = sext i32 %1092 to i64
  %1094 = getelementptr inbounds ptr, ptr %1091, i64 %1093
  %1095 = load ptr, ptr %1094, align 8
  %1096 = call ptr @multCalcLangValues(ptr noundef %1088, i32 noundef 0, ptr noundef %1095, i32 noundef 1)
  %1097 = load ptr, ptr %47, align 8
  %1098 = getelementptr inbounds %struct.SetValue, ptr %1097, i32 0, i32 1
  %1099 = load ptr, ptr %1098, align 8
  %1100 = load i32, ptr %48, align 4
  %1101 = sext i32 %1100 to i64
  %1102 = getelementptr inbounds ptr, ptr %1099, i64 %1101
  store ptr %1096, ptr %1102, align 8
  br label %1103

1103:                                             ; preds = %1087
  %1104 = load i32, ptr %48, align 4
  %1105 = add nsw i32 %1104, 1
  store i32 %1105, ptr %48, align 4
  br label %1081, !llvm.loop !54

1106:                                             ; preds = %1081
  %1107 = load ptr, ptr %10, align 8
  %1108 = getelementptr inbounds %struct.CalcLangVal, ptr %1107, i32 0, i32 0
  store i32 6, ptr %1108, align 8
  %1109 = load ptr, ptr %47, align 8
  %1110 = load ptr, ptr %10, align 8
  %1111 = getelementptr inbounds %struct.CalcLangVal, ptr %1110, i32 0, i32 1
  store ptr %1109, ptr %1111, align 8
  br label %1473

1112:                                             ; preds = %1058, %1053
  %1113 = load ptr, ptr %6, align 8
  %1114 = getelementptr inbounds %struct.CalcLangVal, ptr %1113, i32 0, i32 0
  %1115 = load i32, ptr %1114, align 8
  %1116 = icmp eq i32 %1115, 6
  br i1 %1116, label %1117, label %1171

1117:                                             ; preds = %1112
  %1118 = load ptr, ptr %8, align 8
  %1119 = getelementptr inbounds %struct.CalcLangVal, ptr %1118, i32 0, i32 0
  %1120 = load i32, ptr %1119, align 8
  %1121 = icmp eq i32 %1120, 1
  br i1 %1121, label %1122, label %1171

1122:                                             ; preds = %1117
  %1123 = load ptr, ptr %6, align 8
  %1124 = getelementptr inbounds %struct.CalcLangVal, ptr %1123, i32 0, i32 1
  %1125 = load ptr, ptr %1124, align 8
  store ptr %1125, ptr %49, align 8
  %1126 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1126, ptr %50, align 8
  %1127 = load ptr, ptr %49, align 8
  %1128 = getelementptr inbounds %struct.SetValue, ptr %1127, i32 0, i32 0
  %1129 = load i32, ptr %1128, align 8
  %1130 = load ptr, ptr %50, align 8
  %1131 = getelementptr inbounds %struct.SetValue, ptr %1130, i32 0, i32 0
  store i32 %1129, ptr %1131, align 8
  %1132 = load ptr, ptr %50, align 8
  %1133 = getelementptr inbounds %struct.SetValue, ptr %1132, i32 0, i32 0
  %1134 = load i32, ptr %1133, align 8
  %1135 = sext i32 %1134 to i64
  %1136 = mul i64 8, %1135
  %1137 = call noalias ptr @malloc(i64 noundef %1136) #5
  %1138 = load ptr, ptr %50, align 8
  %1139 = getelementptr inbounds %struct.SetValue, ptr %1138, i32 0, i32 1
  store ptr %1137, ptr %1139, align 8
  store i32 0, ptr %51, align 4
  br label %1140

1140:                                             ; preds = %1162, %1122
  %1141 = load i32, ptr %51, align 4
  %1142 = load ptr, ptr %49, align 8
  %1143 = getelementptr inbounds %struct.SetValue, ptr %1142, i32 0, i32 0
  %1144 = load i32, ptr %1143, align 8
  %1145 = icmp slt i32 %1141, %1144
  br i1 %1145, label %1146, label %1165

1146:                                             ; preds = %1140
  %1147 = load ptr, ptr %49, align 8
  %1148 = getelementptr inbounds %struct.SetValue, ptr %1147, i32 0, i32 1
  %1149 = load ptr, ptr %1148, align 8
  %1150 = load i32, ptr %51, align 4
  %1151 = sext i32 %1150 to i64
  %1152 = getelementptr inbounds ptr, ptr %1149, i64 %1151
  %1153 = load ptr, ptr %1152, align 8
  %1154 = load ptr, ptr %8, align 8
  %1155 = call ptr @multCalcLangValues(ptr noundef %1153, i32 noundef 1, ptr noundef %1154, i32 noundef 0)
  %1156 = load ptr, ptr %50, align 8
  %1157 = getelementptr inbounds %struct.SetValue, ptr %1156, i32 0, i32 1
  %1158 = load ptr, ptr %1157, align 8
  %1159 = load i32, ptr %51, align 4
  %1160 = sext i32 %1159 to i64
  %1161 = getelementptr inbounds ptr, ptr %1158, i64 %1160
  store ptr %1155, ptr %1161, align 8
  br label %1162

1162:                                             ; preds = %1146
  %1163 = load i32, ptr %51, align 4
  %1164 = add nsw i32 %1163, 1
  store i32 %1164, ptr %51, align 4
  br label %1140, !llvm.loop !55

1165:                                             ; preds = %1140
  %1166 = load ptr, ptr %10, align 8
  %1167 = getelementptr inbounds %struct.CalcLangVal, ptr %1166, i32 0, i32 0
  store i32 7, ptr %1167, align 8
  %1168 = load ptr, ptr %50, align 8
  %1169 = load ptr, ptr %10, align 8
  %1170 = getelementptr inbounds %struct.CalcLangVal, ptr %1169, i32 0, i32 1
  store ptr %1168, ptr %1170, align 8
  br label %1472

1171:                                             ; preds = %1117, %1112
  %1172 = load ptr, ptr %6, align 8
  %1173 = getelementptr inbounds %struct.CalcLangVal, ptr %1172, i32 0, i32 0
  %1174 = load i32, ptr %1173, align 8
  %1175 = icmp eq i32 %1174, 1
  br i1 %1175, label %1176, label %1230

1176:                                             ; preds = %1171
  %1177 = load ptr, ptr %8, align 8
  %1178 = getelementptr inbounds %struct.CalcLangVal, ptr %1177, i32 0, i32 0
  %1179 = load i32, ptr %1178, align 8
  %1180 = icmp eq i32 %1179, 6
  br i1 %1180, label %1181, label %1230

1181:                                             ; preds = %1176
  %1182 = load ptr, ptr %8, align 8
  %1183 = getelementptr inbounds %struct.CalcLangVal, ptr %1182, i32 0, i32 1
  %1184 = load ptr, ptr %1183, align 8
  store ptr %1184, ptr %52, align 8
  %1185 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1185, ptr %53, align 8
  %1186 = load ptr, ptr %52, align 8
  %1187 = getelementptr inbounds %struct.SetValue, ptr %1186, i32 0, i32 0
  %1188 = load i32, ptr %1187, align 8
  %1189 = load ptr, ptr %53, align 8
  %1190 = getelementptr inbounds %struct.SetValue, ptr %1189, i32 0, i32 0
  store i32 %1188, ptr %1190, align 8
  %1191 = load ptr, ptr %53, align 8
  %1192 = getelementptr inbounds %struct.SetValue, ptr %1191, i32 0, i32 0
  %1193 = load i32, ptr %1192, align 8
  %1194 = sext i32 %1193 to i64
  %1195 = mul i64 8, %1194
  %1196 = call noalias ptr @malloc(i64 noundef %1195) #5
  %1197 = load ptr, ptr %53, align 8
  %1198 = getelementptr inbounds %struct.SetValue, ptr %1197, i32 0, i32 1
  store ptr %1196, ptr %1198, align 8
  store i32 0, ptr %54, align 4
  br label %1199

1199:                                             ; preds = %1221, %1181
  %1200 = load i32, ptr %54, align 4
  %1201 = load ptr, ptr %52, align 8
  %1202 = getelementptr inbounds %struct.SetValue, ptr %1201, i32 0, i32 0
  %1203 = load i32, ptr %1202, align 8
  %1204 = icmp slt i32 %1200, %1203
  br i1 %1204, label %1205, label %1224

1205:                                             ; preds = %1199
  %1206 = load ptr, ptr %6, align 8
  %1207 = load ptr, ptr %52, align 8
  %1208 = getelementptr inbounds %struct.SetValue, ptr %1207, i32 0, i32 1
  %1209 = load ptr, ptr %1208, align 8
  %1210 = load i32, ptr %54, align 4
  %1211 = sext i32 %1210 to i64
  %1212 = getelementptr inbounds ptr, ptr %1209, i64 %1211
  %1213 = load ptr, ptr %1212, align 8
  %1214 = call ptr @multCalcLangValues(ptr noundef %1206, i32 noundef 0, ptr noundef %1213, i32 noundef 1)
  %1215 = load ptr, ptr %53, align 8
  %1216 = getelementptr inbounds %struct.SetValue, ptr %1215, i32 0, i32 1
  %1217 = load ptr, ptr %1216, align 8
  %1218 = load i32, ptr %54, align 4
  %1219 = sext i32 %1218 to i64
  %1220 = getelementptr inbounds ptr, ptr %1217, i64 %1219
  store ptr %1214, ptr %1220, align 8
  br label %1221

1221:                                             ; preds = %1205
  %1222 = load i32, ptr %54, align 4
  %1223 = add nsw i32 %1222, 1
  store i32 %1223, ptr %54, align 4
  br label %1199, !llvm.loop !56

1224:                                             ; preds = %1199
  %1225 = load ptr, ptr %10, align 8
  %1226 = getelementptr inbounds %struct.CalcLangVal, ptr %1225, i32 0, i32 0
  store i32 6, ptr %1226, align 8
  %1227 = load ptr, ptr %53, align 8
  %1228 = load ptr, ptr %10, align 8
  %1229 = getelementptr inbounds %struct.CalcLangVal, ptr %1228, i32 0, i32 1
  store ptr %1227, ptr %1229, align 8
  br label %1471

1230:                                             ; preds = %1176, %1171
  %1231 = load ptr, ptr %6, align 8
  %1232 = getelementptr inbounds %struct.CalcLangVal, ptr %1231, i32 0, i32 0
  %1233 = load i32, ptr %1232, align 8
  %1234 = icmp eq i32 %1233, 6
  br i1 %1234, label %1235, label %1289

1235:                                             ; preds = %1230
  %1236 = load ptr, ptr %8, align 8
  %1237 = getelementptr inbounds %struct.CalcLangVal, ptr %1236, i32 0, i32 0
  %1238 = load i32, ptr %1237, align 8
  %1239 = icmp eq i32 %1238, 3
  br i1 %1239, label %1240, label %1289

1240:                                             ; preds = %1235
  %1241 = load ptr, ptr %6, align 8
  %1242 = getelementptr inbounds %struct.CalcLangVal, ptr %1241, i32 0, i32 1
  %1243 = load ptr, ptr %1242, align 8
  store ptr %1243, ptr %55, align 8
  %1244 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1244, ptr %56, align 8
  %1245 = load ptr, ptr %55, align 8
  %1246 = getelementptr inbounds %struct.SetValue, ptr %1245, i32 0, i32 0
  %1247 = load i32, ptr %1246, align 8
  %1248 = load ptr, ptr %56, align 8
  %1249 = getelementptr inbounds %struct.SetValue, ptr %1248, i32 0, i32 0
  store i32 %1247, ptr %1249, align 8
  %1250 = load ptr, ptr %56, align 8
  %1251 = getelementptr inbounds %struct.SetValue, ptr %1250, i32 0, i32 0
  %1252 = load i32, ptr %1251, align 8
  %1253 = sext i32 %1252 to i64
  %1254 = mul i64 8, %1253
  %1255 = call noalias ptr @malloc(i64 noundef %1254) #5
  %1256 = load ptr, ptr %56, align 8
  %1257 = getelementptr inbounds %struct.SetValue, ptr %1256, i32 0, i32 1
  store ptr %1255, ptr %1257, align 8
  store i32 0, ptr %57, align 4
  br label %1258

1258:                                             ; preds = %1280, %1240
  %1259 = load i32, ptr %57, align 4
  %1260 = load ptr, ptr %55, align 8
  %1261 = getelementptr inbounds %struct.SetValue, ptr %1260, i32 0, i32 0
  %1262 = load i32, ptr %1261, align 8
  %1263 = icmp slt i32 %1259, %1262
  br i1 %1263, label %1264, label %1283

1264:                                             ; preds = %1258
  %1265 = load ptr, ptr %55, align 8
  %1266 = getelementptr inbounds %struct.SetValue, ptr %1265, i32 0, i32 1
  %1267 = load ptr, ptr %1266, align 8
  %1268 = load i32, ptr %57, align 4
  %1269 = sext i32 %1268 to i64
  %1270 = getelementptr inbounds ptr, ptr %1267, i64 %1269
  %1271 = load ptr, ptr %1270, align 8
  %1272 = load ptr, ptr %8, align 8
  %1273 = call ptr @multCalcLangValues(ptr noundef %1271, i32 noundef 1, ptr noundef %1272, i32 noundef 0)
  %1274 = load ptr, ptr %56, align 8
  %1275 = getelementptr inbounds %struct.SetValue, ptr %1274, i32 0, i32 1
  %1276 = load ptr, ptr %1275, align 8
  %1277 = load i32, ptr %57, align 4
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds ptr, ptr %1276, i64 %1278
  store ptr %1273, ptr %1279, align 8
  br label %1280

1280:                                             ; preds = %1264
  %1281 = load i32, ptr %57, align 4
  %1282 = add nsw i32 %1281, 1
  store i32 %1282, ptr %57, align 4
  br label %1258, !llvm.loop !57

1283:                                             ; preds = %1258
  %1284 = load ptr, ptr %10, align 8
  %1285 = getelementptr inbounds %struct.CalcLangVal, ptr %1284, i32 0, i32 0
  store i32 6, ptr %1285, align 8
  %1286 = load ptr, ptr %56, align 8
  %1287 = load ptr, ptr %10, align 8
  %1288 = getelementptr inbounds %struct.CalcLangVal, ptr %1287, i32 0, i32 1
  store ptr %1286, ptr %1288, align 8
  br label %1470

1289:                                             ; preds = %1235, %1230
  %1290 = load ptr, ptr %6, align 8
  %1291 = getelementptr inbounds %struct.CalcLangVal, ptr %1290, i32 0, i32 0
  %1292 = load i32, ptr %1291, align 8
  %1293 = icmp eq i32 %1292, 3
  br i1 %1293, label %1294, label %1348

1294:                                             ; preds = %1289
  %1295 = load ptr, ptr %8, align 8
  %1296 = getelementptr inbounds %struct.CalcLangVal, ptr %1295, i32 0, i32 0
  %1297 = load i32, ptr %1296, align 8
  %1298 = icmp eq i32 %1297, 6
  br i1 %1298, label %1299, label %1348

1299:                                             ; preds = %1294
  %1300 = load ptr, ptr %8, align 8
  %1301 = getelementptr inbounds %struct.CalcLangVal, ptr %1300, i32 0, i32 1
  %1302 = load ptr, ptr %1301, align 8
  store ptr %1302, ptr %58, align 8
  %1303 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1303, ptr %59, align 8
  %1304 = load ptr, ptr %58, align 8
  %1305 = getelementptr inbounds %struct.SetValue, ptr %1304, i32 0, i32 0
  %1306 = load i32, ptr %1305, align 8
  %1307 = load ptr, ptr %59, align 8
  %1308 = getelementptr inbounds %struct.SetValue, ptr %1307, i32 0, i32 0
  store i32 %1306, ptr %1308, align 8
  %1309 = load ptr, ptr %59, align 8
  %1310 = getelementptr inbounds %struct.SetValue, ptr %1309, i32 0, i32 0
  %1311 = load i32, ptr %1310, align 8
  %1312 = sext i32 %1311 to i64
  %1313 = mul i64 8, %1312
  %1314 = call noalias ptr @malloc(i64 noundef %1313) #5
  %1315 = load ptr, ptr %59, align 8
  %1316 = getelementptr inbounds %struct.SetValue, ptr %1315, i32 0, i32 1
  store ptr %1314, ptr %1316, align 8
  store i32 0, ptr %60, align 4
  br label %1317

1317:                                             ; preds = %1339, %1299
  %1318 = load i32, ptr %60, align 4
  %1319 = load ptr, ptr %58, align 8
  %1320 = getelementptr inbounds %struct.SetValue, ptr %1319, i32 0, i32 0
  %1321 = load i32, ptr %1320, align 8
  %1322 = icmp slt i32 %1318, %1321
  br i1 %1322, label %1323, label %1342

1323:                                             ; preds = %1317
  %1324 = load ptr, ptr %6, align 8
  %1325 = load ptr, ptr %58, align 8
  %1326 = getelementptr inbounds %struct.SetValue, ptr %1325, i32 0, i32 1
  %1327 = load ptr, ptr %1326, align 8
  %1328 = load i32, ptr %60, align 4
  %1329 = sext i32 %1328 to i64
  %1330 = getelementptr inbounds ptr, ptr %1327, i64 %1329
  %1331 = load ptr, ptr %1330, align 8
  %1332 = call ptr @multCalcLangValues(ptr noundef %1324, i32 noundef 0, ptr noundef %1331, i32 noundef 1)
  %1333 = load ptr, ptr %59, align 8
  %1334 = getelementptr inbounds %struct.SetValue, ptr %1333, i32 0, i32 1
  %1335 = load ptr, ptr %1334, align 8
  %1336 = load i32, ptr %60, align 4
  %1337 = sext i32 %1336 to i64
  %1338 = getelementptr inbounds ptr, ptr %1335, i64 %1337
  store ptr %1332, ptr %1338, align 8
  br label %1339

1339:                                             ; preds = %1323
  %1340 = load i32, ptr %60, align 4
  %1341 = add nsw i32 %1340, 1
  store i32 %1341, ptr %60, align 4
  br label %1317, !llvm.loop !58

1342:                                             ; preds = %1317
  %1343 = load ptr, ptr %10, align 8
  %1344 = getelementptr inbounds %struct.CalcLangVal, ptr %1343, i32 0, i32 0
  store i32 6, ptr %1344, align 8
  %1345 = load ptr, ptr %59, align 8
  %1346 = load ptr, ptr %10, align 8
  %1347 = getelementptr inbounds %struct.CalcLangVal, ptr %1346, i32 0, i32 1
  store ptr %1345, ptr %1347, align 8
  br label %1469

1348:                                             ; preds = %1294, %1289
  %1349 = load ptr, ptr %6, align 8
  %1350 = getelementptr inbounds %struct.CalcLangVal, ptr %1349, i32 0, i32 0
  %1351 = load i32, ptr %1350, align 8
  %1352 = icmp eq i32 %1351, 6
  br i1 %1352, label %1353, label %1407

1353:                                             ; preds = %1348
  %1354 = load ptr, ptr %8, align 8
  %1355 = getelementptr inbounds %struct.CalcLangVal, ptr %1354, i32 0, i32 0
  %1356 = load i32, ptr %1355, align 8
  %1357 = icmp eq i32 %1356, 4
  br i1 %1357, label %1358, label %1407

1358:                                             ; preds = %1353
  %1359 = load ptr, ptr %6, align 8
  %1360 = getelementptr inbounds %struct.CalcLangVal, ptr %1359, i32 0, i32 1
  %1361 = load ptr, ptr %1360, align 8
  store ptr %1361, ptr %61, align 8
  %1362 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1362, ptr %62, align 8
  %1363 = load ptr, ptr %61, align 8
  %1364 = getelementptr inbounds %struct.SetValue, ptr %1363, i32 0, i32 0
  %1365 = load i32, ptr %1364, align 8
  %1366 = load ptr, ptr %62, align 8
  %1367 = getelementptr inbounds %struct.SetValue, ptr %1366, i32 0, i32 0
  store i32 %1365, ptr %1367, align 8
  %1368 = load ptr, ptr %62, align 8
  %1369 = getelementptr inbounds %struct.SetValue, ptr %1368, i32 0, i32 0
  %1370 = load i32, ptr %1369, align 8
  %1371 = sext i32 %1370 to i64
  %1372 = mul i64 8, %1371
  %1373 = call noalias ptr @malloc(i64 noundef %1372) #5
  %1374 = load ptr, ptr %62, align 8
  %1375 = getelementptr inbounds %struct.SetValue, ptr %1374, i32 0, i32 1
  store ptr %1373, ptr %1375, align 8
  store i32 0, ptr %63, align 4
  br label %1376

1376:                                             ; preds = %1398, %1358
  %1377 = load i32, ptr %63, align 4
  %1378 = load ptr, ptr %61, align 8
  %1379 = getelementptr inbounds %struct.SetValue, ptr %1378, i32 0, i32 0
  %1380 = load i32, ptr %1379, align 8
  %1381 = icmp slt i32 %1377, %1380
  br i1 %1381, label %1382, label %1401

1382:                                             ; preds = %1376
  %1383 = load ptr, ptr %61, align 8
  %1384 = getelementptr inbounds %struct.SetValue, ptr %1383, i32 0, i32 1
  %1385 = load ptr, ptr %1384, align 8
  %1386 = load i32, ptr %63, align 4
  %1387 = sext i32 %1386 to i64
  %1388 = getelementptr inbounds ptr, ptr %1385, i64 %1387
  %1389 = load ptr, ptr %1388, align 8
  %1390 = load ptr, ptr %8, align 8
  %1391 = call ptr @multCalcLangValues(ptr noundef %1389, i32 noundef 1, ptr noundef %1390, i32 noundef 0)
  %1392 = load ptr, ptr %62, align 8
  %1393 = getelementptr inbounds %struct.SetValue, ptr %1392, i32 0, i32 1
  %1394 = load ptr, ptr %1393, align 8
  %1395 = load i32, ptr %63, align 4
  %1396 = sext i32 %1395 to i64
  %1397 = getelementptr inbounds ptr, ptr %1394, i64 %1396
  store ptr %1391, ptr %1397, align 8
  br label %1398

1398:                                             ; preds = %1382
  %1399 = load i32, ptr %63, align 4
  %1400 = add nsw i32 %1399, 1
  store i32 %1400, ptr %63, align 4
  br label %1376, !llvm.loop !59

1401:                                             ; preds = %1376
  %1402 = load ptr, ptr %10, align 8
  %1403 = getelementptr inbounds %struct.CalcLangVal, ptr %1402, i32 0, i32 0
  store i32 6, ptr %1403, align 8
  %1404 = load ptr, ptr %62, align 8
  %1405 = load ptr, ptr %10, align 8
  %1406 = getelementptr inbounds %struct.CalcLangVal, ptr %1405, i32 0, i32 1
  store ptr %1404, ptr %1406, align 8
  br label %1468

1407:                                             ; preds = %1353, %1348
  %1408 = load ptr, ptr %6, align 8
  %1409 = getelementptr inbounds %struct.CalcLangVal, ptr %1408, i32 0, i32 0
  %1410 = load i32, ptr %1409, align 8
  %1411 = icmp eq i32 %1410, 4
  br i1 %1411, label %1412, label %1466

1412:                                             ; preds = %1407
  %1413 = load ptr, ptr %8, align 8
  %1414 = getelementptr inbounds %struct.CalcLangVal, ptr %1413, i32 0, i32 0
  %1415 = load i32, ptr %1414, align 8
  %1416 = icmp eq i32 %1415, 6
  br i1 %1416, label %1417, label %1466

1417:                                             ; preds = %1412
  %1418 = load ptr, ptr %8, align 8
  %1419 = getelementptr inbounds %struct.CalcLangVal, ptr %1418, i32 0, i32 1
  %1420 = load ptr, ptr %1419, align 8
  store ptr %1420, ptr %64, align 8
  %1421 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1421, ptr %65, align 8
  %1422 = load ptr, ptr %64, align 8
  %1423 = getelementptr inbounds %struct.SetValue, ptr %1422, i32 0, i32 0
  %1424 = load i32, ptr %1423, align 8
  %1425 = load ptr, ptr %65, align 8
  %1426 = getelementptr inbounds %struct.SetValue, ptr %1425, i32 0, i32 0
  store i32 %1424, ptr %1426, align 8
  %1427 = load ptr, ptr %65, align 8
  %1428 = getelementptr inbounds %struct.SetValue, ptr %1427, i32 0, i32 0
  %1429 = load i32, ptr %1428, align 8
  %1430 = sext i32 %1429 to i64
  %1431 = mul i64 8, %1430
  %1432 = call noalias ptr @malloc(i64 noundef %1431) #5
  %1433 = load ptr, ptr %65, align 8
  %1434 = getelementptr inbounds %struct.SetValue, ptr %1433, i32 0, i32 1
  store ptr %1432, ptr %1434, align 8
  store i32 0, ptr %66, align 4
  br label %1435

1435:                                             ; preds = %1457, %1417
  %1436 = load i32, ptr %66, align 4
  %1437 = load ptr, ptr %64, align 8
  %1438 = getelementptr inbounds %struct.SetValue, ptr %1437, i32 0, i32 0
  %1439 = load i32, ptr %1438, align 8
  %1440 = icmp slt i32 %1436, %1439
  br i1 %1440, label %1441, label %1460

1441:                                             ; preds = %1435
  %1442 = load ptr, ptr %6, align 8
  %1443 = load ptr, ptr %64, align 8
  %1444 = getelementptr inbounds %struct.SetValue, ptr %1443, i32 0, i32 1
  %1445 = load ptr, ptr %1444, align 8
  %1446 = load i32, ptr %66, align 4
  %1447 = sext i32 %1446 to i64
  %1448 = getelementptr inbounds ptr, ptr %1445, i64 %1447
  %1449 = load ptr, ptr %1448, align 8
  %1450 = call ptr @multCalcLangValues(ptr noundef %1442, i32 noundef 0, ptr noundef %1449, i32 noundef 1)
  %1451 = load ptr, ptr %65, align 8
  %1452 = getelementptr inbounds %struct.SetValue, ptr %1451, i32 0, i32 1
  %1453 = load ptr, ptr %1452, align 8
  %1454 = load i32, ptr %66, align 4
  %1455 = sext i32 %1454 to i64
  %1456 = getelementptr inbounds ptr, ptr %1453, i64 %1455
  store ptr %1450, ptr %1456, align 8
  br label %1457

1457:                                             ; preds = %1441
  %1458 = load i32, ptr %66, align 4
  %1459 = add nsw i32 %1458, 1
  store i32 %1459, ptr %66, align 4
  br label %1435, !llvm.loop !60

1460:                                             ; preds = %1435
  %1461 = load ptr, ptr %10, align 8
  %1462 = getelementptr inbounds %struct.CalcLangVal, ptr %1461, i32 0, i32 0
  store i32 6, ptr %1462, align 8
  %1463 = load ptr, ptr %65, align 8
  %1464 = load ptr, ptr %10, align 8
  %1465 = getelementptr inbounds %struct.CalcLangVal, ptr %1464, i32 0, i32 1
  store ptr %1463, ptr %1465, align 8
  br label %1467

1466:                                             ; preds = %1412, %1407
  call void @perror(ptr noundef @.str.1) #6
  br label %1467

1467:                                             ; preds = %1466, %1460
  br label %1468

1468:                                             ; preds = %1467, %1401
  br label %1469

1469:                                             ; preds = %1468, %1342
  br label %1470

1470:                                             ; preds = %1469, %1283
  br label %1471

1471:                                             ; preds = %1470, %1224
  br label %1472

1472:                                             ; preds = %1471, %1165
  br label %1473

1473:                                             ; preds = %1472, %1106
  br label %1474

1474:                                             ; preds = %1473, %1047
  br label %1475

1475:                                             ; preds = %1474, %993
  br label %1476

1476:                                             ; preds = %1475, %910
  br label %1477

1477:                                             ; preds = %1476, %851
  br label %1478

1478:                                             ; preds = %1477, %792
  br label %1479

1479:                                             ; preds = %1478, %733
  br label %1480

1480:                                             ; preds = %1479, %674
  br label %1481

1481:                                             ; preds = %1480, %615
  br label %1482

1482:                                             ; preds = %1481, %556
  br label %1483

1483:                                             ; preds = %1482, %497
  br label %1484

1484:                                             ; preds = %1483, %443
  br label %1485

1485:                                             ; preds = %1484, %354
  br label %1486

1486:                                             ; preds = %1485, %332
  br label %1487

1487:                                             ; preds = %1486, %310
  br label %1488

1488:                                             ; preds = %1487, %287
  br label %1489

1489:                                             ; preds = %1488, %264
  br label %1490

1490:                                             ; preds = %1489, %242
  br label %1491

1491:                                             ; preds = %1490, %220
  br label %1492

1492:                                             ; preds = %1491, %197
  br label %1493

1493:                                             ; preds = %1492, %174
  br label %1494

1494:                                             ; preds = %1493, %151
  br label %1495

1495:                                             ; preds = %1494, %128
  br label %1496

1496:                                             ; preds = %1495, %106
  br label %1497

1497:                                             ; preds = %1496, %84
  %1498 = load i32, ptr %7, align 4
  %1499 = icmp ne i32 %1498, 0
  br i1 %1499, label %1500, label %1502

1500:                                             ; preds = %1497
  %1501 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1501)
  br label %1508

1502:                                             ; preds = %1497
  %1503 = load i32, ptr %9, align 4
  %1504 = icmp ne i32 %1503, 0
  br i1 %1504, label %1505, label %1507

1505:                                             ; preds = %1502
  %1506 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1506)
  br label %1507

1507:                                             ; preds = %1505, %1502
  br label %1508

1508:                                             ; preds = %1507, %1500
  %1509 = load ptr, ptr %10, align 8
  store ptr %1509, ptr %5, align 8
  br label %1510

1510:                                             ; preds = %1508, %992, %442, %72
  %1511 = load ptr, ptr %5, align 8
  ret ptr %1511
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @divCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i32, align 4
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i32, align 4
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i32, align 4
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %67 = load ptr, ptr %6, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %72, label %69

69:                                               ; preds = %4
  %70 = load ptr, ptr %8, align 8
  %71 = icmp eq ptr %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %69, %4
  store ptr null, ptr %5, align 8
  br label %1488

73:                                               ; preds = %69
  %74 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %74, ptr %10, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %98

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %98

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 1, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = sitofp i32 %89 to double
  %91 = load ptr, ptr %8, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 1
  %93 = load i32, ptr %92, align 8
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %90, %94
  %96 = load ptr, ptr %10, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 1
  store double %95, ptr %97, align 8
  br label %1475

98:                                               ; preds = %79, %73
  %99 = load ptr, ptr %6, align 8
  %100 = getelementptr inbounds %struct.CalcLangVal, ptr %99, i32 0, i32 0
  %101 = load i32, ptr %100, align 8
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %120

103:                                              ; preds = %98
  %104 = load ptr, ptr %8, align 8
  %105 = getelementptr inbounds %struct.CalcLangVal, ptr %104, i32 0, i32 0
  %106 = load i32, ptr %105, align 8
  %107 = icmp eq i32 %106, 1
  br i1 %107, label %108, label %120

108:                                              ; preds = %103
  %109 = load ptr, ptr %10, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 0
  store i32 1, ptr %110, align 8
  %111 = load ptr, ptr %6, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load double, ptr %112, align 8
  %114 = load ptr, ptr %8, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 1
  %116 = load double, ptr %115, align 8
  %117 = fdiv double %113, %116
  %118 = load ptr, ptr %10, align 8
  %119 = getelementptr inbounds %struct.CalcLangVal, ptr %118, i32 0, i32 1
  store double %117, ptr %119, align 8
  br label %1474

120:                                              ; preds = %103, %98
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 0
  %123 = load i32, ptr %122, align 8
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %143

125:                                              ; preds = %120
  %126 = load ptr, ptr %8, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 0
  %128 = load i32, ptr %127, align 8
  %129 = icmp eq i32 %128, 1
  br i1 %129, label %130, label %143

130:                                              ; preds = %125
  %131 = load ptr, ptr %10, align 8
  %132 = getelementptr inbounds %struct.CalcLangVal, ptr %131, i32 0, i32 0
  store i32 1, ptr %132, align 8
  %133 = load ptr, ptr %6, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 1
  %135 = load i32, ptr %134, align 8
  %136 = sitofp i32 %135 to double
  %137 = load ptr, ptr %8, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 1
  %139 = load double, ptr %138, align 8
  %140 = fdiv double %136, %139
  %141 = load ptr, ptr %10, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 1
  store double %140, ptr %142, align 8
  br label %1473

143:                                              ; preds = %125, %120
  %144 = load ptr, ptr %6, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp eq i32 %146, 1
  br i1 %147, label %148, label %166

148:                                              ; preds = %143
  %149 = load ptr, ptr %8, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 0
  %151 = load i32, ptr %150, align 8
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %166

153:                                              ; preds = %148
  %154 = load ptr, ptr %10, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 0
  store i32 1, ptr %155, align 8
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 1
  %158 = load double, ptr %157, align 8
  %159 = load ptr, ptr %8, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  %161 = load i32, ptr %160, align 8
  %162 = sitofp i32 %161 to double
  %163 = fdiv double %158, %162
  %164 = load ptr, ptr %10, align 8
  %165 = getelementptr inbounds %struct.CalcLangVal, ptr %164, i32 0, i32 1
  store double %163, ptr %165, align 8
  br label %1472

166:                                              ; preds = %148, %143
  %167 = load ptr, ptr %6, align 8
  %168 = getelementptr inbounds %struct.CalcLangVal, ptr %167, i32 0, i32 0
  %169 = load i32, ptr %168, align 8
  %170 = icmp eq i32 %169, 3
  br i1 %170, label %171, label %189

171:                                              ; preds = %166
  %172 = load ptr, ptr %8, align 8
  %173 = getelementptr inbounds %struct.CalcLangVal, ptr %172, i32 0, i32 0
  %174 = load i32, ptr %173, align 8
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %189

176:                                              ; preds = %171
  %177 = load ptr, ptr %10, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 0
  store i32 3, ptr %178, align 8
  %179 = load ptr, ptr %6, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 1
  %181 = load double, ptr %180, align 8
  %182 = load ptr, ptr %8, align 8
  %183 = getelementptr inbounds %struct.CalcLangVal, ptr %182, i32 0, i32 1
  %184 = load i32, ptr %183, align 8
  %185 = sitofp i32 %184 to double
  %186 = fdiv double %181, %185
  %187 = load ptr, ptr %10, align 8
  %188 = getelementptr inbounds %struct.CalcLangVal, ptr %187, i32 0, i32 1
  store double %186, ptr %188, align 8
  br label %1471

189:                                              ; preds = %171, %166
  %190 = load ptr, ptr %6, align 8
  %191 = getelementptr inbounds %struct.CalcLangVal, ptr %190, i32 0, i32 0
  %192 = load i32, ptr %191, align 8
  %193 = icmp eq i32 %192, 3
  br i1 %193, label %194, label %211

194:                                              ; preds = %189
  %195 = load ptr, ptr %8, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 0
  %197 = load i32, ptr %196, align 8
  %198 = icmp eq i32 %197, 3
  br i1 %198, label %199, label %211

199:                                              ; preds = %194
  %200 = load ptr, ptr %10, align 8
  %201 = getelementptr inbounds %struct.CalcLangVal, ptr %200, i32 0, i32 0
  store i32 1, ptr %201, align 8
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 1
  %204 = load double, ptr %203, align 8
  %205 = load ptr, ptr %8, align 8
  %206 = getelementptr inbounds %struct.CalcLangVal, ptr %205, i32 0, i32 1
  %207 = load double, ptr %206, align 8
  %208 = fdiv double %204, %207
  %209 = load ptr, ptr %10, align 8
  %210 = getelementptr inbounds %struct.CalcLangVal, ptr %209, i32 0, i32 1
  store double %208, ptr %210, align 8
  br label %1470

211:                                              ; preds = %194, %189
  %212 = load ptr, ptr %6, align 8
  %213 = getelementptr inbounds %struct.CalcLangVal, ptr %212, i32 0, i32 0
  %214 = load i32, ptr %213, align 8
  %215 = icmp eq i32 %214, 3
  br i1 %215, label %216, label %233

216:                                              ; preds = %211
  %217 = load ptr, ptr %8, align 8
  %218 = getelementptr inbounds %struct.CalcLangVal, ptr %217, i32 0, i32 0
  %219 = load i32, ptr %218, align 8
  %220 = icmp eq i32 %219, 1
  br i1 %220, label %221, label %233

221:                                              ; preds = %216
  %222 = load ptr, ptr %10, align 8
  %223 = getelementptr inbounds %struct.CalcLangVal, ptr %222, i32 0, i32 0
  store i32 3, ptr %223, align 8
  %224 = load ptr, ptr %6, align 8
  %225 = getelementptr inbounds %struct.CalcLangVal, ptr %224, i32 0, i32 1
  %226 = load double, ptr %225, align 8
  %227 = load ptr, ptr %8, align 8
  %228 = getelementptr inbounds %struct.CalcLangVal, ptr %227, i32 0, i32 1
  %229 = load double, ptr %228, align 8
  %230 = fdiv double %226, %229
  %231 = load ptr, ptr %10, align 8
  %232 = getelementptr inbounds %struct.CalcLangVal, ptr %231, i32 0, i32 1
  store double %230, ptr %232, align 8
  br label %1469

233:                                              ; preds = %216, %211
  %234 = load ptr, ptr %6, align 8
  %235 = getelementptr inbounds %struct.CalcLangVal, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = icmp eq i32 %236, 4
  br i1 %237, label %238, label %256

238:                                              ; preds = %233
  %239 = load ptr, ptr %8, align 8
  %240 = getelementptr inbounds %struct.CalcLangVal, ptr %239, i32 0, i32 0
  %241 = load i32, ptr %240, align 8
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %243, label %256

243:                                              ; preds = %238
  %244 = load ptr, ptr %10, align 8
  %245 = getelementptr inbounds %struct.CalcLangVal, ptr %244, i32 0, i32 0
  store i32 4, ptr %245, align 8
  %246 = load ptr, ptr %6, align 8
  %247 = getelementptr inbounds %struct.CalcLangVal, ptr %246, i32 0, i32 1
  %248 = load double, ptr %247, align 8
  %249 = load ptr, ptr %8, align 8
  %250 = getelementptr inbounds %struct.CalcLangVal, ptr %249, i32 0, i32 1
  %251 = load i32, ptr %250, align 8
  %252 = sitofp i32 %251 to double
  %253 = fdiv double %248, %252
  %254 = load ptr, ptr %10, align 8
  %255 = getelementptr inbounds %struct.CalcLangVal, ptr %254, i32 0, i32 1
  store double %253, ptr %255, align 8
  br label %1468

256:                                              ; preds = %238, %233
  %257 = load ptr, ptr %6, align 8
  %258 = getelementptr inbounds %struct.CalcLangVal, ptr %257, i32 0, i32 0
  %259 = load i32, ptr %258, align 8
  %260 = icmp eq i32 %259, 0
  br i1 %260, label %261, label %279

261:                                              ; preds = %256
  %262 = load ptr, ptr %8, align 8
  %263 = getelementptr inbounds %struct.CalcLangVal, ptr %262, i32 0, i32 0
  %264 = load i32, ptr %263, align 8
  %265 = icmp eq i32 %264, 4
  br i1 %265, label %266, label %279

266:                                              ; preds = %261
  %267 = load ptr, ptr %10, align 8
  %268 = getelementptr inbounds %struct.CalcLangVal, ptr %267, i32 0, i32 0
  store i32 4, ptr %268, align 8
  %269 = load ptr, ptr %6, align 8
  %270 = getelementptr inbounds %struct.CalcLangVal, ptr %269, i32 0, i32 1
  %271 = load i32, ptr %270, align 8
  %272 = sitofp i32 %271 to double
  %273 = load ptr, ptr %8, align 8
  %274 = getelementptr inbounds %struct.CalcLangVal, ptr %273, i32 0, i32 1
  %275 = load double, ptr %274, align 8
  %276 = fdiv double %272, %275
  %277 = load ptr, ptr %10, align 8
  %278 = getelementptr inbounds %struct.CalcLangVal, ptr %277, i32 0, i32 1
  store double %276, ptr %278, align 8
  br label %1467

279:                                              ; preds = %261, %256
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds %struct.CalcLangVal, ptr %280, i32 0, i32 0
  %282 = load i32, ptr %281, align 8
  %283 = icmp eq i32 %282, 1
  br i1 %283, label %284, label %301

284:                                              ; preds = %279
  %285 = load ptr, ptr %8, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 0
  %287 = load i32, ptr %286, align 8
  %288 = icmp eq i32 %287, 4
  br i1 %288, label %289, label %301

289:                                              ; preds = %284
  %290 = load ptr, ptr %10, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 0
  store i32 4, ptr %291, align 8
  %292 = load ptr, ptr %6, align 8
  %293 = getelementptr inbounds %struct.CalcLangVal, ptr %292, i32 0, i32 1
  %294 = load double, ptr %293, align 8
  %295 = load ptr, ptr %8, align 8
  %296 = getelementptr inbounds %struct.CalcLangVal, ptr %295, i32 0, i32 1
  %297 = load double, ptr %296, align 8
  %298 = fdiv double %294, %297
  %299 = load ptr, ptr %10, align 8
  %300 = getelementptr inbounds %struct.CalcLangVal, ptr %299, i32 0, i32 1
  store double %298, ptr %300, align 8
  br label %1466

301:                                              ; preds = %284, %279
  %302 = load ptr, ptr %6, align 8
  %303 = getelementptr inbounds %struct.CalcLangVal, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = icmp eq i32 %304, 4
  br i1 %305, label %306, label %323

306:                                              ; preds = %301
  %307 = load ptr, ptr %8, align 8
  %308 = getelementptr inbounds %struct.CalcLangVal, ptr %307, i32 0, i32 0
  %309 = load i32, ptr %308, align 8
  %310 = icmp eq i32 %309, 1
  br i1 %310, label %311, label %323

311:                                              ; preds = %306
  %312 = load ptr, ptr %10, align 8
  %313 = getelementptr inbounds %struct.CalcLangVal, ptr %312, i32 0, i32 0
  store i32 4, ptr %313, align 8
  %314 = load ptr, ptr %6, align 8
  %315 = getelementptr inbounds %struct.CalcLangVal, ptr %314, i32 0, i32 1
  %316 = load double, ptr %315, align 8
  %317 = load ptr, ptr %8, align 8
  %318 = getelementptr inbounds %struct.CalcLangVal, ptr %317, i32 0, i32 1
  %319 = load double, ptr %318, align 8
  %320 = fdiv double %316, %319
  %321 = load ptr, ptr %10, align 8
  %322 = getelementptr inbounds %struct.CalcLangVal, ptr %321, i32 0, i32 1
  store double %320, ptr %322, align 8
  br label %1465

323:                                              ; preds = %306, %301
  %324 = load ptr, ptr %6, align 8
  %325 = getelementptr inbounds %struct.CalcLangVal, ptr %324, i32 0, i32 0
  %326 = load i32, ptr %325, align 8
  %327 = icmp eq i32 %326, 4
  br i1 %327, label %328, label %345

328:                                              ; preds = %323
  %329 = load ptr, ptr %8, align 8
  %330 = getelementptr inbounds %struct.CalcLangVal, ptr %329, i32 0, i32 0
  %331 = load i32, ptr %330, align 8
  %332 = icmp eq i32 %331, 4
  br i1 %332, label %333, label %345

333:                                              ; preds = %328
  %334 = load ptr, ptr %10, align 8
  %335 = getelementptr inbounds %struct.CalcLangVal, ptr %334, i32 0, i32 0
  store i32 4, ptr %335, align 8
  %336 = load ptr, ptr %6, align 8
  %337 = getelementptr inbounds %struct.CalcLangVal, ptr %336, i32 0, i32 1
  %338 = load double, ptr %337, align 8
  %339 = load ptr, ptr %8, align 8
  %340 = getelementptr inbounds %struct.CalcLangVal, ptr %339, i32 0, i32 1
  %341 = load double, ptr %340, align 8
  %342 = fdiv double %338, %341
  %343 = load ptr, ptr %10, align 8
  %344 = getelementptr inbounds %struct.CalcLangVal, ptr %343, i32 0, i32 1
  store double %342, ptr %344, align 8
  br label %1464

345:                                              ; preds = %328, %323
  %346 = load ptr, ptr %6, align 8
  %347 = getelementptr inbounds %struct.CalcLangVal, ptr %346, i32 0, i32 0
  %348 = load i32, ptr %347, align 8
  %349 = icmp eq i32 %348, 7
  br i1 %349, label %350, label %423

350:                                              ; preds = %345
  %351 = load ptr, ptr %8, align 8
  %352 = getelementptr inbounds %struct.CalcLangVal, ptr %351, i32 0, i32 0
  %353 = load i32, ptr %352, align 8
  %354 = icmp eq i32 %353, 7
  br i1 %354, label %355, label %423

355:                                              ; preds = %350
  %356 = load ptr, ptr %6, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 1
  %358 = load ptr, ptr %357, align 8
  store ptr %358, ptr %11, align 8
  %359 = load ptr, ptr %8, align 8
  %360 = getelementptr inbounds %struct.CalcLangVal, ptr %359, i32 0, i32 1
  %361 = load ptr, ptr %360, align 8
  store ptr %361, ptr %12, align 8
  %362 = load ptr, ptr %12, align 8
  %363 = getelementptr inbounds %struct.TupleValue, ptr %362, i32 0, i32 0
  %364 = load i32, ptr %363, align 8
  %365 = load ptr, ptr %11, align 8
  %366 = getelementptr inbounds %struct.TupleValue, ptr %365, i32 0, i32 0
  %367 = load i32, ptr %366, align 8
  %368 = icmp eq i32 %364, %367
  br i1 %368, label %369, label %421

369:                                              ; preds = %355
  %370 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %370, ptr %13, align 8
  %371 = load ptr, ptr %11, align 8
  %372 = getelementptr inbounds %struct.TupleValue, ptr %371, i32 0, i32 0
  %373 = load i32, ptr %372, align 8
  %374 = load ptr, ptr %13, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 0
  store i32 %373, ptr %375, align 8
  %376 = load ptr, ptr %13, align 8
  %377 = getelementptr inbounds %struct.TupleValue, ptr %376, i32 0, i32 0
  %378 = load i32, ptr %377, align 8
  %379 = sext i32 %378 to i64
  %380 = mul i64 8, %379
  %381 = call noalias ptr @malloc(i64 noundef %380) #5
  %382 = load ptr, ptr %13, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 1
  store ptr %381, ptr %383, align 8
  store i32 0, ptr %14, align 4
  br label %384

384:                                              ; preds = %412, %369
  %385 = load i32, ptr %14, align 4
  %386 = load ptr, ptr %11, align 8
  %387 = getelementptr inbounds %struct.TupleValue, ptr %386, i32 0, i32 0
  %388 = load i32, ptr %387, align 8
  %389 = icmp slt i32 %385, %388
  br i1 %389, label %390, label %415

390:                                              ; preds = %384
  %391 = load ptr, ptr %11, align 8
  %392 = getelementptr inbounds %struct.TupleValue, ptr %391, i32 0, i32 1
  %393 = load ptr, ptr %392, align 8
  %394 = load i32, ptr %14, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds ptr, ptr %393, i64 %395
  %397 = load ptr, ptr %396, align 8
  %398 = load ptr, ptr %12, align 8
  %399 = getelementptr inbounds %struct.TupleValue, ptr %398, i32 0, i32 1
  %400 = load ptr, ptr %399, align 8
  %401 = load i32, ptr %14, align 4
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds ptr, ptr %400, i64 %402
  %404 = load ptr, ptr %403, align 8
  %405 = call ptr @divCalcLangValues(ptr noundef %397, i32 noundef 1, ptr noundef %404, i32 noundef 0)
  %406 = load ptr, ptr %13, align 8
  %407 = getelementptr inbounds %struct.TupleValue, ptr %406, i32 0, i32 1
  %408 = load ptr, ptr %407, align 8
  %409 = load i32, ptr %14, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds ptr, ptr %408, i64 %410
  store ptr %405, ptr %411, align 8
  br label %412

412:                                              ; preds = %390
  %413 = load i32, ptr %14, align 4
  %414 = add nsw i32 %413, 1
  store i32 %414, ptr %14, align 4
  br label %384, !llvm.loop !61

415:                                              ; preds = %384
  %416 = load ptr, ptr %10, align 8
  %417 = getelementptr inbounds %struct.CalcLangVal, ptr %416, i32 0, i32 0
  store i32 7, ptr %417, align 8
  %418 = load ptr, ptr %13, align 8
  %419 = load ptr, ptr %10, align 8
  %420 = getelementptr inbounds %struct.CalcLangVal, ptr %419, i32 0, i32 1
  store ptr %418, ptr %420, align 8
  br label %422

421:                                              ; preds = %355
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1488

422:                                              ; preds = %415
  br label %1463

423:                                              ; preds = %350, %345
  %424 = load ptr, ptr %6, align 8
  %425 = getelementptr inbounds %struct.CalcLangVal, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = icmp eq i32 %426, 7
  br i1 %427, label %428, label %482

428:                                              ; preds = %423
  %429 = load ptr, ptr %8, align 8
  %430 = getelementptr inbounds %struct.CalcLangVal, ptr %429, i32 0, i32 0
  %431 = load i32, ptr %430, align 8
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %433, label %482

433:                                              ; preds = %428
  %434 = load ptr, ptr %6, align 8
  %435 = getelementptr inbounds %struct.CalcLangVal, ptr %434, i32 0, i32 1
  %436 = load ptr, ptr %435, align 8
  store ptr %436, ptr %15, align 8
  %437 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %437, ptr %16, align 8
  %438 = load ptr, ptr %15, align 8
  %439 = getelementptr inbounds %struct.TupleValue, ptr %438, i32 0, i32 0
  %440 = load i32, ptr %439, align 8
  %441 = load ptr, ptr %16, align 8
  %442 = getelementptr inbounds %struct.TupleValue, ptr %441, i32 0, i32 0
  store i32 %440, ptr %442, align 8
  %443 = load ptr, ptr %16, align 8
  %444 = getelementptr inbounds %struct.TupleValue, ptr %443, i32 0, i32 0
  %445 = load i32, ptr %444, align 8
  %446 = sext i32 %445 to i64
  %447 = mul i64 8, %446
  %448 = call noalias ptr @malloc(i64 noundef %447) #5
  %449 = load ptr, ptr %16, align 8
  %450 = getelementptr inbounds %struct.TupleValue, ptr %449, i32 0, i32 1
  store ptr %448, ptr %450, align 8
  store i32 0, ptr %17, align 4
  br label %451

451:                                              ; preds = %473, %433
  %452 = load i32, ptr %17, align 4
  %453 = load ptr, ptr %15, align 8
  %454 = getelementptr inbounds %struct.TupleValue, ptr %453, i32 0, i32 0
  %455 = load i32, ptr %454, align 8
  %456 = icmp slt i32 %452, %455
  br i1 %456, label %457, label %476

457:                                              ; preds = %451
  %458 = load ptr, ptr %15, align 8
  %459 = getelementptr inbounds %struct.TupleValue, ptr %458, i32 0, i32 1
  %460 = load ptr, ptr %459, align 8
  %461 = load i32, ptr %17, align 4
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds ptr, ptr %460, i64 %462
  %464 = load ptr, ptr %463, align 8
  %465 = load ptr, ptr %8, align 8
  %466 = call ptr @divCalcLangValues(ptr noundef %464, i32 noundef 1, ptr noundef %465, i32 noundef 0)
  %467 = load ptr, ptr %16, align 8
  %468 = getelementptr inbounds %struct.TupleValue, ptr %467, i32 0, i32 1
  %469 = load ptr, ptr %468, align 8
  %470 = load i32, ptr %17, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds ptr, ptr %469, i64 %471
  store ptr %466, ptr %472, align 8
  br label %473

473:                                              ; preds = %457
  %474 = load i32, ptr %17, align 4
  %475 = add nsw i32 %474, 1
  store i32 %475, ptr %17, align 4
  br label %451, !llvm.loop !62

476:                                              ; preds = %451
  %477 = load ptr, ptr %10, align 8
  %478 = getelementptr inbounds %struct.CalcLangVal, ptr %477, i32 0, i32 0
  store i32 7, ptr %478, align 8
  %479 = load ptr, ptr %16, align 8
  %480 = load ptr, ptr %10, align 8
  %481 = getelementptr inbounds %struct.CalcLangVal, ptr %480, i32 0, i32 1
  store ptr %479, ptr %481, align 8
  br label %1462

482:                                              ; preds = %428, %423
  %483 = load ptr, ptr %6, align 8
  %484 = getelementptr inbounds %struct.CalcLangVal, ptr %483, i32 0, i32 0
  %485 = load i32, ptr %484, align 8
  %486 = icmp eq i32 %485, 0
  br i1 %486, label %487, label %541

487:                                              ; preds = %482
  %488 = load ptr, ptr %8, align 8
  %489 = getelementptr inbounds %struct.CalcLangVal, ptr %488, i32 0, i32 0
  %490 = load i32, ptr %489, align 8
  %491 = icmp eq i32 %490, 7
  br i1 %491, label %492, label %541

492:                                              ; preds = %487
  %493 = load ptr, ptr %8, align 8
  %494 = getelementptr inbounds %struct.CalcLangVal, ptr %493, i32 0, i32 1
  %495 = load ptr, ptr %494, align 8
  store ptr %495, ptr %18, align 8
  %496 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %496, ptr %19, align 8
  %497 = load ptr, ptr %18, align 8
  %498 = getelementptr inbounds %struct.TupleValue, ptr %497, i32 0, i32 0
  %499 = load i32, ptr %498, align 8
  %500 = load ptr, ptr %19, align 8
  %501 = getelementptr inbounds %struct.TupleValue, ptr %500, i32 0, i32 0
  store i32 %499, ptr %501, align 8
  %502 = load ptr, ptr %19, align 8
  %503 = getelementptr inbounds %struct.TupleValue, ptr %502, i32 0, i32 0
  %504 = load i32, ptr %503, align 8
  %505 = sext i32 %504 to i64
  %506 = mul i64 8, %505
  %507 = call noalias ptr @malloc(i64 noundef %506) #5
  %508 = load ptr, ptr %19, align 8
  %509 = getelementptr inbounds %struct.TupleValue, ptr %508, i32 0, i32 1
  store ptr %507, ptr %509, align 8
  store i32 0, ptr %20, align 4
  br label %510

510:                                              ; preds = %532, %492
  %511 = load i32, ptr %20, align 4
  %512 = load ptr, ptr %18, align 8
  %513 = getelementptr inbounds %struct.TupleValue, ptr %512, i32 0, i32 0
  %514 = load i32, ptr %513, align 8
  %515 = icmp slt i32 %511, %514
  br i1 %515, label %516, label %535

516:                                              ; preds = %510
  %517 = load ptr, ptr %6, align 8
  %518 = load ptr, ptr %18, align 8
  %519 = getelementptr inbounds %struct.TupleValue, ptr %518, i32 0, i32 1
  %520 = load ptr, ptr %519, align 8
  %521 = load i32, ptr %20, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds ptr, ptr %520, i64 %522
  %524 = load ptr, ptr %523, align 8
  %525 = call ptr @divCalcLangValues(ptr noundef %517, i32 noundef 0, ptr noundef %524, i32 noundef 1)
  %526 = load ptr, ptr %19, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 1
  %528 = load ptr, ptr %527, align 8
  %529 = load i32, ptr %20, align 4
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds ptr, ptr %528, i64 %530
  store ptr %525, ptr %531, align 8
  br label %532

532:                                              ; preds = %516
  %533 = load i32, ptr %20, align 4
  %534 = add nsw i32 %533, 1
  store i32 %534, ptr %20, align 4
  br label %510, !llvm.loop !63

535:                                              ; preds = %510
  %536 = load ptr, ptr %10, align 8
  %537 = getelementptr inbounds %struct.CalcLangVal, ptr %536, i32 0, i32 0
  store i32 7, ptr %537, align 8
  %538 = load ptr, ptr %19, align 8
  %539 = load ptr, ptr %10, align 8
  %540 = getelementptr inbounds %struct.CalcLangVal, ptr %539, i32 0, i32 1
  store ptr %538, ptr %540, align 8
  br label %1461

541:                                              ; preds = %487, %482
  %542 = load ptr, ptr %6, align 8
  %543 = getelementptr inbounds %struct.CalcLangVal, ptr %542, i32 0, i32 0
  %544 = load i32, ptr %543, align 8
  %545 = icmp eq i32 %544, 7
  br i1 %545, label %546, label %600

546:                                              ; preds = %541
  %547 = load ptr, ptr %8, align 8
  %548 = getelementptr inbounds %struct.CalcLangVal, ptr %547, i32 0, i32 0
  %549 = load i32, ptr %548, align 8
  %550 = icmp eq i32 %549, 1
  br i1 %550, label %551, label %600

551:                                              ; preds = %546
  %552 = load ptr, ptr %6, align 8
  %553 = getelementptr inbounds %struct.CalcLangVal, ptr %552, i32 0, i32 1
  %554 = load ptr, ptr %553, align 8
  store ptr %554, ptr %21, align 8
  %555 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %555, ptr %22, align 8
  %556 = load ptr, ptr %21, align 8
  %557 = getelementptr inbounds %struct.TupleValue, ptr %556, i32 0, i32 0
  %558 = load i32, ptr %557, align 8
  %559 = load ptr, ptr %22, align 8
  %560 = getelementptr inbounds %struct.TupleValue, ptr %559, i32 0, i32 0
  store i32 %558, ptr %560, align 8
  %561 = load ptr, ptr %22, align 8
  %562 = getelementptr inbounds %struct.TupleValue, ptr %561, i32 0, i32 0
  %563 = load i32, ptr %562, align 8
  %564 = sext i32 %563 to i64
  %565 = mul i64 8, %564
  %566 = call noalias ptr @malloc(i64 noundef %565) #5
  %567 = load ptr, ptr %22, align 8
  %568 = getelementptr inbounds %struct.TupleValue, ptr %567, i32 0, i32 1
  store ptr %566, ptr %568, align 8
  store i32 0, ptr %23, align 4
  br label %569

569:                                              ; preds = %591, %551
  %570 = load i32, ptr %23, align 4
  %571 = load ptr, ptr %21, align 8
  %572 = getelementptr inbounds %struct.TupleValue, ptr %571, i32 0, i32 0
  %573 = load i32, ptr %572, align 8
  %574 = icmp slt i32 %570, %573
  br i1 %574, label %575, label %594

575:                                              ; preds = %569
  %576 = load ptr, ptr %21, align 8
  %577 = getelementptr inbounds %struct.TupleValue, ptr %576, i32 0, i32 1
  %578 = load ptr, ptr %577, align 8
  %579 = load i32, ptr %23, align 4
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds ptr, ptr %578, i64 %580
  %582 = load ptr, ptr %581, align 8
  %583 = load ptr, ptr %8, align 8
  %584 = call ptr @divCalcLangValues(ptr noundef %582, i32 noundef 1, ptr noundef %583, i32 noundef 0)
  %585 = load ptr, ptr %22, align 8
  %586 = getelementptr inbounds %struct.TupleValue, ptr %585, i32 0, i32 1
  %587 = load ptr, ptr %586, align 8
  %588 = load i32, ptr %23, align 4
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds ptr, ptr %587, i64 %589
  store ptr %584, ptr %590, align 8
  br label %591

591:                                              ; preds = %575
  %592 = load i32, ptr %23, align 4
  %593 = add nsw i32 %592, 1
  store i32 %593, ptr %23, align 4
  br label %569, !llvm.loop !64

594:                                              ; preds = %569
  %595 = load ptr, ptr %10, align 8
  %596 = getelementptr inbounds %struct.CalcLangVal, ptr %595, i32 0, i32 0
  store i32 7, ptr %596, align 8
  %597 = load ptr, ptr %22, align 8
  %598 = load ptr, ptr %10, align 8
  %599 = getelementptr inbounds %struct.CalcLangVal, ptr %598, i32 0, i32 1
  store ptr %597, ptr %599, align 8
  br label %1460

600:                                              ; preds = %546, %541
  %601 = load ptr, ptr %6, align 8
  %602 = getelementptr inbounds %struct.CalcLangVal, ptr %601, i32 0, i32 0
  %603 = load i32, ptr %602, align 8
  %604 = icmp eq i32 %603, 1
  br i1 %604, label %605, label %659

605:                                              ; preds = %600
  %606 = load ptr, ptr %8, align 8
  %607 = getelementptr inbounds %struct.CalcLangVal, ptr %606, i32 0, i32 0
  %608 = load i32, ptr %607, align 8
  %609 = icmp eq i32 %608, 7
  br i1 %609, label %610, label %659

610:                                              ; preds = %605
  %611 = load ptr, ptr %8, align 8
  %612 = getelementptr inbounds %struct.CalcLangVal, ptr %611, i32 0, i32 1
  %613 = load ptr, ptr %612, align 8
  store ptr %613, ptr %24, align 8
  %614 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %614, ptr %25, align 8
  %615 = load ptr, ptr %24, align 8
  %616 = getelementptr inbounds %struct.TupleValue, ptr %615, i32 0, i32 0
  %617 = load i32, ptr %616, align 8
  %618 = load ptr, ptr %25, align 8
  %619 = getelementptr inbounds %struct.TupleValue, ptr %618, i32 0, i32 0
  store i32 %617, ptr %619, align 8
  %620 = load ptr, ptr %25, align 8
  %621 = getelementptr inbounds %struct.TupleValue, ptr %620, i32 0, i32 0
  %622 = load i32, ptr %621, align 8
  %623 = sext i32 %622 to i64
  %624 = mul i64 8, %623
  %625 = call noalias ptr @malloc(i64 noundef %624) #5
  %626 = load ptr, ptr %25, align 8
  %627 = getelementptr inbounds %struct.TupleValue, ptr %626, i32 0, i32 1
  store ptr %625, ptr %627, align 8
  store i32 0, ptr %26, align 4
  br label %628

628:                                              ; preds = %650, %610
  %629 = load i32, ptr %26, align 4
  %630 = load ptr, ptr %24, align 8
  %631 = getelementptr inbounds %struct.TupleValue, ptr %630, i32 0, i32 0
  %632 = load i32, ptr %631, align 8
  %633 = icmp slt i32 %629, %632
  br i1 %633, label %634, label %653

634:                                              ; preds = %628
  %635 = load ptr, ptr %6, align 8
  %636 = load ptr, ptr %24, align 8
  %637 = getelementptr inbounds %struct.TupleValue, ptr %636, i32 0, i32 1
  %638 = load ptr, ptr %637, align 8
  %639 = load i32, ptr %26, align 4
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds ptr, ptr %638, i64 %640
  %642 = load ptr, ptr %641, align 8
  %643 = call ptr @divCalcLangValues(ptr noundef %635, i32 noundef 0, ptr noundef %642, i32 noundef 1)
  %644 = load ptr, ptr %25, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  %647 = load i32, ptr %26, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds ptr, ptr %646, i64 %648
  store ptr %643, ptr %649, align 8
  br label %650

650:                                              ; preds = %634
  %651 = load i32, ptr %26, align 4
  %652 = add nsw i32 %651, 1
  store i32 %652, ptr %26, align 4
  br label %628, !llvm.loop !65

653:                                              ; preds = %628
  %654 = load ptr, ptr %10, align 8
  %655 = getelementptr inbounds %struct.CalcLangVal, ptr %654, i32 0, i32 0
  store i32 7, ptr %655, align 8
  %656 = load ptr, ptr %25, align 8
  %657 = load ptr, ptr %10, align 8
  %658 = getelementptr inbounds %struct.CalcLangVal, ptr %657, i32 0, i32 1
  store ptr %656, ptr %658, align 8
  br label %1459

659:                                              ; preds = %605, %600
  %660 = load ptr, ptr %6, align 8
  %661 = getelementptr inbounds %struct.CalcLangVal, ptr %660, i32 0, i32 0
  %662 = load i32, ptr %661, align 8
  %663 = icmp eq i32 %662, 7
  br i1 %663, label %664, label %718

664:                                              ; preds = %659
  %665 = load ptr, ptr %8, align 8
  %666 = getelementptr inbounds %struct.CalcLangVal, ptr %665, i32 0, i32 0
  %667 = load i32, ptr %666, align 8
  %668 = icmp eq i32 %667, 3
  br i1 %668, label %669, label %718

669:                                              ; preds = %664
  %670 = load ptr, ptr %6, align 8
  %671 = getelementptr inbounds %struct.CalcLangVal, ptr %670, i32 0, i32 1
  %672 = load ptr, ptr %671, align 8
  store ptr %672, ptr %27, align 8
  %673 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %673, ptr %28, align 8
  %674 = load ptr, ptr %27, align 8
  %675 = getelementptr inbounds %struct.TupleValue, ptr %674, i32 0, i32 0
  %676 = load i32, ptr %675, align 8
  %677 = load ptr, ptr %28, align 8
  %678 = getelementptr inbounds %struct.TupleValue, ptr %677, i32 0, i32 0
  store i32 %676, ptr %678, align 8
  %679 = load ptr, ptr %28, align 8
  %680 = getelementptr inbounds %struct.TupleValue, ptr %679, i32 0, i32 0
  %681 = load i32, ptr %680, align 8
  %682 = sext i32 %681 to i64
  %683 = mul i64 8, %682
  %684 = call noalias ptr @malloc(i64 noundef %683) #5
  %685 = load ptr, ptr %28, align 8
  %686 = getelementptr inbounds %struct.TupleValue, ptr %685, i32 0, i32 1
  store ptr %684, ptr %686, align 8
  store i32 0, ptr %29, align 4
  br label %687

687:                                              ; preds = %709, %669
  %688 = load i32, ptr %29, align 4
  %689 = load ptr, ptr %27, align 8
  %690 = getelementptr inbounds %struct.TupleValue, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = icmp slt i32 %688, %691
  br i1 %692, label %693, label %712

693:                                              ; preds = %687
  %694 = load ptr, ptr %27, align 8
  %695 = getelementptr inbounds %struct.TupleValue, ptr %694, i32 0, i32 1
  %696 = load ptr, ptr %695, align 8
  %697 = load i32, ptr %29, align 4
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds ptr, ptr %696, i64 %698
  %700 = load ptr, ptr %699, align 8
  %701 = load ptr, ptr %8, align 8
  %702 = call ptr @divCalcLangValues(ptr noundef %700, i32 noundef 1, ptr noundef %701, i32 noundef 0)
  %703 = load ptr, ptr %28, align 8
  %704 = getelementptr inbounds %struct.TupleValue, ptr %703, i32 0, i32 1
  %705 = load ptr, ptr %704, align 8
  %706 = load i32, ptr %29, align 4
  %707 = sext i32 %706 to i64
  %708 = getelementptr inbounds ptr, ptr %705, i64 %707
  store ptr %702, ptr %708, align 8
  br label %709

709:                                              ; preds = %693
  %710 = load i32, ptr %29, align 4
  %711 = add nsw i32 %710, 1
  store i32 %711, ptr %29, align 4
  br label %687, !llvm.loop !66

712:                                              ; preds = %687
  %713 = load ptr, ptr %10, align 8
  %714 = getelementptr inbounds %struct.CalcLangVal, ptr %713, i32 0, i32 0
  store i32 7, ptr %714, align 8
  %715 = load ptr, ptr %28, align 8
  %716 = load ptr, ptr %10, align 8
  %717 = getelementptr inbounds %struct.CalcLangVal, ptr %716, i32 0, i32 1
  store ptr %715, ptr %717, align 8
  br label %1458

718:                                              ; preds = %664, %659
  %719 = load ptr, ptr %6, align 8
  %720 = getelementptr inbounds %struct.CalcLangVal, ptr %719, i32 0, i32 0
  %721 = load i32, ptr %720, align 8
  %722 = icmp eq i32 %721, 3
  br i1 %722, label %723, label %777

723:                                              ; preds = %718
  %724 = load ptr, ptr %8, align 8
  %725 = getelementptr inbounds %struct.CalcLangVal, ptr %724, i32 0, i32 0
  %726 = load i32, ptr %725, align 8
  %727 = icmp eq i32 %726, 7
  br i1 %727, label %728, label %777

728:                                              ; preds = %723
  %729 = load ptr, ptr %8, align 8
  %730 = getelementptr inbounds %struct.CalcLangVal, ptr %729, i32 0, i32 1
  %731 = load ptr, ptr %730, align 8
  store ptr %731, ptr %30, align 8
  %732 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %732, ptr %31, align 8
  %733 = load ptr, ptr %30, align 8
  %734 = getelementptr inbounds %struct.TupleValue, ptr %733, i32 0, i32 0
  %735 = load i32, ptr %734, align 8
  %736 = load ptr, ptr %31, align 8
  %737 = getelementptr inbounds %struct.TupleValue, ptr %736, i32 0, i32 0
  store i32 %735, ptr %737, align 8
  %738 = load ptr, ptr %31, align 8
  %739 = getelementptr inbounds %struct.TupleValue, ptr %738, i32 0, i32 0
  %740 = load i32, ptr %739, align 8
  %741 = sext i32 %740 to i64
  %742 = mul i64 8, %741
  %743 = call noalias ptr @malloc(i64 noundef %742) #5
  %744 = load ptr, ptr %31, align 8
  %745 = getelementptr inbounds %struct.TupleValue, ptr %744, i32 0, i32 1
  store ptr %743, ptr %745, align 8
  store i32 0, ptr %32, align 4
  br label %746

746:                                              ; preds = %768, %728
  %747 = load i32, ptr %32, align 4
  %748 = load ptr, ptr %30, align 8
  %749 = getelementptr inbounds %struct.TupleValue, ptr %748, i32 0, i32 0
  %750 = load i32, ptr %749, align 8
  %751 = icmp slt i32 %747, %750
  br i1 %751, label %752, label %771

752:                                              ; preds = %746
  %753 = load ptr, ptr %6, align 8
  %754 = load ptr, ptr %30, align 8
  %755 = getelementptr inbounds %struct.TupleValue, ptr %754, i32 0, i32 1
  %756 = load ptr, ptr %755, align 8
  %757 = load i32, ptr %32, align 4
  %758 = sext i32 %757 to i64
  %759 = getelementptr inbounds ptr, ptr %756, i64 %758
  %760 = load ptr, ptr %759, align 8
  %761 = call ptr @divCalcLangValues(ptr noundef %753, i32 noundef 0, ptr noundef %760, i32 noundef 1)
  %762 = load ptr, ptr %31, align 8
  %763 = getelementptr inbounds %struct.TupleValue, ptr %762, i32 0, i32 1
  %764 = load ptr, ptr %763, align 8
  %765 = load i32, ptr %32, align 4
  %766 = sext i32 %765 to i64
  %767 = getelementptr inbounds ptr, ptr %764, i64 %766
  store ptr %761, ptr %767, align 8
  br label %768

768:                                              ; preds = %752
  %769 = load i32, ptr %32, align 4
  %770 = add nsw i32 %769, 1
  store i32 %770, ptr %32, align 4
  br label %746, !llvm.loop !67

771:                                              ; preds = %746
  %772 = load ptr, ptr %10, align 8
  %773 = getelementptr inbounds %struct.CalcLangVal, ptr %772, i32 0, i32 0
  store i32 7, ptr %773, align 8
  %774 = load ptr, ptr %31, align 8
  %775 = load ptr, ptr %10, align 8
  %776 = getelementptr inbounds %struct.CalcLangVal, ptr %775, i32 0, i32 1
  store ptr %774, ptr %776, align 8
  br label %1457

777:                                              ; preds = %723, %718
  %778 = load ptr, ptr %6, align 8
  %779 = getelementptr inbounds %struct.CalcLangVal, ptr %778, i32 0, i32 0
  %780 = load i32, ptr %779, align 8
  %781 = icmp eq i32 %780, 7
  br i1 %781, label %782, label %836

782:                                              ; preds = %777
  %783 = load ptr, ptr %8, align 8
  %784 = getelementptr inbounds %struct.CalcLangVal, ptr %783, i32 0, i32 0
  %785 = load i32, ptr %784, align 8
  %786 = icmp eq i32 %785, 4
  br i1 %786, label %787, label %836

787:                                              ; preds = %782
  %788 = load ptr, ptr %6, align 8
  %789 = getelementptr inbounds %struct.CalcLangVal, ptr %788, i32 0, i32 1
  %790 = load ptr, ptr %789, align 8
  store ptr %790, ptr %33, align 8
  %791 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %791, ptr %34, align 8
  %792 = load ptr, ptr %33, align 8
  %793 = getelementptr inbounds %struct.TupleValue, ptr %792, i32 0, i32 0
  %794 = load i32, ptr %793, align 8
  %795 = load ptr, ptr %34, align 8
  %796 = getelementptr inbounds %struct.TupleValue, ptr %795, i32 0, i32 0
  store i32 %794, ptr %796, align 8
  %797 = load ptr, ptr %34, align 8
  %798 = getelementptr inbounds %struct.TupleValue, ptr %797, i32 0, i32 0
  %799 = load i32, ptr %798, align 8
  %800 = sext i32 %799 to i64
  %801 = mul i64 8, %800
  %802 = call noalias ptr @malloc(i64 noundef %801) #5
  %803 = load ptr, ptr %34, align 8
  %804 = getelementptr inbounds %struct.TupleValue, ptr %803, i32 0, i32 1
  store ptr %802, ptr %804, align 8
  store i32 0, ptr %35, align 4
  br label %805

805:                                              ; preds = %827, %787
  %806 = load i32, ptr %35, align 4
  %807 = load ptr, ptr %33, align 8
  %808 = getelementptr inbounds %struct.TupleValue, ptr %807, i32 0, i32 0
  %809 = load i32, ptr %808, align 8
  %810 = icmp slt i32 %806, %809
  br i1 %810, label %811, label %830

811:                                              ; preds = %805
  %812 = load ptr, ptr %33, align 8
  %813 = getelementptr inbounds %struct.TupleValue, ptr %812, i32 0, i32 1
  %814 = load ptr, ptr %813, align 8
  %815 = load i32, ptr %35, align 4
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds ptr, ptr %814, i64 %816
  %818 = load ptr, ptr %817, align 8
  %819 = load ptr, ptr %8, align 8
  %820 = call ptr @divCalcLangValues(ptr noundef %818, i32 noundef 1, ptr noundef %819, i32 noundef 0)
  %821 = load ptr, ptr %34, align 8
  %822 = getelementptr inbounds %struct.TupleValue, ptr %821, i32 0, i32 1
  %823 = load ptr, ptr %822, align 8
  %824 = load i32, ptr %35, align 4
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds ptr, ptr %823, i64 %825
  store ptr %820, ptr %826, align 8
  br label %827

827:                                              ; preds = %811
  %828 = load i32, ptr %35, align 4
  %829 = add nsw i32 %828, 1
  store i32 %829, ptr %35, align 4
  br label %805, !llvm.loop !68

830:                                              ; preds = %805
  %831 = load ptr, ptr %10, align 8
  %832 = getelementptr inbounds %struct.CalcLangVal, ptr %831, i32 0, i32 0
  store i32 7, ptr %832, align 8
  %833 = load ptr, ptr %34, align 8
  %834 = load ptr, ptr %10, align 8
  %835 = getelementptr inbounds %struct.CalcLangVal, ptr %834, i32 0, i32 1
  store ptr %833, ptr %835, align 8
  br label %1456

836:                                              ; preds = %782, %777
  %837 = load ptr, ptr %6, align 8
  %838 = getelementptr inbounds %struct.CalcLangVal, ptr %837, i32 0, i32 0
  %839 = load i32, ptr %838, align 8
  %840 = icmp eq i32 %839, 4
  br i1 %840, label %841, label %895

841:                                              ; preds = %836
  %842 = load ptr, ptr %8, align 8
  %843 = getelementptr inbounds %struct.CalcLangVal, ptr %842, i32 0, i32 0
  %844 = load i32, ptr %843, align 8
  %845 = icmp eq i32 %844, 7
  br i1 %845, label %846, label %895

846:                                              ; preds = %841
  %847 = load ptr, ptr %8, align 8
  %848 = getelementptr inbounds %struct.CalcLangVal, ptr %847, i32 0, i32 1
  %849 = load ptr, ptr %848, align 8
  store ptr %849, ptr %36, align 8
  %850 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %850, ptr %37, align 8
  %851 = load ptr, ptr %36, align 8
  %852 = getelementptr inbounds %struct.TupleValue, ptr %851, i32 0, i32 0
  %853 = load i32, ptr %852, align 8
  %854 = load ptr, ptr %37, align 8
  %855 = getelementptr inbounds %struct.TupleValue, ptr %854, i32 0, i32 0
  store i32 %853, ptr %855, align 8
  %856 = load ptr, ptr %37, align 8
  %857 = getelementptr inbounds %struct.TupleValue, ptr %856, i32 0, i32 0
  %858 = load i32, ptr %857, align 8
  %859 = sext i32 %858 to i64
  %860 = mul i64 8, %859
  %861 = call noalias ptr @malloc(i64 noundef %860) #5
  %862 = load ptr, ptr %37, align 8
  %863 = getelementptr inbounds %struct.TupleValue, ptr %862, i32 0, i32 1
  store ptr %861, ptr %863, align 8
  store i32 0, ptr %38, align 4
  br label %864

864:                                              ; preds = %886, %846
  %865 = load i32, ptr %38, align 4
  %866 = load ptr, ptr %36, align 8
  %867 = getelementptr inbounds %struct.TupleValue, ptr %866, i32 0, i32 0
  %868 = load i32, ptr %867, align 8
  %869 = icmp slt i32 %865, %868
  br i1 %869, label %870, label %889

870:                                              ; preds = %864
  %871 = load ptr, ptr %6, align 8
  %872 = load ptr, ptr %36, align 8
  %873 = getelementptr inbounds %struct.TupleValue, ptr %872, i32 0, i32 1
  %874 = load ptr, ptr %873, align 8
  %875 = load i32, ptr %38, align 4
  %876 = sext i32 %875 to i64
  %877 = getelementptr inbounds ptr, ptr %874, i64 %876
  %878 = load ptr, ptr %877, align 8
  %879 = call ptr @divCalcLangValues(ptr noundef %871, i32 noundef 0, ptr noundef %878, i32 noundef 1)
  %880 = load ptr, ptr %37, align 8
  %881 = getelementptr inbounds %struct.TupleValue, ptr %880, i32 0, i32 1
  %882 = load ptr, ptr %881, align 8
  %883 = load i32, ptr %38, align 4
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds ptr, ptr %882, i64 %884
  store ptr %879, ptr %885, align 8
  br label %886

886:                                              ; preds = %870
  %887 = load i32, ptr %38, align 4
  %888 = add nsw i32 %887, 1
  store i32 %888, ptr %38, align 4
  br label %864, !llvm.loop !69

889:                                              ; preds = %864
  %890 = load ptr, ptr %10, align 8
  %891 = getelementptr inbounds %struct.CalcLangVal, ptr %890, i32 0, i32 0
  store i32 7, ptr %891, align 8
  %892 = load ptr, ptr %37, align 8
  %893 = load ptr, ptr %10, align 8
  %894 = getelementptr inbounds %struct.CalcLangVal, ptr %893, i32 0, i32 1
  store ptr %892, ptr %894, align 8
  br label %1455

895:                                              ; preds = %841, %836
  %896 = load ptr, ptr %6, align 8
  %897 = getelementptr inbounds %struct.CalcLangVal, ptr %896, i32 0, i32 0
  %898 = load i32, ptr %897, align 8
  %899 = icmp eq i32 %898, 6
  br i1 %899, label %900, label %973

900:                                              ; preds = %895
  %901 = load ptr, ptr %8, align 8
  %902 = getelementptr inbounds %struct.CalcLangVal, ptr %901, i32 0, i32 0
  %903 = load i32, ptr %902, align 8
  %904 = icmp eq i32 %903, 6
  br i1 %904, label %905, label %973

905:                                              ; preds = %900
  %906 = load ptr, ptr %6, align 8
  %907 = getelementptr inbounds %struct.CalcLangVal, ptr %906, i32 0, i32 1
  %908 = load ptr, ptr %907, align 8
  store ptr %908, ptr %39, align 8
  %909 = load ptr, ptr %8, align 8
  %910 = getelementptr inbounds %struct.CalcLangVal, ptr %909, i32 0, i32 1
  %911 = load ptr, ptr %910, align 8
  store ptr %911, ptr %40, align 8
  %912 = load ptr, ptr %40, align 8
  %913 = getelementptr inbounds %struct.SetValue, ptr %912, i32 0, i32 0
  %914 = load i32, ptr %913, align 8
  %915 = load ptr, ptr %39, align 8
  %916 = getelementptr inbounds %struct.SetValue, ptr %915, i32 0, i32 0
  %917 = load i32, ptr %916, align 8
  %918 = icmp eq i32 %914, %917
  br i1 %918, label %919, label %971

919:                                              ; preds = %905
  %920 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %920, ptr %41, align 8
  %921 = load ptr, ptr %39, align 8
  %922 = getelementptr inbounds %struct.SetValue, ptr %921, i32 0, i32 0
  %923 = load i32, ptr %922, align 8
  %924 = load ptr, ptr %41, align 8
  %925 = getelementptr inbounds %struct.SetValue, ptr %924, i32 0, i32 0
  store i32 %923, ptr %925, align 8
  %926 = load ptr, ptr %41, align 8
  %927 = getelementptr inbounds %struct.SetValue, ptr %926, i32 0, i32 0
  %928 = load i32, ptr %927, align 8
  %929 = sext i32 %928 to i64
  %930 = mul i64 8, %929
  %931 = call noalias ptr @malloc(i64 noundef %930) #5
  %932 = load ptr, ptr %41, align 8
  %933 = getelementptr inbounds %struct.SetValue, ptr %932, i32 0, i32 1
  store ptr %931, ptr %933, align 8
  store i32 0, ptr %42, align 4
  br label %934

934:                                              ; preds = %962, %919
  %935 = load i32, ptr %42, align 4
  %936 = load ptr, ptr %39, align 8
  %937 = getelementptr inbounds %struct.SetValue, ptr %936, i32 0, i32 0
  %938 = load i32, ptr %937, align 8
  %939 = icmp slt i32 %935, %938
  br i1 %939, label %940, label %965

940:                                              ; preds = %934
  %941 = load ptr, ptr %39, align 8
  %942 = getelementptr inbounds %struct.SetValue, ptr %941, i32 0, i32 1
  %943 = load ptr, ptr %942, align 8
  %944 = load i32, ptr %42, align 4
  %945 = sext i32 %944 to i64
  %946 = getelementptr inbounds ptr, ptr %943, i64 %945
  %947 = load ptr, ptr %946, align 8
  %948 = load ptr, ptr %40, align 8
  %949 = getelementptr inbounds %struct.SetValue, ptr %948, i32 0, i32 1
  %950 = load ptr, ptr %949, align 8
  %951 = load i32, ptr %42, align 4
  %952 = sext i32 %951 to i64
  %953 = getelementptr inbounds ptr, ptr %950, i64 %952
  %954 = load ptr, ptr %953, align 8
  %955 = call ptr @divCalcLangValues(ptr noundef %947, i32 noundef 1, ptr noundef %954, i32 noundef 1)
  %956 = load ptr, ptr %41, align 8
  %957 = getelementptr inbounds %struct.SetValue, ptr %956, i32 0, i32 1
  %958 = load ptr, ptr %957, align 8
  %959 = load i32, ptr %42, align 4
  %960 = sext i32 %959 to i64
  %961 = getelementptr inbounds ptr, ptr %958, i64 %960
  store ptr %955, ptr %961, align 8
  br label %962

962:                                              ; preds = %940
  %963 = load i32, ptr %42, align 4
  %964 = add nsw i32 %963, 1
  store i32 %964, ptr %42, align 4
  br label %934, !llvm.loop !70

965:                                              ; preds = %934
  %966 = load ptr, ptr %10, align 8
  %967 = getelementptr inbounds %struct.CalcLangVal, ptr %966, i32 0, i32 0
  store i32 6, ptr %967, align 8
  %968 = load ptr, ptr %41, align 8
  %969 = load ptr, ptr %10, align 8
  %970 = getelementptr inbounds %struct.CalcLangVal, ptr %969, i32 0, i32 1
  store ptr %968, ptr %970, align 8
  br label %972

971:                                              ; preds = %905
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1488

972:                                              ; preds = %965
  br label %1454

973:                                              ; preds = %900, %895
  %974 = load ptr, ptr %6, align 8
  %975 = getelementptr inbounds %struct.CalcLangVal, ptr %974, i32 0, i32 0
  %976 = load i32, ptr %975, align 8
  %977 = icmp eq i32 %976, 6
  br i1 %977, label %978, label %1032

978:                                              ; preds = %973
  %979 = load ptr, ptr %8, align 8
  %980 = getelementptr inbounds %struct.CalcLangVal, ptr %979, i32 0, i32 0
  %981 = load i32, ptr %980, align 8
  %982 = icmp eq i32 %981, 0
  br i1 %982, label %983, label %1032

983:                                              ; preds = %978
  %984 = load ptr, ptr %6, align 8
  %985 = getelementptr inbounds %struct.CalcLangVal, ptr %984, i32 0, i32 1
  %986 = load ptr, ptr %985, align 8
  store ptr %986, ptr %43, align 8
  %987 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %987, ptr %44, align 8
  %988 = load ptr, ptr %43, align 8
  %989 = getelementptr inbounds %struct.SetValue, ptr %988, i32 0, i32 0
  %990 = load i32, ptr %989, align 8
  %991 = load ptr, ptr %44, align 8
  %992 = getelementptr inbounds %struct.SetValue, ptr %991, i32 0, i32 0
  store i32 %990, ptr %992, align 8
  %993 = load ptr, ptr %44, align 8
  %994 = getelementptr inbounds %struct.SetValue, ptr %993, i32 0, i32 0
  %995 = load i32, ptr %994, align 8
  %996 = sext i32 %995 to i64
  %997 = mul i64 8, %996
  %998 = call noalias ptr @malloc(i64 noundef %997) #5
  %999 = load ptr, ptr %44, align 8
  %1000 = getelementptr inbounds %struct.SetValue, ptr %999, i32 0, i32 1
  store ptr %998, ptr %1000, align 8
  store i32 0, ptr %45, align 4
  br label %1001

1001:                                             ; preds = %1023, %983
  %1002 = load i32, ptr %45, align 4
  %1003 = load ptr, ptr %43, align 8
  %1004 = getelementptr inbounds %struct.SetValue, ptr %1003, i32 0, i32 0
  %1005 = load i32, ptr %1004, align 8
  %1006 = icmp slt i32 %1002, %1005
  br i1 %1006, label %1007, label %1026

1007:                                             ; preds = %1001
  %1008 = load ptr, ptr %43, align 8
  %1009 = getelementptr inbounds %struct.SetValue, ptr %1008, i32 0, i32 1
  %1010 = load ptr, ptr %1009, align 8
  %1011 = load i32, ptr %45, align 4
  %1012 = sext i32 %1011 to i64
  %1013 = getelementptr inbounds ptr, ptr %1010, i64 %1012
  %1014 = load ptr, ptr %1013, align 8
  %1015 = load ptr, ptr %8, align 8
  %1016 = call ptr @divCalcLangValues(ptr noundef %1014, i32 noundef 1, ptr noundef %1015, i32 noundef 0)
  %1017 = load ptr, ptr %44, align 8
  %1018 = getelementptr inbounds %struct.SetValue, ptr %1017, i32 0, i32 1
  %1019 = load ptr, ptr %1018, align 8
  %1020 = load i32, ptr %45, align 4
  %1021 = sext i32 %1020 to i64
  %1022 = getelementptr inbounds ptr, ptr %1019, i64 %1021
  store ptr %1016, ptr %1022, align 8
  br label %1023

1023:                                             ; preds = %1007
  %1024 = load i32, ptr %45, align 4
  %1025 = add nsw i32 %1024, 1
  store i32 %1025, ptr %45, align 4
  br label %1001, !llvm.loop !71

1026:                                             ; preds = %1001
  %1027 = load ptr, ptr %10, align 8
  %1028 = getelementptr inbounds %struct.CalcLangVal, ptr %1027, i32 0, i32 0
  store i32 6, ptr %1028, align 8
  %1029 = load ptr, ptr %44, align 8
  %1030 = load ptr, ptr %10, align 8
  %1031 = getelementptr inbounds %struct.CalcLangVal, ptr %1030, i32 0, i32 1
  store ptr %1029, ptr %1031, align 8
  br label %1453

1032:                                             ; preds = %978, %973
  %1033 = load ptr, ptr %6, align 8
  %1034 = getelementptr inbounds %struct.CalcLangVal, ptr %1033, i32 0, i32 0
  %1035 = load i32, ptr %1034, align 8
  %1036 = icmp eq i32 %1035, 0
  br i1 %1036, label %1037, label %1091

1037:                                             ; preds = %1032
  %1038 = load ptr, ptr %8, align 8
  %1039 = getelementptr inbounds %struct.CalcLangVal, ptr %1038, i32 0, i32 0
  %1040 = load i32, ptr %1039, align 8
  %1041 = icmp eq i32 %1040, 6
  br i1 %1041, label %1042, label %1091

1042:                                             ; preds = %1037
  %1043 = load ptr, ptr %8, align 8
  %1044 = getelementptr inbounds %struct.CalcLangVal, ptr %1043, i32 0, i32 1
  %1045 = load ptr, ptr %1044, align 8
  store ptr %1045, ptr %46, align 8
  %1046 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1046, ptr %47, align 8
  %1047 = load ptr, ptr %46, align 8
  %1048 = getelementptr inbounds %struct.SetValue, ptr %1047, i32 0, i32 0
  %1049 = load i32, ptr %1048, align 8
  %1050 = load ptr, ptr %47, align 8
  %1051 = getelementptr inbounds %struct.SetValue, ptr %1050, i32 0, i32 0
  store i32 %1049, ptr %1051, align 8
  %1052 = load ptr, ptr %47, align 8
  %1053 = getelementptr inbounds %struct.SetValue, ptr %1052, i32 0, i32 0
  %1054 = load i32, ptr %1053, align 8
  %1055 = sext i32 %1054 to i64
  %1056 = mul i64 8, %1055
  %1057 = call noalias ptr @malloc(i64 noundef %1056) #5
  %1058 = load ptr, ptr %47, align 8
  %1059 = getelementptr inbounds %struct.SetValue, ptr %1058, i32 0, i32 1
  store ptr %1057, ptr %1059, align 8
  store i32 0, ptr %48, align 4
  br label %1060

1060:                                             ; preds = %1082, %1042
  %1061 = load i32, ptr %48, align 4
  %1062 = load ptr, ptr %46, align 8
  %1063 = getelementptr inbounds %struct.SetValue, ptr %1062, i32 0, i32 0
  %1064 = load i32, ptr %1063, align 8
  %1065 = icmp slt i32 %1061, %1064
  br i1 %1065, label %1066, label %1085

1066:                                             ; preds = %1060
  %1067 = load ptr, ptr %6, align 8
  %1068 = load ptr, ptr %46, align 8
  %1069 = getelementptr inbounds %struct.SetValue, ptr %1068, i32 0, i32 1
  %1070 = load ptr, ptr %1069, align 8
  %1071 = load i32, ptr %48, align 4
  %1072 = sext i32 %1071 to i64
  %1073 = getelementptr inbounds ptr, ptr %1070, i64 %1072
  %1074 = load ptr, ptr %1073, align 8
  %1075 = call ptr @divCalcLangValues(ptr noundef %1067, i32 noundef 0, ptr noundef %1074, i32 noundef 1)
  %1076 = load ptr, ptr %47, align 8
  %1077 = getelementptr inbounds %struct.SetValue, ptr %1076, i32 0, i32 1
  %1078 = load ptr, ptr %1077, align 8
  %1079 = load i32, ptr %48, align 4
  %1080 = sext i32 %1079 to i64
  %1081 = getelementptr inbounds ptr, ptr %1078, i64 %1080
  store ptr %1075, ptr %1081, align 8
  br label %1082

1082:                                             ; preds = %1066
  %1083 = load i32, ptr %48, align 4
  %1084 = add nsw i32 %1083, 1
  store i32 %1084, ptr %48, align 4
  br label %1060, !llvm.loop !72

1085:                                             ; preds = %1060
  %1086 = load ptr, ptr %10, align 8
  %1087 = getelementptr inbounds %struct.CalcLangVal, ptr %1086, i32 0, i32 0
  store i32 6, ptr %1087, align 8
  %1088 = load ptr, ptr %47, align 8
  %1089 = load ptr, ptr %10, align 8
  %1090 = getelementptr inbounds %struct.CalcLangVal, ptr %1089, i32 0, i32 1
  store ptr %1088, ptr %1090, align 8
  br label %1452

1091:                                             ; preds = %1037, %1032
  %1092 = load ptr, ptr %6, align 8
  %1093 = getelementptr inbounds %struct.CalcLangVal, ptr %1092, i32 0, i32 0
  %1094 = load i32, ptr %1093, align 8
  %1095 = icmp eq i32 %1094, 6
  br i1 %1095, label %1096, label %1150

1096:                                             ; preds = %1091
  %1097 = load ptr, ptr %8, align 8
  %1098 = getelementptr inbounds %struct.CalcLangVal, ptr %1097, i32 0, i32 0
  %1099 = load i32, ptr %1098, align 8
  %1100 = icmp eq i32 %1099, 1
  br i1 %1100, label %1101, label %1150

1101:                                             ; preds = %1096
  %1102 = load ptr, ptr %6, align 8
  %1103 = getelementptr inbounds %struct.CalcLangVal, ptr %1102, i32 0, i32 1
  %1104 = load ptr, ptr %1103, align 8
  store ptr %1104, ptr %49, align 8
  %1105 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1105, ptr %50, align 8
  %1106 = load ptr, ptr %49, align 8
  %1107 = getelementptr inbounds %struct.SetValue, ptr %1106, i32 0, i32 0
  %1108 = load i32, ptr %1107, align 8
  %1109 = load ptr, ptr %50, align 8
  %1110 = getelementptr inbounds %struct.SetValue, ptr %1109, i32 0, i32 0
  store i32 %1108, ptr %1110, align 8
  %1111 = load ptr, ptr %50, align 8
  %1112 = getelementptr inbounds %struct.SetValue, ptr %1111, i32 0, i32 0
  %1113 = load i32, ptr %1112, align 8
  %1114 = sext i32 %1113 to i64
  %1115 = mul i64 8, %1114
  %1116 = call noalias ptr @malloc(i64 noundef %1115) #5
  %1117 = load ptr, ptr %50, align 8
  %1118 = getelementptr inbounds %struct.SetValue, ptr %1117, i32 0, i32 1
  store ptr %1116, ptr %1118, align 8
  store i32 0, ptr %51, align 4
  br label %1119

1119:                                             ; preds = %1141, %1101
  %1120 = load i32, ptr %51, align 4
  %1121 = load ptr, ptr %49, align 8
  %1122 = getelementptr inbounds %struct.SetValue, ptr %1121, i32 0, i32 0
  %1123 = load i32, ptr %1122, align 8
  %1124 = icmp slt i32 %1120, %1123
  br i1 %1124, label %1125, label %1144

1125:                                             ; preds = %1119
  %1126 = load ptr, ptr %49, align 8
  %1127 = getelementptr inbounds %struct.SetValue, ptr %1126, i32 0, i32 1
  %1128 = load ptr, ptr %1127, align 8
  %1129 = load i32, ptr %51, align 4
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds ptr, ptr %1128, i64 %1130
  %1132 = load ptr, ptr %1131, align 8
  %1133 = load ptr, ptr %8, align 8
  %1134 = call ptr @divCalcLangValues(ptr noundef %1132, i32 noundef 1, ptr noundef %1133, i32 noundef 0)
  %1135 = load ptr, ptr %50, align 8
  %1136 = getelementptr inbounds %struct.SetValue, ptr %1135, i32 0, i32 1
  %1137 = load ptr, ptr %1136, align 8
  %1138 = load i32, ptr %51, align 4
  %1139 = sext i32 %1138 to i64
  %1140 = getelementptr inbounds ptr, ptr %1137, i64 %1139
  store ptr %1134, ptr %1140, align 8
  br label %1141

1141:                                             ; preds = %1125
  %1142 = load i32, ptr %51, align 4
  %1143 = add nsw i32 %1142, 1
  store i32 %1143, ptr %51, align 4
  br label %1119, !llvm.loop !73

1144:                                             ; preds = %1119
  %1145 = load ptr, ptr %10, align 8
  %1146 = getelementptr inbounds %struct.CalcLangVal, ptr %1145, i32 0, i32 0
  store i32 7, ptr %1146, align 8
  %1147 = load ptr, ptr %50, align 8
  %1148 = load ptr, ptr %10, align 8
  %1149 = getelementptr inbounds %struct.CalcLangVal, ptr %1148, i32 0, i32 1
  store ptr %1147, ptr %1149, align 8
  br label %1451

1150:                                             ; preds = %1096, %1091
  %1151 = load ptr, ptr %6, align 8
  %1152 = getelementptr inbounds %struct.CalcLangVal, ptr %1151, i32 0, i32 0
  %1153 = load i32, ptr %1152, align 8
  %1154 = icmp eq i32 %1153, 1
  br i1 %1154, label %1155, label %1209

1155:                                             ; preds = %1150
  %1156 = load ptr, ptr %8, align 8
  %1157 = getelementptr inbounds %struct.CalcLangVal, ptr %1156, i32 0, i32 0
  %1158 = load i32, ptr %1157, align 8
  %1159 = icmp eq i32 %1158, 6
  br i1 %1159, label %1160, label %1209

1160:                                             ; preds = %1155
  %1161 = load ptr, ptr %8, align 8
  %1162 = getelementptr inbounds %struct.CalcLangVal, ptr %1161, i32 0, i32 1
  %1163 = load ptr, ptr %1162, align 8
  store ptr %1163, ptr %52, align 8
  %1164 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1164, ptr %53, align 8
  %1165 = load ptr, ptr %52, align 8
  %1166 = getelementptr inbounds %struct.SetValue, ptr %1165, i32 0, i32 0
  %1167 = load i32, ptr %1166, align 8
  %1168 = load ptr, ptr %53, align 8
  %1169 = getelementptr inbounds %struct.SetValue, ptr %1168, i32 0, i32 0
  store i32 %1167, ptr %1169, align 8
  %1170 = load ptr, ptr %53, align 8
  %1171 = getelementptr inbounds %struct.SetValue, ptr %1170, i32 0, i32 0
  %1172 = load i32, ptr %1171, align 8
  %1173 = sext i32 %1172 to i64
  %1174 = mul i64 8, %1173
  %1175 = call noalias ptr @malloc(i64 noundef %1174) #5
  %1176 = load ptr, ptr %53, align 8
  %1177 = getelementptr inbounds %struct.SetValue, ptr %1176, i32 0, i32 1
  store ptr %1175, ptr %1177, align 8
  store i32 0, ptr %54, align 4
  br label %1178

1178:                                             ; preds = %1200, %1160
  %1179 = load i32, ptr %54, align 4
  %1180 = load ptr, ptr %52, align 8
  %1181 = getelementptr inbounds %struct.SetValue, ptr %1180, i32 0, i32 0
  %1182 = load i32, ptr %1181, align 8
  %1183 = icmp slt i32 %1179, %1182
  br i1 %1183, label %1184, label %1203

1184:                                             ; preds = %1178
  %1185 = load ptr, ptr %6, align 8
  %1186 = load ptr, ptr %52, align 8
  %1187 = getelementptr inbounds %struct.SetValue, ptr %1186, i32 0, i32 1
  %1188 = load ptr, ptr %1187, align 8
  %1189 = load i32, ptr %54, align 4
  %1190 = sext i32 %1189 to i64
  %1191 = getelementptr inbounds ptr, ptr %1188, i64 %1190
  %1192 = load ptr, ptr %1191, align 8
  %1193 = call ptr @divCalcLangValues(ptr noundef %1185, i32 noundef 0, ptr noundef %1192, i32 noundef 1)
  %1194 = load ptr, ptr %53, align 8
  %1195 = getelementptr inbounds %struct.SetValue, ptr %1194, i32 0, i32 1
  %1196 = load ptr, ptr %1195, align 8
  %1197 = load i32, ptr %54, align 4
  %1198 = sext i32 %1197 to i64
  %1199 = getelementptr inbounds ptr, ptr %1196, i64 %1198
  store ptr %1193, ptr %1199, align 8
  br label %1200

1200:                                             ; preds = %1184
  %1201 = load i32, ptr %54, align 4
  %1202 = add nsw i32 %1201, 1
  store i32 %1202, ptr %54, align 4
  br label %1178, !llvm.loop !74

1203:                                             ; preds = %1178
  %1204 = load ptr, ptr %10, align 8
  %1205 = getelementptr inbounds %struct.CalcLangVal, ptr %1204, i32 0, i32 0
  store i32 6, ptr %1205, align 8
  %1206 = load ptr, ptr %53, align 8
  %1207 = load ptr, ptr %10, align 8
  %1208 = getelementptr inbounds %struct.CalcLangVal, ptr %1207, i32 0, i32 1
  store ptr %1206, ptr %1208, align 8
  br label %1450

1209:                                             ; preds = %1155, %1150
  %1210 = load ptr, ptr %6, align 8
  %1211 = getelementptr inbounds %struct.CalcLangVal, ptr %1210, i32 0, i32 0
  %1212 = load i32, ptr %1211, align 8
  %1213 = icmp eq i32 %1212, 6
  br i1 %1213, label %1214, label %1268

1214:                                             ; preds = %1209
  %1215 = load ptr, ptr %8, align 8
  %1216 = getelementptr inbounds %struct.CalcLangVal, ptr %1215, i32 0, i32 0
  %1217 = load i32, ptr %1216, align 8
  %1218 = icmp eq i32 %1217, 3
  br i1 %1218, label %1219, label %1268

1219:                                             ; preds = %1214
  %1220 = load ptr, ptr %6, align 8
  %1221 = getelementptr inbounds %struct.CalcLangVal, ptr %1220, i32 0, i32 1
  %1222 = load ptr, ptr %1221, align 8
  store ptr %1222, ptr %55, align 8
  %1223 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1223, ptr %56, align 8
  %1224 = load ptr, ptr %55, align 8
  %1225 = getelementptr inbounds %struct.SetValue, ptr %1224, i32 0, i32 0
  %1226 = load i32, ptr %1225, align 8
  %1227 = load ptr, ptr %56, align 8
  %1228 = getelementptr inbounds %struct.SetValue, ptr %1227, i32 0, i32 0
  store i32 %1226, ptr %1228, align 8
  %1229 = load ptr, ptr %56, align 8
  %1230 = getelementptr inbounds %struct.SetValue, ptr %1229, i32 0, i32 0
  %1231 = load i32, ptr %1230, align 8
  %1232 = sext i32 %1231 to i64
  %1233 = mul i64 8, %1232
  %1234 = call noalias ptr @malloc(i64 noundef %1233) #5
  %1235 = load ptr, ptr %56, align 8
  %1236 = getelementptr inbounds %struct.SetValue, ptr %1235, i32 0, i32 1
  store ptr %1234, ptr %1236, align 8
  store i32 0, ptr %57, align 4
  br label %1237

1237:                                             ; preds = %1259, %1219
  %1238 = load i32, ptr %57, align 4
  %1239 = load ptr, ptr %55, align 8
  %1240 = getelementptr inbounds %struct.SetValue, ptr %1239, i32 0, i32 0
  %1241 = load i32, ptr %1240, align 8
  %1242 = icmp slt i32 %1238, %1241
  br i1 %1242, label %1243, label %1262

1243:                                             ; preds = %1237
  %1244 = load ptr, ptr %55, align 8
  %1245 = getelementptr inbounds %struct.SetValue, ptr %1244, i32 0, i32 1
  %1246 = load ptr, ptr %1245, align 8
  %1247 = load i32, ptr %57, align 4
  %1248 = sext i32 %1247 to i64
  %1249 = getelementptr inbounds ptr, ptr %1246, i64 %1248
  %1250 = load ptr, ptr %1249, align 8
  %1251 = load ptr, ptr %8, align 8
  %1252 = call ptr @divCalcLangValues(ptr noundef %1250, i32 noundef 1, ptr noundef %1251, i32 noundef 0)
  %1253 = load ptr, ptr %56, align 8
  %1254 = getelementptr inbounds %struct.SetValue, ptr %1253, i32 0, i32 1
  %1255 = load ptr, ptr %1254, align 8
  %1256 = load i32, ptr %57, align 4
  %1257 = sext i32 %1256 to i64
  %1258 = getelementptr inbounds ptr, ptr %1255, i64 %1257
  store ptr %1252, ptr %1258, align 8
  br label %1259

1259:                                             ; preds = %1243
  %1260 = load i32, ptr %57, align 4
  %1261 = add nsw i32 %1260, 1
  store i32 %1261, ptr %57, align 4
  br label %1237, !llvm.loop !75

1262:                                             ; preds = %1237
  %1263 = load ptr, ptr %10, align 8
  %1264 = getelementptr inbounds %struct.CalcLangVal, ptr %1263, i32 0, i32 0
  store i32 6, ptr %1264, align 8
  %1265 = load ptr, ptr %56, align 8
  %1266 = load ptr, ptr %10, align 8
  %1267 = getelementptr inbounds %struct.CalcLangVal, ptr %1266, i32 0, i32 1
  store ptr %1265, ptr %1267, align 8
  br label %1449

1268:                                             ; preds = %1214, %1209
  %1269 = load ptr, ptr %6, align 8
  %1270 = getelementptr inbounds %struct.CalcLangVal, ptr %1269, i32 0, i32 0
  %1271 = load i32, ptr %1270, align 8
  %1272 = icmp eq i32 %1271, 3
  br i1 %1272, label %1273, label %1327

1273:                                             ; preds = %1268
  %1274 = load ptr, ptr %8, align 8
  %1275 = getelementptr inbounds %struct.CalcLangVal, ptr %1274, i32 0, i32 0
  %1276 = load i32, ptr %1275, align 8
  %1277 = icmp eq i32 %1276, 6
  br i1 %1277, label %1278, label %1327

1278:                                             ; preds = %1273
  %1279 = load ptr, ptr %8, align 8
  %1280 = getelementptr inbounds %struct.CalcLangVal, ptr %1279, i32 0, i32 1
  %1281 = load ptr, ptr %1280, align 8
  store ptr %1281, ptr %58, align 8
  %1282 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1282, ptr %59, align 8
  %1283 = load ptr, ptr %58, align 8
  %1284 = getelementptr inbounds %struct.SetValue, ptr %1283, i32 0, i32 0
  %1285 = load i32, ptr %1284, align 8
  %1286 = load ptr, ptr %59, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 0
  store i32 %1285, ptr %1287, align 8
  %1288 = load ptr, ptr %59, align 8
  %1289 = getelementptr inbounds %struct.SetValue, ptr %1288, i32 0, i32 0
  %1290 = load i32, ptr %1289, align 8
  %1291 = sext i32 %1290 to i64
  %1292 = mul i64 8, %1291
  %1293 = call noalias ptr @malloc(i64 noundef %1292) #5
  %1294 = load ptr, ptr %59, align 8
  %1295 = getelementptr inbounds %struct.SetValue, ptr %1294, i32 0, i32 1
  store ptr %1293, ptr %1295, align 8
  store i32 0, ptr %60, align 4
  br label %1296

1296:                                             ; preds = %1318, %1278
  %1297 = load i32, ptr %60, align 4
  %1298 = load ptr, ptr %58, align 8
  %1299 = getelementptr inbounds %struct.SetValue, ptr %1298, i32 0, i32 0
  %1300 = load i32, ptr %1299, align 8
  %1301 = icmp slt i32 %1297, %1300
  br i1 %1301, label %1302, label %1321

1302:                                             ; preds = %1296
  %1303 = load ptr, ptr %6, align 8
  %1304 = load ptr, ptr %58, align 8
  %1305 = getelementptr inbounds %struct.SetValue, ptr %1304, i32 0, i32 1
  %1306 = load ptr, ptr %1305, align 8
  %1307 = load i32, ptr %60, align 4
  %1308 = sext i32 %1307 to i64
  %1309 = getelementptr inbounds ptr, ptr %1306, i64 %1308
  %1310 = load ptr, ptr %1309, align 8
  %1311 = call ptr @divCalcLangValues(ptr noundef %1303, i32 noundef 0, ptr noundef %1310, i32 noundef 1)
  %1312 = load ptr, ptr %59, align 8
  %1313 = getelementptr inbounds %struct.SetValue, ptr %1312, i32 0, i32 1
  %1314 = load ptr, ptr %1313, align 8
  %1315 = load i32, ptr %60, align 4
  %1316 = sext i32 %1315 to i64
  %1317 = getelementptr inbounds ptr, ptr %1314, i64 %1316
  store ptr %1311, ptr %1317, align 8
  br label %1318

1318:                                             ; preds = %1302
  %1319 = load i32, ptr %60, align 4
  %1320 = add nsw i32 %1319, 1
  store i32 %1320, ptr %60, align 4
  br label %1296, !llvm.loop !76

1321:                                             ; preds = %1296
  %1322 = load ptr, ptr %10, align 8
  %1323 = getelementptr inbounds %struct.CalcLangVal, ptr %1322, i32 0, i32 0
  store i32 6, ptr %1323, align 8
  %1324 = load ptr, ptr %59, align 8
  %1325 = load ptr, ptr %10, align 8
  %1326 = getelementptr inbounds %struct.CalcLangVal, ptr %1325, i32 0, i32 1
  store ptr %1324, ptr %1326, align 8
  br label %1448

1327:                                             ; preds = %1273, %1268
  %1328 = load ptr, ptr %6, align 8
  %1329 = getelementptr inbounds %struct.CalcLangVal, ptr %1328, i32 0, i32 0
  %1330 = load i32, ptr %1329, align 8
  %1331 = icmp eq i32 %1330, 6
  br i1 %1331, label %1332, label %1386

1332:                                             ; preds = %1327
  %1333 = load ptr, ptr %8, align 8
  %1334 = getelementptr inbounds %struct.CalcLangVal, ptr %1333, i32 0, i32 0
  %1335 = load i32, ptr %1334, align 8
  %1336 = icmp eq i32 %1335, 4
  br i1 %1336, label %1337, label %1386

1337:                                             ; preds = %1332
  %1338 = load ptr, ptr %6, align 8
  %1339 = getelementptr inbounds %struct.CalcLangVal, ptr %1338, i32 0, i32 1
  %1340 = load ptr, ptr %1339, align 8
  store ptr %1340, ptr %61, align 8
  %1341 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1341, ptr %62, align 8
  %1342 = load ptr, ptr %61, align 8
  %1343 = getelementptr inbounds %struct.SetValue, ptr %1342, i32 0, i32 0
  %1344 = load i32, ptr %1343, align 8
  %1345 = load ptr, ptr %62, align 8
  %1346 = getelementptr inbounds %struct.SetValue, ptr %1345, i32 0, i32 0
  store i32 %1344, ptr %1346, align 8
  %1347 = load ptr, ptr %62, align 8
  %1348 = getelementptr inbounds %struct.SetValue, ptr %1347, i32 0, i32 0
  %1349 = load i32, ptr %1348, align 8
  %1350 = sext i32 %1349 to i64
  %1351 = mul i64 8, %1350
  %1352 = call noalias ptr @malloc(i64 noundef %1351) #5
  %1353 = load ptr, ptr %62, align 8
  %1354 = getelementptr inbounds %struct.SetValue, ptr %1353, i32 0, i32 1
  store ptr %1352, ptr %1354, align 8
  store i32 0, ptr %63, align 4
  br label %1355

1355:                                             ; preds = %1377, %1337
  %1356 = load i32, ptr %63, align 4
  %1357 = load ptr, ptr %61, align 8
  %1358 = getelementptr inbounds %struct.SetValue, ptr %1357, i32 0, i32 0
  %1359 = load i32, ptr %1358, align 8
  %1360 = icmp slt i32 %1356, %1359
  br i1 %1360, label %1361, label %1380

1361:                                             ; preds = %1355
  %1362 = load ptr, ptr %61, align 8
  %1363 = getelementptr inbounds %struct.SetValue, ptr %1362, i32 0, i32 1
  %1364 = load ptr, ptr %1363, align 8
  %1365 = load i32, ptr %63, align 4
  %1366 = sext i32 %1365 to i64
  %1367 = getelementptr inbounds ptr, ptr %1364, i64 %1366
  %1368 = load ptr, ptr %1367, align 8
  %1369 = load ptr, ptr %8, align 8
  %1370 = call ptr @divCalcLangValues(ptr noundef %1368, i32 noundef 1, ptr noundef %1369, i32 noundef 0)
  %1371 = load ptr, ptr %62, align 8
  %1372 = getelementptr inbounds %struct.SetValue, ptr %1371, i32 0, i32 1
  %1373 = load ptr, ptr %1372, align 8
  %1374 = load i32, ptr %63, align 4
  %1375 = sext i32 %1374 to i64
  %1376 = getelementptr inbounds ptr, ptr %1373, i64 %1375
  store ptr %1370, ptr %1376, align 8
  br label %1377

1377:                                             ; preds = %1361
  %1378 = load i32, ptr %63, align 4
  %1379 = add nsw i32 %1378, 1
  store i32 %1379, ptr %63, align 4
  br label %1355, !llvm.loop !77

1380:                                             ; preds = %1355
  %1381 = load ptr, ptr %10, align 8
  %1382 = getelementptr inbounds %struct.CalcLangVal, ptr %1381, i32 0, i32 0
  store i32 6, ptr %1382, align 8
  %1383 = load ptr, ptr %62, align 8
  %1384 = load ptr, ptr %10, align 8
  %1385 = getelementptr inbounds %struct.CalcLangVal, ptr %1384, i32 0, i32 1
  store ptr %1383, ptr %1385, align 8
  br label %1447

1386:                                             ; preds = %1332, %1327
  %1387 = load ptr, ptr %6, align 8
  %1388 = getelementptr inbounds %struct.CalcLangVal, ptr %1387, i32 0, i32 0
  %1389 = load i32, ptr %1388, align 8
  %1390 = icmp eq i32 %1389, 4
  br i1 %1390, label %1391, label %1445

1391:                                             ; preds = %1386
  %1392 = load ptr, ptr %8, align 8
  %1393 = getelementptr inbounds %struct.CalcLangVal, ptr %1392, i32 0, i32 0
  %1394 = load i32, ptr %1393, align 8
  %1395 = icmp eq i32 %1394, 6
  br i1 %1395, label %1396, label %1445

1396:                                             ; preds = %1391
  %1397 = load ptr, ptr %8, align 8
  %1398 = getelementptr inbounds %struct.CalcLangVal, ptr %1397, i32 0, i32 1
  %1399 = load ptr, ptr %1398, align 8
  store ptr %1399, ptr %64, align 8
  %1400 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1400, ptr %65, align 8
  %1401 = load ptr, ptr %64, align 8
  %1402 = getelementptr inbounds %struct.SetValue, ptr %1401, i32 0, i32 0
  %1403 = load i32, ptr %1402, align 8
  %1404 = load ptr, ptr %65, align 8
  %1405 = getelementptr inbounds %struct.SetValue, ptr %1404, i32 0, i32 0
  store i32 %1403, ptr %1405, align 8
  %1406 = load ptr, ptr %65, align 8
  %1407 = getelementptr inbounds %struct.SetValue, ptr %1406, i32 0, i32 0
  %1408 = load i32, ptr %1407, align 8
  %1409 = sext i32 %1408 to i64
  %1410 = mul i64 8, %1409
  %1411 = call noalias ptr @malloc(i64 noundef %1410) #5
  %1412 = load ptr, ptr %65, align 8
  %1413 = getelementptr inbounds %struct.SetValue, ptr %1412, i32 0, i32 1
  store ptr %1411, ptr %1413, align 8
  store i32 0, ptr %66, align 4
  br label %1414

1414:                                             ; preds = %1436, %1396
  %1415 = load i32, ptr %66, align 4
  %1416 = load ptr, ptr %64, align 8
  %1417 = getelementptr inbounds %struct.SetValue, ptr %1416, i32 0, i32 0
  %1418 = load i32, ptr %1417, align 8
  %1419 = icmp slt i32 %1415, %1418
  br i1 %1419, label %1420, label %1439

1420:                                             ; preds = %1414
  %1421 = load ptr, ptr %6, align 8
  %1422 = load ptr, ptr %64, align 8
  %1423 = getelementptr inbounds %struct.SetValue, ptr %1422, i32 0, i32 1
  %1424 = load ptr, ptr %1423, align 8
  %1425 = load i32, ptr %66, align 4
  %1426 = sext i32 %1425 to i64
  %1427 = getelementptr inbounds ptr, ptr %1424, i64 %1426
  %1428 = load ptr, ptr %1427, align 8
  %1429 = call ptr @divCalcLangValues(ptr noundef %1421, i32 noundef 0, ptr noundef %1428, i32 noundef 1)
  %1430 = load ptr, ptr %65, align 8
  %1431 = getelementptr inbounds %struct.SetValue, ptr %1430, i32 0, i32 1
  %1432 = load ptr, ptr %1431, align 8
  %1433 = load i32, ptr %66, align 4
  %1434 = sext i32 %1433 to i64
  %1435 = getelementptr inbounds ptr, ptr %1432, i64 %1434
  store ptr %1429, ptr %1435, align 8
  br label %1436

1436:                                             ; preds = %1420
  %1437 = load i32, ptr %66, align 4
  %1438 = add nsw i32 %1437, 1
  store i32 %1438, ptr %66, align 4
  br label %1414, !llvm.loop !78

1439:                                             ; preds = %1414
  %1440 = load ptr, ptr %10, align 8
  %1441 = getelementptr inbounds %struct.CalcLangVal, ptr %1440, i32 0, i32 0
  store i32 6, ptr %1441, align 8
  %1442 = load ptr, ptr %65, align 8
  %1443 = load ptr, ptr %10, align 8
  %1444 = getelementptr inbounds %struct.CalcLangVal, ptr %1443, i32 0, i32 1
  store ptr %1442, ptr %1444, align 8
  br label %1446

1445:                                             ; preds = %1391, %1386
  call void @perror(ptr noundef @.str.1) #6
  br label %1446

1446:                                             ; preds = %1445, %1439
  br label %1447

1447:                                             ; preds = %1446, %1380
  br label %1448

1448:                                             ; preds = %1447, %1321
  br label %1449

1449:                                             ; preds = %1448, %1262
  br label %1450

1450:                                             ; preds = %1449, %1203
  br label %1451

1451:                                             ; preds = %1450, %1144
  br label %1452

1452:                                             ; preds = %1451, %1085
  br label %1453

1453:                                             ; preds = %1452, %1026
  br label %1454

1454:                                             ; preds = %1453, %972
  br label %1455

1455:                                             ; preds = %1454, %889
  br label %1456

1456:                                             ; preds = %1455, %830
  br label %1457

1457:                                             ; preds = %1456, %771
  br label %1458

1458:                                             ; preds = %1457, %712
  br label %1459

1459:                                             ; preds = %1458, %653
  br label %1460

1460:                                             ; preds = %1459, %594
  br label %1461

1461:                                             ; preds = %1460, %535
  br label %1462

1462:                                             ; preds = %1461, %476
  br label %1463

1463:                                             ; preds = %1462, %422
  br label %1464

1464:                                             ; preds = %1463, %333
  br label %1465

1465:                                             ; preds = %1464, %311
  br label %1466

1466:                                             ; preds = %1465, %289
  br label %1467

1467:                                             ; preds = %1466, %266
  br label %1468

1468:                                             ; preds = %1467, %243
  br label %1469

1469:                                             ; preds = %1468, %221
  br label %1470

1470:                                             ; preds = %1469, %199
  br label %1471

1471:                                             ; preds = %1470, %176
  br label %1472

1472:                                             ; preds = %1471, %153
  br label %1473

1473:                                             ; preds = %1472, %130
  br label %1474

1474:                                             ; preds = %1473, %108
  br label %1475

1475:                                             ; preds = %1474, %84
  %1476 = load i32, ptr %7, align 4
  %1477 = icmp ne i32 %1476, 0
  br i1 %1477, label %1478, label %1480

1478:                                             ; preds = %1475
  %1479 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1479)
  br label %1486

1480:                                             ; preds = %1475
  %1481 = load i32, ptr %9, align 4
  %1482 = icmp ne i32 %1481, 0
  br i1 %1482, label %1483, label %1485

1483:                                             ; preds = %1480
  %1484 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1484)
  br label %1485

1485:                                             ; preds = %1483, %1480
  br label %1486

1486:                                             ; preds = %1485, %1478
  %1487 = load ptr, ptr %10, align 8
  store ptr %1487, ptr %5, align 8
  br label %1488

1488:                                             ; preds = %1486, %971, %421, %72
  %1489 = load ptr, ptr %5, align 8
  ret ptr %1489
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @powCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i32, align 4
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i32, align 4
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i32, align 4
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %67 = load ptr, ptr %6, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %72, label %69

69:                                               ; preds = %4
  %70 = load ptr, ptr %8, align 8
  %71 = icmp eq ptr %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %69, %4
  store ptr null, ptr %5, align 8
  br label %1513

73:                                               ; preds = %69
  %74 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %74, ptr %10, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %99

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %99

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = sitofp i32 %89 to double
  %91 = load ptr, ptr %8, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 1
  %93 = load i32, ptr %92, align 8
  %94 = sitofp i32 %93 to double
  %95 = call double @pow(double noundef %90, double noundef %94) #7
  %96 = fptosi double %95 to i32
  %97 = load ptr, ptr %10, align 8
  %98 = getelementptr inbounds %struct.CalcLangVal, ptr %97, i32 0, i32 1
  store i32 %96, ptr %98, align 8
  br label %1500

99:                                               ; preds = %79, %73
  %100 = load ptr, ptr %6, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  %102 = load i32, ptr %101, align 8
  %103 = icmp eq i32 %102, 1
  br i1 %103, label %104, label %121

104:                                              ; preds = %99
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 8
  %108 = icmp eq i32 %107, 1
  br i1 %108, label %109, label %121

109:                                              ; preds = %104
  %110 = load ptr, ptr %10, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  store i32 1, ptr %111, align 8
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  %114 = load double, ptr %113, align 8
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 1
  %117 = load double, ptr %116, align 8
  %118 = call double @pow(double noundef %114, double noundef %117) #7
  %119 = load ptr, ptr %10, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 1
  store double %118, ptr %120, align 8
  br label %1499

121:                                              ; preds = %104, %99
  %122 = load ptr, ptr %6, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  %124 = load i32, ptr %123, align 8
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %144

126:                                              ; preds = %121
  %127 = load ptr, ptr %8, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 0
  %129 = load i32, ptr %128, align 8
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %144

131:                                              ; preds = %126
  %132 = load ptr, ptr %10, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 0
  store i32 1, ptr %133, align 8
  %134 = load ptr, ptr %6, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load i32, ptr %135, align 8
  %137 = sitofp i32 %136 to double
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.CalcLangVal, ptr %138, i32 0, i32 1
  %140 = load double, ptr %139, align 8
  %141 = call double @pow(double noundef %137, double noundef %140) #7
  %142 = load ptr, ptr %10, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 1
  store double %141, ptr %143, align 8
  br label %1498

144:                                              ; preds = %126, %121
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  %147 = load i32, ptr %146, align 8
  %148 = icmp eq i32 %147, 1
  br i1 %148, label %149, label %167

149:                                              ; preds = %144
  %150 = load ptr, ptr %8, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 0
  %152 = load i32, ptr %151, align 8
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %167

154:                                              ; preds = %149
  %155 = load ptr, ptr %10, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 0
  store i32 1, ptr %156, align 8
  %157 = load ptr, ptr %6, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  %159 = load double, ptr %158, align 8
  %160 = load ptr, ptr %8, align 8
  %161 = getelementptr inbounds %struct.CalcLangVal, ptr %160, i32 0, i32 1
  %162 = load i32, ptr %161, align 8
  %163 = sitofp i32 %162 to double
  %164 = call double @pow(double noundef %159, double noundef %163) #7
  %165 = load ptr, ptr %10, align 8
  %166 = getelementptr inbounds %struct.CalcLangVal, ptr %165, i32 0, i32 1
  store double %164, ptr %166, align 8
  br label %1497

167:                                              ; preds = %149, %144
  %168 = load ptr, ptr %6, align 8
  %169 = getelementptr inbounds %struct.CalcLangVal, ptr %168, i32 0, i32 0
  %170 = load i32, ptr %169, align 8
  %171 = icmp eq i32 %170, 3
  br i1 %171, label %172, label %190

172:                                              ; preds = %167
  %173 = load ptr, ptr %8, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 0
  %175 = load i32, ptr %174, align 8
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %190

177:                                              ; preds = %172
  %178 = load ptr, ptr %10, align 8
  %179 = getelementptr inbounds %struct.CalcLangVal, ptr %178, i32 0, i32 0
  store i32 3, ptr %179, align 8
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 1
  %182 = load double, ptr %181, align 8
  %183 = load ptr, ptr %8, align 8
  %184 = getelementptr inbounds %struct.CalcLangVal, ptr %183, i32 0, i32 1
  %185 = load i32, ptr %184, align 8
  %186 = sitofp i32 %185 to double
  %187 = call double @pow(double noundef %182, double noundef %186) #7
  %188 = load ptr, ptr %10, align 8
  %189 = getelementptr inbounds %struct.CalcLangVal, ptr %188, i32 0, i32 1
  store double %187, ptr %189, align 8
  br label %1496

190:                                              ; preds = %172, %167
  %191 = load ptr, ptr %6, align 8
  %192 = getelementptr inbounds %struct.CalcLangVal, ptr %191, i32 0, i32 0
  %193 = load i32, ptr %192, align 8
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %213

195:                                              ; preds = %190
  %196 = load ptr, ptr %8, align 8
  %197 = getelementptr inbounds %struct.CalcLangVal, ptr %196, i32 0, i32 0
  %198 = load i32, ptr %197, align 8
  %199 = icmp eq i32 %198, 3
  br i1 %199, label %200, label %213

200:                                              ; preds = %195
  %201 = load ptr, ptr %10, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 0
  store i32 3, ptr %202, align 8
  %203 = load ptr, ptr %6, align 8
  %204 = getelementptr inbounds %struct.CalcLangVal, ptr %203, i32 0, i32 1
  %205 = load i32, ptr %204, align 8
  %206 = sitofp i32 %205 to double
  %207 = load ptr, ptr %8, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 1
  %209 = load double, ptr %208, align 8
  %210 = call double @pow(double noundef %206, double noundef %209) #7
  %211 = load ptr, ptr %10, align 8
  %212 = getelementptr inbounds %struct.CalcLangVal, ptr %211, i32 0, i32 1
  store double %210, ptr %212, align 8
  br label %1495

213:                                              ; preds = %195, %190
  %214 = load ptr, ptr %6, align 8
  %215 = getelementptr inbounds %struct.CalcLangVal, ptr %214, i32 0, i32 0
  %216 = load i32, ptr %215, align 8
  %217 = icmp eq i32 %216, 1
  br i1 %217, label %218, label %235

218:                                              ; preds = %213
  %219 = load ptr, ptr %8, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 0
  %221 = load i32, ptr %220, align 8
  %222 = icmp eq i32 %221, 3
  br i1 %222, label %223, label %235

223:                                              ; preds = %218
  %224 = load ptr, ptr %10, align 8
  %225 = getelementptr inbounds %struct.CalcLangVal, ptr %224, i32 0, i32 0
  store i32 3, ptr %225, align 8
  %226 = load ptr, ptr %6, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 1
  %228 = load double, ptr %227, align 8
  %229 = load ptr, ptr %8, align 8
  %230 = getelementptr inbounds %struct.CalcLangVal, ptr %229, i32 0, i32 1
  %231 = load double, ptr %230, align 8
  %232 = call double @pow(double noundef %228, double noundef %231) #7
  %233 = load ptr, ptr %10, align 8
  %234 = getelementptr inbounds %struct.CalcLangVal, ptr %233, i32 0, i32 1
  store double %232, ptr %234, align 8
  br label %1494

235:                                              ; preds = %218, %213
  %236 = load ptr, ptr %6, align 8
  %237 = getelementptr inbounds %struct.CalcLangVal, ptr %236, i32 0, i32 0
  %238 = load i32, ptr %237, align 8
  %239 = icmp eq i32 %238, 3
  br i1 %239, label %240, label %257

240:                                              ; preds = %235
  %241 = load ptr, ptr %8, align 8
  %242 = getelementptr inbounds %struct.CalcLangVal, ptr %241, i32 0, i32 0
  %243 = load i32, ptr %242, align 8
  %244 = icmp eq i32 %243, 1
  br i1 %244, label %245, label %257

245:                                              ; preds = %240
  %246 = load ptr, ptr %10, align 8
  %247 = getelementptr inbounds %struct.CalcLangVal, ptr %246, i32 0, i32 0
  store i32 3, ptr %247, align 8
  %248 = load ptr, ptr %6, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 1
  %250 = load double, ptr %249, align 8
  %251 = load ptr, ptr %8, align 8
  %252 = getelementptr inbounds %struct.CalcLangVal, ptr %251, i32 0, i32 1
  %253 = load double, ptr %252, align 8
  %254 = call double @pow(double noundef %250, double noundef %253) #7
  %255 = load ptr, ptr %10, align 8
  %256 = getelementptr inbounds %struct.CalcLangVal, ptr %255, i32 0, i32 1
  store double %254, ptr %256, align 8
  br label %1493

257:                                              ; preds = %240, %235
  %258 = load ptr, ptr %6, align 8
  %259 = getelementptr inbounds %struct.CalcLangVal, ptr %258, i32 0, i32 0
  %260 = load i32, ptr %259, align 8
  %261 = icmp eq i32 %260, 4
  br i1 %261, label %262, label %280

262:                                              ; preds = %257
  %263 = load ptr, ptr %8, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 0
  %265 = load i32, ptr %264, align 8
  %266 = icmp eq i32 %265, 0
  br i1 %266, label %267, label %280

267:                                              ; preds = %262
  %268 = load ptr, ptr %10, align 8
  %269 = getelementptr inbounds %struct.CalcLangVal, ptr %268, i32 0, i32 0
  store i32 4, ptr %269, align 8
  %270 = load ptr, ptr %6, align 8
  %271 = getelementptr inbounds %struct.CalcLangVal, ptr %270, i32 0, i32 1
  %272 = load double, ptr %271, align 8
  %273 = load ptr, ptr %8, align 8
  %274 = getelementptr inbounds %struct.CalcLangVal, ptr %273, i32 0, i32 1
  %275 = load i32, ptr %274, align 8
  %276 = sitofp i32 %275 to double
  %277 = call double @pow(double noundef %272, double noundef %276) #7
  %278 = load ptr, ptr %10, align 8
  %279 = getelementptr inbounds %struct.CalcLangVal, ptr %278, i32 0, i32 1
  store double %277, ptr %279, align 8
  br label %1492

280:                                              ; preds = %262, %257
  %281 = load ptr, ptr %6, align 8
  %282 = getelementptr inbounds %struct.CalcLangVal, ptr %281, i32 0, i32 0
  %283 = load i32, ptr %282, align 8
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %285, label %303

285:                                              ; preds = %280
  %286 = load ptr, ptr %8, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 0
  %288 = load i32, ptr %287, align 8
  %289 = icmp eq i32 %288, 4
  br i1 %289, label %290, label %303

290:                                              ; preds = %285
  %291 = load ptr, ptr %10, align 8
  %292 = getelementptr inbounds %struct.CalcLangVal, ptr %291, i32 0, i32 0
  store i32 4, ptr %292, align 8
  %293 = load ptr, ptr %6, align 8
  %294 = getelementptr inbounds %struct.CalcLangVal, ptr %293, i32 0, i32 1
  %295 = load i32, ptr %294, align 8
  %296 = sitofp i32 %295 to double
  %297 = load ptr, ptr %8, align 8
  %298 = getelementptr inbounds %struct.CalcLangVal, ptr %297, i32 0, i32 1
  %299 = load double, ptr %298, align 8
  %300 = call double @pow(double noundef %296, double noundef %299) #7
  %301 = load ptr, ptr %10, align 8
  %302 = getelementptr inbounds %struct.CalcLangVal, ptr %301, i32 0, i32 1
  store double %300, ptr %302, align 8
  br label %1491

303:                                              ; preds = %285, %280
  %304 = load ptr, ptr %6, align 8
  %305 = getelementptr inbounds %struct.CalcLangVal, ptr %304, i32 0, i32 0
  %306 = load i32, ptr %305, align 8
  %307 = icmp eq i32 %306, 1
  br i1 %307, label %308, label %325

308:                                              ; preds = %303
  %309 = load ptr, ptr %8, align 8
  %310 = getelementptr inbounds %struct.CalcLangVal, ptr %309, i32 0, i32 0
  %311 = load i32, ptr %310, align 8
  %312 = icmp eq i32 %311, 4
  br i1 %312, label %313, label %325

313:                                              ; preds = %308
  %314 = load ptr, ptr %10, align 8
  %315 = getelementptr inbounds %struct.CalcLangVal, ptr %314, i32 0, i32 0
  store i32 4, ptr %315, align 8
  %316 = load ptr, ptr %6, align 8
  %317 = getelementptr inbounds %struct.CalcLangVal, ptr %316, i32 0, i32 1
  %318 = load double, ptr %317, align 8
  %319 = load ptr, ptr %8, align 8
  %320 = getelementptr inbounds %struct.CalcLangVal, ptr %319, i32 0, i32 1
  %321 = load double, ptr %320, align 8
  %322 = call double @pow(double noundef %318, double noundef %321) #7
  %323 = load ptr, ptr %10, align 8
  %324 = getelementptr inbounds %struct.CalcLangVal, ptr %323, i32 0, i32 1
  store double %322, ptr %324, align 8
  br label %1490

325:                                              ; preds = %308, %303
  %326 = load ptr, ptr %6, align 8
  %327 = getelementptr inbounds %struct.CalcLangVal, ptr %326, i32 0, i32 0
  %328 = load i32, ptr %327, align 8
  %329 = icmp eq i32 %328, 4
  br i1 %329, label %330, label %347

330:                                              ; preds = %325
  %331 = load ptr, ptr %8, align 8
  %332 = getelementptr inbounds %struct.CalcLangVal, ptr %331, i32 0, i32 0
  %333 = load i32, ptr %332, align 8
  %334 = icmp eq i32 %333, 1
  br i1 %334, label %335, label %347

335:                                              ; preds = %330
  %336 = load ptr, ptr %10, align 8
  %337 = getelementptr inbounds %struct.CalcLangVal, ptr %336, i32 0, i32 0
  store i32 4, ptr %337, align 8
  %338 = load ptr, ptr %6, align 8
  %339 = getelementptr inbounds %struct.CalcLangVal, ptr %338, i32 0, i32 1
  %340 = load double, ptr %339, align 8
  %341 = load ptr, ptr %8, align 8
  %342 = getelementptr inbounds %struct.CalcLangVal, ptr %341, i32 0, i32 1
  %343 = load double, ptr %342, align 8
  %344 = call double @pow(double noundef %340, double noundef %343) #7
  %345 = load ptr, ptr %10, align 8
  %346 = getelementptr inbounds %struct.CalcLangVal, ptr %345, i32 0, i32 1
  store double %344, ptr %346, align 8
  br label %1489

347:                                              ; preds = %330, %325
  %348 = load ptr, ptr %6, align 8
  %349 = getelementptr inbounds %struct.CalcLangVal, ptr %348, i32 0, i32 0
  %350 = load i32, ptr %349, align 8
  %351 = icmp eq i32 %350, 4
  br i1 %351, label %352, label %369

352:                                              ; preds = %347
  %353 = load ptr, ptr %8, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 0
  %355 = load i32, ptr %354, align 8
  %356 = icmp eq i32 %355, 4
  br i1 %356, label %357, label %369

357:                                              ; preds = %352
  %358 = load ptr, ptr %10, align 8
  %359 = getelementptr inbounds %struct.CalcLangVal, ptr %358, i32 0, i32 0
  store i32 4, ptr %359, align 8
  %360 = load ptr, ptr %6, align 8
  %361 = getelementptr inbounds %struct.CalcLangVal, ptr %360, i32 0, i32 1
  %362 = load double, ptr %361, align 8
  %363 = load ptr, ptr %8, align 8
  %364 = getelementptr inbounds %struct.CalcLangVal, ptr %363, i32 0, i32 1
  %365 = load double, ptr %364, align 8
  %366 = call double @pow(double noundef %362, double noundef %365) #7
  %367 = load ptr, ptr %10, align 8
  %368 = getelementptr inbounds %struct.CalcLangVal, ptr %367, i32 0, i32 1
  store double %366, ptr %368, align 8
  br label %1488

369:                                              ; preds = %352, %347
  %370 = load ptr, ptr %6, align 8
  %371 = getelementptr inbounds %struct.CalcLangVal, ptr %370, i32 0, i32 0
  %372 = load i32, ptr %371, align 8
  %373 = icmp eq i32 %372, 7
  br i1 %373, label %374, label %447

374:                                              ; preds = %369
  %375 = load ptr, ptr %8, align 8
  %376 = getelementptr inbounds %struct.CalcLangVal, ptr %375, i32 0, i32 0
  %377 = load i32, ptr %376, align 8
  %378 = icmp eq i32 %377, 7
  br i1 %378, label %379, label %447

379:                                              ; preds = %374
  %380 = load ptr, ptr %6, align 8
  %381 = getelementptr inbounds %struct.CalcLangVal, ptr %380, i32 0, i32 1
  %382 = load ptr, ptr %381, align 8
  store ptr %382, ptr %11, align 8
  %383 = load ptr, ptr %8, align 8
  %384 = getelementptr inbounds %struct.CalcLangVal, ptr %383, i32 0, i32 1
  %385 = load ptr, ptr %384, align 8
  store ptr %385, ptr %12, align 8
  %386 = load ptr, ptr %12, align 8
  %387 = getelementptr inbounds %struct.TupleValue, ptr %386, i32 0, i32 0
  %388 = load i32, ptr %387, align 8
  %389 = load ptr, ptr %11, align 8
  %390 = getelementptr inbounds %struct.TupleValue, ptr %389, i32 0, i32 0
  %391 = load i32, ptr %390, align 8
  %392 = icmp eq i32 %388, %391
  br i1 %392, label %393, label %445

393:                                              ; preds = %379
  %394 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %394, ptr %13, align 8
  %395 = load ptr, ptr %11, align 8
  %396 = getelementptr inbounds %struct.TupleValue, ptr %395, i32 0, i32 0
  %397 = load i32, ptr %396, align 8
  %398 = load ptr, ptr %13, align 8
  %399 = getelementptr inbounds %struct.TupleValue, ptr %398, i32 0, i32 0
  store i32 %397, ptr %399, align 8
  %400 = load ptr, ptr %13, align 8
  %401 = getelementptr inbounds %struct.TupleValue, ptr %400, i32 0, i32 0
  %402 = load i32, ptr %401, align 8
  %403 = sext i32 %402 to i64
  %404 = mul i64 8, %403
  %405 = call noalias ptr @malloc(i64 noundef %404) #5
  %406 = load ptr, ptr %13, align 8
  %407 = getelementptr inbounds %struct.TupleValue, ptr %406, i32 0, i32 1
  store ptr %405, ptr %407, align 8
  store i32 0, ptr %14, align 4
  br label %408

408:                                              ; preds = %436, %393
  %409 = load i32, ptr %14, align 4
  %410 = load ptr, ptr %11, align 8
  %411 = getelementptr inbounds %struct.TupleValue, ptr %410, i32 0, i32 0
  %412 = load i32, ptr %411, align 8
  %413 = icmp slt i32 %409, %412
  br i1 %413, label %414, label %439

414:                                              ; preds = %408
  %415 = load ptr, ptr %11, align 8
  %416 = getelementptr inbounds %struct.TupleValue, ptr %415, i32 0, i32 1
  %417 = load ptr, ptr %416, align 8
  %418 = load i32, ptr %14, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds ptr, ptr %417, i64 %419
  %421 = load ptr, ptr %420, align 8
  %422 = load ptr, ptr %12, align 8
  %423 = getelementptr inbounds %struct.TupleValue, ptr %422, i32 0, i32 1
  %424 = load ptr, ptr %423, align 8
  %425 = load i32, ptr %14, align 4
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds ptr, ptr %424, i64 %426
  %428 = load ptr, ptr %427, align 8
  %429 = call ptr @multCalcLangValues(ptr noundef %421, i32 noundef 1, ptr noundef %428, i32 noundef 0)
  %430 = load ptr, ptr %13, align 8
  %431 = getelementptr inbounds %struct.TupleValue, ptr %430, i32 0, i32 1
  %432 = load ptr, ptr %431, align 8
  %433 = load i32, ptr %14, align 4
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds ptr, ptr %432, i64 %434
  store ptr %429, ptr %435, align 8
  br label %436

436:                                              ; preds = %414
  %437 = load i32, ptr %14, align 4
  %438 = add nsw i32 %437, 1
  store i32 %438, ptr %14, align 4
  br label %408, !llvm.loop !79

439:                                              ; preds = %408
  %440 = load ptr, ptr %10, align 8
  %441 = getelementptr inbounds %struct.CalcLangVal, ptr %440, i32 0, i32 0
  store i32 7, ptr %441, align 8
  %442 = load ptr, ptr %13, align 8
  %443 = load ptr, ptr %10, align 8
  %444 = getelementptr inbounds %struct.CalcLangVal, ptr %443, i32 0, i32 1
  store ptr %442, ptr %444, align 8
  br label %446

445:                                              ; preds = %379
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1513

446:                                              ; preds = %439
  br label %1487

447:                                              ; preds = %374, %369
  %448 = load ptr, ptr %6, align 8
  %449 = getelementptr inbounds %struct.CalcLangVal, ptr %448, i32 0, i32 0
  %450 = load i32, ptr %449, align 8
  %451 = icmp eq i32 %450, 7
  br i1 %451, label %452, label %506

452:                                              ; preds = %447
  %453 = load ptr, ptr %8, align 8
  %454 = getelementptr inbounds %struct.CalcLangVal, ptr %453, i32 0, i32 0
  %455 = load i32, ptr %454, align 8
  %456 = icmp eq i32 %455, 0
  br i1 %456, label %457, label %506

457:                                              ; preds = %452
  %458 = load ptr, ptr %6, align 8
  %459 = getelementptr inbounds %struct.CalcLangVal, ptr %458, i32 0, i32 1
  %460 = load ptr, ptr %459, align 8
  store ptr %460, ptr %15, align 8
  %461 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %461, ptr %16, align 8
  %462 = load ptr, ptr %15, align 8
  %463 = getelementptr inbounds %struct.TupleValue, ptr %462, i32 0, i32 0
  %464 = load i32, ptr %463, align 8
  %465 = load ptr, ptr %16, align 8
  %466 = getelementptr inbounds %struct.TupleValue, ptr %465, i32 0, i32 0
  store i32 %464, ptr %466, align 8
  %467 = load ptr, ptr %16, align 8
  %468 = getelementptr inbounds %struct.TupleValue, ptr %467, i32 0, i32 0
  %469 = load i32, ptr %468, align 8
  %470 = sext i32 %469 to i64
  %471 = mul i64 8, %470
  %472 = call noalias ptr @malloc(i64 noundef %471) #5
  %473 = load ptr, ptr %16, align 8
  %474 = getelementptr inbounds %struct.TupleValue, ptr %473, i32 0, i32 1
  store ptr %472, ptr %474, align 8
  store i32 0, ptr %17, align 4
  br label %475

475:                                              ; preds = %497, %457
  %476 = load i32, ptr %17, align 4
  %477 = load ptr, ptr %15, align 8
  %478 = getelementptr inbounds %struct.TupleValue, ptr %477, i32 0, i32 0
  %479 = load i32, ptr %478, align 8
  %480 = icmp slt i32 %476, %479
  br i1 %480, label %481, label %500

481:                                              ; preds = %475
  %482 = load ptr, ptr %15, align 8
  %483 = getelementptr inbounds %struct.TupleValue, ptr %482, i32 0, i32 1
  %484 = load ptr, ptr %483, align 8
  %485 = load i32, ptr %17, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds ptr, ptr %484, i64 %486
  %488 = load ptr, ptr %487, align 8
  %489 = load ptr, ptr %8, align 8
  %490 = call ptr @powCalcLangValues(ptr noundef %488, i32 noundef 1, ptr noundef %489, i32 noundef 0)
  %491 = load ptr, ptr %16, align 8
  %492 = getelementptr inbounds %struct.TupleValue, ptr %491, i32 0, i32 1
  %493 = load ptr, ptr %492, align 8
  %494 = load i32, ptr %17, align 4
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds ptr, ptr %493, i64 %495
  store ptr %490, ptr %496, align 8
  br label %497

497:                                              ; preds = %481
  %498 = load i32, ptr %17, align 4
  %499 = add nsw i32 %498, 1
  store i32 %499, ptr %17, align 4
  br label %475, !llvm.loop !80

500:                                              ; preds = %475
  %501 = load ptr, ptr %10, align 8
  %502 = getelementptr inbounds %struct.CalcLangVal, ptr %501, i32 0, i32 0
  store i32 7, ptr %502, align 8
  %503 = load ptr, ptr %16, align 8
  %504 = load ptr, ptr %10, align 8
  %505 = getelementptr inbounds %struct.CalcLangVal, ptr %504, i32 0, i32 1
  store ptr %503, ptr %505, align 8
  br label %1486

506:                                              ; preds = %452, %447
  %507 = load ptr, ptr %6, align 8
  %508 = getelementptr inbounds %struct.CalcLangVal, ptr %507, i32 0, i32 0
  %509 = load i32, ptr %508, align 8
  %510 = icmp eq i32 %509, 0
  br i1 %510, label %511, label %565

511:                                              ; preds = %506
  %512 = load ptr, ptr %8, align 8
  %513 = getelementptr inbounds %struct.CalcLangVal, ptr %512, i32 0, i32 0
  %514 = load i32, ptr %513, align 8
  %515 = icmp eq i32 %514, 7
  br i1 %515, label %516, label %565

516:                                              ; preds = %511
  %517 = load ptr, ptr %8, align 8
  %518 = getelementptr inbounds %struct.CalcLangVal, ptr %517, i32 0, i32 1
  %519 = load ptr, ptr %518, align 8
  store ptr %519, ptr %18, align 8
  %520 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %520, ptr %19, align 8
  %521 = load ptr, ptr %18, align 8
  %522 = getelementptr inbounds %struct.TupleValue, ptr %521, i32 0, i32 0
  %523 = load i32, ptr %522, align 8
  %524 = load ptr, ptr %19, align 8
  %525 = getelementptr inbounds %struct.TupleValue, ptr %524, i32 0, i32 0
  store i32 %523, ptr %525, align 8
  %526 = load ptr, ptr %19, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 0
  %528 = load i32, ptr %527, align 8
  %529 = sext i32 %528 to i64
  %530 = mul i64 8, %529
  %531 = call noalias ptr @malloc(i64 noundef %530) #5
  %532 = load ptr, ptr %19, align 8
  %533 = getelementptr inbounds %struct.TupleValue, ptr %532, i32 0, i32 1
  store ptr %531, ptr %533, align 8
  store i32 0, ptr %20, align 4
  br label %534

534:                                              ; preds = %556, %516
  %535 = load i32, ptr %20, align 4
  %536 = load ptr, ptr %18, align 8
  %537 = getelementptr inbounds %struct.TupleValue, ptr %536, i32 0, i32 0
  %538 = load i32, ptr %537, align 8
  %539 = icmp slt i32 %535, %538
  br i1 %539, label %540, label %559

540:                                              ; preds = %534
  %541 = load ptr, ptr %6, align 8
  %542 = load ptr, ptr %18, align 8
  %543 = getelementptr inbounds %struct.TupleValue, ptr %542, i32 0, i32 1
  %544 = load ptr, ptr %543, align 8
  %545 = load i32, ptr %20, align 4
  %546 = sext i32 %545 to i64
  %547 = getelementptr inbounds ptr, ptr %544, i64 %546
  %548 = load ptr, ptr %547, align 8
  %549 = call ptr @powCalcLangValues(ptr noundef %541, i32 noundef 0, ptr noundef %548, i32 noundef 1)
  %550 = load ptr, ptr %19, align 8
  %551 = getelementptr inbounds %struct.TupleValue, ptr %550, i32 0, i32 1
  %552 = load ptr, ptr %551, align 8
  %553 = load i32, ptr %20, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds ptr, ptr %552, i64 %554
  store ptr %549, ptr %555, align 8
  br label %556

556:                                              ; preds = %540
  %557 = load i32, ptr %20, align 4
  %558 = add nsw i32 %557, 1
  store i32 %558, ptr %20, align 4
  br label %534, !llvm.loop !81

559:                                              ; preds = %534
  %560 = load ptr, ptr %10, align 8
  %561 = getelementptr inbounds %struct.CalcLangVal, ptr %560, i32 0, i32 0
  store i32 7, ptr %561, align 8
  %562 = load ptr, ptr %19, align 8
  %563 = load ptr, ptr %10, align 8
  %564 = getelementptr inbounds %struct.CalcLangVal, ptr %563, i32 0, i32 1
  store ptr %562, ptr %564, align 8
  br label %1485

565:                                              ; preds = %511, %506
  %566 = load ptr, ptr %6, align 8
  %567 = getelementptr inbounds %struct.CalcLangVal, ptr %566, i32 0, i32 0
  %568 = load i32, ptr %567, align 8
  %569 = icmp eq i32 %568, 7
  br i1 %569, label %570, label %624

570:                                              ; preds = %565
  %571 = load ptr, ptr %8, align 8
  %572 = getelementptr inbounds %struct.CalcLangVal, ptr %571, i32 0, i32 0
  %573 = load i32, ptr %572, align 8
  %574 = icmp eq i32 %573, 1
  br i1 %574, label %575, label %624

575:                                              ; preds = %570
  %576 = load ptr, ptr %6, align 8
  %577 = getelementptr inbounds %struct.CalcLangVal, ptr %576, i32 0, i32 1
  %578 = load ptr, ptr %577, align 8
  store ptr %578, ptr %21, align 8
  %579 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %579, ptr %22, align 8
  %580 = load ptr, ptr %21, align 8
  %581 = getelementptr inbounds %struct.TupleValue, ptr %580, i32 0, i32 0
  %582 = load i32, ptr %581, align 8
  %583 = load ptr, ptr %22, align 8
  %584 = getelementptr inbounds %struct.TupleValue, ptr %583, i32 0, i32 0
  store i32 %582, ptr %584, align 8
  %585 = load ptr, ptr %22, align 8
  %586 = getelementptr inbounds %struct.TupleValue, ptr %585, i32 0, i32 0
  %587 = load i32, ptr %586, align 8
  %588 = sext i32 %587 to i64
  %589 = mul i64 8, %588
  %590 = call noalias ptr @malloc(i64 noundef %589) #5
  %591 = load ptr, ptr %22, align 8
  %592 = getelementptr inbounds %struct.TupleValue, ptr %591, i32 0, i32 1
  store ptr %590, ptr %592, align 8
  store i32 0, ptr %23, align 4
  br label %593

593:                                              ; preds = %615, %575
  %594 = load i32, ptr %23, align 4
  %595 = load ptr, ptr %21, align 8
  %596 = getelementptr inbounds %struct.TupleValue, ptr %595, i32 0, i32 0
  %597 = load i32, ptr %596, align 8
  %598 = icmp slt i32 %594, %597
  br i1 %598, label %599, label %618

599:                                              ; preds = %593
  %600 = load ptr, ptr %21, align 8
  %601 = getelementptr inbounds %struct.TupleValue, ptr %600, i32 0, i32 1
  %602 = load ptr, ptr %601, align 8
  %603 = load i32, ptr %23, align 4
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds ptr, ptr %602, i64 %604
  %606 = load ptr, ptr %605, align 8
  %607 = load ptr, ptr %8, align 8
  %608 = call ptr @powCalcLangValues(ptr noundef %606, i32 noundef 1, ptr noundef %607, i32 noundef 0)
  %609 = load ptr, ptr %22, align 8
  %610 = getelementptr inbounds %struct.TupleValue, ptr %609, i32 0, i32 1
  %611 = load ptr, ptr %610, align 8
  %612 = load i32, ptr %23, align 4
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds ptr, ptr %611, i64 %613
  store ptr %608, ptr %614, align 8
  br label %615

615:                                              ; preds = %599
  %616 = load i32, ptr %23, align 4
  %617 = add nsw i32 %616, 1
  store i32 %617, ptr %23, align 4
  br label %593, !llvm.loop !82

618:                                              ; preds = %593
  %619 = load ptr, ptr %10, align 8
  %620 = getelementptr inbounds %struct.CalcLangVal, ptr %619, i32 0, i32 0
  store i32 7, ptr %620, align 8
  %621 = load ptr, ptr %22, align 8
  %622 = load ptr, ptr %10, align 8
  %623 = getelementptr inbounds %struct.CalcLangVal, ptr %622, i32 0, i32 1
  store ptr %621, ptr %623, align 8
  br label %1484

624:                                              ; preds = %570, %565
  %625 = load ptr, ptr %6, align 8
  %626 = getelementptr inbounds %struct.CalcLangVal, ptr %625, i32 0, i32 0
  %627 = load i32, ptr %626, align 8
  %628 = icmp eq i32 %627, 1
  br i1 %628, label %629, label %683

629:                                              ; preds = %624
  %630 = load ptr, ptr %8, align 8
  %631 = getelementptr inbounds %struct.CalcLangVal, ptr %630, i32 0, i32 0
  %632 = load i32, ptr %631, align 8
  %633 = icmp eq i32 %632, 7
  br i1 %633, label %634, label %683

634:                                              ; preds = %629
  %635 = load ptr, ptr %8, align 8
  %636 = getelementptr inbounds %struct.CalcLangVal, ptr %635, i32 0, i32 1
  %637 = load ptr, ptr %636, align 8
  store ptr %637, ptr %24, align 8
  %638 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %638, ptr %25, align 8
  %639 = load ptr, ptr %24, align 8
  %640 = getelementptr inbounds %struct.TupleValue, ptr %639, i32 0, i32 0
  %641 = load i32, ptr %640, align 8
  %642 = load ptr, ptr %25, align 8
  %643 = getelementptr inbounds %struct.TupleValue, ptr %642, i32 0, i32 0
  store i32 %641, ptr %643, align 8
  %644 = load ptr, ptr %25, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 0
  %646 = load i32, ptr %645, align 8
  %647 = sext i32 %646 to i64
  %648 = mul i64 8, %647
  %649 = call noalias ptr @malloc(i64 noundef %648) #5
  %650 = load ptr, ptr %25, align 8
  %651 = getelementptr inbounds %struct.TupleValue, ptr %650, i32 0, i32 1
  store ptr %649, ptr %651, align 8
  store i32 0, ptr %26, align 4
  br label %652

652:                                              ; preds = %674, %634
  %653 = load i32, ptr %26, align 4
  %654 = load ptr, ptr %24, align 8
  %655 = getelementptr inbounds %struct.TupleValue, ptr %654, i32 0, i32 0
  %656 = load i32, ptr %655, align 8
  %657 = icmp slt i32 %653, %656
  br i1 %657, label %658, label %677

658:                                              ; preds = %652
  %659 = load ptr, ptr %6, align 8
  %660 = load ptr, ptr %24, align 8
  %661 = getelementptr inbounds %struct.TupleValue, ptr %660, i32 0, i32 1
  %662 = load ptr, ptr %661, align 8
  %663 = load i32, ptr %26, align 4
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds ptr, ptr %662, i64 %664
  %666 = load ptr, ptr %665, align 8
  %667 = call ptr @powCalcLangValues(ptr noundef %659, i32 noundef 0, ptr noundef %666, i32 noundef 1)
  %668 = load ptr, ptr %25, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  %670 = load ptr, ptr %669, align 8
  %671 = load i32, ptr %26, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds ptr, ptr %670, i64 %672
  store ptr %667, ptr %673, align 8
  br label %674

674:                                              ; preds = %658
  %675 = load i32, ptr %26, align 4
  %676 = add nsw i32 %675, 1
  store i32 %676, ptr %26, align 4
  br label %652, !llvm.loop !83

677:                                              ; preds = %652
  %678 = load ptr, ptr %10, align 8
  %679 = getelementptr inbounds %struct.CalcLangVal, ptr %678, i32 0, i32 0
  store i32 7, ptr %679, align 8
  %680 = load ptr, ptr %25, align 8
  %681 = load ptr, ptr %10, align 8
  %682 = getelementptr inbounds %struct.CalcLangVal, ptr %681, i32 0, i32 1
  store ptr %680, ptr %682, align 8
  br label %1483

683:                                              ; preds = %629, %624
  %684 = load ptr, ptr %6, align 8
  %685 = getelementptr inbounds %struct.CalcLangVal, ptr %684, i32 0, i32 0
  %686 = load i32, ptr %685, align 8
  %687 = icmp eq i32 %686, 7
  br i1 %687, label %688, label %742

688:                                              ; preds = %683
  %689 = load ptr, ptr %8, align 8
  %690 = getelementptr inbounds %struct.CalcLangVal, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = icmp eq i32 %691, 3
  br i1 %692, label %693, label %742

693:                                              ; preds = %688
  %694 = load ptr, ptr %6, align 8
  %695 = getelementptr inbounds %struct.CalcLangVal, ptr %694, i32 0, i32 1
  %696 = load ptr, ptr %695, align 8
  store ptr %696, ptr %27, align 8
  %697 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %697, ptr %28, align 8
  %698 = load ptr, ptr %27, align 8
  %699 = getelementptr inbounds %struct.TupleValue, ptr %698, i32 0, i32 0
  %700 = load i32, ptr %699, align 8
  %701 = load ptr, ptr %28, align 8
  %702 = getelementptr inbounds %struct.TupleValue, ptr %701, i32 0, i32 0
  store i32 %700, ptr %702, align 8
  %703 = load ptr, ptr %28, align 8
  %704 = getelementptr inbounds %struct.TupleValue, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = sext i32 %705 to i64
  %707 = mul i64 8, %706
  %708 = call noalias ptr @malloc(i64 noundef %707) #5
  %709 = load ptr, ptr %28, align 8
  %710 = getelementptr inbounds %struct.TupleValue, ptr %709, i32 0, i32 1
  store ptr %708, ptr %710, align 8
  store i32 0, ptr %29, align 4
  br label %711

711:                                              ; preds = %733, %693
  %712 = load i32, ptr %29, align 4
  %713 = load ptr, ptr %27, align 8
  %714 = getelementptr inbounds %struct.TupleValue, ptr %713, i32 0, i32 0
  %715 = load i32, ptr %714, align 8
  %716 = icmp slt i32 %712, %715
  br i1 %716, label %717, label %736

717:                                              ; preds = %711
  %718 = load ptr, ptr %27, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 1
  %720 = load ptr, ptr %719, align 8
  %721 = load i32, ptr %29, align 4
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds ptr, ptr %720, i64 %722
  %724 = load ptr, ptr %723, align 8
  %725 = load ptr, ptr %8, align 8
  %726 = call ptr @powCalcLangValues(ptr noundef %724, i32 noundef 1, ptr noundef %725, i32 noundef 0)
  %727 = load ptr, ptr %28, align 8
  %728 = getelementptr inbounds %struct.TupleValue, ptr %727, i32 0, i32 1
  %729 = load ptr, ptr %728, align 8
  %730 = load i32, ptr %29, align 4
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds ptr, ptr %729, i64 %731
  store ptr %726, ptr %732, align 8
  br label %733

733:                                              ; preds = %717
  %734 = load i32, ptr %29, align 4
  %735 = add nsw i32 %734, 1
  store i32 %735, ptr %29, align 4
  br label %711, !llvm.loop !84

736:                                              ; preds = %711
  %737 = load ptr, ptr %10, align 8
  %738 = getelementptr inbounds %struct.CalcLangVal, ptr %737, i32 0, i32 0
  store i32 7, ptr %738, align 8
  %739 = load ptr, ptr %28, align 8
  %740 = load ptr, ptr %10, align 8
  %741 = getelementptr inbounds %struct.CalcLangVal, ptr %740, i32 0, i32 1
  store ptr %739, ptr %741, align 8
  br label %1482

742:                                              ; preds = %688, %683
  %743 = load ptr, ptr %6, align 8
  %744 = getelementptr inbounds %struct.CalcLangVal, ptr %743, i32 0, i32 0
  %745 = load i32, ptr %744, align 8
  %746 = icmp eq i32 %745, 3
  br i1 %746, label %747, label %801

747:                                              ; preds = %742
  %748 = load ptr, ptr %8, align 8
  %749 = getelementptr inbounds %struct.CalcLangVal, ptr %748, i32 0, i32 0
  %750 = load i32, ptr %749, align 8
  %751 = icmp eq i32 %750, 7
  br i1 %751, label %752, label %801

752:                                              ; preds = %747
  %753 = load ptr, ptr %8, align 8
  %754 = getelementptr inbounds %struct.CalcLangVal, ptr %753, i32 0, i32 1
  %755 = load ptr, ptr %754, align 8
  store ptr %755, ptr %30, align 8
  %756 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %756, ptr %31, align 8
  %757 = load ptr, ptr %30, align 8
  %758 = getelementptr inbounds %struct.TupleValue, ptr %757, i32 0, i32 0
  %759 = load i32, ptr %758, align 8
  %760 = load ptr, ptr %31, align 8
  %761 = getelementptr inbounds %struct.TupleValue, ptr %760, i32 0, i32 0
  store i32 %759, ptr %761, align 8
  %762 = load ptr, ptr %31, align 8
  %763 = getelementptr inbounds %struct.TupleValue, ptr %762, i32 0, i32 0
  %764 = load i32, ptr %763, align 8
  %765 = sext i32 %764 to i64
  %766 = mul i64 8, %765
  %767 = call noalias ptr @malloc(i64 noundef %766) #5
  %768 = load ptr, ptr %31, align 8
  %769 = getelementptr inbounds %struct.TupleValue, ptr %768, i32 0, i32 1
  store ptr %767, ptr %769, align 8
  store i32 0, ptr %32, align 4
  br label %770

770:                                              ; preds = %792, %752
  %771 = load i32, ptr %32, align 4
  %772 = load ptr, ptr %30, align 8
  %773 = getelementptr inbounds %struct.TupleValue, ptr %772, i32 0, i32 0
  %774 = load i32, ptr %773, align 8
  %775 = icmp slt i32 %771, %774
  br i1 %775, label %776, label %795

776:                                              ; preds = %770
  %777 = load ptr, ptr %6, align 8
  %778 = load ptr, ptr %30, align 8
  %779 = getelementptr inbounds %struct.TupleValue, ptr %778, i32 0, i32 1
  %780 = load ptr, ptr %779, align 8
  %781 = load i32, ptr %32, align 4
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds ptr, ptr %780, i64 %782
  %784 = load ptr, ptr %783, align 8
  %785 = call ptr @powCalcLangValues(ptr noundef %777, i32 noundef 0, ptr noundef %784, i32 noundef 1)
  %786 = load ptr, ptr %31, align 8
  %787 = getelementptr inbounds %struct.TupleValue, ptr %786, i32 0, i32 1
  %788 = load ptr, ptr %787, align 8
  %789 = load i32, ptr %32, align 4
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds ptr, ptr %788, i64 %790
  store ptr %785, ptr %791, align 8
  br label %792

792:                                              ; preds = %776
  %793 = load i32, ptr %32, align 4
  %794 = add nsw i32 %793, 1
  store i32 %794, ptr %32, align 4
  br label %770, !llvm.loop !85

795:                                              ; preds = %770
  %796 = load ptr, ptr %10, align 8
  %797 = getelementptr inbounds %struct.CalcLangVal, ptr %796, i32 0, i32 0
  store i32 7, ptr %797, align 8
  %798 = load ptr, ptr %31, align 8
  %799 = load ptr, ptr %10, align 8
  %800 = getelementptr inbounds %struct.CalcLangVal, ptr %799, i32 0, i32 1
  store ptr %798, ptr %800, align 8
  br label %1481

801:                                              ; preds = %747, %742
  %802 = load ptr, ptr %6, align 8
  %803 = getelementptr inbounds %struct.CalcLangVal, ptr %802, i32 0, i32 0
  %804 = load i32, ptr %803, align 8
  %805 = icmp eq i32 %804, 7
  br i1 %805, label %806, label %860

806:                                              ; preds = %801
  %807 = load ptr, ptr %8, align 8
  %808 = getelementptr inbounds %struct.CalcLangVal, ptr %807, i32 0, i32 0
  %809 = load i32, ptr %808, align 8
  %810 = icmp eq i32 %809, 4
  br i1 %810, label %811, label %860

811:                                              ; preds = %806
  %812 = load ptr, ptr %6, align 8
  %813 = getelementptr inbounds %struct.CalcLangVal, ptr %812, i32 0, i32 1
  %814 = load ptr, ptr %813, align 8
  store ptr %814, ptr %33, align 8
  %815 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %815, ptr %34, align 8
  %816 = load ptr, ptr %33, align 8
  %817 = getelementptr inbounds %struct.TupleValue, ptr %816, i32 0, i32 0
  %818 = load i32, ptr %817, align 8
  %819 = load ptr, ptr %34, align 8
  %820 = getelementptr inbounds %struct.TupleValue, ptr %819, i32 0, i32 0
  store i32 %818, ptr %820, align 8
  %821 = load ptr, ptr %34, align 8
  %822 = getelementptr inbounds %struct.TupleValue, ptr %821, i32 0, i32 0
  %823 = load i32, ptr %822, align 8
  %824 = sext i32 %823 to i64
  %825 = mul i64 8, %824
  %826 = call noalias ptr @malloc(i64 noundef %825) #5
  %827 = load ptr, ptr %34, align 8
  %828 = getelementptr inbounds %struct.TupleValue, ptr %827, i32 0, i32 1
  store ptr %826, ptr %828, align 8
  store i32 0, ptr %35, align 4
  br label %829

829:                                              ; preds = %851, %811
  %830 = load i32, ptr %35, align 4
  %831 = load ptr, ptr %33, align 8
  %832 = getelementptr inbounds %struct.TupleValue, ptr %831, i32 0, i32 0
  %833 = load i32, ptr %832, align 8
  %834 = icmp slt i32 %830, %833
  br i1 %834, label %835, label %854

835:                                              ; preds = %829
  %836 = load ptr, ptr %33, align 8
  %837 = getelementptr inbounds %struct.TupleValue, ptr %836, i32 0, i32 1
  %838 = load ptr, ptr %837, align 8
  %839 = load i32, ptr %35, align 4
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds ptr, ptr %838, i64 %840
  %842 = load ptr, ptr %841, align 8
  %843 = load ptr, ptr %8, align 8
  %844 = call ptr @powCalcLangValues(ptr noundef %842, i32 noundef 1, ptr noundef %843, i32 noundef 0)
  %845 = load ptr, ptr %34, align 8
  %846 = getelementptr inbounds %struct.TupleValue, ptr %845, i32 0, i32 1
  %847 = load ptr, ptr %846, align 8
  %848 = load i32, ptr %35, align 4
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds ptr, ptr %847, i64 %849
  store ptr %844, ptr %850, align 8
  br label %851

851:                                              ; preds = %835
  %852 = load i32, ptr %35, align 4
  %853 = add nsw i32 %852, 1
  store i32 %853, ptr %35, align 4
  br label %829, !llvm.loop !86

854:                                              ; preds = %829
  %855 = load ptr, ptr %10, align 8
  %856 = getelementptr inbounds %struct.CalcLangVal, ptr %855, i32 0, i32 0
  store i32 7, ptr %856, align 8
  %857 = load ptr, ptr %34, align 8
  %858 = load ptr, ptr %10, align 8
  %859 = getelementptr inbounds %struct.CalcLangVal, ptr %858, i32 0, i32 1
  store ptr %857, ptr %859, align 8
  br label %1480

860:                                              ; preds = %806, %801
  %861 = load ptr, ptr %6, align 8
  %862 = getelementptr inbounds %struct.CalcLangVal, ptr %861, i32 0, i32 0
  %863 = load i32, ptr %862, align 8
  %864 = icmp eq i32 %863, 4
  br i1 %864, label %865, label %919

865:                                              ; preds = %860
  %866 = load ptr, ptr %8, align 8
  %867 = getelementptr inbounds %struct.CalcLangVal, ptr %866, i32 0, i32 0
  %868 = load i32, ptr %867, align 8
  %869 = icmp eq i32 %868, 7
  br i1 %869, label %870, label %919

870:                                              ; preds = %865
  %871 = load ptr, ptr %8, align 8
  %872 = getelementptr inbounds %struct.CalcLangVal, ptr %871, i32 0, i32 1
  %873 = load ptr, ptr %872, align 8
  store ptr %873, ptr %36, align 8
  %874 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %874, ptr %37, align 8
  %875 = load ptr, ptr %36, align 8
  %876 = getelementptr inbounds %struct.TupleValue, ptr %875, i32 0, i32 0
  %877 = load i32, ptr %876, align 8
  %878 = load ptr, ptr %37, align 8
  %879 = getelementptr inbounds %struct.TupleValue, ptr %878, i32 0, i32 0
  store i32 %877, ptr %879, align 8
  %880 = load ptr, ptr %37, align 8
  %881 = getelementptr inbounds %struct.TupleValue, ptr %880, i32 0, i32 0
  %882 = load i32, ptr %881, align 8
  %883 = sext i32 %882 to i64
  %884 = mul i64 8, %883
  %885 = call noalias ptr @malloc(i64 noundef %884) #5
  %886 = load ptr, ptr %37, align 8
  %887 = getelementptr inbounds %struct.TupleValue, ptr %886, i32 0, i32 1
  store ptr %885, ptr %887, align 8
  store i32 0, ptr %38, align 4
  br label %888

888:                                              ; preds = %910, %870
  %889 = load i32, ptr %38, align 4
  %890 = load ptr, ptr %36, align 8
  %891 = getelementptr inbounds %struct.TupleValue, ptr %890, i32 0, i32 0
  %892 = load i32, ptr %891, align 8
  %893 = icmp slt i32 %889, %892
  br i1 %893, label %894, label %913

894:                                              ; preds = %888
  %895 = load ptr, ptr %6, align 8
  %896 = load ptr, ptr %36, align 8
  %897 = getelementptr inbounds %struct.TupleValue, ptr %896, i32 0, i32 1
  %898 = load ptr, ptr %897, align 8
  %899 = load i32, ptr %38, align 4
  %900 = sext i32 %899 to i64
  %901 = getelementptr inbounds ptr, ptr %898, i64 %900
  %902 = load ptr, ptr %901, align 8
  %903 = call ptr @powCalcLangValues(ptr noundef %895, i32 noundef 0, ptr noundef %902, i32 noundef 1)
  %904 = load ptr, ptr %37, align 8
  %905 = getelementptr inbounds %struct.TupleValue, ptr %904, i32 0, i32 1
  %906 = load ptr, ptr %905, align 8
  %907 = load i32, ptr %38, align 4
  %908 = sext i32 %907 to i64
  %909 = getelementptr inbounds ptr, ptr %906, i64 %908
  store ptr %903, ptr %909, align 8
  br label %910

910:                                              ; preds = %894
  %911 = load i32, ptr %38, align 4
  %912 = add nsw i32 %911, 1
  store i32 %912, ptr %38, align 4
  br label %888, !llvm.loop !87

913:                                              ; preds = %888
  %914 = load ptr, ptr %10, align 8
  %915 = getelementptr inbounds %struct.CalcLangVal, ptr %914, i32 0, i32 0
  store i32 7, ptr %915, align 8
  %916 = load ptr, ptr %37, align 8
  %917 = load ptr, ptr %10, align 8
  %918 = getelementptr inbounds %struct.CalcLangVal, ptr %917, i32 0, i32 1
  store ptr %916, ptr %918, align 8
  br label %1479

919:                                              ; preds = %865, %860
  %920 = load ptr, ptr %6, align 8
  %921 = getelementptr inbounds %struct.CalcLangVal, ptr %920, i32 0, i32 0
  %922 = load i32, ptr %921, align 8
  %923 = icmp eq i32 %922, 6
  br i1 %923, label %924, label %997

924:                                              ; preds = %919
  %925 = load ptr, ptr %8, align 8
  %926 = getelementptr inbounds %struct.CalcLangVal, ptr %925, i32 0, i32 0
  %927 = load i32, ptr %926, align 8
  %928 = icmp eq i32 %927, 6
  br i1 %928, label %929, label %997

929:                                              ; preds = %924
  %930 = load ptr, ptr %6, align 8
  %931 = getelementptr inbounds %struct.CalcLangVal, ptr %930, i32 0, i32 1
  %932 = load ptr, ptr %931, align 8
  store ptr %932, ptr %39, align 8
  %933 = load ptr, ptr %8, align 8
  %934 = getelementptr inbounds %struct.CalcLangVal, ptr %933, i32 0, i32 1
  %935 = load ptr, ptr %934, align 8
  store ptr %935, ptr %40, align 8
  %936 = load ptr, ptr %40, align 8
  %937 = getelementptr inbounds %struct.SetValue, ptr %936, i32 0, i32 0
  %938 = load i32, ptr %937, align 8
  %939 = load ptr, ptr %39, align 8
  %940 = getelementptr inbounds %struct.SetValue, ptr %939, i32 0, i32 0
  %941 = load i32, ptr %940, align 8
  %942 = icmp eq i32 %938, %941
  br i1 %942, label %943, label %995

943:                                              ; preds = %929
  %944 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %944, ptr %41, align 8
  %945 = load ptr, ptr %39, align 8
  %946 = getelementptr inbounds %struct.SetValue, ptr %945, i32 0, i32 0
  %947 = load i32, ptr %946, align 8
  %948 = load ptr, ptr %41, align 8
  %949 = getelementptr inbounds %struct.SetValue, ptr %948, i32 0, i32 0
  store i32 %947, ptr %949, align 8
  %950 = load ptr, ptr %41, align 8
  %951 = getelementptr inbounds %struct.SetValue, ptr %950, i32 0, i32 0
  %952 = load i32, ptr %951, align 8
  %953 = sext i32 %952 to i64
  %954 = mul i64 8, %953
  %955 = call noalias ptr @malloc(i64 noundef %954) #5
  %956 = load ptr, ptr %41, align 8
  %957 = getelementptr inbounds %struct.SetValue, ptr %956, i32 0, i32 1
  store ptr %955, ptr %957, align 8
  store i32 0, ptr %42, align 4
  br label %958

958:                                              ; preds = %986, %943
  %959 = load i32, ptr %42, align 4
  %960 = load ptr, ptr %39, align 8
  %961 = getelementptr inbounds %struct.SetValue, ptr %960, i32 0, i32 0
  %962 = load i32, ptr %961, align 8
  %963 = icmp slt i32 %959, %962
  br i1 %963, label %964, label %989

964:                                              ; preds = %958
  %965 = load ptr, ptr %39, align 8
  %966 = getelementptr inbounds %struct.SetValue, ptr %965, i32 0, i32 1
  %967 = load ptr, ptr %966, align 8
  %968 = load i32, ptr %42, align 4
  %969 = sext i32 %968 to i64
  %970 = getelementptr inbounds ptr, ptr %967, i64 %969
  %971 = load ptr, ptr %970, align 8
  %972 = load ptr, ptr %40, align 8
  %973 = getelementptr inbounds %struct.SetValue, ptr %972, i32 0, i32 1
  %974 = load ptr, ptr %973, align 8
  %975 = load i32, ptr %42, align 4
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds ptr, ptr %974, i64 %976
  %978 = load ptr, ptr %977, align 8
  %979 = call ptr @powCalcLangValues(ptr noundef %971, i32 noundef 1, ptr noundef %978, i32 noundef 1)
  %980 = load ptr, ptr %41, align 8
  %981 = getelementptr inbounds %struct.SetValue, ptr %980, i32 0, i32 1
  %982 = load ptr, ptr %981, align 8
  %983 = load i32, ptr %42, align 4
  %984 = sext i32 %983 to i64
  %985 = getelementptr inbounds ptr, ptr %982, i64 %984
  store ptr %979, ptr %985, align 8
  br label %986

986:                                              ; preds = %964
  %987 = load i32, ptr %42, align 4
  %988 = add nsw i32 %987, 1
  store i32 %988, ptr %42, align 4
  br label %958, !llvm.loop !88

989:                                              ; preds = %958
  %990 = load ptr, ptr %10, align 8
  %991 = getelementptr inbounds %struct.CalcLangVal, ptr %990, i32 0, i32 0
  store i32 6, ptr %991, align 8
  %992 = load ptr, ptr %41, align 8
  %993 = load ptr, ptr %10, align 8
  %994 = getelementptr inbounds %struct.CalcLangVal, ptr %993, i32 0, i32 1
  store ptr %992, ptr %994, align 8
  br label %996

995:                                              ; preds = %929
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %1513

996:                                              ; preds = %989
  br label %1478

997:                                              ; preds = %924, %919
  %998 = load ptr, ptr %6, align 8
  %999 = getelementptr inbounds %struct.CalcLangVal, ptr %998, i32 0, i32 0
  %1000 = load i32, ptr %999, align 8
  %1001 = icmp eq i32 %1000, 6
  br i1 %1001, label %1002, label %1056

1002:                                             ; preds = %997
  %1003 = load ptr, ptr %8, align 8
  %1004 = getelementptr inbounds %struct.CalcLangVal, ptr %1003, i32 0, i32 0
  %1005 = load i32, ptr %1004, align 8
  %1006 = icmp eq i32 %1005, 0
  br i1 %1006, label %1007, label %1056

1007:                                             ; preds = %1002
  %1008 = load ptr, ptr %6, align 8
  %1009 = getelementptr inbounds %struct.CalcLangVal, ptr %1008, i32 0, i32 1
  %1010 = load ptr, ptr %1009, align 8
  store ptr %1010, ptr %43, align 8
  %1011 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1011, ptr %44, align 8
  %1012 = load ptr, ptr %43, align 8
  %1013 = getelementptr inbounds %struct.SetValue, ptr %1012, i32 0, i32 0
  %1014 = load i32, ptr %1013, align 8
  %1015 = load ptr, ptr %44, align 8
  %1016 = getelementptr inbounds %struct.SetValue, ptr %1015, i32 0, i32 0
  store i32 %1014, ptr %1016, align 8
  %1017 = load ptr, ptr %44, align 8
  %1018 = getelementptr inbounds %struct.SetValue, ptr %1017, i32 0, i32 0
  %1019 = load i32, ptr %1018, align 8
  %1020 = sext i32 %1019 to i64
  %1021 = mul i64 8, %1020
  %1022 = call noalias ptr @malloc(i64 noundef %1021) #5
  %1023 = load ptr, ptr %44, align 8
  %1024 = getelementptr inbounds %struct.SetValue, ptr %1023, i32 0, i32 1
  store ptr %1022, ptr %1024, align 8
  store i32 0, ptr %45, align 4
  br label %1025

1025:                                             ; preds = %1047, %1007
  %1026 = load i32, ptr %45, align 4
  %1027 = load ptr, ptr %43, align 8
  %1028 = getelementptr inbounds %struct.SetValue, ptr %1027, i32 0, i32 0
  %1029 = load i32, ptr %1028, align 8
  %1030 = icmp slt i32 %1026, %1029
  br i1 %1030, label %1031, label %1050

1031:                                             ; preds = %1025
  %1032 = load ptr, ptr %43, align 8
  %1033 = getelementptr inbounds %struct.SetValue, ptr %1032, i32 0, i32 1
  %1034 = load ptr, ptr %1033, align 8
  %1035 = load i32, ptr %45, align 4
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds ptr, ptr %1034, i64 %1036
  %1038 = load ptr, ptr %1037, align 8
  %1039 = load ptr, ptr %8, align 8
  %1040 = call ptr @powCalcLangValues(ptr noundef %1038, i32 noundef 1, ptr noundef %1039, i32 noundef 0)
  %1041 = load ptr, ptr %44, align 8
  %1042 = getelementptr inbounds %struct.SetValue, ptr %1041, i32 0, i32 1
  %1043 = load ptr, ptr %1042, align 8
  %1044 = load i32, ptr %45, align 4
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds ptr, ptr %1043, i64 %1045
  store ptr %1040, ptr %1046, align 8
  br label %1047

1047:                                             ; preds = %1031
  %1048 = load i32, ptr %45, align 4
  %1049 = add nsw i32 %1048, 1
  store i32 %1049, ptr %45, align 4
  br label %1025, !llvm.loop !89

1050:                                             ; preds = %1025
  %1051 = load ptr, ptr %10, align 8
  %1052 = getelementptr inbounds %struct.CalcLangVal, ptr %1051, i32 0, i32 0
  store i32 6, ptr %1052, align 8
  %1053 = load ptr, ptr %44, align 8
  %1054 = load ptr, ptr %10, align 8
  %1055 = getelementptr inbounds %struct.CalcLangVal, ptr %1054, i32 0, i32 1
  store ptr %1053, ptr %1055, align 8
  br label %1477

1056:                                             ; preds = %1002, %997
  %1057 = load ptr, ptr %6, align 8
  %1058 = getelementptr inbounds %struct.CalcLangVal, ptr %1057, i32 0, i32 0
  %1059 = load i32, ptr %1058, align 8
  %1060 = icmp eq i32 %1059, 0
  br i1 %1060, label %1061, label %1115

1061:                                             ; preds = %1056
  %1062 = load ptr, ptr %8, align 8
  %1063 = getelementptr inbounds %struct.CalcLangVal, ptr %1062, i32 0, i32 0
  %1064 = load i32, ptr %1063, align 8
  %1065 = icmp eq i32 %1064, 6
  br i1 %1065, label %1066, label %1115

1066:                                             ; preds = %1061
  %1067 = load ptr, ptr %8, align 8
  %1068 = getelementptr inbounds %struct.CalcLangVal, ptr %1067, i32 0, i32 1
  %1069 = load ptr, ptr %1068, align 8
  store ptr %1069, ptr %46, align 8
  %1070 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1070, ptr %47, align 8
  %1071 = load ptr, ptr %46, align 8
  %1072 = getelementptr inbounds %struct.SetValue, ptr %1071, i32 0, i32 0
  %1073 = load i32, ptr %1072, align 8
  %1074 = load ptr, ptr %47, align 8
  %1075 = getelementptr inbounds %struct.SetValue, ptr %1074, i32 0, i32 0
  store i32 %1073, ptr %1075, align 8
  %1076 = load ptr, ptr %47, align 8
  %1077 = getelementptr inbounds %struct.SetValue, ptr %1076, i32 0, i32 0
  %1078 = load i32, ptr %1077, align 8
  %1079 = sext i32 %1078 to i64
  %1080 = mul i64 8, %1079
  %1081 = call noalias ptr @malloc(i64 noundef %1080) #5
  %1082 = load ptr, ptr %47, align 8
  %1083 = getelementptr inbounds %struct.SetValue, ptr %1082, i32 0, i32 1
  store ptr %1081, ptr %1083, align 8
  store i32 0, ptr %48, align 4
  br label %1084

1084:                                             ; preds = %1106, %1066
  %1085 = load i32, ptr %48, align 4
  %1086 = load ptr, ptr %46, align 8
  %1087 = getelementptr inbounds %struct.SetValue, ptr %1086, i32 0, i32 0
  %1088 = load i32, ptr %1087, align 8
  %1089 = icmp slt i32 %1085, %1088
  br i1 %1089, label %1090, label %1109

1090:                                             ; preds = %1084
  %1091 = load ptr, ptr %6, align 8
  %1092 = load ptr, ptr %46, align 8
  %1093 = getelementptr inbounds %struct.SetValue, ptr %1092, i32 0, i32 1
  %1094 = load ptr, ptr %1093, align 8
  %1095 = load i32, ptr %48, align 4
  %1096 = sext i32 %1095 to i64
  %1097 = getelementptr inbounds ptr, ptr %1094, i64 %1096
  %1098 = load ptr, ptr %1097, align 8
  %1099 = call ptr @powCalcLangValues(ptr noundef %1091, i32 noundef 0, ptr noundef %1098, i32 noundef 1)
  %1100 = load ptr, ptr %47, align 8
  %1101 = getelementptr inbounds %struct.SetValue, ptr %1100, i32 0, i32 1
  %1102 = load ptr, ptr %1101, align 8
  %1103 = load i32, ptr %48, align 4
  %1104 = sext i32 %1103 to i64
  %1105 = getelementptr inbounds ptr, ptr %1102, i64 %1104
  store ptr %1099, ptr %1105, align 8
  br label %1106

1106:                                             ; preds = %1090
  %1107 = load i32, ptr %48, align 4
  %1108 = add nsw i32 %1107, 1
  store i32 %1108, ptr %48, align 4
  br label %1084, !llvm.loop !90

1109:                                             ; preds = %1084
  %1110 = load ptr, ptr %10, align 8
  %1111 = getelementptr inbounds %struct.CalcLangVal, ptr %1110, i32 0, i32 0
  store i32 6, ptr %1111, align 8
  %1112 = load ptr, ptr %47, align 8
  %1113 = load ptr, ptr %10, align 8
  %1114 = getelementptr inbounds %struct.CalcLangVal, ptr %1113, i32 0, i32 1
  store ptr %1112, ptr %1114, align 8
  br label %1476

1115:                                             ; preds = %1061, %1056
  %1116 = load ptr, ptr %6, align 8
  %1117 = getelementptr inbounds %struct.CalcLangVal, ptr %1116, i32 0, i32 0
  %1118 = load i32, ptr %1117, align 8
  %1119 = icmp eq i32 %1118, 6
  br i1 %1119, label %1120, label %1174

1120:                                             ; preds = %1115
  %1121 = load ptr, ptr %8, align 8
  %1122 = getelementptr inbounds %struct.CalcLangVal, ptr %1121, i32 0, i32 0
  %1123 = load i32, ptr %1122, align 8
  %1124 = icmp eq i32 %1123, 1
  br i1 %1124, label %1125, label %1174

1125:                                             ; preds = %1120
  %1126 = load ptr, ptr %6, align 8
  %1127 = getelementptr inbounds %struct.CalcLangVal, ptr %1126, i32 0, i32 1
  %1128 = load ptr, ptr %1127, align 8
  store ptr %1128, ptr %49, align 8
  %1129 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1129, ptr %50, align 8
  %1130 = load ptr, ptr %49, align 8
  %1131 = getelementptr inbounds %struct.SetValue, ptr %1130, i32 0, i32 0
  %1132 = load i32, ptr %1131, align 8
  %1133 = load ptr, ptr %50, align 8
  %1134 = getelementptr inbounds %struct.SetValue, ptr %1133, i32 0, i32 0
  store i32 %1132, ptr %1134, align 8
  %1135 = load ptr, ptr %50, align 8
  %1136 = getelementptr inbounds %struct.SetValue, ptr %1135, i32 0, i32 0
  %1137 = load i32, ptr %1136, align 8
  %1138 = sext i32 %1137 to i64
  %1139 = mul i64 8, %1138
  %1140 = call noalias ptr @malloc(i64 noundef %1139) #5
  %1141 = load ptr, ptr %50, align 8
  %1142 = getelementptr inbounds %struct.SetValue, ptr %1141, i32 0, i32 1
  store ptr %1140, ptr %1142, align 8
  store i32 0, ptr %51, align 4
  br label %1143

1143:                                             ; preds = %1165, %1125
  %1144 = load i32, ptr %51, align 4
  %1145 = load ptr, ptr %49, align 8
  %1146 = getelementptr inbounds %struct.SetValue, ptr %1145, i32 0, i32 0
  %1147 = load i32, ptr %1146, align 8
  %1148 = icmp slt i32 %1144, %1147
  br i1 %1148, label %1149, label %1168

1149:                                             ; preds = %1143
  %1150 = load ptr, ptr %49, align 8
  %1151 = getelementptr inbounds %struct.SetValue, ptr %1150, i32 0, i32 1
  %1152 = load ptr, ptr %1151, align 8
  %1153 = load i32, ptr %51, align 4
  %1154 = sext i32 %1153 to i64
  %1155 = getelementptr inbounds ptr, ptr %1152, i64 %1154
  %1156 = load ptr, ptr %1155, align 8
  %1157 = load ptr, ptr %8, align 8
  %1158 = call ptr @powCalcLangValues(ptr noundef %1156, i32 noundef 1, ptr noundef %1157, i32 noundef 0)
  %1159 = load ptr, ptr %50, align 8
  %1160 = getelementptr inbounds %struct.SetValue, ptr %1159, i32 0, i32 1
  %1161 = load ptr, ptr %1160, align 8
  %1162 = load i32, ptr %51, align 4
  %1163 = sext i32 %1162 to i64
  %1164 = getelementptr inbounds ptr, ptr %1161, i64 %1163
  store ptr %1158, ptr %1164, align 8
  br label %1165

1165:                                             ; preds = %1149
  %1166 = load i32, ptr %51, align 4
  %1167 = add nsw i32 %1166, 1
  store i32 %1167, ptr %51, align 4
  br label %1143, !llvm.loop !91

1168:                                             ; preds = %1143
  %1169 = load ptr, ptr %10, align 8
  %1170 = getelementptr inbounds %struct.CalcLangVal, ptr %1169, i32 0, i32 0
  store i32 7, ptr %1170, align 8
  %1171 = load ptr, ptr %50, align 8
  %1172 = load ptr, ptr %10, align 8
  %1173 = getelementptr inbounds %struct.CalcLangVal, ptr %1172, i32 0, i32 1
  store ptr %1171, ptr %1173, align 8
  br label %1475

1174:                                             ; preds = %1120, %1115
  %1175 = load ptr, ptr %6, align 8
  %1176 = getelementptr inbounds %struct.CalcLangVal, ptr %1175, i32 0, i32 0
  %1177 = load i32, ptr %1176, align 8
  %1178 = icmp eq i32 %1177, 1
  br i1 %1178, label %1179, label %1233

1179:                                             ; preds = %1174
  %1180 = load ptr, ptr %8, align 8
  %1181 = getelementptr inbounds %struct.CalcLangVal, ptr %1180, i32 0, i32 0
  %1182 = load i32, ptr %1181, align 8
  %1183 = icmp eq i32 %1182, 6
  br i1 %1183, label %1184, label %1233

1184:                                             ; preds = %1179
  %1185 = load ptr, ptr %8, align 8
  %1186 = getelementptr inbounds %struct.CalcLangVal, ptr %1185, i32 0, i32 1
  %1187 = load ptr, ptr %1186, align 8
  store ptr %1187, ptr %52, align 8
  %1188 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1188, ptr %53, align 8
  %1189 = load ptr, ptr %52, align 8
  %1190 = getelementptr inbounds %struct.SetValue, ptr %1189, i32 0, i32 0
  %1191 = load i32, ptr %1190, align 8
  %1192 = load ptr, ptr %53, align 8
  %1193 = getelementptr inbounds %struct.SetValue, ptr %1192, i32 0, i32 0
  store i32 %1191, ptr %1193, align 8
  %1194 = load ptr, ptr %53, align 8
  %1195 = getelementptr inbounds %struct.SetValue, ptr %1194, i32 0, i32 0
  %1196 = load i32, ptr %1195, align 8
  %1197 = sext i32 %1196 to i64
  %1198 = mul i64 8, %1197
  %1199 = call noalias ptr @malloc(i64 noundef %1198) #5
  %1200 = load ptr, ptr %53, align 8
  %1201 = getelementptr inbounds %struct.SetValue, ptr %1200, i32 0, i32 1
  store ptr %1199, ptr %1201, align 8
  store i32 0, ptr %54, align 4
  br label %1202

1202:                                             ; preds = %1224, %1184
  %1203 = load i32, ptr %54, align 4
  %1204 = load ptr, ptr %52, align 8
  %1205 = getelementptr inbounds %struct.SetValue, ptr %1204, i32 0, i32 0
  %1206 = load i32, ptr %1205, align 8
  %1207 = icmp slt i32 %1203, %1206
  br i1 %1207, label %1208, label %1227

1208:                                             ; preds = %1202
  %1209 = load ptr, ptr %6, align 8
  %1210 = load ptr, ptr %52, align 8
  %1211 = getelementptr inbounds %struct.SetValue, ptr %1210, i32 0, i32 1
  %1212 = load ptr, ptr %1211, align 8
  %1213 = load i32, ptr %54, align 4
  %1214 = sext i32 %1213 to i64
  %1215 = getelementptr inbounds ptr, ptr %1212, i64 %1214
  %1216 = load ptr, ptr %1215, align 8
  %1217 = call ptr @powCalcLangValues(ptr noundef %1209, i32 noundef 0, ptr noundef %1216, i32 noundef 1)
  %1218 = load ptr, ptr %53, align 8
  %1219 = getelementptr inbounds %struct.SetValue, ptr %1218, i32 0, i32 1
  %1220 = load ptr, ptr %1219, align 8
  %1221 = load i32, ptr %54, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = getelementptr inbounds ptr, ptr %1220, i64 %1222
  store ptr %1217, ptr %1223, align 8
  br label %1224

1224:                                             ; preds = %1208
  %1225 = load i32, ptr %54, align 4
  %1226 = add nsw i32 %1225, 1
  store i32 %1226, ptr %54, align 4
  br label %1202, !llvm.loop !92

1227:                                             ; preds = %1202
  %1228 = load ptr, ptr %10, align 8
  %1229 = getelementptr inbounds %struct.CalcLangVal, ptr %1228, i32 0, i32 0
  store i32 6, ptr %1229, align 8
  %1230 = load ptr, ptr %53, align 8
  %1231 = load ptr, ptr %10, align 8
  %1232 = getelementptr inbounds %struct.CalcLangVal, ptr %1231, i32 0, i32 1
  store ptr %1230, ptr %1232, align 8
  br label %1474

1233:                                             ; preds = %1179, %1174
  %1234 = load ptr, ptr %6, align 8
  %1235 = getelementptr inbounds %struct.CalcLangVal, ptr %1234, i32 0, i32 0
  %1236 = load i32, ptr %1235, align 8
  %1237 = icmp eq i32 %1236, 6
  br i1 %1237, label %1238, label %1292

1238:                                             ; preds = %1233
  %1239 = load ptr, ptr %8, align 8
  %1240 = getelementptr inbounds %struct.CalcLangVal, ptr %1239, i32 0, i32 0
  %1241 = load i32, ptr %1240, align 8
  %1242 = icmp eq i32 %1241, 3
  br i1 %1242, label %1243, label %1292

1243:                                             ; preds = %1238
  %1244 = load ptr, ptr %6, align 8
  %1245 = getelementptr inbounds %struct.CalcLangVal, ptr %1244, i32 0, i32 1
  %1246 = load ptr, ptr %1245, align 8
  store ptr %1246, ptr %55, align 8
  %1247 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1247, ptr %56, align 8
  %1248 = load ptr, ptr %55, align 8
  %1249 = getelementptr inbounds %struct.SetValue, ptr %1248, i32 0, i32 0
  %1250 = load i32, ptr %1249, align 8
  %1251 = load ptr, ptr %56, align 8
  %1252 = getelementptr inbounds %struct.SetValue, ptr %1251, i32 0, i32 0
  store i32 %1250, ptr %1252, align 8
  %1253 = load ptr, ptr %56, align 8
  %1254 = getelementptr inbounds %struct.SetValue, ptr %1253, i32 0, i32 0
  %1255 = load i32, ptr %1254, align 8
  %1256 = sext i32 %1255 to i64
  %1257 = mul i64 8, %1256
  %1258 = call noalias ptr @malloc(i64 noundef %1257) #5
  %1259 = load ptr, ptr %56, align 8
  %1260 = getelementptr inbounds %struct.SetValue, ptr %1259, i32 0, i32 1
  store ptr %1258, ptr %1260, align 8
  store i32 0, ptr %57, align 4
  br label %1261

1261:                                             ; preds = %1283, %1243
  %1262 = load i32, ptr %57, align 4
  %1263 = load ptr, ptr %55, align 8
  %1264 = getelementptr inbounds %struct.SetValue, ptr %1263, i32 0, i32 0
  %1265 = load i32, ptr %1264, align 8
  %1266 = icmp slt i32 %1262, %1265
  br i1 %1266, label %1267, label %1286

1267:                                             ; preds = %1261
  %1268 = load ptr, ptr %55, align 8
  %1269 = getelementptr inbounds %struct.SetValue, ptr %1268, i32 0, i32 1
  %1270 = load ptr, ptr %1269, align 8
  %1271 = load i32, ptr %57, align 4
  %1272 = sext i32 %1271 to i64
  %1273 = getelementptr inbounds ptr, ptr %1270, i64 %1272
  %1274 = load ptr, ptr %1273, align 8
  %1275 = load ptr, ptr %8, align 8
  %1276 = call ptr @powCalcLangValues(ptr noundef %1274, i32 noundef 1, ptr noundef %1275, i32 noundef 0)
  %1277 = load ptr, ptr %56, align 8
  %1278 = getelementptr inbounds %struct.SetValue, ptr %1277, i32 0, i32 1
  %1279 = load ptr, ptr %1278, align 8
  %1280 = load i32, ptr %57, align 4
  %1281 = sext i32 %1280 to i64
  %1282 = getelementptr inbounds ptr, ptr %1279, i64 %1281
  store ptr %1276, ptr %1282, align 8
  br label %1283

1283:                                             ; preds = %1267
  %1284 = load i32, ptr %57, align 4
  %1285 = add nsw i32 %1284, 1
  store i32 %1285, ptr %57, align 4
  br label %1261, !llvm.loop !93

1286:                                             ; preds = %1261
  %1287 = load ptr, ptr %10, align 8
  %1288 = getelementptr inbounds %struct.CalcLangVal, ptr %1287, i32 0, i32 0
  store i32 6, ptr %1288, align 8
  %1289 = load ptr, ptr %56, align 8
  %1290 = load ptr, ptr %10, align 8
  %1291 = getelementptr inbounds %struct.CalcLangVal, ptr %1290, i32 0, i32 1
  store ptr %1289, ptr %1291, align 8
  br label %1473

1292:                                             ; preds = %1238, %1233
  %1293 = load ptr, ptr %6, align 8
  %1294 = getelementptr inbounds %struct.CalcLangVal, ptr %1293, i32 0, i32 0
  %1295 = load i32, ptr %1294, align 8
  %1296 = icmp eq i32 %1295, 3
  br i1 %1296, label %1297, label %1351

1297:                                             ; preds = %1292
  %1298 = load ptr, ptr %8, align 8
  %1299 = getelementptr inbounds %struct.CalcLangVal, ptr %1298, i32 0, i32 0
  %1300 = load i32, ptr %1299, align 8
  %1301 = icmp eq i32 %1300, 6
  br i1 %1301, label %1302, label %1351

1302:                                             ; preds = %1297
  %1303 = load ptr, ptr %8, align 8
  %1304 = getelementptr inbounds %struct.CalcLangVal, ptr %1303, i32 0, i32 1
  %1305 = load ptr, ptr %1304, align 8
  store ptr %1305, ptr %58, align 8
  %1306 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1306, ptr %59, align 8
  %1307 = load ptr, ptr %58, align 8
  %1308 = getelementptr inbounds %struct.SetValue, ptr %1307, i32 0, i32 0
  %1309 = load i32, ptr %1308, align 8
  %1310 = load ptr, ptr %59, align 8
  %1311 = getelementptr inbounds %struct.SetValue, ptr %1310, i32 0, i32 0
  store i32 %1309, ptr %1311, align 8
  %1312 = load ptr, ptr %59, align 8
  %1313 = getelementptr inbounds %struct.SetValue, ptr %1312, i32 0, i32 0
  %1314 = load i32, ptr %1313, align 8
  %1315 = sext i32 %1314 to i64
  %1316 = mul i64 8, %1315
  %1317 = call noalias ptr @malloc(i64 noundef %1316) #5
  %1318 = load ptr, ptr %59, align 8
  %1319 = getelementptr inbounds %struct.SetValue, ptr %1318, i32 0, i32 1
  store ptr %1317, ptr %1319, align 8
  store i32 0, ptr %60, align 4
  br label %1320

1320:                                             ; preds = %1342, %1302
  %1321 = load i32, ptr %60, align 4
  %1322 = load ptr, ptr %58, align 8
  %1323 = getelementptr inbounds %struct.SetValue, ptr %1322, i32 0, i32 0
  %1324 = load i32, ptr %1323, align 8
  %1325 = icmp slt i32 %1321, %1324
  br i1 %1325, label %1326, label %1345

1326:                                             ; preds = %1320
  %1327 = load ptr, ptr %6, align 8
  %1328 = load ptr, ptr %58, align 8
  %1329 = getelementptr inbounds %struct.SetValue, ptr %1328, i32 0, i32 1
  %1330 = load ptr, ptr %1329, align 8
  %1331 = load i32, ptr %60, align 4
  %1332 = sext i32 %1331 to i64
  %1333 = getelementptr inbounds ptr, ptr %1330, i64 %1332
  %1334 = load ptr, ptr %1333, align 8
  %1335 = call ptr @powCalcLangValues(ptr noundef %1327, i32 noundef 0, ptr noundef %1334, i32 noundef 1)
  %1336 = load ptr, ptr %59, align 8
  %1337 = getelementptr inbounds %struct.SetValue, ptr %1336, i32 0, i32 1
  %1338 = load ptr, ptr %1337, align 8
  %1339 = load i32, ptr %60, align 4
  %1340 = sext i32 %1339 to i64
  %1341 = getelementptr inbounds ptr, ptr %1338, i64 %1340
  store ptr %1335, ptr %1341, align 8
  br label %1342

1342:                                             ; preds = %1326
  %1343 = load i32, ptr %60, align 4
  %1344 = add nsw i32 %1343, 1
  store i32 %1344, ptr %60, align 4
  br label %1320, !llvm.loop !94

1345:                                             ; preds = %1320
  %1346 = load ptr, ptr %10, align 8
  %1347 = getelementptr inbounds %struct.CalcLangVal, ptr %1346, i32 0, i32 0
  store i32 6, ptr %1347, align 8
  %1348 = load ptr, ptr %59, align 8
  %1349 = load ptr, ptr %10, align 8
  %1350 = getelementptr inbounds %struct.CalcLangVal, ptr %1349, i32 0, i32 1
  store ptr %1348, ptr %1350, align 8
  br label %1472

1351:                                             ; preds = %1297, %1292
  %1352 = load ptr, ptr %6, align 8
  %1353 = getelementptr inbounds %struct.CalcLangVal, ptr %1352, i32 0, i32 0
  %1354 = load i32, ptr %1353, align 8
  %1355 = icmp eq i32 %1354, 6
  br i1 %1355, label %1356, label %1410

1356:                                             ; preds = %1351
  %1357 = load ptr, ptr %8, align 8
  %1358 = getelementptr inbounds %struct.CalcLangVal, ptr %1357, i32 0, i32 0
  %1359 = load i32, ptr %1358, align 8
  %1360 = icmp eq i32 %1359, 4
  br i1 %1360, label %1361, label %1410

1361:                                             ; preds = %1356
  %1362 = load ptr, ptr %6, align 8
  %1363 = getelementptr inbounds %struct.CalcLangVal, ptr %1362, i32 0, i32 1
  %1364 = load ptr, ptr %1363, align 8
  store ptr %1364, ptr %61, align 8
  %1365 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1365, ptr %62, align 8
  %1366 = load ptr, ptr %61, align 8
  %1367 = getelementptr inbounds %struct.SetValue, ptr %1366, i32 0, i32 0
  %1368 = load i32, ptr %1367, align 8
  %1369 = load ptr, ptr %62, align 8
  %1370 = getelementptr inbounds %struct.SetValue, ptr %1369, i32 0, i32 0
  store i32 %1368, ptr %1370, align 8
  %1371 = load ptr, ptr %62, align 8
  %1372 = getelementptr inbounds %struct.SetValue, ptr %1371, i32 0, i32 0
  %1373 = load i32, ptr %1372, align 8
  %1374 = sext i32 %1373 to i64
  %1375 = mul i64 8, %1374
  %1376 = call noalias ptr @malloc(i64 noundef %1375) #5
  %1377 = load ptr, ptr %62, align 8
  %1378 = getelementptr inbounds %struct.SetValue, ptr %1377, i32 0, i32 1
  store ptr %1376, ptr %1378, align 8
  store i32 0, ptr %63, align 4
  br label %1379

1379:                                             ; preds = %1401, %1361
  %1380 = load i32, ptr %63, align 4
  %1381 = load ptr, ptr %61, align 8
  %1382 = getelementptr inbounds %struct.SetValue, ptr %1381, i32 0, i32 0
  %1383 = load i32, ptr %1382, align 8
  %1384 = icmp slt i32 %1380, %1383
  br i1 %1384, label %1385, label %1404

1385:                                             ; preds = %1379
  %1386 = load ptr, ptr %61, align 8
  %1387 = getelementptr inbounds %struct.SetValue, ptr %1386, i32 0, i32 1
  %1388 = load ptr, ptr %1387, align 8
  %1389 = load i32, ptr %63, align 4
  %1390 = sext i32 %1389 to i64
  %1391 = getelementptr inbounds ptr, ptr %1388, i64 %1390
  %1392 = load ptr, ptr %1391, align 8
  %1393 = load ptr, ptr %8, align 8
  %1394 = call ptr @powCalcLangValues(ptr noundef %1392, i32 noundef 1, ptr noundef %1393, i32 noundef 0)
  %1395 = load ptr, ptr %62, align 8
  %1396 = getelementptr inbounds %struct.SetValue, ptr %1395, i32 0, i32 1
  %1397 = load ptr, ptr %1396, align 8
  %1398 = load i32, ptr %63, align 4
  %1399 = sext i32 %1398 to i64
  %1400 = getelementptr inbounds ptr, ptr %1397, i64 %1399
  store ptr %1394, ptr %1400, align 8
  br label %1401

1401:                                             ; preds = %1385
  %1402 = load i32, ptr %63, align 4
  %1403 = add nsw i32 %1402, 1
  store i32 %1403, ptr %63, align 4
  br label %1379, !llvm.loop !95

1404:                                             ; preds = %1379
  %1405 = load ptr, ptr %10, align 8
  %1406 = getelementptr inbounds %struct.CalcLangVal, ptr %1405, i32 0, i32 0
  store i32 6, ptr %1406, align 8
  %1407 = load ptr, ptr %62, align 8
  %1408 = load ptr, ptr %10, align 8
  %1409 = getelementptr inbounds %struct.CalcLangVal, ptr %1408, i32 0, i32 1
  store ptr %1407, ptr %1409, align 8
  br label %1471

1410:                                             ; preds = %1356, %1351
  %1411 = load ptr, ptr %6, align 8
  %1412 = getelementptr inbounds %struct.CalcLangVal, ptr %1411, i32 0, i32 0
  %1413 = load i32, ptr %1412, align 8
  %1414 = icmp eq i32 %1413, 4
  br i1 %1414, label %1415, label %1469

1415:                                             ; preds = %1410
  %1416 = load ptr, ptr %8, align 8
  %1417 = getelementptr inbounds %struct.CalcLangVal, ptr %1416, i32 0, i32 0
  %1418 = load i32, ptr %1417, align 8
  %1419 = icmp eq i32 %1418, 6
  br i1 %1419, label %1420, label %1469

1420:                                             ; preds = %1415
  %1421 = load ptr, ptr %8, align 8
  %1422 = getelementptr inbounds %struct.CalcLangVal, ptr %1421, i32 0, i32 1
  %1423 = load ptr, ptr %1422, align 8
  store ptr %1423, ptr %64, align 8
  %1424 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %1424, ptr %65, align 8
  %1425 = load ptr, ptr %64, align 8
  %1426 = getelementptr inbounds %struct.SetValue, ptr %1425, i32 0, i32 0
  %1427 = load i32, ptr %1426, align 8
  %1428 = load ptr, ptr %65, align 8
  %1429 = getelementptr inbounds %struct.SetValue, ptr %1428, i32 0, i32 0
  store i32 %1427, ptr %1429, align 8
  %1430 = load ptr, ptr %65, align 8
  %1431 = getelementptr inbounds %struct.SetValue, ptr %1430, i32 0, i32 0
  %1432 = load i32, ptr %1431, align 8
  %1433 = sext i32 %1432 to i64
  %1434 = mul i64 8, %1433
  %1435 = call noalias ptr @malloc(i64 noundef %1434) #5
  %1436 = load ptr, ptr %65, align 8
  %1437 = getelementptr inbounds %struct.SetValue, ptr %1436, i32 0, i32 1
  store ptr %1435, ptr %1437, align 8
  store i32 0, ptr %66, align 4
  br label %1438

1438:                                             ; preds = %1460, %1420
  %1439 = load i32, ptr %66, align 4
  %1440 = load ptr, ptr %64, align 8
  %1441 = getelementptr inbounds %struct.SetValue, ptr %1440, i32 0, i32 0
  %1442 = load i32, ptr %1441, align 8
  %1443 = icmp slt i32 %1439, %1442
  br i1 %1443, label %1444, label %1463

1444:                                             ; preds = %1438
  %1445 = load ptr, ptr %6, align 8
  %1446 = load ptr, ptr %64, align 8
  %1447 = getelementptr inbounds %struct.SetValue, ptr %1446, i32 0, i32 1
  %1448 = load ptr, ptr %1447, align 8
  %1449 = load i32, ptr %66, align 4
  %1450 = sext i32 %1449 to i64
  %1451 = getelementptr inbounds ptr, ptr %1448, i64 %1450
  %1452 = load ptr, ptr %1451, align 8
  %1453 = call ptr @powCalcLangValues(ptr noundef %1445, i32 noundef 0, ptr noundef %1452, i32 noundef 1)
  %1454 = load ptr, ptr %65, align 8
  %1455 = getelementptr inbounds %struct.SetValue, ptr %1454, i32 0, i32 1
  %1456 = load ptr, ptr %1455, align 8
  %1457 = load i32, ptr %66, align 4
  %1458 = sext i32 %1457 to i64
  %1459 = getelementptr inbounds ptr, ptr %1456, i64 %1458
  store ptr %1453, ptr %1459, align 8
  br label %1460

1460:                                             ; preds = %1444
  %1461 = load i32, ptr %66, align 4
  %1462 = add nsw i32 %1461, 1
  store i32 %1462, ptr %66, align 4
  br label %1438, !llvm.loop !96

1463:                                             ; preds = %1438
  %1464 = load ptr, ptr %10, align 8
  %1465 = getelementptr inbounds %struct.CalcLangVal, ptr %1464, i32 0, i32 0
  store i32 6, ptr %1465, align 8
  %1466 = load ptr, ptr %65, align 8
  %1467 = load ptr, ptr %10, align 8
  %1468 = getelementptr inbounds %struct.CalcLangVal, ptr %1467, i32 0, i32 1
  store ptr %1466, ptr %1468, align 8
  br label %1470

1469:                                             ; preds = %1415, %1410
  call void @perror(ptr noundef @.str.1) #6
  br label %1470

1470:                                             ; preds = %1469, %1463
  br label %1471

1471:                                             ; preds = %1470, %1404
  br label %1472

1472:                                             ; preds = %1471, %1345
  br label %1473

1473:                                             ; preds = %1472, %1286
  br label %1474

1474:                                             ; preds = %1473, %1227
  br label %1475

1475:                                             ; preds = %1474, %1168
  br label %1476

1476:                                             ; preds = %1475, %1109
  br label %1477

1477:                                             ; preds = %1476, %1050
  br label %1478

1478:                                             ; preds = %1477, %996
  br label %1479

1479:                                             ; preds = %1478, %913
  br label %1480

1480:                                             ; preds = %1479, %854
  br label %1481

1481:                                             ; preds = %1480, %795
  br label %1482

1482:                                             ; preds = %1481, %736
  br label %1483

1483:                                             ; preds = %1482, %677
  br label %1484

1484:                                             ; preds = %1483, %618
  br label %1485

1485:                                             ; preds = %1484, %559
  br label %1486

1486:                                             ; preds = %1485, %500
  br label %1487

1487:                                             ; preds = %1486, %446
  br label %1488

1488:                                             ; preds = %1487, %357
  br label %1489

1489:                                             ; preds = %1488, %335
  br label %1490

1490:                                             ; preds = %1489, %313
  br label %1491

1491:                                             ; preds = %1490, %290
  br label %1492

1492:                                             ; preds = %1491, %267
  br label %1493

1493:                                             ; preds = %1492, %245
  br label %1494

1494:                                             ; preds = %1493, %223
  br label %1495

1495:                                             ; preds = %1494, %200
  br label %1496

1496:                                             ; preds = %1495, %177
  br label %1497

1497:                                             ; preds = %1496, %154
  br label %1498

1498:                                             ; preds = %1497, %131
  br label %1499

1499:                                             ; preds = %1498, %109
  br label %1500

1500:                                             ; preds = %1499, %84
  %1501 = load i32, ptr %7, align 4
  %1502 = icmp ne i32 %1501, 0
  br i1 %1502, label %1503, label %1505

1503:                                             ; preds = %1500
  %1504 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1504)
  br label %1511

1505:                                             ; preds = %1500
  %1506 = load i32, ptr %9, align 4
  %1507 = icmp ne i32 %1506, 0
  br i1 %1507, label %1508, label %1510

1508:                                             ; preds = %1505
  %1509 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1509)
  br label %1510

1510:                                             ; preds = %1508, %1505
  br label %1511

1511:                                             ; preds = %1510, %1503
  %1512 = load ptr, ptr %10, align 8
  store ptr %1512, ptr %5, align 8
  br label %1513

1513:                                             ; preds = %1511, %995, %445, %72
  %1514 = load ptr, ptr %5, align 8
  ret ptr %1514
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dotProductVals(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %17 = load ptr, ptr %6, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %4
  %20 = load ptr, ptr %8, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %4
  store ptr null, ptr %5, align 8
  br label %85

23:                                               ; preds = %19
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 7
  br i1 %27, label %28, label %83

28:                                               ; preds = %23
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp eq i32 %31, 7
  br i1 %32, label %33, label %83

33:                                               ; preds = %28
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %10, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %11, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = getelementptr inbounds %struct.TupleValue, ptr %40, i32 0, i32 0
  %42 = load i32, ptr %41, align 8
  %43 = load ptr, ptr %11, align 8
  %44 = getelementptr inbounds %struct.TupleValue, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = icmp eq i32 %42, %45
  br i1 %46, label %47, label %81

47:                                               ; preds = %33
  %48 = call ptr @newIntValue(i32 noundef 0)
  store ptr %48, ptr %12, align 8
  store i32 0, ptr %13, align 4
  br label %49

49:                                               ; preds = %76, %47
  %50 = load i32, ptr %13, align 4
  %51 = load ptr, ptr %10, align 8
  %52 = getelementptr inbounds %struct.TupleValue, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %52, align 8
  %54 = icmp slt i32 %50, %53
  br i1 %54, label %55, label %79

55:                                               ; preds = %49
  %56 = load ptr, ptr %10, align 8
  %57 = getelementptr inbounds %struct.TupleValue, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = load i32, ptr %13, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %58, i64 %60
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %14, align 8
  %63 = load ptr, ptr %11, align 8
  %64 = getelementptr inbounds %struct.TupleValue, ptr %63, i32 0, i32 1
  %65 = load ptr, ptr %64, align 8
  %66 = load i32, ptr %13, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr %65, i64 %67
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %15, align 8
  %70 = load ptr, ptr %14, align 8
  %71 = load ptr, ptr %15, align 8
  %72 = call ptr @multCalcLangValues(ptr noundef %70, i32 noundef 0, ptr noundef %71, i32 noundef 0)
  store ptr %72, ptr %16, align 8
  %73 = load ptr, ptr %12, align 8
  %74 = load ptr, ptr %16, align 8
  %75 = call ptr @addCalcLangValues(ptr noundef %73, i32 noundef 1, ptr noundef %74, i32 noundef 1)
  store ptr %75, ptr %12, align 8
  br label %76

76:                                               ; preds = %55
  %77 = load i32, ptr %13, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %13, align 4
  br label %49, !llvm.loop !97

79:                                               ; preds = %49
  %80 = load ptr, ptr %12, align 8
  store ptr %80, ptr %5, align 8
  br label %85

81:                                               ; preds = %33
  call void @perror(ptr noundef @.str.2) #6
  br label %82

82:                                               ; preds = %81
  br label %84

83:                                               ; preds = %28, %23
  call void @perror(ptr noundef @.str.3) #6
  br label %84

84:                                               ; preds = %83, %82
  store ptr null, ptr %5, align 8
  br label %85

85:                                               ; preds = %84, %79, %22
  %86 = load ptr, ptr %5, align 8
  ret ptr %86
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @equalsCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %26, label %23

23:                                               ; preds = %4
  %24 = load ptr, ptr %8, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %27

26:                                               ; preds = %23, %4
  store ptr null, ptr %5, align 8
  br label %451

27:                                               ; preds = %23
  %28 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %28, ptr %10, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  %32 = icmp eq i32 %31, 5
  br i1 %32, label %33, label %51

33:                                               ; preds = %27
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = icmp eq i32 %36, 5
  br i1 %37, label %38, label %51

38:                                               ; preds = %33
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 0
  store i32 5, ptr %40, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 1
  %43 = load i32, ptr %42, align 8
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds %struct.CalcLangVal, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 8
  %47 = icmp eq i32 %43, %46
  %48 = zext i1 %47 to i32
  %49 = load ptr, ptr %10, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 1
  store i32 %48, ptr %50, align 8
  br label %438

51:                                               ; preds = %33, %27
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  %54 = load i32, ptr %53, align 8
  %55 = icmp eq i32 %54, 5
  br i1 %55, label %56, label %74

56:                                               ; preds = %51
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 0
  %59 = load i32, ptr %58, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %74

61:                                               ; preds = %56
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  store i32 5, ptr %63, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = getelementptr inbounds %struct.CalcLangVal, ptr %64, i32 0, i32 1
  %66 = load i32, ptr %65, align 8
  %67 = load ptr, ptr %8, align 8
  %68 = getelementptr inbounds %struct.CalcLangVal, ptr %67, i32 0, i32 1
  %69 = load i32, ptr %68, align 8
  %70 = icmp eq i32 %66, %69
  %71 = zext i1 %70 to i32
  %72 = load ptr, ptr %10, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 1
  store i32 %71, ptr %73, align 8
  br label %437

74:                                               ; preds = %56, %51
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.CalcLangVal, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %97

79:                                               ; preds = %74
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 0
  %82 = load i32, ptr %81, align 8
  %83 = icmp eq i32 %82, 5
  br i1 %83, label %84, label %97

84:                                               ; preds = %79
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr inbounds %struct.CalcLangVal, ptr %85, i32 0, i32 0
  store i32 5, ptr %86, align 8
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  %89 = load i32, ptr %88, align 8
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %89, %92
  %94 = zext i1 %93 to i32
  %95 = load ptr, ptr %10, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 1
  store i32 %94, ptr %96, align 8
  br label %436

97:                                               ; preds = %79, %74
  %98 = load ptr, ptr %6, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = icmp eq i32 %100, 5
  br i1 %101, label %102, label %121

102:                                              ; preds = %97
  %103 = load ptr, ptr %8, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 0
  %105 = load i32, ptr %104, align 8
  %106 = icmp eq i32 %105, 1
  br i1 %106, label %107, label %121

107:                                              ; preds = %102
  %108 = load ptr, ptr %10, align 8
  %109 = getelementptr inbounds %struct.CalcLangVal, ptr %108, i32 0, i32 0
  store i32 5, ptr %109, align 8
  %110 = load ptr, ptr %6, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 1
  %112 = load i32, ptr %111, align 8
  %113 = sitofp i32 %112 to double
  %114 = load ptr, ptr %8, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 1
  %116 = load double, ptr %115, align 8
  %117 = fcmp oeq double %113, %116
  %118 = zext i1 %117 to i32
  %119 = load ptr, ptr %10, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 1
  store i32 %118, ptr %120, align 8
  br label %435

121:                                              ; preds = %102, %97
  %122 = load ptr, ptr %6, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  %124 = load i32, ptr %123, align 8
  %125 = icmp eq i32 %124, 1
  br i1 %125, label %126, label %145

126:                                              ; preds = %121
  %127 = load ptr, ptr %8, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 0
  %129 = load i32, ptr %128, align 8
  %130 = icmp eq i32 %129, 5
  br i1 %130, label %131, label %145

131:                                              ; preds = %126
  %132 = load ptr, ptr %10, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 0
  store i32 5, ptr %133, align 8
  %134 = load ptr, ptr %6, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  %136 = load double, ptr %135, align 8
  %137 = load ptr, ptr %8, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 1
  %139 = load i32, ptr %138, align 8
  %140 = sitofp i32 %139 to double
  %141 = fcmp oeq double %136, %140
  %142 = zext i1 %141 to i32
  %143 = load ptr, ptr %10, align 8
  %144 = getelementptr inbounds %struct.CalcLangVal, ptr %143, i32 0, i32 1
  store i32 %142, ptr %144, align 8
  br label %434

145:                                              ; preds = %126, %121
  %146 = load ptr, ptr %6, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 0
  %148 = load i32, ptr %147, align 8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %168

150:                                              ; preds = %145
  %151 = load ptr, ptr %8, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 0
  %153 = load i32, ptr %152, align 8
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %168

155:                                              ; preds = %150
  %156 = load ptr, ptr %10, align 8
  %157 = getelementptr inbounds %struct.CalcLangVal, ptr %156, i32 0, i32 0
  store i32 5, ptr %157, align 8
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 1
  %160 = load i32, ptr %159, align 8
  %161 = load ptr, ptr %8, align 8
  %162 = getelementptr inbounds %struct.CalcLangVal, ptr %161, i32 0, i32 1
  %163 = load i32, ptr %162, align 8
  %164 = icmp eq i32 %160, %163
  %165 = zext i1 %164 to i32
  %166 = load ptr, ptr %10, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 1
  store i32 %165, ptr %167, align 8
  br label %433

168:                                              ; preds = %150, %145
  %169 = load ptr, ptr %6, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 0
  %171 = load i32, ptr %170, align 8
  %172 = icmp eq i32 %171, 1
  br i1 %172, label %173, label %191

173:                                              ; preds = %168
  %174 = load ptr, ptr %8, align 8
  %175 = getelementptr inbounds %struct.CalcLangVal, ptr %174, i32 0, i32 0
  %176 = load i32, ptr %175, align 8
  %177 = icmp eq i32 %176, 1
  br i1 %177, label %178, label %191

178:                                              ; preds = %173
  %179 = load ptr, ptr %10, align 8
  %180 = getelementptr inbounds %struct.CalcLangVal, ptr %179, i32 0, i32 0
  store i32 5, ptr %180, align 8
  %181 = load ptr, ptr %6, align 8
  %182 = getelementptr inbounds %struct.CalcLangVal, ptr %181, i32 0, i32 1
  %183 = load double, ptr %182, align 8
  %184 = load ptr, ptr %8, align 8
  %185 = getelementptr inbounds %struct.CalcLangVal, ptr %184, i32 0, i32 1
  %186 = load double, ptr %185, align 8
  %187 = fcmp oeq double %183, %186
  %188 = zext i1 %187 to i32
  %189 = load ptr, ptr %10, align 8
  %190 = getelementptr inbounds %struct.CalcLangVal, ptr %189, i32 0, i32 1
  store i32 %188, ptr %190, align 8
  br label %432

191:                                              ; preds = %173, %168
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 0
  %194 = load i32, ptr %193, align 8
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %215

196:                                              ; preds = %191
  %197 = load ptr, ptr %8, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 0
  %199 = load i32, ptr %198, align 8
  %200 = icmp eq i32 %199, 1
  br i1 %200, label %201, label %215

201:                                              ; preds = %196
  %202 = load ptr, ptr %10, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 0
  store i32 5, ptr %203, align 8
  %204 = load ptr, ptr %6, align 8
  %205 = getelementptr inbounds %struct.CalcLangVal, ptr %204, i32 0, i32 1
  %206 = load i32, ptr %205, align 8
  %207 = sitofp i32 %206 to double
  %208 = load ptr, ptr %8, align 8
  %209 = getelementptr inbounds %struct.CalcLangVal, ptr %208, i32 0, i32 1
  %210 = load double, ptr %209, align 8
  %211 = fcmp oeq double %207, %210
  %212 = zext i1 %211 to i32
  %213 = load ptr, ptr %10, align 8
  %214 = getelementptr inbounds %struct.CalcLangVal, ptr %213, i32 0, i32 1
  store i32 %212, ptr %214, align 8
  br label %431

215:                                              ; preds = %196, %191
  %216 = load ptr, ptr %6, align 8
  %217 = getelementptr inbounds %struct.CalcLangVal, ptr %216, i32 0, i32 0
  %218 = load i32, ptr %217, align 8
  %219 = icmp eq i32 %218, 1
  br i1 %219, label %220, label %239

220:                                              ; preds = %215
  %221 = load ptr, ptr %8, align 8
  %222 = getelementptr inbounds %struct.CalcLangVal, ptr %221, i32 0, i32 0
  %223 = load i32, ptr %222, align 8
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %239

225:                                              ; preds = %220
  %226 = load ptr, ptr %10, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 0
  store i32 5, ptr %227, align 8
  %228 = load ptr, ptr %6, align 8
  %229 = getelementptr inbounds %struct.CalcLangVal, ptr %228, i32 0, i32 1
  %230 = load double, ptr %229, align 8
  %231 = load ptr, ptr %8, align 8
  %232 = getelementptr inbounds %struct.CalcLangVal, ptr %231, i32 0, i32 1
  %233 = load i32, ptr %232, align 8
  %234 = sitofp i32 %233 to double
  %235 = fcmp oeq double %230, %234
  %236 = zext i1 %235 to i32
  %237 = load ptr, ptr %10, align 8
  %238 = getelementptr inbounds %struct.CalcLangVal, ptr %237, i32 0, i32 1
  store i32 %236, ptr %238, align 8
  br label %430

239:                                              ; preds = %220, %215
  %240 = load ptr, ptr %6, align 8
  %241 = getelementptr inbounds %struct.CalcLangVal, ptr %240, i32 0, i32 0
  %242 = load i32, ptr %241, align 8
  %243 = icmp eq i32 %242, 3
  br i1 %243, label %244, label %262

244:                                              ; preds = %239
  %245 = load ptr, ptr %8, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 0
  %247 = load i32, ptr %246, align 8
  %248 = icmp eq i32 %247, 3
  br i1 %248, label %249, label %262

249:                                              ; preds = %244
  %250 = load ptr, ptr %10, align 8
  %251 = getelementptr inbounds %struct.CalcLangVal, ptr %250, i32 0, i32 0
  store i32 5, ptr %251, align 8
  %252 = load ptr, ptr %6, align 8
  %253 = getelementptr inbounds %struct.CalcLangVal, ptr %252, i32 0, i32 1
  %254 = load double, ptr %253, align 8
  %255 = load ptr, ptr %8, align 8
  %256 = getelementptr inbounds %struct.CalcLangVal, ptr %255, i32 0, i32 1
  %257 = load double, ptr %256, align 8
  %258 = fcmp oeq double %254, %257
  %259 = zext i1 %258 to i32
  %260 = load ptr, ptr %10, align 8
  %261 = getelementptr inbounds %struct.CalcLangVal, ptr %260, i32 0, i32 1
  store i32 %259, ptr %261, align 8
  br label %429

262:                                              ; preds = %244, %239
  %263 = load ptr, ptr %6, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 0
  %265 = load i32, ptr %264, align 8
  %266 = icmp eq i32 %265, 4
  br i1 %266, label %267, label %285

267:                                              ; preds = %262
  %268 = load ptr, ptr %8, align 8
  %269 = getelementptr inbounds %struct.CalcLangVal, ptr %268, i32 0, i32 0
  %270 = load i32, ptr %269, align 8
  %271 = icmp eq i32 %270, 4
  br i1 %271, label %272, label %285

272:                                              ; preds = %267
  %273 = load ptr, ptr %10, align 8
  %274 = getelementptr inbounds %struct.CalcLangVal, ptr %273, i32 0, i32 0
  store i32 5, ptr %274, align 8
  %275 = load ptr, ptr %6, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 1
  %277 = load double, ptr %276, align 8
  %278 = load ptr, ptr %8, align 8
  %279 = getelementptr inbounds %struct.CalcLangVal, ptr %278, i32 0, i32 1
  %280 = load double, ptr %279, align 8
  %281 = fcmp oeq double %277, %280
  %282 = zext i1 %281 to i32
  %283 = load ptr, ptr %10, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 1
  store i32 %282, ptr %284, align 8
  br label %428

285:                                              ; preds = %267, %262
  %286 = load ptr, ptr %6, align 8
  %287 = getelementptr inbounds %struct.CalcLangVal, ptr %286, i32 0, i32 0
  %288 = load i32, ptr %287, align 8
  %289 = icmp eq i32 %288, 7
  br i1 %289, label %290, label %355

290:                                              ; preds = %285
  %291 = load ptr, ptr %8, align 8
  %292 = getelementptr inbounds %struct.CalcLangVal, ptr %291, i32 0, i32 0
  %293 = load i32, ptr %292, align 8
  %294 = icmp eq i32 %293, 7
  br i1 %294, label %295, label %355

295:                                              ; preds = %290
  %296 = load ptr, ptr %6, align 8
  %297 = getelementptr inbounds %struct.CalcLangVal, ptr %296, i32 0, i32 1
  %298 = load ptr, ptr %297, align 8
  store ptr %298, ptr %11, align 8
  %299 = load ptr, ptr %8, align 8
  %300 = getelementptr inbounds %struct.CalcLangVal, ptr %299, i32 0, i32 1
  %301 = load ptr, ptr %300, align 8
  store ptr %301, ptr %12, align 8
  %302 = load ptr, ptr %12, align 8
  %303 = getelementptr inbounds %struct.TupleValue, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = load ptr, ptr %11, align 8
  %306 = getelementptr inbounds %struct.TupleValue, ptr %305, i32 0, i32 0
  %307 = load i32, ptr %306, align 8
  %308 = icmp eq i32 %304, %307
  br i1 %308, label %309, label %353

309:                                              ; preds = %295
  store i32 1, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %310

310:                                              ; preds = %344, %309
  %311 = load i32, ptr %14, align 4
  %312 = load ptr, ptr %11, align 8
  %313 = getelementptr inbounds %struct.TupleValue, ptr %312, i32 0, i32 0
  %314 = load i32, ptr %313, align 8
  %315 = icmp slt i32 %311, %314
  br i1 %315, label %316, label %347

316:                                              ; preds = %310
  %317 = load ptr, ptr %11, align 8
  %318 = getelementptr inbounds %struct.TupleValue, ptr %317, i32 0, i32 1
  %319 = load ptr, ptr %318, align 8
  %320 = load i32, ptr %14, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds ptr, ptr %319, i64 %321
  %323 = load ptr, ptr %322, align 8
  %324 = load ptr, ptr %12, align 8
  %325 = getelementptr inbounds %struct.TupleValue, ptr %324, i32 0, i32 1
  %326 = load ptr, ptr %325, align 8
  %327 = load i32, ptr %14, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds ptr, ptr %326, i64 %328
  %330 = load ptr, ptr %329, align 8
  %331 = call ptr @equalsCalcLangValues(ptr noundef %323, i32 noundef 1, ptr noundef %330, i32 noundef 0)
  store ptr %331, ptr %15, align 8
  %332 = load ptr, ptr %15, align 8
  %333 = getelementptr inbounds %struct.CalcLangVal, ptr %332, i32 0, i32 0
  %334 = load i32, ptr %333, align 8
  %335 = icmp eq i32 %334, 5
  br i1 %335, label %336, label %343

336:                                              ; preds = %316
  %337 = load ptr, ptr %15, align 8
  %338 = getelementptr inbounds %struct.CalcLangVal, ptr %337, i32 0, i32 1
  %339 = load i32, ptr %338, align 8
  %340 = icmp eq i32 %339, 0
  br i1 %340, label %341, label %342

341:                                              ; preds = %336
  store i32 0, ptr %13, align 4
  br label %347

342:                                              ; preds = %336
  br label %343

343:                                              ; preds = %342, %316
  br label %344

344:                                              ; preds = %343
  %345 = load i32, ptr %14, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, ptr %14, align 4
  br label %310, !llvm.loop !98

347:                                              ; preds = %341, %310
  %348 = load ptr, ptr %10, align 8
  %349 = getelementptr inbounds %struct.CalcLangVal, ptr %348, i32 0, i32 0
  store i32 5, ptr %349, align 8
  %350 = load i32, ptr %13, align 4
  %351 = load ptr, ptr %10, align 8
  %352 = getelementptr inbounds %struct.CalcLangVal, ptr %351, i32 0, i32 1
  store i32 %350, ptr %352, align 8
  br label %354

353:                                              ; preds = %295
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %451

354:                                              ; preds = %347
  br label %427

355:                                              ; preds = %290, %285
  %356 = load ptr, ptr %6, align 8
  %357 = getelementptr inbounds %struct.CalcLangVal, ptr %356, i32 0, i32 0
  %358 = load i32, ptr %357, align 8
  %359 = icmp eq i32 %358, 6
  br i1 %359, label %360, label %425

360:                                              ; preds = %355
  %361 = load ptr, ptr %8, align 8
  %362 = getelementptr inbounds %struct.CalcLangVal, ptr %361, i32 0, i32 0
  %363 = load i32, ptr %362, align 8
  %364 = icmp eq i32 %363, 6
  br i1 %364, label %365, label %425

365:                                              ; preds = %360
  %366 = load ptr, ptr %6, align 8
  %367 = getelementptr inbounds %struct.CalcLangVal, ptr %366, i32 0, i32 1
  %368 = load ptr, ptr %367, align 8
  store ptr %368, ptr %16, align 8
  %369 = load ptr, ptr %8, align 8
  %370 = getelementptr inbounds %struct.CalcLangVal, ptr %369, i32 0, i32 1
  %371 = load ptr, ptr %370, align 8
  store ptr %371, ptr %17, align 8
  %372 = load ptr, ptr %17, align 8
  %373 = getelementptr inbounds %struct.SetValue, ptr %372, i32 0, i32 0
  %374 = load i32, ptr %373, align 8
  %375 = load ptr, ptr %16, align 8
  %376 = getelementptr inbounds %struct.SetValue, ptr %375, i32 0, i32 0
  %377 = load i32, ptr %376, align 8
  %378 = icmp eq i32 %374, %377
  br i1 %378, label %379, label %423

379:                                              ; preds = %365
  store i32 1, ptr %18, align 4
  store i32 0, ptr %19, align 4
  br label %380

380:                                              ; preds = %414, %379
  %381 = load i32, ptr %19, align 4
  %382 = load ptr, ptr %16, align 8
  %383 = getelementptr inbounds %struct.SetValue, ptr %382, i32 0, i32 0
  %384 = load i32, ptr %383, align 8
  %385 = icmp slt i32 %381, %384
  br i1 %385, label %386, label %417

386:                                              ; preds = %380
  %387 = load ptr, ptr %16, align 8
  %388 = getelementptr inbounds %struct.SetValue, ptr %387, i32 0, i32 1
  %389 = load ptr, ptr %388, align 8
  %390 = load i32, ptr %19, align 4
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds ptr, ptr %389, i64 %391
  %393 = load ptr, ptr %392, align 8
  %394 = load ptr, ptr %17, align 8
  %395 = getelementptr inbounds %struct.SetValue, ptr %394, i32 0, i32 1
  %396 = load ptr, ptr %395, align 8
  %397 = load i32, ptr %19, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds ptr, ptr %396, i64 %398
  %400 = load ptr, ptr %399, align 8
  %401 = call ptr @equalsCalcLangValues(ptr noundef %393, i32 noundef 1, ptr noundef %400, i32 noundef 1)
  store ptr %401, ptr %20, align 8
  %402 = load ptr, ptr %20, align 8
  %403 = getelementptr inbounds %struct.CalcLangVal, ptr %402, i32 0, i32 0
  %404 = load i32, ptr %403, align 8
  %405 = icmp eq i32 %404, 5
  br i1 %405, label %406, label %413

406:                                              ; preds = %386
  %407 = load ptr, ptr %20, align 8
  %408 = getelementptr inbounds %struct.CalcLangVal, ptr %407, i32 0, i32 1
  %409 = load i32, ptr %408, align 8
  %410 = icmp eq i32 %409, 0
  br i1 %410, label %411, label %412

411:                                              ; preds = %406
  store i32 0, ptr %18, align 4
  br label %417

412:                                              ; preds = %406
  br label %413

413:                                              ; preds = %412, %386
  br label %414

414:                                              ; preds = %413
  %415 = load i32, ptr %19, align 4
  %416 = add nsw i32 %415, 1
  store i32 %416, ptr %19, align 4
  br label %380, !llvm.loop !99

417:                                              ; preds = %411, %380
  %418 = load ptr, ptr %10, align 8
  %419 = getelementptr inbounds %struct.CalcLangVal, ptr %418, i32 0, i32 0
  store i32 5, ptr %419, align 8
  %420 = load i32, ptr %18, align 4
  %421 = load ptr, ptr %10, align 8
  %422 = getelementptr inbounds %struct.CalcLangVal, ptr %421, i32 0, i32 1
  store i32 %420, ptr %422, align 8
  br label %424

423:                                              ; preds = %365
  call void @perror(ptr noundef @.str) #6
  store ptr null, ptr %5, align 8
  br label %451

424:                                              ; preds = %417
  br label %426

425:                                              ; preds = %360, %355
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %5, align 8
  br label %451

426:                                              ; preds = %424
  br label %427

427:                                              ; preds = %426, %354
  br label %428

428:                                              ; preds = %427, %272
  br label %429

429:                                              ; preds = %428, %249
  br label %430

430:                                              ; preds = %429, %225
  br label %431

431:                                              ; preds = %430, %201
  br label %432

432:                                              ; preds = %431, %178
  br label %433

433:                                              ; preds = %432, %155
  br label %434

434:                                              ; preds = %433, %131
  br label %435

435:                                              ; preds = %434, %107
  br label %436

436:                                              ; preds = %435, %84
  br label %437

437:                                              ; preds = %436, %61
  br label %438

438:                                              ; preds = %437, %38
  %439 = load i32, ptr %7, align 4
  %440 = icmp ne i32 %439, 0
  br i1 %440, label %441, label %443

441:                                              ; preds = %438
  %442 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %442)
  br label %449

443:                                              ; preds = %438
  %444 = load i32, ptr %9, align 4
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %446, label %448

446:                                              ; preds = %443
  %447 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %447)
  br label %448

448:                                              ; preds = %446, %443
  br label %449

449:                                              ; preds = %448, %441
  %450 = load ptr, ptr %10, align 8
  store ptr %450, ptr %5, align 8
  br label %451

451:                                              ; preds = %449, %425, %423, %353, %26
  %452 = load ptr, ptr %5, align 8
  ret ptr %452
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load ptr, ptr %8, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  store ptr null, ptr %5, align 8
  br label %178

17:                                               ; preds = %13
  %18 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %18, ptr %10, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %17
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %41

28:                                               ; preds = %23
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  store i32 0, ptr %30, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp slt i32 %33, %36
  %38 = zext i1 %37 to i32
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  store i32 %38, ptr %40, align 8
  br label %165

41:                                               ; preds = %23, %17
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %46, label %65

46:                                               ; preds = %41
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %65

51:                                               ; preds = %46
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  store i32 1, ptr %53, align 8
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.CalcLangVal, ptr %54, i32 0, i32 1
  %56 = load double, ptr %55, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fcmp olt double %56, %59
  %61 = zext i1 %60 to i32
  %62 = sitofp i32 %61 to double
  %63 = load ptr, ptr %10, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 1
  store double %62, ptr %64, align 8
  br label %164

65:                                               ; preds = %46, %41
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds %struct.CalcLangVal, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %89

70:                                               ; preds = %65
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %89

75:                                               ; preds = %70
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  store i32 1, ptr %77, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %79, align 8
  %81 = sitofp i32 %80 to double
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  %84 = load double, ptr %83, align 8
  %85 = fcmp olt double %81, %84
  %86 = zext i1 %85 to i32
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store i32 %86, ptr %88, align 8
  br label %163

89:                                               ; preds = %70, %65
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %113

94:                                               ; preds = %89
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %113

99:                                               ; preds = %94
  %100 = load ptr, ptr %10, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load i32, ptr %106, align 8
  %108 = sitofp i32 %107 to double
  %109 = fcmp olt double %104, %108
  %110 = zext i1 %109 to i32
  %111 = load ptr, ptr %10, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  store i32 %110, ptr %112, align 8
  br label %162

113:                                              ; preds = %94, %89
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.CalcLangVal, ptr %114, i32 0, i32 0
  %116 = load i32, ptr %115, align 8
  %117 = icmp eq i32 %116, 3
  br i1 %117, label %118, label %136

118:                                              ; preds = %113
  %119 = load ptr, ptr %8, align 8
  %120 = getelementptr inbounds %struct.CalcLangVal, ptr %119, i32 0, i32 0
  %121 = load i32, ptr %120, align 8
  %122 = icmp eq i32 %121, 3
  br i1 %122, label %123, label %136

123:                                              ; preds = %118
  %124 = load ptr, ptr %10, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 0
  store i32 3, ptr %125, align 8
  %126 = load ptr, ptr %6, align 8
  %127 = getelementptr inbounds %struct.CalcLangVal, ptr %126, i32 0, i32 1
  %128 = load double, ptr %127, align 8
  %129 = load ptr, ptr %8, align 8
  %130 = getelementptr inbounds %struct.CalcLangVal, ptr %129, i32 0, i32 1
  %131 = load double, ptr %130, align 8
  %132 = fcmp olt double %128, %131
  %133 = zext i1 %132 to i32
  %134 = load ptr, ptr %10, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  store i32 %133, ptr %135, align 8
  br label %161

136:                                              ; preds = %118, %113
  %137 = load ptr, ptr %6, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 0
  %139 = load i32, ptr %138, align 8
  %140 = icmp eq i32 %139, 4
  br i1 %140, label %141, label %159

141:                                              ; preds = %136
  %142 = load ptr, ptr %8, align 8
  %143 = getelementptr inbounds %struct.CalcLangVal, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = icmp eq i32 %144, 4
  br i1 %145, label %146, label %159

146:                                              ; preds = %141
  %147 = load ptr, ptr %10, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 0
  store i32 4, ptr %148, align 8
  %149 = load ptr, ptr %6, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 1
  %151 = load double, ptr %150, align 8
  %152 = load ptr, ptr %8, align 8
  %153 = getelementptr inbounds %struct.CalcLangVal, ptr %152, i32 0, i32 1
  %154 = load double, ptr %153, align 8
  %155 = fcmp olt double %151, %154
  %156 = zext i1 %155 to i32
  %157 = load ptr, ptr %10, align 8
  %158 = getelementptr inbounds %struct.CalcLangVal, ptr %157, i32 0, i32 1
  store i32 %156, ptr %158, align 8
  br label %160

159:                                              ; preds = %141, %136
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %5, align 8
  br label %178

160:                                              ; preds = %146
  br label %161

161:                                              ; preds = %160, %123
  br label %162

162:                                              ; preds = %161, %99
  br label %163

163:                                              ; preds = %162, %75
  br label %164

164:                                              ; preds = %163, %51
  br label %165

165:                                              ; preds = %164, %28
  %166 = load i32, ptr %7, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %170

168:                                              ; preds = %165
  %169 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %169)
  br label %176

170:                                              ; preds = %165
  %171 = load i32, ptr %9, align 4
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %175

173:                                              ; preds = %170
  %174 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %174)
  br label %175

175:                                              ; preds = %173, %170
  br label %176

176:                                              ; preds = %175, %168
  %177 = load ptr, ptr %10, align 8
  store ptr %177, ptr %5, align 8
  br label %178

178:                                              ; preds = %176, %159, %16
  %179 = load ptr, ptr %5, align 8
  ret ptr %179
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load ptr, ptr %8, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  store ptr null, ptr %5, align 8
  br label %181

17:                                               ; preds = %13
  %18 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %18, ptr %10, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %17
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %41

28:                                               ; preds = %23
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  store i32 0, ptr %30, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp sgt i32 %33, %36
  %38 = zext i1 %37 to i32
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  store i32 %38, ptr %40, align 8
  br label %168

41:                                               ; preds = %23, %17
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %46, label %65

46:                                               ; preds = %41
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %65

51:                                               ; preds = %46
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  store i32 1, ptr %53, align 8
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.CalcLangVal, ptr %54, i32 0, i32 1
  %56 = load double, ptr %55, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fcmp ogt double %56, %59
  %61 = zext i1 %60 to i32
  %62 = sitofp i32 %61 to double
  %63 = load ptr, ptr %10, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 1
  store double %62, ptr %64, align 8
  br label %167

65:                                               ; preds = %46, %41
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds %struct.CalcLangVal, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %90

70:                                               ; preds = %65
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %90

75:                                               ; preds = %70
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  store i32 1, ptr %77, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %79, align 8
  %81 = sitofp i32 %80 to double
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  %84 = load double, ptr %83, align 8
  %85 = fcmp ogt double %81, %84
  %86 = zext i1 %85 to i32
  %87 = sitofp i32 %86 to double
  %88 = load ptr, ptr %10, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  store double %87, ptr %89, align 8
  br label %166

90:                                               ; preds = %70, %65
  %91 = load ptr, ptr %6, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 0
  %93 = load i32, ptr %92, align 8
  %94 = icmp eq i32 %93, 1
  br i1 %94, label %95, label %114

95:                                               ; preds = %90
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %114

100:                                              ; preds = %95
  %101 = load ptr, ptr %10, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  store i32 1, ptr %102, align 8
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 1
  %105 = load double, ptr %104, align 8
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 1
  %108 = load i32, ptr %107, align 8
  %109 = sitofp i32 %108 to double
  %110 = fcmp ogt double %105, %109
  %111 = zext i1 %110 to i32
  %112 = load ptr, ptr %10, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store i32 %111, ptr %113, align 8
  br label %165

114:                                              ; preds = %95, %90
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 3
  br i1 %118, label %119, label %138

119:                                              ; preds = %114
  %120 = load ptr, ptr %8, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 3
  br i1 %123, label %124, label %138

124:                                              ; preds = %119
  %125 = load ptr, ptr %10, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 3, ptr %126, align 8
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load double, ptr %128, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load double, ptr %131, align 8
  %133 = fcmp ogt double %129, %132
  %134 = zext i1 %133 to i32
  %135 = sitofp i32 %134 to double
  %136 = load ptr, ptr %10, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 1
  store double %135, ptr %137, align 8
  br label %164

138:                                              ; preds = %119, %114
  %139 = load ptr, ptr %6, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 0
  %141 = load i32, ptr %140, align 8
  %142 = icmp eq i32 %141, 4
  br i1 %142, label %143, label %162

143:                                              ; preds = %138
  %144 = load ptr, ptr %8, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp eq i32 %146, 4
  br i1 %147, label %148, label %162

148:                                              ; preds = %143
  %149 = load ptr, ptr %10, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 0
  store i32 4, ptr %150, align 8
  %151 = load ptr, ptr %6, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load double, ptr %152, align 8
  %154 = load ptr, ptr %8, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = fcmp ogt double %153, %156
  %158 = zext i1 %157 to i32
  %159 = sitofp i32 %158 to double
  %160 = load ptr, ptr %10, align 8
  %161 = getelementptr inbounds %struct.CalcLangVal, ptr %160, i32 0, i32 1
  store double %159, ptr %161, align 8
  br label %163

162:                                              ; preds = %143, %138
  call void @perror(ptr noundef @.str.1) #6
  br label %163

163:                                              ; preds = %162, %148
  br label %164

164:                                              ; preds = %163, %124
  br label %165

165:                                              ; preds = %164, %100
  br label %166

166:                                              ; preds = %165, %75
  br label %167

167:                                              ; preds = %166, %51
  br label %168

168:                                              ; preds = %167, %28
  %169 = load i32, ptr %7, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %173

171:                                              ; preds = %168
  %172 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %172)
  br label %179

173:                                              ; preds = %168
  %174 = load i32, ptr %9, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %178

176:                                              ; preds = %173
  %177 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %177)
  br label %178

178:                                              ; preds = %176, %173
  br label %179

179:                                              ; preds = %178, %171
  %180 = load ptr, ptr %10, align 8
  store ptr %180, ptr %5, align 8
  br label %181

181:                                              ; preds = %179, %16
  %182 = load ptr, ptr %5, align 8
  ret ptr %182
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @lessThenOrEqualToCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load ptr, ptr %8, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  store ptr null, ptr %5, align 8
  br label %181

17:                                               ; preds = %13
  %18 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %18, ptr %10, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %17
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %41

28:                                               ; preds = %23
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  store i32 0, ptr %30, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp sle i32 %33, %36
  %38 = zext i1 %37 to i32
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  store i32 %38, ptr %40, align 8
  br label %168

41:                                               ; preds = %23, %17
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %46, label %65

46:                                               ; preds = %41
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %65

51:                                               ; preds = %46
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  store i32 1, ptr %53, align 8
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.CalcLangVal, ptr %54, i32 0, i32 1
  %56 = load double, ptr %55, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fcmp ole double %56, %59
  %61 = zext i1 %60 to i32
  %62 = sitofp i32 %61 to double
  %63 = load ptr, ptr %10, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 1
  store double %62, ptr %64, align 8
  br label %167

65:                                               ; preds = %46, %41
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds %struct.CalcLangVal, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %90

70:                                               ; preds = %65
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %90

75:                                               ; preds = %70
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  store i32 1, ptr %77, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %79, align 8
  %81 = sitofp i32 %80 to double
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  %84 = load double, ptr %83, align 8
  %85 = fcmp ole double %81, %84
  %86 = zext i1 %85 to i32
  %87 = sitofp i32 %86 to double
  %88 = load ptr, ptr %10, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  store double %87, ptr %89, align 8
  br label %166

90:                                               ; preds = %70, %65
  %91 = load ptr, ptr %6, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 0
  %93 = load i32, ptr %92, align 8
  %94 = icmp eq i32 %93, 1
  br i1 %94, label %95, label %114

95:                                               ; preds = %90
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %114

100:                                              ; preds = %95
  %101 = load ptr, ptr %10, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  store i32 1, ptr %102, align 8
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 1
  %105 = load double, ptr %104, align 8
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 1
  %108 = load i32, ptr %107, align 8
  %109 = sitofp i32 %108 to double
  %110 = fcmp ole double %105, %109
  %111 = zext i1 %110 to i32
  %112 = load ptr, ptr %10, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store i32 %111, ptr %113, align 8
  br label %165

114:                                              ; preds = %95, %90
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 3
  br i1 %118, label %119, label %138

119:                                              ; preds = %114
  %120 = load ptr, ptr %8, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 3
  br i1 %123, label %124, label %138

124:                                              ; preds = %119
  %125 = load ptr, ptr %10, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 3, ptr %126, align 8
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load double, ptr %128, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load double, ptr %131, align 8
  %133 = fcmp ole double %129, %132
  %134 = zext i1 %133 to i32
  %135 = sitofp i32 %134 to double
  %136 = load ptr, ptr %10, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 1
  store double %135, ptr %137, align 8
  br label %164

138:                                              ; preds = %119, %114
  %139 = load ptr, ptr %6, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 0
  %141 = load i32, ptr %140, align 8
  %142 = icmp eq i32 %141, 4
  br i1 %142, label %143, label %162

143:                                              ; preds = %138
  %144 = load ptr, ptr %8, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp eq i32 %146, 4
  br i1 %147, label %148, label %162

148:                                              ; preds = %143
  %149 = load ptr, ptr %10, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 0
  store i32 4, ptr %150, align 8
  %151 = load ptr, ptr %6, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load double, ptr %152, align 8
  %154 = load ptr, ptr %8, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = fcmp ole double %153, %156
  %158 = zext i1 %157 to i32
  %159 = sitofp i32 %158 to double
  %160 = load ptr, ptr %10, align 8
  %161 = getelementptr inbounds %struct.CalcLangVal, ptr %160, i32 0, i32 1
  store double %159, ptr %161, align 8
  br label %163

162:                                              ; preds = %143, %138
  call void @perror(ptr noundef @.str.1) #6
  br label %163

163:                                              ; preds = %162, %148
  br label %164

164:                                              ; preds = %163, %124
  br label %165

165:                                              ; preds = %164, %100
  br label %166

166:                                              ; preds = %165, %75
  br label %167

167:                                              ; preds = %166, %51
  br label %168

168:                                              ; preds = %167, %28
  %169 = load i32, ptr %7, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %173

171:                                              ; preds = %168
  %172 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %172)
  br label %179

173:                                              ; preds = %168
  %174 = load i32, ptr %9, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %178

176:                                              ; preds = %173
  %177 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %177)
  br label %178

178:                                              ; preds = %176, %173
  br label %179

179:                                              ; preds = %178, %171
  %180 = load ptr, ptr %10, align 8
  store ptr %180, ptr %5, align 8
  br label %181

181:                                              ; preds = %179, %16
  %182 = load ptr, ptr %5, align 8
  ret ptr %182
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @greaterThenOrEqualToCalcLangValues(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load ptr, ptr %8, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  store ptr null, ptr %5, align 8
  br label %181

17:                                               ; preds = %13
  %18 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %18, ptr %10, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.CalcLangVal, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %17
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.CalcLangVal, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %41

28:                                               ; preds = %23
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds %struct.CalcLangVal, ptr %29, i32 0, i32 0
  store i32 0, ptr %30, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.CalcLangVal, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = icmp sge i32 %33, %36
  %38 = zext i1 %37 to i32
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.CalcLangVal, ptr %39, i32 0, i32 1
  store i32 %38, ptr %40, align 8
  br label %168

41:                                               ; preds = %23, %17
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.CalcLangVal, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %46, label %65

46:                                               ; preds = %41
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.CalcLangVal, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %65

51:                                               ; preds = %46
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds %struct.CalcLangVal, ptr %52, i32 0, i32 0
  store i32 1, ptr %53, align 8
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.CalcLangVal, ptr %54, i32 0, i32 1
  %56 = load double, ptr %55, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.CalcLangVal, ptr %57, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fcmp oge double %56, %59
  %61 = zext i1 %60 to i32
  %62 = sitofp i32 %61 to double
  %63 = load ptr, ptr %10, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 1
  store double %62, ptr %64, align 8
  br label %167

65:                                               ; preds = %46, %41
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds %struct.CalcLangVal, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %90

70:                                               ; preds = %65
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %90

75:                                               ; preds = %70
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 0
  store i32 1, ptr %77, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %79, align 8
  %81 = sitofp i32 %80 to double
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds %struct.CalcLangVal, ptr %82, i32 0, i32 1
  %84 = load double, ptr %83, align 8
  %85 = fcmp oge double %81, %84
  %86 = zext i1 %85 to i32
  %87 = sitofp i32 %86 to double
  %88 = load ptr, ptr %10, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  store double %87, ptr %89, align 8
  br label %166

90:                                               ; preds = %70, %65
  %91 = load ptr, ptr %6, align 8
  %92 = getelementptr inbounds %struct.CalcLangVal, ptr %91, i32 0, i32 0
  %93 = load i32, ptr %92, align 8
  %94 = icmp eq i32 %93, 1
  br i1 %94, label %95, label %114

95:                                               ; preds = %90
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.CalcLangVal, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %114

100:                                              ; preds = %95
  %101 = load ptr, ptr %10, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 0
  store i32 1, ptr %102, align 8
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds %struct.CalcLangVal, ptr %103, i32 0, i32 1
  %105 = load double, ptr %104, align 8
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.CalcLangVal, ptr %106, i32 0, i32 1
  %108 = load i32, ptr %107, align 8
  %109 = sitofp i32 %108 to double
  %110 = fcmp oge double %105, %109
  %111 = zext i1 %110 to i32
  %112 = load ptr, ptr %10, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 1
  store i32 %111, ptr %113, align 8
  br label %165

114:                                              ; preds = %95, %90
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %struct.CalcLangVal, ptr %115, i32 0, i32 0
  %117 = load i32, ptr %116, align 8
  %118 = icmp eq i32 %117, 3
  br i1 %118, label %119, label %138

119:                                              ; preds = %114
  %120 = load ptr, ptr %8, align 8
  %121 = getelementptr inbounds %struct.CalcLangVal, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = icmp eq i32 %122, 3
  br i1 %123, label %124, label %138

124:                                              ; preds = %119
  %125 = load ptr, ptr %10, align 8
  %126 = getelementptr inbounds %struct.CalcLangVal, ptr %125, i32 0, i32 0
  store i32 3, ptr %126, align 8
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 1
  %129 = load double, ptr %128, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.CalcLangVal, ptr %130, i32 0, i32 1
  %132 = load double, ptr %131, align 8
  %133 = fcmp oge double %129, %132
  %134 = zext i1 %133 to i32
  %135 = sitofp i32 %134 to double
  %136 = load ptr, ptr %10, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 1
  store double %135, ptr %137, align 8
  br label %164

138:                                              ; preds = %119, %114
  %139 = load ptr, ptr %6, align 8
  %140 = getelementptr inbounds %struct.CalcLangVal, ptr %139, i32 0, i32 0
  %141 = load i32, ptr %140, align 8
  %142 = icmp eq i32 %141, 4
  br i1 %142, label %143, label %162

143:                                              ; preds = %138
  %144 = load ptr, ptr %8, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp eq i32 %146, 4
  br i1 %147, label %148, label %162

148:                                              ; preds = %143
  %149 = load ptr, ptr %10, align 8
  %150 = getelementptr inbounds %struct.CalcLangVal, ptr %149, i32 0, i32 0
  store i32 4, ptr %150, align 8
  %151 = load ptr, ptr %6, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load double, ptr %152, align 8
  %154 = load ptr, ptr %8, align 8
  %155 = getelementptr inbounds %struct.CalcLangVal, ptr %154, i32 0, i32 1
  %156 = load double, ptr %155, align 8
  %157 = fcmp oge double %153, %156
  %158 = zext i1 %157 to i32
  %159 = sitofp i32 %158 to double
  %160 = load ptr, ptr %10, align 8
  %161 = getelementptr inbounds %struct.CalcLangVal, ptr %160, i32 0, i32 1
  store double %159, ptr %161, align 8
  br label %163

162:                                              ; preds = %143, %138
  call void @perror(ptr noundef @.str.1) #6
  store ptr null, ptr %5, align 8
  br label %181

163:                                              ; preds = %148
  br label %164

164:                                              ; preds = %163, %124
  br label %165

165:                                              ; preds = %164, %100
  br label %166

166:                                              ; preds = %165, %75
  br label %167

167:                                              ; preds = %166, %51
  br label %168

168:                                              ; preds = %167, %28
  %169 = load i32, ptr %7, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %173

171:                                              ; preds = %168
  %172 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %172)
  br label %179

173:                                              ; preds = %168
  %174 = load i32, ptr %9, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %178

176:                                              ; preds = %173
  %177 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %177)
  br label %178

178:                                              ; preds = %176, %173
  br label %179

179:                                              ; preds = %178, %171
  %180 = load ptr, ptr %10, align 8
  store ptr %180, ptr %5, align 8
  br label %181

181:                                              ; preds = %179, %162, %16
  %182 = load ptr, ptr %5, align 8
  ret ptr %182
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @notCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %198

14:                                               ; preds = %2
  %15 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %30

20:                                               ; preds = %14
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 0
  store i32 5, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.CalcLangVal, ptr %28, i32 0, i32 1
  store i32 %27, ptr %29, align 8
  br label %196

30:                                               ; preds = %14
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.CalcLangVal, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %45

35:                                               ; preds = %30
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.CalcLangVal, ptr %36, i32 0, i32 0
  store i32 5, ptr %37, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.CalcLangVal, ptr %38, i32 0, i32 1
  %40 = load double, ptr %39, align 8
  %41 = fcmp une double %40, 0.000000e+00
  %42 = zext i1 %41 to i32
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.CalcLangVal, ptr %43, i32 0, i32 1
  store i32 %42, ptr %44, align 8
  br label %195

45:                                               ; preds = %30
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.CalcLangVal, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp eq i32 %48, 5
  br i1 %49, label %50, label %61

50:                                               ; preds = %45
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 0
  store i32 5, ptr %52, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.CalcLangVal, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 8
  %56 = icmp ne i32 %55, 0
  %57 = xor i1 %56, true
  %58 = zext i1 %57 to i32
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.CalcLangVal, ptr %59, i32 0, i32 1
  store i32 %58, ptr %60, align 8
  br label %194

61:                                               ; preds = %45
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.CalcLangVal, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = icmp eq i32 %64, 7
  br i1 %65, label %66, label %126

66:                                               ; preds = %61
  %67 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %67, ptr %7, align 8
  %68 = call noalias ptr @malloc(i64 noundef 16) #5
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr inbounds %struct.CalcLangVal, ptr %69, i32 0, i32 1
  store ptr %68, ptr %70, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.CalcLangVal, ptr %71, i32 0, i32 1
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds %struct.TupleValue, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = load ptr, ptr %7, align 8
  %77 = getelementptr inbounds %struct.CalcLangVal, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.TupleValue, ptr %78, i32 0, i32 0
  store i32 %75, ptr %79, align 8
  %80 = load ptr, ptr %7, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.TupleValue, ptr %82, i32 0, i32 0
  %84 = load i32, ptr %83, align 8
  %85 = sext i32 %84 to i64
  %86 = mul i64 8, %85
  %87 = call noalias ptr @malloc(i64 noundef %86) #5
  %88 = load ptr, ptr %7, align 8
  %89 = getelementptr inbounds %struct.CalcLangVal, ptr %88, i32 0, i32 1
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds %struct.TupleValue, ptr %90, i32 0, i32 1
  store ptr %87, ptr %91, align 8
  store i32 0, ptr %8, align 4
  br label %92

92:                                               ; preds = %119, %66
  %93 = load i32, ptr %8, align 4
  %94 = load ptr, ptr %7, align 8
  %95 = getelementptr inbounds %struct.CalcLangVal, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.TupleValue, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = icmp slt i32 %93, %98
  br i1 %99, label %100, label %122

100:                                              ; preds = %92
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds %struct.CalcLangVal, ptr %101, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr inbounds %struct.TupleValue, ptr %103, i32 0, i32 1
  %105 = load ptr, ptr %104, align 8
  %106 = load i32, ptr %8, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds ptr, ptr %105, i64 %107
  %109 = load ptr, ptr %108, align 8
  %110 = call ptr @notCalcLangValue(ptr noundef %109, i32 noundef 1)
  %111 = load ptr, ptr %7, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds %struct.TupleValue, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = load i32, ptr %8, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds ptr, ptr %115, i64 %117
  store ptr %110, ptr %118, align 8
  br label %119

119:                                              ; preds = %100
  %120 = load i32, ptr %8, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, ptr %8, align 4
  br label %92, !llvm.loop !100

122:                                              ; preds = %92
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.CalcLangVal, ptr %123, i32 0, i32 0
  store i32 7, ptr %124, align 8
  %125 = load ptr, ptr %7, align 8
  store ptr %125, ptr %3, align 8
  br label %198

126:                                              ; preds = %61
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.CalcLangVal, ptr %127, i32 0, i32 0
  %129 = load i32, ptr %128, align 8
  %130 = icmp eq i32 %129, 6
  br i1 %130, label %131, label %191

131:                                              ; preds = %126
  %132 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %132, ptr %9, align 8
  %133 = call noalias ptr @malloc(i64 noundef 16) #5
  %134 = load ptr, ptr %9, align 8
  %135 = getelementptr inbounds %struct.CalcLangVal, ptr %134, i32 0, i32 1
  store ptr %133, ptr %135, align 8
  %136 = load ptr, ptr %4, align 8
  %137 = getelementptr inbounds %struct.CalcLangVal, ptr %136, i32 0, i32 1
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds %struct.SetValue, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %139, align 8
  %141 = load ptr, ptr %9, align 8
  %142 = getelementptr inbounds %struct.CalcLangVal, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  %144 = getelementptr inbounds %struct.SetValue, ptr %143, i32 0, i32 0
  store i32 %140, ptr %144, align 8
  %145 = load ptr, ptr %9, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 1
  %147 = load ptr, ptr %146, align 8
  %148 = getelementptr inbounds %struct.SetValue, ptr %147, i32 0, i32 0
  %149 = load i32, ptr %148, align 8
  %150 = sext i32 %149 to i64
  %151 = mul i64 8, %150
  %152 = call noalias ptr @malloc(i64 noundef %151) #5
  %153 = load ptr, ptr %9, align 8
  %154 = getelementptr inbounds %struct.CalcLangVal, ptr %153, i32 0, i32 1
  %155 = load ptr, ptr %154, align 8
  %156 = getelementptr inbounds %struct.SetValue, ptr %155, i32 0, i32 1
  store ptr %152, ptr %156, align 8
  store i32 0, ptr %10, align 4
  br label %157

157:                                              ; preds = %184, %131
  %158 = load i32, ptr %10, align 4
  %159 = load ptr, ptr %9, align 8
  %160 = getelementptr inbounds %struct.CalcLangVal, ptr %159, i32 0, i32 1
  %161 = load ptr, ptr %160, align 8
  %162 = getelementptr inbounds %struct.TupleValue, ptr %161, i32 0, i32 0
  %163 = load i32, ptr %162, align 8
  %164 = icmp slt i32 %158, %163
  br i1 %164, label %165, label %187

165:                                              ; preds = %157
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.CalcLangVal, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  %169 = getelementptr inbounds %struct.SetValue, ptr %168, i32 0, i32 1
  %170 = load ptr, ptr %169, align 8
  %171 = load i32, ptr %10, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds ptr, ptr %170, i64 %172
  %174 = load ptr, ptr %173, align 8
  %175 = call ptr @notCalcLangValue(ptr noundef %174, i32 noundef 1)
  %176 = load ptr, ptr %9, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  %179 = getelementptr inbounds %struct.SetValue, ptr %178, i32 0, i32 1
  %180 = load ptr, ptr %179, align 8
  %181 = load i32, ptr %10, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds ptr, ptr %180, i64 %182
  store ptr %175, ptr %183, align 8
  br label %184

184:                                              ; preds = %165
  %185 = load i32, ptr %10, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, ptr %10, align 4
  br label %157, !llvm.loop !101

187:                                              ; preds = %157
  %188 = load ptr, ptr %9, align 8
  %189 = getelementptr inbounds %struct.CalcLangVal, ptr %188, i32 0, i32 0
  store i32 6, ptr %189, align 8
  %190 = load ptr, ptr %9, align 8
  store ptr %190, ptr %3, align 8
  br label %198

191:                                              ; preds = %126
  call void @perror(ptr noundef @.str.4) #6
  br label %192

192:                                              ; preds = %191
  br label %193

193:                                              ; preds = %192
  br label %194

194:                                              ; preds = %193, %50
  br label %195

195:                                              ; preds = %194, %35
  br label %196

196:                                              ; preds = %195, %20
  %197 = load ptr, ptr %6, align 8
  store ptr %197, ptr %3, align 8
  br label %198

198:                                              ; preds = %196, %187, %122, %13
  %199 = load ptr, ptr %3, align 8
  ret ptr %199
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @negateCalcLangValue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %209

14:                                               ; preds = %2
  %15 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.CalcLangVal, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %29

20:                                               ; preds = %14
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.CalcLangVal, ptr %21, i32 0, i32 0
  store i32 0, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.CalcLangVal, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = sub nsw i32 0, %25
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.CalcLangVal, ptr %27, i32 0, i32 1
  store i32 %26, ptr %28, align 8
  br label %207

29:                                               ; preds = %14
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.CalcLangVal, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %43

34:                                               ; preds = %29
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.CalcLangVal, ptr %35, i32 0, i32 0
  store i32 1, ptr %36, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.CalcLangVal, ptr %37, i32 0, i32 1
  %39 = load double, ptr %38, align 8
  %40 = fneg double %39
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.CalcLangVal, ptr %41, i32 0, i32 1
  store double %40, ptr %42, align 8
  br label %206

43:                                               ; preds = %29
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.CalcLangVal, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = icmp eq i32 %46, 3
  br i1 %47, label %48, label %57

48:                                               ; preds = %43
  %49 = load ptr, ptr %6, align 8
  %50 = getelementptr inbounds %struct.CalcLangVal, ptr %49, i32 0, i32 0
  store i32 3, ptr %50, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %struct.CalcLangVal, ptr %51, i32 0, i32 1
  %53 = load double, ptr %52, align 8
  %54 = fneg double %53
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr inbounds %struct.CalcLangVal, ptr %55, i32 0, i32 1
  store double %54, ptr %56, align 8
  br label %205

57:                                               ; preds = %43
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds %struct.CalcLangVal, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = icmp eq i32 %60, 4
  br i1 %61, label %62, label %71

62:                                               ; preds = %57
  %63 = load ptr, ptr %6, align 8
  %64 = getelementptr inbounds %struct.CalcLangVal, ptr %63, i32 0, i32 0
  store i32 4, ptr %64, align 8
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 1
  %67 = load double, ptr %66, align 8
  %68 = fneg double %67
  %69 = load ptr, ptr %6, align 8
  %70 = getelementptr inbounds %struct.CalcLangVal, ptr %69, i32 0, i32 1
  store double %68, ptr %70, align 8
  br label %204

71:                                               ; preds = %57
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.CalcLangVal, ptr %72, i32 0, i32 0
  %74 = load i32, ptr %73, align 8
  %75 = icmp eq i32 %74, 7
  br i1 %75, label %76, label %136

76:                                               ; preds = %71
  %77 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %77, ptr %7, align 8
  %78 = call noalias ptr @malloc(i64 noundef 16) #5
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.CalcLangVal, ptr %79, i32 0, i32 1
  store ptr %78, ptr %80, align 8
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds %struct.CalcLangVal, ptr %81, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  %84 = getelementptr inbounds %struct.TupleValue, ptr %83, i32 0, i32 0
  %85 = load i32, ptr %84, align 8
  %86 = load ptr, ptr %7, align 8
  %87 = getelementptr inbounds %struct.CalcLangVal, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds %struct.TupleValue, ptr %88, i32 0, i32 0
  store i32 %85, ptr %89, align 8
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.TupleValue, ptr %92, i32 0, i32 0
  %94 = load i32, ptr %93, align 8
  %95 = sext i32 %94 to i64
  %96 = mul i64 8, %95
  %97 = call noalias ptr @malloc(i64 noundef %96) #5
  %98 = load ptr, ptr %7, align 8
  %99 = getelementptr inbounds %struct.CalcLangVal, ptr %98, i32 0, i32 1
  %100 = load ptr, ptr %99, align 8
  %101 = getelementptr inbounds %struct.TupleValue, ptr %100, i32 0, i32 1
  store ptr %97, ptr %101, align 8
  store i32 0, ptr %8, align 4
  br label %102

102:                                              ; preds = %129, %76
  %103 = load i32, ptr %8, align 4
  %104 = load ptr, ptr %7, align 8
  %105 = getelementptr inbounds %struct.CalcLangVal, ptr %104, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr inbounds %struct.TupleValue, ptr %106, i32 0, i32 0
  %108 = load i32, ptr %107, align 8
  %109 = icmp slt i32 %103, %108
  br i1 %109, label %110, label %132

110:                                              ; preds = %102
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.CalcLangVal, ptr %111, i32 0, i32 1
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds %struct.TupleValue, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = load i32, ptr %8, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds ptr, ptr %115, i64 %117
  %119 = load ptr, ptr %118, align 8
  %120 = call ptr @negateCalcLangValue(ptr noundef %119, i32 noundef 1)
  %121 = load ptr, ptr %7, align 8
  %122 = getelementptr inbounds %struct.CalcLangVal, ptr %121, i32 0, i32 1
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds %struct.TupleValue, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  %126 = load i32, ptr %8, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds ptr, ptr %125, i64 %127
  store ptr %120, ptr %128, align 8
  br label %129

129:                                              ; preds = %110
  %130 = load i32, ptr %8, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %8, align 4
  br label %102, !llvm.loop !102

132:                                              ; preds = %102
  %133 = load ptr, ptr %7, align 8
  %134 = getelementptr inbounds %struct.CalcLangVal, ptr %133, i32 0, i32 0
  store i32 7, ptr %134, align 8
  %135 = load ptr, ptr %7, align 8
  store ptr %135, ptr %3, align 8
  br label %209

136:                                              ; preds = %71
  %137 = load ptr, ptr %4, align 8
  %138 = getelementptr inbounds %struct.CalcLangVal, ptr %137, i32 0, i32 0
  %139 = load i32, ptr %138, align 8
  %140 = icmp eq i32 %139, 6
  br i1 %140, label %141, label %201

141:                                              ; preds = %136
  %142 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %142, ptr %9, align 8
  %143 = call noalias ptr @malloc(i64 noundef 16) #5
  %144 = load ptr, ptr %9, align 8
  %145 = getelementptr inbounds %struct.CalcLangVal, ptr %144, i32 0, i32 1
  store ptr %143, ptr %145, align 8
  %146 = load ptr, ptr %4, align 8
  %147 = getelementptr inbounds %struct.CalcLangVal, ptr %146, i32 0, i32 1
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds %struct.SetValue, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %149, align 8
  %151 = load ptr, ptr %9, align 8
  %152 = getelementptr inbounds %struct.CalcLangVal, ptr %151, i32 0, i32 1
  %153 = load ptr, ptr %152, align 8
  %154 = getelementptr inbounds %struct.SetValue, ptr %153, i32 0, i32 0
  store i32 %150, ptr %154, align 8
  %155 = load ptr, ptr %9, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  %157 = load ptr, ptr %156, align 8
  %158 = getelementptr inbounds %struct.SetValue, ptr %157, i32 0, i32 0
  %159 = load i32, ptr %158, align 8
  %160 = sext i32 %159 to i64
  %161 = mul i64 8, %160
  %162 = call noalias ptr @malloc(i64 noundef %161) #5
  %163 = load ptr, ptr %9, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 1
  %165 = load ptr, ptr %164, align 8
  %166 = getelementptr inbounds %struct.SetValue, ptr %165, i32 0, i32 1
  store ptr %162, ptr %166, align 8
  store i32 0, ptr %10, align 4
  br label %167

167:                                              ; preds = %194, %141
  %168 = load i32, ptr %10, align 4
  %169 = load ptr, ptr %9, align 8
  %170 = getelementptr inbounds %struct.CalcLangVal, ptr %169, i32 0, i32 1
  %171 = load ptr, ptr %170, align 8
  %172 = getelementptr inbounds %struct.TupleValue, ptr %171, i32 0, i32 0
  %173 = load i32, ptr %172, align 8
  %174 = icmp slt i32 %168, %173
  br i1 %174, label %175, label %197

175:                                              ; preds = %167
  %176 = load ptr, ptr %4, align 8
  %177 = getelementptr inbounds %struct.CalcLangVal, ptr %176, i32 0, i32 1
  %178 = load ptr, ptr %177, align 8
  %179 = getelementptr inbounds %struct.SetValue, ptr %178, i32 0, i32 1
  %180 = load ptr, ptr %179, align 8
  %181 = load i32, ptr %10, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds ptr, ptr %180, i64 %182
  %184 = load ptr, ptr %183, align 8
  %185 = call ptr @negateCalcLangValue(ptr noundef %184, i32 noundef 1)
  %186 = load ptr, ptr %9, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 1
  %188 = load ptr, ptr %187, align 8
  %189 = getelementptr inbounds %struct.SetValue, ptr %188, i32 0, i32 1
  %190 = load ptr, ptr %189, align 8
  %191 = load i32, ptr %10, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds ptr, ptr %190, i64 %192
  store ptr %185, ptr %193, align 8
  br label %194

194:                                              ; preds = %175
  %195 = load i32, ptr %10, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, ptr %10, align 4
  br label %167, !llvm.loop !103

197:                                              ; preds = %167
  %198 = load ptr, ptr %9, align 8
  %199 = getelementptr inbounds %struct.CalcLangVal, ptr %198, i32 0, i32 0
  store i32 6, ptr %199, align 8
  %200 = load ptr, ptr %9, align 8
  store ptr %200, ptr %3, align 8
  br label %209

201:                                              ; preds = %136
  call void @perror(ptr noundef @.str.5) #6
  br label %202

202:                                              ; preds = %201
  br label %203

203:                                              ; preds = %202
  br label %204

204:                                              ; preds = %203, %62
  br label %205

205:                                              ; preds = %204, %48
  br label %206

206:                                              ; preds = %205, %34
  br label %207

207:                                              ; preds = %206, %20
  %208 = load ptr, ptr %6, align 8
  store ptr %208, ptr %3, align 8
  br label %209

209:                                              ; preds = %207, %197, %132, %13
  %210 = load ptr, ptr %3, align 8
  ret ptr %210
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
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
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
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %23

21:                                               ; preds = %14
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
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
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %32)
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
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %42)
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
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, double noundef %52)
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
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %62)
  br label %157

64:                                               ; preds = %54
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.CalcLangVal, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 7
  br i1 %68, label %69, label %109

69:                                               ; preds = %64
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
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
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
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
  br label %71, !llvm.loop !104

107:                                              ; preds = %71
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %156

109:                                              ; preds = %64
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.CalcLangVal, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = icmp eq i32 %112, 6
  br i1 %113, label %114, label %154

114:                                              ; preds = %109
  %115 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
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
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
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
  br label %116, !llvm.loop !105

152:                                              ; preds = %116
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %155

154:                                              ; preds = %109
  call void @perror(ptr noundef @.str.18) #6
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

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { cold }
attributes #7 = { nounwind }

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
