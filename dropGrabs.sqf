		_phoneCount = playerPhones;
		
		_laptopCount = playerLaptops;
		
		_camCount = playerCams;
		
		_total = playerPhones + playerLaptops + playerCams;
		
		if (_total > 0) then {
		
		_position = position Player;
		
		//going to just drop one big crate to save resources
		
		_crate = createVehicle ["Box_IND_Support_F", _position,[],0,"CAN_COLLIDE"]; 
		
		
		[[_crate, _phoneCount, _laptopCount, _camCount], "MP_createDeathCrate", true, true] spawn BIS_fnc_MP;
	
	
	};
	
	
	/*	player sideChat format ["Dropping %1 Cams, %2 Phones, and %3 laptops",playerCams,playerPhones,playerLaptops];

		
		while {_counter < _camCount} do
		
		{
		
		_object = createVehicle ["Land_HandyCam_F", _position,[],1,"CAN_COLLIDE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#00ff00'>Take Camera</t>", "takeCam.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		_counter = _counter + 1;
		
		sleep 0.1;
		
		};
		
		_counter = 0;
		
		
		while {_counter < _phoneCount} do
		
		{
		
		_object = createVehicle ["Land_MobilePhone_smart_F", _position,[],1,"CAN_COLLIDE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#00ff00'>Take Phone</t>", "takePhone.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		_counter = _counter + 1;
		
		sleep 0.1;
		
		};
		
		_counter = 0;
		
		while {_counter < _laptopCount} do
		
		{
		
		_object = createVehicle ["Land_Laptop_F", _position,[],1,"CAN_COLLIDE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#00ff00'>Take Laptop</t>", "takeLaptop.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		_counter = _counter + 1;
		
		sleep 0.1;
		
		};
		
		if (playerHasKeycard == 1) then {
		

		_object = createVehicle ["Land_Notepad_F", _position,[],1,"NONE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#00ffff'>Take Codes</t>","takeCodes.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		playerHasKeycard = 0;
		
		};
		
		if (playerHasGold == 1) then {
		

		_object = createVehicle ["Land_Sack_F", _position,[],1,"NONE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#CC6600'>Take Gold</t>","takeGold.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		playerHasGold = 0;
		
		};
		
	//	player sideChat format ["%1 Cams, %2 Phones, and %3 laptops dropped!",playerCams,playerPhones,playerLaptops];

		
		playerPhones = 0;
		playerLaptops = 0;
		playerCams = 0;		
	

*/



