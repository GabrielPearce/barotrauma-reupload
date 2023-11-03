#include "script_component.hpp"

params [["_useFineSplatterPool", true, [true]]];

if (_useFineSplatterPool) then
{
    _fineSplatter = Barotrauma_BleedSplatters select 0;
    if (!isNull _fineSplatter) then
    {
        deleteVehicle _fineSplatter;
    };
    Barotrauma_BleedSplatters deleteAt 0;
}
else
{
    _majorSplatter = Barotrauma_Splatters select 0;
    if (!isNull _majorSplatter) then
    {
        deleteVehicle _majorSplatter;
    };
    Barotrauma_Splatters deleteAt 0;
};
