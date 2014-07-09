

	_object = _this select 0;
	_id = _this select 2;
	
	_foundNearestCar = 0;

	_GTAjobs = ["hostage1", "hostage2", "hostage3", "hostage4", "hostage5"];  

	_carStrings = ["C_Hatchback_01_F", "C_Van_01_transport_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F"];
	
	_carTargetStyle = _carStrings call BIS_fnc_selectRandom;
	
	_nearestCarTargetArray = position player nearEntities [_carTargetStyle, 25000];

	if (count _nearestCarTargetArray != 0) then {

	

	_nearestCarTarget = _nearestCarTargetArray call BIS_FNC_selectRandom; //pick random from array of alive cars of the type we're looking for

		
	_string = format ["Find a %1", _carTargetStyle];
	_mapMarkerCreate = createMarkerLocal [_string, position _nearestCarTarget];
		
	_mapMarkerCreate setMarkerShapeLocal "ICON";
	_mapMarkerCreate setMarkerTypeLocal "hd_flag";
	_mapMarkerCreate setMarkerTextLocal _string;
	
	

 
	player sideChat format ["Find a %1 -- I heard some are near the indicated map location.  Bring one back here for your reward!", _carTargetStyle];
	
	_object addAction ["<t color='#ffff00'>Finish Repo Mission</t>", "endRepoMission.sqf"];		
	playerHasRepoJob = 1;
	repo_target = _carTargetStyle;
	repo_marker = _mapMarkerCreate;
	
	} else {
	
	player sideChat "Check back later";
	
	};