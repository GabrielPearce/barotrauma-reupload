#include "script_component.hpp"

// Define a delay between deletions to spread out the load
private _deleteDelay = 0.01; // 10 milliseconds delay

{
    if (!isNull _x) then
    {
        deleteVehicle _x;
        sleep _deleteDelay; // Wait for a bit before deleting the next splatter
    };
} forEach Barotrauma_BleedSplatters;

// Clear the array after all bleed splatters have been deleted
Barotrauma_BleedSplatters = [];

{
    if (!isNull _x) then
    {
        deleteVehicle _x;
        sleep _deleteDelay; // Wait for a bit before deleting the next splatter
    };
} forEach Barotrauma_Splatters;

// Clear the array after all splatters have been deleted
Barotrauma_Splatters = [];

true
