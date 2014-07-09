_id = _this select 2;



if (vehicle player != player) then
{	
	_vehicle = vehicle player;
	_fuel = fuel _vehicle;
	if ("ToolKit" in Items Player) then
	{
		if (velocity _vehicle select 0 == 0) then 
		{ 
			repairCD = 1;
			
			
			player SideChat "Starting Repair"; 
			_vehicle setFuel 0;
			sleep 8;
			player SideChat "Repair is 50% complete";
			sleep 8;
			_vehicle setDamage 0;
			_vehicle setFuel _fuel;
			player SideChat "Vehicle Repaired";
			player addAction ["<t color='#00ffff'>Repair</t>","repair.sqf",false,-4,false,false,"",' vehicle player != player '];
			
			repairCD = 0;
	
		}
		else
		{
		player SideChat  "Vehicle must be stopped";

		};
	}	
	else
	{
		player SideChat  "You need a Tool Kit to repair";

	};
}
else
{

player SideChat  "You must be in a Vehicle";

};
