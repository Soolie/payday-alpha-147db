_spawnGuy = _this select 0;


_pos1 = position _spawnGuy;

_pos2 = _pos1 select 1; 

_pos2 = (_pos2 - 8);

_pos1 set [1, _pos2];

_id = _this select 2;



_cost = 1200;



if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newveh = createVehicle ["C_Rubberboat", _pos1,[],0,"NONE"];
//	[_newveh, "MP_Lock", true, true] spawn BIS_fnc_MP;
	_newveh setVariable ["locked", 0, true];
	_newveh setVariable ["owner", player, true];
	player SideChat "Vehicle created";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	}
	
else {
	player SideChat "You do not have enough money!";
	};