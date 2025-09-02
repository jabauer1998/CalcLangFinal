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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @newIntValue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
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
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
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
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
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
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
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
  %67 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %67, ptr %10, align 8
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.CalcLangVal, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %89

72:                                               ; preds = %4
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %89

77:                                               ; preds = %72
  %78 = load ptr, ptr %10, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 0
  store i32 0, ptr %79, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 1
  %82 = load i32, ptr %81, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = add nsw i32 %82, %85
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store i32 %86, ptr %88, align 8
  br label %1325

89:                                               ; preds = %72, %4
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %111

94:                                               ; preds = %89
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %111

99:                                               ; preds = %94
  %100 = load ptr, ptr %10, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = fadd double %104, %107
  %109 = load ptr, ptr %10, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  store double %108, ptr %110, align 8
  br label %1324

111:                                              ; preds = %94, %89
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 0
  %114 = load i32, ptr %113, align 8
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %134

116:                                              ; preds = %111
  %117 = load ptr, ptr %8, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %121, label %134

121:                                              ; preds = %116
  %122 = load ptr, ptr %10, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  store i32 1, ptr %123, align 8
  %124 = load ptr, ptr %6, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 1
  %126 = load i32, ptr %125, align 8
  %127 = sitofp i32 %126 to double
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 1
  %130 = load double, ptr %129, align 8
  %131 = fadd double %127, %130
  %132 = load ptr, ptr %10, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %1323

134:                                              ; preds = %116, %111
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 1
  br i1 %138, label %139, label %157

139:                                              ; preds = %134
  %140 = load ptr, ptr %8, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %157

144:                                              ; preds = %139
  %145 = load ptr, ptr %10, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 1, ptr %146, align 8
  %147 = load ptr, ptr %6, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %8, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load i32, ptr %151, align 8
  %153 = sitofp i32 %152 to double
  %154 = fadd double %149, %153
  %155 = load ptr, ptr %10, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  store double %154, ptr %156, align 8
  br label %1322

157:                                              ; preds = %139, %134
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 0
  %160 = load i32, ptr %159, align 8
  %161 = icmp eq i32 %160, 3
  br i1 %161, label %162, label %179

162:                                              ; preds = %157
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 0
  %165 = load i32, ptr %164, align 8
  %166 = icmp eq i32 %165, 3
  br i1 %166, label %167, label %179

167:                                              ; preds = %162
  %168 = load ptr, ptr %10, align 8
  %169 = getelementptr inbounds %struct.CalcLangVal, ptr %168, i32 0, i32 0
  store i32 3, ptr %169, align 8
  %170 = load ptr, ptr %6, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 1
  %172 = load double, ptr %171, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = fadd double %172, %175
  %177 = load ptr, ptr %10, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  store double %176, ptr %178, align 8
  br label %1321

179:                                              ; preds = %162, %157
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 0
  %182 = load i32, ptr %181, align 8
  %183 = icmp eq i32 %182, 4
  br i1 %183, label %184, label %201

184:                                              ; preds = %179
  %185 = load ptr, ptr %8, align 8
  %186 = getelementptr inbounds %struct.CalcLangVal, ptr %185, i32 0, i32 0
  %187 = load i32, ptr %186, align 8
  %188 = icmp eq i32 %187, 4
  br i1 %188, label %189, label %201

189:                                              ; preds = %184
  %190 = load ptr, ptr %10, align 8
  %191 = getelementptr inbounds %struct.CalcLangVal, ptr %190, i32 0, i32 0
  store i32 4, ptr %191, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 1
  %194 = load double, ptr %193, align 8
  %195 = load ptr, ptr %8, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 1
  %197 = load double, ptr %196, align 8
  %198 = fadd double %194, %197
  %199 = load ptr, ptr %10, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  store double %198, ptr %200, align 8
  br label %1320

201:                                              ; preds = %184, %179
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 0
  %204 = load i32, ptr %203, align 8
  %205 = icmp eq i32 %204, 7
  br i1 %205, label %206, label %279

206:                                              ; preds = %201
  %207 = load ptr, ptr %8, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 0
  %209 = load i32, ptr %208, align 8
  %210 = icmp eq i32 %209, 7
  br i1 %210, label %211, label %279

211:                                              ; preds = %206
  %212 = load ptr, ptr %6, align 8
  %213 = getelementptr inbounds %struct.CalcLangVal, ptr %212, i32 0, i32 1
  %214 = load ptr, ptr %213, align 8
  store ptr %214, ptr %11, align 8
  %215 = load ptr, ptr %8, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  store ptr %217, ptr %12, align 8
  %218 = load ptr, ptr %12, align 8
  %219 = getelementptr inbounds %struct.TupleValue, ptr %218, i32 0, i32 0
  %220 = load i32, ptr %219, align 8
  %221 = load ptr, ptr %11, align 8
  %222 = getelementptr inbounds %struct.TupleValue, ptr %221, i32 0, i32 0
  %223 = load i32, ptr %222, align 8
  %224 = icmp eq i32 %220, %223
  br i1 %224, label %225, label %277

225:                                              ; preds = %211
  %226 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %226, ptr %13, align 8
  %227 = load ptr, ptr %11, align 8
  %228 = getelementptr inbounds %struct.TupleValue, ptr %227, i32 0, i32 0
  %229 = load i32, ptr %228, align 8
  %230 = load ptr, ptr %13, align 8
  %231 = getelementptr inbounds %struct.TupleValue, ptr %230, i32 0, i32 0
  store i32 %229, ptr %231, align 8
  %232 = load ptr, ptr %13, align 8
  %233 = getelementptr inbounds %struct.TupleValue, ptr %232, i32 0, i32 0
  %234 = load i32, ptr %233, align 8
  %235 = sext i32 %234 to i64
  %236 = mul i64 8, %235
  %237 = call noalias ptr @malloc(i64 noundef %236) #4
  %238 = load ptr, ptr %13, align 8
  %239 = getelementptr inbounds %struct.TupleValue, ptr %238, i32 0, i32 1
  store ptr %237, ptr %239, align 8
  store i32 0, ptr %14, align 4
  br label %240

240:                                              ; preds = %268, %225
  %241 = load i32, ptr %14, align 4
  %242 = load ptr, ptr %11, align 8
  %243 = getelementptr inbounds %struct.TupleValue, ptr %242, i32 0, i32 0
  %244 = load i32, ptr %243, align 8
  %245 = icmp slt i32 %241, %244
  br i1 %245, label %246, label %271

246:                                              ; preds = %240
  %247 = load ptr, ptr %11, align 8
  %248 = getelementptr inbounds %struct.TupleValue, ptr %247, i32 0, i32 1
  %249 = load ptr, ptr %248, align 8
  %250 = load i32, ptr %14, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds ptr, ptr %249, i64 %251
  %253 = load ptr, ptr %252, align 8
  %254 = load ptr, ptr %12, align 8
  %255 = getelementptr inbounds %struct.TupleValue, ptr %254, i32 0, i32 1
  %256 = load ptr, ptr %255, align 8
  %257 = load i32, ptr %14, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds ptr, ptr %256, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = call ptr @addCalcLangValues(ptr noundef %253, i32 noundef 1, ptr noundef %260, i32 noundef 0)
  %262 = load ptr, ptr %13, align 8
  %263 = getelementptr inbounds %struct.TupleValue, ptr %262, i32 0, i32 1
  %264 = load ptr, ptr %263, align 8
  %265 = load i32, ptr %14, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds ptr, ptr %264, i64 %266
  store ptr %261, ptr %267, align 8
  br label %268

268:                                              ; preds = %246
  %269 = load i32, ptr %14, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, ptr %14, align 4
  br label %240, !llvm.loop !6

271:                                              ; preds = %240
  %272 = load ptr, ptr %10, align 8
  %273 = getelementptr inbounds %struct.CalcLangVal, ptr %272, i32 0, i32 0
  store i32 7, ptr %273, align 8
  %274 = load ptr, ptr %13, align 8
  %275 = load ptr, ptr %10, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 1
  store ptr %274, ptr %276, align 8
  br label %278

277:                                              ; preds = %211
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1338

278:                                              ; preds = %271
  br label %1319

279:                                              ; preds = %206, %201
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds %struct.CalcLangVal, ptr %280, i32 0, i32 0
  %282 = load i32, ptr %281, align 8
  %283 = icmp eq i32 %282, 7
  br i1 %283, label %284, label %338

284:                                              ; preds = %279
  %285 = load ptr, ptr %8, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 0
  %287 = load i32, ptr %286, align 8
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %289, label %338

289:                                              ; preds = %284
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 1
  %292 = load ptr, ptr %291, align 8
  store ptr %292, ptr %15, align 8
  %293 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %293, ptr %16, align 8
  %294 = load ptr, ptr %15, align 8
  %295 = getelementptr inbounds %struct.TupleValue, ptr %294, i32 0, i32 0
  %296 = load i32, ptr %295, align 8
  %297 = load ptr, ptr %16, align 8
  %298 = getelementptr inbounds %struct.TupleValue, ptr %297, i32 0, i32 0
  store i32 %296, ptr %298, align 8
  %299 = load ptr, ptr %16, align 8
  %300 = getelementptr inbounds %struct.TupleValue, ptr %299, i32 0, i32 0
  %301 = load i32, ptr %300, align 8
  %302 = sext i32 %301 to i64
  %303 = mul i64 8, %302
  %304 = call noalias ptr @malloc(i64 noundef %303) #4
  %305 = load ptr, ptr %16, align 8
  %306 = getelementptr inbounds %struct.TupleValue, ptr %305, i32 0, i32 1
  store ptr %304, ptr %306, align 8
  store i32 0, ptr %17, align 4
  br label %307

307:                                              ; preds = %329, %289
  %308 = load i32, ptr %17, align 4
  %309 = load ptr, ptr %15, align 8
  %310 = getelementptr inbounds %struct.TupleValue, ptr %309, i32 0, i32 0
  %311 = load i32, ptr %310, align 8
  %312 = icmp slt i32 %308, %311
  br i1 %312, label %313, label %332

313:                                              ; preds = %307
  %314 = load ptr, ptr %15, align 8
  %315 = getelementptr inbounds %struct.TupleValue, ptr %314, i32 0, i32 1
  %316 = load ptr, ptr %315, align 8
  %317 = load i32, ptr %17, align 4
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds ptr, ptr %316, i64 %318
  %320 = load ptr, ptr %319, align 8
  %321 = load ptr, ptr %8, align 8
  %322 = call ptr @addCalcLangValues(ptr noundef %320, i32 noundef 1, ptr noundef %321, i32 noundef 0)
  %323 = load ptr, ptr %16, align 8
  %324 = getelementptr inbounds %struct.TupleValue, ptr %323, i32 0, i32 1
  %325 = load ptr, ptr %324, align 8
  %326 = load i32, ptr %17, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds ptr, ptr %325, i64 %327
  store ptr %322, ptr %328, align 8
  br label %329

329:                                              ; preds = %313
  %330 = load i32, ptr %17, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, ptr %17, align 4
  br label %307, !llvm.loop !8

332:                                              ; preds = %307
  %333 = load ptr, ptr %10, align 8
  %334 = getelementptr inbounds %struct.CalcLangVal, ptr %333, i32 0, i32 0
  store i32 7, ptr %334, align 8
  %335 = load ptr, ptr %16, align 8
  %336 = load ptr, ptr %10, align 8
  %337 = getelementptr inbounds %struct.CalcLangVal, ptr %336, i32 0, i32 1
  store ptr %335, ptr %337, align 8
  br label %1318

338:                                              ; preds = %284, %279
  %339 = load ptr, ptr %6, align 8
  %340 = getelementptr inbounds %struct.CalcLangVal, ptr %339, i32 0, i32 0
  %341 = load i32, ptr %340, align 8
  %342 = icmp eq i32 %341, 0
  br i1 %342, label %343, label %397

343:                                              ; preds = %338
  %344 = load ptr, ptr %8, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = icmp eq i32 %346, 7
  br i1 %347, label %348, label %397

348:                                              ; preds = %343
  %349 = load ptr, ptr %8, align 8
  %350 = getelementptr inbounds %struct.CalcLangVal, ptr %349, i32 0, i32 1
  %351 = load ptr, ptr %350, align 8
  store ptr %351, ptr %18, align 8
  %352 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %352, ptr %19, align 8
  %353 = load ptr, ptr %18, align 8
  %354 = getelementptr inbounds %struct.TupleValue, ptr %353, i32 0, i32 0
  %355 = load i32, ptr %354, align 8
  %356 = load ptr, ptr %19, align 8
  %357 = getelementptr inbounds %struct.TupleValue, ptr %356, i32 0, i32 0
  store i32 %355, ptr %357, align 8
  %358 = load ptr, ptr %19, align 8
  %359 = getelementptr inbounds %struct.TupleValue, ptr %358, i32 0, i32 0
  %360 = load i32, ptr %359, align 8
  %361 = sext i32 %360 to i64
  %362 = mul i64 8, %361
  %363 = call noalias ptr @malloc(i64 noundef %362) #4
  %364 = load ptr, ptr %19, align 8
  %365 = getelementptr inbounds %struct.TupleValue, ptr %364, i32 0, i32 1
  store ptr %363, ptr %365, align 8
  store i32 0, ptr %20, align 4
  br label %366

366:                                              ; preds = %388, %348
  %367 = load i32, ptr %20, align 4
  %368 = load ptr, ptr %18, align 8
  %369 = getelementptr inbounds %struct.TupleValue, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = icmp slt i32 %367, %370
  br i1 %371, label %372, label %391

372:                                              ; preds = %366
  %373 = load ptr, ptr %6, align 8
  %374 = load ptr, ptr %18, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 1
  %376 = load ptr, ptr %375, align 8
  %377 = load i32, ptr %20, align 4
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds ptr, ptr %376, i64 %378
  %380 = load ptr, ptr %379, align 8
  %381 = call ptr @addCalcLangValues(ptr noundef %373, i32 noundef 0, ptr noundef %380, i32 noundef 1)
  %382 = load ptr, ptr %19, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 1
  %384 = load ptr, ptr %383, align 8
  %385 = load i32, ptr %20, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds ptr, ptr %384, i64 %386
  store ptr %381, ptr %387, align 8
  br label %388

388:                                              ; preds = %372
  %389 = load i32, ptr %20, align 4
  %390 = add nsw i32 %389, 1
  store i32 %390, ptr %20, align 4
  br label %366, !llvm.loop !9

391:                                              ; preds = %366
  %392 = load ptr, ptr %10, align 8
  %393 = getelementptr inbounds %struct.CalcLangVal, ptr %392, i32 0, i32 0
  store i32 7, ptr %393, align 8
  %394 = load ptr, ptr %19, align 8
  %395 = load ptr, ptr %10, align 8
  %396 = getelementptr inbounds %struct.CalcLangVal, ptr %395, i32 0, i32 1
  store ptr %394, ptr %396, align 8
  br label %1317

397:                                              ; preds = %343, %338
  %398 = load ptr, ptr %6, align 8
  %399 = getelementptr inbounds %struct.CalcLangVal, ptr %398, i32 0, i32 0
  %400 = load i32, ptr %399, align 8
  %401 = icmp eq i32 %400, 7
  br i1 %401, label %402, label %456

402:                                              ; preds = %397
  %403 = load ptr, ptr %8, align 8
  %404 = getelementptr inbounds %struct.CalcLangVal, ptr %403, i32 0, i32 0
  %405 = load i32, ptr %404, align 8
  %406 = icmp eq i32 %405, 1
  br i1 %406, label %407, label %456

407:                                              ; preds = %402
  %408 = load ptr, ptr %6, align 8
  %409 = getelementptr inbounds %struct.CalcLangVal, ptr %408, i32 0, i32 1
  %410 = load ptr, ptr %409, align 8
  store ptr %410, ptr %21, align 8
  %411 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %411, ptr %22, align 8
  %412 = load ptr, ptr %21, align 8
  %413 = getelementptr inbounds %struct.TupleValue, ptr %412, i32 0, i32 0
  %414 = load i32, ptr %413, align 8
  %415 = load ptr, ptr %22, align 8
  %416 = getelementptr inbounds %struct.TupleValue, ptr %415, i32 0, i32 0
  store i32 %414, ptr %416, align 8
  %417 = load ptr, ptr %22, align 8
  %418 = getelementptr inbounds %struct.TupleValue, ptr %417, i32 0, i32 0
  %419 = load i32, ptr %418, align 8
  %420 = sext i32 %419 to i64
  %421 = mul i64 8, %420
  %422 = call noalias ptr @malloc(i64 noundef %421) #4
  %423 = load ptr, ptr %22, align 8
  %424 = getelementptr inbounds %struct.TupleValue, ptr %423, i32 0, i32 1
  store ptr %422, ptr %424, align 8
  store i32 0, ptr %23, align 4
  br label %425

425:                                              ; preds = %447, %407
  %426 = load i32, ptr %23, align 4
  %427 = load ptr, ptr %21, align 8
  %428 = getelementptr inbounds %struct.TupleValue, ptr %427, i32 0, i32 0
  %429 = load i32, ptr %428, align 8
  %430 = icmp slt i32 %426, %429
  br i1 %430, label %431, label %450

431:                                              ; preds = %425
  %432 = load ptr, ptr %21, align 8
  %433 = getelementptr inbounds %struct.TupleValue, ptr %432, i32 0, i32 1
  %434 = load ptr, ptr %433, align 8
  %435 = load i32, ptr %23, align 4
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds ptr, ptr %434, i64 %436
  %438 = load ptr, ptr %437, align 8
  %439 = load ptr, ptr %8, align 8
  %440 = call ptr @addCalcLangValues(ptr noundef %438, i32 noundef 1, ptr noundef %439, i32 noundef 0)
  %441 = load ptr, ptr %22, align 8
  %442 = getelementptr inbounds %struct.TupleValue, ptr %441, i32 0, i32 1
  %443 = load ptr, ptr %442, align 8
  %444 = load i32, ptr %23, align 4
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds ptr, ptr %443, i64 %445
  store ptr %440, ptr %446, align 8
  br label %447

447:                                              ; preds = %431
  %448 = load i32, ptr %23, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, ptr %23, align 4
  br label %425, !llvm.loop !10

450:                                              ; preds = %425
  %451 = load ptr, ptr %10, align 8
  %452 = getelementptr inbounds %struct.CalcLangVal, ptr %451, i32 0, i32 0
  store i32 7, ptr %452, align 8
  %453 = load ptr, ptr %22, align 8
  %454 = load ptr, ptr %10, align 8
  %455 = getelementptr inbounds %struct.CalcLangVal, ptr %454, i32 0, i32 1
  store ptr %453, ptr %455, align 8
  br label %1316

456:                                              ; preds = %402, %397
  %457 = load ptr, ptr %6, align 8
  %458 = getelementptr inbounds %struct.CalcLangVal, ptr %457, i32 0, i32 0
  %459 = load i32, ptr %458, align 8
  %460 = icmp eq i32 %459, 1
  br i1 %460, label %461, label %515

461:                                              ; preds = %456
  %462 = load ptr, ptr %8, align 8
  %463 = getelementptr inbounds %struct.CalcLangVal, ptr %462, i32 0, i32 0
  %464 = load i32, ptr %463, align 8
  %465 = icmp eq i32 %464, 7
  br i1 %465, label %466, label %515

466:                                              ; preds = %461
  %467 = load ptr, ptr %8, align 8
  %468 = getelementptr inbounds %struct.CalcLangVal, ptr %467, i32 0, i32 1
  %469 = load ptr, ptr %468, align 8
  store ptr %469, ptr %24, align 8
  %470 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %470, ptr %25, align 8
  %471 = load ptr, ptr %24, align 8
  %472 = getelementptr inbounds %struct.TupleValue, ptr %471, i32 0, i32 0
  %473 = load i32, ptr %472, align 8
  %474 = load ptr, ptr %25, align 8
  %475 = getelementptr inbounds %struct.TupleValue, ptr %474, i32 0, i32 0
  store i32 %473, ptr %475, align 8
  %476 = load ptr, ptr %25, align 8
  %477 = getelementptr inbounds %struct.TupleValue, ptr %476, i32 0, i32 0
  %478 = load i32, ptr %477, align 8
  %479 = sext i32 %478 to i64
  %480 = mul i64 8, %479
  %481 = call noalias ptr @malloc(i64 noundef %480) #4
  %482 = load ptr, ptr %25, align 8
  %483 = getelementptr inbounds %struct.TupleValue, ptr %482, i32 0, i32 1
  store ptr %481, ptr %483, align 8
  store i32 0, ptr %26, align 4
  br label %484

484:                                              ; preds = %506, %466
  %485 = load i32, ptr %26, align 4
  %486 = load ptr, ptr %24, align 8
  %487 = getelementptr inbounds %struct.TupleValue, ptr %486, i32 0, i32 0
  %488 = load i32, ptr %487, align 8
  %489 = icmp slt i32 %485, %488
  br i1 %489, label %490, label %509

490:                                              ; preds = %484
  %491 = load ptr, ptr %6, align 8
  %492 = load ptr, ptr %24, align 8
  %493 = getelementptr inbounds %struct.TupleValue, ptr %492, i32 0, i32 1
  %494 = load ptr, ptr %493, align 8
  %495 = load i32, ptr %26, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds ptr, ptr %494, i64 %496
  %498 = load ptr, ptr %497, align 8
  %499 = call ptr @addCalcLangValues(ptr noundef %491, i32 noundef 0, ptr noundef %498, i32 noundef 1)
  %500 = load ptr, ptr %25, align 8
  %501 = getelementptr inbounds %struct.TupleValue, ptr %500, i32 0, i32 1
  %502 = load ptr, ptr %501, align 8
  %503 = load i32, ptr %26, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds ptr, ptr %502, i64 %504
  store ptr %499, ptr %505, align 8
  br label %506

506:                                              ; preds = %490
  %507 = load i32, ptr %26, align 4
  %508 = add nsw i32 %507, 1
  store i32 %508, ptr %26, align 4
  br label %484, !llvm.loop !11

509:                                              ; preds = %484
  %510 = load ptr, ptr %10, align 8
  %511 = getelementptr inbounds %struct.CalcLangVal, ptr %510, i32 0, i32 0
  store i32 7, ptr %511, align 8
  %512 = load ptr, ptr %25, align 8
  %513 = load ptr, ptr %10, align 8
  %514 = getelementptr inbounds %struct.CalcLangVal, ptr %513, i32 0, i32 1
  store ptr %512, ptr %514, align 8
  br label %1315

515:                                              ; preds = %461, %456
  %516 = load ptr, ptr %6, align 8
  %517 = getelementptr inbounds %struct.CalcLangVal, ptr %516, i32 0, i32 0
  %518 = load i32, ptr %517, align 8
  %519 = icmp eq i32 %518, 7
  br i1 %519, label %520, label %574

520:                                              ; preds = %515
  %521 = load ptr, ptr %8, align 8
  %522 = getelementptr inbounds %struct.CalcLangVal, ptr %521, i32 0, i32 0
  %523 = load i32, ptr %522, align 8
  %524 = icmp eq i32 %523, 3
  br i1 %524, label %525, label %574

525:                                              ; preds = %520
  %526 = load ptr, ptr %6, align 8
  %527 = getelementptr inbounds %struct.CalcLangVal, ptr %526, i32 0, i32 1
  %528 = load ptr, ptr %527, align 8
  store ptr %528, ptr %27, align 8
  %529 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %529, ptr %28, align 8
  %530 = load ptr, ptr %27, align 8
  %531 = getelementptr inbounds %struct.TupleValue, ptr %530, i32 0, i32 0
  %532 = load i32, ptr %531, align 8
  %533 = load ptr, ptr %28, align 8
  %534 = getelementptr inbounds %struct.TupleValue, ptr %533, i32 0, i32 0
  store i32 %532, ptr %534, align 8
  %535 = load ptr, ptr %28, align 8
  %536 = getelementptr inbounds %struct.TupleValue, ptr %535, i32 0, i32 0
  %537 = load i32, ptr %536, align 8
  %538 = sext i32 %537 to i64
  %539 = mul i64 8, %538
  %540 = call noalias ptr @malloc(i64 noundef %539) #4
  %541 = load ptr, ptr %28, align 8
  %542 = getelementptr inbounds %struct.TupleValue, ptr %541, i32 0, i32 1
  store ptr %540, ptr %542, align 8
  store i32 0, ptr %29, align 4
  br label %543

543:                                              ; preds = %565, %525
  %544 = load i32, ptr %29, align 4
  %545 = load ptr, ptr %27, align 8
  %546 = getelementptr inbounds %struct.TupleValue, ptr %545, i32 0, i32 0
  %547 = load i32, ptr %546, align 8
  %548 = icmp slt i32 %544, %547
  br i1 %548, label %549, label %568

549:                                              ; preds = %543
  %550 = load ptr, ptr %27, align 8
  %551 = getelementptr inbounds %struct.TupleValue, ptr %550, i32 0, i32 1
  %552 = load ptr, ptr %551, align 8
  %553 = load i32, ptr %29, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds ptr, ptr %552, i64 %554
  %556 = load ptr, ptr %555, align 8
  %557 = load ptr, ptr %8, align 8
  %558 = call ptr @addCalcLangValues(ptr noundef %556, i32 noundef 1, ptr noundef %557, i32 noundef 0)
  %559 = load ptr, ptr %28, align 8
  %560 = getelementptr inbounds %struct.TupleValue, ptr %559, i32 0, i32 1
  %561 = load ptr, ptr %560, align 8
  %562 = load i32, ptr %29, align 4
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds ptr, ptr %561, i64 %563
  store ptr %558, ptr %564, align 8
  br label %565

565:                                              ; preds = %549
  %566 = load i32, ptr %29, align 4
  %567 = add nsw i32 %566, 1
  store i32 %567, ptr %29, align 4
  br label %543, !llvm.loop !12

568:                                              ; preds = %543
  %569 = load ptr, ptr %10, align 8
  %570 = getelementptr inbounds %struct.CalcLangVal, ptr %569, i32 0, i32 0
  store i32 7, ptr %570, align 8
  %571 = load ptr, ptr %28, align 8
  %572 = load ptr, ptr %10, align 8
  %573 = getelementptr inbounds %struct.CalcLangVal, ptr %572, i32 0, i32 1
  store ptr %571, ptr %573, align 8
  br label %1314

574:                                              ; preds = %520, %515
  %575 = load ptr, ptr %6, align 8
  %576 = getelementptr inbounds %struct.CalcLangVal, ptr %575, i32 0, i32 0
  %577 = load i32, ptr %576, align 8
  %578 = icmp eq i32 %577, 3
  br i1 %578, label %579, label %633

579:                                              ; preds = %574
  %580 = load ptr, ptr %8, align 8
  %581 = getelementptr inbounds %struct.CalcLangVal, ptr %580, i32 0, i32 0
  %582 = load i32, ptr %581, align 8
  %583 = icmp eq i32 %582, 7
  br i1 %583, label %584, label %633

584:                                              ; preds = %579
  %585 = load ptr, ptr %8, align 8
  %586 = getelementptr inbounds %struct.CalcLangVal, ptr %585, i32 0, i32 1
  %587 = load ptr, ptr %586, align 8
  store ptr %587, ptr %30, align 8
  %588 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %588, ptr %31, align 8
  %589 = load ptr, ptr %30, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 0
  %591 = load i32, ptr %590, align 8
  %592 = load ptr, ptr %31, align 8
  %593 = getelementptr inbounds %struct.TupleValue, ptr %592, i32 0, i32 0
  store i32 %591, ptr %593, align 8
  %594 = load ptr, ptr %31, align 8
  %595 = getelementptr inbounds %struct.TupleValue, ptr %594, i32 0, i32 0
  %596 = load i32, ptr %595, align 8
  %597 = sext i32 %596 to i64
  %598 = mul i64 8, %597
  %599 = call noalias ptr @malloc(i64 noundef %598) #4
  %600 = load ptr, ptr %31, align 8
  %601 = getelementptr inbounds %struct.TupleValue, ptr %600, i32 0, i32 1
  store ptr %599, ptr %601, align 8
  store i32 0, ptr %32, align 4
  br label %602

602:                                              ; preds = %624, %584
  %603 = load i32, ptr %32, align 4
  %604 = load ptr, ptr %30, align 8
  %605 = getelementptr inbounds %struct.TupleValue, ptr %604, i32 0, i32 0
  %606 = load i32, ptr %605, align 8
  %607 = icmp slt i32 %603, %606
  br i1 %607, label %608, label %627

608:                                              ; preds = %602
  %609 = load ptr, ptr %6, align 8
  %610 = load ptr, ptr %30, align 8
  %611 = getelementptr inbounds %struct.TupleValue, ptr %610, i32 0, i32 1
  %612 = load ptr, ptr %611, align 8
  %613 = load i32, ptr %32, align 4
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds ptr, ptr %612, i64 %614
  %616 = load ptr, ptr %615, align 8
  %617 = call ptr @addCalcLangValues(ptr noundef %609, i32 noundef 0, ptr noundef %616, i32 noundef 1)
  %618 = load ptr, ptr %31, align 8
  %619 = getelementptr inbounds %struct.TupleValue, ptr %618, i32 0, i32 1
  %620 = load ptr, ptr %619, align 8
  %621 = load i32, ptr %32, align 4
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds ptr, ptr %620, i64 %622
  store ptr %617, ptr %623, align 8
  br label %624

624:                                              ; preds = %608
  %625 = load i32, ptr %32, align 4
  %626 = add nsw i32 %625, 1
  store i32 %626, ptr %32, align 4
  br label %602, !llvm.loop !13

627:                                              ; preds = %602
  %628 = load ptr, ptr %10, align 8
  %629 = getelementptr inbounds %struct.CalcLangVal, ptr %628, i32 0, i32 0
  store i32 7, ptr %629, align 8
  %630 = load ptr, ptr %31, align 8
  %631 = load ptr, ptr %10, align 8
  %632 = getelementptr inbounds %struct.CalcLangVal, ptr %631, i32 0, i32 1
  store ptr %630, ptr %632, align 8
  br label %1313

633:                                              ; preds = %579, %574
  %634 = load ptr, ptr %6, align 8
  %635 = getelementptr inbounds %struct.CalcLangVal, ptr %634, i32 0, i32 0
  %636 = load i32, ptr %635, align 8
  %637 = icmp eq i32 %636, 7
  br i1 %637, label %638, label %692

638:                                              ; preds = %633
  %639 = load ptr, ptr %8, align 8
  %640 = getelementptr inbounds %struct.CalcLangVal, ptr %639, i32 0, i32 0
  %641 = load i32, ptr %640, align 8
  %642 = icmp eq i32 %641, 4
  br i1 %642, label %643, label %692

643:                                              ; preds = %638
  %644 = load ptr, ptr %6, align 8
  %645 = getelementptr inbounds %struct.CalcLangVal, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  store ptr %646, ptr %33, align 8
  %647 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %647, ptr %34, align 8
  %648 = load ptr, ptr %33, align 8
  %649 = getelementptr inbounds %struct.TupleValue, ptr %648, i32 0, i32 0
  %650 = load i32, ptr %649, align 8
  %651 = load ptr, ptr %34, align 8
  %652 = getelementptr inbounds %struct.TupleValue, ptr %651, i32 0, i32 0
  store i32 %650, ptr %652, align 8
  %653 = load ptr, ptr %34, align 8
  %654 = getelementptr inbounds %struct.TupleValue, ptr %653, i32 0, i32 0
  %655 = load i32, ptr %654, align 8
  %656 = sext i32 %655 to i64
  %657 = mul i64 8, %656
  %658 = call noalias ptr @malloc(i64 noundef %657) #4
  %659 = load ptr, ptr %34, align 8
  %660 = getelementptr inbounds %struct.TupleValue, ptr %659, i32 0, i32 1
  store ptr %658, ptr %660, align 8
  store i32 0, ptr %35, align 4
  br label %661

661:                                              ; preds = %683, %643
  %662 = load i32, ptr %35, align 4
  %663 = load ptr, ptr %33, align 8
  %664 = getelementptr inbounds %struct.TupleValue, ptr %663, i32 0, i32 0
  %665 = load i32, ptr %664, align 8
  %666 = icmp slt i32 %662, %665
  br i1 %666, label %667, label %686

667:                                              ; preds = %661
  %668 = load ptr, ptr %33, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  %670 = load ptr, ptr %669, align 8
  %671 = load i32, ptr %35, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds ptr, ptr %670, i64 %672
  %674 = load ptr, ptr %673, align 8
  %675 = load ptr, ptr %8, align 8
  %676 = call ptr @addCalcLangValues(ptr noundef %674, i32 noundef 1, ptr noundef %675, i32 noundef 0)
  %677 = load ptr, ptr %34, align 8
  %678 = getelementptr inbounds %struct.TupleValue, ptr %677, i32 0, i32 1
  %679 = load ptr, ptr %678, align 8
  %680 = load i32, ptr %35, align 4
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds ptr, ptr %679, i64 %681
  store ptr %676, ptr %682, align 8
  br label %683

683:                                              ; preds = %667
  %684 = load i32, ptr %35, align 4
  %685 = add nsw i32 %684, 1
  store i32 %685, ptr %35, align 4
  br label %661, !llvm.loop !14

686:                                              ; preds = %661
  %687 = load ptr, ptr %10, align 8
  %688 = getelementptr inbounds %struct.CalcLangVal, ptr %687, i32 0, i32 0
  store i32 7, ptr %688, align 8
  %689 = load ptr, ptr %34, align 8
  %690 = load ptr, ptr %10, align 8
  %691 = getelementptr inbounds %struct.CalcLangVal, ptr %690, i32 0, i32 1
  store ptr %689, ptr %691, align 8
  br label %1312

692:                                              ; preds = %638, %633
  %693 = load ptr, ptr %6, align 8
  %694 = getelementptr inbounds %struct.CalcLangVal, ptr %693, i32 0, i32 0
  %695 = load i32, ptr %694, align 8
  %696 = icmp eq i32 %695, 4
  br i1 %696, label %697, label %751

697:                                              ; preds = %692
  %698 = load ptr, ptr %8, align 8
  %699 = getelementptr inbounds %struct.CalcLangVal, ptr %698, i32 0, i32 0
  %700 = load i32, ptr %699, align 8
  %701 = icmp eq i32 %700, 7
  br i1 %701, label %702, label %751

702:                                              ; preds = %697
  %703 = load ptr, ptr %8, align 8
  %704 = getelementptr inbounds %struct.CalcLangVal, ptr %703, i32 0, i32 1
  %705 = load ptr, ptr %704, align 8
  store ptr %705, ptr %36, align 8
  %706 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %706, ptr %37, align 8
  %707 = load ptr, ptr %36, align 8
  %708 = getelementptr inbounds %struct.TupleValue, ptr %707, i32 0, i32 0
  %709 = load i32, ptr %708, align 8
  %710 = load ptr, ptr %37, align 8
  %711 = getelementptr inbounds %struct.TupleValue, ptr %710, i32 0, i32 0
  store i32 %709, ptr %711, align 8
  %712 = load ptr, ptr %37, align 8
  %713 = getelementptr inbounds %struct.TupleValue, ptr %712, i32 0, i32 0
  %714 = load i32, ptr %713, align 8
  %715 = sext i32 %714 to i64
  %716 = mul i64 8, %715
  %717 = call noalias ptr @malloc(i64 noundef %716) #4
  %718 = load ptr, ptr %37, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 1
  store ptr %717, ptr %719, align 8
  store i32 0, ptr %38, align 4
  br label %720

720:                                              ; preds = %742, %702
  %721 = load i32, ptr %38, align 4
  %722 = load ptr, ptr %36, align 8
  %723 = getelementptr inbounds %struct.TupleValue, ptr %722, i32 0, i32 0
  %724 = load i32, ptr %723, align 8
  %725 = icmp slt i32 %721, %724
  br i1 %725, label %726, label %745

726:                                              ; preds = %720
  %727 = load ptr, ptr %6, align 8
  %728 = load ptr, ptr %36, align 8
  %729 = getelementptr inbounds %struct.TupleValue, ptr %728, i32 0, i32 1
  %730 = load ptr, ptr %729, align 8
  %731 = load i32, ptr %38, align 4
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds ptr, ptr %730, i64 %732
  %734 = load ptr, ptr %733, align 8
  %735 = call ptr @addCalcLangValues(ptr noundef %727, i32 noundef 0, ptr noundef %734, i32 noundef 1)
  %736 = load ptr, ptr %37, align 8
  %737 = getelementptr inbounds %struct.TupleValue, ptr %736, i32 0, i32 1
  %738 = load ptr, ptr %737, align 8
  %739 = load i32, ptr %38, align 4
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds ptr, ptr %738, i64 %740
  store ptr %735, ptr %741, align 8
  br label %742

742:                                              ; preds = %726
  %743 = load i32, ptr %38, align 4
  %744 = add nsw i32 %743, 1
  store i32 %744, ptr %38, align 4
  br label %720, !llvm.loop !15

745:                                              ; preds = %720
  %746 = load ptr, ptr %10, align 8
  %747 = getelementptr inbounds %struct.CalcLangVal, ptr %746, i32 0, i32 0
  store i32 7, ptr %747, align 8
  %748 = load ptr, ptr %37, align 8
  %749 = load ptr, ptr %10, align 8
  %750 = getelementptr inbounds %struct.CalcLangVal, ptr %749, i32 0, i32 1
  store ptr %748, ptr %750, align 8
  br label %1311

751:                                              ; preds = %697, %692
  %752 = load ptr, ptr %6, align 8
  %753 = getelementptr inbounds %struct.CalcLangVal, ptr %752, i32 0, i32 0
  %754 = load i32, ptr %753, align 8
  %755 = icmp eq i32 %754, 6
  br i1 %755, label %756, label %829

756:                                              ; preds = %751
  %757 = load ptr, ptr %8, align 8
  %758 = getelementptr inbounds %struct.CalcLangVal, ptr %757, i32 0, i32 0
  %759 = load i32, ptr %758, align 8
  %760 = icmp eq i32 %759, 6
  br i1 %760, label %761, label %829

761:                                              ; preds = %756
  %762 = load ptr, ptr %6, align 8
  %763 = getelementptr inbounds %struct.CalcLangVal, ptr %762, i32 0, i32 1
  %764 = load ptr, ptr %763, align 8
  store ptr %764, ptr %39, align 8
  %765 = load ptr, ptr %8, align 8
  %766 = getelementptr inbounds %struct.CalcLangVal, ptr %765, i32 0, i32 1
  %767 = load ptr, ptr %766, align 8
  store ptr %767, ptr %40, align 8
  %768 = load ptr, ptr %40, align 8
  %769 = getelementptr inbounds %struct.SetValue, ptr %768, i32 0, i32 0
  %770 = load i32, ptr %769, align 8
  %771 = load ptr, ptr %39, align 8
  %772 = getelementptr inbounds %struct.SetValue, ptr %771, i32 0, i32 0
  %773 = load i32, ptr %772, align 8
  %774 = icmp eq i32 %770, %773
  br i1 %774, label %775, label %827

775:                                              ; preds = %761
  %776 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %776, ptr %41, align 8
  %777 = load ptr, ptr %39, align 8
  %778 = getelementptr inbounds %struct.SetValue, ptr %777, i32 0, i32 0
  %779 = load i32, ptr %778, align 8
  %780 = load ptr, ptr %41, align 8
  %781 = getelementptr inbounds %struct.SetValue, ptr %780, i32 0, i32 0
  store i32 %779, ptr %781, align 8
  %782 = load ptr, ptr %41, align 8
  %783 = getelementptr inbounds %struct.SetValue, ptr %782, i32 0, i32 0
  %784 = load i32, ptr %783, align 8
  %785 = sext i32 %784 to i64
  %786 = mul i64 8, %785
  %787 = call noalias ptr @malloc(i64 noundef %786) #4
  %788 = load ptr, ptr %41, align 8
  %789 = getelementptr inbounds %struct.SetValue, ptr %788, i32 0, i32 1
  store ptr %787, ptr %789, align 8
  store i32 0, ptr %42, align 4
  br label %790

790:                                              ; preds = %818, %775
  %791 = load i32, ptr %42, align 4
  %792 = load ptr, ptr %39, align 8
  %793 = getelementptr inbounds %struct.SetValue, ptr %792, i32 0, i32 0
  %794 = load i32, ptr %793, align 8
  %795 = icmp slt i32 %791, %794
  br i1 %795, label %796, label %821

796:                                              ; preds = %790
  %797 = load ptr, ptr %39, align 8
  %798 = getelementptr inbounds %struct.SetValue, ptr %797, i32 0, i32 1
  %799 = load ptr, ptr %798, align 8
  %800 = load i32, ptr %42, align 4
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds ptr, ptr %799, i64 %801
  %803 = load ptr, ptr %802, align 8
  %804 = load ptr, ptr %40, align 8
  %805 = getelementptr inbounds %struct.SetValue, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  %807 = load i32, ptr %42, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds ptr, ptr %806, i64 %808
  %810 = load ptr, ptr %809, align 8
  %811 = call ptr @addCalcLangValues(ptr noundef %803, i32 noundef 1, ptr noundef %810, i32 noundef 1)
  %812 = load ptr, ptr %41, align 8
  %813 = getelementptr inbounds %struct.SetValue, ptr %812, i32 0, i32 1
  %814 = load ptr, ptr %813, align 8
  %815 = load i32, ptr %42, align 4
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds ptr, ptr %814, i64 %816
  store ptr %811, ptr %817, align 8
  br label %818

818:                                              ; preds = %796
  %819 = load i32, ptr %42, align 4
  %820 = add nsw i32 %819, 1
  store i32 %820, ptr %42, align 4
  br label %790, !llvm.loop !16

821:                                              ; preds = %790
  %822 = load ptr, ptr %10, align 8
  %823 = getelementptr inbounds %struct.CalcLangVal, ptr %822, i32 0, i32 0
  store i32 6, ptr %823, align 8
  %824 = load ptr, ptr %41, align 8
  %825 = load ptr, ptr %10, align 8
  %826 = getelementptr inbounds %struct.CalcLangVal, ptr %825, i32 0, i32 1
  store ptr %824, ptr %826, align 8
  br label %828

827:                                              ; preds = %761
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1338

828:                                              ; preds = %821
  br label %1310

829:                                              ; preds = %756, %751
  %830 = load ptr, ptr %6, align 8
  %831 = getelementptr inbounds %struct.CalcLangVal, ptr %830, i32 0, i32 0
  %832 = load i32, ptr %831, align 8
  %833 = icmp eq i32 %832, 6
  br i1 %833, label %834, label %888

834:                                              ; preds = %829
  %835 = load ptr, ptr %8, align 8
  %836 = getelementptr inbounds %struct.CalcLangVal, ptr %835, i32 0, i32 0
  %837 = load i32, ptr %836, align 8
  %838 = icmp eq i32 %837, 0
  br i1 %838, label %839, label %888

839:                                              ; preds = %834
  %840 = load ptr, ptr %6, align 8
  %841 = getelementptr inbounds %struct.CalcLangVal, ptr %840, i32 0, i32 1
  %842 = load ptr, ptr %841, align 8
  store ptr %842, ptr %43, align 8
  %843 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %843, ptr %44, align 8
  %844 = load ptr, ptr %43, align 8
  %845 = getelementptr inbounds %struct.SetValue, ptr %844, i32 0, i32 0
  %846 = load i32, ptr %845, align 8
  %847 = load ptr, ptr %44, align 8
  %848 = getelementptr inbounds %struct.SetValue, ptr %847, i32 0, i32 0
  store i32 %846, ptr %848, align 8
  %849 = load ptr, ptr %44, align 8
  %850 = getelementptr inbounds %struct.SetValue, ptr %849, i32 0, i32 0
  %851 = load i32, ptr %850, align 8
  %852 = sext i32 %851 to i64
  %853 = mul i64 8, %852
  %854 = call noalias ptr @malloc(i64 noundef %853) #4
  %855 = load ptr, ptr %44, align 8
  %856 = getelementptr inbounds %struct.SetValue, ptr %855, i32 0, i32 1
  store ptr %854, ptr %856, align 8
  store i32 0, ptr %45, align 4
  br label %857

857:                                              ; preds = %879, %839
  %858 = load i32, ptr %45, align 4
  %859 = load ptr, ptr %43, align 8
  %860 = getelementptr inbounds %struct.SetValue, ptr %859, i32 0, i32 0
  %861 = load i32, ptr %860, align 8
  %862 = icmp slt i32 %858, %861
  br i1 %862, label %863, label %882

863:                                              ; preds = %857
  %864 = load ptr, ptr %43, align 8
  %865 = getelementptr inbounds %struct.SetValue, ptr %864, i32 0, i32 1
  %866 = load ptr, ptr %865, align 8
  %867 = load i32, ptr %45, align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds ptr, ptr %866, i64 %868
  %870 = load ptr, ptr %869, align 8
  %871 = load ptr, ptr %8, align 8
  %872 = call ptr @addCalcLangValues(ptr noundef %870, i32 noundef 1, ptr noundef %871, i32 noundef 0)
  %873 = load ptr, ptr %44, align 8
  %874 = getelementptr inbounds %struct.SetValue, ptr %873, i32 0, i32 1
  %875 = load ptr, ptr %874, align 8
  %876 = load i32, ptr %45, align 4
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds ptr, ptr %875, i64 %877
  store ptr %872, ptr %878, align 8
  br label %879

879:                                              ; preds = %863
  %880 = load i32, ptr %45, align 4
  %881 = add nsw i32 %880, 1
  store i32 %881, ptr %45, align 4
  br label %857, !llvm.loop !17

882:                                              ; preds = %857
  %883 = load ptr, ptr %10, align 8
  %884 = getelementptr inbounds %struct.CalcLangVal, ptr %883, i32 0, i32 0
  store i32 6, ptr %884, align 8
  %885 = load ptr, ptr %44, align 8
  %886 = load ptr, ptr %10, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 1
  store ptr %885, ptr %887, align 8
  br label %1309

888:                                              ; preds = %834, %829
  %889 = load ptr, ptr %6, align 8
  %890 = getelementptr inbounds %struct.CalcLangVal, ptr %889, i32 0, i32 0
  %891 = load i32, ptr %890, align 8
  %892 = icmp eq i32 %891, 0
  br i1 %892, label %893, label %947

893:                                              ; preds = %888
  %894 = load ptr, ptr %8, align 8
  %895 = getelementptr inbounds %struct.CalcLangVal, ptr %894, i32 0, i32 0
  %896 = load i32, ptr %895, align 8
  %897 = icmp eq i32 %896, 6
  br i1 %897, label %898, label %947

898:                                              ; preds = %893
  %899 = load ptr, ptr %8, align 8
  %900 = getelementptr inbounds %struct.CalcLangVal, ptr %899, i32 0, i32 1
  %901 = load ptr, ptr %900, align 8
  store ptr %901, ptr %46, align 8
  %902 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %902, ptr %47, align 8
  %903 = load ptr, ptr %46, align 8
  %904 = getelementptr inbounds %struct.SetValue, ptr %903, i32 0, i32 0
  %905 = load i32, ptr %904, align 8
  %906 = load ptr, ptr %47, align 8
  %907 = getelementptr inbounds %struct.SetValue, ptr %906, i32 0, i32 0
  store i32 %905, ptr %907, align 8
  %908 = load ptr, ptr %47, align 8
  %909 = getelementptr inbounds %struct.SetValue, ptr %908, i32 0, i32 0
  %910 = load i32, ptr %909, align 8
  %911 = sext i32 %910 to i64
  %912 = mul i64 8, %911
  %913 = call noalias ptr @malloc(i64 noundef %912) #4
  %914 = load ptr, ptr %47, align 8
  %915 = getelementptr inbounds %struct.SetValue, ptr %914, i32 0, i32 1
  store ptr %913, ptr %915, align 8
  store i32 0, ptr %48, align 4
  br label %916

916:                                              ; preds = %938, %898
  %917 = load i32, ptr %48, align 4
  %918 = load ptr, ptr %46, align 8
  %919 = getelementptr inbounds %struct.SetValue, ptr %918, i32 0, i32 0
  %920 = load i32, ptr %919, align 8
  %921 = icmp slt i32 %917, %920
  br i1 %921, label %922, label %941

922:                                              ; preds = %916
  %923 = load ptr, ptr %6, align 8
  %924 = load ptr, ptr %46, align 8
  %925 = getelementptr inbounds %struct.SetValue, ptr %924, i32 0, i32 1
  %926 = load ptr, ptr %925, align 8
  %927 = load i32, ptr %48, align 4
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds ptr, ptr %926, i64 %928
  %930 = load ptr, ptr %929, align 8
  %931 = call ptr @addCalcLangValues(ptr noundef %923, i32 noundef 0, ptr noundef %930, i32 noundef 1)
  %932 = load ptr, ptr %47, align 8
  %933 = getelementptr inbounds %struct.SetValue, ptr %932, i32 0, i32 1
  %934 = load ptr, ptr %933, align 8
  %935 = load i32, ptr %48, align 4
  %936 = sext i32 %935 to i64
  %937 = getelementptr inbounds ptr, ptr %934, i64 %936
  store ptr %931, ptr %937, align 8
  br label %938

938:                                              ; preds = %922
  %939 = load i32, ptr %48, align 4
  %940 = add nsw i32 %939, 1
  store i32 %940, ptr %48, align 4
  br label %916, !llvm.loop !18

941:                                              ; preds = %916
  %942 = load ptr, ptr %10, align 8
  %943 = getelementptr inbounds %struct.CalcLangVal, ptr %942, i32 0, i32 0
  store i32 6, ptr %943, align 8
  %944 = load ptr, ptr %47, align 8
  %945 = load ptr, ptr %10, align 8
  %946 = getelementptr inbounds %struct.CalcLangVal, ptr %945, i32 0, i32 1
  store ptr %944, ptr %946, align 8
  br label %1308

947:                                              ; preds = %893, %888
  %948 = load ptr, ptr %6, align 8
  %949 = getelementptr inbounds %struct.CalcLangVal, ptr %948, i32 0, i32 0
  %950 = load i32, ptr %949, align 8
  %951 = icmp eq i32 %950, 6
  br i1 %951, label %952, label %1006

952:                                              ; preds = %947
  %953 = load ptr, ptr %8, align 8
  %954 = getelementptr inbounds %struct.CalcLangVal, ptr %953, i32 0, i32 0
  %955 = load i32, ptr %954, align 8
  %956 = icmp eq i32 %955, 1
  br i1 %956, label %957, label %1006

957:                                              ; preds = %952
  %958 = load ptr, ptr %6, align 8
  %959 = getelementptr inbounds %struct.CalcLangVal, ptr %958, i32 0, i32 1
  %960 = load ptr, ptr %959, align 8
  store ptr %960, ptr %49, align 8
  %961 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %961, ptr %50, align 8
  %962 = load ptr, ptr %49, align 8
  %963 = getelementptr inbounds %struct.SetValue, ptr %962, i32 0, i32 0
  %964 = load i32, ptr %963, align 8
  %965 = load ptr, ptr %50, align 8
  %966 = getelementptr inbounds %struct.SetValue, ptr %965, i32 0, i32 0
  store i32 %964, ptr %966, align 8
  %967 = load ptr, ptr %50, align 8
  %968 = getelementptr inbounds %struct.SetValue, ptr %967, i32 0, i32 0
  %969 = load i32, ptr %968, align 8
  %970 = sext i32 %969 to i64
  %971 = mul i64 8, %970
  %972 = call noalias ptr @malloc(i64 noundef %971) #4
  %973 = load ptr, ptr %50, align 8
  %974 = getelementptr inbounds %struct.SetValue, ptr %973, i32 0, i32 1
  store ptr %972, ptr %974, align 8
  store i32 0, ptr %51, align 4
  br label %975

975:                                              ; preds = %997, %957
  %976 = load i32, ptr %51, align 4
  %977 = load ptr, ptr %49, align 8
  %978 = getelementptr inbounds %struct.SetValue, ptr %977, i32 0, i32 0
  %979 = load i32, ptr %978, align 8
  %980 = icmp slt i32 %976, %979
  br i1 %980, label %981, label %1000

981:                                              ; preds = %975
  %982 = load ptr, ptr %49, align 8
  %983 = getelementptr inbounds %struct.SetValue, ptr %982, i32 0, i32 1
  %984 = load ptr, ptr %983, align 8
  %985 = load i32, ptr %51, align 4
  %986 = sext i32 %985 to i64
  %987 = getelementptr inbounds ptr, ptr %984, i64 %986
  %988 = load ptr, ptr %987, align 8
  %989 = load ptr, ptr %8, align 8
  %990 = call ptr @addCalcLangValues(ptr noundef %988, i32 noundef 1, ptr noundef %989, i32 noundef 0)
  %991 = load ptr, ptr %50, align 8
  %992 = getelementptr inbounds %struct.SetValue, ptr %991, i32 0, i32 1
  %993 = load ptr, ptr %992, align 8
  %994 = load i32, ptr %51, align 4
  %995 = sext i32 %994 to i64
  %996 = getelementptr inbounds ptr, ptr %993, i64 %995
  store ptr %990, ptr %996, align 8
  br label %997

997:                                              ; preds = %981
  %998 = load i32, ptr %51, align 4
  %999 = add nsw i32 %998, 1
  store i32 %999, ptr %51, align 4
  br label %975, !llvm.loop !19

1000:                                             ; preds = %975
  %1001 = load ptr, ptr %10, align 8
  %1002 = getelementptr inbounds %struct.CalcLangVal, ptr %1001, i32 0, i32 0
  store i32 7, ptr %1002, align 8
  %1003 = load ptr, ptr %50, align 8
  %1004 = load ptr, ptr %10, align 8
  %1005 = getelementptr inbounds %struct.CalcLangVal, ptr %1004, i32 0, i32 1
  store ptr %1003, ptr %1005, align 8
  br label %1307

1006:                                             ; preds = %952, %947
  %1007 = load ptr, ptr %6, align 8
  %1008 = getelementptr inbounds %struct.CalcLangVal, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp eq i32 %1009, 1
  br i1 %1010, label %1011, label %1065

1011:                                             ; preds = %1006
  %1012 = load ptr, ptr %8, align 8
  %1013 = getelementptr inbounds %struct.CalcLangVal, ptr %1012, i32 0, i32 0
  %1014 = load i32, ptr %1013, align 8
  %1015 = icmp eq i32 %1014, 6
  br i1 %1015, label %1016, label %1065

1016:                                             ; preds = %1011
  %1017 = load ptr, ptr %8, align 8
  %1018 = getelementptr inbounds %struct.CalcLangVal, ptr %1017, i32 0, i32 1
  %1019 = load ptr, ptr %1018, align 8
  store ptr %1019, ptr %52, align 8
  %1020 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1020, ptr %53, align 8
  %1021 = load ptr, ptr %52, align 8
  %1022 = getelementptr inbounds %struct.SetValue, ptr %1021, i32 0, i32 0
  %1023 = load i32, ptr %1022, align 8
  %1024 = load ptr, ptr %53, align 8
  %1025 = getelementptr inbounds %struct.SetValue, ptr %1024, i32 0, i32 0
  store i32 %1023, ptr %1025, align 8
  %1026 = load ptr, ptr %53, align 8
  %1027 = getelementptr inbounds %struct.SetValue, ptr %1026, i32 0, i32 0
  %1028 = load i32, ptr %1027, align 8
  %1029 = sext i32 %1028 to i64
  %1030 = mul i64 8, %1029
  %1031 = call noalias ptr @malloc(i64 noundef %1030) #4
  %1032 = load ptr, ptr %53, align 8
  %1033 = getelementptr inbounds %struct.SetValue, ptr %1032, i32 0, i32 1
  store ptr %1031, ptr %1033, align 8
  store i32 0, ptr %54, align 4
  br label %1034

1034:                                             ; preds = %1056, %1016
  %1035 = load i32, ptr %54, align 4
  %1036 = load ptr, ptr %52, align 8
  %1037 = getelementptr inbounds %struct.SetValue, ptr %1036, i32 0, i32 0
  %1038 = load i32, ptr %1037, align 8
  %1039 = icmp slt i32 %1035, %1038
  br i1 %1039, label %1040, label %1059

1040:                                             ; preds = %1034
  %1041 = load ptr, ptr %6, align 8
  %1042 = load ptr, ptr %52, align 8
  %1043 = getelementptr inbounds %struct.SetValue, ptr %1042, i32 0, i32 1
  %1044 = load ptr, ptr %1043, align 8
  %1045 = load i32, ptr %54, align 4
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds ptr, ptr %1044, i64 %1046
  %1048 = load ptr, ptr %1047, align 8
  %1049 = call ptr @addCalcLangValues(ptr noundef %1041, i32 noundef 0, ptr noundef %1048, i32 noundef 1)
  %1050 = load ptr, ptr %53, align 8
  %1051 = getelementptr inbounds %struct.SetValue, ptr %1050, i32 0, i32 1
  %1052 = load ptr, ptr %1051, align 8
  %1053 = load i32, ptr %54, align 4
  %1054 = sext i32 %1053 to i64
  %1055 = getelementptr inbounds ptr, ptr %1052, i64 %1054
  store ptr %1049, ptr %1055, align 8
  br label %1056

1056:                                             ; preds = %1040
  %1057 = load i32, ptr %54, align 4
  %1058 = add nsw i32 %1057, 1
  store i32 %1058, ptr %54, align 4
  br label %1034, !llvm.loop !20

1059:                                             ; preds = %1034
  %1060 = load ptr, ptr %10, align 8
  %1061 = getelementptr inbounds %struct.CalcLangVal, ptr %1060, i32 0, i32 0
  store i32 6, ptr %1061, align 8
  %1062 = load ptr, ptr %53, align 8
  %1063 = load ptr, ptr %10, align 8
  %1064 = getelementptr inbounds %struct.CalcLangVal, ptr %1063, i32 0, i32 1
  store ptr %1062, ptr %1064, align 8
  br label %1306

1065:                                             ; preds = %1011, %1006
  %1066 = load ptr, ptr %6, align 8
  %1067 = getelementptr inbounds %struct.CalcLangVal, ptr %1066, i32 0, i32 0
  %1068 = load i32, ptr %1067, align 8
  %1069 = icmp eq i32 %1068, 6
  br i1 %1069, label %1070, label %1124

1070:                                             ; preds = %1065
  %1071 = load ptr, ptr %8, align 8
  %1072 = getelementptr inbounds %struct.CalcLangVal, ptr %1071, i32 0, i32 0
  %1073 = load i32, ptr %1072, align 8
  %1074 = icmp eq i32 %1073, 3
  br i1 %1074, label %1075, label %1124

1075:                                             ; preds = %1070
  %1076 = load ptr, ptr %6, align 8
  %1077 = getelementptr inbounds %struct.CalcLangVal, ptr %1076, i32 0, i32 1
  %1078 = load ptr, ptr %1077, align 8
  store ptr %1078, ptr %55, align 8
  %1079 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1079, ptr %56, align 8
  %1080 = load ptr, ptr %55, align 8
  %1081 = getelementptr inbounds %struct.SetValue, ptr %1080, i32 0, i32 0
  %1082 = load i32, ptr %1081, align 8
  %1083 = load ptr, ptr %56, align 8
  %1084 = getelementptr inbounds %struct.SetValue, ptr %1083, i32 0, i32 0
  store i32 %1082, ptr %1084, align 8
  %1085 = load ptr, ptr %56, align 8
  %1086 = getelementptr inbounds %struct.SetValue, ptr %1085, i32 0, i32 0
  %1087 = load i32, ptr %1086, align 8
  %1088 = sext i32 %1087 to i64
  %1089 = mul i64 8, %1088
  %1090 = call noalias ptr @malloc(i64 noundef %1089) #4
  %1091 = load ptr, ptr %56, align 8
  %1092 = getelementptr inbounds %struct.SetValue, ptr %1091, i32 0, i32 1
  store ptr %1090, ptr %1092, align 8
  store i32 0, ptr %57, align 4
  br label %1093

1093:                                             ; preds = %1115, %1075
  %1094 = load i32, ptr %57, align 4
  %1095 = load ptr, ptr %55, align 8
  %1096 = getelementptr inbounds %struct.SetValue, ptr %1095, i32 0, i32 0
  %1097 = load i32, ptr %1096, align 8
  %1098 = icmp slt i32 %1094, %1097
  br i1 %1098, label %1099, label %1118

1099:                                             ; preds = %1093
  %1100 = load ptr, ptr %55, align 8
  %1101 = getelementptr inbounds %struct.SetValue, ptr %1100, i32 0, i32 1
  %1102 = load ptr, ptr %1101, align 8
  %1103 = load i32, ptr %57, align 4
  %1104 = sext i32 %1103 to i64
  %1105 = getelementptr inbounds ptr, ptr %1102, i64 %1104
  %1106 = load ptr, ptr %1105, align 8
  %1107 = load ptr, ptr %8, align 8
  %1108 = call ptr @addCalcLangValues(ptr noundef %1106, i32 noundef 1, ptr noundef %1107, i32 noundef 0)
  %1109 = load ptr, ptr %56, align 8
  %1110 = getelementptr inbounds %struct.SetValue, ptr %1109, i32 0, i32 1
  %1111 = load ptr, ptr %1110, align 8
  %1112 = load i32, ptr %57, align 4
  %1113 = sext i32 %1112 to i64
  %1114 = getelementptr inbounds ptr, ptr %1111, i64 %1113
  store ptr %1108, ptr %1114, align 8
  br label %1115

1115:                                             ; preds = %1099
  %1116 = load i32, ptr %57, align 4
  %1117 = add nsw i32 %1116, 1
  store i32 %1117, ptr %57, align 4
  br label %1093, !llvm.loop !21

1118:                                             ; preds = %1093
  %1119 = load ptr, ptr %10, align 8
  %1120 = getelementptr inbounds %struct.CalcLangVal, ptr %1119, i32 0, i32 0
  store i32 6, ptr %1120, align 8
  %1121 = load ptr, ptr %56, align 8
  %1122 = load ptr, ptr %10, align 8
  %1123 = getelementptr inbounds %struct.CalcLangVal, ptr %1122, i32 0, i32 1
  store ptr %1121, ptr %1123, align 8
  br label %1305

1124:                                             ; preds = %1070, %1065
  %1125 = load ptr, ptr %6, align 8
  %1126 = getelementptr inbounds %struct.CalcLangVal, ptr %1125, i32 0, i32 0
  %1127 = load i32, ptr %1126, align 8
  %1128 = icmp eq i32 %1127, 3
  br i1 %1128, label %1129, label %1183

1129:                                             ; preds = %1124
  %1130 = load ptr, ptr %8, align 8
  %1131 = getelementptr inbounds %struct.CalcLangVal, ptr %1130, i32 0, i32 0
  %1132 = load i32, ptr %1131, align 8
  %1133 = icmp eq i32 %1132, 6
  br i1 %1133, label %1134, label %1183

1134:                                             ; preds = %1129
  %1135 = load ptr, ptr %8, align 8
  %1136 = getelementptr inbounds %struct.CalcLangVal, ptr %1135, i32 0, i32 1
  %1137 = load ptr, ptr %1136, align 8
  store ptr %1137, ptr %58, align 8
  %1138 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1138, ptr %59, align 8
  %1139 = load ptr, ptr %58, align 8
  %1140 = getelementptr inbounds %struct.SetValue, ptr %1139, i32 0, i32 0
  %1141 = load i32, ptr %1140, align 8
  %1142 = load ptr, ptr %59, align 8
  %1143 = getelementptr inbounds %struct.SetValue, ptr %1142, i32 0, i32 0
  store i32 %1141, ptr %1143, align 8
  %1144 = load ptr, ptr %59, align 8
  %1145 = getelementptr inbounds %struct.SetValue, ptr %1144, i32 0, i32 0
  %1146 = load i32, ptr %1145, align 8
  %1147 = sext i32 %1146 to i64
  %1148 = mul i64 8, %1147
  %1149 = call noalias ptr @malloc(i64 noundef %1148) #4
  %1150 = load ptr, ptr %59, align 8
  %1151 = getelementptr inbounds %struct.SetValue, ptr %1150, i32 0, i32 1
  store ptr %1149, ptr %1151, align 8
  store i32 0, ptr %60, align 4
  br label %1152

1152:                                             ; preds = %1174, %1134
  %1153 = load i32, ptr %60, align 4
  %1154 = load ptr, ptr %58, align 8
  %1155 = getelementptr inbounds %struct.SetValue, ptr %1154, i32 0, i32 0
  %1156 = load i32, ptr %1155, align 8
  %1157 = icmp slt i32 %1153, %1156
  br i1 %1157, label %1158, label %1177

1158:                                             ; preds = %1152
  %1159 = load ptr, ptr %6, align 8
  %1160 = load ptr, ptr %58, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 1
  %1162 = load ptr, ptr %1161, align 8
  %1163 = load i32, ptr %60, align 4
  %1164 = sext i32 %1163 to i64
  %1165 = getelementptr inbounds ptr, ptr %1162, i64 %1164
  %1166 = load ptr, ptr %1165, align 8
  %1167 = call ptr @addCalcLangValues(ptr noundef %1159, i32 noundef 0, ptr noundef %1166, i32 noundef 1)
  %1168 = load ptr, ptr %59, align 8
  %1169 = getelementptr inbounds %struct.SetValue, ptr %1168, i32 0, i32 1
  %1170 = load ptr, ptr %1169, align 8
  %1171 = load i32, ptr %60, align 4
  %1172 = sext i32 %1171 to i64
  %1173 = getelementptr inbounds ptr, ptr %1170, i64 %1172
  store ptr %1167, ptr %1173, align 8
  br label %1174

1174:                                             ; preds = %1158
  %1175 = load i32, ptr %60, align 4
  %1176 = add nsw i32 %1175, 1
  store i32 %1176, ptr %60, align 4
  br label %1152, !llvm.loop !22

1177:                                             ; preds = %1152
  %1178 = load ptr, ptr %10, align 8
  %1179 = getelementptr inbounds %struct.CalcLangVal, ptr %1178, i32 0, i32 0
  store i32 6, ptr %1179, align 8
  %1180 = load ptr, ptr %59, align 8
  %1181 = load ptr, ptr %10, align 8
  %1182 = getelementptr inbounds %struct.CalcLangVal, ptr %1181, i32 0, i32 1
  store ptr %1180, ptr %1182, align 8
  br label %1304

1183:                                             ; preds = %1129, %1124
  %1184 = load ptr, ptr %6, align 8
  %1185 = getelementptr inbounds %struct.CalcLangVal, ptr %1184, i32 0, i32 0
  %1186 = load i32, ptr %1185, align 8
  %1187 = icmp eq i32 %1186, 6
  br i1 %1187, label %1188, label %1242

1188:                                             ; preds = %1183
  %1189 = load ptr, ptr %8, align 8
  %1190 = getelementptr inbounds %struct.CalcLangVal, ptr %1189, i32 0, i32 0
  %1191 = load i32, ptr %1190, align 8
  %1192 = icmp eq i32 %1191, 4
  br i1 %1192, label %1193, label %1242

1193:                                             ; preds = %1188
  %1194 = load ptr, ptr %6, align 8
  %1195 = getelementptr inbounds %struct.CalcLangVal, ptr %1194, i32 0, i32 1
  %1196 = load ptr, ptr %1195, align 8
  store ptr %1196, ptr %61, align 8
  %1197 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1197, ptr %62, align 8
  %1198 = load ptr, ptr %61, align 8
  %1199 = getelementptr inbounds %struct.SetValue, ptr %1198, i32 0, i32 0
  %1200 = load i32, ptr %1199, align 8
  %1201 = load ptr, ptr %62, align 8
  %1202 = getelementptr inbounds %struct.SetValue, ptr %1201, i32 0, i32 0
  store i32 %1200, ptr %1202, align 8
  %1203 = load ptr, ptr %62, align 8
  %1204 = getelementptr inbounds %struct.SetValue, ptr %1203, i32 0, i32 0
  %1205 = load i32, ptr %1204, align 8
  %1206 = sext i32 %1205 to i64
  %1207 = mul i64 8, %1206
  %1208 = call noalias ptr @malloc(i64 noundef %1207) #4
  %1209 = load ptr, ptr %62, align 8
  %1210 = getelementptr inbounds %struct.SetValue, ptr %1209, i32 0, i32 1
  store ptr %1208, ptr %1210, align 8
  store i32 0, ptr %63, align 4
  br label %1211

1211:                                             ; preds = %1233, %1193
  %1212 = load i32, ptr %63, align 4
  %1213 = load ptr, ptr %61, align 8
  %1214 = getelementptr inbounds %struct.SetValue, ptr %1213, i32 0, i32 0
  %1215 = load i32, ptr %1214, align 8
  %1216 = icmp slt i32 %1212, %1215
  br i1 %1216, label %1217, label %1236

1217:                                             ; preds = %1211
  %1218 = load ptr, ptr %61, align 8
  %1219 = getelementptr inbounds %struct.SetValue, ptr %1218, i32 0, i32 1
  %1220 = load ptr, ptr %1219, align 8
  %1221 = load i32, ptr %63, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = getelementptr inbounds ptr, ptr %1220, i64 %1222
  %1224 = load ptr, ptr %1223, align 8
  %1225 = load ptr, ptr %8, align 8
  %1226 = call ptr @addCalcLangValues(ptr noundef %1224, i32 noundef 1, ptr noundef %1225, i32 noundef 0)
  %1227 = load ptr, ptr %62, align 8
  %1228 = getelementptr inbounds %struct.SetValue, ptr %1227, i32 0, i32 1
  %1229 = load ptr, ptr %1228, align 8
  %1230 = load i32, ptr %63, align 4
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds ptr, ptr %1229, i64 %1231
  store ptr %1226, ptr %1232, align 8
  br label %1233

1233:                                             ; preds = %1217
  %1234 = load i32, ptr %63, align 4
  %1235 = add nsw i32 %1234, 1
  store i32 %1235, ptr %63, align 4
  br label %1211, !llvm.loop !23

1236:                                             ; preds = %1211
  %1237 = load ptr, ptr %10, align 8
  %1238 = getelementptr inbounds %struct.CalcLangVal, ptr %1237, i32 0, i32 0
  store i32 6, ptr %1238, align 8
  %1239 = load ptr, ptr %62, align 8
  %1240 = load ptr, ptr %10, align 8
  %1241 = getelementptr inbounds %struct.CalcLangVal, ptr %1240, i32 0, i32 1
  store ptr %1239, ptr %1241, align 8
  br label %1303

1242:                                             ; preds = %1188, %1183
  %1243 = load ptr, ptr %6, align 8
  %1244 = getelementptr inbounds %struct.CalcLangVal, ptr %1243, i32 0, i32 0
  %1245 = load i32, ptr %1244, align 8
  %1246 = icmp eq i32 %1245, 4
  br i1 %1246, label %1247, label %1301

1247:                                             ; preds = %1242
  %1248 = load ptr, ptr %8, align 8
  %1249 = getelementptr inbounds %struct.CalcLangVal, ptr %1248, i32 0, i32 0
  %1250 = load i32, ptr %1249, align 8
  %1251 = icmp eq i32 %1250, 6
  br i1 %1251, label %1252, label %1301

1252:                                             ; preds = %1247
  %1253 = load ptr, ptr %8, align 8
  %1254 = getelementptr inbounds %struct.CalcLangVal, ptr %1253, i32 0, i32 1
  %1255 = load ptr, ptr %1254, align 8
  store ptr %1255, ptr %64, align 8
  %1256 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1256, ptr %65, align 8
  %1257 = load ptr, ptr %64, align 8
  %1258 = getelementptr inbounds %struct.SetValue, ptr %1257, i32 0, i32 0
  %1259 = load i32, ptr %1258, align 8
  %1260 = load ptr, ptr %65, align 8
  %1261 = getelementptr inbounds %struct.SetValue, ptr %1260, i32 0, i32 0
  store i32 %1259, ptr %1261, align 8
  %1262 = load ptr, ptr %65, align 8
  %1263 = getelementptr inbounds %struct.SetValue, ptr %1262, i32 0, i32 0
  %1264 = load i32, ptr %1263, align 8
  %1265 = sext i32 %1264 to i64
  %1266 = mul i64 8, %1265
  %1267 = call noalias ptr @malloc(i64 noundef %1266) #4
  %1268 = load ptr, ptr %65, align 8
  %1269 = getelementptr inbounds %struct.SetValue, ptr %1268, i32 0, i32 1
  store ptr %1267, ptr %1269, align 8
  store i32 0, ptr %66, align 4
  br label %1270

1270:                                             ; preds = %1292, %1252
  %1271 = load i32, ptr %66, align 4
  %1272 = load ptr, ptr %64, align 8
  %1273 = getelementptr inbounds %struct.SetValue, ptr %1272, i32 0, i32 0
  %1274 = load i32, ptr %1273, align 8
  %1275 = icmp slt i32 %1271, %1274
  br i1 %1275, label %1276, label %1295

1276:                                             ; preds = %1270
  %1277 = load ptr, ptr %6, align 8
  %1278 = load ptr, ptr %64, align 8
  %1279 = getelementptr inbounds %struct.SetValue, ptr %1278, i32 0, i32 1
  %1280 = load ptr, ptr %1279, align 8
  %1281 = load i32, ptr %66, align 4
  %1282 = sext i32 %1281 to i64
  %1283 = getelementptr inbounds ptr, ptr %1280, i64 %1282
  %1284 = load ptr, ptr %1283, align 8
  %1285 = call ptr @addCalcLangValues(ptr noundef %1277, i32 noundef 0, ptr noundef %1284, i32 noundef 1)
  %1286 = load ptr, ptr %65, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 1
  %1288 = load ptr, ptr %1287, align 8
  %1289 = load i32, ptr %66, align 4
  %1290 = sext i32 %1289 to i64
  %1291 = getelementptr inbounds ptr, ptr %1288, i64 %1290
  store ptr %1285, ptr %1291, align 8
  br label %1292

1292:                                             ; preds = %1276
  %1293 = load i32, ptr %66, align 4
  %1294 = add nsw i32 %1293, 1
  store i32 %1294, ptr %66, align 4
  br label %1270, !llvm.loop !24

1295:                                             ; preds = %1270
  %1296 = load ptr, ptr %10, align 8
  %1297 = getelementptr inbounds %struct.CalcLangVal, ptr %1296, i32 0, i32 0
  store i32 6, ptr %1297, align 8
  %1298 = load ptr, ptr %65, align 8
  %1299 = load ptr, ptr %10, align 8
  %1300 = getelementptr inbounds %struct.CalcLangVal, ptr %1299, i32 0, i32 1
  store ptr %1298, ptr %1300, align 8
  br label %1302

1301:                                             ; preds = %1247, %1242
  call void @perror(ptr noundef @.str.1) #5
  br label %1302

1302:                                             ; preds = %1301, %1295
  br label %1303

1303:                                             ; preds = %1302, %1236
  br label %1304

1304:                                             ; preds = %1303, %1177
  br label %1305

1305:                                             ; preds = %1304, %1118
  br label %1306

1306:                                             ; preds = %1305, %1059
  br label %1307

1307:                                             ; preds = %1306, %1000
  br label %1308

1308:                                             ; preds = %1307, %941
  br label %1309

1309:                                             ; preds = %1308, %882
  br label %1310

1310:                                             ; preds = %1309, %828
  br label %1311

1311:                                             ; preds = %1310, %745
  br label %1312

1312:                                             ; preds = %1311, %686
  br label %1313

1313:                                             ; preds = %1312, %627
  br label %1314

1314:                                             ; preds = %1313, %568
  br label %1315

1315:                                             ; preds = %1314, %509
  br label %1316

1316:                                             ; preds = %1315, %450
  br label %1317

1317:                                             ; preds = %1316, %391
  br label %1318

1318:                                             ; preds = %1317, %332
  br label %1319

1319:                                             ; preds = %1318, %278
  br label %1320

1320:                                             ; preds = %1319, %189
  br label %1321

1321:                                             ; preds = %1320, %167
  br label %1322

1322:                                             ; preds = %1321, %144
  br label %1323

1323:                                             ; preds = %1322, %121
  br label %1324

1324:                                             ; preds = %1323, %99
  br label %1325

1325:                                             ; preds = %1324, %77
  %1326 = load i32, ptr %7, align 4
  %1327 = icmp ne i32 %1326, 0
  br i1 %1327, label %1328, label %1330

1328:                                             ; preds = %1325
  %1329 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1329)
  br label %1336

1330:                                             ; preds = %1325
  %1331 = load i32, ptr %9, align 4
  %1332 = icmp ne i32 %1331, 0
  br i1 %1332, label %1333, label %1335

1333:                                             ; preds = %1330
  %1334 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1334)
  br label %1335

1335:                                             ; preds = %1333, %1330
  br label %1336

1336:                                             ; preds = %1335, %1328
  %1337 = load ptr, ptr %10, align 8
  store ptr %1337, ptr %5, align 8
  br label %1338

1338:                                             ; preds = %1336, %827, %277
  %1339 = load ptr, ptr %5, align 8
  ret ptr %1339
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
  %67 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %67, ptr %10, align 8
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.CalcLangVal, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %89

72:                                               ; preds = %4
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %89

77:                                               ; preds = %72
  %78 = load ptr, ptr %10, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 0
  store i32 0, ptr %79, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 1
  %82 = load i32, ptr %81, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = sub nsw i32 %82, %85
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store i32 %86, ptr %88, align 8
  br label %1325

89:                                               ; preds = %72, %4
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %111

94:                                               ; preds = %89
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %111

99:                                               ; preds = %94
  %100 = load ptr, ptr %10, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = fsub double %104, %107
  %109 = load ptr, ptr %10, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  store double %108, ptr %110, align 8
  br label %1324

111:                                              ; preds = %94, %89
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 0
  %114 = load i32, ptr %113, align 8
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %134

116:                                              ; preds = %111
  %117 = load ptr, ptr %8, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %121, label %134

121:                                              ; preds = %116
  %122 = load ptr, ptr %10, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  store i32 1, ptr %123, align 8
  %124 = load ptr, ptr %6, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 1
  %126 = load i32, ptr %125, align 8
  %127 = sitofp i32 %126 to double
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 1
  %130 = load double, ptr %129, align 8
  %131 = fsub double %127, %130
  %132 = load ptr, ptr %10, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %1323

134:                                              ; preds = %116, %111
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 1
  br i1 %138, label %139, label %157

139:                                              ; preds = %134
  %140 = load ptr, ptr %8, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %157

144:                                              ; preds = %139
  %145 = load ptr, ptr %10, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 1, ptr %146, align 8
  %147 = load ptr, ptr %6, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %8, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load i32, ptr %151, align 8
  %153 = sitofp i32 %152 to double
  %154 = fsub double %149, %153
  %155 = load ptr, ptr %10, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  store double %154, ptr %156, align 8
  br label %1322

157:                                              ; preds = %139, %134
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 0
  %160 = load i32, ptr %159, align 8
  %161 = icmp eq i32 %160, 3
  br i1 %161, label %162, label %179

162:                                              ; preds = %157
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 0
  %165 = load i32, ptr %164, align 8
  %166 = icmp eq i32 %165, 3
  br i1 %166, label %167, label %179

167:                                              ; preds = %162
  %168 = load ptr, ptr %10, align 8
  %169 = getelementptr inbounds %struct.CalcLangVal, ptr %168, i32 0, i32 0
  store i32 3, ptr %169, align 8
  %170 = load ptr, ptr %6, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 1
  %172 = load double, ptr %171, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = fsub double %172, %175
  %177 = load ptr, ptr %10, align 8
  %178 = getelementptr inbounds %struct.CalcLangVal, ptr %177, i32 0, i32 1
  store double %176, ptr %178, align 8
  br label %1321

179:                                              ; preds = %162, %157
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.CalcLangVal, ptr %180, i32 0, i32 0
  %182 = load i32, ptr %181, align 8
  %183 = icmp eq i32 %182, 4
  br i1 %183, label %184, label %201

184:                                              ; preds = %179
  %185 = load ptr, ptr %8, align 8
  %186 = getelementptr inbounds %struct.CalcLangVal, ptr %185, i32 0, i32 0
  %187 = load i32, ptr %186, align 8
  %188 = icmp eq i32 %187, 4
  br i1 %188, label %189, label %201

189:                                              ; preds = %184
  %190 = load ptr, ptr %10, align 8
  %191 = getelementptr inbounds %struct.CalcLangVal, ptr %190, i32 0, i32 0
  store i32 4, ptr %191, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.CalcLangVal, ptr %192, i32 0, i32 1
  %194 = load double, ptr %193, align 8
  %195 = load ptr, ptr %8, align 8
  %196 = getelementptr inbounds %struct.CalcLangVal, ptr %195, i32 0, i32 1
  %197 = load double, ptr %196, align 8
  %198 = fsub double %194, %197
  %199 = load ptr, ptr %10, align 8
  %200 = getelementptr inbounds %struct.CalcLangVal, ptr %199, i32 0, i32 1
  store double %198, ptr %200, align 8
  br label %1320

201:                                              ; preds = %184, %179
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.CalcLangVal, ptr %202, i32 0, i32 0
  %204 = load i32, ptr %203, align 8
  %205 = icmp eq i32 %204, 7
  br i1 %205, label %206, label %279

206:                                              ; preds = %201
  %207 = load ptr, ptr %8, align 8
  %208 = getelementptr inbounds %struct.CalcLangVal, ptr %207, i32 0, i32 0
  %209 = load i32, ptr %208, align 8
  %210 = icmp eq i32 %209, 7
  br i1 %210, label %211, label %279

211:                                              ; preds = %206
  %212 = load ptr, ptr %6, align 8
  %213 = getelementptr inbounds %struct.CalcLangVal, ptr %212, i32 0, i32 1
  %214 = load ptr, ptr %213, align 8
  store ptr %214, ptr %11, align 8
  %215 = load ptr, ptr %8, align 8
  %216 = getelementptr inbounds %struct.CalcLangVal, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  store ptr %217, ptr %12, align 8
  %218 = load ptr, ptr %12, align 8
  %219 = getelementptr inbounds %struct.TupleValue, ptr %218, i32 0, i32 0
  %220 = load i32, ptr %219, align 8
  %221 = load ptr, ptr %11, align 8
  %222 = getelementptr inbounds %struct.TupleValue, ptr %221, i32 0, i32 0
  %223 = load i32, ptr %222, align 8
  %224 = icmp eq i32 %220, %223
  br i1 %224, label %225, label %277

225:                                              ; preds = %211
  %226 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %226, ptr %13, align 8
  %227 = load ptr, ptr %11, align 8
  %228 = getelementptr inbounds %struct.TupleValue, ptr %227, i32 0, i32 0
  %229 = load i32, ptr %228, align 8
  %230 = load ptr, ptr %13, align 8
  %231 = getelementptr inbounds %struct.TupleValue, ptr %230, i32 0, i32 0
  store i32 %229, ptr %231, align 8
  %232 = load ptr, ptr %13, align 8
  %233 = getelementptr inbounds %struct.TupleValue, ptr %232, i32 0, i32 0
  %234 = load i32, ptr %233, align 8
  %235 = sext i32 %234 to i64
  %236 = mul i64 8, %235
  %237 = call noalias ptr @malloc(i64 noundef %236) #4
  %238 = load ptr, ptr %13, align 8
  %239 = getelementptr inbounds %struct.TupleValue, ptr %238, i32 0, i32 1
  store ptr %237, ptr %239, align 8
  store i32 0, ptr %14, align 4
  br label %240

240:                                              ; preds = %268, %225
  %241 = load i32, ptr %14, align 4
  %242 = load ptr, ptr %11, align 8
  %243 = getelementptr inbounds %struct.TupleValue, ptr %242, i32 0, i32 0
  %244 = load i32, ptr %243, align 8
  %245 = icmp slt i32 %241, %244
  br i1 %245, label %246, label %271

246:                                              ; preds = %240
  %247 = load ptr, ptr %11, align 8
  %248 = getelementptr inbounds %struct.TupleValue, ptr %247, i32 0, i32 1
  %249 = load ptr, ptr %248, align 8
  %250 = load i32, ptr %14, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds ptr, ptr %249, i64 %251
  %253 = load ptr, ptr %252, align 8
  %254 = load ptr, ptr %12, align 8
  %255 = getelementptr inbounds %struct.TupleValue, ptr %254, i32 0, i32 1
  %256 = load ptr, ptr %255, align 8
  %257 = load i32, ptr %14, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds ptr, ptr %256, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = call ptr @subCalcLangValues(ptr noundef %253, i32 noundef 1, ptr noundef %260, i32 noundef 0)
  %262 = load ptr, ptr %13, align 8
  %263 = getelementptr inbounds %struct.TupleValue, ptr %262, i32 0, i32 1
  %264 = load ptr, ptr %263, align 8
  %265 = load i32, ptr %14, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds ptr, ptr %264, i64 %266
  store ptr %261, ptr %267, align 8
  br label %268

268:                                              ; preds = %246
  %269 = load i32, ptr %14, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, ptr %14, align 4
  br label %240, !llvm.loop !25

271:                                              ; preds = %240
  %272 = load ptr, ptr %10, align 8
  %273 = getelementptr inbounds %struct.CalcLangVal, ptr %272, i32 0, i32 0
  store i32 7, ptr %273, align 8
  %274 = load ptr, ptr %13, align 8
  %275 = load ptr, ptr %10, align 8
  %276 = getelementptr inbounds %struct.CalcLangVal, ptr %275, i32 0, i32 1
  store ptr %274, ptr %276, align 8
  br label %278

277:                                              ; preds = %211
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1338

278:                                              ; preds = %271
  br label %1319

279:                                              ; preds = %206, %201
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds %struct.CalcLangVal, ptr %280, i32 0, i32 0
  %282 = load i32, ptr %281, align 8
  %283 = icmp eq i32 %282, 7
  br i1 %283, label %284, label %338

284:                                              ; preds = %279
  %285 = load ptr, ptr %8, align 8
  %286 = getelementptr inbounds %struct.CalcLangVal, ptr %285, i32 0, i32 0
  %287 = load i32, ptr %286, align 8
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %289, label %338

289:                                              ; preds = %284
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.CalcLangVal, ptr %290, i32 0, i32 1
  %292 = load ptr, ptr %291, align 8
  store ptr %292, ptr %15, align 8
  %293 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %293, ptr %16, align 8
  %294 = load ptr, ptr %15, align 8
  %295 = getelementptr inbounds %struct.TupleValue, ptr %294, i32 0, i32 0
  %296 = load i32, ptr %295, align 8
  %297 = load ptr, ptr %16, align 8
  %298 = getelementptr inbounds %struct.TupleValue, ptr %297, i32 0, i32 0
  store i32 %296, ptr %298, align 8
  %299 = load ptr, ptr %16, align 8
  %300 = getelementptr inbounds %struct.TupleValue, ptr %299, i32 0, i32 0
  %301 = load i32, ptr %300, align 8
  %302 = sext i32 %301 to i64
  %303 = mul i64 8, %302
  %304 = call noalias ptr @malloc(i64 noundef %303) #4
  %305 = load ptr, ptr %16, align 8
  %306 = getelementptr inbounds %struct.TupleValue, ptr %305, i32 0, i32 1
  store ptr %304, ptr %306, align 8
  store i32 0, ptr %17, align 4
  br label %307

307:                                              ; preds = %329, %289
  %308 = load i32, ptr %17, align 4
  %309 = load ptr, ptr %15, align 8
  %310 = getelementptr inbounds %struct.TupleValue, ptr %309, i32 0, i32 0
  %311 = load i32, ptr %310, align 8
  %312 = icmp slt i32 %308, %311
  br i1 %312, label %313, label %332

313:                                              ; preds = %307
  %314 = load ptr, ptr %15, align 8
  %315 = getelementptr inbounds %struct.TupleValue, ptr %314, i32 0, i32 1
  %316 = load ptr, ptr %315, align 8
  %317 = load i32, ptr %17, align 4
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds ptr, ptr %316, i64 %318
  %320 = load ptr, ptr %319, align 8
  %321 = load ptr, ptr %8, align 8
  %322 = call ptr @subCalcLangValues(ptr noundef %320, i32 noundef 1, ptr noundef %321, i32 noundef 0)
  %323 = load ptr, ptr %16, align 8
  %324 = getelementptr inbounds %struct.TupleValue, ptr %323, i32 0, i32 1
  %325 = load ptr, ptr %324, align 8
  %326 = load i32, ptr %17, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds ptr, ptr %325, i64 %327
  store ptr %322, ptr %328, align 8
  br label %329

329:                                              ; preds = %313
  %330 = load i32, ptr %17, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, ptr %17, align 4
  br label %307, !llvm.loop !26

332:                                              ; preds = %307
  %333 = load ptr, ptr %10, align 8
  %334 = getelementptr inbounds %struct.CalcLangVal, ptr %333, i32 0, i32 0
  store i32 7, ptr %334, align 8
  %335 = load ptr, ptr %16, align 8
  %336 = load ptr, ptr %10, align 8
  %337 = getelementptr inbounds %struct.CalcLangVal, ptr %336, i32 0, i32 1
  store ptr %335, ptr %337, align 8
  br label %1318

338:                                              ; preds = %284, %279
  %339 = load ptr, ptr %6, align 8
  %340 = getelementptr inbounds %struct.CalcLangVal, ptr %339, i32 0, i32 0
  %341 = load i32, ptr %340, align 8
  %342 = icmp eq i32 %341, 0
  br i1 %342, label %343, label %397

343:                                              ; preds = %338
  %344 = load ptr, ptr %8, align 8
  %345 = getelementptr inbounds %struct.CalcLangVal, ptr %344, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = icmp eq i32 %346, 7
  br i1 %347, label %348, label %397

348:                                              ; preds = %343
  %349 = load ptr, ptr %8, align 8
  %350 = getelementptr inbounds %struct.CalcLangVal, ptr %349, i32 0, i32 1
  %351 = load ptr, ptr %350, align 8
  store ptr %351, ptr %18, align 8
  %352 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %352, ptr %19, align 8
  %353 = load ptr, ptr %18, align 8
  %354 = getelementptr inbounds %struct.TupleValue, ptr %353, i32 0, i32 0
  %355 = load i32, ptr %354, align 8
  %356 = load ptr, ptr %19, align 8
  %357 = getelementptr inbounds %struct.TupleValue, ptr %356, i32 0, i32 0
  store i32 %355, ptr %357, align 8
  %358 = load ptr, ptr %19, align 8
  %359 = getelementptr inbounds %struct.TupleValue, ptr %358, i32 0, i32 0
  %360 = load i32, ptr %359, align 8
  %361 = sext i32 %360 to i64
  %362 = mul i64 8, %361
  %363 = call noalias ptr @malloc(i64 noundef %362) #4
  %364 = load ptr, ptr %19, align 8
  %365 = getelementptr inbounds %struct.TupleValue, ptr %364, i32 0, i32 1
  store ptr %363, ptr %365, align 8
  store i32 0, ptr %20, align 4
  br label %366

366:                                              ; preds = %388, %348
  %367 = load i32, ptr %20, align 4
  %368 = load ptr, ptr %18, align 8
  %369 = getelementptr inbounds %struct.TupleValue, ptr %368, i32 0, i32 0
  %370 = load i32, ptr %369, align 8
  %371 = icmp slt i32 %367, %370
  br i1 %371, label %372, label %391

372:                                              ; preds = %366
  %373 = load ptr, ptr %6, align 8
  %374 = load ptr, ptr %18, align 8
  %375 = getelementptr inbounds %struct.TupleValue, ptr %374, i32 0, i32 1
  %376 = load ptr, ptr %375, align 8
  %377 = load i32, ptr %20, align 4
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds ptr, ptr %376, i64 %378
  %380 = load ptr, ptr %379, align 8
  %381 = call ptr @subCalcLangValues(ptr noundef %373, i32 noundef 0, ptr noundef %380, i32 noundef 1)
  %382 = load ptr, ptr %19, align 8
  %383 = getelementptr inbounds %struct.TupleValue, ptr %382, i32 0, i32 1
  %384 = load ptr, ptr %383, align 8
  %385 = load i32, ptr %20, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds ptr, ptr %384, i64 %386
  store ptr %381, ptr %387, align 8
  br label %388

388:                                              ; preds = %372
  %389 = load i32, ptr %20, align 4
  %390 = add nsw i32 %389, 1
  store i32 %390, ptr %20, align 4
  br label %366, !llvm.loop !27

391:                                              ; preds = %366
  %392 = load ptr, ptr %10, align 8
  %393 = getelementptr inbounds %struct.CalcLangVal, ptr %392, i32 0, i32 0
  store i32 7, ptr %393, align 8
  %394 = load ptr, ptr %19, align 8
  %395 = load ptr, ptr %10, align 8
  %396 = getelementptr inbounds %struct.CalcLangVal, ptr %395, i32 0, i32 1
  store ptr %394, ptr %396, align 8
  br label %1317

397:                                              ; preds = %343, %338
  %398 = load ptr, ptr %6, align 8
  %399 = getelementptr inbounds %struct.CalcLangVal, ptr %398, i32 0, i32 0
  %400 = load i32, ptr %399, align 8
  %401 = icmp eq i32 %400, 7
  br i1 %401, label %402, label %456

402:                                              ; preds = %397
  %403 = load ptr, ptr %8, align 8
  %404 = getelementptr inbounds %struct.CalcLangVal, ptr %403, i32 0, i32 0
  %405 = load i32, ptr %404, align 8
  %406 = icmp eq i32 %405, 1
  br i1 %406, label %407, label %456

407:                                              ; preds = %402
  %408 = load ptr, ptr %6, align 8
  %409 = getelementptr inbounds %struct.CalcLangVal, ptr %408, i32 0, i32 1
  %410 = load ptr, ptr %409, align 8
  store ptr %410, ptr %21, align 8
  %411 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %411, ptr %22, align 8
  %412 = load ptr, ptr %21, align 8
  %413 = getelementptr inbounds %struct.TupleValue, ptr %412, i32 0, i32 0
  %414 = load i32, ptr %413, align 8
  %415 = load ptr, ptr %22, align 8
  %416 = getelementptr inbounds %struct.TupleValue, ptr %415, i32 0, i32 0
  store i32 %414, ptr %416, align 8
  %417 = load ptr, ptr %22, align 8
  %418 = getelementptr inbounds %struct.TupleValue, ptr %417, i32 0, i32 0
  %419 = load i32, ptr %418, align 8
  %420 = sext i32 %419 to i64
  %421 = mul i64 8, %420
  %422 = call noalias ptr @malloc(i64 noundef %421) #4
  %423 = load ptr, ptr %22, align 8
  %424 = getelementptr inbounds %struct.TupleValue, ptr %423, i32 0, i32 1
  store ptr %422, ptr %424, align 8
  store i32 0, ptr %23, align 4
  br label %425

425:                                              ; preds = %447, %407
  %426 = load i32, ptr %23, align 4
  %427 = load ptr, ptr %21, align 8
  %428 = getelementptr inbounds %struct.TupleValue, ptr %427, i32 0, i32 0
  %429 = load i32, ptr %428, align 8
  %430 = icmp slt i32 %426, %429
  br i1 %430, label %431, label %450

431:                                              ; preds = %425
  %432 = load ptr, ptr %21, align 8
  %433 = getelementptr inbounds %struct.TupleValue, ptr %432, i32 0, i32 1
  %434 = load ptr, ptr %433, align 8
  %435 = load i32, ptr %23, align 4
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds ptr, ptr %434, i64 %436
  %438 = load ptr, ptr %437, align 8
  %439 = load ptr, ptr %8, align 8
  %440 = call ptr @subCalcLangValues(ptr noundef %438, i32 noundef 1, ptr noundef %439, i32 noundef 0)
  %441 = load ptr, ptr %22, align 8
  %442 = getelementptr inbounds %struct.TupleValue, ptr %441, i32 0, i32 1
  %443 = load ptr, ptr %442, align 8
  %444 = load i32, ptr %23, align 4
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds ptr, ptr %443, i64 %445
  store ptr %440, ptr %446, align 8
  br label %447

447:                                              ; preds = %431
  %448 = load i32, ptr %23, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, ptr %23, align 4
  br label %425, !llvm.loop !28

450:                                              ; preds = %425
  %451 = load ptr, ptr %10, align 8
  %452 = getelementptr inbounds %struct.CalcLangVal, ptr %451, i32 0, i32 0
  store i32 7, ptr %452, align 8
  %453 = load ptr, ptr %22, align 8
  %454 = load ptr, ptr %10, align 8
  %455 = getelementptr inbounds %struct.CalcLangVal, ptr %454, i32 0, i32 1
  store ptr %453, ptr %455, align 8
  br label %1316

456:                                              ; preds = %402, %397
  %457 = load ptr, ptr %6, align 8
  %458 = getelementptr inbounds %struct.CalcLangVal, ptr %457, i32 0, i32 0
  %459 = load i32, ptr %458, align 8
  %460 = icmp eq i32 %459, 1
  br i1 %460, label %461, label %515

461:                                              ; preds = %456
  %462 = load ptr, ptr %8, align 8
  %463 = getelementptr inbounds %struct.CalcLangVal, ptr %462, i32 0, i32 0
  %464 = load i32, ptr %463, align 8
  %465 = icmp eq i32 %464, 7
  br i1 %465, label %466, label %515

466:                                              ; preds = %461
  %467 = load ptr, ptr %8, align 8
  %468 = getelementptr inbounds %struct.CalcLangVal, ptr %467, i32 0, i32 1
  %469 = load ptr, ptr %468, align 8
  store ptr %469, ptr %24, align 8
  %470 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %470, ptr %25, align 8
  %471 = load ptr, ptr %24, align 8
  %472 = getelementptr inbounds %struct.TupleValue, ptr %471, i32 0, i32 0
  %473 = load i32, ptr %472, align 8
  %474 = load ptr, ptr %25, align 8
  %475 = getelementptr inbounds %struct.TupleValue, ptr %474, i32 0, i32 0
  store i32 %473, ptr %475, align 8
  %476 = load ptr, ptr %25, align 8
  %477 = getelementptr inbounds %struct.TupleValue, ptr %476, i32 0, i32 0
  %478 = load i32, ptr %477, align 8
  %479 = sext i32 %478 to i64
  %480 = mul i64 8, %479
  %481 = call noalias ptr @malloc(i64 noundef %480) #4
  %482 = load ptr, ptr %25, align 8
  %483 = getelementptr inbounds %struct.TupleValue, ptr %482, i32 0, i32 1
  store ptr %481, ptr %483, align 8
  store i32 0, ptr %26, align 4
  br label %484

484:                                              ; preds = %506, %466
  %485 = load i32, ptr %26, align 4
  %486 = load ptr, ptr %24, align 8
  %487 = getelementptr inbounds %struct.TupleValue, ptr %486, i32 0, i32 0
  %488 = load i32, ptr %487, align 8
  %489 = icmp slt i32 %485, %488
  br i1 %489, label %490, label %509

490:                                              ; preds = %484
  %491 = load ptr, ptr %6, align 8
  %492 = load ptr, ptr %24, align 8
  %493 = getelementptr inbounds %struct.TupleValue, ptr %492, i32 0, i32 1
  %494 = load ptr, ptr %493, align 8
  %495 = load i32, ptr %26, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds ptr, ptr %494, i64 %496
  %498 = load ptr, ptr %497, align 8
  %499 = call ptr @subCalcLangValues(ptr noundef %491, i32 noundef 0, ptr noundef %498, i32 noundef 1)
  %500 = load ptr, ptr %25, align 8
  %501 = getelementptr inbounds %struct.TupleValue, ptr %500, i32 0, i32 1
  %502 = load ptr, ptr %501, align 8
  %503 = load i32, ptr %26, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds ptr, ptr %502, i64 %504
  store ptr %499, ptr %505, align 8
  br label %506

506:                                              ; preds = %490
  %507 = load i32, ptr %26, align 4
  %508 = add nsw i32 %507, 1
  store i32 %508, ptr %26, align 4
  br label %484, !llvm.loop !29

509:                                              ; preds = %484
  %510 = load ptr, ptr %10, align 8
  %511 = getelementptr inbounds %struct.CalcLangVal, ptr %510, i32 0, i32 0
  store i32 7, ptr %511, align 8
  %512 = load ptr, ptr %25, align 8
  %513 = load ptr, ptr %10, align 8
  %514 = getelementptr inbounds %struct.CalcLangVal, ptr %513, i32 0, i32 1
  store ptr %512, ptr %514, align 8
  br label %1315

515:                                              ; preds = %461, %456
  %516 = load ptr, ptr %6, align 8
  %517 = getelementptr inbounds %struct.CalcLangVal, ptr %516, i32 0, i32 0
  %518 = load i32, ptr %517, align 8
  %519 = icmp eq i32 %518, 7
  br i1 %519, label %520, label %574

520:                                              ; preds = %515
  %521 = load ptr, ptr %8, align 8
  %522 = getelementptr inbounds %struct.CalcLangVal, ptr %521, i32 0, i32 0
  %523 = load i32, ptr %522, align 8
  %524 = icmp eq i32 %523, 3
  br i1 %524, label %525, label %574

525:                                              ; preds = %520
  %526 = load ptr, ptr %6, align 8
  %527 = getelementptr inbounds %struct.CalcLangVal, ptr %526, i32 0, i32 1
  %528 = load ptr, ptr %527, align 8
  store ptr %528, ptr %27, align 8
  %529 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %529, ptr %28, align 8
  %530 = load ptr, ptr %27, align 8
  %531 = getelementptr inbounds %struct.TupleValue, ptr %530, i32 0, i32 0
  %532 = load i32, ptr %531, align 8
  %533 = load ptr, ptr %28, align 8
  %534 = getelementptr inbounds %struct.TupleValue, ptr %533, i32 0, i32 0
  store i32 %532, ptr %534, align 8
  %535 = load ptr, ptr %28, align 8
  %536 = getelementptr inbounds %struct.TupleValue, ptr %535, i32 0, i32 0
  %537 = load i32, ptr %536, align 8
  %538 = sext i32 %537 to i64
  %539 = mul i64 8, %538
  %540 = call noalias ptr @malloc(i64 noundef %539) #4
  %541 = load ptr, ptr %28, align 8
  %542 = getelementptr inbounds %struct.TupleValue, ptr %541, i32 0, i32 1
  store ptr %540, ptr %542, align 8
  store i32 0, ptr %29, align 4
  br label %543

543:                                              ; preds = %565, %525
  %544 = load i32, ptr %29, align 4
  %545 = load ptr, ptr %27, align 8
  %546 = getelementptr inbounds %struct.TupleValue, ptr %545, i32 0, i32 0
  %547 = load i32, ptr %546, align 8
  %548 = icmp slt i32 %544, %547
  br i1 %548, label %549, label %568

549:                                              ; preds = %543
  %550 = load ptr, ptr %27, align 8
  %551 = getelementptr inbounds %struct.TupleValue, ptr %550, i32 0, i32 1
  %552 = load ptr, ptr %551, align 8
  %553 = load i32, ptr %29, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds ptr, ptr %552, i64 %554
  %556 = load ptr, ptr %555, align 8
  %557 = load ptr, ptr %8, align 8
  %558 = call ptr @subCalcLangValues(ptr noundef %556, i32 noundef 1, ptr noundef %557, i32 noundef 0)
  %559 = load ptr, ptr %28, align 8
  %560 = getelementptr inbounds %struct.TupleValue, ptr %559, i32 0, i32 1
  %561 = load ptr, ptr %560, align 8
  %562 = load i32, ptr %29, align 4
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds ptr, ptr %561, i64 %563
  store ptr %558, ptr %564, align 8
  br label %565

565:                                              ; preds = %549
  %566 = load i32, ptr %29, align 4
  %567 = add nsw i32 %566, 1
  store i32 %567, ptr %29, align 4
  br label %543, !llvm.loop !30

568:                                              ; preds = %543
  %569 = load ptr, ptr %10, align 8
  %570 = getelementptr inbounds %struct.CalcLangVal, ptr %569, i32 0, i32 0
  store i32 7, ptr %570, align 8
  %571 = load ptr, ptr %28, align 8
  %572 = load ptr, ptr %10, align 8
  %573 = getelementptr inbounds %struct.CalcLangVal, ptr %572, i32 0, i32 1
  store ptr %571, ptr %573, align 8
  br label %1314

574:                                              ; preds = %520, %515
  %575 = load ptr, ptr %6, align 8
  %576 = getelementptr inbounds %struct.CalcLangVal, ptr %575, i32 0, i32 0
  %577 = load i32, ptr %576, align 8
  %578 = icmp eq i32 %577, 3
  br i1 %578, label %579, label %633

579:                                              ; preds = %574
  %580 = load ptr, ptr %8, align 8
  %581 = getelementptr inbounds %struct.CalcLangVal, ptr %580, i32 0, i32 0
  %582 = load i32, ptr %581, align 8
  %583 = icmp eq i32 %582, 7
  br i1 %583, label %584, label %633

584:                                              ; preds = %579
  %585 = load ptr, ptr %8, align 8
  %586 = getelementptr inbounds %struct.CalcLangVal, ptr %585, i32 0, i32 1
  %587 = load ptr, ptr %586, align 8
  store ptr %587, ptr %30, align 8
  %588 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %588, ptr %31, align 8
  %589 = load ptr, ptr %30, align 8
  %590 = getelementptr inbounds %struct.TupleValue, ptr %589, i32 0, i32 0
  %591 = load i32, ptr %590, align 8
  %592 = load ptr, ptr %31, align 8
  %593 = getelementptr inbounds %struct.TupleValue, ptr %592, i32 0, i32 0
  store i32 %591, ptr %593, align 8
  %594 = load ptr, ptr %31, align 8
  %595 = getelementptr inbounds %struct.TupleValue, ptr %594, i32 0, i32 0
  %596 = load i32, ptr %595, align 8
  %597 = sext i32 %596 to i64
  %598 = mul i64 8, %597
  %599 = call noalias ptr @malloc(i64 noundef %598) #4
  %600 = load ptr, ptr %31, align 8
  %601 = getelementptr inbounds %struct.TupleValue, ptr %600, i32 0, i32 1
  store ptr %599, ptr %601, align 8
  store i32 0, ptr %32, align 4
  br label %602

602:                                              ; preds = %624, %584
  %603 = load i32, ptr %32, align 4
  %604 = load ptr, ptr %30, align 8
  %605 = getelementptr inbounds %struct.TupleValue, ptr %604, i32 0, i32 0
  %606 = load i32, ptr %605, align 8
  %607 = icmp slt i32 %603, %606
  br i1 %607, label %608, label %627

608:                                              ; preds = %602
  %609 = load ptr, ptr %6, align 8
  %610 = load ptr, ptr %30, align 8
  %611 = getelementptr inbounds %struct.TupleValue, ptr %610, i32 0, i32 1
  %612 = load ptr, ptr %611, align 8
  %613 = load i32, ptr %32, align 4
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds ptr, ptr %612, i64 %614
  %616 = load ptr, ptr %615, align 8
  %617 = call ptr @subCalcLangValues(ptr noundef %609, i32 noundef 0, ptr noundef %616, i32 noundef 1)
  %618 = load ptr, ptr %31, align 8
  %619 = getelementptr inbounds %struct.TupleValue, ptr %618, i32 0, i32 1
  %620 = load ptr, ptr %619, align 8
  %621 = load i32, ptr %32, align 4
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds ptr, ptr %620, i64 %622
  store ptr %617, ptr %623, align 8
  br label %624

624:                                              ; preds = %608
  %625 = load i32, ptr %32, align 4
  %626 = add nsw i32 %625, 1
  store i32 %626, ptr %32, align 4
  br label %602, !llvm.loop !31

627:                                              ; preds = %602
  %628 = load ptr, ptr %10, align 8
  %629 = getelementptr inbounds %struct.CalcLangVal, ptr %628, i32 0, i32 0
  store i32 7, ptr %629, align 8
  %630 = load ptr, ptr %31, align 8
  %631 = load ptr, ptr %10, align 8
  %632 = getelementptr inbounds %struct.CalcLangVal, ptr %631, i32 0, i32 1
  store ptr %630, ptr %632, align 8
  br label %1313

633:                                              ; preds = %579, %574
  %634 = load ptr, ptr %6, align 8
  %635 = getelementptr inbounds %struct.CalcLangVal, ptr %634, i32 0, i32 0
  %636 = load i32, ptr %635, align 8
  %637 = icmp eq i32 %636, 7
  br i1 %637, label %638, label %692

638:                                              ; preds = %633
  %639 = load ptr, ptr %8, align 8
  %640 = getelementptr inbounds %struct.CalcLangVal, ptr %639, i32 0, i32 0
  %641 = load i32, ptr %640, align 8
  %642 = icmp eq i32 %641, 4
  br i1 %642, label %643, label %692

643:                                              ; preds = %638
  %644 = load ptr, ptr %6, align 8
  %645 = getelementptr inbounds %struct.CalcLangVal, ptr %644, i32 0, i32 1
  %646 = load ptr, ptr %645, align 8
  store ptr %646, ptr %33, align 8
  %647 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %647, ptr %34, align 8
  %648 = load ptr, ptr %33, align 8
  %649 = getelementptr inbounds %struct.TupleValue, ptr %648, i32 0, i32 0
  %650 = load i32, ptr %649, align 8
  %651 = load ptr, ptr %34, align 8
  %652 = getelementptr inbounds %struct.TupleValue, ptr %651, i32 0, i32 0
  store i32 %650, ptr %652, align 8
  %653 = load ptr, ptr %34, align 8
  %654 = getelementptr inbounds %struct.TupleValue, ptr %653, i32 0, i32 0
  %655 = load i32, ptr %654, align 8
  %656 = sext i32 %655 to i64
  %657 = mul i64 8, %656
  %658 = call noalias ptr @malloc(i64 noundef %657) #4
  %659 = load ptr, ptr %34, align 8
  %660 = getelementptr inbounds %struct.TupleValue, ptr %659, i32 0, i32 1
  store ptr %658, ptr %660, align 8
  store i32 0, ptr %35, align 4
  br label %661

661:                                              ; preds = %683, %643
  %662 = load i32, ptr %35, align 4
  %663 = load ptr, ptr %33, align 8
  %664 = getelementptr inbounds %struct.TupleValue, ptr %663, i32 0, i32 0
  %665 = load i32, ptr %664, align 8
  %666 = icmp slt i32 %662, %665
  br i1 %666, label %667, label %686

667:                                              ; preds = %661
  %668 = load ptr, ptr %33, align 8
  %669 = getelementptr inbounds %struct.TupleValue, ptr %668, i32 0, i32 1
  %670 = load ptr, ptr %669, align 8
  %671 = load i32, ptr %35, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds ptr, ptr %670, i64 %672
  %674 = load ptr, ptr %673, align 8
  %675 = load ptr, ptr %8, align 8
  %676 = call ptr @subCalcLangValues(ptr noundef %674, i32 noundef 1, ptr noundef %675, i32 noundef 0)
  %677 = load ptr, ptr %34, align 8
  %678 = getelementptr inbounds %struct.TupleValue, ptr %677, i32 0, i32 1
  %679 = load ptr, ptr %678, align 8
  %680 = load i32, ptr %35, align 4
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds ptr, ptr %679, i64 %681
  store ptr %676, ptr %682, align 8
  br label %683

683:                                              ; preds = %667
  %684 = load i32, ptr %35, align 4
  %685 = add nsw i32 %684, 1
  store i32 %685, ptr %35, align 4
  br label %661, !llvm.loop !32

686:                                              ; preds = %661
  %687 = load ptr, ptr %10, align 8
  %688 = getelementptr inbounds %struct.CalcLangVal, ptr %687, i32 0, i32 0
  store i32 7, ptr %688, align 8
  %689 = load ptr, ptr %34, align 8
  %690 = load ptr, ptr %10, align 8
  %691 = getelementptr inbounds %struct.CalcLangVal, ptr %690, i32 0, i32 1
  store ptr %689, ptr %691, align 8
  br label %1312

692:                                              ; preds = %638, %633
  %693 = load ptr, ptr %6, align 8
  %694 = getelementptr inbounds %struct.CalcLangVal, ptr %693, i32 0, i32 0
  %695 = load i32, ptr %694, align 8
  %696 = icmp eq i32 %695, 4
  br i1 %696, label %697, label %751

697:                                              ; preds = %692
  %698 = load ptr, ptr %8, align 8
  %699 = getelementptr inbounds %struct.CalcLangVal, ptr %698, i32 0, i32 0
  %700 = load i32, ptr %699, align 8
  %701 = icmp eq i32 %700, 7
  br i1 %701, label %702, label %751

702:                                              ; preds = %697
  %703 = load ptr, ptr %8, align 8
  %704 = getelementptr inbounds %struct.CalcLangVal, ptr %703, i32 0, i32 1
  %705 = load ptr, ptr %704, align 8
  store ptr %705, ptr %36, align 8
  %706 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %706, ptr %37, align 8
  %707 = load ptr, ptr %36, align 8
  %708 = getelementptr inbounds %struct.TupleValue, ptr %707, i32 0, i32 0
  %709 = load i32, ptr %708, align 8
  %710 = load ptr, ptr %37, align 8
  %711 = getelementptr inbounds %struct.TupleValue, ptr %710, i32 0, i32 0
  store i32 %709, ptr %711, align 8
  %712 = load ptr, ptr %37, align 8
  %713 = getelementptr inbounds %struct.TupleValue, ptr %712, i32 0, i32 0
  %714 = load i32, ptr %713, align 8
  %715 = sext i32 %714 to i64
  %716 = mul i64 8, %715
  %717 = call noalias ptr @malloc(i64 noundef %716) #4
  %718 = load ptr, ptr %37, align 8
  %719 = getelementptr inbounds %struct.TupleValue, ptr %718, i32 0, i32 1
  store ptr %717, ptr %719, align 8
  store i32 0, ptr %38, align 4
  br label %720

720:                                              ; preds = %742, %702
  %721 = load i32, ptr %38, align 4
  %722 = load ptr, ptr %36, align 8
  %723 = getelementptr inbounds %struct.TupleValue, ptr %722, i32 0, i32 0
  %724 = load i32, ptr %723, align 8
  %725 = icmp slt i32 %721, %724
  br i1 %725, label %726, label %745

726:                                              ; preds = %720
  %727 = load ptr, ptr %6, align 8
  %728 = load ptr, ptr %36, align 8
  %729 = getelementptr inbounds %struct.TupleValue, ptr %728, i32 0, i32 1
  %730 = load ptr, ptr %729, align 8
  %731 = load i32, ptr %38, align 4
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds ptr, ptr %730, i64 %732
  %734 = load ptr, ptr %733, align 8
  %735 = call ptr @subCalcLangValues(ptr noundef %727, i32 noundef 0, ptr noundef %734, i32 noundef 1)
  %736 = load ptr, ptr %37, align 8
  %737 = getelementptr inbounds %struct.TupleValue, ptr %736, i32 0, i32 1
  %738 = load ptr, ptr %737, align 8
  %739 = load i32, ptr %38, align 4
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds ptr, ptr %738, i64 %740
  store ptr %735, ptr %741, align 8
  br label %742

742:                                              ; preds = %726
  %743 = load i32, ptr %38, align 4
  %744 = add nsw i32 %743, 1
  store i32 %744, ptr %38, align 4
  br label %720, !llvm.loop !33

745:                                              ; preds = %720
  %746 = load ptr, ptr %10, align 8
  %747 = getelementptr inbounds %struct.CalcLangVal, ptr %746, i32 0, i32 0
  store i32 7, ptr %747, align 8
  %748 = load ptr, ptr %37, align 8
  %749 = load ptr, ptr %10, align 8
  %750 = getelementptr inbounds %struct.CalcLangVal, ptr %749, i32 0, i32 1
  store ptr %748, ptr %750, align 8
  br label %1311

751:                                              ; preds = %697, %692
  %752 = load ptr, ptr %6, align 8
  %753 = getelementptr inbounds %struct.CalcLangVal, ptr %752, i32 0, i32 0
  %754 = load i32, ptr %753, align 8
  %755 = icmp eq i32 %754, 6
  br i1 %755, label %756, label %829

756:                                              ; preds = %751
  %757 = load ptr, ptr %8, align 8
  %758 = getelementptr inbounds %struct.CalcLangVal, ptr %757, i32 0, i32 0
  %759 = load i32, ptr %758, align 8
  %760 = icmp eq i32 %759, 6
  br i1 %760, label %761, label %829

761:                                              ; preds = %756
  %762 = load ptr, ptr %6, align 8
  %763 = getelementptr inbounds %struct.CalcLangVal, ptr %762, i32 0, i32 1
  %764 = load ptr, ptr %763, align 8
  store ptr %764, ptr %39, align 8
  %765 = load ptr, ptr %8, align 8
  %766 = getelementptr inbounds %struct.CalcLangVal, ptr %765, i32 0, i32 1
  %767 = load ptr, ptr %766, align 8
  store ptr %767, ptr %40, align 8
  %768 = load ptr, ptr %40, align 8
  %769 = getelementptr inbounds %struct.SetValue, ptr %768, i32 0, i32 0
  %770 = load i32, ptr %769, align 8
  %771 = load ptr, ptr %39, align 8
  %772 = getelementptr inbounds %struct.SetValue, ptr %771, i32 0, i32 0
  %773 = load i32, ptr %772, align 8
  %774 = icmp eq i32 %770, %773
  br i1 %774, label %775, label %827

775:                                              ; preds = %761
  %776 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %776, ptr %41, align 8
  %777 = load ptr, ptr %39, align 8
  %778 = getelementptr inbounds %struct.SetValue, ptr %777, i32 0, i32 0
  %779 = load i32, ptr %778, align 8
  %780 = load ptr, ptr %41, align 8
  %781 = getelementptr inbounds %struct.SetValue, ptr %780, i32 0, i32 0
  store i32 %779, ptr %781, align 8
  %782 = load ptr, ptr %41, align 8
  %783 = getelementptr inbounds %struct.SetValue, ptr %782, i32 0, i32 0
  %784 = load i32, ptr %783, align 8
  %785 = sext i32 %784 to i64
  %786 = mul i64 8, %785
  %787 = call noalias ptr @malloc(i64 noundef %786) #4
  %788 = load ptr, ptr %41, align 8
  %789 = getelementptr inbounds %struct.SetValue, ptr %788, i32 0, i32 1
  store ptr %787, ptr %789, align 8
  store i32 0, ptr %42, align 4
  br label %790

790:                                              ; preds = %818, %775
  %791 = load i32, ptr %42, align 4
  %792 = load ptr, ptr %39, align 8
  %793 = getelementptr inbounds %struct.SetValue, ptr %792, i32 0, i32 0
  %794 = load i32, ptr %793, align 8
  %795 = icmp slt i32 %791, %794
  br i1 %795, label %796, label %821

796:                                              ; preds = %790
  %797 = load ptr, ptr %39, align 8
  %798 = getelementptr inbounds %struct.SetValue, ptr %797, i32 0, i32 1
  %799 = load ptr, ptr %798, align 8
  %800 = load i32, ptr %42, align 4
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds ptr, ptr %799, i64 %801
  %803 = load ptr, ptr %802, align 8
  %804 = load ptr, ptr %40, align 8
  %805 = getelementptr inbounds %struct.SetValue, ptr %804, i32 0, i32 1
  %806 = load ptr, ptr %805, align 8
  %807 = load i32, ptr %42, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds ptr, ptr %806, i64 %808
  %810 = load ptr, ptr %809, align 8
  %811 = call ptr @subCalcLangValues(ptr noundef %803, i32 noundef 1, ptr noundef %810, i32 noundef 1)
  %812 = load ptr, ptr %41, align 8
  %813 = getelementptr inbounds %struct.SetValue, ptr %812, i32 0, i32 1
  %814 = load ptr, ptr %813, align 8
  %815 = load i32, ptr %42, align 4
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds ptr, ptr %814, i64 %816
  store ptr %811, ptr %817, align 8
  br label %818

818:                                              ; preds = %796
  %819 = load i32, ptr %42, align 4
  %820 = add nsw i32 %819, 1
  store i32 %820, ptr %42, align 4
  br label %790, !llvm.loop !34

821:                                              ; preds = %790
  %822 = load ptr, ptr %10, align 8
  %823 = getelementptr inbounds %struct.CalcLangVal, ptr %822, i32 0, i32 0
  store i32 6, ptr %823, align 8
  %824 = load ptr, ptr %41, align 8
  %825 = load ptr, ptr %10, align 8
  %826 = getelementptr inbounds %struct.CalcLangVal, ptr %825, i32 0, i32 1
  store ptr %824, ptr %826, align 8
  br label %828

827:                                              ; preds = %761
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1338

828:                                              ; preds = %821
  br label %1310

829:                                              ; preds = %756, %751
  %830 = load ptr, ptr %6, align 8
  %831 = getelementptr inbounds %struct.CalcLangVal, ptr %830, i32 0, i32 0
  %832 = load i32, ptr %831, align 8
  %833 = icmp eq i32 %832, 6
  br i1 %833, label %834, label %888

834:                                              ; preds = %829
  %835 = load ptr, ptr %8, align 8
  %836 = getelementptr inbounds %struct.CalcLangVal, ptr %835, i32 0, i32 0
  %837 = load i32, ptr %836, align 8
  %838 = icmp eq i32 %837, 0
  br i1 %838, label %839, label %888

839:                                              ; preds = %834
  %840 = load ptr, ptr %6, align 8
  %841 = getelementptr inbounds %struct.CalcLangVal, ptr %840, i32 0, i32 1
  %842 = load ptr, ptr %841, align 8
  store ptr %842, ptr %43, align 8
  %843 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %843, ptr %44, align 8
  %844 = load ptr, ptr %43, align 8
  %845 = getelementptr inbounds %struct.SetValue, ptr %844, i32 0, i32 0
  %846 = load i32, ptr %845, align 8
  %847 = load ptr, ptr %44, align 8
  %848 = getelementptr inbounds %struct.SetValue, ptr %847, i32 0, i32 0
  store i32 %846, ptr %848, align 8
  %849 = load ptr, ptr %44, align 8
  %850 = getelementptr inbounds %struct.SetValue, ptr %849, i32 0, i32 0
  %851 = load i32, ptr %850, align 8
  %852 = sext i32 %851 to i64
  %853 = mul i64 8, %852
  %854 = call noalias ptr @malloc(i64 noundef %853) #4
  %855 = load ptr, ptr %44, align 8
  %856 = getelementptr inbounds %struct.SetValue, ptr %855, i32 0, i32 1
  store ptr %854, ptr %856, align 8
  store i32 0, ptr %45, align 4
  br label %857

857:                                              ; preds = %879, %839
  %858 = load i32, ptr %45, align 4
  %859 = load ptr, ptr %43, align 8
  %860 = getelementptr inbounds %struct.SetValue, ptr %859, i32 0, i32 0
  %861 = load i32, ptr %860, align 8
  %862 = icmp slt i32 %858, %861
  br i1 %862, label %863, label %882

863:                                              ; preds = %857
  %864 = load ptr, ptr %43, align 8
  %865 = getelementptr inbounds %struct.SetValue, ptr %864, i32 0, i32 1
  %866 = load ptr, ptr %865, align 8
  %867 = load i32, ptr %45, align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds ptr, ptr %866, i64 %868
  %870 = load ptr, ptr %869, align 8
  %871 = load ptr, ptr %8, align 8
  %872 = call ptr @subCalcLangValues(ptr noundef %870, i32 noundef 1, ptr noundef %871, i32 noundef 0)
  %873 = load ptr, ptr %44, align 8
  %874 = getelementptr inbounds %struct.SetValue, ptr %873, i32 0, i32 1
  %875 = load ptr, ptr %874, align 8
  %876 = load i32, ptr %45, align 4
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds ptr, ptr %875, i64 %877
  store ptr %872, ptr %878, align 8
  br label %879

879:                                              ; preds = %863
  %880 = load i32, ptr %45, align 4
  %881 = add nsw i32 %880, 1
  store i32 %881, ptr %45, align 4
  br label %857, !llvm.loop !35

882:                                              ; preds = %857
  %883 = load ptr, ptr %10, align 8
  %884 = getelementptr inbounds %struct.CalcLangVal, ptr %883, i32 0, i32 0
  store i32 6, ptr %884, align 8
  %885 = load ptr, ptr %44, align 8
  %886 = load ptr, ptr %10, align 8
  %887 = getelementptr inbounds %struct.CalcLangVal, ptr %886, i32 0, i32 1
  store ptr %885, ptr %887, align 8
  br label %1309

888:                                              ; preds = %834, %829
  %889 = load ptr, ptr %6, align 8
  %890 = getelementptr inbounds %struct.CalcLangVal, ptr %889, i32 0, i32 0
  %891 = load i32, ptr %890, align 8
  %892 = icmp eq i32 %891, 0
  br i1 %892, label %893, label %947

893:                                              ; preds = %888
  %894 = load ptr, ptr %8, align 8
  %895 = getelementptr inbounds %struct.CalcLangVal, ptr %894, i32 0, i32 0
  %896 = load i32, ptr %895, align 8
  %897 = icmp eq i32 %896, 6
  br i1 %897, label %898, label %947

898:                                              ; preds = %893
  %899 = load ptr, ptr %8, align 8
  %900 = getelementptr inbounds %struct.CalcLangVal, ptr %899, i32 0, i32 1
  %901 = load ptr, ptr %900, align 8
  store ptr %901, ptr %46, align 8
  %902 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %902, ptr %47, align 8
  %903 = load ptr, ptr %46, align 8
  %904 = getelementptr inbounds %struct.SetValue, ptr %903, i32 0, i32 0
  %905 = load i32, ptr %904, align 8
  %906 = load ptr, ptr %47, align 8
  %907 = getelementptr inbounds %struct.SetValue, ptr %906, i32 0, i32 0
  store i32 %905, ptr %907, align 8
  %908 = load ptr, ptr %47, align 8
  %909 = getelementptr inbounds %struct.SetValue, ptr %908, i32 0, i32 0
  %910 = load i32, ptr %909, align 8
  %911 = sext i32 %910 to i64
  %912 = mul i64 8, %911
  %913 = call noalias ptr @malloc(i64 noundef %912) #4
  %914 = load ptr, ptr %47, align 8
  %915 = getelementptr inbounds %struct.SetValue, ptr %914, i32 0, i32 1
  store ptr %913, ptr %915, align 8
  store i32 0, ptr %48, align 4
  br label %916

916:                                              ; preds = %938, %898
  %917 = load i32, ptr %48, align 4
  %918 = load ptr, ptr %46, align 8
  %919 = getelementptr inbounds %struct.SetValue, ptr %918, i32 0, i32 0
  %920 = load i32, ptr %919, align 8
  %921 = icmp slt i32 %917, %920
  br i1 %921, label %922, label %941

922:                                              ; preds = %916
  %923 = load ptr, ptr %6, align 8
  %924 = load ptr, ptr %46, align 8
  %925 = getelementptr inbounds %struct.SetValue, ptr %924, i32 0, i32 1
  %926 = load ptr, ptr %925, align 8
  %927 = load i32, ptr %48, align 4
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds ptr, ptr %926, i64 %928
  %930 = load ptr, ptr %929, align 8
  %931 = call ptr @subCalcLangValues(ptr noundef %923, i32 noundef 0, ptr noundef %930, i32 noundef 1)
  %932 = load ptr, ptr %47, align 8
  %933 = getelementptr inbounds %struct.SetValue, ptr %932, i32 0, i32 1
  %934 = load ptr, ptr %933, align 8
  %935 = load i32, ptr %48, align 4
  %936 = sext i32 %935 to i64
  %937 = getelementptr inbounds ptr, ptr %934, i64 %936
  store ptr %931, ptr %937, align 8
  br label %938

938:                                              ; preds = %922
  %939 = load i32, ptr %48, align 4
  %940 = add nsw i32 %939, 1
  store i32 %940, ptr %48, align 4
  br label %916, !llvm.loop !36

941:                                              ; preds = %916
  %942 = load ptr, ptr %10, align 8
  %943 = getelementptr inbounds %struct.CalcLangVal, ptr %942, i32 0, i32 0
  store i32 6, ptr %943, align 8
  %944 = load ptr, ptr %47, align 8
  %945 = load ptr, ptr %10, align 8
  %946 = getelementptr inbounds %struct.CalcLangVal, ptr %945, i32 0, i32 1
  store ptr %944, ptr %946, align 8
  br label %1308

947:                                              ; preds = %893, %888
  %948 = load ptr, ptr %6, align 8
  %949 = getelementptr inbounds %struct.CalcLangVal, ptr %948, i32 0, i32 0
  %950 = load i32, ptr %949, align 8
  %951 = icmp eq i32 %950, 6
  br i1 %951, label %952, label %1006

952:                                              ; preds = %947
  %953 = load ptr, ptr %8, align 8
  %954 = getelementptr inbounds %struct.CalcLangVal, ptr %953, i32 0, i32 0
  %955 = load i32, ptr %954, align 8
  %956 = icmp eq i32 %955, 1
  br i1 %956, label %957, label %1006

957:                                              ; preds = %952
  %958 = load ptr, ptr %6, align 8
  %959 = getelementptr inbounds %struct.CalcLangVal, ptr %958, i32 0, i32 1
  %960 = load ptr, ptr %959, align 8
  store ptr %960, ptr %49, align 8
  %961 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %961, ptr %50, align 8
  %962 = load ptr, ptr %49, align 8
  %963 = getelementptr inbounds %struct.SetValue, ptr %962, i32 0, i32 0
  %964 = load i32, ptr %963, align 8
  %965 = load ptr, ptr %50, align 8
  %966 = getelementptr inbounds %struct.SetValue, ptr %965, i32 0, i32 0
  store i32 %964, ptr %966, align 8
  %967 = load ptr, ptr %50, align 8
  %968 = getelementptr inbounds %struct.SetValue, ptr %967, i32 0, i32 0
  %969 = load i32, ptr %968, align 8
  %970 = sext i32 %969 to i64
  %971 = mul i64 8, %970
  %972 = call noalias ptr @malloc(i64 noundef %971) #4
  %973 = load ptr, ptr %50, align 8
  %974 = getelementptr inbounds %struct.SetValue, ptr %973, i32 0, i32 1
  store ptr %972, ptr %974, align 8
  store i32 0, ptr %51, align 4
  br label %975

975:                                              ; preds = %997, %957
  %976 = load i32, ptr %51, align 4
  %977 = load ptr, ptr %49, align 8
  %978 = getelementptr inbounds %struct.SetValue, ptr %977, i32 0, i32 0
  %979 = load i32, ptr %978, align 8
  %980 = icmp slt i32 %976, %979
  br i1 %980, label %981, label %1000

981:                                              ; preds = %975
  %982 = load ptr, ptr %49, align 8
  %983 = getelementptr inbounds %struct.SetValue, ptr %982, i32 0, i32 1
  %984 = load ptr, ptr %983, align 8
  %985 = load i32, ptr %51, align 4
  %986 = sext i32 %985 to i64
  %987 = getelementptr inbounds ptr, ptr %984, i64 %986
  %988 = load ptr, ptr %987, align 8
  %989 = load ptr, ptr %8, align 8
  %990 = call ptr @subCalcLangValues(ptr noundef %988, i32 noundef 1, ptr noundef %989, i32 noundef 0)
  %991 = load ptr, ptr %50, align 8
  %992 = getelementptr inbounds %struct.SetValue, ptr %991, i32 0, i32 1
  %993 = load ptr, ptr %992, align 8
  %994 = load i32, ptr %51, align 4
  %995 = sext i32 %994 to i64
  %996 = getelementptr inbounds ptr, ptr %993, i64 %995
  store ptr %990, ptr %996, align 8
  br label %997

997:                                              ; preds = %981
  %998 = load i32, ptr %51, align 4
  %999 = add nsw i32 %998, 1
  store i32 %999, ptr %51, align 4
  br label %975, !llvm.loop !37

1000:                                             ; preds = %975
  %1001 = load ptr, ptr %10, align 8
  %1002 = getelementptr inbounds %struct.CalcLangVal, ptr %1001, i32 0, i32 0
  store i32 7, ptr %1002, align 8
  %1003 = load ptr, ptr %50, align 8
  %1004 = load ptr, ptr %10, align 8
  %1005 = getelementptr inbounds %struct.CalcLangVal, ptr %1004, i32 0, i32 1
  store ptr %1003, ptr %1005, align 8
  br label %1307

1006:                                             ; preds = %952, %947
  %1007 = load ptr, ptr %6, align 8
  %1008 = getelementptr inbounds %struct.CalcLangVal, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = icmp eq i32 %1009, 1
  br i1 %1010, label %1011, label %1065

1011:                                             ; preds = %1006
  %1012 = load ptr, ptr %8, align 8
  %1013 = getelementptr inbounds %struct.CalcLangVal, ptr %1012, i32 0, i32 0
  %1014 = load i32, ptr %1013, align 8
  %1015 = icmp eq i32 %1014, 6
  br i1 %1015, label %1016, label %1065

1016:                                             ; preds = %1011
  %1017 = load ptr, ptr %8, align 8
  %1018 = getelementptr inbounds %struct.CalcLangVal, ptr %1017, i32 0, i32 1
  %1019 = load ptr, ptr %1018, align 8
  store ptr %1019, ptr %52, align 8
  %1020 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1020, ptr %53, align 8
  %1021 = load ptr, ptr %52, align 8
  %1022 = getelementptr inbounds %struct.SetValue, ptr %1021, i32 0, i32 0
  %1023 = load i32, ptr %1022, align 8
  %1024 = load ptr, ptr %53, align 8
  %1025 = getelementptr inbounds %struct.SetValue, ptr %1024, i32 0, i32 0
  store i32 %1023, ptr %1025, align 8
  %1026 = load ptr, ptr %53, align 8
  %1027 = getelementptr inbounds %struct.SetValue, ptr %1026, i32 0, i32 0
  %1028 = load i32, ptr %1027, align 8
  %1029 = sext i32 %1028 to i64
  %1030 = mul i64 8, %1029
  %1031 = call noalias ptr @malloc(i64 noundef %1030) #4
  %1032 = load ptr, ptr %53, align 8
  %1033 = getelementptr inbounds %struct.SetValue, ptr %1032, i32 0, i32 1
  store ptr %1031, ptr %1033, align 8
  store i32 0, ptr %54, align 4
  br label %1034

1034:                                             ; preds = %1056, %1016
  %1035 = load i32, ptr %54, align 4
  %1036 = load ptr, ptr %52, align 8
  %1037 = getelementptr inbounds %struct.SetValue, ptr %1036, i32 0, i32 0
  %1038 = load i32, ptr %1037, align 8
  %1039 = icmp slt i32 %1035, %1038
  br i1 %1039, label %1040, label %1059

1040:                                             ; preds = %1034
  %1041 = load ptr, ptr %6, align 8
  %1042 = load ptr, ptr %52, align 8
  %1043 = getelementptr inbounds %struct.SetValue, ptr %1042, i32 0, i32 1
  %1044 = load ptr, ptr %1043, align 8
  %1045 = load i32, ptr %54, align 4
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds ptr, ptr %1044, i64 %1046
  %1048 = load ptr, ptr %1047, align 8
  %1049 = call ptr @subCalcLangValues(ptr noundef %1041, i32 noundef 0, ptr noundef %1048, i32 noundef 1)
  %1050 = load ptr, ptr %53, align 8
  %1051 = getelementptr inbounds %struct.SetValue, ptr %1050, i32 0, i32 1
  %1052 = load ptr, ptr %1051, align 8
  %1053 = load i32, ptr %54, align 4
  %1054 = sext i32 %1053 to i64
  %1055 = getelementptr inbounds ptr, ptr %1052, i64 %1054
  store ptr %1049, ptr %1055, align 8
  br label %1056

1056:                                             ; preds = %1040
  %1057 = load i32, ptr %54, align 4
  %1058 = add nsw i32 %1057, 1
  store i32 %1058, ptr %54, align 4
  br label %1034, !llvm.loop !38

1059:                                             ; preds = %1034
  %1060 = load ptr, ptr %10, align 8
  %1061 = getelementptr inbounds %struct.CalcLangVal, ptr %1060, i32 0, i32 0
  store i32 6, ptr %1061, align 8
  %1062 = load ptr, ptr %53, align 8
  %1063 = load ptr, ptr %10, align 8
  %1064 = getelementptr inbounds %struct.CalcLangVal, ptr %1063, i32 0, i32 1
  store ptr %1062, ptr %1064, align 8
  br label %1306

1065:                                             ; preds = %1011, %1006
  %1066 = load ptr, ptr %6, align 8
  %1067 = getelementptr inbounds %struct.CalcLangVal, ptr %1066, i32 0, i32 0
  %1068 = load i32, ptr %1067, align 8
  %1069 = icmp eq i32 %1068, 6
  br i1 %1069, label %1070, label %1124

1070:                                             ; preds = %1065
  %1071 = load ptr, ptr %8, align 8
  %1072 = getelementptr inbounds %struct.CalcLangVal, ptr %1071, i32 0, i32 0
  %1073 = load i32, ptr %1072, align 8
  %1074 = icmp eq i32 %1073, 3
  br i1 %1074, label %1075, label %1124

1075:                                             ; preds = %1070
  %1076 = load ptr, ptr %6, align 8
  %1077 = getelementptr inbounds %struct.CalcLangVal, ptr %1076, i32 0, i32 1
  %1078 = load ptr, ptr %1077, align 8
  store ptr %1078, ptr %55, align 8
  %1079 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1079, ptr %56, align 8
  %1080 = load ptr, ptr %55, align 8
  %1081 = getelementptr inbounds %struct.SetValue, ptr %1080, i32 0, i32 0
  %1082 = load i32, ptr %1081, align 8
  %1083 = load ptr, ptr %56, align 8
  %1084 = getelementptr inbounds %struct.SetValue, ptr %1083, i32 0, i32 0
  store i32 %1082, ptr %1084, align 8
  %1085 = load ptr, ptr %56, align 8
  %1086 = getelementptr inbounds %struct.SetValue, ptr %1085, i32 0, i32 0
  %1087 = load i32, ptr %1086, align 8
  %1088 = sext i32 %1087 to i64
  %1089 = mul i64 8, %1088
  %1090 = call noalias ptr @malloc(i64 noundef %1089) #4
  %1091 = load ptr, ptr %56, align 8
  %1092 = getelementptr inbounds %struct.SetValue, ptr %1091, i32 0, i32 1
  store ptr %1090, ptr %1092, align 8
  store i32 0, ptr %57, align 4
  br label %1093

1093:                                             ; preds = %1115, %1075
  %1094 = load i32, ptr %57, align 4
  %1095 = load ptr, ptr %55, align 8
  %1096 = getelementptr inbounds %struct.SetValue, ptr %1095, i32 0, i32 0
  %1097 = load i32, ptr %1096, align 8
  %1098 = icmp slt i32 %1094, %1097
  br i1 %1098, label %1099, label %1118

1099:                                             ; preds = %1093
  %1100 = load ptr, ptr %55, align 8
  %1101 = getelementptr inbounds %struct.SetValue, ptr %1100, i32 0, i32 1
  %1102 = load ptr, ptr %1101, align 8
  %1103 = load i32, ptr %57, align 4
  %1104 = sext i32 %1103 to i64
  %1105 = getelementptr inbounds ptr, ptr %1102, i64 %1104
  %1106 = load ptr, ptr %1105, align 8
  %1107 = load ptr, ptr %8, align 8
  %1108 = call ptr @subCalcLangValues(ptr noundef %1106, i32 noundef 1, ptr noundef %1107, i32 noundef 0)
  %1109 = load ptr, ptr %56, align 8
  %1110 = getelementptr inbounds %struct.SetValue, ptr %1109, i32 0, i32 1
  %1111 = load ptr, ptr %1110, align 8
  %1112 = load i32, ptr %57, align 4
  %1113 = sext i32 %1112 to i64
  %1114 = getelementptr inbounds ptr, ptr %1111, i64 %1113
  store ptr %1108, ptr %1114, align 8
  br label %1115

1115:                                             ; preds = %1099
  %1116 = load i32, ptr %57, align 4
  %1117 = add nsw i32 %1116, 1
  store i32 %1117, ptr %57, align 4
  br label %1093, !llvm.loop !39

1118:                                             ; preds = %1093
  %1119 = load ptr, ptr %10, align 8
  %1120 = getelementptr inbounds %struct.CalcLangVal, ptr %1119, i32 0, i32 0
  store i32 6, ptr %1120, align 8
  %1121 = load ptr, ptr %56, align 8
  %1122 = load ptr, ptr %10, align 8
  %1123 = getelementptr inbounds %struct.CalcLangVal, ptr %1122, i32 0, i32 1
  store ptr %1121, ptr %1123, align 8
  br label %1305

1124:                                             ; preds = %1070, %1065
  %1125 = load ptr, ptr %6, align 8
  %1126 = getelementptr inbounds %struct.CalcLangVal, ptr %1125, i32 0, i32 0
  %1127 = load i32, ptr %1126, align 8
  %1128 = icmp eq i32 %1127, 3
  br i1 %1128, label %1129, label %1183

1129:                                             ; preds = %1124
  %1130 = load ptr, ptr %8, align 8
  %1131 = getelementptr inbounds %struct.CalcLangVal, ptr %1130, i32 0, i32 0
  %1132 = load i32, ptr %1131, align 8
  %1133 = icmp eq i32 %1132, 6
  br i1 %1133, label %1134, label %1183

1134:                                             ; preds = %1129
  %1135 = load ptr, ptr %8, align 8
  %1136 = getelementptr inbounds %struct.CalcLangVal, ptr %1135, i32 0, i32 1
  %1137 = load ptr, ptr %1136, align 8
  store ptr %1137, ptr %58, align 8
  %1138 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1138, ptr %59, align 8
  %1139 = load ptr, ptr %58, align 8
  %1140 = getelementptr inbounds %struct.SetValue, ptr %1139, i32 0, i32 0
  %1141 = load i32, ptr %1140, align 8
  %1142 = load ptr, ptr %59, align 8
  %1143 = getelementptr inbounds %struct.SetValue, ptr %1142, i32 0, i32 0
  store i32 %1141, ptr %1143, align 8
  %1144 = load ptr, ptr %59, align 8
  %1145 = getelementptr inbounds %struct.SetValue, ptr %1144, i32 0, i32 0
  %1146 = load i32, ptr %1145, align 8
  %1147 = sext i32 %1146 to i64
  %1148 = mul i64 8, %1147
  %1149 = call noalias ptr @malloc(i64 noundef %1148) #4
  %1150 = load ptr, ptr %59, align 8
  %1151 = getelementptr inbounds %struct.SetValue, ptr %1150, i32 0, i32 1
  store ptr %1149, ptr %1151, align 8
  store i32 0, ptr %60, align 4
  br label %1152

1152:                                             ; preds = %1174, %1134
  %1153 = load i32, ptr %60, align 4
  %1154 = load ptr, ptr %58, align 8
  %1155 = getelementptr inbounds %struct.SetValue, ptr %1154, i32 0, i32 0
  %1156 = load i32, ptr %1155, align 8
  %1157 = icmp slt i32 %1153, %1156
  br i1 %1157, label %1158, label %1177

1158:                                             ; preds = %1152
  %1159 = load ptr, ptr %6, align 8
  %1160 = load ptr, ptr %58, align 8
  %1161 = getelementptr inbounds %struct.SetValue, ptr %1160, i32 0, i32 1
  %1162 = load ptr, ptr %1161, align 8
  %1163 = load i32, ptr %60, align 4
  %1164 = sext i32 %1163 to i64
  %1165 = getelementptr inbounds ptr, ptr %1162, i64 %1164
  %1166 = load ptr, ptr %1165, align 8
  %1167 = call ptr @subCalcLangValues(ptr noundef %1159, i32 noundef 0, ptr noundef %1166, i32 noundef 1)
  %1168 = load ptr, ptr %59, align 8
  %1169 = getelementptr inbounds %struct.SetValue, ptr %1168, i32 0, i32 1
  %1170 = load ptr, ptr %1169, align 8
  %1171 = load i32, ptr %60, align 4
  %1172 = sext i32 %1171 to i64
  %1173 = getelementptr inbounds ptr, ptr %1170, i64 %1172
  store ptr %1167, ptr %1173, align 8
  br label %1174

1174:                                             ; preds = %1158
  %1175 = load i32, ptr %60, align 4
  %1176 = add nsw i32 %1175, 1
  store i32 %1176, ptr %60, align 4
  br label %1152, !llvm.loop !40

1177:                                             ; preds = %1152
  %1178 = load ptr, ptr %10, align 8
  %1179 = getelementptr inbounds %struct.CalcLangVal, ptr %1178, i32 0, i32 0
  store i32 6, ptr %1179, align 8
  %1180 = load ptr, ptr %59, align 8
  %1181 = load ptr, ptr %10, align 8
  %1182 = getelementptr inbounds %struct.CalcLangVal, ptr %1181, i32 0, i32 1
  store ptr %1180, ptr %1182, align 8
  br label %1304

1183:                                             ; preds = %1129, %1124
  %1184 = load ptr, ptr %6, align 8
  %1185 = getelementptr inbounds %struct.CalcLangVal, ptr %1184, i32 0, i32 0
  %1186 = load i32, ptr %1185, align 8
  %1187 = icmp eq i32 %1186, 6
  br i1 %1187, label %1188, label %1242

1188:                                             ; preds = %1183
  %1189 = load ptr, ptr %8, align 8
  %1190 = getelementptr inbounds %struct.CalcLangVal, ptr %1189, i32 0, i32 0
  %1191 = load i32, ptr %1190, align 8
  %1192 = icmp eq i32 %1191, 4
  br i1 %1192, label %1193, label %1242

1193:                                             ; preds = %1188
  %1194 = load ptr, ptr %6, align 8
  %1195 = getelementptr inbounds %struct.CalcLangVal, ptr %1194, i32 0, i32 1
  %1196 = load ptr, ptr %1195, align 8
  store ptr %1196, ptr %61, align 8
  %1197 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1197, ptr %62, align 8
  %1198 = load ptr, ptr %61, align 8
  %1199 = getelementptr inbounds %struct.SetValue, ptr %1198, i32 0, i32 0
  %1200 = load i32, ptr %1199, align 8
  %1201 = load ptr, ptr %62, align 8
  %1202 = getelementptr inbounds %struct.SetValue, ptr %1201, i32 0, i32 0
  store i32 %1200, ptr %1202, align 8
  %1203 = load ptr, ptr %62, align 8
  %1204 = getelementptr inbounds %struct.SetValue, ptr %1203, i32 0, i32 0
  %1205 = load i32, ptr %1204, align 8
  %1206 = sext i32 %1205 to i64
  %1207 = mul i64 8, %1206
  %1208 = call noalias ptr @malloc(i64 noundef %1207) #4
  %1209 = load ptr, ptr %62, align 8
  %1210 = getelementptr inbounds %struct.SetValue, ptr %1209, i32 0, i32 1
  store ptr %1208, ptr %1210, align 8
  store i32 0, ptr %63, align 4
  br label %1211

1211:                                             ; preds = %1233, %1193
  %1212 = load i32, ptr %63, align 4
  %1213 = load ptr, ptr %61, align 8
  %1214 = getelementptr inbounds %struct.SetValue, ptr %1213, i32 0, i32 0
  %1215 = load i32, ptr %1214, align 8
  %1216 = icmp slt i32 %1212, %1215
  br i1 %1216, label %1217, label %1236

1217:                                             ; preds = %1211
  %1218 = load ptr, ptr %61, align 8
  %1219 = getelementptr inbounds %struct.SetValue, ptr %1218, i32 0, i32 1
  %1220 = load ptr, ptr %1219, align 8
  %1221 = load i32, ptr %63, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = getelementptr inbounds ptr, ptr %1220, i64 %1222
  %1224 = load ptr, ptr %1223, align 8
  %1225 = load ptr, ptr %8, align 8
  %1226 = call ptr @subCalcLangValues(ptr noundef %1224, i32 noundef 1, ptr noundef %1225, i32 noundef 0)
  %1227 = load ptr, ptr %62, align 8
  %1228 = getelementptr inbounds %struct.SetValue, ptr %1227, i32 0, i32 1
  %1229 = load ptr, ptr %1228, align 8
  %1230 = load i32, ptr %63, align 4
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds ptr, ptr %1229, i64 %1231
  store ptr %1226, ptr %1232, align 8
  br label %1233

1233:                                             ; preds = %1217
  %1234 = load i32, ptr %63, align 4
  %1235 = add nsw i32 %1234, 1
  store i32 %1235, ptr %63, align 4
  br label %1211, !llvm.loop !41

1236:                                             ; preds = %1211
  %1237 = load ptr, ptr %10, align 8
  %1238 = getelementptr inbounds %struct.CalcLangVal, ptr %1237, i32 0, i32 0
  store i32 6, ptr %1238, align 8
  %1239 = load ptr, ptr %62, align 8
  %1240 = load ptr, ptr %10, align 8
  %1241 = getelementptr inbounds %struct.CalcLangVal, ptr %1240, i32 0, i32 1
  store ptr %1239, ptr %1241, align 8
  br label %1303

1242:                                             ; preds = %1188, %1183
  %1243 = load ptr, ptr %6, align 8
  %1244 = getelementptr inbounds %struct.CalcLangVal, ptr %1243, i32 0, i32 0
  %1245 = load i32, ptr %1244, align 8
  %1246 = icmp eq i32 %1245, 4
  br i1 %1246, label %1247, label %1301

1247:                                             ; preds = %1242
  %1248 = load ptr, ptr %8, align 8
  %1249 = getelementptr inbounds %struct.CalcLangVal, ptr %1248, i32 0, i32 0
  %1250 = load i32, ptr %1249, align 8
  %1251 = icmp eq i32 %1250, 6
  br i1 %1251, label %1252, label %1301

1252:                                             ; preds = %1247
  %1253 = load ptr, ptr %8, align 8
  %1254 = getelementptr inbounds %struct.CalcLangVal, ptr %1253, i32 0, i32 1
  %1255 = load ptr, ptr %1254, align 8
  store ptr %1255, ptr %64, align 8
  %1256 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1256, ptr %65, align 8
  %1257 = load ptr, ptr %64, align 8
  %1258 = getelementptr inbounds %struct.SetValue, ptr %1257, i32 0, i32 0
  %1259 = load i32, ptr %1258, align 8
  %1260 = load ptr, ptr %65, align 8
  %1261 = getelementptr inbounds %struct.SetValue, ptr %1260, i32 0, i32 0
  store i32 %1259, ptr %1261, align 8
  %1262 = load ptr, ptr %65, align 8
  %1263 = getelementptr inbounds %struct.SetValue, ptr %1262, i32 0, i32 0
  %1264 = load i32, ptr %1263, align 8
  %1265 = sext i32 %1264 to i64
  %1266 = mul i64 8, %1265
  %1267 = call noalias ptr @malloc(i64 noundef %1266) #4
  %1268 = load ptr, ptr %65, align 8
  %1269 = getelementptr inbounds %struct.SetValue, ptr %1268, i32 0, i32 1
  store ptr %1267, ptr %1269, align 8
  store i32 0, ptr %66, align 4
  br label %1270

1270:                                             ; preds = %1292, %1252
  %1271 = load i32, ptr %66, align 4
  %1272 = load ptr, ptr %64, align 8
  %1273 = getelementptr inbounds %struct.SetValue, ptr %1272, i32 0, i32 0
  %1274 = load i32, ptr %1273, align 8
  %1275 = icmp slt i32 %1271, %1274
  br i1 %1275, label %1276, label %1295

1276:                                             ; preds = %1270
  %1277 = load ptr, ptr %6, align 8
  %1278 = load ptr, ptr %64, align 8
  %1279 = getelementptr inbounds %struct.SetValue, ptr %1278, i32 0, i32 1
  %1280 = load ptr, ptr %1279, align 8
  %1281 = load i32, ptr %66, align 4
  %1282 = sext i32 %1281 to i64
  %1283 = getelementptr inbounds ptr, ptr %1280, i64 %1282
  %1284 = load ptr, ptr %1283, align 8
  %1285 = call ptr @subCalcLangValues(ptr noundef %1277, i32 noundef 0, ptr noundef %1284, i32 noundef 1)
  %1286 = load ptr, ptr %65, align 8
  %1287 = getelementptr inbounds %struct.SetValue, ptr %1286, i32 0, i32 1
  %1288 = load ptr, ptr %1287, align 8
  %1289 = load i32, ptr %66, align 4
  %1290 = sext i32 %1289 to i64
  %1291 = getelementptr inbounds ptr, ptr %1288, i64 %1290
  store ptr %1285, ptr %1291, align 8
  br label %1292

1292:                                             ; preds = %1276
  %1293 = load i32, ptr %66, align 4
  %1294 = add nsw i32 %1293, 1
  store i32 %1294, ptr %66, align 4
  br label %1270, !llvm.loop !42

1295:                                             ; preds = %1270
  %1296 = load ptr, ptr %10, align 8
  %1297 = getelementptr inbounds %struct.CalcLangVal, ptr %1296, i32 0, i32 0
  store i32 6, ptr %1297, align 8
  %1298 = load ptr, ptr %65, align 8
  %1299 = load ptr, ptr %10, align 8
  %1300 = getelementptr inbounds %struct.CalcLangVal, ptr %1299, i32 0, i32 1
  store ptr %1298, ptr %1300, align 8
  br label %1302

1301:                                             ; preds = %1247, %1242
  call void @perror(ptr noundef @.str.1) #5
  br label %1302

1302:                                             ; preds = %1301, %1295
  br label %1303

1303:                                             ; preds = %1302, %1236
  br label %1304

1304:                                             ; preds = %1303, %1177
  br label %1305

1305:                                             ; preds = %1304, %1118
  br label %1306

1306:                                             ; preds = %1305, %1059
  br label %1307

1307:                                             ; preds = %1306, %1000
  br label %1308

1308:                                             ; preds = %1307, %941
  br label %1309

1309:                                             ; preds = %1308, %882
  br label %1310

1310:                                             ; preds = %1309, %828
  br label %1311

1311:                                             ; preds = %1310, %745
  br label %1312

1312:                                             ; preds = %1311, %686
  br label %1313

1313:                                             ; preds = %1312, %627
  br label %1314

1314:                                             ; preds = %1313, %568
  br label %1315

1315:                                             ; preds = %1314, %509
  br label %1316

1316:                                             ; preds = %1315, %450
  br label %1317

1317:                                             ; preds = %1316, %391
  br label %1318

1318:                                             ; preds = %1317, %332
  br label %1319

1319:                                             ; preds = %1318, %278
  br label %1320

1320:                                             ; preds = %1319, %189
  br label %1321

1321:                                             ; preds = %1320, %167
  br label %1322

1322:                                             ; preds = %1321, %144
  br label %1323

1323:                                             ; preds = %1322, %121
  br label %1324

1324:                                             ; preds = %1323, %99
  br label %1325

1325:                                             ; preds = %1324, %77
  %1326 = load i32, ptr %7, align 4
  %1327 = icmp ne i32 %1326, 0
  br i1 %1327, label %1328, label %1330

1328:                                             ; preds = %1325
  %1329 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1329)
  br label %1336

1330:                                             ; preds = %1325
  %1331 = load i32, ptr %9, align 4
  %1332 = icmp ne i32 %1331, 0
  br i1 %1332, label %1333, label %1335

1333:                                             ; preds = %1330
  %1334 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1334)
  br label %1335

1335:                                             ; preds = %1333, %1330
  br label %1336

1336:                                             ; preds = %1335, %1328
  %1337 = load ptr, ptr %10, align 8
  store ptr %1337, ptr %5, align 8
  br label %1338

1338:                                             ; preds = %1336, %827, %277
  %1339 = load ptr, ptr %5, align 8
  ret ptr %1339
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
  %67 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %67, ptr %10, align 8
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.CalcLangVal, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %89

72:                                               ; preds = %4
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.CalcLangVal, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %89

77:                                               ; preds = %72
  %78 = load ptr, ptr %10, align 8
  %79 = getelementptr inbounds %struct.CalcLangVal, ptr %78, i32 0, i32 0
  store i32 0, ptr %79, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.CalcLangVal, ptr %80, i32 0, i32 1
  %82 = load i32, ptr %81, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds %struct.CalcLangVal, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 8
  %86 = mul nsw i32 %82, %85
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.CalcLangVal, ptr %87, i32 0, i32 1
  store i32 %86, ptr %88, align 8
  br label %1490

89:                                               ; preds = %72, %4
  %90 = load ptr, ptr %6, align 8
  %91 = getelementptr inbounds %struct.CalcLangVal, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %111

94:                                               ; preds = %89
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.CalcLangVal, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %111

99:                                               ; preds = %94
  %100 = load ptr, ptr %10, align 8
  %101 = getelementptr inbounds %struct.CalcLangVal, ptr %100, i32 0, i32 0
  store i32 1, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.CalcLangVal, ptr %102, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr inbounds %struct.CalcLangVal, ptr %105, i32 0, i32 1
  %107 = load double, ptr %106, align 8
  %108 = fmul double %104, %107
  %109 = load ptr, ptr %10, align 8
  %110 = getelementptr inbounds %struct.CalcLangVal, ptr %109, i32 0, i32 1
  store double %108, ptr %110, align 8
  br label %1489

111:                                              ; preds = %94, %89
  %112 = load ptr, ptr %6, align 8
  %113 = getelementptr inbounds %struct.CalcLangVal, ptr %112, i32 0, i32 0
  %114 = load i32, ptr %113, align 8
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %134

116:                                              ; preds = %111
  %117 = load ptr, ptr %8, align 8
  %118 = getelementptr inbounds %struct.CalcLangVal, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %121, label %134

121:                                              ; preds = %116
  %122 = load ptr, ptr %10, align 8
  %123 = getelementptr inbounds %struct.CalcLangVal, ptr %122, i32 0, i32 0
  store i32 1, ptr %123, align 8
  %124 = load ptr, ptr %6, align 8
  %125 = getelementptr inbounds %struct.CalcLangVal, ptr %124, i32 0, i32 1
  %126 = load i32, ptr %125, align 8
  %127 = sitofp i32 %126 to double
  %128 = load ptr, ptr %8, align 8
  %129 = getelementptr inbounds %struct.CalcLangVal, ptr %128, i32 0, i32 1
  %130 = load double, ptr %129, align 8
  %131 = fmul double %127, %130
  %132 = load ptr, ptr %10, align 8
  %133 = getelementptr inbounds %struct.CalcLangVal, ptr %132, i32 0, i32 1
  store double %131, ptr %133, align 8
  br label %1488

134:                                              ; preds = %116, %111
  %135 = load ptr, ptr %6, align 8
  %136 = getelementptr inbounds %struct.CalcLangVal, ptr %135, i32 0, i32 0
  %137 = load i32, ptr %136, align 8
  %138 = icmp eq i32 %137, 1
  br i1 %138, label %139, label %157

139:                                              ; preds = %134
  %140 = load ptr, ptr %8, align 8
  %141 = getelementptr inbounds %struct.CalcLangVal, ptr %140, i32 0, i32 0
  %142 = load i32, ptr %141, align 8
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %157

144:                                              ; preds = %139
  %145 = load ptr, ptr %10, align 8
  %146 = getelementptr inbounds %struct.CalcLangVal, ptr %145, i32 0, i32 0
  store i32 1, ptr %146, align 8
  %147 = load ptr, ptr %6, align 8
  %148 = getelementptr inbounds %struct.CalcLangVal, ptr %147, i32 0, i32 1
  %149 = load double, ptr %148, align 8
  %150 = load ptr, ptr %8, align 8
  %151 = getelementptr inbounds %struct.CalcLangVal, ptr %150, i32 0, i32 1
  %152 = load i32, ptr %151, align 8
  %153 = sitofp i32 %152 to double
  %154 = fmul double %149, %153
  %155 = load ptr, ptr %10, align 8
  %156 = getelementptr inbounds %struct.CalcLangVal, ptr %155, i32 0, i32 1
  store double %154, ptr %156, align 8
  br label %1487

157:                                              ; preds = %139, %134
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.CalcLangVal, ptr %158, i32 0, i32 0
  %160 = load i32, ptr %159, align 8
  %161 = icmp eq i32 %160, 3
  br i1 %161, label %162, label %180

162:                                              ; preds = %157
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds %struct.CalcLangVal, ptr %163, i32 0, i32 0
  %165 = load i32, ptr %164, align 8
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %180

167:                                              ; preds = %162
  %168 = load ptr, ptr %10, align 8
  %169 = getelementptr inbounds %struct.CalcLangVal, ptr %168, i32 0, i32 0
  store i32 3, ptr %169, align 8
  %170 = load ptr, ptr %6, align 8
  %171 = getelementptr inbounds %struct.CalcLangVal, ptr %170, i32 0, i32 1
  %172 = load double, ptr %171, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = getelementptr inbounds %struct.CalcLangVal, ptr %173, i32 0, i32 1
  %175 = load i32, ptr %174, align 8
  %176 = sitofp i32 %175 to double
  %177 = fmul double %172, %176
  %178 = load ptr, ptr %10, align 8
  %179 = getelementptr inbounds %struct.CalcLangVal, ptr %178, i32 0, i32 1
  store double %177, ptr %179, align 8
  br label %1486

180:                                              ; preds = %162, %157
  %181 = load ptr, ptr %6, align 8
  %182 = getelementptr inbounds %struct.CalcLangVal, ptr %181, i32 0, i32 0
  %183 = load i32, ptr %182, align 8
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %203

185:                                              ; preds = %180
  %186 = load ptr, ptr %8, align 8
  %187 = getelementptr inbounds %struct.CalcLangVal, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = icmp eq i32 %188, 3
  br i1 %189, label %190, label %203

190:                                              ; preds = %185
  %191 = load ptr, ptr %10, align 8
  %192 = getelementptr inbounds %struct.CalcLangVal, ptr %191, i32 0, i32 0
  store i32 3, ptr %192, align 8
  %193 = load ptr, ptr %6, align 8
  %194 = getelementptr inbounds %struct.CalcLangVal, ptr %193, i32 0, i32 1
  %195 = load i32, ptr %194, align 8
  %196 = sitofp i32 %195 to double
  %197 = load ptr, ptr %8, align 8
  %198 = getelementptr inbounds %struct.CalcLangVal, ptr %197, i32 0, i32 1
  %199 = load double, ptr %198, align 8
  %200 = fmul double %196, %199
  %201 = load ptr, ptr %10, align 8
  %202 = getelementptr inbounds %struct.CalcLangVal, ptr %201, i32 0, i32 1
  store double %200, ptr %202, align 8
  br label %1485

203:                                              ; preds = %185, %180
  %204 = load ptr, ptr %6, align 8
  %205 = getelementptr inbounds %struct.CalcLangVal, ptr %204, i32 0, i32 0
  %206 = load i32, ptr %205, align 8
  %207 = icmp eq i32 %206, 1
  br i1 %207, label %208, label %225

208:                                              ; preds = %203
  %209 = load ptr, ptr %8, align 8
  %210 = getelementptr inbounds %struct.CalcLangVal, ptr %209, i32 0, i32 0
  %211 = load i32, ptr %210, align 8
  %212 = icmp eq i32 %211, 3
  br i1 %212, label %213, label %225

213:                                              ; preds = %208
  %214 = load ptr, ptr %10, align 8
  %215 = getelementptr inbounds %struct.CalcLangVal, ptr %214, i32 0, i32 0
  store i32 3, ptr %215, align 8
  %216 = load ptr, ptr %6, align 8
  %217 = getelementptr inbounds %struct.CalcLangVal, ptr %216, i32 0, i32 1
  %218 = load double, ptr %217, align 8
  %219 = load ptr, ptr %8, align 8
  %220 = getelementptr inbounds %struct.CalcLangVal, ptr %219, i32 0, i32 1
  %221 = load double, ptr %220, align 8
  %222 = fmul double %218, %221
  %223 = load ptr, ptr %10, align 8
  %224 = getelementptr inbounds %struct.CalcLangVal, ptr %223, i32 0, i32 1
  store double %222, ptr %224, align 8
  br label %1484

225:                                              ; preds = %208, %203
  %226 = load ptr, ptr %6, align 8
  %227 = getelementptr inbounds %struct.CalcLangVal, ptr %226, i32 0, i32 0
  %228 = load i32, ptr %227, align 8
  %229 = icmp eq i32 %228, 3
  br i1 %229, label %230, label %247

230:                                              ; preds = %225
  %231 = load ptr, ptr %8, align 8
  %232 = getelementptr inbounds %struct.CalcLangVal, ptr %231, i32 0, i32 0
  %233 = load i32, ptr %232, align 8
  %234 = icmp eq i32 %233, 1
  br i1 %234, label %235, label %247

235:                                              ; preds = %230
  %236 = load ptr, ptr %10, align 8
  %237 = getelementptr inbounds %struct.CalcLangVal, ptr %236, i32 0, i32 0
  store i32 3, ptr %237, align 8
  %238 = load ptr, ptr %6, align 8
  %239 = getelementptr inbounds %struct.CalcLangVal, ptr %238, i32 0, i32 1
  %240 = load double, ptr %239, align 8
  %241 = load ptr, ptr %8, align 8
  %242 = getelementptr inbounds %struct.CalcLangVal, ptr %241, i32 0, i32 1
  %243 = load double, ptr %242, align 8
  %244 = fmul double %240, %243
  %245 = load ptr, ptr %10, align 8
  %246 = getelementptr inbounds %struct.CalcLangVal, ptr %245, i32 0, i32 1
  store double %244, ptr %246, align 8
  br label %1483

247:                                              ; preds = %230, %225
  %248 = load ptr, ptr %6, align 8
  %249 = getelementptr inbounds %struct.CalcLangVal, ptr %248, i32 0, i32 0
  %250 = load i32, ptr %249, align 8
  %251 = icmp eq i32 %250, 4
  br i1 %251, label %252, label %270

252:                                              ; preds = %247
  %253 = load ptr, ptr %8, align 8
  %254 = getelementptr inbounds %struct.CalcLangVal, ptr %253, i32 0, i32 0
  %255 = load i32, ptr %254, align 8
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %257, label %270

257:                                              ; preds = %252
  %258 = load ptr, ptr %10, align 8
  %259 = getelementptr inbounds %struct.CalcLangVal, ptr %258, i32 0, i32 0
  store i32 4, ptr %259, align 8
  %260 = load ptr, ptr %6, align 8
  %261 = getelementptr inbounds %struct.CalcLangVal, ptr %260, i32 0, i32 1
  %262 = load double, ptr %261, align 8
  %263 = load ptr, ptr %8, align 8
  %264 = getelementptr inbounds %struct.CalcLangVal, ptr %263, i32 0, i32 1
  %265 = load i32, ptr %264, align 8
  %266 = sitofp i32 %265 to double
  %267 = fmul double %262, %266
  %268 = load ptr, ptr %10, align 8
  %269 = getelementptr inbounds %struct.CalcLangVal, ptr %268, i32 0, i32 1
  store double %267, ptr %269, align 8
  br label %1482

270:                                              ; preds = %252, %247
  %271 = load ptr, ptr %6, align 8
  %272 = getelementptr inbounds %struct.CalcLangVal, ptr %271, i32 0, i32 0
  %273 = load i32, ptr %272, align 8
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %275, label %293

275:                                              ; preds = %270
  %276 = load ptr, ptr %8, align 8
  %277 = getelementptr inbounds %struct.CalcLangVal, ptr %276, i32 0, i32 0
  %278 = load i32, ptr %277, align 8
  %279 = icmp eq i32 %278, 4
  br i1 %279, label %280, label %293

280:                                              ; preds = %275
  %281 = load ptr, ptr %10, align 8
  %282 = getelementptr inbounds %struct.CalcLangVal, ptr %281, i32 0, i32 0
  store i32 4, ptr %282, align 8
  %283 = load ptr, ptr %6, align 8
  %284 = getelementptr inbounds %struct.CalcLangVal, ptr %283, i32 0, i32 1
  %285 = load i32, ptr %284, align 8
  %286 = sitofp i32 %285 to double
  %287 = load ptr, ptr %8, align 8
  %288 = getelementptr inbounds %struct.CalcLangVal, ptr %287, i32 0, i32 1
  %289 = load double, ptr %288, align 8
  %290 = fmul double %286, %289
  %291 = load ptr, ptr %10, align 8
  %292 = getelementptr inbounds %struct.CalcLangVal, ptr %291, i32 0, i32 1
  store double %290, ptr %292, align 8
  br label %1481

293:                                              ; preds = %275, %270
  %294 = load ptr, ptr %6, align 8
  %295 = getelementptr inbounds %struct.CalcLangVal, ptr %294, i32 0, i32 0
  %296 = load i32, ptr %295, align 8
  %297 = icmp eq i32 %296, 1
  br i1 %297, label %298, label %315

298:                                              ; preds = %293
  %299 = load ptr, ptr %8, align 8
  %300 = getelementptr inbounds %struct.CalcLangVal, ptr %299, i32 0, i32 0
  %301 = load i32, ptr %300, align 8
  %302 = icmp eq i32 %301, 4
  br i1 %302, label %303, label %315

303:                                              ; preds = %298
  %304 = load ptr, ptr %10, align 8
  %305 = getelementptr inbounds %struct.CalcLangVal, ptr %304, i32 0, i32 0
  store i32 4, ptr %305, align 8
  %306 = load ptr, ptr %6, align 8
  %307 = getelementptr inbounds %struct.CalcLangVal, ptr %306, i32 0, i32 1
  %308 = load double, ptr %307, align 8
  %309 = load ptr, ptr %8, align 8
  %310 = getelementptr inbounds %struct.CalcLangVal, ptr %309, i32 0, i32 1
  %311 = load double, ptr %310, align 8
  %312 = fmul double %308, %311
  %313 = load ptr, ptr %10, align 8
  %314 = getelementptr inbounds %struct.CalcLangVal, ptr %313, i32 0, i32 1
  store double %312, ptr %314, align 8
  br label %1480

315:                                              ; preds = %298, %293
  %316 = load ptr, ptr %6, align 8
  %317 = getelementptr inbounds %struct.CalcLangVal, ptr %316, i32 0, i32 0
  %318 = load i32, ptr %317, align 8
  %319 = icmp eq i32 %318, 4
  br i1 %319, label %320, label %337

320:                                              ; preds = %315
  %321 = load ptr, ptr %8, align 8
  %322 = getelementptr inbounds %struct.CalcLangVal, ptr %321, i32 0, i32 0
  %323 = load i32, ptr %322, align 8
  %324 = icmp eq i32 %323, 1
  br i1 %324, label %325, label %337

325:                                              ; preds = %320
  %326 = load ptr, ptr %10, align 8
  %327 = getelementptr inbounds %struct.CalcLangVal, ptr %326, i32 0, i32 0
  store i32 4, ptr %327, align 8
  %328 = load ptr, ptr %6, align 8
  %329 = getelementptr inbounds %struct.CalcLangVal, ptr %328, i32 0, i32 1
  %330 = load double, ptr %329, align 8
  %331 = load ptr, ptr %8, align 8
  %332 = getelementptr inbounds %struct.CalcLangVal, ptr %331, i32 0, i32 1
  %333 = load double, ptr %332, align 8
  %334 = fmul double %330, %333
  %335 = load ptr, ptr %10, align 8
  %336 = getelementptr inbounds %struct.CalcLangVal, ptr %335, i32 0, i32 1
  store double %334, ptr %336, align 8
  br label %1479

337:                                              ; preds = %320, %315
  %338 = load ptr, ptr %6, align 8
  %339 = getelementptr inbounds %struct.CalcLangVal, ptr %338, i32 0, i32 0
  %340 = load i32, ptr %339, align 8
  %341 = icmp eq i32 %340, 4
  br i1 %341, label %342, label %359

342:                                              ; preds = %337
  %343 = load ptr, ptr %8, align 8
  %344 = getelementptr inbounds %struct.CalcLangVal, ptr %343, i32 0, i32 0
  %345 = load i32, ptr %344, align 8
  %346 = icmp eq i32 %345, 4
  br i1 %346, label %347, label %359

347:                                              ; preds = %342
  %348 = load ptr, ptr %10, align 8
  %349 = getelementptr inbounds %struct.CalcLangVal, ptr %348, i32 0, i32 0
  store i32 4, ptr %349, align 8
  %350 = load ptr, ptr %6, align 8
  %351 = getelementptr inbounds %struct.CalcLangVal, ptr %350, i32 0, i32 1
  %352 = load double, ptr %351, align 8
  %353 = load ptr, ptr %8, align 8
  %354 = getelementptr inbounds %struct.CalcLangVal, ptr %353, i32 0, i32 1
  %355 = load double, ptr %354, align 8
  %356 = fmul double %352, %355
  %357 = load ptr, ptr %10, align 8
  %358 = getelementptr inbounds %struct.CalcLangVal, ptr %357, i32 0, i32 1
  store double %356, ptr %358, align 8
  br label %1478

359:                                              ; preds = %342, %337
  %360 = load ptr, ptr %6, align 8
  %361 = getelementptr inbounds %struct.CalcLangVal, ptr %360, i32 0, i32 0
  %362 = load i32, ptr %361, align 8
  %363 = icmp eq i32 %362, 7
  br i1 %363, label %364, label %437

364:                                              ; preds = %359
  %365 = load ptr, ptr %8, align 8
  %366 = getelementptr inbounds %struct.CalcLangVal, ptr %365, i32 0, i32 0
  %367 = load i32, ptr %366, align 8
  %368 = icmp eq i32 %367, 7
  br i1 %368, label %369, label %437

369:                                              ; preds = %364
  %370 = load ptr, ptr %6, align 8
  %371 = getelementptr inbounds %struct.CalcLangVal, ptr %370, i32 0, i32 1
  %372 = load ptr, ptr %371, align 8
  store ptr %372, ptr %11, align 8
  %373 = load ptr, ptr %8, align 8
  %374 = getelementptr inbounds %struct.CalcLangVal, ptr %373, i32 0, i32 1
  %375 = load ptr, ptr %374, align 8
  store ptr %375, ptr %12, align 8
  %376 = load ptr, ptr %12, align 8
  %377 = getelementptr inbounds %struct.TupleValue, ptr %376, i32 0, i32 0
  %378 = load i32, ptr %377, align 8
  %379 = load ptr, ptr %11, align 8
  %380 = getelementptr inbounds %struct.TupleValue, ptr %379, i32 0, i32 0
  %381 = load i32, ptr %380, align 8
  %382 = icmp eq i32 %378, %381
  br i1 %382, label %383, label %435

383:                                              ; preds = %369
  %384 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %384, ptr %13, align 8
  %385 = load ptr, ptr %11, align 8
  %386 = getelementptr inbounds %struct.TupleValue, ptr %385, i32 0, i32 0
  %387 = load i32, ptr %386, align 8
  %388 = load ptr, ptr %13, align 8
  %389 = getelementptr inbounds %struct.TupleValue, ptr %388, i32 0, i32 0
  store i32 %387, ptr %389, align 8
  %390 = load ptr, ptr %13, align 8
  %391 = getelementptr inbounds %struct.TupleValue, ptr %390, i32 0, i32 0
  %392 = load i32, ptr %391, align 8
  %393 = sext i32 %392 to i64
  %394 = mul i64 8, %393
  %395 = call noalias ptr @malloc(i64 noundef %394) #4
  %396 = load ptr, ptr %13, align 8
  %397 = getelementptr inbounds %struct.TupleValue, ptr %396, i32 0, i32 1
  store ptr %395, ptr %397, align 8
  store i32 0, ptr %14, align 4
  br label %398

398:                                              ; preds = %426, %383
  %399 = load i32, ptr %14, align 4
  %400 = load ptr, ptr %11, align 8
  %401 = getelementptr inbounds %struct.TupleValue, ptr %400, i32 0, i32 0
  %402 = load i32, ptr %401, align 8
  %403 = icmp slt i32 %399, %402
  br i1 %403, label %404, label %429

404:                                              ; preds = %398
  %405 = load ptr, ptr %11, align 8
  %406 = getelementptr inbounds %struct.TupleValue, ptr %405, i32 0, i32 1
  %407 = load ptr, ptr %406, align 8
  %408 = load i32, ptr %14, align 4
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds ptr, ptr %407, i64 %409
  %411 = load ptr, ptr %410, align 8
  %412 = load ptr, ptr %12, align 8
  %413 = getelementptr inbounds %struct.TupleValue, ptr %412, i32 0, i32 1
  %414 = load ptr, ptr %413, align 8
  %415 = load i32, ptr %14, align 4
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds ptr, ptr %414, i64 %416
  %418 = load ptr, ptr %417, align 8
  %419 = call ptr @multCalcLangValues(ptr noundef %411, i32 noundef 1, ptr noundef %418, i32 noundef 0)
  %420 = load ptr, ptr %13, align 8
  %421 = getelementptr inbounds %struct.TupleValue, ptr %420, i32 0, i32 1
  %422 = load ptr, ptr %421, align 8
  %423 = load i32, ptr %14, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds ptr, ptr %422, i64 %424
  store ptr %419, ptr %425, align 8
  br label %426

426:                                              ; preds = %404
  %427 = load i32, ptr %14, align 4
  %428 = add nsw i32 %427, 1
  store i32 %428, ptr %14, align 4
  br label %398, !llvm.loop !43

429:                                              ; preds = %398
  %430 = load ptr, ptr %10, align 8
  %431 = getelementptr inbounds %struct.CalcLangVal, ptr %430, i32 0, i32 0
  store i32 7, ptr %431, align 8
  %432 = load ptr, ptr %13, align 8
  %433 = load ptr, ptr %10, align 8
  %434 = getelementptr inbounds %struct.CalcLangVal, ptr %433, i32 0, i32 1
  store ptr %432, ptr %434, align 8
  br label %436

435:                                              ; preds = %369
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1503

436:                                              ; preds = %429
  br label %1477

437:                                              ; preds = %364, %359
  %438 = load ptr, ptr %6, align 8
  %439 = getelementptr inbounds %struct.CalcLangVal, ptr %438, i32 0, i32 0
  %440 = load i32, ptr %439, align 8
  %441 = icmp eq i32 %440, 7
  br i1 %441, label %442, label %496

442:                                              ; preds = %437
  %443 = load ptr, ptr %8, align 8
  %444 = getelementptr inbounds %struct.CalcLangVal, ptr %443, i32 0, i32 0
  %445 = load i32, ptr %444, align 8
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %447, label %496

447:                                              ; preds = %442
  %448 = load ptr, ptr %6, align 8
  %449 = getelementptr inbounds %struct.CalcLangVal, ptr %448, i32 0, i32 1
  %450 = load ptr, ptr %449, align 8
  store ptr %450, ptr %15, align 8
  %451 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %451, ptr %16, align 8
  %452 = load ptr, ptr %15, align 8
  %453 = getelementptr inbounds %struct.TupleValue, ptr %452, i32 0, i32 0
  %454 = load i32, ptr %453, align 8
  %455 = load ptr, ptr %16, align 8
  %456 = getelementptr inbounds %struct.TupleValue, ptr %455, i32 0, i32 0
  store i32 %454, ptr %456, align 8
  %457 = load ptr, ptr %16, align 8
  %458 = getelementptr inbounds %struct.TupleValue, ptr %457, i32 0, i32 0
  %459 = load i32, ptr %458, align 8
  %460 = sext i32 %459 to i64
  %461 = mul i64 8, %460
  %462 = call noalias ptr @malloc(i64 noundef %461) #4
  %463 = load ptr, ptr %16, align 8
  %464 = getelementptr inbounds %struct.TupleValue, ptr %463, i32 0, i32 1
  store ptr %462, ptr %464, align 8
  store i32 0, ptr %17, align 4
  br label %465

465:                                              ; preds = %487, %447
  %466 = load i32, ptr %17, align 4
  %467 = load ptr, ptr %15, align 8
  %468 = getelementptr inbounds %struct.TupleValue, ptr %467, i32 0, i32 0
  %469 = load i32, ptr %468, align 8
  %470 = icmp slt i32 %466, %469
  br i1 %470, label %471, label %490

471:                                              ; preds = %465
  %472 = load ptr, ptr %15, align 8
  %473 = getelementptr inbounds %struct.TupleValue, ptr %472, i32 0, i32 1
  %474 = load ptr, ptr %473, align 8
  %475 = load i32, ptr %17, align 4
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds ptr, ptr %474, i64 %476
  %478 = load ptr, ptr %477, align 8
  %479 = load ptr, ptr %8, align 8
  %480 = call ptr @multCalcLangValues(ptr noundef %478, i32 noundef 1, ptr noundef %479, i32 noundef 0)
  %481 = load ptr, ptr %16, align 8
  %482 = getelementptr inbounds %struct.TupleValue, ptr %481, i32 0, i32 1
  %483 = load ptr, ptr %482, align 8
  %484 = load i32, ptr %17, align 4
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds ptr, ptr %483, i64 %485
  store ptr %480, ptr %486, align 8
  br label %487

487:                                              ; preds = %471
  %488 = load i32, ptr %17, align 4
  %489 = add nsw i32 %488, 1
  store i32 %489, ptr %17, align 4
  br label %465, !llvm.loop !44

490:                                              ; preds = %465
  %491 = load ptr, ptr %10, align 8
  %492 = getelementptr inbounds %struct.CalcLangVal, ptr %491, i32 0, i32 0
  store i32 7, ptr %492, align 8
  %493 = load ptr, ptr %16, align 8
  %494 = load ptr, ptr %10, align 8
  %495 = getelementptr inbounds %struct.CalcLangVal, ptr %494, i32 0, i32 1
  store ptr %493, ptr %495, align 8
  br label %1476

496:                                              ; preds = %442, %437
  %497 = load ptr, ptr %6, align 8
  %498 = getelementptr inbounds %struct.CalcLangVal, ptr %497, i32 0, i32 0
  %499 = load i32, ptr %498, align 8
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %501, label %555

501:                                              ; preds = %496
  %502 = load ptr, ptr %8, align 8
  %503 = getelementptr inbounds %struct.CalcLangVal, ptr %502, i32 0, i32 0
  %504 = load i32, ptr %503, align 8
  %505 = icmp eq i32 %504, 7
  br i1 %505, label %506, label %555

506:                                              ; preds = %501
  %507 = load ptr, ptr %8, align 8
  %508 = getelementptr inbounds %struct.CalcLangVal, ptr %507, i32 0, i32 1
  %509 = load ptr, ptr %508, align 8
  store ptr %509, ptr %18, align 8
  %510 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %510, ptr %19, align 8
  %511 = load ptr, ptr %18, align 8
  %512 = getelementptr inbounds %struct.TupleValue, ptr %511, i32 0, i32 0
  %513 = load i32, ptr %512, align 8
  %514 = load ptr, ptr %19, align 8
  %515 = getelementptr inbounds %struct.TupleValue, ptr %514, i32 0, i32 0
  store i32 %513, ptr %515, align 8
  %516 = load ptr, ptr %19, align 8
  %517 = getelementptr inbounds %struct.TupleValue, ptr %516, i32 0, i32 0
  %518 = load i32, ptr %517, align 8
  %519 = sext i32 %518 to i64
  %520 = mul i64 8, %519
  %521 = call noalias ptr @malloc(i64 noundef %520) #4
  %522 = load ptr, ptr %19, align 8
  %523 = getelementptr inbounds %struct.TupleValue, ptr %522, i32 0, i32 1
  store ptr %521, ptr %523, align 8
  store i32 0, ptr %20, align 4
  br label %524

524:                                              ; preds = %546, %506
  %525 = load i32, ptr %20, align 4
  %526 = load ptr, ptr %18, align 8
  %527 = getelementptr inbounds %struct.TupleValue, ptr %526, i32 0, i32 0
  %528 = load i32, ptr %527, align 8
  %529 = icmp slt i32 %525, %528
  br i1 %529, label %530, label %549

530:                                              ; preds = %524
  %531 = load ptr, ptr %6, align 8
  %532 = load ptr, ptr %18, align 8
  %533 = getelementptr inbounds %struct.TupleValue, ptr %532, i32 0, i32 1
  %534 = load ptr, ptr %533, align 8
  %535 = load i32, ptr %20, align 4
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds ptr, ptr %534, i64 %536
  %538 = load ptr, ptr %537, align 8
  %539 = call ptr @multCalcLangValues(ptr noundef %531, i32 noundef 0, ptr noundef %538, i32 noundef 1)
  %540 = load ptr, ptr %19, align 8
  %541 = getelementptr inbounds %struct.TupleValue, ptr %540, i32 0, i32 1
  %542 = load ptr, ptr %541, align 8
  %543 = load i32, ptr %20, align 4
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds ptr, ptr %542, i64 %544
  store ptr %539, ptr %545, align 8
  br label %546

546:                                              ; preds = %530
  %547 = load i32, ptr %20, align 4
  %548 = add nsw i32 %547, 1
  store i32 %548, ptr %20, align 4
  br label %524, !llvm.loop !45

549:                                              ; preds = %524
  %550 = load ptr, ptr %10, align 8
  %551 = getelementptr inbounds %struct.CalcLangVal, ptr %550, i32 0, i32 0
  store i32 7, ptr %551, align 8
  %552 = load ptr, ptr %19, align 8
  %553 = load ptr, ptr %10, align 8
  %554 = getelementptr inbounds %struct.CalcLangVal, ptr %553, i32 0, i32 1
  store ptr %552, ptr %554, align 8
  br label %1475

555:                                              ; preds = %501, %496
  %556 = load ptr, ptr %6, align 8
  %557 = getelementptr inbounds %struct.CalcLangVal, ptr %556, i32 0, i32 0
  %558 = load i32, ptr %557, align 8
  %559 = icmp eq i32 %558, 7
  br i1 %559, label %560, label %614

560:                                              ; preds = %555
  %561 = load ptr, ptr %8, align 8
  %562 = getelementptr inbounds %struct.CalcLangVal, ptr %561, i32 0, i32 0
  %563 = load i32, ptr %562, align 8
  %564 = icmp eq i32 %563, 1
  br i1 %564, label %565, label %614

565:                                              ; preds = %560
  %566 = load ptr, ptr %6, align 8
  %567 = getelementptr inbounds %struct.CalcLangVal, ptr %566, i32 0, i32 1
  %568 = load ptr, ptr %567, align 8
  store ptr %568, ptr %21, align 8
  %569 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %569, ptr %22, align 8
  %570 = load ptr, ptr %21, align 8
  %571 = getelementptr inbounds %struct.TupleValue, ptr %570, i32 0, i32 0
  %572 = load i32, ptr %571, align 8
  %573 = load ptr, ptr %22, align 8
  %574 = getelementptr inbounds %struct.TupleValue, ptr %573, i32 0, i32 0
  store i32 %572, ptr %574, align 8
  %575 = load ptr, ptr %22, align 8
  %576 = getelementptr inbounds %struct.TupleValue, ptr %575, i32 0, i32 0
  %577 = load i32, ptr %576, align 8
  %578 = sext i32 %577 to i64
  %579 = mul i64 8, %578
  %580 = call noalias ptr @malloc(i64 noundef %579) #4
  %581 = load ptr, ptr %22, align 8
  %582 = getelementptr inbounds %struct.TupleValue, ptr %581, i32 0, i32 1
  store ptr %580, ptr %582, align 8
  store i32 0, ptr %23, align 4
  br label %583

583:                                              ; preds = %605, %565
  %584 = load i32, ptr %23, align 4
  %585 = load ptr, ptr %21, align 8
  %586 = getelementptr inbounds %struct.TupleValue, ptr %585, i32 0, i32 0
  %587 = load i32, ptr %586, align 8
  %588 = icmp slt i32 %584, %587
  br i1 %588, label %589, label %608

589:                                              ; preds = %583
  %590 = load ptr, ptr %21, align 8
  %591 = getelementptr inbounds %struct.TupleValue, ptr %590, i32 0, i32 1
  %592 = load ptr, ptr %591, align 8
  %593 = load i32, ptr %23, align 4
  %594 = sext i32 %593 to i64
  %595 = getelementptr inbounds ptr, ptr %592, i64 %594
  %596 = load ptr, ptr %595, align 8
  %597 = load ptr, ptr %8, align 8
  %598 = call ptr @multCalcLangValues(ptr noundef %596, i32 noundef 1, ptr noundef %597, i32 noundef 0)
  %599 = load ptr, ptr %22, align 8
  %600 = getelementptr inbounds %struct.TupleValue, ptr %599, i32 0, i32 1
  %601 = load ptr, ptr %600, align 8
  %602 = load i32, ptr %23, align 4
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds ptr, ptr %601, i64 %603
  store ptr %598, ptr %604, align 8
  br label %605

605:                                              ; preds = %589
  %606 = load i32, ptr %23, align 4
  %607 = add nsw i32 %606, 1
  store i32 %607, ptr %23, align 4
  br label %583, !llvm.loop !46

608:                                              ; preds = %583
  %609 = load ptr, ptr %10, align 8
  %610 = getelementptr inbounds %struct.CalcLangVal, ptr %609, i32 0, i32 0
  store i32 7, ptr %610, align 8
  %611 = load ptr, ptr %22, align 8
  %612 = load ptr, ptr %10, align 8
  %613 = getelementptr inbounds %struct.CalcLangVal, ptr %612, i32 0, i32 1
  store ptr %611, ptr %613, align 8
  br label %1474

614:                                              ; preds = %560, %555
  %615 = load ptr, ptr %6, align 8
  %616 = getelementptr inbounds %struct.CalcLangVal, ptr %615, i32 0, i32 0
  %617 = load i32, ptr %616, align 8
  %618 = icmp eq i32 %617, 1
  br i1 %618, label %619, label %673

619:                                              ; preds = %614
  %620 = load ptr, ptr %8, align 8
  %621 = getelementptr inbounds %struct.CalcLangVal, ptr %620, i32 0, i32 0
  %622 = load i32, ptr %621, align 8
  %623 = icmp eq i32 %622, 7
  br i1 %623, label %624, label %673

624:                                              ; preds = %619
  %625 = load ptr, ptr %8, align 8
  %626 = getelementptr inbounds %struct.CalcLangVal, ptr %625, i32 0, i32 1
  %627 = load ptr, ptr %626, align 8
  store ptr %627, ptr %24, align 8
  %628 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %628, ptr %25, align 8
  %629 = load ptr, ptr %24, align 8
  %630 = getelementptr inbounds %struct.TupleValue, ptr %629, i32 0, i32 0
  %631 = load i32, ptr %630, align 8
  %632 = load ptr, ptr %25, align 8
  %633 = getelementptr inbounds %struct.TupleValue, ptr %632, i32 0, i32 0
  store i32 %631, ptr %633, align 8
  %634 = load ptr, ptr %25, align 8
  %635 = getelementptr inbounds %struct.TupleValue, ptr %634, i32 0, i32 0
  %636 = load i32, ptr %635, align 8
  %637 = sext i32 %636 to i64
  %638 = mul i64 8, %637
  %639 = call noalias ptr @malloc(i64 noundef %638) #4
  %640 = load ptr, ptr %25, align 8
  %641 = getelementptr inbounds %struct.TupleValue, ptr %640, i32 0, i32 1
  store ptr %639, ptr %641, align 8
  store i32 0, ptr %26, align 4
  br label %642

642:                                              ; preds = %664, %624
  %643 = load i32, ptr %26, align 4
  %644 = load ptr, ptr %24, align 8
  %645 = getelementptr inbounds %struct.TupleValue, ptr %644, i32 0, i32 0
  %646 = load i32, ptr %645, align 8
  %647 = icmp slt i32 %643, %646
  br i1 %647, label %648, label %667

648:                                              ; preds = %642
  %649 = load ptr, ptr %6, align 8
  %650 = load ptr, ptr %24, align 8
  %651 = getelementptr inbounds %struct.TupleValue, ptr %650, i32 0, i32 1
  %652 = load ptr, ptr %651, align 8
  %653 = load i32, ptr %26, align 4
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds ptr, ptr %652, i64 %654
  %656 = load ptr, ptr %655, align 8
  %657 = call ptr @multCalcLangValues(ptr noundef %649, i32 noundef 0, ptr noundef %656, i32 noundef 1)
  %658 = load ptr, ptr %25, align 8
  %659 = getelementptr inbounds %struct.TupleValue, ptr %658, i32 0, i32 1
  %660 = load ptr, ptr %659, align 8
  %661 = load i32, ptr %26, align 4
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds ptr, ptr %660, i64 %662
  store ptr %657, ptr %663, align 8
  br label %664

664:                                              ; preds = %648
  %665 = load i32, ptr %26, align 4
  %666 = add nsw i32 %665, 1
  store i32 %666, ptr %26, align 4
  br label %642, !llvm.loop !47

667:                                              ; preds = %642
  %668 = load ptr, ptr %10, align 8
  %669 = getelementptr inbounds %struct.CalcLangVal, ptr %668, i32 0, i32 0
  store i32 7, ptr %669, align 8
  %670 = load ptr, ptr %25, align 8
  %671 = load ptr, ptr %10, align 8
  %672 = getelementptr inbounds %struct.CalcLangVal, ptr %671, i32 0, i32 1
  store ptr %670, ptr %672, align 8
  br label %1473

673:                                              ; preds = %619, %614
  %674 = load ptr, ptr %6, align 8
  %675 = getelementptr inbounds %struct.CalcLangVal, ptr %674, i32 0, i32 0
  %676 = load i32, ptr %675, align 8
  %677 = icmp eq i32 %676, 7
  br i1 %677, label %678, label %732

678:                                              ; preds = %673
  %679 = load ptr, ptr %8, align 8
  %680 = getelementptr inbounds %struct.CalcLangVal, ptr %679, i32 0, i32 0
  %681 = load i32, ptr %680, align 8
  %682 = icmp eq i32 %681, 3
  br i1 %682, label %683, label %732

683:                                              ; preds = %678
  %684 = load ptr, ptr %6, align 8
  %685 = getelementptr inbounds %struct.CalcLangVal, ptr %684, i32 0, i32 1
  %686 = load ptr, ptr %685, align 8
  store ptr %686, ptr %27, align 8
  %687 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %687, ptr %28, align 8
  %688 = load ptr, ptr %27, align 8
  %689 = getelementptr inbounds %struct.TupleValue, ptr %688, i32 0, i32 0
  %690 = load i32, ptr %689, align 8
  %691 = load ptr, ptr %28, align 8
  %692 = getelementptr inbounds %struct.TupleValue, ptr %691, i32 0, i32 0
  store i32 %690, ptr %692, align 8
  %693 = load ptr, ptr %28, align 8
  %694 = getelementptr inbounds %struct.TupleValue, ptr %693, i32 0, i32 0
  %695 = load i32, ptr %694, align 8
  %696 = sext i32 %695 to i64
  %697 = mul i64 8, %696
  %698 = call noalias ptr @malloc(i64 noundef %697) #4
  %699 = load ptr, ptr %28, align 8
  %700 = getelementptr inbounds %struct.TupleValue, ptr %699, i32 0, i32 1
  store ptr %698, ptr %700, align 8
  store i32 0, ptr %29, align 4
  br label %701

701:                                              ; preds = %723, %683
  %702 = load i32, ptr %29, align 4
  %703 = load ptr, ptr %27, align 8
  %704 = getelementptr inbounds %struct.TupleValue, ptr %703, i32 0, i32 0
  %705 = load i32, ptr %704, align 8
  %706 = icmp slt i32 %702, %705
  br i1 %706, label %707, label %726

707:                                              ; preds = %701
  %708 = load ptr, ptr %27, align 8
  %709 = getelementptr inbounds %struct.TupleValue, ptr %708, i32 0, i32 1
  %710 = load ptr, ptr %709, align 8
  %711 = load i32, ptr %29, align 4
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds ptr, ptr %710, i64 %712
  %714 = load ptr, ptr %713, align 8
  %715 = load ptr, ptr %8, align 8
  %716 = call ptr @multCalcLangValues(ptr noundef %714, i32 noundef 1, ptr noundef %715, i32 noundef 0)
  %717 = load ptr, ptr %28, align 8
  %718 = getelementptr inbounds %struct.TupleValue, ptr %717, i32 0, i32 1
  %719 = load ptr, ptr %718, align 8
  %720 = load i32, ptr %29, align 4
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds ptr, ptr %719, i64 %721
  store ptr %716, ptr %722, align 8
  br label %723

723:                                              ; preds = %707
  %724 = load i32, ptr %29, align 4
  %725 = add nsw i32 %724, 1
  store i32 %725, ptr %29, align 4
  br label %701, !llvm.loop !48

726:                                              ; preds = %701
  %727 = load ptr, ptr %10, align 8
  %728 = getelementptr inbounds %struct.CalcLangVal, ptr %727, i32 0, i32 0
  store i32 7, ptr %728, align 8
  %729 = load ptr, ptr %28, align 8
  %730 = load ptr, ptr %10, align 8
  %731 = getelementptr inbounds %struct.CalcLangVal, ptr %730, i32 0, i32 1
  store ptr %729, ptr %731, align 8
  br label %1472

732:                                              ; preds = %678, %673
  %733 = load ptr, ptr %6, align 8
  %734 = getelementptr inbounds %struct.CalcLangVal, ptr %733, i32 0, i32 0
  %735 = load i32, ptr %734, align 8
  %736 = icmp eq i32 %735, 3
  br i1 %736, label %737, label %791

737:                                              ; preds = %732
  %738 = load ptr, ptr %8, align 8
  %739 = getelementptr inbounds %struct.CalcLangVal, ptr %738, i32 0, i32 0
  %740 = load i32, ptr %739, align 8
  %741 = icmp eq i32 %740, 7
  br i1 %741, label %742, label %791

742:                                              ; preds = %737
  %743 = load ptr, ptr %8, align 8
  %744 = getelementptr inbounds %struct.CalcLangVal, ptr %743, i32 0, i32 1
  %745 = load ptr, ptr %744, align 8
  store ptr %745, ptr %30, align 8
  %746 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %746, ptr %31, align 8
  %747 = load ptr, ptr %30, align 8
  %748 = getelementptr inbounds %struct.TupleValue, ptr %747, i32 0, i32 0
  %749 = load i32, ptr %748, align 8
  %750 = load ptr, ptr %31, align 8
  %751 = getelementptr inbounds %struct.TupleValue, ptr %750, i32 0, i32 0
  store i32 %749, ptr %751, align 8
  %752 = load ptr, ptr %31, align 8
  %753 = getelementptr inbounds %struct.TupleValue, ptr %752, i32 0, i32 0
  %754 = load i32, ptr %753, align 8
  %755 = sext i32 %754 to i64
  %756 = mul i64 8, %755
  %757 = call noalias ptr @malloc(i64 noundef %756) #4
  %758 = load ptr, ptr %31, align 8
  %759 = getelementptr inbounds %struct.TupleValue, ptr %758, i32 0, i32 1
  store ptr %757, ptr %759, align 8
  store i32 0, ptr %32, align 4
  br label %760

760:                                              ; preds = %782, %742
  %761 = load i32, ptr %32, align 4
  %762 = load ptr, ptr %30, align 8
  %763 = getelementptr inbounds %struct.TupleValue, ptr %762, i32 0, i32 0
  %764 = load i32, ptr %763, align 8
  %765 = icmp slt i32 %761, %764
  br i1 %765, label %766, label %785

766:                                              ; preds = %760
  %767 = load ptr, ptr %6, align 8
  %768 = load ptr, ptr %30, align 8
  %769 = getelementptr inbounds %struct.TupleValue, ptr %768, i32 0, i32 1
  %770 = load ptr, ptr %769, align 8
  %771 = load i32, ptr %32, align 4
  %772 = sext i32 %771 to i64
  %773 = getelementptr inbounds ptr, ptr %770, i64 %772
  %774 = load ptr, ptr %773, align 8
  %775 = call ptr @multCalcLangValues(ptr noundef %767, i32 noundef 0, ptr noundef %774, i32 noundef 1)
  %776 = load ptr, ptr %31, align 8
  %777 = getelementptr inbounds %struct.TupleValue, ptr %776, i32 0, i32 1
  %778 = load ptr, ptr %777, align 8
  %779 = load i32, ptr %32, align 4
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds ptr, ptr %778, i64 %780
  store ptr %775, ptr %781, align 8
  br label %782

782:                                              ; preds = %766
  %783 = load i32, ptr %32, align 4
  %784 = add nsw i32 %783, 1
  store i32 %784, ptr %32, align 4
  br label %760, !llvm.loop !49

785:                                              ; preds = %760
  %786 = load ptr, ptr %10, align 8
  %787 = getelementptr inbounds %struct.CalcLangVal, ptr %786, i32 0, i32 0
  store i32 7, ptr %787, align 8
  %788 = load ptr, ptr %31, align 8
  %789 = load ptr, ptr %10, align 8
  %790 = getelementptr inbounds %struct.CalcLangVal, ptr %789, i32 0, i32 1
  store ptr %788, ptr %790, align 8
  br label %1471

791:                                              ; preds = %737, %732
  %792 = load ptr, ptr %6, align 8
  %793 = getelementptr inbounds %struct.CalcLangVal, ptr %792, i32 0, i32 0
  %794 = load i32, ptr %793, align 8
  %795 = icmp eq i32 %794, 7
  br i1 %795, label %796, label %850

796:                                              ; preds = %791
  %797 = load ptr, ptr %8, align 8
  %798 = getelementptr inbounds %struct.CalcLangVal, ptr %797, i32 0, i32 0
  %799 = load i32, ptr %798, align 8
  %800 = icmp eq i32 %799, 4
  br i1 %800, label %801, label %850

801:                                              ; preds = %796
  %802 = load ptr, ptr %6, align 8
  %803 = getelementptr inbounds %struct.CalcLangVal, ptr %802, i32 0, i32 1
  %804 = load ptr, ptr %803, align 8
  store ptr %804, ptr %33, align 8
  %805 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %805, ptr %34, align 8
  %806 = load ptr, ptr %33, align 8
  %807 = getelementptr inbounds %struct.TupleValue, ptr %806, i32 0, i32 0
  %808 = load i32, ptr %807, align 8
  %809 = load ptr, ptr %34, align 8
  %810 = getelementptr inbounds %struct.TupleValue, ptr %809, i32 0, i32 0
  store i32 %808, ptr %810, align 8
  %811 = load ptr, ptr %34, align 8
  %812 = getelementptr inbounds %struct.TupleValue, ptr %811, i32 0, i32 0
  %813 = load i32, ptr %812, align 8
  %814 = sext i32 %813 to i64
  %815 = mul i64 8, %814
  %816 = call noalias ptr @malloc(i64 noundef %815) #4
  %817 = load ptr, ptr %34, align 8
  %818 = getelementptr inbounds %struct.TupleValue, ptr %817, i32 0, i32 1
  store ptr %816, ptr %818, align 8
  store i32 0, ptr %35, align 4
  br label %819

819:                                              ; preds = %841, %801
  %820 = load i32, ptr %35, align 4
  %821 = load ptr, ptr %33, align 8
  %822 = getelementptr inbounds %struct.TupleValue, ptr %821, i32 0, i32 0
  %823 = load i32, ptr %822, align 8
  %824 = icmp slt i32 %820, %823
  br i1 %824, label %825, label %844

825:                                              ; preds = %819
  %826 = load ptr, ptr %33, align 8
  %827 = getelementptr inbounds %struct.TupleValue, ptr %826, i32 0, i32 1
  %828 = load ptr, ptr %827, align 8
  %829 = load i32, ptr %35, align 4
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds ptr, ptr %828, i64 %830
  %832 = load ptr, ptr %831, align 8
  %833 = load ptr, ptr %8, align 8
  %834 = call ptr @multCalcLangValues(ptr noundef %832, i32 noundef 1, ptr noundef %833, i32 noundef 0)
  %835 = load ptr, ptr %34, align 8
  %836 = getelementptr inbounds %struct.TupleValue, ptr %835, i32 0, i32 1
  %837 = load ptr, ptr %836, align 8
  %838 = load i32, ptr %35, align 4
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds ptr, ptr %837, i64 %839
  store ptr %834, ptr %840, align 8
  br label %841

841:                                              ; preds = %825
  %842 = load i32, ptr %35, align 4
  %843 = add nsw i32 %842, 1
  store i32 %843, ptr %35, align 4
  br label %819, !llvm.loop !50

844:                                              ; preds = %819
  %845 = load ptr, ptr %10, align 8
  %846 = getelementptr inbounds %struct.CalcLangVal, ptr %845, i32 0, i32 0
  store i32 7, ptr %846, align 8
  %847 = load ptr, ptr %34, align 8
  %848 = load ptr, ptr %10, align 8
  %849 = getelementptr inbounds %struct.CalcLangVal, ptr %848, i32 0, i32 1
  store ptr %847, ptr %849, align 8
  br label %1470

850:                                              ; preds = %796, %791
  %851 = load ptr, ptr %6, align 8
  %852 = getelementptr inbounds %struct.CalcLangVal, ptr %851, i32 0, i32 0
  %853 = load i32, ptr %852, align 8
  %854 = icmp eq i32 %853, 4
  br i1 %854, label %855, label %909

855:                                              ; preds = %850
  %856 = load ptr, ptr %8, align 8
  %857 = getelementptr inbounds %struct.CalcLangVal, ptr %856, i32 0, i32 0
  %858 = load i32, ptr %857, align 8
  %859 = icmp eq i32 %858, 7
  br i1 %859, label %860, label %909

860:                                              ; preds = %855
  %861 = load ptr, ptr %8, align 8
  %862 = getelementptr inbounds %struct.CalcLangVal, ptr %861, i32 0, i32 1
  %863 = load ptr, ptr %862, align 8
  store ptr %863, ptr %36, align 8
  %864 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %864, ptr %37, align 8
  %865 = load ptr, ptr %36, align 8
  %866 = getelementptr inbounds %struct.TupleValue, ptr %865, i32 0, i32 0
  %867 = load i32, ptr %866, align 8
  %868 = load ptr, ptr %37, align 8
  %869 = getelementptr inbounds %struct.TupleValue, ptr %868, i32 0, i32 0
  store i32 %867, ptr %869, align 8
  %870 = load ptr, ptr %37, align 8
  %871 = getelementptr inbounds %struct.TupleValue, ptr %870, i32 0, i32 0
  %872 = load i32, ptr %871, align 8
  %873 = sext i32 %872 to i64
  %874 = mul i64 8, %873
  %875 = call noalias ptr @malloc(i64 noundef %874) #4
  %876 = load ptr, ptr %37, align 8
  %877 = getelementptr inbounds %struct.TupleValue, ptr %876, i32 0, i32 1
  store ptr %875, ptr %877, align 8
  store i32 0, ptr %38, align 4
  br label %878

878:                                              ; preds = %900, %860
  %879 = load i32, ptr %38, align 4
  %880 = load ptr, ptr %36, align 8
  %881 = getelementptr inbounds %struct.TupleValue, ptr %880, i32 0, i32 0
  %882 = load i32, ptr %881, align 8
  %883 = icmp slt i32 %879, %882
  br i1 %883, label %884, label %903

884:                                              ; preds = %878
  %885 = load ptr, ptr %6, align 8
  %886 = load ptr, ptr %36, align 8
  %887 = getelementptr inbounds %struct.TupleValue, ptr %886, i32 0, i32 1
  %888 = load ptr, ptr %887, align 8
  %889 = load i32, ptr %38, align 4
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds ptr, ptr %888, i64 %890
  %892 = load ptr, ptr %891, align 8
  %893 = call ptr @multCalcLangValues(ptr noundef %885, i32 noundef 0, ptr noundef %892, i32 noundef 1)
  %894 = load ptr, ptr %37, align 8
  %895 = getelementptr inbounds %struct.TupleValue, ptr %894, i32 0, i32 1
  %896 = load ptr, ptr %895, align 8
  %897 = load i32, ptr %38, align 4
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds ptr, ptr %896, i64 %898
  store ptr %893, ptr %899, align 8
  br label %900

900:                                              ; preds = %884
  %901 = load i32, ptr %38, align 4
  %902 = add nsw i32 %901, 1
  store i32 %902, ptr %38, align 4
  br label %878, !llvm.loop !51

903:                                              ; preds = %878
  %904 = load ptr, ptr %10, align 8
  %905 = getelementptr inbounds %struct.CalcLangVal, ptr %904, i32 0, i32 0
  store i32 7, ptr %905, align 8
  %906 = load ptr, ptr %37, align 8
  %907 = load ptr, ptr %10, align 8
  %908 = getelementptr inbounds %struct.CalcLangVal, ptr %907, i32 0, i32 1
  store ptr %906, ptr %908, align 8
  br label %1469

909:                                              ; preds = %855, %850
  %910 = load ptr, ptr %6, align 8
  %911 = getelementptr inbounds %struct.CalcLangVal, ptr %910, i32 0, i32 0
  %912 = load i32, ptr %911, align 8
  %913 = icmp eq i32 %912, 6
  br i1 %913, label %914, label %987

914:                                              ; preds = %909
  %915 = load ptr, ptr %8, align 8
  %916 = getelementptr inbounds %struct.CalcLangVal, ptr %915, i32 0, i32 0
  %917 = load i32, ptr %916, align 8
  %918 = icmp eq i32 %917, 6
  br i1 %918, label %919, label %987

919:                                              ; preds = %914
  %920 = load ptr, ptr %6, align 8
  %921 = getelementptr inbounds %struct.CalcLangVal, ptr %920, i32 0, i32 1
  %922 = load ptr, ptr %921, align 8
  store ptr %922, ptr %39, align 8
  %923 = load ptr, ptr %8, align 8
  %924 = getelementptr inbounds %struct.CalcLangVal, ptr %923, i32 0, i32 1
  %925 = load ptr, ptr %924, align 8
  store ptr %925, ptr %40, align 8
  %926 = load ptr, ptr %40, align 8
  %927 = getelementptr inbounds %struct.SetValue, ptr %926, i32 0, i32 0
  %928 = load i32, ptr %927, align 8
  %929 = load ptr, ptr %39, align 8
  %930 = getelementptr inbounds %struct.SetValue, ptr %929, i32 0, i32 0
  %931 = load i32, ptr %930, align 8
  %932 = icmp eq i32 %928, %931
  br i1 %932, label %933, label %985

933:                                              ; preds = %919
  %934 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %934, ptr %41, align 8
  %935 = load ptr, ptr %39, align 8
  %936 = getelementptr inbounds %struct.SetValue, ptr %935, i32 0, i32 0
  %937 = load i32, ptr %936, align 8
  %938 = load ptr, ptr %41, align 8
  %939 = getelementptr inbounds %struct.SetValue, ptr %938, i32 0, i32 0
  store i32 %937, ptr %939, align 8
  %940 = load ptr, ptr %41, align 8
  %941 = getelementptr inbounds %struct.SetValue, ptr %940, i32 0, i32 0
  %942 = load i32, ptr %941, align 8
  %943 = sext i32 %942 to i64
  %944 = mul i64 8, %943
  %945 = call noalias ptr @malloc(i64 noundef %944) #4
  %946 = load ptr, ptr %41, align 8
  %947 = getelementptr inbounds %struct.SetValue, ptr %946, i32 0, i32 1
  store ptr %945, ptr %947, align 8
  store i32 0, ptr %42, align 4
  br label %948

948:                                              ; preds = %976, %933
  %949 = load i32, ptr %42, align 4
  %950 = load ptr, ptr %39, align 8
  %951 = getelementptr inbounds %struct.SetValue, ptr %950, i32 0, i32 0
  %952 = load i32, ptr %951, align 8
  %953 = icmp slt i32 %949, %952
  br i1 %953, label %954, label %979

954:                                              ; preds = %948
  %955 = load ptr, ptr %39, align 8
  %956 = getelementptr inbounds %struct.SetValue, ptr %955, i32 0, i32 1
  %957 = load ptr, ptr %956, align 8
  %958 = load i32, ptr %42, align 4
  %959 = sext i32 %958 to i64
  %960 = getelementptr inbounds ptr, ptr %957, i64 %959
  %961 = load ptr, ptr %960, align 8
  %962 = load ptr, ptr %40, align 8
  %963 = getelementptr inbounds %struct.SetValue, ptr %962, i32 0, i32 1
  %964 = load ptr, ptr %963, align 8
  %965 = load i32, ptr %42, align 4
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds ptr, ptr %964, i64 %966
  %968 = load ptr, ptr %967, align 8
  %969 = call ptr @multCalcLangValues(ptr noundef %961, i32 noundef 1, ptr noundef %968, i32 noundef 1)
  %970 = load ptr, ptr %41, align 8
  %971 = getelementptr inbounds %struct.SetValue, ptr %970, i32 0, i32 1
  %972 = load ptr, ptr %971, align 8
  %973 = load i32, ptr %42, align 4
  %974 = sext i32 %973 to i64
  %975 = getelementptr inbounds ptr, ptr %972, i64 %974
  store ptr %969, ptr %975, align 8
  br label %976

976:                                              ; preds = %954
  %977 = load i32, ptr %42, align 4
  %978 = add nsw i32 %977, 1
  store i32 %978, ptr %42, align 4
  br label %948, !llvm.loop !52

979:                                              ; preds = %948
  %980 = load ptr, ptr %10, align 8
  %981 = getelementptr inbounds %struct.CalcLangVal, ptr %980, i32 0, i32 0
  store i32 6, ptr %981, align 8
  %982 = load ptr, ptr %41, align 8
  %983 = load ptr, ptr %10, align 8
  %984 = getelementptr inbounds %struct.CalcLangVal, ptr %983, i32 0, i32 1
  store ptr %982, ptr %984, align 8
  br label %986

985:                                              ; preds = %919
  call void @perror(ptr noundef @.str) #5
  store ptr null, ptr %5, align 8
  br label %1503

986:                                              ; preds = %979
  br label %1468

987:                                              ; preds = %914, %909
  %988 = load ptr, ptr %6, align 8
  %989 = getelementptr inbounds %struct.CalcLangVal, ptr %988, i32 0, i32 0
  %990 = load i32, ptr %989, align 8
  %991 = icmp eq i32 %990, 6
  br i1 %991, label %992, label %1046

992:                                              ; preds = %987
  %993 = load ptr, ptr %8, align 8
  %994 = getelementptr inbounds %struct.CalcLangVal, ptr %993, i32 0, i32 0
  %995 = load i32, ptr %994, align 8
  %996 = icmp eq i32 %995, 0
  br i1 %996, label %997, label %1046

997:                                              ; preds = %992
  %998 = load ptr, ptr %6, align 8
  %999 = getelementptr inbounds %struct.CalcLangVal, ptr %998, i32 0, i32 1
  %1000 = load ptr, ptr %999, align 8
  store ptr %1000, ptr %43, align 8
  %1001 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1001, ptr %44, align 8
  %1002 = load ptr, ptr %43, align 8
  %1003 = getelementptr inbounds %struct.SetValue, ptr %1002, i32 0, i32 0
  %1004 = load i32, ptr %1003, align 8
  %1005 = load ptr, ptr %44, align 8
  %1006 = getelementptr inbounds %struct.SetValue, ptr %1005, i32 0, i32 0
  store i32 %1004, ptr %1006, align 8
  %1007 = load ptr, ptr %44, align 8
  %1008 = getelementptr inbounds %struct.SetValue, ptr %1007, i32 0, i32 0
  %1009 = load i32, ptr %1008, align 8
  %1010 = sext i32 %1009 to i64
  %1011 = mul i64 8, %1010
  %1012 = call noalias ptr @malloc(i64 noundef %1011) #4
  %1013 = load ptr, ptr %44, align 8
  %1014 = getelementptr inbounds %struct.SetValue, ptr %1013, i32 0, i32 1
  store ptr %1012, ptr %1014, align 8
  store i32 0, ptr %45, align 4
  br label %1015

1015:                                             ; preds = %1037, %997
  %1016 = load i32, ptr %45, align 4
  %1017 = load ptr, ptr %43, align 8
  %1018 = getelementptr inbounds %struct.SetValue, ptr %1017, i32 0, i32 0
  %1019 = load i32, ptr %1018, align 8
  %1020 = icmp slt i32 %1016, %1019
  br i1 %1020, label %1021, label %1040

1021:                                             ; preds = %1015
  %1022 = load ptr, ptr %43, align 8
  %1023 = getelementptr inbounds %struct.SetValue, ptr %1022, i32 0, i32 1
  %1024 = load ptr, ptr %1023, align 8
  %1025 = load i32, ptr %45, align 4
  %1026 = sext i32 %1025 to i64
  %1027 = getelementptr inbounds ptr, ptr %1024, i64 %1026
  %1028 = load ptr, ptr %1027, align 8
  %1029 = load ptr, ptr %8, align 8
  %1030 = call ptr @multCalcLangValues(ptr noundef %1028, i32 noundef 1, ptr noundef %1029, i32 noundef 0)
  %1031 = load ptr, ptr %44, align 8
  %1032 = getelementptr inbounds %struct.SetValue, ptr %1031, i32 0, i32 1
  %1033 = load ptr, ptr %1032, align 8
  %1034 = load i32, ptr %45, align 4
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds ptr, ptr %1033, i64 %1035
  store ptr %1030, ptr %1036, align 8
  br label %1037

1037:                                             ; preds = %1021
  %1038 = load i32, ptr %45, align 4
  %1039 = add nsw i32 %1038, 1
  store i32 %1039, ptr %45, align 4
  br label %1015, !llvm.loop !53

1040:                                             ; preds = %1015
  %1041 = load ptr, ptr %10, align 8
  %1042 = getelementptr inbounds %struct.CalcLangVal, ptr %1041, i32 0, i32 0
  store i32 6, ptr %1042, align 8
  %1043 = load ptr, ptr %44, align 8
  %1044 = load ptr, ptr %10, align 8
  %1045 = getelementptr inbounds %struct.CalcLangVal, ptr %1044, i32 0, i32 1
  store ptr %1043, ptr %1045, align 8
  br label %1467

1046:                                             ; preds = %992, %987
  %1047 = load ptr, ptr %6, align 8
  %1048 = getelementptr inbounds %struct.CalcLangVal, ptr %1047, i32 0, i32 0
  %1049 = load i32, ptr %1048, align 8
  %1050 = icmp eq i32 %1049, 0
  br i1 %1050, label %1051, label %1105

1051:                                             ; preds = %1046
  %1052 = load ptr, ptr %8, align 8
  %1053 = getelementptr inbounds %struct.CalcLangVal, ptr %1052, i32 0, i32 0
  %1054 = load i32, ptr %1053, align 8
  %1055 = icmp eq i32 %1054, 6
  br i1 %1055, label %1056, label %1105

1056:                                             ; preds = %1051
  %1057 = load ptr, ptr %8, align 8
  %1058 = getelementptr inbounds %struct.CalcLangVal, ptr %1057, i32 0, i32 1
  %1059 = load ptr, ptr %1058, align 8
  store ptr %1059, ptr %46, align 8
  %1060 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1060, ptr %47, align 8
  %1061 = load ptr, ptr %46, align 8
  %1062 = getelementptr inbounds %struct.SetValue, ptr %1061, i32 0, i32 0
  %1063 = load i32, ptr %1062, align 8
  %1064 = load ptr, ptr %47, align 8
  %1065 = getelementptr inbounds %struct.SetValue, ptr %1064, i32 0, i32 0
  store i32 %1063, ptr %1065, align 8
  %1066 = load ptr, ptr %47, align 8
  %1067 = getelementptr inbounds %struct.SetValue, ptr %1066, i32 0, i32 0
  %1068 = load i32, ptr %1067, align 8
  %1069 = sext i32 %1068 to i64
  %1070 = mul i64 8, %1069
  %1071 = call noalias ptr @malloc(i64 noundef %1070) #4
  %1072 = load ptr, ptr %47, align 8
  %1073 = getelementptr inbounds %struct.SetValue, ptr %1072, i32 0, i32 1
  store ptr %1071, ptr %1073, align 8
  store i32 0, ptr %48, align 4
  br label %1074

1074:                                             ; preds = %1096, %1056
  %1075 = load i32, ptr %48, align 4
  %1076 = load ptr, ptr %46, align 8
  %1077 = getelementptr inbounds %struct.SetValue, ptr %1076, i32 0, i32 0
  %1078 = load i32, ptr %1077, align 8
  %1079 = icmp slt i32 %1075, %1078
  br i1 %1079, label %1080, label %1099

1080:                                             ; preds = %1074
  %1081 = load ptr, ptr %6, align 8
  %1082 = load ptr, ptr %46, align 8
  %1083 = getelementptr inbounds %struct.SetValue, ptr %1082, i32 0, i32 1
  %1084 = load ptr, ptr %1083, align 8
  %1085 = load i32, ptr %48, align 4
  %1086 = sext i32 %1085 to i64
  %1087 = getelementptr inbounds ptr, ptr %1084, i64 %1086
  %1088 = load ptr, ptr %1087, align 8
  %1089 = call ptr @multCalcLangValues(ptr noundef %1081, i32 noundef 0, ptr noundef %1088, i32 noundef 1)
  %1090 = load ptr, ptr %47, align 8
  %1091 = getelementptr inbounds %struct.SetValue, ptr %1090, i32 0, i32 1
  %1092 = load ptr, ptr %1091, align 8
  %1093 = load i32, ptr %48, align 4
  %1094 = sext i32 %1093 to i64
  %1095 = getelementptr inbounds ptr, ptr %1092, i64 %1094
  store ptr %1089, ptr %1095, align 8
  br label %1096

1096:                                             ; preds = %1080
  %1097 = load i32, ptr %48, align 4
  %1098 = add nsw i32 %1097, 1
  store i32 %1098, ptr %48, align 4
  br label %1074, !llvm.loop !54

1099:                                             ; preds = %1074
  %1100 = load ptr, ptr %10, align 8
  %1101 = getelementptr inbounds %struct.CalcLangVal, ptr %1100, i32 0, i32 0
  store i32 6, ptr %1101, align 8
  %1102 = load ptr, ptr %47, align 8
  %1103 = load ptr, ptr %10, align 8
  %1104 = getelementptr inbounds %struct.CalcLangVal, ptr %1103, i32 0, i32 1
  store ptr %1102, ptr %1104, align 8
  br label %1466

1105:                                             ; preds = %1051, %1046
  %1106 = load ptr, ptr %6, align 8
  %1107 = getelementptr inbounds %struct.CalcLangVal, ptr %1106, i32 0, i32 0
  %1108 = load i32, ptr %1107, align 8
  %1109 = icmp eq i32 %1108, 6
  br i1 %1109, label %1110, label %1164

1110:                                             ; preds = %1105
  %1111 = load ptr, ptr %8, align 8
  %1112 = getelementptr inbounds %struct.CalcLangVal, ptr %1111, i32 0, i32 0
  %1113 = load i32, ptr %1112, align 8
  %1114 = icmp eq i32 %1113, 1
  br i1 %1114, label %1115, label %1164

1115:                                             ; preds = %1110
  %1116 = load ptr, ptr %6, align 8
  %1117 = getelementptr inbounds %struct.CalcLangVal, ptr %1116, i32 0, i32 1
  %1118 = load ptr, ptr %1117, align 8
  store ptr %1118, ptr %49, align 8
  %1119 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1119, ptr %50, align 8
  %1120 = load ptr, ptr %49, align 8
  %1121 = getelementptr inbounds %struct.SetValue, ptr %1120, i32 0, i32 0
  %1122 = load i32, ptr %1121, align 8
  %1123 = load ptr, ptr %50, align 8
  %1124 = getelementptr inbounds %struct.SetValue, ptr %1123, i32 0, i32 0
  store i32 %1122, ptr %1124, align 8
  %1125 = load ptr, ptr %50, align 8
  %1126 = getelementptr inbounds %struct.SetValue, ptr %1125, i32 0, i32 0
  %1127 = load i32, ptr %1126, align 8
  %1128 = sext i32 %1127 to i64
  %1129 = mul i64 8, %1128
  %1130 = call noalias ptr @malloc(i64 noundef %1129) #4
  %1131 = load ptr, ptr %50, align 8
  %1132 = getelementptr inbounds %struct.SetValue, ptr %1131, i32 0, i32 1
  store ptr %1130, ptr %1132, align 8
  store i32 0, ptr %51, align 4
  br label %1133

1133:                                             ; preds = %1155, %1115
  %1134 = load i32, ptr %51, align 4
  %1135 = load ptr, ptr %49, align 8
  %1136 = getelementptr inbounds %struct.SetValue, ptr %1135, i32 0, i32 0
  %1137 = load i32, ptr %1136, align 8
  %1138 = icmp slt i32 %1134, %1137
  br i1 %1138, label %1139, label %1158

1139:                                             ; preds = %1133
  %1140 = load ptr, ptr %49, align 8
  %1141 = getelementptr inbounds %struct.SetValue, ptr %1140, i32 0, i32 1
  %1142 = load ptr, ptr %1141, align 8
  %1143 = load i32, ptr %51, align 4
  %1144 = sext i32 %1143 to i64
  %1145 = getelementptr inbounds ptr, ptr %1142, i64 %1144
  %1146 = load ptr, ptr %1145, align 8
  %1147 = load ptr, ptr %8, align 8
  %1148 = call ptr @multCalcLangValues(ptr noundef %1146, i32 noundef 1, ptr noundef %1147, i32 noundef 0)
  %1149 = load ptr, ptr %50, align 8
  %1150 = getelementptr inbounds %struct.SetValue, ptr %1149, i32 0, i32 1
  %1151 = load ptr, ptr %1150, align 8
  %1152 = load i32, ptr %51, align 4
  %1153 = sext i32 %1152 to i64
  %1154 = getelementptr inbounds ptr, ptr %1151, i64 %1153
  store ptr %1148, ptr %1154, align 8
  br label %1155

1155:                                             ; preds = %1139
  %1156 = load i32, ptr %51, align 4
  %1157 = add nsw i32 %1156, 1
  store i32 %1157, ptr %51, align 4
  br label %1133, !llvm.loop !55

1158:                                             ; preds = %1133
  %1159 = load ptr, ptr %10, align 8
  %1160 = getelementptr inbounds %struct.CalcLangVal, ptr %1159, i32 0, i32 0
  store i32 7, ptr %1160, align 8
  %1161 = load ptr, ptr %50, align 8
  %1162 = load ptr, ptr %10, align 8
  %1163 = getelementptr inbounds %struct.CalcLangVal, ptr %1162, i32 0, i32 1
  store ptr %1161, ptr %1163, align 8
  br label %1465

1164:                                             ; preds = %1110, %1105
  %1165 = load ptr, ptr %6, align 8
  %1166 = getelementptr inbounds %struct.CalcLangVal, ptr %1165, i32 0, i32 0
  %1167 = load i32, ptr %1166, align 8
  %1168 = icmp eq i32 %1167, 1
  br i1 %1168, label %1169, label %1223

1169:                                             ; preds = %1164
  %1170 = load ptr, ptr %8, align 8
  %1171 = getelementptr inbounds %struct.CalcLangVal, ptr %1170, i32 0, i32 0
  %1172 = load i32, ptr %1171, align 8
  %1173 = icmp eq i32 %1172, 6
  br i1 %1173, label %1174, label %1223

1174:                                             ; preds = %1169
  %1175 = load ptr, ptr %8, align 8
  %1176 = getelementptr inbounds %struct.CalcLangVal, ptr %1175, i32 0, i32 1
  %1177 = load ptr, ptr %1176, align 8
  store ptr %1177, ptr %52, align 8
  %1178 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1178, ptr %53, align 8
  %1179 = load ptr, ptr %52, align 8
  %1180 = getelementptr inbounds %struct.SetValue, ptr %1179, i32 0, i32 0
  %1181 = load i32, ptr %1180, align 8
  %1182 = load ptr, ptr %53, align 8
  %1183 = getelementptr inbounds %struct.SetValue, ptr %1182, i32 0, i32 0
  store i32 %1181, ptr %1183, align 8
  %1184 = load ptr, ptr %53, align 8
  %1185 = getelementptr inbounds %struct.SetValue, ptr %1184, i32 0, i32 0
  %1186 = load i32, ptr %1185, align 8
  %1187 = sext i32 %1186 to i64
  %1188 = mul i64 8, %1187
  %1189 = call noalias ptr @malloc(i64 noundef %1188) #4
  %1190 = load ptr, ptr %53, align 8
  %1191 = getelementptr inbounds %struct.SetValue, ptr %1190, i32 0, i32 1
  store ptr %1189, ptr %1191, align 8
  store i32 0, ptr %54, align 4
  br label %1192

1192:                                             ; preds = %1214, %1174
  %1193 = load i32, ptr %54, align 4
  %1194 = load ptr, ptr %52, align 8
  %1195 = getelementptr inbounds %struct.SetValue, ptr %1194, i32 0, i32 0
  %1196 = load i32, ptr %1195, align 8
  %1197 = icmp slt i32 %1193, %1196
  br i1 %1197, label %1198, label %1217

1198:                                             ; preds = %1192
  %1199 = load ptr, ptr %6, align 8
  %1200 = load ptr, ptr %52, align 8
  %1201 = getelementptr inbounds %struct.SetValue, ptr %1200, i32 0, i32 1
  %1202 = load ptr, ptr %1201, align 8
  %1203 = load i32, ptr %54, align 4
  %1204 = sext i32 %1203 to i64
  %1205 = getelementptr inbounds ptr, ptr %1202, i64 %1204
  %1206 = load ptr, ptr %1205, align 8
  %1207 = call ptr @multCalcLangValues(ptr noundef %1199, i32 noundef 0, ptr noundef %1206, i32 noundef 1)
  %1208 = load ptr, ptr %53, align 8
  %1209 = getelementptr inbounds %struct.SetValue, ptr %1208, i32 0, i32 1
  %1210 = load ptr, ptr %1209, align 8
  %1211 = load i32, ptr %54, align 4
  %1212 = sext i32 %1211 to i64
  %1213 = getelementptr inbounds ptr, ptr %1210, i64 %1212
  store ptr %1207, ptr %1213, align 8
  br label %1214

1214:                                             ; preds = %1198
  %1215 = load i32, ptr %54, align 4
  %1216 = add nsw i32 %1215, 1
  store i32 %1216, ptr %54, align 4
  br label %1192, !llvm.loop !56

1217:                                             ; preds = %1192
  %1218 = load ptr, ptr %10, align 8
  %1219 = getelementptr inbounds %struct.CalcLangVal, ptr %1218, i32 0, i32 0
  store i32 6, ptr %1219, align 8
  %1220 = load ptr, ptr %53, align 8
  %1221 = load ptr, ptr %10, align 8
  %1222 = getelementptr inbounds %struct.CalcLangVal, ptr %1221, i32 0, i32 1
  store ptr %1220, ptr %1222, align 8
  br label %1464

1223:                                             ; preds = %1169, %1164
  %1224 = load ptr, ptr %6, align 8
  %1225 = getelementptr inbounds %struct.CalcLangVal, ptr %1224, i32 0, i32 0
  %1226 = load i32, ptr %1225, align 8
  %1227 = icmp eq i32 %1226, 6
  br i1 %1227, label %1228, label %1282

1228:                                             ; preds = %1223
  %1229 = load ptr, ptr %8, align 8
  %1230 = getelementptr inbounds %struct.CalcLangVal, ptr %1229, i32 0, i32 0
  %1231 = load i32, ptr %1230, align 8
  %1232 = icmp eq i32 %1231, 3
  br i1 %1232, label %1233, label %1282

1233:                                             ; preds = %1228
  %1234 = load ptr, ptr %6, align 8
  %1235 = getelementptr inbounds %struct.CalcLangVal, ptr %1234, i32 0, i32 1
  %1236 = load ptr, ptr %1235, align 8
  store ptr %1236, ptr %55, align 8
  %1237 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1237, ptr %56, align 8
  %1238 = load ptr, ptr %55, align 8
  %1239 = getelementptr inbounds %struct.SetValue, ptr %1238, i32 0, i32 0
  %1240 = load i32, ptr %1239, align 8
  %1241 = load ptr, ptr %56, align 8
  %1242 = getelementptr inbounds %struct.SetValue, ptr %1241, i32 0, i32 0
  store i32 %1240, ptr %1242, align 8
  %1243 = load ptr, ptr %56, align 8
  %1244 = getelementptr inbounds %struct.SetValue, ptr %1243, i32 0, i32 0
  %1245 = load i32, ptr %1244, align 8
  %1246 = sext i32 %1245 to i64
  %1247 = mul i64 8, %1246
  %1248 = call noalias ptr @malloc(i64 noundef %1247) #4
  %1249 = load ptr, ptr %56, align 8
  %1250 = getelementptr inbounds %struct.SetValue, ptr %1249, i32 0, i32 1
  store ptr %1248, ptr %1250, align 8
  store i32 0, ptr %57, align 4
  br label %1251

1251:                                             ; preds = %1273, %1233
  %1252 = load i32, ptr %57, align 4
  %1253 = load ptr, ptr %55, align 8
  %1254 = getelementptr inbounds %struct.SetValue, ptr %1253, i32 0, i32 0
  %1255 = load i32, ptr %1254, align 8
  %1256 = icmp slt i32 %1252, %1255
  br i1 %1256, label %1257, label %1276

1257:                                             ; preds = %1251
  %1258 = load ptr, ptr %55, align 8
  %1259 = getelementptr inbounds %struct.SetValue, ptr %1258, i32 0, i32 1
  %1260 = load ptr, ptr %1259, align 8
  %1261 = load i32, ptr %57, align 4
  %1262 = sext i32 %1261 to i64
  %1263 = getelementptr inbounds ptr, ptr %1260, i64 %1262
  %1264 = load ptr, ptr %1263, align 8
  %1265 = load ptr, ptr %8, align 8
  %1266 = call ptr @multCalcLangValues(ptr noundef %1264, i32 noundef 1, ptr noundef %1265, i32 noundef 0)
  %1267 = load ptr, ptr %56, align 8
  %1268 = getelementptr inbounds %struct.SetValue, ptr %1267, i32 0, i32 1
  %1269 = load ptr, ptr %1268, align 8
  %1270 = load i32, ptr %57, align 4
  %1271 = sext i32 %1270 to i64
  %1272 = getelementptr inbounds ptr, ptr %1269, i64 %1271
  store ptr %1266, ptr %1272, align 8
  br label %1273

1273:                                             ; preds = %1257
  %1274 = load i32, ptr %57, align 4
  %1275 = add nsw i32 %1274, 1
  store i32 %1275, ptr %57, align 4
  br label %1251, !llvm.loop !57

1276:                                             ; preds = %1251
  %1277 = load ptr, ptr %10, align 8
  %1278 = getelementptr inbounds %struct.CalcLangVal, ptr %1277, i32 0, i32 0
  store i32 6, ptr %1278, align 8
  %1279 = load ptr, ptr %56, align 8
  %1280 = load ptr, ptr %10, align 8
  %1281 = getelementptr inbounds %struct.CalcLangVal, ptr %1280, i32 0, i32 1
  store ptr %1279, ptr %1281, align 8
  br label %1463

1282:                                             ; preds = %1228, %1223
  %1283 = load ptr, ptr %6, align 8
  %1284 = getelementptr inbounds %struct.CalcLangVal, ptr %1283, i32 0, i32 0
  %1285 = load i32, ptr %1284, align 8
  %1286 = icmp eq i32 %1285, 3
  br i1 %1286, label %1287, label %1341

1287:                                             ; preds = %1282
  %1288 = load ptr, ptr %8, align 8
  %1289 = getelementptr inbounds %struct.CalcLangVal, ptr %1288, i32 0, i32 0
  %1290 = load i32, ptr %1289, align 8
  %1291 = icmp eq i32 %1290, 6
  br i1 %1291, label %1292, label %1341

1292:                                             ; preds = %1287
  %1293 = load ptr, ptr %8, align 8
  %1294 = getelementptr inbounds %struct.CalcLangVal, ptr %1293, i32 0, i32 1
  %1295 = load ptr, ptr %1294, align 8
  store ptr %1295, ptr %58, align 8
  %1296 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1296, ptr %59, align 8
  %1297 = load ptr, ptr %58, align 8
  %1298 = getelementptr inbounds %struct.SetValue, ptr %1297, i32 0, i32 0
  %1299 = load i32, ptr %1298, align 8
  %1300 = load ptr, ptr %59, align 8
  %1301 = getelementptr inbounds %struct.SetValue, ptr %1300, i32 0, i32 0
  store i32 %1299, ptr %1301, align 8
  %1302 = load ptr, ptr %59, align 8
  %1303 = getelementptr inbounds %struct.SetValue, ptr %1302, i32 0, i32 0
  %1304 = load i32, ptr %1303, align 8
  %1305 = sext i32 %1304 to i64
  %1306 = mul i64 8, %1305
  %1307 = call noalias ptr @malloc(i64 noundef %1306) #4
  %1308 = load ptr, ptr %59, align 8
  %1309 = getelementptr inbounds %struct.SetValue, ptr %1308, i32 0, i32 1
  store ptr %1307, ptr %1309, align 8
  store i32 0, ptr %60, align 4
  br label %1310

1310:                                             ; preds = %1332, %1292
  %1311 = load i32, ptr %60, align 4
  %1312 = load ptr, ptr %58, align 8
  %1313 = getelementptr inbounds %struct.SetValue, ptr %1312, i32 0, i32 0
  %1314 = load i32, ptr %1313, align 8
  %1315 = icmp slt i32 %1311, %1314
  br i1 %1315, label %1316, label %1335

1316:                                             ; preds = %1310
  %1317 = load ptr, ptr %6, align 8
  %1318 = load ptr, ptr %58, align 8
  %1319 = getelementptr inbounds %struct.SetValue, ptr %1318, i32 0, i32 1
  %1320 = load ptr, ptr %1319, align 8
  %1321 = load i32, ptr %60, align 4
  %1322 = sext i32 %1321 to i64
  %1323 = getelementptr inbounds ptr, ptr %1320, i64 %1322
  %1324 = load ptr, ptr %1323, align 8
  %1325 = call ptr @multCalcLangValues(ptr noundef %1317, i32 noundef 0, ptr noundef %1324, i32 noundef 1)
  %1326 = load ptr, ptr %59, align 8
  %1327 = getelementptr inbounds %struct.SetValue, ptr %1326, i32 0, i32 1
  %1328 = load ptr, ptr %1327, align 8
  %1329 = load i32, ptr %60, align 4
  %1330 = sext i32 %1329 to i64
  %1331 = getelementptr inbounds ptr, ptr %1328, i64 %1330
  store ptr %1325, ptr %1331, align 8
  br label %1332

1332:                                             ; preds = %1316
  %1333 = load i32, ptr %60, align 4
  %1334 = add nsw i32 %1333, 1
  store i32 %1334, ptr %60, align 4
  br label %1310, !llvm.loop !58

1335:                                             ; preds = %1310
  %1336 = load ptr, ptr %10, align 8
  %1337 = getelementptr inbounds %struct.CalcLangVal, ptr %1336, i32 0, i32 0
  store i32 6, ptr %1337, align 8
  %1338 = load ptr, ptr %59, align 8
  %1339 = load ptr, ptr %10, align 8
  %1340 = getelementptr inbounds %struct.CalcLangVal, ptr %1339, i32 0, i32 1
  store ptr %1338, ptr %1340, align 8
  br label %1462

1341:                                             ; preds = %1287, %1282
  %1342 = load ptr, ptr %6, align 8
  %1343 = getelementptr inbounds %struct.CalcLangVal, ptr %1342, i32 0, i32 0
  %1344 = load i32, ptr %1343, align 8
  %1345 = icmp eq i32 %1344, 6
  br i1 %1345, label %1346, label %1400

1346:                                             ; preds = %1341
  %1347 = load ptr, ptr %8, align 8
  %1348 = getelementptr inbounds %struct.CalcLangVal, ptr %1347, i32 0, i32 0
  %1349 = load i32, ptr %1348, align 8
  %1350 = icmp eq i32 %1349, 4
  br i1 %1350, label %1351, label %1400

1351:                                             ; preds = %1346
  %1352 = load ptr, ptr %6, align 8
  %1353 = getelementptr inbounds %struct.CalcLangVal, ptr %1352, i32 0, i32 1
  %1354 = load ptr, ptr %1353, align 8
  store ptr %1354, ptr %61, align 8
  %1355 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1355, ptr %62, align 8
  %1356 = load ptr, ptr %61, align 8
  %1357 = getelementptr inbounds %struct.SetValue, ptr %1356, i32 0, i32 0
  %1358 = load i32, ptr %1357, align 8
  %1359 = load ptr, ptr %62, align 8
  %1360 = getelementptr inbounds %struct.SetValue, ptr %1359, i32 0, i32 0
  store i32 %1358, ptr %1360, align 8
  %1361 = load ptr, ptr %62, align 8
  %1362 = getelementptr inbounds %struct.SetValue, ptr %1361, i32 0, i32 0
  %1363 = load i32, ptr %1362, align 8
  %1364 = sext i32 %1363 to i64
  %1365 = mul i64 8, %1364
  %1366 = call noalias ptr @malloc(i64 noundef %1365) #4
  %1367 = load ptr, ptr %62, align 8
  %1368 = getelementptr inbounds %struct.SetValue, ptr %1367, i32 0, i32 1
  store ptr %1366, ptr %1368, align 8
  store i32 0, ptr %63, align 4
  br label %1369

1369:                                             ; preds = %1391, %1351
  %1370 = load i32, ptr %63, align 4
  %1371 = load ptr, ptr %61, align 8
  %1372 = getelementptr inbounds %struct.SetValue, ptr %1371, i32 0, i32 0
  %1373 = load i32, ptr %1372, align 8
  %1374 = icmp slt i32 %1370, %1373
  br i1 %1374, label %1375, label %1394

1375:                                             ; preds = %1369
  %1376 = load ptr, ptr %61, align 8
  %1377 = getelementptr inbounds %struct.SetValue, ptr %1376, i32 0, i32 1
  %1378 = load ptr, ptr %1377, align 8
  %1379 = load i32, ptr %63, align 4
  %1380 = sext i32 %1379 to i64
  %1381 = getelementptr inbounds ptr, ptr %1378, i64 %1380
  %1382 = load ptr, ptr %1381, align 8
  %1383 = load ptr, ptr %8, align 8
  %1384 = call ptr @multCalcLangValues(ptr noundef %1382, i32 noundef 1, ptr noundef %1383, i32 noundef 0)
  %1385 = load ptr, ptr %62, align 8
  %1386 = getelementptr inbounds %struct.SetValue, ptr %1385, i32 0, i32 1
  %1387 = load ptr, ptr %1386, align 8
  %1388 = load i32, ptr %63, align 4
  %1389 = sext i32 %1388 to i64
  %1390 = getelementptr inbounds ptr, ptr %1387, i64 %1389
  store ptr %1384, ptr %1390, align 8
  br label %1391

1391:                                             ; preds = %1375
  %1392 = load i32, ptr %63, align 4
  %1393 = add nsw i32 %1392, 1
  store i32 %1393, ptr %63, align 4
  br label %1369, !llvm.loop !59

1394:                                             ; preds = %1369
  %1395 = load ptr, ptr %10, align 8
  %1396 = getelementptr inbounds %struct.CalcLangVal, ptr %1395, i32 0, i32 0
  store i32 6, ptr %1396, align 8
  %1397 = load ptr, ptr %62, align 8
  %1398 = load ptr, ptr %10, align 8
  %1399 = getelementptr inbounds %struct.CalcLangVal, ptr %1398, i32 0, i32 1
  store ptr %1397, ptr %1399, align 8
  br label %1461

1400:                                             ; preds = %1346, %1341
  %1401 = load ptr, ptr %6, align 8
  %1402 = getelementptr inbounds %struct.CalcLangVal, ptr %1401, i32 0, i32 0
  %1403 = load i32, ptr %1402, align 8
  %1404 = icmp eq i32 %1403, 4
  br i1 %1404, label %1405, label %1459

1405:                                             ; preds = %1400
  %1406 = load ptr, ptr %8, align 8
  %1407 = getelementptr inbounds %struct.CalcLangVal, ptr %1406, i32 0, i32 0
  %1408 = load i32, ptr %1407, align 8
  %1409 = icmp eq i32 %1408, 6
  br i1 %1409, label %1410, label %1459

1410:                                             ; preds = %1405
  %1411 = load ptr, ptr %8, align 8
  %1412 = getelementptr inbounds %struct.CalcLangVal, ptr %1411, i32 0, i32 1
  %1413 = load ptr, ptr %1412, align 8
  store ptr %1413, ptr %64, align 8
  %1414 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %1414, ptr %65, align 8
  %1415 = load ptr, ptr %64, align 8
  %1416 = getelementptr inbounds %struct.SetValue, ptr %1415, i32 0, i32 0
  %1417 = load i32, ptr %1416, align 8
  %1418 = load ptr, ptr %65, align 8
  %1419 = getelementptr inbounds %struct.SetValue, ptr %1418, i32 0, i32 0
  store i32 %1417, ptr %1419, align 8
  %1420 = load ptr, ptr %65, align 8
  %1421 = getelementptr inbounds %struct.SetValue, ptr %1420, i32 0, i32 0
  %1422 = load i32, ptr %1421, align 8
  %1423 = sext i32 %1422 to i64
  %1424 = mul i64 8, %1423
  %1425 = call noalias ptr @malloc(i64 noundef %1424) #4
  %1426 = load ptr, ptr %65, align 8
  %1427 = getelementptr inbounds %struct.SetValue, ptr %1426, i32 0, i32 1
  store ptr %1425, ptr %1427, align 8
  store i32 0, ptr %66, align 4
  br label %1428

1428:                                             ; preds = %1450, %1410
  %1429 = load i32, ptr %66, align 4
  %1430 = load ptr, ptr %64, align 8
  %1431 = getelementptr inbounds %struct.SetValue, ptr %1430, i32 0, i32 0
  %1432 = load i32, ptr %1431, align 8
  %1433 = icmp slt i32 %1429, %1432
  br i1 %1433, label %1434, label %1453

1434:                                             ; preds = %1428
  %1435 = load ptr, ptr %6, align 8
  %1436 = load ptr, ptr %64, align 8
  %1437 = getelementptr inbounds %struct.SetValue, ptr %1436, i32 0, i32 1
  %1438 = load ptr, ptr %1437, align 8
  %1439 = load i32, ptr %66, align 4
  %1440 = sext i32 %1439 to i64
  %1441 = getelementptr inbounds ptr, ptr %1438, i64 %1440
  %1442 = load ptr, ptr %1441, align 8
  %1443 = call ptr @multCalcLangValues(ptr noundef %1435, i32 noundef 0, ptr noundef %1442, i32 noundef 1)
  %1444 = load ptr, ptr %65, align 8
  %1445 = getelementptr inbounds %struct.SetValue, ptr %1444, i32 0, i32 1
  %1446 = load ptr, ptr %1445, align 8
  %1447 = load i32, ptr %66, align 4
  %1448 = sext i32 %1447 to i64
  %1449 = getelementptr inbounds ptr, ptr %1446, i64 %1448
  store ptr %1443, ptr %1449, align 8
  br label %1450

1450:                                             ; preds = %1434
  %1451 = load i32, ptr %66, align 4
  %1452 = add nsw i32 %1451, 1
  store i32 %1452, ptr %66, align 4
  br label %1428, !llvm.loop !60

1453:                                             ; preds = %1428
  %1454 = load ptr, ptr %10, align 8
  %1455 = getelementptr inbounds %struct.CalcLangVal, ptr %1454, i32 0, i32 0
  store i32 6, ptr %1455, align 8
  %1456 = load ptr, ptr %65, align 8
  %1457 = load ptr, ptr %10, align 8
  %1458 = getelementptr inbounds %struct.CalcLangVal, ptr %1457, i32 0, i32 1
  store ptr %1456, ptr %1458, align 8
  br label %1460

1459:                                             ; preds = %1405, %1400
  call void @perror(ptr noundef @.str.1) #5
  br label %1460

1460:                                             ; preds = %1459, %1453
  br label %1461

1461:                                             ; preds = %1460, %1394
  br label %1462

1462:                                             ; preds = %1461, %1335
  br label %1463

1463:                                             ; preds = %1462, %1276
  br label %1464

1464:                                             ; preds = %1463, %1217
  br label %1465

1465:                                             ; preds = %1464, %1158
  br label %1466

1466:                                             ; preds = %1465, %1099
  br label %1467

1467:                                             ; preds = %1466, %1040
  br label %1468

1468:                                             ; preds = %1467, %986
  br label %1469

1469:                                             ; preds = %1468, %903
  br label %1470

1470:                                             ; preds = %1469, %844
  br label %1471

1471:                                             ; preds = %1470, %785
  br label %1472

1472:                                             ; preds = %1471, %726
  br label %1473

1473:                                             ; preds = %1472, %667
  br label %1474

1474:                                             ; preds = %1473, %608
  br label %1475

1475:                                             ; preds = %1474, %549
  br label %1476

1476:                                             ; preds = %1475, %490
  br label %1477

1477:                                             ; preds = %1476, %436
  br label %1478

1478:                                             ; preds = %1477, %347
  br label %1479

1479:                                             ; preds = %1478, %325
  br label %1480

1480:                                             ; preds = %1479, %303
  br label %1481

1481:                                             ; preds = %1480, %280
  br label %1482

1482:                                             ; preds = %1481, %257
  br label %1483

1483:                                             ; preds = %1482, %235
  br label %1484

1484:                                             ; preds = %1483, %213
  br label %1485

1485:                                             ; preds = %1484, %190
  br label %1486

1486:                                             ; preds = %1485, %167
  br label %1487

1487:                                             ; preds = %1486, %144
  br label %1488

1488:                                             ; preds = %1487, %121
  br label %1489

1489:                                             ; preds = %1488, %99
  br label %1490

1490:                                             ; preds = %1489, %77
  %1491 = load i32, ptr %7, align 4
  %1492 = icmp ne i32 %1491, 0
  br i1 %1492, label %1493, label %1495

1493:                                             ; preds = %1490
  %1494 = load ptr, ptr %6, align 8
  call void @freeCalcLangValue(ptr noundef %1494)
  br label %1501

1495:                                             ; preds = %1490
  %1496 = load i32, ptr %9, align 4
  %1497 = icmp ne i32 %1496, 0
  br i1 %1497, label %1498, label %1500

1498:                                             ; preds = %1495
  %1499 = load ptr, ptr %8, align 8
  call void @freeCalcLangValue(ptr noundef %1499)
  br label %1500

1500:                                             ; preds = %1498, %1495
  br label %1501

1501:                                             ; preds = %1500, %1493
  %1502 = load ptr, ptr %10, align 8
  store ptr %1502, ptr %5, align 8
  br label %1503

1503:                                             ; preds = %1501, %985, %435
  %1504 = load ptr, ptr %5, align 8
  ret ptr %1504
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { cold }

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
