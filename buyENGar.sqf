
_cost = 3000;





_loc1 = _this select 0;

_loc1 = position _loc1;

_newBox = nearestObject [_loc1, "Box_IND_Ammo_F"];


if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newBox addWeaponCargoGlobal ["arifle_Katiba_ARCO_F" , 1];
	_newBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_green" , 4];
	
	player SideChat "Item purchased";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];


	}
	
else {
	player SideChat "You do not have enough money!";
	};