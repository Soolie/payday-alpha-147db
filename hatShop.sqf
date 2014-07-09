
_location = getPos _this;



if(isServer) then{

	_newBox = createVehicle ["Box_IND_Ammo_F", _location,[],0,"CAN_COLLIDE"];
	


	_newBox allowDamage false;

	clearWeaponCargoGlobal _newBox;
	clearItemCargoGlobal _newBox;
	clearMagazineCargoGlobal _newBox;

	
	};
	
	_this addAction ["Buy Beret - 50", "buyHat1.sqf"];
	
	_this addAction ["Buy Shemag - 50", "buyHat2.sqf"];
	
	_this addAction ["Buy Cap - 50", "buyHat3.sqf"];
	
	_this addAction ["Buy Bandanna - 50", "buyHat4.sqf"];
	
	_this addAction ["Buy Boonie - 50", "buyHat5.sqf"];
	
	_this addAction ["Buy Beanie - 50", "buyHat6.sqf"];
	
//	_this addAction ["Buy Beanie - 50", "buyGoggles1.sqf"];
		
//	_this addAction ["Buy Beanie - 50", "buyGoggles2.sqf"];

//	_this addAction ["Buy Beanie - 50", "buyGoggles3.sqf"];

//	_this addAction ["Buy Beanie - 50", "buyGoggles4.sqf"];

//	_this addAction ["Buy Beanie - 50", "buyGoggles5.sqf"];	