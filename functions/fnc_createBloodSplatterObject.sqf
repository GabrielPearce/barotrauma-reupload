#include "script_component.hpp"

params [["_splatter", "BloodSplatter_Plane", ["BloodSplatter_Plane"]],
        ["_pos", getPos objNull, [getPos objNull]],
        ["_tex", selectRandom Barotrauma_VaporizationTexList, [selectRandom Barotrauma_VaporizationTexList]],
        ["_useFineSplatterPool", true, [true]],
        ["_dir", random 360, [random 360]]];

// Use a function to get or create a splatter object from a pool instead of always creating a new one
_splatterObj = [_splatter, _pos, _tex, _dir, _useFineSplatterPool] call FUNC(getOrCreateSplatterFromPool);

// Add the splatter object to the appropriate array
if (_useFineSplatterPool) then
{
    Barotrauma_BleedSplatters pushBack _splatterObj;
}
else
{
    Barotrauma_Splatters pushBack _splatterObj;
};

_splatterObj
