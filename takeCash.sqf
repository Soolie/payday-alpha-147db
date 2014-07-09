

_value =  _this select 3;

_safe = _this select 0;

deleteVehicle _safe;

playerMoney = playerMoney + _value;

player sideChat format ["You got %1", _value];


player sideChat format ["You now have %1", playermoney]; 

