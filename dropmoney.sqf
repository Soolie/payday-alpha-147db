		_value = _this;
		
		_cashpile = createVehicle ["Land_Money_F", position player,[],0,"CAN_COLLIDE"];
		
		[[_cashpile, _value], "MP_takeCash", true, true] spawn BIS_fnc_MP;
		
		
		
		playerMoney = playerMoney - _value;
		
		player sideChat format ["you dropped %1", _value];