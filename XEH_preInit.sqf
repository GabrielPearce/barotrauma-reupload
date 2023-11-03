#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.sqf"
call compileFinal preprocessFileLineNumbers "\x\PHNTM\addons\Barotrauma\fnc_startBarotrauma.sqf";

// CBA Settings
// Parameters:
//     _setting     - Unique setting name. Matches resulting variable name <STRING>
//     _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
//     _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
//     _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
//     _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
//     _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
//     _script      - Script to execute when setting is changed. (optional) <CODE>
//     _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>

[
    "Barotrauma_DoomMode",
    "CHECKBOX",
    ["DOOM Mode", "All men explode upon death, irrespective of the weapon used"],
    ["Barotrauma", "Main"],
    false,
    1,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_VaporizationDamageThreshold",
    "SLIDER",
    ["Damage Threshold", "Instantaneous damage at or above which the unit will be vaporized if killed by an explosive"],
    ["Barotrauma", "Main"],
    [0.00, 2.00, 0.20, 2, false],
    1,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_GibsEnabled",
    "CHECKBOX",
    ["Gibbing", "Men who are rapidly disassembled will emanate gibs (can be CPU intensive w/gib smear enabled!)"],
    ["Barotrauma", "Gibs"],
    true,
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_MaxGibs",
    "SLIDER",
    ["Max Gibs", "Number of gibs created before deleting the oldest ones; one man is 18 gibs"],
    ["Barotrauma", "Gibs"],
    [0.0, 576, 144, 0, false],
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_MaxMajorSplatters",
    "SLIDER",
    ["Max Major Splatters", "Number of coexisting large blood splatters; oldest ones are deleted to maintain this limit"],
    ["Barotrauma", "Splatters"],
    [0.0, 64, 32, 0, false],
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_GibSmearEnabled",
    "CHECKBOX",
    ["Gib Smear", "Gibs will stain the ground with blood while rolling away from its previous owner (can be CPU intensive!)"],
    ["Barotrauma", "Splatters"],
    true,
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_FineSplatterEnabled",
    "CHECKBOX",
    ["Fine Splatter", "Adds more splatter effects based on the iteration count below"],
    ["Barotrauma", "Splatters"],
    true,
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_FineSplatterIterations",
    "SLIDER",
    ["Fine Splatter Iterations", "Number of smaller splatters to generate around a dismembered source"],
    ["Barotrauma", "Splatters"],
    [0.0, 60, 30, 0, false],
    0,
    {},
    false
] call cba_settings_fnc_init;

[
    "Barotrauma_MaxMinorSplatters",
    "SLIDER",
    ["Max Minor Splatters", "Number of coexisting medium to small splatters; oldest ones are deleted to maintain this limit"],
    ["Barotrauma", "Splatters"],
    [0.0, 10000, 5000, 0, false],
    0,
    {},
    false
] call cba_settings_fnc_init;

ADDON = true;
