

_hideoutMarker = _this select 3;
_hideout = _this select 0;

deleteVehicle _hideout;

_ammobox = nearestObject [_hideout, "Box_IND_Wps_F"];

deleteVehicle _ammobox;


deleteMarker _hideoutMarker;


//player addAction ["<t color='#ffff00'>Deploy Respawn Hideout</t>","deployHideout.sqf",false,-7];

playerBank = playerBank + 500;

player SideChat "You raided a hideout and got a 500 bonus";
