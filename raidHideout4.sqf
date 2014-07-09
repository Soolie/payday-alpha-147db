
_hideoutMarker = _this select 3;

_hideout = _this select 0;


_ammobox = nearestObject [_hideout, "Box_IND_Wps_F"];


_vehShop  =  nearestObject [_hideout, "Land_InfoStand_V1_F"];


_atm = nearestObject [_hideout, "Land_Sack_F"];


_itemShop = nearestObject [_hideout, "Land_MapBoard_F"];

_terrshop = nearestObject [_hideout, "Land_Noticeboard_F"];


_crates = nearestObjects [_hideout, ["Box_IND_Ammo_F"], 25];

{
deleteVehicle _x;
}forEach _crates;


deleteVehicle _terrshop;
				
deleteVehicle _ammobox;

deleteVehicle _vehShop;

deleteVehicle _itemShop;

deleteVehicle _atm;

deleteMarker _hideoutMarker;

deleteVehicle _hideout;

playerBank = playerBank + 50000;

player SideChat "You raided a hideout and got a 50000 bonus";