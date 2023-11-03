#include "script_component.hpp"

params [["_gib", "NULL", ["NULL"]],
        ["_pos", getPos objNull, [getPos objNull]],
        ["_dir", random 360, [random 360]]];

ASSERT_OP(_gib, !=, "NULL", "Cannot create a NULL object");
TRACE_2(QFUNC(createGibObject), _unit, _pos);

if (call FUNC(isMaxGibsReached)) then
{
    [] spawn FUNC(removeOldestGibObject);
};

_gibObj = _gib createVehicleLocal (getPos objNull);
_gibObj setPosASL _pos;
_gibObj setDir _dir;

Barotrauma_Gibs pushBack _gibObj;

_gibObj
