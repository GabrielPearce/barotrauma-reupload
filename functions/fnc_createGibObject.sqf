#include "script_component.hpp"

params [["_gib", "NULL", ["NULL"]],
        ["_pos", getPos objNull, [getPos objNull]],
        ["_dir", random 360, [random 360]]];

ASSERT_OP(_gib, !=, "NULL", "Cannot create a NULL object");

// Check if the maximum number of gibs has been reached before creating a new one
if (call FUNC(isMaxGibsReached)) then
{
    call FUNC(removeOldestGibObject); // Changed from spawn to call for immediate execution
};

// Use a pre-defined pool of gibs if possible to avoid creating new objects
_gibObj = [_gib, _pos, _dir] call FUNC(getOrCreateGibFromPool);

Barotrauma_Gibs pushBack _gibObj;

_gibObj
