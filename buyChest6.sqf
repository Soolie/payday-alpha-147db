
_cost = 12000;


_loc1 = _this select 0;

_pos1 = position _loc1;

_newBox = nearestObject [_pos1, "Box_IND_Ammo_F"];


if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	player addHeadgear "H_HelmetSpecB_paint1";

	player SideChat "Item purchased";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	}
	
else {
	player SideChat "You do not have enough money!";
	};