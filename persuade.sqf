_cost = 20000;

_cooldown = 240;


PerCD = 1;

_nearestGuard = nearestObject [ player, "I_Soldier_02_F"];

	_rand = floor (random 3);
	
	

if ((alive _nearestGuard )  AND (!alive Convert ) AND (playerMoney >= _cost) AND (_rand == 0)) then {   //

	player SideChat "Bribe Successful";

	playerMoney = playerMoney - _cost;
	
	player SideChat format ["Player money = %1", playerMoney];
	
	[_nearestGuard ] join player;
	
	Convert = _nearestGuard;



	
player SideChat format ["On Cooldown for %1 (4 min)", _cooldown];
	
sleep _cooldown;

PerCD = 0;




}

else 

{

player sideChat "Bribe Unsuccessful";

player SideChat format ["On Cooldown for %1 (4 min)", _cooldown];

sleep _cooldown;

PerCD = 0;
};