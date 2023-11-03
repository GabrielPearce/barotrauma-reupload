#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

ASSERT_OP(_unit, !=, objNull, "Failed to bind init to valid unit");

_unit call FUNC(addEventHandlerExplosion);
_unit call FUNC(addEventHandlerKilled);
