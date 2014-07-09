

WaitUntil{alive player};

				detecteddrillingsafe = 0;
				PlayerblewSafe = 0;
				detectedneargenerator = 0;
				playerHasKeycard = 0;
				PlayerKilledGuard = 0;
				TowTruckonCD = 0;
				removeAllActions player;
				execVM "actions.sqf";
				

switch (playerClass) do {  // 0 = null, 1 = engineer, 2 = weapon expert, 3 = CLS, 4 = Scout, 5 = Mastermind, 6 = Ghost, 7 = Tech, 8 = Enforcer

	case 0: {player SideChat "Select a class!";};
	case 1: {[] execVM "chooseeng.sqf";};
	case 2: {[] execVM "choosewe.sqf";};
	case 3: {[] execVM "choosecls.sqf";};
	case 4: {[] execVM "choosescout.sqf";};
	case 5: {[] execVM "choosemastermind.sqf";};
	case 6: {[] execVM "chooseghost.sqf";};
	case 7: {[] execVM "choosetech.sqf";};
	case 8: {[] execVM "chooseenf.sqf";};

};





if (playerSide == east) then 
	{
	removeHeadgear player:
	removeGoggles player;
	removeVest player;
	removeBackpack player;
	removeUniform player;
	removeAllWeapons player:
	removeAllAssignedItems player;

	player addbackpack "B_Bergen_Base";
	player additem "ItemRadio";
	player assignItem "ItemRadio";
	player additem "ItemMap";
	player assignItem "ItemMap";
	sleep 1;
	player addUniform "U_OG_Guerilla2_1"; 

	}else
	
	{
	removeAllWeapons player:
	removeVest player;
	player addbackpack "B_Bergen_Base";};
	

	


//execVM "aggro.sqf"; should keep running...

//execVM "passiveincome.sqf";

