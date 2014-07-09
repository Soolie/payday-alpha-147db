

	_GTAjobs = ["hostage1", "hostage2", "hostage3", "hostage4", "hostage5", "hostage6", "hostage7", "hostage8", "hostage9"];  
	
	_aliveCars = 0;
	
	_carCreated = [];
 	
	_carStrings = ["C_Hatchback_01_F", "C_Van_01_transport_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F"];

	//C_Nikos	drivers

	sleep 5;
	
	hint "VehManager Starting";
	

while { true } do {
	
		
		
		_aliveCars = 0;
		
		{
			if (  canMove _x ) then { _aliveCars = _aliveCars + 1; };
		
		} foreach _carCreated; //can move

		if (_aliveCars < 12) then
		{
			hint format ["%1 aliveCars", _aliveCars];
			
			_randcar = _carStrings call BIS_fnc_selectRandom;
			
			_randLOC = _GTAjobs call BIS_fnc_selectRandom;
			
			_randLOC1 = _GTAjobs call BIS_fnc_selectRandom;
			
			_randLOC2 = _GTAjobs call BIS_fnc_selectRandom;
			
			_newveh = createVehicle [_randcar, getMarkerPos _randLOC,[],300,"NONE"];
			
			_newveh setVariable ["civcar", 1, true];
			
			_newveh addEventHandler ["killed",

	{ 
		_guard = _this select 0;
	//	sleep 480; //sleep guardDeleteTime;
		deleteVehicle _guard;
			
	} ];
		
			_carCreated = _carCreated + [_newveh];
			
			_newGroup = createGroup Civilian;
			
			_driver =  _newGroup createUnit ["C_Nikos", getMarkerPos _randLOC, [], 300, "NONE"];
			
			_driver addEventHandler ["killed",

	{ 
		_guard = _this select 0;
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		

	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
			
	} ];
			[_driver, "MP_hostageTrigger", true, true] spawn BIS_fnc_MP;
						
			_driver assignasDriver _newveh;
			
			_driver moveInDriver _newveh;
			
			_wp1 = _newGroup addWaypoint [getMarkerPos _randLOC, 100];
		
			_wp1 setWaypointType "MOVE"; 
			
			_wpfarpatrol = _newGroup addWaypoint [getMarkerPos _randLOC1, 100];
		
			_wpfarpatrol setWaypointType "MOVE"; 
		
			_wpfarpatrol2 = _newGroup addWaypoint [getMarkerPos _randLOC2, 100];
		
			_wpfarpatrol2 setWaypointType "CYCLE"; 
			
			_newGroup setCurrentWaypoint _wp1;
					
			//player sideChat format ["Car %1 created at %2", _randcar, _randLOC];		
			
			sleep 1.25;
			
		}
		
		else { //alreay have enough cars
			sleep 900;
		};
};