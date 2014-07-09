
		
		
				
		_object = createVehicle ["Land_Sack_F", position player,[],1,"CAN_COLLIDE"];
		
		_object allowDamage false;
		
		[[_object, ["<t color='#CC6600'>Take Gold</t>","takeGold.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		playerHasGold = 0;
		
		player sideChat "Dropped gold!";