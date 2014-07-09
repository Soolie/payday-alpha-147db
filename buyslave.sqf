_slaver = _this select 0;
_slaverPos = position _slaver;


_cost = 15000;




if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newGuy = group player createUnit ["C_man_w_worker_F", position _slaver, [], 0, "NONE"];
	
	player SideChat "Item purchased";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	}
	
else {
	player SideChat "You do not have enough money!";
	};