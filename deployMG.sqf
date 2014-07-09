
if ("ToolKit" in Items Player) then
{
	_pos1 = getPos player;
	player removeItem "ToolKit";
	_moutnedMG = createVehicle ["B_HMG_01_F", _pos1,[],0,"NONE"];
	player SideChat "MG Deployed";

}	
else
{
player SideChat "You must have a ToolKit";

}
