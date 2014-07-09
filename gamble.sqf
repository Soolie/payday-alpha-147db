
_cost = 1000;
_cooldown = 1;


if (playerMoney >= _cost) then {

	_rand = floor (random 3);
	
	if (_rand == 0) then {
	
	
	player SideChat "You won";

	
	playerMoney = playerMoney + _cost;
	
	player SideChat format ["Player money = %1", playerMoney];

	sleep _cooldown; 
	
	}
	
	else
	
	{
	
	playerMoney = playerMoney - _cost;

	
	player SideChat "You lost";

	player SideChat format ["Player money = %1", playerMoney];

	sleep _cooldown; 
	
	
	};
}	
	
else {
	player SideChat "You do not have enough money!";
	};