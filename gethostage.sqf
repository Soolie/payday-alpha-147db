_hostage = _this select 0;

_id = _this select 2;

if (Alive _hostage) then {

if (playerSide == West) then {

[_hostage] join player;

} else {

_rand = round (random 2); //0, 1, 2

if (_rand == 0) then {

	[_hostage] join player;
}

else{
	player SideChat "Civilian Resisted!";
	_hostage removeAction _id; 
	
	if (_rand == 1) then 
		{
		sleep 10; 
		
		//_nearestCity = nearestLocation [position _hostage, "NameCity"];
		
		_coord = mapGridPosition _hostage;
		COPserverMsg = format ["Civilian distress call at grid %1", _coord];
			
		publicVariable "COPserverMsg"; 
		
		COPserverMsg call MP_COPserverMsg; 
		
		};
	
	
	if (_rand == 2) then 
		{
		_hostage addMagazines ["11Rnd_45ACP_Mag", 5];
		_hostage AddWeapon "hgun_Pistol_heavy_01_F";
		_hostage doTarget player;
		_hostage setCombatMode "RED";
		};
		
};

};

}else{ //dead hostage

player SideChat "Civilian is Dead!";
_hostage removeAction _id;
};