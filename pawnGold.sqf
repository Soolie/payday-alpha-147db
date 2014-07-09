

_goldCost = 15000;


_moneyFenced = 0;

if (playerHasGold == 1) then {

player sideChat format ["Selling gold for %1",_goldCost];
_moneyFenced = _moneyFenced + _goldCost;
playerHasGold = 0;
playermoney = playermoney + _moneyFenced;
player sideChat format ["Player money is now %1",playerMoney];

} else
{
player sideChat "You don't have any gold.";

};

	
	