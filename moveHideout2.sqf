
_hideoutMarker = _this select 3;

_hideout = _this select 0;


_ammobox = nearestObject [_hideout, "Box_IND_Wps_F"];


_vehShop  =  nearestObject [_hideout, "Land_InfoStand_V1_F"];


_atm = nearestObject [_hideout, "Land_Sack_F"];


deleteVehicle _ammobox;

deleteVehicle _vehShop;

deleteVehicle _atm;

deleteMarker _hideoutMarker;

deleteVehicle _hideout;

player addAction ["<t color='#ffff00'>Deploy Vehicle Hideout</t>","deployHideout2.sqf",false,-8];

player SideChat "Hideout picked up";
