#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

ASSERT_OP(_unit, !=, objNull, "Failed to bind Explosion EH to valid unit");

_unit addEventHandler ["Explosion",
{
    _unit = _this select 0;
    _damage = _this select 1;

    TRACE_4("Unit rcvd explosion damage", name _unit, _damage, alive _unit, _thisEventHandler);

    if (!(_unit getVariable ["Barotrauma_IsVaporized", false]) &&
        (_damage >= Barotrauma_VaporizationDamageThreshold && !alive _unit)) then
    {
        [_unit, _damage] remoteExec [QFUNC(vaporizeUnit), 0, true];
    };

    if (_unit getVariable ["Barotrauma_IsVaporized", false]) then
    {
        TRACE_1("Removing explosion EH", _thisEventHandler);
        _unit removeEventHandler ["Explosion", _thisEventHandler];
    };
}];
