if ("ToolKit" in Items Player) then
{
	_pos1 = getPos player;
	player removeItem "ToolKit";
	_ammobag = "B_Bergen_rgr" createVehicle position player;
	_ammobag call MP_ammobagLoad;
	ammoLoad = _ammobag;
	publicVariable "ammoLoad";
	player SideChat "Ammo Bag Deployed";

}	
else
{
player SideChat "You must have a ToolKit";

}
