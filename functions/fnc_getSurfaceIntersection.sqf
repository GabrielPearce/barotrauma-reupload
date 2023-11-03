#include "script_component.hpp"

params [["_positionASL", getPosASL objNull, [getPosASL objNull]],
        ["_ignoreObject1", objNull, [objNull]],
        ["_ignoreObject2", objNull, [objNull]]];

_surfaceDistance = 0;
_surfaceNormal   = [0, 0, 0];
_surfacePosition = [0, 0, 0];
_isIntersecting = false;
_intersectingObject = objNull;
_intersections = lineIntersectsSurfaces [
    _positionASL,
    _positionASL vectorAdd [0, 0, -100],
    _ignoreObject1,
    _ignoreObject2,
    true,
    10,
    "GEOM",
    "FIRE"
];
_filteredIntersections = _intersections select {
    !([(typeOf (_x select 2)), (getModelInfo (_x select 2)) select 0] call FUNC(isInForbiddenIntersectionList));
};

if(count _filteredIntersections > 0) then
{
    _intersection    = _filteredIntersections select 0;
    _surfacePosition = _intersection select 0;
    _surfaceNormal   = _intersection select 1;
    _intersectingObject = _intersection select 2;
    _surfaceDistance = (_positionASL select 2) - (_surfacePosition select 2);
    _isIntersecting = true;
};

[_surfaceDistance, _surfaceNormal, _surfacePosition, _isIntersecting, _intersectingObject];
