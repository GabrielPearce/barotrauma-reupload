#include "script_component.hpp"

[] spawn
{
    {
        if (!isNull _x) then
        {
            deleteVehicle _x;
        };
    } forEach Barotrauma_Gibs;
};

true
