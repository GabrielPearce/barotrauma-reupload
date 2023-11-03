#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

ASSERT_OP(_unit, !=, objNull, "Failed to bind Killed EH to valid unit");

_unit addEventHandler ["Killed",
{
    _unit = _this select 0;
    _killer = _this select 1;

    TRACE_2("Unit x killed by y", name _unit, name _killer);

    if (!(_unit getVariable ["Barotrauma_IsVaporized", false]) &&
        Barotrauma_DoomMode) then
    {
        _unit remoteExec [QFUNC(vaporizeUnit), 0, true];
    };

    TRACE_1("Removing Killed EH", _thisEventHandler);
    _unit removeEventHandler ["Killed", _thisEventHandler];
}];
