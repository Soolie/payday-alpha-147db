
_safe = _this select 0;

deleteVehicle _safe;

playerLaptops = playerLaptops + 8;


player sideChat "You picked up a Laptop Crate!";

player sideChat format ["You now have %1 laptops.", playerLaptops]; 