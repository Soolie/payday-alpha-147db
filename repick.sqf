
_cost = 1000;


if ((playerMoney >= _cost)) then {
	
	playerMoney = playerMoney - _cost;
	
	playerClass = 0;

}
else {

 player SideChat "You do not have enough money!"; 

};



