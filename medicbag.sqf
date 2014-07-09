_id = _this select 2;
_cooldown = 25;


if ("FirstAidKit" in Items Player  &&  "Medikit" in Items Player) then
	{
		medicbagCD = 1;
		player removeItem "FirstAidKit";
		_pos1 = getPos player;
		_medibag = createVehicle ["Land_Suitcase_F", _pos1,[],0,"NONE"];
		_medibag call MP_medikitHeal;
		medkitDeployed = _medibag;
		publicVariable "medkitDeployed";		
		player SideChat "Medic Bag Deployed";

		sleep _cooldown;
		deleteVehicle _medibag;
		_id = player addAction ["<t color='#ff0000'>Deploy Medic Bag</t>","medicbag.sqf"];
		medicbagCD = 0;
		}	
	
else
{
player SideChat "You must have a First Aid Kit and a Medikit";

}
