
_copspawnGuy = _this select 0;


_pos1 = position _copspawnGuy;

_pos2 = _pos1 select 0; 

_pos2 = (_pos2 - 5);

_pos1 set [0, _pos2];

_id = _this select 2;


if (!canMove FreeVeh) then {

	freeVeh = createVehicle ["C_SUV_01_F", _pos1,[],0,"NONE"];
	[freeVeh, "MP_Lock", true, true] spawn BIS_fnc_MP;
	freeVeh setVariable ["locked", 1, true];
	freeVeh setVariable ["owner", player, true];
	
	clearWeaponCargoGlobal freeVeh;
	clearItemCargoGlobal freeVeh;
	clearMagazineCargoGlobal freeVeh;
	player SideChat "Vehicle created";

	
}else{

	player SideChat "You already have a free vehicle!";

	
};