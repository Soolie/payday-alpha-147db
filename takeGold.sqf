 if (playerHasGold == 0) then {
 
 _sack = _this select 0;
 
 player sideChat "Got gold!";

  deleteVehicle  _sack;
 
 playerHasGold = 1;
 

 if (playerClass != 8) then {
 
 while {playerHasGold == 1} do {
 
	player setFatigue 1;
	
	//player sideChat "Got gold fatigue!";
	
	sleep 15;
 
 };
 };
 }else{
 
 
  player sideChat "Can only carry one gold sack!";
  
  };