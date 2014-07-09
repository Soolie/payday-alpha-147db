//	 both:
		_this addAction ["Buy QuadBike - 400", "buyquad.sqf"];
	//	_this addAction ["Buy GoKart - 400", "buykart.sqf"];
		_this addAction ["Buy Hatchback - 2,400", "buyhb.sqf"];
		_this addAction ["Buy Van - 3,000", "buyvan.sqf"];
		_this addAction ["Buy Sport Hatchback - 6,000", "buysport.sqf"];
		_this addAction ["Buy Offroad - 6,000", "buyoffroad.sqf"];
		_this addAction ["Buy SUV - 8,000", "buysuv.sqf"];
	//	_this addAction ["Buy Hummingbird - 90,000", "buyhummingbird.sqf"];
	//	_this addAction ["Buy Orca - 200,000", "buyorca.sqf"];

		//east
		
		_this addAction ["Buy Hunter - 80,000", "buyhunterCiv.sqf",false,0,false,false,"",' playerSide == east '];
		
		
		//west
		_this addAction ["Buy Hunter - 20,000", "buyhunter.sqf",false,0,false,false,"",' playerSide == west '];
		
		_this addAction ["Buy HMG Hunter - 40,000", "buyhmghunter.sqf",false,0,false,false,"",' playerSide == west '];
		
	//	_this addAction ["Buy Ghosthawk - 800,000", "buyghosthawk.sqf",false,0,false,false,"",' playerSide == west '];


		
			//server host :)
			
		_this addAction ["Buy Server AH 9 - le free", "buyServerAH9.sqf",false,0,false,false,"",' (isServer) '];
		

