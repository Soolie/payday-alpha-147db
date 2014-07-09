
_cost = 220000;





_loc1 = _this select 0;



_loc1 = position _loc1;





if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newveh = createVehicle ["I_Plane_Fighter_03_AA_F", _loc1,[],0,"NONE"];
		[_newveh, "MP_Lock", true, true] spawn BIS_fnc_MP;
	_newveh setVariable ["locked", 1, true];
	_newveh setVariable ["owner", player, true];
	_newveh setVehicleAmmo 0;
	
	player SideChat "Vehicle created";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	}
	
else {
	player SideChat "You do not have enough money!";
	};