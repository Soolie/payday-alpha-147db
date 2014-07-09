

	_object = _this select 0;
	_id = _this select 2;

	
	_badguyArray = [];
	
	{
	_infamy = _x getVariable ["bodyCount", 0];
	
	if  ((_infamy != 0) AND (group _x != group player ) and (ALIVE _X)) then { //
		_badguyArray = _badguyArray + [_x];
		}
	
	} foreach allUnits;

	if (count _badguyArray != 0) then {

	

	_target = _badguyArray call BIS_FNC_selectRandom; //pick random from array of alive cars of the type we're looking for

		
	_string = format ["Kill %1", _target];
	_mapMarkerCreate = createMarkerLocal [_string, position _target];
		
	_mapMarkerCreate setMarkerShapeLocal "ICON";
	_mapMarkerCreate setMarkerTypeLocal "hd_flag";
	_mapMarkerCreate setMarkerTextLocal _string;
	
	

 
	player sideChat format ["Kill %1 -- I heard he's been seen around the indicated map location.  Kill him for your reward!", _target];
	
	HitTarget = _target;
	playerHasHitJob = 1;
	
	
	
	} else {
	
	player sideChat "Check back later";
	
	};