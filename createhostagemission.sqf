//_this = [location, min safe, max safe, min dif, max dif, min AI, max AI, min safe value, max safe value]
	
	hint "crimenet creating hostage job";
	_jobcreated = 0;
	_location = _this select 0;  //should be map marker string
	_position = getMarkerPos _location;
	_jobtype = _this select 1;
	
	_hostagesdetected = count (nearestObjects [_position, ["C_man_polo_5_F_euro"], 175]);
	
	//make sure to not double-spawn a job.
	
	if (_hostagesdetected == 0) then {
	
	jobnum = jobnum + 1;
	
	_jobname = format ["Job #%1 -- %2", jobnum, _jobtype];	
	hint "crimenet creating hostage job AI";	
	_civgroup = createGroup civilian;
	

	_civ =  _civgroup createUnit ["C_man_polo_5_F_euro", _position, [], 0, "NONE"];
	
		
	
	_civgroup setBehaviour "SAFE";	

	_wp1 = _civgroup addWaypoint [_position, 50];
		
	_wp1 setWaypointType "MOVE"; 
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "LIMITED";
	_wp2 = _civgroup addWaypoint [_position, 10];
		
	_wp2 setWaypointType "MOVE"; 
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";	
	_wpfarpatrol = _civgroup addWaypoint [_position, 40];
		
	_wpfarpatrol setWaypointType "CYCLE"; 
	_wpfarpatrol setWaypointBehaviour "SAFE";
	_wpfarpatrol setWaypointSpeed "LIMITED";	

	_guardgroup = createGroup independent; 
	
	_guard =  _guardgroup createUnit ["I_Soldier_02_F", _position, [], 0, "NONE"];
	
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
	
	
	_wpg1 = _guardgroup addWaypoint [_position, 50];
		
	_wpg1 setWaypointType "MOVE"; 

	_wpg2 = _guardgroup addWaypoint [_position, 10];
		
	_wpg2 setWaypointType "MOVE"; 

	_wpfargpatrol = _guardgroup addWaypoint [_position, 40];
		
	_wpfargpatrol setWaypointType "CYCLE"; 
	
	
	_JobMarker = createMarker[_jobname,_position];
	
	_JobMarker setMarkerShape "ICON";
	_JobMarker setMarkerType "hd_flag";
	_JobMarker setMarkerText _jobname;
	
	
	
	
	
	hint "crimenet creating hostage job grabs";
	
	_grabcounter = 0;
	
	_maxgrabs = 5;
	
	_houseList = _position nearObjects ["House",35];
	
	while {_grabcounter <= _maxgrabs} do {
	
	
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
		
					sleep 0.1;
					
			}; 
						
			case 1: {		
					_newSafe = "Land_Laptop_F" createVehicle [0,0,0];
							
					_newSafe allowDamage false;
					
					_newSafe setPos (_x buildingPos _ranNum);	
					
					[[_newSafe, ["<t color='#00ff00'>Take Laptop</t>", "takeLaptop.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
					
					//player sideChat "crimenet created Laptop";
					
					_grabcounter = _grabcounter + 1;
		
					sleep 0.1;
					
			}; 
			
			case 2: {		
					_newSafe = "Land_MobilePhone_smart_F" createVehicle [0,0,0];
							
					_newSafe allowDamage false;
					
					_newSafe setPos (_x buildingPos _ranNum);	
					
					[[_newSafe, ["<t color='#00ff00'>Take Phone</t>", "takePhone.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
					
					//player sideChat "crimenet created Phone";
					
					
					_grabcounter = _grabcounter + 1;
		
					sleep 0.1;
					
			}; 

		};
		
	};

	}forEach _houseList;
	
 };//end grab loop

	[[_civ, _JobMarker, _jobname], "MP_hostageTrigger", true, true] spawn BIS_fnc_MP;
	_jobnum = format ["Job %1 available", jobnum];
	
	serverMsg = _jobnum; //	send a string;
	_jobnum call MP_serverMsg;
	publicVariable "serverMsg";
	

	
	}
	
	else 
	
	{ 
	hint "no job created to prevent double spawn";

	};
	//job already detected!
	
