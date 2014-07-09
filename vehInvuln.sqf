_cooldown = 180;
skillonCD = 1;
VehinvulnCD = 1;
_id = _this select 2;



_vehicle = vehicle player;


_vehicle allowDamage false;
// say3d script from BIS forums
null = [player,"thunder_1"] call fn_netSay3D;  

player SideChat "Vehicle Invulnerable for 5...";
sleep 1;
player SideChat"4...";
sleep 1;
player SideChat"3...";
sleep 1;
player SideChat"2...";
sleep 1;
player SideChat"1...";
sleep 1;
player SideChat"0";

_vehicle allowDamage true;

player SideChat format ["On Cooldown for %1 (3 min)", _cooldown];


//cooldown

sleep _cooldown;

VehinvulnCD = 0;
skillOnCD = 0;
player SideChat "Vehicle Invulnerability Ready";


