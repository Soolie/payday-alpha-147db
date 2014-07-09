
	_housejobs = ["house1", "house2", "house3", "house4", "house5", "house6", "house7"]; 
	
	//_whjobs  // no civs here
	
	_bankjobs = ["bank1", "bank2"];
	
	_gasjobs = ["gas1", "gas2", "gas3", "gas4", "gas5", "gas6", "gas7", "gas8", "gas9", "gas10", "gas11", "gas12", "gas13", "gas14", "gas15", "gas16", "gas17", "gas18", "gas19", "gas20", "gas21"];
	
	_GTAjobs = ["hostage1", "hostage2", "hostage3", "hostage4", "hostage5"];  
	
	//_supplyJobs // no civs here
	
	_shopsjobs = [["shops1_1", "shops1_2", "shops1_3", "shops1_4"],["shops2_1", "shops2_2", "shops2_3", "shops2_4"],["shops3_1", "shops3_2", "shops3_3", "shops3_4"]];
	
	_shopsjobsMA = ["shops1_1", "shops2_1", "shops3_1"]; //just for master array counting purposes only want the first shop map marker
	
	_civ_master_array = _housejobs + _bankjobs + _gasjobs + _GTAjobs + _shopsjobsMA;
	
	_MAcount = count _civ_master_array;
	
	_civsCreated = [];
	
	_civCount = 0; 

	sleep 5;
	
	player sideChat "CivManager Starting";
	

while { true } do {

	_civCount = 0;  //set this to 0 for the counting.
	
		{
			if (  alive _x ) then { _civCount = _civCount + 1; };
		
		} foreach _civsCreated; //can move
	
	hint format ["_civCount = %1", _civCount];
	//sleep 1;
			
	//		player sideChat format ["_availablejobcount is %1", _availablejobcount];
		
	if ( _civCount < 15 ) then //create some job cuz we have less than 5 around
	
	{
		
	//_pickjob =  round(random 4);
	
	_randomSpawn = floor(random _MAcount);
	
	_randomSpawn = _civ_master_array select _randomSpawn;
	

	
	_randomSpawnPos = getMarkerPos _randomSpawn;
	
	
	_civgroup = createGroup civilian;
	
	_civ =  _civgroup createUnit ["C_man_polo_5_F_euro", _randomSpawnPos, [], 10, "NONE"];
	
	_civsCreated = _civsCreated + [_civ];
	
	_civ addEventHandler ["killed",

	{ 
		_guard = _this select 0;
		_killer = _this select 1; 
		_killerBodyCount = _killer getVariable ["bodyCount", 0];
		_killerBodyCount = _killerBodyCount + 1;
		_killer setVariable ["bodyCount", _killerBodyCount, true];
		
	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _guard;
			
	} ];	
	
	_wp1 = _civgroup addWaypoint [_randomSpawnPos, 50];
		
	_wp1 setWaypointType "MOVE"; 
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "LIMITED";
	
	_wp2 = _civgroup addWaypoint [_randomSpawnPos, 500];
		
	_wp2 setWaypointType "CYCLE"; 
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";	
	
	
	[_civ, "MP_hostageTrigger", true, true] spawn BIS_fnc_MP;
	
	hint format ["CivManager Created Civ at %1", _randomSpawn];
	
	
	sleep 1.25;
	
	}else { // 30 civ already exist...
	hint "CivManager at Max Civs";
	sleep 900;
	};
	
};//end "true" loop
