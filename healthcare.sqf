
_cost = 500;




if (playerMoney >= _cost) then {


	player SideChat "Healthcare purchased";
	
	
	playerMoney = playerMoney - _cost;


	
	
	player playAction  "medicStart";
	sleep 4;
	player playAction  "medicStop";
	sleep 2;
	
	player setDamage 0;
	
	player SideChat "You have been fully healed";
	
	sleep 2;
	
	player SideChat format ["Player money = %1", playerMoney];

	}
	
else {
	player SideChat "You do not have enough money!";
	};



