_emptime = 5; //time ghost takes to disable
_normalcd = 30;

_id = _this select 2;



_generator = _this select 0;

_generatorPOS = position _generator;

_alarmdestroyed = 0;


_counter = 0;


_cd = _normalcd / 3;  //do not edit this use the CD above
_cd1 = _emptime / 3;
  //for progress indication.
  
  
 _generator removeAction _id; 
 
  

if (playerclass == 6) then {        
	
	player sideChat "Using EMP on generator...stay near";
	
	while {((_counter < 3) AND (_counter != -1))} do {
	
		_nearestGuards = nearestObjects [_generatorPOS, ["I_Soldier_02_F"], 30];
		_NOofnearbyguards = 0;
		{
		if ((alive _x) and (Convert != _x)) then {
			if  ((_generatorPOS distance _x) < 15) then
			{_NOofnearbyguards = _NOofnearbyguards + 1};
		};
		}foreach _nearestGuards;



			if (_NOofnearbyguards != 0) then {
				detectedneargenerator = 1;
//player sideChat "You've been detected tampering by a guard!";
				};
	
			if (player distance _generator > 2) then { //player got too far away
			
			_counter = -1;

			};
			
			if ((_counter == 2) and (alive player)) then {
			
				[_generator, "electricity_loop"] call fn_netSay3D; 
				_alarmdestroyed = 1;
			
			};
			
			sleep _cd1;
			
			_counter = _counter + 1;
	};
	
			
	if (_alarmdestroyed == 1) then { 
	
		deleteVehicle _generator;

		player sideChat "Generator Disabled";
		
	} else {

	player sideChat "Player got too far away!";
	
	_generator addAction ["<t color='#00ffff'>Disable Alarm Gen</t>","disablegenerator.sqf",false, 2, false, false, "",' 0 != count [nearestObjects [position player, ["Land_Portable_generator_F"], 2]] '];
	};
}
else {        
	
	player sideChat "Disabling generator...stay near";
	
	
	
        while {((_counter < 3) AND (_counter != -1))} do {
		
		_nearestGuards = nearestObjects [_generatorPOS, ["I_Soldier_02_F"], 30];
		_NOofnearbyguards = 0;
		{
		if ((alive _x) and (Convert != _x)) then {
			if  ((_generatorPOS distance _x) < 15) then {_NOofnearbyguards = _NOofnearbyguards + 1};
		};
		}
		foreach _nearestGuards;

			if (_NOofnearbyguards != 0) then {
				detectedneargenerator = 1;
			//player sideChat "You've been detected tampering by a guard!";
				};
				
			
			if (player distance _generator > 2) then { //player got too far away
			
			_counter = -1
			
			};
			
			if ((_counter == 2) and (alive player)) then {
			
				[_generator, "electricity_loop"] call fn_netSay3D; 
				_alarmdestroyed = 1;
			
			};
			
			sleep _cd1;
			
			_counter = _counter + 1;
			};
			
			
			
	if (_alarmdestroyed == 1) then { 
	
		deleteVehicle _generator;

		player sideChat "Generator Disabled";
		
	} else {

	player sideChat "Player got too far away!";
	
	_generator addAction ["<t color='#00ffff'>Disable Alarm Gen</t>","disablegenerator.sqf",false, 2, false, false, "",' 0 != count [nearestObjects [position player, ["Land_Portable_generator_F"], 1]] '];
	};
};