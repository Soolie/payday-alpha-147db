_dead = _this select 0;
_killer = _this select 1; 

removeAllActions player;

_killerBodyCount = _killer getVariable ["killSpree", 0];
_killerBodyCount = _killerBodyCount + 1;
_killer setVariable ["killSpree", _killerBodyCount, true];

//reward for police kill

_infamy = player getVariable ["infamy", 0];


{
_NearestGuncrateArray = nearestObjects [getMarkerPos _x, ["Box_IND_Ammo_F"], 15];
if (count _NearestGuncrateArray == 0) then {deleteMarker _x;};

} forEach GangRespawnMarkerArray;


if ( _infamy != 0 ) then {
		_player = player;
		_variable = [_killer,_infamy, _player];
		bountyKiller = _variable;
		publicVariable "bountyKiller";	

};


player setVariable ["infamy", 0, true];
player setVariable ["bodyCount", 0, true];  //reset to 0 when you die.

_value = playerMoney;

if (_value != 0) then {

_value execVM "dropmoney.sqf"; 

};

execVM "dropGrabs.sqf";


	//	sleep 480; //sleep guardDeleteTime;
	//	deleteVehicle _dead;