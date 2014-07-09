	_gasjobs = ["gas1", "gas2", "gas3", "gas4", "gas5", "gas6", "gas7", "gas8", "gas9", "gas10", "gas11", "gas12", "gas13", "gas14", "gas15", "gas16", "gas17", "gas18", "gas19", "gas20", "gas21"];
	
	
	_target = _this select 0;

	_driver = driver _target;
	
	


		_nearestMarker = "gas1";
		
		
		{
		 
		
		if (( player distance getmarkerpos _x) < (player distance getmarkerpos _nearestMarker)) then { _nearestMarker = _x};
		
		} forEach _gasjobs;

		player sideChat "Moving to nearest Gas Station...";
		
		player setPos getmarkerpos _nearestMarker;
		
		deleteVehicle _target;

		deleteVehicle _driver;
		