//_this = [location, min safe, max safe, min dif, max dif, min AI, max AI, min safe value, max safe value]
	
	hint "crimenet creating job";
	

	_location = _this select 0;  //should be map marker string
	_minsafe = _this select 1; 
	_maxsafe = _this select 2;
	_mindiff = _this select 3;  
	_maxdiff = _this select 4;
	_minAI = _this select 5;
	_maxAI = _this select 6;
	_minsafevalue = _this select 7;
	_maxsafevalue = _this select 8;
	_jobtype = _this select 9;
	_position = getMarkerPos _location;
	


	
	_safesdetected = count (nearestObjects [_position, ["Box_IND_Support_F"], 175]);
	
	//make sure to not double-spawn a job.
	
	if (_safesdetected == 0) then {
	
	
	
	jobnum = jobnum + 1;

	_aicounter = _minAI;
	

	_group = createGroup resistance;
	
	hint "crimenet group created";
	
	_safecounterValue = 0;
	
	_safecounterMax = round (Random _maxsafe);
	
	if (_safecounterMax < _minsafe) then {_safecounterMax = _minsafe;};
	 

	hint "crimenet creating safes";
	
	while {_safecounterValue < _safecounterMax} do {
	
	_ranNum = 0;
	_c = 0;
	
		
	_randMoney = round (random _maxsafevalue);
	if (_randMoney < _minsafevalue) then { _randMoney = _minsafevalue; };
	
	
	
	_randDiff =  _mindiff + (floor (random _maxdiff));	
	if (_randDiff > 4) then	{_randDiff = 4; };
	
	
	_house =  nearestObject [_position, "House"];
	
	//while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	
	_ranNum = round(random 24);
	
		
	_newSafe = "Box_IND_Support_F" createVehicle [0,0,0];
	
	_newSafe allowDamage false;
	
	_house setDamage 0;
	
	
		
	_newSafe setPos (_house buildingPos _ranNum);	
	
	clearWeaponCargoGlobal _newSafe;
	clearItemCargoGlobal _newSafe;
	clearMagazineCargoGlobal _newSafe;
	
	_randLoad = round (random 1); 
	
	
	switch (_randLoad) do {
	

	case 0: {
			
		//	player sideChat format ["creating safe with values %1, %2, %3", _newSafe, _randMoney, _randDiff];
			hint format ["crimenet creating safes at %1 with %2 load and %3 diff", _house, _randMoney, _randDiff];
			[[_newSafe, _randMoney, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
		
		//gold -4
		case 1: {
		
			hint format ["crimenet creating safes at %1 with gold load and %2 diff", _house, _randDiff];
			[[_newSafe, -4, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
	
	};
	
		
	sleep 0.1;

	};	

	
	hint "crimenet creating grabs";
	
	_grabcounter = 0;
	
	_maxgrabs = 2;
	
	_houseList = _position nearObjects ["House",75];
	
	if (count _houseList > 5) then {
	
		_StoredArray = [];
		
		_StoredArray = _StoredArray + [_houseList select 0];
		_StoredArray = _StoredArray + [_houseList select 1];
		_StoredArray = _StoredArray + [_houseList select 2];
		_StoredArray = _StoredArray + [_houseList select 3];
		_StoredArray = _StoredArray + [_houseList select 4];
		
		_houseList = _StoredArray;
		
	};
		
	while {_grabcounter <= _maxgrabs} do {
	
		sleep 0.1;
	{
	_c = 0;
	while { format ["%1", _x buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	if (_c > 0) then
		{
		
		_ranNum = floor(random _c);
		
		_randSeed = floor (random 3); //return 0, 1, 2 
		
		switch (_randSeed) do
		{ 
			case 0: {
					_newSafe = "Land_HandyCam_F" createVehicle [0,0,0];
							
					_newSafe allowDamage false;
					
					_newSafe setPos (_x buildingPos _ranNum);	
					
					[[_newSafe, ["<t color='#00ff00'>Take Camera</t>", "takeCam.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
					
					//player sideChat "crimenet created CAM";
		
					_grabcounter = _grabcounter + 1;
		
			
					
			}; 
						
			case 1: {		
					_newSafe = "Land_Laptop_F" createVehicle [0,0,0];
							
					_newSafe allowDamage false;
					
					_newSafe setPos (_x buildingPos _ranNum);	
					
					[[_newSafe, ["<t color='#00ff00'>Take Laptop</t>", "takeLaptop.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
					
					//player sideChat "crimenet created Laptop";
					
					_grabcounter = _grabcounter + 1;
		
			
					
			}; 
			
			case 2: {		
					_newSafe = "Land_MobilePhone_smart_F" createVehicle [0,0,0];
							
					_newSafe allowDamage false;
					
					_newSafe setPos (_x buildingPos _ranNum);	
					
					[[_newSafe, ["<t color='#00ff00'>Take Phone</t>", "takePhone.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
					
					//player sideChat "crimenet created Phone";
					
					
					_grabcounter = _grabcounter + 1;
		
			
					
			}; 

		};
		
	};

	}forEach _houseList;
};	


hint "crimenet creating AI";
	
	
	while {_aicounter <= _maxAI } do { //	hint "crimenet creating AI";
	

	_guard =  _group createUnit ["I_Soldier_02_F", _position, [], 15, "NONE"];
	removeAllItems _guard; 
	removeAllAssignedItems _guard;
	_guard unassignItem "NVGoggles_INDEP";
	_guard removeItem "NVGoggles_INDEP";
	removeAllWeapons _guard;
		removeVest  _guard;
	removeHeadGear _guard;
	_guard removeMagazines "HandGrenade";
	_guard addMagazines ["30Rnd_9x21_Mag", 6];
	_guard AddWeapon "SMG_02_F";
	_guard addEventHandler ["killed",

	{ 
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		_guard = _this select 0;
		_value = round (random 300);
		_cashpile = createVehicle ["Land_Money_F", position _guard,[],1,"CAN_COLLIDE"];
		
		[[_cashpile, _value], "MP_takeCash", true, true] spawn BIS_fnc_MP;
		
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
		
	} ];
	
	
	sleep 0.1;
	
	_aicounter = _aicounter + 1;
	
		
	};
	


	_newgenerator = createVehicle ["Land_Portable_generator_F", _position,[],10,"NONE"];  //create a generator for disabling the alarm
	
	[[_newgenerator, ["<t color='#00ffff'>Disable Alarm Gen</t>","disablegenerator.sqf",false,0,false,false,"", ' playerSide == east ']], "MP_addAction", true, true] spawn BIS_fnc_MP;
	
	if (_jobtype == "Bank Heist") then //create second generator indoors for bank
	{
	_ranNum = 0;
	_c = 0;
	
	_house =  nearestObject [_position, "House"];
	
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	
	_ranNum = round(random _c);
	
	_newgenerator2 = "Land_Portable_generator_F" createVehicle [0,0,0];
	
	_newgenerator2 setPos (_house buildingPos _ranNum);	
	[[_newgenerator2, ["<t color='#00ffff'>Disable Alarm Gen</t>","disablegenerator.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
	};
	
	
	//_newgenerator allowDamage false;  //lets see if people can take it out without alarming guards...
	
	_group setBehaviour "SAFE";	//set this to prepare for alarm.  if AI isn't "safe" then sound the alarm;
	
	sleep 1;
	
	_vault = nearestObject [_position, "Box_IND_Support_F"];
	
	_wpVault = _group addWaypoint [position _vault, 5];
		
	_wpVault setWaypointType "MOVE"; 
		
	_wpGen = _group addWaypoint [position _newgenerator, 5];
		
	_wpGen setWaypointType "MOVE"; 
		
	_wpfarpatrol = _group addWaypoint [_position, 35];
		
	_wpfarpatrol setWaypointType "CYCLE"; 
			
	


	
	
	_jobname = format ["Job #%1 -- %2", jobnum, _jobtype];	
	_AlarmMarker = createMarker[_jobname,_position];
	
	_AlarmMarker setMarkerShape "ICON";
	_AlarmMarker setMarkerType "hd_flag";
	_AlarmMarker setMarkerText _jobname;
	

	
	
	  

	
	//["myScript.sqf","BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	[[_AlarmMarker, _group, _jobname, _jobtype], "MP_createAlarm", true, true] spawn BIS_fnc_MP;

	_jobnum = format ["Job %1 available", jobnum];
	
	serverMsg = _jobnum; //	send a string;
	_jobnum call MP_serverMsg;
	publicVariable "serverMsg";

	
	}
	
	else 
	
	{ 
	hint "no job created to prevent double standard spawn";

	};
	//job already detected!
	
