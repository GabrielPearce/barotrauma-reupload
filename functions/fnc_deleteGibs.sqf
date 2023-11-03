#include "script_component.hpp"

// Define a delay between deletions to spread out the load
private _deleteDelay = 0.01; // 10 milliseconds delay

{
    if (!isNull _x) then
    {
        deleteVehicle _x;
        sleep _deleteDelay; // Wait for a bit before deleting the next gib
    };
} forEach Barotrauma_Gibs;

// Clear the array after all gibs have been deleted
Barotrauma_Gibs = [];

true
