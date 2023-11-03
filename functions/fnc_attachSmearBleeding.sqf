#include "script_component.hpp"

params [["_object", objNull, [objNull]],
        ["_duration", 3.0, [3.0]],
        ["_minimumSpeed", 0.33, [0.33]]];

_endTime = time + _duration;

[{
    _args = _this select 0;
    _object = _args select 0;
    _endTime = _args select 1;
    _minimumSpeed = _args select 2;
    _previousBleedTime = _object getVariable ["Barotrauma_PreviousBleedTime", -1];

    if (time >= _endTime) then
    {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    }
    else
    {
        if(time > _previousBleedTime) then
        {
            _surfaceIntersection = [getPosASL _object, _object, vehicle _object] call FUNC(getSurfaceIntersection);
            _surfaceDistance     = _surfaceIntersection select 0;
            _surfaceNormal       = _surfaceIntersection select 1;
            _surfacePosition    = _surfaceIntersection select 2;
            _surfaceIsIntersecting = _surfaceIntersection select 3;

            if(_surfaceIsIntersecting && _surfaceDistance <= 0.05 && vectorMagnitude (velocity _object) >= _minimumSpeed) then
            {
                _splatter = ["BloodSplatter_SmallPlane", _surfacePosition vectorAdd (_surfaceNormal vectorMultiply 0.025), selectRandom Barotrauma_SmearTexList] call FUNC(createBloodSplatterObject);
                _splatter setVectorUp _surfaceNormal;
                _object setVariable ["Barotrauma_PreviousBleedTime", time];
            };
        };
    };
}, 0, [_object, _endTime, _minimumSpeed]] call CBA_fnc_addPerFrameHandler;
