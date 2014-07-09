
	_pos1 = getPos player;
	
	_id = _this select 2;
	
	player removeAction _id;
	
	_deploy = createVehicle ["Land_Mound02_8m_F", _pos1,[],0,"CAN_COLLIDE"];
	_direction = direction player;
	_deploy setDir _direction;
	_deploy addAction ["Move Object", "moveSRroadblock.sqf"];
	
	player SideChat "Hide Deployed";

