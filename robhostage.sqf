

_hostage = _this select 0;

_id = _this select 2;

_hostage removeAction _id;

_value = floor (random 500);

playerMoney = playerMoney + _value;

player sideChat format ["You got %1", _value];


player sideChat format ["You now have %1", playermoney]; 

