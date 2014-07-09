




	player addAction ["<t color='#00FFFF'>Flashlight On</t>","flashlightOn.sqf",false,50,false,false,"",' vehicle player == player  '];
	
	player addAction ["<t color='#00FF00'>Lock Vehicle</t>",
	{
	_target = cursorTarget; 
	player sideChat format ["Locking %1",_target];
	[_target, "MP_Lock", true, true] spawn BIS_fnc_MP;
	
	
	},false,10000,false,false,"",' (cursorTarget distance player < 3) AND (cursorTarget getVariable "owner" == player) AND (cursorTarget getVariable "locked" == 0)  '];
	
	
	player addAction ["<t color='#CC6600'>Drop Gold</t>","dropGold.sqf",false,30,false,false,"",' ((playerHasGold == 1) AND (vehicle player == player)) '];
 	
	player addAction ["<t color='#00FF00'>Unlock Vehicle</t>",
	
	{
	_target = cursorTarget; 
	player sideChat format ["Unlocking %1",_target];
	[_target, "MP_Unlock", true, true] spawn BIS_fnc_MP;
	},false,10000,false,false,"",' (cursorTarget getVariable "owner" == player) AND (cursorTarget distance player < 3) AND (cursorTarget getVariable "locked" == 1) '];
	
	player addAction ["<t color='#00FF00'>Lock Vehicle</t>",
	
	{
	_target = vehicle player; 
	player sideChat format ["Locking %1",_target];
	[_target, "MP_Lock", true, true] spawn BIS_fnc_MP;
	},false,10000,false,false,"",' (vehicle player getVariable "owner" == player) AND (vehicle player != player)  AND (vehicle player getVariable "locked" == 0) '];
	
	
	player addAction ["<t color='#00FF00'>Unlock Vehicle</t>",
	
	{
	_target = vehicle player; 
	player sideChat format ["Unlocking %1",_target];
	[_target, "MP_Unlock", true, true] spawn BIS_fnc_MP;
	},false,10000,false,false,"",' (vehicle player getVariable "owner" == player) AND (vehicle player != player)  AND (vehicle player getVariable "locked" == 1) '];
	
	
	player addAction["<t color='#ff0000'>Detain</t>",
	
	{ 	_target = cursorTarget; 
		player sideChat format ["Detained %1",_target];
		[_target, "MP_Detain", true, true] spawn BIS_fnc_MP;
	} ,false,100,false,false,"",' (alive cursorTarget) AND (cursorTarget distance player < 3) AND (cursorTarget getVariable "stunned" == 1) '];
	
	player addAction["<t color='#f58e27'>Release</t>",
	
	{	 _target = cursorTarget;
		player sideChat format ["Released %1",_target];
		[_target, "MP_Release", true, true] spawn BIS_fnc_MP;
	},false,99,false,false,"",' (alive cursorTarget) AND (cursorTarget distance player < 3) AND (cursorTarget getVariable "detained" == 1) '];
	
	player addAction["<t color='#00ff00'>Arrest</t>",
	
	{	_target = cursorTarget;
		_infamyLevel = _target getVariable ["infamy", 0];
		
		switch (_infamyLevel) do {
	
			case 1: {player sideChat "You arrested a minor street thug and got a bonus of 2,000!"; playerBank = playerBank + 2000; };
		
			case 2: {player sideChat "You arrested a hardened criminal and got a bonus of 10,000!"; playerBank = playerBank + 10000; };
		
			case 3: {player sideChat "You arrested a serious threat and got a bonus of 20,000!"; playerBank = playerBank + 20000; };
		
			case 4: {player sideChat "You arrested a terrorist and got a bonus of 50,000!"; playerBank = playerBank + 50000; };
		
			case 5: {player sideChat "You arrested a criminal mastermind and got a bonus of 100,000!"; playerBank = playerBank + 100000; };
		
		};
		
		[_target, "MP_Arrest", true, true] spawn BIS_fnc_MP;
			
	},false,100,false,false,"",' (alive cursorTarget) AND (cursorTarget distance player < 3) AND (cursorTarget getVariable "detained" == 1) AND (cursorTarget getVariable "infamy" != 0) '];
	
	
		player addAction["<t color='#ffff00'>Call Tow Truck</t>",
	
		{	 _target = cursorTarget;
			
		
		execVM "callTow.sqf";
		}
		,false,99,false,false,"",'  (( damage cursorTarget != 0 ) AND (cursorTarget distance player < 3)  AND ( Alive cursorTarget ) AND (cursorTarget getVariable "owner" == player) AND (TowTruckonCD != 1))  '];
		
			player addAction ["<t color='#FF0000'>Rearm Vehicle - 3000</t>",
	
	{
	_target = cursorTarget; 
	
	_cost = 3000;

	_vehicle = vehicle player;


if (playerMoney >= _cost) then {


	player SideChat "Rearming ...";
	_fuel = 0;
	playerMoney = playerMoney - _cost;
	_fuel = fuel _vehicle;
	_vehicle setFuel 0;	
	sleep 15;

	_vehicle setVehicleAmmo 1;


	player SideChat "Vehicle Rearmed";
	_vehicle setFuel _fuel;
	player SideChat format ["Player money = %1", playerMoney];

}	
else {
	player SideChat "You do not have enough money!";
}
	
	},false,10000,false,false,"",' (vehicle player != player)  AND (cursorTarget getVariable "repairShop" == 1) '];
	

	player addAction ["<t color='#00FF00'>Repair Vehicle - 400</t>",
	
	{
	_target = cursorTarget; 
	
	_cost = 400;

	_vehicle = vehicle player;
	_fuel = 0;

if (playerMoney >= _cost) then {


	player SideChat "Repairing ...";
	_fuel = 0;	
	playerMoney = playerMoney - _cost;
	_fuel = fuel _vehicle;
	_vehicle setFuel 0;
	sleep 15;

	_vehicle setDamage 0;
	_vehicle setFuel _fuel;
	player SideChat "Vehicle Repaired";

	player SideChat format ["Player money = %1", playerMoney];

}	
else {
	player SideChat "You do not have enough money!";
}
	
	},false,10000,false,false,"",' (vehicle player != player)  AND (cursorTarget getVariable "repairShop" == 1) '];
	
	//CLS actions
	player addAction ["<t color='#ff0000'>Deploy Medic Bag</t>","medicbag.sqf",false,-3,false,false,"",' (playerClass == 3) and "FirstAidKit" in Items Player  &&  "Medikit" in Items Player '];
	
	player addAction ["<t color='#F58E27'>Heartbeat Sensor</t>","proxysensor.sqf",false,-5,false,false,"",' (playerClass == 3) and vehicle player == freeveh '];

	player addAction ["<t color='#f58e27'>Deploy Gate</t>","deployCLSroadblock.sqf",false,-7,false,false,"",' (playerClass == 3) and vehicle player == player '];
	
	//enf actions
	
	player addAction ["<t color='#F58E27'>Deploy Ammo Bag</t>","ammobag.sqf",false,-3,false,false,"",'(playerClass == 8) and "ToolKit" in Items Player '];
	
	player addAction ["<t color='#ff0000'>Invulnerability</t>","invlun.sqf",false,-5,false,false,"",' (playerClass == 8) and (invulnCD == 0) and (vehicle player == player)'];
	
	//eng actions
	
	player addAction ["<t color='#00ffff'>Repair</t>","repair.sqf",false,-4,false,false,"",' (playerClass == 1) and  (vehicle player != player) AND ("ToolKit" in Items Player) '];

	player addAction ["<t color='#00FF00'>Smoke Screen</t>","smkscreen.sqf",false,-3,false,false,"",' (playerClass == 1) and (SmkScreenCD == 0) AND (vehicle player != player) '];



	player addAction ["<t color='#f58e27'>Deploy Barrier</t>","deployENroadblock.sqf",false,-7,false,false,"",'(playerClass == 1) and  vehicle player == player '];
	
	//ghost actions
	
	player addAction ["<t color='#F58E27'>Heartbeat Sensor</t>","proxysensor.sqf",false,-5,false,false,"",'(playerClass == 6) and  "MineDetector" in Items player '];
	
	player addAction ["<t color='#00FF00'>Smoke Screen</t>","smkscreen.sqf",false,-3,false,false,"",' (playerClass == 6) and (SmkScreenCD == 0) AND (vehicle player != player) '];
	
	//mastermind actions
	
	player addAction ["<t color='#ff0000'>Deploy Medic Bag</t>","medicbag.sqf",false,-5,false,false,"",' (playerClass == 5) and "FirstAidKit" in Items Player  &&  "Medikit" in Items Player AND (medicbagCD == 0) '];

	player addAction ["<t color='#00ffff'>Fast Recovery</t>","stamboost.sqf",false,-3,false,false,"", ' (playerClass == 5) and (stamBoostCD == 0) AND (vehicle player == player) '];

	player addAction ["<t color='#F58E27'>Attempt Bribe - 20,000</t>","persuade.sqf",false,-6,false,false,"", ' (playerClass == 5) and (Alive cursorTarget) AND (cursorTarget isKindOf "I_Soldier_02_F") AND (playerMoney >= 5000) AND ((player distance cursorTarget) < 6) AND (PerCD == 0) '];
	
	//scout actions
	
	player addAction ["<t color='#00ffff'>Fast Recovery</t>","stamboost.sqf",false,-3,false,false,"", ' (playerClass == 4) and (stamBoostCD == 0) AND (vehicle player == player) '];

	player addAction ["<t color='#00ff00'>Nitro</t>","nitro.sqf",false,-5,false,false,"",'(playerClass == 4) and  (nitroCD == 0) AND (vehicle player != player) '];

	player addAction ["<t color='#f58e27'>Deploy Hide</t>","deploySRroadblock.sqf",false,-7,false,false,"",' (playerClass == 4) and vehicle player == player '];

	//tech actions
	
	player addAction ["<t color='#00ffff'>Repair</t>","repair.sqf",false,-3,false,false,"",' (playerClass == 7) and (vehicle player != player) AND ("ToolKit" in Items Player) AND (RepairCD == 0) '];

	player addAction ["<t color='#00ff00'>Nitro</t>","nitro.sqf",false,-5,false,false,"",' (playerClass == 7) and (nitroCD == 0) AND (vehicle player != player) '];
	
	//weapon expert actions
	
	player addAction ["<t color='#F58E27'>Deploy Ammo Bag</t>","ammobag.sqf",false,-3,false,false,"",' (playerClass == 2) and "ToolKit" in Items Player '];
	
	player addAction ["<t color='#ff0000'>Deploy Mounted MG</t>","deployMG.sqf",false,-5,false,false,"",' (playerClass == 2) and "ToolKit" in Items Player '];

	player addAction ["<t color='#f58e27'>Deploy Sandbag</t>","deployWEroadblock.sqf",false,-7,false,false,"",'(playerClass == 2) and vehicle player == player '];

	player addAction ["<t color='#ff0000'>Vehicle Invulnerability</t>","vehInvuln.sqf",false,-8,false,false,"",'(playerClass == 2) and (VehinvulnCD == 0) and (vehicle player != player) '];
	
	
	// police lights
	
	player addAction ["<t color='#0000FF'>Siren On</t>","sirenOn.sqf",false,-7,false,false,"",' ((vehicle player != player) AND (sirenOn == 0) AND ( Side player == west)) '];

	player addAction ["<t color='#FF0000'>Siren Off</t>","sirenOff.sqf",false,-7,false,false,"",' ((vehicle player != player) AND (sirenOn == 1) AND (  Side player == west)) '];

	
	hint "default actions loaded successfully";