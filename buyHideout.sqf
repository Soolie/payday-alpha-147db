_slaver = _this select 0;
_slaverPos = position _slaver;

_Hideoutvalue = _this select 3 select 1;
_cost = _this select 3 select 0;







if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;
	
	switch (_Hideoutvalue) do 
{ 
	case 1: {player addAction ["<t color='#ffff00'>Deploy Respawn Hideout</t>","deployHideout.sqf",false,-7];}; 
  
  
	case 2: {player addAction ["<t color='#ffff00'>Deploy Vehicle Hideout</t>","deployHideout2.sqf",false,-8];}; 
 
  
	case 3: {player addAction ["<t color='#ffff00'>Deploy Weapon Hideout</t>","deployHideout3.sqf",false,-9];}; 
   
  
	case 4:{player addAction ["<t color='#ffff00'>Deploy Ultimate Hideout</t>","deployHideout4.sqf",false,-10];};
 
  
  
};

	
	player SideChat "Item purchased";
	
	player SideChat format ["Player money = %1", playerMoney];

	}
	
else {
	player SideChat "You do not have enough money!";
	};
	

