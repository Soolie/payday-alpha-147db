
_cost = 500;





_loc1 = _this select 0;

_loc1 = position _loc1;

_newBox = nearestObject [_loc1, "Box_IND_Ammo_F"];


if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newBox addWeaponCargoGlobal ["hgun_ACPC2_F" , 1];
	_newBox addMagazineCargoGlobal ["9Rnd_45ACP_Mag" , 3];


	player SideChat "Item purchased";
	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];

 
	}
	
else {
	player SideChat "You do not have enough money!";
	};