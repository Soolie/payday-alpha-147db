

_id = _this select 2;


_pos1 = getPos player;


	_nearbuildings = _pos1 nearObjects ["House",10];
	
	if ((count _nearbuildings == 0) AND (!isonroad _pos1))  then {

player removeAction _id;

_position = position player findEmptyPosition [2,50,"Land_TentDome_F"];
	
	
_hideout = createVehicle ["Land_TentDome_F", _position,[],0,"NONE"];

_hideout allowdamage false;

_ammobox = createVehicle ["Box_IND_Ammo_F", _position,[],1,"NONE"];

_ammobox allowdamage false;

		
	clearWeaponCargoGlobal _ammobox;
	clearItemCargoGlobal _ammobox;
	clearMagazineCargoGlobal _ammobox;
	
	

respawnCounter = respawnCounter + 1;
_hideoutMarkerName = format ["respawn_east_%1", respawnCounter];
_hideoutMarkerText = format ["Gang Hideout %1", respawnCounter];

_hideoutMarker = createMarkerLocal[_hideoutMarkerName, position _hideout];

_hideoutMarker setMarkerShapeLocal "ICON";
_hideoutMarker setMarkerTypeLocal "hd_flag";
_hideoutMarker setMarkerTextLocal _hideoutMarkerText;
GangRespawnMarkerArray = GangRespawnMarkerArray + [_hideoutMarker];

_player = player;

[[_hideout, ["Join Gang", "joinGang.sqf",_player,0,false,false,"",' SIDE PLAYER == EAST ' ]], "MP_addAction", true, true] spawn BIS_fnc_MP;

[[_hideout, ["Raid Hideout", "raidHideout.sqf", _hideoutMarker,0,false,false,"",' SIDE PLAYER == WEST ' ]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		
		
					
_hideout addAction ["Move Hideout", "moveHideout.sqf", _hideoutMarker];

				
					
player SideChat "Hideout Deployed";


}else

{

player SideChat "Too near other buildings to deploy!";

};
