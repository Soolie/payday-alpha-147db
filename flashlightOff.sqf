_id = _this select 2;

player removeAction _id;


deleteVehicle flashlight;

player addAction ["<t color='#00FFFF'>Flashlight On</t>","flashlightOn.sqf",false,50,false,false,"",' vehicle player == player '];
