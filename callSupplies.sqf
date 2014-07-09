_thisRadio = _this select 0;


if (playerHasKeycard == 1) then {



_position = position _thisRadio;
deleteVehicle _thisRadio;

_position execVM "dropRandomCrate.sqf";
sleep 10;
_position execVM "dropRandomCrate.sqf";



playerHasKeycard = 0;


}

else 

{

player sideChat "You need the keycode to authorize supplies!";

};