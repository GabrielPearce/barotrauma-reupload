#include "script_component.hpp"

params [["_splatter", objNull, [objNull]],
        ["_obj", objNull, [objNull]]];

if(_obj isKindOf "Building") then
{
    _objSplatters = _obj getVariable ["Barotrauma_Splatters", []];
    _obj setVariable ["Barotrauma_Splatters", _objSplatters + [_splatter]];
    _isKilledEventHandlerAssignedToSurfaceObject = _obj getVariable ["Barotrauma_IsKilledEventHandlerAssigned", false];
    if (!_isKilledEventHandlerAssignedToSurfaceObject) then
    {
        _obj setVariable ["Barotrauma_IsKilledEventHandlerAssigned", true];
        _obj addEventHandler ["Killed",
        {
            _object = _this select 0;
            _attachedSplatters = _object getVariable ["Barotrauma_Splatters", []];
            {
                if (!isNull _x) then
                {
                    deleteVehicle _x;
                };
                Barotrauma_Splatters = Barotrauma_Splatters - [_x];
            } foreach _attachedSplatters;
        }];
    };
};