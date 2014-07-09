//player sideChat "Passive Income Handler";


while { true } do {

	sleep 900;
	_interest = round (playerBank * 0.07);
	if ( playerSide == west ) then {
	
	playerBank = playerBank + 2000;

	player sideChat "You got Cop paycheck of 2000";  
	
//	player sideChat format ["You now have %1 in your bank account", playerBank];  
	
	
	}else{

	if ((playermoney + playerBank) < 10000) then {

		playerBank = playerBank + 500;

		player sideChat "You got 'income assistance' of 500";  
	
//		player sideChat format ["You now have %1 in your bank account", playerBank];  
		};
	

	}; 
		
	playerBank = playerBank + _interest;

	bankWrite = [player, playerBank];

	
	if (isServer) then {	_bankWrite call MP_serverBankWrite;    };
	
	
	publicVariableServer "bankWrite";	

	player sideChat format ["You got bank interest of %1", _interest];
	
	player sideChat format ["You now have %1 in your bank account", playerBank];  
	




};