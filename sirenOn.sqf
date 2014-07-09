
_vehicle = vehicle Player;

sirenOn = 1;


_lightleft = "#lightpoint" createVehicle getpos _vehicle; 
_lightleft setLightDayLight true;
_lightleft setLightColor [255, 0, 0]; //red
_lightleft setLightBrightness 0;
_lightleft setLightAmbient [5,0.5,0.5];
_lightleft lightAttachObject [_vehicle, [0, -1, 3]];



_lightright = "#lightpoint" createVehicle getpos _vehicle; 
_lightleft setLightDayLight true;
_lightright setLightColor [0, 0, 255]; //Blue
_lightright setLightBrightness 0;
_lightright setLightAmbient [0.5, 0.5, 5];
_lightright lightAttachObject [_vehicle, [0, -1, 3]];



while {sirenOn == 1} do 
{
[_vehicle, "alarmcar"] call fn_netSay3D; 

_lightright setLightBrightness 0.4;
_lightleft setLightBrightness 0;
sleep 0.75;

_lightright setLightBrightness 0;
_lightleft setLightBrightness 0.4;

 sleep 0.75;
 
 _lightright setLightBrightness 0.4;
_lightleft setLightBrightness 0;
sleep 0.75;

_lightright setLightBrightness 0;
_lightleft setLightBrightness 0.4;

 sleep 0.75;
 
 
};



deletevehicle _lightleft;
deletevehicle _lightright;