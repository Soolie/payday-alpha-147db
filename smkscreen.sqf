_cooldown = 30;

_id = _this select 2;

if (vehicle player != player) then
{
		
		skillonCD = 1;
		SmkScreenCD = 1;
		player SideChat "Smoke Deployed";
	
		createVehicle ["smokeShell", position player, [], 0, "NONE"];
		sleep 1;
		createVehicle ["smokeShell", position player, [], 0, "NONE"];
		sleep 1;
		createVehicle ["smokeShell", position player, [], 0, "NONE"];
		sleep 1;
		createVehicle ["smokeShell", position player, [], 0, "NONE"];
		sleep 1;

		
		sleep _cooldown;
		
		
		
		skillonCD = 0;
		SmkScreenCD = 0;
		player SideChat "Smokescreen Ready";

				
			

		
	
};