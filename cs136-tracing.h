/*****************************************************************************
                _   _____    __   
    ___   ___  / | |___ /   / /_  
   / __| / __| | |   |_ \  | '_ \ 
  | (__  \__ \ | |  ___) | | (_) |
   \___| |___/ |_| |____/   \___/ 
   
   The CS 136 tracing tools library
   by Dave Tompkins [dtompkins@uwaterloo.ca]
   (with feedback from other CS 136 team members)
   
   Version: 0.8 -- release for A9
   
 ****************************************************************************/

// These tracing tools can be used to help debug your code.
// They will not interfere with Marmoset tests or any I/O testing.

// NOTE: When your [RUN] in Seashell (as opposed to an [I/O TEST])
//       Your tracing messages may appear in seashell in a different order
//       than your output (e.g., printf statements) or in other words,
//       your tracing messages may appear "unsyncronized"


// trace_sync() "Syncronizes" tracing and printf output by
//   forcing all of the tracing messages to go to the same
//   stream as printf (stdout)
// CAUTION: this will likely cause your Marmoset and I/O tests to fail, so
//          do not leave this function call in your code when submitting
void trace_sync(void);


// trace_off() Turns off all tracing messages
//   [by default they are turned on]
void trace_off(void);


// trace_msg(msg) Displays msg in the console


// trace_X(exp) displays a message in the console of the form:
//   exp => final value

//   X can be one of: int, bool, char, double, string, ptr 

// example usage:
//   trace_msg("Hello, World!");
//   trace_int(1 + 1);


// trace_array_Y(arr, len) displays a message in the console of the form:
//   arr => [arr[0], arr[1], ...., arr[len-1]]

//   Y can be one of: int, bool, char, double, string

// example usage:
//   int a[6] = {4, 8, 15, 16, 23, 42};
//   trace_array_int(a, 6);


// trace_version() displays the current version of the cs136 tools library
void trace_version(void);


/****************************************************************************
  TRACING MACROS
****************************************************************************/

// The following is a collection of macros that should be ignored
// They are an unfortuante but necessary evil to implement our tracing tools
// Seriously: Go away... there's nothing to see here...

#define _FFL __FILE__, __func__, __LINE__
#define _CCP const char *
#define _DCLT(ctype, TYPE) void _TRACE_##TYPE(_CCP, ctype, _CCP, _CCP, int);
#define trace_msg(msg) _TRACE_MSG(#msg, "", _FFL);
#define trace_int(exp) _TRACE_INT(#exp, (exp), _FFL);
#define trace_bool(exp) _TRACE_STRING(#exp, (exp) ? "true" : "false", _FFL);
#define trace_char(exp) _TRACE_CHAR(#exp, (exp), _FFL);
#define trace_double(exp) _TRACE_DOUBLE(#exp, (exp), _FFL);
#define trace_string(exp) _TRACE_STRING(#exp, (exp), _FFL);
#define trace_ptr(exp) _TRACE_PTR(#exp, (void *) (exp), _FFL);
#define trace_array_int(exp, len) _TRACE_ARR("int", #exp, exp, len, _FFL);
#define trace_array_char(exp, len) _TRACE_ARR("char", #exp, exp, len, _FFL);
#define trace_array_bool(exp, len) _TRACE_ARR("bool", #exp, exp, len, _FFL);
#define trace_array_double(exp, len) _TRACE_ARR("double", #exp, exp, len, _FFL);
#define trace_array_string(exp, len) _TRACE_ARR("string", #exp, exp, len, _FFL);
void _TRACE_ARR(_CCP, _CCP, void *, int, _CCP, _CCP, int);
_DCLT(_CCP, MSG);
_DCLT(int, INT);
_DCLT(char, CHAR);
_DCLT(double, DOUBLE);
_DCLT(_CCP, STRING);
_DCLT(void *, PTR);

/*****************************************************************************/
