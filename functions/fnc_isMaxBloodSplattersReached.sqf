#include "script_component.hpp"

params [["_useFineSplatterPool", true, [true]]];

_return = false;

if (_useFineSplatterPool) then
{
    if (count Barotrauma_BleedSplatters >= Barotrauma_MaxMinorSplatters) then
    {
        _return = true;
    };
}
else
{
    if (count Barotrauma_Splatters >= Barotrauma_MaxMajorSplatters) then
    {
        _return = true;
    };
};

_return
