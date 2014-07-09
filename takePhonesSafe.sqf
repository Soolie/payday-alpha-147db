

_safe = _this select 0;

deleteVehicle _safe;

playerPhones = playerPhones + 30;


player sideChat "You picked up a Phone Crate!";

player sideChat format ["You now have %1 phones.", playerPhones]; 

