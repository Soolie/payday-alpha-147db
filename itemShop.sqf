
_location = getPos _this;



if(isServer) then{

	_newBox = createVehicle ["Box_IND_Ammo_F", _location,[],0,"CAN_COLLIDE"];
	


	_newBox allowDamage false;

	clearWeaponCargoGlobal _newBox;
	clearItemCargoGlobal _newBox;
	clearMagazineCargoGlobal _newBox;
	};
	
	_this addAction ["Buy Compass - 25", "buyCompass.sqf"];
	
	_this addAction ["Buy First Aid Kit - 25", "buyAidKit.sqf"];

	_this addAction ["Buy Watch - 50", "buyWatch.sqf"];
	
	_this addAction ["Buy Binoculars - 200", "buyBinoc.sqf"];	
	
	_this addAction ["Buy Flashlight - 300", "buyFlash.sqf"];	
	
	_this addAction ["Buy GPS - 500", "buyGPS.sqf"];
	
	_this addAction ["Buy IR Pointer - 500", "buyIR.sqf"];	
		
	_this addAction ["Buy Range finder - 800", "buyRangeFinder.sqf"];
	
	_this addAction ["Buy NVG - 5000", "buyNVG.sqf"];
	
	_this addAction ["Buy Toolkit - 5000", "buyToolkit.sqf"];
	
	_this addAction ["Buy Heartbeat Sensor (MineDetector) - 5000", "buyMinedetector.sqf"];
	
	_this addAction ["Buy Medi 3x First Aid Kit - 5000", "buyMedkit.sqf"];
	
	
	
	
	