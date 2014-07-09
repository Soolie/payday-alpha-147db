

	_pos1 = getPos player;
	
	_id = _this select 2;
	
	player removeAction _id;
	
	_deploy = createVehicle ["Land_HBarrier_5_F", _pos1,[],0,"NONE"];
	_direction = direction player;
	_deploy setDir _direction;
	_deploy addAction ["Move Object", "moveWEroadblock.sqf"];
	
	player SideChat "Sandbag Deployed";

