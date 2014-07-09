

_id = _this select 2;


_pos1 = getPos player;


	_nearbuildings = _pos1 nearObjects ["House",10];
	
	if ((count _nearbuildings == 0) AND (!isonroad _pos1))  then {

	player removeAction _id;
	

	
	_position = position player findEmptyPosition [10,50,"Land_i_House_Small_03_V1_F"];


	
	_hideout = createVehicle ["Land_i_House_Small_03_V1_F", _position,[],0,"NONE"];
	
	_direction = direction player;
	_hideout setDir _direction;

	
	_hideout allowdamage false;
	
	_ammobox = "Box_IND_Wps_F" createVehicle [0,0,0];
	
	_ammobox allowdamage false;

	_ammobox setPos (_hideout buildingPos 0);	
	
	clearWeaponCargoGlobal _ammobox;
	clearItemCargoGlobal _ammobox;
	clearMagazineCargoGlobal _ammobox;
	
	//_GangGroup = createGroup civilian;
	
	_atm = createVehicle ["Land_Sack_F", [0,0,0], [], 0, "NONE"];
	
	_atm setPos (_hideout buildingPos 1);	
	
	_atm call MP_createGlobalATM;
	createGlobalATM = _atm;
	publicVariable "createGlobalATM";	
	
	_vehShop = createVehicle ["Land_InfoStand_V1_F", position _hideout, [], 20, "NONE"];
		
	_vehShop call MP_createGlobalVehShop;
	createGlobalVehShop = _vehShop;
	publicVariable "createGlobalVehShop";	

	

respawnCounter = respawnCounter + 1;
_hideoutMarkerName = format ["respawn_east_%1", respawnCounter];
_hideoutMarkerText = format ["Gang Hideout %1", respawnCounter];

_hideoutMarker = createMarkerLocal[_hideoutMarkerName, position _hideout];

_hideoutMarker setMarkerShapeLocal "ICON";
_hideoutMarker setMarkerTypeLocal "hd_flag";
_hideoutMarker setMarkerTextLocal _hideoutMarkerText;
GangRespawnMarkerArray = GangRespawnMarkerArray + [_hideoutMarker];

[[_hideout, ["Join Gang", "joinGang.sqf", player,0,false,false,"",' playerSide == EAST ' ]], "MP_addAction", true, true] spawn BIS_fnc_MP;
[[_hideout, ["Raid Hideout", "raidHideout2.sqf", _hideoutMarker,0,false,false,"",' playerSide == WEST ' ]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		
_hideout addAction ["Move Hideout", "moveHideout2.sqf", _hideoutMarker];
					
					
player SideChat "Hideout Deployed";

}else

{

player SideChat "Too near other buildings to deploy!";

};