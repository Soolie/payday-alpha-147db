
			

			
			
_cost = 400;
_cooldown = 15;



_vehicle = vehicle player;


if (playerMoney >= _cost) then {

	
	player SideChat "Return to the vehicle you wish to paint";
	
	waitUntil { vehicle player != player };
	
	_vehicle = vehicle player;
	
	player SideChat "Painting ...";
	
		_fuel = fuel _vehicle;
	_vehicle setFuel 0;
	
		if (_fuel == 0) then {_fuel = 0.25; };
	
	playerMoney = playerMoney - _cost;
	
	sleep _cooldown;

	_texture = 	'#(argb,8,8,3)color(0.9,0,0,1)';
	
	[[_vehicle,_texture], "MP_Paint", true, true] spawn BIS_fnc_MP;



	_vehicle setFuel _fuel;
	player SideChat "Vehicle Painted";

	player SideChat format ["Player money = %1", playerMoney];


	
}	
else {
	player SideChat "You do not have enough money!";
};