
_hideoutMarker = _this select 3;

_hideout = _this select 0;


_ammobox = nearestObject [_hideout, "Box_IND_Wps_F"];


_vehShop  =  nearestObject [_hideout, "Land_InfoStand_V1_F"];


_atm = nearestObject [_hideout, "Land_Sack_F"];


_weapshop = nearestObject [_hideout, "Land_InfoStand_V2_F"];

_crates = nearestObjects [_hideout, ["Box_IND_Ammo_F"], 25];

{
deleteVehicle _x;
}forEach _crates;

deleteVehicle _ammobox;

deleteVehicle _vehShop;

deleteVehicle _weapShop;

deleteVehicle _atm;

deleteMarker _hideoutMarker;

deleteVehicle _hideout;

playerBank = playerBank + 15000;

player SideChat "You raided a hideout and got a 15000 bonus";
