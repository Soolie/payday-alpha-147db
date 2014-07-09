
_location = getPos _this;



if(isServer) then{

	_newBox = createVehicle ["Box_IND_Ammo_F", _location,[],0,"CAN_COLLIDE"];
	


	_newBox allowDamage false;

	clearWeaponCargoGlobal _newBox;
	clearItemCargoGlobal _newBox;
	clearMagazineCargoGlobal _newBox;
	
			
	
	};
	


	
	_this addAction ["Buy Ghosthawk - 800,000", "buyghosthawk.sqf"];

	
//playerClass   // 0 = null, 1 = engineer, 2 = weapon expert, 3 = CLS, 4 = Scout, 5 = Mastermind, 6 = Ghost, 7 = Tech, 8 = Enforcer
			
				_this addAction ["Buy 1911 - 500", "buy1911.sqf"];
				_this addAction ["Buy 1911 Ammo - 100", "buy1911ammo.sqf"];
				_this addAction ["Rearm Vehicle - 3000", "rearm.sqf"];
				



	
//	case east:

				_this addAction ["Buy AR - 15000", "buyMMar.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy SMG - 1500", "buyMMsmg.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy Silent Pistol - 800", "buyGpistol.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy AR ammo - 300", "buyARammo.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy SMG ammo - 150", "buySMGammo.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy Silent Pistol ammo - 125", "buyGpistolammo.sqf",false,0,false,false,"",' playerClass == 5 '];
				_this addAction ["Buy Medi 3x First Aid Kit - 5000", "buyMedkit.sqf",false,0,false,false,"",' playerClass == 5 '];


				_this addAction ["Buy Silent 45 SMG - 3000", "buyGsmg.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy PDW - 1500", "buyGsmg2.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy Silent Pistol - 800", "buyGpistol.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy Silent 45 SMG ammo - 150", "buyGSMGammo.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy PDW ammo - 150", "buyGSMGammo2.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy Silent Pistol ammo - 125", "buyGpistolammo.sqf",false,0,false,false,"",' playerClass == 6 '];
				_this addAction ["Buy Heartbeat Sensor (MineDetector) - 5000", "buyMinedetector.sqf",false,0,false,false,"",' playerClass == 6 '];


				_this addAction ["Buy AR - 15000", "buyTECHar.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy SMG - 1500", "buyTECHsmg.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy Pistol - 500", "buypistol.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy AR ammo - 300", "buyARammo.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy SMG ammo - 150", "buySMGammo.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Pistol ammo - 100", "buypistolammo.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy Toolkit - 5000", "buyToolkit.sqf",false,0,false,false,"",' playerClass == 7 '];
				_this addAction ["Buy C4 - 5000", "buyC4.sqf",false,0,false,false,"",' playerClass == 7 '];


				_this addAction ["Buy AR+GL - 18000", "buyENFar.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy MG - 15000", "buyENFmg.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy Revolver - 500", "buyrevolver.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy AR+GL ammo - 1000", "buyENFarammo.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy MG ammo - 150", "buyMGammo.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy Revolver ammo - 100", "buyrevolverammo.sqf",false,0,false,false,"",' playerClass == 8 '];
				_this addAction ["Buy Toolkit - 5000", "buyToolkit.sqf",false,0,false,false,"",' playerClass == 8 '];


//end civ
