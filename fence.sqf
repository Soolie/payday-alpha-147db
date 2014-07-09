

_camCost = 250;

_phoneCost = 150;

_laptopCost = 500;




_moneyFenced = 0;



if ((playerCams != 0) OR (playerPhones != 0) OR (playerLaptops != 0)) then {
	
	

	_camMoney =  (playerCams * _camCost);

	_phoneMoney = (playerPhones * _phoneCost);

	_laptopMoney = (playerLaptops * _laptopCost);
	
	_moneyFenced = _moneyFenced + _laptopMoney + _phoneMoney + _camMoney;
	
	player sideChat format ["Selling %1 Cams, %2 Phones, and %3 laptops for %4",playerCams,playerPhones,playerLaptops,_moneyFenced];
	
	playerCams = 0;
	
	playerPhones = 0;
	
	playerLaptops = 0;
	
		playermoney = playermoney + _moneyFenced;
	player sideChat format ["Player money is now %1",playerMoney];

	
}else
{
player sideChat "You don't have any items.";
};
	
