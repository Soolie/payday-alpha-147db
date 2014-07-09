_hideout = _this select 0;

deleteVehicle _hideout;

player addAction ["<t color='#f58e27'>Deploy Sandbag</t>","deployWEroadblock.sqf",false,-7,false,false,"",' vehicle player == player '];

player SideChat "Roadblock picked up";
