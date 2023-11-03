#define PREFIX phntm
#define COMPONENT barotrauma
#define VERSION 1.0
#define VERSION_STR 1.0.0
#define VERSION_AR 1,0,0

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\x\cba\addons\main\script_macros_common.hpp"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif
