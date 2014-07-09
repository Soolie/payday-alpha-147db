
	bank1pos = getMarkerPos "bank1";
	bank2pos = getMarkerPos "bank2";
	

	MP_clearItems = {
	clearWeaponCargoGlobal _this;
	clearItemCargoGlobal _this;
	clearMagazineCargoGlobal _this;
	clearBackPackCargoGlobal _this;
	};
	
	MP_clearWeaponCargo = {
	
	clearWeaponCargoGlobal _this;
	};

	MP_createDeathCrate = {
	
	_crate = _this select 0;
	_phoneCount = _this select 1;
	_laptopCount = _this select 2;
	_camCount = _this select 3;
	
	_crate addAction ["<t color='#00ffff'>Take</t>", {
		
		//actions for civ
		_crate = _this select 0;
		_phoneCount = _this select 3 select 0;
		_laptopCount = _this select 3 select 1;
		_camCount = _this select 3 select 2;
		deleteVehicle _crate;
		playerCams = playerCams + _camCount;
		playerPhones = playerPhones + _phoneCount;
		PlayerLaptops = PlayerLaptops + _laptopCount;
		player sideChat "You picked up a crate!"; 
	
		player sideChat format ["You now have %1 cameras, %2 phones, and %3 laptops.", playerCams, playerPhones, PlayerLaptops]; 
		
	
	},[_phoneCount,_laptopCount,_camCount],99,false,false,"",' playerSide == east '];
	
	
	_crate addAction ["<t color='#00ff00'>Take Evidence</t>",{
	
	//actions for police
	_crate = _this select 0;
	_phoneCount = _this select 3 select 0;
	_laptopCount = _this select 3 select 1;
	_camCount = _this select 3 select 2;
	deleteVehicle _crate;

	_camCost = 250;

	_phoneCost = 150;

	_laptopCost = 500;

	_moneyFenced = 0;

	player sideChat "You picked up a crate as evidence!"; 
		
	_camMoney =  (_camCount * _camCost);

	_phoneMoney = (_phoneCount * _phoneCost);

	_laptopMoney = (_laptopCount * _laptopCost);
	
	_moneyFenced = _moneyFenced + _laptopMoney + _phoneMoney + _camMoney;
	
	player sideChat format ["Evidence collected got you a bonus of %1",_moneyFenced];

	playerBank = playerBank + _moneyFenced;

	player sideChat format ["Bank money is now %1",playerBank];
	
	},[_phoneCount,_laptopCount,_camCount],99,false,false,"",' playerSide == west '];
	
	};
	
	MP_createSafeActions = {    //[_newSafe, _randMoney, _randDiff]
	
	_safe = _this select 0;
	_value = _this select 1;
	_diff = _this select 2;
	
	//hint "MPcreatesafeactions running";
	
	_safe addAction ["<t color='#00ffff'>Drill Safe</t>", "drillSafe.sqf",[_value, _diff],99,false,false,"",' playerSide == east '];
	_safe addAction ["<t color='#ff0000'>Blow Safe</t>","blowSafe.sqf",[_value, _diff],100,false,false,"",' (("DemoCharge_Remote_Mag" in Magazines Player) AND (playerClass == 7)) '];
	
	};

	


 if (isServer) then {  //server-side commands 
 
	hint "loading server functions ";
	


	MP_spawnReinforcements = {
	
	_randCopSpawn = ["cop6", "cop7"] call BIS_fnc_selectRandom;
	_randCopSpawnPOS = getMarkerPos _randCopSpawn;
	
	_mapmarker  = _this;
	
	_position = getMarkerPos _mapmarker;
	_result = bank1pos - _position;   //subtract arrays if 0 then its a bank
	_result2 = bank2pos - _position;
	
	_bankjob = 0;
	_newvehs = 0;
	

				
	if ((count _result == 0) OR (count _result2 == 0)) then {_bankjob = 1;};
	
	
		
	
	
	COPserverMsg = format ["alarm sounding at %1", _mapmarker];
			
	publicVariable "COPserverMsg"; 
		
	COPserverMsg call MP_COPserverMsg; 
	

		
	if (_bankjob == 1) then 	
		{
	//		player sideChat format ["creating heligroup at %1", _randCopSpawn];
			_positionLZ = _position findEmptyPosition [0, 200, "I_Heli_light_03_unarmed_F"];
		
	
	
		
		_newvehs = 0;
		_newvehs = count nearestObjects [getMarkerPos "cop6", ["I_Heli_light_03_unarmed_F"], 100];
		_newvehs = _newvehs + count nearestObjects [getMarkerPos "cop7", ["I_Heli_light_03_unarmed_F"], 100];
	
		if (_newvehs < 1  ) then {
		
	//	player sideChat "creating heligroup group";
		_heligroup = createGroup resistance;
					
		_guy1 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy2 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy3 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy4 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy5 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy6 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy7 =  _heligroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		
		
	//player sideChat "removing  heligroup weapons";
	{
	removeAllWeapons _x;
	removeVest _x;
	
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
		_guard = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
		
	} ];
			
	}forEach units _heligroup;
	
	//	player sideChat "moving heligroup men";
		
		_heli = createVehicle ["B_Heli_Light_01_F", _randCopSpawnPOS, [], 10, "FLY"];  
		_heli allowDamage False;
		_heli lock 2;
		
		
		
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
		
	//	player sideChat "creating  heligroup waypoints";
		
		_wpRobbery = _heligroup addWaypoint [_positionLZ, 150];
		_wpRobbery setWaypointSpeed "FULL";
		
		_wpRobbery setWaypointType "UNLOAD"; 
		
		_wpRobbery2 = _heligroup addWaypoint [_position, 0];
		
		_wpRobbery2 setWaypointType "SAD"; 		
		
		_wpRobbery3 = _heligroup addWaypoint [position _heli, 0];
		
		_wpRobbery3 setWaypointType "GETIN"; 	
		
		_wpHome = _heligroup addWaypoint [_randCopSpawnPOS, 15];
		
		_wpHome setWaypointType "MOVE"; 
		
	//	_heligroup setCurrentWaypoint _wpRobbery;
		
		//player sideChat format ["Special Reinforcements inbound to %1", _mapmarker];
		} else
		
		{
		hint "reinforcements have been recently spawned";
		};
	};
	
	_newvehs = 0;
	_newvehs = count nearestObjects [getMarkerPos "cop6", ["I_MRAP_03_hmg_F"], 50];
	_newvehs = _newvehs + count nearestObjects [getMarkerPos "cop7", ["I_MRAP_03_hmg_F"], 50];
	
	if (_newvehs < 4  ) then 
	{
		
	
		_reinforcementgroup = createGroup resistance;
					
		_guy1 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy2 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy3 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		_guy4 =  _reinforcementgroup createUnit ["I_Soldier_02_F", _randCopSpawnPOS, [], 10, "NONE"];
		
	
		_car1 = createVehicle ["I_MRAP_03_hmg_F", _randCopSpawnPOS, [], 10, "NONE"];
		_car2 = createVehicle ["I_MRAP_03_hmg_F", _randCopSpawnPOS, [], 10, "NONE"];
		_car1 lock 2;
		_car2 lock 2;
		
		_guy1 moveInDriver _car1;
		_guy2 moveInDriver _car2;
		_guy3 moveInGunner _car1;
		_guy4 moveInGunner _car2;
		
			{

	removeAllWeapons _x;
	removeVest  _x;
	
	_x addMagazines ["30Rnd_9x21_Mag", 6];
	_x AddWeapon "SMG_02_F";
	
			_x addEventHandler ["killed",

	{ 
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		_guard = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
		
	} ];
	
		
	}forEach units _reinforcementgroup;
				
		
		
		_wpRobbery = _reinforcementgroup addWaypoint [_position, 15];
		
		_wpRobbery setWaypointType "MOVE"; 
		_wpRobbery setWaypointSpeed "FULL";
		
		_wpHome = _reinforcementgroup addWaypoint [_randCopSpawnPOS, 15];
		
		_wpHome setWaypointType "MOVE"; 
		
		_wpfarpatrol = _reinforcementgroup addWaypoint [getMarkerPos "cop6", 15];
		
		_wpfarpatrol setWaypointType "MOVE"; 
		
		_wpfarpatrol2 = _reinforcementgroup addWaypoint [getMarkerPos "cop7", 15];
		
		_wpfarpatrol2 setWaypointType "CYCLE"; 
			
		_reinforcementgroup setCurrentWaypoint _wpRobbery;
		
	//	player sideChat format ["Reinforcements inbound to %1", _mapmarker];
		} else
		
		{
		hint "reinforcements have been recently spawned";
		};
	 
	
};	//end MP_spawnReinforcements	
	
	    spawnReinforcements  = "";
		"spawnReinforcements" addPublicVariableEventHandler {(_this select 1) call MP_spawnReinforcements };
		
		hint "server functions loaded";
	
};  //end server


if (!isDedicated) then {  //non-Dedicated (client) commands

		hint "loading client functions ";
		
		MP_Lock = {
		_target = _this;
		_target setVariable ["locked", 1, true];
		_target lock true;
		};
		
		MP_Unlock = {
		_target = _this;
		_target setVariable ["locked", 0, true];
		_target lock false;
		};
		
		MP_skipTime = {
		
			_variable = _this;
			
			skipTime _variable;
		
		}; 
		
		
		MP_Paint = {
		
		_vehicle = _this select 0;
		
		_texture = _this select 1;
		
	
		_vehicle setObjectTexture [0,_texture];
		
		true;
		
		};
/*			MP_createGlobalTerrorShop = {
	_shop = _this;
	_shop execVM "terrorshop.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalTerrorShop = [];
    "createGlobalTerrorShop" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalTerrorShop}; */
	
		MP_GangMarker = {
		
		_position = _this select 0;
		_group = _this select 1;
		_hideoutMarkerName =  _this select 2;
		_hideoutMarkerText =  _this select 3;
		
		if (group player == _group) then {
	
		_hideoutMarker = createMarkerLocal[_hideoutMarkerName, _position];
		_hideoutMarker setMarkerShapeLocal "ICON";
		_hideoutMarker setMarkerTextLocal _hideoutMarkerText;
		_hideoutMarker setMarkerTypeLocal "hd_start";
		
		_hideoutMarker;	
		};
		};
		
		createGlobalTerrorShop = [];
		"createGlobalTerrorShop" addPublicVariableEventHandler {[_this select 1, _this select 2] call MP_createGlobalTerrorShop};
		
		MP_Detain = {
		
		_target = _this;
		
		if (player == _target) then {
		player SideChat "Detained!";
		_player = player;
		[[_player,"AmovPercMstpSnonWnonDnon_Ease"], "MP_syncAnim", true, true] spawn bis_fnc_mp;
		
		player enableSimulation false;
		player setVariable ["stunned", 0, true];
		player setVariable ["detained", 1, true];
		};
		};
		
		MP_Release = {
		
		_target = _this;
		if (player == _target) then {
		
		player SideChat "Released!";
		_player = player;
		[[_player,""],"MP_syncAnim", true, true] spawn bis_fnc_mp;
		player enableSimulation true;
		player setVariable ["stunned", 0, true];
		player setVariable ["detained", 0, true];
		};
		};
		
		MP_Arrest = {
		_target = _this;
		//player sideChat format ["mp_arrest target is %1", _target];
		
		
		if (player == _target) then {
		
		player SideChat "Arrested!";
		_player = player;
		[[_player,""],"MP_syncAnim", true, true] spawn bis_fnc_mp;
		player enableSimulation true;
		player setVariable ["stunned", 0, true];
		player setVariable ["detained", 0, true];
		
		player setVariable ["infamy", 0, true];
		player setVariable ["bodyCount", 0, true];  //reset to 0 when you are arrested.
		
		removeHeadgear player:
		removeGoggles player;
		removeVest player;
		removeBackpack player;
		removeUniform player;
		removeAllWeapons player:
		removeAllAssignedItems player;

		player addbackpack "B_Bergen_Base";
		player additem "ItemRadio";
		player assignItem "ItemRadio";
		player additem "ItemMap";
		player assignItem "ItemMap";
	
		player setPos getMarkerPos "jail";
		
				detecteddrillingsafe = 0;
				PlayerblewSafe = 0;
				detectedneargenerator = 0;
				playerHasKeycard = 0;
				PlayerKilledGuard = 0;
				playerHasGold = 0;
				playerPhones = 0;
				playerLaptops = 0;
				playerCams = 0;	
				_value = playerMoney;

				if (_value != 0) then {

				_value execVM "dropmoney.sqf"; 

				};
				
				player addUniform "U_OG_Guerilla2_1"; 
		
			};
		};
		
		MP_hit = {//Passed array: [unit, selectionName, damage, source, projectile]


_unit = _this select 0;

_dmg = _this select 2;

_causedBy = _this select 3;

_projectile = _this select 4;



if (( currentWeapon _causedBy  == "hgun_P07_F" ) AND (_projectile == "B_9x21_Ball")) then {  //"hgun_P07_F"

[] spawn MP_stunned;

_dmg = 0;

};

if (_projectile == "") then //caused by falling or environment/impact damage
{

		if (playerClass == 6) then {
		_currentDmg = damage _unit;
		
		_dmg = (_dmg * 0.065);
		
		_dmg = _currentDmg + _dmg;


		} else {
		_currentDmg = damage _unit;
		
		_dmg = (_dmg * 0.13);
		
		_dmg = _currentDmg + _dmg;
		};

};

_dmg;

};
	MP_syncAnim = {
			
		_object = _this select 0;
		_anim = _this select 1;
			
	
		_object switchMove _anim;
	
	};


	MP_stunned = {
	
	_stunduration = 15;

	_Isstunned = player getVariable "stunned";

	if (_Isstunned == 0) then {

	player SideChat format ["Stunned for %1!", _stunduration];
	
	_weaponClass = currentWeapon player; //drop guns
	
	if (_weaponClass != "") then {
	
		player removeWeapon  _weaponClass;
		
		_holder = "groundWeaponHolder" createVehicle position player; 

		_holder addWeaponCargoGlobal [_weaponClass,1]; 

	};

	[player,"WoundedGuyB_06"] call fn_netSay3D;  

	//player switchMove "AidlPpneMstpSnonWnonDnon_AI";
	_player = player;
	[[_player,"AidlPpneMstpSnonWnonDnon_AI"], "MP_syncAnim", true, true] spawn bis_fnc_mp; //sync anims

	player setVariable ["stunned", 1, true];

	player enableSimulation false;

	sleep _stunduration;

	player setVariable ["stunned", 0, true];

	player enableSimulation true;

	};

	};//end MP_stunned


		
		fn_netSay3D = compile preprocessFileLineNumbers "fn_netSay3D.sqf";

		if (isNil "MP_netSay3D") then {
			MP_NetSay3D = [objNull,0];
		};

		"MP_netSay3D" addPublicVariableEventHandler {
		private["_array"];
		_array = _this select 1;
		(_array select 0) say3D (_array select 1);
		};  
		
	MP_addUniform = { 
	
	
	_unit = _this select 0;
	_uniformAmmo = uniformMagazines  _unit;
	_uniformItems = uniformItems _unit;
		
    _uniformString = _this select 1;
	
 	_unit forceAddUniform  _uniformString;
	_unit addItemToUniform _uniformAmmo;
	_unit addItemToUniform _uniformItems;
	
    
	};
		
		
		fn_KeyHandler = {
	
		private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey"];
		_ctrl = _this select 0;
		_code = _this select 1;
		_shift = _this select 2;
		_ctrlKey = _this select 3;
		_alt = _this select 4;
		_handled = false;



		switch (_code) do
		{

			//Y Player Menu
			case 21:
			{
				if(!_alt && !_ctrlKey && !dialog) then
				{

							
							createDialog "dropMoney";
							waitUntil {!isNull (findDisplay 50020) && {dialog}};
								{
								_ctrl = _x select 0;
								_text = _x select 1;
							((uiNamespace getVariable "dMoney") displayCtrl _ctrl) ctrlSetText format ["%1", _text]; 
							} forEach [
									[1003, playerMoney],
									[1004, playerBank]
							];  
				
				};
			};
			
			// backslash -- default is salute, going to override as surrender action
			case 43:
			{
				if(!_alt && !_ctrlKey && !dialog) then
				{
					execVM "surrender.sqf";
								
				};  
				

				
			};
		};
			
		_handled;	
	};	
		
	MP_dropMoney = { 
	
		_display = finddisplay 50020;
		_ctrl = _display displayctrl 50020;

		disableSerialization;
		

		
		
		

		
		_valuestr = ctrlText _ctrl;
		
		_value = parseNumber _valuestr;
		
		if ((_value > 0 ) AND (playerMoney >= _value)) then {
		
		
		_cashpile = createVehicle ["Land_Money_F", position player,[],0,"CAN_COLLIDE"];
		
		[[_cashpile, _value], "MP_takeCash", true, true] spawn BIS_fnc_MP;
		
		playerMoney = playerMoney - _value;
		
		player sideChat format ["You dropped %1", _value];
		
		closedialog 0;
		
		}
		
		else { player sideChat "You don't have that much!";
				closedialog 0;};
		
	}; //end MP dropmoney	
	
		MP_deposit = { 
		disableSerialization;
		
		_display = finddisplay 50040;
		_ctrl = _display displayctrl 50040;
		
		_valuestr = ctrlText _ctrl;
		
		_value = parseNumber _valuestr;
		
		if ((_value > 0 ) AND (playerMoney >= _value)) then {
		
		playerBank = playerBank + _value;
		
		playerMoney = playerMoney - _value;
		
		bankWrite = [player, playerBank];
		
		if (isServer) then {	bankWrite call MP_serverBankWrite;  };  //forserver?
				 
		publicVariableServer "bankWrite";
		
		player sideChat format ["You deposited %1", _value];
		
		closedialog 0;
		
		}
		
		else { player sideChat "You don't have that much!";
				closedialog 0;};
		
	}; //end MP deposit
	
		MP_withdraw = { 
		disableSerialization;
		
		_display = finddisplay 50030;
		_ctrl = _display displayctrl 50030;
		
		_valuestr = ctrlText _ctrl;
		
		_value = parseNumber _valuestr;
		
		if ((_value > 0 ) AND (playerBank >= _value)) then {
		
		playerMoney = playerMoney + _value;
		
		playerBank = playerBank - _value;
		
		bankWrite = [player, playerBank];
		if (isServer) then {	bankWrite call MP_serverBankWrite;  };  //forserver?
		publicVariableServer "bankWrite";		
		
		player sideChat format ["You withdrew %1", _value];
		
		closedialog 0;
		
		}
		
		else { player sideChat "You don't have that much!";
				closedialog 0;};
		
	}; //end MP_withdraw

    MP_createAlarm = {	//params [_AlarmMarker, _group, _jobname, _jobtype]

		_location = _this select 0;
		_group = _this select 1;
		_jobname = _this select 2;
		_jobtype = _this select 3;

		_nopeoplealive = 0;
		_attemptsoundalarm = 0;
		
		_position = getmarkerPos _location;
		
		_activealarms = 1;	
		
		
		//time to kill all the AI before they "hit the alarm" .  do not set to 0 or will cripple performance
		_cooldown2 = 14; 

		
		_behaviour = "SAFE";

		_group setBehaviour "SAFE";
		
		sleep 1;		
		
		//get nearest generator and add disable alarm command to it
		
		

		 //begin alarm loop
		 
		while { _activealarms != 0 } do { 

			_activealarms = count nearestObjects [_position, ["Land_Portable_generator_F"], 30];
	
			_leader = leader _group;
	
			_behaviour = behaviour _leader;
		
			if ((_behaviour != "SAFE") AND ((_group knowsAbout player) >= 1.5)) then { 
	
				_attemptsoundalarm = 1;

				sleep _cooldown2;
		
				_activealarms = count nearestObjects [_position, ["Land_Portable_generator_F"], 30];
		
				{if (alive _x) then 
					{
					_nopeoplealive = _nopeoplealive + 1;
					}; 
				} foreach units _group; //checks how many in _group are alive

				if  ((_nopeoplealive > 0) AND (_attemptsoundalarm > 0) AND (_activealarms != 0) ) then //people alive have successfully activated the alarm
					{
					
					_generator = nearestObject [_position, "Land_Portable_generator_F"]; 
								
					[_generator, "Alarm_Independent"] call fn_netSay3D;  
					
											
					spawnReinforcements = _location;
			
					publicVariableServer "spawnReinforcements"; 
					
					if ( isServer ) then {_location call MP_spawnReinforcements};
										
					_activealarms = 0;
					}else//else nobody tried to sound alarm, or they're all dead, or generator is gone by now
					{
 					_activealarms = 0;
					};					
				}; 
			
				sleep 5;
			
		}; //end while loop 
		
		waitUntil {sleep 10;
		((count nearestObjects [_position, ["Box_IND_Support_F"], 80]) == 0) }; 
		
		deleteMarker _location;
	
		player sideChat format ["%1 removed", _jobname];
			
}; //end MP_createAlarm

MP_createSupplyAlarm = {	//params [_AlarmMarker, _group, _jobname, _jobtype]

		_location = _this select 0;
		_group = _this select 1;
		_jobname = _this select 2;
		_jobtype = _this select 3;

		_nopeoplealive = 0;
		_attemptsoundalarm = 0;
		
		_position = getmarkerPos _location;
		
		_activealarms = 1;	
		
		
		//time to kill all the AI before they "hit the alarm" .  do not set to 0 or will cripple performance
		_cooldown2 = 14; 

		
		_behaviour = "SAFE";

		_group setBehaviour "SAFE";
		
		sleep 1;		
		
		//get nearest generator and add disable alarm command to it
		
		

		 //begin alarm loop
		 
		while { _activealarms != 0 } do { 

			_activealarms = count nearestObjects [_position, ["Land_Portable_generator_F"], 30];
	
			_leader = leader _group;
	
			_behaviour = behaviour _leader;
		
			if ((_behaviour != "SAFE") AND ((_group knowsAbout player) >= 1.5)) then { 
	
				_attemptsoundalarm = 1;

				sleep _cooldown2;
		
				_activealarms = count nearestObjects [_position, ["Land_Portable_generator_F"], 30];
		
				{if (alive _x) then 
					{
					_nopeoplealive = _nopeoplealive + 1;
					}; 
				} foreach units _group; //checks how many in _group are alive

				if  ((_nopeoplealive > 0) AND (_attemptsoundalarm > 0) AND (_activealarms != 0) ) then //people alive have successfully activated the alarm
					{
					
					_generator = nearestObject [_position, "Land_Portable_generator_F"]; 
								
					[_generator, "Alarm_Independent"] call fn_netSay3D;  
					
											
					spawnReinforcements = _location;
			
					publicVariableServer "spawnReinforcements"; 
		
					if (isServer) then {_location call MP_spawnReinforcements};
					
					_activealarms = 0;
					}else//else nobody tried to sound alarm, or they're all dead, or generator is gone by now
					{
 					_activealarms = 0;
					};					
				}; 
			
				sleep 5;
			
		}; //end while loop 
		
		waitUntil {sleep 10;
		((count nearestObjects [_position, ["Land_SurvivalRadio_F"], 60]) == 0) }; 
		
		deleteMarker _location;
	
		player sideChat format ["%1 removed", _jobname];
			
}; //end MP_createSupplyAlarm
 
    MP_hostageTrigger = {
	_civ = _this;
	_civ addAction ["<t color='#00ff00'>Rob</t>", "robhostage.sqf",false,0,false,false,"", ' ((currentWeapon player != "") or (primaryWeapon player != "") or (secondaryWeapon player != "")) AND (playerSide == east) '];
	
	_civ addAction ["<t color='#ff0000'>Take Hostage</t>", "gethostage.sqf",false,0,false,false,"", ' ((currentWeapon player != "") or (primaryWeapon player != "") or (secondaryWeapon player != "")) AND (playerSide == east) '];
	
	_civ addAction ["Direct Hostage", "gethostage.sqf",false,0,false,false,"", ' playerSide == WEST '];
	};


	
     MP_storeTrigger = {
	 
	_pay = 1500;
	_metersToGetPaid = 90;
	
	_storearray = _this select 0;
	_location = _this select 1;  //map marker string
	_jobname = _this select 2;	
	

	_store1 = _storearray select 0;
	
	_position1 = getMarkerPos _store1;
		
	_store1 = nearestObject [_position1, "House"];

	
	
	_store2 = _storearray select 1;
	
	_position2 = getMarkerPos _store2;
		
	_store2 = nearestObject [_position2, "House"];
	
	
	
	_store3 = _storearray select 2;
	
	_position3 = getMarkerPos _store3;
		
	_store3 = nearestObject [_position3, "House"];
	
	
	
	_store4 = _storearray select 3;
	
	_position4 = getMarkerPos _store4;
		
	_store4 = nearestObject [_position4, "House"];
	
	_store1 setDamage 0;
	
	sleep 0.1;
	
	_store2 setDamage 0;
	sleep 0.1;
	
	_store3 setDamage 0;
	sleep 0.1;
	
	_store4 setDamage 0;
	sleep 0.1;
	
	
	
	sleep 10;
	
	waitUntil{
		sleep 10;
		((getDammage _store1 != 0) OR (getDammage _store2 != 0) OR (getDammage _store3 != 0) OR (getDammage _store4 != 0)) };  
		
	if (((player distance _store1) < _metersToGetPaid) and (PlayerSide == east)) then {
	
	playerMoney = playerMoney + _pay;
	
	player sideChat format ["Job Completed! You got %1", _pay];		
	
	};
	
	_nearestCity = nearestLocation [_position1, "NameCity"];
	
	COPserverMsg = format ["Shop owners reporting problems around %1", _nearestCity];
			
	publicVariable "COPserverMsg"; 
		
	COPserverMsg call MP_COPserverMsg; 
	
	_thisCock = nearestObject [_position1, "Land_HeatPack_F"];
	
	deleteVehicle _thisCock;
	
	deleteMarker _location;
	
	player sideChat format ["%1 removed", _jobname];	
			
}; 


    MP_medikitHeal = {
        _this addAction ["<t color='#ff0000'>Heal</t>", "heal.sqf"];
    };
    medkitDeployed = [];
    "medkitDeployed" addPublicVariableEventHandler {(_this select 1) call MP_medikitHeal};



    MP_ammobagLoad = {
    _this addMagazineCargoGlobal ["HandGrenade", 2];
	_this addMagazineCargoGlobal ["30Rnd_65x39_caseless_green" , 6];
	_this addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell" , 3];
	_this addMagazineCargoGlobal ["UGL_FlareWhite_F" , 2];
	_this addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer" , 2];
	_this addMagazineCargoGlobal ["16Rnd_9x21_Mag" , 2];


	
	
    };
    ammoLoad = [];
    "ammoLoad" addPublicVariableEventHandler {(_this select 1) call MP_ammobagLoad};




    MP_takeCash = {
	_safe = _this select 0;
	_value = _this select 1;
	_safe addAction ["<t color='#00ff00'>Take Money</t>" , "takeCash.sqf" , _value,100];
	
    };



	MP_addAction = { 
    private["_object", "_arguments"];
	
	_object = _this select 0;
    _arguments = _this select 1;
	
 
    _object addAction _arguments;
    
	};
	
	MP_removeAction = { 
  
	_object = _this select 0;
    _id = _this select 1;
	
 
    _object removeAction _id;
    
	};






    MP_serverMsg = {
	_hint = _this;
	
	player sideChat _hint;
	};
	
    serverMsg = [];
    "serverMsg" addPublicVariableEventHandler {(_this select 1) call MP_serverMsg};
	
	MP_bountyReward = { //_this = [_killer,_infamy, _player];
	
	_killer = _this select 0;
	_infamyLevel = _this select 1;
	_killed = _this select 2;
	
	if (playerSide == WEST) then {
		if (player == _killer) then {
	
			switch (_infamyLevel) do {
	
			case 1: {player sideChat "You killed a minor street thug and got a bonus of 1000!"; playerBank = playerBank + 1000; };
		
			case 2: {player sideChat "You killed a hardened criminal and got a bonus of 5,000!"; playerBank = playerBank + 5000; };
		
			case 3: {player sideChat "You killed a serious threat and got a bonus of 10,000!"; playerBank = playerBank + 10000; };
		
			case 4: {player sideChat "You killed a terrorist and got a bonus of 25,000!"; playerBank = playerBank + 25000; };
		
			case 5: {player sideChat "You killed a criminal mastermind and got a bonus of 50,000!"; playerBank = playerBank + 50000; };
		
			};
		
		};
	};
	
	if ((player == _killer) AND (HitTarget == _killed)) then {
	
		player sideChat "You killed your hit target! 25,000 deposited in your bank account";
		playerBank = playerBank + 25000; 
		playerHasHitJob = 0;
	};
	};//end bounty rewards
	
    bountyKiller = [];
    "bountyKiller" addPublicVariableEventHandler {(_this select 1) call MP_bountyReward};



    MP_COPserverMsg = {
	_hint = _this;
	if (playerSide == west) then {player sideChat _hint;};
	
	};
	
    COPserverMsg = [];
    "COPserverMsg" addPublicVariableEventHandler {(_this select 1) call MP_COPserverMsg};


    MP_createGlobalWeapShop = {
	_shop = _this;
	_shop execVM "weapshop.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalWeapShop = [];
    "createGlobalWeapShop" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalWeapShop};
	
	MP_createGlobalATM = {
	_shop = _this;
	
	_shop addAction ["Withdraw Money", "withdrawmoney.sqf"];
	//_shop execVM "atmguy.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalVehShop = [];
    "createGlobalATM" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalATM};

	MP_createGlobalVehShop = {
	_shop = _this;
	_shop execVM "vehshop.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalVehShop = [];
    "createGlobalVehShop" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalVehShop};

	MP_createGlobalTerrorShop = {
	_shop = _this;
	_shop execVM "terrorshop.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalTerrorShop = [];
    "createGlobalTerrorShop" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalTerrorShop};

	
	MP_createGlobalItemShop = {
	_shop = _this;
	_shop execVM "itemshop.sqf";
	_shop allowDamage false;
	_shop disableAI "ANIM";
	
	};
		
    createGlobalItemShop = [];
    "createGlobalItemShop" addPublicVariableEventHandler {(_this select 1) call MP_createGlobalItemShop};
};

hint "functions loaded";
