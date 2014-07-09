_slaver = _this select 0;
_slaverPos = position _slaver;

_nearestSlaves = nearestObjects [_slaver, ["C_man_polo_5_F_euro", "C_Nikos"], 20];


//player sideChat format ["near man is %1", _nearestSlaves];

if (count _nearestSlaves != 0 ) then {

	playermoney = playermoney + 10000;
	
	player sideChat "You sold the hostage into slavery for 10,000!";
	
	_Slave = _nearestSlaves select 0;
	
	deleteVehicle _Slave;
	
} else
{
player sideChat "I don't see any suitable slaves around...";
};