while { true } do {

	sleep 900;
	player sideChat "cleaning empty groups...";
	{
		deleteGroup _x;  //only possible to delete empty groups due to engine limitation / design
		
	} forEach allGroups;
	
	
	};