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
	
		
	_randMoney = round(random _maxsafevalue);
	if (_randMoney < _minsafevalue) then	{_randMoney = _minsafevalue};
	
	_randDiff =  _mindiff + (floor (random _maxdiff));
	if (_randDiff > 4) then	{_randDiff = 4};
	
	
	_house =  nearestObject [_position, "House"];
	
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	
	_ranNum = round(random _c);
	
	_newSafe = "Box_IND_Support_F" createVehicle [0,0,0];
	
	_newSafe allowDamage false;
	
	_house setDamage 0;
		
	_newSafe setPos (_house buildingPos _ranNum);	
	
	clearWeaponCargoGlobal _newSafe;
	clearItemCargoGlobal _newSafe;
	clearMagazineCargoGlobal _newSafe;
	
	_randLoad = round (random 3); // 0, 1, 2 or 3;
	
	switch (_randLoad) do {
	
		case 0: {//if laptops use -1 for value
		
			hint format ["crimenet creating safes at %1 with laptop load and %2 diff", _house, _randDiff];
			[[_newSafe, -1, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
	
		case 1: {//if camears use -2
		
		hint format ["crimenet creating safes at %1 with cameras load and %2 diff", _house, _randDiff];
			[[_newSafe, -2, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
		
		case 2: {//if cellphones use -3
		hint format ["crimenet creating safes at %1 with cellphone load and %2 diff", _house, _randDiff];
			[[_newSafe, -3, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
		
		
		case 3: {//gold
		hint format ["crimenet creating safes at %1 with gold load and %2 diff", _house, _randDiff];
			[[_newSafe, -4, _randDiff], "MP_createSafeActions", true, true] spawn BIS_fnc_MP; 
	
			_safecounterValue = _safecounterValue + 1;
		};
	
	};

	
	sleep 0.1;
		
		

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
		_guard = _this select 0;
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
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
	hint "no job created to prevent double (warehouse) spawn";

	};
	//job already detected!
	
