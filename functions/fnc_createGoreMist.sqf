#include "script_component.hpp"

_source = "#particlesource" createVehicleLocal [0, 0, 0];
_source setPosASL (getPosASL _this);
_source setParticleParams
[
    ["\a3\data_f\particleEffects\universal\universal.p3d",16,8,48,0],"",
    "billboard",
    0,
    0.5,
    [0,0,0.5],
    [0,0,2],
    0,10.30,1,-0.1,
    [0,6],
    [[0.5,0,0,0.8],[0.3,0,0,0.8],[0.25,0,0,0.5],[0.15,0,0,0]],
    [0.01],
    0.01,
    0.08,
    "",
    "",
    _this,
    0,
    true,
    0.5,
    [[0.5,0,0,1]]
];
    _source setDropInterval 1;
    _endTime = time + 1;
[{
    _args = _this select 0;
    _source = _args select 0;
    _endTime = _args select 1;
    if(time >= _endTime) then
    {
        if (!isNull _source) then
        {
            deleteVehicle _source;
        };
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_source, _endTime]] call CBA_fnc_addPerFrameHandler;
