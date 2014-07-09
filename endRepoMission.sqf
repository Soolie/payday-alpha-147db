

_dealer = _this select 0;
_dealerPOS = position _dealer;
_id = _this select 2;
_cooldown = 120;

_list = (_dealerPOS) nearEntities [repo_target, 15];
_car = _list select 0;

_carIsCiv = _car getVariable ["civcar", 0];
//player sideChat format ["near man is %1", _nearestSlaves];

if ((count _list != 0) AND (_carIsCiv == 1)) then {
	
	_dealer removeAction _id;
	playermoney = playermoney + 8000;
	
	player sideChat "You got paid 8,000! Check back later for another job";
	
	
	
	deleteVehicle _car;
	deleteMarkerLocal repo_marker;
	
	sleep _cooldown;
	playerHasRepoJob = 0;
	
} else
{
player sideChat "I don't see any suitable cars around...";
};

