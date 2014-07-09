
	hint "buildings init";
	
	sleep 2;
	
	gasstation_array = ["gas1", "gas2", "gas3", "gas4", "gas5", "gas6", "gas7", "gas8", "gas9", "gas10", "gas11", "gas12", "gas13", "gas14", "gas15", "gas16", "gas17", "gas18", "gas19","gas20","gas21"];
	
	hospital_array = ["hospital1"];

	slavetrade_array = ["st1", "st2"];
	
	boatshop_array = ["boat1", "boat2", "boat3"];
	
	shadyshop_array = ["shady1", "shady2", "shady3"];
	
	gunsmith_array = ["gs1", "gs2"];
	
	offshore_array = ["offshore1", "offshore1_1"];
	
	pawn_array = ["pawn1", "pawn2", "pawn3"];
	
	garage_array = ["ship1"];
	
	realestate_array = ["re1", "re2", "re3"];



if(!isDedicated) then {
	{
	_thisFlag2 = nearestObject [getMarkerPos _x, "SignAd_Sponsor_Vrana_F"];
	_thisFlag2 addAction ["<t color='#ff0000'>Buy Healthcare - 1000</t>", "healthcare.sqf"];
	
	} foreach  hospital_array;
	
	hint "hospital flag actions created";
	
	{
 	_thisFlag2 = nearestObject [getMarkerPos _x, "SignAd_Sponsor_Vrana_F"];
	
	_thisFlag2 addAction ["Withdraw Money", "withdrawmoney.sqf"];
	
	_thisFlag2 addAction ["Buy QuadBike - 400", "buyquad.sqf"];
	_thisFlag2 addAction ["Repair - 500", "gasrepair.sqf"];
	
	_thisFlag2 addAction ["Paint Black - 400", "paintBlack.sqf"];
	
	_thisFlag2 addAction ["Paint White - 400", "paintWhite.sqf"];
	
	_thisFlag2 addAction ["Paint Blue - 400", "paintBlue.sqf"];
	
	_thisFlag2 addAction ["Paint Red - 400", "paintRed.sqf"];
	
	_thisFlag2 addAction ["Paint Green - 400", "paintGreen.sqf"];
	
	} foreach gasstation_array;
	hint "gas station flag actions created";

	{
	
	_thisguy = nearestObject [getMarkerPos _x, "C_man_hunter_1_F"];
 	_thisguy addAction ["<t color='#00ff00'>Sell Slave - 10,000</t>", "sellslave.sqf",false,0,false,false,"",' playerSide == EAST '];
	_thisguy addAction ["<t color='#ff0000'>Buy Slave - 15,000</t>", "buyslave.sqf",false,0,false,false,"",' playerSide == EAST '];
	

	
	
	} foreach slavetrade_array;
	
	{
	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];
	
	_thisguy addAction ["Refuel - 100", "reFuel.sqf"];
 	_thisguy addAction ["Buy Rubber Boat - 1,200", "buyrubber.sqf"];
	_thisguy addAction ["Buy Motorboat - 8,200", "buymotorboat.sqf"];	
	
	_thisguy addAction ["Buy Rescue Boat - 8,000", "buyrescue.sqf",false,0,false,false,"",' playerSide == WEST '];
	_thisguy addAction ["Buy Police Boat - 8,000", "buypoboat.sqf",false,0,false,false,"",' playerSide == WEST '];

	
	} foreach boatshop_array;
	
	{
	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];

	
	
	_thisguy addAction ["<t color='#ffff00'>Sell electronics</t>", "fence.sqf",false,0,false,false,"",' playerSide == EAST '];

	_thisguy addAction ["<t color='#00ff00'>Gamble - 1,000</t>", "gamble.sqf",false,0,false,false,"",' playerSide == EAST '];
	
	_thisguy addAction ["<t color='#00ff00'>Buy Intel Level 1 - 500</t>", "buyHouseJob.sqf",false,0,false,false,"",' playerSide == EAST '];
	_thisguy addAction ["<t color='#00ff00'>Buy Intel Level 2 - 1000</t>", "buyHouseJob2.sqf",false,0,false,false,"",' playerSide == EAST '];
	_thisguy addAction ["<t color='#00ff00'>Buy Intel Level 3 - 1500</t>", "buyHouseJob3.sqf",false,0,false,false,"",' playerSide == EAST '];
	
	_thisguy addAction ["<t color='#ff0000'>Get Player Hit Mission</t>", "getHitMission.sqf",false,0,false,false,"",' playerSide == EAST AND playerHasHitJob == 0 '];
	

	
	}foreach shadyshop_array;
	
	
	{
	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];
 	_thisguy addAction ["Buy Ammo Belt - 500", "buyChest1.sqf"];
	_thisguy addAction ["Buy Bandollier - 800", "buyChest2.sqf"];	
	_thisguy addAction ["Buy Chestrig - 1000", "buyChest3.sqf"];
	_thisguy addAction ["Buy TacVest - 1500", "buyChest4.sqf"];
	_thisguy addAction ["Buy Plate Carrier - 10000", "buyChest5.sqf"];
	_thisguy addAction ["Buy Armored Helmet - 12000", "buyChest6.sqf"];

	} foreach gunsmith_array;

	{
	_boat2 = nearestObject [getMarkerPos _x, "C_Boat_Civil_01_F"];
	
	
	
	_boat2 addAction ["<t color='#CC6600'>Sell Gold Offshore</t>","offshore.sqf"];
	_boat2 addAction ["Deposit Money", "depositmoney.sqf"];
	_boat2 addAction ["Withdraw Money", "withdrawmoney.sqf"];
	

	} foreach offshore_array;
	
	
	{
	
 	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];
	_thisguy addAction ["<t color='#ffff00'>Sell electronics</t>", "fence.sqf"];
	_thisguy addAction ["<t color='#CC6600'>Pawn gold</t>", "pawnGold.sqf"];
	_thisguy addAction ["<t color='#00ff00'>Sell weapons in crate</t>", "sellGuns.sqf"];
	

	} foreach pawn_array;
		
	{
	
 	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];
	_thisguy addAction ["<t color='#ffff00'>Get Repo Mission</t>", "getRepoJob.sqf",false,5,false,false,"",' playerHasRepoJob == 0 '];
	_thisguy addAction ["<t color='#CC6600'>Sell vehicle for 'scrap'</t>", "scrapCar.sqf"];
	

	} foreach garage_array;
	
	{
	
 	_thisguy = nearestObject [getMarkerPos _x, "C_man_polo_2_F"];
	
	
	_thisguy addAction ["Buy Respawn Hideout - 1000", "buyHideout.sqf",[1000,1],-3,false,false,"", ' playerClass != 5 '];
	_thisguy addAction ["Buy Respawn Hideout - 800", "buyHideout.sqf",[800,1],-5,false,false,"", ' playerClass == 5 '];
	
	_thisguy addAction ["Buy Vehicle Hideout - 10000", "buyHideout.sqf",[10000,2],-3,false,false,"", ' playerClass != 5 '];
	_thisguy addAction ["Buy Vehicle Hideout - 8000", "buyHideout.sqf",[8000,2],-5,false,false,"", ' playerClass == 5 '];
	
	_thisguy addAction ["Buy Weapon Hideout - 30000", "buyHideout.sqf",[30000,3],-3,false,false,"", ' playerClass != 5 '];
	_thisguy addAction ["Buy Weapon Hideout - 24000", "buyHideout.sqf",[24000,3],-5,false,false,"", ' playerClass == 5 '];
	
	_thisguy addAction ["Buy Ultimate Hideout - 100000", "buyHideout.sqf",[100000,4],-3,false,false,"", ' playerClass != 5 '];
	_thisguy addAction ["Buy Ultimate Hideout - 80000", "buyHideout.sqf",[80000,4],-5,false,false,"", ' playerClass == 5 '];

	

	} foreach realestate_array;
	
	
};



hint "buildings successfully init";