
	hint "buildings init";
	
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
	
	


	
if (isServer) then {
	
	_civGroup = createGroup civilian;
		
	_civGroup2 = createGroup civilian;
	
	_civGroup3 = createGroup civilian;
	
	{
	_pos = getMarkerPos _x;
	_thisFlag = createVehicle ["SignAd_Sponsor_Vrana_F", _pos , [], 5, "NONE"];
	_thisFlag allowDamage false;
	} foreach  hospital_array;
	
	hint "hospital flags created";
	
	{
	_pos2 = getMarkerPos _x;
 	_thisFlag = createVehicle ["SignAd_Sponsor_Vrana_F", _pos2, [], 5, "NONE"];
	
	_thisFlag setVariable ["repairShop", 1, true];

	_thisFlag allowDamage false;
	
	} foreach gasstation_array;
	hint "server created building flags";
	
	{
	_pos2 = getMarkerPos _x;
 	_thisguy = _civGroup createUnit ["C_man_hunter_1_F", _pos2, [], 5, "NONE"];
	_thisguy disableAI "ANIM";
	_thisguy allowDamage false;
	
	
	} foreach slavetrade_array;
	
	{
	_pos2 = getMarkerPos _x;
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	_thisguy disableAI "ANIM";
	_thisguy allowDamage false;
	
	
	} foreach boatshop_array;
	
	
	{
	_pos2 = getMarkerPos _x;
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	_thisguy disableAI "ANIM";
	_thisguy allowDamage false;
	
	
	} foreach shadyshop_array;
	
	{
	_pos2 = getMarkerPos _x;
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	_newBox = nearestObject [_pos2, "Box_IND_Ammo_F"];
	_newBox allowDamage false;
	_thisguy disableAI "ANIM";
	_thisguy allowDamage false;
	
	
	} foreach gunsmith_array;
	
	
	{
	_pos2 = getMarkerPos _x;
				
	_thisguy =  _civGroup3 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	_thisguy allowDamage false;
	
	_boat = createVehicle ["C_Boat_Civil_01_F", _pos2, [], 0, "NONE"];  
	_boat allowDamage False;
	_boat lock 2;
		
		
	_thisguy moveInDriver _boat;
	_thisguy assignasDriver _boat;
	
	_civGroup3 setBehaviour "SAFE";	

	_wp1 = _civGroup3 addWaypoint [_pos2, 0];
		
	_wp1 setWaypointType "MOVE"; 
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "LIMITED";
	
	
	_wp2 = _civGroup3 addWaypoint [_pos2, 400];
		
	_wp2 setWaypointType "CYCLE"; 
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";	
				

	} foreach offshore_array;

	{
	
	_pos2 = getMarkerPos _x;
	
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	
	_thisguy disableAI "ANIM";
	
	_thisguy allowDamage false;

	_newBox = createVehicle ["Box_IND_Ammo_F", position _thisguy,[],0,"CAN_COLLIDE"];
	
	_newBox allowDamage false;

	clearWeaponCargoGlobal _newBox;
	clearItemCargoGlobal _newBox;
	clearMagazineCargoGlobal _newBox;
	
	

	} foreach pawn_array;
	
	{
	
	_pos2 = getMarkerPos _x;
	
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	
	_thisguy disableAI "ANIM";
	
	_thisguy allowDamage false;

	} foreach garage_array;

	
	
	{
	
	_pos2 = getMarkerPos _x;
	
 	_thisguy = _civGroup2 createUnit ["C_man_polo_2_F", _pos2, [], 0, "NONE"];
	
	_thisguy disableAI "ANIM";
	
	_thisguy allowDamage false;

	} foreach realestate_array;
	
};



hint "buildings successfully init";