#include "script_component.hpp"

params [["_splatter", "BloodSplatter_Plane", ["BloodSplatter_Plane"]],
        ["_pos", getPos objNull, [getPos objNull]],
        ["_tex", selectRandom Barotrauma_VaporizationTexList, [selectRandom Barotrauma_VaporizationTexList]],
        ["_useFineSplatterPool", true, [true]],
        ["_dir", random 360, [random 360]]];

if (_useFineSplatterPool call FUNC(isMaxBloodSplattersReached)) then
{
    [_useFineSplatterPool] spawn FUNC(removeOldestBloodSplatterObject);
};

_splatterObj = _splatter createVehicleLocal (getPos objNull);
_splatterObj setPosASL _pos;
_splatterObj setDir _dir;
_splatterObj setObjectTexture [0, _tex];

if (_useFineSplatterPool) then
{
    Barotrauma_BleedSplatters pushBack _splatterObj;
}
else
{
    Barotrauma_Splatters pushBack _splatterObj;
};

_splatterObj
