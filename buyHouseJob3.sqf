
_cost = 1500;
	_object = _this select 0;
	_id = _this select 2;

	_housejobs = ["house10", "house11", "house12", "house13"]; 
	_housecount = count _housejobs;

	_randomhousejob = round(random _housecount);
	
	_randomhousejob = _housejobs select _randomhousejob;


if (playerMoney >= _cost) then {
		_object removeAction _id;
		playerMoney = playerMoney - _cost;
		[_randomhousejob, 2, 3, 3, 3, 3, 6, 800, 1600, "Hard Housecall"] execVM "createHouseJob.sqf";
		player SideChat "Intel purchased";
		sleep 2;
		player SideChat format ["Player money = %1", playerMoney];
		sleep 600;
		_object addAction ["<t color='#ff0000'>Buy house job intel - 500</t>", "buyHouseJob.sqf"];
		
	}
	
else {
	player SideChat "You do not have enough money!";
	};