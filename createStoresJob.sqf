//_this = [location, min safe, max safe, min dif, max dif, min AI, max AI, min safe value, max safe value]
	
	hint "crimenet creating store job";
	_jobcreated = 0;
	_storearray = _this select 0;
	_store1 = _this select 0 select 0;  //array of map markers, 4 per job location.
	_store2 = _this select 0 select 1;
	_store3 = _this select 0 select 2;
	_store4 = _this select 0 select 3;
	_jobtype = _this select 1;
	
	_position = getMarkerPos _store1;
	

	_cocksdetected = count (nearestObjects [_position, ["Land_HeatPack_F"], 50]);
	
	//make sure to not double-spawn a job.
	
	if (_cocksdetected == 0) then {
	
	jobnum = jobnum + 1;
	
	_jobname = format ["Job #%1 -- %2", jobnum, _jobtype];	
	
	_cock =  createVehicle ["Land_HeatPack_F", _position, [], 10, "NONE"];
	
	_cock allowDamage false;

	hint "crimenet creating store job AI";

	_guardgroup = createGroup independent; 
	
	_guard =  _guardgroup createUnit ["I_Soldier_02_F", _position, [], 5, "NONE"];
	
	removeAllItems _guard; 
	removeAllAssignedItems _guard;
	_guard unassignItem "NVGoggles_INDEP";
	_guard removeItem "NVGoggles_INDEP";
	removeAllWeapons _guard;
	removeVest  _guard;
	removeHeadGear _guard;
	_guard removeMagazines "HandGrenade";
	_guard addMagazines ["11Rnd_45ACP_Mag", 5];
	_guard AddWeapon "hgun_Pistol_heavy_01_F";
	_guard addEventHandler ["killed",
	{ 
		_guard = _this select 0;
		_value = round (random 300);
		_cashpile = createVehicle ["Land_Money_F", position _guard,[],1,"CAN_COLLIDE"];
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		[[_cashpile, _value], "MP_takeCash", true, true] spawn BIS_fnc_MP;
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
	} ];

	
	_wpg1 = _guardgroup addWaypoint [getMarkerPos _store1, 10];
		
	_wpg1 setWaypointType "MOVE"; 

	_wpg2 = _guardgroup addWaypoint [getMarkerPos _store2, 10];
		
	_wpg2 setWaypointType "MOVE"; 
	
	_wpg3 = _guardgroup addWaypoint [getMarkerPos _store4, 10];
		
	_wpg3 setWaypointType "MOVE"; 

	_wpfargpatrol = _guardgroup addWaypoint [getMarkerPos _store3, 10];
		
	_wpfargpatrol setWaypointType "CYCLE"; 
	
	
	//player sideChat "crimenet creating grabbables";
	
	_grabcounter = 0;
	
	_maxgrabs = 2;
	
	_houseList = _position nearObjects ["House",35];
	
	while {_grabcounter <= _maxgrabs} do {
	
	hint "crimenet creating store job grabs";
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


//player sideChat format ["creating grabbables at %1", _houselist];
	
	_JobMarker = createMarker[_jobname,_position];
	
	_JobMarker setMarkerShape "ICON";
	_JobMarker setMarkerType "hd_flag";
	_JobMarker setMarkerText _jobname;
	
	[[_storearray, _JobMarker, _jobname], "MP_storeTrigger", true, true] spawn BIS_fnc_MP;
	_jobnum = format ["Job %1 available", jobnum];
	
	serverMsg = _jobnum; //	send a string;
	_jobnum call MP_serverMsg;
	publicVariable "serverMsg";
	

	
	}
	
	else 
	
	{ 
	hint "no job created to prevent double (stores) spawn";

	};
	//job already detected!
	
