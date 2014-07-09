
			

			
			
_cost = 100;




_vehicle = vehicle player;


if (playerMoney >= _cost) then {

	if (_vehicle == player) then {
	
	player SideChat "Stay in your vehicle to refuel";
	}
	
	else {
	player SideChat "Refueling ...";
	
	playerMoney = playerMoney - _cost;
	
	sleep 15;

	_vehicle setFuel 1;


	player SideChat "Vehicle Refueled";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	};
}	
else {
	player SideChat "You do not have enough money!";
};