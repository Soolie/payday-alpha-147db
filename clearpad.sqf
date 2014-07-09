_copspawnGuy = _this select 0;

_pos = position _copspawnGuy;

_carwreck = nearestObject [_pos, "Car"];
_airwreck = nearestObject [_pos, "Air"];

deleteVehicle _carwreck; 
deleteVehicle _airwreck; 

player SideChat "Obstruction Removed";
