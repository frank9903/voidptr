; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_tracing_out = internal global %struct._IO_FILE* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [45 x i8] c">>> cs136tools version 0.8 [release for A9]\0A\00", align 1
@TRACE_FLAG = internal global i8 1, align 1
@stdout = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [19 x i8] c">>> [%s|%s|%d] >> \00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%s%s\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%s => %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%s => %c\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%s => %f\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"%s => %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%s => %p\0A\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"trace_array_len > 0\00", align 1
@.str.9 = private unnamed_addr constant [71 x i8] c"/u1/dtompkins/.seashell/projects/_cs136-tracing/common/cs136-tracing.c\00", align 1
@__PRETTY_FUNCTION__._TRACE_ARR = private unnamed_addr constant [90 x i8] c"void _TRACE_ARR(const char *, const char *, void *, int, const char *, const char *, int)\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"trace_array_ptr\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"%s => [\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"char\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"bool\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"string\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"\22%s\22\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"INVALID TYPE: %s]\0A\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1

; Function Attrs: nounwind
define void @trace_version() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
define void @trace_off() #0 {
  store i8 0, i8* @TRACE_FLAG, align 1
  ret void
}

; Function Attrs: nounwind
define void @trace_sync() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** @_tracing_out, align 8
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_MSG(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load i8*, i8** %expval.addr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* %12, i8* %13)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #2

; Function Attrs: nounwind
define void @_TRACE_INT(i8* %expstr, i32 %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i32 %expval, i32* %expval.addr, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load i32, i32* %expval.addr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i8* %12, i32 %13)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_CHAR(i8* %expstr, i8 signext %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8, align 1
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8 %expval, i8* %expval.addr, align 1
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load i8, i8* %expval.addr, align 1
  %conv = sext i8 %13 to i32
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i8* %12, i32 %conv)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_DOUBLE(i8* %expstr, double %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca double, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store double %expval, double* %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load double, double* %expval.addr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8* %12, double %13)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_STRING(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load i8*, i8** %expval.addr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* %12, i8* %13)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_PTR(i8* %expstr, i8* %expval, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %expstr.addr = alloca i8*, align 8
  %expval.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %expval, i8** %expval.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %14

; <label>:6:                                      ; preds = %4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %8 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %8, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %9 = load i8*, i8** %funcname.addr, align 8
  %10 = load i32, i32* %lineno.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %9, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %12 = load i8*, i8** %expstr.addr, align 8
  %13 = load i8*, i8** %expval.addr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i8* %12, i8* %13)
  br label %14

; <label>:14:                                     ; preds = %6, %4
  ret void
}

; Function Attrs: nounwind
define void @_TRACE_ARR(i8* %type, i8* %expstr, i8* %trace_array_ptr, i32 %trace_array_len, i8* %filename, i8* %funcname, i32 %lineno) #0 {
  %type.addr = alloca i8*, align 8
  %expstr.addr = alloca i8*, align 8
  %trace_array_ptr.addr = alloca i8*, align 8
  %trace_array_len.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 8
  %funcname.addr = alloca i8*, align 8
  %lineno.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %type, i8** %type.addr, align 8
  store i8* %expstr, i8** %expstr.addr, align 8
  store i8* %trace_array_ptr, i8** %trace_array_ptr.addr, align 8
  store i32 %trace_array_len, i32* %trace_array_len.addr, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %funcname, i8** %funcname.addr, align 8
  store i32 %lineno, i32* %lineno.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %4, label %2

; <label>:2:                                      ; preds = %0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** @_tracing_out, align 8
  br label %4

; <label>:4:                                      ; preds = %2, %0
  %5 = load i8, i8* @TRACE_FLAG, align 1
  %tobool1 = trunc i8 %5 to i1
  br i1 %tobool1, label %6, label %80

; <label>:6:                                      ; preds = %4
  %7 = load i32, i32* %trace_array_len.addr, align 4
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %8, label %9

; <label>:8:                                      ; preds = %6
  br label %11

; <label>:9:                                      ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.9, i32 0, i32 0), i32 58, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @__PRETTY_FUNCTION__._TRACE_ARR, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11:                                     ; preds = %10, %8
  %12 = load i8*, i8** %trace_array_ptr.addr, align 8
  %tobool2 = icmp ne i8* %12, null
  br i1 %tobool2, label %13, label %14

; <label>:13:                                     ; preds = %11
  br label %16

; <label>:14:                                     ; preds = %11
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.9, i32 0, i32 0), i32 59, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @__PRETTY_FUNCTION__._TRACE_ARR, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %16

; <label>:16:                                     ; preds = %15, %13
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %18 = load i8*, i8** %filename.addr, align 8
  %call = call i8* @strrchr(i8* %18, i32 47) #4
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 1
  %19 = load i8*, i8** %funcname.addr, align 8
  %20 = load i32, i32* %lineno.addr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr, i8* %19, i32 %20)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %22 = load i8*, i8** %expstr.addr, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0), i8* %22)
  store i32 0, i32* %i, align 4
  br label %23

; <label>:23:                                     ; preds = %76, %16
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %trace_array_len.addr, align 4
  %cmp5 = icmp slt i32 %24, %25
  br i1 %cmp5, label %26, label %78

; <label>:26:                                     ; preds = %23
  %27 = load i32, i32* %i, align 4
  %tobool6 = icmp ne i32 %27, 0
  br i1 %tobool6, label %28, label %30

; <label>:28:                                     ; preds = %26
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0))
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = load i8*, i8** %type.addr, align 8
  %call8 = call i32 @strcmp(i8* %31, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0)) #4
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %38, label %32

; <label>:32:                                     ; preds = %30
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom = sext i32 %34 to i64
  %35 = load i8*, i8** %trace_array_ptr.addr, align 8
  %36 = bitcast i8* %35 to i32*
  %arrayidx = getelementptr inbounds i32, i32* %36, i64 %idxprom
  %37 = load i32, i32* %arrayidx, align 4
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i32 %37)
  br label %75

; <label>:38:                                     ; preds = %30
  %39 = load i8*, i8** %type.addr, align 8
  %call11 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0)) #4
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %45, label %40

; <label>:40:                                     ; preds = %38
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %42 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %42 to i64
  %43 = load i8*, i8** %trace_array_ptr.addr, align 8
  %arrayidx14 = getelementptr inbounds i8, i8* %43, i64 %idxprom13
  %44 = load i8, i8* %arrayidx14, align 1
  %conv = sext i8 %44 to i32
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0), i32 %conv)
  br label %74

; <label>:45:                                     ; preds = %38
  %46 = load i8*, i8** %type.addr, align 8
  %call16 = call i32 @strcmp(i8* %46, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)) #4
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %53, label %47

; <label>:47:                                     ; preds = %45
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %49 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %49 to i64
  %50 = load i8*, i8** %trace_array_ptr.addr, align 8
  %51 = bitcast i8* %50 to double*
  %arrayidx19 = getelementptr inbounds double, double* %51, i64 %idxprom18
  %52 = load double, double* %arrayidx19, align 8
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), double %52)
  br label %73

; <label>:53:                                     ; preds = %45
  %54 = load i8*, i8** %type.addr, align 8
  %call21 = call i32 @strcmp(i8* %54, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0)) #4
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %60, label %55

; <label>:55:                                     ; preds = %53
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %57 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %57 to i64
  %58 = load i8*, i8** %trace_array_ptr.addr, align 8
  %arrayidx24 = getelementptr inbounds i8, i8* %58, i64 %idxprom23
  %59 = load i8, i8* %arrayidx24, align 1
  %tobool25 = trunc i8 %59 to i1
  %cond = select i1 %tobool25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0)
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* %cond)
  br label %72

; <label>:60:                                     ; preds = %53
  %61 = load i8*, i8** %type.addr, align 8
  %call28 = call i32 @strcmp(i8* %61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i32 0, i32 0)) #4
  %tobool29 = icmp ne i32 %call28, 0
  br i1 %tobool29, label %68, label %62

; <label>:62:                                     ; preds = %60
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %64 = load i32, i32* %i, align 4
  %idxprom30 = sext i32 %64 to i64
  %65 = load i8*, i8** %trace_array_ptr.addr, align 8
  %66 = bitcast i8* %65 to i8**
  %arrayidx31 = getelementptr inbounds i8*, i8** %66, i64 %idxprom30
  %67 = load i8*, i8** %arrayidx31, align 8
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i8* %67)
  br label %71

; <label>:68:                                     ; preds = %60
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %70 = load i8*, i8** %type.addr, align 8
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i32 0, i32 0), i8* %70)
  br label %80

; <label>:71:                                     ; preds = %62
  br label %72

; <label>:72:                                     ; preds = %71, %55
  br label %73

; <label>:73:                                     ; preds = %72, %47
  br label %74

; <label>:74:                                     ; preds = %73, %40
  br label %75

; <label>:75:                                     ; preds = %74, %32
  br label %76

; <label>:76:                                     ; preds = %75
  %77 = load i32, i32* %i, align 4
  %inc = add nsw i32 %77, 1
  store i32 %inc, i32* %i, align 4
  br label %23

; <label>:78:                                     ; preds = %23
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @_tracing_out, align 8
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %79, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0))
  br label %80

; <label>:80:                                     ; preds = %68, %78, %4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 "}
