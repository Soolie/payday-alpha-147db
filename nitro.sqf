_cooldown = 40;
_id = _this select 2;
_vehicle = vehicle player;
_vec = vectorDir _vehicle;
_vel1 = velocity _vehicle;
_vel2 = _vel1 select 0;
_vel3  = _vel1 select 2;
_height = getPosATL _vehicle;



if (vehicle player != player) then
{
	if ((_vec select 2 > -0.1) && (_vel2 != 0) ) then
	{	
		if (  canMove _vehicle) then
		{

				
				skillonCD = 1;
				nitroCD = 1;
				_vehicle = vehicle player;
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = 40; comment "Added speed";//set _speed for desired boost
				_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
				player SideChat "Nitro Engaged";

	
				sleep _cooldown;
			
												
				
				skillonCD = 0;
				nitroCD = 0;
				player SideChat "Nitro Ready";
	
				

		}
		else
		{
		player SideChat "Vehicle cannot move";

		}		
	}
	else
	{
		player SideChat "Vehicle must be upright and moving";

	}
}
else
{		
	player SideChat "You must be in a vehicle to use nitro boost";
	
	
}	

