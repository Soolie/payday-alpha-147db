
_this addAction ["Become Engineer","chooseeng.sqf",false,0,false,false,"", ' ((playerSide == west) AND (playerClass == 0))'];
_this addAction ["Become Weapons Expert","choosewe.sqf",false,0,false,false,"", ' ((playerSide == west) AND (playerClass == 0)) '];
_this addAction ["Become Combat Life Saver","choosecls.sqf",false,0,false,false,"", ' ((playerSide == west) AND (playerClass == 0)) '];
_this addAction ["Become Scout Recon","choosescout.sqf",false,0,false,false,"", ' ((playerSide == west) AND (playerClass == 0)) '];


_this addAction ["Become Mastermind","choosemastermind.sqf",false,0,false,false,"", ' ((playerSide == east) AND (playerClass == 0)) '];
_this addAction ["Become Ghost","chooseghost.sqf",false,0,false,false,"", ' ((playerSide == east) AND (playerClass == 0)) '];
_this addAction ["Become Technician","choosetech.sqf",false,0,false,false,"", ' ((playerSide == east) AND (playerClass == 0)) '];
_this addAction ["Become Enforcer","chooseenf.sqf",false,0,false,false,"", ' ((playerSide == east) AND (playerClass == 0))  '];	

_this addAction ["<t color='#f58e27'>Repick - 1,000</t>", "repick.sqf",false,0,false,false,"", ' playerClass != 0  '];		



