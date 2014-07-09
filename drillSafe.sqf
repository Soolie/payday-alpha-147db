//
// arguemnts [_value, _diff]



_EasydrillTime = 45;

_MediumdrillTime = 60;

_HarddrillTime = 90;

_Insanedrilltime = 120;


_drillCDEasy = (_Harddrilltime / 10);
_drillCDMedium = (_MediumdrillTime / 10);
_drillCDHard = (_EasydrillTime / 10);
_drillCDInsane = (_Insanedrilltime / 10);


_ID = _this select 2;

_safe = _this select 0;

_value = _this select 3 select 0;

_diff = _this select 3 select 1;

_hint = "";

_cooldown = 0;

_progress = 10;

_safePOS = position _safe;

if (_diff > 4) then {_diff = 4};

//player sideChat format ["Value is %1, Diff is %2", _value, _diff];

_PlayerBodyCount = player getVariable ["bodyCount", 0];

//player sideChat format ["Player bodycount = %1", _PlayerBodyCount];


[[_safe,_ID], "MP_removeAction", true, true] spawn BIS_fnc_MP;  //should remove this action for others


	

switch (_diff) do
{
    case 1: //easy safe
    {
			

			_hint = "Setting up the Drill.  This should be a piece of cake!";
			

			_cooldown = _drillCDEasy;
		
	};
	    case 2: //med safe
    {
			_hint =  "Setting up the Drill.  This looks like a standard safe.";
			_cooldown = _drillCDMedium;
	};

    case 3: //hard safe
    {
			_hint =  "Setting up the Drill.  This one looks tough!";
			_cooldown = _drillCDHard;
			
	};

		case 4: //insane safe
    {
			_hint =  "Setting up the Drill.  This one looks reinforced!";
			_cooldown = _drillCDInsane;
			
    };
};
		
			player sideChat _hint;

			sleep 5;		
		
        while {_progress < 100} do {
		[_safe,"Acts_carFixingWheel"] call fn_netSay3D;  
		_nearestGuards = nearestObjects [_safePOS, ["I_Soldier_02_F"], 15];
		_NOofnearbyguards = 0;
		{
		if ((alive _x) and (Convert != _x)) then {
			if  ((_safePOS distance _x) < 15) then {_NOofnearbyguards = _NOofnearbyguards + 1};
		};
		}
		foreach _nearestGuards;
		
		if (_NOofnearbyguards != 0) then {
			detecteddrillingsafe = 1;
			//player sideChat "You've been detected drilling by a guard!";
			};

		

		sleep _drillCDInsane; 

		player sideChat format["Drilling is %1 percent complete",_progress];

		_progress = _progress + 10;
		
	};//end while loop
	
	player sideChat "Drilling Complete";
	

	if (_value > 0) then {
	[[_safe, _value], "MP_takeCash", true, true] spawn BIS_fnc_MP;
	
	} else  //special safe spawns (gold/drugs/grabs);
	{
		switch (_value) do {
		 
		//laptops
		case -1: {
		[[_safe, ["<t color='#00ff00'>Take Laptops</t>","takeLaptopSafe.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		};
		
		//cameras
		case -2:  {
		[[_safe, ["<t color='#00ff00'>Take Cameras</t>","takeCamSafe.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		};
		
		
		//cellphones
		case -3: {
		[[_safe, ["<t color='#00ff00'>Take Phones</t>","takePhonesSafe.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		};
		
		//gold
		case -4:  {
		[[_safe, ["<t color='#CC6600'>Take Gold</t>","takeGold.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;
		};

	//	case -5: 	//drugs
	//	{[[_object, ["<t color='#00ff00'>Take Laptops</t>","takeLaptopSafe.sqf"]], "MP_addAction", true, true] spawn BIS_fnc_MP;};
	
	};


    
	};
