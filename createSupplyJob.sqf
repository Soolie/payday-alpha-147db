//_this = [location, min safe, max safe, min dif, max dif, min AI, max AI, min safe value, max safe value]
	
	hint "crimenet creating supply job";
	
	
	_location = _this select 0;  //should be map marker string

	_minAI = _this select 1;
	_maxAI = _this select 2;

	_jobtype = _this select 3;
	
	_position = getMarkerPos _location;
	


	
	_safesdetected = count (nearestObjects [_position, ["Land_SurvivalRadio_F"], 175]);
	
	//make sure to not double-spawn a job.
	
	if (_safesdetected == 0) then {
	
	
	
	jobnum = jobnum + 1;

	_aicounter = _minAI;
	
	_group = createGroup resistance;
	
	_ranNum = 0;
	
	_c = 0;

	_house =  nearestObject [_position, "House"];
	
	_house setDamage 0;
	
		
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	
	_ranNum = round(random _c);
	
	hint "crimenet creating radio";
	
	_newRadio = "Land_SurvivalRadio_F" createVehicle [0,0,0];
	
	_newRadio allowDamage false;
		
	_newRadio setPos (_house buildingPos _ranNum);	
	
	hint "crimenet  radio actions";
	
	hint format ["crimenet adding radio at %1 buildingPos %2", _house, _ranNum];
	
	[[_newRadio,["<t color='#00ff00'>Call Supply Drop</t>","callSupplies.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
	
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
		_object = createVehicle ["Land_Notepad_F", position _guard,[],1,"CAN_COLLIDE"];
		_object allowDamage false;
		[[_object, ["<t color='#00ffff'>Take Codes</t>","takeCodes.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
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
	

	_ranNum = 0;
	_c = 0;
	
	_house =  nearestObject [_position, "House"];
	
	while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
	
	_ranNum = round(random _c);
	
	_newgenerator2 = "Land_Portable_generator_F" createVehicle [0,0,0];
	
	_newgenerator2 setPos (_house buildingPos _ranNum);	
	[[_newgenerator2, ["<t color='#00ffff'>Disable Alarm Gen</t>","disablegenerator.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		

	sleep 1;
	
	//_newgenerator allowDamage false;  //lets see if people can take it out without alarming guards...
	
	_group setBehaviour "SAFE";	//set this to prepare for alarm.  if AI isn't "safe" then sound the alarm;
	
	_vault = nearestObject [_position, "Land_SurvivalRadio_F"];
	
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
	[[_AlarmMarker, _group, _jobname, _jobtype], "MP_createSupplyAlarm", true, true] spawn BIS_fnc_MP;

	_jobnum = format ["Job %1 available", jobnum];
	
	serverMsg = _jobnum; //	send a string;
	_jobnum call MP_serverMsg;
	publicVariable "serverMsg";

	
	}
	
	else 
	
	{ 
	hint "no job created to prevent double (supply) spawn";

	};
	//job already detected!
	
