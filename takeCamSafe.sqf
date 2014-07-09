
_safe = _this select 0;

deleteVehicle _safe;

playerCams = playerCams + 20;


player sideChat "You picked up a Camera Crate!";

player sideChat format ["You now have %1 cameras.", playerCams]; 

