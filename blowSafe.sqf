//arguemnts [_value, _diff]



_c4timer = 15;

_safe = _this select 0;

_value = _this select 3 select 0;

_diff = _this select 3 select 1;

_ID = _this select 2;

_safePos = getPos _safe;



if ("DemoCharge_Remote_Mag" in Magazines Player) then {

	player SideChat "Charge Armed!";
	
	player removeMagazine "DemoCharge_Remote_Mag";
	
	[[_safe,_ID], "MP_removeAction", true, true] spawn BIS_fnc_MP;
	
	
	
	[_safe,"click"] call fn_netSay3D;  
	sleep _c4timer;
	
	PlayerblewSafe = 1;
		
	createVehicle ["M_Mo_120mm_AT_LG", _safePos, [], 0, "NONE"];
	
	player SideChat "Safe Blown!";

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


    
	}; //close non-dollar safe cases

    
}else {
player SideChat "You need a satchel charge to blow the safe!";

};
