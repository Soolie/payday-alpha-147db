_id = _this select 2;

	
player removeAction _id;


player addAction ["<t color='#FF0000'>Flashlight Off</t>","flashlightOff.sqf",false,50,false,false,"",' vehicle player == player '];

flashlight = "#lightpoint" createVehicle getpos player; 
flashlight setLightDayLight true;
flashlight setLightAttenuation [2, 1, 2, 10];
flashlight setLightColor [255, 255, 255]; //red
flashlight setLightBrightness 0.1;
flashlight setLightAmbient [1,1,1];
flashlight lightAttachObject [player, [0, 3.5, 0.5]];

