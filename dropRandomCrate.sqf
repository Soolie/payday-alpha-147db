
		
		
		_pos = _this;
		player sideChat format ["Creating drop at %1", _pos];
		
		
		
		
		

		_chute = createVehicle ["B_Parachute_02_F", [110, 110, 110], [], 0, 'FLY'];
        _chute setPos [_pos select 0, _pos select 1, 300];
		_crate = createVehicle ["B_supplyCrate_F", position _chute, [], 0, 'NONE'];
		_crate attachTo [_chute, [0, 0, -1.3]];
	
		clearWeaponCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackPackCargoGlobal _crate;
		

   

		 
		
		

		
		 waitUntil { sleep 1;	position _crate select 2 < 3 OR isNull _chute};
        detach _crate;
        _crate setPos [position _crate select 0, position _crate select 1, 0];
				_random = round(random 3);  //random loadouts.
		switch (_random) do {
		
		case 0: { 
			//player sideChat format ["crimenet creating supply  at %1 with SMG load", _chutePOS];
			
			
			_crate addWeaponCargoGlobal ["SMG_02_F", 6];
			_crate addMagazineCargoGlobal ["30Rnd_9x21_Mag", 30];
			_crate addItemCargoGlobal ["Medikit", 1];
			_crate addItemCargoGlobal ["FirstAidKit", 3];
			_crate addItemCargoGlobal ["Binocular" , 1];
			_crate addItemCargoGlobal ["NVGoggles" , 2];
			_crate addItemCargoGlobal ["ItemGPS" , 4];
			_crate addItemCargoGlobal ["ItemCompass" , 4];
			_crate addItemCargoGlobal ["FirstAidKit" , 4];
		};
		
		case 1: {
	//	player sideChat format ["crimenet creating supply  at %1 with AR Load", _chutePOS];
	
		
			_crate addWeaponCargoGlobal ["arifle_Katiba_C_F" , 3];
			_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_green" , 15];
			_crate addItemCargoGlobal ["DemoCharge_Remote_Mag", 2];
			_crate addItemCargoGlobal ["Binocular" , 1];
			_crate addItemCargoGlobal ["NVGoggles" , 2];
			_crate addItemCargoGlobal ["ItemGPS" , 4];
			_crate addItemCargoGlobal ["ItemCompass" , 4];
			_crate addItemCargoGlobal ["FirstAidKit" , 4];

			
		};
		
		case 2: {
	//	player sideChat format ["crimenet creating supply  at %1 with PDW load", _chutePOS];
		
		
			_crate addWeaponCargoGlobal ["hgun_PDW2000_F" , 6];
			_crate addMagazineCargoGlobal ["30Rnd_9x21_Mag" , 30];
			_crate addItemCargoGlobal ["muzzle_snds_L", 3];
			_crate addItemCargoGlobal ["muzzle_snds_M", 3];
			_crate addItemCargoGlobal ["MineDetector", 1];
			_crate addItemCargoGlobal ["Binocular" , 1];
			_crate addItemCargoGlobal ["NVGoggles" , 2];
			_crate addItemCargoGlobal ["ItemGPS" , 4];
			_crate addItemCargoGlobal ["ItemCompass" , 4];
			_crate addItemCargoGlobal ["FirstAidKit" , 4];
		};
		
		case 3: {
	//	player sideChat format ["crimenet creating supply  at %1 with MG load", _chutePOS];
		
		
			_crate addWeaponCargoGlobal ["LMG_Mk200_F" , 3];
			_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer" , 9];
			_crate addMagazineCargoGlobal ["HandGrenade" , 4];
			_crate addItemCargoGlobal ["Toolkit", 1];
			_crate addItemCargoGlobal ["Binocular" , 1];
			_crate addItemCargoGlobal ["NVGoggles" , 2];
			_crate addItemCargoGlobal ["ItemGPS" , 4];
			_crate addItemCargoGlobal ["ItemCompass" , 4];
			_crate addItemCargoGlobal ["FirstAidKit" , 4];
		};
		
		};