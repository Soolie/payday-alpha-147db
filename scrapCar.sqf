

_dealer = _this select 0;
_dealerPOS = position _dealer;

_list = (_dealerPOS) nearEntities [["car"], 15];

//player sideChat format ["near man is %1", _nearestSlaves];

if (count _list != 0 ) then {

	playermoney = playermoney + 1000;
	
	player sideChat "You scrapped the vehicle for 1,000!";
	
	_car = _list select 0;
	
	deleteVehicle _car;
	
} else
{
player sideChat "I don't see any suitable cars around...";
};