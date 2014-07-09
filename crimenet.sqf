
jobnum = 0;


	//player sideChat "Crimenet Starting";


	_whjobs = ["wh1", "wh2", "wh3", "wh4", "wh5", "wh6"];
	
	_bankjobs = ["bank1", "bank2"];
	
	_gasjobs = ["gas1", "gas2", "gas3", "gas4", "gas5", "gas6", "gas7", "gas8", "gas9", "gas10", "gas11", "gas12", "gas13", "gas14", "gas15", "gas16", "gas17", "gas18", "gas19","gas20","gas21"];
	
	//_GTAjobs = ["hostage1", "hostage2", "hostage3", "hostage4", "hostage5"];  //disabled for now !  to be replaced with GTA missions
	
	_supplyJobs = ["supply1", "supply2"];
	
	_shopsjobs = [["shops1_1", "shops1_2", "shops1_3", "shops1_4"],["shops2_1", "shops2_2", "shops2_3", "shops2_4"],["shops3_1", "shops3_2", "shops3_3", "shops3_4"]];
	
	_shopsjobsMA = ["shops1_1", "shops2_1", "shops3_1"]; //just for master array counting purposes only want the first shop map marker
	
	_master_array = _whjobs + _gasjobs + _shopsjobsMA + _bankjobs + _supplyJobs;
	
	_gascount = count _gasjobs;
	_whcount = count _whjobs;
	_bankcount = count _bankjobs;
	_shopcount = count _shopsjobs;
	_supplycount = count _supplyjobs;
	
	_pickjob = 0;  //init some variables for counters and temp usage
	
	
	sleep 5;

while { true } do {

		
	
		_availablejobcount = 0;  //set this to 0 for the counting.
	
	{
		if (count nearestObjects [getMarkerPos _x, ["Box_IND_Support_F"], 60] != 0) then { _availablejobcount = _availablejobcount + 1; };
		
		if (count nearestObjects [getMarkerPos _x, ["Land_HeatPack_F"], 60] != 0) then { _availablejobcount = _availablejobcount + 1; };
		
		if (count nearestObjects [getMarkerPos _x, ["Land_SurvivalRadio_F"], 60] != 0) then {	_availablejobcount = _availablejobcount + 1; };
									
	}forEach _master_array;
			
	//		player sideChat format ["_availablejobcount is %1", _availablejobcount];
		
	if ( _availablejobcount < 7 ) then //create some job
	
	{
		
	_pickjob = round(random 4);
	
	_randomgasjob = floor(random _gascount);
	
	_randomgasjob = _gasjobs select _randomgasjob;
	
	_randomgasjob2 = floor(random _gascount);
	
	_randomgasjob2 = _gasjobs select _randomgasjob2;
	
	_randomwhjob = floor(random _whcount);
	
	_randomwhjob = _whjobs select _randomwhjob;
	
	//_randomhousejob = floor(random _housecount);
	
	//_randomhousejob = _housejobs select _randomhousejob;
	
	_randombankjob = floor(random _bankcount);
	
	_randombankjob = _bankjobs select _randombankjob;
		
//	_randomhostagejob = round(random _hostagecount);
	
	//_randomhostagejob = _hostagejobs select _randomhostagejob;
	
	_randomStoresJob =  floor(random _shopcount);

	_randomStoresJob = _shopsjobs select _randomStoresJob;	
	
	_randomSupplyJob =  floor(random _supplycount);

	_randomSupplyJob = _SupplyJobs select _randomSupplyJob;	
	

	switch (_pickjob) do 	//params  [location(map marker string), min safe, max safe, min dif, max dif, min AI, max AI, min safe value, max safe value, job type]
	
	{
		case 0: {
		//	player sideChat format["creating gas station robbery at %1", _randomgasjob];
			[_randomgasjob, 1, 2, 1, 2, 2, 4, 1000, 3000, "Gas Station Robbery"] execVM "createGasJob.sqf";
			sleep 25;
				};
		
		case 1: {
		//	player sideChat format["creating shop at %1", _randomStoresJob];
			[_randomStoresJob, "Property Destruction"] execVM "createStoresJob.sqf";	
			sleep 25;
				};
		
		case 2: {
		//	player sideChat format["creating warehouse at %1", _randomwhjob];
			[_randomwhjob, 2, 2, 2, 3, 5, 10, 4000, 6000, "Warehouse Job"] execVM "createWarehouseJob.sqf";
			sleep 25;
				};
		
		case 3: {
		//	player sideChat format["creating bank at %1", _randombankjob];
			[_randombankjob, 2, 4, 4, 4, 8, 14, 10000, 42000, "Bank Heist"] execVM "createBankJob.sqf";
			sleep 25;
				};
				
		case 4: 		
				{
		//		player sideChat format["creating supply job at %1", _randomSupplyJob];
			[_randomSupplyJob, 6, 12, "Supply Raid"] execVM "createSupplyJob.sqf";	
			sleep 25;	
				};
				
	};//ends switch
	
	}else { //else  jobs  already exist...

	sleep 500;
	};
	
};//end "true" loop
