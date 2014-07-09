
_cost = 200;



	


_loc1 = _this select 0;



_loc1 = position _loc1;








if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;

	_newveh = createVehicle ["B_Heli_Light_01_F", _loc1,[],0,"NONE"];
	
	clearWeaponCargoGlobal _newveh;
	clearItemCargoGlobal _newveh;
	clearMagazineCargoGlobal _newveh;
	clearBackPackCargoGlobal _newveh;
	
	_airfields = ["air1", "air2", "air3", "air4", "air5"];
	_nearestMarker = "air1";

		{
		 
		
		if (( _loc1 distance getMarkerPos _x) < (_loc1 distance getMarkerPos _nearestMarker)) then { _nearestMarker = _x};
		
		} forEach _airfields;
		
		player sideChat format ["nearest air is %1", _nearestMarker];
	
	_civGroup = createGroup civilian;
	
	_driver =  _civGroup createUnit ["C_man_w_worker_F", position _newveh, [], 0, "NONE"];
		
	
	_driver assignasDriver _newveh;
	_driver moveInDriver _newveh;
	
	_newveh lockDriver true;
	_newveh lockTurret [[0],true];
	
	

		

	switch (_nearestMarker) do {
	 
		case "air1": {

//		_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",_airfields select 0,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",_airfields select 1,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",_airfields select 2,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",_airfields select 3,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",_airfields select 4,0,false,false,"",' true '];
		
		};

		
		
		case "air2": {

		_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",_airfields select 0,0,false,false,"",' true '];
//		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",_airfields select 1,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",_airfields select 2,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",_airfields select 3,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",_airfields select 4,0,false,false,"",' true '];
		
		};
		
		case "air3": {

		_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",_airfields select 0,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",_airfields select 1,0,false,false,"",' true '];
//		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",_airfields select 2,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",_airfields select 3,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",_airfields select 4,0,false,false,"",' true '];
		
		};
		
		case "air4": {

		_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",_airfields select 0,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",_airfields select 1,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",_airfields select 2,0,false,false,"",' true '];
//		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",_airfields select 3,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",_airfields select 4,0,false,false,"",' true '];
		
		};
		
		case "air5": {

		_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",_airfields select 0,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",_airfields select 1,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",_airfields select 2,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",_airfields select 3,0,false,false,"",' true '];
//		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",_airfields select 4,0,false,false,"",' true '];
		
		};
		

	};
	
	
	
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
	
	_newveh setVariable ["locked", 1, true];
	


	sleep 2;
	player SideChat format ["Player money = %1", playerMoney];

 
	}
	
else {
	player SideChat "You do not have enough money!";
	};