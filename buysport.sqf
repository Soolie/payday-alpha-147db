
_cost = 5000;





_loc1 = _this select 0;



_loc1 = position _loc1;





if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newveh = createVehicle ["C_Hatchback_01_sport_F", _loc1,[],0,"NONE"];
		[_newveh, "MP_Lock", true, true] spawn BIS_fnc_MP;
		_newveh setVariable ["locked", 1, true];
	_newveh setVariable ["owner", player, true];
	player SideChat "Vehicle created";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];

	
	}
	
else {
	player SideChat "You do not have enough money!";
	};