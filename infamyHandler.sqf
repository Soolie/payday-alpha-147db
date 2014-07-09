

_bodyCount = 0;

_infamyLevel = 0;

player sideChat "Infamy Handler!";

_bodyCountOrig = 0;


if (playerSide == EAST) then 
{



while {true} do {

_bodyCount = player getVariable ["bodyCount", 0];

if (_bodyCountOrig != _bodyCount) then {playerKilledGuard = 1;};

_bodyCountOrig = _bodyCount;

if (_bodyCount > 0 AND _bodyCount < 5 AND _infamyLevel != 1 ) then   //level 1 infamy
	{
		_infamyLevel = 1;
		player setVariable ["infamy", 1, true];
		player sideChat "Infamy increased to Level 1!";
		
		
	};
	
if (_bodyCount >= 5 AND _bodyCount < 10 and _infamyLevel != 2) then  //level 2 infamy
	{
		_infamyLevel = 2;
		player setVariable ["infamy", 2, true];
		player sideChat "Infamy increased to Level 2!";
	
	};

if (_bodyCount >= 10 AND _bodyCount < 15 AND _infamyLevel != 3) then  //level 3 infamy
	{
		_infamyLevel = 3;
		player setVariable ["infamy", 3, true]; 
		player sideChat "Infamy increased to Level 3!";
		_randCopSpawn = ["cop6", "cop7"] call BIS_fnc_selectRandom;
		_randCopSpawnPOS = getMarkerPos _randCopSpawn;

		player sideChat "Rumor has it some police are looking for you!";
		_reinforcementgroup = createGroup resistance;
					
		_guy1 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy2 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy3 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy4 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		
	
		_car1 = createVehicle ["C_SUV_01_F", _randCopSpawnPOS, [], 10, "NONE"];
		_car1 lock 2;
		
	_guy1 moveInDriver _car1;
	_guy1 assignAsDriver _car1;
	_guy2 moveInCargo _car1;
	_guy2 assignasCargo _car1;
	_guy3 moveInCargo _car1;
	_guy3 assignasCargo _car1;
	_guy4 moveInCargo _car1;
	_guy4 assignasCargo _car1;	
	
	{
	removeAllWeapons _x;
	removeVest _x;
	
	
	_x addMagazines ["30Rnd_9x21_Mag", 6];
	_x AddWeapon "SMG_02_F";

	//	_x addMagazines ["30Rnd_65x39_caseless_green", 6];
	//_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
	//_x addMagazines ["UGL_FlareWhite_F" , 3];
	//_x AddWeapon "arifle_Katiba_GL_F";
	
		_x addEventHandler ["killed",

	{ 
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		_dead = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _dead;
		
	} ];
	
	}forEach units _reinforcementgroup;
	
		_wpRobbery = _reinforcementgroup addWaypoint [position player, 150];
		
		_reinforcementgroup reveal player;
		units _reinforcementgroup commandTarget player;	
		
		
		_wpRobbery setWaypointType "UNLOAD"; 
		_wpRobbery setWaypointSpeed "FULL";
		_wpRobbery2 = _reinforcementgroup addWaypoint [position player, 0];
		
		_wpRobbery2 setWaypointType "SAD"; 	
				
		_wpRobbery3 = _reinforcementgroup addWaypoint [position _car1, 0];
		
		_wpRobbery3 setWaypointType "GETIN"; 	
		
		_wpHome = _reinforcementgroup addWaypoint [_randCopSpawnPOS, 15];
		
		_wpHome setWaypointType "MOVE"; 
		
		_reinforcementgroup setCurrentWaypoint _wpRobbery;
	};

if (_bodyCount >= 15 AND _bodyCount < 20 AND _infamyLevel != 4) then  //level 4 infamy
	{
		_infamyLevel = 4;
		player setVariable ["infamy", 4, true];
		player sideChat "Infamy increased to Level 4!";
		player sideChat "Rumor has it some SWAT are looking for you!";
		_randCopSpawn = ["cop6", "cop7"] call BIS_fnc_selectRandom;
		_randCopSpawnPOS = getMarkerPos _randCopSpawn;
		_reinforcementgroup = createGroup resistance;
					
		_guy1 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy2 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy3 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy4 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		
	
		_car1 = createVehicle ["B_MRAP_01_F", _randCopSpawnPOS, [], 10, "NONE"];
		_car1 lock 2;
		
	_guy1 moveInDriver _car1;
	_guy1 assignAsDriver _car1;
	_guy2 moveInCargo _car1;
	_guy2 assignasCargo _car1;
	_guy3 moveInCargo _car1;
	_guy3 assignasCargo _car1;
	_guy4 moveInCargo _car1;
	_guy4 assignasCargo _car1;	
	
	{
	removeAllWeapons _x;
	removeVest _x;
	
	
	//_x addMagazines ["30Rnd_9x21_Mag", 6];
	//_x AddWeapon "SMG_02_F";
	_x reveal player;
	_x doTarget player;	
	_x setBehaviour "COMBAT";
	
		_x addMagazines ["30Rnd_65x39_caseless_green", 6];
	_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
	_x addMagazines ["UGL_FlareWhite_F" , 3];
	_x AddWeapon "arifle_Katiba_GL_F";
	
			_x addEventHandler ["killed",

	{ 
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		_dead = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _dead;
		
	} ];
			
	}forEach units _reinforcementgroup;
	
		_wpRobbery = _reinforcementgroup addWaypoint [position player, 150];
		
		_reinforcementgroup reveal player;
		units _reinforcementgroup commandTarget player;	
		
	
		
		_wpRobbery setWaypointType "UNLOAD"; 
		_wpRobbery setWaypointSpeed "FULL";
		_wpRobbery2 = _reinforcementgroup addWaypoint [position player, 0];
		
		_wpRobbery2 setWaypointType "SAD"; 	
				
		_wpRobbery3 = _reinforcementgroup addWaypoint [position _car1, 0];
		
		_wpRobbery3 setWaypointType "GETIN"; 	
		
		_wpHome = _reinforcementgroup addWaypoint [_randCopSpawnPOS, 15];
		
		_wpHome setWaypointType "MOVE"; 
		
		_reinforcementgroup setCurrentWaypoint _wpRobbery;
	};

if (_bodyCount >= 20 AND _infamyLevel != 5) then   //level 5 (max) infamy

	{
		_infamyLevel = 5;
		player setVariable ["infamy", 5, true];
		player sideChat "Infamy increased to Level 5!";
		player sideChat "Rumor has it some Special Forces are looking for you!";
				_randCopSpawn = ["cop6", "cop7"] call BIS_fnc_selectRandom;
		_randCopSpawnPOS = getMarkerPos _randCopSpawn;
		
	_reinforcementgroup = createGroup resistance;
	_pilotGroup = createGroup resistance;
	
	_heli = createVehicle ["B_Heli_Transport_01_F", _randCopSpawnPOS, [], 10, "FLY"];  
	_heli allowDamage False;
	_heli lock 2;
					
	_guy1 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy2 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy3 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy4 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy5 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy6 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	_guy7 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
	
		{
	removeAllWeapons _x;
	//removeVest _x;
	
	
	//_x addMagazines ["30Rnd_9x21_Mag", 6];
	//_x AddWeapon "SMG_02_F";
	_x reveal player;
	_x doTarget player;	
	_x setBehaviour "COMBAT";
	
		_x addMagazines ["30Rnd_65x39_caseless_green", 6];
	_x addMagazines ["1Rnd_HE_Grenade_shell", 2];
	_x addMagazines ["UGL_FlareWhite_F" , 3];
	_x AddWeapon "arifle_Katiba_GL_F";
	
			_x addEventHandler ["killed",

	{ 
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		_dead = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _dead;
		
	} ];
			
	}forEach units _reinforcementgroup;
	
	_guy1 assignasDriver _heli;
	_guy1 moveInDriver _heli;
	_guy1 allowDamage False;
	_guy1 disableAI "anim";
		
		
	_guy2 moveInCargo _heli;
	_guy2 assignasCargo _heli;
	_guy2 setUnitRank "SERGEANT";
		
	_guy3 moveInCargo _heli;	
	_guy3 assignasCargo _heli;		
	_guy4 moveInCargo _heli;
	_guy4 assignasCargo _heli;
	_guy5 moveInCargo _heli;
	_guy5 assignasCargo _heli;
	_guy6 moveInCargo _heli;
	_guy6 assignasCargo _heli;
	_guy7 moveInCargo _heli;
	_guy7 assignasCargo _heli;
		

		//_positionLZ = position player findEmptyPosition [150, 200, "B_Heli_Light_01_F"];
		
		_waypointLZ = _reinforcementgroup addWaypoint [position player, 600];
		_waypointLZ setWaypointSpeed "FULL";
		_waypointLZ setWaypointType "UNLOAD"; 
		
		_wpRobbery2 = _reinforcementgroup addWaypoint [position player, 0];
		
		_wpRobbery2 setWaypointType "SAD"; 	
		
		_waypointLZreturn = _reinforcementgroup addWaypoint [position _heli, 0];
				
		_waypointLZreturn setWaypointType "GETIN"; 
		
			
		_wpHome = _reinforcementgroup addWaypoint [_randCopSpawnPOS, 15];
		
		_wpHome setWaypointType "MOVE"; 
		
		_reinforcementgroup setCurrentWaypoint _waypointLZ;
	
	};

sleep 10;
};



	

		

};