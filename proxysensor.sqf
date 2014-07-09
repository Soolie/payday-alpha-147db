
	playSound "FD_Start_F";
	_pos = getPos player;
	_aliveInTrigger = 0;
	
	{	if(_pos distance _x < 30) then {
			_aliveInTrigger= _aliveInTrigger + 1;
		}
	} forEach allUnits;
		
	player SideChat format ["There are %1 living humans in the area", _aliveInTrigger];
