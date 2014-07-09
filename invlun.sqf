_cooldown = 240;
invulnCD = 1;
skillOnCD = 1;
_id = _this select 2;



player allowDamage false;
// say3d script from BIS forums
null = [player,"thunder_1"] call fn_netSay3D;  

player SideChat "Invulnerable for 8...";
sleep 1;
player SideChat"7...";
sleep 1;
player SideChat"6...";
sleep 1;
player SideChat"5...";
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
player allowDamage true;

_minutes = (_cooldown / 60);

player SideChat format ["On Cooldown for %1 aka %2 minutes", _cooldown, _minutes];

sleep _cooldown;

	
invulnCD = 0;
skillOnCD = 0;
player SideChat "Invulnerability Ready";
