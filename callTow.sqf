	_gasjobs = ["gas1", "gas2", "gas3", "gas4", "gas5", "gas6", "gas7", "gas8", "gas9", "gas10", "gas11", "gas12", "gas13", "gas14", "gas15", "gas16", "gas17", "gas18", "gas19", "gas20", "gas21"];
	
	player sideChat "Tow Truck Inbound...";

	_position = position player;

		_nearestMarker = "gas1";
		TowTruckonCD = 1;
		
		{
		 
		
		if (( _position distance getMarkerPos _x) < (_position distance getMarkerPos _nearestMarker)) then { _nearestMarker = _x};
		
		} forEach _gasjobs;

		
	//	player sideChat format ["nearest gas is %1", _nearestMarker];

		
		_newveh = createVehicle ["B_MRAP_01_F", getMarkerPos _nearestMarker,[],10,"NONE"];
		_newveh allowDamage false;
		_newveh lock 2;
		
		
		clearWeaponCargoGlobal _newveh;
		clearItemCargoGlobal _newveh;
		clearMagazineCargoGlobal _newveh;
		_newveh addAction ["<t color='#00ff00'>Repair Vehicle - 500 </t>","TOWrepair.sqf"];
		_newveh addAction ["<t color='#00ffff'>Ride Back</t>","TOWride.sqf"];

	
		_newveh setVariable ["civcar", 1, true];
		
		_newGroup = createGroup Civilian;
		
		_driver =  _newGroup createUnit ["C_man_w_worker_F", getMarkerPos _nearestMarker, [], 10, "NONE"];
		
		_driver addAction ["<t color='#00ffff'>Ride Back</t>","TOWride.sqf"];
			
		_driver addEventHandler ["killed",

	{ 
		_guard = _this select 0;
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		
		//sleep 480; //sleep guardDeleteTime;
		//deleteVehicle _guard;
			
	} ];

			_driver assignasDriver _newveh;
			
			_driver moveInDriver _newveh;
			
			_wp1 = _newGroup addWaypoint [_position, 5];
		
			_wp1 setWaypointType "MOVE"; 
		//	_wp1 setWaypointSpeed "FULL";
		//	player sideChat "tow on the way";
		
			sleep 5;
			_newveh allowDamage true;
		
			sleep 120;
			
			TowTruckonCD = 0;
			
			sleep 900;
			
			deleteVehicle _newveh;
			
			deleteVehicle  _driver;
			
			
			
			