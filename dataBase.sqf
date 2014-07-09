databasename = "TEST";



//server side functions after getting public variable....

//read/sync money
		

	
	
	//write money
	
if (isServer) then {
		
		
	MP_serverBankWrite = {
       //code
	  _amount = _this select 1; 
	  _player = _this select 0;
	  
	  _playerUID = getPlayerUID _player;
		  
	  _returnTrueifSuccess = [databasename, _playerUID, "playerBank", _amount] call iniDB_write;
	
		if (_returnTrueifSuccess) then {
		
				 serverMsg = ["Bank write to db"];
				 publicVariable serverMsg;
		
		}else{
		
		player sideChat "did not find player bank account!";

		};	  
	   
	   
};
	
	bankWrite = [];  
    "bankWrite" addPublicVariableEventHandler {(_this select 1) call MP_serverBankWrite};
	
	
	
	MP_databaseProcessValueRequest = {
       
	   	_player = _this;
		_playerUID = getPlayerUID _player;
		_clientID  = owner _player;
		
		_money = [databasename, _playerUID, "playerBank", "SCALAR"] call iniDB_read;
		
		player sideChat format ["DB says ur money is %1, UID = %2",_money, _playerUID];
		
		if (_money > 1) then {
		
		_money call MP_clientBankWrite; //forserver?
		clientWriteToBank = _money;
		_clientID publicVariableClient "clientWriteToBank";
		
		
				
		}else{
		
		3000 call MP_clientBankWrite; //forserver?
		clientWriteToBank = 3000;
		_clientID publicVariableClient "clientWriteToBank";
		
		};
	   
    };
	
	databaseBankValueRequest = []; //should be playerUID -- call this on INIT with player UID sent in the variable
    "databaseBankValueRequest" addPublicVariableEventHandler {(_this select 1) call MP_databaseProcessValueRequest};
	
	};
	
	
	//client functions
	
	MP_clientBankWrite = {
		
       //update client's bank to DB values.
	  _amount = _this; 
	  
		playerBank = _amount;
		player sideChat format ["Bank synced; you now have %1",playerBank];
	   
	   
	};
	
	clientWriteToBank = [];
    "clientWriteToBank" addPublicVariableEventHandler {(_this select 1) call MP_clientBankWrite};
	

sleep 2;
	
	//sync player bank to DB on load.

	_player = player;
	databaseBankValueRequest = _player;
	if (isServer) then {	_player call MP_databaseProcessValueRequest;  };
	publicVariableServer "databaseBankValueRequest";
	
	
		


		