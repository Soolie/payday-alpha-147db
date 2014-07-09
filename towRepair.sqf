

			_target = _this select 0;

	_driver = driver _target;
	
	_list = position _target nearEntities [["Car","Air"], 50];
		
		_fixThisCar = _list select 0;
		
		
_cost = 500;





if ((playerMoney >= _cost) or (playerBank >= _cost)) then {
	
	if (playerMoney >= _cost) then {
	
	playerMoney = playerMoney - _cost;
	
	player SideChat "Repairing ...";
	
	_fuel = fuel _fixThisCar;
	_fixThisCar setFuel 0;
	
	player SideChat format ["Player money = %1", playerMoney];
	sleep 15;
	_fixThisCar setFuel _fuel;
	_fixThisCar setDamage 0;


	player SideChat "Vehicle Repaired";
			deleteVehicle _target;
			deleteVehicle _driver;
	sleep 2;
	
	
	
	}else{
	playerBank = playerBank - _cost;
	
	player SideChat "Repairing ...";
	
	_fuel = fuel _fixThisCar;
	_fixThisCar setFuel 0;
	
	player SideChat format ["Player money = %1", playerMoney];
	sleep 15;
	_fixThisCar setFuel _fuel;
	_fixThisCar setDamage 0;


	player SideChat "Vehicle Repaired";
			deleteVehicle _target;
			deleteVehicle _driver;
	sleep 2;
		
	
 	};
}else {
	player SideChat "You do not have enough money!";
	};