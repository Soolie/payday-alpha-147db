_cooldown = 70;

_id = _this select 2;

player setFatigue 0;
skillonCD = 1;
stamBoostCD = 1;
player SideChat "Stamina Recovered";

sleep _cooldown;


skillonCD = 0;
stamBoostCD = 0;
player SideChat  "Fast Recovery Ready";