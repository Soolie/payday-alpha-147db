
_cost = 100;

_loc1 = _this select 0;

_loc1 = position _loc1;




if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	[[player,"U_C_Poloshirt_blue"], "MP_addUniform", true, true] spawn BIS_fnc_MP;

		
	player SideChat "Item purchased";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];

	
	}
	
else {
	player SideChat "You do not have enough money!";
	};