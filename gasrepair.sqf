
			

			
			
_cost = 500;




_vehicle = vehicle player;


if (playerMoney >= _cost) then {

	if (_vehicle == player) then {
	
	player SideChat "Stay in your vehicle to repair";
	}
	
	else {
	player SideChat "Repairing ...";
	
	_fuel = fuel _vehicle;
	_vehicle setFuel 0;
	
	playerMoney = playerMoney - _cost;
	player SideChat format ["Player money = %1", playerMoney];
	sleep 15;
	_vehicle setFuel _fuel;
	_vehicle setDamage 0;


	player SideChat "Vehicle Repaired";
	sleep 2;
	


	};
}	
else {
	player SideChat "You do not have enough money!";
};