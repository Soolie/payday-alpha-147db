
sleep 2;
player sideChat "Aggro-Matic Running...!";

if (playerSide == EAST) then {




while {true} do {   //maybe this can be "true" and not respawn

	

	if ((detectedneargenerator == 1) or (detecteddrillingsafe == 1) or (PlayerblewSafe == 1) or (PlayerKilledGuard == 1) ) then { //if player is within 1 meter of alarm generator or drilling safe

		
				player setCaptive false;
	
		//		player sideChat "joined naughtyCivs";
	
				_nearestGuardArray = (position player) nearEntities [["I_Soldier_02_F"], 50];
				
				{
				_x reveal player;
				_x doTarget player;	
				_x setBehaviour "COMBAT";				
				
				
				} forEach _nearestGuardArray;
				
					
				
							
				sleep 90; 
				detecteddrillingsafe = 0;
				PlayerblewSafe = 0;
				detectedneargenerator = 0;
				PlayerKilledGuard = 0;
	};

	if ((currentWeapon player != "") or (primaryWeapon player != "") or (secondaryWeapon player != ""))  then { //player has a weapon 
	
		player setCaptive false;
		//		player sideChat "joined naughtyCivs";
		if (vehicle player != player) then {player setCaptive true; sleep 1;};
			
		sleep 1;
	}else {
	
	player setCaptive true;

//	player sideChat "joined niceCivs";
		
	sleep 1;
	};			

};

};