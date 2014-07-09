

_safe = _this select 0;

deleteVehicle _safe;

playerPhones = playerPhones + 1;


player sideChat "You picked up a Phone!";

player sideChat format ["You now have %1 phones.", playerPhones]; 

