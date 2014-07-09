
hint "starting init";
guardDeleteTime = 120;

isClient = 1; 


if ( isServer ) then 	{

	isClient = 0; 
	
	execVM "functions.sqf";
	
	execVM "timeAcc.sqf";
	
	execVM "default_buildings_server.sqf";
			
	execVM "crimenet.sqf";
	
	execVM "civManager.sqf";
	
	execVM "vehManager.sqf";
	
	execVM "cleanUp.sqf";
	
	call compile preProcessFile "\inidbi\init.sqf";
	
	execVM "dataBase.sqf";
			
	if (!isDedicated) then { //client-side functions for listen-server
			
	isClient = 1; 		

	};
	
	};//end server
	
	if (isClient == 1) then { //client side stuff
	
	waitUntil {!isNull player};

	
	

	HitTarget = objNull;
	Convert = objNull;
	FreeVeh = objNull;
	
	
	GangRespawnMarkerArray = [];
	repairCD = 0;
	PerCD = 0;
	medicbagCD = 0;
	sirenOn = 0;
	playerHasGold = 0;
	playerHasRepoJob = 0;
	playerHasHitJob = 0;
	respawnCounter = 0;
	playerHasKeycard = 0;
	PlayerblewSafe = 0;
	PlayerKilledGuard = 0;
	skillonCD = 0;
	invulnCD = 0;
	nitroCD = 0;
	vehinvulnCD = 0;
	SmkScreenCD = 0;
	stamBoostCD = 0;
	TowTruckonCD = 0;
	detecteddrillingsafe = 0;

	detectedneargenerator = 0;
		
	playerMoney = 0;
	playerBank = 3000;
	playerPhones = 0;
	playerLaptops = 0;
	playerCams = 0;
	playerClass = 0; // 0 = null, 1 = engineer, 2 = weapon expert, 3 = CLS, 4 = Scout, 5 = Mastermind, 6 = Ghost, 7 = Tech, 8 = Enforcer

	waitUntil {alive Player};
	
	player setVariable ["stunned", 0, true];
	player setVariable ["infamy", 0, true];
	player setVariable ["bodyCount", 0, true];
	
		
	//deleteVehicle FreeVeh;
	
	execVM "functions.sqf";

	execVM "passiveincome.sqf";

	execVM "default_buildings.sqf";
	
	execVM "briefing.sqf";
	
	execVM "infamyHandler.sqf";
	
	execVM "aggro.sqf";
	
	execVM "actions.sqf";
	
	execVM "dataBase.sqf";
	
	//
	

		
    player addEventHandler ["Respawn",{execVM "respawn.sqf";}];  
	player addEventHandler ["Killed",{[_this select 0, _this select 1] execVM "killed.sqf";}];  
	player addEventHandler ["HandleDamage",{_this call MP_hit;}];
		
	waitUntil {!(isNull (findDisplay 46))};
		
	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call fn_keyHandler"];
	

		
	if (playerSide == east) then 
	{
	removeHeadgear player:
	removeGoggles player;
	removeVest player;
	removeBackpack player;
	removeUniform player;
	removeAllWeapons player:
	removeAllAssignedItems player;
	player addUniform "U_OG_Guerilla2_1";  
	player addbackpack "B_Bergen_Base";
	player additem "ItemRadio";
	player assignItem "ItemRadio";
	player additem "ItemMap";
	player assignItem "ItemMap";
	} else {
	removeAllWeapons player:
	removeVest player;
	player addbackpack "B_Bergen_Base";	
	};
	player sideChat "Choose a class!";
	
};		