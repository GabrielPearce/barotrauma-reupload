#include "script_component.hpp"

_class = _this select 0;
_model = _this select 1;

_return = false;

if(isNil "_model") then
{
    _model = "objNull";
};

if(_model in Barotrauma_ForbiddenIntersectionsList || _class in Barotrauma_ForbiddenIntersectionsList) then
{
    _return = true;
}
else
{
    {
        if(_class isKindOf _x) exitWith
        {
            _return = true;
        };
    } foreach Barotrauma_ForbiddenIntersectionsList;
};

_return;
