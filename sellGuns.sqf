_salesMan = _this select 0;

_gunCash = 250;

_Itemcount = 0;


_nearestBox = nearestObject [_salesMan, "Box_IND_Ammo_F"];

_gunCrateArray = getWeaponCargo _nearestBox;

_gunCrateArraySelect1 = _gunCrateArray select 1;

//player sideChat format ["Array = %1!", _gunCrateArraySelect0];

{
_Itemcount = _Itemcount + _x;


}forEach _gunCrateArraySelect1;



if (_Itemcount != 0 ) then {

	_totalCash = _Itemcount * _gunCash;
	
	playermoney = playermoney + _totalCash;
	
	player sideChat format ["You sold the guns for %1", _totalCash];
	player sideChat format ["Player money is now %1",playerMoney];
	clearWeaponCargoGlobal _nearestBox;
	clearItemCargoGlobal _nearestBox;
	clearMagazineCargoGlobal _nearestBox;
	
	
} else
{
player sideChat "I don't see any suitable guns in the crate...";
};