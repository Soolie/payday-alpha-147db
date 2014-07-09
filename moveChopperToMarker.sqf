

_chopper = _this select 0;

_driver = assignedDriver _chopper;
_group = group _driver;

_targetAirfield = _this select 3;  //string;

removeAllActions _chopper;

player sideChat "Heading to destination...";

	/*	_newveh addAction ["<t color='#00FF00'>Go to Intl Airport (Center)</t>","moveChopperToMarker.sqf",1,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Krya Neva (NW)</t>","moveChopperToMarker.sqf",2,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to AAC (SW)</t>","moveChopperToMarker.sqf",3,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Feres (SE)</t>","moveChopperToMarker.sqf",4,0,false,false,"",' true '];
		_newveh addAction ["<t color='#00FF00'>Go to Molos (NE)</t>","moveChopperToMarker.sqf",5,0,false,false,"",' true '];
		
		*/
		
	
		
		_waypointLZ = _group addWaypoint [getMarkerPos _targetAirfield, 15];
		_waypointLZ setWaypointSpeed "FULL";
		_waypointLZ setWaypointType "GETOUT"; 
		
		
		_waypointLZ2 = _group addWaypoint [getMarkerPos _targetAirfield, 15];
		_waypointLZ2 setWaypointSpeed "LIMITED";
		_waypointLZ2 setWaypointType "HOLD"; 
		
	
		_group setCurrentWaypoint _waypointLZ;
		
		waitUntil {sleep 15;  ((player distance _chopper > 15) and (_chopper distance getMarkerPos _targetAirfield < 100) OR (!(alive _chopper))); };
		
		sleep 1;
		deleteVehicle _chopper;
		deleteVehicle _driver;
		deleteGroup _group;