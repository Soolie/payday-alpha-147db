
			

			
			
_cost = 3000;




_vehicle = vehicle player;


if (playerMoney >= _cost) then {

	if (_vehicle == player) then {
	
	player SideChat "Stay in your vehicle to rearm";
	}
	
	else {
	player SideChat "Rearming ...";
	
	playerMoney = playerMoney - _cost;
	
	sleep 15;

	_vehicle setVehicleAmmo 1;


	player SideChat "Vehicle Rearmed";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	};
}	
else {
	player SideChat "You do not have enough money!";
};