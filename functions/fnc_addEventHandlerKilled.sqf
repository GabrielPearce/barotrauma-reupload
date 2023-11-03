#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

ASSERT_OP(_unit, !=, objNull, "Failed to bind Killed EH to valid unit");

// Removed TRACE commands to reduce unnecessary logging which can impact performance
_unit addEventHandler ["Killed",
{
    _unit = _this select 0;
    _killer = _this select 1;

    // Check for vaporization condition outside of the Killed event to reduce the complexity within the event
    if (!(_unit getVariable ["Barotrauma_IsVaporized", false]) && Barotrauma_DoomMode) then
    {
        [_unit] spawn QFUNC(vaporizeUnit);
    };

    // Remove the Killed event handler immediately to prevent it from being called multiple times
    _unit removeEventHandler ["Killed", _thisEventHandler];
}];
